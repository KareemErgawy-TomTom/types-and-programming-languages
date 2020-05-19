// Basic counter object generator:
newCounter = l _:Unit. let x = ref succ 0 in {get = l _:Unit. !x, inc = l _:Unit. x := succ(!x)}

// Generate an object and play with it:
c1 = newCounter unit
c1.inc unit
(c1.inc unit; c1.inc unit; c1.get unit)

// Generate another object and play with it:
c2 = newCounter unit
c2.get unit

// Increments counter objects 3 times in a raw:
inc3 = l c:{get:Unit -> Nat, inc:Unit -> Unit}. (c.inc unit; c.inc unit; c.inc unit)

// Apply inc3 to counter objects:
(inc3 c1; c1.get unit)

inc3 c2
c2.get unit

// An reset counter object whose type is a sub-type of objects generated by newCounter:
newResetCounter = (l _:Unit. (let x = ref succ 0 in {get = l _:Unit. !x, inc = l _:Unit. x := succ(!x), reset = l _:Unit. x := succ 0}))

// Generate reset counter object and play with it:
rc1 = newResetCounter unit
(inc3 rc1; rc1.reset unit; inc3 rc1; rc1.get unit)

// Group instance variable(s) is a record of reference cells:
c = let r = {x = ref succ 0} in {get = l _:Unit. !(r.x), inc = l _:Unit. r.x := succ(!r.x)}