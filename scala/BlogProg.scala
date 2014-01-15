import math._ // "_" is Scala's way of saying "*"

abstract class Tree
case class Sum(l: Tree, r: Tree) extends Tree
case class Sqrt(a: Tree) extends Tree
case class Mult(l: Tree, r: Tree) extends Tree
case class Var(n: String) extends Tree

object HelloBlog {
    def main(args: Array[String]) {
        type Environment = String => Int
        val my_env: Environment = { case "x" => 4
                                    case "y" => 3}

        val my_tree: Tree = Sqrt(Sum(Mult(Var("x"), Var("x")), Mult(Var("y"), Var("y"))))
        println("Sqrt(x^2 + y^2) = " + eval(my_tree, my_env))
    }

    def eval(tree: Tree, env: String => Int): Double = tree match {
        case Sum(l, r) => eval(l, env) + eval(r, env)
        case Sqrt(a) => sqrt(eval(a, env))
        case Mult(l, r) => eval(l, env) * eval(r, env)
        case Var(n) => env(n)
    }
    
}