cplot <- function(y = list(y1 = rnorm(100), y2 = rnorm(100, mean = 2), y3 = rnorm(100, mean = -3)), rug = TRUE, zero = TRUE) {

n <- length(y)
d <- lapply(y, density)

# ys <- unlist(lapply(d, function(l) l$y))
xs <- unlist(lapply(d, function(l) l$x))
minx <- min(xs)
maxx <- max(xs)
miny <- 0
maxy <- n
yscale = 0.9
ylevels <- 0:(n-1)

indscale <- unlist(lapply(d, function(l) yscale / max(l$y)))

plot(0, 0, xlab = "", ylab = "", axes = FALSE, xlim = c(minx, maxx), ylim = c(miny, maxy ), type = 'n')

if(zero == TRUE) abline(v = 0, lty = 2, col = "grey")
abline(h = ylevels, lty = 3, col = "grey")

for(i in 1:n) {
	lines(d[[i]]$x, d[[i]]$y * indscale[i] + ylevels[i])
}

axis(1)
if(!is.null(names(d))) {
	axis(2, at = ylevels, labels = names(d), tick = FALSE, las = 1)
} else {
	labs <- paste("y", 1:n, sep = "")
	axis(2, at = ylevels, labels = labs, tick = FALSE, las = 1)
}

if(rug == TRUE) {
	for(i in 1:n) {
		rug(y[[i]], pos = ylevels[i] - 0.05)
	}
}

}