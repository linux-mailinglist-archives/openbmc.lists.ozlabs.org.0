Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED59431B840
	for <lists+openbmc@lfdr.de>; Mon, 15 Feb 2021 12:46:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DfMkH0LySz30LT
	for <lists+openbmc@lfdr.de>; Mon, 15 Feb 2021 22:45:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Cm1Szfm5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::633;
 helo=mail-ej1-x633.google.com; envelope-from=vkrk.user@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Cm1Szfm5; dkim-atps=neutral
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DfMk3047Kz30KJ
 for <openbmc@lists.ozlabs.org>; Mon, 15 Feb 2021 22:45:44 +1100 (AEDT)
Received: by mail-ej1-x633.google.com with SMTP id i23so4359175ejg.10
 for <openbmc@lists.ozlabs.org>; Mon, 15 Feb 2021 03:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o3jPsibkAj98PKfYPnNPotZ+LUCWIej7TJfmTa4GNkg=;
 b=Cm1Szfm5UHNoJ6p5GHCf1dUIbL+w82d2CPLG+VbKhD9mJtNSgic1cTgBpMRbZW34SS
 QPtxM+0AtgQzTshejPw2O6+XRVsV+2CzCt/+jVy++slmUm7ZObXkn3ml5X2/JwBDcn26
 Rqek4PXD6+zyCPS0COC/h6M52j3E77MD+yHoR2XISIuDdhN85PrYsjHOp/6SIi5WshCM
 FWpSM1NpKaaxdlEWaeClZF5L4wUxTdVoDAdGkGzMeWD0Pez1eZyKo6NWnrx0mTi/MD7T
 qtq3JPYYYulIG8BFnO7EfoQExh49UD9S15ccPAIP8wrV4MNRgat30oxGcqE/FE7N7f3/
 SMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o3jPsibkAj98PKfYPnNPotZ+LUCWIej7TJfmTa4GNkg=;
 b=qxXLJ7eY/s68QODLgCRqc95LE6Ief5VsYU8zi2kanG7OVt6V1Yh1wrtZ5vttrBxBl8
 /PvCST+0E4aQiWdqXf+A0QuUXET2KUFzIX95+VIASDwWWfSPOY9movL4pHWIosEeFsbb
 uVJRw7wKuySzrTOidf9/rIXCEgCx6QZpCGOtjRbt7pfgBadsxgEnhRqkyFGmH9Gznqt6
 UM2F5gWEEyw4yt4vSK8CIGt06IFp98D63GMewWxoc8tdiYGMlXO9te39KR8J7ldcMxVI
 RrDet4taO5khN4h2E4/PFIOctiHOZ45fJp9f14apgOou4Yr45eTiPWFVnan3N7zgNhsw
 Pn0g==
X-Gm-Message-State: AOAM5303kJIzas3XSWBtTEA22DvVujCVMct7dJ84QLf0ifFEpfYavHA2
 BUqSrfMDiXOtNkyc4Kamibgg6jwxQ0OZgQkAAt0R9/XrnIRlPQ==
X-Google-Smtp-Source: ABdhPJwbPCcp+DGXZ9KT0iJ6ZC//JZD3x0BVyk2OYWKU+08KTEbQBkG8QrTeX/A9JGQTzBejV4tcSUPURSXH4jYfB/Q=
X-Received: by 2002:a17:906:7c43:: with SMTP id
 g3mr15020801ejp.210.1613389537902; 
 Mon, 15 Feb 2021 03:45:37 -0800 (PST)
MIME-Version: 1.0
References: <CAHf5csd1tt-VNS9Wfuwqito2Fy75bfhArAEhZP_d1LXeOz+YVA@mail.gmail.com>
 <PS1PR06MB2600DD0B6A4F3F30C771342A8AB29@PS1PR06MB2600.apcprd06.prod.outlook.com>
 <CAHf5csdnjHmMm6HFqevH=w=QLwZ1PzZ4UTDOq7sxYaoVn__8rg@mail.gmail.com>
 <PS1PR06MB2600313E52EEEDB5DE51263C8AB29@PS1PR06MB2600.apcprd06.prod.outlook.com>
 <CAHf5csedpO-vmyyAq8Ut5YzYyzvPfNz0osJSvWYyUHX9hmxWeA@mail.gmail.com>
 <PS1PR06MB26003D33D0AA82CAFA629D9C8AB29@PS1PR06MB2600.apcprd06.prod.outlook.com>
In-Reply-To: <PS1PR06MB26003D33D0AA82CAFA629D9C8AB29@PS1PR06MB2600.apcprd06.prod.outlook.com>
From: VINOTHKUMAR RK <vkrk.user@gmail.com>
Date: Mon, 15 Feb 2021 17:15:42 +0530
Message-ID: <CAHf5csdJCAGu3wajBTgCCB-VLkgn5AA13fsUcCFXsNtQo+Evrg@mail.gmail.com>
Subject: Re: evb-ast2600: Getting some build errors - 'u-boot.bin' is too
 large!'
To: Troy Lee <troy_lee@aspeedtech.com>
Content-Type: multipart/alternative; boundary="0000000000004a853d05bb5e860e"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000004a853d05bb5e860e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Troy,

I tried to load the Kernel image
(fitImage-obmc-phosphor-initramfs-evb-ast2600--5.8.17+git0+3cc95ae407-r0-ev=
b-ast2600-20210205034901.bin)
directly through TFTP in evb-ast2600. I could see a crash due to some file
system mounting issue. Can you please let me know if you've any
fix/workaround for this issue?

Please check the below link for complete log:
- https://gist.github.com/vkrk-user/909b554aa4cddd10663ad706d4c182a7


