Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D0E32D038
	for <lists+openbmc@lfdr.de>; Thu,  4 Mar 2021 10:56:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrmVL1Cjlz3d21
	for <lists+openbmc@lfdr.de>; Thu,  4 Mar 2021 20:56:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phytium.com.cn (client-ip=165.227.154.27;
 helo=zg8tmty1ljiyny4xntqumjca.icoremail.net;
 envelope-from=wangmin@phytium.com.cn; receiver=<UNKNOWN>)
X-Greylist: delayed 725 seconds by postgrey-1.36 at boromir;
 Thu, 04 Mar 2021 20:47:28 AEDT
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net
 (zg8tmty1ljiyny4xntqumjca.icoremail.net [165.227.154.27])
 by lists.ozlabs.org (Postfix) with SMTP id 4DrmHh0yhgz3cY0
 for <openbmc@lists.ozlabs.org>; Thu,  4 Mar 2021 20:47:25 +1100 (AEDT)
Received: from LAPTOPS6JR0A6O (unknown [106.18.147.157])
 by c1app6 (Coremail) with SMTP id BgINCgAX+vK9qUBgrKk3BA--.48744S2;
 Thu, 04 Mar 2021 17:34:54 +0800 (CST)
From: <wangmin@phytium.com.cn>
To: <openbmc@lists.ozlabs.org>
Subject: [OpenBMC]: Porting OpenBMC to  a aarch64 SoC
Date: Thu, 4 Mar 2021 17:34:53 +0800
Message-ID: <!&!AAAAAAAAAAAuAAAAAAAAAO4CP8j4rjtAsuu29GjYeJQBAMO2jhD3dRHOtM0AqgC7tuYAAAAAAA4AABAAAAAmHSaeuedKS6yz7kuXUVsVAQAAAAA=@phytium.com.cn>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_000_0000_01D7111C.B0DC40E0"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdcQ0rIHtAFS1nEaQQKNbJ/cy0Takg==
Content-Language: zh-cn
X-CM-TRANSID: BgINCgAX+vK9qUBgrKk3BA--.48744S2
X-Coremail-Antispam: 1UD129KBjv7XoW8KrW3Ww18AFb_yoW7WFWxJoZ5Ka1IqF4UKr
 1UG3s8GF4DKrWkAr10v39rtr1kXryDC3W3t345Kr9FyanrA3y7Kw48tw48KFWkC3s7JFWj
 q393n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3AaLaJ3UjIYCT
 nIWjp_UUUYF7k0a2IF6w4kM7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK
 8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAYj202j2C_Wr0_
 Ar1l5I8CrVAqjxCE14ACF2xKxwAqx4xG64kEw2xG04xIwI0_Gr0_Xr1l5I8CrVCF0I0E4I
 0vr24lYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE
 7xkEbVWUJVW8JwCY02Avz4vE14v_GFWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
 xG67AKxVWUGVWUWwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17
 MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
 IF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
 x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IUY5b17UUUUU==
X-CM-SenderInfo: 5zdqwzdlq61x51wl3zoofrzhdfq/
X-Mailman-Approved-At: Thu, 04 Mar 2021 20:56:31 +1100
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
Cc: =?gb2312?B?J8H108LF9Cc=?= <liuyongpeng@phytium.com.cn>,
 shuyiqi@phytium.com.cn
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multipart message in MIME format.

------=_NextPart_000_0000_01D7111C.B0DC40E0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit

Hi folks,

 

I am trying porting OpenBMC to a aarch64 SoC.  Just to clarify, the porting
work makes OpenBMC to run on a aarch64 machine. But there are many errors
during the porting process. Currently, the linux kernel and OS had been
successfully compiled by using the configuration
<https://github.com/openbmc/openbmc/blob/master/poky/meta/conf/machine/inclu
de/arm/arch-armv8a.inc> , while the u-boot failed to be compiled. 

 

ubuntu@ubuntu:build$ bitbake linux-aspeed

Loading cache: 100%
|###########################################################################
############################################################################
########################| Time: 0:00:02

Loaded 3548 entries from dependency cache.

Parsing recipes: 100%
|###########################################################################
############################################################################
######################| Time: 0:00:02

Parsing of 2387 .bb files complete (2384 cached, 3 parsed). 3551 targets,
353 skipped, 0 masked, 0 errors.

NOTE: Resolving any missing task queue dependencies

 

Build Configuration:

BB_VERSION           = "1.46.0"

BUILD_SYS            = "aarch64-linux"

NATIVELSBSTRING      = "ubuntu-18.04"

TARGET_SYS           = "aarch64-openbmc-linux"

MACHINE              = "s2500"

DISTRO               = "openbmc-phosphor"

DISTRO_VERSION       = "0.1.0"

TUNE_FEATURES        = "aarch64 armv8a"

TARGET_FPU           = ""

meta                 

meta-poky            

meta-oe              

meta-networking      

meta-perl            

meta-python          

meta-webserver       

meta-phosphor        

meta-aspeed          

meta-openpower       

meta-phytium         

meta-s2500          

workspace            = "master:abb3d515c30e1be83f21fb6916fe5be4edad0be7"

 

WARNING: The Linux kernel on your build host was not configured to provide
process I/O statistics. (CONFIG_TASK_IO_ACCOUNTING is not set)

Initialising tasks: 100%
|###########################################################################
############################################################################
###################| Time: 0:00:04

Sstate summary: Wanted 3 Found 3 Missed 0 Current 466 (100% match, 100%
complete)

NOTE: Executing Tasks

NOTE: Tasks Summary: Attempted 1548 tasks of which 1547 didn't need to be
rerun and all succeeded.

 

 

Summary: There was 1 WARNING message shown.

ubuntu@ubuntu:build$ ls -alsh tmp/deploy/images/s2500/

total 19M

4.0K drwxr-xr-x 2 ubuntu ubuntu 4.0K Mar  4 02:22 .

4.0K drwxrwxr-x 5 ubuntu ubuntu 4.0K Nov 24 19:28 ..

36K -rw-r--r-- 2 ubuntu ubuntu  34K Mar  4 02:22
aspeed-bmc-phytium-s2500--5.4.39+git0+30079d65ac-r0-s2500-20210304070353.dtb

4.0K lrwxrwxrwx 2 ubuntu ubuntu   78 Mar  4 02:22
aspeed-bmc-phytium-s2500.dtb ->
aspeed-bmc-phytium-s2500--5.4.39+git0+30079d65ac-r0-s2500-20210304070353.dtb

4.0K lrwxrwxrwx 2 ubuntu ubuntu   78 Mar  4 02:22
aspeed-bmc-phytium-s2500-s2500.dtb ->
aspeed-bmc-phytium-s2500--5.4.39+git0+30079d65ac-r0-s2500-20210304070353.dtb

4.0K lrwxrwxrwx 2 ubuntu ubuntu   61 Mar  4 02:22 fitImage -> fitImage--5.4.
39+git0+30079d65ac-r0-s2500-20210304070353.bin

5.2M -rw-r--r-- 2 ubuntu ubuntu 5.2M Mar  4 02:22
fitImage--5.4.39+git0+30079d65ac-r0-s2500-20210304070353.bin

4.0K lrwxrwxrwx 2 ubuntu ubuntu   61 Mar  4 02:22 fitImage-s2500.bin ->
fitImage--5.4.39+git0+30079d65ac-r0-s2500-20210304070353.bin

4.0K -rw-r--r-- 2 ubuntu ubuntu 1.6K Mar  4 02:22
fitImage-its--5.4.39+git0+30079d65ac-r0-s2500-20210304070353.its

4.0K lrwxrwxrwx 2 ubuntu ubuntu   65 Mar  4 02:22 fitImage-its-s2500 ->
fitImage-its--5.4.39+git0+30079d65ac-r0-s2500-20210304070353.its

4.0K -rw-r--r-- 2 ubuntu ubuntu 2.2K Mar  4 02:22
fitImage-its-obmc-phosphor-initramfs-s2500--5.4.39+git0+30079d65ac-r0-s2500-
20210304070353.its

4.0K lrwxrwxrwx 2 ubuntu ubuntu   96 Mar  4 02:22
fitImage-its-obmc-phosphor-initramfs-s2500-s2500 ->
fitImage-its-obmc-phosphor-initramfs-s2500--5.4.39+git0+30079d65ac-r0-s2500-
20210304070353.its

5.2M -rw-r--r-- 2 ubuntu ubuntu 5.2M Mar  4 02:22
fitImage-linux.bin--5.4.39+git0+30079d65ac-r0-s2500-20210304070353.bin

4.0K lrwxrwxrwx 2 ubuntu ubuntu   71 Mar  4 02:22 fitImage-linux.bin-s2500
-> fitImage-linux.bin--5.4.39+git0+30079d65ac-r0-s2500-20210304070353.bin

6.4M -rw-r--r-- 2 ubuntu ubuntu 6.4M Mar  4 02:22
fitImage-obmc-phosphor-initramfs-s2500--5.4.39+git0+30079d65ac-r0-s2500-2021
0304070353.bin

4.0K lrwxrwxrwx 2 ubuntu ubuntu   92 Mar  4 02:22
fitImage-obmc-phosphor-initramfs-s2500-s2500 ->
fitImage-obmc-phosphor-initramfs-s2500--5.4.39+git0+30079d65ac-r0-s2500-2021
0304070353.bin

1.2M -rw-r--r-- 2 ubuntu ubuntu 1.2M Mar  4 02:12
obmc-phosphor-initramfs-s2500-20210304070353.rootfs.cpio.xz

4.0K -rw-r--r-- 2 ubuntu ubuntu  120 Mar  4 01:20
obmc-phosphor-initramfs-s2500-20210304070353.rootfs.manifest

392K -rw-r--r-- 2 ubuntu ubuntu 389K Mar  4 01:20
obmc-phosphor-initramfs-s2500-20210304070353.testdata.json

4.0K lrwxrwxrwx 2 ubuntu ubuntu   60 Mar  4 02:12
obmc-phosphor-initramfs-s2500.cpio.xz ->
obmc-phosphor-initramfs-s2500-20210304070353.rootfs.cpio.xz

4.0K lrwxrwxrwx 2 ubuntu ubuntu   61 Mar  4 01:20
obmc-phosphor-initramfs-s2500.manifest ->
obmc-phosphor-initramfs-s2500-20210304070353.rootfs.manifest

   0 lrwxrwxrwx 2 ubuntu ubuntu   59 Mar  4 01:20
obmc-phosphor-initramfs-s2500.testdata.json ->
obmc-phosphor-initramfs-s2500-20210304070353.testdata.json

ubuntu@ubuntu:build$ 

ubuntu@ubuntu:build$ cd
/home/ubuntu/openbmc-2.8.0/build/tmp/work/aarch64-openbmc-linux/phosphor-ipm
i-host/1.0+gitAUTOINC+21addc5793-r1/image/usr/bin/

ubuntu@ubuntu:bin$ file ipmid 

ipmid: ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), dynamically
linked, interpreter /lib/ld-linux-aarch64.so.1,
BuildID[sha1]=cd6c539c856b52153cd99dde44acd18ecc058c13, for GNU/Linux
3.14.0, with debug_info, not stripped

 

 

The following text snippets shows the problems that were encountered during
the process of my porting.

 

 

ubuntu@ubuntu:build$ bitbake obmc-phosphor-image

Loading cache: 100%
|###########################################################################
############################################################################
########################| Time: 0:00:01

Loaded 3548 entries from dependency cache.

Parsing recipes: 100%
|###########################################################################
############################################################################
######################| Time: 0:00:02

Parsing of 2387 .bb files complete (2384 cached, 3 parsed). 3551 targets,
353 skipped, 0 masked, 0 errors.

NOTE: Resolving any missing task queue dependencies

 

Build Configuration:

BB_VERSION           = "1.46.0"

BUILD_SYS            = "aarch64-linux"

NATIVELSBSTRING      = "ubuntu-18.04"

TARGET_SYS           = "aarch64-openbmc-linux"

MACHINE              = "s2500"

DISTRO               = "openbmc-phosphor"

DISTRO_VERSION       = "0.1.0"

TUNE_FEATURES        = "aarch64 armv8a"

TARGET_FPU           = ""

meta                 

meta-poky            

meta-oe              

meta-networking      

meta-perl            

meta-python          

meta-webserver       

meta-phosphor        

meta-aspeed          

meta-openpower       

meta-phytium         

meta-s2500          

workspace            = "master:abb3d515c30e1be83f21fb6916fe5be4edad0be7"

 

WARNING: The Linux kernel on your build host was not configured to provide
process I/O statistics. (CONFIG_TASK_IO_ACCOUNTING is not set)

Initialising tasks: 100%
|###########################################################################
############################################################################
###################| Time: 0:00:09

