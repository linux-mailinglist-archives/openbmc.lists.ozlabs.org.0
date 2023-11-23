Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE2F7F95E5
	for <lists+openbmc@lfdr.de>; Sun, 26 Nov 2023 23:50:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=ePwq8z4O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SdkT34wNnz3c40
	for <lists+openbmc@lfdr.de>; Mon, 27 Nov 2023 09:50:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=ePwq8z4O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 361 seconds by postgrey-1.37 at boromir; Thu, 23 Nov 2023 22:17:51 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbbFC4plhz3d8N
	for <openbmc@lists.ozlabs.org>; Thu, 23 Nov 2023 22:17:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1700738265; x=1701343065; i=j.neuschaefer@gmx.net;
	bh=qHIRuVjw/0Toi1F/14ZNchv8iBh7eioF0IAeNc5thr0=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:
	 In-Reply-To;
	b=ePwq8z4OHnaJYDiAMKEpgIS/4PTWL6pJKOcn59iQm7hMNj+tX1OtZOw0jArBuqqw
	 fKt5B7HZMHojZIv4QQEn6u5avITOCXYUn+cKJFbQqzQwXonMYk66YuKXTTUgFnlDR
	 XWKPkjFVUg4/t5UwNQNwrZyzx9+GsILTfvHg9ad3bvwRCKc7h/qT2FM/WOiklGLO3
	 Xt8DAVHtvDVtdVTPG8KZYQ8CJGT4oIHMUDP9VwXYLW/Nbf4kHwlIFT+K634KuK/5K
	 OCHScOJn1xBBHvg0OQYFaeTRbsPtBdV04jnfSlFcCgMprts1y9BlUzKMprUtY0M4n
	 EHRcncHhy9bijHYCRw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.47.44]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1HZo-1r3NX91GaQ-002snb; Thu, 23
 Nov 2023 12:11:45 +0100
Date: Thu, 23 Nov 2023 12:11:42 +0100
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 02/17] pinctrl: nuvoton: Convert to use struct
 pingroup and PINCTRL_PINGROUP()
Message-ID: <ZV8zbizJO8yNEomn@probook>
References: <20231122164040.2262742-1-andriy.shevchenko@linux.intel.com>
 <20231122164040.2262742-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9hHdmhEn3QkQ/1K+"
Content-Disposition: inline
In-Reply-To: <20231122164040.2262742-3-andriy.shevchenko@linux.intel.com>
X-Provags-ID: V03:K1:zjNy6ebVKDzd7AEE0/nsnKTw50ViiRNCHikw/qZ5yzvBoxpjpTz
 HuFhbYVNf3YEHc9MbVHMPqFM13ooVqoYIlO28oTqTO3TqRj4iSbysfuAMyOnYgsCh5FQ78z
 P7qOIwLX0a6l3eskPKk8wB5tHRAjmBptshJd+ljjDbEOIKGogudpPxVTdxC+iTqvsT+hcJd
 eDREktDD+IHC114QUAtOw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:L4VQmjZWELc=;y4seoJeIbbBHxKslNY4jNm2W74s
 9lenIYOMs+PeW1YUs1iEdWV04VWhDPG39h3qiyEmr/HjyPCIctmDhvQ9goJPLw94iA4Ws2OyG
 EZdv++xnfEncdoPUUfaOB1dHFkt9X4t8EpHOzM/FUjpvIi5/ZVCqqqyuW233XQA3vcpKvoDw6
 cqj7WZ+iFMINecFklEyuw16NkLyCwe5dk9Q1Ky21sC1oxTPVV5rPDRcGIBxZ+J6WUE17dEFLN
 2lg3uD3l3sNdArLE2Q6Qpr0caUFwrq2WiA+/S/vFhUWXDrNJi2aK1D5e7TDU6TNhfpuuUszw8
 K0R4/4yaGjoram1Bqbu6tW0EmTCFIXaJi55hS9WqwwgUxBFPPNnKgRGJCjG0vo7+3zYh44wzk
 hyDXcHUuDQP+bptoFJLA0WONNRWrx/no4zEA0WGP5K88QMoq279Q4bs2qgUNyX1vQt91dEb9P
 itK+aibcIzt7TltUolO/2E073P++v+O49oThp5hye0W7GKOVgp+CiB5kTdj8rz8vTPAcQfh9S
 E389jcfVb4SvYtfmb892fHFpvLYt/6ZkHXo8R3hd+kQe+Ajk1pqKQSsxlDUPTedlcxXOCasuu
 JAr/QavMSF81owN4CGfHPdxyrEbd6JjpfKc68cXNIlcBON1KtJhup55VYVUG7qLl7+AHUuhmV
 QnmNJxV3fMvWWCqIFeIzPe04isvxHRebjXKnKyvYr1L1t2cWnJcDMlM0HyrwebD0kefrFgmZ5
 7LPxzggnn+zyKP1xhFiDQkJt6BF4WdqPgaW36ijCqlpTLcL/syhPHPSee3c5e0Jq8AODYhrsn
 UhzWO7OtBUGUYwlez6/l3y0x7Lr41jp5zoMxU9aG8dvOBEqDUA3yyGbVvTF1ZHAx62b1aVyde
 ZJ/l6vveil9A1FgB4gh0uwu6o5CavCdk64o/hKmlfexqbgfadPizAT/mJPxAItEGngXqyMhth
 rMAvvA==
