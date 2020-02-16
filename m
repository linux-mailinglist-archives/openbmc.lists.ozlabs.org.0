Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D6016075F
	for <lists+openbmc@lfdr.de>; Mon, 17 Feb 2020 00:49:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LP3D23lqzDqfb
	for <lists+openbmc@lfdr.de>; Mon, 17 Feb 2020 10:49:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=gii25t9W; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=VAbwzqfq; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LP2R2kj3zDqLj;
 Mon, 17 Feb 2020 10:48:31 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id B16EC6435;
 Sun, 16 Feb 2020 18:48:27 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 16 Feb 2020 18:48:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=uPvzPfeLssWll94cUqu6zSYEVY0EtIa
 CosSptfdI0ok=; b=gii25t9WYnSSTkHeauV2hH2UHwbVUPPw+yLOjQKDBhMyeGS
 EDkjDaewr+5LUpVyYixbomyYrH+LfTcBFKZ2uxYtHwvXqc227U3yheYJ9bE5JXfh
 S5rzU+IOxZ11vcFAbvmii+Q9164J3KgdJiapTfqx8uz6DgjC7Rk9uAjQKB0PltVU
 MfB9TEUwkvvCzFWJtNs7UtOmx2gXvwYXgmtmcImrusGw/NqOxtcZZFlgefSCl7Hg
 zmtfkZY7LihvcvgmywAATmZhoS3hVQgUQ4oxudkdC0fZE5PYbKyO7CuFD3e8j+qn
 dEXLymIudK/s7I0ZGVBc/huTCW2offeDLM5sGgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=uPvzPf
 eLssWll94cUqu6zSYEVY0EtIaCosSptfdI0ok=; b=VAbwzqfqo/y9Tu8LX5Lfyx
 6Yl8l3udSj5vMmSuDj1oMRAfayQXn9AbdS8ECqZ4k2aMpnQZ75FC0SnatX4mdkB3
 otfPdnKXlsYRD2eE1/cAKgw4tnYJ6d8dJ+yEU+N/kE0j+oObO3DnwrRrdYQ+h0Nl
 56PDpk/Q/3VuKQ/OV1m6Xh6GyTsZ5USwJwxp55vqVsnnp1PBpxCUd3S2scC+i66d
 UD2lK7KA4L67F8Dk5LV9sm0t8jyP4HrSdWX7R5LLOwDhL0omzwJIq8GH3JDbLEtJ
 rjRyOXB5qCUL6LCy0FHdKP64OCnaLed++Ne+/LLYTsonj8C60e2ajatpaIo0N8Mg
 ==
X-ME-Sender: <xms:w9RJXtJs6D8kIs6PKmou0A3rLpCqjWS4i7aYsxew6CSBWFnnwWJtyw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:w9RJXpUdqDLjMVR3DQlScEWMyPRikq9iJvVJV1LmvtV1nSDbvcnQkg>
 <xmx:w9RJXoXbZ2sIlBRiQvlSME-N3BbB2H-JtxzAwD0ddccHEexs_8ETYQ>
 <xmx:w9RJXp_sjRWNEgMLbalyA2rOXjG1SQddVcU7PUiMxk9YOSr9equm_A>
 <xmx:y9RJXidtxXeIKeauc7jrwlF62H2pHiE5KEVmrPsD7xWuRiQiDknVjA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 2A140E00A2; Sun, 16 Feb 2020 18:48:19 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-802-g7a41c81-fmstable-20200203v1
Mime-Version: 1.0
Message-Id: <88f74fcd-537d-497d-bb39-346e56da34e2@www.fastmail.com>
In-Reply-To: <20200212215717.9474-2-rentao.bupt@gmail.com>
References: <20200212215717.9474-1-rentao.bupt@gmail.com>
 <20200212215717.9474-2-rentao.bupt@gmail.com>
Date: Mon, 17 Feb 2020 10:18:11 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Tao Ren" <rentao.bupt@gmail.com>, "Felipe Balbi" <balbi@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Joel Stanley" <joel@jms.id.au>,
 "Benjamin Herrenschmidt" <benh@kernel.crashing.org>,
 "Chunfeng Yun" <chunfeng.yun@mediatek.com>,
 "Colin King" <colin.king@canonical.com>,
 "Stephen Boyd" <swboyd@chromium.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, "Tao Ren" <taoren@fb.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v2_1/5]_usb:_gadget:_aspeed:_read_vhub_properties_f?=
 =?UTF-8?Q?rom_device_tree?=
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



