Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC06D300764
	for <lists+openbmc@lfdr.de>; Fri, 22 Jan 2021 16:33:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMjvK3dgCzDsP3
	for <lists+openbmc@lfdr.de>; Sat, 23 Jan 2021 02:33:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22b;
 helo=mail-oi1-x22b.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pGjPfkb5; dkim-atps=neutral
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMjt82MBjzDqHm;
 Sat, 23 Jan 2021 02:31:55 +1100 (AEDT)
Received: by mail-oi1-x22b.google.com with SMTP id r189so6359513oih.4;
 Fri, 22 Jan 2021 07:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=WAI9EmxO3OdflrUnEgXpGM4CRb9QLdpplJPoTa7R+cY=;
 b=pGjPfkb55wKYX9mvuZTQi7AZBGV2QCOZFoXy9RzWdf2gyj/GW2FFSyQKljP4zXID50
 v2uASSUdUkQ3mHimoXvFdWvpPvuufAaZoepwM90faKAf2dX6xAvmXcXhVTCyCBJEsL7n
 fV0HG3Oh5ostJFIr3RXkQtWzI8E5nAVY4IxpP3iM1RVH2hg5/O6Gpjtfmw2cPorbuGFN
 E7h/wA8FOlWPXOCrTxGwhOOuPJahWYyOJGEuoP8kp0Fn9T5pvoSnASh4NCCiStEONF/z
 +5M4sOmAEAlWE+9fEctq2pN8XoyuwM0nCvGXpPyi4oWe7qWOpyEyJatW2PPcWsPbc+VQ
 cmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=WAI9EmxO3OdflrUnEgXpGM4CRb9QLdpplJPoTa7R+cY=;
 b=gaUoXvAT7Qa0lul9s2ypv7TfGpxrzHZf9NA7N6/tBG+ac4EItp/sNh5/fecAFCA/Tc
 VZ+BfhjNUD9u03y1BPBVL9hpu+Rr8d897atIhZ+xoEeu5mNYwmfT0SpdNMX9W5IAiTAc
 q/AEKBE6524Zd9BOPazxIbqQNF5pOcbE/cItEynKyJI0V2n07fd1YsvASrIQlzbDo8gc
 te7ON/g8PpSiOAfTR0oeIr9cjAvtX8IeKde9yb5DM63Zc07LB06ElZTmF+6F+FTvVNmI
 0iGgLt+Ct0KaOggkgVYq/zDu7LuDKUYvYYhWhBIj18+ZfrgMpv8z5X4U7BmxN7C7hcwl
 SmkQ==
X-Gm-Message-State: AOAM533XwmcMszf9koob53ur3TV7vgtT+Ho1GNT++5MoYbvgJQeUQGVk
 I2eNrL2vzYZDgyFgT2ttog==
X-Google-Smtp-Source: ABdhPJz+ggRZGBXu3zz8mjszaqMjK+cra/M1UXcQnQ4rQ57Dsba4pFrBTo5xSMzW1dzsOTjtZu39OQ==
X-Received: by 2002:aca:d417:: with SMTP id l23mr3595479oig.145.1611329511568; 
 Fri, 22 Jan 2021 07:31:51 -0800 (PST)
Received: from serve.minyard.net ([47.184.170.156])
 by smtp.gmail.com with ESMTPSA id n82sm1014044oih.39.2021.01.22.07.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 07:31:50 -0800 (PST)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:ecb8:97e0:27ff:a134])
 by serve.minyard.net (Postfix) with ESMTPSA id A45C7180042;
 Fri, 22 Jan 2021 15:31:49 +0000 (UTC)
Date: Fri, 22 Jan 2021 09:31:48 -0600
From: Corey Minyard <minyard@acm.org>
To: ChiaWei Wang <chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH v5 3/5] ipmi: kcs: aspeed: Adapt to new LPC DTS layout
Message-ID: <20210122153148.GB1157510@minyard.net>
References: <20210114131622.8951-1-chiawei_wang@aspeedtech.com>
 <20210114131622.8951-4-chiawei_wang@aspeedtech.com>
 <c8421730-f8a6-46a7-9e2c-9107eb979276@www.fastmail.com>
 <HK0PR06MB3779C3106D2FC593B5E5243F91A00@HK0PR06MB3779.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HK0PR06MB3779C3106D2FC593B5E5243F91A00@HK0PR06MB3779.apcprd06.prod.outlook.com>
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
Reply-To: minyard@acm.org
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Haiyue Wang <haiyue.wang@linux.intel.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 BMC-SW <BMC-SW@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Cyril Bur <cyrilbur@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jan 22, 2021 at 09:55:56AM +0000, ChiaWei Wang wrote:
> Hi Corey,
> 
> Could you help to review this patch to kcs_bmc_aspeed.c?
> It mainly fixes the register layout/offsets of Aspeed LPC controller.

I am not really qualified to review this.  It looks ok from a structural
and style point of view, but that's all I can tell.  So I'm ok with it.

Acked-by: Corey Minyard <cminyard@mvista.com>

> 
> Thanks,
> Chiawei
> 
> > -----Original Message-----
> > From: Andrew Jeffery <andrew@aj.id.au>
> > Sent: Wednesday, January 20, 2021 1:03 PM
> > Subject: Re: [PATCH v5 3/5] ipmi: kcs: aspeed: Adapt to new LPC DTS layout
> > 
> > 
> > 
> > On Thu, 14 Jan 2021, at 23:46, Chia-Wei, Wang wrote:
> > > Add check against LPC device v2 compatible string to ensure that the
> > > fixed device tree layout is adopted.
> > > The LPC register offsets are also fixed accordingly.
> > >
> > > Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
> > > Acked-by: Haiyue Wang <haiyue.wang@linux.intel.com>
> > 
> > Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> 
> Thanks for the review.
