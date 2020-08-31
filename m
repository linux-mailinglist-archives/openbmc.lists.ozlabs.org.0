Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30096258468
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 01:27:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgRDr1T54zDqQs
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 09:27:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=C6FtQVjb; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgRCv6gR6zDqN0;
 Tue,  1 Sep 2020 09:26:19 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id mm21so734384pjb.4;
 Mon, 31 Aug 2020 16:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dVqPUed6NYAwD+JrLth2cd5hFPQoV0967E1Zso4MptU=;
 b=C6FtQVjb+tO6vCWuzysuTcPpSGLKdJk7gkia3YFeAH23aoinfa3/PIuD4LDboFBjnH
 JfPIXMT9AR3TcRuKpjhxHl2DBEzjUPOsl0OQHQzfWvEebntMDgmAuU+D/QAHs6r1Tvtq
 Of46KsU+GKkJrtN2rJEfsf7HIDIr23qcIg4E6wQPr5cIeW1KUlRYp/MakFRAKVRqVn1Y
 xPSf3g6GVRUW7dYFviCXzjhdVl867ysOH7yVbuKCjcO9+QMxtk0rTR5yFxEdnA8a1IyP
 TYpn+fkJYoKYbgTI8TTNOAeXJiqr88qjCxtqY2ITftwLGtsTp6XRwpGkcvsOaRthfp4e
 9tRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dVqPUed6NYAwD+JrLth2cd5hFPQoV0967E1Zso4MptU=;
 b=YLcBn5Lns1g9zHvvwr2ZPJd0pW/L3xQrSoiwashExj72fgwnpgOJiUTKKVCrE68ZkC
 H7zlC1NOPWsHDK4jjVwZhRCeNa8ljaWTs5ZG2ce6YgC4Ye4noCt36Hx9D9jjzZZeiNLb
 bcCDtztiC2q2Wk/SmcPx15yAaxAx8H9j24io1HmDBTv5W/3c1OMRuWt/XcagzpL+aO4O
 bq9utnQHC35kL8bD7jyIgiUestBpq1CR8r6ONbuaN96RgWTSZROZUCOZIfLpDKZLpFVv
 ykQxaAYL+LxEvcPZg04tEfLEzjk2mR3ozM+rjKXIxKcAf+JP0cprYdl7KxnSBL6tqq53
 nLIw==
X-Gm-Message-State: AOAM531/j2U8/A68V7MRtTg2dFysYWxFt5XHwHNj3IFfSl0dSUtrRndW
 W7SMojoCdoSqyQuh9ik42yY=
X-Google-Smtp-Source: ABdhPJzJ6saM8zCmqhQnS70tKIwx+Bdr92ksZutTZ/A/cd+o9UimIAZzUJXkzj/t9etnpxk3zzC10A==
X-Received: by 2002:a17:90a:5609:: with SMTP id
 r9mr1520433pjf.194.1598916376023; 
 Mon, 31 Aug 2020 16:26:16 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net.
 [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id w16sm686816pjd.50.2020.08.31.16.26.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 31 Aug 2020 16:26:15 -0700 (PDT)
Date: Mon, 31 Aug 2020 16:26:08 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH] usb: gadget: aspeed: fixup vhub port irq handling
Message-ID: <20200831232607.GA4015@taoren-ubuntu-R90MNF91>
References: <20200528011154.30355-1-rentao.bupt@gmail.com>
 <875z9hz8k3.fsf@kernel.org>
 <20200817225603.GA21228@taoren-ubuntu-R90MNF91>
 <87y2lv9m32.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y2lv9m32.fsf@kernel.org>
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

On Mon, Aug 31, 2020 at 12:54:57PM +0300, Felipe Balbi wrote:
> 
> Hi,
> 
> Tao Ren <rentao.bupt@gmail.com> writes:
> > On Mon, Aug 17, 2020 at 04:49:32PM +0300, Felipe Balbi wrote:
> >> 
> >> Hi,
> >> 
> >> rentao.bupt@gmail.com writes:
> >> > From: Tao Ren <rentao.bupt@gmail.com>
> >> >
> >> > This is a follow-on patch for commit a23be4ed8f48 ("usb: gadget: aspeed:
> >> > improve vhub port irq handling"): for_each_set_bit() is replaced with
> >> > simple for() loop because for() loop runs faster on ASPEED BMC.
> >> >
> >> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> >> > ---
> >> >  drivers/usb/gadget/udc/aspeed-vhub/core.c | 10 +++-------
> >> >  drivers/usb/gadget/udc/aspeed-vhub/vhub.h |  3 +++
> >> >  2 files changed, 6 insertions(+), 7 deletions(-)
> >> >
> >> > diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> >> > index cdf96911e4b1..be7bb64e3594 100644
> >> > --- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
> >> > +++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> >> > @@ -135,13 +135,9 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
> >> >  
> >> >  	/* Handle device interrupts */
> >> >  	if (istat & vhub->port_irq_mask) {
> >> > -		unsigned long bitmap = istat;
> >> > -		int offset = VHUB_IRQ_DEV1_BIT;
> >> > -		int size = VHUB_IRQ_DEV1_BIT + vhub->max_ports;
> >> > -
> >> > -		for_each_set_bit_from(offset, &bitmap, size) {
> >> > -			i = offset - VHUB_IRQ_DEV1_BIT;
> >> > -			ast_vhub_dev_irq(&vhub->ports[i].dev);
> >> > +		for (i = 0; i < vhub->max_ports; i++) {
> >> > +			if (istat & VHUB_DEV_IRQ(i))
> >> > +				ast_vhub_dev_irq(&vhub->ports[i].dev);
> >> 
> >> how have you measured your statement above? for_each_set_bit() does
> >> exactly what you did. Unless your architecture has an instruction which
> >> helps finds the next set bit (like cls on ARM), which, then, makes it
> >> much faster.
> >
> > I did some testing and result shows for() loop runs faster than
> > for_each_set_bit() loop. Please refer to details below (discussion with
> > Benjamin in the original patch) and kindly let me know your suggestions.
> 
> no strong feelings, just surprised that you're already worried about
> 20~40 cycles of cpu time ;-)
> 
> Patch applied for next merge window

Thanks Felipe. Ben had some concerns about interrupt handling cost on
AST2400 BMC (ARM9), hence we did the comparison and noticed the small
difference :)


Cheers,

Tao
