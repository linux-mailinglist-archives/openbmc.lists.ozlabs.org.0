Return-Path: <openbmc+bounces-136-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B6EAD3646
	for <lists+openbmc@lfdr.de>; Tue, 10 Jun 2025 14:33:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGp9h53qJz308P;
	Tue, 10 Jun 2025 22:33:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749558808;
	cv=none; b=L3Znctv6CULvPPxoeDWlmJGVPhYLrlPLgnKqtmKOgm1lRySVVbH03/cgzmMQs4bzmNiwbZA8RoypMAia+g9/76I27c3uhXLKrqYUPjtlFSAADi2CtC9+VP1B3VDP3qYESMHAjWXErXG+qjvLlDB4F/J6UpCRk7IXfJBpqM7l751F9MKA81lprgyhsfSJW+g7pXKdLK4LEV0KCs1lCxg31CieWLRRCr/L0Xto71ZAG5m9BxeHFVhDpHr9A9GWjDjbu8fZwhiikvdt8X3aTV7oqE+/Zzk49yKVhlvZ60gTLkIE0+YtzeNhHRxNVxVu1PO/J8vKF3jIun8UkcR/88hfbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749558808; c=relaxed/relaxed;
	bh=ZhzmZkaOysW/GCSYD6XdHL+fOaPlZnqEL0PQsaxb3p8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lIujVEbX5aReQQ76AToHGWfPyfKvQUj/g73IRWwX5GqUOHGsWEcz8p1mmnCDfzH+RlpTHZEcDTMlgT1uUvEV21iQ6Z3Qdgw4ZYFxQcZd52JaFpXdsZgEZrhx124YvMw5igvl0nZQBBQ6JYrUuwptHij/VcMEQtD4OA3BIZ30OLi4h2xqvUypmFjLVa/wncMBti/ABNSLmig1CrnEH1mHyCpUi1LKt0Y3nyfk6W/Aflv+YDaGxWQHZXrrP4iHS5aN34Jk0AN4EhI8R/Ubz+QqA2Y5QYv7z+D49gO7vzJaeAtcLxG72rb94M3SiiwTr4iEHpyTlZlcJHnFfDbA3/fB0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=2mzdkGuM; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=2mzdkGuM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGp9f6ffpz2xd3
	for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 22:33:25 +1000 (AEST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso34045355e9.1
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 05:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558802; x=1750163602; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhzmZkaOysW/GCSYD6XdHL+fOaPlZnqEL0PQsaxb3p8=;
        b=2mzdkGuM4VD7KFHqXbF596fGMEwoCMnjHVHYH3LMXk/rBdHDo0uw9ga5WE1BDd9yBb
         9F4LcJ1Mb0akXWQnihXSjVm4cSUgwyyQADXrQSgEbS+zhwrPnm+dOlRLNt0hAvRNvsiK
         0yX1/6A0Y3mE9NcmNLKAN5Qns6vmCS8RUqalX7rnNMMdO2ekuM0OwLZnYoDdyj93Xmao
         XszlXCZ1bIqcSROJxx2DQTw0d1snOAHIHWZmZdA+OWE6QcyUo+4h6SxyWFxFSnuiDdOE
         CuJ8KRBFqQAmimwvBE0/m4TueeumnXCTtZQoKnWONLPjySng1DJYUH6kgSpVMip75Acy
         pWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558802; x=1750163602;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZhzmZkaOysW/GCSYD6XdHL+fOaPlZnqEL0PQsaxb3p8=;
        b=Q6eaUntFYXtwhcesdVuZtx9LCGMz9a7GIfncihk2Uh6pJm6Gupgk0OROZdfr2rg2F8
         phZj0ORQZeNPO1HNH0hdWPw00+7BkYNEDRyTaRlVdG6b8/nbqbI0LMyyI0g2CtJb61F1
         KcwG/Z4SGcqzxLtIekZGWZHksLnQaq272Oz5DOFPf34P1IhtfOHToFPb0tpnuh4u//Mx
         QT0RzLOPRFB1qjFt6SdgQB3fmqHldTM5BUrPRnSyBG/3LjuLqjZ3mpv2beKpzdC6mcHh
         M8b0UuRj5+gNMRvFibm85NPbkc7JpU3HUE4RYyLRdvyxas/ZRFxqtC40py1poEUD2J9l
         hwXg==
X-Forwarded-Encrypted: i=1; AJvYcCV7d7KldqKOuMa0CbepJchFqIqJkeOJxCs2FiqLuaD7UuvGpiLy+Wym+6ZP7y1VF2y9+QWI9gDl@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzwrx3QHz+DGTTBQAnP/x0QFlrXozFb+l858/DrFV2wTXKLZRUR
	tO8GPOh23qQBeGA6Gavnn6cIKiQD0LGdRztHQq7u8RS8uVFdVCfvgrcO+RYkmJgH7ec=
X-Gm-Gg: ASbGncuWruU/H09qErAEl4DhPWTVgGSoEIhiGiTNyHos5UzPgJP2ghWu7RqBV8lEsnl
	Ko+w55/hZQKuD2PjYo6h11WnZMt3avf4XZbkVgZFBcldIEoaroFRN+zh/kV9xSHvmsplBXPSufW
	kjwD5P5HjcOtiXnOjYpndHdbkCaqZvbBSe4fWLfyhEG/J/ADIT3Ke5+sXUgRJuUdKbpRPs9gAQo
	LVu8woaZaFjqV3pCmNHA6PHwMmbs25jlG319ZaBi2+dQubOHsgcMyxdMDtq7tqYe+pl98uduUgv
	NUW8SbonTi4RuGb8TlxWVKnWE/hI2jpWGEXB79zYCPXkFcjk/uN3jA==
X-Google-Smtp-Source: AGHT+IFlnKIx2sPK6MrXH51mtosjIEJBmZxPRvw+nyl9XpBpBAq4wOuT9n5DEtW3OFTtEqksbAo5Kw==
X-Received: by 2002:a05:600c:1909:b0:450:d019:263 with SMTP id 5b1f17b1804b1-45201437502mr155154265e9.18.1749558802123;
        Tue, 10 Jun 2025 05:33:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] gpio: convert another round of GPIO drivers to using
 new line value setters
