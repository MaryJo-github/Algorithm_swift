from collections import deque

N = int(input())
D = deque(list(range(1,N+1)))

for i in range(N):
    if len(D) == 1:
        break
    D.popleft()
    if len(D) == 1:
        break
    a = D.popleft()
    D.append(a)

result = D.pop()
print(result)