Crash log:
-------------
mount: mounting /dev/mtdblock4 on run/initramfs/ro failed: Invalid argument
[    2.475872] jffs2: notice: (98) jffs2_build_xattr_subsystem: complete
building xattr subsystem, 2 of xdatum (0 unchecked, 2 orphan) and 2 of xref
(2 dead, 0 orphan) found.
[    2.768965] overlayfs: upper fs does not support tmpfile.
[    3.040864] overlayfs: upper fs does not support RENAME_WHITEOUT.
chroot: can't execute '/bin/sh': No such file or directory

Unable to confirm /sbin/init is an executable non-empty file
in[    3.333044] Kernel panic - not syncing: Attempted to kill init!
exitcode=3D0x00000100
[    3.342421] CPU: 0 PID: 1 Comm: init Not tainted 5.8.17-3cc95ae #1
[    3.349316] Hardware name: Generic DT based system
[    3.354661] Backtrace:
[    3.357411] [<8010d92c>] (dump_backtrace) from [<8010db80>]
(show_stack+0x20/0x24)
[    3.365860]  r7:80a049bc r6:60000093 r5:00000000 r4:80c66358
[    3.372184] [<8010db60>] (show_stack) from [<808b7000>]
(dump_stack+0x9c/0xb0)
[    3.380248] [<808b6f64>] (dump_stack) from [<801211a0>]
(panic+0x114/0x340)
[    3.388016]  r7:80a049bc r6:80c0df08 r5:00000000 r4:80c88380
[    3.394336] [<8012108c>] (panic) from [<80127178>]
(complete_and_exit+0x0/0x2c)
[    3.402492]  r3:00000001 r2:00000000 r1:00000100 r0:80a049bc
[    3.408803]  r7:ffffe000
[    3.411630] [<8012678c>] (do_exit) from [<80127214>]
(do_group_exit+0x50/0xc8)
[    3.419677]  r7:000000f8
[    3.422503] [<801271c4>] (do_group_exit) from [<801272ac>]
(__wake_up_parent+0x0/0x30)
[    3.431338]  r7:000000f8 r6:00000004 r5:00000004 r4:006ec190
[    3.437656] [<8012728c>] (sys_exit_group) from [<80100060>]
(ret_fast_syscall+0x0/0x54)
[    3.446587] Exception stack(0xbd0dffa8 to 0xbd0dfff0)
[    3.452225] ffa0:                   006ec190 00000004 00000001 00000000
00000001 006ec190
[    3.461351] ffc0: 006ec190 00000004 00000004 000000f8 00000000 00000000
00507a7c 00000000
[    3.470476] ffe0: 00507b34 7ed76a14 00497934 76dcc574
[    3.476121] CPU1: stopping
[    3.479141] CPU: 1 PID: 99 Comm: jffs2_gcd_mtd5 Not tainted
5.8.17-3cc95ae #1
[    3.487099] Hardware name: Generic DT based system



Regards,
Vinoth Kumar RK

On Fri, 5 Feb 2021 at 14:58, Troy Lee <troy_lee@aspeedtech.com> wrote:

