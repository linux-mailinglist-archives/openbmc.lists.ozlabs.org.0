Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CE8166B87
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2020 01:22:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NsbK4JsFzDqM7
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2020 11:22:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EVv11Zk8; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NsZD0kL2zDq5t;
 Fri, 21 Feb 2020 11:21:07 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id y5so244775pfb.11;
 Thu, 20 Feb 2020 16:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=a4/ljhrEhbsVqKPnJ2k+YSVwNBU/denU+0a+fK/lh98=;
 b=EVv11Zk8AYB9hS7c/Lkhd52HNoMejxxMg8MSwFwHJcv1rgn10PAhKhBkvQKJZ9BaG4
 NskY5M0YE8o7EDmxnYtEItF+4qEF9oy85BAypdcQLsWCfoUN5s6/K5sf4UBUKmZFHt21
 sPDTaDsivhrGrdnpq+r/7LFFJ6iUnNpEAJYJXg8Ee0SInqr6LR18ucHGaTIv12TSpOY7
 T3kbv9FZQGel1oR9RlWLR13Zh+N6dF1UN7NKb9P1kVE3+7PHhjs68qRSxLFcCG6rbc83
 bG7S9Xx0Y70mXDOROUbqjhVu+2fpCEoIw+v7N18ETcmTnwuHDxcgjGu+SiaRh2I9/UOe
 84zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=a4/ljhrEhbsVqKPnJ2k+YSVwNBU/denU+0a+fK/lh98=;
 b=nXdnL3iwJckzRUgxsRBnWYt4VbrlYQjSZJx6WbGsgY/LATyhmFcU/pwHHFlkT7Drj8
 Uhdyz6jsczqz2Z27zcIiYYdXxPoi2ICHhxzuOKgTMZdLOw3D+h6fxo5X9GAi0yDDWQ95
 lxsi/5nFExhNDRQbiW3cu78iU0bq6PbXfOekZuIgc74Y3NeQjTyn29PkNgZplH1ef9CV
 oarpi2Yi8rK13F4kIBN0Gd0XCPFRQ5EHdgNn7CIpADq6vUEyBy6yh9C8V1RKabOlClg+
 LUDbuPGPGu5HsyXaOe/N+lCP8fTfsRb2M/7bazho+lM310b9Kg8Ft67ewMMsAxNz7Ljt
 QIIg==
X-Gm-Message-State: APjAAAWU0B7kcUOAJb4pbl++ITv2Hzn6mBnwCRXnHTnze4bnAboxpUGI
 sq87avYlVPbY/ficOa20Osw=
X-Google-Smtp-Source: APXvYqyjiF/VG6y/NeQCdPXrhpSws4JsxzMcf4IkrfSRa3KYM7f7ExChm9MNA6NOGinrsiWkqQIdvQ==
X-Received: by 2002:a63:3e05:: with SMTP id l5mr35763336pga.293.1582244463971; 
 Thu, 20 Feb 2020 16:21:03 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91 ([2620:10d:c090:500::6:8f30])
 by smtp.gmail.com with ESMTPSA id t11sm541459pjo.21.2020.02.20.16.21.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 20 Feb 2020 16:21:03 -0800 (PST)
Date: Thu, 20 Feb 2020 16:20:59 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH 2/2] usb: gadget: aspeed: fixup usb1 device descriptor at
 init time
Message-ID: <20200221002059.GB7815@taoren-ubuntu-R90MNF91>
References: <20200218235600.6763-1-rentao.bupt@gmail.com>
 <20200218235600.6763-3-rentao.bupt@gmail.com>
 <55e77bcb37ec780094b8d226f89bd5557e30d913.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55e77bcb37ec780094b8d226f89bd5557e30d913.camel@kernel.crashing.org>
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
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 taoren@fb.com, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Feb 20, 2020 at 12:39:45PM +1100, Benjamin Herrenschmidt wrote:
> On Tue, 2020-02-18 at 15:56 -0800, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > This patch moves fixup-usb1-device-descriptor logic from get_descriptor
> > handler to "ast_vhub_fixup_dev_desc" function so the device descriptor
> > is only patched once (at vhub init time).
> 
> I don't like this either. We should make ast_vhub_dev_desc and patch a
> copy here too. I know today there's only one instance of the vhub in a
> given SoC but that might not always be the case.

Sure. I will introduce per-hub descripor instances in patch v2.


Cheers,

Tao
> 
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > ---
> >  drivers/usb/gadget/udc/aspeed-vhub/hub.c | 20 +++++++++-----------
> >  1 file changed, 9 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> > index 4e3ef83283a6..b8bf54b12adc 100644
> > --- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> > +++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> > @@ -76,13 +76,6 @@ static struct usb_device_descriptor ast_vhub_dev_desc = {
> >  	.bNumConfigurations	= 1,
> >  };
> >  
> > -/* Patches to the above when forcing USB1 mode */
> > -static void ast_vhub_patch_dev_desc_usb1(struct usb_device_descriptor *desc)
> > -{
> > -	desc->bcdUSB = cpu_to_le16(0x0100);
> > -	desc->bDeviceProtocol = 0;
> > -}
> > -
> >  /*
> >   * Configuration descriptor: same comments as above
> >   * regarding handling USB1 mode.
> > @@ -316,10 +309,6 @@ static int ast_vhub_rep_desc(struct ast_vhub_ep *ep,
> >  	if (len > dsize)
> >  		len = dsize;
> >  
> > -	/* Patch it if forcing USB1 */
> > -	if (desc_type == USB_DT_DEVICE && ep->vhub->force_usb1)
> > -		ast_vhub_patch_dev_desc_usb1(ep->buf);
> > -
> >  	/* Shoot it from the EP buffer */
> >  	return ast_vhub_reply(ep, NULL, len);
> >  }
> > @@ -878,6 +867,15 @@ static void ast_vhub_fixup_dev_desc(struct ast_vhub *vhub)
> >  		if (of_str[id])
> >  			ast_vhub_str_array[i].s = of_str[id];
> >  	}
> > +
> > +	/*
> > +	 * Update USB Release Number and Protocol code if vhub is running
> > +	 * at USB 1.x speed.
> > +	 */
> > +	if (vhub->force_usb1) {
> > +		ast_vhub_dev_desc.bcdUSB = cpu_to_le16(0x0100);
> > +		ast_vhub_dev_desc.bDeviceProtocol = 0;
> > +	}
> >  }
> >  
> >  void ast_vhub_init_hub(struct ast_vhub *vhub)
> 
