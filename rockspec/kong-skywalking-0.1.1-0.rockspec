package = "kong-skywalking"
version = "0.1.1-0"
source = {
   url = "git://github.com/apache/skywalking-kong",
   branch = "v0.1.1",
}

description = {
   summary = "The Kong agent for Apache SkyWalking",
   homepage = "https://github.com/apache/skywalking-kong",
   license = "Apache License 2.0"
}

dependencies = {
   "skywalking-nginx-lua = 0.5.0"
}

build = {
   type = "builtin",
   modules = {
      ["kong.plugins.skywalking.handler"] = "kong/plugins/skywalking/handler.lua",
      ["kong.plugins.skywalking.schema"] = "kong/plugins/skywalking/schema.lua"
   }
}
