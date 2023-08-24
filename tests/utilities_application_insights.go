package test

import (
	"fmt"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func testApplicationInsights(t *testing.T, variant string) {
	t.Parallel()

	terraformDir := fmt.Sprintf("../examples/%s", variant)

	terraformOptions := &terraform.Options{
		TerraformDir: terraformDir,
		LockTimeout:  "5m",
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	id := terraform.Output(t, terraformOptions, "id")
	expectedID := fmt.Sprintf("example-tf-application-insights-%s", variant)

	assert.Equal(t, expectedID, id)

	arn := terraform.Output(t, terraformOptions, "arn")

	accountID := getAWSAccountID(t)
	region := getAWSRegion(t)
	expectedARN := fmt.Sprintf("arn:aws:applicationinsights:%s:%s:application/resource-group/example-tf-application-insights-%s", region, accountID, variant)

	assert.Equal(t, expectedARN, arn)
}
