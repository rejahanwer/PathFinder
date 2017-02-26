# PathFinder
iOS App written in Swift to compute the least cost path across a 2D Grid.

App computes the least cost path across a grid using dynamic programming.

Usage:
--
Enter the grid into the input textview in the format: 
Rows (1-10) seperated by new line, 
Columns (5-100) seperated by single space.

Eg:

1 2 3 4 5

2 3 4 5 6

4 5 6 7 8

Ouput is shown in the format:

Yes/No

Cost

Path

Algorithm: Optimized recursive backtracking.
--

Given a grid of rows between 1-10 and columns between 5-100, 
the algorithm populates a temporary grid of same size with minimum costs for each grid item. 
By doing this, we avoid repeated computation of cost for the same element which happens in simple dynamic programmed recursion.

After this, the algorithm backtracks from the least cost item in the last column to find the path.

If no item exist in the last column with cost <= 50, then there is no valid path in the grid.

To get the failing path, the algorithm backtracks until the cost <= 50, then backtracks to get the failing path.

Time Complexity for the algorithm: O (M x N), where M = Num of Rows, N = Num of Columns.

Space Complexity for the algorithm: O (M x N).
