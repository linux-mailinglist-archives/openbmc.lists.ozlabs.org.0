Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2C5262B09
	for <lists+openbmc@lfdr.de>; Wed,  9 Sep 2020 10:55:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmbT43pRZzDqDp
	for <lists+openbmc@lfdr.de>; Wed,  9 Sep 2020 18:55:36 +1000 (AEST)
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
 header.s=pp1 header.b=cFAV1HZo; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmbRR59XdzDqRM
 for <openbmc@lists.ozlabs.org>; Wed,  9 Sep 2020 18:54:11 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0898Wm1p061928; Wed, 9 Sep 2020 04:54:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Hsne5Zma2MUUQF1iB/lxF7RhqluXCVUEo1ZMjPKoU6M=;
 b=cFAV1HZoIc9Jsa37pMsu2QvihWZpUJnTrmPCnHXux6i0Zj1m190m2lzCKYKIjP8/oKF3
 K0UBrjPyps/8Gu+409Sssq7tawMhkSUwlI8TjNWul+8MPZg9NZa0zuiu52TU4UeRfQex
 +Wm96PBW+YdjVPdE+a7ZF7Xz6CSpZyKA0enpQl52VkTm9IyX/gTsSi2zM2eostXLssvn
 9ErxlTLSoMXTkSJGa2c6DtEaWt546izJ6zSlBZU1xEwyYM5Sdu67FkEsLxsNkr3C9GtL
 V86z+D1HEdSvHDHcsETWZXIUe99iDj+/F329rlpyFF3wbJbfU2s8MnUBhr88/lxRHodJ Vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33et9ub8k9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 04:54:08 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0898aQMf073251;
 Wed, 9 Sep 2020 04:54:07 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33et9ub8jq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 04:54:07 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0898qn4H016677;
 Wed, 9 Sep 2020 08:54:06 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 33dxdr1fw5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 08:54:06 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0898s3e29109822
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Sep 2020 08:54:03 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8641852052;
 Wed,  9 Sep 2020 08:54:03 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.228.115])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1166A5204F;
 Wed,  9 Sep 2020 08:54:01 +0000 (GMT)
Subject: Re: Enable UBI support for a platform
To: Jiandi An <jan@nvidia.com>, Kun Zhao <zkxz@hotmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <BYAPR14MB23426A9032F9FDAF87F1BC19CF2D0@BYAPR14MB2342.namprd14.prod.outlook.com>
 <242dee50-7e1b-3fc3-5105-ca33f288d959@linux.vnet.ibm.com>
 <BYAPR14MB2342A17C9B9BE853C0616E9CDC280@BYAPR14MB2342.namprd14.prod.outlook.com>
 <4e89c963-1ddd-2627-47c8-be13b903bc64@linux.vnet.ibm.com>
 <DM6PR12MB3020FE5674F3DBE642D392C8CD260@DM6PR12MB3020.namprd12.prod.outlook.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Message-ID: <fffe9522-2c57-8ef0-4132-5d7c9cc831d4@linux.vnet.ibm.com>
Date: Wed, 9 Sep 2020 14:24:01 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <DM6PR12MB3020FE5674F3DBE642D392C8CD260@DM6PR12MB3020.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-09_03:2020-09-08,
 2020-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009090073
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

