Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA9C54D853
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 04:28:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNmLv59n1z3fF6
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 12:28:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SRI6ng1Q;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=jic23@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SRI6ng1Q;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKznk5Txwz2ywR
	for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2022 23:53:46 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 149A3CE092F;
	Sat, 11 Jun 2022 13:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ACFDC34116;
	Sat, 11 Jun 2022 13:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654955621;
	bh=wC+dRUleca+nkr3JnnArr3KV7sMFZJzv4Kf01ViW4FI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SRI6ng1Q5/Z2oZCRMlIRFoa2A9NPEtvGK+heaKY9Ps//MWXEHwiT4Wnb4XXT0iqQm
	 9Nb4WXWJDKSZN5sPHJiXYyNTP/5iqIv1XS3MYmIZB/76cjlRiSg1z6GTG6NgpQtn/w
	 J5uADVuqiz/t3JNA9EWob2ccwierMscWmd+VQGI5T94QqIf0uyST4gb7YywuIdYJqe
	 YWThqM3/kMOLem9/Muid/F3CsgFrNgXVmqXKACIs7VquiTKP0qOtWH2zgk/J+4TmZ7
	 1yAy8mzvDuh9NKepKcHn1m3WYqOKPuKnIbTWS5TgA1hD1m0Gin8TZL+F5e92B2FX0C
	 63uPLcQHDgNaw==
Date: Sat, 11 Jun 2022 15:02:40 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Subject: Re: [PATCH 03/34] iio: adc: berlin2-adc: explicitly add proper
 header files
Message-ID: <20220611150240.57136279@jic23-huawei>
In-Reply-To: <20220610084545.547700-4-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	<20220610084545.547700-4-nuno.sa@analog.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 16 Jun 2022 12:05:36 +1000
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>, Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>, linux-imx@nxp.com, Olivier Moysan <olivier.moysan@foss.st.com>, Zhang Rui <rui.zhang@intel.com>, Christophe Branchereau <cbranchereau@gmail.com>, 
 Saravanan Sekar <sravanhome@gmail.com>, Michael Hennerich <Michael.Hennerich@analog.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-mediatek@lists.infradead.org, Eugen Hristev <eugen.hristev@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, Gwendal Grignou <gwendal@chromium.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Benson Leung <bleung@chromium.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, linux-mips@vger.kernel.org, Thara Gopinath <thara.gopinath@linaro.org>, linux-renesas-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@
 kernel.org>, Claudiu Beznea <claudiu.beznea@microchip

.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 10 Jun 2022 10:45:14 +0200
Nuno S=C3=A1 <nuno.sa@analog.com> wrote:

> Do not trust the fact that iio.h includes of.h which in turn includes
> all the headers we are relying on.
>=20
> The ultimate goal is to actually drop of.h from iio.h.
>=20
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
Applied.

Thanks,

> ---
>  drivers/iio/adc/berlin2-adc.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/iio/adc/berlin2-adc.c b/drivers/iio/adc/berlin2-adc.c
> index 03987d7e6b3d..3d2e8b4db61a 100644
> --- a/drivers/iio/adc/berlin2-adc.c
> +++ b/drivers/iio/adc/berlin2-adc.c
> @@ -15,7 +15,9 @@
>  #include <linux/iio/machine.h>
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/mfd/syscon.h>

