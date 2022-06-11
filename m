Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E2854D86F
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 04:35:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNmW62Nr9z3btY
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 12:35:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C2tuo46T;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=jic23@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C2tuo46T;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LL0DS1YkCz3by1
	for <openbmc@lists.ozlabs.org>; Sun, 12 Jun 2022 00:13:28 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 54048B816AD;
	Sat, 11 Jun 2022 14:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A775DC34116;
	Sat, 11 Jun 2022 14:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654956804;
	bh=nyZvL91oFCb9bthQSadgYmYYNFgPdHqKzIod7PSvXoE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=C2tuo46TtbrdY2D19m2dgc8qWZXkB9kD9XOOUf+g2P6r7or/YShlN3zfieoRbi1Vk
	 mRI7PO6xQMBBZDFZ33JtIn/6IVQn/VTxVQXaJO1ADbDwlQfv3ugfoK+SZ2wWPnkBEe
	 NQN0YnkPwxplxSwb5TPXK7nCa4EcaM5XEQsCru/WIGnRxSEQ5MOC6fJr8zRFIfBTyu
	 tLwN+T41I7UHRhABICFeESgCC5Pk7w7sag45jDCofg7ENDt7w2JsMMV2UnrL0YRNvo
	 0EPVDiII3hAp7sPmFQsLP0zYudeuY2ortQ78I2x55E+QAmRNr9FxfNDMWR9mLxN2JJ
	 ED2zAMUfpL0uQ==
Date: Sat, 11 Jun 2022 15:22:22 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 15/34] iio: humidity: hts221_buffer: explicitly add
 proper header files
Message-ID: <20220611152222.43ab685e@jic23-huawei>
In-Reply-To: <CAHp75VdCrFa67_k3TJSznT0fzEK3h3+fk0MHpuwM6NBpTQODEw@mail.gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	<20220610084545.547700-16-nuno.sa@analog.com>
	<CAHp75VdCrFa67_k3TJSznT0fzEK3h3+fk0MHpuwM6NBpTQODEw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 16 Jun 2022 12:05:37 +1000
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio <linux-iio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Paul Cercueil <paul@crapouillou.net>, Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>, Benjamin Fair <benjaminfair@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>, Andy Gross <agross@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Olivier Moysan <olivier.moysan@foss.st.com>, Zhang Rui <rui.zhang@intel.com>, Christophe Branchereau <cbranchereau@gma
 il.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Saravanan Sekar <sravanhome@gmail.com>, Michael Hennerich <Michael.Hennerich@analog.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, Eugen Hristev <eugen.hristev@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, Gwendal Grignou <gwendal@chromium.org>, Tali Perry <tali.perry1@gmail.com>, Benson Leung <bleung@chromium.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Thara Gopinath <thara.gopinath@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 10 Jun 2022 16:47:16 +0200
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Fri, Jun 10, 2022 at 10:47 AM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:
> >
> > Do not trust the fact that iio.h includes of.h which in turn includes
> > all the headers we are relying on.
> >
> > The ultimate goal is to actually drop of.h from iio.h. =20
>=20
> ...
>=20
> >  #include <linux/irqreturn.h>
> >  #include <linux/regmap.h>
> >  #include <linux/bitfield.h>
> > +#include <linux/property.h> =20
>=20
> Yes, I see, but you can make life easier if you try to squeeze to the
> most sorted part. I do not see full context, but here I would put it
> before regmap.h.
>=20
With full context it's clear the list is way off sorted, but meh
putting it above regmap probably reduces the follow up diff a tiny
bit and I doubt Nuno feels strongly about this so I went with
what Andy suggested as a tweak whilst applying.

Applied

Thanks,

Jonathan

