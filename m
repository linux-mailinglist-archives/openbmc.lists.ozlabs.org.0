Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 616E1247AC3
	for <lists+openbmc@lfdr.de>; Tue, 18 Aug 2020 00:57:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVqDf1gv9zDqXJ
	for <lists+openbmc@lfdr.de>; Tue, 18 Aug 2020 08:57:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=icCuRZwJ; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVqCj0GthzDqW0;
 Tue, 18 Aug 2020 08:56:15 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id k13so8271899plk.13;
 Mon, 17 Aug 2020 15:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=u/EbLMfNqW+ecm7P7/+lVeVWoCyaxMA1ruHKaBP8G5U=;
 b=icCuRZwJpyEhTcs4ikvqOQkHvROTT02PWoLdjFa/HOzrnVkZU4wKLjhaMk2QwVvJ7U
 lk3Fp/gTh3pu2DtFl/jQGrUwY4obpqee+IiAVBiseYTfmHXpF/rtNXAPR2seeJEW4oDm
 83ygyGZTTwRb1elwEL1DBcfsBRpLogJoAs1A/ZVEeNxNT5aOgPbGO9TudnxdRe/7cotA
 OKJOxkaeekdBKkxgX6mKcuoAmUCNrUmZrugwWf/PcROdFvfbr9fGx42no6wlRy1vVH4P
 f5TfhOTVuTtkd8O053Dlauq6IgUauPKNXhdRC7nBSxc6ADoyCTKc/rPvkCoxAr7sujN2
 s32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=u/EbLMfNqW+ecm7P7/+lVeVWoCyaxMA1ruHKaBP8G5U=;
 b=JBsDVQ9ujyG/AYg2jtreDF8HP1jGhQZolamPmecml9V6KdixamhtuvmFB6eyuaGQEt
 cLmJuGB6ofwsLrGWo/9n2Y1WpD32/dnJrS4/gMGM2N27dWswTAPZsJjmeEovgQdbvYcS
 9hDaA7ohYVnAkXOWwoChJ1G62qeQ05jH+C1ithX5TlfGzPoHK4KRxdwx/BTbz/hbrgPi
 dYiQYace7Z/Cem9mUB3hLGrPy++4DkfZYRTuXGGQ3MipwRRrGIDQv7eOwTc3L4r/4DBR
 6AfpRhOL/LtbK03lYR7Y62rUYymMbi9bHQMssEB9SMmqNAfOFUNdBLxYbtudi0/a5Eot
 9Ciw==
X-Gm-Message-State: AOAM531W/XV9yuTW3mOIej+y9uxZVu6xSkidM926sXgqcnCr3s41HSmq
 SKBqa3N+lGbIhDbG2quXCQE=
X-Google-Smtp-Source: ABdhPJwZOWpNpkc4L+im7w0gYyzBUii1B7VuE8AWuGTbb1fmdzKaKgA2ZF5fn7Pjx0DMkuwkW7f7sA==
X-Received: by 2002:a17:90b:384b:: with SMTP id
 nl11mr14089528pjb.91.1597704971653; 
 Mon, 17 Aug 2020 15:56:11 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net.
 [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id e142sm8475411pfh.108.2020.08.17.15.56.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 17 Aug 2020 15:56:11 -0700 (PDT)
Date: Mon, 17 Aug 2020 15:56:04 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH] usb: gadget: aspeed: fixup vhub port irq handling
Message-ID: <20200817225603.GA21228@taoren-ubuntu-R90MNF91>
References: <20200528011154.30355-1-rentao.bupt@gmail.com>
 <875z9hz8k3.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875z9hz8k3.fsf@kernel.org>
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
Cc: linux-aspeed@lists.ozlabs.org, taoren@fb.com,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Aug 17, 2020 at 04:49:32PM +0300, Felipe Balbi wrote:
> 
> Hi,
> 
> rentao.bupt@gmail.com writes:
> > From: Tao Ren <rentao.bupt@gmail.com>
> >
> > This is a follow-on patch for commit a23be4ed8f48 ("usb: gadget: aspeed:
> > improve vhub port irq handling"): for_each_set_bit() is replaced with
> > simple for() loop because for() loop runs faster on ASPEED BMC.
> >
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > ---
> >  drivers/usb/gadget/udc/aspeed-vhub/core.c | 10 +++-------
> >  drivers/usb/gadget/udc/aspeed-vhub/vhub.h |  3 +++
> >  2 files changed, 6 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> > index cdf96911e4b1..be7bb64e3594 100644
> > --- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
> > +++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> > @@ -135,13 +135,9 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
> >  
> >  	/* Handle device interrupts */
> >  	if (istat & vhub->port_irq_mask) {
> > -		unsigned long bitmap = istat;
> > -		int offset = VHUB_IRQ_DEV1_BIT;
> > -		int size = VHUB_IRQ_DEV1_BIT + vhub->max_ports;
> > -
> > -		for_each_set_bit_from(offset, &bitmap, size) {
> > -			i = offset - VHUB_IRQ_DEV1_BIT;
> > -			ast_vhub_dev_irq(&vhub->ports[i].dev);
> > +		for (i = 0; i < vhub->max_ports; i++) {
> > +			if (istat & VHUB_DEV_IRQ(i))
> > +				ast_vhub_dev_irq(&vhub->ports[i].dev);
> 
> how have you measured your statement above? for_each_set_bit() does
> exactly what you did. Unless your architecture has an instruction which
> helps finds the next set bit (like cls on ARM), which, then, makes it
> much faster.

I did some testing and result shows for() loop runs faster than
for_each_set_bit() loop. Please refer to details below (discussion with
Benjamin in the original patch) and kindly let me know your suggestions.

> On Mon, 2020-04-06 at 23:02 -0700, Tao Ren wrote:
> > I ran some testing on my ast2400 and ast2500 BMC and looks like the
> > for() loop runs faster than for_each_set_bit_from() loop in my
> > environment. I'm not sure if something needs to be revised in my test
> > code, but please kindly share your suggestions:
> >
> > I use get_cycles() to calculate execution time of 2 different loops, and
> > ast_vhub_dev_irq() is replaced with barrier() to avoid "noise"; below
> > are the results:
> >
> >   - when downstream port number is 5 and only 1 irq bit is set, it takes
> >     ~30 cycles to finish for_each_set_bit() loop, and 20-25 cycles to
> >     finish the for() loop.
> >
> >   - if downstream port number is 5 and all 5 bits are set, then
> >     for_each_set_bit() loop takes ~50 cycles and for() loop takes ~25
> >     cycles.
> >
> >   - when I increase downsteam port number to 16 and set 1 irq bit, the
> >     for_each_set_bit() loop takes ~30 cycles and for() loop takes 25
> >     cycles. It's a little surprise to me because I thought for() loop
> >     would cost 60+ cycles (3 times of the value when port number is 5).
> >
> >   - if downstream port number is 16 and all irq status bits are set,
> >     then for_each_set_bit() loop takes 60-70 cycles and for() loop takes
> >     30+ cycles.


Cheers,

Tao
