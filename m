Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF25265BC2
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 10:37:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bnpyq1F9QzDqpC
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 18:37:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=dkodihal@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GEMQLW1R; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bnpxs4DNfzDqXw
 for <openbmc@lists.ozlabs.org>; Fri, 11 Sep 2020 18:36:16 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08B8WHdF075294; Fri, 11 Sep 2020 04:36:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=dvkXauouSp8mziq/qsYcuqmJcB9/uyz0ds73TxBNNE4=;
 b=GEMQLW1Rik//vT58uadTCyJKAXFS5bBFe1DlsjXZnekxrrkLCsLamUYgC1laX2hx8nb3
 wwWMaBffLIMm8FZN/BgFrPpPfv+Ck8gmlUGmS/ysG4rlQrQDLOF49+E1hK55Ip97QbPa
 XfurNXG2yQm5aCj6pV2C3PlxRfg1fiiI6ySaw20Bpkv4/o2Az1219ymCh0tblUW6XoyZ
 40jce4Ea8IxJqLaFeJn2bSD5+D2N7VGYdSrrr+zu7tWWjnrGHddHkYci8Bz2MNF1ZV3o
 gsWoCeGjGVSutW6Y28wUwvwBFwl3Pr8+6v9CAezPyyTHeSTUl1wTgTouGgQOkVCNyBGA 4g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33g5ab92dj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Sep 2020 04:36:12 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08B8Ymkg083233;
 Fri, 11 Sep 2020 04:36:11 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33g5ab92b4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Sep 2020 04:36:11 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08B8Wqkg007349;
 Fri, 11 Sep 2020 08:36:09 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 33dxdr467g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Sep 2020 08:36:09 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 08B8a7JS57606546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Sep 2020 08:36:07 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33301A405F;
 Fri, 11 Sep 2020 08:36:07 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA690A4057;
 Fri, 11 Sep 2020 08:36:05 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.230.26])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 11 Sep 2020 08:36:05 +0000 (GMT)
Subject: Re: Enable UBI support for a platform
To: Jiandi An <jan@nvidia.com>, Kun Zhao <zkxz@hotmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <BYAPR14MB23426A9032F9FDAF87F1BC19CF2D0@BYAPR14MB2342.namprd14.prod.outlook.com>
 <242dee50-7e1b-3fc3-5105-ca33f288d959@linux.vnet.ibm.com>
 <BYAPR14MB2342A17C9B9BE853C0616E9CDC280@BYAPR14MB2342.namprd14.prod.outlook.com>
 <4e89c963-1ddd-2627-47c8-be13b903bc64@linux.vnet.ibm.com>
 <DM6PR12MB3020FE5674F3DBE642D392C8CD260@DM6PR12MB3020.namprd12.prod.outlook.com>
 <fffe9522-2c57-8ef0-4132-5d7c9cc831d4@linux.vnet.ibm.com>
 <DM6PR12MB3020425CE8126F5A3FECCFE8CD260@DM6PR12MB3020.namprd12.prod.outlook.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Message-ID: <f9c4970c-dfc6-c7e3-8a80-067523b699b9@linux.vnet.ibm.com>
Date: Fri, 11 Sep 2020 14:06:04 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <DM6PR12MB3020425CE8126F5A3FECCFE8CD260@DM6PR12MB3020.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-11_02:2020-09-10,
 2020-09-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009110063
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

Hi Jiandi,

