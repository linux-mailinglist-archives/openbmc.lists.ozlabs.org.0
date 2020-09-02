Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8E425B693
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 00:47:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhfFx65fGzDqCM
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 08:47:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hotmail.com (client-ip=40.92.47.55;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=zkxz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=RxYLqaW4; 
 dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08olkn2055.outbound.protection.outlook.com [40.92.47.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhfF92mK8zDqxf
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 08:46:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NiGfn+2FCI0eARFdnexEg76TJc6glNj8G+yNdC5tO30+OFgcy/+QjLTfbvA1dOuUJspzGjUwsp668/QRikEHRgtmpP3J+bOLrf3brC2s7RVPH+DHBz0XlC8eQgKZytHGHSTlDW4mdfiAld4ptUw7jPpIdonGMmpEVgUr5I4t5VmsxY/SGA3AeDVCD0j+d3M8fr23TmpJ/T/HLZjX7h8BRYHXtco8zD9hFCZz/oZYgvUOZdzUXow1VexVDy0pB5Dstn0141hdby7RtQm5yaM0uX6whDEZzp2DUd8zpidqZa5g1/whFLu1TnQHAJmk/aTNfRLpPqmabuMy9/AX1Mkj1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nutzmoDyCRpmjE3BLqWBs4ai42KOeAtTltSvmdCqwZc=;
 b=ZZsFfrI4hYzPyqmYqnBZKWnSVAU0tGdft3BhXUvzlVqeIL1QqNJQg2hVBpd097EtTIaDRXDGuS/6htMvofrJr+SipxQ6/2sLNfKxJWQRHFzECEkDVS8684Rkx74TnJNM4nDDCqhGMOXKcEuL2KSrILsMJcCEUaXr3pljAvPOYKYcp+JD01XeXLDAP2qHo/lj4JlKX+aOStBsJlG2WUA/YlUAtZStOnJP4K9vUD6SDRcJc/UQrtJDgAHVFcV5/6AF9rUfq7syVsZ59UOclT4eF0t37xII9WIzNjIHRyCOiG5Hxy4BbIiyyM7T17Ik8Sg9yFOKO7vWLCpUxRbDwvUtQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nutzmoDyCRpmjE3BLqWBs4ai42KOeAtTltSvmdCqwZc=;
 b=RxYLqaW4fAbBzxTQIeKwOV00SC7nFkpaHi7+ngqWpoGQwZmq11htRYw3Mv8pKSnAgAGy3eyMWJgnvGwKA9tzuQIRAg2r5WGD53vHnV7AJaNCrrLIqxMzHYYZP/WrT5mBBcpAijKH3gzh0YW3Bx/vx+XW5ZbqG9jdi2cKpQ4gprqXbSzA77s2WfFgFFZD1/Bn/kFkvU3bUWYogwLYDnN/2CLkV38Fkz5VR6h1y6ECfWj0ZDrhbBAgznNhKxE1+j1oXnkIPAg6A7VY0vfe17xP2k7h0eT3bxTwwGw5+R9nr3Pu7I+Hndm0Mw4gHsK4eQuAOAZq0dbiJBN8fKqHBrFR8A==
Received: from BN8NAM04FT010.eop-NAM04.prod.protection.outlook.com
 (2a01:111:e400:7e85::48) by
 BN8NAM04HT152.eop-NAM04.prod.protection.outlook.com (2a01:111:e400:7e85::377)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Wed, 2 Sep
 2020 22:46:30 +0000
Received: from BYAPR14MB2342.namprd14.prod.outlook.com
 (2a01:111:e400:7e85::52) by BN8NAM04FT010.mail.protection.outlook.com
 (2a01:111:e400:7e85::441) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Wed, 2 Sep 2020 22:46:30 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:A81287FB72929A1FA268B503061114E475ABA8B1DCFC5B5F86B2019D8DBB0F81;
 UpperCasedChecksum:6F1409A2C50E663C0208A6960DB515DB0B319BEE190249A0B3CD414523135F7B;
 SizeAsReceived:8764; Count:49
Received: from BYAPR14MB2342.namprd14.prod.outlook.com
 ([fe80::952a:28d1:bf4c:83a]) by BYAPR14MB2342.namprd14.prod.outlook.com
 ([fe80::952a:28d1:bf4c:83a%7]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 22:46:30 +0000
Subject: Re: SQUASHFS errors and OpenBMC hang
To: Patrick Williams <patrick@stwcx.xyz>
References: <BYAPR14MB2342C9C346B57B87F44E3200CF530@BYAPR14MB2342.namprd14.prod.outlook.com>
 <20200901123506.GR3532@heinlein>
From: Kun Zhao <zkxz@hotmail.com>
Message-ID: <BYAPR14MB23422439E57DB5A5235FD5E8DC2F0@BYAPR14MB2342.namprd14.prod.outlook.com>
Date: Wed, 2 Sep 2020 15:46:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <20200901123506.GR3532@heinlein>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: BY3PR10CA0011.namprd10.prod.outlook.com
 (2603:10b6:a03:255::16) To BYAPR14MB2342.namprd14.prod.outlook.com
 (2603:10b6:a02:b8::22)
X-Microsoft-Original-Message-ID: <0e506438-f334-f517-a289-09eb5c69bd8a@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 BY3PR10CA0011.namprd10.prod.outlook.com (2603:10b6:a03:255::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend
 Transport; Wed, 2 Sep 2020 22:46:28 +0000
X-Microsoft-Original-Message-ID: <0e506438-f334-f517-a289-09eb5c69bd8a@hotmail.com>
X-TMN: [uiKInx6msR4j+3VTJDGhxZHyPG7UnEZ1]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 27dfcc76-3746-4b82-7bad-08d84f9207ee
X-MS-TrafficTypeDiagnostic: BN8NAM04HT152:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W+C0T+DHaVv6sGZsJe+has0X1Bes9Ujn/LY/N7XXHGjFoGXiWATlNB6NHgwX8h8GeDj9CBYpdgaRdpoT1dzaf3YAEgrfKzRcbKijFGSgkGAJvjoZvLOcmuY5mSoq07z3PlY6fHJlPur4BJVrp78+v5HHBMmTdkGxtU+pZh531QwYlDi2ZwL0yJm21dHx3t7Htr2ep+OXM63sbAc75l408w==
X-MS-Exchange-AntiSpam-MessageData: WePnarWUy8Z954+InuBhIVnDHMRXP4rUzMBTtm7IyEfQm54tI/6BslCTkr47c+mLw9gwJKyGe1HTPgfQSAmWngOMc2oINcVMxedGqAlZE8h2AtIUD+QPPSjnPiq47aUSnrnWhLAO4/uzgSUHmkTK8w==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27dfcc76-3746-4b82-7bad-08d84f9207ee
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 22:46:30.7574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM04FT010.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8NAM04HT152
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


On 9/1/20 5:35 AM, Patrick Williams wrote:
> On Sat, Aug 29, 2020 at 12:40:31AM +0000, Kun Zhao wrote:
>> Hi Team,
>>
>> I’m working on validating OpenBMC on our POC system for a while, but starting from 2 weeks ago, the BMC filesystem sometimes report failures, and after that sometimes the BMC will hang after running for a while. It started to happen on one system and then on another. Tried to use programmer to re-flash, still see this issue. Tried to flash back to the very first known good OpenBMC image we built, still see the same symptoms. It seems like a SPI ROM failure. But when flash back the POC system original 3rd-party BMC, no such issue at all. Not sure if anyone ever met similar issues before?
> Yeah, this does look like a bad SPI NOR. 
Thank you, Patrick for the comments. I think so. But my only confusion is about the POC system original 3rd-party BMC doesn't have any issue, it also uses jffs2.
>  Have you tried flashing on a
> fresh image to the NOR and then reading it back to confirm all the bits
> keep their values?  It is possible that the corruption is hitting the
> other BMC code in a less-important location.

I doubted that, too. So I tried to burn my image to the NOR, boot it, and then read it back. But the only differences are there are contents in u-boot-env and rwfs partitions in the read-back image that is as expected, and no any data overflowed crossing any partition boundaries there either.

I also tried to move rofs/rwfs positions, change their sizes bigger/smaller, reduce kernel partition size, making 64KB neutral zones between them. But none of them improves the case.

>
>> [ 3.372932] jffs2: notice: (78) jffs2_get_inode_nodes: Node header CRC failed at 0x3e0aa4. {1985,e002,0000004a,78280c2e}
> I'm surprised to see anyone using jffs2.  Don't we generally use ubifs
> in OpenBMC?  Is there a reason you've chosen to use jffs2?
I just uses the default settings based on ast2500-evb for our POC. But thanks for the hint. I'm trying to enable ubifs now.
>
> I don't necessarily think jffs2 will be better or worse in this
> particular scenario but we've seen lots of upgrade issues over the years
> with jffs2.
>
>> BMC debug console shows the same SQUASHFS error as above, by checking filesystem usage we could see rwfs usage keep increasing like this,
>>
>> root@dgx:~# df
>> Filesystem 1K-blocks Used Available Use% Mounted on
>> dev 212904 0 212904 0% /dev
>> tmpfs 246728 20172 226556 8% /run
>> /dev/mtdblock4 22656 22656 0 100% /run/initramfs/ro
>> /dev/mtdblock5 4096 880 3216 21% /run/initramfs/rw
>> cow 4096 880 3216 21% /
>> tmpfs 246728 8 246720 0% /dev/shm
>> tmpfs 246728 0 246728 0% /sys/fs/cgroup
>> tmpfs 246728 0 246728 0% /tmp
>> tmpfs 246728 8 246720 0% /var/volatile
>>
>> and can see more and more ipmid coredump files,
> This implies to me that we need to adjust the systemd recovery for
> ipmid.  We shouldn't just keep re-launching the same process over and
> over after a coredump.  Systemd has some thresholding capability.
Can I disable the coredump for ipmid?
>> I found the following actions could trigger this failure,
>>
>>
>>   1.  do SSH login to BMC debug console remotely, it will show this error when triggered,
>> $ ssh root@<bmc ip>
>> ssh_exchange_identification: read: Connection reset by peer
>>
>>
>>   1.  set BMC MAC address by fw_setenv in BMC debug console, reboot BMC, and do 'ip -a'.
> I have no idea why this procedure would solve SPI NOR issues.  It
> doesn't seem connected on the surface.
Not to solve the issues, they can trigger the errors to be printed on BMC debug console. I think the reason is some files on rwfs or u-boot-env will be read/write when we do them.
>> The code is based on upstream commit 5ddb5fa99ec259 on master branch.
>> The flash layout definition is the default openbmc-flash-layout.dtsi.
>> The SPI ROM is Macronix MX25L25635F
>>
>> Some questions,
>>
>>   1.  Any SPI lock feature enabled in OpenBMC?
>>   2.  If yes, do I have to unlock u-boot-env partition before fw_setenv?
> There is not, to my knowledge, a software SPI lock.  Some machines have
> a 'golden' NOR which they enable by, in hardware, setting the
> write-protect input pin on the SPI NOR (with a strapping resistor).
> Does your machine do this mechanism?  If so, it is possible that you're
> booting onto the 'wrong' NOR flash in some conditions and a reboot
> resets the chip-select logic in the SPI controller.  (Usually, you have
> the watchdog configured to automatically swap the chip-select after some
> number of boot failures.)
>
No, we have only one NOR flash in the system. The SPI lock feature, I mean, is the NOR flash chip SW Block Protection functions which can enable/disable write-protect for particular blocks for BMC code, not the HW W/P pin.
