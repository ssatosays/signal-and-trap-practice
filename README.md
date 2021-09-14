# signal-and-trap-practice
This repo is for signal and trap practice.

## 1. シグナル

### 使用可能なシグナルの一覧

```
$ kill -l
 1) SIGHUP       2) SIGINT       3) SIGQUIT      4) SIGILL       5) SIGTRAP
 6) SIGABRT      7) SIGBUS       8) SIGFPE       9) SIGKILL     10) SIGUSR1
11) SIGSEGV     12) SIGUSR2     13) SIGPIPE     14) SIGALRM     15) SIGTERM
16) SIGSTKFLT   17) SIGCHLD     18) SIGCONT     19) SIGSTOP     20) SIGTSTP
21) SIGTTIN     22) SIGTTOU     23) SIGURG      24) SIGXCPU     25) SIGXFSZ
26) SIGVTALRM   27) SIGPROF     28) SIGWINCH    29) SIGIO       30) SIGPWR
31) SIGSYS      34) SIGRTMIN    35) SIGRTMIN+1  36) SIGRTMIN+2  37) SIGRTMIN+3
38) SIGRTMIN+4  39) SIGRTMIN+5  40) SIGRTMIN+6  41) SIGRTMIN+7  42) SIGRTMIN+8
43) SIGRTMIN+9  44) SIGRTMIN+10 45) SIGRTMIN+11 46) SIGRTMIN+12 47) SIGRTMIN+13
48) SIGRTMIN+14 49) SIGRTMIN+15 50) SIGRTMAX-14 51) SIGRTMAX-13 52) SIGRTMAX-12
53) SIGRTMAX-11 54) SIGRTMAX-10 55) SIGRTMAX-9  56) SIGRTMAX-8  57) SIGRTMAX-7
58) SIGRTMAX-6  59) SIGRTMAX-5  60) SIGRTMAX-4  61) SIGRTMAX-3  62) SIGRTMAX-2
63) SIGRTMAX-1  64) SIGRTMAX
```

### 各キーでのシグナル

```
$ stty -a
speed 38400 baud; rows 51; columns 135; line = 0;
intr = ^C; quit = ^\; erase = ^?; kill = ^U; eof = ^D; eol = <undef>; eol2 = <undef>; swtch = <undef>; start = ^Q; stop = ^S; susp = ^Z;
rprnt = ^R; werase = ^W; lnext = ^V; discard = ^O; min = 1; time = 0;
-parenb -parodd -cmspar cs8 -hupcl -cstopb cread -clocal -crtscts
-ignbrk -brkint -ignpar -parmrk -inpck -istrip -inlcr -igncr icrnl ixon -ixoff -iuclc -ixany -imaxbel -iutf8
opost -olcuc -ocrnl onlcr -onocr -onlret -ofill -ofdel nl0 cr0 tab0 bs0 vt0 ff0
isig icanon iexten echo echoe echok -echonl -noflsh -xcase -tostop -echoprt echoctl echoke -flusho -extproc
```

## 2. サンプル

+ `signal.sh`を実行

```
$ ./signal.sh
```

+ PID / PPID

```
$ ps -aef |grep -v grep |grep signal
ssatosa+  2018   365  0 13:44 pts/2    00:00:00 /bin/bash ./signal.sh
```

```
$ ps -aef |grep -v grep |grep 365
ssatosa+   365   364  0 11:27 pts/2    00:00:00 -bash
ssatosa+  2018   365  0 13:44 pts/2    00:00:00 /bin/bash ./signal.sh
```

+ `signal.sh`のターミナルからの`SIGINT`(キーボードからの割り込み)`Ctrl + C`をハンドル

```
sleeping...
sleeping...
^CSIGINT
sleeping...
```

+ 別ターミナルから`SIGTERM`(終了)を送信して、ハンドル
  - killコマンドのデフォルトシグナルは`SIGTERM`

```
$ kill 2018
```

```
sleeping...
SIGTERM
sleeping...
sleeping
```

+ `SIGKILL`(強制終了)を送信する
  - `SIGKILL`はハンドルできない

```
$ kill -9 2018

or

$ kill -SIGKILL 2018
```

## 3. ドキュメント

[kill - プロセスまたはジョブを終了させる、またはシグナルを送る | IBM](https://www.ibm.com/docs/ja/zos/2.2.0?topic=descriptions-kill-end-process-job-send-it-signal)
