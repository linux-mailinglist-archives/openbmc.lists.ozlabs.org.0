Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id AE0D88CA5A2
	for <lists+openbmc@lfdr.de>; Tue, 21 May 2024 03:11:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=GVa1JXrK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vjx8K5kVDz3g3c
	for <lists+openbmc@lfdr.de>; Tue, 21 May 2024 11:06:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=GVa1JXrK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vjx7l5VVXz3fnr
	for <openbmc@lists.ozlabs.org>; Tue, 21 May 2024 11:05:39 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6E2E02009E;
	Tue, 21 May 2024 09:05:36 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1716253536;
	bh=iAvfGkZT4FeJY6ZCtg/uZMPHhXpevqTWGWhaYnFFR5w=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=GVa1JXrKrMDjbPa0pgapC1HhKqAUMYx+J0unbpCOXxeOewxapONz0h3q9iGYnf2rW
	 VlaLxc2dPYONzA2vlNo9WQrkS3z9HkX8NXl+G9OJaLSoMA3Pw/2NQfVaql7Kgt6GOy
	 +csNYS8CaFaWf121CJfspXOgaNTyATsvTaov7WWJBOTbmkykxnyMhzgvW1JjmqzETQ
	 KESsYdZZIMAEl+janiaXq5ks03KVL39q67dsndbszpPhwh+aq2Eb3lLmfDOcJ/mgKV
	 qyyKzlkYEE+Jdns7jTBpnWuAf5ojqMb9Tkx6gb3+l1f8fvvd4oymLU9qorABAKi1to
	 75r2fE0vjAGRg==
Message-ID: <5e89654a02e2f870b71700c8cd75c2ef371fb579.camel@codeconstruct.com.au>
Subject: Re: OpenBMC replacing AMI AST2500 BMC fw on Gigabyte MC12-LE0 -
 questions
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Johannes Truschnigg <johannes@truschnigg.info>, openbmc@lists.ozlabs.org
Date: Tue, 21 May 2024 10:35:34 +0930
In-Reply-To: <ZkuJNJ9kFrRS3mQF@vault.lan>
References: <ZkuJNJ9kFrRS3mQF@vault.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

On Mon, 2024-05-20 at 19:32 +0200, Johannes Truschnigg wrote:
> Dear list,
>=20
> I am new to this whole BMC-innards thing, and the very opposite of famili=
ar
> with embedded devices, so please bear with me on this :)

:)

>=20
> The BMC implementation seems lean very much onto the AST2500 Evaluation B=
oard
> (the unchanged name pops up in a number of places in the stock firmware),=
 so I
> would guess that the OpenBMC evb-ast2500 machine should be able to get
> somewhere (and even if it's just to see OpenBMC's instead of AMI's Linux =
start,
> and then crash hard due to some subtle incompatibility :)) at least.

Perhaps. While the SoC itself is obviously supported, how it's
integrated into the rest of the platform will likely be very different
to how things are wired up on the EVB.

> My understanding is that there are two paths forward:
>=20
> 1.) To make OpenBMC's build artifacts into FMH-style BLOBs, and find a wa=
y to
> feed them to the stock fw's u-boot, which would ideally result in OpenBMC=
 being
> able to boot this way.
>=20
> 2.) To replace the stock fw's u-boot release with an OpenBMC u-boot that =
can
> load the evb-ast2500 artifacts natively, and have the BMC boot OpenBMC th=
at
> way.
>=20
> Can you please confirm that this assessment is sane, or correct me if it =
isn't?

Yeah, that's sane. I'm not familiar with FMH so can't really comment on
how feasible that approach might be, but my intuition is it's probably
a bunch of pain.

>=20
> If so, I would presume option 2.) to be the easier road to travel, but I =
am
> somewhat stumped as to how I can get OpenBMC's u-boot onto the BMC, *idea=
lly*
> (but not necessarily) in a non-destructive way (as I do not know how to o=
r have
> a way to revert to the original state without access to the bootloader or=
 even
> stock firmware running).

