Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A285D6C70
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 02:31:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sbvN1J7szDqwD
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 11:31:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="GXTkYYMk"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="EQTVZWyG"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sbny088LzDqwB
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 11:26:29 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 38863554;
 Mon, 14 Oct 2019 20:26:27 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 14 Oct 2019 20:26:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=v7RB/FpyfXrLtDItS2hV21GTv9IP6LW
 PlD/xAhpgKxU=; b=GXTkYYMkvPxV1ieSuvJn67TxI5K4onPjqjY6XpdPcC0AShC
 YLyPIzqrjaz5Uk8vJnLytzC/lLJDPFYnzyj8dd0dCBvLEHAHG/z0DC2+ezKFbMGm
 rnFK0hFr0MJ7PtDyD7xlcGIYhhxuoMsgDCXJBXypCP24OdSEqAO8Kpmk2CINHspY
 qDnpLQArBT2YBmjDZ/PFbrTWqUCUcfx2Pv1n4LqqbneEBl7VqkiM8WGR5JCSGD7B
 pWMpu0Tj5TtZc1WI2wBJlbkpVZ9Af2rXZRk37QFMDPZxaKC6etQTdm3K3zlcRFfm
 kNIRXQw9zp4HokcyTq7D2fvkBjs0GL7Zg1N0E1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=v7RB/F
 pyfXrLtDItS2hV21GTv9IP6LWPlD/xAhpgKxU=; b=EQTVZWyGKDHyfgkoBqF3t1
 JCu/Q48Fm9QH6572CcCtYApvuj7/CzgWwnLIOnVaiI3GjwWjK3+25JxpcP2FSBBH
 C1mQfGmS6ZaxEeJJu8N/YKbZiHTAU6uejdE9h0902UaOZaq9tMjB/sOeFgwZfIKC
 b+TFtvgP6R7WDWm+MU+eCPmYvE+NQAnEp3AtMFOh+jU0oO8WQ71Y2oS/cOTW4DPb
 sR/q2RpANmN8RHmh3YX3EJwT3Dgkpm3xD585JPEOQHbksGPsLnCZfsHju1dDxb62
 8bFhJSjKGfclJ9QJ1NtudmXx1RMzxWxVJk/KPo0ke1vmGJBGULXEuYX6loYPxZiA
 ==
X-ME-Sender: <xms:MRKlXUVFvXvWRPfJHrK-iI7jv00f5LoOyjv3S5MQW-uhF7HS6oXIjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjedvgdeffecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:MRKlXXB5MUH2aaTANgAyDX9OimNAej9B-cSaTZCnwY0s9HyVyL27Vg>
 <xmx:MRKlXbLfIGUaOu_oFtZqR79dSNa084fM6F_D2uWh_rAGwzTOElR8dQ>
 <xmx:MRKlXYLwh4Ow4hUTmTNdfvvHF9a-7QG0sTq1_mR7xpu-q4DLqCZ7dg>
 <xmx:MhKlXREO-5YS0_pOWIVNjaFEyrQnIASvvZUFejKLU4Pt3sy5rkymBg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C0C4DE00A5; Mon, 14 Oct 2019 20:26:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-360-g7dda896-fmstable-20191004v2
Mime-Version: 1.0
Message-Id: <0d04e87c-d6df-4eab-aaf9-f952bffc0ec7@www.fastmail.com>
In-Reply-To: <20191014074618.15506-2-joel@jms.id.au>
References: <20191014074618.15506-1-joel@jms.id.au>
 <20191014074618.15506-2-joel@jms.id.au>
Date: Tue, 15 Oct 2019 10:57:22 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux dev-5.3 1/2] fsi: aspeed: Configure optional GPIOs
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
Cc: Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 14 Oct 2019, at 18:16, Joel Stanley wrote:
> On Tacoma the enable and mux GPIOs allow the BMC to enable FSI and
> control if the clock and data should come from the BMC, or from the
> debug connector.
> 
> Configure these as optional GPIOs which will fail without error for
> systems that do not have these GPIOs in their device tree.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/fsi/fsi-master-aspeed.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
> index 6496d2972944..2048e38e7200 100644
> --- a/drivers/fsi/fsi-master-aspeed.c
> +++ b/drivers/fsi/fsi-master-aspeed.c
> @@ -14,6 +14,7 @@
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
>  #include <linux/iopoll.h>
> +#include <linux/gpio/consumer.h>
>  
>  #include "fsi-master.h"
>  
> @@ -85,6 +86,9 @@ struct fsi_master_aspeed {
>  	void __iomem		*base;
>  	struct clk		*clk;
>  
> +	struct gpio_desc	*gpio_enable;
> +	struct gpio_desc	*gpio_mux;
> +
>  	struct dentry		*debugfs_dir;
>  	struct fsi_master_aspeed_debugfs_entry debugfs[FSI_NUM_DEBUGFS_ENTRIES];
>  };
> @@ -471,6 +475,30 @@ DEFINE_DEBUGFS_ATTRIBUTE(fsi_master_aspeed_debugfs_ops,
>  			 fsi_master_aspeed_debugfs_get,
>  			 fsi_master_aspeed_debugfs_set, "0x%08llx\n");
>  
> +static int aspeed_master_gpio_init(struct fsi_master_aspeed *master)
> +{
> +	struct device *dev = master->dev;
> +	struct gpio_desc *gpio;
> +
> +	gpio = devm_gpiod_get_optional(dev, "fsi-enable", 0);
> +	if (IS_ERR(gpio)) {

devm_gpiod_get_option() returns NULL if the GPIO isn't defined, and
interfaces like gpiod_direction_output(...) return 0 if the descriptor is
NULL. The design point of the _optional() interfaces is that it makes the
error handling unnecessary because we know the GPIO might be absent.

The pattern is also wrong in fsi-master-ast-cf and probably fsi-master-gpio.
