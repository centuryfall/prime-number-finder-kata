# prime-number-finder-kata
This is the final version of the project.
This is a TDD-based approach to finding a prime number input by a user using RSpec and Ruby.

A user can input a range of integers in either direction (ex. from 0-100 or 100-0, negative ranges, negative to positive ranges) and have the program output which of those numbers are prime numbers.

RUN:
1. Open the project folder
2. Go into the folder 'lib'
3. Run the file named 'main.rb'
4. Enter two integer values when asked.
5. The program will execute and display an array of prime numbers then close after 5 seconds.

Updates: 10/24/2018 1:15PM: Created 10/29/2018 12:17PM: Added the methods, test cases, etc. 1
0/29/2018 12:28PM: Updates to main methods. Moving to ConsolePrinter now. 
10/29/2018 1:36PM: Found issue with Big-O time. Refactored this and changed around methods to only iterate when a number's divisors array has a length less than 2.
10/29 8:57PM: Finalized the project.


Help from:
https://stackoverflow.com/a/37330629 for testing RSpec with example console inputs
