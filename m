Return-Path: <openbmc+bounces-428-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EA2B20CDC
	for <lists+openbmc@lfdr.de>; Mon, 11 Aug 2025 17:02:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c0yXq2rkRz3dBd;
	Tue, 12 Aug 2025 01:02:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754924539;
	cv=none; b=m+DjI1yTPvmjMUaR73Zx562ZSg8QyD7xK2JhgraeO57BQwhMrO2KSuDp6eYpjCBTYQZqeAM87zpeyaaBl/IfBC+gBVyboJnJ+id2DLFzp233FMEFOZxWrVn5/C/Rqv/A10arRPPje1B4HD4K5hfJa7IhI1Kd2B8fbw8vOZaekpUKKFSkaZOUWtKR45Mf43oSfD6QUYLItU8/UsuTNBwHXGLo37stfFG5cyfg3Of0DXyur1gEpSGjpeD4Wejj/KW956XPTfGYN5j3zaZI6MJq+cdb8r/1/MKbTbbcoKt2lZK6FZPAz3XZkMuyuLubtosmKY4PSsgeq7unizqFsBr8fg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754924539; c=relaxed/relaxed;
	bh=zWxxJB41GipbzcLM3187/KnwqQo0+hqj/Nc5bwMNpJE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XeK6P7GkuzWxvghslBW9eCCZ7p+9Zyy9R7c2l0GsI5UkmwFRGDVY5cGzfOn4SaCB8Cuzxcn6tzeOQKn1hw5JiZAHDubhN5NrtFWT4vCvBaPpoAOoWggVZy9IECiIIv5PpCWTWAwpw+0aK/OTckBYRAjPRDUlyAW9YybrLdP6GO0nAhrtj9hBZi45gJBOjcGL506U06kk5SJL/OCFfxd7BxPGl+fUv9m3fbBXVxQy71W9YKo2NdAiAzrtVcQEjQGY9loTF74P2pyRDFa/u9oVo39sU/7TJOyROoBSM728sLgU7INOyllRueKbOlAdheuWRIOT/2xE1tiQVHBqIdM15Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=jPDHm+QZ; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=jPDHm+QZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c0yXm10V3z3d9W
	for <openbmc@lists.ozlabs.org>; Tue, 12 Aug 2025 01:02:15 +1000 (AEST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-459e7ea3ebeso16887235e9.0
        for <openbmc@lists.ozlabs.org>; Mon, 11 Aug 2025 08:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754924527; x=1755529327; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zWxxJB41GipbzcLM3187/KnwqQo0+hqj/Nc5bwMNpJE=;
        b=jPDHm+QZ+wnZkRNuKrtQXe8LM47WnyIAIgsq9Vo/LxSShTfjyvh/77qE3kU9L2zvP3
         arZVCJ91xAKT3NyOuyJIRi99TH5tKoB8FIA8zt3XOL188Bl67h9bjFQ0rd3qeLLo0JXg
         9sZ9X8csFkpduaHl3HL5QQUPNoV7f+nb70CEIaV3rYi8KqJ5ROgtNg06BgsngLsZS8fx
         D/jwDvxE+G+krtJz1YEDBneeSA8Ay9p5juX3kZC+l/r9yRgUNwygAhsJ9sCKnbsFQ/Qz
         Fj6G4SokiUXVAakA01MoeXQGFJiXPctDbzDEZs4CojLwEQIyO5VvvgTqdI1q95JurvHW
         YMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754924527; x=1755529327;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zWxxJB41GipbzcLM3187/KnwqQo0+hqj/Nc5bwMNpJE=;
        b=hzW5vUeiA4qoreZuGj9XcLM5kc6xN3oW0xi4PnC9qpw2Dlsr+dXWRLujKDvXw2vw5a
         wsQ2uACWgqOimLSNgBqcz3RbD3VerY7h8zHmsSg0QjKCs11CCTfgqqkK4Ju2pk+jXcOM
         4nZtzJKxlYfhQCoXiyvlShXUXDUV7hB0RVl2vEfqvZZJc89KE/E0K1AqM+8r97rIhBQU
         gPE3fQ+VALAIDdfs8QTAe8SSeC9C4PUEm2gZNYmVER9ObB3jLoLO89Bh84p0Ud7T/aM9
         cr3hjt6TYGCaJojeZ14EPX7eVYw8Y+xWhJsBOsp5Rpz9oV8ZhXUFyuYxxHrAHgbYtO+K
         gWlA==
X-Forwarded-Encrypted: i=1; AJvYcCWob7PbxGRHPk8xZsPDzmERd2z3TlLFaaVJoKMfCKPAVhM4MuXhEK7MpxFkpPoTqit2BkgKWFrI@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxg7WnWKm7hP4NCPOeWFjYVYb01nEdt6nMK9fCk6KKwBpx6WjFa
	IN7UVpFWB3xJkSJj0S0dTK9pfH6KIdKmNFt4J1zpmOe3QYtD3c8ar3jhrtf1C73n0j3ieS/B4zP
	0+gwR
X-Gm-Gg: ASbGncuWmTii8dc5T4Zlb1DB8jYgX+VDV3VxQ4Zv4bxktJEN3bkvtNZK118VSAwwmmK
	jEQoCyfQIXwrlolBES8rF6ZxR+Rjjx2ijVkkMKV4M4wMmVtDetM8/uGvzavyeKW0aMUHqQl7z5e
	JLfY0kn2mBwoi+cFz6odckQn0Puov8QStIk+fGhQ8o30R+P/AEjKE4gJGUSTvLqQrgflszUzCMF
	vqGMOpA5pxxIBj+jHHJduORmu4oIK+10V94j1JqYo2Ck39A+KX69rXfCK6ALGcKI9fIVCcfv3yP
	XtYIykZutNZMq0bRGGI42iECCqOlMhgh1H+6DLpPKuWMaIXhAs/9q9nzoC+XExo9IbGC0zrYOye
	Ej56iazktdMfLzGXT
X-Google-Smtp-Source: AGHT+IHYAg5/y7zzobnnTviyWJZ1QSB220ScxMwZP0hCZAAL8BDUWTjluWnaNcHujIv1yztB2rpJiA==
X-Received: by 2002:a05:600c:4f91:b0:440:6a79:6df0 with SMTP id 5b1f17b1804b1-45a10bef8e5mr117525e9.22.1754924526966;
        Mon, 11 Aug 2025 08:02:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6841:8926:4410:c880])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459eff7918csm192649605e9.25.2025.08.11.08.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:02:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/5] pinctrl: replace legacy bgpio_init() with its
 modernized alternative
