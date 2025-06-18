Return-Path: <openbmc+bounces-246-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67181ADED41
	for <lists+openbmc@lfdr.de>; Wed, 18 Jun 2025 15:02:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMkRF45r3z2yFJ;
	Wed, 18 Jun 2025 23:02:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750251737;
	cv=none; b=CdXxNSHzgf3l4eg/uNipQ7hDetGLww9sOL36uzOGTLkoyySeclOGRMKwlN1eX6BpnHan2FbmYIjMSMyHBD2YyzCry68cYurRGteBiD1K1Gj82z6goABfUY2ztIg9It24z83gLxGxezXezk5bzJLFSZrVX0sNGok2tItc5N+KIVMkpeD5jjFHgDbWH9TtM2Y2aUuoydcdsOJL8CuDwlZoGPwqu1x6AUf7LMQrCWKsmIDvQS9HsoHW63SqbxIqd8jkRzdZZGZSb4CrhrkJXlIDwcT1FMbmSHwbrJf9pRUSkZUqop884Oed3q7QAkDrEVoaUbboeFwOs37AdSSVF/0Jnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750251737; c=relaxed/relaxed;
	bh=BC9XWgzAC/JlTRKNPdZO9jx2GxWoXU1rrNVMsqMkcWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NR62YUmKCg3qTrGru7f54MXRyXdmNS02r4PQTKGGOKdj7ciaYX5/2exAkQdwmu14cGp+cXmYjcWvPj9fixGHQm8IZqjQ8q+AI+uOD77wh1L+l1KT6lZwPUV0KT2NF7R8O/8lIt3EYSIF9up0uDTzbQDfKSILeOpx6a8QFAqaMZD7aruzG811kNVKIvzLtr134CcG/12E5BrYi9bkWDmS1uzM5iQZZOGlCphin+zLLxvFhSQMzLvdPie94u1A9Ukb5WdgkkCqrdbcqe24oPVmcHzePW0e9JMc0FGekPCqBRUqbkAp3w/yYbXJeoIZJK8+2+6zlGBE/iyVhdgz/xha0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=wha872Rm; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=wha872Rm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMkRD2mkwz2xS2
	for <openbmc@lists.ozlabs.org>; Wed, 18 Jun 2025 23:02:16 +1000 (AEST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so61920395e9.3
        for <openbmc@lists.ozlabs.org>; Wed, 18 Jun 2025 06:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750251733; x=1750856533; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BC9XWgzAC/JlTRKNPdZO9jx2GxWoXU1rrNVMsqMkcWo=;
        b=wha872Rma22PzUwuXXIGAwgZb5obyoU1mxVMGimE74UsHoJDC4P+gWiySHodO58RiG
         c2eLzbZQGgspdI7IHGHFhzaP11g3vw6StwhWBQwBBeUNcrpQLGItBqmscjIBl++OvCmI
         w4bCIDj2i5lIEQ4+b37FyTXfuEl22NDPJ1BGANLqHBSuqhBVKJTD5ricwZ/ZeXt2B+V2
         pkzNxwiVzZKJO68GTKMepa96RaG3dhq3/HpRSlXvWQwuGBmidc7JpUFnnJizWyEVzqn+
         9CEyRrVyrIMVUEZ+ttPpgfqD7Htfzf1FUnoOZgwbckclE0MPTkJZlL4xYuQBeLmLnWpN
         UFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251733; x=1750856533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BC9XWgzAC/JlTRKNPdZO9jx2GxWoXU1rrNVMsqMkcWo=;
        b=C2S5F6knbViXSgE/A60h5rIf28yD6wjlvr1YKEspZCt9HSMBbq13tR6z96NXRmsoWo
         0PjggtjatHfxNtd14Ygw5//bqz28I28jRhWZ2Mr9M1e/6IHCRuP4Q5Bf0B5VzPZWdahh
         DKy3TTOlIimIrSxut8H086Fey1jkLrH8Yf6lbeX6v+MM69pDUFvWswI2RupKc7inkf2R
         YyUcgIR20T8vKhEJwcI83uUvz5iN4pmpxwQR85twzuk57KasLGuxIv8X+1ltnV5L7TKq
         L5AmZdleBGfw5eJ/XsXubGjtNlxDRxkorff26Un6C5R+5Cw3axlNtWCPrX9+L27vZ/M6
         FW0w==
X-Gm-Message-State: AOJu0Yz6oWhmJ5It6SCz8nFrfvCzmV2M/INSfxT80bDhDpURq/Ud77LR
	bKyhFrhGlpQpLtKAnw81vu/eUNO2s5pCQm/wTaEVJXQxx3eyLhAYOY4sCJW9gjTIshg=
X-Gm-Gg: ASbGncv37DeT1J6VTlO9C0jLme9QhzYb27s982V76W6JYKZXfhyzaVPGTqwORWsMXbi
	1eBp/4Vdb2uELOl2I5e/shlhielFkehOBUaxivbnD9QUDuhI0nFYAl7Gy+2fnyZjIsFhseR9qXK
	Jzn+ApR6RKSKnEM1YNLqxM0rUeD46DsO+QobNE5fChI3KT1ldnRWKr5Ik8aGoLe5RJcrKeqwvkM
	b4FR/g5eUvREt63WSPUQIqezsuN0sKZttU/NKxci/OpLh+t3rwWmITNly7RP2GeZ5yAsLnngnaG
	foBB2PndPdM+JuEJcC1IPLXesttUYAUrgDHKe3qxM2lhhAvwBWv2CL8=
X-Google-Smtp-Source: AGHT+IFPB/K5zMDdgTuf11jgW7Xuj1ey8iMDW/GtnPNE3ho2jl8/wpkbPxKo18+NNwMCFsAycHFtzA==
X-Received: by 2002:a05:600c:82c3:b0:450:cd50:3c66 with SMTP id 5b1f17b1804b1-4533caf10cbmr156437325e9.29.1750251732641;
        Wed, 18 Jun 2025 06:02:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ad8:9ec2:efc8:7797])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08c99sm17043595f8f.63.2025.06.18.06.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 06:02:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:02:06 +0200