Something to consider is using qemu to boot the proprietary firmware,
and do your experiments there. That way it's non-destructive in the
sense that it's all just software and you won't need to break out a
flash programmer.

A quick look at the BMC firmware from your [1] shows Gigabyte do their
usual thing and ship the entire flash image. I downloaded the zip file,
unpacked it, and booted it like

```
0 andrew@heihei:~$ mkdir /tmp/mc12-le0
0 andrew@heihei:~$ cd !$
cd /tmp/mc12-le0
0 andrew@heihei:/tmp/mc12-le0$ unzip ~/Downloads/server_firmware_ast2500_AM=
I_12.x.zip
Archive:  /home/andrew/Downloads/server_firmware_ast2500_AMI_12.x.zip
   creating: 126121/
  inflating: 126121/bmc_fw_update_linux.sh
  inflating: 126121/bmc_fw_update_uefi.nsh
  inflating: 126121/bmc_fw_update_win.bat
  inflating: 126121/BMC_Release_Note_126121.doc
   creating: 126121/fw/
  inflating: 126121/fw/126121.bin
  inflating: 126121/fw/rom.ima_enc
  inflating: 126121/GBT_BMC_Firmware_Upgrade_User_Guide_v006_pre.pdf
  inflating: 126121/projects.txt
   creating: 126121/Tools/
  inflating: 126121/Tools/gigaflash
  inflating: 126121/Tools/gigaflash.efi
  inflating: 126121/Tools/gigaflash.exe
  inflating: 126121/Tools/gigaflash_arm
  inflating: 126121/Tools/gigaflash_arm.efi
  inflating: 126121/Tools/gigaflash_x64
  inflating: 126121/Tools/gigaflash_x64.exe
   creating: 126121/Tools/x64/
  inflating: 126121/Tools/x64/astio.cat
  inflating: 126121/Tools/x64/astio.sys
   creating: 126121/Tools/x64_Win8/
  inflating: 126121/Tools/x64_Win8/astio.cat
  inflating: 126121/Tools/x64_Win8/astio.Inf
  inflating: 126121/Tools/x64_Win8/astio.sys
   creating: 126121/Tools/x86/
  inflating: 126121/Tools/x86/astio.sys
0 andrew@heihei:/tmp/mc12-le0$ cd 126121/fw
0 andrew@heihei:/tmp/mc12-le0/126121/fw$ binwalk 126121.bin

DECIMAL       HEXADECIMAL     DESCRIPTION
---------------------------------------------------------------------------=
-----
163848        0x28008         CRC32 polynomial table, little endian
213604        0x34264         CRC32 polynomial table, little endian
393216        0x60000         JFFS2 filesystem, little endian
5636096       0x560000        CramFS filesystem, little endian, size: 40951=
808, version 2, sorted_dirs, CRC 0x417607BC, edition 0, 27801 blocks, 6575 =
files
46596160      0x2C70040       uImage header, header size: 64 bytes, header =
CRC: 0x596F847A, created: 2024-03-12 06:08:06, image size: 2792592 bytes, D=
ata Address: 0x80008000, Entry Point: 0x80008000, data CRC: 0xC9C2F025, OS:=
 Linux, CPU: ARM, image type: OS Kernel Image, compression type: none, imag=
e name: "Linux-3.14.17-ami"
46596224      0x2C70080       Linux kernel ARM boot executable zImage (litt=
le-endian)
46613079      0x2C74257       gzip compressed data, maximum compression, fr=
om Unix, last modified: 1970-01-01 00:00:00 (null date)
49479680      0x2F30000       JFFS2 filesystem, little endian
50003968      0x2FB0000       CramFS filesystem, little endian, size: 59637=
76, version 2, sorted_dirs, CRC 0xBCBB0E63, edition 0, 1566 blocks, 131 fil=
es

0 andrew@heihei:/tmp/mc12-le0/126121/fw$ truncate -s 64M 126121.bin
0 andrew@heihei:/tmp/mc12-le0/126121/fw$ qemu-system-arm -M ast2500-evb,fmc=
-model=3Dn25q512a -drive file=3D126121.bin,if=3Dmtd,format=3Draw -nographic
qemu-system-arm: warning: Aspeed iBT has no chardev backend


U-Boot 2013.07 (Mar 12 2024 - 14:08:49)

I2C:   ready
DRAM:  424 MiB
eSPI Handshake complete
OEM_BOARD_INIT - Start (BMC)
LPC mode
OEM_BOARD_INIT - End
Flash: Found SPI Chip Micron/Numonyx N25Q512A(0x20ba) 2x I/O READ, NORMAL W=
RITE
64 MiB
MMC:  =20
*** Warning - bad CRC, using default environment

Un-Protected 1 sectors
Erasing Flash...
Erasing sector  4 ... ok.
Erased 1 sectors
Writing to Flash... done
Protected 1 sectors
Net:   RTL8211E, EEECR =3D 0x00
RTL8211E, EEEAR =3D 0x00
RTL8211E, EEELPAR =3D 0x00
RTL8211E, LACR =3D 0x00
RTL8211E, LCR =3D 0x00
ast_eth0, ast_eth1
DRAM ECC enabled
Hit any key to stop autoboot:  0=20
Image to be booted is 1
EMMC and EXT4 is not enabled - Cannot locate kernel file in Root
Initing KCS...done
Uboot waiting for firmware update to start...
Uboot waiting for fwupdate to start timed out
Disabling Watchdog 2 Timer
AST2500EVB>
```

