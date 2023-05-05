Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E252A6F8A4F
	for <lists+openbmc@lfdr.de>; Fri,  5 May 2023 22:44:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCjMp5V9Wz3fHv
	for <lists+openbmc@lfdr.de>; Sat,  6 May 2023 06:44:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AbGrZaeD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AbGrZaeD;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCjMB0plcz3cMj
	for <openbmc@lists.ozlabs.org>; Sat,  6 May 2023 06:43:33 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 345Kbn0D020192;
	Fri, 5 May 2023 20:43:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=unpJo7TA4gx0mGzATpj4umjONciZ1XYSEobjo/h69GM=;
 b=AbGrZaeDqgeZn2NVy29NxG6/IcStZtIU0Z00wJ+h/Jpv8EFABI99zJO/MCNOvkPNpwJs
 VX8YrNMKwaos0u2ECeuJdnnRkd9iVhdKqYfPJjZL8Clk6bC4WgcmHQB7mlAxlcdh49ZU
 ODScaRucD3Zq7WufQUHycGXYQbWPVbVWA83p+6Dkx3DD4f73KLHQ9RXDYHwhO0/pfSRa
 1+4cjQm/wyt2P2jq6utFtDYXUO1sNPaAD+9ZF/QYsyDmd8auw/yEsQaDBMNygCpyH9q3
 wBhpgyfxiapFigSmGFk7nQWVuKy6uOLkyKJ4XcTsIDPltE/w30N/jlHl3TZOPSievAW6 CA== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qd78vu052-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 May 2023 20:43:22 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 345H8PVw002605;
	Fri, 5 May 2023 20:38:20 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([9.208.130.100])
	by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3q8tv8rga2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 May 2023 20:38:20 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 345KcJv656951158
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 5 May 2023 20:38:20 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8803158077;
	Fri,  5 May 2023 20:38:19 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B145758071;
	Fri,  5 May 2023 20:38:18 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  5 May 2023 20:38:18 +0000 (GMT)
Message-ID: <71e0634f-e5b6-d804-7b55-7ae674f34342@linux.ibm.com>
Date: Fri, 5 May 2023 16:38:18 -0400
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
 <MA1PR01MB4129EB6FA57EA28AA9002E9C879B9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <2231ac88-3005-0fb4-6aad-e7652ffd3467@kaod.org>
 <MA1PR01MB41297891E40E6E5652661662879D9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <9c136acf-ea18-130b-41bb-5001b01ee8cf@kaod.org>
 <MA1PR01MB4129E3F1719B297B56DC148A87629@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <MA1PR01MB41294AC02644C3CB98E6F84187639@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <MA1PR01MB4129B241046BEB173A6CFA66876D9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <8abb1400-f7c4-f04a-8352-6c2583e23f0b@linux.ibm.com>
 <MA1PR01MB4129EE9FDCFF415DF8580CB987729@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <7fbe2c10-aa83-2640-0de0-b07ca0e5a13d@linux.ibm.com>
 <MA1PR01MB412975D2976523FD64289DB487729@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <b35b62e6-2195-627f-6939-381f40abdd43@linux.ibm.com>
 <MA1PR01MB41293CA1F337F47DDA58035D87729@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <MA1PR01MB41293CA1F337F47DDA58035D87729@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: q_m2waDEcEFE-vVyTmRnjJ3FYrNuZrRq
X-Proofpoint-ORIG-GUID: q_m2waDEcEFE-vVyTmRnjJ3FYrNuZrRq
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_27,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050167
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



On 5/5/23 13:36, Sandeep Kumar wrote:
>   TCS Confidential
> 
> Hi Stefan,
> 
> I have these options set in /home/tcs/work/san/openbmc/openbmc_april/openbmc/meta-aspeed/recipes-kernel/linux/linux-aspeed/tpm/tpm2.cfg
> 
> CONFIG_HW_RANDOM=y
> CONFIG_HW_RANDOM_TPM=y
> CONFIG_TCG_TPM=y
> CONFIG_TCG_TIS_CORE=y
> CONFIG_TCG_TIS=y
> CONFIG_TCG_TIS_SPI=y
> CONFIG_TCG_TIS_I2C=y
> CONFIG_SECURITYFS=y


