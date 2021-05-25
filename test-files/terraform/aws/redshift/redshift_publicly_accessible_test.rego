# Rego test file for redshift publicly accessible 
# Validating rule ensures that redshift clusters are not made public
package rules.redshift_publicly_accessible

import data.fugue.resource_view.resource_view_input

mock_input = ret {
	ret = resource_view_input with input as mock_plan_input
}

test_redshift_publicly_accessible {
	pol := policy with input as mock_input
	resources := {p.id: p.valid | pol[p]}

	resources["aws_redshift_cluster.valid"] == true
	resources["aws_redshift_cluster.invalid"] == false
}

# Mock input is generated from redshift_publicly_accessible.tf 
# Valid when redshift clusters are not made public
mock_plan_input = {
	"format_version": "0.1",
	"terraform_version": "0.14.9",
	"planned_values": {"root_module": {"resources": [
		{
			"address": "aws_redshift_cluster.invalid",
			"mode": "managed",
			"type": "aws_redshift_cluster",
			"name": "invalid",
			"provider_name": "registry.terraform.io/hashicorp/aws",
			"schema_version": 0,
			"values": {
				"allow_version_upgrade": true,
				"automated_snapshot_retention_period": 1,
				"cluster_identifier": "tf-redshift-cluster",
				"cluster_type": "single-node",
				"cluster_version": "1.0",
				"database_name": "mydb",
				"elastic_ip": null,
				"encrypted": false,
				"final_snapshot_identifier": null,
				"logging": [],
				"master_password": "Mustbe8characters",
				"master_username": "foo",
				"node_type": "dc1.large",
				"number_of_nodes": 1,
				"owner_account": null,
				"port": 5439,
				"publicly_accessible": true,
				"skip_final_snapshot": false,
				"snapshot_cluster_identifier": null,
				"snapshot_copy": [],
				"snapshot_identifier": null,
				"tags": null,
				"timeouts": null,
			},
		},
		{
			"address": "aws_redshift_cluster.valid",
			"mode": "managed",
			"type": "aws_redshift_cluster",
			"name": "valid",
			"provider_name": "registry.terraform.io/hashicorp/aws",
			"schema_version": 0,
			"values": {
				"allow_version_upgrade": true,
				"automated_snapshot_retention_period": 1,
				"cluster_identifier": "tf-redshift-cluster-valid",
				"cluster_type": "single-node",
				"cluster_version": "1.0",
				"database_name": "mynewdb",
				"elastic_ip": null,
				"encrypted": false,
				"final_snapshot_identifier": null,
				"logging": [],
				"master_password": "Mustbe8characters",
				"master_username": "foo",
				"node_type": "dc1.large",
				"number_of_nodes": 1,
				"owner_account": null,
				"port": 5439,
				"publicly_accessible": false,
				"skip_final_snapshot": false,
				"snapshot_cluster_identifier": null,
				"snapshot_copy": [],
				"snapshot_identifier": null,
				"tags": null,
				"timeouts": null,
			},
		},
	]}},
	"resource_changes": [
		{
			"address": "aws_redshift_cluster.invalid",
			"mode": "managed",
			"type": "aws_redshift_cluster",
			"name": "invalid",
			"provider_name": "registry.terraform.io/hashicorp/aws",
			"change": {
				"actions": ["create"],
				"before": null,
				"after": {
					"allow_version_upgrade": true,
					"automated_snapshot_retention_period": 1,
					"cluster_identifier": "tf-redshift-cluster",
					"cluster_type": "single-node",
					"cluster_version": "1.0",
					"database_name": "mydb",
					"elastic_ip": null,
					"encrypted": false,
					"final_snapshot_identifier": null,
					"logging": [],
					"master_password": "Mustbe8characters",
					"master_username": "foo",
					"node_type": "dc1.large",
					"number_of_nodes": 1,
					"owner_account": null,
					"port": 5439,
					"publicly_accessible": true,
					"skip_final_snapshot": false,
					"snapshot_cluster_identifier": null,
					"snapshot_copy": [],
					"snapshot_identifier": null,
					"tags": null,
					"timeouts": null,
				},
				"after_unknown": {
					"arn": true,
					"availability_zone": true,
					"cluster_parameter_group_name": true,
					"cluster_public_key": true,
					"cluster_revision_number": true,
					"cluster_security_groups": true,
					"cluster_subnet_group_name": true,
					"dns_name": true,
					"endpoint": true,
					"enhanced_vpc_routing": true,
					"iam_roles": true,
					"id": true,
					"kms_key_id": true,
					"logging": [],
					"preferred_maintenance_window": true,
					"snapshot_copy": [],
					"tags_all": true,
					"vpc_security_group_ids": true,
				},
			},
		},
		{
			"address": "aws_redshift_cluster.valid",
			"mode": "managed",
			"type": "aws_redshift_cluster",
			"name": "valid",
			"provider_name": "registry.terraform.io/hashicorp/aws",
			"change": {
				"actions": ["create"],
				"before": null,
				"after": {
					"allow_version_upgrade": true,
					"automated_snapshot_retention_period": 1,
					"cluster_identifier": "tf-redshift-cluster-valid",
					"cluster_type": "single-node",
					"cluster_version": "1.0",
					"database_name": "mynewdb",
					"elastic_ip": null,
					"encrypted": false,
					"final_snapshot_identifier": null,
					"logging": [],
					"master_password": "Mustbe8characters",
					"master_username": "foo",
					"node_type": "dc1.large",
					"number_of_nodes": 1,
					"owner_account": null,
					"port": 5439,
					"publicly_accessible": false,
					"skip_final_snapshot": false,
					"snapshot_cluster_identifier": null,
					"snapshot_copy": [],
					"snapshot_identifier": null,
					"tags": null,
					"timeouts": null,
				},
				"after_unknown": {
					"arn": true,
					"availability_zone": true,
					"cluster_parameter_group_name": true,
					"cluster_public_key": true,
					"cluster_revision_number": true,
					"cluster_security_groups": true,
					"cluster_subnet_group_name": true,
					"dns_name": true,
					"endpoint": true,
					"enhanced_vpc_routing": true,
					"iam_roles": true,
					"id": true,
					"kms_key_id": true,
					"logging": [],
					"preferred_maintenance_window": true,
					"snapshot_copy": [],
					"tags_all": true,
					"vpc_security_group_ids": true,
				},
			},
		},
	],
	"configuration": {
		"provider_config": {"aws": {
			"name": "aws",
			"expressions": {
				"profile": {"constant_value": "saml"},
				"region": {"constant_value": "us-east-1"},
				"shared_credentials_file": {"constant_value": "~/.aws/creds"},
			},
		}},
		"root_module": {"resources": [
			{
				"address": "aws_redshift_cluster.invalid",
				"mode": "managed",
				"type": "aws_redshift_cluster",
				"name": "invalid",
				"provider_config_key": "aws",
				"expressions": {
					"cluster_identifier": {"constant_value": "tf-redshift-cluster"},
					"cluster_type": {"constant_value": "single-node"},
					"database_name": {"constant_value": "mydb"},
					"master_password": {"constant_value": "Mustbe8characters"},
					"master_username": {"constant_value": "foo"},
					"node_type": {"constant_value": "dc1.large"},
				},
				"schema_version": 0,
			},
			{
				"address": "aws_redshift_cluster.valid",
				"mode": "managed",
				"type": "aws_redshift_cluster",
				"name": "valid",
				"provider_config_key": "aws",
				"expressions": {
					"cluster_identifier": {"constant_value": "tf-redshift-cluster-valid"},
					"cluster_type": {"constant_value": "single-node"},
					"database_name": {"constant_value": "mynewdb"},
					"master_password": {"constant_value": "Mustbe8characters"},
					"master_username": {"constant_value": "foo"},
					"node_type": {"constant_value": "dc1.large"},
					"publicly_accessible": {"constant_value": false},
				},
				"schema_version": 0,
			},
		]},
	},
}