Sstate summary: Wanted 64 Found 16 Missed 48 Current 1323 (25% match, 96%
complete)

NOTE: Executing Tasks

ERROR: u-boot-aspeed-sdk-1_v2019.04+gitAUTOINC+09e0e88ee0-r0 do_compile:
oe_runmake failed

ERROR: u-boot-aspeed-sdk-1_v2019.04+gitAUTOINC+09e0e88ee0-r0 do_compile:
Execution of
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed
-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/temp/run.do_compile.5502' failed
with exit code 1:

make: Entering directory
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed
-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git'

make -C
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/build
KBUILD_SRC=/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-b
oot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git \

-f
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/Makefile 

make[1]: Entering directory
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed
-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/build'

set -e; : '  CHK     include/config/uboot.release'; mkdir -p
include/config/;        echo "2019.04$(/bin/bash
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/setlocalversion
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git)" < include/config/auto.conf >
include/config/uboot.release.tmp; if [ -r include/config/uboot.release ] &&
cmp -s include/config/uboot.release include/config/uboot.release.tmp; then
rm -f include/config/uboot.release.tmp; else : '  UPD
include/config/uboot.release'; mv -f include/config/uboot.release.tmp
include/config/uboot.release; fi

ln -fsn
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git source

set -e; : '  CHK     include/generated/timestamp_autogenerated.h'; mkdir -p
include/generated/;        (if test -n "${SOURCE_DATE_EPOCH}"; then
SOURCE_DATE="@${SOURCE_DATE_EPOCH}"; DATE=""; for date in gdate date.gnu
date; do ${date} -u -d "${SOURCE_DATE}" >/dev/null 2>&1 && DATE="${date}";
done; if test -n "${DATE}"; then LC_ALL=C ${DATE} -u -d "${SOURCE_DATE}"
+'#define U_BOOT_DATE "%b %d %C%y"'; LC_ALL=C ${DATE} -u -d "${SOURCE_DATE}"
+'#define U_BOOT_TIME "%T"'; LC_ALL=C ${DATE} -u -d "${SOURCE_DATE}"
+'#define U_BOOT_TZ "%z"'; LC_ALL=C ${DATE} -u -d "${SOURCE_DATE}" +'#define
U_BOOT_DMI_DATE "%m/%d/%Y"'; LC_ALL=C ${DATE} -u -d "${SOURCE_DATE}"
+'#define U_BOOT_BUILD_DATE 0x%Y%m%d'; else return 42; fi; else LC_ALL=C
date +'#define U_BOOT_DATE "%b %d %C%y"'; LC_ALL=C date +'#define
U_BOOT_TIME "%T"'; LC_ALL=C date +'#define U_BOOT_TZ "%z"'; LC_ALL=C date
+'#define U_BOOT_DMI_DATE "%m/%d/%Y"'; LC_ALL=C date +'#define
U_BOOT_BUILD_DATE 0x%Y%m%d'; fi) <
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/Makefile >
include/generated/timestamp_autogenerated.h.tmp; if [ -r
include/generated/timestamp_autogenerated.h ] && cmp -s
include/generated/timestamp_autogenerated.h
include/generated/timestamp_autogenerated.h.tmp; then rm -f
include/generated/timestamp_autogenerated.h.tmp; else : '  UPD
include/generated/timestamp_autogenerated.h'; mv -f
include/generated/timestamp_autogenerated.h.tmp
include/generated/timestamp_autogenerated.h; fi

make -f
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/Makefile.build
obj=scripts/basic

/bin/bash
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/mkmakefile \

 
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git . 2019 04

  GEN     ./Makefile

rm -f .tmp_quiet_recordmcount

make -f
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/Makefile.build
obj=scripts

if [ -f
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/.config -o -d
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/include/config ]; then \

           echo >&2 "
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git is not clean, please run 'make
mrproper'"; \

           echo >&2 "  in the
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed
-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git' directory.";\

           /bin/false; \

fi;

make -f
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/Makefile.build
obj=scripts/dtc

set -e; : '  CHK     include/generated/version_autogenerated.h'; mkdir -p
include/generated/; (echo \#define PLAIN_VERSION \"2019.04""\"; echo
\#define U_BOOT_VERSION \"U-Boot \" PLAIN_VERSION; echo \#define
CC_VERSION_STRING \"$(LC_ALL=C aarch64-openbmc-linux-gcc
--sysroot=/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-bo
ot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot --version |
head -n 1)\"; echo \#define LD_VERSION_STRING \"$(LC_ALL=C
aarch64-openbmc-linux-ld.bfd --version | head -n 1)\"; ) <
include/config/uboot.release >
include/generated/version_autogenerated.h.tmp; if [ -r
include/generated/version_autogenerated.h ] && cmp -s
include/generated/version_autogenerated.h
include/generated/version_autogenerated.h.tmp; then rm -f
include/generated/version_autogenerated.h.tmp; else : '  UPD
include/generated/version_autogenerated.h'; mv -f
include/generated/version_autogenerated.h.tmp
include/generated/version_autogenerated.h; fi

make -f
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/Makefile.build obj=.

mkdir -p lib/

mkdir -p arch/arm/lib/

  aarch64-openbmc-linux-gcc
--sysroot=/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-bo
ot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot
-Wp,-MD,lib/.asm-offsets.s.d  -nostdinc -isystem
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot-native/usr/bin/aarch6
4-openbmc-linux/../../lib/aarch64-openbmc-linux/gcc/aarch64-openbmc-linux/9.
3.0/include -Iinclude
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspee
d-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/include
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspee
d-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/arch/arm/include -include
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/include/linux/kconfig.h
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspee
d-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/. -I. -D__KERNEL__ -D__UBOOT__
-Wall -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding
-std=gnu11 -fshort-wchar -fno-strict-aliasing -fno-PIE -Os
-fno-stack-protector -fno-delete-null-pointer-checks
-fmacro-prefix-map=/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-l
inux/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/= -g
-fstack-usage -Wno-format-nonliteral -Wno-address-of-packed-member
-Werror=date-time -D__ARM__ -fno-pic -ffunction-sections -fdata-sections
-fno-common -ffixed-r9 -pipe -D__LINUX_ARM_ARCH__=7 -mtune=generic-armv7-a
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspee
d-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/arch/arm/mach-aspeed/include
-DDO_DEPS_ONLY    -D"KBUILD_STR(s)=#s"
-D"KBUILD_BASENAME=KBUILD_STR(asm_offsets)"
-D"KBUILD_MODNAME=KBUILD_STR(asm_offsets)"  -fverbose-asm -S -o
lib/asm-offsets.s
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/lib/asm-offsets.c

  aarch64-openbmc-linux-gcc
--sysroot=/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-bo
ot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot
-Wp,-MD,arch/arm/lib/.asm-offsets.s.d  -nostdinc -isystem
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot-native/usr/bin/aarch6
4-openbmc-linux/../../lib/aarch64-openbmc-linux/gcc/aarch64-openbmc-linux/9.
3.0/include -Iinclude
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspee
d-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/include
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspee
d-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/arch/arm/include -include
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/include/linux/kconfig.h
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspee
d-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/. -I. -D__KERNEL__ -D__UBOOT__
-Wall -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding
-std=gnu11 -fshort-wchar -fno-strict-aliasing -fno-PIE -Os
-fno-stack-protector -fno-delete-null-pointer-checks
-fmacro-prefix-map=/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-l
inux/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/= -g
-fstack-usage -Wno-format-nonliteral -Wno-address-of-packed-member
-Werror=date-time -D__ARM__ -fno-pic -ffunction-sections -fdata-sections
-fno-common -ffixed-r9 -pipe -D__LINUX_ARM_ARCH__=7 -mtune=generic-armv7-a
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspee
d-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/arch/arm/mach-aspeed/include
-DDO_DEPS_ONLY    -D"KBUILD_STR(s)=#s"
-D"KBUILD_BASENAME=KBUILD_STR(asm_offsets)"
-D"KBUILD_MODNAME=KBUILD_STR(asm_offsets)"  -fverbose-asm -S -o
arch/arm/lib/asm-offsets.s
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/arch/arm/lib/asm-offsets.c

cc1: error: unknown value 'generic-armv7-a' for '-mtune'

cc1: note: valid arguments are: cortex-a35 cortex-a53 cortex-a57 cortex-a72
cortex-a73 thunderx thunderxt88p1 thunderxt88 octeontx octeontx81 octeontx83
thunderxt81 thunderxt83 emag xgene1 falkor qdf24xx exynos-m1 phecda
thunderx2t99p1 vulcan thunderx2t99 cortex-a55 cortex-a75 cortex-a76 ares
neoverse-n1 neoverse-e1 tsv110 saphira cortex-a57.cortex-a53
cortex-a72.cortex-a53 cortex-a73.cortex-a35 cortex-a73.cortex-a53
cortex-a75.cortex-a55 cortex-a76.cortex-a55 generic

/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/./Kbuild:43: recipe for target
'lib/asm-offsets.s' failed

make[2]: *** [lib/asm-offsets.s] Error 1

make[2]: *** Waiting for unfinished jobs....

cc1: error: unknown value 'generic-armv7-a' for '-mtune'

cc1: note: valid arguments are: cortex-a35 cortex-a53 cortex-a57 cortex-a72
cortex-a73 thunderx thunderxt88p1 thunderxt88 octeontx octeontx81 octeontx83
thunderxt81 thunderxt83 emag xgene1 falkor qdf24xx exynos-m1 phecda
thunderx2t99p1 vulcan thunderx2t99 cortex-a55 cortex-a75 cortex-a76 ares
neoverse-n1 neoverse-e1 tsv110 saphira cortex-a57.cortex-a53
cortex-a72.cortex-a53 cortex-a73.cortex-a35 cortex-a73.cortex-a53
cortex-a75.cortex-a55 cortex-a76.cortex-a55 generic

/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/./Kbuild:64: recipe for target
'arch/arm/lib/asm-offsets.s' failed

make[2]: *** [arch/arm/lib/asm-offsets.s] Error 1

/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/Makefile:1589: recipe for target
'prepare0' failed

make[1]: *** [prepare0] Error 2

make[1]: Leaving directory
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed
-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/build'

Makefile:148: recipe for target 'sub-make' failed

make: *** [sub-make] Error 2

make: Leaving directory
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed
-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git'

WARNING: exit code 1 from a shell command.

 

ERROR: Logfile of failure stored in:
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/temp/log.do_compile.5502

Log data follows:

| DEBUG: Executing shell function do_compile

| NOTE: make -j 4 CROSS_COMPILE=aarch64-openbmc-linux-
CC=aarch64-openbmc-linux-gcc
--sysroot=/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-bo
ot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot V=1
HOSTCC=gcc
-isystem/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot
-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot-native/usr/in
clude -O2 -pipe
-L/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspee
d-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot-native/usr/lib
-L/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspee
d-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot-native/lib
-Wl,--enable-new-dtags
-Wl,-rpath-link,/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linu
x/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot-nativ
e/usr/lib
-Wl,-rpath-link,/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linu
x/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot-nativ
e/lib
-Wl,-rpath,/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-b
oot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot-native/usr
/lib
-Wl,-rpath,/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-b
oot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot-native/lib
-Wl,-O1
STAGING_INCDIR=/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux
/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot-native
/usr/include
STAGING_LIBDIR=/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux
/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot-native
/usr/lib -C
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git
O=/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspee
d-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/build DEVICE_TREE=ast2600-s2500

| make: Entering directory
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed
-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git'

| make -C
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/build
KBUILD_SRC=/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-b
oot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git \

| -f
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/Makefile

| make[1]: Entering directory
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed
-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/build'

| set -e; : '  CHK     include/config/uboot.release'; mkdir -p
include/config/;       echo "2019.04$(/bin/bash
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/setlocalversion
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git)" < include/config/auto.conf >
include/config/uboot.release.tmp; if [ -r include/config/uboot.release ] &&
cmp -s include/config/uboot.release include/config/uboot.release.tmp; then
rm -f include/config/uboot.release.tmp; else : '  UPD
include/config/uboot.release'; mv -f include/config/uboot.release.tmp
include/config/uboot.release; fi

| ln -fsn
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git source

