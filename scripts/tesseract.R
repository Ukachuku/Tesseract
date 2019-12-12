install.packages("pdftools")
install.packages("tesseract")
install.packages("OpenImageR")

library(tesseract)
library(pdftools)
library(OpenImageR)

path <- 'filepath'

convertpdf <- list.files(pattern = "\\.pdf$")

for (i in 1:length(convertpdf)) {
  unlist(pdftools::pdf_convert(pdf = convertpdf[i], format = 'tiff', pages = 1, dpi = 400))
}

orig <- pdftools::pdf_text("pdffiles2text")[1]

img_file <- pdftools::pdf_convert("pdffile2convert", format = 'tiff', pages = 1, dpi = 400)
text <- ocr(img_file)
cat(text)

setwd("setwd")
orig <- pdftools::pdf_text("pdffiles2text")[1]
img_file <- pdftools::pdf_convert("pdffiles2convert", format = 'tiff', pages = 1, dpi = 400)
text <- ocr(img_file)
cat(text)

####################################OpenImageR Changing color to grayscale and rotation of files##########################################################################################

img <- readImage("readtifffile")

OpenImageR::imageShow(img)
imgrotate <- OpenImageR::rotateFixed(img, angle = 90)
r2g <- OpenImageR::rgb_2gray(img)
OpenImageR::writeImage(r2g, file_name = "r2g.tiff")
text <- tesseract::ocr("tiff2ocr")
cat(text)