On 09/09/20 10:00 pm, Jiandi An wrote:
>> On 09/09/20 6:15 am, Jiandi An wrote:
>>>
>>>> On 08/09/20 12:39 am, Kun Zhao wrote:
>>>>>
>>>>> On 9/5/20 5:49 AM, Deepak Kodihalli wrote:
>>>>>> Hi Kun,
>>>>>>
>>>>>> On 05/09/20 5:32 am, Kun Zhao wrote:
>>>>>>> Hi Team,
>>>>>>>
>>>>>>> My platform is based on ast2500, and I’ve already been able to
>>>>>>> built out the ubi image. But when I tried to test it with qemu, it
>>>>>>> just stopped at u-boot because ‘can’t get kernel image,
>>>>>>>
>>>>>>> qemu-system-arm: Aspeed iBT has no chardev backend
>>>>>>>
>>>>>>> U-Boot 2016.07 (Sep 04 2020 - 19:47:48 +0000)
>>>>>>>
>>>>>>>            Watchdog enabled
>>>>>>>
>>>>>>> DRAM:  496 MiB
>>>>>>>
>>>>>>> Flash: 32 MiB
>>>>>>>
>>>>>>> *** Warning - bad CRC, using default environment
>>>>>>>
>>>>>>> In:    serial
>>>>>>>
>>>>>>> Out:   serial
>>>>>>>
>>>>>>> Err:   serial
>>>>>>>
>>>>>>> Net:   MAC0 : RGMII
>>>>>>>
>>>>>>> MAC1 : RGMII
>>>>>>>
>>>>>>> FTGMAC100#0
>>>>>>>
>>>>>>> Error: FTGMAC100#0 address not set.
>>>>>>>
>>>>>>> , FTGMAC100#1
>>>>>>>
>>>>>>> Error: FTGMAC100#1 address not set.
>>>>>>>
>>>>>>> Hit any key to stop autoboot:  0
>>>>>>>
>>>>>>> Wrong Image Format for bootm command
>>>>>>>
>>>>>>> ERROR: can't get kernel image!
>>>>>>>
>>>>>>> ast#
>>>>>>>
>>>>>>> And I found the bootargs is not right,
>>>>>>>
>>>>>>> ast# print
>>>>>>>
>>>>>>> baudrate=115200
>>>>>>>
>>>>>>> bootargs=console=ttyS4,115200n8 root=/dev/ram rw
>>>>>>>
>>>>>>> bootcmd=bootm 20080000
>>>>>>>
>>>>>>> bootdelay=2
>>>>>>>
>>>>>>> Checked in the build folder for
>>>>>>> tmp/work/myplatform-openbmc-linux-gnueabi/u-boot-aspeed/1_v2016.07
>>>>>>> +g
>>>>>>> itAUTOINC+1ded9fa3a2-r0/ and found the none of the following
>>>>>>> itAUTOINC+patches
>>>>>>> are there,
>>>>>>>
>>>>>>> 0002-config-ast-common-hack-bootopts.patch
>>>>>>>
>>>>>>> 0003-config-ast-common-Add-bootopts-to-support-ubi-and-mt.patch
>>>>>>>
>>>>>>> 0004-config-ast-common-Add-conditional-factory-reset-comm.patch
>>>>>>>
>>>>>>> 0005-config-ast-common-Fall-back-to-secondary-flash-on-fa.patch
>>>>>>>
>>>>>>> I think that’s why the bootargs is not correct.
>>>>>>>
>>>>>>> This is the details of how I enabled the ubi support in my
>>>>>>> platform recipes,
>>>>>>>
>>>>>>> 1. In meta-myplatform/conf/distro/openbmc-myplatform.conf, I
>>>>>>> added,
>>>>>>>
>>>>>>> require conf/distro/include/phosphor-base.inc
>>>>>>>
>>>>>>> require conf/distro/include/phosphor-ubi.inc
>>>>>>
>>>>>> You should just need the one line above, plus a device tree change
>>>>>> for your
>>>> system. The default openbmc-flash-layout.dtsi doesn't make a ubifs partition.
>>>> You can for eg look at witherspoon's dts, which uses ubifs.
>>>>> Hi Deepak, thank you for reply. I've tried to use the witherspoon's
>>>>> flash layout
>>>> per your tips here. But it still stops at u-boot with "can't get kernel image!"
>> error.
>>>> Do I need to enable any kernel config options?
>>>>
>>>>
>>>> Hi Kun, I don't think you need additional kernel config updates. I
>>>> suspect something wrong with the way the image is built. Are you able
>>>> to see expected values for the u-boot environment variables and MTD
>> partitions? For eg:
>>>>
>>>> ast# mtdparts
>>>> device nor0 <bmc>, # parts = 3
>>>>     #: name               size            offset          mask_flags
>>>>     0: u-boot              0x00060000     0x00000000      0
>>>>     1: u-boot-env          0x00020000     0x00060000      0
>>>>     2: obmc-ubi            0x01f80000     0x00080000      0
>>>> active partition: nor0,0 - (u-boot) 0x00060000 @ 0x00000000
>>>>
>>>
>>> Hi Deepak,
>>> One thing is no mtdparts command from u-boot.  Do we need to add
>> CONFIG_CMD_MTDPARTS?
>>> Here the comment says adding CONFIG_CMD_MTDPARTS won't work.
>>> https://lists.denx.de/pipermail/u-boot/2012-December/142837.html
>>
>> Hi Jiandi, the comment you pointed to is in the context if a very old u-boot release,
>> so I don't think it applies to the u-boot release that OpenBMC uses. MTD and UBI
>> support is optional in the u-boot AST config, and is enabled if
>> MTDPARTS_DEFAULT is set. This flag further sets CONFIG_MTD_PARTITIONS.
>> MTDPARTS_DEFAULT is enabled via a u-boot patch that we carry, and that is
>> picked up if the 'obmc-ubi-fs' distro feature is enabled (see meta-
>> phosphor/aspeed-layer/recipes-bsp/u-boot/u-boot-aspeed.inc). So it still seems
>> like this feature is not enabled in the image or there is some other issue with
>> building the image.
>>
>>> Actually using witherspoon's flash layout
>>> https://github.com/ibm-openbmc/openbmc/blob/OP940/meta-ibm/meta-
>> wither
>>> spoon/recipes-kernel/linux/linux-aspeed/0001-ARM-dts-Aspeed-Witherspoo
>>> n-128-Update-BMC-partitioni.patch
>>>
>>> So the one we have in the device tree is as follows..
>>
>> Witherspoon-128's (which has a different device tree than witherspoon) BMC has
>> a 128M flash (you can see the sizes of the partitions below in the device tree add
>> up to 128M). So this would work if your BMC has a 128M flash. The obmc-ubi
>> partition would be smaller for eg for a 32M flash.
> 
> Thanks Deepak.  So I tried with aspeed-bmc-opp-witherspoon.dts now
> https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts#L231
> with obmc-ubi starting at 0x80000 with size 0x1F80000
> 
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
> 				reg = <0x80000 0x1F80000>;
> 				label = "obmc-ubi";
> 			};
> 		};
> 	};
> };
> 
> Still seeing during kernel boot that /dev/mtdblock: can't open blockdev
> 
> [    1.356025] Checked W+X mappings: passed, no W+X pages found
> [    1.356346] Run /init as init process
> rofs = squashfs rwfs = jffs2
> [    2.033408] /dev/mtdblock: Can't open blockdev
> mount: mounting /dev/mtdblock on run/initramfs/ro failed: No such file or directory
> [    2.043247] MTD: Couldn't look up '/dev/mtdblock': -2
> mount: mounting /dev/mtdblock on run/initramfs/rw failed: No such file or directory
> 
> Mounting read-write /dev/mtdblock filesystem failed.  Please fix and run
> 	mount /dev/mtdblock run/initramfs/rw -t jffs2 -o rw
> to to continue, or do change nothing to run from RAM for this boot.
> Enter password to try to manually fix.
> After fixing run exit to continue this script, or reboot -f to retry, or
> touch /takeover and exit to become PID 1 allowing editing of this script.
> Give root password for system maintenance
> (or type Control-D for normal startup):
> 
> I searched and saw this feature discussion
> https://github.com/openbmc/openbmc/issues/3177
> which has a commit for uboot: Add support for ubi and mtd partitioning
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/5911
> It went in meta-phosphor/common/recipes-bsp/u-boot/files/ as a patch.
> https://github.com/openbmc/openbmc/commit/dd7015393fdab93426aab61a08b48a698c9c100d

