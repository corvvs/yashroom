
def main():
    b64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    d = [0] * 128
    for i, c in enumerate(b64):
        d[ord(c)] = i

    color = 0
    s = input()
    n = len(s) // 4
    sq = int(n ** 0.5)
    print("image received, nb pixels : ", n)
    print("found square :", sq)

    for i, c in enumerate(s):
        color = color << 6 | d[ord(c)]
        if (i+1) % 4 == 0:
            print("\x1b[48;2;%d;%d;%dm  \x1b[0m" % (color >> 16 & 0xff, color >> 8 & 0xff, color & 0xff), end="\n"[:(i//4+1)%sq == 0])
            color = 0


if __name__ == '__main__':
    main()