Date: Mon, 11 Aug 2025 17:01:59 +0200
Message-Id: <20250811-gpio-mmio-pinctrl-conv-v1-0-a84c5da2be20@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIAOcFmmgC/x2MywqAIBAAfyX23IJJL/qV6CC62kKpaEgQ/XvSZ
 WAOMw9kSkwZluaBRIUzB1+laxvQu/KOkE11kEIOYpIzusgBz7MistdXOlAHX1AZYe1sRD+Shhr
 HRJbvf7xu7/sBAPmAOWgAAAA=
X-Change-ID: 20250728-gpio-mmio-pinctrl-conv-ad0ff8d046ec
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1404;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=o4Eo/zy/CDLQ6xHxEmWPUQyDRccG1SfxWwIAZkyyDsE=;
 b=kA0DAAoBEacuoBRx13IByyZiAGiaBeig651OieRFfC30/uCVO7y8iI2KgimJW4RKqVTdYrjxp
 YkCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJomgXoAAoJEBGnLqAUcddyU4AQALGs
 Woi59UlCQe+wBauzsU3IX4K+sRo+vEk2S5EOlNJTfDlw/+bxQrkKLPpVFW2papWzPwvwfKoHmk2
 o2PkOmUxcL5/zR3kV5czcj+EYf0Mo9Oo9EyP5zNHD42fuOai8TqncXDUpSRiNeWemMBVI/tqXEo
 S7wG6bfTJQWhZydCqJrktOIPmqp/94FlLd6Gdb/gDJDsbcotGrzqmVbfwCVZpRcEschG+8Cs1l5
 XupJgXz7MvXDzozY6innrdxmciMCCdR/i+mbWA36pxXLAM54PNTG51/1W7kqh8kAVqki71SKRsn
 NEjPtM7HRTWaYBq2Nvq0eKiReBwgq4lSlm66feUhPx4X7HhMDWZUJ5+RbWbmFF9OqlioZxGJ7ma
 kfN8Wkhf+4Bm1txc70R52AD5uceubTlslFxZ6xdRW3ybaNy+eJ9w5qUzgmQVLXh311cIE90D01O
 gkWr+AkX33bicivR5yTraQDAB03YibkGswLnA6H6z4INNJKKpiwS7KnfPsXsWfGR3+aMSYgEw5p
 vh83ZU7yXJ2tHsSyEVAxax3riPxInwQ3Md6oWpWgpgvU+GO1eMkVhduz9VfMwCbItzRABIVAViC
 7kV1OuH/pn0B25k5kJIslZu2sakYxOM4LY9k25MKF9/BZhmzYohzC0fdFo2TBc2vX6DB4qvOfNt
 6okKU
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

We are in the process of modernizing the gpio-mmio interface. This
series converts all pinctrl drivers calling bgpio_init() to using the
new variant from linux/gpio/generic.h.

Linus: Please create an immutable branch containing these commits once
queued as I'll have some more changes comming on top of them - most
importantly: removing the old interface. I will need them in my tree.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (5):
      pinctrl: stm32: use new generic GPIO chip API
      pinctrl: equilibrium: use new generic GPIO chip API
      pinctrl: npcm8xx: use new generic GPIO chip API
      pinctrl: npcm7xx: use new generic GPIO chip API
      pinctrl: wpcm450: use new generic GPIO chip API

 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 181 +++++++++++++++---------------
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 154 ++++++++++++-------------
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c |  44 +++++---
 drivers/pinctrl/pinctrl-equilibrium.c     |  26 +++--
 drivers/pinctrl/pinctrl-equilibrium.h     |   2 +-
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c |  32 +++---
 6 files changed, 232 insertions(+), 207 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250728-gpio-mmio-pinctrl-conv-ad0ff8d046ec

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


