Return-Path: <openbmc+bounces-258-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8271EADFE74
	for <lists+openbmc@lfdr.de>; Thu, 19 Jun 2025 09:14:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNBg64Xxgz2xck;
	Thu, 19 Jun 2025 17:14:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750317250;
	cv=none; b=Gmc+jCTqU+r+6LyJNz3MrR5KXtJByHokD0BlLVwMJ9sHMV3CUWiWBXH2TbVlItt8r5mWlKhYWURB7F3k4b4mJaX5KpLh3gcAfF0wD1NAbzKP5WQSYJauXNxMeLAzC8rLARjcQQRPQXxxuAdFn7/PxhHlMFYnReslfLdiRy5IIncGz6NrG1fCwIxrBz7YKZywZfToEKI2Fs7tPnr0JYP6uyUVe6wP4IwnjnYi0M47YpYJJIWkcUz7SIiiJsOaW1OVk5wEmczShxl12krMn2nfngB3sa/Gyx2Y6ss4Gtnj8OMXIvlEbr26Yb2prB7jWxYl88zy3JGdSGZGSP9BbeqIxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750317250; c=relaxed/relaxed;
	bh=cq44AhL1m8zmm2BXeTzju6Z4jxLaMdXtrDcTCP3h0bM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=etGtm47jA9dMB5+pQtL6I6+1QUAlP3yn1bIz0d8BE2e7tz9PB20MeXoTRmAHYX5a6UiT2vmFfGmzfc++k9COaSsZRcpIdNdncKe5vK1D2cPimzzkYreVQzsDBufeJ9E+/5rG4J6Lu7gF4IellzxZcuAkFBom0vXKAlsqJfb++kEuX0U7gwNRaP7X0jMcfAw4sPb7L9D55OXDvdhCrOBRiCwA8MjQzKPGQIgjWKmEkx6MmiL+bUMtgc5K6T2LeAfyt1ShIEkzxCiWNItuSXn7Qn2DPU27JTV0RXMhewSsSDelNgyaUXNlr36Ht8mRFg91oLyH3KaA7mjZaSrAYh7/4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=HcJAojWW; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=HcJAojWW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNBg45yD7z2xS2
	for <openbmc@lists.ozlabs.org>; Thu, 19 Jun 2025 17:14:07 +1000 (AEST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4530921461aso3427305e9.0
        for <openbmc@lists.ozlabs.org>; Thu, 19 Jun 2025 00:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750317242; x=1750922042; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cq44AhL1m8zmm2BXeTzju6Z4jxLaMdXtrDcTCP3h0bM=;
        b=HcJAojWWMEVCg/IETup+Y/AAGPWMB5qeyziXTbhRdcoXUZmro6Ky/OMAXnDz2qZqFo
         AwspxmaYNGXkxpj8zTK1lLMVM0B+k5cOMS9gHc+iAgHJ+QCW2RLzYx+6VXaau2t25X9R
         MqGIkOnWvsHFveQ99iFbccR/wb8LGMXhXp3zG6UP8MmIhUIUo3uwziKo2DsxWmyVgqeJ
         /iwgSdXT1saBsNZGNlpU9f/AwtIfhwg9AKISkwPRDfBaTbYdFvUxli/zfHs6vxnfqRwy
         9Ujpb1xOK0kWR8w7W1tlAJ+45Ofxuxbaj+XcnlzY7dykE3cB+nhKAV9vB2DYzA7gwTeX
         gYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750317242; x=1750922042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cq44AhL1m8zmm2BXeTzju6Z4jxLaMdXtrDcTCP3h0bM=;
        b=YhQPZQ6qPO/+A5l3dXN51kQwddJ7cqEbGSRfEzEB9sHcJpssvenYDNvWehjsJpSY3m
         84Xwu90b8mDBtwRfwc3V1RiIScsBzmjmxv1WmQ3V5jwNSai4k3V4klOCQktGiqKk5qqQ
         CoxLKhzgx/fI8LFUFQxGA4tHAbND32pmF+Z+DrAJH8ewNxfe/jcw1Y9lmK/PqaTojn+k
         RNrsOiPp2GFULGg0MEmXwmHbVhmdPiNrOvm6E/tapgDZGIWt1UaGoCf2NIQny6j47TDF
         csQ8ecDaVTU94enZLqGsSUWW9ZS5vupfrE8aDDs2xAJhizFxJxRmy3HED01r81I1UF3L
         oP8g==
X-Forwarded-Encrypted: i=1; AJvYcCU3k6g20b3sWh7uR4eKbUeeYtzQ/iF54KBqAl8IS3DgKteCphlrqJlwWWNZYFxMsAyJgtaY3pZ5@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyGEcj508IbCvmLgumamzTqiVtMwJSDPcVRhggGN0EiC2gX+a+z
	Mhlarqh8Fn8MTl/vQsNogaOlgr96xsJVMdVUpKnyYIqxwJYiwo7Et/iGBarfxvPLAoU=
X-Gm-Gg: ASbGnctBrgNhK6QT4A00etj8A7eEgZi9bMotsrqP+PkU+Enx/N8c7Ul1nGa1CZ6M+G/
	u0k1ZzkzAQtwwR6w/RpNBE/XtcGIVSsmnwY2vXLW77u2n6Sz1MXYorKXNkGqJcUXvhhXvHf4Jdg
	ZgBnYomzgOV/XFbPSBtzDqe7g5RgyGQMm9/ef4bfxmopOuEwJiXm3T6wR3aS0xHReqEaYDxWQwX
	mivyCkvPF3vclZpGya2xdyNCPH+VmOuxfb5VlU+N3FEy0HKe9pO7xlHsCkpzg/VQC6PAD6RxfnC
	CEEJZDHvZxgyXPBBxWq2q1ouUIawkhQQw1PJ1Tpjep60PQuj1GLY3q5O4dS3tleHfNabO9tB/Q=
	=
X-Google-Smtp-Source: AGHT+IGlNantl4wJm6RCvWBimekXrYP8rB5NeN1SXtm5TjP6e7AZBjb9h39LOn+KDLomqiXHR+OvRQ==
X-Received: by 2002:a05:6000:71c:b0:3a4:dc80:b932 with SMTP id ffacd0b85a97d-3a572367dd8mr13904267f8f.8.1750317241916;
        Thu, 19 Jun 2025 00:14:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b087b4sm19153422f8f.51.2025.06.19.00.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 00:14:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Klara Modin <klarasmodin@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] gpio: fix NULL-pointer dereferences introduced in GPIO chip setter conversion
Date: Thu, 19 Jun 2025 09:14:00 +0200
Message-ID: <175031723753.8751.12135495432904618963.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250618-gpio-mmio-fix-setter-v1-0-2578ffb77019@linaro.org>
References: <20250618-gpio-mmio-fix-setter-v1-0-2578ffb77019@linaro.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 18 Jun 2025 15:02:05 +0200, Bartosz Golaszewski wrote:
> I should have paid more attention when doing the GPIO chip setter
> conversions that there are instances where the setters are accessed
> directly using the function pointers in struct gpio_chip.
> 
> This is not optimal and I am making a mental note to track all such
> use-cases and use the appropriate wrapper instead. For now: let's just
> fix the issue in gpio-mmio and its users as well as one other converted
> driver that suffers from it.
> 
> [...]

Applied, thanks!

[1/2] gpio: npcm-sgpio: don't use legacy GPIO chip setters
      https://git.kernel.org/brgl/linux/c/1fd7d210952938e8ef6d87287e056e25a2fc0547
[2/2] gpio: mmio: don't use legacy GPIO chip setters
      https://git.kernel.org/brgl/linux/c/cbb887a76b788d8e9646fdd785f43745a3a662bb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

