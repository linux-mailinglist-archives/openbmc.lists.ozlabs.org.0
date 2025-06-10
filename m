Return-Path: <openbmc+bounces-159-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0944AD492E
	for <lists+openbmc@lfdr.de>; Wed, 11 Jun 2025 05:06:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bH9Xh0TjLz307V;
	Wed, 11 Jun 2025 13:06:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749548586;
	cv=none; b=nfD43ok3gsnWWSReunt9TnntFGsTX67Ohp0TaPGS/rKdj3IDuG8zQnAZMQIkcET4LTUCbSIuMRIaSncAiImGNxjRpwcUZTsXdRmq6hJd2zpwTtW8Xss3YPNjhkP9jE6MnHC3mvWsHTG+cLKFzt20TWJNSVYacmZ6z+TBdF63Mz5YV0mcWSIwZcje/pAN/Vfnu0DE9gJqvrdRzwteov/ibUbU8vQfuu27JrSInkXPJ26iiEhcUXVCyr1Myrxd2GpC2leAVKIR5aPh/TMiRWrNabQ6ogw1OsR84apJGDB23IilqdGKjQDCosXGsrE/16sfJAlvXvkEP79v7qGCHMDVjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749548586; c=relaxed/relaxed;
	bh=hy4HQMp4/QVu7y941pMtwqO2t1zabov2n9nxhccD5I8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XRCNv0Vcl3h3vbxyTCGXl90mVA9an1h19Ykpyi+5PUo0npoWNrVs2l5499g+1vwsoLrEIDGJ7NHh+toOm4NCVYgtsfQzd43xH/T5M6u89pxZJK+uxnqd6XrDgLgGLQ5tJGNNS96rVH5NeJQKiQdzz8m7qE9Uum/upMAwGi4P9/F0KtxKrAEqR5XsF/ghkATmzyDjhIk+uW31KxrmXjUC9Riv1ZzGpdpQtuwRiE9yn97MLpfafKjSV/EToLBMgRtCff3r3IxvuvqRCGOGkmOVtHdcAaonj49zSX4ATLch2FU8zkoh6UOKCLFGzLBN9sDDC3J3doglD+X5UmVRIsTvjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gHutEqjk; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gHutEqjk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGkP51DX0z2yVV;
	Tue, 10 Jun 2025 19:43:03 +1000 (AEST)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a4f78ebec8so3114518f8f.0;
        Tue, 10 Jun 2025 02:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749548578; x=1750153378; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hy4HQMp4/QVu7y941pMtwqO2t1zabov2n9nxhccD5I8=;
        b=gHutEqjkiS1L1tJjQ9RJ0Rh63CWOjG+GRttAyqexRCYc8xpxdoBqYLZQPjlVVlwCt5
         2qyQoGr4fz3NdObb4U4CbRyPsH9wbZMxlXGHZVqFFYxX07oCoF8sX/mB1kXDQ7Wz5Lgz
         3r/fVIXSezwg5voKJKFo8ZDGa/fY2pt1P8/h14VzxdhRwTgSsIdUha+zLl+bt/8cTMFc
         /UXvtiXEXHlQnhoXcQ/Js2pTkII4obcsqZqUqDNh3O0plWI1qOKOftckvknubjYcQ3F8
         DHNlHG5GLAv2+UCUiSPSHRqgNw7Irq/2MKe7yFQ7Hjnez8UMLDtzepzF5Qn2DyEaL2Kd
         eoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548578; x=1750153378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hy4HQMp4/QVu7y941pMtwqO2t1zabov2n9nxhccD5I8=;
        b=PR6ZnfUSm1fj1wudPw44rFzYYJQhBcaZD63Px8pIqauqfv1WCay92JLdvY6yKkot40
         9LRYjOBQuuZe99vZYDgcrMGM4vDGRM1ROHQpoVJ9WXGkLJr98gHs9LY7K7gMBmMW7kyR
         YQHNEgQQ9sMoryxCEzcWj5scdNpDMuT9Rnm/b0bTJEmjFFiQCAgQhEpRfFWSdzpog+1O
         Gz4YJt82raaoZxeL5KsRscT4aS84eacV+yLToXnkG1J6fvl8l3el3U9aqCBcHkoS6YD1
         iZyVFtOMHRfqSJWFOAxqUVlfVGPZ6VZRSeNL4cNi7jyQW51xBnwKIiQcoZlNIowobLn2
         5OtA==
X-Forwarded-Encrypted: i=1; AJvYcCUiE/ek/a2vElBbM7XtWcXJmjn9rwBlSoa/pSqrLVqAxhuGPYcMPIOPJkOIOhqNSzK2aMA7Wrs25A==@lists.ozlabs.org, AJvYcCV+Zad5+GMgpD0RRkYwT0GtpM7kr90HYeU41F/fBmtNR0OawVD87+CRL72Eg9IV4cpI/d+2+7iAfk9HVAo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyEAvbPa5xfTrvRaBm43A1QEDK3ZXjaiT1/Ez9bNd6EYj3C2Z3O
	2DMyzBMjT3XWrhrF7KVgWUG+p9gSeqkjWYOxrtYwvGJBlK8Dp7xlup+c
