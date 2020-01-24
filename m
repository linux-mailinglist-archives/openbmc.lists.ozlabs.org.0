Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 818701476AB
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 02:24:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483hJ54C4TzDqYK
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 12:24:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=u9VVUyZE; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483hH72XV6zDqYX
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jan 2020 12:23:30 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id 4so158863pgd.6
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jan 2020 17:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LyFpT8Zv/buYOIYAL/tHarnn+wRm0Ct/bV+D4s7uSao=;
 b=u9VVUyZE9xj9J4ROZJ5fV0+AtEt12ksRuj9MxDpk4oPJRTfySNnAwmW8mjgdOPG8+F
 jsrj4G8wzKqHG9WZiWJdp386304XaUSIX/0WTp4h80rV3kGIeZqq8YCL3HGYaLP+32fE
 UmusUsxsBNhZSNMAjdu243bKdUujFywf2jNh+hiqxMfVNwitr1EXvwgGzMD2QkObCyni
 6vbzTpSQL7mWSxi1pxyDdjSZmOlRkSPwDr1wnwznROUf8LorhGWvwfJRJ9mUfl7K+tKN
 KKQTqP3GGFq2FaSQCFXB0gLdVNOfruPZprkYyUMviCdFCNxJaEFE5mQnp5a0jdbIb6xy
 PVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LyFpT8Zv/buYOIYAL/tHarnn+wRm0Ct/bV+D4s7uSao=;
 b=UONQw3Z8o8XE2urAvD3/EBvPfAVSimCXCJh2zwgTPJ8CuIdmHPDDY77vimDKD1mMWK
 D20XfbQJy1fRi3sRW6wHmhyZOM1+IDsjcRbLp15kb0tnBJHTn7v+TIyh7TmIhWH7oXj2
 YTlzV8PXRHzZYm9VuWxwZ+6/+MtLbEPuvKvii2cPiX/zh0J8CZL+9qcDYURUxDeMXYji
 rZJoMUTjm1wm8nYm1BY9xhfFVUGGXD9iOQvadL3KplUsPiG8PRMrL79vMs7MuugDlcB2
 pZYriV4A++ddNUEo/0Ogerg/nDS471HhAZc2Y6mLaTNYti5vHZohhW5DZ/M/FcJfpBl5
 c7Zg==
X-Gm-Message-State: APjAAAUJTa9IybHCnfot509n8VqQTBEG5Ji1vQJCiE2z7xTHfRYbbGu2
 fXgLqq0Ju8CfE28bHvIzEHg=
X-Google-Smtp-Source: APXvYqzgSZVl6e++Y/CgLc4TkROlPUTu9SfPfBQVxITksYJy5fzLSS+AiZ7gETM4RkysrTXBU9ly4Q==
X-Received: by 2002:a63:cf41:: with SMTP id b1mr1280626pgj.53.1579829007397;
 Thu, 23 Jan 2020 17:23:27 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91 (c-24-4-25-55.hsd1.ca.comcast.net.
 [24.4.25.55])
 by smtp.gmail.com with ESMTPSA id w187sm3999890pfw.62.2020.01.23.17.23.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Jan 2020 17:23:27 -0800 (PST)
Date: Thu, 23 Jan 2020 17:23:18 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH linux dev-5.4 v2 1/3] usb: gadget: aspeed: read vhub
 config from of_device_id
Message-ID: <20200124012317.GA22665@taoren-ubuntu-R90MNF91>
References: <20200123074956.21482-1-rentao.bupt@gmail.com>
 <20200123074956.21482-2-rentao.bupt@gmail.com>
 <3129984d-421a-42c9-bb5b-c3ee01ccd43e@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3129984d-421a-42c9-bb5b-c3ee01ccd43e@www.fastmail.com>
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

