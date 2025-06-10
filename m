Return-Path: <openbmc+bounces-158-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EE7AD4902
	for <lists+openbmc@lfdr.de>; Wed, 11 Jun 2025 04:58:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bH9M63zyCz2yYJ;
	Wed, 11 Jun 2025 12:57:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749554148;
	cv=none; b=lYR+/Oj0/87dFHgUqaCjWMv9wmq0bbMD7E9C96jp4RenMTelEda1hfSmxI8pfoIDTchKcp2OW/lpGO1gnC1s6FWRFJNuT6ABDHVsGtNWTj8wp5T+3VnqtX5XAqDcDVIhuupfq5KiHlybGsWMAVMs31VNIwEBCYLt+IMw+RopslTwA4o8aF5mtp6Uqx+twabfqh6zeHR7sg2lriVnY++dgPYlfhMIQw7d31CfN3Lpe7uhhBP2OA1IGa5A4dbaSIcyA0xIFbTic1d9p7Lp4pmhiKhVWyv1h6sw80IC8v5Ild+dDr8bHOmSpko+OGu8jCAEdlhyk7h6N+ULLDT64A8Hcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749554148; c=relaxed/relaxed;
	bh=UxiKx3fQ2UN0TdQSGe7J2LZQJpdb1R/YSkx1+hJ6ixs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFylWw8QoLIWzUeSSY1KQTrOEPL9f0egYWhwO1h6uijz81P6KUWNhoQ8GxedQjTOvgEQJZgMaiOdctjKJgptT0DgtSTtZsE97/yfRqnSctphGHJDT6ed3AiOv/2TqicNzmMsSmSUk2yxRtrVHWmrAbcl2GWFZijvn2jFaUiJjydZNTUnsFvfqxRNpFfYaH6B5gq4tyKlpTa7yyneT1fiy6jgCibGpribXGsPVbdIlUrpkbunNFyvyaYw6ALZ5BahLNmqSFgFaquc1uC5gxzHVwa50Liix/O8KNB44IsOfEZlnd0gmT2Hw1P+X9J2Y33R24nEtj+tbmON7S3YmytMDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OIgAOPFi; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OIgAOPFi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGmS25QhZz2ySY;
	Tue, 10 Jun 2025 21:15:45 +1000 (AEST)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a5123c1533so3003123f8f.2;
        Tue, 10 Jun 2025 04:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749554139; x=1750158939; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UxiKx3fQ2UN0TdQSGe7J2LZQJpdb1R/YSkx1+hJ6ixs=;
        b=OIgAOPFiTXzX09OAIfz6Q8MzmUsAqL/I+s7wDcinAZPerxpKRdDL4oH1AoKjKI2a5B
         1+G7cgVZV/fIVMPsITQPDH3BNFZIbJROxi7pZg0ccVAx5VpZ5iotDiFCjYNhC5xjmekN
         IAj89VrdThI+kgNPs1FPH0O+wzY66ymNWGvDfvHdoZPOG+OJUBWKq2eRFaT0cs8wrjy2
         YZfcO5goUriBs3ITbAx+hZRoGXyKS2mmovv178DqwBsEgBRms18MY3oGPVFlTuridvXv
         ohDnTPQHoQbWgdN2SkEsW6A2u/AhJ1TTfgLUGHi4Wf3WWB+OiPul6CsEFZkZyeoLTsm4
         0DpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749554139; x=1750158939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxiKx3fQ2UN0TdQSGe7J2LZQJpdb1R/YSkx1+hJ6ixs=;
        b=Tf4zxc26XzxBYHw8we8KOsOMqWg8LZFCAuxXuZ5Wd4XQUPA51fXo/PY7R9stZLT3ch
         zzLjZeTGMGjQfsheLJFJXXEGUyolDwJ/TnnaAOr+E1hE5dVgobnYW5Gb3kijsW1nJyfq
         EPce7/SFJVMi5x4aIgqKdgNa0UtHUOy2CWqsJm0v5oox8T5iBmosl+WnG0Xw7hcTlp9+
         xqldNTSrcLs/ciOy/uvlMSi6FmYDVSwYlSV51Q1e08HeWkpp4CihhLZxBHEbr7CV/70c
         EL1Frhdn2VGINCYNHp/RAv1e9EFnhkVLye4sV+rpwdAt6GHbrKq/MilwZJUGoRo15cHA
         rBYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNowXDJjeuMLWSUGtZJTO16mw2HlJTi40Vy4kE4EahzxmscRAF34mSuMZQNJs6VTbH/yzlvRZDhQ==@lists.ozlabs.org, AJvYcCVY5cjdK65EzBonFSt0iTSFCMHt4Y9n1bR/Lvx6C6516F2selKKAOp+ZJA5hLj6998b/T8egaCFV6l4c5E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx18O2jSa1TNFtYT/H88a44scFfymRusSdURvQ6mUpDkVi1pcPl
	45d/P34rzko5S0eAaKTU3tsPvzqKih0oYj6i3KjpQrjJg97EAPgiOYfr
