local ScrW = ScrW()
X = ScrW * 1.02
surface.CreateFont('XVIDEOS FONT', { font = 'Verdana', size = 64, antialias = false, shadow = true } )
local colorWatemark = Color( 232, 232, 232, 235)
hook.Add('HUDPaint', 'WWW.XVIDEOS.COM', function()
    X = - ScrW * .8 >= X and math.Approach(ScrW * 1.1, - ScrW * .8, 1) or math.Approach(X, -ScrW * .9, 1)
    draw.SimpleText('This video was uploaded to WWW.XVIDEOS.COM', 'XVIDEOS FONT', X, 10, colorWatemark)
end)
