Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FBC310401
	for <lists+openbmc@lfdr.de>; Fri,  5 Feb 2021 05:20:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DX2Jq6zstzDvbM
	for <lists+openbmc@lfdr.de>; Fri,  5 Feb 2021 15:20:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52e;
 helo=mail-ed1-x52e.google.com; envelope-from=vkrk.user@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Wt3n1mkE; dkim-atps=neutral
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DX2Hp6NbRzDvbG
 for <openbmc@lists.ozlabs.org>; Fri,  5 Feb 2021 15:19:33 +1100 (AEDT)
Received: by mail-ed1-x52e.google.com with SMTP id q2so7162440edi.4
 for <openbmc@lists.ozlabs.org>; Thu, 04 Feb 2021 20:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ttmui+t8Kxt2hqB3U15CcmDM9YJNY/jMFEunvreD5DQ=;
 b=Wt3n1mkEBhFw6eA23N5zoxDt1nC+ulP0F0J/RwwUaOXwVOZlmQ7lXmMj1BmEzuNpOp
 L014OHOURV2eUyZoETMOZoQDmU4h+BFbF+0AwxZ9a4jjZ3HPpgbbhduGHUA6apFgH4ye
 4JSO4oUYRMOm6M8/pUspEM6Izig7rLcY9O+PNT5mHfxSWGoUTPvLHUHmhe6Q2byPLUgz
 5pwMyReKr/5p9xwWR4OS/7K1r6Qixddhzm/4KqQURwGR8x7kABVoge0SYb7YuqBp9eR6
 efKUWX4jL1fXjyUkBrhbUmqbUPmYVYOuGlPTpxr/z9dq3La4BeY7P7+sTK1G90irZmTQ
 ihNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ttmui+t8Kxt2hqB3U15CcmDM9YJNY/jMFEunvreD5DQ=;
 b=P4QN0GrkE0unQz9yr0dQDcZsi35vBWUtJ4C4CztVJpU5/iTzjUhnAg9+aL7w9ugbCF
 OFWpD6u+s6OMS8WKy0hAEOaNUFlB9IAX4vmYswLnGOnznFHg0JjskUs9ooYOsZEAxzmw
 JPRC1MyYcaMd5b24CfsvKIz7hmiOOuxeMhM7pFWbde/Je4LDEwyaJuE12a1UFQYlM54h
 30eTPHXkjIvjL95V6dEya9GDb/Vy9OhikHHP0gLnBE7gc738fLx/6FbHRgsbS07l10rp
 wuLGn/HNzF9hhxNPG9iemzrw9df9DDaVhQZ3AoFfl+ny4ZKXJIfYcFrxfrOPSJkZK0FI
 Kchg==
X-Gm-Message-State: AOAM5329Wl9715P1NmixNokn2MdygEjDKfThe6F3l+9lSu1fwZTeEb3Z
 wTNlRtoJYw+qYTujBkBhlcUblJ6bXIG6HRV0mXX1ZvOQic852w==
X-Google-Smtp-Source: ABdhPJxc9XVV5ucYebszW7R8ugl08cYJ4iEpTlqCxItipBVPjGf2hkapgYlDzxp6dqfdsC8i3/cBAk3LikeOjbpCIbs=
X-Received: by 2002:a50:fe85:: with SMTP id d5mr1841991edt.140.1612498767545; 
 Thu, 04 Feb 2021 20:19:27 -0800 (PST)
MIME-Version: 1.0
References: <CAHf5csd1tt-VNS9Wfuwqito2Fy75bfhArAEhZP_d1LXeOz+YVA@mail.gmail.com>
 <PS1PR06MB2600DD0B6A4F3F30C771342A8AB29@PS1PR06MB2600.apcprd06.prod.outlook.com>
In-Reply-To: <PS1PR06MB2600DD0B6A4F3F30C771342A8AB29@PS1PR06MB2600.apcprd06.prod.outlook.com>
From: VINOTHKUMAR RK <vkrk.user@gmail.com>
Date: Fri, 5 Feb 2021 09:49:16 +0530
Message-ID: <CAHf5csdnjHmMm6HFqevH=w=QLwZ1PzZ4UTDOq7sxYaoVn__8rg@mail.gmail.com>
Subject: Re: evb-ast2600: Getting some build errors - 'u-boot.bin' is too
 large!'
