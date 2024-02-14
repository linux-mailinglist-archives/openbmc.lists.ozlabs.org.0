Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4CD855740
	for <lists+openbmc@lfdr.de>; Thu, 15 Feb 2024 00:27:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZvVb2Pdhz3vX1
	for <lists+openbmc@lfdr.de>; Thu, 15 Feb 2024 10:27:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.54; helo=mail-ot1-f54.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZgkH5Scsz3cBW;
	Thu, 15 Feb 2024 01:36:38 +1100 (AEDT)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6dc36e501e1so3705905a34.1;
        Wed, 14 Feb 2024 06:36:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707921395; x=1708526195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ieRFgVX+l5qNLg5VWXa9Hrv9zNfV92pS7+FucPfjsp8=;
        b=ZjWAv/Q8lBOBzVTCYd44s0W1IJL8Hhbk7p8lN+YK77yvD+fwjMe+uyq1M63XomLFFd
         UYROTpGqAySmIsSvInqBQl6ddtjXE4qxKXzfUDAGNWzbH7Uz5aHKYf4ajhIl5DYj8DC8
         hFjp6hUKKdBsxbzh+sFw37iA12IlXgMldHLXki+udYsZUPMNrHwroqLUasSTTFUBgs6t
         a7s0HUT628VwDoIWqT49TkGCicniRzfYIlyWREpIFD8ot8ozH5XSblE33WjyA4pMplgi
         YV5BW90YGuXx/k2HWbJ6R1acWayZpraxq1fJ5Ua4dBAMb2VKvMNTBZMp6NH5O4Prr+GM
         T3PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVulHtC0esTVjIcZJMmFbSIYAwd0IIIDWMwSSf1Z+fcTDVMf5bMKO1UyCBHrsoeZNCf5b2YEvyzJSjB5BKm/pNi1iy5kY1rX2d7Lne8l6KmZBofJoQnM8WH+GL78A1wVv3c2SsaW33A
X-Gm-Message-State: AOJu0YwoTqJfzZTpfeKJ/TVOpyu1mjhJpwXCgFPFu3Wj93lYHhEkzDCH
	b4MQYIUi8lEnW9gOl+IZ7ACtyK2YZTs7zcLV/R6KIRzX5AaERg/A/HX9Zev3W4Y=
X-Google-Smtp-Source: AGHT+IFdeTm0d/BI6Pmi85U3izm0i4j5tbheBGEdZxjZfIH0H1ugf0MtOP+lJnm/QvJSFlLtot89ug==
X-Received: by 2002:a9d:6f82:0:b0:6e2:e8c8:a80f with SMTP id h2-20020a9d6f82000000b006e2e8c8a80fmr3292328otq.23.1707921395205;
        Wed, 14 Feb 2024 06:36:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW/qkRaKGuXHs3FsNx/DbElvvZz0FAERZ/2hXPOmqMaDETaYWKufo7tSOzrFEc93JFNVsn54xLzzwVMoeKiAa2aQsxrCW2L8Q5yjyqLpwZ40R0krBPEkjqEnSpJVUzQKLqxbEmA2QhW
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com. [209.85.161.52])
        by smtp.gmail.com with ESMTPSA id r26-20020a9d7cda000000b006ddd0bb5a56sm813589otn.52.2024.02.14.06.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 06:36:35 -0800 (PST)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-599fc25071bso3655145eaf.3;
        Wed, 14 Feb 2024 06:36:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVGvQxi4wuCHhpTrBCyaxIwojMWWIveO8qmx9dnjxS7r9nt1p1qsb9BVJha232Nu3mBGufK6/SlYuUC9oXoodVjcHfjTpg4OOs1HWAwif5P1veRvHtyu7GPWezcuJNRraUK21oqDerm
X-Received: by 2002:a25:8686:0:b0:dc7:4546:d107 with SMTP id
 z6-20020a258686000000b00dc74546d107mr2758581ybk.23.1707921374648; Wed, 14 Feb
 2024 06:36:14 -0800 (PST)
MIME-Version: 1.0
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org> <20240213-arm-dt-cleanups-v1-3-f2dee1292525@kernel.org>
In-Reply-To: <20240213-arm-dt-cleanups-v1-3-f2dee1292525@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Feb 2024 15:36:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXjJcsFiusnBQmJg1p-oy-NPmr+qyt0znOk0n+wL8TrnA@mail.gmail.com>
Message-ID: <CAMuHMdXjJcsFiusnBQmJg1p-oy-NPmr+qyt0znOk0n+wL8TrnA@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: dts: Fix dtc interrupt_provider warnings
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
> The dtc interrupt_provider warning is off by default. Fix all the warning=
s
> so it can be enabled.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

>  arch/arm64/boot/dts/renesas/ulcb-kf.dtsi            | 4 ++++

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