> Hi Vinothkumar,
>
>
>
> If you want to boot different Kernel from TFTP, I think you can use tftp
> command in u-boot.
>
> ast# dhcp
>
> ast# tftp 0x83000000 serverip:/path/image-kernel
>
> ast# bootm 0x83000000
>
>
>
> If you want to use qemu options loading u-boot/kernel images to different
> memory offset, I=E2=80=99m not familiar with this. Need some expert=E2=80=
=99s help here.
>
>
>
> Thanks,
>
> Troy Lee
>
>
>
> *From:* VINOTHKUMAR RK <vkrk.user@gmail.com>
> *Sent:* Friday, February 5, 2021 4:16 PM
> *To:* Troy Lee <troy_lee@aspeedtech.com>
> *Cc:* openbmc@lists.ozlabs.org
> *Subject:* Re: evb-ast2600: Getting some build errors - 'u-boot.bin' is
> too large!'
>
>
>
> Hi Troy,
>
>
>
> Thanks a lot for your input!
>
>
>
> Looks like there was some problem with my Qemu. I was using some older
> version "version 4.2.1 (Debian 1:4.2-3ubuntu6.11)".
>
> The image came up fine when I tried with the latest Qemu "aspeed-6.0"
> branch, it gives the image version which you're using.
>
>
>
> Output:
>
> ---------
>
> Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) 0.1.0
> evb-ast2600 ttyS4
>
>
>
> evb-ast2600 login: root
>
> Password:
>
> root@evb-ast2600:~#
>
>
>
> BTW, is there an option with Qemu to boot u-boot and linux image
> separately? Also something like TFTP from u-boot (Qemu) to my VM (Ubuntu)
> where I'm running my TFTP server. Please let me know if there are any ste=
ps
> for the same.
>
>
>
>
>
> Regards,
>
> Vinoth Kumar RK
>
>
>
>
>
> On Fri, 5 Feb 2021 at 12:59, Troy Lee <troy_lee@aspeedtech.com> wrote:
>
> Hi Vinothkumar,
>
> I=E2=80=99m not sure what=E2=80=99s wrong. Beware that the QEMU will dire=
ctly write into
> your image file, so you might want to running it on a copy or use -snapsh=
ot
> option.
>
> I could boot into OS with the following qemu command:
> qemu-system-arm -M ast2600-evb -drive file=3Dimage-bmc,format=3Draw,if=3D=
mtd
> -nographic -nic user
>
> My QEMU version:
> qemu-system-arm --version
> QEMU emulator version 5.2.50 (v5.2.0-991-g45240eed4f)
> Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers
>
> Thanks,
> Troy Lee
>
> From: VINOTHKUMAR RK <vkrk.user@gmail.com>
> Sent: Friday, February 5, 2021 12:19 PM
> To: Troy Lee <troy_lee@aspeedtech.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: evb-ast2600: Getting some build errors - 'u-boot.bin' is too
> large!'
>
> Hi Troy,
>
> Thanks for sharing the changes, with this I'm able to generate mtd image.
> But when I try to load them through Qemu, it's getting stuck with the bel=
ow
> error. Is there any workaround?
>
> Error log:
> ------------
> fdt_root: FDT_ERR_BADMAGIC
> ERROR: root node setup failed
>  - must RESET the board to recover.
>
> FDT creation failed! hanging...### ERROR ### Please RESET the board ###
>
>
> Qemu command:
> -----------------------
> qemu-system-arm -m 1G -M ast2600-evb -nographic -drive
> file=3Dobmc-phosphor-image-evb-ast2600-20210205034901.static.mtd,format=
=3Draw,if=3Dmtd
> -net nic -net user,hostfwd=3D:127.0.0.1:2222-:22,hostfwd=3D:127.0.0.1:244=
3
> -:443,hostname=3Dqemu
>
> Qemu log:
> --------------
> U-Boot 2019.04 (Feb 04 2021 - 10:27:21 +0000)
>
> SOC: AST2600-A0
> eSPI Mode: SIO:Enable : SuperIO-2e
> Eth: MAC0: RGMII, MAC1: RGMII, MAC2: RGMII, MAC3: RGMII
> Model: AST2600 EVB
> DRAM:  already initialized, 240 MiB (capacity:256 MiB, VGA:64 MiB), ECC o=
ff
> PCIE-0: Link down
> MMC:
>
> sdhci_slot0@100: 1, sdhci_slot1@200: 2, emmc_slot0@100: 0
> Loading Environment from SPI Flash... *** Warning -
> spi_flash_probe_bus_cs() failed, using default environment
>
> In:    serial@1e784000
> Out:   serial@1e784000
> Err:   serial@1e784000
> Model: AST2600 EVB
> Net:
> Warning: ftgmac@1e660000 (eth0) using random MAC address -
> 5e:23:16:3b:07:db
> eth0: ftgmac@1e660000
> Warning: ftgmac@1e680000 (eth1) using random MAC address -
> 92:2d:b9:4b:a5:93
> , eth1: ftgmac@1e680000
> Warning: ftgmac@1e670000 (eth2) using random MAC address -
> f6:16:60:c6:0a:2d
> , eth2: ftgmac@1e670000
> Warning: ftgmac@1e690000 (eth3) using random MAC address -
> 02:43:32:16:41:6d
> , eth3: ftgmac@1e690000
> Hit any key to stop autoboot:  0
> ## Loading kernel from FIT Image at 20100000 ...
>    Using 'conf@aspeed-ast2600-evb.dtb' configuration
>    Trying 'kernel@1' kernel subimage
>      Description:  Linux kernel
>      Type:         Kernel Image
>      Compression:  uncompressed
>      Data Start:   0x2010012c
>      Data Size:    3527112 Bytes =3D 3.4 MiB
>      Architecture: ARM
>      OS:           Linux
>      Load Address: 0x80001000
>      Entry Point:  0x80001000
>      Hash algo:    sha256
>      Hash value:
>  d3bfde4459bab8272cda12f0747d47735521c9ee4f5786283cfea439398c976d
>    Verifying Hash Integrity ... sha256+ OK
> ## Loading ramdisk from FIT Image at 20100000 ...
>    Using 'conf@aspeed-ast2600-evb.dtb' configuration
>    Trying 'ramdisk@1' ramdisk subimage
>      Description:  obmc-phosphor-initramfs
>      Type:         RAMDisk Image
>      Compression:  uncompressed
>      Data Start:   0x20465cf8
>      Data Size:    1087608 Bytes =3D 1 MiB
>      Architecture: ARM
>      OS:           Linux
>      Load Address: unavailable
>      Entry Point:  unavailable
>      Hash algo:    sha256
>      Hash value:
>  488f44eb0c954ef85ede0c1dde3803696b3637d41996fc2be9610bbdb756b1a9
>    Verifying Hash Integrity ... sha256+ OK
> ## Loading fdt from FIT Image at 20100000 ...
>    Using 'conf@aspeed-ast2600-evb.dtb' configuration
>    Trying 'fdt@aspeed-ast2600-evb.dtb' fdt subimage
>      Description:  Flattened Device Tree blob
>      Type:         Flat Device Tree
>      Compression:  uncompressed
>      Data Start:   0x2045d408
>      Data Size:    34852 Bytes =3D 34 KiB
>      Architecture: ARM
>      Hash algo:    sha256
>      Hash value:
>  a9bcf2a34ea7477d2c5f86ec793b659ecce07554dee5897460198f513ede4d0b
>    Verifying Hash Integrity ... sha256+ OK
>    Booting using the fdt blob at 0x2045d408
>    Loading Kernel Image ... OK
>    Loading Ramdisk to 8ce57000, end 8cf60878 ... OK
>    Loading Device Tree to 8ce4b000, end 8ce56823 ... OK
> fdt_root: FDT_ERR_BADMAGIC
> ERROR: root node setup failed
>  - must RESET the board to recover.
>
> FDT creation failed! hanging...### ERROR ### Please RESET the board ###
>
>
>
>
>
> Regards,
> Vinoth Kumar RK
>
> On Fri, 5 Feb 2021 at 07:57, Troy Lee <mailto:troy_lee@aspeedtech.com>
> wrote:
> Hi Vinothkumar,
>
> Please refer to the following two changes in Gerrit:
> =E2=80=A2 https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/39=
343
> =E2=80=A2 https://gerrit.openbmc-project.xyz/c/openbmc/meta-aspeed/+/3934=
4
>
> Thanks,
> Troy Lee
>
> From: openbmc <openbmc-bounces+troy_lee=3Dmailto:
> aspeedtech.com@lists.ozlabs.org> On Behalf Of VINOTHKUMAR RK
> Sent: Thursday, February 4, 2021 8:28 PM
> To: mailto:openbmc@lists.ozlabs.org
> Subject: evb-ast2600: Getting some build errors - 'u-boot.bin' is too
> large!'
>
> Hi,
>
> I'm trying to build for evb-ast2600 platform, but it doesn't succeed.
> Please help.
>
> Build command: (fresh checkout and build)
> TEMPLATECONF=3Dmeta-evb/meta-evb-aspeed/meta-evb-ast2600/conf . openbmc-e=
nv
> bitbake obmc-phosphor-image
>
> Branch details:
> commit 7dc2f7a38dccb3d87a9b79d0a66b25da1027a72f
>
>
> Error Log:
> Loading cache: 100% |
>
>                                         | ETA:  --:--:--
> Loaded 0 entries from dependency cache.
> Parsing recipes: 100%
> |########################################################################=
###########################################################################=
#####################|
> Time: 0:00:44
> Parsing of 2424 .bb files complete (0 cached, 2424 parsed). 3683 targets,
> 362 skipped, 0 masked, 0 errors.
> WARNING: No bb files in default matched BBFILE_PATTERN_meta-evb-ast2600
> '^/home/vinoth/project/openbmc/meta-evb/meta-evb-aspeed/meta-evb-ast2600/=
'
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           =3D "1.49.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "ubuntu-20.04"
> TARGET_SYS           =3D "arm-openbmc-linux-gnueabi"
> MACHINE              =3D "evb-ast2600"
> DISTRO               =3D "openbmc-phosphor"
> DISTRO_VERSION       =3D "0.1.0"
> TUNE_FEATURES        =3D "arm armv7a vfp vfpv4d16 callconvention-hard"
> TARGET_FPU           =3D "hard"
> meta
> meta-poky
> meta-oe
> meta-networking
> meta-python
> meta-phosphor
> meta-aspeed
> meta-evb-ast2600     =3D "master:7dc2f7a38dccb3d87a9b79d0a66b25da1027a72f=
"
>
> Initialising tasks: 100%
> |########################################################################=
###########################################################################=
##################|
> Time: 0:00:03
> Sstate summary: Wanted 1378 Found 939 Missed 439 Current 0 (68% match, 0%
> complete)
> NOTE: Executing Tasks
> WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_metadata:
> Feature 'phosphor-gpio-keys' not found, but
> KERNEL_DANGLING_FEATURES_WARN_ONLY is set
> WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_metadata:
> This may cause runtime issues, dropping feature and allowing configuratio=
n
> to continue
> WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_metadata:
> Feature 'phosphor-vlan' not found, but KERNEL_DANGLING_FEATURES_WARN_ONLY
> is set
> WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_metadata:
> This may cause runtime issues, dropping feature and allowing configuratio=
n
> to continue
> WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_configme:
> Feature 'phosphor-gpio-keys' not found, but
> KERNEL_DANGLING_FEATURES_WARN_ONLY is set
> WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_configme:
> This may cause runtime issues, dropping feature and allowing configuratio=
n
> to continue
> WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_configme:
> Feature 'phosphor-vlan' not found, but KERNEL_DANGLING_FEATURES_WARN_ONLY
> is set
> WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_configme:
> This may cause runtime issues, dropping feature and allowing configuratio=
n
> to continue
> WARNING: obmc-phosphor-sysd-1.0-r1 do_package_qa: QA Issue:
> obmc-phosphor-sysd: SRC_URI uses PN not BPN [src-uri-bad]
> ERROR: obmc-phosphor-image-1.0-r0 do_generate_static: Image
> '/home/vinoth/project/openbmc/build/tmp/deploy/images/evb-ast2600/u-boot.=
bin'
> is too large!
> ERROR: Logfile of failure stored in:
> /home/vinoth/project/openbmc/build/tmp/work/evb_ast2600-openbmc-linux-gnu=
eabi/obmc-phosphor-image/1.0-r0/temp/log.do_generate_static.2176796
> ERROR: Task
> (/home/vinoth/project/openbmc/meta-phosphor/recipes-phosphor/images/obmc-=
phosphor-image.bb:do_generate_static)
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 4041 tasks of which 2680 didn't need to be
> rerun and 1 failed.
>
> Summary: 1 task failed:
>
> /home/vinoth/project/openbmc/meta-phosphor/recipes-phosphor/images/obmc-p=
hosphor-image.bb:
> do_generate_static
> Summary: There were 10 WARNING messages shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>
>
>
> Regards,
> VINOTHKUMAR RK
>
>

