Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0109E194E45
	for <lists+openbmc@lfdr.de>; Fri, 27 Mar 2020 02:05:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pNvP2BQfzDqYL
	for <lists+openbmc@lfdr.de>; Fri, 27 Mar 2020 12:05:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=K+Qzl9lN; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Kfa1XudR; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pNtc5ybhzDqXS
 for <openbmc@lists.ozlabs.org>; Fri, 27 Mar 2020 12:04:56 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 3A0F441F;
 Thu, 26 Mar 2020 21:04:54 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 26 Mar 2020 21:04:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=TSZ6e50fcn+wkJ7kvK/OXmq4bobROaS
 KlewWMavzfxg=; b=K+Qzl9lNnqOKav7wc7lxVapJX3TUM4RRtFlFX64oULkd3kq
 Xmx31oYhzGE89ntCzNLh2EL/P2UPmrt351HxS6ZnRq0cIXPisVW1Q1qmxhnE/3V5
 WZmRW7Dhkmo7fD3E1p7jD6gK94K+uqvyVxQnb7SDEGabbD+NVTq7dTtQeYgE2If0
 T8xGPtUYY0Wdk96DTAVdS/a9N3sWDVdoSyxqBdk/zE5+LPZp6XRU6te2KDVb++8D
 uzsyuXNcY9VJm9Wa7bryMDrooysbp6J5uoBieDjOG38+aED3nno1TM6G9CObYyAH
 t4NtFkGvXJfRsdOw3Z8PTb8RyI3wxCdA9Mbd0Zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=TSZ6e5
 0fcn+wkJ7kvK/OXmq4bobROaSKlewWMavzfxg=; b=Kfa1XudRI9woMoIjBtey0J
 vU9yA8UlpT8pDkPJTIfDsc9gqzf/XoIaXE3ljE5OdHb5z7AXqdxYnXxuyWDWzFsV
 26qW3FxjFm8+gx7tu5G/JE93JUmh9VPkTD3RidZViTopdCayYGIZwwEks94Lapir
 pH4eo54+eOuMuoPahz3iEeok0jc3oGvuOOnRzNj/mjje+JNz/hw1oXqpWolRZc5G
 BpvBVH/e7pAi2gK2NbjfkGomM51mWcSVopr5U9vNILpnm0iqokdsfTZdmROrnxTu
 WTAUzml0B+CuXt6KIxQpCO1NUfJJEXz9bbldwvidBOxbTpo6Avj8reK33s26DZEQ
 ==
X-ME-Sender: <xms:NVF9XvuFJpEu4116TknswLAGSJhmUwwip9iyaFE0JzoHdmxgKo0w0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudehjedgudeftdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfies
 rghjrdhiugdrrghu
X-ME-Proxy: <xmx:NVF9Xs3X1Ba7DjWHJfWGGMVvWqQ06Jg9uNjVZsTOQ1McxshieJrOEQ>
 <xmx:NVF9Xm96zqZvqQA-hFDYOsDTrs7HcrXwN1RLUJ5F9LGquEV01Nfh8w>
 <xmx:NVF9Xg-xNJqrEcw-ksE6hr7Y3TDsuoHFMUcMddNU6OdKQAYNmLMUiw>
 <xmx:NVF9Xlu1vSrgRZv8anZbfRAMEBjLEHLaxO-KGRNU5BRaLi0kl_k_pQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E24C6E00BB; Thu, 26 Mar 2020 21:04:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1021-g152deaf-fmstable-20200319v1
Mime-Version: 1.0
Message-Id: <f1c30b7b-16fb-4239-9839-840fac7fd6c5@www.fastmail.com>
In-Reply-To: <20200324112530.293386-3-joel@jms.id.au>
References: <20200324112530.293386-1-joel@jms.id.au>
 <20200324112530.293386-3-joel@jms.id.au>
