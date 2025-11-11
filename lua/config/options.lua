local opt = vim.opt
local o = vim.o

-- =========================
-- ✅ UI & 视觉体验
-- =========================
opt.number = true -- 显示绝对行号
opt.relativenumber = false -- 不使用相对行号
opt.cursorline = true -- 高亮当前行
opt.signcolumn = 'yes' -- 固定标志列防止抖动
opt.wrap = true -- 自动换行
opt.linebreak = true -- 单词边界换行
opt.breakindent = true -- 换行缩进对齐
opt.showmode = false -- 不在底部显示模式文字
opt.scrolloff = 10 -- 滚动缓冲区
opt.list = true -- 显示不可见字符
opt.listchars = {
  tab = '» ',
  trail = '·',
  nbsp = '␣',
}

-- =========================
-- ✅ 缩进与格式
-- =========================
opt.expandtab = true -- Tab 转空格
opt.tabstop = 2 -- Tab 显示宽度
opt.shiftwidth = 2 -- 自动缩进宽度
opt.smartindent = true -- 智能缩进

-- =========================
-- ✅ 搜索体验优化
-- =========================
opt.hlsearch = true -- 高亮搜索结果
o.incsearch = true -- 实时搜索
opt.ignorecase = true -- 默认忽略大小写
opt.smartcase = true -- 包含大写时开启大小写敏感

-- =========================
-- ✅ 折叠配置
-- =========================
o.foldcolumn = '1'
o.foldlevel = 99 -- 默认展开所有折叠
o.foldlevelstart = 99
o.foldenable = true
o.fillchars = 'eob: ,fold: ,foldopen:,foldsep: ,foldinner: ,foldclose:'

-- =========================
-- ✅ 操作习惯
-- =========================
o.mouse = 'a' -- 启用鼠标
opt.splitright = true -- 默认右分屏
opt.splitbelow = true -- 默认下分屏
opt.confirm = true -- 确认弹窗
opt.inccommand = 'split' -- 替换预览分屏

-- =========================
-- ✅ 性能优化
-- =========================
opt.updatetime = 250 -- CursorHold 触发延迟
opt.timeoutlen = 300 -- 键位等待时长

-- =========================
-- ✅ 剪贴板（延迟设置兼容性最佳）
-- =========================
vim.schedule(function()
  opt.clipboard = 'unnamedplus' -- 使用系统剪贴板
end)
