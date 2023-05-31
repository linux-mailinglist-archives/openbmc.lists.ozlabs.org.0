Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C987180B6
	for <lists+openbmc@lfdr.de>; Wed, 31 May 2023 14:57:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWTnt6KPsz3f7g
	for <lists+openbmc@lfdr.de>; Wed, 31 May 2023 22:57:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hqiWOSL7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hqiWOSL7;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWTnK0ms9z3bd5
	for <openbmc@lists.ozlabs.org>; Wed, 31 May 2023 22:57:24 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34VCmJeW020659;
	Wed, 31 May 2023 12:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=MsYL8G2jPi1we4+jT29rw032Gz/XjuqKCFWZzlRmwio=;
 b=hqiWOSL7xwzOd8H5osw8/VgYB2EbnBi78uzt7x/GJCLf5WBrMWKOz1z743FS1baUBrMd
 GBYzetifi6YRwPGtzmJcWvXxNW775MllKTIa8fQlsPBMU02vGd5xaOyOYVYUGk37ZOtS
 2aWyVBDXbBQTomiZj+H4MXO7BzZeFq79j/CZRbgfxxsA5Uz9viSH/YdBeFpCPGWk1smv
 Uu4wdNBudq+1dokNDmHWIl0DnLz4bLNA6YghbhxnyAm+CChwPkBMG1QibO/gVORdR3Ap
 nayj3mvBSJVzEKrarPGu9cIyavVU5vOHVypFRxPNrr94q8+tPGkPqbwuJ8UqLbpPOnFj ug== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qx61hs2m3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 May 2023 12:57:05 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34VBrVR0012690;
	Wed, 31 May 2023 12:57:04 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
	by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3qu9g5un5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 May 2023 12:57:03 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34VCv2OC62521720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 31 May 2023 12:57:02 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C1B7D58050;
	Wed, 31 May 2023 12:57:02 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D3CBE58054;
	Wed, 31 May 2023 12:57:01 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 31 May 2023 12:57:01 +0000 (GMT)
Message-ID: <37a27e49-390e-49e4-76a4-eafb28e54a3f@linux.ibm.com>
Date: Wed, 31 May 2023 08:57:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Integrating swtpm(as a software TPM) with OpenBMC on Qemu
Content-Language: en-US
To: Sandeep Kumar <sandeep.pkumar@tcs.com>,
        =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        Ninad Palsule <ninad@linux.ibm.com>, Joel Stanley <jms@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>
References: <MA1PR01MB412922EF629403C84674A6AD87909@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <MA1PR01MB412975D2976523FD64289DB487729@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <b35b62e6-2195-627f-6939-381f40abdd43@linux.ibm.com>
 <MA1PR01MB41293CA1F337F47DDA58035D87729@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <71e0634f-e5b6-d804-7b55-7ae674f34342@linux.ibm.com>
 <MA1PR01MB41297364D34EE0949966C5BD87769@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <7481d113-65f9-fc86-1908-29d8234ad980@linux.ibm.com>
 <PN2PR01MB41385D9BE33B729837BD39C2877E9@PN2PR01MB4138.INDPRD01.PROD.OUTLOOK.COM>
 <58361ee6-99a7-e19c-704d-e4fbb0e422d0@linux.ibm.com>
 <MA1PR01MB412970377A2533F1BEA11BA987409@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <9ef4994c-6665-d7a2-f79c-f1360d3873e5@linux.ibm.com>
 <MA1PR01MB412906869D16199F845C80A987469@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <fdfbd0c5-87b0-a19a-802a-031c3a5f5043@linux.ibm.com>
 <MA1PR01MB412933A109AA9D24C47671B287489@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <MA1PR01MB412933A109AA9D24C47671B287489@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vdSJ17yC4XRgTPjEpLWlpT4X1YHcLWFV
X-Proofpoint-ORIG-GUID: vdSJ17yC4XRgTPjEpLWlpT4X1YHcLWFV
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-31_08,2023-05-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305310108
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



On 5/31/23 01:04, Sandeep Kumar wrote:
>   TCS Confidential
> 
> Hi All,
> 
> We are still stuck in this step. Tried few things like changing the defconfig for the machine to support TPM, changes to local.conf to include the packages, etc. But nothing helped. Would appreciate any help to rectify this problem.

Maybe you need to show the config files you made changes to so that others can try to recreate the issue. As I stated below for me uboot has TPM 2 support with the default configuration -- no changes needed:

$ . setup evb-ast2600
Machine evb-ast2600 found in meta-evb/meta-evb-aspeed/meta-evb-ast2600
Common targets are:

      obmc-phosphor-image: Includes OpenBMC Phosphor userspace and Web UI

      core-image-minimal: A small image just capable of allowing a device to boot

      core-image-full-cmdline: A small image with more Linux functionality
                               installed, including a ssh server.

Note that the core targets will not set the default phosphor password.

$ bitbake obmc-phosphor-image
[...]

$ ~/qemu-system-arm -machine ast2600-evb -nographic -no-reboot -net nic -net user,hostfwd=:127.0.0.1:5722-:22,hostfwd=:127.0.0.1:5743-:443,hostfwd=udp:127.0.0.1:5723-:623 -drive file=./tmp/deploy/images/evb-ast2600/obmc-phosphor-image-evb-ast2600.static.mtd,format=raw,if=mt
[...]


Hit any key to stop autoboot:  0
ast# help
?         - alias for 'help'
base      - print or set address offset
bdinfo    - print Board Info structure
blkcache  - block cache diagnostics and control
boot      - boot default, i.e., run 'bootcmd'
bootd     - boot default, i.e., run 'bootcmd'
bootm     - boot application image from memory
bootp     - boot image via network using BOOTP/TFTP protocol
bootz     - boot Linux zImage image from memory
chpart    - change active partition
clk       - CLK sub-system
cmp       - memory compare
coninfo   - print console devices and information
cp        - memory copy
crc32     - checksum calculation
dhcp      - boot image via network using DHCP/TFTP protocol
dm        - Driver model low level access
dramtest  - ASPEED DRAM BIST
echo      - echo args to console
editenv   - edit environment variable
env       - environment handling commands
erase     - erase FLASH memory
exit      - exit script
ext2load  - load binary file from a Ext2 filesystem
ext2ls    - list files in a directory (default /)
ext4load  - load binary file from a Ext4 filesystem
ext4ls    - list files in a directory (default /)
ext4size  - determine a file's size
ext4write - create a file in the root directory
false     - do nothing, unsuccessfully
fatinfo   - print information about filesystem
fatload   - load binary file from a dos filesystem
fatls     - list files in a directory (default /)
fatsize   - determine a file's size
fdt       - flattened device tree utility commands
flinfo    - print FLASH memory information
fstype    - Look up a filesystem type
go        - start application at address 'addr'
gpio      - query and control gpio pins
gpt       - GUID Partition Table
hash      - compute hash message digest
help      - print command description/usage
i2c       - I2C sub-system
itest     - return true/false on integer compare
load      - load binary file from a filesystem
loadb     - load binary file over serial line (kermit mode)
loads     - load S-Record file over serial line
loadx     - load binary file over serial line (xmodem mode)
loady     - load binary file over serial line (ymodem mode)
log       - log system
loop      - infinite loop on address range
ls        - list files in a directory (default /)
md        - memory display
mdio      - MDIO utility commands
mii       - MII utility commands
mm        - memory modify (auto-incrementing address)
mmc       - MMC sub system
mmcinfo   - display MMC info
mtdparts  - define flash/nand partitions
mtest     - simple RAM read/write test
mw        - memory write (fill)
ncsi      - Configure attached NIC via NC-SI
nfs       - boot image via network using NFS protocol
nm        - memory modify (constant address)
otp       - ASPEED One-Time-Programmable sub-system
part      - disk partition related commands
peci      - ASPEED PECI general bus command test program
ping      - send ICMP ECHO_REQUEST to network host
pinmux    - show pin-controller muxing
printenv  - print environment variables
protect   - enable or disable FLASH write protection
reset     - Perform RESET of the CPU
run       - run commands in an environment variable
save      - save file to a filesystem
saveenv   - save environment variables to persistent storage
setenv    - set environment variables
setexpr   - set environment variable as the result of eval expression
sf        - SPI flash sub-system
showvar   - print local hushshell variables
size      - determine a file's size
sleep     - delay execution for some time
source    - run script from memory
test      - minimal test like /bin/sh
tftpboot  - boot image via network using TFTP protocol
tpm2      - Issue a TPMv2.x command
true      - do nothing, successfully
version   - print monitor, compiler and linker version
ast# help tpm2
tpm2 - Issue a TPMv2.x command

Usage:
tpm2 <command> [<arguments>]

device [num device]
     Show all devices or set the specified device
