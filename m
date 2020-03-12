Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 169A5182620
	for <lists+openbmc@lfdr.de>; Thu, 12 Mar 2020 01:10:49 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48d8Nx60ZPzDqQR
	for <lists+openbmc@lfdr.de>; Thu, 12 Mar 2020 11:10:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.214.195;
 helo=mail-pl1-f195.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48d8Mv4MxNzDqMm;
 Thu, 12 Mar 2020 11:09:46 +1100 (AEDT)
Received: by mail-pl1-f195.google.com with SMTP id a23so1885124plm.1;
 Wed, 11 Mar 2020 17:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9ApGOF5PBkyoeBPogSoc/7/ab/yJXEM4Uq6xzW0uckE=;
 b=qa/JjpNbOa07fUsB4jPdLDm52/jZZEQRH9wlnggCo8DYirC2AP/CxM7bIpeGf+pTsZ
 Uv9+2rKZqzD67ItMqFhBlkKxIM3pO4GTO/b21mX73+MdeJ8hXW9aA30m/c7gsxNFkmvY
 2l3HzKT7rZseU2snFyYgrJqHPN997zzhpWRiGk0t+jriJZeQ3BOe/fmG//AR7IdLhdFr
 uQzd7AOSjXIYBl7IBeG3pQGBBvzaLhYsBEqU4s+4zR1iUyentr12iqjc2dKsAzemOigy
 iZ6MrnT4onYr65Ude8HVtSsE4M05XvWBLKobbUKLxWtQ+JleX207ym20znvdc2QktO4I
 g/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9ApGOF5PBkyoeBPogSoc/7/ab/yJXEM4Uq6xzW0uckE=;
 b=uLC490/9uSzRw1jTmBC6f7Ycw2B80at0no7NtX9+q9ds5l0/OK2cU21wnjHwHJih/M
 FXyZNWVVjIGp5M/edM2zMe71yF8c2stjXVzS/TB/ltnuHGSqLDgLWscAjU675Hi1ydke
 bD9tIyoAAzIgHXQK6XuywGmX0YpnXQIgNJgpStL3WoYLnJwZlOwZmcgVh5PB+QtPJgVm
 kaTf7nLQqIH0KPWNdaL6+m5dKy9Yo0Vxe1SciqPi0x/dHACUwePNny1L0Lqy0/6KH01n
 e/DdXrgpl0Pc/oThXW9Sa+cILbB9y4LBzP5jm8e6Dq6f1ZJot47XseIt96MGiWToimwq
 xPVg==
X-Gm-Message-State: ANhLgQ3Ac32v+XkvxGEiVPiVEQ6WYhcxpEJsos0ruasKB5EEqt2GO/Lg
 IN5ZuSeWyciHOR+0RZg9XP4=
X-Google-Smtp-Source: ADFU+vtML21USPDOMZ+PmnB2abZahmaHnFt3ItHVXPSoef4wnUi8Xp1UT2B8XYgt+E7etOPYpGvc6g==
X-Received: by 2002:a17:902:d88d:: with SMTP id
 b13mr5144514plz.228.1583971779921; 
 Wed, 11 Mar 2020 17:09:39 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-24-4-25-55.hsd1.ca.comcast.net.
 [24.4.25.55])
 by smtp.gmail.com with ESMTPSA id e11sm9957036pfj.95.2020.03.11.17.09.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Mar 2020 17:09:39 -0700 (PDT)
Date: Wed, 11 Mar 2020 17:09:31 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v2] usb: gadget: aspeed: improve vhub port irq handling
Message-ID: <20200312000930.GA3956@taoren-ubuntu-R90MNF91>
References: <20200305234746.1002-1-rentao.bupt@gmail.com>
 <481e9b7d40c51505518a34ddc2515d3200dbf158.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <481e9b7d40c51505518a34ddc2515d3200dbf158.camel@kernel.crashing.org>
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
Cc: Felipe Balbi <balbi@kernel.org>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, taoren@fb.com,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ben,

On Wed, Mar 11, 2020 at 12:31:22PM +1100, Benjamin Herrenschmidt wrote:
> On Thu, 2020-03-05 at 15:47 -0800, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > This patch evaluates vhub ports' irq mask before going through per-port
> > irq handling one by one, which helps to speed up irq handling in case
> > there is no port interrupt.
> > 
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > ---
> >  Changes in v2:
> >    - use "for_each_set_bit" to speed up port irq handling.
> > 
> >  drivers/usb/gadget/udc/aspeed-vhub/core.c | 11 ++++++++---
> >  drivers/usb/gadget/udc/aspeed-vhub/vhub.h |  8 +++-----
> >  2 files changed, 11 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> > index f8d35dd60c34..af2dbd405361 100644
> > --- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
> > +++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> > @@ -134,11 +134,14 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
> >  	}
> >  
> >  	/* Handle device interrupts */
> > -	for (i = 0; i < vhub->max_ports; i++) {
> > -		u32 dev_mask = VHUB_IRQ_DEVICE1 << i;
> > +	if (istat & vhub->port_irq_mask) {
> > +		int offset = VHUB_IRQ_DEV1_BIT;
> > +		int size = VHUB_IRQ_DEV1_BIT + vhub->max_ports;
> >  
> > -		if (istat & dev_mask)
> > +		for_each_set_bit_from(offset, (unsigned long *)&istat, size) 
> 
> That type cast is very bad. It will not work on big endian for example
> (yes this driver isn't used on big endian today but still).
> 
> Please assign istat to an unsigned long (or make it unsigned long to
> begin with).

Thanks for pointing it out. Will fix it in v3.

Cheers,

Tao
