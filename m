Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40448527E8C
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 09:28:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1rSx1KZXz3bym
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 17:28:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.54.81;
 helo=smtpout3.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 460 seconds by postgrey-1.36 at boromir;
 Mon, 16 May 2022 17:28:00 AEST
Received: from smtpout3.mo529.mail-out.ovh.net
 (smtpout3.mo529.mail-out.ovh.net [46.105.54.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1rSc2VwKz2ync
 for <openbmc@lists.ozlabs.org>; Mon, 16 May 2022 17:27:59 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.132])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id BE80D10028BA5;
 Mon, 16 May 2022 09:18:47 +0200 (CEST)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 16 May
 2022 09:18:47 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004414e1081-a4cc-42b5-a69a-8b30e13c60b0,
 182B8575423FAF1F37CDABDABB9637A2CFA4B440) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b978e205-66f7-e585-4cf0-6f3946fd1050@kaod.org>
Date: Mon, 16 May 2022 09:18:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 0/5] hw: aspeed: Init all UART's with serial devices
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
References: <20220516062328.298336-1-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220516062328.298336-1-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 094042a1-8b3c-4f36-9b88-f7553e5c10c3
X-Ovh-Tracer-Id: 18074915631893023666
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrheeggdduvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeihedvvedtteeutdfgvedtudffveetueeiieefgfefkeehvdelhfeuvdfhjedthfenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghdpghhithhlrggsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhgrmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhm
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
Cc: peter.maydell@linaro.org, Jamin Lin <jamin_lin@aspeedtech.com>,
 zev@bewilderbeest.net, andrew@aj.id.au, irischenlj@fb.com,
 openbmc@lists.ozlabs.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/16/22 08:23, Peter Delevoryas wrote:
> v2:
> - Rebased on Cedric's irq proposal. [1]
> - Added "Introduce common UART init function" patch
> - Added "Add uarts_num SoC attribute" patch
> - Rewrote last commit's message for clarity

Looks good to me.

> I tried testing this by running acceptance tests, particularly the
> boot_linux_console.py file, but I had to disable the raspi2_initrd case.
> It's not related to my changes (A/B tested and it fails on upstream/master
> too), but thought I would mention that.>
> I also manually tested several machines:
> 
> AST2400: https://github.com/facebook/openbmc/releases/download/v2021.49.0/wedge100.mtd
> AST2500: https://github.com/facebook/openbmc/releases/download/v2021.49.0/fby3.mtd
> AST2600: https://github.com/facebook/openbmc/releases/download/v2021.49.0/fuji.mtd
> AST1030: https://github.com/peterdelevoryas/OpenBIC/releases/download/oby35-cl-2022.13.01/Y35BCL.elf
> 
> [1] https://lore.kernel.org/qemu-devel/20220516055620.2380197-1-clg@kaod.org/
I have quite a few images which I run manually. OpenBMC is providing
images, Aspeed also. Joel did a small tool for the IBM rainier :

   https://github.com/shenki/qemu-boot-test

Having an automated framework for Aspeed machines pulling images
from different places would be nice but we cannot put all under
QEMU.


I like the buildroot CI using the QEMU boards. See a pipeline example:

   https://gitlab.com/legoater/buildroot/-/pipelines/539559209

but that's buildroot only and integrating a custom uboot might be
difficult.

For my ppc needs, I did a quick-and-dirty non-regression test suite :

   https://github.com/legoater/qemu-ppc-boot


Anyway, I haven't found a solution nor spent much time on it but
I am interested !


C.




> 
> Peter Delevoryas (5):
>    hw: aspeed: Add missing UART's
>    hw: aspeed: Add uarts_num SoC attribute
>    hw: aspeed: Ensure AST1030 respects uart-default
>    hw: aspeed: Introduce common UART init function
>    hw: aspeed: Init all UART's with serial devices
> 
>   hw/arm/aspeed_ast10x0.c     | 32 +++++++++++++++++++++++++++-----
>   hw/arm/aspeed_ast2600.c     | 27 ++++++++++++++++++++++-----
>   hw/arm/aspeed_soc.c         | 33 +++++++++++++++++++++++++++++----
>   include/hw/arm/aspeed_soc.h | 10 ++++++++++
>   4 files changed, 88 insertions(+), 14 deletions(-)
> 

