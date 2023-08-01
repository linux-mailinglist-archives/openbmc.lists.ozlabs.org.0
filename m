Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C8A76BD7D
	for <lists+openbmc@lfdr.de>; Tue,  1 Aug 2023 21:15:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZmhBbI6q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFlDr2C27z30XM
	for <lists+openbmc@lfdr.de>; Wed,  2 Aug 2023 05:15:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZmhBbI6q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFlDF1n8dz2ytX
	for <openbmc@lists.ozlabs.org>; Wed,  2 Aug 2023 05:14:53 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 31897616B0;
	Tue,  1 Aug 2023 19:14:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824A8C433C7;
	Tue,  1 Aug 2023 19:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690917290;
	bh=RricL0NBD2SlXPu5D6K3MkV2NfI2Fl9g7qhLIB9lKzs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ZmhBbI6q1rH8SwBWw7Bxp58j12JA0u4tagm4I1spQ4hymiK8n+VSfZn4bnDxGQ5eZ
	 zRTn75Ez47dqoWaZAC/USrqMPfbutYJpA39CcU3FzTLBDCEPbHVCDfqNZ5fHPNyVxi
	 F8p1YiI9Q3oxsyXvYMH07aFZjDm0ZBXeOqRDiHtNkE4yBNMT12zQQypoQw/I2MS8CT
	 9iVPIC5awUS2tzXak5s1SBNF9fSL0887T4zOFPmsLfd7I13Vvi5Ya20JsFXa6JB2fj
	 XC6b1TtXp+N/aGb6yueKNPuXaAKetcrrl1D/WntkFG00YSO5xydBVrzQ6jyiDJaa1k
	 EpxBXA8mJ1DRg==
Message-ID: <54b4d761e5b16ffb798a89c1cea99714.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZLvyn0xq3Msk+lxF@probook>
References: <20230428190226.1304326-1-j.neuschaefer@gmx.net> <20230428190226.1304326-3-j.neuschaefer@gmx.net> <4e0a5db18ed7d37038e67be0f1ddcb08.sboyd@kernel.org> <ZLvyn0xq3Msk+lxF@probook>
Subject: Re: [PATCH v8 2/2] clk: wpcm450: Add Nuvoton WPCM450 clock/reset controller driver
From: Stephen Boyd <sboyd@kernel.org>
To: Jonathan =?utf-8?q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Date: Tue, 01 Aug 2023 12:14:48 -0700
User-Agent: alot/0.10
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Tali Perry <tali.perry1@gmail.com>, linux-clk@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Joel Stanley <joel@jms.id.au>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, Jonathan =?utf-8?q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Thomas Gleixner <tglx@linutronix.de>, Wim Van Sebroeck <wim@linux-watchdog.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Quoting Jonathan Neusch=C3=A4fer (2023-07-22 08:15:43)
> On Thu, Jul 20, 2023 at 05:02:15PM -0700, Stephen Boyd wrote:
> > Quoting Jonathan Neusch=C3=A4fer (2023-04-28 12:02:26)
> > > diff --git a/drivers/clk/clk-wpcm450.c b/drivers/clk/clk-wpcm450.c
> [...]
> > > +static unsigned long wpcm450_clk_pll_recalc_rate(struct clk_hw *hw,
> > > +                                                unsigned long parent=
_rate)
> > > +{
> > > +       struct wpcm450_clk_pll *pll =3D to_wpcm450_clk_pll(hw);
[...]
>=20
> > > +static const struct wpcm450_pll_data pll_data[] =3D {
> > > +       { "pll0", { .name =3D "ref" }, REG_PLLCON0, 0 },
> >=20
> > This is new code, please don't use .name. Instead use .fw_name or .inde=
x with preference to
> > .index first and .hw if the pointer is available in this driver.
>=20
> As far as I can see, .fw_name and .index depend on a struct device*
> being passed to clk_hw_register, which won't be available unless I
> actually convert the driver to a platform driver.

You can call of_clk_hw_register(), but a conversion to a platform driver
is preferred.

>=20
> Not relying on .name would indeed be nice.

Cool.
