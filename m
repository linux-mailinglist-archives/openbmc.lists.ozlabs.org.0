Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B183020FA
	for <lists+openbmc@lfdr.de>; Mon, 25 Jan 2021 05:14:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPGhV1xgSzDqZF
	for <lists+openbmc@lfdr.de>; Mon, 25 Jan 2021 15:14:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=P6kP2F0M; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=VId8n7gq; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPGgY565HzDqXJ;
 Mon, 25 Jan 2021 15:13:12 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6ED495807D1;
 Sun, 24 Jan 2021 23:13:09 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 24 Jan 2021 23:13:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=GTLpuJENuXu/9veLzAJYxFan+D7b3di
 4Fck02B7mcmI=; b=P6kP2F0MHdA2xPLtwetdDp54jp17pVt4kIXzJ/ZqtSKsKdX
 py1B2DmMZclFKmdLrHK39NqzPIVe9HqxvQfa4jxeHrJyXRKrY8cR+t5LYgXDy27b
 zrtkon0vOSyA6WLsudV8BQs8BCd9LuK/so3t62zATEKdcgnY88jqw7J9HxhoR/Yk
 S8OlWW7Djwl39ilIr/ynhSrhz5SbvWnELsUxWf9H+e77RanD6FFIK5ZRoH+ajyo9
 zqj8Qc8sHOw/Qt/Tve4zmlGuIEWK5UxeGT83IJz1lKIwhK8VgFYKl0IHnwxxi4Zb
 c4qwnKE8JzcjtmXJsuLTpNIuHHBTrCJK0yIaZSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=GTLpuJ
 ENuXu/9veLzAJYxFan+D7b3di4Fck02B7mcmI=; b=VId8n7gqDILYFOWy6nGtOx
 +1LhbAGWyDmPQmWpKwbPwwW9Af6NQsu6+A+rtJOcj2qAT5lcwLUDNN7Hl3HZYGY+
 tASc8XWadVqQd9bvUOp7ynuRf34zVlpBM6CURROXazbhoio+HESwj3mnAUcqc6cV
 MmGEWMfKOYKwnRlHhrhneE8tAy55ar4s+fS8365XLheRisfeBUHGzJWFkkJl+F6d
 mTOewDwMR9qRTdUetcUE45GRhnKs92C3jAFO3a4GJ3/UV1vKZlClJDgXZQ6xFI1w
 qa0K0wW5hqDJfrq9WQhhmpqUMMVr3IxX+LzqpMa3MemwEiFsVDPpXnwPgjMfDStg
 ==
X-ME-Sender: <xms:UUUOYByRDv06BoWB_8O9QSzaJBgccs-WAzAc1OMdqZlzbAWW81dfqQ>
 <xme:UUUOYBQNWSusRrQ6JWccOxnceb9k2X92nidNMo14hczkVD_zUyok6fe9PMl_5Hk7q
 sH85oE96kwVKcZssw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvgdeikecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:UUUOYLXhetRHUUq4af_d08QCH4TFkVUDeSmp5x37aZZK1Lc89d4uWQ>
 <xmx:UUUOYDgk2ixvp47a6tUiXCs99ZWfbVhqg5OrKausGjnyc_8mER-8Og>
 <xmx:UUUOYDCAT0WcCcOhxA5EnJghDkZZiQAy5_fjue5M16SX0pOkadAxEA>
 <xmx:VUUOYH6IcZSOD6O3E_rAIhvA6DdVXBIg_nKmHyC1i0GgDmQ-PmWe-Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6AA73A0005D; Sun, 24 Jan 2021 23:13:05 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-78-g36b56e88ef-fm-20210120.001-g36b56e88
Mime-Version: 1.0
Message-Id: <db4964a9-e78b-465b-850d-711c2a23e910@www.fastmail.com>
In-Reply-To: <20210114131622.8951-3-chiawei_wang@aspeedtech.com>
References: <20210114131622.8951-1-chiawei_wang@aspeedtech.com>
 <20210114131622.8951-3-chiawei_wang@aspeedtech.com>
Date: Mon, 25 Jan 2021 14:42:45 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Lee Jones" <lee.jones@linaro.org>,
 "Joel Stanley" <joel@jms.id.au>, "Linus Walleij" <linus.walleij@linaro.org>,
 "Corey Minyard" <minyard@acm.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v5 2/5] ARM: dts: Remove LPC BMC and Host partitions
Content-Type: text/plain
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
Cc: BMC-SW@aspeedtech.com, Cyril Bur <cyrilbur@gmail.com>,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 14 Jan 2021, at 23:46, Chia-Wei, Wang wrote:
> The LPC controller has no concept of the BMC and the Host partitions.
> 
> A concrete instance is that the HICRB[5:4] are for the I/O port address
> configurtaion of KCS channel 1/2. However, the KCS driver cannot access
> HICRB for channel 1/2 initialization via syscon regmap interface due to
> the parition boundary. (i.e. offset 80h)
> 
> In addition, for the HW design backward compatibility, a newly added HW
> control bit could be located at any reserved one over the LPC addressing
> space. Thereby, this patch removes the lpc-bmc and lpc-host child node
> and thus the LPC partitioning.
> 
> Note that this change requires the synchronization between device tree
> change and the driver change. To prevent the misuse of old devicetrees
> with new drivers, or vice versa, the v2 compatible strings are adopted
> for the LPC device as listed:
> 
> 	"aspeed,ast2400-lpc-v2"
> 	"aspeed,ast2500-lpc-v2"
> 	"aspeed,ast2600-lpc-v2"
> 
> Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
> ---
>  arch/arm/boot/dts/aspeed-g4.dtsi |  74 +++++++----------
>  arch/arm/boot/dts/aspeed-g5.dtsi | 135 ++++++++++++++-----------------
>  arch/arm/boot/dts/aspeed-g6.dtsi | 135 ++++++++++++++-----------------

I've booted a Witherspoon BMC and host with these patches applied, so for 
aspeed-g5.dtsi:

Tested-by: Andrew Jeffery <andrew@aj.id.au>
