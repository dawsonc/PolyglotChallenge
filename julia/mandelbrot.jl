# For calculating the set
function julia(z, maxiter::Int64)
    c=z
    for n = 1:maxiter
        if abs(z) > 2
            return n-1
        end
        z = z^2 + c
    end
    return maxiter
end

# For drawing the picture
function myppmwrite(img, file::String)
    s = open(file, "w")
    write(s, "P6\n")    
    n, m = size(img)
    write(s, "$m $n 255\n")
    for i=1:n, j=1:m
        p = img[i,j]
        write(s, uint8(p))
        write(s, uint8(p))
        write(s, uint8(p))
    end
    close(s)
end

# Screen dimensions
h = 500
w = 1000
m = Array(Int64, h, w)

for y=1:h, x=1:w
  x1 = (x - w/2)/(h/2)
  y1 = (y - h/2)/(w/2)
  c = complex(x1, y1)

  m[y, x] = julia(c, 256)
end

myppmwrite(m, "julia.ppm")