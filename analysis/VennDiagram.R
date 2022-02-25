# load Venn diagram package
library("VennDiagram")
library(tidyverse)
library(plotrix)

# move to new plotting page
grid.newpage()

# create Venn diagram with four sets
draw.pairwise.venn(area1=5000, area2=4000, cross.area=432+192,
               category=c("Green Tea","Plasma"),
               fill=c("Green","Red"))
#new page
grid.newpage()

draw.pairwise.venn(area1=432, area2=192, cross.area=0,
                   category=c("Lipids","Aqueous"),
                   fill=c("Yellow","Blue"))

# Lipids venn diagram
# tbh I just ripped this off https://stackoverflow.com/questions/42264951/how-to-adjust-the-position-of-circles-when-plotting-venn-diagram
area1 = 432 
area2 = 67
area3 = 2
r1 = round(sqrt(area1/pi))
r2 = round(sqrt(area2/pi))
r3 = round(sqrt(area3/pi))
xc = 8
yc = 8
plot(0:40,0:40,type="n",xlab="",ylab="",main="Lipid compounds", xaxt='n', yaxt='n')
draw.circle(xc+r1,yc+r1,r1,border="black", col="Yellow",lty=1,lwd=1)
draw.circle(xc+2*r1-r2,yc+r1,r2,border="black", col="White",lty=1,lwd=1)
draw.circle(xc+2*r1-r3,yc+r1,r3, border="black", col="Grey", lty=1, lwd=1)
text(xc+(r1-r2)/2+1,yc+r1, area1, cex=4) 
text(xc+2*r1-r2,yc+r1, area2, cex=3)  
text(xc+2*r1-r3,yc+r1, area3, cex=2) 


# Aqueous
area1 = 192 
area2 = 20
area3 = 7
r1 = round(sqrt(area1/pi))
r2 = round(sqrt(area2/pi))
r3 = round(sqrt(area3/pi))
xc = round(sqrt(area1/pi))
yc =round(sqrt(area1/pi))
plot(0:32,0:32,type="n",xlab="",ylab="",main="Aqueous compounds", xaxt='n', yaxt='n')
draw.circle(xc+r1,yc+r1,r1,border="black", col="Yellow",lty=1,lwd=1)
draw.circle(xc+2*r1-r2,yc+r1,r2,border="black", col="White",lty=1,lwd=1)
draw.circle(xc+2*r1-r3,yc+r1,r3, border="black", col="Grey", lty=1, lwd=1)
text(xc+(r1-r2)/2+1,yc+r1, area1, cex=4) 
text(xc+2*r1-r2-1,yc+r1, area2, cex=2.5)  
text(xc+2*r1-r3,yc+r1, area3, cex=2) 