import pygame as pg

y, step, head = segments = [15, 16, 17]
n, apple = step, 99
screen = pg.display.set_mode([225] * 2)  # Ajustar el tamaño de la ventana
screen_fill = screen.fill

while segments.count(head) % 2 * head % n * (head & 240):
    if (e := pg.event.get(768)):
        step = (e[0].key % 4 * 17 + 15) % 49 - n
    segments = segments[apple != head:] + [head + step]

    screen_fill((0, 0, 0))
    if apple == head:
        apple = segments[0]
    for i, v in enumerate([apple] + segments):
        color = (0, 255, 0) if i else (255, 0, 0)
        rect = ((v - 1) % n * y, (v - n) // n * y, y, y)
        pg.draw.rect(screen, color, rect)
    pg.display.flip()
    head += step
    pg.time.wait(100)