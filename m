Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4F44A3DA7
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 07:30:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnJ8R2WWSz2xrd
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 17:30:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=HV5VHgSW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834;
 helo=mail-qt1-x834.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=HV5VHgSW; dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnJ8509Vzz2xF0
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jan 2022 17:29:56 +1100 (AEDT)
Received: by mail-qt1-x834.google.com with SMTP id y8so10647455qtn.8
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jan 2022 22:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8xVVlTXCH5dzzfG9cCSQy47QYWU3pZiA5VxSxCNN/iE=;
 b=HV5VHgSWYz99VYy96+UH45wW+9Uy5noFrXqiFf70PkSLMC3fyx4v2gS8tDQEile/Bj
 RHgkSOtRxR0rNd1cpc9Wee2Syj1bgqD2SRgS9ANdEPo1/aLvWD+MCl5tFLk7Rq+Mxcsz
 WjKBnjsM2kaPVaE3N+LctKOJyDos3WOfpS+bo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8xVVlTXCH5dzzfG9cCSQy47QYWU3pZiA5VxSxCNN/iE=;
 b=G0YsHK0AN8NwvXt0EcN4cniuhNFECG50t3b1RVEkDn0oWb6EdGNVFe/Y0WUou5BD3g
 crFh3fcPRlXARu4DZ1rA/vQ5HOqUAeOU5UhH67oYd4oj2JYOv4peuPy9O9wM526zC037
 nECVVZjlsCv5Fw/GtOvrWcC8rCathUgPfEAmEA8EMAGNV7d0VKcXDbzYQn9WcEWswo78
 pGnU0PQhDQNYruweYvE+WO++r+y48+kg49eNazHMAJPcRbmDaKRby11R9uRPdxxEZGqS
 9lVdDN8/NQ0FAZjnRtSFxNl8Q2ENgz+GlorunLzgCnSP/PvJCl5IdYbFamJDQl1lheuH
 jfow==
X-Gm-Message-State: AOAM532Shxto9H7iQqmrT3N5UeKRC0/GLRpHkx0wcDwbbQtMHrWjiej3
 FBrJgw0i8t1gr8bRI3PhMsTtqdcBVHHLyFPfjKM=
X-Google-Smtp-Source: ABdhPJx/zGloFa7YAI6lleFOSE5SaNeGSjSF5aHLos6yTuSHD0OXY+2KHx+dL5ubhRMTMsH+pl9NuEiuUHP9ctxPDiU=
X-Received: by 2002:ac8:7e91:: with SMTP id w17mr13681193qtj.678.1643610594671; 
 Sun, 30 Jan 2022 22:29:54 -0800 (PST)
MIME-Version: 1.0
References: <20220129092957.2189769-1-j.neuschaefer@gmx.net>
In-Reply-To: <20220129092957.2189769-1-j.neuschaefer@gmx.net>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 31 Jan 2022 06:29:42 +0000
Message-ID: <CACPK8Xfa8dYaAqg=8MA7zm82ve-K+t_sCfwXF82-9EV97rUYNg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nuvoton, npcm7xx: remove bogus unit addresses
 from fixed-partition nodes
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree <devicetree@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, 29 Jan 2022 at 09:32, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.n=
et> wrote:
>
> The unit addresses do not correspond to the nodes' reg properties,
> because they don't have any.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Do you want to add a Fixes: line?

