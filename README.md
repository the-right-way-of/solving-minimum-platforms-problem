# solving-minimum-platforms-problem

### The problem

Given the times of arrival and departure of trains from a station, calculate the minimum number of stations required to support the traffic.

e.g. arr = [09:00, 10:00, 12:00, 14:00, 08:00]
     dep = [10:15, 12:30, 14:30, 16:00, 10:30]
As we can see that minimum required stations in this case would be 3

### How?

09:00-10:15
10:00-12:30
08:00-10:30

All three are on the platform at the same time which is between 10:00-10:15
In order to cater to all three trains for 15 minutes, you need 3 platforms.

### How to calculate?

This problem can be solved by using different approaches. Code is present in the repository.

### Feel free to leave comments/PRs
