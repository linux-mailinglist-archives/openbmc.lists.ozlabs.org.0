Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0184051187A
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 15:47:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpKnY60rHz3c5C
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 23:47:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.33.25; helo=7.mo548.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 603 seconds by postgrey-1.36 at boromir;
 Wed, 27 Apr 2022 23:47:27 AEST
Received: from 7.mo548.mail-out.ovh.net (7.mo548.mail-out.ovh.net
 [46.105.33.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpKnC3j4Hz3bbs
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 23:47:26 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.102])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id B36F6206B6;
 Wed, 27 Apr 2022 13:31:31 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 27 Apr
 2022 15:31:31 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006a82e225d-9d42-49c3-adac-7c9f9c4edfb9,
 17BF23367636C0D6DAFD61CED3DAD67CB3096C97) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c60bf907-70bf-94ff-42da-d53b75cdc35b@kaod.org>
Date: Wed, 27 Apr 2022 15:31:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: aspeed: spi driver: fmc wdt2
Content-Language: en-US
To: =?UTF-8?B?5byg5YGl?= <zhangjian.3032@bytedance.com>, openbmc
 <openbmc@lists.ozlabs.org>
References: <CA+J-oUs6V5HGw9kekOW0YAbpTC-P79WWZti21tJ1n86pMsVKiw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CA+J-oUs6V5HGw9kekOW0YAbpTC-P79WWZti21tJ1n86pMsVKiw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b285efbe-1e97-4496-b43b-38a904a744de
X-Ovh-Tracer-Id: 5022358010003360733
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudehgdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejgefggffgheejgfdufeeiueffveehteejgfelueekgfegtefgffejhedtgfejgfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghu
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
Cc: "joel@jms.id.au" <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/26/22 16:09, 张健 wrote:
> Hi Guys;
> 
> I would like implement the flash toggle function in ast2600.

It would be nice to have the support in QEMU also.

> That function about ast2400/2500 implement at linux/aspeed_wdt.c at aspeed-master-v5.15 · AspeedTech-BMC/linux ( <https://github.com/AspeedTech-BMC/linux/blob/aspeed-master-v5.15/drivers/watchdog/aspeed_wdt.c#L172>github.com <https://github.com/AspeedTech-BMC/linux/blob/aspeed-master-v5.15/drivers/watchdog/aspeed_wdt.c#L172>) <https://github.com/AspeedTech-BMC/linux/blob/aspeed-master-v5.15/drivers/watchdog/aspeed_wdt.c#L172>
> 
> Here is my design, just an idea. I would like to see your suggestions. Thanks.
> 
> There are some differences between ast2600 and ast2500/2400. For the ast2600 SoC abr function, there is a set of registers named `FMC_WDT2` in FMC(SPI).
> FMC_WDT2 is not a full function WDT, thus, I can't use aspeed_wdt driver to do that.


yes. The FMC_WDT2 is a standalone logic under FMC which is simplified
compared to the other watchdogs.

I spent sometime adding WDT2 on the FMC AST2600 (not mainline but in OpenBMC
QEMU) but I didn't handle the CS switch. It shouldn't be too hard.

Keep me updated on your progress.

Thanks,

C.

> In ast2400/2500 used a sysfs attr `access_cs0`, can make cs0->cs1 and cs1->cs0.
> For cs0->cs1, ast2400/2500 use the wdt2's self timer, cs1->cs0, use `access_cs0` to set the `flash indicate` bit.
> But ast2600 without the FMC_WDT2 timer driver to trigger `cs0`->`cs1`, thus, I would like to add 2 sysfs attrs in spi driver.
> Because ast2600 supports single image abr mode, i'd like to use primary/backup instead of cs0/1.
> 
> attr1 "access_backup": (only appears in primary and compatible is "aspeed,ast2600-fmc")
> store: The parameter is the timeout time for fmc_wdt2, if written, timer will be enabled, if timeout, will reboot from backup.
> show: the time left in fmc_wdt2 timer. 0 means timer is not enabled.
> 
> attr2 "access_primary”: (only appears in backup, and compatible is "aspeed,ast2600-fmc")
> store: Non-zero values indicate access to primary, 0 indicate access to backup
> show: 0: next reboot will boot from backup, 1 : will boot from primary.
> 
> 
> 
> 