Date: Fri, 27 Mar 2020 11:35:01 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>,
 "Andrew Geissler" <geissonator@gmail.com>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux dev-5.4 2/2] fsi: aspeed: Support cabled FSI
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 24 Mar 2020, at 21:55, Joel Stanley wrote:
> Some FSI development systems have internally routed FSI signals, and
> some have external cabled FSI. Software can detect which machine this is
> by reading a jumper GPIO, and also control which pins the signals are
> routed to through a mux GPIO.
> 
> This attempts to find the GPIOs at probe time. If they are not present
> in the device tree the driver will not error and continue as before.
> 
> The mux GPIO is owned by the FSI driver to ensure it is not modified at
> runtime. The jumper is freed to allow other software to inspect it's
> state.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/fsi/fsi-master-aspeed.c | 45 +++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
> index f49742b310c2..3436805d590a 100644
> --- a/drivers/fsi/fsi-master-aspeed.c
> +++ b/drivers/fsi/fsi-master-aspeed.c
> @@ -13,6 +13,7 @@
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
>  #include <linux/iopoll.h>
> +#include <linux/gpio/consumer.h>
>  
>  #include "fsi-master.h"
>  
> @@ -419,6 +420,44 @@ static int aspeed_master_init(struct 
> fsi_master_aspeed *aspeed)
>  	return 0;
>  }
>  
> +static int tacoma_cabled_fsi_fixup(struct device *dev)
> +{
> +	struct gpio_desc *routing_gpio, *mux_gpio;
> +	int gpio;
> +
> +	/*
> +	 * The routing GPIO is a jumper indicating we should mux for the
> +	 * externally routed FSI cable.
> +	 */
> +	routing_gpio = devm_gpiod_get_optional(dev, "fsi-routing", GPIOD_IN);
> +	if (IS_ERR(routing_gpio))
> +		return PTR_ERR(routing_gpio);
> +	if (!routing_gpio)
> +		return 0;
> +
> +	mux_gpio = devm_gpiod_get_optional(dev, "fsi-mux", GPIOD_IN);
> +	if (IS_ERR(mux_gpio))
> +		return PTR_ERR(mux_gpio);
> +	if (!mux_gpio)
> +		return 0;

This leaks routing_gpio.

> +
> +	gpio = gpiod_get_value(routing_gpio);
> +	if (gpio < 0)
> +		return 0;
> +
> +	/* If the routing GPIO is low we should set the mux to low. */
> +	if (gpio == 0) {
> +		gpiod_set_value(mux_gpio, 0);
> +		dev_info(dev, "FSI configured for external cable\n");
> +	}

Is mux_gpio pulled up? Also you're acquiring mux_gpio using the GPIOD_IN
flag - the dt patch only specifies GPIO_ACTIVE_HIGH which means its
implicitly push-pull, but we're not changing the direction before setting the
value.

I feel like we should explicitly set the value either way, or at least document
the pull-up state in a comment if the gpio is indeed pulled up.

> +
> +	/* Free the cabled mux GPIO for other users to sample */
> +	devm_gpiod_put(dev, routing_gpio);

The comment mentions "mux GPIO" but then does the put for routing_gpio.
I think you can improve the clarity of the comment to make it more obvious
that it's meant to apply to routing_gpio and it isn't a mistake in the code.

Can you also add to the comment why you're not putting mux_gpio?

> +
> +	return 0;
> +}
> +
> +
>  static int fsi_master_aspeed_probe(struct platform_device *pdev)
>  {
>  	struct fsi_master_aspeed *aspeed;
> @@ -426,6 +465,12 @@ static int fsi_master_aspeed_probe(struct 
> platform_device *pdev)
>  	int rc, links, reg;
>  	__be32 raw;
>  
> +	rc = tacoma_cabled_fsi_fixup(&pdev->dev);
> +	if (rc) {
> +		dev_err(&pdev->dev, "Tacoma FSI cable fixup failed\n");
> +		return rc;
> +	}
> +
>  	aspeed = devm_kzalloc(&pdev->dev, sizeof(*aspeed), GFP_KERNEL);
>  	if (!aspeed)
>  		return -ENOMEM;
> -- 
> 2.25.1
> 
>
