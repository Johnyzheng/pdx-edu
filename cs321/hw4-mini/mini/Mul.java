package mini;

import compiler.Failure;

/** Abstract syntax for multiply expressions.
 */
class Mul extends BinArithExpr {
    Mul(Expr left, Expr right) {
        super(left, right);
    }

    /** Return a string that provides a simple description of this
     *  particular type of operator node.
     */
    String label() { return "Mul, *"; }
}
