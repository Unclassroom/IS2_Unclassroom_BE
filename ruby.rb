require 'date'

ini = DateTime.new(2018,5,12,4,5,6)
fin = DateTime.new(2018,5,12,4,7,6)

p ((fin - ini) * 24 * 60).to_i


#if d.wday == -1
