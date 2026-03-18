local os_name = vim.loop.os_uname().sysname

-- Platforms
local is_macos = os_name == "Darwin"
local is_linux = os_name == "Linux"
local is_windows = os_name == "Windows_NT"

-- Concatenate paths to base with os-related path separator
local function path_concat(base, ...)
  -- OS-related path separator
  local path_sep = is_windows and "\\" or "/"

  local count = select("#", ...)
  assert(
    count >= 1,
    ("expected at least 2 arguments, got %d"):format(count + 1)
  )

  local result = base
  vim.validate("base", result, "string")
  for i = 1, count do
    local path = select(i, ...)
    vim.validate(("argument %d"):format(i + 1), path, "string")
    result = result .. path_sep .. path
  end
  return result
end

-- Basic directories
local home = is_windows and os.getenv("USERPROFILE") or os.getenv("HOME")
local cache_dir = vim.fn.stdpath("cache")
local config_dir = vim.fn.stdpath("config")
local data_dir = vim.fn.stdpath("data")

-- Cache directories, required by user.core.options
local backup_dir = path_concat(cache_dir, "backup//")
local swap_dir = path_concat(cache_dir, "swap//")
local undo_dir = path_concat(cache_dir, "undo//")
local view_dir = path_concat(cache_dir, "view//")

User.g = {
  backup_dir = backup_dir,
  cache_dir = cache_dir,
  config_dir = config_dir,
  data_dir = data_dir,
  home = home,
  is_linux = is_linux,
  is_macos = is_macos,
  is_windows = is_windows,
  swap_dir = swap_dir,
  undo_dir = undo_dir,
  view_dir = view_dir,
}

return User.g

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
