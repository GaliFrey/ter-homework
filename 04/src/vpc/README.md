## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.12.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_vpc_network.network](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.subnet](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr"></a> [cidr](#input\_cidr) | CIDR подсети, например 10.0.1.0/24 | `string` | n/a | yes |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | Имя сети и подсети | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | Зона доступности, например ru-central1-a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | ID сети |
| <a name="output_subnet"></a> [subnet](#output\_subnet) | Объект созданной подсети |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | ID подсети |