On 09/09/20 6:15 am, Jiandi An wrote:
> 
>> On 08/09/20 12:39 am, Kun Zhao wrote:
>>>
>>> On 9/5/20 5:49 AM, Deepak Kodihalli wrote:
>>>> Hi Kun,
>>>>
>>>> On 05/09/20 5:32 am, Kun Zhao wrote:
>>>>> Hi Team,
>>>>>
>>>>> My platform is based on ast2500, and I’ve already been able to built
>>>>> out the ubi image. But when I tried to test it with qemu, it just
>>>>> stopped at u-boot because ‘can’t get kernel image,
>>>>>
>>>>> qemu-system-arm: Aspeed iBT has no chardev backend
>>>>>
>>>>> U-Boot 2016.07 (Sep 04 2020 - 19:47:48 +0000)
>>>>>
>>>>>           Watchdog enabled
>>>>>
>>>>> DRAM:  496 MiB
>>>>>
>>>>> Flash: 32 MiB
>>>>>
>>>>> *** Warning - bad CRC, using default environment
>>>>>
>>>>> In:    serial
>>>>>
>>>>> Out:   serial
>>>>>
>>>>> Err:   serial
>>>>>
>>>>> Net:   MAC0 : RGMII
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
>>>>> Hit any key to stop autoboot:  0
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
>>>>> Checked in the build folder for
>>>>> tmp/work/myplatform-openbmc-linux-gnueabi/u-boot-aspeed/1_v2016.07+g
>>>>> itAUTOINC+1ded9fa3a2-r0/ and found the none of the following patches
>>>>> are there,
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
>>>>> This is the details of how I enabled the ubi support in my platform
>>>>> recipes,
>>>>>
>>>>> 1. In meta-myplatform/conf/distro/openbmc-myplatform.conf, I added,
>>>>>
>>>>> require conf/distro/include/phosphor-base.inc
>>>>>
>>>>> require conf/distro/include/phosphor-ubi.inc
>>>>
>>>> You should just need the one line above, plus a device tree change for your
>> system. The default openbmc-flash-layout.dtsi doesn't make a ubifs partition.
>> You can for eg look at witherspoon's dts, which uses ubifs.
>>> Hi Deepak, thank you for reply. I've tried to use the witherspoon's flash layout
>> per your tips here. But it still stops at u-boot with "can't get kernel image!" error.
>> Do I need to enable any kernel config options?
>>
>>
>> Hi Kun, I don't think you need additional kernel config updates. I suspect
>> something wrong with the way the image is built. Are you able to see expected
>> values for the u-boot environment variables and MTD partitions? For eg:
>>
>> ast# mtdparts
>> device nor0 <bmc>, # parts = 3
>>    #: name               size            offset          mask_flags
>>    0: u-boot              0x00060000     0x00000000      0
>>    1: u-boot-env          0x00020000     0x00060000      0
>>    2: obmc-ubi            0x01f80000     0x00080000      0
>> active partition: nor0,0 - (u-boot) 0x00060000 @ 0x00000000
>>
> 
> Hi Deepak,
> One thing is no mtdparts command from u-boot.  Do we need to add CONFIG_CMD_MTDPARTS?
> Here the comment says adding CONFIG_CMD_MTDPARTS won't work.
> https://lists.denx.de/pipermail/u-boot/2012-December/142837.html

Hi Jiandi, the comment you pointed to is in the context if a very old 
u-boot release, so I don't think it applies to the u-boot release that 
OpenBMC uses. MTD and UBI support is optional in the u-boot AST config, 
and is enabled if MTDPARTS_DEFAULT is set. This flag further sets 
CONFIG_MTD_PARTITIONS. MTDPARTS_DEFAULT is enabled via a u-boot patch 
that we carry, and that is picked up if the 'obmc-ubi-fs' distro feature 
is enabled (see 
meta-phosphor/aspeed-layer/recipes-bsp/u-boot/u-boot-aspeed.inc). So it 
still seems like this feature is not enabled in the image or there is 
some other issue with building the image.

> Actually using witherspoon's flash layout
> https://github.com/ibm-openbmc/openbmc/blob/OP940/meta-ibm/meta-witherspoon/recipes-kernel/linux/linux-aspeed/0001-ARM-dts-Aspeed-Witherspoon-128-Update-BMC-partitioni.patch
> 
> So the one we have in the device tree is as follows..

Witherspoon-128's (which has a different device tree than witherspoon) 
BMC has a 128M flash (you can see the sizes of the partitions below in 
the device tree add up to 128M). So this would work if your BMC has a 
128M flash. The obmc-ubi partition would be smaller for eg for a 32M flash.

> &fmc {
> 	status = "okay";
> 	flash@0 {
> 		status = "okay";
> 		m25p,fast-read;
> 		label = "bmc";
> //#include "openbmc-flash-layout.dtsi"
> 
> 		partitions {
> 			#address-cells = < 1 >;
> 			#size-cells = < 1 >;
> 			compatible = "fixed-partitions";
> 			u-boot@0 {
> 				reg = < 0 0x60000 >;
> 				label = "u-boot";
> 			};
> 			u-boot-env@60000 {
> 				reg = < 0x60000 0x20000 >;
> 				label = "u-boot-env";
> 			};
> 			obmc-ubi@80000 {
> 				reg = <0x80000 0x7F80000>;
> 				label = "obmc-ubi";
> 			};
> 		};
> 	};
> };
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
> 

