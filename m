Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0822E165471
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 02:40:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NHMh4V9vzDqMn
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 12:40:00 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NHLr2KkwzDqHR;
 Thu, 20 Feb 2020 12:39:15 +1100 (AEDT)
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 01K1cC0b028187
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 19 Feb 2020 19:38:15 -0600
Message-ID: <86ab18e4ed01c6856ff47c859a3dda598dd94978.camel@kernel.crashing.org>
Subject: Re: [PATCH 1/2] usb: gadget: aspeed: allow to customize vhub device
 IDs/strings
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
Date: Thu, 20 Feb 2020 12:38:10 +1100
In-Reply-To: <20200218235600.6763-2-rentao.bupt@gmail.com>
References: <20200218235600.6763-1-rentao.bupt@gmail.com>
 <20200218235600.6763-2-rentao.bupt@gmail.com>
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

On Tue, 2020-02-18 at 15:55 -0800, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> This patch allows people to customize vendor/product/device IDs and
> manufacture/product/serial strings in vhub's device descriptor through
> device tree properties.

You should probably add a binding file to Documentation/devicetree/bindings/usb/*

We got away without one bcs there was no funky properties there but
now that we are adding some, we need to document them.

Also...

> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> ---
>  drivers/usb/gadget/udc/aspeed-vhub/hub.c | 73 +++++++++++++++++++-----
>  1 file changed, 59 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> index 9c7e57fbd8ef..4e3ef83283a6 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> @@ -43,19 +43,23 @@
>   *    - We may need to indicate TT support
>   *    - We may need a device qualifier descriptor
>   *	as devices can pretend to be usb1 or 2
> - *    - Make vid/did overridable
>   *    - make it look like usb1 if usb1 mode forced
>   */
>  #define KERNEL_REL	bin2bcd(((LINUX_VERSION_CODE >> 16) & 0x0ff))
>  #define KERNEL_VER	bin2bcd(((LINUX_VERSION_CODE >> 8) & 0x0ff))
>  
>  enum {
> +	AST_VHUB_STR_INDEX_MAX = 4,
>  	AST_VHUB_STR_MANUF = 3,
>  	AST_VHUB_STR_PRODUCT = 2,
>  	AST_VHUB_STR_SERIAL = 1,
>  };
>  
> -static const struct usb_device_descriptor ast_vhub_dev_desc = {
> +/*
> + * Below is the default Device Descriptor of the vhub device. Some fields
> + * may be updated in "ast_vhub_fixup_dev_desc" function.
> + */
> +static struct usb_device_descriptor ast_vhub_dev_desc = {
>  	.bLength		= USB_DT_DEVICE_SIZE,
>  	.bDescriptorType	= USB_DT_DEVICE,
>  	.bcdUSB			= cpu_to_le16(0x0200),
> @@ -148,10 +152,14 @@ static struct usb_hub_descriptor ast_vhub_hub_desc = {
>  };
>  
>  /*
> - * These strings converted to UTF-16 must be smaller than
> - * our EP0 buffer.
> + * Below tables define the default Language ID and String Descriptors of
> + * the vhub. Language ID and strings may be overridden if according device
> + * tree properties are defined. Refer to "ast_vhub_fixup_dev_desc" function
> + * for details.
> + * Note: these strings converted to UTF-16 must be smaller than vhub EP0
> + * buffer size.
>   */
> -static const struct usb_string ast_vhub_str_array[] = {
> +static struct usb_string ast_vhub_str_array[] = {
>  	{
>  		.id = AST_VHUB_STR_SERIAL,
>  		.s = "00000000"
> @@ -167,7 +175,7 @@ static const struct usb_string ast_vhub_str_array[] = {
>  	{ }
>  };

I dislike this. The array should remain static and contain the
defaults. The properties shouldn't modify the global array, there could
be a future chip with multiple vhubs and that would make them stomp on
each other.

Instead, duplicate the properties into the per-vhub instance data and
update the content there.

You could also skip using usb_gadget_get_string() and expose the low
level conversion function directly though that's trickier.

Also have you thought about supporting a list of strings along with an
array of language IDs ? Vendors might want to provide multiple
languages...

> -static const struct usb_gadget_strings ast_vhub_strings = {
> +static struct usb_gadget_strings ast_vhub_strings = {
>  	.language = 0x0409,
>  	.strings = (struct usb_string *)ast_vhub_str_array
>  };
> @@ -320,18 +328,15 @@ static int ast_vhub_rep_string(struct ast_vhub_ep *ep,
>  			       u8 string_id, u16 lang_id,
>  			       u16 len)
>  {
> -	int rc = usb_gadget_get_string (&ast_vhub_strings, string_id, ep->buf);
> -
> -	/*
> -	 * This should never happen unless we put too big strings in
> -	 * the array above
> -	 */
> -	BUG_ON(rc >= AST_VHUB_EP0_MAX_PACKET);
> +	int rc;
> +	u8 buf[256]; /* buffer size required by usb_gadget_get_string */
>  
> -	if (rc < 0)
> +	rc = usb_gadget_get_string(&ast_vhub_strings, string_id, buf);
> +	if (rc < 0 || rc >= AST_VHUB_EP0_MAX_PACKET)
>  		return std_req_stall;
>  
>  	/* Shoot it from the EP buffer */
> +	memcpy(ep->buf, buf, rc);
>  	return ast_vhub_reply(ep, NULL, min_t(u16, rc, len));
>  }
>  
> @@ -837,11 +842,51 @@ void ast_vhub_hub_reset(struct ast_vhub *vhub)
>  	writel(0, vhub->regs + AST_VHUB_EP1_STS_CHG);
>  }
>  
> +static void ast_vhub_fixup_dev_desc(struct ast_vhub *vhub)
> +{
> +	int i;
> +	u8 id;
> +	u16 of_id;
> +	const char *of_str[AST_VHUB_STR_INDEX_MAX] = {NULL};
> +	struct device_node *np = vhub->pdev->dev.of_node;
> +
> +	/*
> +	 * Update IDs in device descriptor if according properties are
> +	 * defined in device tree.
> +	 */
> +	if (!of_property_read_u16(np, "vendor-id", &of_id))
> +		ast_vhub_dev_desc.idVendor = cpu_to_le16(of_id);
> +	if (!of_property_read_u16(np, "product-id", &of_id))
> +		ast_vhub_dev_desc.idProduct = cpu_to_le16(of_id);
> +	if (!of_property_read_u16(np, "device-id", &of_id))
> +		ast_vhub_dev_desc.bcdDevice = cpu_to_le16(of_id);
> +
> +	/*
> +	 * Update string descriptors if according properties are defined
> +	 * in device tree.
> +	 */
> +	if (!of_property_read_u16(np, "language-id", &of_id))
> +		ast_vhub_strings.language = of_id;
> +
> +	of_str[AST_VHUB_STR_MANUF] = of_get_property(np, "manufacturer", NULL);
> +	of_str[AST_VHUB_STR_PRODUCT] = of_get_property(np, "product", NULL);
> +	of_str[AST_VHUB_STR_SERIAL] = of_get_property(np, "serial-number",
> +						      NULL);
> +
> +	for (i = 0; ast_vhub_str_array[i].s != NULL; i++) {
> +		id = ast_vhub_str_array[i].id;
> +		if (of_str[id])
> +			ast_vhub_str_array[i].s = of_str[id];
> +	}
> +}
> +
>  void ast_vhub_init_hub(struct ast_vhub *vhub)
>  {
>  	vhub->speed = USB_SPEED_UNKNOWN;
>  	INIT_WORK(&vhub->wake_work, ast_vhub_wake_work);
>  
> +	ast_vhub_fixup_dev_desc(vhub);
> +
>  	/*
>  	 * Fixup number of ports in hub descriptor.
>  	 */

