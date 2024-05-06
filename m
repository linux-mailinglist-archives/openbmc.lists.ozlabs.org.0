Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8028BC7C1
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2024 08:44:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ur1fT8AQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VXsM76M4qz30TS
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2024 16:44:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ur1fT8AQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=jim.t90615@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VXsLZ4JB3z30Np
	for <openbmc@lists.ozlabs.org>; Mon,  6 May 2024 16:43:32 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2b4952a1b51so1179852a91.0
        for <openbmc@lists.ozlabs.org>; Sun, 05 May 2024 23:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714977809; x=1715582609; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=alx1vGLK4Nn7gqqZZSreCoEN1bAw1gLW3wJCKjtuMCQ=;
        b=Ur1fT8AQySKb6aIONd55hT8emNCqaT2UbRMkxgR6KgpIh0IRQovceGzsENmZuEOoHs
         ukGXlM4U9Hqh8ckrFzzFQshfQsy/A9ShzFOL7ttRBqZfKtX130ELfyuYlh6jTiNL3M+P
         2Je+sZUOFiWYxQc3FVipmjPd7urBCzX/q9kdSMUOHewQqkZRnHokxgIZU3l601RRupPU
         sWSTJHyP2X+cuoJOwXIDFY7QdFZuO5AzSDfz/P+5rqTIn6Fk7Yw6/sFQZhg2oLhy7XPw
         N+ZEZ9E0nxS1aicpRFTVqQMKVbsBmNk07akicHJ+HQWRqjSo/e9E90x59A+FdEeyxbRm
         81uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714977809; x=1715582609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=alx1vGLK4Nn7gqqZZSreCoEN1bAw1gLW3wJCKjtuMCQ=;
        b=JlpixbyBxuu0OoygZu47eh81pcYUoxY1uCiWH7xpBWYCWsgav2aIku/TyyBFDplNdp
         bieE6oCc6VXcoxMKhqOrwZDjf/TZxSZ5aHe46UoX4sNe7abOq7ex8BR/mS83E6cw0sxF
         JRb36lC//LzI1raWteLt0RgLXf4ZOLuNuDAZM9ckIyuIm4ArhhO+KjvWKpzfULQoyjRD
         uGWfTVpYLNHr+QZpsdOvmo5VpjyXKEXq8/GMHLmN7ZvPc7qO/sbuKg8VozA7K3vG9Z/Y
         pqOXyEqEGFsDBe100Kch1gfxQTQv2UNhyEfE6JGP9WIEWdF4QbOl4QS6QHDQFdnVx5QX
         itug==
X-Forwarded-Encrypted: i=1; AJvYcCW/YyRAqGSwjd4wBysaFp4yCxMZh2iioA1lCOUthYE45GnkNeW4OhPpZqDbaNt3fFvLEYoDI8o4VZTuNPCWRNWsTp5ULXNkxVE=
X-Gm-Message-State: AOJu0Yy4qCVVeW3EjR0rWDrlB/gnjDy8Mlmr42A2TRuHKHDV3m2fvpRf
	W+kqEItDRSmWjqxTWexWK4OJQ9TbgpEl4KIVHhQKdqxQZJ+a+/X6hcKlY8wC
X-Google-Smtp-Source: AGHT+IEc8dvXLKGNap462wqPULim0DUj6ARd6c5SuDImQ68+8z/pTRGVjzDTTZW7X9a2rUwA2mQebQ==
X-Received: by 2002:a17:90a:c697:b0:2b2:d086:6f84 with SMTP id n23-20020a17090ac69700b002b2d0866f84mr7584028pjt.7.1714977809393;
        Sun, 05 May 2024 23:43:29 -0700 (PDT)
Received: from localhost.localdomain ([180.217.157.40])
        by smtp.gmail.com with ESMTPSA id r8-20020a17090a2e8800b002a2a3aebb38sm7322415pjd.48.2024.05.05.23.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 May 2024 23:43:28 -0700 (PDT)
From: Jim Liu <jim.t90615@gmail.com>
X-Google-Original-From: Jim Liu <JJLIU0@nuvoton.com>
To: JJLIU0@nuvoton.com,
	KWLIU@nuvoton.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	dan.carpenter@linaro.org,
	jim.t90615@gmail.com,
	elfring@users.sourceforge.net
Subject: [PATCH v4] gpio: nuvoton: Fix sgpio irq handle error
Date: Mon,  6 May 2024 14:42:44 +0800
Message-Id: <20240506064244.1645922-1-JJLIU0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The generic_handle_domain_irq() function calls irq_resolve_mapping().
Thus delete a duplicative irq_find_mapping() call
so that a stack trace and an RCU stall will be avoided.


Fixes: c4f8457d17ce ("gpio: nuvoton: Add Nuvoton NPCM sgpio driver")
Signed-off-by: Jim Liu <JJLIU0@nuvoton.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Changes for v4:
   - modify commit description
Changes for v3:
   - remove unused variable
Changes for v2:
   - add more description
---
 drivers/gpio/gpio-npcm-sgpio.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-npcm-sgpio.c b/drivers/gpio/gpio-npcm-sgpio.c
index d31788b43abc..260570614543 100644
--- a/drivers/gpio/gpio-npcm-sgpio.c
+++ b/drivers/gpio/gpio-npcm-sgpio.c
@@ -434,7 +434,7 @@ static void npcm_sgpio_irq_handler(struct irq_desc *desc)
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct irq_chip *ic = irq_desc_get_chip(desc);
 	struct npcm_sgpio *gpio = gpiochip_get_data(gc);
-	unsigned int i, j, girq;
+	unsigned int i, j;
 	unsigned long reg;
 
 	chained_irq_enter(ic, desc);
@@ -443,11 +443,9 @@ static void npcm_sgpio_irq_handler(struct irq_desc *desc)
 		const struct npcm_sgpio_bank *bank = &npcm_sgpio_banks[i];
 
 		reg = ioread8(bank_reg(gpio, bank, EVENT_STS));
-		for_each_set_bit(j, &reg, 8) {
-			girq = irq_find_mapping(gc->irq.domain,
-						i * 8 + gpio->nout_sgpio + j);
-			generic_handle_domain_irq(gc->irq.domain, girq);
-		}
+		for_each_set_bit(j, &reg, 8)
+			generic_handle_domain_irq(gc->irq.domain,
+						  i * 8 + gpio->nout_sgpio + j);
 	}
 
 	chained_irq_exit(ic, desc);
-- 
2.34.1