| set -e; : '  CHK     include/generated/timestamp_autogenerated.h'; mkdir
-p include/generated/;      (if test -n "${SOURCE_DATE_EPOCH}"; then
SOURCE_DATE="@${SOURCE_DATE_EPOCH}"; DATE=""; for date in gdate date.gnu
date; do ${date} -u -d "${SOURCE_DATE}" >/dev/null 2>&1 && DATE="${date}";
done; if test -n "${DATE}"; then LC_ALL=C ${DATE} -u -d "${SOURCE_DATE}"
+'#define U_BOOT_DATE "%b %d %C%y"'; LC_ALL=C ${DATE} -u -d "${SOURCE_DATE}"
+'#define U_BOOT_TIME "%T"'; LC_ALL=C ${DATE} -u -d "${SOURCE_DATE}"
+'#define U_BOOT_TZ "%z"'; LC_ALL=C ${DATE} -u -d "${SOURCE_DATE}" +'#define
U_BOOT_DMI_DATE "%m/%d/%Y"'; LC_ALL=C ${DATE} -u -d "${SOURCE_DATE}"
+'#define U_BOOT_BUILD_DATE 0x%Y%m%d'; else return 42; fi; else LC_ALL=C
date +'#define U_BOOT_DATE "%b %d %C%y"'; LC_ALL=C date +'#define
U_BOOT_TIME "%T"'; LC_ALL=C date +'#define U_BOOT_TZ "%z"'; LC_ALL=C date
+'#define U_BOOT_DMI_DATE "%m/%d/%Y"'; LC_ALL=C date +'#define
U_BOOT_BUILD_DATE 0x%Y%m%d'; fi) <
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/Makefile >
include/generated/timestamp_autogenerated.h.tmp; if [ -r
include/generated/timestamp_autogenerated.h ] && cmp -s
include/generated/timestamp_autogenerated.h
include/generated/timestamp_autogenerated.h.tmp; then rm -f
include/generated/timestamp_autogenerated.h.tmp; else : '  UPD
include/generated/timestamp_autogenerated.h'; mv -f
include/generated/timestamp_autogenerated.h.tmp
include/generated/timestamp_autogenerated.h; fi

| make -f
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/Makefile.build
obj=scripts/basic

| /bin/bash
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/mkmakefile \

|
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git . 2019 04

|   GEN     ./Makefile

| rm -f .tmp_quiet_recordmcount

| make -f
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/Makefile.build
obj=scripts

| if [ -f
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/.config -o -d
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/include/config ]; then \

|         echo >&2 "
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git is not clean, please run 'make
mrproper'"; \

|         echo >&2 "  in the
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed
-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git' directory.";\

|         /bin/false; \

| fi;

| make -f
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/Makefile.build
obj=scripts/dtc

| set -e; : '  CHK     include/generated/version_autogenerated.h'; mkdir -p
include/generated/;           (echo \#define PLAIN_VERSION \"2019.04""\";
echo \#define U_BOOT_VERSION \"U-Boot \" PLAIN_VERSION; echo \#define
CC_VERSION_STRING \"$(LC_ALL=C aarch64-openbmc-linux-gcc
--sysroot=/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-bo
ot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot --version |
head -n 1)\"; echo \#define LD_VERSION_STRING \"$(LC_ALL=C
aarch64-openbmc-linux-ld.bfd --version | head -n 1)\"; ) <
include/config/uboot.release >
include/generated/version_autogenerated.h.tmp; if [ -r
include/generated/version_autogenerated.h ] && cmp -s
include/generated/version_autogenerated.h
include/generated/version_autogenerated.h.tmp; then rm -f
include/generated/version_autogenerated.h.tmp; else : '  UPD
include/generated/version_autogenerated.h'; mv -f
include/generated/version_autogenerated.h.tmp
include/generated/version_autogenerated.h; fi

| make -f
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/Makefile.build obj=.

| mkdir -p lib/

| mkdir -p arch/arm/lib/

|   aarch64-openbmc-linux-gcc
--sysroot=/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-bo
ot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot
-Wp,-MD,lib/.asm-offsets.s.d  -nostdinc -isystem
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot-native/usr/bin/aarch6
4-openbmc-linux/../../lib/aarch64-openbmc-linux/gcc/aarch64-openbmc-linux/9.
3.0/include -Iinclude
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspee
d-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/include
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspee
d-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/arch/arm/include -include
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/include/linux/kconfig.h
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspee
d-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/. -I. -D__KERNEL__ -D__UBOOT__
-Wall -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding
-std=gnu11 -fshort-wchar -fno-strict-aliasing -fno-PIE -Os
-fno-stack-protector -fno-delete-null-pointer-checks
-fmacro-prefix-map=/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-l
inux/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/= -g
-fstack-usage -Wno-format-nonliteral -Wno-address-of-packed-member
-Werror=date-time -D__ARM__ -fno-pic -ffunction-sections -fdata-sections
-fno-common -ffixed-r9 -pipe -D__LINUX_ARM_ARCH__=7 -mtune=generic-armv7-a
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspee
d-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/arch/arm/mach-aspeed/include
-DDO_DEPS_ONLY    -D"KBUILD_STR(s)=#s"
-D"KBUILD_BASENAME=KBUILD_STR(asm_offsets)"
-D"KBUILD_MODNAME=KBUILD_STR(asm_offsets)"  -fverbose-asm -S -o
lib/asm-offsets.s
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/lib/asm-offsets.c

|   aarch64-openbmc-linux-gcc
--sysroot=/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-bo
ot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot
-Wp,-MD,arch/arm/lib/.asm-offsets.s.d  -nostdinc -isystem
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot-native/usr/bin/aarch6
4-openbmc-linux/../../lib/aarch64-openbmc-linux/gcc/aarch64-openbmc-linux/9.
3.0/include -Iinclude
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspee
d-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/include
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspee
d-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/arch/arm/include -include
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/include/linux/kconfig.h
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspee
d-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/. -I. -D__KERNEL__ -D__UBOOT__
-Wall -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding
-std=gnu11 -fshort-wchar -fno-strict-aliasing -fno-PIE -Os
-fno-stack-protector -fno-delete-null-pointer-checks
-fmacro-prefix-map=/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-l
inux/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/= -g
-fstack-usage -Wno-format-nonliteral -Wno-address-of-packed-member
-Werror=date-time -D__ARM__ -fno-pic -ffunction-sections -fdata-sections
-fno-common -ffixed-r9 -pipe -D__LINUX_ARM_ARCH__=7 -mtune=generic-armv7-a
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspee
d-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/arch/arm/mach-aspeed/include
-DDO_DEPS_ONLY    -D"KBUILD_STR(s)=#s"
-D"KBUILD_BASENAME=KBUILD_STR(asm_offsets)"
-D"KBUILD_MODNAME=KBUILD_STR(asm_offsets)"  -fverbose-asm -S -o
arch/arm/lib/asm-offsets.s
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/arch/arm/lib/asm-offsets.c

| cc1: error: unknown value 'generic-armv7-a' for '-mtune'

| cc1: note: valid arguments are: cortex-a35 cortex-a53 cortex-a57
cortex-a72 cortex-a73 thunderx thunderxt88p1 thunderxt88 octeontx octeontx81
octeontx83 thunderxt81 thunderxt83 emag xgene1 falkor qdf24xx exynos-m1
phecda thunderx2t99p1 vulcan thunderx2t99 cortex-a55 cortex-a75 cortex-a76
ares neoverse-n1 neoverse-e1 tsv110 saphira cortex-a57.cortex-a53
cortex-a72.cortex-a53 cortex-a73.cortex-a35 cortex-a73.cortex-a53
cortex-a75.cortex-a55 cortex-a76.cortex-a55 generic

|
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/./Kbuild:43: recipe for target
'lib/asm-offsets.s' failed

| make[2]: *** [lib/asm-offsets.s] Error 1

| make[2]: *** Waiting for unfinished jobs....

| cc1: error: unknown value 'generic-armv7-a' for '-mtune'

| cc1: note: valid arguments are: cortex-a35 cortex-a53 cortex-a57
cortex-a72 cortex-a73 thunderx thunderxt88p1 thunderxt88 octeontx octeontx81
octeontx83 thunderxt81 thunderxt83 emag xgene1 falkor qdf24xx exynos-m1
phecda thunderx2t99p1 vulcan thunderx2t99 cortex-a55 cortex-a75 cortex-a76
ares neoverse-n1 neoverse-e1 tsv110 saphira cortex-a57.cortex-a53
cortex-a72.cortex-a53 cortex-a73.cortex-a35 cortex-a73.cortex-a53
cortex-a75.cortex-a55 cortex-a76.cortex-a55 generic

|
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/./Kbuild:64: recipe for target
'arch/arm/lib/asm-offsets.s' failed

| make[2]: *** [arch/arm/lib/asm-offsets.s] Error 1

|
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/Makefile:1589: recipe for target
'prepare0' failed

| make[1]: *** [prepare0] Error 2

| make[1]: Leaving directory
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed
-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/build'

| Makefile:148: recipe for target 'sub-make' failed

| make: *** [sub-make] Error 2

| make: Leaving directory
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed
-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git'

| ERROR: oe_runmake failed

| WARNING: exit code 1 from a shell command.

| ERROR: Execution of
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed
-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/temp/run.do_compile.5502' failed
with exit code 1:

| make: Entering directory
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed
-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git'

| make -C
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/build
KBUILD_SRC=/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-b
oot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git \

| -f
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/Makefile

| make[1]: Entering directory
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed
-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/build'

| set -e; : '  CHK     include/config/uboot.release'; mkdir -p
include/config/;       echo "2019.04$(/bin/bash
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/setlocalversion
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git)" < include/config/auto.conf >
include/config/uboot.release.tmp; if [ -r include/config/uboot.release ] &&
cmp -s include/config/uboot.release include/config/uboot.release.tmp; then
rm -f include/config/uboot.release.tmp; else : '  UPD
include/config/uboot.release'; mv -f include/config/uboot.release.tmp
include/config/uboot.release; fi

| ln -fsn
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git source

| set -e; : '  CHK     include/generated/timestamp_autogenerated.h'; mkdir
-p include/generated/;      (if test -n "${SOURCE_DATE_EPOCH}"; then
SOURCE_DATE="@${SOURCE_DATE_EPOCH}"; DATE=""; for date in gdate date.gnu
date; do ${date} -u -d "${SOURCE_DATE}" >/dev/null 2>&1 && DATE="${date}";
done; if test -n "${DATE}"; then LC_ALL=C ${DATE} -u -d "${SOURCE_DATE}"
+'#define U_BOOT_DATE "%b %d %C%y"'; LC_ALL=C ${DATE} -u -d "${SOURCE_DATE}"
+'#define U_BOOT_TIME "%T"'; LC_ALL=C ${DATE} -u -d "${SOURCE_DATE}"
+'#define U_BOOT_TZ "%z"'; LC_ALL=C ${DATE} -u -d "${SOURCE_DATE}" +'#define
U_BOOT_DMI_DATE "%m/%d/%Y"'; LC_ALL=C ${DATE} -u -d "${SOURCE_DATE}"
+'#define U_BOOT_BUILD_DATE 0x%Y%m%d'; else return 42; fi; else LC_ALL=C
date +'#define U_BOOT_DATE "%b %d %C%y"'; LC_ALL=C date +'#define
U_BOOT_TIME "%T"'; LC_ALL=C date +'#define U_BOOT_TZ "%z"'; LC_ALL=C date
+'#define U_BOOT_DMI_DATE "%m/%d/%Y"'; LC_ALL=C date +'#define
U_BOOT_BUILD_DATE 0x%Y%m%d'; fi) <
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/Makefile >
include/generated/timestamp_autogenerated.h.tmp; if [ -r
include/generated/timestamp_autogenerated.h ] && cmp -s
include/generated/timestamp_autogenerated.h
include/generated/timestamp_autogenerated.h.tmp; then rm -f
include/generated/timestamp_autogenerated.h.tmp; else : '  UPD
include/generated/timestamp_autogenerated.h'; mv -f
include/generated/timestamp_autogenerated.h.tmp
include/generated/timestamp_autogenerated.h; fi

| make -f
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/Makefile.build
obj=scripts/basic

| /bin/bash
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/mkmakefile \

|
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git . 2019 04

|   GEN     ./Makefile

| rm -f .tmp_quiet_recordmcount

| make -f
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/Makefile.build
obj=scripts

| if [ -f
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/.config -o -d
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/include/config ]; then \

|         echo >&2 "
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git is not clean, please run 'make
mrproper'"; \

|         echo >&2 "  in the
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed
-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git' directory.";\

|         /bin/false; \

| fi;

| make -f
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/Makefile.build
obj=scripts/dtc

| set -e; : '  CHK     include/generated/version_autogenerated.h'; mkdir -p
include/generated/;           (echo \#define PLAIN_VERSION \"2019.04""\";
echo \#define U_BOOT_VERSION \"U-Boot \" PLAIN_VERSION; echo \#define
CC_VERSION_STRING \"$(LC_ALL=C aarch64-openbmc-linux-gcc
--sysroot=/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-bo
ot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot --version |
head -n 1)\"; echo \#define LD_VERSION_STRING \"$(LC_ALL=C
aarch64-openbmc-linux-ld.bfd --version | head -n 1)\"; ) <
include/config/uboot.release >
include/generated/version_autogenerated.h.tmp; if [ -r
include/generated/version_autogenerated.h ] && cmp -s
include/generated/version_autogenerated.h
include/generated/version_autogenerated.h.tmp; then rm -f
include/generated/version_autogenerated.h.tmp; else : '  UPD
include/generated/version_autogenerated.h'; mv -f
include/generated/version_autogenerated.h.tmp
include/generated/version_autogenerated.h; fi

