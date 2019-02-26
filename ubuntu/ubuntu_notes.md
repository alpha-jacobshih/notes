
# notes for ubuntu

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