X-Mailman-Approved-At: Mon, 27 Nov 2023 09:50:01 +1100
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
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, openbmc@lists.ozlabs.org, Hal Feng <hal.feng@starfivetech.com>, Andy Gross <agross@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>, Ray Jui <rjui@broadcom.com>, Emil Renner Berthing <kernel@esmil.dk>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, Lakshmi Sowjanya D <lakshmi.sowjanya.d@
 intel.com>, Biju Das <biju.das.jz@bp.renesas.com>, linux-arm-kernel@lists.infradead.org, Dong Aisheng <aisheng.dong@nxp.com>, Scott Branden <sbranden@broadcom.com>, Bjorn Andersson <andersson@kernel.org>, Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Jianlong Huang <jianlong.huang@starfivetech.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--9hHdmhEn3QkQ/1K+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 06:35:34PM +0200, Andy Shevchenko wrote:
> The pin control header provides struct pingroup and PINCTRL_PINGROUP() ma=
cro.
> Utilize them instead of open coded variants in the driver.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Thanks.

>  drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/=
nuvoton/pinctrl-wpcm450.c
> index 0cff44b07b29..4589900244c7 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> @@ -474,9 +474,8 @@ enum {
>  #undef WPCM450_GRP
>  };
> =20
> -static struct group_desc wpcm450_groups[] =3D {
> -#define WPCM450_GRP(x) { .name =3D #x, .pins =3D x ## _pins, \
> -			.num_pins =3D ARRAY_SIZE(x ## _pins) }
> +static struct pingroup wpcm450_groups[] =3D {
> +#define WPCM450_GRP(x) PINCTRL_PINGROUP(#x, x ## _pins, ARRAY_SIZE(x ## =
_pins))
>  	WPCM450_GRPS
>  #undef WPCM450_GRP
>  };
> @@ -852,7 +851,7 @@ static int wpcm450_get_group_pins(struct pinctrl_dev =
*pctldev,
>  				  const unsigned int **pins,
>  				  unsigned int *npins)
>  {
> -	*npins =3D wpcm450_groups[selector].num_pins;
> +	*npins =3D wpcm450_groups[selector].npins;
>  	*pins  =3D wpcm450_groups[selector].pins;
> =20
>  	return 0;
> @@ -901,7 +900,7 @@ static int wpcm450_pinmux_set_mux(struct pinctrl_dev =
*pctldev,
>  	struct wpcm450_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctldev);
> =20
>  	wpcm450_setfunc(pctrl->gcr_regmap, wpcm450_groups[group].pins,
> -			wpcm450_groups[group].num_pins, function);
> +			wpcm450_groups[group].npins, function);
> =20
>  	return 0;
>  }
> --=20
> 2.43.0.rc1.1.gbec44491f096
>=20

--9hHdmhEn3QkQ/1K+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmVfM24ACgkQCDBEmo7z
X9s6kQ/9FPGH46fURmUk0S/+zlgZKVtDIOldB02JGZTZ/rh43+6rFimcMZyEOlPt
Iv2ayCrzPHBvgeRMsIdjSCQmtd8XYpLMrkvcir3exY+crh1YGKkyV8RdMJH1RY4a
C/vRxiZ0684SCsbp1mF03LBU+b96lpFxbxwSdGvLJJMV3yIxe5eADpzZcmyVWzOy
Q4F7135UoIFZvDgeptqWbygX6poDcHwG4XOPfTYPit1obw4C9lSuIIbepKnWTe9W
Ut2dTCCIhi0as5InSkuHVSdAuTiOtwcaxPe0uxyhlu+2Wup5ibtz8cL5FfJ1cSEu
D6KUjGfNUDovRkcgsDBgPSkLl/6miLMNCZ5bWlTvjYXE3C7hSH9PI1vicWhZh0GB
fLTApAj38g5kdUOcfa+1+Zwv+x2I9dSwdXycqhCF7evDmUbIqwNe1W+dU9RhOX8r
cFCjFW04uG2nR0ivbf6M3vnqwxGyERCVEj3r5SGimlW9h67E4PHou3p7adEGxwOg
Rblhxt6s2TlmUvM07L9tjWYLhWBkOgr1+P5xfMVkpcvwUZAa/dwj5bf+qgtoJk9O
vt8hpySZt8nXp0ynOK9YuVHRdb325ScArKv+sw6rZusAK9Jsq/EIBqOTLvcodCQi
IgttVi+NmWwrA+ZLB5codjpKhZMPXeA0XEaWAxgu0PZ5PlJRvA4=
=f6qz
-----END PGP SIGNATURE-----

--9hHdmhEn3QkQ/1K+--
