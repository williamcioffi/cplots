
x <- rnorm(500)
y <- rnorm(500)

plot(x, y, axes = FALSE, xlab = "", ylab = "")
p.usr <- par()$usr
p.yaxp <- par()$yaxp
p.xaxp <- par()$xaxp

axis(1, xaxp = c(p.usr[1], p.xaxp[2], p.xaxp[3]), labels = FALSE, tcl = 0)
axis(1)

axis(2, yaxp = c(p.usr[3], p.yaxp[2], p.yaxp[3]), labels = FALSE, tcl = 0)
axis(2)