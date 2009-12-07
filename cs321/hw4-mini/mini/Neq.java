package mini;

import compiler.Failure;

/** Abstract syntax for inequality test expressions (==).
 */
class Neq extends BinEqualityExpr {
    Neq(Expr left, Expr right) {
        super(left, right);
    }

    /** Return a string that provides a simple description of this
     *  particular type of operator node.
     */
    String label() { return "Neq, !="; }
}