Subject: [PATCH 1/2] gpio: npcm-sgpio: don't use legacy GPIO chip setters
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
Message-Id: <20250618-gpio-mmio-fix-setter-v1-1-2578ffb77019@linaro.org>
References: <20250618-gpio-mmio-fix-setter-v1-0-2578ffb77019@linaro.org>
In-Reply-To: <20250618-gpio-mmio-fix-setter-v1-0-2578ffb77019@linaro.org>
To: Klara Modin <klarasmodin@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1140;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=XVDbA11npYNtBXGkYX9hOCC8ch1woMEIFMQDtO/pLz4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUrjSWuqLhdeCPxybR2GyyQn3qsd1Xky54Sg3z
 b8E7NmrwBKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFK40gAKCRARpy6gFHHX
 cm/ZD/0cqhzi23U4gdbUZtBgvJ/CRlUwNoOc4V0ubJHdndzS/w89zQrncvgpk7mcGwGnCaTcwmd
 R2DXEkPD2sLvmdDzx4B/WpHgjXOryHh2E8F1N+C/e/nhkrowGI2vqj/OJe6bSnORTxifDPgvvJR
 6/jXZ4WK6Ni+zAOm/uSQSxXV9th62JDBrSNYbJbI/b9NzEzgc0rKZreIILL/sMovgEaOF+gkBwk
 Sdq9qaDbJh59X34cBgPbizJHzvUaJ8GZd+DeQB1zeC0fSvQDVfCh0tDRmK0a/6RWA8HAPaOoNEJ
 Vh+yDX/+Oir85g5+wsOcyGts8KN9nkZ6s7bm5IPkLhxfaKCpm07K8F9RQLobPQ2wIv9iW6xuOmW
 Qg+fi+2MKg2Ogyk2uEzFVe+8hhzkYw+paLUUQOFxQNewHTBFqyzPm/mjzA2kv3aSIZeWCZUjBhn
 BrLkIU4dt1mUfW1/47syKwqQWFfbZ3VekZtcD82JHQ+kcylf1I+5aWQCRLxQAh0WtJmDoDGD5h7
 jeltFvU0UqI7qqXQiMVSkPm3NBPBAYDq5Xbz96+NvVoyb+jooFmkDrpDgyz+JHJSkY/sj8fIXPQ
 RpWtJgyuJUTcxBnHc0oDwVDZ2UDd5Hur0AAP3PqDRKlvOMkzT6usmt67x+4iiNi/KCEWrYDom19
 iSzovEPne3nd3Nw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We've converted this driver to using the new GPIO line value setters but
missed the instance where the legacy callback is accessed directly using
the function pointer. This will lead to a NULL-pointer dereference as
this pointer is no longer populated. Fix it.

Fixes: 0e1a8930c941 ("gpio: npcm-sgpio: use new GPIO line value setter callbacks")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-npcm-sgpio.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-npcm-sgpio.c b/drivers/gpio/gpio-npcm-sgpio.c
index b3953d1ae8af45f4bce9b799434547cd8770d9df..25b203a89e380366e6a1dcd51775f6b1997a1d30 100644
--- a/drivers/gpio/gpio-npcm-sgpio.c
+++ b/drivers/gpio/gpio-npcm-sgpio.c
@@ -211,9 +211,7 @@ static int npcm_sgpio_dir_in(struct gpio_chip *gc, unsigned int offset)
 
 static int npcm_sgpio_dir_out(struct gpio_chip *gc, unsigned int offset, int val)
 {
-	gc->set(gc, offset, val);
-
-	return 0;
+	return gc->set_rv(gc, offset, val);
 }
 
 static int npcm_sgpio_get_direction(struct gpio_chip *gc, unsigned int offset)

-- 
2.48.1


