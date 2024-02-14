Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D181B855744
	for <lists+openbmc@lfdr.de>; Thu, 15 Feb 2024 00:28:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=REdAzMQN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZvWy3W80z3vXM
	for <lists+openbmc@lfdr.de>; Thu, 15 Feb 2024 10:28:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=REdAzMQN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZhxm2YW4z3cDy;
	Thu, 15 Feb 2024 02:31:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 65EDFCE229C;
	Wed, 14 Feb 2024 15:31:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7632C43394;
	Wed, 14 Feb 2024 15:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707924694;
	bh=4JlFA01oQWdtvRaP+CnWQqdwr1cP142uEyw13TLrbN8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=REdAzMQNUKQthunqIYd1xXRZvyRazfzeeHO6U9IdkqpQocmGPZO0MqL1dce3y5y1b
	 PFeEIPsWTolML15+QzASJcdeWR5n3IAnWbJf7gcLrasH+H8HI8o4G8CRjOmNuEAXXZ
	 JPJN0CaZp3PLCjJjy61EfrhMHYHUHlJL+wd+mTzJYfZGvX6odSfmQZTFtUVb0aybMe
	 ViowSODx6riqYuR9wKjBYsEm3o3VxzwN8Mp3sn9zRKC3cerkcEYU/VGXs0MoG5uQuI
	 g6xuLSibBrZHt98G3dsRPMywRLrzlLMAc3Dp44/uxlOpcqrH3cKuiu41UkhGcoS0W2
	 /cPQAX+TUIULg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-511ac32ff36so676805e87.1;
        Wed, 14 Feb 2024 07:31:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWlespSDufhEfTViDEjgfoNpnuVC9y6Ja8fjhwcRtqJYzYo4tTogaaRmlSOtNEP5kDJoSZnvJ0YcSmAheCmged7DeC3j4zAylud+nUA4DsRAvEAsL0ybz3ym3G60hKJP6dCgTAKI4us
X-Gm-Message-State: AOJu0YxOmtZM73CZeL5QWpro2QiZkyu6xW2qaJLAN8LFEA3U4zUmNuiN
	d5qwPqMPjwOMrdmVfIWq991wf5efD/guSCaO3+mrYGx7dfQQjDw6g+SdR3dILEErVsihkF7gIrK
	tKOY8y2oFTe3WjRXfcsmW6WLI9g==
X-Google-Smtp-Source: AGHT+IH8/isML9jhNTe8vUWU49jrNm4p0HUKpD8NeE7Izp0zgWowWPvoVR9vvZmOadC5fdJrnpVWN3J0XGbdjt6xmGE=
X-Received: by 2002:a2e:b888:0:b0:2d0:dfad:2863 with SMTP id
 r8-20020a2eb888000000b002d0dfad2863mr2522106ljp.46.1707924672118; Wed, 14 Feb
 2024 07:31:12 -0800 (PST)
MIME-Version: 1.0
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org> <CAMuHMdWgvD9szXksK+jzyvwLQ8ufWWf1TPQ7s-5z4JWgrvXmkg@mail.gmail.com>
In-Reply-To: <CAMuHMdWgvD9szXksK+jzyvwLQ8ufWWf1TPQ7s-5z4JWgrvXmkg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 14 Feb 2024 15:30:57 +0000
X-Gmail-Original-Message-ID: <CAL_JsqKbDdUzkuSBrBTYm0PF8KehK0DnUwTBHqJ6tZfaE=B2_w@mail.gmail.com>
Message-ID: <CAL_JsqKbDdUzkuSBrBTYm0PF8KehK0DnUwTBHqJ6tZfaE=B2_w@mail.gmail.com>
Subject: Re: [PATCH 0/6] dts: Fix dtc interrupt warnings
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-aspeed@lists.ozlabs.org, Tony Lindgren <tony@atomide.com>, linux-arm-msm@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Stefan Agner <stefan@agner.ch>, Chanho Min <chanho.min@lge.com>, Thierry Reding <thierry.reding@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Nicolas Schier <nicolas@fjasle.eu>, Bjorn Andersson <andersson@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Magnus Damm <magnus.damm@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Joel Stanley <joel@jms.id.au>, linux-renesas-soc@vger.kernel.org, Linus Walleij <linusw@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org, Maxime Coquelin <mcoquelin.s
 tm32@gmail.com>, linux-kbuild@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Nathan Chancellor <nathan@kernel.org>, soc@kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Imre Kaloz <kaloz@openwrt.org>, Scott Branden <sbranden@broadcom.com>, openbmc@lists.ozlabs.org, Antoine Tenart <atenart@kernel.org>, linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Tsahee Zidenberg <tsahee@annapurnalabs.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Feb 14, 2024 at 9:01=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Rob,
>
> On Tue, Feb 13, 2024 at 8:35=E2=80=AFPM Rob Herring <robh@kernel.org> wro=
te:
> > I had a branch with most of these changes sitting in my tree for some
> > time. Geert's asking about some errors not getting found prompted me to
> > clean it up and send it out. This series fixes all* interrupt related
> > warnings and enables the check by default.
>
> > *There's a few Renesas warnings still Geert said he would fix.
>
> Thanks, fix sent
> https://lore.kernel.org/r/a351e503ea97fb1af68395843f513925ff1bdf26.170792=
2460.git.geert+renesas@glider.be
>
> >       dtc: Enable dtc interrupt_provider check
>
> >  scripts/Makefile.lib                                  |  3 +--
>
> Just wondering, can the remaining disabler be removed, too?
>
> Documentation/devicetree/bindings/Makefile:     -Wno-interrupt_provider \

I was too. Shockingly, that too will require some fixes. Though I
remember when configuring the warnings for bindings, trying to make
them stricter. So there must have been some case where
no-interrupt_provider was needed. It may have been related to how we
parse interrupts in examples, but that changed back when switching to
validate dtbs directly.

Rob
