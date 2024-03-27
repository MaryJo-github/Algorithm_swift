import heapq
import sys
input = sys.stdin.readline

N = int(input())
array = []
for _ in range(N):
    heapq.heappush(array, int(input()))

result = 0
while array:
    if len(array) == 1:
        break
    x = heapq.heappop(array)
    y = heapq.heappop(array)
    result += x + y
    heapq.heappush(array, x + y)

print(result)