On Thu, 13 Feb 2020, at 08:27, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> The patch introduces 2 DT properties ("aspeed,vhub-downstream-ports" and
> "aspeed,vhub-generic-endpoints") which replaces hardcoded port/endpoint
> number. It is to make it more convenient to add support for newer vhub
> revisions with different number of ports and endpoints.
> 
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---
>  Changes in v2:
>    - removed ast_vhub_config structure and moved vhub port/endpoint
>      number into device tree.
> 
>  drivers/usb/gadget/udc/aspeed-vhub/core.c | 68 ++++++++++++++---------
>  drivers/usb/gadget/udc/aspeed-vhub/dev.c  | 30 +++++++---
>  drivers/usb/gadget/udc/aspeed-vhub/epn.c  |  4 +-
>  drivers/usb/gadget/udc/aspeed-vhub/hub.c  | 26 ++++++---
>  drivers/usb/gadget/udc/aspeed-vhub/vhub.h | 23 +++-----
>  5 files changed, 91 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c 
> b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> index 90b134d5dca9..d6f737fac4e2 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> @@ -99,7 +99,7 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
>  {
>  	struct ast_vhub *vhub = data;
>  	irqreturn_t iret = IRQ_NONE;
> -	u32 istat;
> +	u32 i, istat;
>  
>  	/* Stale interrupt while tearing down */
>  	if (!vhub->ep0_bufs)
> @@ -121,10 +121,10 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
>  
>  	/* Handle generic EPs first */
>  	if (istat & VHUB_IRQ_EP_POOL_ACK_STALL) {
> -		u32 i, ep_acks = readl(vhub->regs + AST_VHUB_EP_ACK_ISR);
> +		u32 ep_acks = readl(vhub->regs + AST_VHUB_EP_ACK_ISR);
>  		writel(ep_acks, vhub->regs + AST_VHUB_EP_ACK_ISR);
>  
> -		for (i = 0; ep_acks && i < AST_VHUB_NUM_GEN_EPs; i++) {
> +		for (i = 0; ep_acks && i < vhub->max_epns; i++) {
>  			u32 mask = VHUB_EP_IRQ(i);
>  			if (ep_acks & mask) {
>  				ast_vhub_epn_ack_irq(&vhub->epns[i]);
> @@ -134,21 +134,11 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
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
> +	for (i = 0; i < vhub->max_ports; i++) {
> +		u32 dev_mask = VHUB_IRQ_DEVICE1 << i;
> +
> +		if (istat & dev_mask)
> +			ast_vhub_dev_irq(&vhub->ports[i].dev);
>  	}
>  
>  	/* Handle top-level vHub EP0 interrupts */
> @@ -182,7 +172,7 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
>  
>  void ast_vhub_init_hw(struct ast_vhub *vhub)
>  {
> -	u32 ctrl;
> +	u32 ctrl, port_mask, epn_mask;
>  
>  	UDCDBG(vhub,"(Re)Starting HW ...\n");
>  
> @@ -222,15 +212,20 @@ void ast_vhub_init_hw(struct ast_vhub *vhub)
>  	}
>  
>  	/* Reset all devices */
> -	writel(VHUB_SW_RESET_ALL, vhub->regs + AST_VHUB_SW_RESET);
> +	port_mask = GENMASK(vhub->max_ports, 1);
> +	writel(VHUB_SW_RESET_ROOT_HUB |
> +	       VHUB_SW_RESET_DMA_CONTROLLER |
> +	       VHUB_SW_RESET_EP_POOL |
> +	       port_mask, vhub->regs + AST_VHUB_SW_RESET);
>  	udelay(1);
>  	writel(0, vhub->regs + AST_VHUB_SW_RESET);
>  
>  	/* Disable and cleanup EP ACK/NACK interrupts */
> +	epn_mask = GENMASK(vhub->max_epns - 1, 0);
>  	writel(0, vhub->regs + AST_VHUB_EP_ACK_IER);
>  	writel(0, vhub->regs + AST_VHUB_EP_NACK_IER);
> -	writel(VHUB_EP_IRQ_ALL, vhub->regs + AST_VHUB_EP_ACK_ISR);
> -	writel(VHUB_EP_IRQ_ALL, vhub->regs + AST_VHUB_EP_NACK_ISR);
> +	writel(epn_mask, vhub->regs + AST_VHUB_EP_ACK_ISR);
> +	writel(epn_mask, vhub->regs + AST_VHUB_EP_NACK_ISR);
>  
>  	/* Default settings for EP0, enable HW hub EP1 */
>  	writel(0, vhub->regs + AST_VHUB_EP0_CTRL);
> @@ -273,7 +268,7 @@ static int ast_vhub_remove(struct platform_device *pdev)
>  		return 0;
>  
>  	/* Remove devices */
> -	for (i = 0; i < AST_VHUB_NUM_PORTS; i++)
> +	for (i = 0; i < vhub->max_ports; i++)
>  		ast_vhub_del_dev(&vhub->ports[i].dev);
>  
>  	spin_lock_irqsave(&vhub->lock, flags);
> @@ -295,7 +290,7 @@ static int ast_vhub_remove(struct platform_device *pdev)
>  	if (vhub->ep0_bufs)
>  		dma_free_coherent(&pdev->dev,
>  				  AST_VHUB_EP0_MAX_PACKET *
> -				  (AST_VHUB_NUM_PORTS + 1),
> +				  (vhub->max_ports + 1),
>  				  vhub->ep0_bufs,
>  				  vhub->ep0_bufs_dma);
>  	vhub->ep0_bufs = NULL;
> @@ -309,11 +304,32 @@ static int ast_vhub_probe(struct platform_device *pdev)
>  	struct ast_vhub *vhub;
>  	struct resource *res;
>  	int i, rc = 0;
> +	const struct device_node *np = pdev->dev.of_node;
>  
>  	vhub = devm_kzalloc(&pdev->dev, sizeof(*vhub), GFP_KERNEL);
>  	if (!vhub)
>  		return -ENOMEM;
>  
> +	rc = of_property_read_u32(np, "aspeed,vhub-downstream-ports",
> +				  &vhub->max_ports);
> +	if (rc < 0)
> +		return -ENODEV;

This breaks the driver for old devicetrees, or at the very least,
devicetrees without your subsequent two patches in the series.

I feel we shouldn't drop the built-in values for the 2400 and 2500, that
way we can fall back to them if the devicetree properties aren't present.

For the 2600 we can have a clean break and require the properties be
present (i.e. not hardcode the values in the driver for fallback) as there
aren't yet any devicetrees describing the device.

Andrew
