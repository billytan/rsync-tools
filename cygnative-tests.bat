@echo off

set RSYNC="C:\Program Files (x86)\cwRsync\bin\rsync.exe"

set HOST=192.168.1.99


set SSH_CMD="/cygdrive/C/bin/cygnative/cygnative.exe /cygdrive/C/bin/plink.exe -batch -l root -pw billy123 -P 22"

%RSYNC% -v -a -e %SSH_CMD% /cygdrive/C/bin %HOST%:/tmp/

exit /B

set SSH_CMD="/cygdrive/C/bin/cygnative/cygnative.exe ./FILES/plink.exe -P 22"

%RSYNC% -v -a -e %SSH_CMD% /cygdrive/C/bin root@%HOST%:/tmp/

exit /B

REM set SSH_CMD="/cygdrive/C/bin/cygnative.exe /cygdrive/C/bin/plink.exe -l root -pw billy123 -P 22"

REM set SSH_CMD="/cygdrive/C/bin/cygnative/cygnative.exe /cygdrive/C/bin/plink.exe -l root -pw billy123 -P 22"

set SSH_CMD="/cygdrive/C/bin/cygnative/cygnative.exe ./FILES/plink.exe -l root -pw billy123 -P 22"

REM set SSH_CMD="./FILES/cygnative.exe ./FILES/plink.exe -l root -pw billy123 -P 22"


%RSYNC% -v -a -e %SSH_CMD% /cygdrive/C/bin %HOST%:/tmp/