To: Troy Lee <troy_lee@aspeedtech.com>
Content-Type: multipart/alternative; boundary="0000000000003d872b05ba8f20ab"
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

--0000000000003d872b05ba8f20ab
Content-Type: text/plain; charset="UTF-8"

Hi Troy,

Thanks for sharing the changes, with this I'm able to generate mtd image.
But when I try to load them through Qemu, it's getting stuck with the below
error. Is there any workaround?

Error log:
------------
fdt_root: FDT_ERR_BADMAGIC
ERROR: root node setup failed
 - must RESET the board to recover.

FDT creation failed! hanging...### ERROR ### Please RESET the board ###


Qemu command:
-----------------------
qemu-system-arm -m 1G -M ast2600-evb -nographic -drive
file=obmc-phosphor-image-evb-ast2600-20210205034901.static.mtd,format=raw,if=mtd
-net nic -net user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:2443
-:443,hostname=qemu

Qemu log:
--------------
U-Boot 2019.04 (Feb 04 2021 - 10:27:21 +0000)

SOC: AST2600-A0
eSPI Mode: SIO:Enable : SuperIO-2e
Eth: MAC0: RGMII, MAC1: RGMII, MAC2: RGMII, MAC3: RGMII
Model: AST2600 EVB
DRAM:  already initialized, 240 MiB (capacity:256 MiB, VGA:64 MiB), ECC off
PCIE-0: Link down
MMC:

sdhci_slot0@100: 1, sdhci_slot1@200: 2, emmc_slot0@100: 0
Loading Environment from SPI Flash... *** Warning -
spi_flash_probe_bus_cs() failed, using default environment

In:    serial@1e784000
Out:   serial@1e784000
Err:   serial@1e784000
Model: AST2600 EVB
Net:
Warning: ftgmac@1e660000 (eth0) using random MAC address - 5e:23:16:3b:07:db
eth0: ftgmac@1e660000
Warning: ftgmac@1e680000 (eth1) using random MAC address - 92:2d:b9:4b:a5:93
, eth1: ftgmac@1e680000
Warning: ftgmac@1e670000 (eth2) using random MAC address - f6:16:60:c6:0a:2d
, eth2: ftgmac@1e670000
Warning: ftgmac@1e690000 (eth3) using random MAC address - 02:43:32:16:41:6d
, eth3: ftgmac@1e690000
Hit any key to stop autoboot:  0
## Loading kernel from FIT Image at 20100000 ...
   Using 'conf@aspeed-ast2600-evb.dtb' configuration
   Trying 'kernel@1' kernel subimage
     Description:  Linux kernel
     Type:         Kernel Image
     Compression:  uncompressed
     Data Start:   0x2010012c
     Data Size:    3527112 Bytes = 3.4 MiB
     Architecture: ARM
     OS:           Linux
     Load Address: 0x80001000
     Entry Point:  0x80001000
     Hash algo:    sha256
     Hash value:
 d3bfde4459bab8272cda12f0747d47735521c9ee4f5786283cfea439398c976d
   Verifying Hash Integrity ... sha256+ OK
## Loading ramdisk from FIT Image at 20100000 ...
   Using 'conf@aspeed-ast2600-evb.dtb' configuration
   Trying 'ramdisk@1' ramdisk subimage
     Description:  obmc-phosphor-initramfs
     Type:         RAMDisk Image
     Compression:  uncompressed
     Data Start:   0x20465cf8
     Data Size:    1087608 Bytes = 1 MiB
     Architecture: ARM
     OS:           Linux
     Load Address: unavailable
     Entry Point:  unavailable
     Hash algo:    sha256
     Hash value:
 488f44eb0c954ef85ede0c1dde3803696b3637d41996fc2be9610bbdb756b1a9
   Verifying Hash Integrity ... sha256+ OK
## Loading fdt from FIT Image at 20100000 ...
   Using 'conf@aspeed-ast2600-evb.dtb' configuration
   Trying 'fdt@aspeed-ast2600-evb.dtb' fdt subimage
     Description:  Flattened Device Tree blob
     Type:         Flat Device Tree
     Compression:  uncompressed
     Data Start:   0x2045d408
     Data Size:    34852 Bytes = 34 KiB
     Architecture: ARM
     Hash algo:    sha256
     Hash value:
 a9bcf2a34ea7477d2c5f86ec793b659ecce07554dee5897460198f513ede4d0b
   Verifying Hash Integrity ... sha256+ OK
   Booting using the fdt blob at 0x2045d408
   Loading Kernel Image ... OK
   Loading Ramdisk to 8ce57000, end 8cf60878 ... OK
   Loading Device Tree to 8ce4b000, end 8ce56823 ... OK
