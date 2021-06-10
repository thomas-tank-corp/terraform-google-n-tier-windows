## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| google | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| google | ~> 3.0 |
| local | n/a |
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app | set to true to include app tier | `bool` | `false` | no |
| app\_server\_instance\_config | n/a | <pre>object({<br>    disk_image     = string<br>    disk_size      = string<br>    disk_type      = string<br>    target_size    = string<br>    machine_type   = string<br>  })</pre> | <pre>{<br>  "disk_image": "appserver_windows",<br>  "disk_size": "200",<br>  "disk_type": "pd-ssd",<br>  "machine_type": "n1-standard-1",<br>  "target_size": "1"<br>}</pre> | no |
| app\_startup\_script | bash startup script for app server | `string` | `""` | no |
| database | set to true to include database tier | `bool` | `false` | no |
| database\_instance\_config | n/a | <pre>object({<br>    disk_image   = string<br>    disk_size    = string<br>    disk_type    = string<br>    target_size  = string<br>    machine_type = string<br>  })</pre> | <pre>{<br>  "disk_image": "database_windows",<br>  "disk_size": "200",<br>  "disk_type": "pd-ssd",<br>  "machine_type": "n1-standard-1",<br>  "target_size": "1"<br>}</pre> | no |
| database\_startup\_script | bash startup script for database server | `string` | `""` | no |
| firewall\_ports | Additional ports to allow through the firewall | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| ip\_allow\_list | IP CIDRs to alow | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| labels | labels (tags) to apply to the instance | `map(string)` | <pre>{<br>  "os": "",<br>  "tier": ""<br>}</pre> | no |
| prefix | name of application/developer - serves as prefix for resources to keep them unique | `string` | n/a | yes |
| project | Existing GCP project to deploy into | `any` | n/a | yes |
| region | region to deploy into | `string` | `"europe-west2"` | no |
| subnet | n/a | `any` | n/a | yes |
| subnet\_range | IP CIDR range for subnet | `string` | `""` | no |
| vpc | existing vpc the resources are deployed into | `any` | n/a | yes |
| web | set to true to include web tier | `bool` | `false` | no |
| web\_startup\_script | bash startup script for webserver | `string` | `""` | no |
| webserver\_instance\_config | n/a | <pre>object({<br>    disk_image   = string<br>    disk_size    = string<br>    disk_type    = string<br>    target_size  = string<br>    machine_type = string<br>  })</pre> | <pre>{<br>  "disk_image": "webserver_windows",<br>  "disk_size": "200",<br>  "disk_type": "pd-ssd",<br>  "machine_type": "n1-standard-1",<br>  "target_size": "1"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| database\_startup\_script | startup script when instance boots |
| web\_startup\_script | startup script when instance boots |
| windows\_app\_startup\_script | startup script when instance boots |

