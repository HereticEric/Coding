import pygame
import sys
import time
import random
pygame.font.init()
#Asteroid Dodging Game

WIDTH, HEIGHT, = 1000, 800
WIN = pygame.display.set_mode((WIDTH, HEIGHT))
pygame.display.set_caption("Asteroid Dodger!")

#Set Background for the game
BG = pygame.transform.scale(pygame.image.load("Space.jpeg"), (WIDTH, HEIGHT))
#Player * Asteroid Variables
PLAYER_WIDTH = 60
PLAYER_HEIGHT = 60
PLAYER_VEL = 6
ASTEROID_WIDTH = 10
ASTEROID_HEIGHT = 20
ASTEROID_VEL = 3
#Font for the time counter
FONT = pygame.font.SysFont("comicsans", 30)

#Draw the BG, player, timer, & asteroids
def draw(player_img, player, elapsed_time, asteroids):
    WIN.blit(BG, (0, 0))
    WIN.blit(player_img, (player.x, player.y))

    for asteroid in asteroids:
        pygame.draw.rect(WIN, "grey", asteroid)

    time_text = FONT.render(f"Time: {round(elapsed_time)}s", 1, "white")
    WIN.blit(time_text, (10, 10))
    pygame.display.update()

def main():
    run = True
    #Variables for the game, & the timer
    player_img = pygame.transform.scale(pygame.image.load("spaceship.png"), (PLAYER_WIDTH, PLAYER_HEIGHT))
    player = pygame.Rect(200, HEIGHT - PLAYER_HEIGHT, PLAYER_WIDTH, PLAYER_HEIGHT)
    clock = pygame.time.Clock()
    start_time = time.time()
    elapsed_time = 0



    #Add in the asteroids
    asteroid_add_increment = 2000
    asteroid_count = 0
    asteroids = []
    hit = False


    while run:
       #Set up framerate limit for game
        asteroid_count += clock.tick(60)
        elapsed_time = time.time() - start_time

        if asteroid_count > asteroid_add_increment:
            for _ in range(4):
                asteroid_x = random.randint(0, WIDTH - ASTEROID_WIDTH)
                asteroid = pygame.Rect(asteroid_x, -ASTEROID_HEIGHT, ASTEROID_WIDTH, ASTEROID_HEIGHT)
                asteroids.append(asteroid)

            asteroid_add_increment = max(200, asteroid_add_increment - 50)
            asteroid_count = 0

        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                run = False
                break
#Setup controls for the game & setup boundary so players cannot go off screen
        keys = pygame.key.get_pressed()
        if keys[pygame.K_LEFT] and player.x - PLAYER_VEL >= 0:
            player.x -= PLAYER_VEL
        if keys[pygame.K_RIGHT] and player.x + PLAYER_VEL + player.width <= WIDTH:
            player.x += PLAYER_VEL
        if keys[pygame.K_UP] and player.y - PLAYER_VEL >= 0:
            player.y -= PLAYER_VEL
        if keys[pygame.K_DOWN] and player.y + PLAYER_VEL + player.height <= HEIGHT:
            player.y += PLAYER_VEL

        for asteroid in asteroids[:]:
            asteroid.y += ASTEROID_VEL
            if asteroid.y > HEIGHT:
                asteroids.remove(asteroid)
            elif asteroid.y + asteroid.height >= player.y and asteroid.colliderect(player):
                asteroids.remove(asteroid)
                hit = True
                break

        #Create the game over 
        if hit:
            lost_text = FONT.render("GAME OVER", 1, "red")
            WIN.blit(lost_text, (WIDTH/2 - lost_text.get_width()/2, HEIGHT/2 - lost_text.get_height()/2))
            pygame.display.update()
            pygame.time.delay(4000)
            break

        draw(player_img, player, elapsed_time, asteroids)

    pygame.quit()

if __name__ == "__main__":
    main()


