-- `texlab` for LaTeX
return {
  settings = {
    texlab = {
      build = {
        args = { "-X", "build" },
        executable = "tectonic",
      },
    },
  },
}