--0000000000004a853d05bb5e860e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr">Hi Troy,<div><br></div><div>I tried to load the Kernel image (fit=
Image-obmc-phosphor-initramfs-evb-ast2600--5.8.17+git0+3cc95ae407-r0-evb-as=
t2600-20210205034901.bin) directly through TFTP in evb-ast2600. I could see=
 a crash due to some file system mounting=C2=A0issue. Can you please let me=
 know if you&#39;ve any fix/workaround for this issue?</div><div><br></div>=
<div><div>Please check the below link for complete log:</div><div>-=C2=A0<a=
 href=3D"https://gist.github.com/vkrk-user/909b554aa4cddd10663ad706d4c182a7=
">https://gist.github.com/vkrk-user/909b554aa4cddd10663ad706d4c182a7</a></d=
iv><div></div></div><div><br></div><div><br></div><div>Crash log:</div><div=
>-------------</div><div><div>mount: mounting /dev/mtdblock4 on run/initram=
fs/ro failed: Invalid argument</div><div>[=C2=A0 =C2=A0 2.475872] jffs2: no=
tice: (98) jffs2_build_xattr_subsystem: complete building xattr subsystem, =
2 of xdatum (0 unchecked, 2 orphan) and 2 of xref (2 dead, 0 orphan) found.=
</div><div>[=C2=A0 =C2=A0 2.768965] overlayfs: upper fs does not support tm=
pfile.</div><div>[=C2=A0 =C2=A0 3.040864] overlayfs: upper fs does not supp=
ort RENAME_WHITEOUT.</div><div>chroot: can&#39;t execute &#39;/bin/sh&#39;:=
 No such file or directory</div><div><br></div><div>Unable to confirm /sbin=