fdt_root: FDT_ERR_BADMAGIC
ERROR: root node setup failed
 - must RESET the board to recover.

FDT creation failed! hanging...### ERROR ### Please RESET the board ###





Regards,
Vinoth Kumar RK

On Fri, 5 Feb 2021 at 07:57, Troy Lee <troy_lee@aspeedtech.com> wrote:

> Hi Vinothkumar,
>
>
>
> Please refer to the following two changes in Gerrit:
>
>    - https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/39343
>    - https://gerrit.openbmc-project.xyz/c/openbmc/meta-aspeed/+/39344
>
>
>
> Thanks,
>
> Troy Lee
>
>
>
> *From:* openbmc <openbmc-bounces+troy_lee=aspeedtech.com@lists.ozlabs.org>
> *On Behalf Of *VINOTHKUMAR RK
> *Sent:* Thursday, February 4, 2021 8:28 PM
> *To:* openbmc@lists.ozlabs.org
> *Subject:* evb-ast2600: Getting some build errors - 'u-boot.bin' is too
> large!'
>
>
>
> Hi,
>
>
>
> I'm trying to build for evb-ast2600 platform, but it doesn't succeed.
> Please help.
>
>
>
> Build command: (fresh checkout and build)
>
> TEMPLATECONF=meta-evb/meta-evb-aspeed/meta-evb-ast2600/conf . openbmc-env
> bitbake obmc-phosphor-image
>
>
>
> Branch details:
>
> commit 7dc2f7a38dccb3d87a9b79d0a66b25da1027a72f
>
>
>
>
>
> Error Log:
>
> Loading cache: 100% |
>
>                                         | ETA:  --:--:--
> Loaded 0 entries from dependency cache.
> Parsing recipes: 100%
> |########################################################################################################################################################################|
> Time: 0:00:44
> Parsing of 2424 .bb files complete (0 cached, 2424 parsed). 3683 targets,
> 362 skipped, 0 masked, 0 errors.
> WARNING: No bb files in default matched BBFILE_PATTERN_meta-evb-ast2600
> '^/home/vinoth/project/openbmc/meta-evb/meta-evb-aspeed/meta-evb-ast2600/'
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           = "1.49.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "ubuntu-20.04"
> TARGET_SYS           = "arm-openbmc-linux-gnueabi"
> MACHINE              = "evb-ast2600"
> DISTRO               = "openbmc-phosphor"
> DISTRO_VERSION       = "0.1.0"
> TUNE_FEATURES        = "arm armv7a vfp vfpv4d16 callconvention-hard"
> TARGET_FPU           = "hard"
> meta
> meta-poky
> meta-oe
> meta-networking
> meta-python
> meta-phosphor
> meta-aspeed
> meta-evb-ast2600     = "master:7dc2f7a38dccb3d87a9b79d0a66b25da1027a72f"
>
> Initialising tasks: 100%
> |#####################################################################################################################################################################|
> Time: 0:00:03
> Sstate summary: Wanted 1378 Found 939 Missed 439 Current 0 (68% match, 0%
> complete)
> NOTE: Executing Tasks
> WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_metadata:
> Feature 'phosphor-gpio-keys' not found, but
> KERNEL_DANGLING_FEATURES_WARN_ONLY is set
> WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_metadata:
> This may cause runtime issues, dropping feature and allowing configuration
> to continue
> WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_metadata:
> Feature 'phosphor-vlan' not found, but KERNEL_DANGLING_FEATURES_WARN_ONLY
> is set
> WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_metadata:
> This may cause runtime issues, dropping feature and allowing configuration
> to continue
> WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_configme:
> Feature 'phosphor-gpio-keys' not found, but
> KERNEL_DANGLING_FEATURES_WARN_ONLY is set
> WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_configme:
> This may cause runtime issues, dropping feature and allowing configuration
> to continue
> WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_configme:
> Feature 'phosphor-vlan' not found, but KERNEL_DANGLING_FEATURES_WARN_ONLY
> is set
> WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_configme:
> This may cause runtime issues, dropping feature and allowing configuration
> to continue
> WARNING: obmc-phosphor-sysd-1.0-r1 do_package_qa: QA Issue:
> obmc-phosphor-sysd: SRC_URI uses PN not BPN [src-uri-bad]
> ERROR: obmc-phosphor-image-1.0-r0 do_generate_static: Image
> '/home/vinoth/project/openbmc/build/tmp/deploy/images/evb-ast2600/u-boot.bin'
> is too large!
> ERROR: Logfile of failure stored in:
> /home/vinoth/project/openbmc/build/tmp/work/evb_ast2600-openbmc-linux-gnueabi/obmc-phosphor-image/1.0-r0/temp/log.do_generate_static.2176796
> ERROR: Task
> (/home/vinoth/project/openbmc/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:do_generate_static)
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 4041 tasks of which 2680 didn't need to be
> rerun and 1 failed.
>
> Summary: 1 task failed:
>
> /home/vinoth/project/openbmc/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:
> do_generate_static
> Summary: There were 10 WARNING messages shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>
>
>
>
>
>
>
> Regards,
>
> VINOTHKUMAR RK
>