On Fri, Jan 24, 2020 at 10:39:45AM +1030, Andrew Jeffery wrote:
> 
> 
> On Thu, 23 Jan 2020, at 18:19, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > The patch moves hardcoded vhub attributes (maximum downstream ports and
> > generic endpoints) to "ast_vhub_config" structure which is attached to
> > struct of_device_id. By doing this, it will be very straightforward to
> > enable support of AST2600 vhub which has different number of downstream
> > ports and endpoints.
> > 
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > ---
> >  Changes in v2:
> >   - this is the first version. It's given v2 to align with the version
> >     of patch series.
> > 
> > 
> >  drivers/usb/gadget/udc/aspeed-vhub/core.c | 100 ++++++++++++++--------
> >  drivers/usb/gadget/udc/aspeed-vhub/dev.c  |  30 +++++--
> >  drivers/usb/gadget/udc/aspeed-vhub/epn.c  |   4 +-
> >  drivers/usb/gadget/udc/aspeed-vhub/hub.c  |  22 +++--
> >  drivers/usb/gadget/udc/aspeed-vhub/vhub.h |  21 ++---
> >  5 files changed, 107 insertions(+), 70 deletions(-)
> > 
> > diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c 
> > b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> > index 90b134d5dca9..9efbfdffad30 100644
> > --- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
> > +++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> > @@ -32,6 +32,29 @@
> >  
> >  #include "vhub.h"
> >  
> > +struct ast_vhub_config {
> > +	u32 max_ports;	/* max number of downstream ports */
> > +	u32 max_epns;	/* max number of generic endpoints */
> > +};
> > +
> > +static const struct ast_vhub_config ast2400_config = {
> > +	.max_ports = 5,
> > +	.max_epns = 15,
> > +};
> > +
> > +static const struct of_device_id ast_vhub_dt_ids[] = {
> > +	{
> > +		.compatible = "aspeed,ast2400-usb-vhub",
> > +		.data = &ast2400_config,
> > +	},
> > +	{
> > +		.compatible = "aspeed,ast2500-usb-vhub",
> > +		.data = &ast2400_config,
> > +	},
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, ast_vhub_dt_ids);
> > +
> 
> Is there a reason to move the table from where it was? It's not a problem,
> just makes the diff a bit noisier.

I move the table before ast_vhub_probe() because it is referenced in the
function.

