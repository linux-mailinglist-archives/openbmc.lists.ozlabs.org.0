Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1AD31B352
	for <lists+openbmc@lfdr.de>; Mon, 15 Feb 2021 00:26:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Df3K719jJz3cXh
	for <lists+openbmc@lfdr.de>; Mon, 15 Feb 2021 10:26:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=g/+ng38w;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42b;
 helo=mail-wr1-x42b.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=g/+ng38w; dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dcmk139fqzDwl9
 for <openbmc@lists.ozlabs.org>; Sat, 13 Feb 2021 08:25:12 +1100 (AEDT)
Received: by mail-wr1-x42b.google.com with SMTP id g10so922515wrx.1
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2021 13:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=YjjHCq+AaBj0XRYyjJcKHPRmimymXfzCaBl7Q8eWwy8=;
 b=g/+ng38wC9WYIlhYgvh782IXg97sbu5H2bHQg1fy7G4fxRCDUpCXZYdC+JCdpR4XNl
 Yw5Ma7Df7VSTosK+Dg8OVl4GkjbrkQcBOr9Xiq3HfIy9rrvpOLM2OJiDkwlwkM0SFDI7
 UHSwSicLZ6LJXAz3TisYUsBt/xJ8jWyYX8BzM2Lo009dLjxp53FC9tvnepVgjRZMbFd/
 bXLNUHrFZbj2ddXflBkWLstEStL9n2VuvHN0mRzmIUfonYou48N1YYdJ+uVOhxISaRBi
 OG30sLac+3Ch3ksBfi6z1dNsNZnNSXnslZ3W5X7fM7+KJoRbR9grInEhcZoLtiUcbf2V
 /IZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=YjjHCq+AaBj0XRYyjJcKHPRmimymXfzCaBl7Q8eWwy8=;
 b=QhO9kSAdnfTC1i6+9d+Yat/n+fM0fB0Kx03834lmiyVk85HZUlvUdyMPf2kHu5ad01
 46ApqnBHh8MTdForOpl1p0/dKuCgxtfys6HN4DULBeilgEJJiINNoTkDKmHWB0iF904B
 WdgOHnS+kWd5IaFdcCcY7n8HWzHtbM6uZyXR3bL2yYZqDqwz2CMLS1wbxawmekDTTcHj
 lTiOQnwjXSHp32gzEfls4jmyep1ToyNVbtY4XC4+8+52aA+k+h1kKpkKL2Jn/7AMwtNK
 IM6H7JbQ9S/VlihkHfRGBD94FB0/F4DEa78cdUtIybvSWrhLtW16qac1FAk0MZvEaSmh
 zL2w==
X-Gm-Message-State: AOAM532cgDHn9hpKHzSDu8EVBO6lgrzd2ivxoMK/PK5Fvo5/A6otONUU
 SVYp+O2u4ZbswmM4ahsQ48ezmg==
X-Google-Smtp-Source: ABdhPJyceRwViwNbQKYFvMrDwH6pKxFiN51zbBbWqHy07haY7AmOeuB1Eg6qPAAr61Zco1QGQRaiqQ==
X-Received: by 2002:a5d:6a89:: with SMTP id s9mr5614295wru.407.1613165106841; 
 Fri, 12 Feb 2021 13:25:06 -0800 (PST)
Received: from dell ([91.110.221.187])
 by smtp.gmail.com with ESMTPSA id a16sm11571760wrr.89.2021.02.12.13.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 13:25:06 -0800 (PST)
Date: Fri, 12 Feb 2021 21:25:03 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 00/21] [Set 2] Rid W=1 warnings from Clock
Message-ID: <20210212212503.GC179940@dell>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
 <161307643148.1254594.6590013599999468609@swboyd.mtv.corp.google.com>
 <20210211211054.GD4572@dell>
 <161309925025.1254594.6210738031889810500@swboyd.mtv.corp.google.com>
 <20210212092016.GF4572@dell>
 <161316374113.1254594.14156657225822268891@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <161316374113.1254594.14156657225822268891@swboyd.mtv.corp.google.com>
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

> Quoting Lee Jones (2021-02-12 01:20:16)
> > On Thu, 11 Feb 2021, Stephen Boyd wrote:
> > 
> > > Quoting Lee Jones (2021-02-11 13:10:54)
> > > > On Thu, 11 Feb 2021, Stephen Boyd wrote:
> > > > 
> > > > > Quoting Lee Jones (2021-01-26 04:45:19)
> > > > > > This set is part of a larger effort attempting to clean-up W=1
> > > > > > kernel builds, which are currently overwhelmingly riddled with
> > > > > > niggly little warnings.
> > > > > > 
> > > > > > This is the last set.  Clock is clean after this.
> > > > > 
> > > > > Is it possible to slam in some patch that makes W=1 the default for the
> > > > > clk directory? I'm trying to avoid seeing this patch series again.
> > > > 
> > > > One of my main goals of this project is that everyone (contributors,
> > > > maintainers auto-builder robots etc) will be enabling W=1 builds
> > > > *locally*.
> > > > 
> > > > This isn't something you'll want to do at a global (i.e. in Mainline)
> > > > level.  That's kinda the point of W=1.
> > > > 
> > > 
> > > Agreed, but is it possible to pass W=1 in the drivers/clk/Makefile?
> > 
> > That would circumvent the point of W=1.  Level-1 warnings are deemed,
> > and I'm paraphrasing/making this up "not worth rejecting pull-requests
> > over".  In contrast, if Linus catches any W=0 warnings at pull-time,
> > he will reject the pull-request as 'untested'.
> > 
> > W=1 is defiantly something you'll want to enable locally though, and
> > subsequently push back on contributors submitting code adding new
> > ones.
> > 
> 
> Why should I install a land mine for others to trip over? Won't that
> just take them more time because they won't know to compile with W=1 and
> then will have to go for another round of review while I push back on
> them submitting new warnings?

The alternative is to not worry about it and review the slow drip of
fixes that will occur as a result.  The issues I just fixed were built
up over years.  They won't get to that level again.

In my mind contributors should be compiling their submissions with W=1
enabled by default.  I'm fairly sure the auto-builders do this now.

Once W=1 warnings are down to an acceptable level in the kernel as a
whole, we can provide some guidance in SubmittingPatches (or similar)
on how to enable them (hint: you add "W=1" on the compile line).

Enabling W=1 in the default build will only serve to annoy Linus IMHO.
If he wants them to be enabled by default, they wouldn't be W=1 in the
first place, they'd be W=0 which *is* the default build.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
