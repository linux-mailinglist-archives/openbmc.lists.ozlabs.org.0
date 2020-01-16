Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C420514009A
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 01:12:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zM2T6258zDrMX
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 11:12:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MIEjfcO9; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zLjL1ttxzDrDX
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2020 10:57:40 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id u63so3549488pjb.0
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jan 2020 15:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7SpleBo50jVTvWXQKfJFHdNBS1I7dCIkBqrJHrj3oYo=;
 b=MIEjfcO9cZ5F+WohRd3jkrCM1SHNxOmeEHuTGWn+cZA3JzHV1ViEGpVKxm5lBZLE5S
 lc2Uos/3nzavOK9JTcJraXbVYB9ahS8/T0jg32TPfMoEmSjJsyQiowBTjlRjmuhWEK4N
 UaMBvCf6pHxSP2NkOy/y+O4sDcsrsL4+EUB4svZAMM7mHfPVZLiUwrlc3JyJOxS2Lumn
 N7RntHZFRlRCx5nj8tjmznktJOmkBLOD6p0zuBj4WJsDNZ8BRYx4qihuy7VPSpmgSghW
 zm33U9Pui3JKpfJPvt0RZGEM+MkfGeFSe0dqB+sygrFoQ2i0Vb4xkAOolZ4pRhoxeMdR
 sHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7SpleBo50jVTvWXQKfJFHdNBS1I7dCIkBqrJHrj3oYo=;
 b=deqLrAaUNWaMN+Xm9+UVraP9f8BSeKaj+earnEZ8UUMlNafhK5WVBB9a2DwPahVmcs
 /yJms+tJIzNCZLlqK0ABmL4eSVYuEAkMB/FsNFWRZPH7KWmaVcS90yVbpihwZ5xTb/V4
 HnQ8gbyKHHE83/W9VWFculnG0vJd90PbnTg+5d8Llo+0izA7sqCDrHumy+bV1Wz1gR7/
 tUqx4jlaSdyY9W1TK46zKDOMBvYqwDR6uzkfXu8fPO/7XtoVlQ8Txo+Jb/1JkAxiIIQf
 ABu0lon70d6PAS6zi0Wkho3k7vDO94nK12zkk3Z9+j06sxy8EutfOlTpeA2HaKxenXce
 0SNg==
X-Gm-Message-State: APjAAAUDYQT8pmN6j3spxnuKqh8nBdjj9WgmG8WlZAOq2v09Age0hpaR
 Ad03jSvbcGn1ZnuCISiej7w=
X-Google-Smtp-Source: APXvYqyjdXQq7gDSyblOXuBRNcJM5eBC3eNjVV/i0EbFZZoLfAAAqlyCHrnVSYGaP+rjYJUyB/J+uw==
X-Received: by 2002:a17:90a:cc10:: with SMTP id
 b16mr2139201pju.55.1579219057517; 
 Thu, 16 Jan 2020 15:57:37 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91 ([2620:10d:c090:200::3:489])
 by smtp.gmail.com with ESMTPSA id z30sm25608322pff.131.2020.01.16.15.57.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 16 Jan 2020 15:57:37 -0800 (PST)
Date: Thu, 16 Jan 2020 15:57:30 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH linux dev-5.4 1/2] usb: gadget: aspeed: add ast2600 vhub
 support
