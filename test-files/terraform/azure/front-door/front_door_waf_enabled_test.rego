# Rego test for Front Door WAF Enabled
# Validating rule front_door_waf_enabled: Azure Front Door should have an attached web application firewall policy.
package rules.front_door_waf_enabled

import data.fugue.resource_view.resource_view_input

mock_input = ret {
	ret = resource_view_input with input as mock_plan_input
}

test_waf_enabled_front_door {
	pol := policy with input as mock_input
	resources := {p.id: p.valid | pol[p]}

	resources["azurerm_frontdoor.invalid"] == false
	resources["azurerm_frontdoor.valid"] == true
}

# Mock input is generated plan for front_door_waf_enabled.tf
mock_plan_input = {
	"format_version": "0.1",
	"terraform_version": "1.0.0",
	"planned_values": {"root_module": {"resources": [
		{
			"address": "azurerm_frontdoor.invalid",
			"mode": "managed",
			"type": "azurerm_frontdoor",
			"name": "invalid",
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
					"accepted_protocols": [
						"Http",
						"Https",
					],
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
			"address": "azurerm_frontdoor.valid",
			"mode": "managed",
			"type": "azurerm_frontdoor",
			"name": "valid",
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
				}],
				"load_balancer_enabled": true,
				"name": "example-FrontDoor",
				"resource_group_name": "FrontDoorExampleResourceGroup",
				"routing_rule": [{
					"accepted_protocols": [
						"Http",
						"Https",
					],
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
			"address": "azurerm_frontdoor_firewall_policy.example",
			"mode": "managed",
			"type": "azurerm_frontdoor_firewall_policy",
			"name": "example",
			"provider_name": "registry.terraform.io/hashicorp/azurerm",
			"schema_version": 1,
			"values": {
				"custom_block_response_body": "PGh0bWw+CjxoZWFkZXI+PHRpdGxlPkhlbGxvPC90aXRsZT48L2hlYWRlcj4KPGJvZHk+CkhlbGxvIHdvcmxkCjwvYm9keT4KPC9odG1sPg==",
				"custom_block_response_status_code": 403,
				"custom_rule": [
					{
						"action": "Block",
						"enabled": true,
						"match_condition": [{
							"match_values": [
								"192.168.1.0/24",
								"10.0.0.0/24",
							],
							"match_variable": "RemoteAddr",
							"negation_condition": false,
							"operator": "IPMatch",
							"selector": null,
							"transforms": null,
						}],
						"name": "Rule1",
						"priority": 1,
						"rate_limit_duration_in_minutes": 1,
						"rate_limit_threshold": 10,
						"type": "MatchRule",
					},
					{
						"action": "Block",
						"enabled": true,
						"match_condition": [
							{
								"match_values": ["192.168.1.0/24"],
								"match_variable": "RemoteAddr",
								"negation_condition": false,
								"operator": "IPMatch",
								"selector": null,
								"transforms": null,
							},
							{
								"match_values": ["windows"],
								"match_variable": "RequestHeader",
								"negation_condition": false,
								"operator": "Contains",
								"selector": "UserAgent",
								"transforms": [
									"Lowercase",
									"Trim",
								],
							},
						],
						"name": "Rule2",
						"priority": 2,
						"rate_limit_duration_in_minutes": 1,
						"rate_limit_threshold": 10,
						"type": "MatchRule",
					},
				],
				"enabled": true,
				"managed_rule": [
					{
						"exclusion": [{
							"match_variable": "QueryStringArgNames",
							"operator": "Equals",
							"selector": "not_suspicious",
						}],
						"override": [
							{
								"exclusion": [],
								"rule": [{
									"action": "Block",
									"enabled": false,
									"exclusion": [],
									"rule_id": "933100",
								}],
								"rule_group_name": "PHP",
							},
							{
								"exclusion": [{
									"match_variable": "QueryStringArgNames",
									"operator": "Equals",
									"selector": "really_not_suspicious",
								}],
								"rule": [{
									"action": "Block",
									"enabled": false,
									"exclusion": [{
										"match_variable": "QueryStringArgNames",
										"operator": "Equals",
										"selector": "innocent",
									}],
									"rule_id": "942200",
								}],
								"rule_group_name": "SQLI",
							},
						],
						"type": "DefaultRuleSet",
						"version": "1.0",
					},
					{
						"exclusion": [],
						"override": [],
						"type": "Microsoft_BotManagerRuleSet",
						"version": "1.0",
					},
				],
				"mode": "Prevention",
				"name": "examplefdwafpolicy",
				"redirect_url": "https://www.contoso.com",
				"resource_group_name": "FrontDoorExampleResourceGroup",
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
			"address": "azurerm_frontdoor.invalid",
			"mode": "managed",
			"type": "azurerm_frontdoor",
			"name": "invalid",
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
						"accepted_protocols": [
							"Http",
							"Https",
						],
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
						"accepted_protocols": [
							false,
							false,
						],
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
						"accepted_protocols": [
							false,
							false,
						],
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
			"address": "azurerm_frontdoor.valid",
			"mode": "managed",
			"type": "azurerm_frontdoor",
			"name": "valid",
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
					}],
					"load_balancer_enabled": true,
					"name": "example-FrontDoor",
					"resource_group_name": "FrontDoorExampleResourceGroup",
					"routing_rule": [{
						"accepted_protocols": [
							"Http",
							"Https",
						],
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
					"frontend_endpoint": [{
						"id": true,
						"web_application_firewall_policy_link_id": true,
					}],
					"frontend_endpoints": true,
					"header_frontdoor_id": true,
					"id": true,
					"location": true,
					"routing_rule": [{
						"accepted_protocols": [
							false,
							false,
						],
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
						"accepted_protocols": [
							false,
							false,
						],
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
			"address": "azurerm_frontdoor_firewall_policy.example",
			"mode": "managed",
			"type": "azurerm_frontdoor_firewall_policy",
			"name": "example",
			"provider_name": "registry.terraform.io/hashicorp/azurerm",
			"change": {
				"actions": ["create"],
				"before": null,
				"after": {
					"custom_block_response_body": "PGh0bWw+CjxoZWFkZXI+PHRpdGxlPkhlbGxvPC90aXRsZT48L2hlYWRlcj4KPGJvZHk+CkhlbGxvIHdvcmxkCjwvYm9keT4KPC9odG1sPg==",
					"custom_block_response_status_code": 403,
					"custom_rule": [
						{
							"action": "Block",
							"enabled": true,
							"match_condition": [{
								"match_values": [
									"192.168.1.0/24",
									"10.0.0.0/24",
								],
								"match_variable": "RemoteAddr",
								"negation_condition": false,
								"operator": "IPMatch",
								"selector": null,
								"transforms": null,
							}],
							"name": "Rule1",
							"priority": 1,
							"rate_limit_duration_in_minutes": 1,
							"rate_limit_threshold": 10,
							"type": "MatchRule",
						},
						{
							"action": "Block",
							"enabled": true,
							"match_condition": [
								{
									"match_values": ["192.168.1.0/24"],
									"match_variable": "RemoteAddr",
									"negation_condition": false,
									"operator": "IPMatch",
									"selector": null,
									"transforms": null,
								},
								{
									"match_values": ["windows"],
									"match_variable": "RequestHeader",
									"negation_condition": false,
									"operator": "Contains",
									"selector": "UserAgent",
									"transforms": [
										"Lowercase",
										"Trim",
									],
								},
							],
							"name": "Rule2",
							"priority": 2,
							"rate_limit_duration_in_minutes": 1,
							"rate_limit_threshold": 10,
							"type": "MatchRule",
						},
					],
					"enabled": true,
					"managed_rule": [
						{
							"exclusion": [{
								"match_variable": "QueryStringArgNames",
								"operator": "Equals",
								"selector": "not_suspicious",
							}],
							"override": [
								{
									"exclusion": [],
									"rule": [{
										"action": "Block",
										"enabled": false,
										"exclusion": [],
										"rule_id": "933100",
									}],
									"rule_group_name": "PHP",
								},
								{
									"exclusion": [{
										"match_variable": "QueryStringArgNames",
										"operator": "Equals",
										"selector": "really_not_suspicious",
									}],
									"rule": [{
										"action": "Block",
										"enabled": false,
										"exclusion": [{
											"match_variable": "QueryStringArgNames",
											"operator": "Equals",
											"selector": "innocent",
										}],
										"rule_id": "942200",
									}],
									"rule_group_name": "SQLI",
								},
							],
							"type": "DefaultRuleSet",
							"version": "1.0",
						},
						{
							"exclusion": [],
							"override": [],
							"type": "Microsoft_BotManagerRuleSet",
							"version": "1.0",
						},
					],
					"mode": "Prevention",
					"name": "examplefdwafpolicy",
					"redirect_url": "https://www.contoso.com",
					"resource_group_name": "FrontDoorExampleResourceGroup",
					"tags": null,
					"timeouts": null,
				},
				"after_unknown": {
					"custom_rule": [
						{"match_condition": [{"match_values": [
							false,
							false,
						]}]},
						{"match_condition": [
							{"match_values": [false]},
							{
								"match_values": [false],
								"transforms": [
									false,
									false,
								],
							},
						]},
					],
					"frontend_endpoint_ids": true,
					"id": true,
					"location": true,
					"managed_rule": [
						{
							"exclusion": [{}],
							"override": [
								{
									"exclusion": [],
									"rule": [{"exclusion": []}],
								},
								{
									"exclusion": [{}],
									"rule": [{"exclusion": [{}]}],
								},
							],
						},
						{
							"exclusion": [],
							"override": [],
						},
					],
				},
				"before_sensitive": false,
				"after_sensitive": {
					"custom_rule": [
						{"match_condition": [{"match_values": [
							false,
							false,
						]}]},
						{"match_condition": [
							{"match_values": [false]},
							{
								"match_values": [false],
								"transforms": [
									false,
									false,
								],
							},
						]},
					],
					"frontend_endpoint_ids": [],
					"managed_rule": [
						{
							"exclusion": [{}],
							"override": [
								{
									"exclusion": [],
									"rule": [{"exclusion": []}],
								},
								{
									"exclusion": [{}],
									"rule": [{"exclusion": [{}]}],
								},
							],
						},
						{
							"exclusion": [],
							"override": [],
						},
					],
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
				"address": "azurerm_frontdoor.invalid",
				"mode": "managed",
				"type": "azurerm_frontdoor",
				"name": "invalid",
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
						"accepted_protocols": {"constant_value": [
							"Http",
							"Https",
						]},
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
				"address": "azurerm_frontdoor.valid",
				"mode": "managed",
				"type": "azurerm_frontdoor",
				"name": "valid",
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
						"web_application_firewall_policy_link_id": {"references": ["azurerm_frontdoor_firewall_policy.example"]},
					}],
					"name": {"constant_value": "example-FrontDoor"},
					"resource_group_name": {"references": ["azurerm_resource_group.example"]},
					"routing_rule": [{
						"accepted_protocols": {"constant_value": [
							"Http",
							"Https",
						]},
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
				"address": "azurerm_frontdoor_firewall_policy.example",
				"mode": "managed",
				"type": "azurerm_frontdoor_firewall_policy",
				"name": "example",
				"provider_config_key": "azurerm",
				"expressions": {
					"custom_block_response_body": {"constant_value": "PGh0bWw+CjxoZWFkZXI+PHRpdGxlPkhlbGxvPC90aXRsZT48L2hlYWRlcj4KPGJvZHk+CkhlbGxvIHdvcmxkCjwvYm9keT4KPC9odG1sPg=="},
					"custom_block_response_status_code": {"constant_value": 403},
					"custom_rule": [
						{
							"action": {"constant_value": "Block"},
							"enabled": {"constant_value": true},
							"match_condition": [{
								"match_values": {"constant_value": [
									"192.168.1.0/24",
									"10.0.0.0/24",
								]},
								"match_variable": {"constant_value": "RemoteAddr"},
								"negation_condition": {"constant_value": false},
								"operator": {"constant_value": "IPMatch"},
							}],
							"name": {"constant_value": "Rule1"},
							"priority": {"constant_value": 1},
							"rate_limit_duration_in_minutes": {"constant_value": 1},
							"rate_limit_threshold": {"constant_value": 10},
							"type": {"constant_value": "MatchRule"},
						},
						{
							"action": {"constant_value": "Block"},
							"enabled": {"constant_value": true},
							"match_condition": [
								{
									"match_values": {"constant_value": ["192.168.1.0/24"]},
									"match_variable": {"constant_value": "RemoteAddr"},
									"negation_condition": {"constant_value": false},
									"operator": {"constant_value": "IPMatch"},
								},
								{
									"match_values": {"constant_value": ["windows"]},
									"match_variable": {"constant_value": "RequestHeader"},
									"negation_condition": {"constant_value": false},
									"operator": {"constant_value": "Contains"},
									"selector": {"constant_value": "UserAgent"},
									"transforms": {"constant_value": [
										"Lowercase",
										"Trim",
									]},
								},
							],
							"name": {"constant_value": "Rule2"},
							"priority": {"constant_value": 2},
							"rate_limit_duration_in_minutes": {"constant_value": 1},
							"rate_limit_threshold": {"constant_value": 10},
							"type": {"constant_value": "MatchRule"},
						},
					],
					"enabled": {"constant_value": true},
					"managed_rule": [
						{
							"exclusion": [{
								"match_variable": {"constant_value": "QueryStringArgNames"},
								"operator": {"constant_value": "Equals"},
								"selector": {"constant_value": "not_suspicious"},
							}],
							"override": [
								{
									"rule": [{
										"action": {"constant_value": "Block"},
										"enabled": {"constant_value": false},
										"rule_id": {"constant_value": "933100"},
									}],
									"rule_group_name": {"constant_value": "PHP"},
								},
								{
									"exclusion": [{
										"match_variable": {"constant_value": "QueryStringArgNames"},
										"operator": {"constant_value": "Equals"},
										"selector": {"constant_value": "really_not_suspicious"},
									}],
									"rule": [{
										"action": {"constant_value": "Block"},
										"exclusion": [{
											"match_variable": {"constant_value": "QueryStringArgNames"},
											"operator": {"constant_value": "Equals"},
											"selector": {"constant_value": "innocent"},
										}],
										"rule_id": {"constant_value": "942200"},
									}],
									"rule_group_name": {"constant_value": "SQLI"},
								},
							],
							"type": {"constant_value": "DefaultRuleSet"},
							"version": {"constant_value": "1.0"},
						},
						{
							"type": {"constant_value": "Microsoft_BotManagerRuleSet"},
							"version": {"constant_value": "1.0"},
						},
					],
					"mode": {"constant_value": "Prevention"},
					"name": {"constant_value": "examplefdwafpolicy"},
					"redirect_url": {"constant_value": "https://www.contoso.com"},
					"resource_group_name": {"references": ["azurerm_resource_group.example"]},
				},
				"schema_version": 1,
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
