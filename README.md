# solving-minimum-platforms-problem

### The problem

Given the times of arrival and departure of trains from a station, calculate the minimum number of stations required to support the traffic.

e.g.
```
arr = [09:00, 10:00, 12:00, 14:00, 08:00]
dep = [10:15, 12:30, 14:30, 16:00, 10:30]
```
As we can see that minimum required stations in this case would be 3

### How?

```
09:00-10:15
10:00-12:30
08:00-10:30
```
All three are on the platform at the same time which is between ```10:00-10:15```
In order to cater to all three trains for 15 minutes, you need 3 platforms.

### How to calculate?

This problem can be solved by using different approaches. Code is present in the repository.

### Can we extend the problem?
Of course:

1. How many different times are those in a day where there are more than 1 trains on the station?
2. What are these different time durations for which multiple trains are present on the station?
3. Which trains should be rescheduled by how much time to reduce platform requirement by 1?


### Feel free to leave comments/PRs
