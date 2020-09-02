Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3EF25B6CA
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 00:57:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhfTj6P93zDr1g
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 08:57:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hotmail.com (client-ip=40.92.40.91;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=zkxz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=XDJ9qNb/; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10olkn2091.outbound.protection.outlook.com [40.92.40.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhfSw6z42zDqyB
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 08:56:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAz2iEvBCFhinbgz35GQ8L9dqbSZ/vsSlf7yk0mixdfwfn35iJwNMWyfhl2DwCzx8EKzN7uUUuTGjiKCOVMlwx3j+PpJ0R1GWbUGQlVJ03vk3RUwXw9X1v19ztxnI2H/cdLi3MiCjvzcpVoPelmXnQMFyv2FKo7J4NP7hRR/N3owA7mLqh6p4L7NWlAZUzaqYBp2I7NAswCao7WWBlUraRUrnrp998UaBCPV14P6d+oGFa9XBK+nJgZ4wYY6jR68tZr/9D5NO3gh4ztZp5EiGoN2WObhUqrJHuRAV4/yJsFZ2K1Z8QBTRgDgTHMG6vMlqXsaH/ISad5jsQ5Hy1W7VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vaewWh8iB8m3EHa1EgpN3+0dxb0AIvxAJbuL5OdUHQ=;
 b=jy/WnCeUp27P+w53aSzFna86gOBXifn+loGx6ZUvnwar4AkxIcQV0XEI+Mre9U99CsLUMP9ogbD+dysFpn+1zMAbVh+9KqY0uf191E4X3qX9seT5s0Cwp0bgKD87SPNfDhS8Ur8INK3VbI+Q0TlKQKkADGUfwORlLfEnIBSthEB2AKwLGCugYWRGfHZ4g3L6lxBcbYb0vzsUAM/wiXFbbxlib7kxj4j/4TR1xVdv8/zWpSXN6K/yNffkuW420xX7zNx/+z/PUHKAxxz6gTtBdqG9c33UgwOAxSxRZ48lN23/3cNRswShEr+QUJIt25J7PWXgnlN4hjfDbZJRPcmHQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vaewWh8iB8m3EHa1EgpN3+0dxb0AIvxAJbuL5OdUHQ=;
 b=XDJ9qNb/5Ddg0Z/Gon/NMGd4oEcfap9u2uKM2a6lI4up6WltyR++dic8kdSr6pw0/4JBXWQ2mDbX+ROeGA9ouL7PheWO5NI23nh5CDyR8MCQVN+yYNR9WJACYnex6F4EHOt+3pKD/TW50JUtMI9W/0IQabt270vU6zkx7RSEcUnDhfGCoBRmkcCgKSVoZFL+VHHh/YR2xKyBtJ0U1ePgT05r1oj7jva4gQ0EqOL25IE5QoobDXXYfp3cxg62GtXdSm56ezKwXPmZq4yzC4V7yF2tiHvstHwRxxvqRq7PsD2W5hT6+pUr0rzMiW1/w09XctRsGyJXL84EoEK/vIr8kQ==
Received: from DM6NAM10FT059.eop-nam10.prod.protection.outlook.com
 (2a01:111:e400:7e86::4c) by
 DM6NAM10HT009.eop-nam10.prod.protection.outlook.com (2a01:111:e400:7e86::212)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Wed, 2 Sep
 2020 22:56:36 +0000
Received: from BYAPR14MB2342.namprd14.prod.outlook.com
 (2a01:111:e400:7e86::45) by DM6NAM10FT059.mail.protection.outlook.com
 (2a01:111:e400:7e86::327) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23 via Frontend
 Transport; Wed, 2 Sep 2020 22:56:36 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:86172BADD2AA7B37522589BECE3484915309E65FD0573DEC290E7D83178179BD;
 UpperCasedChecksum:2A462DCAA2B853FB8B343E2E8CACBCA35AD4CECAD7EC7163DD4D5CC83E4FEDFF;
 SizeAsReceived:8947; Count:49
Received: from BYAPR14MB2342.namprd14.prod.outlook.com
 ([fe80::952a:28d1:bf4c:83a]) by BYAPR14MB2342.namprd14.prod.outlook.com
 ([fe80::952a:28d1:bf4c:83a%7]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 22:56:36 +0000
Subject: Re: SQUASHFS errors and OpenBMC hang
To: Milton Miller II <miltonm@us.ibm.com>, Patrick Williams <patrick@stwcx.xyz>
References: <20200901123506.GR3532@heinlein>
 <BYAPR14MB2342C9C346B57B87F44E3200CF530@BYAPR14MB2342.namprd14.prod.outlook.com>
 <OF007CF2C7.B7F26EA3-ON002585D6.007E6189-002585D6.007F0DAA@notes.na.collabserv.com>
From: Kun Zhao <zkxz@hotmail.com>
Message-ID: <BYAPR14MB234280E2E52CAA816FEF5AB5DC2F0@BYAPR14MB2342.namprd14.prod.outlook.com>
Date: Wed, 2 Sep 2020 15:56:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <OF007CF2C7.B7F26EA3-ON002585D6.007E6189-002585D6.007F0DAA@notes.na.collabserv.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: MN2PR01CA0023.prod.exchangelabs.com (2603:10b6:208:10c::36)
 To BYAPR14MB2342.namprd14.prod.outlook.com
 (2603:10b6:a02:b8::22)
X-Microsoft-Original-Message-ID: <22b267a9-ee62-3235-42f7-07396d04d7fd@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 MN2PR01CA0023.prod.exchangelabs.com (2603:10b6:208:10c::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 22:56:34 +0000
X-Microsoft-Original-Message-ID: <22b267a9-ee62-3235-42f7-07396d04d7fd@hotmail.com>
X-TMN: [66UNHVcqpLQF/S6GFdxDrJg9JYAbDOZp]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: df1c78c1-1943-4a5b-c5a8-08d84f93717f
X-MS-TrafficTypeDiagnostic: DM6NAM10HT009:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zgMix4fdGAlYXF5ZhUG6cQJb+MWAJLk14STDNbu4ZfX7zwVkqrQnFttEfcvjX2p7js/Yo8e4Dg0jVF6Inej+j37CwiU2NYqtu5ikuWXW6jMnz9GCKpMB1SZpDv9bYSyFIefPADdrOvbNsQXkU+DaruYKGfVLtZ5HDVSn5EK3Ik3/UA0Eqm6rMk5N/pfi7L51d5IYGbKTzkmNI+ePR6Nbyg==
X-MS-Exchange-AntiSpam-MessageData: 21F5ApnapZxuoani7C+0LLrnbSKWgu+MfNOLe9NTDh2oKSvgjEkPdlXcdDNxnJhJlL//c6PQL/Z0QGr8lvoXil2AR/wnXb9+DklX7ExsJYB0v8iDl8lObP7Zjr5bkck69CV8H5yQB6FH1zEDDCWXqg==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df1c78c1-1943-4a5b-c5a8-08d84f93717f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 22:56:36.0098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM10FT059.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM10HT009
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


On 9/1/20 4:07 PM, Milton Miller II wrote:
> On September 1, 2020 around 7:36AM in some timezone, Patrick Williams wrote:
>> On Sat, Aug 29, 2020 at 12:40:31AM +0000, Kun Zhao wrote:
>>> I’m working on validating OpenBMC on our POC system for a while,
>> but starting from 2 weeks ago, the BMC filesystem sometimes report
>> failures, and after that sometimes the BMC will hang after running
>> for a while. It started to happen on one system and then on another.
>> Tried to use programmer to re-flash, still see this issue. Tried to
>> flash back to the very first known good OpenBMC image we built, still
>> see the same symptoms. It seems like a SPI ROM failure. But when
>> flash back the POC system original 3rd-party BMC, no such issue at
>> all. Not sure if anyone ever met similar issues before?
>>
>> Yeah, this does look like a bad SPI NOR.  Have you tried flashing on
>> a
>> fresh image to the NOR and then reading it back to confirm all the
>> bits
>> keep their values?  It is possible that the corruption is hitting the
>> other BMC code in a less-important location.
>>
>>> [ 3.372932] jffs2: notice: (78) jffs2_get_inode_nodes: Node header
>> CRC failed at 0x3e0aa4. {1985,e002,0000004a,78280c2e}
>>
>> I'm surprised to see anyone using jffs2.  Don't we generally use
>> ubifs
>> in OpenBMC?  Is there a reason you've chosen to use jffs2?
>>
>> I don't necessarily think jffs2 will be better or worse in this
>> particular scenario but we've seen lots of upgrade issues over the
>> years
>> with jffs2.
> The default layout is static partitions with squashfs over mtdblock 
> for the read-only layer and jffs2 for the read-write layer.
>
> The ubifs option is opt-in and the code update supports two images 
> so that a new image is always available.  These options should be 
> orthogonal but in practice are probably tied in the code update 
> repository.
>
> The third option is eMMC support on the sdhci controller.  This 
> was prototyped on ast2500 and in use on the ast2600.
>
> There are some differences in the overlay strategy in the current 
> builds but I will support anyone willing to test to merge the new 
> limited writable directories from ubifs and emmc to the static mtd 
> layout.   This means I'm willing to update the init scripts.
Thank you, Milton for the comments. Can I update ubifs image to static partitioned BMC with code update? Or I have to program it directly to the NOR flash?
>>> BMC debug console shows the same SQUASHFS error as above, by
>> checking filesystem usage we could see rwfs usage keep increasing
>> like this,
>>> root@dgx:~# df
>>> Filesystem 1K-blocks Used Available Use% Mounted on
>>> dev 212904 0 212904 0% /dev
>>> tmpfs 246728 20172 226556 8% /run
>>> /dev/mtdblock4 22656 22656 0 100% /run/initramfs/ro
>>> /dev/mtdblock5 4096 880 3216 21% /run/initramfs/rw
>>> cow 4096 880 3216 21% /
>>> tmpfs 246728 8 246720 0% /dev/shm
>>> tmpfs 246728 0 246728 0% /sys/fs/cgroup
>>> tmpfs 246728 0 246728 0% /tmp
>>> tmpfs 246728 8 246720 0% /var/volatile
>>>
>>> and can see more and more ipmid coredump files,
>> This implies to me that we need to adjust the systemd recovery for
>> ipmid.  We shouldn't just keep re-launching the same process over and
>> over after a coredump.  Systemd has some thresholding capability.
>>
> I've seen problems in the past where the squashfs image was bigger 
> than the aloted space and it became partially overwritten by the 
> jffs2 writable filesystem.   We added code that tries to catch this 
> and have seen such reports but wanted to bring it up. 
Do you still have that issue links?
>  Also we don't 
> support the host accessing the flash controller while linux is up in 
> case your host is trying to flash the bmc bios (or even read it
> directly; all data must go through API such as IPMI or REST.
Do you mean if BMC is up and running and I use tools like socflash to program the BMC  directly in host OS, there will be problem?
>>> I found the following actions could trigger this failure,
>>>
>>>
>>>   1.  do SSH login to BMC debug console remotely, it will show this
>> error when triggered,
>>> $ ssh root@<bmc ip>
>>> ssh_exchange_identification: read: Connection reset by peer
>>>
>>>
>>>   1.  set BMC MAC address by fw_setenv in BMC debug console, reboot
>> BMC, and do 'ip -a'.
>>
>> I have no idea why this procedure would solve SPI NOR issues.  It
>> doesn't seem connected on the surface.
>>
>>> The code is based on upstream commit 5ddb5fa99ec259 on master
>> branch.
>>> The flash layout definition is the default
>> openbmc-flash-layout.dtsi.
>>> The SPI ROM is Macronix MX25L25635F
>>>
>>> Some questions,
>>>
>>>   1.  Any SPI lock feature enabled in OpenBMC?
>>>   2.  If yes, do I have to unlock u-boot-env partition before
>> fw_setenv?
>>
>> There is not, to my knowledge, a software SPI lock.  Some machines
>> have
>> a 'golden' NOR which they enable by, in hardware, setting the
>> write-protect input pin on the SPI NOR (with a strapping resistor).
>> Does your machine do this mechanism?  If so, it is possible that
>> you're
>> booting onto the 'wrong' NOR flash in some conditions and a reboot
>> resets the chip-select logic in the SPI controller.  (Usually, you
>> have
>> the watchdog configured to automatically swap the chip-select after
>> some
>> number of boot failures.)
>>
>> -- 
>> Patrick Williams
> Our default is that the os is in control of the flash an we do not 
> mark any areas as read-only.

Got it. Thanks for the confirmation.


> milton
> ---
> I speak only for myself.  But I have written or reviewed the layouts 
> and initrd scripting.
>
Kun