/init is an executable non-empty file</div><div>in[=C2=A0 =C2=A0 3.333044] =
Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x00000100</=
div><div>[=C2=A0 =C2=A0 3.342421] CPU: 0 PID: 1 Comm: init Not tainted 5.8.=
17-3cc95ae #1</div><div>[=C2=A0 =C2=A0 3.349316] Hardware name: Generic DT =
based system</div><div>[=C2=A0 =C2=A0 3.354661] Backtrace:</div><div>[=C2=
=A0 =C2=A0 3.357411] [&lt;8010d92c&gt;] (dump_backtrace) from [&lt;8010db80=
&gt;] (show_stack+0x20/0x24)</div><div>[=C2=A0 =C2=A0 3.365860]=C2=A0 r7:80=
a049bc r6:60000093 r5:00000000 r4:80c66358</div><div>[=C2=A0 =C2=A0 3.37218=
4] [&lt;8010db60&gt;] (show_stack) from [&lt;808b7000&gt;] (dump_stack+0x9c=
/0xb0)</div><div>[=C2=A0 =C2=A0 3.380248] [&lt;808b6f64&gt;] (dump_stack) f=
rom [&lt;801211a0&gt;] (panic+0x114/0x340)</div><div>[=C2=A0 =C2=A0 3.38801=
6]=C2=A0 r7:80a049bc r6:80c0df08 r5:00000000 r4:80c88380</div><div>[=C2=A0 =
=C2=A0 3.394336] [&lt;8012108c&gt;] (panic) from [&lt;80127178&gt;] (comple=
te_and_exit+0x0/0x2c)</div><div>[=C2=A0 =C2=A0 3.402492]=C2=A0 r3:00000001 =
r2:00000000 r1:00000100 r0:80a049bc</div><div>[=C2=A0 =C2=A0 3.408803]=C2=
=A0 r7:ffffe000</div><div>[=C2=A0 =C2=A0 3.411630] [&lt;8012678c&gt;] (do_e=
xit) from [&lt;80127214&gt;] (do_group_exit+0x50/0xc8)</div><div>[=C2=A0 =
=C2=A0 3.419677]=C2=A0 r7:000000f8</div><div>[=C2=A0 =C2=A0 3.422503] [&lt;=
801271c4&gt;] (do_group_exit) from [&lt;801272ac&gt;] (__wake_up_parent+0x0=
/0x30)</div><div>[=C2=A0 =C2=A0 3.431338]=C2=A0 r7:000000f8 r6:00000004 r5:=
00000004 r4:006ec190</div><div>[=C2=A0 =C2=A0 3.437656] [&lt;8012728c&gt;] =
(sys_exit_group) from [&lt;80100060&gt;] (ret_fast_syscall+0x0/0x54)</div><=
div>[=C2=A0 =C2=A0 3.446587] Exception stack(0xbd0dffa8 to 0xbd0dfff0)</div=
><div>[=C2=A0 =C2=A0 3.452225] ffa0:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0006ec190 00000004 00000001 00000000 00000001=
 006ec190</div><div>[=C2=A0 =C2=A0 3.461351] ffc0: 006ec190 00000004 000000=
04 000000f8 00000000 00000000 00507a7c 00000000</div><div>[=C2=A0 =C2=A0 3.=
470476] ffe0: 00507b34 7ed76a14 00497934 76dcc574</div><div>[=C2=A0 =C2=A0 =
3.476121] CPU1: stopping</div><div>[=C2=A0 =C2=A0 3.479141] CPU: 1 PID: 99 =
Comm: jffs2_gcd_mtd5 Not tainted 5.8.17-3cc95ae #1</div><div>[=C2=A0 =C2=A0=
 3.487099] Hardware name: Generic DT based system</div></div><div><br></div=
><div><br></div><div><br></div><div>Regards,</div><div>Vinoth Kumar RK</div=
></div></div></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Fri, 5 Feb 2021 at 14:58, Troy Lee &lt;<a href=
=3D"mailto:troy_lee@aspeedtech.com">troy_lee@aspeedtech.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"gmail-m_-3622655205325152665WordSection1">
<p class=3D"MsoNormal">Hi Vinothkumar,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">If you want to boot different Kernel from TFTP, I th=
ink you can use tftp command in u-boot.<u></u><u></u></p>
<p class=3D"MsoNormal">ast# dhcp<u></u><u></u></p>
<p class=3D"MsoNormal">ast# tftp 0x83000000 serverip:/path/image-kernel<u><=
/u><u></u></p>
<p class=3D"MsoNormal">ast# bootm 0x83000000<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">If you want to use qemu options loading u-boot/kerne=
l images to different memory offset, I=E2=80=99m not familiar with this. Ne=
ed some expert=E2=80=99s help here.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thanks,<u></u><u></u></p>
<p class=3D"MsoNormal">Troy Lee<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b>From:</b> VINOTHKUMAR RK &lt;<a href=3D"mailto:vk=
rk.user@gmail.com" target=3D"_blank">vkrk.user@gmail.com</a>&gt; <br>
<b>Sent:</b> Friday, February 5, 2021 4:16 PM<br>
<b>To:</b> Troy Lee &lt;<a href=3D"mailto:troy_lee@aspeedtech.com" target=
=3D"_blank">troy_lee@aspeedtech.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">op=
enbmc@lists.ozlabs.org</a><br>
<b>Subject:</b> Re: evb-ast2600: Getting some build errors - &#39;u-boot.bi=
n&#39; is too large!&#39;<u></u><u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<div>
<div>
<p class=3D"MsoNormal">Hi Troy,<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks a lot for your input!<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Looks like there was some problem with my Qemu. I wa=
s using some older version &quot;version 4.2.1 (Debian 1:4.2-3ubuntu6.11)&q=
uot;.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">The=C2=A0image came up fine when I tried with the la=
test Qemu &quot;aspeed-6.0&quot; branch, it gives the image version which y=
ou&#39;re using.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Output:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">---------<u></u><u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">Phosphor OpenBMC (Phosphor OpenBMC Project Reference=
 Distro) 0.1.0 evb-ast2600 ttyS4<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">evb-ast2600 login: root<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Password:=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">root@evb-ast2600:~#=C2=A0<u></u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">BTW, is there an option with Qemu to boot u-boot and=
 linux image separately? Also something like TFTP from u-boot (Qemu) to my =