Message-ID: <20200116235729.GA7867@taoren-ubuntu-R90MNF91>
References: <20200116232525.2819-1-rentao.bupt@gmail.com>
 <20200116232525.2819-2-rentao.bupt@gmail.com>
 <27f552c8-52bd-4452-9457-54a1963ef67e@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27f552c8-52bd-4452-9457-54a1963ef67e@www.fastmail.com>
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
Cc: Tao Ren <taoren@fb.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jan 17, 2020 at 10:13:57AM +1030, Andrew Jeffery wrote:
> 
> 
> On Fri, 17 Jan 2020, at 09:55, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > Add AST2600 support in aspeed-vhub driver.
> > 
> > There are 3 major differences between AST2500 and AST2600 vhub:
> >   - AST2600 supports 7 downstream devices while AST2500 supports 5.
> >   - AST2600 supports 21 programmable endpoints while AST2500 supports 15.
> >   - EP0 data buffer's 8-byte DMA alignment restriction is removed from
> >     AST2600.
> > 
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > ---
> >  drivers/usb/gadget/udc/aspeed-vhub/Kconfig |  4 +--
> >  drivers/usb/gadget/udc/aspeed-vhub/core.c  | 25 ++++++-----------
> >  drivers/usb/gadget/udc/aspeed-vhub/vhub.h  | 32 ++++++++++++++++------
> >  3 files changed, 35 insertions(+), 26 deletions(-)
> > 
> > diff --git a/drivers/usb/gadget/udc/aspeed-vhub/Kconfig 
> > b/drivers/usb/gadget/udc/aspeed-vhub/Kconfig
> > index 83ba8a2eb6af..605500b19cf3 100644
> > --- a/drivers/usb/gadget/udc/aspeed-vhub/Kconfig
> > +++ b/drivers/usb/gadget/udc/aspeed-vhub/Kconfig
> > @@ -4,5 +4,5 @@ config USB_ASPEED_VHUB
> >  	depends on ARCH_ASPEED || COMPILE_TEST
> >  	depends on USB_LIBCOMPOSITE
> >  	help
> > -	  USB peripheral controller for the Aspeed AST2500 family
> > -	  SoCs supporting the "vHub" functionality and USB2.0
> > +	  USB peripheral controller for the Aspeed AST2400, AST2500 and
> > +	  AST2600 family SoCs supporting the "vHub" functionality and USB2.0
> > diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c 
> > b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> > index 90b134d5dca9..5fafe91d3619 100644
> > --- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
> > +++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> > @@ -97,6 +97,7 @@ void ast_vhub_free_request(struct usb_ep *u_ep, 
> > struct usb_request *u_req)
> >  
> >  static irqreturn_t ast_vhub_irq(int irq, void *data)
> >  {
> > +	u32 i;
> >  	struct ast_vhub *vhub = data;
> >  	irqreturn_t iret = IRQ_NONE;
> >  	u32 istat;
> > @@ -121,7 +122,7 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
> >  
> >  	/* Handle generic EPs first */
> >  	if (istat & VHUB_IRQ_EP_POOL_ACK_STALL) {
> > -		u32 i, ep_acks = readl(vhub->regs + AST_VHUB_EP_ACK_ISR);
> > +		u32 ep_acks = readl(vhub->regs + AST_VHUB_EP_ACK_ISR);
> >  		writel(ep_acks, vhub->regs + AST_VHUB_EP_ACK_ISR);
> >  
> >  		for (i = 0; ep_acks && i < AST_VHUB_NUM_GEN_EPs; i++) {
> > @@ -134,21 +135,10 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
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
> > +	for (i = 0; i < AST_VHUB_NUM_PORTS; i++) {
> > +		u32 dev_irq = VHUB_IRQ_DEVICE1 << i;
> > +		if (istat & dev_irq)
> > +			ast_vhub_dev_irq(&vhub->ports[i].dev);
> >  	}
> >  
> >  	/* Handle top-level vHub EP0 interrupts */
> > @@ -407,6 +397,9 @@ static const struct of_device_id ast_vhub_dt_ids[] 
> > = {
> >  	{
> >  		.compatible = "aspeed,ast2500-usb-vhub",
> >  	},
> > +	{
> > +		.compatible = "aspeed,ast2600-usb-vhub",
> > +	},
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(of, ast_vhub_dt_ids);
> > diff --git a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h 
> > b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
> > index 761919e220d3..76935d02decf 100644
> > --- a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
> > +++ b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
> > @@ -2,6 +2,23 @@
> >  #ifndef __ASPEED_VHUB_H
> >  #define __ASPEED_VHUB_H
> >  
> > +/*****************************
> > + *                           *
> > + * Maximum devices/endpoints *
> > + *                           *
> > + *****************************/
> > +
> > +#ifdef CONFIG_MACH_ASPEED_G6
> 
> No, this prevents building a kernel supporting multiple AST generations. Please
> describe the differences in a platform data struct attached to struct of_device_id.

Got it. I took "#ifdef" approach just because it involves little
changes. Let me move to of_device_id direction then.

> Also, what's the plan for upstreaming these changes? It's okay to send them for
> inclusion in the openbmc tree if you're wanting them to bake there for some
> more widespread testing, but it's not clear what the intent is.
> 
> Cheers,
> 
> Andrew

My major goal was to get more testing and early feedback. Given we've
decided to go with of_device_id approach, let's ignore the patchs then.


Cheers,

Tao
