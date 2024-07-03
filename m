Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4334C92537E
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2024 08:09:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=SCcvzCB0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDTry6M2Cz3cZ5
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2024 16:09:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=SCcvzCB0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDTrR6nGQz3bc2
	for <openbmc@lists.ozlabs.org>; Wed,  3 Jul 2024 16:09:27 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-145-155.adl-adc-lon-bras33.tpg.internode.on.net [118.210.145.155])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2619B20135;
	Wed,  3 Jul 2024 14:09:27 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1719986967;
	bh=tw5/Qj0dvyCxfU+u5TphJqJHswyvF7h1hIypz+Zsn7I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SCcvzCB07CbboSnL4100+X7hRjivfBMAUCFSpI6AsaCSygeYl2fxXXKXbTDZXdLqF
	 t4l07tYDEAhQ27jCqvjOnAnssNlh69QU/Bb1RqipyrNGa4IhRv9E+md/d4FmHGtoHm
	 atHyVSaPKeSxcO01qxJQSo6K2cCWOh9qJqQJyap2YP9gfBrCUbOB+wtuNy97uw6S6K
	 4ZGoig5QV5xN2chm0weRIRGlAQakB4E8ucLFtbJINmn5wLn9eCIeCjtT6AhQdkJ30+
	 g+nRRNmMr50Iu5XS015UWeEUfYDpC8mwXIN74IhTJwmNdFE/jAuULFoeYB8BEll0K/
	 sWLv6rnFI23eQ==
Message-ID: <fdd1058734e27094c15585bb0c735ebb9635b24e.camel@codeconstruct.com.au>
Subject: Re: [linux dev-6.6 v1 2/6] dt-bindings: clock: npcm845: Add
 reference 25m clock property
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>, openbmc@lists.ozlabs.org
Date: Wed, 03 Jul 2024 15:39:26 +0930
In-Reply-To: <20240701071048.751863-3-tmaimon77@gmail.com>
References: <20240701071048.751863-1-tmaimon77@gmail.com>
	 <20240701071048.751863-3-tmaimon77@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2024-07-01 at 10:10 +0300, Tomer Maimon wrote:
> The NPCM8XX clock driver uses a 25Mhz external clock, therefore adding
> clock property.
>=20
> The new required clock property does not break the NPCM8XX clock ABI
> since the NPCM8XX clock driver hasn't merged yet to the Linux vanilla.
>=20
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 9 +++++----
>  arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts     | 7 +++++++

The patch subject is quite misleading - this isn't modifying the
binding at all, rather the actual devicetrees.

Has this work been sent upstream?

>  2 files changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/ar=
ch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> index ecd171b2feba..41d345448430 100644
> --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> @@ -52,6 +52,7 @@ rstc: reset-controller@f0801000 {
>  			reg =3D <0x0 0xf0801000 0x0 0x78>;
>  			#reset-cells =3D <2>;
>  			nuvoton,sysgcr =3D <&gcr>;
> +			clocks =3D <&refclk>;

Why not add `#clock-cells` here while we're at it (squash patch 3/6
into this one)?

Andrew
