#!/bin/bash

passwd

echo "archlinux" >> /etc/hostname

ln -sf /usr/share/zoneinfo/America/Bahia /etc/localtime

hwclock --systohc

echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen

locale-gen

echo "KEYMAP=br-abnt2" >> /etc/vconsole.conf

pacman --noconfirm --needed -S networkmanager
systemctl enable NetworkManager
systemctl start NetworkManager

pacman --noconfirm --needed -S grub && grub-install --target=i386-pc /dev/sda && grub-mkconfig -o /boot/grub/grub.cfg

pacman --noconfirm --needed -S dialog

exit

clear
