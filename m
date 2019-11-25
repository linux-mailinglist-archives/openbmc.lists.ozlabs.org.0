Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4C8109733
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 01:07:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MPNv2y67zDqRL
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 11:07:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="NkipfqBk"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gAkEqD43"; dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MNjr3cD9zDq8D;
 Tue, 26 Nov 2019 10:37:19 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5C4D7527B;
 Mon, 25 Nov 2019 18:37:13 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 25 Nov 2019 18:37:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=ncriW7ZaZvfQAqjJ9CabdLFVncnOVKJ
 862KZb8NOlOE=; b=NkipfqBkuZ4AXdbRmxhoqgisaN1XxSTi3kyxhLIhwBZzEIH
 mVGmsguYxWurjyCvNjfl5pJqWM5sK7K6GVIRiz0I0ejsxjbk0nWPJd6j0IDU1AU5
 bBYLz9WDOfye2fPk0BK5/TP1AHUrf22h1ffYlCUEiTyzmJFp1ldWPljsp2msxNlg
 PnZjnskEApqjBTJYWG3Cghay0vevbXVvgo9gUhZDstrwEj01DiyjVnvppOL4qUDo
 0IVuLR226XHY2HuYrzBvnwXiu04JK8OanmQh1Fc3G9S3LJbF5PdyjAArg/Oz2i2C
 bNjK9td4JGPNtfQIUepZK/HiaIHfMNSbcS9BF5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ncriW7
 ZaZvfQAqjJ9CabdLFVncnOVKJ862KZb8NOlOE=; b=gAkEqD43/G23hkF6xMx0wh
 QLIH3eaTcj7jvo6+5Wjlza+5tWZUpxNCDUJBXCNUsls+hNS4ctlPkd5311yMzPCo
 Z/DKE6PZHXbuc+PBaAjMJU9aUhmSN1Bp6fTXefk93MYvFdtS+j+QsO8asw4o7MsH
 QEvU7hbcwkYRYtaFBKYe7WOiwNHP89rewuO10bEHiXHE3Bx2zEuqngXBX+Ithbo8
 CAPS+QJqrSoNqKnYO/UaslT5+5/Y4d4hWhSKFqJoP3SN6H7Rx513erEl1RAOYt3T
 Bhe6HwTF+e6BqEIlilfgdUy5W/imBTAsSayNEstbbx91sFBe3x2AehRis3HZlrag
 ==
X-ME-Sender: <xms:qGXcXYFcJTtMu5t3od6KQcIzz4LUe-ruDuXTPVBXBTJX4_QDUSI9bA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeivddgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehkvghrnhgvlhdrohhrghenucfrrghrrghmpehmrghilhhfrhhomheprghnughr
 vgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:qGXcXdKzIaIVyktBSBXW2v6jRStgJAdgsg1HSKNxAF0k3LE7fW1oeA>
 <xmx:qGXcXdh10fl-eZoHzznF8WLXSlJj7ivGkIcV8dHgEQLgxvyXKifZGA>
 <xmx:qGXcXTl63bMfZP57wWNP3qYCn8V3-bc5kqfVgjFcdmLbX-LSxPHWVA>
 <xmx:qWXcXfN55iZ9JNu8mzdN_wZLSf4iOKYa7-mYj7mN31ezNk55BLLSjg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6BA06E00A3; Mon, 25 Nov 2019 18:37:12 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-578-g826f590-fmstable-20191119v1
Mime-Version: 1.0
Message-Id: <ff44cecd-7e05-4e5d-b88f-2d6af6fd8b8b@www.fastmail.com>
In-Reply-To: <20191125202937.23133-1-roy.van.doormaal@prodrive-technologies.com>
References: <20191125202937.23133-1-roy.van.doormaal@prodrive-technologies.com>
Date: Tue, 26 Nov 2019 10:08:36 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Roy van Doormaal" <roy.van.doormaal@prodrive-technologies.com>,
 "Brendan Higgins" <brendanhiggins@google.com>,
 "Benjamin Herrenschmidt" <benh@kernel.crashing.org>,
 "Joel Stanley" <joel@jms.id.au>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Jason Cooper" <jason@lakedaemon.net>, "Marc Zyngier" <maz@kernel.org>,
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH] irqchip/aspeed-i2c-ic: Fix irq domain name memory leak
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



On Tue, 26 Nov 2019, at 06:59, Roy van Doormaal wrote:
> The aspeed irqchip driver overwrites the default irq domain name,
> but doesn't free the existing domain name.
> This patch frees the irq domain name before overwriting it.
> 
> kmemleak trace:
> 
> unreferenced object 0xb8004c40 (size 64):
> comm "swapper", pid 0, jiffies 4294937303 (age 747.660s)
> hex dump (first 32 bytes):
> 3a 61 68 62 3a 61 70 62 3a 62 75 73 40 31 65 37 :ahb:apb:bus@1e7
> 38 61 30 30 30 3a 69 6e 74 65 72 72 75 70 74 2d 8a000:interrupt-
> backtrace:
> [<086b59b8>] kmemleak_alloc+0xa8/0xc0
> [<b5a3490c>] __kmalloc_track_caller+0x118/0x1a0
> [<f59c7ced>] kvasprintf+0x5c/0xc0
> [<49275eec>] kasprintf+0x30/0x50
> [<5713064b>] __irq_domain_add+0x184/0x25c
> [<53c594d0>] aspeed_i2c_ic_of_init+0x9c/0x128
> [<d8d7017e>] of_irq_init+0x1ec/0x314
> [<f8405bf1>] irqchip_init+0x1c/0x24
> [<7ef974b3>] init_IRQ+0x30/0x90
> [<87a1438f>] start_kernel+0x28c/0x458
> [< (null)>] (null)
> [<f0763fdf>] 0xffffffff
> 
> Signed-off-by: Roy van Doormaal <roy.van.doormaal@prodrive-technologies.com>
> ---
>  drivers/irqchip/irq-aspeed-i2c-ic.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/irqchip/irq-aspeed-i2c-ic.c 
> b/drivers/irqchip/irq-aspeed-i2c-ic.c
> index 8d591c179f81..8081b8483a79 100644
> --- a/drivers/irqchip/irq-aspeed-i2c-ic.c
> +++ b/drivers/irqchip/irq-aspeed-i2c-ic.c
> @@ -92,6 +92,8 @@ static int __init aspeed_i2c_ic_of_init(struct 
> device_node *node,
>  		goto err_iounmap;
>  	}
>  
> +	if (i2c_ic->irq_domain->flags & IRQ_DOMAIN_NAME_ALLOCATED)
> +		kfree(i2c_ic->irq_domain->name);
>  	i2c_ic->irq_domain->name = "aspeed-i2c-domain";

Given that the name is no-longer allocated I think you need to clear the
IRQ_DOMAIN_NAME_ALLOCATED bit from flags to avoid attempting to
free the const string in irq_domain_remove():

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/kernel/irq/irqdomain.c?h=v5.4#n263

Or do a kstrdup().

Andrew