> 
> >  void ast_vhub_done(struct ast_vhub_ep *ep, struct ast_vhub_req *req,
> >  		   int status)
> >  {
> > @@ -99,7 +122,7 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
> >  {
> >  	struct ast_vhub *vhub = data;
> >  	irqreturn_t iret = IRQ_NONE;
> > -	u32 istat;
> > +	u32 i, istat;
> >  
> >  	/* Stale interrupt while tearing down */
> >  	if (!vhub->ep0_bufs)
> > @@ -121,10 +144,10 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
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
> > @@ -134,21 +157,11 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
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
> > @@ -182,7 +195,7 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
> >  
> >  void ast_vhub_init_hw(struct ast_vhub *vhub)
> >  {
> > -	u32 ctrl;
> > +	u32 ctrl, port_mask, epn_mask;
> >  
> >  	UDCDBG(vhub,"(Re)Starting HW ...\n");
> >  
> > @@ -222,15 +235,20 @@ void ast_vhub_init_hw(struct ast_vhub *vhub)
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
> > @@ -273,7 +291,7 @@ static int ast_vhub_remove(struct platform_device *pdev)
> >  		return 0;
> >  
> >  	/* Remove devices */
> > -	for (i = 0; i < AST_VHUB_NUM_PORTS; i++)
> > +	for (i = 0; i < vhub->max_ports; i++)
> >  		ast_vhub_del_dev(&vhub->ports[i].dev);
> >  
> >  	spin_lock_irqsave(&vhub->lock, flags);
> > @@ -295,7 +313,7 @@ static int ast_vhub_remove(struct platform_device *pdev)
> >  	if (vhub->ep0_bufs)
> >  		dma_free_coherent(&pdev->dev,
> >  				  AST_VHUB_EP0_MAX_PACKET *
> > -				  (AST_VHUB_NUM_PORTS + 1),
> > +				  (vhub->max_ports + 1),
> >  				  vhub->ep0_bufs,
> >  				  vhub->ep0_bufs_dma);
> >  	vhub->ep0_bufs = NULL;
> > @@ -309,11 +327,30 @@ static int ast_vhub_probe(struct platform_device *pdev)
> >  	struct ast_vhub *vhub;
> >  	struct resource *res;
> >  	int i, rc = 0;
> > +	const struct of_device_id *ofdid;
> > +	struct ast_vhub_config *config;
> >  
> >  	vhub = devm_kzalloc(&pdev->dev, sizeof(*vhub), GFP_KERNEL);
> >  	if (!vhub)
> >  		return -ENOMEM;
> >  
> > +	ofdid = of_match_node(ast_vhub_dt_ids, pdev->dev.of_node);
> > +	if (!ofdid)
> > +		return -EINVAL;
> > +	config = ofdid->data;
> > +
> > +	vhub->max_ports = config->max_ports;
> > +	vhub->ports = devm_kcalloc(&pdev->dev, vhub->max_ports,
> > +				   sizeof(*vhub->ports), GFP_KERNEL);
> > +	if (!vhub->ports)
> > +		return -ENOMEM;
> > +
> > +	vhub->max_epns = config->max_epns;
> > +	vhub->epns = devm_kcalloc(&pdev->dev, vhub->max_epns,
> > +				  sizeof(*vhub->epns), GFP_KERNEL);
> > +	if (!vhub->epns)
> > +		return -ENOMEM;
> > +
> >  	spin_lock_init(&vhub->lock);
> >  	vhub->pdev = pdev;
> >  
> > @@ -366,7 +403,7 @@ static int ast_vhub_probe(struct platform_device *pdev)
> >  	 */
> >  	vhub->ep0_bufs = dma_alloc_coherent(&pdev->dev,
> >  					    AST_VHUB_EP0_MAX_PACKET *
> > -					    (AST_VHUB_NUM_PORTS + 1),
> > +					    (vhub->max_ports + 1),
> >  					    &vhub->ep0_bufs_dma, GFP_KERNEL);
> >  	if (!vhub->ep0_bufs) {
> >  		dev_err(&pdev->dev, "Failed to allocate EP0 DMA buffers\n");
> > @@ -380,7 +417,7 @@ static int ast_vhub_probe(struct platform_device *pdev)
> >  	ast_vhub_init_ep0(vhub, &vhub->ep0, NULL);
> >  
> >  	/* Init devices */
> > -	for (i = 0; i < AST_VHUB_NUM_PORTS && rc == 0; i++)
> > +	for (i = 0; i < vhub->max_ports && rc == 0; i++)
> >  		rc = ast_vhub_init_dev(vhub, i);
> >  	if (rc)
> >  		goto err;
> > @@ -400,17 +437,6 @@ static int ast_vhub_probe(struct platform_device *pdev)
> >  	return rc;
> >  }
> >  
> > -static const struct of_device_id ast_vhub_dt_ids[] = {
> > -	{
> > -		.compatible = "aspeed,ast2400-usb-vhub",
> > -	},
> > -	{
> > -		.compatible = "aspeed,ast2500-usb-vhub",
> > -	},
> > -	{ }
> > -};
> > -MODULE_DEVICE_TABLE(of, ast_vhub_dt_ids);
> > -
> >  static struct platform_driver ast_vhub_driver = {
> >  	.probe		= ast_vhub_probe,
> >  	.remove		= ast_vhub_remove,
> > diff --git a/drivers/usb/gadget/udc/aspeed-vhub/dev.c 
> > b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
> > index 4008e7a51188..f9b762951121 100644
> > --- a/drivers/usb/gadget/udc/aspeed-vhub/dev.c
> > +++ b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
> > @@ -77,7 +77,7 @@ static void ast_vhub_dev_enable(struct ast_vhub_dev 
> > *d)
> >  	writel(d->ep0.buf_dma, d->regs + AST_VHUB_DEV_EP0_DATA);
> >  
> >  	/* Clear stall on all EPs */
> > -	for (i = 0; i < AST_VHUB_NUM_GEN_EPs; i++) {
> > +	for (i = 0; i < d->max_epns; i++) {
> >  		struct ast_vhub_ep *ep = d->epns[i];
> >  
> >  		if (ep && (ep->epn.stalled || ep->epn.wedged)) {
> > @@ -137,7 +137,7 @@ static int ast_vhub_ep_feature(struct ast_vhub_dev *d,
> >  	     is_set ? "SET" : "CLEAR", ep_num, wValue);
> >  	if (ep_num == 0)
> >  		return std_req_complete;
> > -	if (ep_num >= AST_VHUB_NUM_GEN_EPs || !d->epns[ep_num - 1])
> > +	if (ep_num >= d->max_epns || !d->epns[ep_num - 1])
> >  		return std_req_stall;
> >  	if (wValue != USB_ENDPOINT_HALT)
> >  		return std_req_driver;
> > @@ -181,7 +181,7 @@ static int ast_vhub_ep_status(struct ast_vhub_dev *d,
> >  
> >  	DDBG(d, "GET_STATUS(ep%d)\n", ep_num);
> >  
> > -	if (ep_num >= AST_VHUB_NUM_GEN_EPs)
> > +	if (ep_num >= d->max_epns)
> >  		return std_req_stall;
> >  	if (ep_num != 0) {
> >  		ep = d->epns[ep_num - 1];
> > @@ -299,7 +299,7 @@ static void ast_vhub_dev_nuke(struct ast_vhub_dev *d)
> >  {
> >  	unsigned int i;
> >  
> > -	for (i = 0; i < AST_VHUB_NUM_GEN_EPs; i++) {
> > +	for (i = 0; i < d->max_epns; i++) {
> >  		if (!d->epns[i])
> >  			continue;
> >  		ast_vhub_nuke(d->epns[i], -ESHUTDOWN);
> > @@ -416,10 +416,10 @@ static struct usb_ep 
> > *ast_vhub_udc_match_ep(struct usb_gadget *gadget,
> >  	 * that will allow the generic code to use our
> >  	 * assigned address.
> >  	 */
> > -	for (i = 0; i < AST_VHUB_NUM_GEN_EPs; i++)
> > +	for (i = 0; i < d->max_epns; i++)
> >  		if (d->epns[i] == NULL)
> >  			break;
> > -	if (i >= AST_VHUB_NUM_GEN_EPs)
> > +	if (i >= d->max_epns)
> >  		return NULL;
> >  	addr = i + 1;
> >  
> > @@ -526,6 +526,7 @@ void ast_vhub_del_dev(struct ast_vhub_dev *d)
> >  
> >  	usb_del_gadget_udc(&d->gadget);
> >  	device_unregister(d->port_dev);
> > +	kfree(d->epns);
> >  }
> >  
> >  static void ast_vhub_dev_release(struct device *dev)
> > @@ -546,14 +547,25 @@ int ast_vhub_init_dev(struct ast_vhub *vhub, 
> > unsigned int idx)
> >  
> >  	ast_vhub_init_ep0(vhub, &d->ep0, d);
> >  
> > +	/*
> > +	 * A USB device can have up to 30 endpoints besides control
> > +	 * endpoint 0.
> > +	 */
> > +	d->max_epns = min(vhub->max_epns, 30);
> > +	d->epns = kcalloc(d->max_epns, sizeof(*d->epns), GFP_KERNEL);
> > +	if (!d->epns)
> > +		return -ENOMEM;
> > +
> >  	/*
> >  	 * The UDC core really needs us to have separate and uniquely
> >  	 * named "parent" devices for each port so we create a sub device
> >  	 * here for that purpose
> >  	 */
> >  	d->port_dev = kzalloc(sizeof(struct device), GFP_KERNEL);
> > -	if (!d->port_dev)
> > -		return -ENOMEM;
> > +	if (!d->port_dev) {
> > +		rc = -ENOMEM;
> > +		goto fail_alloc;
> > +	}
> >  	device_initialize(d->port_dev);
> >  	d->port_dev->release = ast_vhub_dev_release;
> >  	d->port_dev->parent = parent;
> > @@ -584,6 +596,8 @@ int ast_vhub_init_dev(struct ast_vhub *vhub, 
> > unsigned int idx)
> >  	device_del(d->port_dev);
> >   fail_add:
> >  	put_device(d->port_dev);
> > + fail_alloc:
> > +	kfree(d->epns);
> >  
> >  	return rc;
> >  }
> > diff --git a/drivers/usb/gadget/udc/aspeed-vhub/epn.c 
> > b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
> > index 7475c74aa5c5..0bd6b20435b8 100644
> > --- a/drivers/usb/gadget/udc/aspeed-vhub/epn.c
> > +++ b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
> > @@ -800,10 +800,10 @@ struct ast_vhub_ep *ast_vhub_alloc_epn(struct 
> > ast_vhub_dev *d, u8 addr)
> >  
> >  	/* Find a free one (no device) */
> >  	spin_lock_irqsave(&vhub->lock, flags);
> > -	for (i = 0; i < AST_VHUB_NUM_GEN_EPs; i++)
> > +	for (i = 0; i < vhub->max_epns; i++)
> >  		if (vhub->epns[i].dev == NULL)
> >  			break;
> > -	if (i >= AST_VHUB_NUM_GEN_EPs) {
> > +	if (i >= vhub->max_epns) {
> >  		spin_unlock_irqrestore(&vhub->lock, flags);
> >  		return NULL;
> >  	}
> > diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c 
> > b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> > index 19b3517e04c0..aa1c127e9f2f 100644
> > --- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> > +++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> > @@ -133,10 +133,9 @@ static const struct ast_vhub_full_cdesc {
> >  
> >  #define AST_VHUB_HUB_DESC_SIZE	(USB_DT_HUB_NONVAR_SIZE + 2)
> >  
> > -static const struct usb_hub_descriptor ast_vhub_hub_desc = {
> > +static struct usb_hub_descriptor ast_vhub_hub_desc = {
> 
> This seems unfortunate, though we only have one on the SoC... is
> it worth dynamically allocating it? Or adding a comment?
> 
> Andrew

According to the comment at the beginning of the file (line 39-47), we
may customize more descriptors in the future. Adding comments involves
little change in this case, because by allocating the descriptors, we
will also need a function to free the descriptors when ast_vhub_remove
is called. Anyways I'm fine with either way.

There is another option which is to fixup descriptors in request_desc
callback, like ast_vhub_patch_dev_desc_usb1() in the file. But I don't
like the approach personally.

Which way do you prefer?


Cheers,

Tao
