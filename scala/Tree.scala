
abstract class Tree
case class Sum(l: Tree, r: Tree) extends Tree
case class Var(n: String) extends Tree
case class Const(v: Int) extends Tree

object TreeRunner {
    def main(args: Array[String]) {
        println eval((Sum(Sum(Var(x), Const(5)), Const(7))), {case "x" => 1})
    }

    def eval(t: Tree, env: String => Int): Int = t match {
        case Sum(l, r) => eval(l, env) + eval(r, env)
        case Var(n)    => eval(n)
        case Const(v)  => v
    }
    
}