--0000000000003d872b05ba8f20ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr">Hi Troy,<div><br></div><div>Thanks for sharing the changes, with =
this I&#39;m able to generate=C2=A0mtd image. But when I try to load them t=
hrough Qemu,=C2=A0it&#39;s getting stuck with the below error. Is there any=
 workaround?</div><div><br></div><div>Error log:</div><div>------------</di=
v><div><div>fdt_root: FDT_ERR_BADMAGIC</div><div>ERROR: root node setup fai=
led</div><div>=C2=A0- must RESET the board to recover.</div><div><br></div>=
<div>FDT creation failed! hanging...### ERROR ### Please RESET the board ##=
#</div></div><div><br></div><div><br></div><div>Qemu command:</div><div>---=
--------------------</div><div>qemu-system-arm -m 1G -M ast2600-evb -nograp=
hic -drive file=3Dobmc-phosphor-image-evb-ast2600-20210205034901.static.mtd=
,format=3Draw,if=3Dmtd -net nic -net user,hostfwd=3D:127.0.0.1:2222-:22,hos=
tfwd=3D:127.0.0.1:2443-:443,hostname=3Dqemu<br></div><div><br></div><div>Qe=
mu log:</div><div>--------------</div><div><div>U-Boot 2019.04 (Feb 04 2021=
 - 10:27:21 +0000)</div><div><br></div><div>SOC: AST2600-A0=C2=A0</div><div=
>eSPI Mode: SIO:Enable : SuperIO-2e</div><div>Eth: MAC0: RGMII, MAC1: RGMII=
, MAC2: RGMII, MAC3: RGMII</div><div>Model: AST2600 EVB</div><div>DRAM:=C2=
=A0 already initialized, 240 MiB (capacity:256 MiB, VGA:64 MiB), ECC off</d=
iv><div>PCIE-0: Link down</div><div>MMC:=C2=A0 =C2=A0</div><div><br></div><=
div>sdhci_slot0@100: 1, sdhci_slot1@200: 2, emmc_slot0@100: 0</div><div>Loa=
ding Environment from SPI Flash... *** Warning - spi_flash_probe_bus_cs() f=
ailed, using default environment</div><div><br></div><div>In:=C2=A0 =C2=A0 =
serial@1e784000</div><div>Out:=C2=A0 =C2=A0serial@1e784000</div><div>Err:=
=C2=A0 =C2=A0serial@1e784000</div><div>Model: AST2600 EVB</div><div>Net:=C2=
=A0 =C2=A0</div><div>Warning: ftgmac@1e660000 (eth0) using random MAC addre=
ss - 5e:23:16:3b:07:db</div><div>eth0: ftgmac@1e660000</div><div>Warning: f=
tgmac@1e680000 (eth1) using random MAC address - 92:2d:b9:4b:a5:93</div><di=
v>, eth1: ftgmac@1e680000</div><div>Warning: ftgmac@1e670000 (eth2) using r=
andom MAC address - f6:16:60:c6:0a:2d</div><div>, eth2: ftgmac@1e670000</di=
v><div>Warning: ftgmac@1e690000 (eth3) using random MAC address - 02:43:32:=
16:41:6d</div><div>, eth3: ftgmac@1e690000</div><div>Hit any key to stop au=
toboot:=C2=A0 0=C2=A0</div><div>## Loading kernel from FIT Image at 2010000=
0 ...<br></div><div>=C2=A0 =C2=A0Using &#39;conf@aspeed-ast2600-evb.dtb&#39=
; configuration</div><div>=C2=A0 =C2=A0Trying &#39;kernel@1&#39; kernel sub=
image</div><div>=C2=A0 =C2=A0 =C2=A0Description:=C2=A0 Linux kernel</div><d=
iv>=C2=A0 =C2=A0 =C2=A0Type:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Kernel Image<=
/div><div>=C2=A0 =C2=A0 =C2=A0Compression:=C2=A0 uncompressed</div><div>=C2=
=A0 =C2=A0 =C2=A0Data Start:=C2=A0 =C2=A00x2010012c</div><div>=C2=A0 =C2=A0=
 =C2=A0Data Size:=C2=A0 =C2=A0 3527112 Bytes =3D 3.4 MiB</div><div>=C2=A0 =
