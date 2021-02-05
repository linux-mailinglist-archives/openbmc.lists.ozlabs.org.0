Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E929310671
	for <lists+openbmc@lfdr.de>; Fri,  5 Feb 2021 09:16:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DX7YY0Lj6zDvYB
	for <lists+openbmc@lfdr.de>; Fri,  5 Feb 2021 19:16:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::529;
 helo=mail-ed1-x529.google.com; envelope-from=vkrk.user@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Lnc0Ly6c; dkim-atps=neutral
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DX7Xd0SMczDqCZ
 for <openbmc@lists.ozlabs.org>; Fri,  5 Feb 2021 19:15:59 +1100 (AEDT)
Received: by mail-ed1-x529.google.com with SMTP id t5so7718997eds.12
 for <openbmc@lists.ozlabs.org>; Fri, 05 Feb 2021 00:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UsI6jZmli1hwtcEvp6TrvsGKXL056wRx+am8xmVEufc=;
 b=Lnc0Ly6cdkvhIPkHjuLbJhlH3hF7QZfy/14GMNHLBBVrEvj0ptciCPnHLLmH59Mm9O
 rN5o1wgqy2TDMdEASpLBfaR0xqBnLAQs8hXTrFUGlCdrgq7VN3Q6njvk5i5iXocNQXKL
 jv7THZYPhsozCzJRpBf5Cx/qCBCGAPEtKhs8HS4IINz4vV1PfVRBoZcgc0vHSFkN/46K
 4HqhqMHYU2YksMzP9CIPvtmkeQylE4/R1FYnra+ZbnS8xo8HdlOli9xeAVe2Iz1XlDEb
 d4FVNMWAo/jWo9QknT28/7nAuD6rg0YWtlDaHxuMQ+buiw9RSlymQle0UQggX3kFE+zc
 HGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UsI6jZmli1hwtcEvp6TrvsGKXL056wRx+am8xmVEufc=;
 b=QXaXeTddADqcj53mUs3VYruvWFCoFBpxRof7Kh4tOm0n0SW7XfOkoV5Hab4rWm/Q7g
 9HsGebTZBANXi5GY0buUzhBkWIbatBlXM9sHJPKJhXIvFugbBq1p4FBWm7i+AZLKZqxP
 IRw8KsiLUvHCoBm2WNonBbhGQyYXEH/6g7RSfHGNO/auYHGzQu1nzDlLvXIyK2G8vQvD
 9hUXXW1Mtz/Qgk1To7Q2c3qwxwAfGzPpo+oFeHJCiaAS3TlbG/km8c+OFWKASy8daO6K
 dzXRlfQH6D4zDYp1coOHsGvswkqUc+mG3qi89AvmiRx1LxdjqzLI1nxKsJ2XZLi5By9i
 aHLg==
X-Gm-Message-State: AOAM532VDJpFlQ+fKxqOrivqb9cvUnhERNJtp+bs3gBr+Q2dkJbxToNc
 iSF8GfIMQw3olN1bmagH47a8h9Mq8qwJeHNS1wmBNO0f9pVgTA==
X-Google-Smtp-Source: ABdhPJw8jGeI2ZX5zq8o6APfHjNkboZw+Dsk/chcJ5sYYm217wTAeU/hMecmuanojlxrsp803tTp84I08iHYdqC8OAY=
X-Received: by 2002:aa7:cd8c:: with SMTP id x12mr2480267edv.355.1612512950455; 
 Fri, 05 Feb 2021 00:15:50 -0800 (PST)
MIME-Version: 1.0
References: <CAHf5csd1tt-VNS9Wfuwqito2Fy75bfhArAEhZP_d1LXeOz+YVA@mail.gmail.com>
 <PS1PR06MB2600DD0B6A4F3F30C771342A8AB29@PS1PR06MB2600.apcprd06.prod.outlook.com>
 <CAHf5csdnjHmMm6HFqevH=w=QLwZ1PzZ4UTDOq7sxYaoVn__8rg@mail.gmail.com>
 <PS1PR06MB2600313E52EEEDB5DE51263C8AB29@PS1PR06MB2600.apcprd06.prod.outlook.com>
In-Reply-To: <PS1PR06MB2600313E52EEEDB5DE51263C8AB29@PS1PR06MB2600.apcprd06.prod.outlook.com>
From: VINOTHKUMAR RK <vkrk.user@gmail.com>
Date: Fri, 5 Feb 2021 13:45:39 +0530
Message-ID: <CAHf5csedpO-vmyyAq8Ut5YzYyzvPfNz0osJSvWYyUHX9hmxWeA@mail.gmail.com>
Subject: Re: evb-ast2600: Getting some build errors - 'u-boot.bin' is too
 large!'
To: Troy Lee <troy_lee@aspeedtech.com>
Content-Type: multipart/alternative; boundary="0000000000009b91c705ba926dab"
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

--0000000000009b91c705ba926dab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Troy,

Thanks a lot for your input!

Looks like there was some problem with my Qemu. I was using some older
version "version 4.2.1 (Debian 1:4.2-3ubuntu6.11)".
The image came up fine when I tried with the latest Qemu "aspeed-6.0"
branch, it gives the image version which you're using.

Output:
---------
Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) 0.1.0
evb-ast2600 ttyS4

evb-ast2600 login: root
Password:
root@evb-ast2600:~#

BTW, is there an option with Qemu to boot u-boot and linux image
separately? Also something like TFTP from u-boot (Qemu) to my VM (Ubuntu)
where I'm running my TFTP server. Please let me know if there are any steps
for the same.


Regards,
Vinoth Kumar RK


On Fri, 5 Feb 2021 at 12:59, Troy Lee <troy_lee@aspeedtech.com> wrote:

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

--0000000000009b91c705ba926dab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi Troy=
,<div><br></div><div>Thanks a lot for your input!</div><div><br></div><div>=
Looks like there was some problem with my Qemu. I was using some older vers=
ion &quot;version 4.2.1 (Debian 1:4.2-3ubuntu6.11)&quot;.</div><div>The=C2=
=A0image came up fine when I tried with the latest Qemu &quot;aspeed-6.0&qu=
ot; branch, it gives the image version which you&#39;re using.</div><div><b=
r></div><div>Output:</div><div>---------</div><div><div>Phosphor OpenBMC (P=
hosphor OpenBMC Project Reference Distro) 0.1.0 evb-ast2600 ttyS4</div><div=
><br></div><div>evb-ast2600 login: root</div><div>Password:=C2=A0</div><div=
>root@evb-ast2600:~#=C2=A0</div></div><div><br></div><div>BTW, is there an =
option with Qemu to boot u-boot and linux image separately? Also something =
like TFTP from u-boot (Qemu) to my VM (Ubuntu) where I&#39;m running my TFT=
P server. Please=C2=A0let me know if there are any steps for the same.</div=
><div><br></div><div><br></div><div>Regards,</div><div>Vinoth Kumar RK</div=
><div><br></div></div></div></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Fri, 5 Feb 2021 at 12:59, Troy Lee &lt=
;<a href=3D"mailto:troy_lee@aspeedtech.com">troy_lee@aspeedtech.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Vinot=
hkumar,<br>
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
blank">vkrk.user@gmail.com</a>&gt; <br>
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
phor/+/39343" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-p=
roject.xyz/c/openbmc/meta-phosphor/+/39343</a><br>
=E2=80=A2 <a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/meta-aspe=
ed/+/39344" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-pro=
ject.xyz/c/openbmc/meta-aspeed/+/39344</a><br>
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
VINOTHKUMAR RK<br>
</blockquote></div>

--0000000000009b91c705ba926dab--
