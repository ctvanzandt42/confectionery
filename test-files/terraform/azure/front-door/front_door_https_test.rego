# Rego test for Front Door HTTPS
# Validating rule front_door_https: Azure Front Door should accept only HTTPS traffic or redirect HTTP to HTTPS.
package rules.front_door_https

import data.fugue.resource_view.resource_view_input

mock_input = ret {
	ret = resource_view_input with input as mock_plan_input
}

test_https_front_door {
	pol := policy with input as mock_input
	resources := {p.id: p.valid | pol[p]}

	resources["azurerm_frontdoor.invalid_http"] == false
	resources["azurerm_frontdoor.valid_https_only"] == true
	resources["azurerm_frontdoor.valid_redirect_to_https"] == true
}

# Mock input is generated plan for front_door_https.tf
mock_plan_input = {
	"format_version": "0.1",
	"terraform_version": "1.0.0",
	"planned_values": {"root_module": {"resources": [
		{
			"address": "azurerm_frontdoor.invalid_http",
			"mode": "managed",
			"type": "azurerm_frontdoor",
			"name": "invalid_http",
			"provider_name": "registry.terraform.io/hashicorp/azurerm",
			"schema_version": 2,
			"values": {
				"backend_pool": [{
					"backend": [{
						"address": "www.bing.com",
						"enabled": true,
						"host_header": "www.bing.com",
						"http_port": 80,
						"https_port": 443,
						"priority": 1,
						"weight": 50,
					}],
					"health_probe_name": "exampleHealthProbeSetting1",
					"load_balancing_name": "exampleLoadBalancingSettings1",
					"name": "exampleBackendBing",
				}],
				"backend_pool_health_probe": [{
					"enabled": true,
					"interval_in_seconds": 120,
					"name": "exampleHealthProbeSetting1",
					"path": "/",
					"probe_method": "GET",
					"protocol": "Http",
				}],
				"backend_pool_load_balancing": [{
					"additional_latency_milliseconds": 0,
					"name": "exampleLoadBalancingSettings1",
					"sample_size": 4,
					"successful_samples_required": 2,
				}],
				"backend_pools_send_receive_timeout_seconds": 60,
				"enforce_backend_pools_certificate_name_check": false,
				"friendly_name": null,
				"frontend_endpoint": [{
					"host_name": "example-FrontDoor.azurefd.net",
					"name": "exampleFrontendEndpoint1",
					"session_affinity_enabled": false,
					"session_affinity_ttl_seconds": 0,
					"web_application_firewall_policy_link_id": null,
				}],
				"load_balancer_enabled": true,
				"name": "example-FrontDoor",
				"resource_group_name": "FrontDoorExampleResourceGroup",
				"routing_rule": [{
					"accepted_protocols": ["Http"],
					"enabled": true,
					"forwarding_configuration": [{
						"backend_pool_name": "exampleBackendBing",
						"cache_duration": null,
						"cache_enabled": false,
						"cache_query_parameter_strip_directive": "StripAll",
						"cache_query_parameters": null,
						"cache_use_dynamic_compression": false,
						"custom_forwarding_path": null,
						"forwarding_protocol": "MatchRequest",
					}],
					"frontend_endpoints": ["exampleFrontendEndpoint1"],
					"name": "exampleRoutingRule1",
					"patterns_to_match": ["/*"],
					"redirect_configuration": [],
				}],
				"tags": null,
				"timeouts": null,
			},
		},
		{
			"address": "azurerm_frontdoor.valid_https_only",
			"mode": "managed",
			"type": "azurerm_frontdoor",
			"name": "valid_https_only",
			"provider_name": "registry.terraform.io/hashicorp/azurerm",
			"schema_version": 2,
			"values": {
				"backend_pool": [{
					"backend": [{
						"address": "www.bing.com",
						"enabled": true,
						"host_header": "www.bing.com",
						"http_port": 80,
						"https_port": 443,
						"priority": 1,
						"weight": 50,
					}],
					"health_probe_name": "exampleHealthProbeSetting1",
					"load_balancing_name": "exampleLoadBalancingSettings1",
					"name": "exampleBackendBing",
				}],
				"backend_pool_health_probe": [{
					"enabled": true,
					"interval_in_seconds": 120,
					"name": "exampleHealthProbeSetting1",
					"path": "/",
					"probe_method": "GET",
					"protocol": "Http",
				}],
				"backend_pool_load_balancing": [{
					"additional_latency_milliseconds": 0,
					"name": "exampleLoadBalancingSettings1",
					"sample_size": 4,
					"successful_samples_required": 2,
				}],
				"backend_pools_send_receive_timeout_seconds": 60,
				"enforce_backend_pools_certificate_name_check": false,
				"friendly_name": null,
				"frontend_endpoint": [{
					"host_name": "example-FrontDoor.azurefd.net",
					"name": "exampleFrontendEndpoint1",
					"session_affinity_enabled": false,
					"session_affinity_ttl_seconds": 0,
					"web_application_firewall_policy_link_id": null,
				}],
				"load_balancer_enabled": true,
				"name": "example-FrontDoor",
				"resource_group_name": "FrontDoorExampleResourceGroup",
				"routing_rule": [{
					"accepted_protocols": ["Https"],
					"enabled": true,
					"forwarding_configuration": [{
						"backend_pool_name": "exampleBackendBing",
						"cache_duration": null,
						"cache_enabled": false,
						"cache_query_parameter_strip_directive": "StripAll",
						"cache_query_parameters": null,
						"cache_use_dynamic_compression": false,
						"custom_forwarding_path": null,
						"forwarding_protocol": "HttpsOnly",
					}],
					"frontend_endpoints": ["exampleFrontendEndpoint1"],
					"name": "exampleRoutingRule1",
					"patterns_to_match": ["/*"],
					"redirect_configuration": [],
				}],
				"tags": null,
				"timeouts": null,
			},
		},
		{
			"address": "azurerm_frontdoor.valid_redirect_to_https",
			"mode": "managed",
			"type": "azurerm_frontdoor",
			"name": "valid_redirect_to_https",
			"provider_name": "registry.terraform.io/hashicorp/azurerm",
			"schema_version": 2,
			"values": {
				"backend_pool": [{
					"backend": [{
						"address": "www.bing.com",
						"enabled": true,
						"host_header": "www.bing.com",
						"http_port": 80,
						"https_port": 443,
						"priority": 1,
						"weight": 50,
					}],
					"health_probe_name": "exampleHealthProbeSetting1",
					"load_balancing_name": "exampleLoadBalancingSettings1",
					"name": "exampleBackendBing",
				}],
				"backend_pool_health_probe": [{
					"enabled": true,
					"interval_in_seconds": 120,
					"name": "exampleHealthProbeSetting1",
					"path": "/",
					"probe_method": "GET",
					"protocol": "Http",
				}],
				"backend_pool_load_balancing": [{
					"additional_latency_milliseconds": 0,
					"name": "exampleLoadBalancingSettings1",
					"sample_size": 4,
					"successful_samples_required": 2,
				}],
				"backend_pools_send_receive_timeout_seconds": 60,
				"enforce_backend_pools_certificate_name_check": false,
				"friendly_name": null,
				"frontend_endpoint": [{
					"host_name": "example-FrontDoor.azurefd.net",
					"name": "exampleFrontendEndpoint1",
					"session_affinity_enabled": false,
					"session_affinity_ttl_seconds": 0,
					"web_application_firewall_policy_link_id": null,
				}],
				"load_balancer_enabled": true,
				"name": "example-FrontDoor",
				"resource_group_name": "FrontDoorExampleResourceGroup",
				"routing_rule": [
					{
						"accepted_protocols": ["Https"],
						"enabled": true,
						"forwarding_configuration": [{
							"backend_pool_name": "exampleBackendBing",
							"cache_duration": null,
							"cache_enabled": false,
							"cache_query_parameter_strip_directive": "StripAll",
							"cache_query_parameters": null,
							"cache_use_dynamic_compression": false,
							"custom_forwarding_path": null,
							"forwarding_protocol": "HttpsOnly",
						}],
						"frontend_endpoints": ["exampleFrontendEndpoint1"],
						"name": "exampleRoutingRule1",
						"patterns_to_match": ["/*"],
						"redirect_configuration": [],
					},
					{
						"accepted_protocols": ["Http"],
						"enabled": true,
						"forwarding_configuration": [],
						"frontend_endpoints": ["exampleFrontendEndpoint1"],
						"name": "exampleRoutingRule2",
						"patterns_to_match": ["/*"],
						"redirect_configuration": [{
							"custom_fragment": null,
							"custom_host": null,
							"custom_path": null,
							"custom_query_string": null,
							"redirect_protocol": "HttpsOnly",
							"redirect_type": "PermanentRedirect",
						}],
					},
				],
				"tags": null,
				"timeouts": null,
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
				"location": "westeurope",
				"name": "FrontDoorExampleResourceGroup",
				"tags": null,
				"timeouts": null,
			},
		},
	]}},
	"resource_changes": [
		{
			"address": "azurerm_frontdoor.invalid_http",
			"mode": "managed",
			"type": "azurerm_frontdoor",
			"name": "invalid_http",
			"provider_name": "registry.terraform.io/hashicorp/azurerm",
			"change": {
				"actions": ["create"],
				"before": null,
				"after": {
					"backend_pool": [{
						"backend": [{
							"address": "www.bing.com",
							"enabled": true,
							"host_header": "www.bing.com",
							"http_port": 80,
							"https_port": 443,
							"priority": 1,
							"weight": 50,
						}],
						"health_probe_name": "exampleHealthProbeSetting1",
						"load_balancing_name": "exampleLoadBalancingSettings1",
						"name": "exampleBackendBing",
					}],
					"backend_pool_health_probe": [{
						"enabled": true,
						"interval_in_seconds": 120,
						"name": "exampleHealthProbeSetting1",
						"path": "/",
						"probe_method": "GET",
						"protocol": "Http",
					}],
					"backend_pool_load_balancing": [{
						"additional_latency_milliseconds": 0,
						"name": "exampleLoadBalancingSettings1",
						"sample_size": 4,
						"successful_samples_required": 2,
					}],
					"backend_pools_send_receive_timeout_seconds": 60,
					"enforce_backend_pools_certificate_name_check": false,
					"friendly_name": null,
					"frontend_endpoint": [{
						"host_name": "example-FrontDoor.azurefd.net",
						"name": "exampleFrontendEndpoint1",
						"session_affinity_enabled": false,
						"session_affinity_ttl_seconds": 0,
						"web_application_firewall_policy_link_id": null,
					}],
					"load_balancer_enabled": true,
					"name": "example-FrontDoor",
					"resource_group_name": "FrontDoorExampleResourceGroup",
					"routing_rule": [{
						"accepted_protocols": ["Http"],
						"enabled": true,
						"forwarding_configuration": [{
							"backend_pool_name": "exampleBackendBing",
							"cache_duration": null,
							"cache_enabled": false,
							"cache_query_parameter_strip_directive": "StripAll",
							"cache_query_parameters": null,
							"cache_use_dynamic_compression": false,
							"custom_forwarding_path": null,
							"forwarding_protocol": "MatchRequest",
						}],
						"frontend_endpoints": ["exampleFrontendEndpoint1"],
						"name": "exampleRoutingRule1",
						"patterns_to_match": ["/*"],
						"redirect_configuration": [],
					}],
					"tags": null,
					"timeouts": null,
				},
				"after_unknown": {
					"backend_pool": [{
						"backend": [{}],
						"id": true,
					}],
					"backend_pool_health_probe": [{"id": true}],
					"backend_pool_health_probes": true,
					"backend_pool_load_balancing": [{"id": true}],
					"backend_pool_load_balancing_settings": true,
					"backend_pools": true,
					"cname": true,
					"explicit_resource_order": true,
					"frontend_endpoint": [{"id": true}],
					"frontend_endpoints": true,
					"header_frontdoor_id": true,
					"id": true,
					"location": true,
					"routing_rule": [{
						"accepted_protocols": [false],
						"forwarding_configuration": [{}],
						"frontend_endpoints": [false],
						"id": true,
						"patterns_to_match": [false],
						"redirect_configuration": [],
					}],
					"routing_rules": true,
				},
				"before_sensitive": false,
				"after_sensitive": {
					"backend_pool": [{"backend": [{}]}],
					"backend_pool_health_probe": [{}],
					"backend_pool_health_probes": {},
					"backend_pool_load_balancing": [{}],
					"backend_pool_load_balancing_settings": {},
					"backend_pools": {},
					"explicit_resource_order": [],
					"frontend_endpoint": [{}],
					"frontend_endpoints": {},
					"routing_rule": [{
						"accepted_protocols": [false],
						"forwarding_configuration": [{}],
						"frontend_endpoints": [false],
						"patterns_to_match": [false],
						"redirect_configuration": [],
					}],
					"routing_rules": {},
				},
			},
		},
		{
			"address": "azurerm_frontdoor.valid_https_only",
			"mode": "managed",
			"type": "azurerm_frontdoor",
			"name": "valid_https_only",
			"provider_name": "registry.terraform.io/hashicorp/azurerm",
			"change": {
				"actions": ["create"],
				"before": null,
				"after": {
					"backend_pool": [{
						"backend": [{
							"address": "www.bing.com",
							"enabled": true,
							"host_header": "www.bing.com",
							"http_port": 80,
							"https_port": 443,
							"priority": 1,
							"weight": 50,
						}],
						"health_probe_name": "exampleHealthProbeSetting1",
						"load_balancing_name": "exampleLoadBalancingSettings1",
						"name": "exampleBackendBing",
					}],
					"backend_pool_health_probe": [{
						"enabled": true,
						"interval_in_seconds": 120,
						"name": "exampleHealthProbeSetting1",
						"path": "/",
						"probe_method": "GET",
						"protocol": "Http",
					}],
					"backend_pool_load_balancing": [{
						"additional_latency_milliseconds": 0,
						"name": "exampleLoadBalancingSettings1",
						"sample_size": 4,
						"successful_samples_required": 2,
					}],
					"backend_pools_send_receive_timeout_seconds": 60,
					"enforce_backend_pools_certificate_name_check": false,
					"friendly_name": null,
					"frontend_endpoint": [{
						"host_name": "example-FrontDoor.azurefd.net",
						"name": "exampleFrontendEndpoint1",
						"session_affinity_enabled": false,
						"session_affinity_ttl_seconds": 0,
						"web_application_firewall_policy_link_id": null,
					}],
					"load_balancer_enabled": true,
					"name": "example-FrontDoor",
					"resource_group_name": "FrontDoorExampleResourceGroup",
					"routing_rule": [{
						"accepted_protocols": ["Https"],
						"enabled": true,
						"forwarding_configuration": [{
							"backend_pool_name": "exampleBackendBing",
							"cache_duration": null,
							"cache_enabled": false,
							"cache_query_parameter_strip_directive": "StripAll",
							"cache_query_parameters": null,
							"cache_use_dynamic_compression": false,
							"custom_forwarding_path": null,
							"forwarding_protocol": "HttpsOnly",
						}],
						"frontend_endpoints": ["exampleFrontendEndpoint1"],
						"name": "exampleRoutingRule1",
						"patterns_to_match": ["/*"],
						"redirect_configuration": [],
					}],
					"tags": null,
					"timeouts": null,
				},
				"after_unknown": {
					"backend_pool": [{
						"backend": [{}],
						"id": true,
					}],
					"backend_pool_health_probe": [{"id": true}],
					"backend_pool_health_probes": true,
					"backend_pool_load_balancing": [{"id": true}],
					"backend_pool_load_balancing_settings": true,
					"backend_pools": true,
					"cname": true,
					"explicit_resource_order": true,
					"frontend_endpoint": [{"id": true}],
					"frontend_endpoints": true,
					"header_frontdoor_id": true,
					"id": true,
					"location": true,
					"routing_rule": [{
						"accepted_protocols": [false],
						"forwarding_configuration": [{}],
						"frontend_endpoints": [false],
						"id": true,
						"patterns_to_match": [false],
						"redirect_configuration": [],
					}],
					"routing_rules": true,
				},
				"before_sensitive": false,
				"after_sensitive": {
					"backend_pool": [{"backend": [{}]}],
					"backend_pool_health_probe": [{}],
					"backend_pool_health_probes": {},
					"backend_pool_load_balancing": [{}],
					"backend_pool_load_balancing_settings": {},
					"backend_pools": {},
					"explicit_resource_order": [],
					"frontend_endpoint": [{}],
					"frontend_endpoints": {},
					"routing_rule": [{
						"accepted_protocols": [false],
						"forwarding_configuration": [{}],
						"frontend_endpoints": [false],
						"patterns_to_match": [false],
						"redirect_configuration": [],
					}],
					"routing_rules": {},
				},
			},
		},
		{
			"address": "azurerm_frontdoor.valid_redirect_to_https",
			"mode": "managed",
			"type": "azurerm_frontdoor",
			"name": "valid_redirect_to_https",
			"provider_name": "registry.terraform.io/hashicorp/azurerm",
			"change": {
				"actions": ["create"],
				"before": null,
				"after": {
					"backend_pool": [{
						"backend": [{
							"address": "www.bing.com",
							"enabled": true,
							"host_header": "www.bing.com",
							"http_port": 80,
							"https_port": 443,
							"priority": 1,
							"weight": 50,
						}],
						"health_probe_name": "exampleHealthProbeSetting1",
						"load_balancing_name": "exampleLoadBalancingSettings1",
						"name": "exampleBackendBing",
					}],
					"backend_pool_health_probe": [{
						"enabled": true,
						"interval_in_seconds": 120,
						"name": "exampleHealthProbeSetting1",
						"path": "/",
						"probe_method": "GET",
						"protocol": "Http",
					}],
					"backend_pool_load_balancing": [{
						"additional_latency_milliseconds": 0,
						"name": "exampleLoadBalancingSettings1",
						"sample_size": 4,
						"successful_samples_required": 2,
					}],
					"backend_pools_send_receive_timeout_seconds": 60,
					"enforce_backend_pools_certificate_name_check": false,
					"friendly_name": null,
					"frontend_endpoint": [{
						"host_name": "example-FrontDoor.azurefd.net",
						"name": "exampleFrontendEndpoint1",
						"session_affinity_enabled": false,
						"session_affinity_ttl_seconds": 0,
						"web_application_firewall_policy_link_id": null,
					}],
					"load_balancer_enabled": true,
					"name": "example-FrontDoor",
					"resource_group_name": "FrontDoorExampleResourceGroup",
					"routing_rule": [
						{
							"accepted_protocols": ["Https"],
							"enabled": true,
							"forwarding_configuration": [{
								"backend_pool_name": "exampleBackendBing",
								"cache_duration": null,
								"cache_enabled": false,
								"cache_query_parameter_strip_directive": "StripAll",
								"cache_query_parameters": null,
								"cache_use_dynamic_compression": false,
								"custom_forwarding_path": null,
								"forwarding_protocol": "HttpsOnly",
							}],
							"frontend_endpoints": ["exampleFrontendEndpoint1"],
							"name": "exampleRoutingRule1",
							"patterns_to_match": ["/*"],
							"redirect_configuration": [],
						},
						{
							"accepted_protocols": ["Http"],
							"enabled": true,
							"forwarding_configuration": [],
							"frontend_endpoints": ["exampleFrontendEndpoint1"],
							"name": "exampleRoutingRule2",
							"patterns_to_match": ["/*"],
							"redirect_configuration": [{
								"custom_fragment": null,
								"custom_host": null,
								"custom_path": null,
								"custom_query_string": null,
								"redirect_protocol": "HttpsOnly",
								"redirect_type": "PermanentRedirect",
							}],
						},
					],
					"tags": null,
					"timeouts": null,
				},
				"after_unknown": {
					"backend_pool": [{
						"backend": [{}],
						"id": true,
					}],
					"backend_pool_health_probe": [{"id": true}],
					"backend_pool_health_probes": true,
					"backend_pool_load_balancing": [{"id": true}],
					"backend_pool_load_balancing_settings": true,
					"backend_pools": true,
					"cname": true,
					"explicit_resource_order": true,
					"frontend_endpoint": [{"id": true}],
					"frontend_endpoints": true,
					"header_frontdoor_id": true,
					"id": true,
					"location": true,
					"routing_rule": [
						{
							"accepted_protocols": [false],
							"forwarding_configuration": [{}],
							"frontend_endpoints": [false],
							"id": true,
							"patterns_to_match": [false],
							"redirect_configuration": [],
						},
						{
							"accepted_protocols": [false],
							"forwarding_configuration": [],
							"frontend_endpoints": [false],
							"id": true,
							"patterns_to_match": [false],
							"redirect_configuration": [{}],
						},
					],
					"routing_rules": true,
				},
				"before_sensitive": false,
				"after_sensitive": {
					"backend_pool": [{"backend": [{}]}],
					"backend_pool_health_probe": [{}],
					"backend_pool_health_probes": {},
					"backend_pool_load_balancing": [{}],
					"backend_pool_load_balancing_settings": {},
					"backend_pools": {},
					"explicit_resource_order": [],
					"frontend_endpoint": [{}],
					"frontend_endpoints": {},
					"routing_rule": [
						{
							"accepted_protocols": [false],
							"forwarding_configuration": [{}],
							"frontend_endpoints": [false],
							"patterns_to_match": [false],
							"redirect_configuration": [],
						},
						{
							"accepted_protocols": [false],
							"forwarding_configuration": [],
							"frontend_endpoints": [false],
							"patterns_to_match": [false],
							"redirect_configuration": [{}],
						},
					],
					"routing_rules": {},
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
					"location": "westeurope",
					"name": "FrontDoorExampleResourceGroup",
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
			"expressions": {"features": [{}]},
		}},
		"root_module": {"resources": [
			{
				"address": "azurerm_frontdoor.invalid_http",
				"mode": "managed",
				"type": "azurerm_frontdoor",
				"name": "invalid_http",
				"provider_config_key": "azurerm",
				"expressions": {
					"backend_pool": [{
						"backend": [{
							"address": {"constant_value": "www.bing.com"},
							"host_header": {"constant_value": "www.bing.com"},
							"http_port": {"constant_value": 80},
							"https_port": {"constant_value": 443},
						}],
						"health_probe_name": {"constant_value": "exampleHealthProbeSetting1"},
						"load_balancing_name": {"constant_value": "exampleLoadBalancingSettings1"},
						"name": {"constant_value": "exampleBackendBing"},
					}],
					"backend_pool_health_probe": [{"name": {"constant_value": "exampleHealthProbeSetting1"}}],
					"backend_pool_load_balancing": [{"name": {"constant_value": "exampleLoadBalancingSettings1"}}],
					"enforce_backend_pools_certificate_name_check": {"constant_value": false},
					"frontend_endpoint": [{
						"host_name": {"constant_value": "example-FrontDoor.azurefd.net"},
						"name": {"constant_value": "exampleFrontendEndpoint1"},
					}],
					"name": {"constant_value": "example-FrontDoor"},
					"resource_group_name": {"references": ["azurerm_resource_group.example"]},
					"routing_rule": [{
						"accepted_protocols": {"constant_value": ["Http"]},
						"forwarding_configuration": [{
							"backend_pool_name": {"constant_value": "exampleBackendBing"},
							"forwarding_protocol": {"constant_value": "MatchRequest"},
						}],
						"frontend_endpoints": {"constant_value": ["exampleFrontendEndpoint1"]},
						"name": {"constant_value": "exampleRoutingRule1"},
						"patterns_to_match": {"constant_value": ["/*"]},
					}],
				},
				"schema_version": 2,
			},
			{
				"address": "azurerm_frontdoor.valid_https_only",
				"mode": "managed",
				"type": "azurerm_frontdoor",
				"name": "valid_https_only",
				"provider_config_key": "azurerm",
				"expressions": {
					"backend_pool": [{
						"backend": [{
							"address": {"constant_value": "www.bing.com"},
							"host_header": {"constant_value": "www.bing.com"},
							"http_port": {"constant_value": 80},
							"https_port": {"constant_value": 443},
						}],
						"health_probe_name": {"constant_value": "exampleHealthProbeSetting1"},
						"load_balancing_name": {"constant_value": "exampleLoadBalancingSettings1"},
						"name": {"constant_value": "exampleBackendBing"},
					}],
					"backend_pool_health_probe": [{"name": {"constant_value": "exampleHealthProbeSetting1"}}],
					"backend_pool_load_balancing": [{"name": {"constant_value": "exampleLoadBalancingSettings1"}}],
					"enforce_backend_pools_certificate_name_check": {"constant_value": false},
					"frontend_endpoint": [{
						"host_name": {"constant_value": "example-FrontDoor.azurefd.net"},
						"name": {"constant_value": "exampleFrontendEndpoint1"},
					}],
					"name": {"constant_value": "example-FrontDoor"},
					"resource_group_name": {"references": ["azurerm_resource_group.example"]},
					"routing_rule": [{
						"accepted_protocols": {"constant_value": ["Https"]},
						"forwarding_configuration": [{
							"backend_pool_name": {"constant_value": "exampleBackendBing"},
							"forwarding_protocol": {"constant_value": "HttpsOnly"},
						}],
						"frontend_endpoints": {"constant_value": ["exampleFrontendEndpoint1"]},
						"name": {"constant_value": "exampleRoutingRule1"},
						"patterns_to_match": {"constant_value": ["/*"]},
					}],
				},
				"schema_version": 2,
			},
			{
				"address": "azurerm_frontdoor.valid_redirect_to_https",
				"mode": "managed",
				"type": "azurerm_frontdoor",
				"name": "valid_redirect_to_https",
				"provider_config_key": "azurerm",
				"expressions": {
					"backend_pool": [{
						"backend": [{
							"address": {"constant_value": "www.bing.com"},
							"host_header": {"constant_value": "www.bing.com"},
							"http_port": {"constant_value": 80},
							"https_port": {"constant_value": 443},
						}],
						"health_probe_name": {"constant_value": "exampleHealthProbeSetting1"},
						"load_balancing_name": {"constant_value": "exampleLoadBalancingSettings1"},
						"name": {"constant_value": "exampleBackendBing"},
					}],
					"backend_pool_health_probe": [{"name": {"constant_value": "exampleHealthProbeSetting1"}}],
					"backend_pool_load_balancing": [{"name": {"constant_value": "exampleLoadBalancingSettings1"}}],
					"enforce_backend_pools_certificate_name_check": {"constant_value": false},
					"frontend_endpoint": [{
						"host_name": {"constant_value": "example-FrontDoor.azurefd.net"},
						"name": {"constant_value": "exampleFrontendEndpoint1"},
					}],
					"name": {"constant_value": "example-FrontDoor"},
					"resource_group_name": {"references": ["azurerm_resource_group.example"]},
					"routing_rule": [
						{
							"accepted_protocols": {"constant_value": ["Https"]},
							"forwarding_configuration": [{
								"backend_pool_name": {"constant_value": "exampleBackendBing"},
								"forwarding_protocol": {"constant_value": "HttpsOnly"},
							}],
							"frontend_endpoints": {"constant_value": ["exampleFrontendEndpoint1"]},
							"name": {"constant_value": "exampleRoutingRule1"},
							"patterns_to_match": {"constant_value": ["/*"]},
						},
						{
							"accepted_protocols": {"constant_value": ["Http"]},
							"frontend_endpoints": {"constant_value": ["exampleFrontendEndpoint1"]},
							"name": {"constant_value": "exampleRoutingRule2"},
							"patterns_to_match": {"constant_value": ["/*"]},
							"redirect_configuration": [{
								"redirect_protocol": {"constant_value": "HttpsOnly"},
								"redirect_type": {"constant_value": "PermanentRedirect"},
							}],
						},
					],
				},
				"schema_version": 2,
			},
			{
				"address": "azurerm_resource_group.example",
				"mode": "managed",
				"type": "azurerm_resource_group",
				"name": "example",
				"provider_config_key": "azurerm",
				"expressions": {
					"location": {"constant_value": "West Europe"},
					"name": {"constant_value": "FrontDoorExampleResourceGroup"},
				},
				"schema_version": 0,
			},
		]},
	},
}
