Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 739D6855734
	for <lists+openbmc@lfdr.de>; Thu, 15 Feb 2024 00:23:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M009CAqx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZvQj1l8yz3vX9
	for <lists+openbmc@lfdr.de>; Thu, 15 Feb 2024 10:23:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M009CAqx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZDCG5z1wz3c6Q;
	Wed, 14 Feb 2024 07:56:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9D21DCE1EB5;
	Tue, 13 Feb 2024 20:56:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1303C433F1;
	Tue, 13 Feb 2024 20:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707857798;
	bh=D4LSaj+s1Zug+tnZej27exr9mIRN2BETmj/yUE3GRW0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=M009CAqx6Zq+bU3B0slxzBX4LYSGGAZlLcuMORtlOdd1kPRADV0yPtV0MDcvh/71i
	 eKKoQaL4IsBOouhURFlM7bXuQ1D+e7yiNAbxs/G05NqAm2BjmuGEY/P1HIx/MQdVN6
	 9/uohBcFpABqa62lO3DqYEuiChWq5V/oECVXlNWCANYY5X9R/C9Nws/8iKKgLLeHWI
	 q+gvXX6qfTY1DgMimsbt8BAPRBa8NoqLAC1nvSX6dK0At+XS3rq+B5Tk0i6eLbMBEH
	 N59MOVh1jaHbHqW0UyPdMbEaABRBPAKSbb1MqwD1LTiA0FoW4hgfJEmvHJ/Elhf/J6
	 Trj6bzLhSmhMg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-51171c9f4c0so5776242e87.3;
        Tue, 13 Feb 2024 12:56:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVxyO1hmXPwNK6a49e1iUlm/qZd7gY6OYeJZCvPr5UL2s9tx+gYf4ng17fMBsUrYAbCMSkmRsN2pgmWWyvp1kWcIpT/UwmNNkoAT6cV/w03n61oFnarhaGtmtVdrgBWy138T+zD87uw
X-Gm-Message-State: AOJu0Yx8pR2/AEe3Z8+iZlZQa2YdtOy/6iSTDctg8y8sQ/cZVP3ZgvmN
	XmQWZ/19ciC1BOXW1dlDYRCuvglBPXv38vqq84YFMLxXihao7o8RWny5y2bjtrt/Zh8kqw2Qhj4
	fV3xBkBZH8/y+UQ/fODpqXAEc0w==
X-Google-Smtp-Source: AGHT+IHaVnixOZOBNn0WypWTPscuLN4ELDvcVIU+BZ+gCn9OLEVbEJc+WSHECitxZrPyjoAQls55JHpdFFIbqmURVBc=
X-Received: by 2002:a2e:9bc7:0:b0:2d1:107b:3bbd with SMTP id
 w7-20020a2e9bc7000000b002d1107b3bbdmr506655ljj.9.1707857776326; Tue, 13 Feb
 2024 12:56:16 -0800 (PST)
MIME-Version: 1.0
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org> <20240213-wafer-garnish-88287bc5d4a5@spud>
In-Reply-To: <20240213-wafer-garnish-88287bc5d4a5@spud>
From: Rob Herring <robh@kernel.org>
Date: Tue, 13 Feb 2024 20:56:03 +0000
X-Gmail-Original-Message-ID: <CAL_Jsq+9BwYyV9Vu1gfCnK_QjdRHvw2anM==Z6fsJvjyqLYFLw@mail.gmail.com>
Message-ID: <CAL_Jsq+9BwYyV9Vu1gfCnK_QjdRHvw2anM==Z6fsJvjyqLYFLw@mail.gmail.com>
Subject: Re: [PATCH 0/6] dts: Fix dtc interrupt warnings
To: Conor Dooley <conor@kernel.org>
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
 @vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kbuild@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Nathan Chancellor <nathan@kernel.org>, soc@kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Imre Kaloz <kaloz@openwrt.org>, Scott Branden <sbranden@broadcom.com>, openbmc@lists.ozlabs.org, Antoine Tenart <atenart@kernel.org>, linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Tsahee Zidenberg <tsahee@annapurnalabs.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Feb 13, 2024 at 2:27=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, Feb 13, 2024 at 01:34:24PM -0600, Rob Herring wrote:
> > I had a branch with most of these changes sitting in my tree for some
> > time. Geert's asking about some errors not getting found prompted me to
> > clean it up and send it out. This series fixes all* interrupt related
> > warnings and enables the check by default.
> >
> > SoC maintainers, Can you please take this series directly.
> >
> > Rob
> >
> > *There's a few Renesas warnings still Geert said he would fix.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > Rob Herring (6):
> >       arm64: dts: freescale: Disable interrupt_map check
> >       arm: dts: Fix dtc interrupt_provider warnings
> >       arm64: dts: Fix dtc interrupt_provider warnings
> >       arm: dts: Fix dtc interrupt_map warnings
> >       arm64: dts: qcom: Fix interrupt-map cell sizes
> >       dtc: Enable dtc interrupt_provider check
>
> Only fixing it for arm, Sadge.

I was assuming you had things in order. ;)

> Co-incidentally I noticed there was one for riscv while looking at
> Krzysztof's underscore in node name patch earlier, so I'd already
> written a patch to fix it :)

See, I was right.

Actually, I did remember to check right after I sent this and noticed the s=
ame.

For powerpc, no one else can be bothered to care, so neither do I. I
think powerpc has been spewing dtc warnings by default for some time
now.

Rob
