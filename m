Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD5D26A6EA
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 16:18:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrQLt4R3wzDqN0
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 00:18:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=dkodihal@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pTjk03Vv; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrQHW1hTTzDqMp
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 00:15:34 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08FEAhjO108119
 for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2020 10:15:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : cc : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=/td4/JB3SAE31HHZ2T3oOi0FRXu3dp8z6WG+hyo1dCI=;
 b=pTjk03Vv3pb3jRaohJ1+ay8nTWXVK4v9h8oIfEuMaxVtO7CEzeDeNAobZxSNMWtHWKZn
 s0EPvBQ4rolun8r8ENGaRVcqRTiolYeP3qXAOfpv7adsGWKZ3NMrqB5r2h3eQ0WMYRGm
 MJiuvjy0jCERQeduwkOW572DrJ2pFYmdokgATbmy7W5UX3ihWNz80ptaI+hHxd1NIfo3
 +yzhGKbXD/pQrItICJQ2Urql5PYUWGCHIXOmgbclv/o3I7xhBSJIJPhDvBYhQN8xoW1g
 3NmMObHU/hLMRSKpr64y4yoNDSWe8cbJudCT9neI+LQgFZZ9oMQt6DMGfJc3YHfrRSqR jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33jwuyb7cv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2020 10:15:30 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08FEB06Q109880
 for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2020 10:15:30 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33jwuyb7bw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Sep 2020 10:15:30 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08FE78L8017682;
 Tue, 15 Sep 2020 14:15:28 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 33hb1j2qeh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Sep 2020 14:15:28 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 08FEDpo817629582
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Sep 2020 14:13:51 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51F7C11C04C;
 Tue, 15 Sep 2020 14:15:25 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1926B11C05C;
 Tue, 15 Sep 2020 14:15:24 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.250.117])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 15 Sep 2020 14:15:23 +0000 (GMT)
Subject: Re: Enable UBI support for a platform
To: Kun Zhao <zkxz@hotmail.com>, anoo@linux.ibm.com
References: <BYAPR14MB23426A9032F9FDAF87F1BC19CF2D0@BYAPR14MB2342.namprd14.prod.outlook.com>
 <242dee50-7e1b-3fc3-5105-ca33f288d959@linux.vnet.ibm.com>
 <BYAPR14MB2342A17C9B9BE853C0616E9CDC280@BYAPR14MB2342.namprd14.prod.outlook.com>
 <4e89c963-1ddd-2627-47c8-be13b903bc64@linux.vnet.ibm.com>
 <BYAPR14MB23426BE881262C70C81FFDAEDC200@BYAPR14MB2342.namprd14.prod.outlook.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Message-ID: <b7c9296d-00a1-0137-ae67-4d2d24a6cfac@linux.vnet.ibm.com>
Date: Tue, 15 Sep 2020 19:45:22 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <BYAPR14MB23426BE881262C70C81FFDAEDC200@BYAPR14MB2342.namprd14.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-15_08:2020-09-15,
 2020-09-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009150114
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

Hi Kun,

