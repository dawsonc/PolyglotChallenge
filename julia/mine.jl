# Create and plot Taylor expansions of varying degree of sin(x) centered around x = 0

using Winston

x = linspace(-3pi, 3pi, 100)

coeffs = [1, -1/6, 1/120] # I'm skipping some

p = FramedPlot(title="Taylor Expansions of sin(x)", yrange=(-1.5, 1.5))

# Actual sin(x)
add(p, Curve(x, sin(x), color="black"))

# 1st degree
c1 = coeffs[1]*x

# 3rd degree
c3 = coeffs[1]*x + coeffs[2]*[a^3 for a in x]

# 5rd degree
c5 = coeffs[1]*x + coeffs[2]*[a^3 for a in x] + coeffs[3]*[a^5 for a in x]

add(p, Curve(x, c1, color="red"))
add(p, Curve(x, c3, color="blue"))
add(p, Curve(x, c5, color="green"))