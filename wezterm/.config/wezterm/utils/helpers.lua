local wezterm = require("wezterm")
local appearance = wezterm.gui.get_appearance()

local M = {}

M.is_dark = function()
	return appearance:find("Dark")
end

M.get_random_entry = function(tbl)
	local keys = {}
	for key, _ in ipairs(tbl) do
		table.insert(keys, key)
	end
	local randomKey = keys[math.random(1, #keys)]
	return tbl[randomKey]
end

M.get_cwd = function(pane)
  local cwd_uri = pane:get_current_working_dir()
  if cwd_uri then
    cwd = cwd_uri.file_path
    cwd = string.gsub(cwd, wezterm.home_dir, "~")
    return cwd
  end
  return nil
end

M.basename = function (path)
  return string.gsub(path, "(.*/)(.*)", "%2")
end

M.dirname = function(path)
  return string.gsub(path, "(.*/)(.*)", "%1")
end

return M
