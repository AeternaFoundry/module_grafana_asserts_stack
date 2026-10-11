variable "asserts_stacks" {
  description = <<EOT
Map of asserts_stacks, attributes below
Required:
    - cloud_access_policy_token
Optional:
    - grafana_token
    - dataset (block):
        - disabled_vendors (optional)
        - filter_group (optional, block):
            - env_label (optional)
            - env_label_values (optional)
            - env_name (optional)
            - filter (optional, block):
                - name (required)
                - operator (required)
                - values (required)
            - site_label (optional)
            - site_label_values (optional)
        - type (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - read (optional)
        - update (optional)
EOT

  type = map(object({
    cloud_access_policy_token = string
    grafana_token             = optional(string)
    dataset = optional(list(object({
      disabled_vendors = optional(list(string))
      filter_group = optional(list(object({
        env_label        = optional(string)
        env_label_values = optional(list(string))
        env_name         = optional(string)
        filter = optional(list(object({
          name     = string
          operator = string
          values   = list(string)
        })))
        site_label        = optional(string)
        site_label_values = optional(list(string))
      })))
      type = string
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
}

