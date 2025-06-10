Return-Path: <openbmc+bounces-156-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC0EAD4578
	for <lists+openbmc@lfdr.de>; Wed, 11 Jun 2025 00:02:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bH2nm6Znsz2xHY;
	Wed, 11 Jun 2025 08:02:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::129"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749592924;
	cv=none; b=Cx6yd1GgOctkNwcDuSyIGTDz1ydbw+/KXRLCoA1LXz/AuaS6D9+lQzpHI4PIoo3kzQEDpRbwwnwxZp5arZmW90PQzcMvjwNwZKcHgQeY2UevmyLWaD2MYmgo54OsMK3NreU0uybOdB4r3T+frc2V+4Tkd8oO1LdHqiJLbSF9ThrBgB4UoZP3stBx3KK6tpypGc6eUlG3guF2voNrOQ5fBt4AvnG8EhOtVfVyReyOjyeLCx9ImA8QSjpq94ueBYws8xwW9KHRQpNbrfQA6Rv/xy1bYToQ/Lo3wvV+5FqBWK/AxpmkoROnyNEvHFEXXeqP9M637cI+UbFTtWg5Bsgz2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749592924; c=relaxed/relaxed;
	bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GXNCBhtHElfdFPK5eBarDg4HpvDJ/xnJEN4+yLqYPL+EWpcedmIwy1T/8qL/mLQqAeYnMbDSN3rgDXOYckk7G95KQf9bmGJggr2davFxhpcbvLl1oOX7UwxoD2BAM+3jXhoqa5FIWYHNZA3x6LPrhVrWEJtlza6QNLZ4Djb+Pb/oCqH02TCGS3cDoWqGVvfbnaHjk6STn7gAv6sXePmHxom49e9FO/ANREkyoYqmxmR6u397gHgqRwLiaZnxgFr3XBzOI5S07GOLjqizCTvQb9TtA6qM4BUImg3hwoFxUoQJ+9CMmGxt2QEq9MyU8QB241FC948yHvHy8lPpq6XLRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mo//6RqB; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mo//6RqB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bH2nl4mSwz2xHT
	for <openbmc@lists.ozlabs.org>; Wed, 11 Jun 2025 08:02:03 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-55324587a53so296717e87.0
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 15:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749592920; x=1750197720; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=mo//6RqB+Z+glNO6HhzVj7b42Oz1ZmUAitLGtffKVvnM2T4THoP1wge1AuCCJ9uHhL
         9Xf5OifjCZMVGdbpHv1GWvKsRHTm4i4RDMIGBGi2aFyV4QBMv2phOUto1tm0/mqOJghN
         v/GifCM7QmvYCaPbWgRkflwrv5EhJ0LVezkT6sI7G9aVOlnj/+j3SXSrhMMnpvkeogQT
         tt/UlRPJf8ymJvM7gcZrqNPs0lDIple8jpsjcHpX3qCGHrtHpxrBh7RuKEEQNjXDFwbm
         X9A/KC7WUcEjJFQMKqRGQHhA2SRzhlGFxRb4ztI5X+shj66XdYfhMa8tv3zKIk5Sghlk
         yBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749592920; x=1750197720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=WrmDMqPuevF8kwI/+sPDCaKYGXlKcErFBv4MTppCmJBymfg0tiLyRM60QGSaG8oJRL
         tNcGE1kgqMjBg3wWMyhw0gMa7a89r4NaYMCoM31Qs2dtuIHf+z8S4WZRFVg09Ma7cqbG
         Kn+THyqcDym08JtNnXNtiCcPlb4blifIQI/QPC1krnFSN8dFxhQR0MFS1c5r7bLzbzgM
         PG6yW+Woxvc7mjt+2Q8e+DFVkidwMo6yGNy6XtiECrI29AN4/1T07Lr8fJOfEH0EESBs
         yoko386b3gCxfqRF8jEhgOEJLp/fFJVpcARCKRcOSIderkwQ3GgjnvaZh/gQmnSYYDKH
         S4Rg==
X-Forwarded-Encrypted: i=1; AJvYcCU1HIzdJ4sYVvf2oaXvT0dsQgKFtuuOOQ5YlLrn4PSGLeltvZ14UcUD2NquYrSCzy80sGtdrcbq@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwCR9yXsB8jdFHs9LoZ9ecSfx4pMdjQMFbwvzu/FAXm3Fcy7L1c
	mtDcLo2HT0nv7PTVt999KmUBUTwdwiOd07B9yJSayz5pEbMGWQesCA5v3cLyUjtA11WFaOyeliu
	w7f95riuirjB2mwSaPW0NhfbMl/Mc1ATPwqfspvO6dg==
X-Gm-Gg: ASbGnctmtqC3+s9RP++35SfjMjcPiBloDlwXZfsn5blmqg0Uy1aQfJF5JIhBI81D40F
	NXCAoLAjcPTZDd+t4iEnK/JV+QHarYzYJskMYuw7M5ZxjTmNob0PostOv/4bHpSEUAl39a5KR+J
	jtbdlql0aIr91KzB1b3qzCRMryuZlfxatyesP5Voa6iGs=
X-Google-Smtp-Source: AGHT+IHHOhOUj30OWDDSx+2F42g2fLc3I9bcRSXhW2UcQzuablZdDsnZ46Wc3GihsOmkn7ZczCyHo2K03K0tk80OU04=
X-Received: by 2002:a05:6512:1504:10b0:551:f166:bbb with SMTP id
 2adb3069b0e04-5539c5ff09amr174150e87.13.1749592919907; Tue, 10 Jun 2025
 15:01:59 -0700 (PDT)
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
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org> <20250610-gpiochip-set-rv-gpio-v1-2-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-2-3a9a3c1472ff@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 00:01:49 +0200
X-Gm-Features: AX0GCFufuH4LiWDSgWF_9h-zk6BcvJ0Do0hqFlGAZPq_9bZnp7tz4BcqtgZHIfw
Message-ID: <CACRpkdaK=Ua0=Jgnff4xXxVx9W=LcLg7RykR7CozhqtAb+8XQw@mail.gmail.com>
Subject: Re: [PATCH 02/12] gpio: mm-lantiq: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jun 10, 2025 at 2:33=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