> ---
>  arch/arm/boot/dts/nuvoton-npcm730-gbs.dts            | 2 +-
>  arch/arm/boot/dts/nuvoton-npcm730-gsj.dts            | 2 +-
>  arch/arm/boot/dts/nuvoton-npcm730-kudo.dts           | 6 +++---
>  arch/arm/boot/dts/nuvoton-npcm750-evb.dts            | 4 ++--
>  arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts | 6 +++---
>  5 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts b/arch/arm/boot/dt=
s/nuvoton-npcm730-gbs.dts
> index eb6eb21cb2a44..33c8d5b3d679a 100644
> --- a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
> +++ b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
> @@ -366,7 +366,7 @@ spi-nor@0 {
>                 spi-max-frequency =3D <20000000>;
>                 spi-rx-bus-width =3D <2>;
>                 label =3D "bmc";
> -               partitions@80000000 {
> +               partitions {
>                         compatible =3D "fixed-partitions";
>                         #address-cells =3D <1>;
>                         #size-cells =3D <1>;
> diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts b/arch/arm/boot/dt=
s/nuvoton-npcm730-gsj.dts
> index d4ff49939a3d9..bbe18618f5c56 100644
> --- a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> +++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> @@ -142,7 +142,7 @@ spi-nor@0 {
>                 reg =3D <0>;
>                 spi-rx-bus-width =3D <2>;
>
> -               partitions@80000000 {
> +               partitions {
>                         compatible =3D "fixed-partitions";
>                         #address-cells =3D <1>;
>                         #size-cells =3D <1>;
> diff --git a/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts b/arch/arm/boot/d=
ts/nuvoton-npcm730-kudo.dts
> index 82a104b2a65f1..8e3425cb8e8b9 100644
> --- a/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts
> +++ b/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts
> @@ -388,7 +388,7 @@ spi-nor@0 {
>                 spi-max-frequency =3D <5000000>;
>                 spi-rx-bus-width =3D <2>;
>                 label =3D "bmc";
> -               partitions@80000000 {
> +               partitions {
>                         compatible =3D "fixed-partitions";
>                         #address-cells =3D <1>;
>                         #size-cells =3D <1>;
> @@ -422,7 +422,7 @@ spi-nor@1 {
>                 reg =3D <1>;
>                 spi-max-frequency =3D <5000000>;
>                 spi-rx-bus-width =3D <2>;
> -               partitions@88000000 {
> +               partitions {
>                         compatible =3D "fixed-partitions";
>                         #address-cells =3D <1>;
>                         #size-cells =3D <1>;
> @@ -447,7 +447,7 @@ spi-nor@0 {
>                 reg =3D <0>;
>                 spi-max-frequency =3D <5000000>;
>                 spi-rx-bus-width =3D <2>;
> -               partitions@A0000000 {
> +               partitions {
>                         compatible =3D "fixed-partitions";
>                         #address-cells =3D <1>;
>                         #size-cells =3D <1>;
> diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dt=
s/nuvoton-npcm750-evb.dts
> index 0334641f88292..cf274c926711a 100644
> --- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> @@ -74,7 +74,7 @@ spi-nor@0 {
>                 spi-rx-bus-width =3D <2>;
>                 reg =3D <0>;
>                 spi-max-frequency =3D <5000000>;
> -               partitions@80000000 {
> +               partitions {
>                         compatible =3D "fixed-partitions";
>                         #address-cells =3D <1>;
>                         #size-cells =3D <1>;
> @@ -135,7 +135,7 @@ spi-nor@0 {
>                 spi-rx-bus-width =3D <2>;
>                 reg =3D <0>;
>                 spi-max-frequency =3D <5000000>;
> -               partitions@A0000000 {
> +               partitions {
>                         compatible =3D "fixed-partitions";
>                         #address-cells =3D <1>;
>                         #size-cells =3D <1>;
> diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts b/arch/=
arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts
> index 767e0ac0df7c5..7fe7efee28acb 100644
> --- a/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts
> +++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts
> @@ -107,7 +107,7 @@ spi-nor@0 {
>                 reg =3D <0>;
>                 spi-rx-bus-width =3D <2>;
>
> -               partitions@80000000 {
> +               partitions {
>                         compatible =3D "fixed-partitions";
>                         #address-cells =3D <1>;
>                         #size-cells =3D <1>;
> @@ -146,7 +146,7 @@ spi-nor@1 {
>                 reg =3D <1>;
>                 npcm,fiu-rx-bus-width =3D <2>;
>
> -               partitions@88000000 {
> +               partitions {
>                         compatible =3D "fixed-partitions";
>                         #address-cells =3D <1>;
>                         #size-cells =3D <1>;
> @@ -173,7 +173,7 @@ spi-nor@0 {
>                 reg =3D <0>;
>                 spi-rx-bus-width =3D <2>;
>
> -               partitions@A0000000 {
> +               partitions {
>                         compatible =3D "fixed-partitions";
>                         #address-cells =3D <1>;
>                         #size-cells =3D <1>;
> --
> 2.34.1
>
