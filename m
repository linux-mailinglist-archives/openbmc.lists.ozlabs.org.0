Return-Path: <openbmc+bounces-1327-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +hTXEJJNhGkE2gMAu9opvQ
	(envelope-from <openbmc+bounces-1327-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Thu, 05 Feb 2026 08:58:10 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45511EFA7C
	for <lists+openbmc@lfdr.de>; Thu, 05 Feb 2026 08:58:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f68j93rwgz2yFb;
	Thu, 05 Feb 2026 18:58:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770278285;
	cv=none; b=fWMHyeME8p6heD85scOO6VdmCwWlREtNrWdhwoPdUmTRhnQ5xI13ENzLPKiOJWLJTfnsDK99og44ElWsBUqdV4lHUFxVOSXkxc9PS35L72JXbrwVzP7NIyx2dKBOiSRWMk1rt9ZPElxhIrH32ldtw+XfN8wRlahX8MjYmkwgQsGHF1vh6rK89HiUUueTwoTMI8/xvs1Xg5kWfHwVE9eisvFsYecjP2R/PjU/A6Kg/Qiu33LtAiquWIqbLJVTHK1WnKSnSUkaeHE9B965TWetALmql7wj/IhDUe/yTeWDDxDgqwzOAhuoaG7frlRBnTGNun3MJ007++tr39/tnyJSjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770278285; c=relaxed/relaxed;
	bh=SYZxuy4+r97DBcLZRP2AjmjXQAVaMV67/+bY3fSZDJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9Lc2n+wIFrgKcPMKr7IxidcV113azLVVGWyeVv6KVHkbKHqF/hGBiIhtfPlUBOh7m3QkNKjRXENvb2WtI/HhYDEf0GJMeBTbhjXQnt4IhbqfJB3CYV/C3cBjYjksJKL6kBtR14gLpwvE4Y9gtn905LakwfQGIqo/Owa6SadWR+vKL7N81wzxgsXBDMdh84NED5oz6D9VNK0q4+j41yJNiXQa1AXgEMW54x9IJHK41bSP8OokDKCofhlKrLCN9F+r9a/4gW00LZpaAqwJBegRYQIBLKSXL65DT6wMSVWF+i0VSMl/8yoz6oUZ7UI+Qc5s17U5bEd6oiClm2NYNCljQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=0i2xJRAN; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=0i2xJRAN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f68j808Zmz2xrk
	for <openbmc@lists.ozlabs.org>; Thu, 05 Feb 2026 18:58:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B45AC432B5;
	Thu,  5 Feb 2026 07:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6DAC4CEF7;
	Thu,  5 Feb 2026 07:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770278281;
	bh=IuIN+/tQw8rFvzNWx5ic6DmL1v6XYIXu6N8WQIOCMQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0i2xJRANXQHk5EVOm/PFr9o5rDzC2BFe6Z1ahpEKxFsl72rQgICz696k7R8qlKd/E
	 RhJJ4SVfNNFDVZJdXh86oHTXB5KcG6JbY8KsdeM7DoyvrkeCEk7zSxqzIGVRth3EkK
	 1J1v86grCzROkZfUxunkydh+8A7SSPp0rSlt9DIY=
Date: Thu, 5 Feb 2026 08:57:58 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Vladimir Moravcevic <vmoravcevic@axiado.com>
Cc: Krutik Shah <krutikshah@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH 2/3] usb: gadget: udc: Add UDC driver for Axiado Device
 controller IP Corigine
