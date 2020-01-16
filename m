Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1D713FFB6
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 00:45:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zLRX754lzDr4R
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 10:45:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=mkSxf24l; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=gr3Kj4eU; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zLPz12hHzDr3B
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2020 10:44:22 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5ED9E21DC4;
 Thu, 16 Jan 2020 18:44:18 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 16 Jan 2020 18:44:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=ctpCI/X7a8z8cEUyo5/hY4PDAUc+D7W
 5JjI5obkKI+8=; b=mkSxf24lwtW7gr7UjB8woU2H6XHMTl2xBCxPGl/PwDfEsxC
 NMAqgflIzUKz96kySSH9KJotnsIwluSUw/N9zhBFl0XQn6dV5DPlQx3YNKj/LOa5
 YRtRtqJYPdDC1rPCqBKOweBTJsg9wh48I9xoZl4GAjxXfA1ESysFaSukAPVNKxFu
 gz2eGCK0beohjKuUgkOSRmTjqaoc+T3jcmkGyxqf43c1bq0urucLB7WIn43QGJq0
 UiDxSn2gYFxNVHxXvZj8ueofZN3xVuoH7wboIt4y0LP5pPslfofGuSUNMZExX2O1
 16tN/ikxgZ/DPTlT6Kf1veJBV8vmSqrUU/Evqlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ctpCI/
 X7a8z8cEUyo5/hY4PDAUc+D7W5JjI5obkKI+8=; b=gr3Kj4eUVJh0Lg6Po68xDr
 1GasAWXIFGSX5bJxUtIs6/psY1aLO/hRhPulYu8fPTDoMd1IRy6MdkBStsabWmB/
 kwxmL+jTzO35isqJ+XmFn+d803CLttAauUFFmwrzJmpoaUcX0C3miUJ/5maHAmT2
 UCWsSS2ibJKcDj/e5aExMyicGxdf2qrCX1eUZ5v0iPEVPMUEFcBcvscXGwdO0LNY
 9tD9J9V8bv40xEDzs80pZ7tUypols6ymnX5xdEQAqef83SaOhJa/w0/qFus8jn+5
 Mwrb2ybIfRFtQUsHiTfr8QbFXkdG5rYD963eIh2wtCTEqN9xWfBA+BRTNn72hA3w
 ==
X-ME-Sender: <xms:UfUgXkkkXjPPu_K4Ofik_DSSiZoJrrhBC9Fos4FMbRqMI2PFAgnHfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtdeigdduudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:UfUgXnQtImJ5KrOc3j8kpwSWB-t1j1HihkWk2BKDGuBCtK-65Hg9OA>
 <xmx:UfUgXppWZovmwNNKDmgme6MvteEUzatFvAjsWIyO9tmEDRkEYUI4RA>
 <xmx:UfUgXt1oFqvzYmcV5az_dh8cYAFzG4gY_9uQ03e8m-SzOCtayLik1w>
 <xmx:UvUgXiAxMS3fDtwtRb3XTKlx7tLM3_MFrAXXPOenWK6NXU9F4S7pdw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7F1B7E00A2; Thu, 16 Jan 2020 18:44:17 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-754-g09d1619-fmstable-20200113v1
Mime-Version: 1.0
Message-Id: <27f552c8-52bd-4452-9457-54a1963ef67e@www.fastmail.com>
In-Reply-To: <20200116232525.2819-2-rentao.bupt@gmail.com>
References: <20200116232525.2819-1-rentao.bupt@gmail.com>
 <20200116232525.2819-2-rentao.bupt@gmail.com>
Date: Fri, 17 Jan 2020 10:13:57 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Tao Ren" <rentao.bupt@gmail.com>, "Joel Stanley" <joel@jms.id.au>,
 "Tao Ren" <taoren@fb.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.4_1/2]_usb:_gadget:_aspeed:_add_ast2600?=
 =?UTF-8?Q?_vhub_support?=
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



