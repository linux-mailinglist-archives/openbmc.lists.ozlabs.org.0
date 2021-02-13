Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A75C131B35B
	for <lists+openbmc@lfdr.de>; Mon, 15 Feb 2021 00:28:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Df3Ls3s0Rz30JH
	for <lists+openbmc@lfdr.de>; Mon, 15 Feb 2021 10:28:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G9Px+xh1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=G9Px+xh1; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcrJR0yZJzDvZq
 for <openbmc@lists.ozlabs.org>; Sat, 13 Feb 2021 11:06:47 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 44DBE64D5D;
 Sat, 13 Feb 2021 00:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613174804;
 bh=6m1MgblqVpx2ZL9Qb/ULnnRME03jhhV7p1Q36nSaUdY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=G9Px+xh1+C0b30Uqy4encAJlGjMbAWpLfR5SAqO9vaRJbBjxE9UQYVrpp0yBfBIMS
 23goH7nV09kbpsgRisoN4zPe4DFtI2ayczc53Vt4TAOFQLjeqOYiihoCDoOuCM0qTx
 zZH53/j5K6S6+SH18reXPp8rjn42X4eAuz5djM3M0fqQURKKGdjgXsufRcvgxKB85K
 rwlecfi/HU/SAIDG3IlMTY6GyUv9o50ac2ncy/AId4c8BZroJp6QJarB4Sc7r+cnfU
 TKDDPIwg7hmISxx1hZBHfSNx2Sne12k3j1vqou9djofxPikw29IuOj9Ct5p7u2nExT
 pOX7KrfmUSClA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210212223739.GE179940@dell>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
 <161307643148.1254594.6590013599999468609@swboyd.mtv.corp.google.com>
 <20210211211054.GD4572@dell>
 <161309925025.1254594.6210738031889810500@swboyd.mtv.corp.google.com>
 <20210212092016.GF4572@dell>
 <161316374113.1254594.14156657225822268891@swboyd.mtv.corp.google.com>
 <20210212212503.GC179940@dell> <20210212212630.GD179940@dell>
 <161316754567.1254594.9542583200097699504@swboyd.mtv.corp.google.com>
 <20210212223739.GE179940@dell>
Subject: Re: [PATCH 00/21] [Set 2] Rid W=1 warnings from Clock
From: Stephen Boyd <sboyd@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Date: Fri, 12 Feb 2021 16:06:43 -0800
Message-ID: <161317480301.1254594.16648868282165823277@swboyd.mtv.corp.google.com>
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

Quoting Lee Jones (2021-02-12 14:37:39)
> On Fri, 12 Feb 2021, Stephen Boyd wrote:
>=20
> >=20
> > I'd like to enable it for only files under drivers/clk/ but it doesn't
> > seem to work. I'm not asking to enable it at the toplevel Makefile. I'm
> > asking to enable it for drivers/clk/ so nobody has to think about it now
> > that you've done the hard work of getting the numbers in this directory
> > down to zero or close to zero.
>=20
> I'm not sure which one of us is confused.  Probably me, but ...
>=20
> Even if you could enable it per-subsystem, how would that help you?
>=20
> How can you ensure that contributors see any new W=3D1 warnings, but
> Linus doesn't?  When Linus conducts his build-tests during the merge
> window, he is also going to build W=3D1 for drivers/clk.

The assumption is contributors would have compiled the code they're
sending, but that's obviously not always the case, so this assumption
relies on developers running make. If they do run make then the hope is
they would see the warnings now, without having to rely on them to know
about passing W=3D1 to make, and fix them before sending code. If
developers are ignoring build errors or warnings then we can't do
anything anyway.

>=20
> All that's going to achieve is put you in the firing line.

Ok. Is this prior experience?

>=20
> From my PoV W=3D1 builds should be enabled during the development phase
> (i.e. contributor, auto-builder, maintainer).  By the time patches get
> make it into Mainline the review/testing stage is over and only the
> default W=3D0 warnings are meaningful.
>=20

Alright maybe I don't understand and W=3D1 builds are noisy for the
drivers/clk subdirectory even after applying these patches. Or it has
some false positives that won't be fixed? Or a new compiler can cause
new warnings to happen? I could see these things being a problem.

I'm trying to see if we can make lives better for everyone by exposing
the warnings by default in the drivers/clk/ directory now that there are
supposedly none left. Shouldn't we tighten the screws now that we've
cleaned them?