[...]

Regards,
    Stefan

> 
> Thanks,
> Sandeep.
> 
> 
> 
> -----Original Message-----
> From: Stefan Berger <stefanb@linux.ibm.com>
> Sent: Thursday, May 25, 2023 6:19 PM
> To: Sandeep Kumar <sandeep.pkumar@tcs.com>; Cédric Le Goater <clg@kaod.org>; openbmc@lists.ozlabs.org; Ninad Palsule <ninad@linux.ibm.com>; Joel Stanley <jms@jms.id.au>; Andrew Jeffery <andrew@aj.id.au>
> Subject: Re: Integrating swtpm(as a software TPM) with OpenBMC on Qemu
> 
> "External email. Open with Caution"
> 
> 
> On 5/25/23 05:49, Sandeep Kumar wrote:
>>    TCS Confidential
>>
>> Hi Stefan,
>>
>> Which OS are you building this ? I am building it on ubuntu 20.04. Also, I am building it for evb-ast2600 and I don’t see TPM enabled in the configs/evb-ast2600_defconfig  file.
> 
> $ cat /etc/lsb-release
> DISTRIB_ID=Ubuntu
> DISTRIB_RELEASE=22.04
> DISTRIB_CODENAME=jammy
> DISTRIB_DESCRIPTION="Ubuntu 22.04.1 LTS"
> 
> $ . setup evb-ast2600
> Machine evb-ast2600 found in meta-evb/meta-evb-aspeed/meta-evb-ast2600
> Common targets are:
> 
>        obmc-phosphor-image: Includes OpenBMC Phosphor userspace and Web UI
> 
>        core-image-minimal: A small image just capable of allowing a device to boot
> 
>        core-image-full-cmdline: A small image with more Linux functionality
>                                 installed, including a ssh server.
> 
> Note that the core targets will not set the default phosphor password.
> 
> 
>      Stefan
> 
> 
> 
>>
>> Thanks,
>> Sandeep.
>>
>> -----Original Message-----
>> From: Stefan Berger <stefanb@linux.ibm.com>
>> Sent: Tuesday, May 23, 2023 8:06 PM
>> To: Sandeep Kumar <sandeep.pkumar@tcs.com>; Cédric Le Goater
>> <clg@kaod.org>; openbmc@lists.ozlabs.org; Ninad Palsule
>> <ninad@linux.ibm.com>; Joel Stanley <jms@jms.id.au>; Andrew Jeffery
>> <andrew@aj.id.au>
>> Subject: Re: Integrating swtpm(as a software TPM) with OpenBMC on Qemu
>>
>> "External email. Open with Caution"
>>
>>
>>
>> On 5/23/23 01:59, Sandeep Kumar wrote:
>>
>>>
>>> TCS Confidential
>>
>> What is TCS Confidential ?
>>
>>>
>>>
>>> Hi Stefan,
>>>
>>> Thanks for the information. I am trying to make use of the commands by using tpm_init() inside image-fit.c file. It compiles but gives an undefined reference error as below.
>>>
>>
>> When I am running the OpenBMC image that I build with `bitbake obmc-phosphor-image` I already have uboot with TPM 2 support built-in. I am not sure how you are getting this error.
>>
>>        Stefan
>>
>>>      gcc
>>> -isystem/home/tcs/work/san/openbmc/openbmc_april/openbmc/build/evb-as
>>> t
>>> 2600/tmp/work/evb_ast2600-openbmc-linux-gnueabi/u-boot-aspeed-sdk/1_v
>>> 2 019.04+gitAUTOINC+fd915728e1-r0/recipe-sysroot-native/usr/include
>>> -O2 -pipe
>>> -L/home/tcs/work/san/openbmc/openbmc_april/openbmc/build/evb-ast2600/
>>> t
>>> mp/work/evb_ast2600-openbmc-linux-gnueabi/u-boot-aspeed-sdk/1_v2019.0
>>> 4
>>> +gitAUTOINC+fd915728e1-r0/recipe-sysroot-native/usr/lib
>>> -L/home/tcs/work/san/openbmc/openbmc_april/openbmc/build/evb-ast2600/
>>> t
>>> mp/work/evb_ast2600-openbmc-linux-gnueabi/u-boot-aspeed-sdk/1_v2019.0
>>> 4
>>> +gitAUTOINC+fd915728e1-r0/recipe-sysroot-native/lib
>>> -Wl,--enable-new-dtags
>>> -Wl,-rpath-link,/home/tcs/work/san/openbmc/openbmc_april/openbmc/buil
>>> d
>>> /evb-ast2600/tmp/work/evb_ast2600-openbmc-linux-gnueabi/u-boot-aspeed
>>> -
>>> sdk/1_v2019.04+gitAUTOINC+fd915728e1-r0/recipe-sysroot-native/usr/lib
>>>
>>> -Wl,-rpath-link,/home/tcs/work/san/openbmc/openbmc_april/openbmc/buil
>>> d
>>> /evb-ast2600/tmp/work/evb_ast2600-openbmc-linux-gnueabi/u-boot-aspeed
>>> - sdk/1_v2019.04+gitAUTOINC+fd915728e1-r0/recipe-sysroot-native/lib
>>> -Wl,-rpath,/home/tcs/work/san/openbmc/openbmc_april/openbmc/build/evb
>>> -
>>> ast2600/tmp/work/evb_ast2600-openbmc-linux-gnueabi/u-boot-aspeed-sdk/
>>> 1 _v2019.04+gitAUTOINC+fd915728e1-r0/recipe-sysroot-native/usr/lib
>>> -Wl,-rpath,/home/tcs/work/san/openbmc/openbmc_april/openbmc/build/evb
>>> -
>>> ast2600/tmp/work/evb_ast2600-openbmc-linux-gnueabi/u-boot-aspeed-sdk/
>>> 1 _v2019.04+gitAUTOINC+fd915728e1-r0/recipe-sysroot-native/lib
>>> -Wl,-O1  -o tools/fit_check_sign tools/aisimage.o tools/atmelimage.o
>>> tools/common/image-sig.o tools/common/bootm.o tools/lib/crc32.o
>>> tools/default_image.o tools/lib/fdtdec_common.o tools/lib/fdtdec.o
>>> tools/fit_common.o tools/fit_image.o tools/common/image-fit.o
>>> tools/image-host.o tools/common/image.o tools/imagetool.o
>>> tools/imximage.o tools/imx8image.o tools/imx8mimage.o
>>> tools/kwbimage.o tools/lib/md5.o tools/lpc32xximage.o
>>> tools/mxsimage.o tools/omapimage.o tools/os_support.o
>>> tools/pblimage.o tools/pbl_crc32.o tools/vybridimage.o
>>> tools/stm32image.o tools/lib/rc4.o tools/rkcommon.o tools/rkimage.o
>>> tools/rksd.o tools/rkspi.o tools/socfpgaimage.o tools/lib/crc16.o
>>> tools/lib/sha1.o tools/lib/sha256.o tools/lib/sha512.o
>>> tools/common/hash.o tools/ublimage.o tools/zynqimage.o
>>> tools/zynqmpimage.o tools/zynqmpbif.o tools/libfdt/fdt.o
>>> tools/libfdt/fdt_wip.o tools/libfdt/fdt_sw.o tools/libfdt/fdt_rw.o
>>> tools/libfdt/fdt_strerror.o tools/libfdt/fdt_empty_tree.o
>>> tools/libfdt/fdt_addresses.o tools/libfdt/fdt_overlay.o
>>> tools/lib/libfdt/fdt_ro.o tools/lib/libfdt/fdt_region.o
>>> tools/gpimage.o tools/gpimage-common.o tools/mtk_image.o
>>> tools/lib/rsa/rsa-sign.o tools/lib/rsa/rsa-verify.o
>>> tools/lib/rsa/rsa-checksum.o tools/lib/rsa/rsa-mod-exp.o
>>> tools/fit_check_sign.o  -lssl -lcrypto
>>>
>>> /home/tcs/work/san/openbmc/openbmc_april/openbmc/build/evb-ast2600/tmp/hosttools/ld: tools/common/image-fit.o: in function `boot_get_setup_fit':
>>>
>>> image-fit.c:(.text+0x27e1): undefined reference to `get_tpm'
>>>
>>> /home/tcs/work/san/openbmc/openbmc_april/openbmc/build/evb-ast2600/tmp/hosttools/ld: image-fit.c:(.text+0x280e): undefined reference to `tpm_init'
>>>
>>> collect2: error: ld returned 1 exit status
>>>
>>> make[2]: *** [scripts/Makefile.host:106: tools/dumpimage] Error 1
>>>
>>> Although the tpm_init() is present in tpm-common.c  and image-fit.c is present in the same module as well. But still I get the above error. I have tried including the DEPENDS on libtpm in the u-boot recipe but nothing seems to work. Any specific library/specific location to be included for TPM support?
>>>
>>> -----Original Message-----
>>> From: Stefan Berger <stefanb@linux.ibm.com>
>>> Sent: Thursday, May 18, 2023 5:10 PM
>>> To: Sandeep Kumar <sandeep.pkumar@tcs.com>; Cédric Le Goater
>>> <clg@kaod.org>; openbmc@lists.ozlabs.org; Ninad Palsule
>>> <ninad@linux.ibm.com>; Joel Stanley <jms@jms.id.au>; Andrew Jeffery
>>> <andrew@aj.id.au>
>>> Subject: Re: Integrating swtpm(as a software TPM) with OpenBMC on
>>> Qemu
>>>
>>> "External email. Open with Caution"
>>>
>>> On 5/17/23 13:13, Sandeep Kumar wrote:
>>>
>>>    >   TCS Confidential
>>>
>>>    >
>>>
>>>    > Hi Stefan,
>>>
>>>    >
>>>
>>>    > Thanks for providing the information. I am able to make use of it. But is it possible to make use of this stack at the bootloader(inside u-boot) level ?
>>>
>>>    >
>>>
>>> There are quite a few commands in u-boot:
>>>
>>> ast# tpm2
>>>
>>> tpm2 - Issue a TPMv2.x command
>>>
>>> Usage:
>>>
>>> tpm2 <command> [<arguments>]
>>>
>>> device [num device]
>>>
>>>         Show all devices or set the specified device info
>>>
>>>         Show information about the TPM.
>>>
>>> state
>>>
>>>         Show internal state from the TPM (if available) init
>>>
>>>         Initialize the software stack. Always the first command to issue.
>>>
>>> startup <mode>
>>>
>>>         Issue a TPM2_Startup command.
>>>
>>>         <mode> is one of:
>>>
>>>             * TPM2_SU_CLEAR (reset state)
>>>
>>>             * TPM2_SU_STATE (preserved state) self_test <type>
>>>
>>>         Test the TPM capabilities.
>>>
>>>         <type> is one of:
>>>
>>>             * full (perform all tests)
>>>
>>>             * continue (only check untested tests) clear <hierarchy>
>>>
>>>         Issue a TPM2_Clear command.
>>>
>>>         <hierarchy> is one of:
>>>
>>>             * TPM2_RH_LOCKOUT
>>>
>>>             * TPM2_RH_PLATFORM
>>>
>>> pcr_extend <pcr> <digest_addr>
>>>
>>>         Extend PCR #<pcr> with digest at <digest_addr>.
>>>
>>>         <pcr>: index of the PCR
>>>
>>>         <digest_addr>: address of a 32-byte SHA256 digest pcr_read
>>> <pcr> <digest_addr>
>>>
>>>         Read PCR #<pcr> to memory address <digest_addr>.
>>>
>>>        <pcr>: index of the PCR
>>>
>>>         <digest_addr>: address to store the a 32-byte SHA256 digest
>>> get_capability <capability> <property> <addr> <count>
>>>
>>>         Read and display <count> entries indexed by <capability>/<property>.
>>>
>>>         Values are 4 bytes long and are written at <addr>.
>>>
>>>         <capability>: capability
>>>
>>>         <property>: property
>>>
>>>         <addr>: address to store <count> entries of 4 bytes
>>>
>>>         <count>: number of entries to retrieve dam_reset [<password>]
>>>
>>>         If the TPM is not in a LOCKOUT state, reset the internal error counter.
>>>
>>>         <password>: optional password
>>>
>>> dam_parameters <max_tries> <recovery_time> <lockout_recovery>
>>> [<password>]
>>>
>>>         If the TPM is not in a LOCKOUT state, set the DAM parameters
>>>
>>>         <maxTries>: maximum number of failures before lockout,
>>>
>>>                     0 means always locking
>>>
>>>         <recoveryTime>: time before decrement of the error counter,
>>>
>>>                         0 means no lockout
>>>
>>>         <lockoutRecovery>: time of a lockout (before the next try),
>>>
>>>                            0 means a reboot is needed
>>>
>>>         <password>: optional password of the LOCKOUT hierarchy
>>> change_auth <hierarchy> <new_pw> [<old_pw>]
>>>
>>>         <hierarchy>: the hierarchy
>>>
>>>         <new_pw>: new password for <hierarchy>
>>>
>>>         <old_pw>: optional previous password of <hierarchy>
>>> pcr_setauthpolicy|pcr_setauthvalue <pcr> <key> [<password>]
>>>
>>>         Change the <key> to access PCR #<pcr>.
>>>
>>>         hierarchy and may be empty.
>>>
>>>         /!\WARNING: untested function, use at your own risks !
>>>
>>>         <pcr>: index of the PCR
>>>
>>>         <key>: secret to protect the access of PCR #<pcr>
>>>
>>>         <password>: optional password of the PLATFORM hierarchy
>>>
>>> Regards,
>>>
>>>        Stefan
>>>
>>>    > Thanks,
>>>
>>>    > Sandeep.
>>>
>>>    >
>>>
>>>    > -----Original Message-----
>>>
>>>    > From: Stefan Berger <stefanb@linux.ibm.com
>>> <mailto:stefanb@linux.ibm.com>>
>>>
>>>    > Sent: Tuesday, May 9, 2023 10:01 PM
>>>
>>>    > To: Sandeep Kumar <sandeep.pkumar@tcs.com
>>> <mailto:sandeep.pkumar@tcs.com>>; Cédric Le Goater
>>>
>>>    > <clg@kaod.org <mailto:clg@kaod.org>>; openbmc@lists.ozlabs.org
>>> <mailto:openbmc@lists.ozlabs.org>; Ninad Palsule
>>>
>>>    > <ninad@linux.ibm.com <mailto:ninad@linux.ibm.com>>; Joel Stanley
>>> <jms@jms.id.au <mailto:jms@jms.id.au>>; Andrew Jeffery
>>>
>>>    > <andrew@aj.id.au <mailto:andrew@aj.id.au>>
>>>
>>>    > Subject: Re: Integrating swtpm(as a software TPM) with OpenBMC on
>>> Qemu
>>>
>>>    >
>>>
>>>    > "External email. Open with Caution"
>>>
>>>    >
>>>
>>>    >
>>>
>>>    > On 5/9/23 08:06, Sandeep Kumar wrote:
>>>
>>>    >>    TCS Confidential
>>>
>>>    >>
>>>
>>>    >> Hi Stefan,
>>>
>>>    >>
>>>
>>>    >> Thanks for the help.
>>>
>>>    >>
>>>
>>>    >> 'MACHINE_FEATURES:append = " tpm2" => this worked for me as well.  Could you please also point to the API's which can be used for communicating with swtpm? Any sample code which can be used for reading and writing data to and from the block device ?
>>>
>>>    >
>>>
>>>    > TPM 2 has character devices /dev/tpm0 and /dev/tpmrm0 that can for example be used with either one of the tss2 stacks:
>>>
>>>    >
>>>
>>>    > meta-security/meta-tpm/recipes-tpm2/ibmtpm2tss
>>>
>>>    > meta-security/meta-tpm/recipes-tpm2/ibmtpm2tss/ibmtpm2tss
>>>
>>>    >
>>> meta-security/meta-tpm/recipes-tpm2/ibmtpm2tss/ibmtpm2tss/0001-utils-
>>> 1
>>>
>>>    > 2-Makefile.am-expand-wildcards-in-prereqs.patch
>>>
>>>    > meta-security/meta-tpm/recipes-tpm2/ibmtpm2tss/ibmtpm2tss_1661.bb
>>>
>>>    > meta-security/meta-tpm/recipes-tpm2/tpm2-tss-engine
>>>
>>>    > meta-security/meta-tpm/recipes-tpm2/tpm2-tss-engine/tpm2-tss-engine_1.
>>>
>>>    > 1.0.bb meta-security/meta-tpm/recipes-tpm2/tpm2-tss
>>>
>>>    > meta-security/meta-tpm/recipes-tpm2/tpm2-tss/tpm2-tss
>>>
>>>    > meta-security/meta-tpm/recipes-tpm2/tpm2-tss/tpm2-tss/fixup_hosttools.
>>>
>>>    > patch
>>> meta-security/meta-tpm/recipes-tpm2/tpm2-tss/tpm2-tss_4.0.1.bb
>>>
>>>    >
>>>
>>>    > Intel: https://github.com/tpm2-software/tpm2-tss#overview
>>> <https://github.com/tpm2-software/tpm2-tss#overview>
>>>
>>>    > IBM: https://github.com/kgoldman/ibmtss
>>> <https://github.com/kgoldman/ibmtss>
>>>
>>>    >
>>>
>>>    >      Stefan
>>>
>>>    >
>>>
>>>    >>
>>>
>>>    >> Thanks,
>>>
>>>    >> Sandeep.
>>>
>>>    >>
>>>
>>>    >> -----Original Message-----
>>>
>>>    >> From: Stefan Berger <stefanb@linux.ibm.com
>>> <mailto:stefanb@linux.ibm.com>>
>>>
>>>    >> Sent: Saturday, May 6, 2023 2:08 AM
>>>
>>>    >> To: Sandeep Kumar <sandeep.pkumar@tcs.com
>>> <mailto:sandeep.pkumar@tcs.com>>; Cédric Le Goater
>>>
>>>    >> <clg@kaod.org <mailto:clg@kaod.org>>; openbmc@lists.ozlabs.org
>>> <mailto:openbmc@lists.ozlabs.org>; Ninad Palsule
>>>
>>>    >> <ninad@linux.ibm.com <mailto:ninad@linux.ibm.com>>; Joel Stanley
>>> <jms@jms.id.au <mailto:jms@jms.id.au>>; Andrew Jeffery
>>>
>>>    >> <andrew@aj.id.au <mailto:andrew@aj.id.au>>
>>>
>>>    >> Subject: Re: Integrating swtpm(as a software TPM) with OpenBMC
>>> on
>>>
>>>    >> Qemu
>>>
>>>    >>
>>>
>>>    >> "External email. Open with Caution"
>>>
>>>    >>
>>>
>>>    >>
>>>
>>>    >> On 5/5/23 13:36, Sandeep Kumar wrote:
>>>
>>>    >>>     TCS Confidential
>>>
>>>    >>>
>>>
>>>    >>> Hi Stefan,
>>>
>>>    >>>
>>>
>>>    >>> I have these options set in
>>>
>>>    >>>
>>> /home/tcs/work/san/openbmc/openbmc_april/openbmc/meta-aspeed/recipes
>>>
>>>    >>> - k ernel/linux/linux-aspeed/tpm/tpm2.cfg
>>>
>>>    >>>
>>>
>>>    >>> CONFIG_HW_RANDOM=y
>>>
>>>    >>> CONFIG_HW_RANDOM_TPM=y
>>>
>>>    >>> CONFIG_TCG_TPM=y
>>>
>>>    >>> CONFIG_TCG_TIS_CORE=y
>>>
>>>    >>> CONFIG_TCG_TIS=y
>>>
>>>    >>> CONFIG_TCG_TIS_SPI=y
>>>
>>>    >>> CONFIG_TCG_TIS_I2C=y
>>>
>>>    >>> CONFIG_SECURITYFS=y
>>>
>>>    >>
>>>
>>>    >>
>>>
>>>    >> I added 'MACHINE_FEATURES:append = " tpm2"' and this works for me.
>>>
>>>    >>
>>>
>>>    >> As long as these symbols are built into the kernel it should work:
>>>
>>>    >>
>>>
>>>    >>> root@evb-ast2600:~# grep tpm_tis_i2c /proc/kallsyms 8056318c t
>>>
>>>    >>> tpm_tis_i2c_remove
>>>
>>>    >>> 805631b0 t tpm_tis_i2c_retry_transfer_until_ack
>>>
>>>    >>> 8056323c t tpm_tis_i2c_write_bytes
>>>
>>>    >>> 80563334 t tpm_tis_i2c_verify_crc
>>>
>>>    >>> 805633e0 t tpm_tis_i2c_read_bytes
>>>
>>>    >>> 80563604 t tpm_tis_i2c_probe
>>>
>>>    >>> 80d23964 t tpm_tis_i2c_driver_init
>>>
>>>    >>
>>>
>>>    >>>
>>>
>>>    >>> and in
>>>
>>>    >>>
>>> /home/tcs/work/san/openbmc/openbmc_april/openbmc/meta-aspeed/recipes
>>>
>>>    >>> - k ernel/linux/linux-aspeed.inc I have these,
>>>
>>>    >>>
>>>
>>>    >>> SRC_URI += " \
>>>
>>>    >>> file://defconfig <file://defconfig> \
>>>
>>>    >>>
>>> file://rsa_oem_fitimage_key.key;sha256sum=eeb4ff2ebbfbd97b6254fe6dbae
>>> e
>>> a41067e54c65176c233ec7b2ab2decf1ddcd
>>> <file://rsa_oem_fitimage_key.key;sha256sum=eeb4ff2ebbfbd97b6254fe6dba
>>> e
>>> ea41067e54c65176c233ec7b2ab2decf1ddcd> \
>>>
>>>    >>>
>>> file://rsa_oem_fitimage_key.crt;sha256sum=45f5a55497cce8040999bf9f321
>>> 4
>>> d471ac7b83ab7acef41c4425a34662e8372e
>>> <file://rsa_oem_fitimage_key.crt;sha256sum=45f5a55497cce8040999bf9f32
>>> 1
>>> 4d471ac7b83ab7acef41c4425a34662e8372e> \
>>>
>>>    >>> ${@bb.utils.contains('MACHINE_FEATURES
>>> <mailto:$%7b@bb.utils.contains('MACHINE_FEATURES>', 'tpm2',
>>> 'file://tpm/tpm2.scc file://tpm/tpm2.cfg <file://tpm/tpm2.cfg>', '',
>>> d)} \
>>>
>>>    >>> ${@bb.utils.contains_any('DISTRO_FEATURES
>>> <mailto:$%7b@bb.utils.contains_any('DISTRO_FEATURES>', \
>>>
>>>    >>>                    'obmc-static-norootfs obmc-ubi-fs', \
>>>
>>>    >>>                    'file://ubi/ubi.scc file://ubi/ubi.cfg
>>> <file://ubi/ubi.cfg>', '', d)} \
>>>
>>>    >>>               "
>>>
>>>    >>>
>>>
>>>    >>> Anything else needs to be done to enable TPM ?
>>>
>>>    >>
>>>
>>>    >> Apart from having to use the latest QEMU with the TPM TIS I2C support (from git repo) I don't know of anything else.
>>>
>>>    >>
>>>
>>>    >>       Stefan
>>>
>>>    >>
>>>
>>>    >>>
>>>
>>>    >>> Thanks,
>>>
>>>    >>> Sandeep.
>>>
>>>    >>>
>>>
>>>    >>> -----Original Message-----
>>>
>>>    >>> From: Stefan Berger <stefanb@linux.ibm.com
>>> <mailto:stefanb@linux.ibm.com>>
>>>
>>>    >>> Sent: Friday, May 5, 2023 9:41 PM
>>>
>>>    >>> To: Sandeep Kumar <sandeep.pkumar@tcs.com
>>> <mailto:sandeep.pkumar@tcs.com>>; Cédric Le Goater
>>>
>>>    >>> <clg@kaod.org <mailto:clg@kaod.org>>; openbmc@lists.ozlabs.org
>>> <mailto:openbmc@lists.ozlabs.org>; Ninad Palsule
>>>
>>>    >>> <ninad@linux.ibm.com <mailto:ninad@linux.ibm.com>>; Joel
>>> Stanley <jms@jms.id.au <mailto:jms@jms.id.au>>; Andrew Jeffery
>>>
>>>    >>> <andrew@aj.id.au <mailto:andrew@aj.id.au>>
>>>
>>>    >>> Subject: Re: Integrating swtpm(as a software TPM) with OpenBMC
>>> on
>>>
>>>    >>> Qemu
>>>
>>>    >>>
>>>
>>>    >>> "External email. Open with Caution"
>>>
>>>    >>>
>>>
>>>    >>> I enable the following kernel build options for OpenBMC Linux kernel:
>>>
>>>    >>>
>>>
>>>    >>> CONFIG_TCG_TPM=y
>>>
>>>    >>> CONFIG_TCG_TIS_CORE=y
>>>
>>>    >>> CONFIG_TCG_TIS=y
>>>
>>>    >>> CONFIG_TCG_TIS_I2C=y
>>>
>>>    >>>
>>>
>>>    >>> With swtpm running in another terminal:
>>>
>>>    >>>
>>>
>>>    >>> while :; do swtpm socket --tpmstate dir=/tmp/mytpm1     --ctrl
>>> type=unixio,path=/tmp/mytpm1/swtpm-sock     --tpm2     --log level=20;
>>> done
>>>
>>>    >>>
>>>
>>>    >>> I start qemu built from qemu git master branch tip:
>>>
>>>    >>>
>>>
>>>    >>> /tmp/qemu-system-arm -machine ast2600-evb -nographic -no-reboot
>>> -net nic -net
>>> user,hostfwd=:127.0.0.1:5722-:22,hostfwd=:127.0.0.1:5743-:443,hostfwd
>>> =
>>> udp:127.0.0.1:5723-:623 -drive
>>> file=./tmp/deploy/images/evb-ast2600/obmc-phosphor-image-evb-ast2600.
>>> s
>>> tatic.mtd,format=raw,if=mtd -chardev
>>> socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock     -tpmdev
>>> emulator,id=tpm0,chardev=chrtpm     -device
>>> tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.12,address=0x2e
>>>
>>>    >>>
>>>
>>>    >>> root@evb-ast2600:~# echo tpm_tis_i2c 0x2e >
>>> /sys/bus/i2c/devices/i2c-12/new_device
>>>
>>>    >>> [   63.771200] tpm_tis_i2c 12-002e: 2.0 TPM (device-id 0x1,
>>> rev-id 1)
>>>
>>>    >>> [   63.783927] tpm tpm0: A TPM error (256) occurred attempting
>>> the self test
>>>
>>>    >>> [   63.784256] tpm tpm0: starting up the TPM manually
>>>
>>>    >>> [   63.851474] i2c i2c-12: new_device: Instantiated device
>>> tpm_tis_i2c at 0x2e
>>>
>>>    >>>
>>>
>>>    >>> root@evb-ast2600:~# uname -a
>>>
>>>    >>> Linux evb-ast2600
>>> 6.1.15-580639a-dirty-c56bfb7-00123-gc56bfb70ebfa
>>>
>>>    >>> #1 SMP Thu Apr  6 00:55:09 UTC 2023 armv7l GNU/Linux
>>>
>>>    >>>
>>>
>>>    >>> root@evb-ast2600:~# grep tpm_tis_i2c /proc/kallsyms> 8056318c t
>>>
>>>    >>> tpm_tis_i2c_remove
>>>
>>>    >>> 805631b0 t tpm_tis_i2c_retry_transfer_until_ack
>>>
>>>    >>> 8056323c t tpm_tis_i2c_write_bytes
>>>
>>>    >>> 80563334 t tpm_tis_i2c_verify_crc
>>>
>>>    >>> 805633e0 t tpm_tis_i2c_read_bytes
>>>
>>>    >>> 80563604 t tpm_tis_i2c_probe
>>>
>>>    >>> 80d23964 t tpm_tis_i2c_driver_init
>>>
>>>    >>>
>>>
>>>    >>> root@evb-ast2600:~# find /sys/class/tpm /sys/class/tpm
>>>
>>>    >>> /sys/class/tpm/tpm0
>>>
>>>    >>>
>>>
>>>    >>> root@evb-ast2600:~# ls -l /dev/tpm*
>>>
>>>    >>> crw-------    1 root     root       10, 224 May  5 16:03
>>> /dev/tpm0
>>>
>>>    >>> crw-------    1 root     root      252, 65536 May  5 16:03
>>> /dev/tpmrm0
>>>
>>>    >>>
>>>
>>>    >>> root@evb-ast2600:~# find /sys/ | grep pcr
>>>
>>>    >>>
>>> /sys/devices/platform/ahb/ahb:apb/ahb:apb:bus@1e78a000/1e78a680.i2c-
>>>
>>>    >>> b
>>>
>>>    >>> u
>>>
>>>    >>> s/i2c-12/12-002e/tpm/tpm0/pcr-sha1
>>>
>>>    >>>
>>> /sys/devices/platform/ahb/ahb:apb/ahb:apb:bus@1e78a000/1e78a680.i2c-
>>>
>>>    >>> b
>>>
>>>    >>> u
>>>
>>>    >>> s/i2c-12/12-002e/tpm/tpm0/pcr-sha1/17
>>>
>>>    >>> [... lots more entries also for sha256, sha384, and sha512 ]
>>>
>>>    >>>
>>>
>>>    >>>
>>>
>>>    >>>
>>>
>>>    >>>
>>>
>>>    >>> It seems to work as expected
>>>
>>>    >>>
>>>
>>>    >>> On 5/5/23 11:08, Sandeep Kumar wrote:
>>>
>>>    >>>> TCS Confidential Hi Stefan, Please find below my answers inline.
>>>
>>>    >>>> Thanks, Sandeep. -----Original Message----- From: Stefan
>>> Berger
>>>
>>>    >>>> <stefanb@ linux. ibm. com> Sent: Friday, May 5, 2023 6: 56 PM To:
>>>
>>>    >>>> Sandeep Kumar <sandeep. pkumar@ tcs. com>; ZjQcmQRYFpfptBannerStart This Message Is From an External Sender This message came from outside your organization.
>>>
>>>    >>>> ZjQcmQRYFpfptBannerEnd
>>>
>>>    >>>>
>>>
>>>    >>>> TCS Confidential
>>>
>>>    >>>>
>>>
>>>    >>>>
>>>
>>>    >>>> Hi Stefan,
>>>
>>>    >>>>
>>>
>>>    >>>> Please find below my answers inline.
>>>
>>>    >>>>
>>>
>>>    >>>> Thanks,
>>>
>>>    >>>>
>>>
>>>    >>>> Sandeep.
>>>
>>>    >>>>
>>>
>>>    >>>> -----Original Message-----
>>>
>>>    >>>> From: Stefan Berger <stefanb@linux.ibm.com
>>> <mailto:stefanb@linux.ibm.com>>
>>>
>>>    >>>> Sent: Friday, May 5, 2023 6:56 PM
>>>
>>>    >>>> To: Sandeep Kumar <sandeep.pkumar@tcs.com
>>> <mailto:sandeep.pkumar@tcs.com>>; Cédric Le Goater
>>>
>>>    >>>> <clg@kaod.org <mailto:clg@kaod.org>>; openbmc@lists.ozlabs.org
>>> <mailto:openbmc@lists.ozlabs.org>; Ninad Palsule
>>>
>>>    >>>> <ninad@linux.ibm.com <mailto:ninad@linux.ibm.com>>; Joel
>>> Stanley <jms@jms.id.au <mailto:jms@jms.id.au>>; Andrew Jeffery
>>>
>>>    >>>> <andrew@aj.id.au <mailto:andrew@aj.id.au>>
>>>
>>>    >>>> Subject: Re: Integrating swtpm(as a software TPM) with OpenBMC
>>> on
>>>
>>>    >>>> Qemu
>>>
>>>    >>>>
>>>
>>>    >>>> "External email. Open with Caution"
>>>
>>>    >>>>
>>>
>>>    >>>> On 5/5/23 01:40, Sandeep Kumar wrote:
>>>
>>>    >>>>
>>>
>>>    >>>>     >   TCS Confidential
>>>
>>>    >>>>
>>>
>>>    >>>>     >
>>>
>>>    >>>>
>>>
>>>    >>>>     > Hi Stefan,
>>>
>>>    >>>>
>>>
>>>    >>>>     >
>>>
>>>    >>>>
>>>
>>>    >>>>     > Stefan: Is the kernel configured in the same way? Are you using the same kernel version?
>>>
>>>    >>>>
>>>
>>>    >>>>     > Ans:
>>>
>>>    >>>>
>>>
>>>    >>>>     >          I am using the Kernel version coming with the latest openBMC without any changes.
>>>
>>>    >>>>
>>>
>>>    >>>>     >          Kernel version used : Linux evb-ast2600
>>> 6.1.15-580639a #1
>>>
>>>    >>>> SMP
>>>
>>>    >>>>
>>>
>>>    >>>>     > Thu Apr 6 00:55:09 UTC 2023 armv71 GNU/Linux
>>>
>>>    >>>>
>>>
>>>    >>>>     >
>>>
>>>    >>>>
>>>
>>>    >>>>     > Stefan:  What is the output of this?  find /sys/class/tpm
>>> |
>>>
>>>    >>>> grep pcr
>>>
>>>    >>>>
>>>
>>>    >>>>     > Ams:     find: /sys/class/tpm: No such file or directory.
>>>
>>>    >>>>
>>>
>>>    >>>>     >
>>>
>>>    >>>>
>>>
>>>    >>>>     > Could you please point to the right version of kernel which has all these changes ?
>>>
>>>    >>>>
>>>
>>>    >>>> I am not aware of changes in the Linux kernel for TPM I2C and why it would not work in this kernel version.
>>>
>>>    >>>>
>>>
>>>    >>>> Does this show any files?
>>>
>>>    >>>>
>>>
>>>    >>>> find /sys | grep pcr
>>>
>>>    >>>>
>>>
>>>    >>>> *Sandeep: It doesn't show any files. *
>>>
>>>    >>>>
>>>
>>>    >>>> *root@evb-ast2600:~# echo tpm_tis_i2c 0x2e >
>>>
>>>    >>>> /sys/bus/i2c/devices/i2c-12/new_device*
>>>
>>>    >>>>
>>>
>>>    >>>> *[  273.273089] i2c i2c-12: new_device: Instantiated device
>>>
>>>    >>>> tpm_tis_i2c at 0x2e*
>>>
>>>    >>>>
>>>
>>>    >>>> *root@evb-ast2600:~#*
>>>
>>>    >>>>
>>>
>>>    >>>> *root@evb-ast2600:~# find /sys | grep pcr*
>>>
>>>    >>>>
>>>
>>>    >>>> *root@evb-ast2600:~#*
>>>
>>>    >>>>
>>>
>>>    >>>> Do /dev/tpm0 and /dev/tpmrm0 appear after the echo ? What does dmesg show related to tpm (dmesg | grep -i tpm)?
>>>
>>>    >>>>
>>>
>>>    >>>> *Sandeep:  I don’t see /dev/tpm0 and /dev/tpmrm0 after the echo.
>>>
>>>    >>>> Output as below, *
>>>
>>>    >>>>
>>>
>>>    >>>> **
>>>
>>>    >>>>
>>>
>>>    >>>> *root@evb-ast2600:~# echo tpm_tis_i2c 0x2e >
>>>
>>>    >>>> /sys/bus/i2c/devices/i2c-12/new_device*
>>>
>>>    >>>>
>>>
>>>    >>>> *[  273.273089] i2c i2c-12: new_device: Instantiated device
>>>
>>>    >>>> tpm_tis_i2c at 0x2e*
>>>
>>>    >>>>
>>>
>>>    >>>> *root@evb-ast2600:~#*
>>>
>>>    >>>>
>>>
>>>    >>>> *root@evb-ast2600:~# find /sys | grep pcr*
>>>
>>>    >>>>
>>>
>>>    >>>> *root@evb-ast2600:~#*
>>>
>>>    >>>>
>>>
>>>    >>>> *root@evb-ast2600:~# ls /dev/tpm**
>>>
>>>    >>>>
>>>
>>>    >>>> *ls: /dev/tpm*: No such file or directory*
>>>
>>>    >>>>
>>>
>>>    >>>> *root@evb-ast2600:~# dmesg | grep -i tpm*
>>>
>>>    >>>>
>>>
>>>    >>>> *[    6.290898] systemd[1]: systemd 253.1^ running in system
>>> mode
>>>
>>>    >>>> (+PAM -AUDIT -SELINUX -APPARMOR -IMA -SMACK +SECCOMP -GCRYPT
>>>
>>>    >>>> -GNUTLS -OPENSSL -ACL +BLKID -CURL -ELFUTILS -FIDO2 -IDN2 -IDN
>>>
>>>    >>>> -IPTC -KMOD -LIBCRYPTSETUP +LIBFDISK -PCRE2 -PWQUALITY -P11KIT
>>>
>>>    >>>> -QRENCODE -TPM2
>>>
>>>    >>>> -BZIP2 -LZ4 -XZ -ZLIB +ZSTD -BPF_FRAMEWORK -XKBCOMMON -UTMP
>>>
>>>    >>>> -SYSVINIT
>>>
>>>    >>>> default-hierarchy=unified)*
>>>
>>>    >>>>
>>>
>>>    >>>> *[  273.273089] i2c i2c-12: new_device: Instantiated device
>>>
>>>    >>>> tpm_tis_i2c at 0x2e*
>>>
>>>    >>>>
>>>
>>>    >>>> *root@evb-ast2600:~#*
>>>
>>>    >>>>
>>>
>>>    >>>>         Stefan
>>>
>>>    >>>>
>>>
>>>    >>>>     >
>>>
>>>    >>>>
>>>
>>>    >>>>     >
>>>
>>>    >>>>
>>>
>>>    >>>>     > Thanks,
>>>
>>>    >>>>
>>>
>>>    >>>>     > Sandeep.
>>>
>>>    >>>>
>>>
>>>    >>>>     >
>>>
>>>    >>>>
>>>
>>>    >>>>     > -----Original Message-----
>>>
>>>    >>>>
>>>
>>>    >>>>     > From: Stefan Berger <stefanb@linux.ibm.com
>>>
>>>    >>>> <mailto:stefanb@linux.ibm.com <mailto:stefanb@linux.ibm.com>>>
>>>
>>>    >>>>
>>>
>>>    >>>>     > Sent: Thursday, May 4, 2023 7:30 PM
>>>
>>>    >>>>
>>>
>>>    >>>>     > To: Sandeep Kumar <sandeep.pkumar@tcs.com
>>>
>>>    >>>> <mailto:sandeep.pkumar@tcs.com
>>> <mailto:sandeep.pkumar@tcs.com>>>; Cédric Le Goater
>>>
>>>    >>>>
>>>
>>>    >>>>     > <clg@kaod.org <mailto:clg@kaod.org
>>> <mailto:clg@kaod.org%20%3cmailto:clg@kaod.org>>>;
>>>
>>>    >>>> openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>
>>> <mailto:openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>>;
>>> Ninad
>>>
>>>    >>>> Palsule
>>>
>>>    >>>>
>>>
>>>    >>>>     > <ninad@linux.ibm.com <mailto:ninad@linux.ibm.com
>>> <mailto:ninad@linux.ibm.com%20%3cmailto:ninad@linux.ibm.com>>>; Joel
>>>
>>>    >>>> Stanley <jms@jms.id.au <mailto:jms@jms.id.au
>>> <mailto:jms@jms.id.au%20%3cmailto:jms@jms.id.au>>>; Andrew Jeffery
>>>
>>>    >>>>
>>>
>>>    >>>>     > <andrew@aj.id.au <mailto:andrew@aj.id.au
>>> <mailto:andrew@aj.id.au%20%3cmailto:andrew@aj.id.au>>>
>>>
>>>    >>>>
>>>
>>>    >>>>     > Subject: Re: Integrating swtpm(as a software TPM) with
>>>
>>>    >>>> OpenBMC on Qemu
>>>
>>>    >>>>
>>>
>>>    >>>>     >
>>>
>>>    >>>>
>>>
>>>    >>>>     > "External email. Open with Caution"
>>>
>>>    >>>>
>>>
>>>    >>>>     >
>>>
>>>    >>>>
>>>
>>>    >>>>     >
>>>
>>>    >>>>
>>>
>>>    >>>>     > On 5/4/23 05:12, Sandeep Kumar wrote:
>>>
>>>    >>>>
>>>
>>>    >>>>     >> TCS Confidential Hi C, I was able to build and run the
>>>
>>>    >>>> image(for
>>>
>>>    >>>>
>>>
>>>    >>>>     >> evb-ast2600) with swtpm. Few issues observed, If I run
>>> with
>>>
>>>    >>>> the
>>>
>>>    >>>>
>>>
>>>    >>>>     >> flash. img provided in your github link(https: //github.
>>>
>>>    >>>>
>>>
>>>    >>>>     >> com/legoater/qemu-aspeed-boot/tree/master/images) everything ZjQcmQRYFpfptBannerStart This Message Is From an External Sender This message came from outside your organization.
>>>
>>>    >>>>
>>>
>>>    >>>>     >> ZjQcmQRYFpfptBannerEnd
>>>
>>>    >>>>
>>>
>>>    >>>>     >> TCS Confidential
>>>
>>>    >>>>
>>>
>>>    >>>>     >>
>>>
>>>    >>>>
>>>
>>>    >>>>     >> Hi C,
>>>
>>>    >>>>
>>>
>>>    >>>>     >> I was able to build and run the image(for evb-ast2600) with swtpm.
>>>
>>>    >>>>
>>>
>>>    >>>>     >> Few issues observed,
>>>
>>>    >>>>
>>>
>>>    >>>>     >>
>>>
>>>    >>>>
>>>
>>>    >>>>     >>   1. If I run with the flash.img provided in your github link(_https://github.com/legoater/qemu-aspeed-boot/tree/master/images_ <https://github.com/legoater/qemu-aspeed-boot/tree/master/images <https://github.com/legoater/qemu-aspeed-boot/tree/master/images <https://github.com/legoater/qemu-aspeed-boot/tree/master/images%20%3chttps:/github.com/legoater/qemu-aspeed-boot/tree/master/images>>>) everything works as expected, i.e I get the below output.
>>>
>>>    >>>>
>>>
>>>    >>>>     >>
>>>
>>>    >>>>
>>>
>>>    >>>>     >> *# echo tpm_tis_i2c 0x2e >
>>>
>>>    >>>> /sys/bus/i2c/devices/i2c-12/new_device*
>>>
>>>    >>>>
>>>
>>>    >>>>     >> *[  182.735902] tpm_tis_i2c 12-002e: 2.0 TPM (device-id
>>> 0x1,
>>>
>>>    >>>> rev-id
>>>
>>>    >>>>
>>>
>>>    >>>>     >> 1)* *[  182.773885] i2c i2c-12: new_device: Instantiated
>>>
>>>    >>>> device
>>>
>>>    >>>>
>>>
>>>    >>>>     >> tpm_tis_i2c at 0x2e*
>>>
>>>    >>>>
>>>
>>>    >>>>     >> *#*
>>>
>>>    >>>>
>>>
>>>    >>>>     >> *#*
>>>
>>>    >>>>
>>>
>>>    >>>>     >> *# cat /sys/class/tpm/tpm0/pcr-sha256/0*
>>>
>>>    >>>>
>>>
>>>    >>>>     >>
>>>
>>>    >>>>
>>> *B804724EA13F52A9072BA87FE8FDCC497DFC9DF9AA15B9088694639C431688E0*
>>>
>>>    >>>>
>>>
>>>    >>>>     >> *#*
>>>
>>>    >>>>
>>>
>>>    >>>>     >> *#*
>>>
>>>    >>>>
>>>
>>>    >>>>     >>
>>>
>>>    >>>>
>>>
>>>    >>>>     >>   2. If I run it with the locally built image, I get this
>>> error,
>>>
>>>    >>>>
>>>
>>>    >>>>     >
>>>
>>>    >>>>
>>>
>>>    >>>>     > Is the kernel configured in the same way? Are you using the same kernel version?
>>>
>>>    >>>>
>>>
>>>    >>>>     >>
>>>
>>>    >>>>
>>>
>>>    >>>>     >> *root@evb-ast2600:~# echo tpm_tis_i2c 0x2e >
>>>
>>>    >>>>
>>>
>>>    >>>>     >> /sys/bus/i2c/devices/i2c-12/new_device*
>>>
>>>    >>>>
>>>
>>>    >>>>     >> *[  174.063597] i2c i2c-12: new_device: Instantiated
>>> device
>>>
>>>    >>>>
>>>
>>>    >>>>     >> tpm_tis_i2c at 0x2e*
>>>
>>>    >>>>
>>>
>>>    >>>>     >
>>>
>>>    >>>>
>>>
>>>    >>>>     > What is the output of this?
>>>
>>>    >>>>
>>>
>>>    >>>>     >
>>>
>>>    >>>>
>>>
>>>    >>>>     > find /sys/class/tpm | grep pcr
>>>
>>>    >>>>
>>>
>>>    >>>>     >
>>>
>>>    >>>>
>>>
>>>    >>>>     >     Stefan
>>>
>>>    >>>>
>>>
>>>    >>>>     >
>>>
>>>    >>>>
>>>
>>>    >>>>     >> *root@evb-ast2600:~# cat
>>> /sys/class/tpm/tpm0/pcr-sha256/0*
>>>
>>>    >>>>
>>>
>>>    >>>>     >> *cat: can't open '/sys/class/tpm/tpm0/pcr-sha256/0': No
>>> such
>>>
>>>    >>>> file or
>>>
>>>    >>>>
>>>
>>>    >>>>     >> directory*
>>>
>>>    >>>>
>>>
>>>    >>>>     >> *root@evb-ast2600:~#*
>>>
>>>    >>>>
>>>
>>>    >>>>     >> *root@evb-ast2600:~#*
>>>
>>>    >>>>
>>>
>>>    >>>>     >> Please do let me know about what has been done to write
>>> the
>>>
>>>    >>>> values
>>>
>>>    >>>>
>>>
>>>    >>>>     >> into “*/sys/class/tpm/tpm0/pcr-sha256/0**” . * Thanks, Sandeep.
>>>
>>>    >>>>
>>>
>>>    >>>>     >> _____________________________________________
>>>
>>>    >>>>
>>>
>>>    >>>>     >> *From:* Sandeep Kumar
>>>
>>>    >>>>
>>>
>>>    >>>>     >> *Sent:* Thursday, April 20, 2023 5:45 PM
>>>
>>>    >>>>
>>>
>>>    >>>>     >> *To:* Cédric Le Goater <clg@kaod.org <mailto:clg@kaod.org
>>> <mailto:clg@kaod.org%20%3cmailto:clg@kaod.org>>>;
>>>
>>>    >>>> openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>
>>> <mailto:openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>>;
>>>
>>>    >>>>
>>>
>>>    >>>>     >> Ninad Palsule <ninad@linux.ibm.com
>>>
>>>    >>>> <mailto:ninad@linux.ibm.com <mailto:ninad@linux.ibm.com>>>;
>>> Joel Stanley <jms@jms.id.au
>>>
>>>    >>>> <mailto:jms@jms.id.au <mailto:jms@jms.id.au>>>;
>>>
>>>    >>>>
>>>
>>>    >>>>     >> Andrew Jeffery <andrew@aj.id.au <mailto:andrew@aj.id.au
>>> <mailto:andrew@aj.id.au%20%3cmailto:andrew@aj.id.au>>>
>>>
>>>    >>>>
>>>
>>>    >>>>     >> *Subject:* RE: Integrating swtpm(as a software TPM) with
>>>
>>>    >>>> OpenBMC on
>>>
>>>    >>>>
>>>
>>>    >>>>     >> Qemu Hi C, How to build this image =>
>>>
>>>    >>>>
>>>
>>>    >>>>     >> *obmc-phosphor-image.rootfs.wic.qcow2* ? In openBmc build directory we don  t get this image built.
>>>
>>>    >>>>
>>>
>>>    >>>>     >> Also, remaining image formats used while running on qemu are available in the build directory. i.e fitImage-linux.bin, aspeed-bmc-ibm-rainier.dtb and obmc-phosphor-initramfs.rootfs.cpio.xz .
>>>
>>>    >>>>
>>>
>>>    >>>>     >> Please advise if we have to build openbmc stack in a
>>>
>>>    >>>> different way
>>>
>>>    >>>>
>>>
>>>    >>>>     >> than the standard procedure. We follow the below steps for build, 1. .
>>>
>>>    >>>>
>>>
>>>    >>>>     >> setup Romulus 2. bitbake obmc-phosphor-image Thanks, Sandeep.
>>>
>>>    >>>>
>>>
>>>    >>>>     >> -----Original Message-----
>>>
>>>    >>>>
>>>
>>>    >>>>     >> From: Sandeep Kumar
>>>
>>>    >>>>
>>>
>>>    >>>>     >> Sent: Wednesday, April 19, 2023 3:00 PM
>>>
>>>    >>>>
>>>
>>>    >>>>     >> To: Cédric Le Goater <_clg@kaod.org_ <mailto:clg@kaod.org
>>>
>>>    >>>> <mailto:_clg@kaod.org_%20%3cmailto:clg@kaod.org
>>> <mailto:_clg@kaod.org_%20%3cmailto:clg@kaod.org>>>>;
>>>
>>>    >>>>
>>>
>>>    >>>>     >> _openbmc@lists.ozlabs.org_
>>> <mailto:_openbmc@lists.ozlabs.org_>
>>>
>>>    >>>> <mailto:_openbmc@lists.ozlabs.org_
>>> <mailto:_openbmc@lists.ozlabs.org_>>
>>>
>>>    >>>> <mailto:openbmc@lists.ozlabs.org
>>>
>>>    >>>> <mailto:openbmc@lists.ozlabs.org
>>> <mailto:openbmc@lists.ozlabs.org>>>;
>>>
>>>    >>>> Ninad
>>>
>>>    >>>>
>>>
>>>    >>>>     >> Palsule <_ninad@linux.ibm.com_
>>> <mailto:ninad@linux.ibm.com
>>>
>>>    >>>> <mailto:_ninad@linux.ibm.com_%20%3cmailto:ninad@linux.ibm.com
>>> <mailto:_ninad@linux.ibm.com_%20%3cmailto:ninad@linux.ibm.com>>>>;
>>>
>>>    >>>> Joel
>>>
>>>    >>>>
>>>
>>>    >>>>     >> Stanley <_jms@jms.id.au_ <mailto:jms@jms.id.au
>>>
>>>    >>>> <mailto:_jms@jms.id.au_%20%3cmailto:jms@jms.id.au
>>> <mailto:_jms@jms.id.au_%20%3cmailto:jms@jms.id.au>>>>; Andrew
>>>
>>>    >>>> Jeffery
>>>
>>>    >>>>
>>>
>>>    >>>>     >> <_andrew@aj.id.au_ <mailto:andrew@aj.id.au
>>>
>>>    >>>> <mailto:_andrew@aj.id.au_%20%3cmailto:andrew@aj.id.au
>>> <mailto:_andrew@aj.id.au_%20%3cmailto:andrew@aj.id.au>>>>
>>>
>>>    >>>>
>>>
>>>    >>>>     >> Subject: RE: Integrating swtpm(as a software TPM) with
>>>
>>>    >>>> OpenBMC on
>>>
>>>    >>>>
>>>
>>>    >>>>     >> Qemu Hi C, Got it working. Looks like slirp is no longer
>>>
>>>    >>>> supported on
>>>
>>>    >>>>
>>>
>>>    >>>>     >> ubnutu 18.04. have upgraded to a newer version  and is working now.
>>>
>>>    >>>>
>>>
>>>    >>>>     >> Thanks,
>>>
>>>    >>>>
>>>
>>>    >>>>     >> Sandeep.
>>>
>>>    >>>>
>>>
>>>    >>>>     >> -----Original Message-----
>>>
>>>    >>>>
>>>
>>>    >>>>     >> From: Cédric Le Goater <clg@kaod.org <mailto:clg@kaod.org
>>>
>>>    >>>> <mailto:clg@kaod.org%20%3cmailto:clg@kaod.org
>>> <mailto:clg@kaod.org%20%3cmailto:clg@kaod.org>>>>
>>>
>>>    >>>>
>>>
>>>    >>>>     >> Sent: Wednesday, April 19, 2023 2:26 PM
>>>
>>>    >>>>
>>>
>>>    >>>>     >> To: Sandeep Kumar <sandeep.pkumar@tcs.com
>>>
>>>    >>>>
>>>
>>>    >>>>     >> <mailto:sandeep.pkumar@tcs.com
>>>
>>>    >>>> <mailto:sandeep.pkumar@tcs.com
>>> <mailto:sandeep.pkumar@tcs.com>>>>;
>>>
>>>    >>>> openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>
>>> <mailto:openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>>
>>>
>>>    >>>>
>>>
>>>    >>>>     >> <mailto:openbmc@lists.ozlabs.org
>>>
>>>    >>>> <mailto:openbmc@lists.ozlabs.org
>>> <mailto:openbmc@lists.ozlabs.org>>>; Ninad Palsule
>>>
>>>    >>>> <ninad@linux.ibm.com
>>>
>>>    >>>>
>>>
>>>    >>>>     >> <mailto:ninad@linux.ibm.com <mailto:ninad@linux.ibm.com
>>> <mailto:ninad@linux.ibm.com%20%3cmailto:ninad@linux.ibm.com>>>>;
>>>
>>>    >>>> Joel Stanley <jms@jms.id.au
>>>
>>>    >>>>
>>>
>>>    >>>>     >> <mailto:jms@jms.id.au <mailto:jms@jms.id.au
>>> <mailto:jms@jms.id.au%20%3cmailto:jms@jms.id.au>>>>; Andrew
>>>
>>>    >>>> Jeffery <andrew@aj.id.au
>>>
>>>    >>>>
>>>
>>>    >>>>     >> <mailto:andrew@aj.id.au <mailto:andrew@aj.id.au
>>> <mailto:andrew@aj.id.au%20%3cmailto:andrew@aj.id.au>>>>
>>>
>>>    >>>>
>>>
>>>    >>>>     >> Subject: Re: Integrating swtpm(as a software TPM) with
>>>
>>>    >>>> OpenBMC on
>>>
>>>    >>>>
>>>
>>>    >>>>     >> Qemu "External email. Open with Caution"
>>>
>>>    >>>>
>>>
>>>    >>>>     >> Hello Sandeep
>>>
>>>    >>>>
>>>
>>>    >>>>     >> On 4/18/23 09:45, Sandeep Kumar wrote:
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> TCS Confidential
>>>
>>>    >>>>
>>>
>>>    >>>>     >>>
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> Hi C,
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> Built the qemu from your branch. Few issues, *$
>>>
>>>    >>>> ./qemu-system-arm -m
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> 256 -M romulus-bmc -nographic -drive
>>>
>>>    >>>>
>>>
>>>    >>>>     >>>
>>>
>>>    >>>>
>>> file=./obmc-phosphor-image-romulus.static.mtd,format=raw,if=mtd
>>>
>>>    >>>> -net
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> nic -net
>>>
>>>    >>>>
>>>
>>>    >>>>     >>>
>>>
>>>    >>>>
>>> user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:4443-:443,hostf
>>>
>>>    >>>> w
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> d
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> =
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> tcp:127.0.0.1:8880-:80,hostfwd=tcp:127.0.0.1:2200-:2200,hostfwd=udp:
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> 1
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> 2
>>>
>>>    >>>>
>>>
>>>    >>>>     >>>
>>>
>>>    >>>>
>>> 7.0.0.1:6623-:623,hostfwd=udp:127.0.0.1:6664-:664,hostname=qemu*
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> *qemu-system-arm: -net
>>>
>>>    >>>>
>>>
>>>    >>>>     >>>
>>>
>>>    >>>>
>>> user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:4443-:443,hostf
>>>
>>>    >>>> w
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> d
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> =
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> tcp:127.0.0.1:8880-:80,hostfwd=tcp:127.0.0.1:2200-:2200,hostfwd=udp:
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> 1
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> 2
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> 7.0.0.1:6623-:623,hostfwd=udp:127.0.0.1:6664-:664,hostname=qemu:
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> network backend 'user' is not compiled into this binary*
>>> I
>>>
>>>    >>>> didn’t
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> enable the slirp package I guess. So enabled it while
>>>
>>>    >>>> running
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> configure, *$ ../configure --enable-slirp*
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> *........*
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> *Run-time dependency slirp found: NO (tried pkgconfig)*
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> *../meson.build:681:2: ERROR: Dependency "slirp" not
>>> found,
>>>
>>>    >>>> tried
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> pkgconfig* *A full log can be found at
>>>
>>>    >>>>
>>>
>>>    >>>>     >>>
>>>
>>>    >>>>
>>> /home/tcs/work/sandeep/measured_boot/ibm_qemu/qemu/build/meson-logs
>>>
>>>    >>>> /
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> m
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> e
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> son-log.txt*
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> *NOTICE: You are using Python 3.6 which is EOL. Starting
>>>
>>>    >>>> with
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> v0.62.0, Meson will require Python 3.7 or newer*
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> *ERROR: meson setup failed*
>>>
>>>    >>>>
>>>
>>>    >>>>     >>> I have already installed slirp locally, but still getting the above error.
>>>
>>>    >>>>
>>>
>>>    >>>>     >> Did you install the libslirp-dev or libslirp-devel package ?
>>>
>>>    >>>>
>>>
>>>    >>>>     >> C.
>>>
>>>    >>>>
>>>
>>>    >>>>     >>
>>>
>>>    >>>>
>>>
>>>    >>>>     >> TCS Confidential
>>>
>>>    >>>>
>>>
>>>    >>>>     >>
>>>
>>>    >>>>
>>>
>>>    >>>>     >> =====-----=====-----=====
>>>
>>>    >>>>
>>>
>>>    >>>>     >> Notice: The information contained in this e-mail message
>>>
>>>    >>>> and/or
>>>
>>>    >>>>
>>>
>>>    >>>>     >> attachments to it may contain confidential or privileged information.
>>>
>>>    >>>>
>>>
>>>    >>>>     >> If you are not the intended recipient, any dissemination,
>>>
>>>    >>>> use,
>>>
>>>    >>>>
>>>
>>>    >>>>     >> review, distribution, printing or copying of the
>>> information
>>>
>>>    >>>>
>>>
>>>    >>>>     >> contained in this e-mail message and/or attachments to it
>>>
>>>    >>>> are
>>>
>>>    >>>>
>>>
>>>    >>>>     >> strictly prohibited. If you have received this
>>> communication
>>>
>>>    >>>> in
>>>
>>>    >>>>
>>>
>>>    >>>>     >> error, please notify us by reply e-mail or telephone and
>>>
>>>    >>>> immediately
>>>
>>>    >>>>
>>>
>>>    >>>>     >> and permanently delete the message and any attachments.
>>>
>>>    >>>> Thank you
>>>
>>>    >>>>
>>>
>>>    >>>>     >>
>>>
>>>    >>>>
>>>
>>>    >>>>     >
>>>
>>>    >>>>
>>>
>>>    >>>>     >   TCS Confidential
>>>
>>>    >>>>
>>>
>>>    >>>>
>>>
>>>    >>>> TCS Confidential
>>>
>>>    >>>>
>>>
>>>    >>>
>>>
>>>    >>>     TCS Confidential
>>>
>>>    >>
>>>
>>>    >>    TCS Confidential
>>>
>>>    >
>>>
>>>    >   TCS Confidential
>>>
>>>
>>> TCS Confidential
>>>
>>
>>    TCS Confidential
> 
>   TCS Confidential