Date: Tue, 10 Jun 2025 14:33:10 +0200
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAYmSGgC/x3MQQqAIBBA0avErBvQAYm6SrSQnHQ2KhoShHdPW
 r7F/y9ULsIVtumFwk2qpDig5wnOYKNnFDcMpMgoQwv6LOkMkrHyjaX9RqMWbclZp2mFkebClzz
 /dj96/wDxMn9UZgAAAA==
X-Change-ID: 20250527-gpiochip-set-rv-gpio-5071a2dad129
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Grygorii Strashko <grygorii.strashko@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2048;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=fWmHYF76bW96bFem7JRqwAgfxRBoy5ySHaPTeItooXg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYLDKKT/3+Muqt6vpoLhH2yAyeaiX8AvzjKc
 lz6bLAcJ8CJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmCwAKCRARpy6gFHHX
 clG5EADX3eLse0M6879cp/rXFPzvNb0m0LUCg25b/7UyMAlntaEe6vfqpVdDnOymoShonFCkXzv
 UAW5igUaY4Qv+2V2lp3v0/nKaaYeJrOCDfUqrVQOxgrjQbfGFE5/gVuucblr0r0CSv06TL7XYn3
 95jvOjxXJS1R46cvDsFOvc8iY/Ysk5EE2kaHqYX1Zez3Fxe0j+P+AhjsjUgxExgTaYkgj9X9zLp
 Iu+nAJxFgnOojFHrmzm9mK4lntAhEgFQO/F1JWyaM3iBwo9mt6sM1y9VSJTI7BPRFEKas0gge/c
 +WO+kKXAYEQ6wmlUILezREVVJGDIx+bRxn5AIWBFuOd/Z3PfayT5w1/Y9xACMAhzLxl9yx5XesP
 nrKUhNloMEin8f0em+DkP0y8cvuSlidQRetWsqPNH0toyKsndjNNLfj2la3e3jr7a+jT80cJPNI
 1Avz+GrNf2pfgD4bWKTCV/os10gXRX886aWYB597vDmJtcg02a1ir2uHO7jVDLBeCnTA70tWjZI
 N5X9rUNrlBfLU0A2y3Fuu4E2H5BoAFR97vPSCLg63FIrfsm7vPc6BLdNICULsKJ1K+aw/vp9fWi
 KLUZjmJAwGPKjiCr8Wsw4Awh8QL0olPep0PXVM0IxA58xDrvoZkvlp/2/NT0SUetVd8mNoJ6G8j
 rmFYfB/NS4+mWZg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts another round of GPIO drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      gpio: mmio: use new GPIO line value setter callbacks
      gpio: mm-lantiq: use new GPIO line value setter callbacks
      gpio: moxtet: use new GPIO line value setter callbacks
      gpio: mpc5200: use new GPIO line value setter callbacks
      gpio: mpfs: use new GPIO line value setter callbacks
      gpio: mpsse: use new GPIO line value setter callbacks
      gpio: msc313: use new GPIO line value setter callbacks
      gpio: nomadik: use new GPIO line value setter callbacks
      gpio: npcm-sgpio: use new GPIO line value setter callbacks
      gpio: octeon: use new GPIO line value setter callbacks
      gpio: omap: use new GPIO line value setter callbacks
      gpio: palmas: use new GPIO line value setter callbacks

 drivers/gpio/gpio-mm-lantiq.c  | 12 +++++-----
 drivers/gpio/gpio-mmio.c       | 53 ++++++++++++++++++++++++++----------------
 drivers/gpio/gpio-moxtet.c     | 16 ++++++-------
 drivers/gpio/gpio-mpc5200.c    | 12 ++++++----
 drivers/gpio/gpio-mpfs.c       | 11 +++++----
 drivers/gpio/gpio-mpsse.c      | 22 ++++++++----------
 drivers/gpio/gpio-msc313.c     |  6 +++--
 drivers/gpio/gpio-nomadik.c    |  8 ++++---
 drivers/gpio/gpio-npcm-sgpio.c |  6 +++--
 drivers/gpio/gpio-octeon.c     |  7 ++++--
 drivers/gpio/gpio-omap.c       | 14 +++++++----
 drivers/gpio/gpio-palmas.c     | 15 ++++++------
 12 files changed, 105 insertions(+), 77 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250527-gpiochip-set-rv-gpio-5071a2dad129

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