| make -f
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/Makefile.build obj=.

| mkdir -p lib/

| mkdir -p arch/arm/lib/

|   aarch64-openbmc-linux-gcc
--sysroot=/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-bo
ot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot
-Wp,-MD,lib/.asm-offsets.s.d  -nostdinc -isystem
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot-native/usr/bin/aarch6
4-openbmc-linux/../../lib/aarch64-openbmc-linux/gcc/aarch64-openbmc-linux/9.
3.0/include -Iinclude
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspee
d-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/include
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspee
d-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/arch/arm/include -include
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/include/linux/kconfig.h
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspee
d-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/. -I. -D__KERNEL__ -D__UBOOT__
-Wall -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding
-std=gnu11 -fshort-wchar -fno-strict-aliasing -fno-PIE -Os
-fno-stack-protector -fno-delete-null-pointer-checks
-fmacro-prefix-map=/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-l
inux/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/= -g
-fstack-usage -Wno-format-nonliteral -Wno-address-of-packed-member
-Werror=date-time -D__ARM__ -fno-pic -ffunction-sections -fdata-sections
-fno-common -ffixed-r9 -pipe -D__LINUX_ARM_ARCH__=7 -mtune=generic-armv7-a
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspee
d-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/arch/arm/mach-aspeed/include
-DDO_DEPS_ONLY    -D"KBUILD_STR(s)=#s"
-D"KBUILD_BASENAME=KBUILD_STR(asm_offsets)"
-D"KBUILD_MODNAME=KBUILD_STR(asm_offsets)"  -fverbose-asm -S -o
lib/asm-offsets.s
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/lib/asm-offsets.c

|   aarch64-openbmc-linux-gcc
--sysroot=/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-bo
ot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot
-Wp,-MD,arch/arm/lib/.asm-offsets.s.d  -nostdinc -isystem
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot-native/usr/bin/aarch6
4-openbmc-linux/../../lib/aarch64-openbmc-linux/gcc/aarch64-openbmc-linux/9.
3.0/include -Iinclude
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspee
d-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/include
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspee
d-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/arch/arm/include -include
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/include/linux/kconfig.h
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspee
d-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/. -I. -D__KERNEL__ -D__UBOOT__
-Wall -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding
-std=gnu11 -fshort-wchar -fno-strict-aliasing -fno-PIE -Os
-fno-stack-protector -fno-delete-null-pointer-checks
-fmacro-prefix-map=/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-l
inux/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/= -g
-fstack-usage -Wno-format-nonliteral -Wno-address-of-packed-member
-Werror=date-time -D__ARM__ -fno-pic -ffunction-sections -fdata-sections
-fno-common -ffixed-r9 -pipe -D__LINUX_ARM_ARCH__=7 -mtune=generic-armv7-a
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspee
d-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/arch/arm/mach-aspeed/include
-DDO_DEPS_ONLY    -D"KBUILD_STR(s)=#s"
-D"KBUILD_BASENAME=KBUILD_STR(asm_offsets)"
-D"KBUILD_MODNAME=KBUILD_STR(asm_offsets)"  -fverbose-asm -S -o
arch/arm/lib/asm-offsets.s
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/arch/arm/lib/asm-offsets.c

| cc1: error: unknown value 'generic-armv7-a' for '-mtune'

| cc1: note: valid arguments are: cortex-a35 cortex-a53 cortex-a57
cortex-a72 cortex-a73 thunderx thunderxt88p1 thunderxt88 octeontx octeontx81
octeontx83 thunderxt81 thunderxt83 emag xgene1 falkor qdf24xx exynos-m1
phecda thunderx2t99p1 vulcan thunderx2t99 cortex-a55 cortex-a75 cortex-a76
ares neoverse-n1 neoverse-e1 tsv110 saphira cortex-a57.cortex-a53
cortex-a72.cortex-a53 cortex-a73.cortex-a35 cortex-a73.cortex-a53
cortex-a75.cortex-a55 cortex-a76.cortex-a55 generic

|
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/./Kbuild:43: recipe for target
'lib/asm-offsets.s' failed

| make[2]: *** [lib/asm-offsets.s] Error 1

| make[2]: *** Waiting for unfinished jobs....

| cc1: error: unknown value 'generic-armv7-a' for '-mtune'

| cc1: note: valid arguments are: cortex-a35 cortex-a53 cortex-a57
cortex-a72 cortex-a73 thunderx thunderxt88p1 thunderxt88 octeontx octeontx81
octeontx83 thunderxt81 thunderxt83 emag xgene1 falkor qdf24xx exynos-m1
phecda thunderx2t99p1 vulcan thunderx2t99 cortex-a55 cortex-a75 cortex-a76
ares neoverse-n1 neoverse-e1 tsv110 saphira cortex-a57.cortex-a53
cortex-a72.cortex-a53 cortex-a73.cortex-a35 cortex-a73.cortex-a53
cortex-a75.cortex-a55 cortex-a76.cortex-a55 generic

|
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/./Kbuild:64: recipe for target
'arch/arm/lib/asm-offsets.s' failed

| make[2]: *** [arch/arm/lib/asm-offsets.s] Error 1

|
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed-
sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/Makefile:1589: recipe for target
'prepare0' failed

| make[1]: *** [prepare0] Error 2

| make[1]: Leaving directory
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed
-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/build'

| Makefile:148: recipe for target 'sub-make' failed

| make: *** [sub-make] Error 2

| make: Leaving directory
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspeed
-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git'

| WARNING: exit code 1 from a shell command.

| 

ERROR: Task
(/home/ubuntu/openbmc-2.8.0/meta-aspeed/recipes-bsp/u-boot/u-boot-aspeed-sdk
_2019.04.bb:do_compile) failed with exit code '1'

NOTE: Tasks Summary: Attempted 3593 tasks of which 3591 didn't need to be
rerun and 1 failed.

 

Summary: 1 task failed:

 
/home/ubuntu/openbmc-2.8.0/meta-aspeed/recipes-bsp/u-boot/u-boot-aspeed-sdk_
2019.04.bb:do_compile

Summary: There was 1 WARNING message shown.

Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

 

 

Any help will be greatly appreciated.

 

Thanks!


------=_NextPart_000_0000_01D7111C.B0DC40E0
Content-Type: text/html;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; charset=3Dgb2312"><meta =
name=3DGenerator content=3D"Microsoft Word 15 (filtered =
medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:=B5=C8=CF=DF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=B5=C8=CF=DF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
@font-face
	{font-family:times;
	panose-1:2 2 6 3 5 4 5 2 3 4;}