I added 'MACHINE_FEATURES:append = " tpm2"' and this works for me.

As long as these symbols are built into the kernel it should work:

> root@evb-ast2600:~# grep tpm_tis_i2c /proc/kallsyms
> 8056318c t tpm_tis_i2c_remove
> 805631b0 t tpm_tis_i2c_retry_transfer_until_ack
> 8056323c t tpm_tis_i2c_write_bytes
> 80563334 t tpm_tis_i2c_verify_crc
> 805633e0 t tpm_tis_i2c_read_bytes
> 80563604 t tpm_tis_i2c_probe
> 80d23964 t tpm_tis_i2c_driver_init

> 
> and in /home/tcs/work/san/openbmc/openbmc_april/openbmc/meta-aspeed/recipes-kernel/linux/linux-aspeed.inc I have these,
> 
> SRC_URI += " \
>               file://defconfig \
>               file://rsa_oem_fitimage_key.key;sha256sum=eeb4ff2ebbfbd97b6254fe6dbaeea41067e54c65176c233ec7b2ab2decf1ddcd \
>               file://rsa_oem_fitimage_key.crt;sha256sum=45f5a55497cce8040999bf9f3214d471ac7b83ab7acef41c4425a34662e8372e \
>               ${@bb.utils.contains('MACHINE_FEATURES', 'tpm2', 'file://tpm/tpm2.scc file://tpm/tpm2.cfg', '', d)} \
>               ${@bb.utils.contains_any('DISTRO_FEATURES', \
>                  'obmc-static-norootfs obmc-ubi-fs', \
>                  'file://ubi/ubi.scc file://ubi/ubi.cfg', '', d)} \
>             "
> 
> Anything else needs to be done to enable TPM ?

Apart from having to use the latest QEMU with the TPM TIS I2C support (from git repo) I don't know of anything else.

    Stefan

