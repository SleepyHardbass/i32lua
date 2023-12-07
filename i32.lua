local band, bnot, bor, bxor, bsar; do
    local bit = require("bit")
    band = bit.band
    bnot = bit.bnot
    bor = bit.bor
    bxor = bit.bxor
    bsar = bit.arshift
end
return {
    add = function(x, y) return bor(x + y) end, -- add (not addsd)
    sub = function(x, y) return bor(x - y) end, -- add (not subsd)
    eq = function(x, y) return bxor(x, y) == 0 end,
    max = function(x, y) return math.max(bor(x), bor(y)) end, -- cmp, cmovl
    min = function(x, y) return math.min(bor(x), bor(y)) end, -- cmp, cmovg
    odd = function(x) return band(x, 0x00000001) ~= 0 end,
    unm = function(x) return bnot(x + 0xffffffff) end,
    abs = function(x) local m = bsar(x, 31) return bxor(x + m, m) end,
    sign = function(x) return band(x, 0x80000000) ~= 0 end
}
