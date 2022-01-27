# Rego test for Redis Cache Require SSL Port
# This rule denies Redis Cache resources from being created that do not disables traffic over non-tls/ssl port
package rules.redis_cache_require_ssl_port

import data.fugue.resource_view.resource_view_input

mock_input = ret {
	ret = resource_view_input with input as mock_plan_input
}

test_require_ssl_port {
	pol := policy with input as mock_input
	resources := {p.id: p.valid | pol[p]}

	resources["azurerm_redis_cache.valid"] == true
	resources["azurerm_redis_cache.invalid"] == false
}

# Mock input is generated plan for redis_cache_tls_requirement.tf
mock_plan_input = {
	"format_version": "0.2",
	"terraform_version": "1.0.11",
	"planned_values": {"root_module": {"resources": [
		{
			"address": "azurerm_redis_cache.invalid",
			"mode": "managed",
			"type": "azurerm_redis_cache",
			"name": "invalid",
			"provider_name": "registry.terraform.io/hashicorp/azurerm",
			"schema_version": 0,
			"values": {
				"capacity": 2,
				"enable_non_ssl_port": true,
				"family": "C",
				"location": "eastus",
				"minimum_tls_version": "1.0",
				"name": "example-cache-invalid",
				"patch_schedule": [],
				"public_network_access_enabled": true,
				"resource_group_name": "terraform-example-resources",
				"shard_count": null,
				"sku_name": "Standard",
				"subnet_id": null,
				"tags": null,
				"tenant_settings": null,
				"timeouts": null,
				"zones": null,
			},
			"sensitive_values": {
				"patch_schedule": [],
				"redis_configuration": [],
			},
		},
		{
			"address": "azurerm_redis_cache.valid",
			"mode": "managed",
			"type": "azurerm_redis_cache",
			"name": "valid",
			"provider_name": "registry.terraform.io/hashicorp/azurerm",
			"schema_version": 0,
			"values": {
				"capacity": 2,
				"enable_non_ssl_port": false,
				"family": "C",
				"location": "eastus",
				"minimum_tls_version": "1.0",
				"name": "example-cache-valid",
				"patch_schedule": [],
				"public_network_access_enabled": true,
				"resource_group_name": "terraform-example-resources",
				"shard_count": null,
				"sku_name": "Standard",
				"subnet_id": null,
				"tags": null,
				"tenant_settings": null,
				"timeouts": null,
				"zones": null,
			},
			"sensitive_values": {
				"patch_schedule": [],
				"redis_configuration": [],
			},
		},
		{
			"address": "azurerm_resource_group.example",
			"mode": "managed",
			"type": "azurerm_resource_group",
			"name": "example",
			"provider_name": "registry.terraform.io/hashicorp/azurerm",
			"schema_version": 0,
			"values": {
				"location": "eastus",
				"name": "terraform-example-resources",
				"tags": null,
				"timeouts": null,
			},
			"sensitive_values": {},
		},
	]}},
	"resource_changes": [
		{
			"address": "azurerm_redis_cache.invalid",
			"mode": "managed",
			"type": "azurerm_redis_cache",
			"name": "invalid",
			"provider_name": "registry.terraform.io/hashicorp/azurerm",
			"change": {
				"actions": ["create"],
				"before": null,
				"after": {
					"capacity": 2,
					"enable_non_ssl_port": true,
					"family": "C",
					"location": "eastus",
					"minimum_tls_version": "1.0",
					"name": "example-cache-invalid",
					"patch_schedule": [],
					"public_network_access_enabled": true,
					"resource_group_name": "terraform-example-resources",
					"shard_count": null,
					"sku_name": "Standard",
					"subnet_id": null,
					"tags": null,
					"tenant_settings": null,
					"timeouts": null,
					"zones": null,
				},
				"after_unknown": {
					"hostname": true,
					"id": true,
					"patch_schedule": [],
					"port": true,
					"primary_access_key": true,
					"primary_connection_string": true,
					"private_static_ip_address": true,
					"redis_configuration": true,
					"redis_version": true,
					"replicas_per_master": true,
					"replicas_per_primary": true,
					"secondary_access_key": true,
					"secondary_connection_string": true,
					"ssl_port": true,
				},
				"before_sensitive": false,
				"after_sensitive": {
					"patch_schedule": [],
					"primary_access_key": true,
					"primary_connection_string": true,
					"redis_configuration": [],
					"secondary_access_key": true,
					"secondary_connection_string": true,
				},
			},
		},
		{
			"address": "azurerm_redis_cache.valid",
			"mode": "managed",
			"type": "azurerm_redis_cache",
			"name": "valid",
			"provider_name": "registry.terraform.io/hashicorp/azurerm",
			"change": {
				"actions": ["create"],
				"before": null,
				"after": {
					"capacity": 2,
					"enable_non_ssl_port": false,
					"family": "C",
					"location": "eastus",
					"minimum_tls_version": "1.0",
					"name": "example-cache-valid",
					"patch_schedule": [],
					"public_network_access_enabled": true,
					"resource_group_name": "terraform-example-resources",
					"shard_count": null,
					"sku_name": "Standard",
					"subnet_id": null,
					"tags": null,
					"tenant_settings": null,
					"timeouts": null,
					"zones": null,
				},
				"after_unknown": {
					"hostname": true,
					"id": true,
					"patch_schedule": [],
					"port": true,
					"primary_access_key": true,
					"primary_connection_string": true,
					"private_static_ip_address": true,
					"redis_configuration": true,
					"redis_version": true,
					"replicas_per_master": true,
					"replicas_per_primary": true,
					"secondary_access_key": true,
					"secondary_connection_string": true,
					"ssl_port": true,
				},
				"before_sensitive": false,
				"after_sensitive": {
					"patch_schedule": [],
					"primary_access_key": true,
					"primary_connection_string": true,
					"redis_configuration": [],
					"secondary_access_key": true,
					"secondary_connection_string": true,
				},
			},
		},
		{
			"address": "azurerm_resource_group.example",
			"mode": "managed",
			"type": "azurerm_resource_group",
			"name": "example",
			"provider_name": "registry.terraform.io/hashicorp/azurerm",
			"change": {
				"actions": ["create"],
				"before": null,
				"after": {
					"location": "eastus",
					"name": "terraform-example-resources",
					"tags": null,
					"timeouts": null,
				},
				"after_unknown": {"id": true},
				"before_sensitive": false,
				"after_sensitive": {},
			},
		},
	],
	"configuration": {
		"provider_config": {"azurerm": {
			"name": "azurerm",
			"version_constraint": "~> 2.0",
			"expressions": {"features": [{}]},
		}},
		"root_module": {"resources": [
			{
				"address": "azurerm_redis_cache.invalid",
				"mode": "managed",
				"type": "azurerm_redis_cache",
				"name": "invalid",
				"provider_config_key": "azurerm",
				"expressions": {
					"capacity": {"constant_value": 2},
					"enable_non_ssl_port": {"constant_value": true},
					"family": {"constant_value": "C"},
					"location": {"references": [
						"azurerm_resource_group.example.location",
						"azurerm_resource_group.example",
					]},
					"name": {"constant_value": "example-cache-invalid"},
					"resource_group_name": {"references": [
						"azurerm_resource_group.example.name",
						"azurerm_resource_group.example",
					]},
					"sku_name": {"constant_value": "Standard"},
				},
				"schema_version": 0,
			},
			{
				"address": "azurerm_redis_cache.valid",
				"mode": "managed",
				"type": "azurerm_redis_cache",
				"name": "valid",
				"provider_config_key": "azurerm",
				"expressions": {
					"capacity": {"constant_value": 2},
					"enable_non_ssl_port": {"constant_value": false},
					"family": {"constant_value": "C"},
					"location": {"references": [
						"azurerm_resource_group.example.location",
						"azurerm_resource_group.example",
					]},
					"name": {"constant_value": "example-cache-valid"},
					"resource_group_name": {"references": [
						"azurerm_resource_group.example.name",
						"azurerm_resource_group.example",
					]},
					"sku_name": {"constant_value": "Standard"},
				},
				"schema_version": 0,
			},
			{
				"address": "azurerm_resource_group.example",
				"mode": "managed",
				"type": "azurerm_resource_group",
				"name": "example",
				"provider_config_key": "azurerm",
				"expressions": {
					"location": {"constant_value": "eastus"},
					"name": {"constant_value": "terraform-example-resources"},
				},
				"schema_version": 0,
			},
		]},
	},
}
