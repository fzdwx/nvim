local api = vim.api
local window = require("lspsaga.window")
local build_float = require("lazy.view.float")
local term = {}

---@class FloatOptions:LazyFloatOption
---@field interactive boolean

---@param cmd  string
---@param opts FloatOptions
function term:open(cmd, opts)
  local float = build_float(opts)
  vim.fn.termopen(cmd, vim.tbl_isempty(opts) and vim.empty_dict() or opts)
  if opts.interactive ~= false then
    vim.cmd.startinsert()
    vim.api.nvim_create_autocmd("TermClose", {
      once = true,
      buffer = float.buf,
      callback = function()
        float:close()
        vim.cmd.checktime()
      end,
    })
  end
  return float
end

return term
