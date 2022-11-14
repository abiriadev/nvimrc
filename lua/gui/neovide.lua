vim.g.neovide_floating_blur_amount_x = 5.0
vim.g.neovide_floating_blur_amount_y = 5.0

-- vim.g.neovide_transparency = 0.8

vim.g.neovide_remember_window_size = 1
-- vim.g.neovide_fullscreen = 1

vim.g.neovide_hide_mouse_when_typing = true
-- vim.g.neovide_profiler = 1

-- vim.g.neovide_cursor_animation_length = 0.01 --0.13
-- vim.g.neovide_cursor_trail_size = 0.7

vim.g.neovide_cursor_vfx_mode = 'railgun'

vim.g.neovide_cursor_vfx_opacity = 1000 --300
vim.g.neovide_cursor_vfx_particle_density = 300
vim.g.neovide_cursor_vfx_particle_curl = 0
vim.g.neovide_cursor_vfx_particle_lifetime = 0.4
vim.g.neovide_cursor_vfx_particle_phase = 0

vim.cmd [[
let g:neovide_scale_factor=1.0
function! ChangeScaleFactor(delta)
    let g:neovide_scale_factor = g:neovide_scale_factor * a:delta
endfunction
nnoremap <expr><C-=> ChangeScaleFactor(1.25)
nnoremap <expr><C--> ChangeScaleFactor(1/1.25)
]]