X-Gm-Gg: ASbGncs+QuIZz2FRrl+8HG3cvoeH1XWfHODDUgBEEu8BNquv4fYV6ae1uj2d89aPCNI
	vCjpZX15w1AUMcBSgHiK+uWG05fqaVgUsghMN8p1BhOIgoiCDuCISs5G/yktLrFp1p1CMJo/+PV
	6UOV5C+DX/o54BhjekxYhzRQkj87g4dkh3td5oifOeABW3XoVP9I2iCZIm7ngXKduKWrQIXPIXw
	vcBTwvJBuDDtZvLiuIUeKhAICkJHsUwarAHwSCTIVDR1KceogkFWtAtC9ynQ+KNaxEicdqX8S3Q
	4F+US/hD53iIu+VN27W56FBBpG2ZvzT3WIn0wGCxesrt7o9+8QDeKd7bpbffDfkPY4qZ3yc7qPE
	uoj5FxLkL7lKheQfz+2JCUN/kWhfmo2+Ew25kPx9BptmzQeEE
X-Google-Smtp-Source: AGHT+IExWHAWVGdsU8NZWtNNaxdbfHHyFINoY6jGqsgVAuuDRCnCkj/k/dAfVKD2bDGIuerocgV4wQ==
X-Received: by 2002:a05:6000:1a88:b0:3a5:2f23:3780 with SMTP id ffacd0b85a97d-3a531caa458mr12387967f8f.18.1749548577777;
        Tue, 10 Jun 2025 02:42:57 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323bee86sm11546484f8f.43.2025.06.10.02.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:42:56 -0700 (PDT)
Date: Tue, 10 Jun 2025 11:42:53 +0200
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
Message-ID: <t5caqkvguurw2dwzn7wkbjo5ryv3jp3eppjzhdwgx6q6vro2q2@onqqr6v3whdo>
References: <cover.1749127796.git.zhoubinbin@loongson.cn>
 <dcfce3ddf980563c590f82c1b4e8840c29497887.1749127796.git.zhoubinbin@loongson.cn>
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
	protocol="application/pgp-signature"; boundary="ebq3qw5vudglyq6u"
Content-Disposition: inline
In-Reply-To: <dcfce3ddf980563c590f82c1b4e8840c29497887.1749127796.git.zhoubinbin@loongson.cn>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--ebq3qw5vudglyq6u
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 01/35] mmc: sdhci: Use devm_mmc_alloc_host() helper
MIME-Version: 1.0

On Sat, Jun 07, 2025 at 03:33:34PM +0800, Binbin Zhou wrote:
> Use new function devm_mmc_alloc_host() to simplify the code.
>=20
> Although sdhci_free_host() is no longer needed, to avoid drivers that sti=
ll
> use this function from failing to compile, sdhci_free_host() is temporari=
ly
> set to empty. Finally, it will be removed when there are no more callers.
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/mmc/host/sdhci.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index 32fa0b2bb912..ee5a5ae4db31 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -4076,7 +4076,7 @@ struct sdhci_host *sdhci_alloc_host(struct device *=
dev,
> =20
>  	WARN_ON(dev =3D=3D NULL);
> =20
> -	mmc =3D mmc_alloc_host(sizeof(struct sdhci_host) + priv_size, dev);
> +	mmc =3D devm_mmc_alloc_host(dev, sizeof(struct sdhci_host) + priv_size);
>  	if (!mmc)
>  		return ERR_PTR(-ENOMEM);
> =20
> @@ -5002,7 +5002,6 @@ EXPORT_SYMBOL_GPL(sdhci_remove_host);
> =20
>  void sdhci_free_host(struct sdhci_host *host)
>  {
> -	mmc_free_host(host->mmc);
>  }

Is there any point in keeping the sdhci_free_host() function around now?
I only see patches 1 and 31, so not sure if anything happens in between.

Thierry

--ebq3qw5vudglyq6u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhH/h0ACgkQ3SOs138+
s6Ed0Q/8DpTJQXo20TdxekQF0hnrIFHjlPauJ5ZtKpB7NF/fe3sNtEeoyrxts1E+
6CikEMpo4L/9bzrdo8rcGjuzMgcpss6NFQPLN31d61YD04Ue/ib1QRzc9s8WeRhm
d2h52zCebC+C0o89UyR09Z9yAMPLBo3dFbY4ibo7x+QETIAVk1ylMTTHxsna2lbA
rD8sWJHCrQSEVKJpRPHCF+GD693iCP/q8Dgm47QSRtgpXWKoP4sWMdhMnELuTc1C
49SbTj2Q6FJc4T7jMesthftnLrwTnk4RQCgGzty0EbXAX/FXgdBpBTn2TqYASH/e
qDjx7z9K2S8VESBxTes5vkv5Z0AT8qv7Vzm/2zHTGjo237lZL5oa1b7HsTmj7mby
VLmkcfGVct/6SmGGGEEbH+Eyvsi7CMjv6Xls6fUs9nQOMzUmx3T+mfs9Ue4G/HlY
h30GPSXXwUAmq99Q30qXxH53S8JE0GnfuusLlKdR3T09CmgxIFlV8Tx0MOr76Jvi
RolNAGHx546QFtJsQfxIA2OUBGMqeXr/wOtRb5hJNfHfvM2QpmlKklVesiuaexvk
CJ8iC9/tiE5asSU69f++Wmzl8Z7+k/PefX4vWbYQCv30JQUqqxorXZ8NApulKlen
/uPDSM0UyLzvefatJZYZIolhaRuG+4CpstVYXqzMfvA3Ci4F2FE=
=J2Mb
-----END PGP SIGNATURE-----

--ebq3qw5vudglyq6u--

