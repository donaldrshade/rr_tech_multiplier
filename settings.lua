-- settings.lua

data:extend({
  -- Primitive Age Setting
  {
    type = "int-setting",
    name = "rr-tm-primitive-multiplier",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 1,
    maximum_value = 100,
    order = "a"
  },
  -- Rail Age Setting
  {
    type = "int-setting",
    name = "rr-tm-rail-multiplier",
    setting_type = "startup",
    default_value = 8,
    minimum_value = 5,
    maximum_value = 100,
    order = "b"
  },
  -- Space Age Setting
  {
    type = "int-setting",
    name = "rr-tm-space-multiplier",
    setting_type = "startup",
    default_value = 25,
    minimum_value = 10,
    maximum_value = 1000,
    order = "c"
  }
})
