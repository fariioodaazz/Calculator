using System;

namespace Calculator
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Basic Calculator");
            Console.WriteLine("----------------\n");

            do
            {
                Console.WriteLine("Please enter two numbers and an operator to perform a calculation.\n");
                Console.WriteLine("Enter the first number: ");
                string input1 = Console.ReadLine();
                double num1 = CheckNumber(input1);
                Console.WriteLine("Enter the second number: ");
                string input2 = Console.ReadLine();
                double num2 = CheckNumber(input2);

                string op = GetValidOperator();

                double result = 0;

                if (op == "+")
                {
                    result = Add(num1, num2);
                }
                else if (op == "-")
                {
                    result = Subtract(num1, num2);
                }
                else if (op == "*")
                {
                    result = Multiply(num1, num2);
                }
                else if (op == "/")
                {
                    result = Divide(num1, num2);
                }

                Console.WriteLine("Result = " +result);

            } while (AskToContinue());

            Console.WriteLine("Goodbye!");
        }

        static string GetValidOperator()
        {
            while (true)
            {
                Console.WriteLine("Enter the operator: ");
                Console.WriteLine("+ for addition");
                Console.WriteLine("- for subtraction");
                Console.WriteLine("* for multiplication");
                Console.WriteLine("/ for division");

                string op = Console.ReadLine().Trim();

                if (op == "+" || op == "-" || op == "*" || op == "/")
                {
                    return op;
                }
                else
                {
                    Console.WriteLine("Invalid operator. Please try again.");
                }
            }
        }

        static bool AskToContinue()
        {
            while (true)
            {
                Console.WriteLine("\nWould you like to perform another calculation? (Y/N)");
                string input = Console.ReadLine().ToUpper();

                if (input == "Y")
                {
                    return true;
                }
                else if (input == "N")
                {
                    return false;
                }
                else
                {
                    Console.WriteLine("Didn't understand operation, try again.");
                }
            }
        }

        static double CheckNumber(string input)
        {
            while (!double.TryParse(input, out double num))
            {
                Console.Write("Invalid input. Please enter a valid number: ");
                input = Console.ReadLine();
            }
            return double.Parse(input);
        }

        static double Add(double num1, double num2) {
            return num1 + num2;
        }

        static double Subtract(double num1, double num2) {
            return num1 - num2;
        }
        static double Multiply(double num1, double num2)
        {
            return num1 * num2;
        }

        static double Divide(double num1, double num2)
        {
            while (num2 ==0)
            {
                Console.Write("Can not divide by zero. Please enter a valid number: ");
                string input = Console.ReadLine();
                num2 = CheckNumber(input);
                Divide(num1, num2);
            }
            return num1 / num2;
        }
    }
}
