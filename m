Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B1C19B80C
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 00:00:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48t0VY2V0MzDrBn
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 09:00:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Aug+9ANM; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48t0Sr6PKRzDr6Y;
 Thu,  2 Apr 2020 08:58:36 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id q3so677080pff.13;
 Wed, 01 Apr 2020 14:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=T6l/yr6Cjt15a6YDL3tI21z3eGbnhRLGQpcGGdkH3G0=;
 b=Aug+9ANMwfqMqTPoXflHoLnWAPyOIweS23iswm7clSDXgqDQCTiLRSSoMNZ0io2ytz
 4kmqK7K8TsoX8Oa1qCNIKmfyfFCeASbGk09hbmJT9JzSZOyO7y+qxD+tj+NEFilvfBwD
 Pkv6lnNNptyY6BsU/XB8/PfyksA6Z9Xm2tp++boXtgRMNr0fUMtwTmaeW6aqhqgBxxzh
 T3T/9LrClkN4dUYuEDANTY429B46thKNnNF8CWPF0AWe3YNUzg+3U1nhKB6vWT5uoZ9P
 z8TEIs2da5LgN87NKawCzRGQZ9m5Isbl8/I1AM+wuDNKZL4b1/4vZvFmT2cR6NyhM9bK
 U/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=T6l/yr6Cjt15a6YDL3tI21z3eGbnhRLGQpcGGdkH3G0=;
 b=t+1QGuRxYt8M6Zq0002ebAM6k3emrTnSDNpJfr5a6GNDYJvMg+kbmcnRTzidm193IY
 1Ru/4uJtM++CuwQ4CcdaXEkX+svxg72UP5sAwRMR7JvkqLzDAdwE18ai71kTi9JYckUx
 F1Z8PAFx3xxXGoMWUb9Z3ASLezke9SV1hEFYtW3DnIKjEgAX0hjGmrNzdsyhc/PjXYbH
 P/CgBpyMe/sWU5bV3QVhFRGeGwV75WYtTkTwtDoAz4u7Qr4BvN0sdYHs9iMrXY9tXpEY
 lCPSRyUJVRXWQItr2Ob9Pr0LKFFv9QBjfLySrmQ7hxXFCDgtkasM6gViaJxAxNV0HGg9
 TZhA==
X-Gm-Message-State: AGi0PubGcA9u3TL+iGSpUBCOlRi9I88oNfHEFtBxyluuwHYjms9Z9a0O
 I6l3kqbMhlK37Qcsz5KCAkk=
X-Google-Smtp-Source: APiQypKQLNXXWccupxCJd6/Wi/Nq14WhOAQB8ADTtsp5VWa5/Aot0+vBabx18lkkpwOAaRkoEYxr3g==
X-Received: by 2002:a63:134e:: with SMTP id 14mr288009pgt.380.1585778314374;
 Wed, 01 Apr 2020 14:58:34 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net.
 [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id q71sm2378551pjb.5.2020.04.01.14.58.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 01 Apr 2020 14:58:33 -0700 (PDT)
Date: Wed, 1 Apr 2020 14:58:27 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Stephen Boyd <swboyd@chromium.org>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: Re: [PATCH v3] usb: gadget: aspeed: improve vhub port irq handling
Message-ID: <20200401215826.GA8248@taoren-ubuntu-R90MNF91>
References: <20200315191430.12379-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200315191430.12379-1-rentao.bupt@gmail.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ben,

Any further comments on the patch?


Cheers,

Tao

On Sun, Mar 15, 2020 at 12:14:30PM -0700, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> This patch evaluates vhub ports' irq mask before going through per-port
> irq handling one by one, which helps to speed up irq handling in case
> there is no port interrupt.
> 
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> ---
>  Changes in v3:
>    - assign istat to (unsigned long) bitmap before calling
>      "for_each_set_bit_from".
>  Changes in v2:
>    - use "for_each_set_bit" to speed up port irq handling.
> 
>  drivers/usb/gadget/udc/aspeed-vhub/core.c | 12 +++++++++---
>  drivers/usb/gadget/udc/aspeed-vhub/vhub.h |  8 +++-----
>  2 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> index f8d35dd60c34..555e8645fb1e 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> @@ -134,11 +134,15 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
>  	}
>  
>  	/* Handle device interrupts */
> -	for (i = 0; i < vhub->max_ports; i++) {
> -		u32 dev_mask = VHUB_IRQ_DEVICE1 << i;
> +	if (istat & vhub->port_irq_mask) {
> +		unsigned long bitmap = istat;
> +		int offset = VHUB_IRQ_DEV1_BIT;
> +		int size = VHUB_IRQ_DEV1_BIT + vhub->max_ports;
>  
> -		if (istat & dev_mask)
> +		for_each_set_bit_from(offset, &bitmap, size) {
> +			i = offset - VHUB_IRQ_DEV1_BIT;
>  			ast_vhub_dev_irq(&vhub->ports[i].dev);
> +		}
>  	}
>  
>  	/* Handle top-level vHub EP0 interrupts */
> @@ -332,6 +336,8 @@ static int ast_vhub_probe(struct platform_device *pdev)
>  
>  	spin_lock_init(&vhub->lock);
>  	vhub->pdev = pdev;
> +	vhub->port_irq_mask = GENMASK(VHUB_IRQ_DEV1_BIT + vhub->max_ports - 1,
> +				      VHUB_IRQ_DEV1_BIT);
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	vhub->regs = devm_ioremap_resource(&pdev->dev, res);
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
> index fac79ef6d669..23a1ac91f8d2 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
> @@ -51,14 +51,11 @@
>  #define VHUB_CTRL_UPSTREAM_CONNECT		(1 << 0)
>  
>  /* IER & ISR */
> +#define VHUB_IRQ_DEV1_BIT			9
>  #define VHUB_IRQ_USB_CMD_DEADLOCK		(1 << 18)
>  #define VHUB_IRQ_EP_POOL_NAK			(1 << 17)
>  #define VHUB_IRQ_EP_POOL_ACK_STALL		(1 << 16)
> -#define VHUB_IRQ_DEVICE5			(1 << 13)
> -#define VHUB_IRQ_DEVICE4			(1 << 12)
> -#define VHUB_IRQ_DEVICE3			(1 << 11)
> -#define VHUB_IRQ_DEVICE2			(1 << 10)
> -#define VHUB_IRQ_DEVICE1			(1 << 9)
> +#define VHUB_IRQ_DEVICE1			(1 << (VHUB_IRQ_DEV1_BIT))
>  #define VHUB_IRQ_BUS_RESUME			(1 << 8)
>  #define VHUB_IRQ_BUS_SUSPEND 			(1 << 7)
>  #define VHUB_IRQ_BUS_RESET 			(1 << 6)
> @@ -402,6 +399,7 @@ struct ast_vhub {
>  	/* Per-port info */
>  	struct ast_vhub_port		*ports;
>  	u32				max_ports;
> +	u32				port_irq_mask;
>  
>  	/* Generic EP data structures */
>  	struct ast_vhub_ep		*epns;
> -- 
> 2.17.1
> 
