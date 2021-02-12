Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6449B31B35A
	for <lists+openbmc@lfdr.de>; Mon, 15 Feb 2021 00:27:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Df3LQ3JN0z3bN6
	for <lists+openbmc@lfdr.de>; Mon, 15 Feb 2021 10:27:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lzptYNv+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::330;
 helo=mail-wm1-x330.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lzptYNv+; dkim-atps=neutral
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcpKq3kTlzDwvR
 for <openbmc@lists.ozlabs.org>; Sat, 13 Feb 2021 09:37:47 +1100 (AEDT)
Received: by mail-wm1-x330.google.com with SMTP id n10so1137396wmq.0
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2021 14:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=gabp5PA91SwinpJ0/myZDDPAWJJmDGhuF5vT4HNQofk=;
 b=lzptYNv+Z/QkUjO1dor3sL5BlvgIRzJT0h3tMKe+AEsBnXH7z9s3DEjUf4ogNn07Bm
 SYkfEK7DEk7HbO6bs2GfyVnUPJuIbwvSYRQZU3qm/ENvlPlqYZYeeFUmElt8hp9808Gh
 jHiPsPRyuDq4vcSW3ZynoMmbn8t/Vf83Qeij8ATKKgXsvBiBStVp2M/aogaFGZo2G9l9
 KOksv/RBoVdxTB+BnnfIFJzEKw94Qm6UwwU4X4q4w6Xrx3QHpWeTjpL/uS9dH4q0UvT/
 nOAIOypn0sTekthhwXWei2O6M2wnbBdsYnwxj2Gp697y/os3Rxes6rNclui8jYxeeUvD
 fA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=gabp5PA91SwinpJ0/myZDDPAWJJmDGhuF5vT4HNQofk=;
 b=d96aWFJn7u3LVnQ1rZGgbvzb6QwnA2dUR+Fk7/Lv6QWXqOjamu2tUepEP1GkwJI/5F
 Pf4MiAzjIms6hUr22iiDa/3teISmI/3JDWHTXCdom7uDkfKUNAiVKXnGeqN2vTwFf56f
 OQ0QvtcQQgHwvMVHEi5JXNHBQLGM5Ywm8b40ok2qZor2aPcvgZDuQmV0UIv0gK2mJKJP
 gagzlUG9I5RYatfAuOF53mpBVXFikxB/veGcHWG01UnIb4jlLFWnLwwdyz5o6OZBSJfX
 g9NQGeFNVMcla6umyez5fZrGlsO9a6+bS81cUcstyarJxKdcWMDvPZTVT4KdhBVYb+AX
 guZw==
X-Gm-Message-State: AOAM5307qbKGa7YCnpVt6y542laWRyUp8ld5/qhYPvX/EU/eP8lAbYa6
 Hd0i7IRjLKGC6X4HNPfHQRjyyA==
X-Google-Smtp-Source: ABdhPJw/W7aXURMUdb+FiiPcMWZ20hidPBYo6T7ZCqELCNUFf+nZRpp16Lmp3XkUiPvFeKkrd7BkhQ==
X-Received: by 2002:a1c:bd55:: with SMTP id n82mr4450894wmf.93.1613169462215; 
 Fri, 12 Feb 2021 14:37:42 -0800 (PST)
Received: from dell ([91.110.221.187])
 by smtp.gmail.com with ESMTPSA id l5sm11839112wrv.44.2021.02.12.14.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 14:37:41 -0800 (PST)
Date: Fri, 12 Feb 2021 22:37:39 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 00/21] [Set 2] Rid W=1 warnings from Clock
Message-ID: <20210212223739.GE179940@dell>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
 <161307643148.1254594.6590013599999468609@swboyd.mtv.corp.google.com>
 <20210211211054.GD4572@dell>
 <161309925025.1254594.6210738031889810500@swboyd.mtv.corp.google.com>
 <20210212092016.GF4572@dell>
 <161316374113.1254594.14156657225822268891@swboyd.mtv.corp.google.com>
 <20210212212503.GC179940@dell> <20210212212630.GD179940@dell>
 <161316754567.1254594.9542583200097699504@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <161316754567.1254594.9542583200097699504@swboyd.mtv.corp.google.com>
X-Mailman-Approved-At: Mon, 15 Feb 2021 10:22:39 +1100
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
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rajeev Kumar <rajeev-dlh.kumar@st.com>, Jan Kotas <jank@cadence.com>,
 Russell King <linux@armlinux.org.uk>, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Benjamin Fair <benjaminfair@google.com>,
 Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
 Viresh Kumar <vireshk@kernel.org>, openbmc@lists.ozlabs.org,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 Loc Ho <lho@apm.com>, NXP Linux Team <linux-imx@nxp.com>,
 Richard Woodruff <r-woodruff2@ti.com>, Tali Perry <tali.perry1@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Tero Kristo <kristo@kernel.org>,
 Rajan Vaja <rajan.vaja@xilinx.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Nuvoton Technologies <tali.perry@nuvoton.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 12 Feb 2021, Stephen Boyd wrote:

> Quoting Lee Jones (2021-02-12 13:26:30)
> > On Fri, 12 Feb 2021, Lee Jones wrote:
> > 
> > > The alternative is to not worry about it and review the slow drip of
> > > fixes that will occur as a result.  The issues I just fixed were built
> > > up over years.  They won't get to that level again.
> > > 
> > > In my mind contributors should be compiling their submissions with W=1
> > > enabled by default.  I'm fairly sure the auto-builders do this now.
> 
> That's good.
> 
> > > 
> > > Once W=1 warnings are down to an acceptable level in the kernel as a
> > > whole, we can provide some guidance in SubmittingPatches (or similar)
> > > on how to enable them (hint: you add "W=1" on the compile line).
> > > 
> > > Enabling W=1 in the default build will only serve to annoy Linus IMHO.
> > > If he wants them to be enabled by default, they wouldn't be W=1 in the
> > > first place, they'd be W=0 which *is* the default build.
> > 
> > Just to add real quick - my advice is to enable them for yourself and
> > send back any issues along with your normal review.  A W=1 issue is no
> > different to a semantic or coding style one.
> > 
> 
> I'd like to enable it for only files under drivers/clk/ but it doesn't
> seem to work. I'm not asking to enable it at the toplevel Makefile. I'm
> asking to enable it for drivers/clk/ so nobody has to think about it now
> that you've done the hard work of getting the numbers in this directory
> down to zero or close to zero.

I'm not sure which one of us is confused.  Probably me, but ...

Even if you could enable it per-subsystem, how would that help you?

How can you ensure that contributors see any new W=1 warnings, but
Linus doesn't?  When Linus conducts his build-tests during the merge
window, he is also going to build W=1 for drivers/clk.

All that's going to achieve is put you in the firing line.

From my PoV W=1 builds should be enabled during the development phase
(i.e. contributor, auto-builder, maintainer).  By the time patches get
make it into Mainline the review/testing stage is over and only the
default W=0 warnings are meaningful.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