X-Gm-Gg: ASbGnctkiw0j3qaa2ghvV9yzvS7yxApQ0WVA3MLbRG5mX6Xl6xK5sbdJopccIX7SY9T
	viD7YsVNRNm4PSLaOsXQ4qkquKopviACI9V4pa9JWVfPj8KZl4gV5Xwy6VANZDEV7OS+xur5n4l
	Ge38lGGrJLk4cFy/ZfJlw1I9PNgt6bgqNKTCPAOCL1PqbrhSMOu1yCBwQxhbOussoIgTbLy+jWq
	6xNuMRj6G8kFQHt30z6jr2Xz9vTiRq+COSVAPgyvnUMgtim3V7nUFsc8dCNyap7sD8pjsU1vmep
	WmUH776o/J9v4gEB5eg+3BHMgGN9WipyuC8H/lFwOvN2kSdDcUyf3eyIsnnBubCtLaLRzRSRYYE
	fVJMuC0uPuq119E+9liwlCwwjnlXE40aI6+h2lFflnxHjw4fc
X-Google-Smtp-Source: AGHT+IEq5h6QpOWbOPcXEokI/1kkApz0WSZPNMsqb+qTO25Obu6S4fRERowIAa6crf+gSKsbxpYBWg==
X-Received: by 2002:a05:6000:2891:b0:3a5:2b75:56cc with SMTP id ffacd0b85a97d-3a531cac39cmr14409541f8f.23.1749554139143;
        Tue, 10 Jun 2025 04:15:39 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323ad414sm12186802f8f.31.2025.06.10.04.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 04:15:37 -0700 (PDT)
Date: Tue, 10 Jun 2025 13:15:35 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, 
	Huacai Chen <chenhuacai@loongson.cn>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Huacai Chen <chenhuacai@kernel.org>, linux-mmc@vger.kernel.org, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Taichi Sugaya <sugaya.taichi@socionext.com>, 
	Takao Orito <orito.takao@socionext.com>, Ben Dooks <ben-linux@fluff.org>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Kamal Dasu <kamal.dasu@broadcom.com>, Al Cooper <alcooperx@gmail.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, Michal Simek <michal.simek@amd.com>, 
	Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org, 
	Aubin Constans <aubin.constans@microchip.com>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Yixun Lan <dlan@gentoo.org>, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-tegra@vger.kernel.org, Hu Ziji <huziji@marvell.com>
Subject: Re: [PATCH v3 01/35] mmc: sdhci: Use devm_mmc_alloc_host() helper
Message-ID: <72va4ohv5djerrqe6jwtas6j2yg5f4xkcfxpsmadclh25mhjlh@2zwl3d52ubvy>
References: <cover.1749127796.git.zhoubinbin@loongson.cn>
 <dcfce3ddf980563c590f82c1b4e8840c29497887.1749127796.git.zhoubinbin@loongson.cn>
 <t5caqkvguurw2dwzn7wkbjo5ryv3jp3eppjzhdwgx6q6vro2q2@onqqr6v3whdo>
 <6ab83033-1349-4d5e-8d1f-8a13d851abf4@loongson.cn>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k45u4zwumvcsy4c2"
Content-Disposition: inline
In-Reply-To: <6ab83033-1349-4d5e-8d1f-8a13d851abf4@loongson.cn>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--k45u4zwumvcsy4c2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 01/35] mmc: sdhci: Use devm_mmc_alloc_host() helper
MIME-Version: 1.0

