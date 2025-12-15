-- local mat, val = Material('overlays/vignette01'), 0
-- hook.Add('HUDPaint', 'dbgWeapons.suppression', function()
--     val = LocalPlayer():GetNWInt("EffectAMT")
--     if val < 0.05 then return end

--     mat:SetFloat('$alpha', val)

--     render.SetMaterial(mat)
--     render.DrawScreenQuad()

--     surface.SetDrawColor(0, 0, 0, 150 * val)
--     surface.DrawRect(0, 0, ScrW(), ScrH())
-- end)