VM (Ubuntu) where I&#39;m running my TFTP server. Please=C2=A0let me know i=
f there are any steps for the same.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Regards,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Vinoth Kumar RK<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>
</div>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Fri, 5 Feb 2021 at 12:59, Troy Lee &lt;<a href=3D=
"mailto:troy_lee@aspeedtech.com" target=3D"_blank">troy_lee@aspeedtech.com<=
/a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<p class=3D"MsoNormal">Hi Vinothkumar,<br>
<br>
I=E2=80=99m not sure what=E2=80=99s wrong. Beware that the QEMU will direct=
ly write into your image file, so you might want to running it on a copy or=
 use -snapshot option.<br>
<br>
I could boot into OS with the following qemu command:<br>
qemu-system-arm -M ast2600-evb -drive file=3Dimage-bmc,format=3Draw,if=3Dmt=
d -nographic -nic user<br>
<br>
My QEMU version:<br>
qemu-system-arm --version<br>
QEMU emulator version 5.2.50 (v5.2.0-991-g45240eed4f)<br>
Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers<br>
<br>
Thanks,<br>
Troy Lee<br>
<br>
From: VINOTHKUMAR RK &lt;<a href=3D"mailto:vkrk.user@gmail.com" target=3D"_=
blank">vkrk.user@gmail.com</a>&gt;
<br>
Sent: Friday, February 5, 2021 12:19 PM<br>
To: Troy Lee &lt;<a href=3D"mailto:troy_lee@aspeedtech.com" target=3D"_blan=
k">troy_lee@aspeedtech.com</a>&gt;<br>
Cc: <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@l=
ists.ozlabs.org</a><br>
Subject: Re: evb-ast2600: Getting some build errors - &#39;u-boot.bin&#39; =
is too large!&#39;<br>
<br>
Hi Troy,<br>
<br>
Thanks for sharing the changes, with this I&#39;m able to generate=C2=A0mtd=
 image. But when I try to load them through Qemu,=C2=A0it&#39;s getting stu=
ck with the below error. Is there any workaround?<br>
<br>
Error log:<br>
------------<br>
fdt_root: FDT_ERR_BADMAGIC<br>
ERROR: root node setup failed<br>
=C2=A0- must RESET the board to recover.<br>
<br>
FDT creation failed! hanging...### ERROR ### Please RESET the board ###<br>
<br>
<br>
Qemu command:<br>
-----------------------<br>
qemu-system-arm -m 1G -M ast2600-evb -nographic -drive file=3Dobmc-phosphor=
-image-evb-ast2600-20210205034901.static.mtd,format=3Draw,if=3Dmtd -net nic=
 -net user,hostfwd=3D:127.0.0.1:2222-:22,hostfwd=3D:127.0.0.1:2443-:443,hos=
