from collections import deque

N, L = map(int, input().split())
D = list(map(int, input().split()))
minQue = deque([])

for n in range(N):
    while minQue and minQue[-1][1] > D[n] :
        minQue.pop()
    minQue.append((n, D[n]))
    if minQue[0][0] == n-L:
        minQue.popleft()
    print(minQue[0][1], end = " ")