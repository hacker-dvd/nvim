-- wsl下使用系统剪切板
-- 需要先安装xclip
vim.g.clipboard = {
	name = 'WslClipboard',
	copy = {
		["+"] = 'clip.exe',
		["*"] = 'clip.exe',
	},
	paste = {
		["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
	},
	cache_enabled = 0,
}