On Fri, 17 Jan 2020, at 09:55, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> Add AST2600 support in aspeed-vhub driver.
> 
> There are 3 major differences between AST2500 and AST2600 vhub:
>   - AST2600 supports 7 downstream devices while AST2500 supports 5.
>   - AST2600 supports 21 programmable endpoints while AST2500 supports 15.
>   - EP0 data buffer's 8-byte DMA alignment restriction is removed from
>     AST2600.
> 
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> ---
>  drivers/usb/gadget/udc/aspeed-vhub/Kconfig |  4 +--
>  drivers/usb/gadget/udc/aspeed-vhub/core.c  | 25 ++++++-----------
>  drivers/usb/gadget/udc/aspeed-vhub/vhub.h  | 32 ++++++++++++++++------
>  3 files changed, 35 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/Kconfig 
> b/drivers/usb/gadget/udc/aspeed-vhub/Kconfig
> index 83ba8a2eb6af..605500b19cf3 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/Kconfig
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/Kconfig
> @@ -4,5 +4,5 @@ config USB_ASPEED_VHUB
>  	depends on ARCH_ASPEED || COMPILE_TEST
>  	depends on USB_LIBCOMPOSITE
>  	help
> -	  USB peripheral controller for the Aspeed AST2500 family
> -	  SoCs supporting the "vHub" functionality and USB2.0
> +	  USB peripheral controller for the Aspeed AST2400, AST2500 and
> +	  AST2600 family SoCs supporting the "vHub" functionality and USB2.0
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c 
> b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> index 90b134d5dca9..5fafe91d3619 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> @@ -97,6 +97,7 @@ void ast_vhub_free_request(struct usb_ep *u_ep, 
> struct usb_request *u_req)
>  
>  static irqreturn_t ast_vhub_irq(int irq, void *data)
>  {
> +	u32 i;
>  	struct ast_vhub *vhub = data;
>  	irqreturn_t iret = IRQ_NONE;
>  	u32 istat;
> @@ -121,7 +122,7 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
>  
>  	/* Handle generic EPs first */
>  	if (istat & VHUB_IRQ_EP_POOL_ACK_STALL) {
> -		u32 i, ep_acks = readl(vhub->regs + AST_VHUB_EP_ACK_ISR);
> +		u32 ep_acks = readl(vhub->regs + AST_VHUB_EP_ACK_ISR);
>  		writel(ep_acks, vhub->regs + AST_VHUB_EP_ACK_ISR);
>  
>  		for (i = 0; ep_acks && i < AST_VHUB_NUM_GEN_EPs; i++) {
> @@ -134,21 +135,10 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
>  	}
>  
>  	/* Handle device interrupts */
> -	if (istat & (VHUB_IRQ_DEVICE1 |
> -		     VHUB_IRQ_DEVICE2 |
> -		     VHUB_IRQ_DEVICE3 |
> -		     VHUB_IRQ_DEVICE4 |
> -		     VHUB_IRQ_DEVICE5)) {
> -		if (istat & VHUB_IRQ_DEVICE1)
> -			ast_vhub_dev_irq(&vhub->ports[0].dev);
> -		if (istat & VHUB_IRQ_DEVICE2)
> -			ast_vhub_dev_irq(&vhub->ports[1].dev);
> -		if (istat & VHUB_IRQ_DEVICE3)
> -			ast_vhub_dev_irq(&vhub->ports[2].dev);
> -		if (istat & VHUB_IRQ_DEVICE4)
> -			ast_vhub_dev_irq(&vhub->ports[3].dev);
> -		if (istat & VHUB_IRQ_DEVICE5)
> -			ast_vhub_dev_irq(&vhub->ports[4].dev);
> +	for (i = 0; i < AST_VHUB_NUM_PORTS; i++) {
> +		u32 dev_irq = VHUB_IRQ_DEVICE1 << i;
> +		if (istat & dev_irq)
> +			ast_vhub_dev_irq(&vhub->ports[i].dev);
>  	}
>  
>  	/* Handle top-level vHub EP0 interrupts */
> @@ -407,6 +397,9 @@ static const struct of_device_id ast_vhub_dt_ids[] 
> = {
>  	{
>  		.compatible = "aspeed,ast2500-usb-vhub",
>  	},
> +	{
> +		.compatible = "aspeed,ast2600-usb-vhub",
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, ast_vhub_dt_ids);
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h 
> b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
> index 761919e220d3..76935d02decf 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
> @@ -2,6 +2,23 @@
>  #ifndef __ASPEED_VHUB_H
>  #define __ASPEED_VHUB_H
>  
> +/*****************************
> + *                           *
> + * Maximum devices/endpoints *
> + *                           *
> + *****************************/
> +
> +#ifdef CONFIG_MACH_ASPEED_G6

No, this prevents building a kernel supporting multiple AST generations. Please
describe the differences in a platform data struct attached to struct of_device_id.

Also, what's the plan for upstreaming these changes? It's okay to send them for
inclusion in the openbmc tree if you're wanting them to bake there for some
more widespread testing, but it's not clear what the intent is.

Cheers,

Andrew
