Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C02172B32
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 23:30:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48T6nQ32s3zDr6S
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 09:30:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=a0nmU5d8; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48T6mS6Z6vzDr1q;
 Fri, 28 Feb 2020 09:29:44 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id y5so571569pfb.11;
 Thu, 27 Feb 2020 14:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dAKQtQFMwvA4in1IKX12aA2LxpzkOZ3DeV5aYoLW1Dk=;
 b=a0nmU5d8Fqui67x7EDMrxyRLgET/G0iEKZQ3fHRK/3Dou0wE6XBiu9qf3bM08cfP6D
 /qzbSszn/RqpuBqcbVC38AaKcMIxx2t+aRQ9BuilhnT+bm4NDiyniMAVGrW5xNkH2lQ3
 v376HxpgeUt0aQI5qpIQU80drCyrzsf4PKMVY7JtmLHX2PfuOOkuzUbT0ODcIbO4ACFK
 r1D65ggKF/4q/Y77n5lN02m+1wW3RwkBkcjmYy7sSKjgDTWZMOQh41RY7Qt+eRoa1MPv
 f2ZBhfq6NThumXvbKk2/QKyT/YlxdBpgGA5Ms52RO1xNhHrbwdBMFxEuYjO6ZAkHkV/k
 35jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dAKQtQFMwvA4in1IKX12aA2LxpzkOZ3DeV5aYoLW1Dk=;
 b=BIwA5Fzq8hVR7HYHxzn9RJFVpvdxUJBSQ269DBXDrYPWt+5wkULzOO2SNd640o1xBo
 Zu1mvZM7PGsXoOd7+NEjMBouXasIKwA0Q12tiGYUEI2DeZ/heLfgjZVL8hlPHVRyGqyz
 j6cCjJyshcbq4zIZbha6NglQ9p+F/Np5XwfZs28G2cyg8RLdZLPuK9oXY6YYnjU4p24P
 SDhb1pm64YjYXL1U6dS27afd79wfHkl8YTeRbMjh1ku0C7ksQkVk3LJyoldj5YEhlXQ3
 BoCPNgJ+HUp5xhAIzz7vnKTYMPm+XdQpw+KP7IRH292EfCjU/mtL13JBxbRja8uqRvxa
 LbWA==
X-Gm-Message-State: APjAAAVYf08Z36fns8+DAySrR7t07p42thGEHXQGIMRXN5RKkyl5PuK5
 xaF5qyeP6kY43dfxkHxRF+s=
X-Google-Smtp-Source: APXvYqwCjo4NWg/n1zmJDAcIKJ2UE6VbP7KCZK4B2tzXfKC/iHPldab23u/RzAE40bqfKpBKWNJKFQ==
X-Received: by 2002:a63:2c85:: with SMTP id s127mr1480287pgs.138.1582842580284; 
 Thu, 27 Feb 2020 14:29:40 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91 ([2620:10d:c090:500::4:d8f5])
 by smtp.gmail.com with ESMTPSA id 136sm7794224pgh.26.2020.02.27.14.29.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 27 Feb 2020 14:29:39 -0800 (PST)
Date: Thu, 27 Feb 2020 14:29:32 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v4 2/7] usb: gadget: aspeed: read vhub properties from
 device tree
Message-ID: <20200227222931.GA29420@taoren-ubuntu-R90MNF91>
References: <20200226230346.672-1-rentao.bupt@gmail.com>
 <20200226230346.672-3-rentao.bupt@gmail.com>
 <b9b8977ae185ca944e703721d93b8d8464d1475f.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9b8977ae185ca944e703721d93b8d8464d1475f.camel@kernel.crashing.org>
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

Hi Ben,

On Thu, Feb 27, 2020 at 03:09:01PM +1100, Benjamin Herrenschmidt wrote:
> On Wed, 2020-02-26 at 15:03 -0800, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > The patch introduces 2 DT properties ("aspeed,vhub-downstream-ports" and
> > "aspeed,vhub-generic-endpoints") which replaces hardcoded port/endpoint
> > number. It is to make it more convenient to add support for newer vhub
> > revisions with different number of ports and endpoints.
> > 
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> With one minor nit that can be addressed in a subsequent patch (see
> below)
> 
> Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Thanks for the help on the patch series.

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
> 
> The 2400 and 2500 have very slow cores and every cycle counts in that
> interrupt handler from my experience. I would sugggest you generate a
> "mask" of all the device interrupts for enabled ports in struct vhub
> and AND istat with that mask before going through the loop. Either that
> or use find_next_zero_bit...
> 
> I wouldn't gate merging this patch on this, it can be a subsequent
> refinement.

Got it. I will take care of the improvement in a follow-up patch.

Cheers,

Tao
