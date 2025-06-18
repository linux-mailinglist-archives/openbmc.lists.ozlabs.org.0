Return-Path: <openbmc+bounces-243-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7E9ADE9E7
	for <lists+openbmc@lfdr.de>; Wed, 18 Jun 2025 13:27:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMhKp5Fjhz2xS2;
	Wed, 18 Jun 2025 21:27:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750246046;
	cv=none; b=E/OA0TkoPaF4rW33JiGjRiN9ugT0rNzYedqKxQQS0PVFPkGaoOT5cWtqOkCLXMUp9ojAPm/JzqY6D5UVveboxvUUcyq3uX20z0WvQ9RAuhFH130ftGoaZAq4VK0d0akyr7Y5K+2RgF7BwscUHCF+0Vr/lJ07qIxznpFnZqp07zjDvlHepyBC7ucVKPFiFp8180sp6p+k4n7j+TFMIBoHtjnKVyA4n9W0fR/rCYRA7MwQjfK0yI3Zio1D3qicor0AHp5CrY5mso4Af37uovA6NF88xh8p9YEP16qUuX7Djc4J7jafwSf/xspDFFVnpT6p7MBbi+8KtyKXt+vSR5DP4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750246046; c=relaxed/relaxed;
	bh=hC/rxmNEx7lBs7LXqlf7wlayqnKtYiiYbKP9iLo7bEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cDnvzzSo5kKfF81AJyIpWedqaHoeaRB6opnaEglthNgzwGrbYG7TNVsqPtJSW1Zg0qqxXdVWnNGuTyvarW72q2DYHYPdF4xSv1IcdaOUhvc0SdwE+jrGD3vDZwBQlOH0BU6gJzzDYdZD/uow4LeGElnOk7iev9EiPhtnehKW8wuPGJcaIzBYqAk/UcbYEioKZec6qj6FzEmin41kAYFnrolVh3ReK8bdsbQT2V6YPy4LluOtg9ugK5nq1Nkp3+WdBtuN6gzXTMMHWobGKeYtBo2c4RgMH3JA2gk9ktbR9fgWLnB5hzMAa7rxSU5KdR8kduRO0wEQ9PfsZjBgTQf6Uw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=u47ObV8P; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=u47ObV8P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMhKn2w4Vz2xS0
	for <openbmc@lists.ozlabs.org>; Wed, 18 Jun 2025 21:27:24 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-54b10594812so7023443e87.1
        for <openbmc@lists.ozlabs.org>; Wed, 18 Jun 2025 04:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750246040; x=1750850840; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hC/rxmNEx7lBs7LXqlf7wlayqnKtYiiYbKP9iLo7bEA=;
        b=u47ObV8Pj7Blj3fgiensixnPrk1fe5wOS8VXef+bBSb8h5gr9/dFmOETXq8sxChAqG
         GYaRp/T672lmKFJIM2QMhkkcmuoOw7HThu+4BBtxYzUwhoZa00D/pyn/RONuYd+23bb8
         Tpn4BCyPTgZV/CRgPUZTrkFf0JEr4otCHXBE4zR418n4uzutYrtaEFtRyEvMlp+Pxdco
         U7jxPU/+ldV0FPCNrErvrHc1rdryJrnxV/9mqNRvXyjDnXkYRmKw20dukaCbU0fT79rZ
         FTDe2eSpSGGjme93qm/QAMTtcDOQbVQce1EqKoydNWYQWCPWdn57E1Jr15d/0D6bkVh0
         orwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246040; x=1750850840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hC/rxmNEx7lBs7LXqlf7wlayqnKtYiiYbKP9iLo7bEA=;
        b=qx0g1g+BArMecDGnu7m24HRgZu88VTtpVqcKAFgkTef47omqNcHa5akK5vQhrm9x5s
         FjUlW6xRV2F8EXUlaWl7Mdc7Llpa2Lj2qXlivjrG8tQ/y6AJxduatknWm1Z3y1l5FzD3
         vf+1eYkjMzSW0Yf0+z0iKO1jVajdTQT+f6ORm1JefYDbKBoaJjInE9X9Vq6+Yq/2Q6Rs
         AupzY1y7G3jpv5oRek2u0TZGfgB7LPAQGPQInXu9/9kkDcgbSPU44SGF8I54st1T4RMo
         TMYuAS3YyQFhvxnaoaqvMV1DXQIDplIYPhLaaE5gWNHRijTZtDL8Elh+9t/FSHgU7C5n
         GKFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtsZ8betaPPY8xRN4PeccxzDu56zymVEUs2dWfzyUXn61lVDltQs8M/cbnAjq7PNwWyJmY81HD@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwUFMiiKFVl4wP0BD5Iv+kCGZTfX9Dqi81lHLqsnH3wfffbBIpa
	CWPmvvknVbd/ixlHe4SENHMbJZAM7VQMDxiqTUZVMPPi5sT/C7LnAoHHsZ5/BSNh9pMZ9Rgee0k
	GLoyT2Tej6LEPnsBmT+mUt7sRNb1HKH4gYIj96t/ZFw==
X-Gm-Gg: ASbGncuufq3Gj9XL6TGqiN/9OJvm20a03S25oczIEYCH0ZzYYGqTcQUgq4tGqkPRuky
	t3hnjPZVEb3LvGmx1ueFHSUzWvIUXu44kz6Bk9V1jQe79gLqKi9INMe9w2jwg+Oxl1MFSJ8MhQn
	n2xcoQ/3QMRJJ+ogUDMnNDJxtiGCcrlfSrNvxURv7OMU0=
X-Google-Smtp-Source: AGHT+IH9N3s8eV4QAoWcV3ZISC8T6rNpJ4leRaY7YHuJFlZ4bPXaxx7Hzh/4jfbIVAzp1tapzbe+4WLXZFpaeF/7BEk=
X-Received: by 2002:a05:6512:39c8:b0:553:2bf7:77ac with SMTP id
 2adb3069b0e04-553b6f15af6mr5016567e87.41.1750246040209; Wed, 18 Jun 2025
 04:27:20 -0700 (PDT)
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
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
In-Reply-To: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 13:27:09 +0200
X-Gm-Features: AX0GCFuhKOslIDouO5PgG3-FBiOJa3cs6VfF8AgbesblIRkK52-2f8uLA9uvwos
Message-ID: <CACRpkdb1YqS00tEeyAUTjjJ-EQQbH5wfE8QzZt-UFwQYCfNHRg@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] pinctrl: Constify pointers to 'pinctrl_desc' and more
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
	linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 11, 2025 at 8:14=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Changes in v2:
> - Add Rb tags
> - Patch #1: rephrase commit msg (Geert)
> - Patch #2: fix/require dependency on OF
> - Link to v1: https://lore.kernel.org/r/20250528-pinctrl-const-desc-v1-0-=
76fe97899945@linaro.org
>
> Description:
> ------------
> In several drivers pointers to 'struct pinctrl_desc' is not modified, so
> since core does not modify it, it can be made as const.
>
> Dependencies/merging:
> ---------------------
> Patch #4 "pinctrl: Constify pointers to 'pinctrl_desc'" is a
> prerequisite for all further patches, including RTC patch, therefore
> probably everything should be via main pinctrl tree.

Patches applied!

Yours,
Linus Walleij

