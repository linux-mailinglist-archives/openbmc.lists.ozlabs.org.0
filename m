Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FD135945D
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 07:15:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGmYY6sXyz3bV1
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 15:15:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=fgY9QsQ8;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=FMpYMLnA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=fgY9QsQ8; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=FMpYMLnA; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGmYD411Jz2xYk;
 Fri,  9 Apr 2021 15:15:27 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 05D075C00A0;
 Fri,  9 Apr 2021 01:15:26 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Fri, 09 Apr 2021 01:15:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=FOmFmqL40ZegqMlq/XzagzjasgzMbz3
 EyAsKTAH4Em0=; b=fgY9QsQ8fhRt+1tMgfceEzzfRPZeQQgkj6SXcyts2cJr8cb
 G+WoiBHcFt9gOcMOatIn/oG+o/6BRMEMRACSSNoZcUIakSHCDMr26T/mzor5gGWC
 o4calS2LiZdaiZLHbhLkaJKU7rsb73SpBWRV1fTSXpTzBZV7XZX+jxEwGpjPUv+Y
 7K8LzwW8OdQIjoEhlRao8w31Qni3VE/D0Mf1RiEvXj8pqmu7UVULqQVcYohi3axP
 C5xdJkPAVltWPJiTFIGCUUxemBJJyGuhx2lWxx/jDO6xVcwrNBL8Y2sCRDVMJ8Bf
 mE4OF8JEGYyaiImqJoe0pOgj7dwYPUPubXgTOAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=FOmFmq
 L40ZegqMlq/XzagzjasgzMbz3EyAsKTAH4Em0=; b=FMpYMLnActwMm4HhCpT1Hm
 MGJThPRYskkKMmdYcwuwwgRhIu8mSkeebMZdGOcjprV2+PLTs3WhSVV39bKuMmuE
 8iUAf9kqXdg5UA8R/DMfYvm3IxEVRx5arhxrDC0NCvpYMCesEFDk7ibqZdHUezD8
 v8Fg2JOFgJ278Vlj+tvf2wdftMEWP1swB43lznHyKgBtA+aSNTUAbJKPRtXKb8Tz
 FU1VftlKm7MRJllQmcCWgNCONzWkNuKxYbln94HCAjMyPFnaO5MOKToKezBO2eI2
 97cF3mTZt3mNCUT42ejHoiRVwkh3Uuvfg37EE6EbSoImL9sMkb61zaDwEL7cveDA
 ==
X-ME-Sender: <xms:7OJvYNeeYO5-SNB9nXxxrsdTVXStCSH4FXHHGTPGRM9GJ-7U2_oBeg>
 <xme:7OJvYLPnAnbqQ_kZU0JmwwHRaGTOFgT9lWVaumes0HyegXqH0KCORf0WSG9X7OYSI
 mKbEHONn3Kv4iDUww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudektddgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:7OJvYGjRy6WCWgh3CIizVUY66gl9Qd_t9Xfc1pJPhF2bddHASw2DFQ>
 <xmx:7OJvYG8FrzYPy1Yyn71GVD6r4izLJe66Mxj4mRbvmjjR_oFrYSAbsw>
 <xmx:7OJvYJvO_geyQh5hJuOnaQ-_a1MJhe1leZRhwBKnwopNG9FqmwtFzw>
 <xmx:7uJvYNhnn4xfvSwi-0jHJDzCleAvmgrw_0lkvfZfbCnKa-QEH9RLog>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A55E2A0007C; Fri,  9 Apr 2021 01:15:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <3eef2478-c5b8-4f14-a937-16bbe0a3e05a@www.fastmail.com>
In-Reply-To: <20210408011637.5361-4-zev@bewilderbeest.net>
References: <20210408011637.5361-1-zev@bewilderbeest.net>
 <20210408011637.5361-4-zev@bewilderbeest.net>
Date: Fri, 09 Apr 2021 14:44:54 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Zev Weiss" <zev@bewilderbeest.net>, "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_v5_3/4]_drivers/tty/serial/8250:_add_aspeed,
 _lpc-io?= =?UTF-8?Q?-reg_and_aspeed,_lpc-interrupts_DT_properties?=
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
Cc: linux-aspeed@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Zev,

A couple of minor comments:

On Thu, 8 Apr 2021, at 10:46, Zev Weiss wrote:
> These allow describing all the Aspeed VUART attributes currently
> available via sysfs.  aspeed,sirq

aspeed,lpc-interrupts now

> provides a replacement for the
> deprecated aspeed,sirq-polarity-sense property.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  drivers/tty/serial/8250/8250_aspeed_vuart.c | 44 ++++++++++++++++++++-
>  1 file changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c 
> b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> index 8433f8dbb186..75ef006fa24b 100644
> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> @@ -28,6 +28,10 @@
>  #define ASPEED_VUART_ADDRL		0x28
>  #define ASPEED_VUART_ADDRH		0x2c
>  
> +#define ASPEED_VUART_DEFAULT_LPC_ADDR	0x3f8
> +#define ASPEED_VUART_DEFAULT_SIRQ	4
> +#define ASPEED_VUART_DEFAULT_SIRQ_POLARITY	IRQ_TYPE_LEVEL_LOW
> +
>  struct aspeed_vuart {
>  	struct device		*dev;
>  	void __iomem		*regs;
> @@ -393,7 +397,8 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
>  	struct aspeed_vuart *vuart;
>  	struct device_node *np;
>  	struct resource *res;
> -	u32 clk, prop;
> +	u32 clk, prop, sirq[2];
> +	bool sirq_polarity;
>  	int rc;
>  
>  	np = pdev->dev.of_node;
> @@ -501,6 +506,43 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
>  		of_node_put(sirq_polarity_sense_args.np);
>  	}
>  
> +	rc = of_property_read_u32(np, "aspeed,lpc-io-reg", &prop);
> +	if (rc < 0)
> +		prop = ASPEED_VUART_DEFAULT_LPC_ADDR;
> +
> +	rc = aspeed_vuart_set_lpc_address(vuart, prop);
> +	if (rc < 0) {
> +		dev_err(&pdev->dev, "invalid value in aspeed,lpc-io-reg property\n");
> +		goto err_clk_disable;
> +	}
> +
> +	rc = of_property_read_u32_array(np, "aspeed,lpc-interrupts", sirq, 2);
> +	if (rc < 0) {
> +		sirq[0] = ASPEED_VUART_DEFAULT_SIRQ;
> +		sirq[1] = ASPEED_VUART_DEFAULT_SIRQ_POLARITY;
> +	}
> +
> +	rc = aspeed_vuart_set_sirq(vuart, sirq[0]);
> +	if (rc < 0) {
> +		dev_err(&pdev->dev, "invalid sirq number in aspeed,lpc-interrupts > property\n");
> +		goto err_clk_disable;
> +	}
> +
> +	switch (sirq[1]) {
> +	case IRQ_TYPE_LEVEL_LOW:
> +		sirq_polarity = false;
> +		break;
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		sirq_polarity = true;
> +		break;
> +	default:
> +		dev_err(&pdev->dev, "invalid sirq polarity in aspeed,lpc-interrupts 
> property\n");
> +		rc = -EINVAL;
> +		goto err_clk_disable;
> +	}

A bit ugly open-coding the mapping and error handling, maybe worth a helper?

Looks okay otherwise.

Cheers,

Andrew
