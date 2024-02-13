Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DD5855730
	for <lists+openbmc@lfdr.de>; Thu, 15 Feb 2024 00:23:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lPFkxYPR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZvPg0FcVz3dlT
	for <lists+openbmc@lfdr.de>; Thu, 15 Feb 2024 10:23:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lPFkxYPR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZCY55YNKz3cFX;
	Wed, 14 Feb 2024 07:27:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C857616C3;
	Tue, 13 Feb 2024 20:27:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACEE0C433F1;
	Tue, 13 Feb 2024 20:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707856023;
	bh=wr2SPv5Ld/DSkoS5vcAzZJ9Df9CxqcjpNgsKUEXsmMg=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=lPFkxYPR0J3NXG1zdBfo423wECnKhWMgXPxCg52F3jS4QKKMEyqjBhXaUGKE3tgG6
	 37ZF1eFh/KlF2KXEvZh8+5akK0hqsrS1FZnabOENmkW6SqKVRepSFJf7g6xxh7ojEV
	 jnkdi6FQUiy1uKshzEZhLb5yve1bg3+EMiWyulcWid6e7LMamsxlhTvq2275lGDRVd
	 PYq1svZG2Lc2X9dtgFRoH1KjCqQDhIoYjVbGHKXP+VJjE7rPkT9HdKzpsCs5RzEGYP
	 ef1gd/J3wmRP/+qW2yBa+bsr9UVpRx1oatwybDxzT9Hk3Wx4NArI6+dQLf7ihqU6h7
	 NgaQAYTbgz0rQ==
Date: Tue, 13 Feb 2024 20:26:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 0/6] dts: Fix dtc interrupt warnings
Message-ID: <20240213-wafer-garnish-88287bc5d4a5@spud>
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4XczAmSSxV0XIpGO"
Content-Disposition: inline
In-Reply-To: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
X-Mailman-Approved-At: Thu, 15 Feb 2024 10:16:12 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>, linux-arm-msm@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Stefan Agner <stefan@agner.ch>, Chanho Min <chanho.min@lge.com>, Thierry Reding <thierry.reding@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Nicolas Schier <nicolas@fjasle.eu>, Bjorn Andersson <andersson@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, linux-aspeed@lists.ozlabs.org, Gregory Clement <gregory.clement@bootlin.com>, Magnus Damm <magnus.damm@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Joel Stanley <joel@jms.id.au>, linux-renesas-soc@vger.kernel.org, Linus Walleij <linusw@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-tegra
 @vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kbuild@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, Nathan Chancellor <nathan@kernel.org>, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Imre Kaloz <kaloz@openwrt.org>, Scott Branden <sbranden@broadcom.com>, openbmc@lists.ozlabs.org, Antoine Tenart <atenart@kernel.org>, linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Tsahee Zidenberg <tsahee@annapurnalabs.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--4XczAmSSxV0XIpGO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 01:34:24PM -0600, Rob Herring wrote:
> I had a branch with most of these changes sitting in my tree for some=20
> time. Geert's asking about some errors not getting found prompted me to=
=20
> clean it up and send it out. This series fixes all* interrupt related=20
> warnings and enables the check by default.=20
>=20
> SoC maintainers, Can you please take this series directly.=20
>=20
> Rob
>=20
> *There's a few Renesas warnings still Geert said he would fix.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Rob Herring (6):
>       arm64: dts: freescale: Disable interrupt_map check
>       arm: dts: Fix dtc interrupt_provider warnings
>       arm64: dts: Fix dtc interrupt_provider warnings
>       arm: dts: Fix dtc interrupt_map warnings
>       arm64: dts: qcom: Fix interrupt-map cell sizes
>       dtc: Enable dtc interrupt_provider check

Only fixing it for arm, Sadge.

Co-incidentally I noticed there was one for riscv while looking at
Krzysztof's underscore in node name patch earlier, so I'd already
written a patch to fix it :)

--4XczAmSSxV0XIpGO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcvQiwAKCRB4tDGHoIJi
0iKoAP9EkRpfMdcQD2Rxy6EyQrFHOf9aK1XBqWvwsM+uYWZVZAD9El92XfSbd1tC
IcCJORhtpqwWl2bRDhMSRtSpWpqRygA=
=9Yjc
-----END PGP SIGNATURE-----

--4XczAmSSxV0XIpGO--