tname=3Dqemu<br>
<br>
Qemu log:<br>
--------------<br>
U-Boot 2019.04 (Feb 04 2021 - 10:27:21 +0000)<br>
<br>
SOC: AST2600-A0=C2=A0<br>
eSPI Mode: SIO:Enable : SuperIO-2e<br>
Eth: MAC0: RGMII, MAC1: RGMII, MAC2: RGMII, MAC3: RGMII<br>
Model: AST2600 EVB<br>
DRAM:=C2=A0 already initialized, 240 MiB (capacity:256 MiB, VGA:64 MiB), EC=
C off<br>
PCIE-0: Link down<br>
MMC:=C2=A0 =C2=A0<br>
<br>
sdhci_slot0@100: 1, sdhci_slot1@200: 2, emmc_slot0@100: 0<br>
Loading Environment from SPI Flash... *** Warning - spi_flash_probe_bus_cs(=
) failed, using default environment<br>
<br>
In:=C2=A0 =C2=A0 serial@1e784000<br>
Out:=C2=A0 =C2=A0serial@1e784000<br>
Err:=C2=A0 =C2=A0serial@1e784000<br>
Model: AST2600 EVB<br>
Net:=C2=A0 =C2=A0<br>
Warning: ftgmac@1e660000 (eth0) using random MAC address - 5e:23:16:3b:07:d=
b<br>
eth0: ftgmac@1e660000<br>
Warning: ftgmac@1e680000 (eth1) using random MAC address - 92:2d:b9:4b:a5:9=
3<br>
, eth1: ftgmac@1e680000<br>
Warning: ftgmac@1e670000 (eth2) using random MAC address - f6:16:60:c6:0a:2=
d<br>
, eth2: ftgmac@1e670000<br>
Warning: ftgmac@1e690000 (eth3) using random MAC address - 02:43:32:16:41:6=
d<br>
, eth3: ftgmac@1e690000<br>
Hit any key to stop autoboot:=C2=A0 0=C2=A0<br>
## Loading kernel from FIT Image at 20100000 ...<br>
=C2=A0 =C2=A0Using &#39;conf@aspeed-ast2600-evb.dtb&#39; configuration<br>
=C2=A0 =C2=A0Trying &#39;kernel@1&#39; kernel subimage<br>
=C2=A0 =C2=A0 =C2=A0Description:=C2=A0 Linux kernel<br>
=C2=A0 =C2=A0 =C2=A0Type:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Kernel Image<br>
=C2=A0 =C2=A0 =C2=A0Compression:=C2=A0 uncompressed<br>
=C2=A0 =C2=A0 =C2=A0Data Start:=C2=A0 =C2=A00x2010012c<br>
=C2=A0 =C2=A0 =C2=A0Data Size:=C2=A0 =C2=A0 3527112 Bytes =3D 3.4 MiB<br>
=C2=A0 =C2=A0 =C2=A0Architecture: ARM<br>
=C2=A0 =C2=A0 =C2=A0OS:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Linux<br>
=C2=A0 =C2=A0 =C2=A0Load Address: 0x80001000<br>
=C2=A0 =C2=A0 =C2=A0Entry Point:=C2=A0 0x80001000<br>
=C2=A0 =C2=A0 =C2=A0Hash algo:=C2=A0 =C2=A0 sha256<br>
=C2=A0 =C2=A0 =C2=A0Hash value:=C2=A0 =C2=A0d3bfde4459bab8272cda12f0747d477=
35521c9ee4f5786283cfea439398c976d<br>
=C2=A0 =C2=A0Verifying Hash Integrity ... sha256+ OK<br>
## Loading ramdisk from FIT Image at 20100000 ...<br>
=C2=A0 =C2=A0Using &#39;conf@aspeed-ast2600-evb.dtb&#39; configuration<br>
=C2=A0 =C2=A0Trying &#39;ramdisk@1&#39; ramdisk subimage<br>
=C2=A0 =C2=A0 =C2=A0Description:=C2=A0 obmc-phosphor-initramfs<br>
=C2=A0 =C2=A0 =C2=A0Type:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RAMDisk Image<br=
>
=C2=A0 =C2=A0 =C2=A0Compression:=C2=A0 uncompressed<br>
=C2=A0 =C2=A0 =C2=A0Data Start:=C2=A0 =C2=A00x20465cf8<br>
=C2=A0 =C2=A0 =C2=A0Data Size:=C2=A0 =C2=A0 1087608 Bytes =3D 1 MiB<br>
=C2=A0 =C2=A0 =C2=A0Architecture: ARM<br>
=C2=A0 =C2=A0 =C2=A0OS:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Linux<br>
=C2=A0 =C2=A0 =C2=A0Load Address: unavailable<br>
=C2=A0 =C2=A0 =C2=A0Entry Point:=C2=A0 unavailable<br>
=C2=A0 =C2=A0 =C2=A0Hash algo:=C2=A0 =C2=A0 sha256<br>
=C2=A0 =C2=A0 =C2=A0Hash value:=C2=A0 =C2=A0488f44eb0c954ef85ede0c1dde38036=
96b3637d41996fc2be9610bbdb756b1a9<br>
=C2=A0 =C2=A0Verifying Hash Integrity ... sha256+ OK<br>
## Loading fdt from FIT Image at 20100000 ...<br>
=C2=A0 =C2=A0Using &#39;conf@aspeed-ast2600-evb.dtb&#39; configuration<br>
=C2=A0 =C2=A0Trying &#39;fdt@aspeed-ast2600-evb.dtb&#39; fdt subimage<br>
=C2=A0 =C2=A0 =C2=A0Description:=C2=A0 Flattened Device Tree blob<br>
=C2=A0 =C2=A0 =C2=A0Type:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Flat Device Tree=
<br>
=C2=A0 =C2=A0 =C2=A0Compression:=C2=A0 uncompressed<br>
=C2=A0 =C2=A0 =C2=A0Data Start:=C2=A0 =C2=A00x2045d408<br>
=C2=A0 =C2=A0 =C2=A0Data Size:=C2=A0 =C2=A0 34852 Bytes =3D 34 KiB<br>
=C2=A0 =C2=A0 =C2=A0Architecture: ARM<br>
=C2=A0 =C2=A0 =C2=A0Hash algo:=C2=A0 =C2=A0 sha256<br>
=C2=A0 =C2=A0 =C2=A0Hash value:=C2=A0 =C2=A0a9bcf2a34ea7477d2c5f86ec793b659=
ecce07554dee5897460198f513ede4d0b<br>
=C2=A0 =C2=A0Verifying Hash Integrity ... sha256+ OK<br>
=C2=A0 =C2=A0Booting using the fdt blob at 0x2045d408<br>
=C2=A0 =C2=A0Loading Kernel Image ... OK<br>
=C2=A0 =C2=A0Loading Ramdisk to 8ce57000, end 8cf60878 ... OK<br>
=C2=A0 =C2=A0Loading Device Tree to 8ce4b000, end 8ce56823 ... OK<br>
fdt_root: FDT_ERR_BADMAGIC<br>
ERROR: root node setup failed<br>
=C2=A0- must RESET the board to recover.<br>
<br>
FDT creation failed! hanging...### ERROR ### Please RESET the board ###<br>
<br>
<br>
<br>
<br>
<br>
Regards,<br>
Vinoth Kumar RK<br>
<br>
On Fri, 5 Feb 2021 at 07:57, Troy Lee &lt;mailto:<a href=3D"mailto:troy_lee=
@aspeedtech.com" target=3D"_blank">troy_lee@aspeedtech.com</a>&gt; wrote:<b=
r>
Hi Vinothkumar,<br>
=C2=A0<br>
Please refer to the following two changes in Gerrit:<br>
=E2=80=A2 <a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/meta-phos=
phor/+/39343" target=3D"_blank">
https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/39343</a><br>
=E2=80=A2 <a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/meta-aspe=
ed/+/39344" target=3D"_blank">
https://gerrit.openbmc-project.xyz/c/openbmc/meta-aspeed/+/39344</a><br>
=C2=A0<br>
Thanks,<br>
Troy Lee<br>
=C2=A0<br>
From: openbmc &lt;openbmc-bounces+troy_lee=3Dmailto:<a href=3D"mailto:aspee=
dtech.com@lists.ozlabs.org" target=3D"_blank">aspeedtech.com@lists.ozlabs.o=
rg</a>&gt; On Behalf Of VINOTHKUMAR RK<br>
Sent: Thursday, February 4, 2021 8:28 PM<br>
To: mailto:<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">op=
enbmc@lists.ozlabs.org</a><br>
Subject: evb-ast2600: Getting some build errors - &#39;u-boot.bin&#39; is t=
oo large!&#39;<br>
=C2=A0<br>
Hi,<br>
=C2=A0<br>
I&#39;m trying to build for evb-ast2600 platform, but it doesn&#39;t succee=
d. Please help.<br>
=C2=A0<br>
Build command: (fresh checkout and build)<br>
TEMPLATECONF=3Dmeta-evb/meta-evb-aspeed/meta-evb-ast2600/conf . openbmc-env=
<br>
bitbake obmc-phosphor-image<br>
=C2=A0<br>
Branch details:<br>
commit 7dc2f7a38dccb3d87a9b79d0a66b25da1027a72f=C2=A0<br>
=C2=A0<br>
=C2=A0<br>
Error Log:<br>
Loading cache: 100% | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | ETA: =C2=A0--:--:--<br>
Loaded 0 entries from dependency cache.<br>
Parsing recipes: 100% |####################################################=
###########################################################################=
#########################################| Time: 0:00:44<br>
Parsing of 2424 .bb files complete (0 cached, 2424 parsed). 3683 targets, 3=
62 skipped, 0 masked, 0 errors.<br>
WARNING: No bb files in default matched BBFILE_PATTERN_meta-evb-ast2600 &#3=
9;^/home/vinoth/project/openbmc/meta-evb/meta-evb-aspeed/meta-evb-ast2600/&=
#39;<br>
NOTE: Resolving any missing task queue dependencies<br>
<br>
Build Configuration:<br>
BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;1.49.0&quot;<br>
BUILD_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-linux&q=
uot;<br>
NATIVELSBSTRING =C2=A0 =C2=A0 =C2=A0=3D &quot;ubuntu-20.04&quot;<br>
TARGET_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;arm-openbmc-linux-g=
nueabi&quot;<br>
MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;evb-ast26=
00&quot;<br>
DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;openbmc-p=
hosphor&quot;<br>
DISTRO_VERSION =C2=A0 =C2=A0 =C2=A0 =3D &quot;0.1.0&quot;<br>
TUNE_FEATURES =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;arm armv7a vfp vfpv4d16 =
callconvention-hard&quot;<br>
TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;hard&quot;<br>
meta =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
meta-poky =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
meta-oe =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
meta-networking =C2=A0 =C2=A0 =C2=A0<br>
meta-python =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
meta-phosphor =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
meta-aspeed =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
meta-evb-ast2600 =C2=A0 =C2=A0 =3D &quot;master:7dc2f7a38dccb3d87a9b79d0a66=
b25da1027a72f&quot;<br>
<br>
Initialising tasks: 100% |#################################################=
###########################################################################=
#########################################| Time: 0:00:03<br>
Sstate summary: Wanted 1378 Found 939 Missed 439 Current 0 (68% match, 0% c=
omplete)<br>
NOTE: Executing Tasks<br>
WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_metadata: F=
eature &#39;phosphor-gpio-keys&#39; not found, but KERNEL_DANGLING_FEATURES=
_WARN_ONLY is set<br>
WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_metadata: T=
his may cause runtime issues, dropping feature and allowing configuration t=
o continue<br>
WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_metadata: F=
eature &#39;phosphor-vlan&#39; not found, but KERNEL_DANGLING_FEATURES_WARN=
_ONLY is set<br>
WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_metadata: T=
his may cause runtime issues, dropping feature and allowing configuration t=
o continue<br>
WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_configme: F=
eature &#39;phosphor-gpio-keys&#39; not found, but KERNEL_DANGLING_FEATURES=
_WARN_ONLY is set<br>
WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_configme: T=
his may cause runtime issues, dropping feature and allowing configuration t=
o continue<br>
WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_configme: F=
eature &#39;phosphor-vlan&#39; not found, but KERNEL_DANGLING_FEATURES_WARN=
_ONLY is set<br>
WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_configme: T=
his may cause runtime issues, dropping feature and allowing configuration t=
o continue<br>
WARNING: obmc-phosphor-sysd-1.0-r1 do_package_qa: QA Issue: obmc-phosphor-s=
ysd: SRC_URI uses PN not BPN [src-uri-bad]<br>
ERROR: obmc-phosphor-image-1.0-r0 do_generate_static: Image &#39;/home/vino=
th/project/openbmc/build/tmp/deploy/images/evb-ast2600/u-boot.bin&#39; is t=
oo large!<br>
ERROR: Logfile of failure stored in: /home/vinoth/project/openbmc/build/tmp=
/work/evb_ast2600-openbmc-linux-gnueabi/obmc-phosphor-image/1.0-r0/temp/log=
.do_generate_static.2176796<br>
ERROR: Task (/home/vinoth/project/openbmc/meta-phosphor/recipes-phosphor/im=
ages/obmc-phosphor-image.bb:do_generate_static) failed with exit code &#39;=
1&#39;<br>
NOTE: Tasks Summary: Attempted 4041 tasks of which 2680 didn&#39;t need to =
be rerun and 1 failed.<br>
<br>
Summary: 1 task failed:<br>
=C2=A0 /home/vinoth/project/openbmc/meta-phosphor/recipes-phosphor/images/o=
bmc-phosphor-image.bb:do_generate_static<br>
Summary: There were 10 WARNING messages shown.<br>
Summary: There was 1 ERROR message shown, returning a non-zero exit code.<b=
r>
=C2=A0<br>
=C2=A0<br>
=C2=A0<br>
Regards,<br>
VINOTHKUMAR RK<u></u><u></u></p>
</blockquote>
</div>
</div>
</div>

</blockquote></div>

--0000000000004a853d05bb5e860e--
