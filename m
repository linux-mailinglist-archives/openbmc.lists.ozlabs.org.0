Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9711A070A
	for <lists+openbmc@lfdr.de>; Tue,  7 Apr 2020 08:11:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xH9D3bjWzDqnx
	for <lists+openbmc@lfdr.de>; Tue,  7 Apr 2020 16:11:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=meOsJwIu; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xGzL6VX7zDqlY;
 Tue,  7 Apr 2020 16:02:54 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id q16so827038pje.1;
 Mon, 06 Apr 2020 23:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mDrnzDZiOnBQa09dvb0Cd1YjsF5mMmyz1I055wbl9vg=;
 b=meOsJwIutYxTrhH9bp6ewRd5RYJhEuAug27VMNargRV3jJhXH/2M5/2bLN3x6lLh6L
 qHDayjzoxQfjLNsOtDmIycx2hqVR7RlolxiUPwl1bR+K0kWCwmANPG7GnJt9Zdjy+Yt6
 PSyAwp2HEzmADUXurEsLRtaijgS2W+MetX2pV6K1dypT7ZnnYmqloQsMiFB7WXnU6Zyn
 6fl0LFoy8Riof1ih1YJzGFq2znARDo2Q8G+SOGeK0JzJBJB2suZC9i+DsbqBDMGdTpoN
 9rhZ6q9k7JDlUaRQ979800OtaTOeL0DwrDvpc3qrq4RiPL6KGs3RKSQM9wBi+zK06jZt
 VYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mDrnzDZiOnBQa09dvb0Cd1YjsF5mMmyz1I055wbl9vg=;
 b=g5LXZgDzPVxAgHFCI9WEmJJ+OruqyRolhnnnW/fCzvNxVG2fsBpMRwUx9IBZPRFShz
 FOFVaCCpSlvRLBXzDj227INJDoK4OujV/68Dz1joo7gqdaK0VH46mp6H18ZwVI15PyYY
 frLe8bGIJb5Xjmquoa/VZd/TMvYTpfUkOzfgDzb/4/KX6ZTSCBMYSUWmxyyp4DhPUDbM
 fpbzodN7axtPdwurgIP6OAwjXYZLsSOvowToTUH0I0BpryYtPzPZoVuC7orfeaoX7YzA
 rFt5BQ/kBvHpPYTN9fRIUo1FujuTvIairQMM9/D5nUbfPe2qO4WPfSpSbP4wCEvbvBR/
 DQxw==
X-Gm-Message-State: AGi0PuYuK2bG+aLTcbpCxXf1uq8d00bzR2h+p6O4GDo+aNM0NCg3gcF4
 XRlh4waCEJi582iN57DOyxI=
X-Google-Smtp-Source: APiQypIQztCXQB9qQWzpcptTM4CGBLA/xZSQCGcmzobvLJ1Ru341f80oLgBRRdcEFutuAOe/Kse/qw==
X-Received: by 2002:a17:902:a411:: with SMTP id
 p17mr939658plq.157.1586239371640; 
 Mon, 06 Apr 2020 23:02:51 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net.
 [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id d22sm2030774pgh.11.2020.04.06.23.02.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 Apr 2020 23:02:51 -0700 (PDT)
Date: Mon, 6 Apr 2020 23:02:43 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v3] usb: gadget: aspeed: improve vhub port irq handling
Message-ID: <20200407060242.GA15050@taoren-ubuntu-R90MNF91>
References: <20200315191430.12379-1-rentao.bupt@gmail.com>
 <20200401215826.GA8248@taoren-ubuntu-R90MNF91>
 <512d625e45ea953d722bb7ea73c3619730312284.camel@kernel.crashing.org>
 <20200403064826.GA10866@taoren-ubuntu-R90MNF91>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403064826.GA10866@taoren-ubuntu-R90MNF91>
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

On Thu, Apr 02, 2020 at 11:48:27PM -0700, Tao Ren wrote:
> On Thu, Apr 02, 2020 at 09:45:38PM +1100, Benjamin Herrenschmidt wrote:
> > On Wed, 2020-04-01 at 14:58 -0700, Tao Ren wrote:
> > > Hi Ben,
> > > 
> > > Any further comments on the patch?
> > 
> > Ah sorry, nope. Did you check the generated assembly to see if it
> > looked any better ? :-)
> > 
> > Otherwise,
> > 
> > Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> 
> Thanks Ben for the review. Let me see if I can collect some runtime data
> on my ast2400 BMC platform. Will update back later.

I ran some testing on my ast2400 and ast2500 BMC and looks like the
for() loop runs faster than for_each_set_bit_from() loop in my
environment. I'm not sure if something needs to be revised in my test
code, but please kindly share your suggestions:

I use get_cycles() to calculate execution time of 2 different loops, and
ast_vhub_dev_irq() is replaced with barrier() to avoid "noise"; below
are the results:

  - when downstream port number is 5 and only 1 irq bit is set, it takes
    ~30 cycles to finish for_each_set_bit() loop, and 20-25 cycles to
    finish the for() loop.

  - if downstream port number is 5 and all 5 bits are set, then
    for_each_set_bit() loop takes ~50 cycles and for() loop takes ~25
    cycles.

  - when I increase downsteam port number to 16 and set 1 irq bit, the
    for_each_set_bit() loop takes ~30 cycles and for() loop takes 25
    cycles. It's a little surprise to me because I thought for() loop
    would cost 60+ cycles (3 times of the value when port number is 5).

  - if downstream port number is 16 and all irq status bits are set,
    then for_each_set_bit() loop takes 60-70 cycles and for() loop takes
    30+ cycles.


