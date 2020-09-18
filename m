Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AC726F5FF
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 08:39:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bt41G3hlKzDqV8
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 16:38:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hotmail.com (client-ip=40.92.10.37;
 helo=nam04-co1-obe.outbound.protection.outlook.com;
 envelope-from=zkxz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=HUIF69a6; 
 dkim-atps=neutral
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-oln040092010037.outbound.protection.outlook.com [40.92.10.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bt3zt4FfvzDqlm
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 16:37:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FC5tyU7U9UFMZHHQYgJhfkBOFCpIEqIxUHGgjIqNUWLySRZuTmdwCzSw6IzS4ZCvmJqkVyKiFKAhEvbyNP8zH4iIWK2GSSV2WGS/S+x3s3h3sI1TYn6olrwYeYk0oIJg7GD9rZVJPhWESGgsOGwYYtkrcC6JRA3GFrmCZOFTiM21kCdNoZfWxbWes//Hasl2uP6699tW5I3+CUPwByIiaLpfnyNahXjs2Rwf6ysHd5/mcsBpG9jU2we7Au6M3gOMt/9FMSJWfQqbM4CsbX+CIdWj88K0ksNOh/Vc3G8lC0810bVxG6P7j6Ev6ArSlRn6FnREpDSprvzx58RJD1JliA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dkdsnK6a8dPBw7A33MX8EZ48HTegpeewSTP8tzPI1Y=;
 b=cvNyr4eCCmQH32YBOzO+QucVg6ZsQuso5IHAKX7UElXp0A7HbCrWrZiXNVmVa/MqPdZkodbiFcff8va7FoF2A59xHcYLFnzY7AYnKiamc8eJUTNk+9zjnk63T5aUW60ywq144/BI3d8M8Hhiy4IIzOr27S+sfNf+Y12ue+VFbN1X5DMY28j+Frkz2+Qhv9tWcmFsBkYNG2MYyGcGMDSDuBQnMYgT8RvK6AfXXpkR+AE0rKKlwiloAgfZEPsIwnpgS/SqBg5XOtVf6mUS9ABdlQEqlNfj4wN2yQQ5szyNopzDL8N3Gme3Y5yKO85xyeK+Konqf8nxg26IeEMbrtDBGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dkdsnK6a8dPBw7A33MX8EZ48HTegpeewSTP8tzPI1Y=;
 b=HUIF69a6yG0pBsVZyx5mGnSK3XAmvMJFqPx5i6xawDhf6bfyKpjk4rtkXPKbuD/YtOKnPgUU7wi5iUGJ2kd2eM9z2UGlI/lnpN+8BIGT7mNlHFfpdu6r0GH2/4ofYaShXLOhzfwZVzglTGq0oYL4TJomxwlzcl81RXeTMOZlVsc2Eiw4U9PsHwt0a36VTGB2KvjDEAUJhoKva6Yll9Y1tqZJMAXYpiwLVyEveBwt997q/al3fD9uTVY6xegvFZMU2+ysFLARtB8ywP43O4mLk8MM72cPnH4ETR2mVXdaP86dZHlGi+AXMFDujtLKLkggTfIelp8I7JmurGj1rRsDPA==
Received: from BN3NAM04FT016.eop-NAM04.prod.protection.outlook.com
 (10.152.92.51) by BN3NAM04HT063.eop-NAM04.prod.protection.outlook.com
 (10.152.93.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Fri, 18 Sep
 2020 06:37:41 +0000
Received: from BYAPR14MB2342.namprd14.prod.outlook.com
 (2a01:111:e400:7e4e::42) by BN3NAM04FT016.mail.protection.outlook.com
 (2a01:111:e400:7e4e::161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15 via Frontend
 Transport; Fri, 18 Sep 2020 06:37:41 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:073EC6B884793D73D84DC4FFA696F9ECE083BF144090581FDC381312955BD710;
 UpperCasedChecksum:FD5BA66D7766B5FA2F81668874DAFBE6C0AEAC69BE2772498756366930BCE98B;
 SizeAsReceived:9177; Count:49
Received: from BYAPR14MB2342.namprd14.prod.outlook.com
 ([fe80::952a:28d1:bf4c:83a]) by BYAPR14MB2342.namprd14.prod.outlook.com
 ([fe80::952a:28d1:bf4c:83a%7]) with mapi id 15.20.3391.017; Fri, 18 Sep 2020
 06:37:41 +0000
Subject: Re: Enable UBI support for a platform
To: Adriana Kobylak <anoo@linux.ibm.com>,
 Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
References: <BYAPR14MB23426A9032F9FDAF87F1BC19CF2D0@BYAPR14MB2342.namprd14.prod.outlook.com>
 <242dee50-7e1b-3fc3-5105-ca33f288d959@linux.vnet.ibm.com>
 <BYAPR14MB2342A17C9B9BE853C0616E9CDC280@BYAPR14MB2342.namprd14.prod.outlook.com>
 <4e89c963-1ddd-2627-47c8-be13b903bc64@linux.vnet.ibm.com>
 <BYAPR14MB23426BE881262C70C81FFDAEDC200@BYAPR14MB2342.namprd14.prod.outlook.com>
 <b7c9296d-00a1-0137-ae67-4d2d24a6cfac@linux.vnet.ibm.com>
 <07d8dc67fb6a451151d77c035313c936@linux.vnet.ibm.com>
From: Kun Zhao <zkxz@hotmail.com>
Message-ID: <BYAPR14MB234246D31202193B89B1E713DC3F0@BYAPR14MB2342.namprd14.prod.outlook.com>
Date: Thu, 17 Sep 2020 23:37:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <07d8dc67fb6a451151d77c035313c936@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: BYAPR02CA0071.namprd02.prod.outlook.com
 (2603:10b6:a03:54::48) To BYAPR14MB2342.namprd14.prod.outlook.com
 (2603:10b6:a02:b8::22)
X-Microsoft-Original-Message-ID: <f025f088-13a9-cf5d-954e-3856c7f5a3a9@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.2.62.102] (216.228.112.21) by
 BYAPR02CA0071.namprd02.prod.outlook.com (2603:10b6:a03:54::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.13 via Frontend Transport; Fri, 18 Sep 2020 06:37:40 +0000
X-Microsoft-Original-Message-ID: <f025f088-13a9-cf5d-954e-3856c7f5a3a9@hotmail.com>
X-TMN: [yKO+LEo+l/f2LgTItHEuYL1wLiioC3HA]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 265aa28d-2b9f-44cd-45c4-08d85b9d5751
X-MS-TrafficTypeDiagnostic: BN3NAM04HT063:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O1RSTYU+k6hMiKdmmQj0Yqv5dj2T52+Q/3dyTMjTs/ghCOfcpXSGEgu+pLVDu49+f57S7L7OsLbEMJLzX1nqIVm1/RAeAzpMON2Dvdx4FX3M1G2mFvsuHSgcVAa8S7sr0v3YjcPXML8+yxhef6kyXl8nhKPGX1uNWuupiCIbPUK+r/f1bxvxro6yUm0yF3QvoarAcV60PtiNhDJbq79gFuaoduxg2mdXxVfN2fa/vix3ihuSb/Ruussl+Mx7LMpd
X-MS-Exchange-AntiSpam-MessageData: ryS6ghFD/kEmFf0mgBfmZpAA87deE5655UY7+MDjcSpF+3QS1qR83M9pnHW7op5zUHbIhWSeB25RIp5po7sAG2o3LNiLzaFNyvS/Rkm9TqrnVUrM0Pp1qc6+rBRZWq/GzHmYJdYhUmUaaI4vW7Cxbg==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 265aa28d-2b9f-44cd-45c4-08d85b9d5751
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2020 06:37:41.6526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: BN3NAM04FT016.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3NAM04HT063
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Adriana, Deepak,


On 9/16/20 1:05 PM, Adriana Kobylak wrote:
>
>>> |
>>> . done
>>> UBI init error 12
>>> Error, no UBI device/partition selected!
>>> Wrong Image Format for bootm command
>>> ERROR: can't get kernel image!
>>>
>>> Any thought?
>>
>> Some thoughts:
>>
>> - Have you validated your recipe and device tree changes by trying to
>> boot on QEMU an existing supported platform (for eg
>> Romulus/Tiogapass)?

Hi Deepak,

I've tried qemu with romuslus/tiogapass machine type, but still has the same problem. I'm using 2.9-dev branch latest code, does it matter?

>>
>> - I don't think not having the partitions for the alt side in your
>> devicetree should be a problem, unless the BMC is actually switching
>> to the secondary flash. 'md.l 0x1e785030 1' at the u-boot prompt can
>> tell us the boot side.
>>
>> Adriana - do you have any thoughts on this problem?
>>
>
> Check if you can list the ubi partitions from u-boot:
>
> ast# ubi part obmc-ubi
> ast# ubi info layout
>
> It should print some output like this:
>
> Volume information dump:
>         vol_id          0
> ...
>         name            kernel-3a859116
> Volume information dump:
>         vol_id          1
> ...
>         name            rofs-3a859116
>
>
> Check that the kernel name on that output is "kernel-3a859116" which is the value that your kernelname variable is set to, 

Hi Adriana,

Here is the output,

ast# ubi part obmc-ubi
ubi0: attaching mtd1
ubi0: scanning is finished
UBI init error 12
ast# ubi info layout
Error, no UBI device/partition selected!
ast# print kernelname
kernelname=kernel-a39b2d07
ast#

Seems ubi can't find any valid ubi partitions. What's the error 12?

> and also check that the rofs volume is in volume 1 since the root and ubiblock variables are set to (primary chip (0) volume 1 (ubiblock=0,1)).

And how to check rofs volume index?


BTW, Adriana, could you also take a look at this email thread https://lists.ozlabs.org/pipermail/openbmc/2020-September/022834.html? It was why I was going to enable ubifs but I'm not sure if ubifs can solve that problem.


Kun