Not sure how productive that is, but maybe you can experiment.

If you enable networking and tftp on the qemu command-line you could
potentially boot your own kernels. Or you could mess with booting the
OpenBMC firmware as well.

If you want to do something more destructive and overwrite the firmware
on the flash, then you should probably have a flash programmer handy,
and/or become familiar with something like culvert (which I maintain):

https://github.com/amboar/culvert

Note that gigabyte do ship "gigaflash" in that zip file above, which is
a closed-source application similar to culvert, that derives from
Aspeed's own "socflash" tool.

>=20
> So far, I tried to put the u-boot-evb-ast2500-v2019.04+git-r0.bin artifac=
t from
> my OpenBMC build results into a memory location on the BMC using TFTP, an=
d `go`
> to that address afterwards - but that effectively reloaded the *original*
> u-boot from the vendor fw. I don't know enough about the inner workings o=
f an
> AST2500 or u-boot (or any other embedded bootloader, really), but if you =
could
> enlighten me as to what has happened there, I'd be very grateful (... may=
be
> u-boot does a check if it's already reloacted itself towards end of phys.
> memory, and directly jump there if that is deemed the case?)
>=20

u-boot is linked at 0 and uses XIP from the SPI-NOR (which is memory-
mapped at 0), so I suspect it has read out the vendor copy again.

>  Do you have any
> hints how I could achieve what I am trying to do? Is this even feasible?

Given the above, you'd have to replace u-boot on the hardware.

>=20
> I did find a Github issue[3] from 2017 which hints at others having tried
> something like this, but no documented successes.
>=20
> I'd be very grateful for your input on this matter. Please keep my addres=
s CC'd
> as I am currently not subscribed to this list.

A potential collaborator on Gigabyte stuff is bielids. I don't have
their contact details, but you can find some of our past discussion
here:

https://github.com/amboar/culvert/issues/51

Andrew

>=20
> Thank you all very much for your time reading this! :)
>=20
>=20
> PS: I've included some potentially useful u-boot monitor output from the =
stock
> firmware at [4], as I am not sure if attachments of this size (or inline =
text)
> would be OK on-list.
>=20
>=20
> [0]: https://www.gigabyte.com/Enterprise/Server-Motherboard/MC12-LE0-rev-=
1x
> [1]: https://github.com/ya-mouse/bmc-ami
> [2]: https://github.com/ami-megarac/OSSW/blob/master/SPX-12/Kernel_amiext=
_ex-src/12-drivers_mtd_maps_fmh.h
> [3]: https://github.com/openbmc/openbmc/issues/1649
> [4]: https://paste.debian.net/hidden/43509e70/
>=20

