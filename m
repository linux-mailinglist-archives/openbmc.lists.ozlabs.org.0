Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC673855741
	for <lists+openbmc@lfdr.de>; Thu, 15 Feb 2024 00:27:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZvW83tbwz3dXT
	for <lists+openbmc@lfdr.de>; Thu, 15 Feb 2024 10:27:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.44; helo=mail-qv1-f44.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZhGw6rVGz309c;
	Thu, 15 Feb 2024 02:01:27 +1100 (AEDT)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-68c814135a9so31432546d6.1;
        Wed, 14 Feb 2024 07:01:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707922881; x=1708527681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6upARWbXs1k8V4Vnc/YI44n6rxziwjW/OPtXVVY76s=;
        b=n45yioNY7E+MJa2KUh6yS/jgObhRLdrd+a8YoxUF4SYbRfswvNY+rHj9V34ZHnqVul
         Rb2fcbz7Lvx0MddYN5A8QhLLtRkV1PYd/nvWjTCkRkFJHF2TAE/hqT2ca8nmAMnDH2/L
         ZZlUXmy+gbItj8a15kwVKlq9/Go30gh5WItErpsFdTvjP8Y+3Jhqh/oeKLBCgIirz8Qz
         OVm4DKwv1KJKIidpDhNs9s0v/FFzS67ecLNXzVYVH1suQgceIdI74MexqP5YVH6Zqo6V
         vHz92a2MEfKPY3M2EwFvP2pC31NUWsAq5XS0q1S9oV7Cl4EBXYTcQCxlcGQBWF0JV05a
         /niw==
X-Forwarded-Encrypted: i=1; AJvYcCXGUbj2S3OFIlXfJbPYS9npLeYmUjDEP678FKQMwjreQ5bmzy1X75yBeslQ5C4XpIzSfUbd4CosTvJ/+Z1oVRtJm0rIuePbpn6Nu7hBA0MgDAN5EqMy/GiQqtWbJEJ3H7B2Jw/9yCxY
X-Gm-Message-State: AOJu0YyxdCkhHiBS2kqRd6LAJp4ssBBMIBbHoHclOJVI3nNduh13kgrP
	MASTrmDJikG8NJeHzE8aO0CDkO+1ARqPzAnYaFMMCu2K1ob3ZCoaD/dUEPv7A1s=
X-Google-Smtp-Source: AGHT+IGvcPZwwvwaIvTW3LvN+TG1B4wgM7a1huwD5a6lDEB5jT5rHT2qjoaVds6rYpBtX3aId73OEA==
X-Received: by 2002:a0c:8b1a:0:b0:68e:f0ab:46b5 with SMTP id q26-20020a0c8b1a000000b0068ef0ab46b5mr2531601qva.62.1707922879805;
        Wed, 14 Feb 2024 07:01:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWP3W2vYtfMb4NbaC15gDeRPprJ3HYvWrF5AQ1d6zelRhcgqM0MiZSreeUsSAMNrXlgbJBN+xw7SjPCNVr8vwNxYBB1K4IufKKPV1WumLhKAa8aHY1Oqfwt8JzcEVb66gAQr0HACYCP
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com. [209.85.160.180])
        by smtp.gmail.com with ESMTPSA id mv5-20020a056214338500b0068e540c8ae9sm2085846qvb.59.2024.02.14.07.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 07:01:19 -0800 (PST)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-42ce63b1d30so22400841cf.3;
        Wed, 14 Feb 2024 07:01:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVj4+PpmI3NKZssb+MJAsAjDyFkRX2ej6WAP4GQr3cGq4yvH8b6iPT2MsUPRrw9i+Zn737n+zhvnYVT4NsMVoVR7PhosIqAmMDBPw1kp/Sqb8q1CE8+EoSBd8eoAdcoY3gL6cjhOwX1
X-Received: by 2002:a25:84c9:0:b0:dc2:3fbd:82fe with SMTP id
 x9-20020a2584c9000000b00dc23fbd82femr2322270ybm.46.1707922857034; Wed, 14 Feb
 2024 07:00:57 -0800 (PST)
MIME-Version: 1.0
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
In-Reply-To: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Feb 2024 16:00:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWgvD9szXksK+jzyvwLQ8ufWWf1TPQ7s-5z4JWgrvXmkg@mail.gmail.com>
Message-ID: <CAMuHMdWgvD9szXksK+jzyvwLQ8ufWWf1TPQ7s-5z4JWgrvXmkg@mail.gmail.com>
Subject: Re: [PATCH 0/6] dts: Fix dtc interrupt warnings
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-aspeed@lists.ozlabs.org, Tony Lindgren <tony@atomide.com>, linux-arm-msm@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Stefan Agner <stefan@agner.ch>, Chanho Min <chanho.min@lge.com>, Thierry Reding <thierry.reding@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Nicolas Schier <nicolas@fjasle.eu>, Bjorn Andersson <andersson@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Magnus Damm <magnus.damm@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Joel Stanley <joel@jms.id.au>, linux-renesas-soc@vger.kernel.org, Linus Walleij <linusw@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org, Maxime Coquelin <mcoquelin.s
 tm32@gmail.com>, linux-kbuild@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Nathan Chancellor <nathan@kernel.org>, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Imre Kaloz <kaloz@openwrt.org>, Scott Branden <sbranden@broadcom.com>, openbmc@lists.ozlabs.org, Antoine Tenart <atenart@kernel.org>, linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Tsahee Zidenberg <tsahee@annapurnalabs.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob,

On Tue, Feb 13, 2024 at 8:35=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> I had a branch with most of these changes sitting in my tree for some
> time. Geert's asking about some errors not getting found prompted me to
> clean it up and send it out. This series fixes all* interrupt related
> warnings and enables the check by default.

> *There's a few Renesas warnings still Geert said he would fix.

Thanks, fix sent
https://lore.kernel.org/r/a351e503ea97fb1af68395843f513925ff1bdf26.17079224=
60.git.geert+renesas@glider.be

>       dtc: Enable dtc interrupt_provider check

>  scripts/Makefile.lib                                  |  3 +--

Just wondering, can the remaining disabler be removed, too?

Documentation/devicetree/bindings/Makefile:     -Wno-interrupt_provider \

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
