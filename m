Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1933131CB
	for <lists+openbmc@lfdr.de>; Mon,  8 Feb 2021 13:08:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZ4Y447p4zDvVG
	for <lists+openbmc@lfdr.de>; Mon,  8 Feb 2021 23:08:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RPOj45dX; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXPk565BdzDwlR
 for <openbmc@lists.ozlabs.org>; Sat,  6 Feb 2021 05:55:09 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D95764EFE;
 Fri,  5 Feb 2021 18:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612551306;
 bh=l2A8CAgF/G7BGZq7431N93An0up6jDTvpRHYH8cBfG8=;
 h=In-Reply-To:References:Subject:From:To:Date:From;
 b=RPOj45dXJLj+vuNI8ahjCDXbfaAmoG+k7jRNp9Mp4pxf/xI3v4qYPHjTR0eZjUonW
 SIkvXTlfrM4M5V1csQXDB3KtpyaetGu3A6NSZYiVjly/E1FtXUuVDnKKj90+hT7kga
 72GNn9IGjtdxL9hhA7OKuQ0JoS0oaz+FFxGgl8kX1jZmqqDFq/kLas956fzVQg3+Tp
 cgoCrwd84QWZpwzQ6Ju8Ml1ADw81R8AIzyyJMcL7KtTYIWcDxWum6dtU8ejQXc+zPm
 cCC61w8Y3422l2yvWjt7AzjbIe5Cj51B0BEhUV+uecnjDzzoWzG0vHppylMCNsvTKj
 IHO260731sTEw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210203083155.GA2329016@dell>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
 <20210203083155.GA2329016@dell>
Subject: Re: [PATCH 00/21] [Set 2] Rid W=1 warnings from Clock
From: Stephen Boyd <sboyd@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Andy Gross <agross@kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Benjamin Fair <benjaminfair@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Emilio =?utf-8?q?L=C3=B3pez?= <emilio@elopez.com.ar>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jan Kotas <jank@cadence.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 Loc Ho <lho@apm.com>, Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>, NXP Linux Team <linux-imx@nxp.com>,
 Nancy Yuen <yuenn@google.com>, Nuvoton Technologies <tali.perry@nuvoton.com>,
 Patrick Venture <venture@google.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, P
 rashant Gaikwad <pgaikwad@nvidia.com>, Rajan Vaja <rajan.vaja@xilinx.com>,
 Rajeev Kumar <rajeev-dlh.kumar@st.com>, Richard Woodruff <r-woodruff2@ti.com>,
 Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 =?utf-8?q?S=C3=B6ren?= Brinkmann <soren.brinkmann@xilinx.com>,
 Tali Perry <tali.perry1@gmail.com>, Tero Kristo <kristo@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
 openbmc@lists.ozlabs.org
Date: Fri, 05 Feb 2021 10:55:05 -0800
Message-ID: <161255130506.76967.8682382463883809207@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Mon, 08 Feb 2021 22:58:04 +1100
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Quoting Lee Jones (2021-02-03 00:31:55)
> On Tue, 26 Jan 2021, Lee Jones wrote:
>=20
> > This set is part of a larger effort attempting to clean-up W=3D1
> > kernel builds, which are currently overwhelmingly riddled with
> > niggly little warnings.
> >=20
> > This is the last set.  Clock is clean after this.
>=20
> Out of interest, what normally happens to the patches which aren't
> picked up by individual driver Maintainers?
>=20

I have to go in and figure it out! :)
