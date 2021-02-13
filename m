Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A73B31B35E
	for <lists+openbmc@lfdr.de>; Mon, 15 Feb 2021 00:28:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Df3MZ3RP7z30RK
	for <lists+openbmc@lfdr.de>; Mon, 15 Feb 2021 10:28:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DdG960PwKzDqC6
 for <openbmc@lists.ozlabs.org>; Sun, 14 Feb 2021 03:31:53 +1100 (AEDT)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lAxJT-0064CT-UT; Sat, 13 Feb 2021 16:58:27 +0100
Date: Sat, 13 Feb 2021 16:58:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 00/21] [Set 2] Rid W=1 warnings from Clock
Message-ID: <YCf3Iwt3KGZRtNgN@lunn.ch>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
 <161307643148.1254594.6590013599999468609@swboyd.mtv.corp.google.com>
 <20210211211054.GD4572@dell>
 <161309925025.1254594.6210738031889810500@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161309925025.1254594.6210738031889810500@swboyd.mtv.corp.google.com>
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
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 linux-omap@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Benjamin Fair <benjaminfair@google.com>,
 Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
 Viresh Kumar <vireshk@kernel.org>, openbmc@lists.ozlabs.org,
 Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 Loc Ho <lho@apm.com>, NXP Linux Team <linux-imx@nxp.com>,
 Richard Woodruff <r-woodruff2@ti.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-clk@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-tegra@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, Tali Perry <tali.perry1@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Rajan Vaja <rajan.vaja@xilinx.com>,
 Tero Kristo <kristo@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Nuvoton Technologies <tali.perry@nuvoton.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Feb 11, 2021 at 07:07:30PM -0800, Stephen Boyd wrote:
> Quoting Lee Jones (2021-02-11 13:10:54)
> > On Thu, 11 Feb 2021, Stephen Boyd wrote:
> > 
> > > Quoting Lee Jones (2021-01-26 04:45:19)
> > > > This set is part of a larger effort attempting to clean-up W=1
> > > > kernel builds, which are currently overwhelmingly riddled with
> > > > niggly little warnings.
> > > > 
> > > > This is the last set.  Clock is clean after this.
> > > 
> > > Is it possible to slam in some patch that makes W=1 the default for the
> > > clk directory? I'm trying to avoid seeing this patch series again.
> > 
> > One of my main goals of this project is that everyone (contributors,
> > maintainers auto-builder robots etc) will be enabling W=1 builds
> > *locally*.
> > 
> > This isn't something you'll want to do at a global (i.e. in Mainline)
> > level.  That's kinda the point of W=1.
> > 
> 
> Agreed, but is it possible to pass W=1 in the drivers/clk/Makefile?

About a cycle ago, Arnd and i played around with this idea. The
Ethernet PHY subsystem is W=1 clean, and most of he network stack
is. But keeping it clean is not so easy, when developers do sometimes
add new warnings, since they have no idea the code is W=1 clean.

You are also not the only one asking for such a feature. RDMA also
asked recently.

Arnd, do you plan to push the patches?

      Andrew
