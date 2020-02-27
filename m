Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE91170F4D
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 05:03:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SfD00zCnzDqrC
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 15:03:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=76.164.61.194; helo=kernel.crashing.org;
 envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SfC7250bzDqrC;
 Thu, 27 Feb 2020 15:02:42 +1100 (AEDT)
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 01R41lA3022351
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 26 Feb 2020 22:01:51 -0600
Message-ID: <e76edda178cd83c4aa5d0282c481425c34653f5e.camel@kernel.crashing.org>
Subject: Re: [PATCH v4 1/7] usb: gadget: aspeed: support per-vhub usb
 descriptors
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: rentao.bupt@gmail.com, Felipe Balbi <balbi@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>, Stephen Boyd
 <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, taoren@fb.com
Date: Thu, 27 Feb 2020 15:01:47 +1100
In-Reply-To: <20200226230346.672-2-rentao.bupt@gmail.com>
References: <20200226230346.672-1-rentao.bupt@gmail.com>
 <20200226230346.672-2-rentao.bupt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Wed, 2020-02-26 at 15:03 -0800, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> This patch store vhub's standard usb descriptors in struct "ast_vhub"
> so
> it's more convenient to customize descriptors and potentially support
> multiple vhub instances in the future.
> 
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>

Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
> ---
>  No change in v2/v3/v4:
>    - the patch is added to the patch series since v4.
> 
>  drivers/usb/gadget/udc/aspeed-vhub/hub.c  | 43 ++++++++++++++++-----
> --
>  drivers/usb/gadget/udc/aspeed-vhub/vhub.h | 15 ++++++++
>  2 files changed, 46 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> index 19b3517e04c0..9c3027306b15 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> @@ -93,11 +93,7 @@ static void ast_vhub_patch_dev_desc_usb1(struct
> usb_device_descriptor *desc)
>  				 USB_DT_INTERFACE_SIZE + \
>  				 USB_DT_ENDPOINT_SIZE)
>  
> -static const struct ast_vhub_full_cdesc {
> -	struct usb_config_descriptor	cfg;
> -	struct usb_interface_descriptor intf;
> -	struct usb_endpoint_descriptor	ep;
> -} __attribute__ ((packed)) ast_vhub_conf_desc = {
> +static const struct ast_vhub_full_cdesc ast_vhub_conf_desc = {
>  	.cfg = {
>  		.bLength		= USB_DT_CONFIG_SIZE,
>  		.bDescriptorType	= USB_DT_CONFIG,
> @@ -266,6 +262,7 @@ static int ast_vhub_rep_desc(struct ast_vhub_ep
> *ep,
>  			     u8 desc_type, u16 len)
>  {
>  	size_t dsize;
> +	struct ast_vhub *vhub = ep->vhub;
>  
>  	EPDBG(ep, "GET_DESCRIPTOR(type:%d)\n", desc_type);
>  
> @@ -281,20 +278,20 @@ static int ast_vhub_rep_desc(struct ast_vhub_ep
> *ep,
>  	switch(desc_type) {
>  	case USB_DT_DEVICE:
>  		dsize = USB_DT_DEVICE_SIZE;
> -		memcpy(ep->buf, &ast_vhub_dev_desc, dsize);
> -		BUILD_BUG_ON(dsize > sizeof(ast_vhub_dev_desc));
> +		memcpy(ep->buf, &vhub->vhub_dev_desc, dsize);
> +		BUILD_BUG_ON(dsize > sizeof(vhub->vhub_dev_desc));
>  		BUILD_BUG_ON(USB_DT_DEVICE_SIZE >=
> AST_VHUB_EP0_MAX_PACKET);
>  		break;
>  	case USB_DT_CONFIG:
>  		dsize = AST_VHUB_CONF_DESC_SIZE;
> -		memcpy(ep->buf, &ast_vhub_conf_desc, dsize);
> -		BUILD_BUG_ON(dsize > sizeof(ast_vhub_conf_desc));
> +		memcpy(ep->buf, &vhub->vhub_conf_desc, dsize);
> +		BUILD_BUG_ON(dsize > sizeof(vhub->vhub_conf_desc));
>  		BUILD_BUG_ON(AST_VHUB_CONF_DESC_SIZE >=
> AST_VHUB_EP0_MAX_PACKET);
>  		break;
>  	case USB_DT_HUB:
>  		dsize = AST_VHUB_HUB_DESC_SIZE;
> -		memcpy(ep->buf, &ast_vhub_hub_desc, dsize);
> -		BUILD_BUG_ON(dsize > sizeof(ast_vhub_hub_desc));
> +		memcpy(ep->buf, &vhub->vhub_hub_desc, dsize);
> +		BUILD_BUG_ON(dsize > sizeof(vhub->vhub_hub_desc));
>  		BUILD_BUG_ON(AST_VHUB_HUB_DESC_SIZE >=
> AST_VHUB_EP0_MAX_PACKET);
>  		break;
>  	default:
> @@ -317,7 +314,8 @@ static int ast_vhub_rep_string(struct ast_vhub_ep
> *ep,
>  			       u8 string_id, u16 lang_id,
>  			       u16 len)
>  {
> -	int rc = usb_gadget_get_string (&ast_vhub_strings, string_id,
> ep->buf);
> +	int rc = usb_gadget_get_string(&ep->vhub->vhub_str_desc,
> +					string_id, ep->buf);
>  
>  	/*
>  	 * This should never happen unless we put too big strings in
> @@ -834,9 +832,30 @@ void ast_vhub_hub_reset(struct ast_vhub *vhub)
>  	writel(0, vhub->regs + AST_VHUB_EP1_STS_CHG);
>  }
>  
> +static void ast_vhub_init_desc(struct ast_vhub *vhub)
> +{
> +	/* Initialize vhub Device Descriptor. */
> +	memcpy(&vhub->vhub_dev_desc, &ast_vhub_dev_desc,
> +		sizeof(vhub->vhub_dev_desc));
> +
> +	/* Initialize vhub Configuration Descriptor. */
> +	memcpy(&vhub->vhub_conf_desc, &ast_vhub_conf_desc,
> +		sizeof(vhub->vhub_conf_desc));
> +
> +	/* Initialize vhub Hub Descriptor. */
> +	memcpy(&vhub->vhub_hub_desc, &ast_vhub_hub_desc,
> +		sizeof(vhub->vhub_hub_desc));
> +
> +	/* Initialize vhub String Descriptors. */
> +	memcpy(&vhub->vhub_str_desc, &ast_vhub_strings,
> +		sizeof(vhub->vhub_str_desc));
> +}
> +
>  void ast_vhub_init_hub(struct ast_vhub *vhub)
>  {
>  	vhub->speed = USB_SPEED_UNKNOWN;
>  	INIT_WORK(&vhub->wake_work, ast_vhub_wake_work);
> +
> +	ast_vhub_init_desc(vhub);
>  }
>  
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
> b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
> index 761919e220d3..191f9fae7420 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
> @@ -2,6 +2,9 @@
>  #ifndef __ASPEED_VHUB_H
>  #define __ASPEED_VHUB_H
>  
> +#include <linux/usb.h>
> +#include <linux/usb/ch11.h>
> +
>  /*****************************
>   *                           *
>   * VHUB register definitions *
> @@ -373,6 +376,12 @@ struct ast_vhub_port {
>  	struct ast_vhub_dev	dev;
>  };
>  
> +struct ast_vhub_full_cdesc {
> +	struct usb_config_descriptor	cfg;
> +	struct usb_interface_descriptor intf;
> +	struct usb_endpoint_descriptor	ep;
> +} __packed;
> +
>  /* Global vhub structure */
>  struct ast_vhub {
>  	struct platform_device		*pdev;
> @@ -409,6 +418,12 @@ struct ast_vhub {
>  
>  	/* Upstream bus speed captured at bus reset */
>  	unsigned int			speed;
> +
> +	/* Standard USB Descriptors of the vhub. */
> +	struct usb_device_descriptor	vhub_dev_desc;
> +	struct ast_vhub_full_cdesc	vhub_conf_desc;
> +	struct usb_hub_descriptor	vhub_hub_desc;
> +	struct usb_gadget_strings	vhub_str_desc;
>  };
>  
>  /* Standard request handlers result codes */

