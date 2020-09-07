Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA371260509
	for <lists+openbmc@lfdr.de>; Mon,  7 Sep 2020 21:10:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BldCv3yRHzDqQg
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 05:10:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hotmail.com (client-ip=40.92.20.59;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=zkxz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=OwN295wX; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11olkn2059.outbound.protection.outlook.com [40.92.20.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BldBw1j0BzDqJc
 for <openbmc@lists.ozlabs.org>; Tue,  8 Sep 2020 05:09:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gFcZL9OQFV2d8TKFWHAthc6QDtoYNGlKmwpD7H2KkwM1Kt2jaF1hCeaHj8Xvjr/gViKuv6oUf/Ue1iseKpXmMrgEkJzpHEngiFX2w7t6d7LqUxhydQBgLSJRHTMq5r7UDw7F2hXqHmOvDjK1oON8tRWJLziZyevTB5u3bTaaRJgGOa5V9blE0NJrhXTOaQlPWaoHz74mzKix3gyModdh8UYU0CNrPXiYGJQB1MjE7bmkxwlVxI2HcV3BnaGmoedoIYo6wrs77nkuloIda1ceV8TaugM60VY9haSseKuRHoMZNTuNkqne7H+IUa+EMtSPpHwUE08loeK1R7AfreopBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDnW7zwLmByD/Vn2fJNakLEvM1wY62ZjNJ7oKrzFXME=;
 b=f2oHAg05lRSiNE4WfqbNeInX4X4yJy0+RkT2NAoLxr7gd9THRSiV3wyYcUJxfdl9unHbiydOaIJ7fKZ4LiClIVfH4UousnqBMbxzKm+ZGm0+O0mExlCUHWT0mBODxAscDaxF/cAOmc+C5rsmiCfszYmoS4J92d/EmC9AGf8+aJDIioxF5IzeoIVPxPulAobuEQrMfVVJYgxfZfYfsZaZL/27t1tjjTvOVH8ewkceGgVKAs3vMo3Z1n5T59/CyCyM3hhiHM37LBSc7wOhiUnHtNxliBQbl1XLT0awDE+GNG1jFHMrLBU2HrDNmHuL6xPClT5QZbqeiaoe2unxG2ElBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDnW7zwLmByD/Vn2fJNakLEvM1wY62ZjNJ7oKrzFXME=;
 b=OwN295wXeFdz0rFkV1KtVbMAT1VikQ+ZaqKSc77WXA/RaGc0CUVCFl0g6ijoVgFZ2T0ycXG7rr+r5KOMvG2kcRdKLElYl4IcVoDTie/LlJ6Bk5F/F8g4aNvh7QuV2xTJAbaQPTw6aDdj3q/YJaVTaeocVNU0JwfAnLrOAXKJ0Fo+KoEYJMNTOCrMANvXLeH0wxDrJmzPuxpqu+obUscULDR9RnBBJXzdiRlKO2bLGcJ+3PICJQbE7KffOz5V1G6hgawqE+5CxFDXV/etl+joF1AVsVjxgfggNFLHxLjkuufasXy7ZCCZ5Zc5MJlLhUKC3S7XgR0VxPyi7vem7yMKbQ==
Received: from DM6PR11CA0007.namprd11.prod.outlook.com (2603:10b6:5:190::20)
 by CH2PR13MB3446.namprd13.prod.outlook.com (2603:10b6:610:2b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.7; Mon, 7 Sep
 2020 19:09:52 +0000
Received: from DM6NAM10FT014.eop-nam10.prod.protection.outlook.com
 (2603:10b6:5:190:cafe::c8) by DM6PR11CA0007.outlook.office365.com
 (2603:10b6:5:190::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend
 Transport; Mon, 7 Sep 2020 19:09:52 +0000
Received: from BYAPR14MB2342.namprd14.prod.outlook.com
 (2a01:111:e400:7e86::50) by DM6NAM10FT014.mail.protection.outlook.com
 (2a01:111:e400:7e86::281) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16 via Frontend
 Transport; Mon, 7 Sep 2020 19:09:52 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:CBBF21A61F9B2A7C18F00285D307E5DF617E5B1850AE9D364EC2B7B98E30581C;
 UpperCasedChecksum:8B9821807BA799B86F9A21038105C5749DA8B5D7D3980667D803FD223C3E19EF;
 SizeAsReceived:8819; Count:48
Received: from BYAPR14MB2342.namprd14.prod.outlook.com
 ([fe80::952a:28d1:bf4c:83a]) by BYAPR14MB2342.namprd14.prod.outlook.com
 ([fe80::952a:28d1:bf4c:83a%7]) with mapi id 15.20.3348.019; Mon, 7 Sep 2020
 19:09:52 +0000
Subject: Re: Enable UBI support for a platform
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <BYAPR14MB23426A9032F9FDAF87F1BC19CF2D0@BYAPR14MB2342.namprd14.prod.outlook.com>
 <242dee50-7e1b-3fc3-5105-ca33f288d959@linux.vnet.ibm.com>
From: Kun Zhao <zkxz@hotmail.com>
Message-ID: <BYAPR14MB2342A17C9B9BE853C0616E9CDC280@BYAPR14MB2342.namprd14.prod.outlook.com>
Date: Mon, 7 Sep 2020 12:09:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <242dee50-7e1b-3fc3-5105-ca33f288d959@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: BY3PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:254::10) To BYAPR14MB2342.namprd14.prod.outlook.com
 (2603:10b6:a02:b8::22)
X-Microsoft-Original-Message-ID: <03226cee-ef61-2d18-df4b-f1b351104da9@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.2.59.130] (216.228.112.21) by
 BY3PR05CA0005.namprd05.prod.outlook.com (2603:10b6:a03:254::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.9 via Frontend
 Transport; Mon, 7 Sep 2020 19:09:51 +0000
X-Microsoft-Original-Message-ID: <03226cee-ef61-2d18-df4b-f1b351104da9@hotmail.com>
X-TMN: [G3UtNZFaE+STgJRm6Eav9MsGu1gqHnWu]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 26db331a-f5f6-4698-8593-08d85361992a
X-MS-TrafficTypeDiagnostic: CH2PR13MB3446:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R+NRzoiqZzm0fjJc8/uYLQg7ZHhTxIboTB2VxXePJlG2+miGsLhG+5vHTH7x/UHzMI09wxQpgE8mXUbQv4tW/bQYIvBFowzqOA3f7AUIN0l+/L1LyJzoPmsjiLjt0tfyTle2yv5mKPImQtD6rcseqCOD9XYEiiwhY/JOXQZCdZCUkueSXkkXvIEve66CBFgL5bw2cK13se9ZktxdGyd6Xg==
X-MS-Exchange-AntiSpam-MessageData: CXYC8r23Quw+rJcocPD2FsIo+ZFSUlKt11A1Vvr6U/M4hb1gWu9TjarYXIv8T7YHxjBfx7fjtsISR/HB/GEB9lsvooWLjVHCZPW1VFxrjRGZzSgzIF0Tuo1zPC4SJVnemkOFEpRBe0eRcOe9Oc28BA==
X-OriginatorOrg: sct-15-20-3174-8-msonline-outlook-32ef5.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 26db331a-f5f6-4698-8593-08d85361992a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2020 19:09:52.4826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM10FT014.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3446
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


On 9/5/20 5:49 AM, Deepak Kodihalli wrote:
> Hi Kun,
>
> On 05/09/20 5:32 am, Kun Zhao wrote:
>> Hi Team,
>>
>> My platform is based on ast2500, and I’ve already been able to built out the ubi image. But when I tried to test it with qemu, it just stopped at u-boot because ‘can’t get kernel image,
>>
>> qemu-system-arm: Aspeed iBT has no chardev backend
>>
>> U-Boot 2016.07 (Sep 04 2020 - 19:47:48 +0000)
>>
>>         Watchdog enabled
>>
>> DRAM:  496 MiB
>>
>> Flash: 32 MiB
>>
>> *** Warning - bad CRC, using default environment
>>
>> In:    serial
>>
>> Out:   serial
>>
>> Err:   serial
>>
>> Net:   MAC0 : RGMII
>>
>> MAC1 : RGMII
>>
>> FTGMAC100#0
>>
>> Error: FTGMAC100#0 address not set.
>>
>> , FTGMAC100#1
>>
>> Error: FTGMAC100#1 address not set.
>>
>> Hit any key to stop autoboot:  0
>>
>> Wrong Image Format for bootm command
>>
>> ERROR: can't get kernel image!
>>
>> ast#
>>
>> And I found the bootargs is not right,
>>
>> ast# print
>>
>> baudrate=115200
>>
>> bootargs=console=ttyS4,115200n8 root=/dev/ram rw
>>
>> bootcmd=bootm 20080000
>>
>> bootdelay=2
>>
>> Checked in the build folder for tmp/work/myplatform-openbmc-linux-gnueabi/u-boot-aspeed/1_v2016.07+gitAUTOINC+1ded9fa3a2-r0/ and found the none of the following patches are there,
>>
>> 0002-config-ast-common-hack-bootopts.patch
>>
>> 0003-config-ast-common-Add-bootopts-to-support-ubi-and-mt.patch
>>
>> 0004-config-ast-common-Add-conditional-factory-reset-comm.patch
>>
>> 0005-config-ast-common-Fall-back-to-secondary-flash-on-fa.patch
>>
>> I think that’s why the bootargs is not correct.
>>
>> This is the details of how I enabled the ubi support in my platform recipes,
>>
>> 1. In meta-myplatform/conf/distro/openbmc-myplatform.conf, I added,
>>
>> require conf/distro/include/phosphor-base.inc
>>
>> require conf/distro/include/phosphor-ubi.inc
>
> You should just need the one line above, plus a device tree change for your system. The default openbmc-flash-layout.dtsi doesn't make a ubifs partition. You can for eg look at witherspoon's dts, which uses ubifs.
Hi Deepak, thank you for reply. I've tried to use the witherspoon's flash layout per your tips here. But it still stops at u-boot with "can't get kernel image!" error. Do I need to enable any kernel config options?
>
> Does anyone know why the default is static partitions, and not ubifs?
>
> Regards,
> Deepak
>
>> 2. In meta-myplatform/conf/machine/myplatform.conf, I added,
>>
>> IMAGE_FSTYPES += " mtd-ubi mtd-ubi-tar"
>>
>> OBMC_MACHINE_FEATURES += " obmc-ubi-fs"
>>
>> Do I miss anything?
>>
>> Thanks.
>>
>> Best regards,
>>
>> Kun Zhao
>>
>> /*
>>
>> zkxz@hotmail.com <mailto:zkxz@hotmail.com>
>>
>> */
>>
>
Kun
