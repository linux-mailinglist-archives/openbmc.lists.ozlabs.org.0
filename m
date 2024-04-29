Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECD18B51F5
	for <lists+openbmc@lfdr.de>; Mon, 29 Apr 2024 09:06:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WlS0v7wZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VSZ9t2MbTz3cSp
	for <lists+openbmc@lfdr.de>; Mon, 29 Apr 2024 17:06:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WlS0v7wZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=jim.t90615@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VSZ9J66rLz30N8
	for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2024 17:05:39 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso2940557a12.3
        for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2024 00:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714374336; x=1714979136; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vEglK9K8c5i8QBLiYdAQTdb0ab9SQtK5PmVbKoN4XV8=;
        b=WlS0v7wZv/iohAE5wTYsl8+QzGeLIOSPZWxaSOoeheCUcnVB8oHP0VexasQKX289bS
         kt3MpMW4Dr7gFdA7kcatyDp4gr63p2ZHP4A7DO/N5vFlTHeo2DBOWtBoqZz0evfMkcun
         NtQiAXhFvHPjKtUtSzq//Qsw9E2Egj9JWbeK693q/GCjz09/sL9OTPsNuQ9nDwarfl+U
         Tp/UQMqEG+j2aKTLXwTgdIwe1YW922YEz/oV3auZqIugST9mjEhx349b1bS0xRdaWvZv
         wuyZ0MuSNLABQzKMndbNZBlATQUNd/U0dGrMp5N8TPEbD8CyURhF6b0OKMgPwaCxfJW7
         Jv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714374336; x=1714979136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vEglK9K8c5i8QBLiYdAQTdb0ab9SQtK5PmVbKoN4XV8=;
        b=SNpVaTBVUXLOcg0kERB8WrxcwBPPnYb3zevFGa6M1NNMwPx7XT7Qb+imZSrm12f8GO
         A6X/yJirvkNPVdf7gDuh50vVzZBmeQVYlTpCO4f6kY6zriZixkP5vEtmY0FENtdGFA1Z
         +vDCVMNIRZOg0RcLxcwhkbd4A0z6lfu81BS1BO2WSuYx/WAxjErjHtaJhHQ9jO2ZLhsB
         9UcbIfpHCMUaa//ybcn/oepcwxhR6nV0RKvaNdXT3WqEQgNH0+uwA5uTK65HDh/Sl9Sz
         AW6B4jAKtK5RXBwGHJIwE41To76yjlo3BDNPySl//4JQpXU43fkBHAy85wBXXIvuPhkm
         QBMg==
X-Forwarded-Encrypted: i=1; AJvYcCVOagUSilbz12NiUr/7fPlVFogTcn/bCy6ngj5PaSQnRj9YNisG2Hcblk4jzTDtWSihYftXeSRJtFR6Pw/lxhFydeUxzQwFzqY=
X-Gm-Message-State: AOJu0YyEQko09iL1InW1QgbTmrzFzRKl8aSct7opQVLyot4Tgi08NBnf
	oUFzZ6DoYJV7iuJiU4A46AG9vBOtfC/+ZSPd3gWp4ljpmIupTmBU
X-Google-Smtp-Source: AGHT+IGMAMI8jVYAcx5uDRIfdvsKW0eMKlGR3gETBwuInjA3i51gQQBZTkLDilCVqH0FdDm+X1BZAQ==
X-Received: by 2002:a17:90b:1d01:b0:2a2:bd4b:764f with SMTP id on1-20020a17090b1d0100b002a2bd4b764fmr8222549pjb.3.1714374336553;
        Mon, 29 Apr 2024 00:05:36 -0700 (PDT)
Received: from localhost.localdomain ([1.200.153.166])
        by smtp.gmail.com with ESMTPSA id gt5-20020a17090af2c500b002b16f39c917sm1947355pjb.50.2024.04.29.00.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 00:05:36 -0700 (PDT)
From: Jim Liu <jim.t90615@gmail.com>
X-Google-Original-From: Jim Liu <JJLIU0@nuvoton.com>
To: JJLIU0@nuvoton.com,
	KWLIU@nuvoton.com,
	jim.t90615@gmail.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	dan.carpenter@linaro.org
Subject: [PATCH v3] gpio: nuvoton: Fix sgpio irq handle error
Date: Mon, 29 Apr 2024 15:05:23 +0800
Message-Id: <20240429070523.3160248-1-JJLIU0@nuvoton.com>
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

The generic_handle_domain_irq() function calls irq_resolve_mapping()
so calling irq_find_mapping() is duplicative and will lead to a stack
trace and an RCU stall.


Fixes: c4f8457d17ce ("gpio: nuvoton: Add Nuvoton NPCM sgpio driver")
Signed-off-by: Jim Liu <JJLIU0@nuvoton.com>
---
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

