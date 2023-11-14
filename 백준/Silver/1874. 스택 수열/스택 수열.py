N = int(input())
nArray = [int(input()) for _ in range(N)]
stack = []
last = 0
result = []

for n in range(N):
    while stack == [] or stack[-1] < nArray[n]:
        last += 1
        stack.append(last)
        result.append("+")
    
    if stack[-1] != nArray[n]:
        result = ["NO"]
        break

    stack.pop()
    result.append("-")

for r in result:
    print(r)
