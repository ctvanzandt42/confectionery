# Rego test file for acm certificate validation
# Validating rule acm dns validation: Deny if validation method is email, allow if validation method is done by DNS 
package rules.acm_dns_validation

import data.fugue.resource_view.resource_view_input

mock_input = ret {
	ret = resource_view_input with input as mock_plan_input
}

test_acm_validation {
	pol = policy with input as mock_input
	resources = {p.id: p.valid | pol[p]}
	resources["aws_acm_certificate.valid_example"] == true
	resources["aws_acm_certificate.invalid_example"] == false
}

# Mock input is generated by acm_dns_validation.tf 
# Valid when acm certificate validation method is DNS, not email
mock_plan_input = {
	"format_version": "0.1",
	"terraform_version": "0.12.29",
	"planned_values": {"root_module": {"resources": [
		{
			"address": "aws_acm_certificate.invalid_example",
			"mode": "managed",
			"type": "aws_acm_certificate",
			"name": "invalid_example",
			"provider_name": "aws",
			"schema_version": 0,
			"values": {
				"certificate_authority_arn": null,
				"certificate_body": null,
				"certificate_chain": null,
				"domain_name": "example.com",
				"options": [],
				"private_key": null,
				"tags": null,
				"validation_method": "EMAIL",
			},
		},
		{
			"address": "aws_acm_certificate.valid_example",
			"mode": "managed",
			"type": "aws_acm_certificate",
			"name": "valid_example",
			"provider_name": "aws",
			"schema_version": 0,
			"values": {
				"certificate_authority_arn": null,
				"certificate_body": null,
				"certificate_chain": null,
				"domain_name": "example.com",
				"domain_validation_options": [
					{"domain_name": "example.com"},
					{"domain_name": "example.org"},
					{"domain_name": "www.example.com"},
				],
				"options": [],
				"private_key": null,
				"subject_alternative_names": [
					"example.org",
					"www.example.com",
				],
				"tags": null,
				"validation_method": "DNS",
			},
		},
		{
			"address": "aws_acm_certificate_validation.validation_a",
			"mode": "managed",
			"type": "aws_acm_certificate_validation",
			"name": "validation_a",
			"provider_name": "aws",
			"schema_version": 0,
			"values": {
				"timeouts": null,
				"validation_record_fqdns": null,
			},
		},
		{
			"address": "aws_acm_certificate_validation.validation_b",
			"mode": "managed",
			"type": "aws_acm_certificate_validation",
			"name": "validation_b",
			"provider_name": "aws",
			"schema_version": 0,
			"values": {
				"timeouts": null,
				"validation_record_fqdns": null,
			},
		},
	]}},
	"resource_changes": [
		{
			"address": "aws_acm_certificate.invalid_example",
			"mode": "managed",
			"type": "aws_acm_certificate",
			"name": "invalid_example",
			"provider_name": "aws",
			"change": {
				"actions": ["create"],
				"before": null,
				"after": {
					"certificate_authority_arn": null,
					"certificate_body": null,
					"certificate_chain": null,
					"domain_name": "example.com",
					"options": [],
					"private_key": null,
					"tags": null,
					"validation_method": "EMAIL",
				},
				"after_unknown": {
					"arn": true,
					"domain_validation_options": true,
					"id": true,
					"options": [],
					"status": true,
					"subject_alternative_names": true,
					"validation_emails": true,
				},
			},
		},
		{
			"address": "aws_acm_certificate.valid_example",
			"mode": "managed",
			"type": "aws_acm_certificate",
			"name": "valid_example",
			"provider_name": "aws",
			"change": {
				"actions": ["create"],
				"before": null,
				"after": {
					"certificate_authority_arn": null,
					"certificate_body": null,
					"certificate_chain": null,
					"domain_name": "example.com",
					"domain_validation_options": [
						{"domain_name": "example.com"},
						{"domain_name": "example.org"},
						{"domain_name": "www.example.com"},
					],
					"options": [],
					"private_key": null,
					"subject_alternative_names": [
						"example.org",
						"www.example.com",
					],
					"tags": null,
					"validation_method": "DNS",
				},
				"after_unknown": {
					"arn": true,
					"domain_validation_options": [
						{
							"resource_record_name": true,
							"resource_record_type": true,
							"resource_record_value": true,
						},
						{
							"resource_record_name": true,
							"resource_record_type": true,
							"resource_record_value": true,
						},
						{
							"resource_record_name": true,
							"resource_record_type": true,
							"resource_record_value": true,
						},
					],
					"id": true,
					"options": [],
					"status": true,
					"subject_alternative_names": [
						false,
						false,
					],
					"validation_emails": true,
				},
			},
		},
		{
			"address": "aws_acm_certificate_validation.validation_a",
			"mode": "managed",
			"type": "aws_acm_certificate_validation",
			"name": "validation_a",
			"provider_name": "aws",
			"change": {
				"actions": ["create"],
				"before": null,
				"after": {
					"timeouts": null,
					"validation_record_fqdns": null,
				},
				"after_unknown": {
					"certificate_arn": true,
					"id": true,
				},
			},
		},
		{
			"address": "aws_acm_certificate_validation.validation_b",
			"mode": "managed",
			"type": "aws_acm_certificate_validation",
			"name": "validation_b",
			"provider_name": "aws",
			"change": {
				"actions": ["create"],
				"before": null,
				"after": {
					"timeouts": null,
					"validation_record_fqdns": null,
				},
				"after_unknown": {
					"certificate_arn": true,
					"id": true,
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
				"shared_credentials_file": {"constant_value": "~/.aws/credentials"},
			},
		}},
		"root_module": {"resources": [
			{
				"address": "aws_acm_certificate.invalid_example",
				"mode": "managed",
				"type": "aws_acm_certificate",
				"name": "invalid_example",
				"provider_config_key": "aws",
				"expressions": {
					"domain_name": {"constant_value": "example.com"},
					"validation_method": {"constant_value": "EMAIL"},
				},
				"schema_version": 0,
			},
			{
				"address": "aws_acm_certificate.valid_example",
				"mode": "managed",
				"type": "aws_acm_certificate",
				"name": "valid_example",
				"provider_config_key": "aws",
				"expressions": {
					"domain_name": {"constant_value": "example.com"},
					"subject_alternative_names": {"constant_value": [
						"www.example.com",
						"example.org",
					]},
					"validation_method": {"constant_value": "DNS"},
				},
				"schema_version": 0,
			},
			{
				"address": "aws_acm_certificate_validation.validation_a",
				"mode": "managed",
				"type": "aws_acm_certificate_validation",
				"name": "validation_a",
				"provider_config_key": "aws",
				"expressions": {"certificate_arn": {"references": ["aws_acm_certificate.valid_example"]}},
				"schema_version": 0,
			},
			{
				"address": "aws_acm_certificate_validation.validation_b",
				"mode": "managed",
				"type": "aws_acm_certificate_validation",
				"name": "validation_b",
				"provider_config_key": "aws",
				"expressions": {"certificate_arn": {"references": ["aws_acm_certificate.invalid_example"]}},
				"schema_version": 0,
			},
		]},
	},
}
