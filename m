Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F211321AC
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 09:50:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sR1F0t7PzDqKV
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 19:50:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.251.80; helo=2.mo69.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 954 seconds by postgrey-1.36 at bilbo;
 Tue, 07 Jan 2020 19:50:12 AEDT
Received: from 2.mo69.mail-out.ovh.net (2.mo69.mail-out.ovh.net
 [178.33.251.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sR0N3smNzDqHr
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2020 19:50:08 +1100 (AEDT)
Received: from player793.ha.ovh.net (unknown [10.108.35.90])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 4C03E7B1F3
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2020 09:34:09 +0100 (CET)
Received: from kaod.org (lfbn-tou-1-1227-223.w90-76.abo.wanadoo.fr
 [90.76.50.223]) (Authenticated sender: clg@kaod.org)
 by player793.ha.ovh.net (Postfix) with ESMTPSA id 85B3EDF7D0E7;
 Tue,  7 Jan 2020 08:34:04 +0000 (UTC)
Subject: Re: Aspeed SPI driver upstreaming
To: Patrick Williams <patrick@stwcx.xyz>, openbmc@lists.ozlabs.org
References: <20200106232722.GB1233@patrickw3-mbp.dhcp.thefacebook.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <31ec66fe-9ff9-b28b-3b83-a6c0a7959f30@kaod.org>
Date: Tue, 7 Jan 2020 09:34:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200106232722.GB1233@patrickw3-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 4792111482156518355
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdehuddguddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeehnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuffhomhgrihhnpehsphhinhhitghsrdhnvghtpdhgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleefrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepohhpvghnsghmtgeslhhishhtshdrohiilhgrsghsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
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
Cc: taoren@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

On 1/7/20 12:27 AM, Patrick Williams wrote:
> Cedric, Joel,
> 
> There is currently the aspeed-smc driver[1], which is upstreamed, but only
> supports spi-nor devices.  

Upstream lacks read training.

> There also a more generic spi-aspeed
> driver[2], which might only exist in Facebook kernel trees, that
> supports all spi devices but it doesn't do the calibration work.
> 
> I made some changes to the spi-aspeed driver recently in order to get it
> to somewhat support TPM 2.0 devices (*).  The spi-aspeed driver also
> already supported generic spi-nor MTD devices, but just at a slower
> speed than aspeed-smc due to missing the calibration routines.

Yes. That is the problem.

> Tao mentioned to me that there was a discussion at one of the F2F events
> in 2019 about combining those two drivers and getting them upstreamed,
> but that the hang-up was getting upstream mtd and spi subsystems to
> agree on how to handle calibration routines in the spi subsystem?  I
> can't seem to find anything about this on the LKML.  Do either of you
> know where that discussion went and what the current state / plans of
> upstreamming a generic Aspeed SPI driver are?

Regarding the SMC driver, the maintainers are requesting a rewrite 
of the driver using the spimem layer, but we lack handlers to do 
the read training and compute the timing register value.

This is the first thing to address on the todo list. When available,
it shouldn't take too long to upstream the driver. Some more info 
here :

   https://www.spinics.net/lists/linux-mtd/msg09417.html

Cheers,

C.

> 
> [1] https://github.com/openbmc/linux/blob/dev-5.3/drivers/mtd/spi-nor/aspeed-smc.c
> [2] https://github.com/facebook/openbmc-linux/blob/dev-5.0/drivers/spi/spi-aspeed.c
> 
> (*) The Aspeed SPI master is half-duplex and the TPM SPI spec effectively
>     requires full duplex hardware.  I did some workarounds to get it to work
>     with one particular part and need to work with the vendor and upstream
>     to figure out the best way to reliably handle half-duplex SPI masters.
> 

