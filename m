Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A888BA409
	for <lists+openbmc@lfdr.de>; Fri,  3 May 2024 01:34:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=mEGxVQnd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VVqyY0BgXz3cYs
	for <lists+openbmc@lfdr.de>; Fri,  3 May 2024 09:34:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=mEGxVQnd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VVFnL5kjnz3brZ;
	Thu,  2 May 2024 10:54:14 +1000 (AEST)
Received: from [192.168.148.88] (unknown [120.20.105.107])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 088B420009;
	Thu,  2 May 2024 08:53:58 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1714611252;
	bh=2UKQhOigrDLEgeDWGD84hTlrB50inUdwvmzSWDEPPvc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mEGxVQndQ7eIpM8jn5g71jdxtIHcuCBHuXLX3t5HOduXT6G3KWhFZnai5E2QWPjpt
	 xUbxUMw8Z0D7c5pD24vc3ZzhGQXYfLHWVGmOrlPgPRJmKshV4rf1+Spnba3BnjBf4l
	 8kLrN/vlnSlI42W2LzZcE2L6SrWlkinmiVnj3Rl3LhPxwTZqfRHyGa9k6V52F+FI5F
	 O5UUH9X8QHzbu1WEy+dCXTrm0/I1k7hs6S6p0FEuot7yADPKouHcSE4oy6JC/UkbhR
	 coiTMdEGtIg1BQPHt0NyDzVrbhFKr3BlOwadA5+C73I61sUw6Ujqb07PJS0zHw2Vf1
	 h9752xRr1Wnyg==
Message-ID: <eda5b1da03d4adfa5761c49527a9232ec7facae3.camel@codeconstruct.com.au>
Subject: Re: [PATCH 20/21] pinctrl: aspeed: g5: Use scope based
 of_node_put() cleanups
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Linus Walleij
 <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dvorkin Dmitry <dvorkin@tibbo.com>,
 Wells Lu <wellslutw@gmail.com>,  Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>, Hal Feng
 <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
 Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim
 <shiraz.linux.kernel@gmail.com>, soc@kernel.org,  Krzysztof Kozlowski
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, Heiko Stuebner
 <heiko@sntech.de>, Damien Le Moal <dlemoal@kernel.org>,  Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
  Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,  Jacky Bai <ping.bai@nxp.com>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, Ghennadi Procopciuc
 <ghennadi.procopciuc@oss.nxp.com>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Sascha Hauer
 <s.hauer@pengutronix.de>,  Joel Stanley <joel@jms.id.au>, Dan Carpenter
 <dan.carpenter@linaro.org>
Date: Thu, 02 May 2024 10:23:58 +0930
In-Reply-To: <20240501-pinctrl-cleanup-v1-20-797ceca46e5c@nxp.com>
References: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com>
	 <20240501-pinctrl-cleanup-v1-20-797ceca46e5c@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 03 May 2024 09:33:46 +1000
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
Cc: imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>, linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-rockchip@lists.infradead.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2024-05-01 at 20:56 +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>=20
> Use scope based of_node_put() cleanup to simplify code.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl=
/aspeed/pinctrl-aspeed-g5.c
> index 5bb8fd0d1e41..61fbfddb5938 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> @@ -2629,14 +2629,13 @@ static struct regmap *aspeed_g5_acquire_regmap(st=
ruct aspeed_pinmux_data *ctx,
>  		return ctx->maps[ip];
> =20
>  	if (ip =3D=3D ASPEED_IP_GFX) {
> -		struct device_node *node;
> +		struct device_node *node __free(device_node) =3D NULL;
>  		struct regmap *map;
> =20
>  		node =3D of_parse_phandle(ctx->dev->of_node,
>  					"aspeed,external-nodes", 0);
>  		if (node) {
>  			map =3D syscon_node_to_regmap(node);
> -			of_node_put(node);
>  			if (IS_ERR(map))
>  				return map;
>  		} else
> @@ -2648,7 +2647,7 @@ static struct regmap *aspeed_g5_acquire_regmap(stru=
ct aspeed_pinmux_data *ctx,
>  	}
> =20
>  	if (ip =3D=3D ASPEED_IP_LPC) {
> -		struct device_node *np;
> +		struct device_node *np __free(device_node) =3D NULL;
>  		struct regmap *map;
> =20
>  		np =3D of_parse_phandle(ctx->dev->of_node,
> @@ -2660,7 +2659,6 @@ static struct regmap *aspeed_g5_acquire_regmap(stru=
ct aspeed_pinmux_data *ctx,
>  				return ERR_PTR(-ENODEV);
> =20
>  			map =3D syscon_node_to_regmap(np->parent);
> -			of_node_put(np);
>  			if (IS_ERR(map))
>  				return map;

I think I agree with Krzysztof's feedback on the Samsung patch[1], and
that I prefer the existing approach for the Aspeed driver. My reasoning
suggests the existing implementation does the right thing. That said,
the code could be adjusted to use early returns and consistent variable
names, which might make it easier to reason about. I'll consider a
follow-up patch to address that.

Regardless, thanks for taking the time to explore the cleanup.

Andrew

[1]: https://lore.kernel.org/lkml/34193501-5b7b-4ffd-8549-a04c6930d02d@kern=
el.org/

>  		} else
>=20