> 
> Thanks,
> Sandeep.
> 
> -----Original Message-----
> From: Stefan Berger <stefanb@linux.ibm.com>
> Sent: Friday, May 5, 2023 9:41 PM
> To: Sandeep Kumar <sandeep.pkumar@tcs.com>; Cédric Le Goater <clg@kaod.org>; openbmc@lists.ozlabs.org; Ninad Palsule <ninad@linux.ibm.com>; Joel Stanley <jms@jms.id.au>; Andrew Jeffery <andrew@aj.id.au>
> Subject: Re: Integrating swtpm(as a software TPM) with OpenBMC on Qemu
> 
> "External email. Open with Caution"
> 
> I enable the following kernel build options for OpenBMC Linux kernel:
> 
> CONFIG_TCG_TPM=y
> CONFIG_TCG_TIS_CORE=y
> CONFIG_TCG_TIS=y
> CONFIG_TCG_TIS_I2C=y
> 
> With swtpm running in another terminal:
> 
> while :; do swtpm socket --tpmstate dir=/tmp/mytpm1     --ctrl type=unixio,path=/tmp/mytpm1/swtpm-sock     --tpm2     --log level=20; done
> 
> I start qemu built from qemu git master branch tip:
> 
> /tmp/qemu-system-arm -machine ast2600-evb -nographic -no-reboot -net nic -net user,hostfwd=:127.0.0.1:5722-:22,hostfwd=:127.0.0.1:5743-:443,hostfwd=udp:127.0.0.1:5723-:623 -drive file=./tmp/deploy/images/evb-ast2600/obmc-phosphor-image-evb-ast2600.static.mtd,format=raw,if=mtd     -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock     -tpmdev emulator,id=tpm0,chardev=chrtpm     -device tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.12,address=0x2e
> 
> root@evb-ast2600:~# echo tpm_tis_i2c 0x2e > /sys/bus/i2c/devices/i2c-12/new_device
> [   63.771200] tpm_tis_i2c 12-002e: 2.0 TPM (device-id 0x1, rev-id 1)
> [   63.783927] tpm tpm0: A TPM error (256) occurred attempting the self test
> [   63.784256] tpm tpm0: starting up the TPM manually
> [   63.851474] i2c i2c-12: new_device: Instantiated device tpm_tis_i2c at 0x2e
> 
> root@evb-ast2600:~# uname -a
> Linux evb-ast2600 6.1.15-580639a-dirty-c56bfb7-00123-gc56bfb70ebfa #1 SMP Thu Apr  6 00:55:09 UTC 2023 armv7l GNU/Linux
> 
> root@evb-ast2600:~# grep tpm_tis_i2c /proc/kallsyms> 8056318c t tpm_tis_i2c_remove
> 805631b0 t tpm_tis_i2c_retry_transfer_until_ack
> 8056323c t tpm_tis_i2c_write_bytes
> 80563334 t tpm_tis_i2c_verify_crc
> 805633e0 t tpm_tis_i2c_read_bytes
> 80563604 t tpm_tis_i2c_probe
> 80d23964 t tpm_tis_i2c_driver_init
> 
> root@evb-ast2600:~# find /sys/class/tpm
> /sys/class/tpm
> /sys/class/tpm/tpm0
> 
> root@evb-ast2600:~# ls -l /dev/tpm*
> crw-------    1 root     root       10, 224 May  5 16:03 /dev/tpm0
> crw-------    1 root     root      252, 65536 May  5 16:03 /dev/tpmrm0
> 
> root@evb-ast2600:~# find /sys/ | grep pcr
> /sys/devices/platform/ahb/ahb:apb/ahb:apb:bus@1e78a000/1e78a680.i2c-bus/i2c-12/12-002e/tpm/tpm0/pcr-sha1
> /sys/devices/platform/ahb/ahb:apb/ahb:apb:bus@1e78a000/1e78a680.i2c-bus/i2c-12/12-002e/tpm/tpm0/pcr-sha1/17
> [... lots more entries also for sha256, sha384, and sha512 ]
> 
> 
> 
> 
> It seems to work as expected
> 
> On 5/5/23 11:08, Sandeep Kumar wrote:
>> TCS Confidential Hi Stefan, Please find below my answers inline.
>> Thanks, Sandeep. -----Original Message----- From: Stefan Berger
>> <stefanb@ linux. ibm. com> Sent: Friday, May 5, 2023 6: 56 PM To:
>> Sandeep Kumar <sandeep. pkumar@ tcs. com>; ZjQcmQRYFpfptBannerStart This Message Is From an External Sender This message came from outside your organization.
>> ZjQcmQRYFpfptBannerEnd
>>
>> TCS Confidential
>>
>>
>> Hi Stefan,
>>
>> Please find below my answers inline.
>>
>> Thanks,
>>
>> Sandeep.
>>
>> -----Original Message-----
>> From: Stefan Berger <stefanb@linux.ibm.com>
>> Sent: Friday, May 5, 2023 6:56 PM
>> To: Sandeep Kumar <sandeep.pkumar@tcs.com>; Cédric Le Goater
>> <clg@kaod.org>; openbmc@lists.ozlabs.org; Ninad Palsule
>> <ninad@linux.ibm.com>; Joel Stanley <jms@jms.id.au>; Andrew Jeffery
>> <andrew@aj.id.au>
>> Subject: Re: Integrating swtpm(as a software TPM) with OpenBMC on Qemu
>>
>> "External email. Open with Caution"
>>
>> On 5/5/23 01:40, Sandeep Kumar wrote:
>>
>>   >   TCS Confidential
>>
>>   >
>>
>>   > Hi Stefan,
>>
>>   >
>>
>>   > Stefan: Is the kernel configured in the same way? Are you using the same kernel version?
>>
>>   > Ans:
>>
>>   >          I am using the Kernel version coming with the latest openBMC without any changes.
>>
>>   >          Kernel version used : Linux evb-ast2600 6.1.15-580639a #1
>> SMP
>>
>>   > Thu Apr 6 00:55:09 UTC 2023 armv71 GNU/Linux
>>
>>   >
>>
>>   > Stefan:  What is the output of this?  find /sys/class/tpm | grep
>> pcr
>>
>>   > Ams:     find: /sys/class/tpm: No such file or directory.
>>
>>   >
>>
>>   > Could you please point to the right version of kernel which has all these changes ?
>>
>> I am not aware of changes in the Linux kernel for TPM I2C and why it would not work in this kernel version.
>>
>> Does this show any files?
>>
>> find /sys | grep pcr
>>
>> *Sandeep: It doesn't show any files. *
>>
>> *root@evb-ast2600:~# echo tpm_tis_i2c 0x2e >
>> /sys/bus/i2c/devices/i2c-12/new_device*
>>
>> *[  273.273089] i2c i2c-12: new_device: Instantiated device
>> tpm_tis_i2c at 0x2e*
>>
>> *root@evb-ast2600:~#*
>>
>> *root@evb-ast2600:~# find /sys | grep pcr*
>>
>> *root@evb-ast2600:~#*
>>
>> Do /dev/tpm0 and /dev/tpmrm0 appear after the echo ? What does dmesg show related to tpm (dmesg | grep -i tpm)?
>>
>> *Sandeep:  I don’t see /dev/tpm0 and /dev/tpmrm0 after the echo.
>> Output as below, *
>>
>> **
>>
>> *root@evb-ast2600:~# echo tpm_tis_i2c 0x2e >
>> /sys/bus/i2c/devices/i2c-12/new_device*
>>
>> *[  273.273089] i2c i2c-12: new_device: Instantiated device
>> tpm_tis_i2c at 0x2e*
>>
>> *root@evb-ast2600:~#*
>>
>> *root@evb-ast2600:~# find /sys | grep pcr*
>>
>> *root@evb-ast2600:~#*
>>
>> *root@evb-ast2600:~# ls /dev/tpm**
>>
>> *ls: /dev/tpm*: No such file or directory*
>>
>> *root@evb-ast2600:~# dmesg | grep -i tpm*
>>
>> *[    6.290898] systemd[1]: systemd 253.1^ running in system mode
>> (+PAM -AUDIT -SELINUX -APPARMOR -IMA -SMACK +SECCOMP -GCRYPT -GNUTLS
>> -OPENSSL -ACL +BLKID -CURL -ELFUTILS -FIDO2 -IDN2 -IDN -IPTC -KMOD
>> -LIBCRYPTSETUP +LIBFDISK -PCRE2 -PWQUALITY -P11KIT -QRENCODE -TPM2
>> -BZIP2 -LZ4 -XZ -ZLIB +ZSTD -BPF_FRAMEWORK -XKBCOMMON -UTMP -SYSVINIT
>> default-hierarchy=unified)*
>>
>> *[  273.273089] i2c i2c-12: new_device: Instantiated device
>> tpm_tis_i2c at 0x2e*
>>
>> *root@evb-ast2600:~#*
>>
>>       Stefan
>>
>>   >
>>
>>   >
>>
>>   > Thanks,
>>
>>   > Sandeep.
>>
>>   >
>>
>>   > -----Original Message-----
>>
>>   > From: Stefan Berger <stefanb@linux.ibm.com
>> <mailto:stefanb@linux.ibm.com>>
>>
>>   > Sent: Thursday, May 4, 2023 7:30 PM
>>
>>   > To: Sandeep Kumar <sandeep.pkumar@tcs.com
>> <mailto:sandeep.pkumar@tcs.com>>; Cédric Le Goater
>>
>>   > <clg@kaod.org <mailto:clg@kaod.org>>; openbmc@lists.ozlabs.org
>> <mailto:openbmc@lists.ozlabs.org>; Ninad Palsule
>>
>>   > <ninad@linux.ibm.com <mailto:ninad@linux.ibm.com>>; Joel Stanley
>> <jms@jms.id.au <mailto:jms@jms.id.au>>; Andrew Jeffery
>>
>>   > <andrew@aj.id.au <mailto:andrew@aj.id.au>>
>>
>>   > Subject: Re: Integrating swtpm(as a software TPM) with OpenBMC on
>> Qemu
>>
>>   >
>>
>>   > "External email. Open with Caution"
>>
>>   >
>>
>>   >
>>
>>   > On 5/4/23 05:12, Sandeep Kumar wrote:
>>
>>   >> TCS Confidential Hi C, I was able to build and run the image(for
>>
>>   >> evb-ast2600) with swtpm. Few issues observed, If I run with the
>>
>>   >> flash. img provided in your github link(https: //github.
>>
>>   >> com/legoater/qemu-aspeed-boot/tree/master/images) everything ZjQcmQRYFpfptBannerStart This Message Is From an External Sender This message came from outside your organization.
>>
>>   >> ZjQcmQRYFpfptBannerEnd
>>
>>   >> TCS Confidential
>>
>>   >>
>>
>>   >> Hi C,
>>
>>   >> I was able to build and run the image(for evb-ast2600) with swtpm.
>>
>>   >> Few issues observed,
>>
>>   >>
>>
>>   >>   1. If I run with the flash.img provided in your github link(_https://github.com/legoater/qemu-aspeed-boot/tree/master/images_ <https://github.com/legoater/qemu-aspeed-boot/tree/master/images <https://github.com/legoater/qemu-aspeed-boot/tree/master/images>>) everything works as expected, i.e I get the below output.
>>
>>   >>
>>
>>   >> *# echo tpm_tis_i2c 0x2e > /sys/bus/i2c/devices/i2c-12/new_device*
>>
>>   >> *[  182.735902] tpm_tis_i2c 12-002e: 2.0 TPM (device-id 0x1,
>> rev-id
>>
>>   >> 1)* *[  182.773885] i2c i2c-12: new_device: Instantiated device
>>
>>   >> tpm_tis_i2c at 0x2e*
>>
>>   >> *#*
>>
>>   >> *#*
>>
>>   >> *# cat /sys/class/tpm/tpm0/pcr-sha256/0*
>>
>>   >> *B804724EA13F52A9072BA87FE8FDCC497DFC9DF9AA15B9088694639C431688E0*
>>
>>   >> *#*
>>
>>   >> *#*
>>
>>   >>
>>
>>   >>   2. If I run it with the locally built image, I get this error,
>>
>>   >
>>
>>   > Is the kernel configured in the same way? Are you using the same kernel version?
>>
>>   >>
>>
>>   >> *root@evb-ast2600:~# echo tpm_tis_i2c 0x2e >
>>
>>   >> /sys/bus/i2c/devices/i2c-12/new_device*
>>
>>   >> *[  174.063597] i2c i2c-12: new_device: Instantiated device
>>
>>   >> tpm_tis_i2c at 0x2e*
>>
>>   >
>>
>>   > What is the output of this?
>>
>>   >
>>
>>   > find /sys/class/tpm | grep pcr
>>
>>   >
>>
>>   >     Stefan
>>
>>   >
>>
>>   >> *root@evb-ast2600:~# cat /sys/class/tpm/tpm0/pcr-sha256/0*
>>
>>   >> *cat: can't open '/sys/class/tpm/tpm0/pcr-sha256/0': No such file
>> or
>>
>>   >> directory*
>>
>>   >> *root@evb-ast2600:~#*
>>
>>   >> *root@evb-ast2600:~#*
>>
>>   >> Please do let me know about what has been done to write the values
>>
>>   >> into “*/sys/class/tpm/tpm0/pcr-sha256/0**” . * Thanks, Sandeep.
>>
>>   >> _____________________________________________
>>
>>   >> *From:* Sandeep Kumar
>>
>>   >> *Sent:* Thursday, April 20, 2023 5:45 PM
>>
>>   >> *To:* Cédric Le Goater <clg@kaod.org <mailto:clg@kaod.org>>;
>> openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>;
>>
>>   >> Ninad Palsule <ninad@linux.ibm.com <mailto:ninad@linux.ibm.com>>;
>> Joel Stanley <jms@jms.id.au <mailto:jms@jms.id.au>>;
>>
>>   >> Andrew Jeffery <andrew@aj.id.au <mailto:andrew@aj.id.au>>
>>
>>   >> *Subject:* RE: Integrating swtpm(as a software TPM) with OpenBMC
>> on
>>
>>   >> Qemu Hi C, How to build this image =>
>>
>>   >> *obmc-phosphor-image.rootfs.wic.qcow2* ? In openBmc build directory we don’t get this image built.
>>
>>   >> Also, remaining image formats used while running on qemu are available in the build directory. i.e fitImage-linux.bin, aspeed-bmc-ibm-rainier.dtb and obmc-phosphor-initramfs.rootfs.cpio.xz .
>>
>>   >> Please advise if we have to build openbmc stack in a different way
>>
>>   >> than the standard procedure. We follow the below steps for build, 1. .
>>
>>   >> setup Romulus 2. bitbake obmc-phosphor-image Thanks, Sandeep.
>>
>>   >> -----Original Message-----
>>
>>   >> From: Sandeep Kumar
>>
>>   >> Sent: Wednesday, April 19, 2023 3:00 PM
>>
>>   >> To: Cédric Le Goater <_clg@kaod.org_ <mailto:clg@kaod.org
>> <mailto:_clg@kaod.org_%20%3cmailto:clg@kaod.org>>>;
>>
>>   >> _openbmc@lists.ozlabs.org_ <mailto:_openbmc@lists.ozlabs.org_>
>> <mailto:openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>>;
>> Ninad
>>
>>   >> Palsule <_ninad@linux.ibm.com_ <mailto:ninad@linux.ibm.com
>> <mailto:_ninad@linux.ibm.com_%20%3cmailto:ninad@linux.ibm.com>>>; Joel
>>
>>   >> Stanley <_jms@jms.id.au_ <mailto:jms@jms.id.au
>> <mailto:_jms@jms.id.au_%20%3cmailto:jms@jms.id.au>>>; Andrew Jeffery
>>
>>   >> <_andrew@aj.id.au_ <mailto:andrew@aj.id.au
>> <mailto:_andrew@aj.id.au_%20%3cmailto:andrew@aj.id.au>>>
>>
>>   >> Subject: RE: Integrating swtpm(as a software TPM) with OpenBMC on
>>
>>   >> Qemu Hi C, Got it working. Looks like slirp is no longer supported
>> on
>>
>>   >> ubnutu 18.04. have upgraded to a newer version  and is working now.
>>
>>   >> Thanks,
>>
>>   >> Sandeep.
>>
>>   >> -----Original Message-----
>>
>>   >> From: Cédric Le Goater <clg@kaod.org <mailto:clg@kaod.org
>> <mailto:clg@kaod.org%20%3cmailto:clg@kaod.org>>>
>>
>>   >> Sent: Wednesday, April 19, 2023 2:26 PM
>>
>>   >> To: Sandeep Kumar <sandeep.pkumar@tcs.com
>>
>>   >> <mailto:sandeep.pkumar@tcs.com <mailto:sandeep.pkumar@tcs.com>>>;
>> openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>
>>
>>   >> <mailto:openbmc@lists.ozlabs.org
>> <mailto:openbmc@lists.ozlabs.org>>; Ninad Palsule <ninad@linux.ibm.com
>>
>>   >> <mailto:ninad@linux.ibm.com <mailto:ninad@linux.ibm.com>>>; Joel
>> Stanley <jms@jms.id.au
>>
>>   >> <mailto:jms@jms.id.au <mailto:jms@jms.id.au>>>; Andrew Jeffery
>> <andrew@aj.id.au
>>
>>   >> <mailto:andrew@aj.id.au <mailto:andrew@aj.id.au>>>
>>
>>   >> Subject: Re: Integrating swtpm(as a software TPM) with OpenBMC on
>>
>>   >> Qemu "External email. Open with Caution"
>>
>>   >> Hello Sandeep
>>
>>   >> On 4/18/23 09:45, Sandeep Kumar wrote:
>>
>>   >>> TCS Confidential
>>
>>   >>>
>>
>>   >>> Hi C,
>>
>>   >>> Built the qemu from your branch. Few issues, *$ ./qemu-system-arm
>> -m
>>
>>   >>> 256 -M romulus-bmc -nographic -drive
>>
>>   >>> file=./obmc-phosphor-image-romulus.static.mtd,format=raw,if=mtd
>> -net
>>
>>   >>> nic -net
>>
>>   >>>
>> user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:4443-:443,hostfw
>>
>>   >>> d
>>
>>   >>> =
>>
>>   >>> tcp:127.0.0.1:8880-:80,hostfwd=tcp:127.0.0.1:2200-:2200,hostfwd=udp:
>>
>>   >>> 1
>>
>>   >>> 2
>>
>>   >>> 7.0.0.1:6623-:623,hostfwd=udp:127.0.0.1:6664-:664,hostname=qemu*
>>
>>   >>> *qemu-system-arm: -net
>>
>>   >>>
>> user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:4443-:443,hostfw
>>
>>   >>> d
>>
>>   >>> =
>>
>>   >>> tcp:127.0.0.1:8880-:80,hostfwd=tcp:127.0.0.1:2200-:2200,hostfwd=udp:
>>
>>   >>> 1
>>
>>   >>> 2
>>
>>   >>> 7.0.0.1:6623-:623,hostfwd=udp:127.0.0.1:6664-:664,hostname=qemu:
>>
>>   >>> network backend 'user' is not compiled into this binary* I didn’t
>>
>>   >>> enable the slirp package I guess. So enabled it while running
>>
>>   >>> configure, *$ ../configure --enable-slirp*
>>
>>   >>> *........*
>>
>>   >>> *Run-time dependency slirp found: NO (tried pkgconfig)*
>>
>>   >>> *../meson.build:681:2: ERROR: Dependency "slirp" not found, tried
>>
>>   >>> pkgconfig* *A full log can be found at
>>
>>   >>>
>> /home/tcs/work/sandeep/measured_boot/ibm_qemu/qemu/build/meson-logs/
>>
>>   >>> m
>>
>>   >>> e
>>
>>   >>> son-log.txt*
>>
>>   >>> *NOTICE: You are using Python 3.6 which is EOL. Starting with
>>
>>   >>> v0.62.0, Meson will require Python 3.7 or newer*
>>
>>   >>> *ERROR: meson setup failed*
>>
>>   >>> I have already installed slirp locally, but still getting the above error.
>>
>>   >> Did you install the libslirp-dev or libslirp-devel package ?
>>
>>   >> C.
>>
>>   >>
>>
>>   >> TCS Confidential
>>
>>   >>
>>
>>   >> =====-----=====-----=====
>>
>>   >> Notice: The information contained in this e-mail message and/or
>>
>>   >> attachments to it may contain confidential or privileged information.
>>
>>   >> If you are not the intended recipient, any dissemination, use,
>>
>>   >> review, distribution, printing or copying of the information
>>
>>   >> contained in this e-mail message and/or attachments to it are
>>
>>   >> strictly prohibited. If you have received this communication in
>>
>>   >> error, please notify us by reply e-mail or telephone and
>> immediately
>>
>>   >> and permanently delete the message and any attachments. Thank you
>>
>>   >>
>>
>>   >
>>
>>   >   TCS Confidential
>>
>>
>> TCS Confidential
>>
> 
>   TCS Confidential
