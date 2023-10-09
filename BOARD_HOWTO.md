# How to use the pre-configured zcu102_822

## Booting the board
If the board is not booted or it is booting a different image you can boot the default HERO image using the following commands:

### 1. Load Required Linux Modules
```
module load hero/1.0 xilinx/2019.2 xilinx/petalinux/2019.2
```

### 2. Reset Board (Soft)
```
$HERO_HOME/util/xsdb/reset_jtag.sh -i 127.0.0.1 -p 31822
```

### 3. Boot Board
```
$HERO_HOME/util/xsdb/boot_jtag.sh -i 127.0.0.1 -p 31822
```
> NOTE: The first boot can fail. In that case, re-execute only the boot command another time.

## Additional Useful Commands

### Board Power Cycle (Hard Reset)
```
sudo /storage/srv/pdu/pdu_reset_socket_2
```
After the power cycle a boot, a booting process is required. The board do not boot autonomously.

### Access Serial/UART
You can access the UART by connecting to the serial port.
```
minicom -D /dev/s_zcu102_822_0
```
The serial port is active during the process of booting and can be used to debug booting failures.

### Access SSH
After a successful Linux boot, you can access the board through SSH.
```
ssh root@172.19.253.205
```

## Compile and Run examples
The HERO setup employs cross-compilation. You compile the binaries for HERO on your workstation and then you copy and execute it on the board.
This can be done automatically using the `Makefile` of this repository. Before proceeding, on your terminal you need to set up the following required environmental variables:

```
module load hero/1.0 hero/boards/zcu102_822
```

### Compile and run the application
From your terminal you can compile and run the application on the board using the following commands:
```
cd <APPLICATION>
make clean all run
```

### Load, Unload, and reset the HERO driver
Loading the HERO drivers triggers a "soft" reset of the accelerator, without the need for a complete reboot.
#### Load HERO Driver (in not loaded)
```
make insert-driver
```

#### Remove HERO Driver (in not loaded)
```
make remove-driver
```

#### Remove and Load HERO Driver (in not loaded)
```
make reset-driver
```
> This is useful in case of unexpected behavior of the board. In case these unexpected behaviors persist you have to soft reboot the whole board.
