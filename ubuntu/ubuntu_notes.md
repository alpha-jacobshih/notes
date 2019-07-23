
# notes for ubuntu

## references

## ubuntu setup notes for acer v3-112p-c95r

### wifi

- if wifi is disappeared and got below message when insert wl.ko:

    ```
    jacob_shih@kuta86:~$ sudo modprobe wl
    modprobe: FATAL: Module wl not found in directory /lib/modules/4.15.0-33-generic
    ```

- resintall bcmwl-kernel-source

    ```
    sudo apt purge bcmwl-kernel-source
    sudo apt-get install --reinstall linux-headers-generic
    sudo apt-get install bcmwl-kernel-source
    ```
- reference

[No wifi after kernel upgrade to 4.15 OR 4.16](http://www.archiveweb.space/264506/no-wifi-after-kernel-upgrade-to-4-15-or-4-16)

## hibernate

- find swap partition

    ```
    grep swap /etc/fstab
    ```

    it returns

    ```
    # swap was on /dev/sda7 during installation
    ```

    where /dev/sda7 is the partition to specify.

- add a boot parameter

    ```
    sudoedit /etc/default/grub
    ```

    modify the line starts with GRUB_CMDLINE_LINUX_DEFAULT

    ```
    GRUB_CMDLINE_LINUX_DEFAULT="quiet splash resume=/dev/sda7" 
    ```

- update grub

    ```
    sudo update-grub
    ```

- update the initramfs

    ```
    sudo update-initramfs -u
    ```

- modify login manager configuration file

    ```
    sudoedit /etc/systemd/logind.conf
    ```

    modify the lines.

    ```
    HandleSuspendKey=hibernate
    HandleLidSwitch=hibernate
    ```

- reboot

## install gnome tweak tool for advanced GNOME 3 settings.

- install gnome tweak tool

    ```
    sudo apt-get install gnome-tweaks
    ```

## install chinese input method on ubuntu 16.04

- System Settings--> Language Support--> Install/Remove Languages

    - Chinese (simplified)
    - Chinese (traditional)

- install ibus framework

    ```
    sudo apt-get install ibus ibus-clutter ibus-gtk ibus-gtk3 ibus-qt4
    ```

- configure the input method

    ```
    im-config
    ```

- install input methods

    ```
    sudo apt-get install ibus-pinyin ibus-zhuyin ibus-table-cangjie
    ```

- restart ibus

    ```
    ibus restart
    ```

- setup ibus

    ```
    ibus-setup
    ```

    add the chinese input methods on demand.

- System Settings--> Language Support--> Install/Remove Languages

    - Chinese(Pinyin)(IBus)
    - Chinese(CangJie))(IBus)
    - Chinese(Zhuyin)(IBus)


