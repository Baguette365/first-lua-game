function love.conf(w)
    --titre de la feunetre
    w.title = "feunetre love tres soigné"
    --taille de la feunetre
    w.window.width=1080 --1024
    w.window.height=720 --768
    --version de mon love
    w.version=11.5
    -- désactive la console de débugging
    w.console = false
    --charger un icon pour la faunetre
    w.window.icon="icon.png"
    --rend la taille de la feunetre fixe
    w.window.resizable = false
    --désactive le pleine écran
    w.window.fullscreen=false
    --garde les bordure (la petite bar en haut pour fermer réduire et le titre du jeu)
    w.window.borderless=false
end