=C2=A0 =C2=A0Architecture: ARM</div><div>=C2=A0 =C2=A0 =C2=A0OS:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Linux</div><div>=C2=A0 =C2=A0 =C2=A0Load Add=
ress: 0x80001000</div><div>=C2=A0 =C2=A0 =C2=A0Entry Point:=C2=A0 0x8000100=
0</div><div>=C2=A0 =C2=A0 =C2=A0Hash algo:=C2=A0 =C2=A0 sha256</div><div>=
=C2=A0 =C2=A0 =C2=A0Hash value:=C2=A0 =C2=A0d3bfde4459bab8272cda12f0747d477=
35521c9ee4f5786283cfea439398c976d</div><div>=C2=A0 =C2=A0Verifying Hash Int=
egrity ... sha256+ OK</div><div>## Loading ramdisk from FIT Image at 201000=
00 ...</div><div>=C2=A0 =C2=A0Using &#39;conf@aspeed-ast2600-evb.dtb&#39; c=
onfiguration</div><div>=C2=A0 =C2=A0Trying &#39;ramdisk@1&#39; ramdisk subi=
mage</div><div>=C2=A0 =C2=A0 =C2=A0Description:=C2=A0 obmc-phosphor-initram=
fs</div><div>=C2=A0 =C2=A0 =C2=A0Type:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RAM=
Disk Image</div><div>=C2=A0 =C2=A0 =C2=A0Compression:=C2=A0 uncompressed</d=
iv><div>=C2=A0 =C2=A0 =C2=A0Data Start:=C2=A0 =C2=A00x20465cf8</div><div>=
=C2=A0 =C2=A0 =C2=A0Data Size:=C2=A0 =C2=A0 1087608 Bytes =3D 1 MiB</div><d=
iv>=C2=A0 =C2=A0 =C2=A0Architecture: ARM</div><div>=C2=A0 =C2=A0 =C2=A0OS:=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Linux</div><div>=C2=A0 =C2=A0 =C2=
=A0Load Address: unavailable</div><div>=C2=A0 =C2=A0 =C2=A0Entry Point:=C2=
=A0 unavailable</div><div>=C2=A0 =C2=A0 =C2=A0Hash algo:=C2=A0 =C2=A0 sha25=
6</div><div>=C2=A0 =C2=A0 =C2=A0Hash value:=C2=A0 =C2=A0488f44eb0c954ef85ed=
e0c1dde3803696b3637d41996fc2be9610bbdb756b1a9</div><div>=C2=A0 =C2=A0Verify=
ing Hash Integrity ... sha256+ OK</div><div>## Loading fdt from FIT Image a=
t 20100000 ...</div><div>=C2=A0 =C2=A0Using &#39;conf@aspeed-ast2600-evb.dt=
b&#39; configuration</div><div>=C2=A0 =C2=A0Trying &#39;fdt@aspeed-ast2600-=
evb.dtb&#39; fdt subimage</div><div>=C2=A0 =C2=A0 =C2=A0Description:=C2=A0 =
Flattened Device Tree blob</div><div>=C2=A0 =C2=A0 =C2=A0Type:=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0Flat Device Tree</div><div>=C2=A0 =C2=A0 =C2=A0Compres=
sion:=C2=A0 uncompressed</div><div>=C2=A0 =C2=A0 =C2=A0Data Start:=C2=A0 =
=C2=A00x2045d408</div><div>=C2=A0 =C2=A0 =C2=A0Data Size:=C2=A0 =C2=A0 3485=
2 Bytes =3D 34 KiB</div><div>=C2=A0 =C2=A0 =C2=A0Architecture: ARM</div><di=
v>=C2=A0 =C2=A0 =C2=A0Hash algo:=C2=A0 =C2=A0 sha256</div><div>=C2=A0 =C2=
=A0 =C2=A0Hash value:=C2=A0 =C2=A0a9bcf2a34ea7477d2c5f86ec793b659ecce07554d=
ee5897460198f513ede4d0b</div><div>=C2=A0 =C2=A0Verifying Hash Integrity ...=
 sha256+ OK</div><div>=C2=A0 =C2=A0Booting using the fdt blob at 0x2045d408=
