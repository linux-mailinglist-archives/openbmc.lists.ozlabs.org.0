Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C859BB5F2
	for <lists+openbmc@lfdr.de>; Mon,  4 Nov 2024 14:26:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhsgQ22fSz3bvP
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2024 00:26:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730726783;
	cv=none; b=do9rHkUSruXRUjYfWqu9N56CS9fJGXBDEaEx+QaSEi4pF1VigAvLUf1THdkIBSWntd5LwQ1pevQDNc8V6AABqLYJbAzi/kUmCkQJDx8Rh0zdEl3E2n5fwDAzpHP+c1aZIvcUfSuIMj460LrGYTgy2aiGzt80ss3gdpTwCml+uOez6DEbmB4nAL+bqFZUIjdGzzam+5euQo/pu8AbcxFuEUUz7k8+fftyxyikMevY39dX+wBR1rxubpX17Vcn8O7lCT0VR+96cLB8OOZ2Fz9aEvz7m33Zu0ojKOx8v5AKjD5OT6WPYhzT3vM1hkeR9jIL1aVGUeqI3VIIqNPom9mDSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730726783; c=relaxed/relaxed;
	bh=WXKh5DLRlvHaU92lpfnw/9OzY04qwQC+jHOwzlvY+/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kWJE9ArdQ6cKwMR+GoXih87wFTTQ5fUmxK/Y+ssHc0RAgXgq4syy3indJWHNsbgvFHbCokpMgb85r+wib4ig5ohkpVF3LHNZ1S3uz4S6yM7UY/kJxuQoBPVcfm3cUZ/r0qtJ54D1ScYMLaRN3ULdnNY7BIJQDZHF0C+pLrZpzph2s3QDpA6olyCrVB6a8frceHEzdbHB9F6NQcwo+G1jPfAtPI0bvcBlY/Zo52myGk9q+l+/7xnnHzCw3OVsu1osoG8safbTG9kItv4l3GCCQqhNLLwiZp36YdapEoUzsQr0CAVUYaxufnTrLFKFmpEf/qfugcsix41SD0lIObf+gw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M8S7YWTl; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M8S7YWTl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhsgJ0C6Qz2xH8
	for <openbmc@lists.ozlabs.org>; Tue,  5 Nov 2024 00:26:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DB2C0A42F5D
	for <openbmc@lists.ozlabs.org>; Mon,  4 Nov 2024 13:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D48C4AF0B
	for <openbmc@lists.ozlabs.org>; Mon,  4 Nov 2024 13:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730726776;
	bh=Ijo8Sq1mgBUB6sBszy//feBUAboDIQErEOZUwjZS0JI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=M8S7YWTl+LeAP5CbBcAv72Zcx5wrIgUTNgW3dav7Ek9DtMb/NFGuLb3i0yPH5eZn7
	 TDKgKax5EWxJD9p0xKJOljllimViMRwy0Fl098Lzj4rkwwYY8XcLHqxjW8TSyx9lys
	 NHvm2Q0tIw6a5Xb4W7BLeQWO/E1llQh5lxvvsj4xwiBCyfT9FZ8vMZI2BoU9EFXrdb
	 aEaZg9Esc/JFy64HGu0FVXklOItWs02swCQnhVPeIAI/VwqSPzudqVZOZr/xiM+ssb
	 uaFAWRDagfev/ceJM4QSkO5SVQwvmBKfsWJB99DwO5+59qO0A72fzqc8hmdcq3ZhOR
	 bMKDWiVtgFUXg==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6ea8419a57eso13996577b3.1
        for <openbmc@lists.ozlabs.org>; Mon, 04 Nov 2024 05:26:16 -0800 (PST)
X-Gm-Message-State: AOJu0Yx3AR2t3PTaHleeobwblvibEKILz10HN2Ll3bTBQLyizBKJpXfP
	4JopHGDehXVhluzdAr749pQ683P545hECdMjwfKDN4NJSy+R7YI55FwRjsIzkPvfcevpH9z3Gk3
	EwCUZm14FyYhppX1RBJVym/lAXA==
X-Google-Smtp-Source: AGHT+IENFmPCgLa2f0tPo8wbahVEAD5smWzhDagnbAka8mwN23BytgHgO4bTbOLBkWEzwe5RdypOb1vOLgv6wD8TjbY=
X-Received: by 2002:a05:690c:9c0f:b0:6de:a3:a7ca with SMTP id
 00721157ae682-6e9d8acb4a9mr376026027b3.32.1730726775947; Mon, 04 Nov 2024
 05:26:15 -0800 (PST)
MIME-Version: 1.0
References: <20240910215905.823337-1-robh@kernel.org>
In-Reply-To: <20240910215905.823337-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 4 Nov 2024 07:26:05 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJBeoD4yPj1Wva5cbPHweK3RU6pF-Vn=P+MsW0-RhKhZQ@mail.gmail.com>
Message-ID: <CAL_JsqJBeoD4yPj1Wva5cbPHweK3RU6pF-Vn=P+MsW0-RhKhZQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nuvoton: Fix at24 EEPROM node names
To: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Sep 10, 2024 at 4:59=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> at24.yaml defines the node name for at24 EEPROMs as 'eeprom'.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts           | 6 +++---
>  .../arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Ping!

>
> diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts b/arch/arm=
/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts
> index 9f64c85e1c20..c3501786d600 100644
> --- a/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts
> +++ b/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts
> @@ -661,7 +661,7 @@ &i2c5 {
>         clock-frequency =3D <100000>;
>         status =3D "okay";
>
> -       mb_fru@50 {
> +       eeprom@50 {
>                 compatible =3D "atmel,24c64";
>                 reg =3D <0x50>;
>         };
> @@ -704,7 +704,7 @@ max31725@5d {
>                                 reg =3D <0x5d>;
>                                 status =3D "okay";
>                         };
> -                       fan_fru@51 {
> +                       eeprom@51 {
>                                 compatible =3D "atmel,24c64";
>                                 reg =3D <0x51>;
>                         };
> @@ -714,7 +714,7 @@ i2c5_hsbp_fru_3: i2c@3 {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         reg =3D <3>;
> -                       hsbp_fru@52 {
> +                       eeprom@52 {
>                                 compatible =3D "atmel,24c64";
>                                 reg =3D <0x52>;
>                                 status =3D "okay";
> diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts=
 b/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts
> index 087f4ac43187..f67ede148209 100644
> --- a/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts
> +++ b/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts
> @@ -824,7 +824,7 @@ tmp75@4a {
>                 reg =3D <0x4a>;
>                 status =3D "okay";
>         };
> -       m24128_fru@51 {
> +       eeprom@51 {
>                 compatible =3D "atmel,24c128";
>                 reg =3D <0x51>;
>                 pagesize =3D <64>;
> --
> 2.45.2
>
