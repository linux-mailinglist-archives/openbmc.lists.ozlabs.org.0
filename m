Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 152C0161F86
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 04:22:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48M5l71tpTzDqFF
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 14:22:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.215.195;
 helo=mail-pg1-f195.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fw+FONLX; dkim-atps=neutral
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48M5h64xX3zDqcS;
 Tue, 18 Feb 2020 14:20:05 +1100 (AEDT)
Received: by mail-pg1-f195.google.com with SMTP id b9so10087201pgk.12;
 Mon, 17 Feb 2020 19:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=etQ+t/7VG4IZoH3WXAn4ZMXCgYAT/i/aklOkEa+e7rs=;
 b=fw+FONLXM7Xl96QAWK97Mk1ruN0YvCFZJDkljxglKntbqp01GReRVrGXQFsBYIyqa7
 +4D8QRUHpB4v4Jg9ZGhpAahj9g48CEbJwS13jX4tror7c4U/GKwnRObS1o5GR0Vlya41
 ooElUrb4yyVeFtqFIGiQ+f20JseSFdYSVwUVPhOiGQHlJjBatXm22cnS3NR4gdbAt/1T
 WzXBeUYkeWqj0x9oCD+C1RVUqPkDsc1ZKRaAbpC0WgFOIllZLVCfsdXm4MPjww0DTc+0
 FLoKyRazbRj7OHzC83kE3uvpoqGeuOGMfS+GgisCPB9tAXjPn9Nn81n0cbGN+T5oJYIr
 hCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=etQ+t/7VG4IZoH3WXAn4ZMXCgYAT/i/aklOkEa+e7rs=;
 b=KtmYHLUBQJr+Nr4fAIyZsY4ci0LUwIUQWqMzYGBNooKpEQDYX+eZVhEOsp8yT98IcG
 d2NNasA1adlkSzR76wfIqV8bkmnnjkTyuWSjmCgQE9e03XYZeqzRsRm0+JlQAXt+O8dx
 04l0KgLdyA3i7sQVgLDITrwTjUU4cExTnb39/FcrUfbDM3+WU2m+QhJ5DVq55ZB02yoC
 PvmWoZkFSTIdGw2zLitzVfkLPvESWAn9wnGA+DAcn5xRumL1siVHIWEG7h9QDtHH2Guu
 u3OwjksMQ2Na3pslHLKl2eMap+XmW+/At+orNMIJA1D3MLt1WWABl9preTAYauHaz2Hh
 1DGg==
X-Gm-Message-State: APjAAAWg00wEAYG7PDwPdEj43txTIMhkyJp1JPyoxYV+trIzGDZuPOHy
 zwtsTh9Xxd0wPsbGi45PVkw=
X-Google-Smtp-Source: APXvYqziWd7nu/eWKo4sMrajO2Ujd/Gv+FWdUHMPQTkjk0MK4zdVhdbwPDw+tuAl2tUWwU4wpe1sDw==
X-Received: by 2002:a62:4e42:: with SMTP id c63mr19378401pfb.86.1581995944131; 
 Mon, 17 Feb 2020 19:19:04 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91 ([2620:10d:c090:180::ddbe])
 by smtp.gmail.com with ESMTPSA id c19sm1819713pfc.144.2020.02.17.19.19.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 17 Feb 2020 19:19:03 -0800 (PST)
Date: Mon, 17 Feb 2020 19:18:56 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 1/5] usb: gadget: aspeed: read vhub properties from
 device tree
Message-ID: <20200218031855.GA646@taoren-ubuntu-R90MNF91>
References: <20200212215717.9474-1-rentao.bupt@gmail.com>
 <20200212215717.9474-2-rentao.bupt@gmail.com>
 <88f74fcd-537d-497d-bb39-346e56da34e2@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88f74fcd-537d-497d-bb39-346e56da34e2@www.fastmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org, Tao Ren <taoren@fb.com>,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin King <colin.king@canonical.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

