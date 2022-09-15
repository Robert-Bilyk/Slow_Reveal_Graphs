library(magick)

segments(x0=0,y0=760, x1=100, y1=200, lwd = 1, lty = "solid")



original <- image_read(here::here("Continued Plot Work", "Increase of White and Negro Elements", "Original Image.png"))

#Final Graph
image_write(original, path = here::here("Continued Plot Work", "Increase of White and Negro Elements", "Final-IncreaseWNE.png"), format = "png")


#Concealed Graph
img <- image_draw(original)

#title and subtitle
polygon(c(545, 150, 150, 545), c(80, 80, 120, 120), border = "red", col = "#fcf5e5")
polygon(c(645, 50, 50, 645), c(70, 70, 10, 10), border = "red", col = "#fcf5e5")

#yaxis
polygon(c(10, 62, 62, 10), c(585, 585, 160, 160), border = "red", col = "#fcf5e5")

#xaxis
polygon(c(665, 50, 50, 665), c(595, 595, 610, 610), border = "red", col = "#fcf5e5")

#small figures
polygon(c(80, 300, 300, 80), c(280, 280, 340, 340), border = "red", col = "#fcf5e5")

#supression 
polygon(c(190, 170, 170, 190), c(515, 515, 375, 375), border = "red", col = "#fcf5e5")

#european
polygon(c(410, 365, 365, 410), c(200, 200, 320, 320), border = "red", col = "#fcf5e5")

#emancipation
polygon(c(490, 510, 510, 490), c(200, 200, 290, 290), border = "red", col = "#fcf5e5")

dev.off()

image_write(img, path = here::here("Continued Plot Work", "Increase of White and Negro Elements", "1-Concealed-IncreaseWNE.png"), format = "png")
