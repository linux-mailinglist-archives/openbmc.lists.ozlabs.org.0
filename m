Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F27855737
	for <lists+openbmc@lfdr.de>; Thu, 15 Feb 2024 00:24:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dBwUm+FV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZvRl2WMxz3dV3
	for <lists+openbmc@lfdr.de>; Thu, 15 Feb 2024 10:24:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dBwUm+FV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZFLN5ngYz3020
	for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2024 08:47:54 +1100 (AEDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-dc23bf7e5aaso4507031276.0
        for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2024 13:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707860870; x=1708465670; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Xj7EazHfkvqhAcFDgWE71D7H9yEicOk1M857cHV2u0=;
        b=dBwUm+FVC/rGz1k5E+rFYRe3eHYNLd8+m9bECGkCk6HK8dw16+ffoWJUpZJ1fM70Qf
         pwk/J6F7SPJ21oHEgRQfSkEB9r6TD75FwZGvAZBdWcfXnbIWr2qw9g7ts6aFSZxrUdpD
         DtAb2HYSFxv0DcnpJbFUSaXYyPkIWfv+SgnhNQOuGGd7cBHoK8AtoXvHUTVJOdUM7+zj
         otTmCFz8Nk1nh75roRUU6A6z0rTlrdL8uk0bzLctPg+FhLjeVFivFSrco5cvxGVFVrbZ
         FyfRaIWTKbTuqyHsyFl4O5iJBirNzQsuJ6uCySLHozV/rYPF6WGiThWcbPD2L1RR+PYq
         ygZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707860870; x=1708465670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Xj7EazHfkvqhAcFDgWE71D7H9yEicOk1M857cHV2u0=;
        b=QdZmTWnhCr75ScKrgTpYTUbW4CcMOF7NFlls1gGalkPy6nIixt6YR+29aTO/s7Bhjr
         wduIZmCx4bOn4+nLTauqQKh8MKMFqz/hG/NlH+hl10GOyrSL+WBdIxK2yyvSGLl86aZH
         /hhXDBDe4nSDdYs+yGmFTa7dVPvxZT0dth+vSB/weTByKAH2Z+3CnBRM0FS4nyVXYpbP
         4W4g7X5V2TN/V3oRhxXrKorylWiWZIo1o/zQHYJWuY87VltzShLZgO8O0533JRpuZCl2
         z/Z0fwUaQZgNlLKDEVwTKqy6q5atst9Ffjvf+2Qk+kwpjsSEniHehGwjYgMtTaIlddTs
         4Z6A==
X-Forwarded-Encrypted: i=1; AJvYcCWCbdeYJaA7QmSxnrciHm2Gkm6LW0Iw+gKZ6/GBNqeaYmQAt5QR83RIz9SbMMyZknytTgk/UALePxNpzme6IVbmEb0ddiuElbo=
X-Gm-Message-State: AOJu0Yw9ykWaQuMmfE6hXyzFPSpPRtbrPU/gmz30EaBiQikTMwxQkAKp
	q/rEuTzbquroP+yOe4knfNgjgR4kB6YTOiv7MWkSZv83tXVeOv7yJZV+rPOxOvKolpSXEw9OGNi
	dLNUN2uxZeP63m4A3rBXuN6/xurUm0Aw9XUQYMg==
X-Google-Smtp-Source: AGHT+IFa7Zt8v9y973vv6MpdAwv7+Tn3+by0Zhu9bHJxIuhmjm9zf8ed0hjSWCanmVOGM7vq2XjFxfCkSYAs+ofuT1Q=
X-Received: by 2002:a25:ae47:0:b0:dcd:49d0:eece with SMTP id
 g7-20020a25ae47000000b00dcd49d0eecemr434149ybe.60.1707860869809; Tue, 13 Feb
 2024 13:47:49 -0800 (PST)
MIME-Version: 1.0
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org> <20240213-arm-dt-cleanups-v1-4-f2dee1292525@kernel.org>
In-Reply-To: <20240213-arm-dt-cleanups-v1-4-f2dee1292525@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 Feb 2024 22:47:39 +0100
Message-ID: <CACRpkdbPANM0-h_g+6Zazgw9U5W8ZDc=EG4ZiTv64JVmZAPivg@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm: dts: Fix dtc interrupt_map warnings
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 @vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kbuild@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Nathan Chancellor <nathan@kernel.org>, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Imre Kaloz <kaloz@openwrt.org>, Scott Branden <sbranden@broadcom.com>, openbmc@lists.ozlabs.org, Antoine Tenart <atenart@kernel.org>, linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Tsahee Zidenberg <tsahee@annapurnalabs.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Feb 13, 2024 at 8:35=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:

> The dtc interrupt_map warning is off because its dependency,
> interrupt_provider, is off by default. Fix all the warnings so it can be
> enabled.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Thanks for doing this Rob! The schemas finds so many mistakes...
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
