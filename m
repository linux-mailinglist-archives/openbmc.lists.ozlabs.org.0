Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E81431B351
	for <lists+openbmc@lfdr.de>; Mon, 15 Feb 2021 00:26:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Df3Jj37Q8z3cVT
	for <lists+openbmc@lfdr.de>; Mon, 15 Feb 2021 10:26:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L8vv2t4t;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=L8vv2t4t; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcmCj2x50zDwsl
 for <openbmc@lists.ozlabs.org>; Sat, 13 Feb 2021 08:02:25 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 77F8864E05;
 Fri, 12 Feb 2021 21:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613163742;
 bh=W+5rNCA1AtqnGKfforyDrX1jEmPAq1AoeUYShAARidk=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=L8vv2t4t8eAuoCqn8NxiLKXPHOLn2qbZG/rTldBEck1qE3UJ9ZQgBMmDyAS+LCWPW
 EzmQrYymjIjWzdM9L/7FXHZGGuj4mL3xtQEcEf8CqaYplO6L5RYs8XX06VCEcsrfdR
 DnZefkSwJ3C/7GBHqDkPzplqR/1x05jRlJKJ6qT2qfEMeI8gZgeYtGj7iTUFb1gaWJ
 0ewKJtGcnZgMY3nAWLZLIyhSM+nXjoN/Oz5tcLNPp2ONVxpr8E+MxgzJz7ExgeG7/5
 lQhWIt1CShxke8FA18oo80Hy1k04ysgkM9gd+JOi/WRC9EeZrRZTWgw/1ZKPKae8Jz
 RI+6N32IPbIKg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210212092016.GF4572@dell>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
 <161307643148.1254594.6590013599999468609@swboyd.mtv.corp.google.com>
 <20210211211054.GD4572@dell>
 <161309925025.1254594.6210738031889810500@swboyd.mtv.corp.google.com>
 <20210212092016.GF4572@dell>
Subject: Re: [PATCH 00/21] [Set 2] Rid W=1 warnings from Clock
From: Stephen Boyd <sboyd@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Date: Fri, 12 Feb 2021 13:02:21 -0800
Message-ID: <161316374113.1254594.14156657225822268891@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
 Emilio =?utf-8?q?L=C3=B3pez?= <emilio@elopez.com.ar>,
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
 =?utf-8?q?S=C3=B6ren?= Brinkmann <soren.brinkmann@xilinx.com>,
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

Quoting Lee Jones (2021-02-12 01:20:16)
> On Thu, 11 Feb 2021, Stephen Boyd wrote:
>=20
> > Quoting Lee Jones (2021-02-11 13:10:54)
> > > On Thu, 11 Feb 2021, Stephen Boyd wrote:
> > >=20
> > > > Quoting Lee Jones (2021-01-26 04:45:19)
> > > > > This set is part of a larger effort attempting to clean-up W=3D1
> > > > > kernel builds, which are currently overwhelmingly riddled with
> > > > > niggly little warnings.
> > > > >=20
> > > > > This is the last set.  Clock is clean after this.
> > > >=20
> > > > Is it possible to slam in some patch that makes W=3D1 the default f=
or the
> > > > clk directory? I'm trying to avoid seeing this patch series again.
> > >=20
> > > One of my main goals of this project is that everyone (contributors,
> > > maintainers auto-builder robots etc) will be enabling W=3D1 builds
> > > *locally*.
> > >=20
> > > This isn't something you'll want to do at a global (i.e. in Mainline)
> > > level.  That's kinda the point of W=3D1.
> > >=20
> >=20
> > Agreed, but is it possible to pass W=3D1 in the drivers/clk/Makefile?
>=20
> That would circumvent the point of W=3D1.  Level-1 warnings are deemed,
> and I'm paraphrasing/making this up "not worth rejecting pull-requests
> over".  In contrast, if Linus catches any W=3D0 warnings at pull-time,
> he will reject the pull-request as 'untested'.
>=20
> W=3D1 is defiantly something you'll want to enable locally though, and
> subsequently push back on contributors submitting code adding new
> ones.
>=20

Why should I install a land mine for others to trip over? Won't that
just take them more time because they won't know to compile with W=3D1 and
then will have to go for another round of review while I push back on
them submitting new warnings?
