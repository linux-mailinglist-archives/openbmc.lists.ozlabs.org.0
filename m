Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EEE6170FA
	for <lists+openbmc@lfdr.de>; Wed,  2 Nov 2022 23:53:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2hyC2zmLz3cFn
	for <lists+openbmc@lfdr.de>; Thu,  3 Nov 2022 09:53:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=XXO6/RnV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=XXO6/RnV;
	dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2hxb5mq7z2xfS
	for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2022 09:53:06 +1100 (AEDT)
Received: by mail-wr1-x42a.google.com with SMTP id h9so382976wrt.0
        for <openbmc@lists.ozlabs.org>; Wed, 02 Nov 2022 15:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYjfK5FOedPZzZL0Ub/6um1uebzEToZ9Ap0WYh1PvkU=;
        b=XXO6/RnVDaOgdXMMw6bjMCe0AcUwcVsszTCWYpgtc4R7rx3XCbJ7uBmtzNBqcTUXER
         eudVm8TopPSyHYtHk8Ml2oD4xY6Cu7dZHnEdoc7h5jzsip5Q3eXArCvuZLzZkSvxPmIG
         BXBBTdyU+TwEuDRwPTZrOQDBxXFGEltg/bRy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYjfK5FOedPZzZL0Ub/6um1uebzEToZ9Ap0WYh1PvkU=;
        b=5PrqjlqCjozFlfebNpZXxX0SrIx7Hy6f6HMvhiNGJehOpZ9zVUZZmuO5blXOZ+vXHb
         tg8re/trp8WXq3r19V4VAXC/LNzg6Pvtcpmv9e0wjvDR1bvtD9dVSvTi6FC/eUn05G+K
         uwlpmskQ6AM5sAl+vgMigRmK2c9wNWqbADPE+Ee40skEjqVM3cKpEJdIB0Z7UG2R/ub9
         o6AGi9rEyEXKzHERn7DMxoQtiejP3+X5AHpcMv4T8OwXVwyr1dI5hvrdDzSJWkHTlcZx
         IBvDP9DzCoROFfW/auq3MI1KuAx3GuizIfMtjAOOxP0KleMSVD76ItPW5dAJwaVOMl2I
         bN2A==
X-Gm-Message-State: ACrzQf0kYMbTvkUwSPhPFMO2gBpq0d4nbzbzvAR1gJdhue7lJ0YU+6Jl
	+NCK+9oQDJ0g7uPFcjYyfEbJImmprnMwoFuCbhs=
X-Google-Smtp-Source: AMsMyM5s9k4J4wfeYI3ptgLk6UhFb+JYibRh3dUJjQIeNtG/3RQfQ5SJeWPsKvXSkAQoSqH/O6b8W9Rp1gIyx4z5Lik=
X-Received: by 2002:a5d:6288:0:b0:236:dc84:1f70 with SMTP id
 k8-20020a5d6288000000b00236dc841f70mr9403016wru.549.1667429582702; Wed, 02
 Nov 2022 15:53:02 -0700 (PDT)
MIME-Version: 1.0
References: <20221101102916.440526-1-j.neuschaefer@gmx.net>
In-Reply-To: <20221101102916.440526-1-j.neuschaefer@gmx.net>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Nov 2022 22:52:50 +0000
Message-ID: <CACPK8XcmDuFta++nfr-Ub+fierfD_GVmXdZKxWTX6AewELUGSQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nuvoton,wpcm450-supermicro-x9sci-ln4f: Add GPIO
 line names
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 1 Nov 2022 at 10:29, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.ne=
t> wrote:
>
> To make gpioinfo output more useful and enable gpiofind usage, add line
> names for GPIOs where the function is known.
>
> This patch follows the naming convention defined for OpenBMC, as much as
> possible:
>
>   https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-na=
ming.md
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  .../nuvoton-wpcm450-supermicro-x9sci-ln4f.dts  | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts =
b/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
> index 26fed97f8ff4a..d4472ffdac928 100644
> --- a/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
> +++ b/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
> @@ -58,6 +58,24 @@ heartbeat {
>         };
>  };
>
> +&gpio0 {
> +       gpio-line-names =3D
> +               /* 0 */ "", "host-reset-control-n", "", "", "", "", "", "=
",
> +               /* 8 */ "", "", "", "", "power-chassis-control-n", "", "u=
id-button", "";
> +};
> +
> +&gpio1 {
> +       gpio-line-names =3D
> +               /* 0 */ "", "", "", "", "led-heartbeat", "", "", "led-uid=
",
> +               /* 8 */ "", "", "", "", "", "", "", "";
> +};
> +
> +&gpio4 {
> +       gpio-line-names =3D
> +               /* 0 */ "", "", "", "", "", "", "", "",
> +               /* 8 */ "", "", "", "", "", "", "", "power-chassis-good";
> +};
> +
>  &pinctrl {
>         key_pins: mux-keys {
>                 groups =3D "gspi", "sspi";
> --
> 2.35.1
>
