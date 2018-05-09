local YourCustomHarvestTaskGroup = class()
YourCustomHarvestTaskGroup.name = 'harvest'
YourCustomHarvestTaskGroup.does = 'stonehearth:simple_labor'
YourCustomHarvestTaskGroup.priority = {0.6, 0.8}

return stonehearth.ai:create_task_group(YourCustomHarvestTaskGroup)
         :work_order_tag("haul")
         :declare_permanent_task('stonehearth:harvest_resource', { category = "gathering" }, {0.5, 1.0})
         :declare_permanent_task('stonehearth:harvest_renewable_resource', { category = "gathering" }, {0.5, 1.0})