Message-ID: <2026020545-headed-twirl-125c@gregkh>
References: <20260202-axiado-ax3000-usb-device-controller-v1-0-45ce0a8b014f@axiado.com>
 <20260202-axiado-ax3000-usb-device-controller-v1-2-45ce0a8b014f@axiado.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-axiado-ax3000-usb-device-controller-v1-2-45ce0a8b014f@axiado.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.80 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1327-lists,openbmc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vmoravcevic@axiado.com,m:krutikshah@axiado.com,m:pbolisetty@axiado.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,openbmc@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[openbmc,dt];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[axiado.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 45511EFA7C
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 05:16:29AM -0800, Vladimir Moravcevic wrote:
> Add Corigine USB IP Driver for Axiado AX3000 SoC's
> USB peripheral (USB 2.0/3.0).
> The driver is based on the Corigine USB IP core with
> Axiado-specific enhancements including VBUS detection and USB link
> stability fixes.
> 
> The driver supports both USB 2.0 High-Speed and USB 3.0 SuperSpeed
> modes with control, bulk, interrupt, and isochronous transfer types.
> 
> Co-developed-by: Krutik Shah <krutikshah@axiado.com>
> Signed-off-by: Krutik Shah <krutikshah@axiado.com>
> Co-developed-by: Prasad Bolisetty <pbolisetty@axiado.com>
> Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>
> Signed-off-by: Vladimir Moravcevic <vmoravcevic@axiado.com>
> ---
>  drivers/usb/gadget/udc/Kconfig   |   15 +
>  drivers/usb/gadget/udc/Makefile  |    1 +
>  drivers/usb/gadget/udc/crg_udc.c | 4522 ++++++++++++++++++++++++++++++++++++++
>  drivers/usb/gadget/udc/crg_udc.h |  364 +++
>  4 files changed, 4902 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
> index 26460340fbc9..b94d113aad99 100644
> --- a/drivers/usb/gadget/udc/Kconfig
> +++ b/drivers/usb/gadget/udc/Kconfig
> @@ -417,6 +417,21 @@ config USB_ASPEED_UDC
>  	  dynamically linked module called "aspeed_udc" and force all
>  	  gadget drivers to also be dynamically linked.
>  
> +config USB_CRG_UDC
> +	tristate "AXIADO CORIGINE-based AX3000 Device Controller"
> +	depends on ARCH_AXIADO || COMPILE_TEST
> +	depends on USB_GADGET
> +	help
> +	  Enables AX3000 USB device controller driver for Axiado
> +	  SoCs and evaluation boards.
> +
> +	  Based on the Corigine USB IP core driver with Axiado specific
> +	  enhancements. Supports USB 2.0 (High-Speed) and USB 3.0
> +	  (SuperSpeed), including control, bulk, interrupt, and
> +	  isochronous transfers.
> +
> +	  Say "y" to build statically, or "m" to build as a module.

What is the module name?  The other entries in this file all describe
this.

> --- /dev/null
> +++ b/drivers/usb/gadget/udc/crg_udc.c
> @@ -0,0 +1,4522 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)

That is very odd, and I need a bit of justification as to why, and how,
MIT is allowed here.  Did you look at any of the existing gadget udc
drivers when working on this code?  If so, how can MIT still work?

Anyway, as this is a "not normal" selection for this type of driver, I
will need a signed-off-by from your corporate lawyer with the reason why
it is dual licensed described in the changelog comment for it showing
that you all understand all of the issues involved in doing something
like this, and attempting to keep it under a dual license over time.

thanks,

greg k-h

> +//
> +// Copyright (c) 2019 Corigine Inc.
> +// Copyright (c) 2022-2026 Axiado Corporation.
> +//
> +
> +#include <linux/net.h>
> +#include <asm/byteorder.h>
> +#include <linux/errno.h>
> +#include <linux/io.h>
> +#include <linux/unaligned.h>
> +#include <linux/types.h>
> +#include <linux/bitops.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/usb/ch9.h>
> +#include <linux/usb/gadget.h>
> +#include <linux/delay.h>
> +#include <linux/irq.h>
> +#include <linux/irqreturn.h>
> +#include <linux/interrupt.h>
> +#include <linux/ctype.h>
> +#include <linux/module.h>
> +#include <linux/sched.h>
> +#include <linux/kthread.h>
> +#include <linux/err.h>
> +#include <linux/wait.h>
> +#include <linux/kernel.h>
> +#include <linux/platform_device.h>
> +#include <linux/of_address.h>
> +#include <linux/of_gpio.h>
> +#include <linux/scatterlist.h>
> +#include "crg_udc.h"
> +
> +#define INIT_ZERO					-1