Yes, you do need the patch above, along with few other patches. See my 
previous mail in this thread about the 'obmc-ubi-fs' distro feature. If 
this is enabled, the u-boot patches should be applied. This distro 
feature is enabled by including conf/distro/include/phosphor-ubi.inc.

> There is also this
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/10577

I'd have to check this one, but I'm certain you don't need this just to 
boot with ubifs.

> These are not in our code base.
> Do we need these patches?
> 
>>
>>> &fmc {
>>>        status = "okay";
>>>        flash@0 {
>>>                status = "okay";
>>>                m25p,fast-read;
>>>                label = "bmc";
>>> //#include "openbmc-flash-layout.dtsi"
>>>
>>>                partitions {
>>>                        #address-cells = < 1 >;
>>>                        #size-cells = < 1 >;
>>>                        compatible = "fixed-partitions";
>>>                        u-boot@0 {
>>>                                reg = < 0 0x60000 >;
>>>                                label = "u-boot";
>>>                        };
>>>                        u-boot-env@60000 {
>>>                                reg = < 0x60000 0x20000 >;
>>>                                label = "u-boot-env";
>>>                        };
>>>                        obmc-ubi@80000 {
>>>                                reg = <0x80000 0x7F80000>;
>>>                                label = "obmc-ubi";
>>>                        };
>>>                };
>>>        };
>>> };
>>>
>>>>
>>>>>> Does anyone know why the default is static partitions, and not ubifs?
>>>>>>
>>>>>> Regards,
>>>>>> Deepak
>>>>>>
>>>>>>> 2. In meta-myplatform/conf/machine/myplatform.conf, I added,
>>>>>>>
>>>>>>> IMAGE_FSTYPES += " mtd-ubi mtd-ubi-tar"
>>>>>>>
>>>>>>> OBMC_MACHINE_FEATURES += " obmc-ubi-fs"
>>>>>>>
>>>>>>> Do I miss anything?
>>>>>>>
>>>>>>> Thanks.
>>>>>>>
>>>>>>> Best regards,
>>>>>>>
>>>>>>> Kun Zhao
>>>>>>>
>>>>>>> /*
>>>>>>>
>>>>>>> zkxz@hotmail.com <mailto:zkxz@hotmail.com>
>>>>>>>
>>>>>>> */
>>>>>>>
>>>>>>
>>>>> Kun
>>>>>
>>>
> 

