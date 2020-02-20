Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D76165477
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 02:41:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NHP743CNzDqH5
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 12:41:15 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NHN82XwbzDqH5;
 Thu, 20 Feb 2020 12:40:23 +1100 (AEDT)
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 01K1dkWX028195
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 19 Feb 2020 19:39:49 -0600
Message-ID: <55e77bcb37ec780094b8d226f89bd5557e30d913.camel@kernel.crashing.org>
Subject: Re: [PATCH 2/2] usb: gadget: aspeed: fixup usb1 device descriptor
 at init time
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
Date: Thu, 20 Feb 2020 12:39:45 +1100
In-Reply-To: <20200218235600.6763-3-rentao.bupt@gmail.com>
References: <20200218235600.6763-1-rentao.bupt@gmail.com>
 <20200218235600.6763-3-rentao.bupt@gmail.com>
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

On Tue, 2020-02-18 at 15:56 -0800, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> This patch moves fixup-usb1-device-descriptor logic from get_descriptor
> handler to "ast_vhub_fixup_dev_desc" function so the device descriptor
> is only patched once (at vhub init time).

I don't like this either. We should make ast_vhub_dev_desc and patch a
copy here too. I know today there's only one instance of the vhub in a
given SoC but that might not always be the case.

> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> ---
>  drivers/usb/gadget/udc/aspeed-vhub/hub.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> index 4e3ef83283a6..b8bf54b12adc 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> @@ -76,13 +76,6 @@ static struct usb_device_descriptor ast_vhub_dev_desc = {
>  	.bNumConfigurations	= 1,
>  };
>  
> -/* Patches to the above when forcing USB1 mode */
> -static void ast_vhub_patch_dev_desc_usb1(struct usb_device_descriptor *desc)
> -{
> -	desc->bcdUSB = cpu_to_le16(0x0100);
> -	desc->bDeviceProtocol = 0;
> -}
> -
>  /*
>   * Configuration descriptor: same comments as above
>   * regarding handling USB1 mode.
> @@ -316,10 +309,6 @@ static int ast_vhub_rep_desc(struct ast_vhub_ep *ep,
>  	if (len > dsize)
>  		len = dsize;
>  
> -	/* Patch it if forcing USB1 */
> -	if (desc_type == USB_DT_DEVICE && ep->vhub->force_usb1)
> -		ast_vhub_patch_dev_desc_usb1(ep->buf);
> -
>  	/* Shoot it from the EP buffer */
>  	return ast_vhub_reply(ep, NULL, len);
>  }
> @@ -878,6 +867,15 @@ static void ast_vhub_fixup_dev_desc(struct ast_vhub *vhub)
>  		if (of_str[id])
>  			ast_vhub_str_array[i].s = of_str[id];
>  	}
> +
> +	/*
> +	 * Update USB Release Number and Protocol code if vhub is running
> +	 * at USB 1.x speed.
> +	 */
> +	if (vhub->force_usb1) {
> +		ast_vhub_dev_desc.bcdUSB = cpu_to_le16(0x0100);
> +		ast_vhub_dev_desc.bDeviceProtocol = 0;
> +	}
>  }
>  
>  void ast_vhub_init_hub(struct ast_vhub *vhub)

