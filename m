Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D93269AE7
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 03:12:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Br4vm5SKgzDqRY
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 11:12:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hotmail.com (client-ip=40.92.41.92;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=zkxz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=n4sajlD5; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10olkn2092.outbound.protection.outlook.com [40.92.41.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Br4tr70S7zDqNs
 for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2020 11:11:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2Abvs80Yhz4OXd1/OZclgkibu6nY32iXC2Xu9BJB4QjBvRYLAalLchcwx8MqrujoERR7/BHF9roMWuE9lsNLicQzPhbh4EDi94+S+psjm5ScrtGZw0ArDiyqWgGwkMox5sVUG8F+FMUM7GUeNAGrseH2MBn2n1fLNSpN270AH5wUU+p8ANN4wrJ2HnrD6wgiT81Ts1XxarwA8JfeOsLAXL2+YfXirHzgJ77WxShKbcR9agTcrmcL5+iGx9Jrl/UQKpfGERuVpuSqkVd3DjQQmRraN9aKV7kv0qMVZ4yyl2gGqUVcZvytRanL9L8c+r1aia27KrxpsueFpwNIRxmlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVgP/kLbP7UmTxNZEMU+wt7lUkO9Ny0xiibRFf7H3hA=;
 b=YoO/WEm7cQt8QFdy2UijGBuTsRNes25mPbTlXIkR+OrZVFkbC5U8/3hwDkBW4g4rADIKs2vj6A1P++DyB70T0+u9uH0KTfcrwAcN+vyEgsBf8N7O5ieNY3lgQ6GJgMi5IeEO8y0VbrydreGJjNaTh6D2EDlzr/FNPa727FrHdG58gw0zElo6+b+IcAZ/HZVzramCUzqh+g79zsoH5614PqfQVg2p/LNkVjMqYcxzdG5Cs/806mATx8WzrRkDZ7ix3uJWiAbk3plTJshp2fJjt/I9BpJonr6xOgVtu/UPFpDck6Dq2PSqW9FF3pOAXXQsBM3u/GgvHSBiAqC1OL3vpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVgP/kLbP7UmTxNZEMU+wt7lUkO9Ny0xiibRFf7H3hA=;
 b=n4sajlD59dEUuGRVqDhQbNGQ+qjOeRfoLgCWA5Ak0YEV/6z72ZQbuksy9DGg6FadD7II523uQ971ZuJTlNw0EsvrrPHzfP0evJnt0Xg0iPFN5wRImL5iyg7TIsHkF3yYf2iLP/w/gYrGft+8iJB15jtsCYuf/wzwhqu6RBExumZIjl3BI7W4JBt4/FRdBti+wcjRbJE5uWwOzHGK6LT/4pxzPHdkJowv3rbRyyAAWkQwdk6KrSCKy2v91n6dTsUoREe2hpfR3hmRjfsSumZyZ6nsNMDPUOYJSjXf1/083JjACL8zFI4qBfsbF1MUJ5ntoUgOLsFLVNlEgNF5jQEVDQ==
Received: from BN7NAM10FT048.eop-nam10.prod.protection.outlook.com
 (2a01:111:e400:7e8f::49) by
 BN7NAM10HT072.eop-nam10.prod.protection.outlook.com (2a01:111:e400:7e8f::224)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 15 Sep
 2020 01:11:26 +0000
Received: from BYAPR14MB2342.namprd14.prod.outlook.com
 (2a01:111:e400:7e8f::40) by BN7NAM10FT048.mail.protection.outlook.com
 (2a01:111:e400:7e8f::199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Tue, 15 Sep 2020 01:11:26 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:9332A1A851177BF9EBEC149490861B79AC2D9D72358B6826DCBF525713B48A63;
 UpperCasedChecksum:06C2FB80368564E3EDFDC8B0D80F34A9A17401A89F70D8A9DB782059BADA76C6;
 SizeAsReceived:3717; Count:47
Received: from BYAPR14MB2342.namprd14.prod.outlook.com
 ([fe80::952a:28d1:bf4c:83a]) by BYAPR14MB2342.namprd14.prod.outlook.com
 ([fe80::952a:28d1:bf4c:83a%7]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 01:11:26 +0000
Subject: Re: Enable UBI support for a platform
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <BYAPR14MB23426A9032F9FDAF87F1BC19CF2D0@BYAPR14MB2342.namprd14.prod.outlook.com>
 <242dee50-7e1b-3fc3-5105-ca33f288d959@linux.vnet.ibm.com>
 <BYAPR14MB2342A17C9B9BE853C0616E9CDC280@BYAPR14MB2342.namprd14.prod.outlook.com>
 <4e89c963-1ddd-2627-47c8-be13b903bc64@linux.vnet.ibm.com>
From: Kun Zhao <zkxz@hotmail.com>
Message-ID: <BYAPR14MB23426BE881262C70C81FFDAEDC200@BYAPR14MB2342.namprd14.prod.outlook.com>
Date: Mon, 14 Sep 2020 18:11:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <4e89c963-1ddd-2627-47c8-be13b903bc64@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: BY5PR16CA0005.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::18) To BYAPR14MB2342.namprd14.prod.outlook.com
 (2603:10b6:a02:b8::22)
X-Microsoft-Original-Message-ID: <06d9ffe2-d359-4c71-9e1c-06528725dea9@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.2.61.189] (216.228.112.22) by
 BY5PR16CA0005.namprd16.prod.outlook.com (2603:10b6:a03:1a0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Tue, 15 Sep 2020 01:11:26 +0000
X-Microsoft-Original-Message-ID: <06d9ffe2-d359-4c71-9e1c-06528725dea9@hotmail.com>
X-TMN: [ef3uQ5nv8cqGH42jxSKvTqu82G1/SS8E]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 029b113c-de93-48ce-151f-08d85914451c
X-MS-TrafficTypeDiagnostic: BN7NAM10HT072:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SuCjdhd9ItzN2oNoq+XRxoLuov/uEgOdmoSxf8xeKeLeH04mFfh+OxadFzpyptGAy6th+6nWJiokue7PLkyNtBs5M16Mx+ABmOWZzigNgOB/GOWaMLl2bFsbX1mgATdrCpK3HrtMApMntqWGkjWa7LmLBFmqGUlY2wUmn5lHggMkwmx3wye3MU2ORoxPSBy8
X-MS-Exchange-AntiSpam-MessageData: XPyYC6pBnP04OPngPxuiDfbBYOfiTOJ+Q6Gf+cLeJVKNAV1Ae7Akevc+rV4FOdqLmZckXqCkMSNbGvM9F063fulQksN5GdyDMJc1GKI9nuO+3LnBJ7vrwT9b5WOYdXaz8eHstO1e6g0KpNWCut0deQ==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 029b113c-de93-48ce-151f-08d85914451c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 01:11:26.7650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: BN7NAM10FT048.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7NAM10HT072
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


On 9/8/20 8:26 AM, Deepak Kodihalli wrote:
> On 08/09/20 12:39 am, Kun Zhao wrote:
>>
>> On 9/5/20 5:49 AM, Deepak Kodihalli wrote:
>>> Hi Kun,
>>>
>>> On 05/09/20 5:32 am, Kun Zhao wrote:
>>>> Hi Team,
>>>>
>>>> My platform is based on ast2500, and I’ve already been able to built out the ubi image. But when I tried to test it with qemu, it just stopped at u-boot because ‘can’t get kernel image,
>>>>
>>>> qemu-system-arm: Aspeed iBT has no chardev backend
>>>>
>>>> U-Boot 2016.07 (Sep 04 2020 - 19:47:48 +0000)
>>>>
>>>>          Watchdog enabled
>>>>
>>>> DRAM:  496 MiB
>>>>
>>>> Flash: 32 MiB
>>>>
>>>> *** Warning - bad CRC, using default environment
>>>>
>>>> In:    serial
>>>>
>>>> Out:   serial
>>>>
>>>> Err:   serial
>>>>
>>>> Net:   MAC0 : RGMII
>>>>
>>>> MAC1 : RGMII
>>>>
>>>> FTGMAC100#0
>>>>
>>>> Error: FTGMAC100#0 address not set.
>>>>
>>>> , FTGMAC100#1
>>>>
>>>> Error: FTGMAC100#1 address not set.
>>>>
>>>> Hit any key to stop autoboot:  0
>>>>
>>>> Wrong Image Format for bootm command
>>>>
>>>> ERROR: can't get kernel image!
>>>>
>>>> ast#
>>>>
>>>> And I found the bootargs is not right,
>>>>
>>>> ast# print
>>>>
>>>> baudrate=115200
>>>>
>>>> bootargs=console=ttyS4,115200n8 root=/dev/ram rw
>>>>
>>>> bootcmd=bootm 20080000
>>>>
>>>> bootdelay=2
>>>>
>>>> Checked in the build folder for tmp/work/myplatform-openbmc-linux-gnueabi/u-boot-aspeed/1_v2016.07+gitAUTOINC+1ded9fa3a2-r0/ and found the none of the following patches are there,
>>>>
>>>> 0002-config-ast-common-hack-bootopts.patch
>>>>
>>>> 0003-config-ast-common-Add-bootopts-to-support-ubi-and-mt.patch
>>>>
>>>> 0004-config-ast-common-Add-conditional-factory-reset-comm.patch
>>>>
>>>> 0005-config-ast-common-Fall-back-to-secondary-flash-on-fa.patch
>>>>
>>>> I think that’s why the bootargs is not correct.
>>>>
>>>> This is the details of how I enabled the ubi support in my platform recipes,
>>>>
>>>> 1. In meta-myplatform/conf/distro/openbmc-myplatform.conf, I added,
>>>>
>>>> require conf/distro/include/phosphor-base.inc
>>>>
>>>> require conf/distro/include/phosphor-ubi.inc
>>>
>>> You should just need the one line above, plus a device tree change for your system. The default openbmc-flash-layout.dtsi doesn't make a ubifs partition. You can for eg look at witherspoon's dts, which uses ubifs.
>> Hi Deepak, thank you for reply. I've tried to use the witherspoon's flash layout per your tips here. But it still stops at u-boot with "can't get kernel image!" error. Do I need to enable any kernel config options?
>
>
> Hi Kun, I don't think you need additional kernel config updates. I suspect something wrong with the way the image is built. Are you able to see expected values for the u-boot environment variables and MTD partitions? For eg:
>
> ast# mtdparts
> device nor0 <bmc>, # parts = 3
>  #: name        size        offset        mask_flags
>  0: u-boot              0x00060000    0x00000000    0
>  1: u-boot-env          0x00020000    0x00060000    0
>  2: obmc-ubi            0x01f80000    0x00080000    0
> active partition: nor0,0 - (u-boot) 0x00060000 @ 0x00000000
>
Hi Deepak,

Sorry for late response. I've figured out the reason why my u-boot didn't apply those patches for ubi support, that is meta-myplatform/conf/distro/openbmc-myplatform.conf wasn't parsed. When I add this line,

require conf/distro/include/phosphor-ubi.inc

directly into meta-myplatform/conf/machine/myplatform.conf, I see the u-boot supporting ubi, mtdparts cmds. The output for mtdparts is,

ast# mtdparts

device nor0 <bmc>, # parts = 3
 #: name                size            offset          mask_flags
 0: u-boot              0x00060000      0x00000000      0
 1: u-boot-env          0x00020000      0x00060000      0
 2: obmc-ubi            0x01f80000      0x00080000      0

active partition: nor0,0 - (u-boot) 0x00060000 @ 0x00000000

defaults:
mtdids  : nor0=bmc
mtdparts: mtdparts=bmc:384k(u-boot),128k(u-boot-env),-(obmc-ubi)


And I do see u-boot trying to discover ubi partitions during normal booting, but it still failed on,

. done
|
. done
|
. done
|
. done
|
. done
|
. done
|
. done
UBI init error 12
Error, no UBI device/partition selected!
Wrong Image Format for bootm command
ERROR: can't get kernel image!

Any thought?


The u-boot env is,

ast# print
baudrate=115200
bootalt=run wdt2bite
bootargs=console=ttyS4,115200n8 ubi.mtd=obmc-ubi,0,0,0 ubi.mtd=alt-obmc-ubi,0,0,4 ro rootfstype=squashfs
bootcmd=run set_bootargs; run obmc_bootcmd
bootdelay=2
do_rwreset=if test "${rwreset}" = "true"; then ubi remove rwfs; ubi create rwfs ${rwfs_size}; fi
ethact=FTGMAC100#0
kernelname=kernel-3a859116
loadaddr=80800000
mtddevname=u-boot
mtddevnum=0
mtdids=nor0=bmc
mtdparts=mtdparts=bmc:384k(u-boot),128k(u-boot-env),-(obmc-ubi)
obmc_bootcmd=ubi part obmc-ubi; run do_rwreset; ubi read ${loadaddr} ${kernelname}; bootm ${loadaddr} || run bootalt
partition=nor0,0
root=/dev/ubiblock0_1
rwfs_size=0x600000
set_bootargs=setenv bootargs console=ttyS4,115200n8 ubi.mtd=obmc-ubi,0,0,0 ubi.mtd=alt-obmc-ubi,0,0,4 ro rootfstype=squashfs ubi.block=${ubiblock} root=${root}
spi_dma=yes
stderr=serial
stdin=serial
stdout=serial
ubiblock=0,1
verify=yes
wdt2bite=mw.l 0x1e785024 0xa 1; mw.b 0x1e78502c 0xb3 1Environment size: 994/65531 bytes

BTW, I don't have an alt-obmc-ubi on the system.

>
>>> Does anyone know why the default is static partitions, and not ubifs?
>>>
>>> Regards,
>>> Deepak
>>>
>>>> 2. In meta-myplatform/conf/machine/myplatform.conf, I added,
>>>>
>>>> IMAGE_FSTYPES += " mtd-ubi mtd-ubi-tar"
>>>>
>>>> OBMC_MACHINE_FEATURES += " obmc-ubi-fs"
>>>>
>>>> Do I miss anything?
>>>>
>>>> Thanks.
>>>>
>>>> Best regards,
>>>>
>>>> Kun Zhao
>>>>
>>>> /*
>>>>
>>>> zkxz@hotmail.com <mailto:zkxz@hotmail.com>
>>>>
>>>> */
>>>>
>>>
>> Kun
>>
>
Kun
