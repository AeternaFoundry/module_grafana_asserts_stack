resource "grafana_asserts_stack" "asserts_stacks" {
  for_each = var.asserts_stacks

  cloud_access_policy_token = each.value.cloud_access_policy_token
  grafana_token             = each.value.grafana_token

  dynamic "dataset" {
    for_each = each.value.dataset != null ? each.value.dataset : []
    content {
      disabled_vendors = dataset.value.disabled_vendors
      dynamic "filter_group" {
        for_each = dataset.value.filter_group != null ? dataset.value.filter_group : []
        content {
          env_label        = filter_group.value.env_label
          env_label_values = filter_group.value.env_label_values
          env_name         = filter_group.value.env_name
          dynamic "filter" {
            for_each = filter_group.value.filter != null ? filter_group.value.filter : []
            content {
              name     = filter.value.name
              operator = filter.value.operator
              values   = filter.value.values
            }
          }
          site_label        = filter_group.value.site_label
          site_label_values = filter_group.value.site_label_values
        }
      }
      type = dataset.value.type
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}