On Mon, Feb 17, 2020 at 10:18:11AM +1030, Andrew Jeffery wrote:
> 
> 
> On Thu, 13 Feb 2020, at 08:27, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > The patch introduces 2 DT properties ("aspeed,vhub-downstream-ports" and
> > "aspeed,vhub-generic-endpoints") which replaces hardcoded port/endpoint
> > number. It is to make it more convenient to add support for newer vhub
> > revisions with different number of ports and endpoints.
> > 
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > ---
> >  Changes in v2:
> >    - removed ast_vhub_config structure and moved vhub port/endpoint
> >      number into device tree.
> > 
> >  drivers/usb/gadget/udc/aspeed-vhub/core.c | 68 ++++++++++++++---------
> >  drivers/usb/gadget/udc/aspeed-vhub/dev.c  | 30 +++++++---
> >  drivers/usb/gadget/udc/aspeed-vhub/epn.c  |  4 +-
> >  drivers/usb/gadget/udc/aspeed-vhub/hub.c  | 26 ++++++---
> >  drivers/usb/gadget/udc/aspeed-vhub/vhub.h | 23 +++-----
> >  5 files changed, 91 insertions(+), 60 deletions(-)
> > 
> > diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c 
> > b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> > index 90b134d5dca9..d6f737fac4e2 100644
> > --- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
> > +++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> > @@ -99,7 +99,7 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
> >  {
> >  	struct ast_vhub *vhub = data;
> >  	irqreturn_t iret = IRQ_NONE;
> > -	u32 istat;
> > +	u32 i, istat;
> >  
> >  	/* Stale interrupt while tearing down */
> >  	if (!vhub->ep0_bufs)
> > @@ -121,10 +121,10 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
> >  
> >  	/* Handle generic EPs first */
> >  	if (istat & VHUB_IRQ_EP_POOL_ACK_STALL) {
> > -		u32 i, ep_acks = readl(vhub->regs + AST_VHUB_EP_ACK_ISR);
> > +		u32 ep_acks = readl(vhub->regs + AST_VHUB_EP_ACK_ISR);
> >  		writel(ep_acks, vhub->regs + AST_VHUB_EP_ACK_ISR);
> >  
> > -		for (i = 0; ep_acks && i < AST_VHUB_NUM_GEN_EPs; i++) {
> > +		for (i = 0; ep_acks && i < vhub->max_epns; i++) {
> >  			u32 mask = VHUB_EP_IRQ(i);
> >  			if (ep_acks & mask) {
> >  				ast_vhub_epn_ack_irq(&vhub->epns[i]);
> > @@ -134,21 +134,11 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
> >  	}
> >  
> >  	/* Handle device interrupts */
> > -	if (istat & (VHUB_IRQ_DEVICE1 |
> > -		     VHUB_IRQ_DEVICE2 |
> > -		     VHUB_IRQ_DEVICE3 |
> > -		     VHUB_IRQ_DEVICE4 |
> > -		     VHUB_IRQ_DEVICE5)) {
> > -		if (istat & VHUB_IRQ_DEVICE1)
> > -			ast_vhub_dev_irq(&vhub->ports[0].dev);
> > -		if (istat & VHUB_IRQ_DEVICE2)
> > -			ast_vhub_dev_irq(&vhub->ports[1].dev);
> > -		if (istat & VHUB_IRQ_DEVICE3)
> > -			ast_vhub_dev_irq(&vhub->ports[2].dev);
> > -		if (istat & VHUB_IRQ_DEVICE4)
> > -			ast_vhub_dev_irq(&vhub->ports[3].dev);
> > -		if (istat & VHUB_IRQ_DEVICE5)
> > -			ast_vhub_dev_irq(&vhub->ports[4].dev);
> > +	for (i = 0; i < vhub->max_ports; i++) {
> > +		u32 dev_mask = VHUB_IRQ_DEVICE1 << i;
> > +
> > +		if (istat & dev_mask)
> > +			ast_vhub_dev_irq(&vhub->ports[i].dev);
> >  	}
> >  
> >  	/* Handle top-level vHub EP0 interrupts */
> > @@ -182,7 +172,7 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
> >  
> >  void ast_vhub_init_hw(struct ast_vhub *vhub)
> >  {
> > -	u32 ctrl;
> > +	u32 ctrl, port_mask, epn_mask;
> >  
> >  	UDCDBG(vhub,"(Re)Starting HW ...\n");
> >  
> > @@ -222,15 +212,20 @@ void ast_vhub_init_hw(struct ast_vhub *vhub)
> >  	}
> >  
> >  	/* Reset all devices */
> > -	writel(VHUB_SW_RESET_ALL, vhub->regs + AST_VHUB_SW_RESET);
> > +	port_mask = GENMASK(vhub->max_ports, 1);
> > +	writel(VHUB_SW_RESET_ROOT_HUB |
> > +	       VHUB_SW_RESET_DMA_CONTROLLER |
> > +	       VHUB_SW_RESET_EP_POOL |
> > +	       port_mask, vhub->regs + AST_VHUB_SW_RESET);
> >  	udelay(1);
> >  	writel(0, vhub->regs + AST_VHUB_SW_RESET);
> >  
> >  	/* Disable and cleanup EP ACK/NACK interrupts */
> > +	epn_mask = GENMASK(vhub->max_epns - 1, 0);
> >  	writel(0, vhub->regs + AST_VHUB_EP_ACK_IER);
> >  	writel(0, vhub->regs + AST_VHUB_EP_NACK_IER);
> > -	writel(VHUB_EP_IRQ_ALL, vhub->regs + AST_VHUB_EP_ACK_ISR);
> > -	writel(VHUB_EP_IRQ_ALL, vhub->regs + AST_VHUB_EP_NACK_ISR);
> > +	writel(epn_mask, vhub->regs + AST_VHUB_EP_ACK_ISR);
> > +	writel(epn_mask, vhub->regs + AST_VHUB_EP_NACK_ISR);
> >  
> >  	/* Default settings for EP0, enable HW hub EP1 */
> >  	writel(0, vhub->regs + AST_VHUB_EP0_CTRL);
> > @@ -273,7 +268,7 @@ static int ast_vhub_remove(struct platform_device *pdev)
> >  		return 0;
> >  
> >  	/* Remove devices */
> > -	for (i = 0; i < AST_VHUB_NUM_PORTS; i++)
> > +	for (i = 0; i < vhub->max_ports; i++)
> >  		ast_vhub_del_dev(&vhub->ports[i].dev);
> >  
> >  	spin_lock_irqsave(&vhub->lock, flags);
> > @@ -295,7 +290,7 @@ static int ast_vhub_remove(struct platform_device *pdev)
> >  	if (vhub->ep0_bufs)
> >  		dma_free_coherent(&pdev->dev,
> >  				  AST_VHUB_EP0_MAX_PACKET *
> > -				  (AST_VHUB_NUM_PORTS + 1),
> > +				  (vhub->max_ports + 1),
> >  				  vhub->ep0_bufs,
> >  				  vhub->ep0_bufs_dma);
> >  	vhub->ep0_bufs = NULL;
> > @@ -309,11 +304,32 @@ static int ast_vhub_probe(struct platform_device *pdev)
> >  	struct ast_vhub *vhub;
> >  	struct resource *res;
> >  	int i, rc = 0;
> > +	const struct device_node *np = pdev->dev.of_node;
> >  
> >  	vhub = devm_kzalloc(&pdev->dev, sizeof(*vhub), GFP_KERNEL);
> >  	if (!vhub)
> >  		return -ENOMEM;
> >  
> > +	rc = of_property_read_u32(np, "aspeed,vhub-downstream-ports",
> > +				  &vhub->max_ports);
> > +	if (rc < 0)
> > +		return -ENODEV;
> 
> This breaks the driver for old devicetrees, or at the very least,
> devicetrees without your subsequent two patches in the series.
> 
> I feel we shouldn't drop the built-in values for the 2400 and 2500, that
> way we can fall back to them if the devicetree properties aren't present.
> 
> For the 2600 we can have a clean break and require the properties be
> present (i.e. not hardcode the values in the driver for fallback) as there
> aren't yet any devicetrees describing the device.
> 
> Andrew

I understand it. I was also hesitating whether we should make the DT
properties mandatory.. I've sent out patch v3 which falls back to
"default" number of ports and endpoints in case the DT properties are
not present.


Cheers,

Tao
