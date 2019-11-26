using System.Threading;

namespace HelloWorld
{
    internal class Program
    {
        private static void Main()
        {
            while (true)
            {
                Thread.Sleep(10);
            }

            // ReSharper disable once FunctionNeverReturns
        }
    }
}