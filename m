Return-Path: <openbmc+bounces-236-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFA0ADE12B
	for <lists+openbmc@lfdr.de>; Wed, 18 Jun 2025 04:39:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMScJ4Bcrz30T0;
	Wed, 18 Jun 2025 12:39:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750214352;
	cv=none; b=hRXpVEqxdHowks87+OdA4aufpuYvET17sOznQvFwZA9nJuL65EFlmUVpmwm7GrDoayV9EWl8s5+0KSs/TnBAS2XEQ1gK16EZSm6Mp1MKKYqXeE/FwmnQgawlOzQ+NFTZaojYyoFpSkLZh0fmidFtONcAc5DfyAk7F8FaE0g6eAsAtvgiuBeCs4pXX/gunVuyxuKfcdWdZOTHy1Ty1OCCgV7H8DIZL+J96B4PZ7w/Uz3rkpt4kE/bSuyD+yaFAOgDnuNbaEH+u0LjkJ2zAKIkzEK83zjf9EgEDl6Ppi3JQJJmV3wFHnbXutX8aGVy960QLLyp02gpekmgw+pO/1j2lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750214352; c=relaxed/relaxed;
	bh=ItE5LTzozOsAetn4WQ1Ta5UuaFaBQiatwV/mVr7BE8o=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GMiA0WIHkT4GKbwb5BPDUEKZ4YiHMYMZWqHc0Ry4kJAG29sIe55VUbzxcf9kQmiFUTYpbZi8rz7JR2DPKh+ZmZpLG+md0AziCGTFUHPLTNUL+YJoDcfkWHcWhZDUsf38LhnmArZjyxbeIGGPgH8P0mpjrzalW8Pe8PJhqedED48FFtIeT5xusIdOuahj9WNAr0zW4TynH+En1UqDXkSMJ4ECUpVDRCwKXrAhfpSA0H9rIOiQslqomHkll1R4vGIG8fuXNweaXqCDFD8UhkagjWvI6kFKKKkdKkwimr23Los/BJXRDUzSIv8tPbRwr7yx0Kzhcd2VrMttZPNUmP6uIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZtGpREki; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZtGpREki;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMScH6Hk7z30RJ;
	Wed, 18 Jun 2025 12:39:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750214351;
	bh=ItE5LTzozOsAetn4WQ1Ta5UuaFaBQiatwV/mVr7BE8o=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=ZtGpREkifDbhmwhg2Hx21YfFGNN5FATZloYBSy9QAEOF99qh6fJHo5f403fiT+n8U
	 4FcnEVWY4wrFYt4YRuXe4l7+I7Oo7d+iuOq97XWwkZr/Lfv+Q3sx7PN29en12bv49m
	 ml9ZlQb6WjoHcN7TCUEWWgOcnXNL30c+yLDptTUitxnR54Wq3kI3My3AaVwrsnNC2I
	 nAiIn88vAoz0vjz+LXr27bBzSN5cjwx7OwPUwlB9K8/grSYrQfLCNEmjQ1huFZWa2X
	 dIRzLWpYPaUfcrMMgMHCRq4v79zAPpt5zfGqJ2H3Bf/ICByT3TyLUmE0RP0RqaCLfV
	 YV5lLooh72UKA==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 86EA0640A0;
	Wed, 18 Jun 2025 10:39:09 +0800 (AWST)
Message-ID: <4c380a2936fc5c1f37750f231eb48edc17aefa68.camel@codeconstruct.com.au>
Subject: Re: [PATCH 4/8] mmc: sdhci-of-aspeed: Get max clockk by using
 default api
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Cool Lee <cool_lee@aspeedtech.com>, adrian.hunter@intel.com, 
	ulf.hansson@linaro.org, joel@jms.id.au, p.zabel@pengutronix.de, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 18 Jun 2025 12:09:09 +0930
In-Reply-To: <20250615035803.3752235-5-cool_lee@aspeedtech.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
	 <20250615035803.3752235-5-cool_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, 2025-06-15 at 11:57 +0800, Cool Lee wrote:
> Don't limit clock frequency by f_max.
>=20
> Signed-off-by: Cool Lee <cool_lee@aspeedtech.com>
> ---
> =C2=A0drivers/mmc/host/sdhci-of-aspeed.c | 10 +---------
> =C2=A01 file changed, 1 insertion(+), 9 deletions(-)
>=20
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-=
of-aspeed.c
> index 10160a706334..2bdd93a3f91f 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -288,14 +288,6 @@ static void aspeed_sdhci_set_clock(struct sdhci_host=
 *host, unsigned int clock)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sdhci_enable_clk(host, cl=
k);
> =C2=A0}
> =C2=A0
> -static unsigned int aspeed_sdhci_get_max_clock(struct sdhci_host *host)
> -{
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (host->mmc->f_max)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return host->mmc->f_max;
> -
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return sdhci_pltfm_clk_get_max=
_clock(host);
> -}
> -
> =C2=A0static void aspeed_sdhci_set_bus_width(struct sdhci_host *host, int=
 width)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct sdhci_pltfm_host *=
pltfm_priv;
> @@ -446,7 +438,7 @@ static int aspeed_sdhci_execute_tuning(struct sdhci_h=
ost *host, u32 opcode)
> =C2=A0static const struct sdhci_ops aspeed_sdhci_ops =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.read_l =3D aspeed_sdhci_=
readl,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.set_clock =3D aspeed_sdh=
ci_set_clock,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.get_max_clock =3D aspeed_sdhc=
i_get_max_clock,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.get_max_clock =3D sdhci_pltfm=
_clk_get_max_clock,

This was used to limit the maximum bus speed via the devicetree. See:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
h=3Dv6.16-rc2&id=3D0a0e8d7501cda79c9b20f6011814e2ec9b473ade

Why remove it? There's no discussion of the motivation in the commit
message.

Andrew

