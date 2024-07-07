function love.load()
    --dépendances
    require("collision")
    --changer la seed pour l'aléatoire
    math.randomseed(os.time())
    --charger l'arrière plan
    bg = love.graphics.newImage("assets/fond.png")
    --player
    player={}
    player.img=love.graphics.newImage("assets/player.png")
    player.x=128
    player.y=256
    player.vie=3
    --monstre
    monstre={}
    monstre.img= love.graphics.newImage("assets/enemie.png")
    monstre.x=900
    monstre.y=love.math.random(100, 600)
    timer = 0
end
function love.update(dt)
    if collid(player.x, player.y, 128, 128, monstre.x, monstre.y, 128, 128) then
        player.vie=player.vie-1
        monstre.x=1080
        monstre.y=math.random(100, 600)
        if player.vie==0 then
            print("le joueur est mort")
            love.event.quit()
        end
    end
    move_player()
    move_monstre()

    timer=timer + dt

end
function love.draw()
    font = love.graphics.newFont("pico-8.ttf", 22)
    love.graphics.setFont(font)
    --afficher l'arrière plan
    love.graphics.draw(bg, -500, -300)
    --afficher le joueur
    love.graphics.draw(player.img, player.x, player.y)
    --afficher le monstre
    love.graphics.draw(monstre.img,monstre.x, monstre.y)
    --afficher les vies
    love.graphics.print("vie : "..player.vie)
    --afficher le score
    love.graphics.print("score : "..timer, 870, 20)
end
function move_player()
    if player.y<1080 then
        if player.y>0 then
            if love.keyboard.isDown('up') then
                player.y = player.y-5
            else
                player.y=player.y+2
            end
        else
            player.y=player.y+5
        end
    else
        player.y=player.y-5
    end
end
function move_monstre()
    monstre.x=monstre.x-3
    if monstre.x+128<=0 then
        monstre.x=1080
        monstre.y=math.random(100, 600)
    end
end