</div><div>=C2=A0 =C2=A0Loading Kernel Image ... OK</div><div>=C2=A0 =C2=A0=
Loading Ramdisk to 8ce57000, end 8cf60878 ... OK</div><div>=C2=A0 =C2=A0Loa=
ding Device Tree to 8ce4b000, end 8ce56823 ... OK</div><div>fdt_root: FDT_E=
RR_BADMAGIC</div><div>ERROR: root node setup failed</div><div>=C2=A0- must =
RESET the board to recover.</div><div><br></div><div>FDT creation failed! h=
anging...### ERROR ### Please RESET the board ###</div></div><div><br></div=
><div><br></div><div><br></div><div><br></div><div><br></div><div>Regards,<=
/div><div>Vinoth Kumar RK</div></div></div></div></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 5 Feb 2021 a=
t 07:57, Troy Lee &lt;<a href=3D"mailto:troy_lee@aspeedtech.com">troy_lee@a=
speedtech.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"gmail-m_-6097364044091149149WordSection1">
<p class=3D"MsoNormal">Hi Vinothkumar,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Please refer to the following two changes in Gerrit:=
<u></u><u></u></p>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li class=3D"gmail-m_-6097364044091149149MsoListParagraph" style=3D"margin-=
left:0cm"><a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/meta-phos=
phor/+/39343" target=3D"_blank">https://gerrit.openbmc-project.xyz/c/openbm=
c/meta-phosphor/+/39343</a><u></u><u></u></li><li class=3D"gmail-m_-6097364=
044091149149MsoListParagraph" style=3D"margin-left:0cm"><a href=3D"https://=
gerrit.openbmc-project.xyz/c/openbmc/meta-aspeed/+/39344" target=3D"_blank"=
>https://gerrit.openbmc-project.xyz/c/openbmc/meta-aspeed/+/39344</a><u></u=
><u></u></li></ul>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thanks,<u></u><u></u></p>
<p class=3D"MsoNormal">Troy Lee<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b>From:</b> openbmc &lt;openbmc-bounces+troy_lee=3D=
<a href=3D"mailto:aspeedtech.com@lists.ozlabs.org" target=3D"_blank">aspeed=
tech.com@lists.ozlabs.org</a>&gt;
<b>On Behalf Of </b>VINOTHKUMAR RK<br>
<b>Sent:</b> Thursday, February 4, 2021 8:28 PM<br>
<b>To:</b> <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">op=
enbmc@lists.ozlabs.org</a><br>
<b>Subject:</b> evb-ast2600: Getting some build errors - &#39;u-boot.bin&#3=
9; is too large!&#39;<u></u><u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">Hi,<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I&#39;m trying to build for evb-ast2600 platform, bu=
t it doesn&#39;t succeed. Please help.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Build command: (fresh checkout and build)<u></u><u><=
/u></p>
</div>
<div>
<p class=3D"MsoNormal">TEMPLATECONF=3Dmeta-evb/meta-evb-aspeed/meta-evb-ast=
2600/conf . openbmc-env<br>
bitbake obmc-phosphor-image<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Branch details:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">commit 7dc2f7a38dccb3d87a9b79d0a66b25da1027a72f=C2=
=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Error Log:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Loading cache: 100% | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA: =C2=A0--:--:--<br>
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
Summary: There was 1 ERROR message shown, returning a non-zero exit code.<u=
></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
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
<p class=3D"MsoNormal">VINOTHKUMAR RK<u></u><u></u></p>
</div>
</div>
</div>
</div>

</blockquote></div>

--0000000000003d872b05ba8f20ab--
