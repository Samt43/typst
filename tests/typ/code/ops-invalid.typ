// Test invalid expressions.
// Ref: false

---
// Missing expressions.

// Error: 3 expected expression
{-}

// Error: 10 expected expression
#test({1+}, 1)

// Error: 10 expected expression
#test({2*}, 2)

---
// Mismatched types.

// Error: 2-12 cannot apply '+' to template
{+([] + [])}

// Error: 2-5 cannot apply '-' to string
{-""}

// Error: 2-8 cannot apply 'not' to array
{not ()}

// Error: 2-12 cannot apply '<=' to relative and relative
{30% <= 40%}

// Special messages for +, -, * and /.
// Error: 03-10 cannot add integer and string
// Error: 12-19 cannot subtract integer from relative
// Error: 21-29 cannot multiply integer with boolean
// Error: 31-39 cannot divide integer by length
{(1 + "2", 40% - 1, 2 * true, 3 / 12pt)}

// Error: 14-22 cannot apply '+=' to integer and string
{ let x = 1; x += "2" }

// Error: 13-14 expected argument list, found integer
{ test with 2 }

// Error: 3-4 expected function, found integer
{ 1 with () }

// Error: 3-10 cannot apply '..' to integer and string
{ 1 .. "" }

---
// Bad left-hand sides of assignment.

// Error: 3-6 cannot assign to this expression
{ (x) = "" }

// Error: 3-8 cannot assign to this expression
{ 1 + 2 += 3 }

// Error: 3-4 unknown variable
{ z = 1 }

// Error: 3-7 cannot assign to a constant
{ rect = "hi" }

// Works if we define rect beforehand
// (since then it doesn't resolve to the standard library version anymore).
#let rect = ""
{ rect = "hi" }