@font-face
	{font-family:"times new";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:=B5=C8=CF=DF;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:=B5=C8=CF=DF;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:=B5=C8=CF=DF;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:257062592;
	mso-list-type:hybrid;
	mso-list-template-ids:1363177658 -640246610 67698713 67698715 67698703 =
67698713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:18.0pt;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-text:"%2\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:42.0pt;
	text-indent:-21.0pt;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:63.0pt;
	text-indent:-21.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:84.0pt;
	text-indent:-21.0pt;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-text:"%5\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:105.0pt;
	text-indent:-21.0pt;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:126.0pt;
	text-indent:-21.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:147.0pt;
	text-indent:-21.0pt;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-text:"%8\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:168.0pt;
	text-indent:-21.0pt;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:189.0pt;
	text-indent:-21.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DZH-CN =
link=3D"#0563C1" vlink=3D"#954F72" =
style=3D'word-wrap:break-word;text-justify-trim:punctuation'><div =
class=3DWordSection1><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-family:"Segoe =
UI",sans-serif;color:#24292E;background:white'>Hi =
folks,<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-family:"Segoe =
UI",sans-serif;color:#24292E;background:white'><o:p>&nbsp;</o:p></span></=
p><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-family:"Segoe =
UI",sans-serif;color:#24292E;background:white'>I am trying porting =
OpenBMC to a aarch64 SoC. &nbsp;Just to clarify, the porting work makes =
OpenBMC to run on a aarch64 machine. But there are many errors during =
the porting process. Currently, the linux kernel and OS had been =
successfully compiled by using the <a =
href=3D"https://github.com/openbmc/openbmc/blob/master/poky/meta/conf/mac=
hine/include/arm/arch-armv8a.inc">configuration</a>, while the u-boot =
failed to be compiled. <o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:9.0pt;font-family:"Times New =
Roman",serif;color:#24292E;background:white'><o:p>&nbsp;</o:p></span></p>=
<p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>ubuntu@ubuntu:build$ bitbake =
linux-aspeed<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>Loading cache: 100% =
|########################################################################=
#########################################################################=
##############################| Time: 0:00:02<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>Loaded 3548 entries from =
dependency cache.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>Parsing recipes: 100% =
|########################################################################=
#########################################################################=
############################| Time: 0:00:02<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>Parsing of 2387 .bb files =
complete (2384 cached, 3 parsed). 3551 targets, 353 skipped, 0 masked, 0 =
errors.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>NOTE: Resolving any missing =
task queue dependencies<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'><o:p>&nbsp;</o:p></span></p><p=
 class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>Build =
Configuration:<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>BB_VERSION&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D =
&quot;1.46.0&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>BUILD_SYS&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D =
&quot;aarch64-linux&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>NATIVELSBSTRING&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; =3D &quot;ubuntu-18.04&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>TARGET_SYS =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=3D =
&quot;aarch64-openbmc-linux&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>MACHINE&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D =
&quot;s2500&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>DISTRO&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D =
&quot;openbmc-phosphor&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>DISTRO_VERSION&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; =3D &quot;0.1.0&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>TUNE_FEATURES&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;aarch64 =
armv8a&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>TARGET_FPU&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D =
&quot;&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>meta&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>meta-poky&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>meta-oe&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>meta-networking&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; <o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>meta-perl&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>meta-python&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>meta-webserver&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>meta-phosphor&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>meta-aspeed&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>meta-openpower&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>meta-phytium&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>meta-s2500&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>workspace&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D =
&quot;master:abb3d515c30e1be83f21fb6916fe5be4edad0be7&quot;<o:p></o:p></s=
pan></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'><o:p>&nbsp;</o:p></span></p><p=
 class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>WARNING: The Linux kernel on =
your build host was not configured to provide process I/O statistics. =
(CONFIG_TASK_IO_ACCOUNTING is not set)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>Initialising tasks: 100% =
|########################################################################=
#########################################################################=
#########################| Time: 0:00:04<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>Sstate summary: Wanted 3 =
Found 3 Missed 0 Current 466 (100% match, 100% =
complete)<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>NOTE: Executing =
Tasks<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>NOTE: Tasks Summary: =
Attempted 1548 tasks of which 1547 didn't need to be rerun and all =
succeeded.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'><o:p>&nbsp;</o:p></span></p><p=
 class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'><o:p>&nbsp;</o:p></span></p><p=
 class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>Summary: There was 1 WARNING =
message shown.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>ubuntu@ubuntu:build$ ls -alsh =
tmp/deploy/images/s2500/<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>total =
19M<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>4.0K drwxr-xr-x 2 ubuntu =
ubuntu 4.0K Mar&nbsp; 4 02:22 .<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>4.0K drwxrwxr-x 5 ubuntu =
ubuntu 4.0K Nov 24 19:28 ..<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'> 36K -rw-r--r-- 2 ubuntu =
ubuntu&nbsp; 34K Mar&nbsp; 4 02:22 =
aspeed-bmc-phytium-s2500--5.4.39+git0+30079d65ac-r0-s2500-20210304070353.=
dtb<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>4.0K lrwxrwxrwx 2 ubuntu =
ubuntu&nbsp;&nbsp; 78 Mar&nbsp; 4 02:22 aspeed-bmc-phytium-s2500.dtb =
-&gt; =
aspeed-bmc-phytium-s2500--5.4.39+git0+30079d65ac-r0-s2500-20210304070353.=
dtb<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>4.0K lrwxrwxrwx 2 ubuntu =
ubuntu&nbsp;&nbsp; 78 Mar&nbsp; 4 02:22 =
aspeed-bmc-phytium-s2500-s2500.dtb -&gt; =
aspeed-bmc-phytium-s2500--5.4.39+git0+30079d65ac-r0-s2500-20210304070353.=
dtb<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>4.0K lrwxrwxrwx 2 ubuntu =
ubuntu&nbsp;&nbsp; 61 Mar&nbsp; 4 02:22 fitImage -&gt; =
fitImage--5.4.39+git0+30079d65ac-r0-s2500-20210304070353.bin<o:p></o:p></=
span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>5.2M -rw-r--r-- 2 ubuntu =
ubuntu 5.2M Mar&nbsp; 4 02:22 =
fitImage--5.4.39+git0+30079d65ac-r0-s2500-20210304070353.bin<o:p></o:p></=
span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>4.0K lrwxrwxrwx 2 ubuntu =
ubuntu&nbsp;&nbsp; 61 Mar&nbsp; 4 02:22 fitImage-s2500.bin -&gt; =
fitImage--5.4.39+git0+30079d65ac-r0-s2500-20210304070353.bin<o:p></o:p></=
span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>4.0K -rw-r--r-- 2 ubuntu =
ubuntu 1.6K Mar&nbsp; 4 02:22 =
fitImage-its--5.4.39+git0+30079d65ac-r0-s2500-20210304070353.its<o:p></o:=
p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>4.0K lrwxrwxrwx 2 ubuntu =
ubuntu&nbsp;&nbsp; 65 Mar&nbsp; 4 02:22 fitImage-its-s2500 -&gt; =
fitImage-its--5.4.39+git0+30079d65ac-r0-s2500-20210304070353.its<o:p></o:=
p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>4.0K -rw-r--r-- 2 ubuntu =
ubuntu 2.2K Mar&nbsp; 4 02:22 =
fitImage-its-obmc-phosphor-initramfs-s2500--5.4.39+git0+30079d65ac-r0-s25=
00-20210304070353.its<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>4.0K lrwxrwxrwx 2 ubuntu =
ubuntu&nbsp;&nbsp; 96 Mar&nbsp; 4 02:22 =
fitImage-its-obmc-phosphor-initramfs-s2500-s2500 -&gt; =
fitImage-its-obmc-phosphor-initramfs-s2500--5.4.39+git0+30079d65ac-r0-s25=
00-20210304070353.its<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>5.2M -rw-r--r-- 2 ubuntu =
ubuntu 5.2M Mar&nbsp; 4 02:22 =
fitImage-linux.bin--5.4.39+git0+30079d65ac-r0-s2500-20210304070353.bin<o:=
p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>4.0K lrwxrwxrwx 2 ubuntu =
ubuntu&nbsp;&nbsp; 71 Mar&nbsp; 4 02:22 fitImage-linux.bin-s2500 -&gt; =
fitImage-linux.bin--5.4.39+git0+30079d65ac-r0-s2500-20210304070353.bin<o:=
p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>6.4M -rw-r--r-- 2 ubuntu =
ubuntu 6.4M Mar&nbsp; 4 02:22 =
fitImage-obmc-phosphor-initramfs-s2500--5.4.39+git0+30079d65ac-r0-s2500-2=
0210304070353.bin<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>4.0K lrwxrwxrwx 2 ubuntu =
ubuntu&nbsp;&nbsp; 92 Mar&nbsp; 4 02:22 =
fitImage-obmc-phosphor-initramfs-s2500-s2500 -&gt; =
fitImage-obmc-phosphor-initramfs-s2500--5.4.39+git0+30079d65ac-r0-s2500-2=
0210304070353.bin<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>1.2M -rw-r--r-- 2 ubuntu =
ubuntu 1.2M Mar&nbsp; 4 02:12 =
obmc-phosphor-initramfs-s2500-20210304070353.rootfs.cpio.xz<o:p></o:p></s=
pan></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>4.0K -rw-r--r-- 2 ubuntu =
ubuntu&nbsp; 120 Mar&nbsp; 4 01:20 =
obmc-phosphor-initramfs-s2500-20210304070353.rootfs.manifest<o:p></o:p></=
span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>392K -rw-r--r-- 2 ubuntu =
ubuntu 389K Mar&nbsp; 4 01:20 =
obmc-phosphor-initramfs-s2500-20210304070353.testdata.json<o:p></o:p></sp=
an></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>4.0K lrwxrwxrwx 2 ubuntu =
ubuntu&nbsp;&nbsp; 60 Mar&nbsp; 4 02:12 =
obmc-phosphor-initramfs-s2500.cpio.xz -&gt; =
obmc-phosphor-initramfs-s2500-20210304070353.rootfs.cpio.xz<o:p></o:p></s=
pan></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>4.0K lrwxrwxrwx 2 ubuntu =
ubuntu&nbsp;&nbsp; 61 Mar&nbsp; 4 01:20 =
obmc-phosphor-initramfs-s2500.manifest -&gt; =
obmc-phosphor-initramfs-s2500-20210304070353.rootfs.manifest<o:p></o:p></=
span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>&nbsp;&nbsp; 0 lrwxrwxrwx 2 =
ubuntu ubuntu&nbsp;&nbsp; 59 Mar&nbsp; 4 01:20 =
obmc-phosphor-initramfs-s2500.testdata.json -&gt; =
obmc-phosphor-initramfs-s2500-20210304070353.testdata.json<o:p></o:p></sp=
an></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>ubuntu@ubuntu:build$ =
<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>ubuntu@ubuntu:build$ cd =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/aarch64-openbmc-linux/phosphor-=
ipmi-host/1.0+gitAUTOINC+21addc5793-r1/image/usr/bin/<o:p></o:p></span></=
p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>ubuntu@ubuntu:bin$ file ipmid =
<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>ipmid: ELF 64-bit LSB =
executable, ARM aarch64, version 1 (SYSV), dynamically linked, =
interpreter /lib/ld-linux-aarch64.so.1, =
BuildID[sha1]=3Dcd6c539c856b52153cd99dde44acd18ecc058c13, for GNU/Linux =
3.14.0, with debug_info, not stripped<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:9.0pt;font-family:"times",serif;color:#24292E;backgrou=
nd:white'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-family:"Segoe =
UI",sans-serif;color:#24292E;background:white'><o:p>&nbsp;</o:p></span></=
p><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-family:"Segoe =
UI",sans-serif;color:#24292E;background:white'>The following text =
snippets shows the problems that were encountered during the process of =
my porting.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-family:"Segoe =
UI",sans-serif;color:#24292E;background:white'><o:p>&nbsp;</o:p></span></=
p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'><o:p>&nbsp;</o:p></span></p><p=
 class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>ubuntu@ubuntu:build$ bitbake =
obmc-phosphor-image<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>Loading cache: 100% =
|########################################################################=
#########################################################################=
##############################| Time: 0:00:01<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>Loaded 3548 entries from =
dependency cache.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>Parsing recipes: 100% =
|########################################################################=
#########################################################################=
############################| Time: 0:00:02<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>Parsing of 2387 .bb files =
complete (2384 cached, 3 parsed). 3551 targets, 353 skipped, 0 masked, 0 =
errors.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>NOTE: Resolving any missing =
task queue dependencies<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'><o:p>&nbsp;</o:p></span></p><p=
 class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>Build =
Configuration:<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>BB_VERSION&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D =
&quot;1.46.0&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>BUILD_SYS&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D =
&quot;aarch64-linux&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>NATIVELSBSTRING&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; =3D &quot;ubuntu-18.04&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>TARGET_SYS&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D =
&quot;aarch64-openbmc-linux&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>MACHINE&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D =
&quot;s2500&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>DISTRO&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D =
&quot;openbmc-phosphor&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>DISTRO_VERSION&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; =3D &quot;0.1.0&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>TUNE_FEATURES&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;aarch64 =
armv8a&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>TARGET_FPU&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D =
&quot;&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>meta&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>meta-poky&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>meta-oe&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>meta-networking&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; <o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>meta-perl&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>meta-python&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>meta-webserver&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>meta-phosphor&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>meta-aspeed&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>meta-openpower&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>meta-phytium&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>meta-s2500&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>workspace&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D =
&quot;master:abb3d515c30e1be83f21fb6916fe5be4edad0be7&quot;<o:p></o:p></s=
pan></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'><o:p>&nbsp;</o:p></span></p><p=
 class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>WARNING: The Linux kernel on =
your build host was not configured to provide process I/O statistics. =
(CONFIG_TASK_IO_ACCOUNTING is not set)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>Initialising tasks: 100% =
|########################################################################=
#########################################################################=
#########################| Time: 0:00:09<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>Sstate summary: Wanted 64 =
Found 16 Missed 48 Current 1323 (25% match, 96% =
complete)<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>NOTE: Executing =
Tasks<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>ERROR: =
u-boot-aspeed-sdk-1_v2019.04+gitAUTOINC+09e0e88ee0-r0 do_compile: =
oe_runmake failed<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>ERROR: =
u-boot-aspeed-sdk-1_v2019.04+gitAUTOINC+09e0e88ee0-r0 do_compile: =
Execution of =
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-asp=
eed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/temp/run.do_compile.5502' =
failed with exit code 1:<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>make: Entering directory =
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-asp=
eed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git'<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>make -C =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/build =
KBUILD_SRC=3D/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linu=
x/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git =
\<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>-f =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/Makefile =
<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>make[1]: Entering directory =
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-asp=
eed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/build'<o:p></o:p></span></p><=
p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>set -e; : '&nbsp; =
CHK&nbsp;&nbsp;&nbsp;&nbsp; include/config/uboot.release'; mkdir -p =
include/config/; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo =
&quot;2019.04$(/bin/bash =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/setlocalversion =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git)&quot; &lt; =
include/config/auto.conf &gt; include/config/uboot.release.tmp; if [ -r =
include/config/uboot.release ] &amp;&amp; cmp -s =
include/config/uboot.release include/config/uboot.release.tmp; then rm =
-f include/config/uboot.release.tmp; else : '&nbsp; =
UPD&nbsp;&nbsp;&nbsp;&nbsp; include/config/uboot.release'; mv -f =
include/config/uboot.release.tmp include/config/uboot.release; =
fi<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>ln -fsn =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git =
source<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>set -e; : '&nbsp; =
CHK&nbsp;&nbsp;&nbsp;&nbsp; =
include/generated/timestamp_autogenerated.h'; mkdir -p =
include/generated/; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (if test -n =
&quot;${SOURCE_DATE_EPOCH}&quot;; then =
SOURCE_DATE=3D&quot;@${SOURCE_DATE_EPOCH}&quot;; DATE=3D&quot;&quot;; =
for date in gdate date.gnu date; do ${date} -u -d =
&quot;${SOURCE_DATE}&quot; &gt;/dev/null 2&gt;&amp;1 &amp;&amp; =
DATE=3D&quot;${date}&quot;; done; if test -n &quot;${DATE}&quot;; then =
LC_ALL=3DC ${DATE} -u -d &quot;${SOURCE_DATE}&quot; +'#define =
U_BOOT_DATE &quot;%b %d %C%y&quot;'; LC_ALL=3DC ${DATE} -u -d =
&quot;${SOURCE_DATE}&quot; +'#define U_BOOT_TIME &quot;%T&quot;'; =
LC_ALL=3DC ${DATE} -u -d &quot;${SOURCE_DATE}&quot; +'#define U_BOOT_TZ =
&quot;%z&quot;'; LC_ALL=3DC ${DATE} -u -d &quot;${SOURCE_DATE}&quot; =
+'#define U_BOOT_DMI_DATE &quot;%m/%d/%Y&quot;'; LC_ALL=3DC ${DATE} -u =
-d &quot;${SOURCE_DATE}&quot; +'#define U_BOOT_BUILD_DATE 0x%Y%m%d'; =
else return 42; fi; else LC_ALL=3DC date +'#define U_BOOT_DATE &quot;%b =
%d %C%y&quot;'; LC_ALL=3DC date +'#define U_BOOT_TIME &quot;%T&quot;'; =
LC_ALL=3DC date +'#define U_BOOT_TZ &quot;%z&quot;'; LC_ALL=3DC date =
+'#define U_BOOT_DMI_DATE &quot;%m/%d/%Y&quot;'; LC_ALL=3DC date =
+'#define U_BOOT_BUILD_DATE 0x%Y%m%d'; fi) &lt; =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/Makefile &gt; =
include/generated/timestamp_autogenerated.h.tmp; if [ -r =
include/generated/timestamp_autogenerated.h ] &amp;&amp; cmp -s =
include/generated/timestamp_autogenerated.h =
include/generated/timestamp_autogenerated.h.tmp; then rm -f =
include/generated/timestamp_autogenerated.h.tmp; else : '&nbsp; =
UPD&nbsp;&nbsp;&nbsp;&nbsp; =
include/generated/timestamp_autogenerated.h'; mv -f =
include/generated/timestamp_autogenerated.h.tmp =
include/generated/timestamp_autogenerated.h; fi<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>make -f =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/Makefile.build =
obj=3Dscripts/basic<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>/bin/bash =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/mkmakefile =
\<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>&nbsp;&nbsp;&nbsp; =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git . 2019 =
04<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>&nbsp; =
GEN&nbsp;&nbsp;&nbsp;&nbsp; ./Makefile<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>rm -f =
.tmp_quiet_recordmcount<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>make -f =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/Makefile.build =
obj=3Dscripts<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>if [ -f =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/.config -o -d =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/include/config ]; then =
\<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo &gt;&amp;2 &quot;&nbsp; =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git is not clean, please run =
'make mrproper'&quot;; \<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo &gt;&amp;2 &quot;&nbsp; in the =
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-asp=
eed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git' =
directory.&quot;;\<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /bin/false; \<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>fi;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>make -f =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/Makefile.build =
obj=3Dscripts/dtc<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>set -e; : '&nbsp; =
CHK&nbsp;&nbsp;&nbsp;&nbsp; include/generated/version_autogenerated.h'; =
mkdir -p include/generated/;  (echo \#define PLAIN_VERSION =
\&quot;2019.04&quot;&quot;\&quot;; echo \#define U_BOOT_VERSION =
\&quot;U-Boot \&quot; PLAIN_VERSION; echo \#define CC_VERSION_STRING =
\&quot;$(LC_ALL=3DC aarch64-openbmc-linux-gcc&nbsp; =
--sysroot=3D/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux=
/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot =
--version | head -n 1)\&quot;; echo \#define LD_VERSION_STRING =
\&quot;$(LC_ALL=3DC aarch64-openbmc-linux-ld.bfd --version | head -n =
1)\&quot;; ) &lt; include/config/uboot.release &gt; =
include/generated/version_autogenerated.h.tmp; if [ -r =
include/generated/version_autogenerated.h ] &amp;&amp; cmp -s =
include/generated/version_autogenerated.h =
include/generated/version_autogenerated.h.tmp; then rm -f =
include/generated/version_autogenerated.h.tmp; else : '&nbsp; =
UPD&nbsp;&nbsp;&nbsp;&nbsp; include/generated/version_autogenerated.h'; =
mv -f include/generated/version_autogenerated.h.tmp =
include/generated/version_autogenerated.h; fi<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>make -f =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/Makefile.build =
obj=3D.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>mkdir -p =
lib/<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>mkdir -p =
arch/arm/lib/<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>&nbsp; =
aarch64-openbmc-linux-gcc&nbsp; =
--sysroot=3D/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux=
/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot =
-Wp,-MD,lib/.asm-offsets.s.d&nbsp; -nostdinc -isystem =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot-native/usr/bin/=
aarch64-openbmc-linux/../../lib/aarch64-openbmc-linux/gcc/aarch64-openbmc=
-linux/9.3.0/include -Iinclude&nbsp; =
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-as=
peed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/include&nbsp; =
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-as=
peed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/arch/arm/include =
-include =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/include/linux/kconfig.h&nb=
sp; =
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-as=
peed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/. -I. -D__KERNEL__ =
-D__UBOOT__ -Wall -Wstrict-prototypes -Wno-format-security -fno-builtin =
-ffreestanding -std=3Dgnu11 -fshort-wchar -fno-strict-aliasing -fno-PIE =
-Os -fno-stack-protector -fno-delete-null-pointer-checks =
-fmacro-prefix-map=3D/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-open=
bmc-linux/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/=3D =
-g -fstack-usage -Wno-format-nonliteral -Wno-address-of-packed-member =
-Werror=3Ddate-time -D__ARM__ -fno-pic -ffunction-sections =
-fdata-sections -fno-common -ffixed-r9 -pipe -D__LINUX_ARM_ARCH__=3D7 =
-mtune=3Dgeneric-armv7-a&nbsp;&nbsp; =
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-as=
peed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/arch/arm/mach-aspeed/inc=
lude -DDO_DEPS_ONLY&nbsp;&nbsp;&nbsp; -D&quot;KBUILD_STR(s)=3D#s&quot; =
-D&quot;KBUILD_BASENAME=3DKBUILD_STR(asm_offsets)&quot;&nbsp; =
-D&quot;KBUILD_MODNAME=3DKBUILD_STR(asm_offsets)&quot;&nbsp; =
-fverbose-asm -S -o lib/asm-offsets.s =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/lib/asm-offsets.c<o:p></o:=
p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>&nbsp; =
aarch64-openbmc-linux-gcc&nbsp; =
--sysroot=3D/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux=
/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot =
-Wp,-MD,arch/arm/lib/.asm-offsets.s.d&nbsp; -nostdinc -isystem =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot-native/usr/bin/=
aarch64-openbmc-linux/../../lib/aarch64-openbmc-linux/gcc/aarch64-openbmc=
-linux/9.3.0/include -Iinclude&nbsp; =
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-as=
peed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/include&nbsp; =
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-as=
peed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/arch/arm/include =
-include =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/include/linux/kconfig.h&nb=
sp; =
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-as=
peed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/. -I. -D__KERNEL__ =
-D__UBOOT__ -Wall -Wstrict-prototypes -Wno-format-security -fno-builtin =
-ffreestanding -std=3Dgnu11 -fshort-wchar -fno-strict-aliasing -fno-PIE =
-Os -fno-stack-protector -fno-delete-null-pointer-checks =
-fmacro-prefix-map=3D/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-open=
bmc-linux/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/=3D =
-g -fstack-usage -Wno-format-nonliteral -Wno-address-of-packed-member =
-Werror=3Ddate-time -D__ARM__ -fno-pic -ffunction-sections =
-fdata-sections -fno-common -ffixed-r9 -pipe -D__LINUX_ARM_ARCH__=3D7 =
-mtune=3Dgeneric-armv7-a&nbsp;&nbsp; =
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-as=
peed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/arch/arm/mach-aspeed/inc=
lude -DDO_DEPS_ONLY&nbsp;&nbsp;&nbsp; -D&quot;KBUILD_STR(s)=3D#s&quot; =
-D&quot;KBUILD_BASENAME=3DKBUILD_STR(asm_offsets)&quot;&nbsp; =
-D&quot;KBUILD_MODNAME=3DKBUILD_STR(asm_offsets)&quot;&nbsp; =
-fverbose-asm -S -o arch/arm/lib/asm-offsets.s =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/arch/arm/lib/asm-offsets.c=
<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>cc1: error: unknown value =
'generic-armv7-a' for '-mtune'<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>cc1: note: valid arguments =
are: cortex-a35 cortex-a53 cortex-a57 cortex-a72 cortex-a73 thunderx =
thunderxt88p1 thunderxt88 octeontx octeontx81 octeontx83 thunderxt81 =
thunderxt83 emag xgene1 falkor qdf24xx exynos-m1 phecda thunderx2t99p1 =
vulcan thunderx2t99 cortex-a55 cortex-a75 cortex-a76 ares neoverse-n1 =
neoverse-e1 tsv110 saphira cortex-a57.cortex-a53 cortex-a72.cortex-a53 =
cortex-a73.cortex-a35 cortex-a73.cortex-a53 cortex-a75.cortex-a55 =
cortex-a76.cortex-a55 generic<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>/home/ubuntu/openbmc-2.8.0/bui=
ld/tmp/work/s2500-openbmc-linux/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+0=
9e0e88ee0-r0/git/./Kbuild:43: recipe for target 'lib/asm-offsets.s' =
failed<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>make[2]: *** =
[lib/asm-offsets.s] Error 1<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>make[2]: *** Waiting for =
unfinished jobs....<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>cc1: error: unknown value =
'generic-armv7-a' for '-mtune'<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>cc1: note: valid arguments =
are: cortex-a35 cortex-a53 cortex-a57 cortex-a72 cortex-a73 thunderx =
thunderxt88p1 thunderxt88 octeontx octeontx81 octeontx83 thunderxt81 =
thunderxt83 emag xgene1 falkor qdf24xx exynos-m1 phecda thunderx2t99p1 =
vulcan thunderx2t99 cortex-a55 cortex-a75 cortex-a76 ares neoverse-n1 =
neoverse-e1 tsv110 saphira cortex-a57.cortex-a53 cortex-a72.cortex-a53 =
cortex-a73.cortex-a35 cortex-a73.cortex-a53 cortex-a75.cortex-a55 =
cortex-a76.cortex-a55 generic<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>/home/ubuntu/openbmc-2.8.0/bui=
ld/tmp/work/s2500-openbmc-linux/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+0=
9e0e88ee0-r0/git/./Kbuild:64: recipe for target =
'arch/arm/lib/asm-offsets.s' failed<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>make[2]: *** =
[arch/arm/lib/asm-offsets.s] Error 1<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>/home/ubuntu/openbmc-2.8.0/bui=
ld/tmp/work/s2500-openbmc-linux/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+0=
9e0e88ee0-r0/git/Makefile:1589: recipe for target 'prepare0' =
failed<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>make[1]: *** [prepare0] Error =
2<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>make[1]: Leaving directory =
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-asp=
eed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/build'<o:p></o:p></span></p><=
p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>Makefile:148: recipe for =
target 'sub-make' failed<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>make: *** [sub-make] Error =
2<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>make: Leaving directory =
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-asp=
eed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git'<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>WARNING: exit code 1 from a =
shell command.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'><o:p>&nbsp;</o:p></span></p><p=
 class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>ERROR: Logfile of failure =
stored in: =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/temp/log.do_compile.5502<o:p><=
/o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>Log data =
follows:<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| DEBUG: Executing shell =
function do_compile<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| NOTE: make -j 4 =
CROSS_COMPILE=3Daarch64-openbmc-linux- =
CC=3Daarch64-openbmc-linux-gcc&nbsp; =
--sysroot=3D/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux=
/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot =
V=3D1 HOSTCC=3Dgcc&nbsp; =
-isystem/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-b=
oot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot-native/=
usr/include -O2 -pipe =
-L/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-as=
peed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot-native/usr/li=
b&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
-L/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-as=
peed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot-native/lib&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
-Wl,--enable-new-dtags&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; =
-Wl,-rpath-link,/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-l=
inux/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot=
-native/usr/lib&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; =
-Wl,-rpath-link,/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-l=
inux/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot=
-native/lib&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =
-Wl,-rpath,/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/=
u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot-nati=
ve/usr/lib&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; =
-Wl,-rpath,/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/=
u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot-nati=
ve/lib&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; -Wl,-O1 =
STAGING_INCDIR=3D/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-=
linux/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroo=
t-native/usr/include =
STAGING_LIBDIR=3D/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-=
linux/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroo=
t-native/usr/lib -C =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git =
O=3D/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-=
aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/build =
DEVICE_TREE=3Dast2600-s2500<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| make: Entering directory =
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-asp=
eed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git'<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| make -C =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/build =
KBUILD_SRC=3D/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linu=
x/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git =
\<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| -f =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/Makefile<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| make[1]: Entering directory =
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-asp=
eed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/build'<o:p></o:p></span></p><=
p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| set -e; : '&nbsp; =
CHK&nbsp;&nbsp;&nbsp;&nbsp; include/config/uboot.release'; mkdir -p =
include/config/; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo =
&quot;2019.04$(/bin/bash =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/setlocalversion =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git)&quot; &lt; =
include/config/auto.conf &gt; include/config/uboot.release.tmp; if [ -r =
include/config/uboot.release ] &amp;&amp; cmp -s =
include/config/uboot.release include/config/uboot.release.tmp; then rm =
-f include/config/uboot.release.tmp; else : '&nbsp; =
UPD&nbsp;&nbsp;&nbsp;&nbsp; include/config/uboot.release'; mv -f =
include/config/uboot.release.tmp include/config/uboot.release; =
fi<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| ln -fsn =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git =
source<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| set -e; : '&nbsp; =
CHK&nbsp;&nbsp;&nbsp;&nbsp; =
include/generated/timestamp_autogenerated.h'; mkdir -p =
include/generated/; &nbsp;&nbsp;&nbsp;&nbsp; (if test -n =
&quot;${SOURCE_DATE_EPOCH}&quot;; then =
SOURCE_DATE=3D&quot;@${SOURCE_DATE_EPOCH}&quot;; DATE=3D&quot;&quot;; =
for date in gdate date.gnu date; do ${date} -u -d =
&quot;${SOURCE_DATE}&quot; &gt;/dev/null 2&gt;&amp;1 &amp;&amp; =
DATE=3D&quot;${date}&quot;; done; if test -n &quot;${DATE}&quot;; then =
LC_ALL=3DC ${DATE} -u -d &quot;${SOURCE_DATE}&quot; +'#define =
U_BOOT_DATE &quot;%b %d %C%y&quot;'; LC_ALL=3DC ${DATE} -u -d =
&quot;${SOURCE_DATE}&quot; +'#define U_BOOT_TIME &quot;%T&quot;'; =
LC_ALL=3DC ${DATE} -u -d &quot;${SOURCE_DATE}&quot; +'#define U_BOOT_TZ =
&quot;%z&quot;'; LC_ALL=3DC ${DATE} -u -d &quot;${SOURCE_DATE}&quot; =
+'#define U_BOOT_DMI_DATE &quot;%m/%d/%Y&quot;'; LC_ALL=3DC ${DATE} -u =
-d &quot;${SOURCE_DATE}&quot; +'#define U_BOOT_BUILD_DATE 0x%Y%m%d'; =
else return 42; fi; else LC_ALL=3DC date +'#define U_BOOT_DATE &quot;%b =
%d %C%y&quot;'; LC_ALL=3DC date +'#define U_BOOT_TIME &quot;%T&quot;'; =
LC_ALL=3DC date +'#define U_BOOT_TZ &quot;%z&quot;'; LC_ALL=3DC date =
+'#define U_BOOT_DMI_DATE &quot;%m/%d/%Y&quot;'; LC_ALL=3DC date =
+'#define U_BOOT_BUILD_DATE 0x%Y%m%d'; fi) &lt; =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/Makefile &gt; =
include/generated/timestamp_autogenerated.h.tmp; if [ -r =
include/generated/timestamp_autogenerated.h ] &amp;&amp; cmp -s =
include/generated/timestamp_autogenerated.h =
include/generated/timestamp_autogenerated.h.tmp; then rm -f =
include/generated/timestamp_autogenerated.h.tmp; else : '&nbsp; =
UPD&nbsp;&nbsp;&nbsp;&nbsp; =
include/generated/timestamp_autogenerated.h'; mv -f =
include/generated/timestamp_autogenerated.h.tmp =
include/generated/timestamp_autogenerated.h; fi<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| make -f =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/Makefile.build =
obj=3Dscripts/basic<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| /bin/bash =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/mkmakefile =
\<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>|&nbsp;&nbsp;&nbsp;&nbsp; =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git . 2019 =
04<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>|&nbsp;&nbsp; =
GEN&nbsp;&nbsp;&nbsp;&nbsp; ./Makefile<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| rm -f =
.tmp_quiet_recordmcount<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| make -f =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/Makefile.build =
obj=3Dscripts<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| if [ -f =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/.config -o -d =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/include/config ]; then =
\<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo &gt;&amp;2 &quot;&nbsp; =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git is not clean, please run =
'make mrproper'&quot;; \<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo &gt;&amp;2 &quot;&nbsp; =
in the =
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-asp=
eed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git' =
directory.&quot;;\<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /bin/false; =
\<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| fi;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| make -f =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/Makefile.build =
obj=3Dscripts/dtc<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| set -e; : '&nbsp; =
CHK&nbsp;&nbsp;&nbsp;&nbsp; include/generated/version_autogenerated.h'; =
mkdir -p include/generated/; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (echo \#define =
PLAIN_VERSION \&quot;2019.04&quot;&quot;\&quot;; echo \#define =
U_BOOT_VERSION \&quot;U-Boot \&quot; PLAIN_VERSION; echo \#define =
CC_VERSION_STRING \&quot;$(LC_ALL=3DC aarch64-openbmc-linux-gcc&nbsp; =
--sysroot=3D/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux=
/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot =
--version | head -n 1)\&quot;; echo \#define LD_VERSION_STRING =
\&quot;$(LC_ALL=3DC aarch64-openbmc-linux-ld.bfd --version | head -n =
1)\&quot;; ) &lt; include/config/uboot.release &gt; =
include/generated/version_autogenerated.h.tmp; if [ -r =
include/generated/version_autogenerated.h ] &amp;&amp; cmp -s =
include/generated/version_autogenerated.h =
include/generated/version_autogenerated.h.tmp; then rm -f =
include/generated/version_autogenerated.h.tmp; else : '&nbsp; =
UPD&nbsp;&nbsp;&nbsp;&nbsp; include/generated/version_autogenerated.h'; =
mv -f include/generated/version_autogenerated.h.tmp =
include/generated/version_autogenerated.h; fi<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| make -f =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/Makefile.build =
obj=3D.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| mkdir -p =
lib/<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| mkdir -p =
arch/arm/lib/<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>|&nbsp;&nbsp; =
aarch64-openbmc-linux-gcc&nbsp; =
--sysroot=3D/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux=
/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot =
-Wp,-MD,lib/.asm-offsets.s.d&nbsp; -nostdinc -isystem =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot-native/usr/bin/=
aarch64-openbmc-linux/../../lib/aarch64-openbmc-linux/gcc/aarch64-openbmc=
-linux/9.3.0/include -Iinclude&nbsp; =
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-as=
peed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/include&nbsp; =
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-as=
peed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/arch/arm/include =
-include =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/include/linux/kconfig.h&nb=
sp; =
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-as=
peed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/. -I. -D__KERNEL__ =
-D__UBOOT__ -Wall -Wstrict-prototypes -Wno-format-security -fno-builtin =
-ffreestanding -std=3Dgnu11 -fshort-wchar -fno-strict-aliasing -fno-PIE =
-Os -fno-stack-protector -fno-delete-null-pointer-checks =
-fmacro-prefix-map=3D/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-open=
bmc-linux/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/=3D =
-g -fstack-usage -Wno-format-nonliteral -Wno-address-of-packed-member =
-Werror=3Ddate-time -D__ARM__ -fno-pic -ffunction-sections =
-fdata-sections -fno-common -ffixed-r9 -pipe -D__LINUX_ARM_ARCH__=3D7 =
-mtune=3Dgeneric-armv7-a&nbsp;&nbsp; =
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-as=
peed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/arch/arm/mach-aspeed/inc=
lude -DDO_DEPS_ONLY&nbsp;&nbsp;&nbsp; -D&quot;KBUILD_STR(s)=3D#s&quot; =
-D&quot;KBUILD_BASENAME=3DKBUILD_STR(asm_offsets)&quot;&nbsp; =
-D&quot;KBUILD_MODNAME=3DKBUILD_STR(asm_offsets)&quot;&nbsp; =
-fverbose-asm -S -o lib/asm-offsets.s =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/lib/asm-offsets.c<o:p></o:=
p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>|&nbsp;&nbsp; =
aarch64-openbmc-linux-gcc&nbsp; =
--sysroot=3D/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux=
/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot =
-Wp,-MD,arch/arm/lib/.asm-offsets.s.d&nbsp; -nostdinc -isystem =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot-native/usr/bin/=
aarch64-openbmc-linux/../../lib/aarch64-openbmc-linux/gcc/aarch64-openbmc=
-linux/9.3.0/include -Iinclude&nbsp; =
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-as=
peed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/include&nbsp; =
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-as=
peed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/arch/arm/include =
-include =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/include/linux/kconfig.h&nb=
sp; =
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-as=
peed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/. -I. -D__KERNEL__ =
-D__UBOOT__ -Wall -Wstrict-prototypes -Wno-format-security -fno-builtin =
-ffreestanding -std=3Dgnu11 -fshort-wchar -fno-strict-aliasing -fno-PIE =
-Os -fno-stack-protector -fno-delete-null-pointer-checks =
-fmacro-prefix-map=3D/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-open=
bmc-linux/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/=3D =
-g -fstack-usage -Wno-format-nonliteral -Wno-address-of-packed-member =
-Werror=3Ddate-time -D__ARM__ -fno-pic -ffunction-sections =
-fdata-sections -fno-common -ffixed-r9 -pipe -D__LINUX_ARM_ARCH__=3D7 =
-mtune=3Dgeneric-armv7-a&nbsp;&nbsp; =
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-as=
peed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/arch/arm/mach-aspeed/inc=
lude -DDO_DEPS_ONLY&nbsp;&nbsp;&nbsp; -D&quot;KBUILD_STR(s)=3D#s&quot; =
-D&quot;KBUILD_BASENAME=3DKBUILD_STR(asm_offsets)&quot;&nbsp; =
-D&quot;KBUILD_MODNAME=3DKBUILD_STR(asm_offsets)&quot;&nbsp; =
-fverbose-asm -S -o arch/arm/lib/asm-offsets.s =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/arch/arm/lib/asm-offsets.c=
<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| cc1: error: unknown value =
'generic-armv7-a' for '-mtune'<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| cc1: note: valid arguments =
are: cortex-a35 cortex-a53 cortex-a57 cortex-a72 cortex-a73 thunderx =
thunderxt88p1 thunderxt88 octeontx octeontx81 octeontx83 thunderxt81 =
thunderxt83 emag xgene1 falkor qdf24xx exynos-m1 phecda thunderx2t99p1 =
vulcan thunderx2t99 cortex-a55 cortex-a75 cortex-a76 ares neoverse-n1 =
neoverse-e1 tsv110 saphira cortex-a57.cortex-a53 cortex-a72.cortex-a53 =
cortex-a73.cortex-a35 cortex-a73.cortex-a53 cortex-a75.cortex-a55 =
cortex-a76.cortex-a55 generic<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/./Kbuild:43: recipe for =
target 'lib/asm-offsets.s' failed<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| make[2]: *** =
[lib/asm-offsets.s] Error 1<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| make[2]: *** Waiting for =
unfinished jobs....<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| cc1: error: unknown value =
'generic-armv7-a' for '-mtune'<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| cc1: note: valid arguments =
are: cortex-a35 cortex-a53 cortex-a57 cortex-a72 cortex-a73 thunderx =
thunderxt88p1 thunderxt88 octeontx octeontx81 octeontx83 thunderxt81 =
thunderxt83 emag xgene1 falkor qdf24xx exynos-m1 phecda thunderx2t99p1 =
vulcan thunderx2t99 cortex-a55 cortex-a75 cortex-a76 ares neoverse-n1 =
neoverse-e1 tsv110 saphira cortex-a57.cortex-a53 cortex-a72.cortex-a53 =
cortex-a73.cortex-a35 cortex-a73.cortex-a53 cortex-a75.cortex-a55 =
cortex-a76.cortex-a55 generic<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/./Kbuild:64: recipe for =
target 'arch/arm/lib/asm-offsets.s' failed<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| make[2]: *** =
[arch/arm/lib/asm-offsets.s] Error 1<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/Makefile:1589: recipe for =
target 'prepare0' failed<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| make[1]: *** [prepare0] =
Error 2<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| make[1]: Leaving directory =
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-asp=
eed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/build'<o:p></o:p></span></p><=
p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| Makefile:148: recipe for =
target 'sub-make' failed<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| make: *** [sub-make] Error =
2<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| make: Leaving directory =
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-asp=
eed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git'<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| ERROR: oe_runmake =
failed<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| WARNING: exit code 1 from a =
shell command.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| ERROR: Execution of =
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-asp=
eed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/temp/run.do_compile.5502' =
failed with exit code 1:<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| make: Entering directory =
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-asp=
eed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git'<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| make -C =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/build =
KBUILD_SRC=3D/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linu=
x/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git =
\<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| -f =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/Makefile<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| make[1]: Entering directory =
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-asp=
eed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/build'<o:p></o:p></span></p><=
p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| set -e; : '&nbsp; =
CHK&nbsp;&nbsp;&nbsp;&nbsp; include/config/uboot.release'; mkdir -p =
include/config/; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo =
&quot;2019.04$(/bin/bash =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/setlocalversion =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git)&quot; &lt; =
include/config/auto.conf &gt; include/config/uboot.release.tmp; if [ -r =
include/config/uboot.release ] &amp;&amp; cmp -s =
include/config/uboot.release include/config/uboot.release.tmp; then rm =
-f include/config/uboot.release.tmp; else : '&nbsp; =
UPD&nbsp;&nbsp;&nbsp;&nbsp; include/config/uboot.release'; mv -f =
include/config/uboot.release.tmp include/config/uboot.release; =
fi<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| ln -fsn =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git =
source<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| set -e; : '&nbsp; =
CHK&nbsp;&nbsp;&nbsp;&nbsp; =
include/generated/timestamp_autogenerated.h'; mkdir -p =
include/generated/; &nbsp;&nbsp;&nbsp;&nbsp; (if test -n =
&quot;${SOURCE_DATE_EPOCH}&quot;; then =
SOURCE_DATE=3D&quot;@${SOURCE_DATE_EPOCH}&quot;; DATE=3D&quot;&quot;; =
for date in gdate date.gnu date; do ${date} -u -d =
&quot;${SOURCE_DATE}&quot; &gt;/dev/null 2&gt;&amp;1 &amp;&amp; =
DATE=3D&quot;${date}&quot;; done; if test -n &quot;${DATE}&quot;; then =
LC_ALL=3DC ${DATE} -u -d &quot;${SOURCE_DATE}&quot; +'#define =
U_BOOT_DATE &quot;%b %d %C%y&quot;'; LC_ALL=3DC ${DATE} -u -d =
&quot;${SOURCE_DATE}&quot; +'#define U_BOOT_TIME &quot;%T&quot;'; =
LC_ALL=3DC ${DATE} -u -d &quot;${SOURCE_DATE}&quot; +'#define U_BOOT_TZ =
&quot;%z&quot;'; LC_ALL=3DC ${DATE} -u -d &quot;${SOURCE_DATE}&quot; =
+'#define U_BOOT_DMI_DATE &quot;%m/%d/%Y&quot;'; LC_ALL=3DC ${DATE} -u =
-d &quot;${SOURCE_DATE}&quot; +'#define U_BOOT_BUILD_DATE 0x%Y%m%d'; =
else return 42; fi; else LC_ALL=3DC date +'#define U_BOOT_DATE &quot;%b =
%d %C%y&quot;'; LC_ALL=3DC date +'#define U_BOOT_TIME &quot;%T&quot;'; =
LC_ALL=3DC date +'#define U_BOOT_TZ &quot;%z&quot;'; LC_ALL=3DC date =
+'#define U_BOOT_DMI_DATE &quot;%m/%d/%Y&quot;'; LC_ALL=3DC date =
+'#define U_BOOT_BUILD_DATE 0x%Y%m%d'; fi) &lt; =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/Makefile &gt; =
include/generated/timestamp_autogenerated.h.tmp; if [ -r =
include/generated/timestamp_autogenerated.h ] &amp;&amp; cmp -s =
include/generated/timestamp_autogenerated.h =
include/generated/timestamp_autogenerated.h.tmp; then rm -f =
include/generated/timestamp_autogenerated.h.tmp; else : '&nbsp; =
UPD&nbsp;&nbsp;&nbsp;&nbsp; =
include/generated/timestamp_autogenerated.h'; mv -f =
include/generated/timestamp_autogenerated.h.tmp =
include/generated/timestamp_autogenerated.h; fi<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| make -f =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/Makefile.build =
obj=3Dscripts/basic<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| /bin/bash =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/mkmakefile =
\<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>|&nbsp;&nbsp;&nbsp;&nbsp; =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git . 2019 =
04<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>|&nbsp;&nbsp; =
GEN&nbsp;&nbsp;&nbsp;&nbsp; ./Makefile<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| rm -f =
.tmp_quiet_recordmcount<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| make -f =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/Makefile.build =
obj=3Dscripts<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| if [ -f =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/.config -o -d =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/include/config ]; then =
\<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo &gt;&amp;2 &quot;&nbsp; =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git is not clean, please run =
'make mrproper'&quot;; \<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo &gt;&amp;2 &quot;&nbsp; =
in the =
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-asp=
eed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git' =
directory.&quot;;\<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /bin/false; =
\<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| fi;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| make -f =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/Makefile.build =
obj=3Dscripts/dtc<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| set -e; : '&nbsp; =
CHK&nbsp;&nbsp;&nbsp;&nbsp; include/generated/version_autogenerated.h'; =
mkdir -p include/generated/; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (echo \#define =
PLAIN_VERSION \&quot;2019.04&quot;&quot;\&quot;; echo \#define =
U_BOOT_VERSION \&quot;U-Boot \&quot; PLAIN_VERSION; echo \#define =
CC_VERSION_STRING \&quot;$(LC_ALL=3DC aarch64-openbmc-linux-gcc&nbsp; =
--sysroot=3D/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux=
/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot =
--version | head -n 1)\&quot;; echo \#define LD_VERSION_STRING =
\&quot;$(LC_ALL=3DC aarch64-openbmc-linux-ld.bfd --version | head -n =
1)\&quot;; ) &lt; include/config/uboot.release &gt; =
include/generated/version_autogenerated.h.tmp; if [ -r =
include/generated/version_autogenerated.h ] &amp;&amp; cmp -s =
include/generated/version_autogenerated.h =
include/generated/version_autogenerated.h.tmp; then rm -f =
include/generated/version_autogenerated.h.tmp; else : '&nbsp; =
UPD&nbsp;&nbsp;&nbsp;&nbsp; include/generated/version_autogenerated.h'; =
mv -f include/generated/version_autogenerated.h.tmp =
include/generated/version_autogenerated.h; fi<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| make -f =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/scripts/Makefile.build =
obj=3D.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| mkdir -p =
lib/<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| mkdir -p =
arch/arm/lib/<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>|&nbsp;&nbsp; =
aarch64-openbmc-linux-gcc&nbsp; =
--sysroot=3D/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux=
/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot =
-Wp,-MD,lib/.asm-offsets.s.d&nbsp; -nostdinc -isystem =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot-native/usr/bin/=
aarch64-openbmc-linux/../../lib/aarch64-openbmc-linux/gcc/aarch64-openbmc=
-linux/9.3.0/include -Iinclude&nbsp; =
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-as=
peed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/include&nbsp; =
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-as=
peed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/arch/arm/include =
-include =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/include/linux/kconfig.h&nb=
sp; =
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-as=
peed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/. -I. -D__KERNEL__ =
-D__UBOOT__ -Wall -Wstrict-prototypes -Wno-format-security -fno-builtin =
-ffreestanding -std=3Dgnu11 -fshort-wchar -fno-strict-aliasing -fno-PIE =
-Os -fno-stack-protector -fno-delete-null-pointer-checks =
-fmacro-prefix-map=3D/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-open=
bmc-linux/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/=3D =
-g -fstack-usage -Wno-format-nonliteral -Wno-address-of-packed-member =
-Werror=3Ddate-time -D__ARM__ -fno-pic -ffunction-sections =
-fdata-sections -fno-common -ffixed-r9 -pipe -D__LINUX_ARM_ARCH__=3D7 =
-mtune=3Dgeneric-armv7-a&nbsp;&nbsp; =
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-as=
peed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/arch/arm/mach-aspeed/inc=
lude -DDO_DEPS_ONLY&nbsp;&nbsp;&nbsp; -D&quot;KBUILD_STR(s)=3D#s&quot; =
-D&quot;KBUILD_BASENAME=3DKBUILD_STR(asm_offsets)&quot;&nbsp; =
-D&quot;KBUILD_MODNAME=3DKBUILD_STR(asm_offsets)&quot;&nbsp; =
-fverbose-asm -S -o lib/asm-offsets.s =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/lib/asm-offsets.c<o:p></o:=
p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>|&nbsp;&nbsp; =
aarch64-openbmc-linux-gcc&nbsp; =
--sysroot=3D/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux=
/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot =
-Wp,-MD,arch/arm/lib/.asm-offsets.s.d&nbsp; -nostdinc -isystem =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/recipe-sysroot-native/usr/bin/=
aarch64-openbmc-linux/../../lib/aarch64-openbmc-linux/gcc/aarch64-openbmc=
-linux/9.3.0/include -Iinclude&nbsp; =
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-as=
peed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/include&nbsp; =
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-as=
peed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/arch/arm/include =
-include =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/include/linux/kconfig.h&nb=
sp; =
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-as=
peed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/. -I. -D__KERNEL__ =
-D__UBOOT__ -Wall -Wstrict-prototypes -Wno-format-security -fno-builtin =
-ffreestanding -std=3Dgnu11 -fshort-wchar -fno-strict-aliasing -fno-PIE =
-Os -fno-stack-protector -fno-delete-null-pointer-checks =
-fmacro-prefix-map=3D/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-open=
bmc-linux/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/=3D =
-g -fstack-usage -Wno-format-nonliteral -Wno-address-of-packed-member =
-Werror=3Ddate-time -D__ARM__ -fno-pic -ffunction-sections =
-fdata-sections -fno-common -ffixed-r9 -pipe -D__LINUX_ARM_ARCH__=3D7 =
-mtune=3Dgeneric-armv7-a&nbsp;&nbsp; =
-I/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-as=
peed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/arch/arm/mach-aspeed/inc=
lude -DDO_DEPS_ONLY&nbsp;&nbsp;&nbsp; -D&quot;KBUILD_STR(s)=3D#s&quot; =
-D&quot;KBUILD_BASENAME=3DKBUILD_STR(asm_offsets)&quot;&nbsp; =
-D&quot;KBUILD_MODNAME=3DKBUILD_STR(asm_offsets)&quot;&nbsp; =
-fverbose-asm -S -o arch/arm/lib/asm-offsets.s =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/arch/arm/lib/asm-offsets.c=
<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| cc1: error: unknown value =
'generic-armv7-a' for '-mtune'<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| cc1: note: valid arguments =
are: cortex-a35 cortex-a53 cortex-a57 cortex-a72 cortex-a73 thunderx =
thunderxt88p1 thunderxt88 octeontx octeontx81 octeontx83 thunderxt81 =
thunderxt83 emag xgene1 falkor qdf24xx exynos-m1 phecda thunderx2t99p1 =
vulcan thunderx2t99 cortex-a55 cortex-a75 cortex-a76 ares neoverse-n1 =
neoverse-e1 tsv110 saphira cortex-a57.cortex-a53 cortex-a72.cortex-a53 =
cortex-a73.cortex-a35 cortex-a73.cortex-a53 cortex-a75.cortex-a55 =
cortex-a76.cortex-a55 generic<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/./Kbuild:43: recipe for =
target 'lib/asm-offsets.s' failed<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| make[2]: *** =
[lib/asm-offsets.s] Error 1<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| make[2]: *** Waiting for =
unfinished jobs....<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| cc1: error: unknown value =
'generic-armv7-a' for '-mtune'<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| cc1: note: valid arguments =
are: cortex-a35 cortex-a53 cortex-a57 cortex-a72 cortex-a73 thunderx =
thunderxt88p1 thunderxt88 octeontx octeontx81 octeontx83 thunderxt81 =
thunderxt83 emag xgene1 falkor qdf24xx exynos-m1 phecda thunderx2t99p1 =
vulcan thunderx2t99 cortex-a55 cortex-a75 cortex-a76 ares neoverse-n1 =
neoverse-e1 tsv110 saphira cortex-a57.cortex-a53 cortex-a72.cortex-a53 =
cortex-a73.cortex-a35 cortex-a73.cortex-a53 cortex-a75.cortex-a55 =
cortex-a76.cortex-a55 generic<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/./Kbuild:64: recipe for =
target 'arch/arm/lib/asm-offsets.s' failed<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| make[2]: *** =
[arch/arm/lib/asm-offsets.s] Error 1<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| =
/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-aspe=
ed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git/Makefile:1589: recipe for =
target 'prepare0' failed<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| make[1]: *** [prepare0] =
Error 2<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| make[1]: Leaving directory =
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-asp=
eed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/build'<o:p></o:p></span></p><=
p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| Makefile:148: recipe for =
target 'sub-make' failed<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| make: *** [sub-make] Error =
2<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| make: Leaving directory =
'/home/ubuntu/openbmc-2.8.0/build/tmp/work/s2500-openbmc-linux/u-boot-asp=
eed-sdk/1_v2019.04+gitAUTOINC+09e0e88ee0-r0/git'<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| WARNING: exit code 1 from a =
shell command.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>| <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>ERROR: Task =
(/home/ubuntu/openbmc-2.8.0/meta-aspeed/recipes-bsp/u-boot/u-boot-aspeed-=
sdk_2019.04.bb:do_compile) failed with exit code =
'1'<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>NOTE: Tasks Summary: =
Attempted 3593 tasks of which 3591 didn't need to be rerun and 1 =
failed.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'><o:p>&nbsp;</o:p></span></p><p=
 class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>Summary: 1 task =
failed:<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>&nbsp; =
/home/ubuntu/openbmc-2.8.0/meta-aspeed/recipes-bsp/u-boot/u-boot-aspeed-s=
dk_2019.04.bb:do_compile<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>Summary: There was 1 WARNING =
message shown.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:7.5pt;font-family:"times =
new",serif;color:#24292E;background:white'>Summary: There were 2 ERROR =
messages shown, returning a non-zero exit code.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US style=3D'font-family:"Segoe =
UI",sans-serif;color:#24292E;background:white'><o:p>&nbsp;</o:p></span></=
p><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-family:"Segoe =
UI",sans-serif;color:#24292E;background:white'><o:p>&nbsp;</o:p></span></=
p><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-family:"Segoe =
UI",sans-serif;color:#24292E;background:white'>Any help will be greatly =
appreciated.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-family:"Segoe =
UI",sans-serif;color:#24292E;background:white'><o:p>&nbsp;</o:p></span></=
p><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-family:"Segoe =
UI",sans-serif;color:#24292E;background:white'>Thanks!</span><span =
lang=3DEN-US><o:p></o:p></span></p></div></body></html>
------=_NextPart_000_0000_01D7111C.B0DC40E0--

