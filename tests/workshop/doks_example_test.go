package test

import (
	"fmt"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestDoksExample(t *testing.T) {
	opts := &terraform.Options{
		TerraformDir:"../../examples/doks-with-vpc",
	}

	defer terraform.Destroy(t, opts)
	terraform.InitAndApply(t, opts)

	doksClusterId := terraform.OutputRequired(t, opts, "id")
	message := fmt.Sprintf("Connect to the cluster by running: doctl kubernetes cluster kubeconfig save %s", doksClusterId)
	fmt.Printf("%s", message)
}