On 15/09/20 6:41 am, Kun Zhao wrote:
> 
> On 9/8/20 8:26 AM, Deepak Kodihalli wrote:
>> On 08/09/20 12:39 am, Kun Zhao wrote:
>>>
>>> On 9/5/20 5:49 AM, Deepak Kodihalli wrote:
>>>> Hi Kun,
>>>>
>>>> On 05/09/20 5:32 am, Kun Zhao wrote:
>>>>> Hi Team,
>>>>>
>>>>> My platform is based on ast2500, and I’ve already been able to built out the ubi image. But when I tried to test it with qemu, it just stopped at u-boot because ‘can’t get kernel image,
>>>>>
>>>>> qemu-system-arm: Aspeed iBT has no chardev backend
>>>>>
>>>>> U-Boot 2016.07 (Sep 04 2020 - 19:47:48 +0000)
>>>>>
>>>>>           Watchdog enabled
>>>>>
>>>>> DRAM:  496 MiB
>>>>>
>>>>> Flash: 32 MiB
>>>>>
>>>>> *** Warning - bad CRC, using default environment
>>>>>
>>>>> In:    serial
>>>>>
>>>>> Out:   serial
>>>>>
>>>>> Err:   serial
>>>>>
>>>>> Net:   MAC0 : RGMII
>>>>>
>>>>> MAC1 : RGMII
>>>>>
>>>>> FTGMAC100#0
>>>>>
>>>>> Error: FTGMAC100#0 address not set.
>>>>>
>>>>> , FTGMAC100#1
>>>>>
>>>>> Error: FTGMAC100#1 address not set.
>>>>>
>>>>> Hit any key to stop autoboot:  0
>>>>>
>>>>> Wrong Image Format for bootm command
>>>>>
>>>>> ERROR: can't get kernel image!
>>>>>
>>>>> ast#
>>>>>
>>>>> And I found the bootargs is not right,
>>>>>
>>>>> ast# print
>>>>>
>>>>> baudrate=115200
>>>>>
>>>>> bootargs=console=ttyS4,115200n8 root=/dev/ram rw
>>>>>
>>>>> bootcmd=bootm 20080000
>>>>>
>>>>> bootdelay=2
>>>>>
>>>>> Checked in the build folder for tmp/work/myplatform-openbmc-linux-gnueabi/u-boot-aspeed/1_v2016.07+gitAUTOINC+1ded9fa3a2-r0/ and found the none of the following patches are there,
>>>>>
>>>>> 0002-config-ast-common-hack-bootopts.patch
>>>>>
>>>>> 0003-config-ast-common-Add-bootopts-to-support-ubi-and-mt.patch
>>>>>
>>>>> 0004-config-ast-common-Add-conditional-factory-reset-comm.patch
>>>>>
>>>>> 0005-config-ast-common-Fall-back-to-secondary-flash-on-fa.patch
>>>>>
>>>>> I think that’s why the bootargs is not correct.
>>>>>
>>>>> This is the details of how I enabled the ubi support in my platform recipes,
>>>>>
>>>>> 1. In meta-myplatform/conf/distro/openbmc-myplatform.conf, I added,
>>>>>
>>>>> require conf/distro/include/phosphor-base.inc
>>>>>
>>>>> require conf/distro/include/phosphor-ubi.inc
>>>>
>>>> You should just need the one line above, plus a device tree change for your system. The default openbmc-flash-layout.dtsi doesn't make a ubifs partition. You can for eg look at witherspoon's dts, which uses ubifs.
>>> Hi Deepak, thank you for reply. I've tried to use the witherspoon's flash layout per your tips here. But it still stops at u-boot with "can't get kernel image!" error. Do I need to enable any kernel config options?
>>
>>
>> Hi Kun, I don't think you need additional kernel config updates. I suspect something wrong with the way the image is built. Are you able to see expected values for the u-boot environment variables and MTD partitions? For eg:
>>
>> ast# mtdparts
>> device nor0 <bmc>, # parts = 3
>>   #: name        size        offset        mask_flags
>>   0: u-boot              0x00060000    0x00000000    0
>>   1: u-boot-env          0x00020000    0x00060000    0
>>   2: obmc-ubi            0x01f80000    0x00080000    0
>> active partition: nor0,0 - (u-boot) 0x00060000 @ 0x00000000
>>
> Hi Deepak,
> 
> Sorry for late response. I've figured out the reason why my u-boot didn't apply those patches for ubi support, that is meta-myplatform/conf/distro/openbmc-myplatform.conf wasn't parsed. When I add this line,
> 
> require conf/distro/include/phosphor-ubi.inc
> 
> directly into meta-myplatform/conf/machine/myplatform.conf, I see the u-boot supporting ubi, mtdparts cmds. The output for mtdparts is,
> 
> ast# mtdparts
> 
> device nor0 <bmc>, # parts = 3
>   #: name                size            offset          mask_flags
>   0: u-boot              0x00060000      0x00000000      0
>   1: u-boot-env          0x00020000      0x00060000      0
>   2: obmc-ubi            0x01f80000      0x00080000      0
> 
> active partition: nor0,0 - (u-boot) 0x00060000 @ 0x00000000
> 
> defaults:
> mtdids  : nor0=bmc
> mtdparts: mtdparts=bmc:384k(u-boot),128k(u-boot-env),-(obmc-ubi)
> 
> 
> And I do see u-boot trying to discover ubi partitions during normal booting, but it still failed on,
> 
> . done
> |
> . done
> |
> . done
> |
> . done
> |
> . done
> |
> . done
> |
> . done
> UBI init error 12
> Error, no UBI device/partition selected!
> Wrong Image Format for bootm command
> ERROR: can't get kernel image!
> 
> Any thought?

