Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB13331B357
	for <lists+openbmc@lfdr.de>; Mon, 15 Feb 2021 00:27:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Df3L04d86z3ckZ
	for <lists+openbmc@lfdr.de>; Mon, 15 Feb 2021 10:27:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=utCEACe2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=utCEACe2; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dcnct2zs9zDrQG
 for <openbmc@lists.ozlabs.org>; Sat, 13 Feb 2021 09:05:50 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0132264DE0;
 Fri, 12 Feb 2021 22:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613167547;
 bh=x7+O4dfMkemD6U+vgZkpKlnW63NDjJ8hkv36eJK9x4o=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=utCEACe2van290abpiVInryUj9yVn2FwsXMbagw9hbUab72VorrpgY32/Amx4utiN
 j7Mc9urIjizH+MO0kEXOEdRlO76JE8KDEfkf4VWZwpa5zwrsAHPR56JbVeQtLZm12M
 bt5NlZBF9WzNhSn0NR7WBJh7jZ+hZ/mTGX3E9sSXjoSfOubGx2bNNkcKvhIvonnWu6
 JniU8yhese97VZl+fQvPXwdJS917BMwsjIXpAOMxS4tvp7ZmpIAVtFA5fW1n1VvGsu
 HrqDR1yu8d1pn1hjR0JDtDenwDYyBO+cHSWBDZDx/N3OrSRsy+traSF5EdAtnY+kyN
 qSNMsCRFENbmg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210212212630.GD179940@dell>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
 <161307643148.1254594.6590013599999468609@swboyd.mtv.corp.google.com>
 <20210211211054.GD4572@dell>
 <161309925025.1254594.6210738031889810500@swboyd.mtv.corp.google.com>
 <20210212092016.GF4572@dell>
 <161316374113.1254594.14156657225822268891@swboyd.mtv.corp.google.com>
 <20210212212503.GC179940@dell> <20210212212630.GD179940@dell>
Subject: Re: [PATCH 00/21] [Set 2] Rid W=1 warnings from Clock
From: Stephen Boyd <sboyd@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Date: Fri, 12 Feb 2021 14:05:45 -0800
Message-ID: <161316754567.1254594.9542583200097699504@swboyd.mtv.corp.google.com>
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

Quoting Lee Jones (2021-02-12 13:26:30)
> On Fri, 12 Feb 2021, Lee Jones wrote:
>=20
> > The alternative is to not worry about it and review the slow drip of
> > fixes that will occur as a result.  The issues I just fixed were built
> > up over years.  They won't get to that level again.
> >=20
> > In my mind contributors should be compiling their submissions with W=3D1
> > enabled by default.  I'm fairly sure the auto-builders do this now.

That's good.

> >=20
> > Once W=3D1 warnings are down to an acceptable level in the kernel as a
> > whole, we can provide some guidance in SubmittingPatches (or similar)
> > on how to enable them (hint: you add "W=3D1" on the compile line).
> >=20
> > Enabling W=3D1 in the default build will only serve to annoy Linus IMHO.
> > If he wants them to be enabled by default, they wouldn't be W=3D1 in the
> > first place, they'd be W=3D0 which *is* the default build.
>=20
> Just to add real quick - my advice is to enable them for yourself and
> send back any issues along with your normal review.  A W=3D1 issue is no
> different to a semantic or coding style one.
>=20

I'd like to enable it for only files under drivers/clk/ but it doesn't
seem to work. I'm not asking to enable it at the toplevel Makefile. I'm
asking to enable it for drivers/clk/ so nobody has to think about it now
that you've done the hard work of getting the numbers in this directory
down to zero or close to zero.
