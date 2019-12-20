Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0601282B3
	for <lists+openbmc@lfdr.de>; Fri, 20 Dec 2019 20:27:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ff0B4QKMzDqv9
	for <lists+openbmc@lfdr.de>; Sat, 21 Dec 2019 06:27:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.35.78; helo=19.mo5.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 4197 seconds by postgrey-1.36 at bilbo;
 Sat, 21 Dec 2019 06:26:49 AEDT
Received: from 19.mo5.mail-out.ovh.net (19.mo5.mail-out.ovh.net [46.105.35.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47fdzF6Dn3zDqs6
 for <openbmc@lists.ozlabs.org>; Sat, 21 Dec 2019 06:26:45 +1100 (AEDT)
Received: from player692.ha.ovh.net (unknown [10.108.42.174])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 8BF69263D33
 for <openbmc@lists.ozlabs.org>; Fri, 20 Dec 2019 18:00:47 +0100 (CET)
Received: from kaod.org (lfbn-tou-1-1227-223.w90-76.abo.wanadoo.fr
 [90.76.50.223]) (Authenticated sender: clg@kaod.org)
 by player692.ha.ovh.net (Postfix) with ESMTPSA id C507ED6C1A79;
 Fri, 20 Dec 2019 17:00:41 +0000 (UTC)
Subject: Re: [PATCH] hw/ssi: aspeed: Deselect chip to reset state in command
 mode
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20191220153440.8118-1-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2615a2f5-9397-a902-0f21-22e9fa35dc11@kaod.org>
Date: Fri, 20 Dec 2019 18:00:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191220153440.8118-1-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 18320080337238657893
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvddufedgleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheiledvrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepohhpvghnsghmtgeslhhishhtshdrohiilhgrsghsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
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

On 12/20/19 4:34 PM, Andrew Jeffery wrote:
> This is probably a bug elsewhere, maybe in the kernel driver. However,
> this workaround/fix appears to resolve the squashfs/UBI corruption we've
> been seeing for quite some time in QEMU with e.g. witherspoon-bmc and
> associated images.

Nice one ! This has been bugging us for years. 
 
> The problem is the chip is left in e.g. read mode 

Which is the default mode we usually want for reads. Bizarre.

> and the deselect is
> necessary to reset it back to idle for the current command to issue
> correctly. 

The driver should have done it. Bizarre. Bizarre. 

> Failure to deselect leads to command-mode access of data at
> unexpected addresses (the state mismatch means the command/address are
> potentially ignored) and the result presents as data corruption.

How are you tracking this ? It is really really complex to corner
such cases. 

We could test the CE_STOP_ACTIVE bit when doing the load in read 
mode and put an error.  With a busy loop, we could stop execution 
to try to catch which instruction is doing the read.


> Something I don't yet understand is the symptom (squashfs corruption)
> wasn't overly deterministic. I would have expected more widespread
> symptoms given the change. Having said that, UBI hammers the flash with
> its wear-leveling (somewhat ironically). Its approach appears to be
> somewhat complex, so maybe it's not surprising that the results are so
> variable.

It feels like a race between a read, using the default read mode on the 
AHB flash window, and an update, using the slow path in the driver : 
select, write command, write data, unselect.

> Cc: Andrew Geissler <geissonator@gmail.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

I have pushed the patch on my tree as it seems to give better results
than before and it's not breaking the other platforms. 

But I am still seeing ubi corruption after a reboot with the latest 
witherspoon image (20191214002407) :/



Thanks, 

C.

> 
> ---
> 
> An early Christmas present for Andrew G.
> ---
>  hw/ssi/aspeed_smc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 7755eca34976..c8713f3e3347 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -739,6 +739,7 @@ static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigned size)
>          break;
>      case CTRL_READMODE:
>      case CTRL_FREADMODE:
> +        aspeed_smc_flash_unselect(fl);
>          aspeed_smc_flash_select(fl);
>          aspeed_smc_flash_setup(fl, addr);
>  
> 