Some thoughts:

- Have you validated your recipe and device tree changes by trying to 
boot on QEMU an existing supported platform (for eg Romulus/Tiogapass)?

- I don't think not having the partitions for the alt side in your 
devicetree should be a problem, unless the BMC is actually switching to 
the secondary flash. 'md.l 0x1e785030 1' at the u-boot prompt can tell 
us the boot side.

Adriana - do you have any thoughts on this problem?

> 
> The u-boot env is,
> 
> ast# print
> baudrate=115200
> bootalt=run wdt2bite
> bootargs=console=ttyS4,115200n8 ubi.mtd=obmc-ubi,0,0,0 ubi.mtd=alt-obmc-ubi,0,0,4 ro rootfstype=squashfs
> bootcmd=run set_bootargs; run obmc_bootcmd
> bootdelay=2
> do_rwreset=if test "${rwreset}" = "true"; then ubi remove rwfs; ubi create rwfs ${rwfs_size}; fi
> ethact=FTGMAC100#0
> kernelname=kernel-3a859116
> loadaddr=80800000
> mtddevname=u-boot
> mtddevnum=0
> mtdids=nor0=bmc
> mtdparts=mtdparts=bmc:384k(u-boot),128k(u-boot-env),-(obmc-ubi)
> obmc_bootcmd=ubi part obmc-ubi; run do_rwreset; ubi read ${loadaddr} ${kernelname}; bootm ${loadaddr} || run bootalt
> partition=nor0,0
> root=/dev/ubiblock0_1
> rwfs_size=0x600000
> set_bootargs=setenv bootargs console=ttyS4,115200n8 ubi.mtd=obmc-ubi,0,0,0 ubi.mtd=alt-obmc-ubi,0,0,4 ro rootfstype=squashfs ubi.block=${ubiblock} root=${root}
> spi_dma=yes
> stderr=serial
> stdin=serial
> stdout=serial
> ubiblock=0,1
> verify=yes
> wdt2bite=mw.l 0x1e785024 0xa 1; mw.b 0x1e78502c 0xb3 1Environment size: 994/65531 bytes
> 
> BTW, I don't have an alt-obmc-ubi on the system.
> 
>>
>>>> Does anyone know why the default is static partitions, and not ubifs?
>>>>
>>>> Regards,
>>>> Deepak
>>>>
>>>>> 2. In meta-myplatform/conf/machine/myplatform.conf, I added,
>>>>>
>>>>> IMAGE_FSTYPES += " mtd-ubi mtd-ubi-tar"
>>>>>
>>>>> OBMC_MACHINE_FEATURES += " obmc-ubi-fs"
>>>>>
>>>>> Do I miss anything?
>>>>>
>>>>> Thanks.
>>>>>
>>>>> Best regards,
>>>>>
>>>>> Kun Zhao
>>>>>
>>>>> /*
>>>>>
>>>>> zkxz@hotmail.com <mailto:zkxz@hotmail.com>
>>>>>
>>>>> */
>>>>>
>>>>
>>> Kun
>>>
>>
> Kun
> 