Why is "ZERO" defined as -1?

> +#define UDC_FALSE					false

Please just use "false" where needed.

> +
> +#define MAX_PACKET_SIZE 1024
> +
> +#define	DMA_ADDR_INVALID	(~(dma_addr_t)0)

Isn't this in the dma headers somewhere instead?  if not, why not?

And you mix tabs with spaces after the "#define" on these lists, please
don't.


> +
> +#define CRG_ERST_SIZE 1
> +#define CRG_EVENT_RING_SIZE 256

Why no tabs here, but:

> +#define CRG_NUM_EP_CX	32

Tabs here?  Be consistent please.

> +#define TRB_MAX_BUFFER_SIZE		65536
> +#define CRGUDC_CONTROL_EP_TD_RING_SIZE	16
> +#define CRGUDC_BULK_EP_TD_RING_SIZE	1024
> +#define CRGUDC_ISOC_EP_TD_RING_SIZE	32
> +#define CRGUDC_INT_EP_TD_RING_SIZE	8
> +#define CRGUDC_ROLE_DEVICE		0x1
> +
> +#define	U1_TIMEOUT_VAL	0x70
> +#define	U2_TIMEOUT_VAL	0x70

And then tabs here after "define"?

Anyway, it just stands out instantly as something odd.

> +
> +#define STATE_USB_LINK_STABLE 4
> +
> +/*********Feature switches********************/
> +#define U12_FORBIDDEN	1
> +#define U12_INITIATE_FORBIDDEN 1
> +#define CRG_UDC_INT_EN
> +#define REINIT_EP0_ON_BUS_RESET

We do not have "feature switches" in kernel drivers that require you to
rebuild the code.  Please handle these properly like all other drivers
do (i.e. not this way.)

> +/*Table 127*/

No spaces?

Anyway, what is "table 127"?  And what is it for?

> +enum TRB_CMPL_CODES_E {
> +	CMPL_CODE_INVALID       = 0,
> +	CMPL_CODE_SUCCESS,
> +	CMPL_CODE_DATA_BUFFER_ERR,
> +	CMPL_CODE_BABBLE_DETECTED_ERR,
> +	CMPL_CODE_USB_TRANS_ERR,
> +	CMPL_CODE_TRB_ERR,  /*5*/

If this really is "5", then set it to 5!


> +	CMPL_CODE_TRB_STALL,
> +	CMPL_CODE_INVALID_STREAM_TYPE_ERR = 10,
> +	CMPL_CODE_SHORT_PKT = 13,
> +	CMPL_CODE_RING_UNDERRUN,
> +	CMPL_CODE_RING_OVERRUN, /*15*/

Same here.  Don't assume that enums will be properly set without
actually setting them all, as I don't think the C standard guarantees
this (I could be wrong, but it can trip you up...)

If you want a specific value, set it so you _know_ it will be correct.

> +	CMPL_CODE_EVENT_RING_FULL_ERR = 21,
> +	CMPL_CODE_STOPPED = 26,
> +	CMPL_CODE_STOPPED_LENGTH_INVALID = 27,
> +	CMPL_CODE_ISOCH_BUFFER_OVERRUN = 31,
> +	/*192-224 vendor defined error*/

You are the vendor!

> +	CMPL_CODE_PROTOCOL_STALL = 192,
> +	CMPL_CODE_SETUP_TAG_MISMATCH = 193,
> +	CMPL_CODE_HALTED = 194,
> +	CMPL_CODE_HALTED_LENGTH_INVALID = 195,
> +	CMPL_CODE_DISABLED = 196,
> +	CMPL_CODE_DISABLED_LENGTH_INVALID = 197,
> +};
> +
> +static const char driver_name[] = "crg_udc";

Why is this needed and why not use KBUILD_MODNAME instead?

> +
> +struct buffer_info {
> +	void *vaddr;

What is a vaddr?

I'll stop here.  Also note the 0-day bot issues that it found, which
precludes us from take this as-is.

thanks,

greg k-h

