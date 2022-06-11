Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2D754D873
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 04:36:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNmXT3CmCz3fQF
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 12:36:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oCVbMFgy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=jic23@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oCVbMFgy;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LL0PY1Bbmz3byT
	for <openbmc@lists.ozlabs.org>; Sun, 12 Jun 2022 00:21:21 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 54E41B816A6;
	Sat, 11 Jun 2022 14:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 454F6C34116;
	Sat, 11 Jun 2022 14:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654957277;
	bh=lfyWxTdm+9DA2o5Gv4TMOK79YAUDNtuhApIhJjT70sc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oCVbMFgyFX6oFH9u3+7f5Hm4+q5RYHvp3rgC4dsE0IEQZXvrtnPlXfQnAAnejz0xR
	 lkmxE/CIR1fCuZZ1eU3ZYl5amkKuaOVsuPrh6pXb2TtzM4ufNY7k1LT1YVEAZ0QUc9
	 8kFKGWJz6+JPx7xwmpXMHQ0suVKcRhwqQiando1XDqH+x4ErQgXo+eWTv7qOtiS2Kk
	 7sEjS2O1A+ImNtfVji8lSkOMnMR/LIKBCWMg10V5/81/grKwvV8ar0Y3R0FBH7igf4
	 Hx1sU60YSsy+PE4LPbaCFaBA840/DS4NcKtTAOlTrHnPRvu+fg3VnT5Fr7aAFuXBk8
	 iv+MSeL9C6Jnw==
Date: Sat, 11 Jun 2022 15:30:15 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Subject: Re: [PATCH 19/34] iio: core: drop of.h from iio.h
Message-ID: <20220611153016.2f91d7e5@jic23-huawei>
In-Reply-To: <20220610084545.547700-20-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	<20220610084545.547700-20-nuno.sa@analog.com>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>, Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>, linux-imx@nxp.com, Olivier Moysan <olivier.moysan@foss.st.com>, Zhang Rui <rui.zhang@intel.com>, Christophe Branchereau <cbranchereau@gmail.com>, 
 Saravanan Sekar <sravanhome@gmail.com>, Michael Hennerich <Michael.Hennerich@analog.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-mediatek@lists.infradead.org, Eugen Hristev <eugen.hristev@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, Gwendal Grignou <gwendal@chromium.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Benson Leung <bleung@chromium.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Lorenzo
 Bianconi <lorenzo@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, linux-mips@vger.kernel.org, Thara Gopinath <thara.gopinath@linaro.org>, linux-renesas-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 10 Jun 2022 10:45:30 +0200
Nuno S=C3=A1 <nuno.sa@analog.com> wrote:

> There is no reason to include OF as we only need to forward declare
> 'of_phandle_args'. Previously, some drivers were actually relying on
> this for some headers (those were already fixed).
>=20
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
This one deserves a 'woot' :)

I would have guessed we were much further off being able to do this
than the 18 patches earlier in this series. Good work from Andy
and yourself to get to the point where this was possible.

Applied to the togreg branch of iio.git and pushed out as testing for
0-day to take a look.  I'm probably going to review the remainder, but
leave on list a bit longer as they are more complex/controversial than
this includes cleanup.

Thanks,

Jonathan

> ---
>  include/linux/iio/iio.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
> index 4e21a82b3756..d9b4a9ca9a0f 100644
> --- a/include/linux/iio/iio.h
> +++ b/include/linux/iio/iio.h
> @@ -11,13 +11,14 @@
>  #include <linux/cdev.h>
>  #include <linux/slab.h>
>  #include <linux/iio/types.h>
> -#include <linux/of.h>
>  /* IIO TODO LIST */
>  /*
>   * Provide means of adjusting timer accuracy.
>   * Currently assumes nano seconds.
>   */
> =20
> +struct of_phandle_args;
> +
>  enum iio_shared_by {
>  	IIO_SEPARATE,
>  	IIO_SHARED_BY_TYPE,

