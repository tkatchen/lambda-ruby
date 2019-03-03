### Number definitions
ZERO  = -> s { -> z {           z      } }
ONE   = -> s { -> z {         s[z]     } }
TWO   = -> s { -> z {       s[s[z]]    } }
THREE = -> s { -> z {     s[s[s[z]]]   } }
FIVE  = -> s { -> z { s[s[s[s[s[z]]]]] } }

### Maths
POWER     = -> a { -> b { b[a] } }
# This isn't the expanded out formula, it is the inbetween step = λyx.y((λsz.s(z))yx)
SUCCESSOR = -> w { -> y { -> x { y[w[y][x]] } } }
ADD = -> a { -> b { a[SUCCESSOR][b]}}

### Functions to actually view the numbers n stuff
def viewNumber(proc)
  proc[-> n { n + 1 }][0]
end

print(viewNumber(
  -> a { -> b { b[a] } }[-> s { -> z { s[s[z]] } }][-> s { -> z { s[s[s[s[s[z]]]]] } }]
))
# That equals
print(viewNumber(
  POWER[TWO][FIVE]
))
# Both print 32