Cheers,

Tao

> 
> > > 
> > > On Sun, Mar 15, 2020 at 12:14:30PM -0700, rentao.bupt@gmail.com
> > > wrote:
> > > > From: Tao Ren <rentao.bupt@gmail.com>
> > > > 
> > > > This patch evaluates vhub ports' irq mask before going through per-
> > > > port
> > > > irq handling one by one, which helps to speed up irq handling in
> > > > case
> > > > there is no port interrupt.
> > > > 
> > > > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > > > ---
> > > >  Changes in v3:
> > > >    - assign istat to (unsigned long) bitmap before calling
> > > >      "for_each_set_bit_from".
> > > >  Changes in v2:
> > > >    - use "for_each_set_bit" to speed up port irq handling.
> > > > 
> > > >  drivers/usb/gadget/udc/aspeed-vhub/core.c | 12 +++++++++---
> > > >  drivers/usb/gadget/udc/aspeed-vhub/vhub.h |  8 +++-----
> > > >  2 files changed, 12 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c
> > > > b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> > > > index f8d35dd60c34..555e8645fb1e 100644
> > > > --- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
> > > > +++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> > > > @@ -134,11 +134,15 @@ static irqreturn_t ast_vhub_irq(int irq, void
> > > > *data)
> > > >  	}
> > > >  
> > > >  	/* Handle device interrupts */
> > > > -	for (i = 0; i < vhub->max_ports; i++) {
> > > > -		u32 dev_mask = VHUB_IRQ_DEVICE1 << i;
> > > > +	if (istat & vhub->port_irq_mask) {
> > > > +		unsigned long bitmap = istat;
> > > > +		int offset = VHUB_IRQ_DEV1_BIT;
> > > > +		int size = VHUB_IRQ_DEV1_BIT + vhub->max_ports;
> > > >  
> > > > -		if (istat & dev_mask)
> > > > +		for_each_set_bit_from(offset, &bitmap, size) {
> > > > +			i = offset - VHUB_IRQ_DEV1_BIT;
> > > >  			ast_vhub_dev_irq(&vhub->ports[i].dev);
> > > > +		}
> > > >  	}
> > > >  
> > > >  	/* Handle top-level vHub EP0 interrupts */
> > > > @@ -332,6 +336,8 @@ static int ast_vhub_probe(struct
> > > > platform_device *pdev)
> > > >  
> > > >  	spin_lock_init(&vhub->lock);
> > > >  	vhub->pdev = pdev;
> > > > +	vhub->port_irq_mask = GENMASK(VHUB_IRQ_DEV1_BIT + vhub-
> > > > >max_ports - 1,
> > > > +				      VHUB_IRQ_DEV1_BIT);
> > > >  
> > > >  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > >  	vhub->regs = devm_ioremap_resource(&pdev->dev, res);
> > > > diff --git a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
> > > > b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
> > > > index fac79ef6d669..23a1ac91f8d2 100644
> > > > --- a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
> > > > +++ b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
> > > > @@ -51,14 +51,11 @@
> > > >  #define VHUB_CTRL_UPSTREAM_CONNECT		(1 << 0)
> > > >  
> > > >  /* IER & ISR */
> > > > +#define VHUB_IRQ_DEV1_BIT			9
> > > >  #define VHUB_IRQ_USB_CMD_DEADLOCK		(1 << 18)
> > > >  #define VHUB_IRQ_EP_POOL_NAK			(1 << 17)
> > > >  #define VHUB_IRQ_EP_POOL_ACK_STALL		(1 << 16)
> > > > -#define VHUB_IRQ_DEVICE5			(1 << 13)
> > > > -#define VHUB_IRQ_DEVICE4			(1 << 12)
> > > > -#define VHUB_IRQ_DEVICE3			(1 << 11)
> > > > -#define VHUB_IRQ_DEVICE2			(1 << 10)
> > > > -#define VHUB_IRQ_DEVICE1			(1 << 9)
> > > > +#define VHUB_IRQ_DEVICE1			(1 <<
> > > > (VHUB_IRQ_DEV1_BIT))
> > > >  #define VHUB_IRQ_BUS_RESUME			(1 << 8)
> > > >  #define VHUB_IRQ_BUS_SUSPEND 			(1 << 7)
> > > >  #define VHUB_IRQ_BUS_RESET 			(1 << 6)
> > > > @@ -402,6 +399,7 @@ struct ast_vhub {
> > > >  	/* Per-port info */
> > > >  	struct ast_vhub_port		*ports;
> > > >  	u32				max_ports;
> > > > +	u32				port_irq_mask;
> > > >  
> > > >  	/* Generic EP data structures */
> > > >  	struct ast_vhub_ep		*epns;
> > > > -- 
> > > > 2.17.1
> > > > 
> > 
