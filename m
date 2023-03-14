Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D83F76B9EC6
	for <lists+openbmc@lfdr.de>; Tue, 14 Mar 2023 19:40:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pbj4h5QbMz3cMb
	for <lists+openbmc@lfdr.de>; Wed, 15 Mar 2023 05:40:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yqU8MBhc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yqU8MBhc;
	dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pbj3S2Rwfz3cMb
	for <openbmc@lists.ozlabs.org>; Wed, 15 Mar 2023 05:39:00 +1100 (AEDT)
Received: by mail-yb1-xb35.google.com with SMTP id n125so2955977ybg.7
        for <openbmc@lists.ozlabs.org>; Tue, 14 Mar 2023 11:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678819137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZLbfZBYJZUalG8Pgf9iKIORQNcy/iQ3EEtk7oKgNY4=;
        b=yqU8MBhcHxmktFLQXm4CKWSh0xDC1z1LskC6x1EI/1kR5D2cCmrvpKHnbNVEslwvZW
         /l+OZdNBEPYArST2FYfhR7KBJUNiADkGJx2yiReo0uvVGvqIDCoC1ceB86pJ7ZcglucS
         4aezRqI09CiC6HQMVPF+OmzPEKOZ7P3GVK35Uggy14FfV3ag5UrXSiQ24HWCxjRPKMRU
         ujfyZ3PhLrb4/vn7kxqiLcqQOhtksaWVq75a3vNRl2hkhVyGeWYDFrU6KHiw9HSqgYfT
         llZ1OWwUo9TIZgrPoOie5KmhoBj69TUmbuqz9jCY9eQVBx4/ffcKFZ8wTcNpbzJRzLeC
         auQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678819137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ZLbfZBYJZUalG8Pgf9iKIORQNcy/iQ3EEtk7oKgNY4=;
        b=H2cD6TDYQQJc7gVis0FtsCqLK+C7I8HCJ2xaDe2R8SFmUu7VeSgV/aeDDoF9Me/NrQ
         EqY6NI48bj4122u6BVLAp1MgAEc3fR9PSEiYEz0YJZj92UdtKCsv61XAiroUYWKfe2KP
         XFOURrXJV2vEplJIOWO1RFX0RIRDXokZMiupMFvJs6Zfx5srfMXuFML+3SdSganPYoy1
         IW0HEOUZhIW+GsCPYTHcjkZQZUPHiyCvB/lcF+WcYmGwIHJfUzw9DuJ1PgN14Cf1nmon
         REjnVq4CLk9U9aIgYN9DA0Vx7zcvCu/0AUro+zWf3cthluMBV7lrmyBlFHOORe4qxbLT
         G67g==
X-Gm-Message-State: AO0yUKWMqcYo+YHfMHc+DjTlu9R7m7keP8mAtS2mHdeDVl2AL+aSVs57
	+8qIjQ++Uxceo23xkgDmIbsCAfuZef7uUngFlQrAEg==
X-Google-Smtp-Source: AK7set8kQPrZplopErS2t9RwUdCE/2it+aAmOqAC3R5RL0RgJ//Q+q7Zgz6co/2RK4AOYFMEy2dIpArJTNRjeVcL7ec=
X-Received: by 2002:a5b:1cb:0:b0:a6b:bc64:a0af with SMTP id
 f11-20020a5b01cb000000b00a6bbc64a0afmr24178550ybp.4.1678819136760; Tue, 14
 Mar 2023 11:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230314092311.8924-1-jim.t90615@gmail.com> <20230314092311.8924-2-jim.t90615@gmail.com>
In-Reply-To: <20230314092311.8924-2-jim.t90615@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Mar 2023 19:38:45 +0100
Message-ID: <CACRpkda5OHxVajMWaw8cxso_Wjnbex+Lx09Xrbr68-b7C3JVZg@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] gpio: nuvoton: Add Nuvoton NPCM sgpio driver
To: Jim Liu <jim.t90615@gmail.com>
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
Cc: KWLIU@nuvoton.com, devicetree@vger.kernel.org, brgl@bgdev.pl, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jim,

thanks for your patch!

On Tue, Mar 14, 2023 at 10:23=E2=80=AFAM Jim Liu <jim.t90615@gmail.com> wro=
te:

> Add Nuvoton BMC NPCM7xx/NPCM8xx sgpio driver support.
>
> Signed-off-by: Jim Liu <jim.t90615@gmail.com>

(...)
> +config GPIO_NPCM_SGPIO
> +       bool "Nuvoton SGPIO support"
> +       depends on (ARCH_NPCM || COMPILE_TEST) && OF_GPIO
> +       select GPIO_GENERIC

You don't seem to use GPIO_GENERIC?

> +       gpio->intc.name =3D dev_name(&pdev->dev);
> +       gpio->intc.irq_ack =3D npcm_sgpio_irq_ack;
> +       gpio->intc.irq_mask =3D npcm_sgpio_irq_mask;
> +       gpio->intc.irq_unmask =3D npcm_sgpio_irq_unmask;
> +       gpio->intc.irq_set_type =3D npcm_sgpio_set_type;
> +
> +       irq =3D &gpio->chip.irq;
> +       irq->chip =3D &gpio->intc;

Please rewrite this dynamic irq_chip to an immutable irq_chip,
several examples of how this is done is in the kernel, for example:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/d=
rivers/gpio/gpio-ftgpio010.c?id=3Dab637d48363d7b8ee67ae089808a8bc6051d53c4

Yours,
Linus Walleij