On Tue, Jun 10, 2025 at 06:21:27PM +0800, Binbin Zhou wrote:
> Hi Thierry:
>=20
> On 2025/6/10 17:42, Thierry Reding wrote:
> > On Sat, Jun 07, 2025 at 03:33:34PM +0800, Binbin Zhou wrote:
> > > Use new function devm_mmc_alloc_host() to simplify the code.
> > >=20
> > > Although sdhci_free_host() is no longer needed, to avoid drivers that=
 still
> > > use this function from failing to compile, sdhci_free_host() is tempo=
rarily
> > > set to empty. Finally, it will be removed when there are no more call=
ers.
> > >=20
> > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > ---
> > >   drivers/mmc/host/sdhci.c | 3 +--
> > >   1 file changed, 1 insertion(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> > > index 32fa0b2bb912..ee5a5ae4db31 100644
> > > --- a/drivers/mmc/host/sdhci.c
> > > +++ b/drivers/mmc/host/sdhci.c
> > > @@ -4076,7 +4076,7 @@ struct sdhci_host *sdhci_alloc_host(struct devi=
ce *dev,
> > >   	WARN_ON(dev =3D=3D NULL);
> > > -	mmc =3D mmc_alloc_host(sizeof(struct sdhci_host) + priv_size, dev);
> > > +	mmc =3D devm_mmc_alloc_host(dev, sizeof(struct sdhci_host) + priv_s=
ize);
> > >   	if (!mmc)
> > >   		return ERR_PTR(-ENOMEM);
> > > @@ -5002,7 +5002,6 @@ EXPORT_SYMBOL_GPL(sdhci_remove_host);
> > >   void sdhci_free_host(struct sdhci_host *host)
> > >   {
> > > -	mmc_free_host(host->mmc);
> > >   }
> > Is there any point in keeping the sdhci_free_host() function around now?
> > I only see patches 1 and 31, so not sure if anything happens in between.
>=20
> To minimize email delivery failures, I handle each driver patch by sending
> it to the relevant person, while sending patches 0 and 1 to everyone.
>=20
> Keeping sdhci_free_host() as suggested by Adrian[1] is to minimize
> disruption to the compilation process. We first set sdhci_free_host() to
> empty, and once all callers have been cleaned up, we will remove it[2].
>=20
> Of course, perhaps I should also CC the final patch[2] to everyone, which
> would make the entire process clearer.

Makes sense, and no worries. There's no great solution to this. Either
you send to everyone and you get complaints, or you send to too few
people and you get complaints.

Thanks for clarifying.

Thierry

--k45u4zwumvcsy4c2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhIE9cACgkQ3SOs138+
s6GQBA//Uwo2UNmg6Kz2FmjupP6jInce88oeU0wuRA2eXLJxily+e6i9k6VcnYrB
FwkVmYo7qNRUixAA6TkZuDe74mN5rUrDAgMaF8pLMvQ2tFXS8BO+02jTedHffhet
v6GXZJ4hARWlGL6EY5jGfWa7PIMtlXGyPiRmCH8gXSW3qoo6O5mfLLdWi6brHhts
lX3z6DxsSVN52Pa/95zoQQQ8eyQtdcYDWHqeTivi5Y82gDy6P24+1BLWiTfCTzEw
D2Cl3DgKUu1qKrMwG9V0gQyc6bmNFdJuS3BLA37hKPFOMrD0zS7SQsX2pt+yoMxO
zKjO5P3kkQFTJJhP6gDoXscax9d80EsHUgKOOdkLVp+3SmGLZ039rI94BGhHc1by
78S5I+HpQKr3B+WlwRBQqoQtTDDFB8lP2D0LRClGyW50bIDHwHU087JYcoCck13W
xHDXXMIsVCU3NKmXT8bI5GFF4WVlI8oAcHEtRTZRJy8IcSZa7fn8QYdIDwOmTjM7
Y5SY2/GHPYmcfHeUaGACsFGB8vCCdVi9qVCQtw9M3OjORZ3Hu6wCQ3BpQesJsJO+
CHX7XcTnKxG/o9LGeeimJMjqHK/oA4HU9/HXoqJgmlIDDr0nI3N6EVOPDL3CNATV
L81QfkNDQ+ORICzcQsgi8Q5Rbi5P7fOsmRpdcEck9u4NZGbgD4M=
=tny8
-----END PGP SIGNATURE-----

--k45u4zwumvcsy4c2--

