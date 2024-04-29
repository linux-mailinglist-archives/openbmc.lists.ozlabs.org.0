Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 449BE8B50FB
	for <lists+openbmc@lfdr.de>; Mon, 29 Apr 2024 08:08:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d5vV4YfO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VSXtl5dwdz3cSN
	for <lists+openbmc@lfdr.de>; Mon, 29 Apr 2024 16:07:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d5vV4YfO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=jim.t90615@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VSXt818B4z2xQK
	for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2024 16:07:26 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1e9ffd3f96eso31518295ad.3
        for <openbmc@lists.ozlabs.org>; Sun, 28 Apr 2024 23:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714370840; x=1714975640; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TK0AmsxIvpdv+Eeo133AhkPR4FnsmSNMo4dv18n8nCg=;
        b=d5vV4YfO6UNuWe/SFKpJ5FYr75+h0TsgQC+Fx55y/DX9Zdx7a61zVpHs/MXTaT/fKi
         M3XgxhOx1lG7Ua+b0WHbAQfoxIlRdQLVlbtwqUYhsNdYwlpUkK38SZCVb2o4WU+/c6tH
         x5XdPBm4Z6snmZjtmP/eSSK9OaBofw0BC0TyR0iprzBIMFGpJHOInkhIflyH9kWUERrB
         Xv2YJ/qP5PKxz80G+Tk7t3f8MB+5lrwDcHmnup+vVS65wHo+RmQ/2VMR1iD3tKa2nTOq
         uXCyC12EiSm9+9MGq1nLr/cr4/RqO4Ii+HDKm+63O3bmBQp+PcR4/tFx3gYbh1d3JyJb
         VBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714370840; x=1714975640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TK0AmsxIvpdv+Eeo133AhkPR4FnsmSNMo4dv18n8nCg=;
        b=rnFsEePICvX2bBbDYCCwHx8UB/UntDdq747meko9yiDD5f3eBiBMgybWmiBr3sEXbF
         LgXCbE19xuECrTNPCkWHgHMarR6t4RM+ZbAWVT/HWh/ZMQupdgR8JidXsrezjVsJEXZr
         1SJCde3f941GzghOu7RQ65XrL08I2bCvqx3TLMeJJ9/ZYUdKX7SI12t/tW9et0IeweVA
         SDrNp2zRqCzl41Th+O+ObyxK3tMkgZSy1mnTH2u7DCgpWpXiYs12jCkmDawsWn66YrOX
         hT3sjKnP9r23GgRlUFeUo8cV4oBAA/gthlTWiq1CM1IgBoAUrYGmWOQuSftHvlnOUcGn
         eZeQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5rxrKjIrk4LBYFAEfJAPDlSSFtHdzYKcip2ayq0ghtk5Sm8X57giuUPmip3wz4YpdvsaFlAx25gWyOGo8SmE3UiO8AHEjV04=
X-Gm-Message-State: AOJu0YxQpuQ6KoH/nN6oVcK2z4LNSf8O64Tgeujdnw5DUdvnLjtbbL9+
	uKj1Q1JuJtlUiL7dmTdSHI0PMn31+o11Y2YbfT4j1fZKKaaaWpzb
X-Google-Smtp-Source: AGHT+IE7SJ/emkRX24/TfIxKkSLU5FziCF+b+tSBwh3UhlpSrf0dkAFv6oWkEXPc9LFx4HHDk2g7tQ==
X-Received: by 2002:a17:902:784f:b0:1e9:9fdb:567d with SMTP id e15-20020a170902784f00b001e99fdb567dmr8597220pln.68.1714370839787;
        Sun, 28 Apr 2024 23:07:19 -0700 (PDT)
Received: from localhost.localdomain ([1.200.153.166])
        by smtp.gmail.com with ESMTPSA id x6-20020a170902820600b001e43df03096sm19402915pln.30.2024.04.28.23.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 23:07:19 -0700 (PDT)
From: Jim Liu <jim.t90615@gmail.com>
X-Google-Original-From: Jim Liu <JJLIU0@nuvoton.com>
To: KWLIU@nuvoton.com,
	JJLIU0@nuvoton.com,
	linus.walleij@linaro.org,
	jim.t90615@gmail.com,
	brgl@bgdev.pl
Subject: [PATCH v2] gpio: nuvoton: Fix sgpio irq handle error
Date: Mon, 29 Apr 2024 14:06:42 +0800
Message-Id: <20240429060642.2920266-1-JJLIU0@nuvoton.com>
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

User use gpiomon to monitor input pin ,if triger the system will call trace and rcu stall.

The irq_handler uses generic_handle_domain_irq, so there is need to remove irq_find_mapping.

Fixes: c4f8457d17ce ("gpio: nuvoton: Add Nuvoton NPCM sgpio driver")
Signed-off-by: Jim Liu <JJLIU0@nuvoton.com>
---
Changes for v2:
   - add more description
---
 drivers/gpio/gpio-npcm-sgpio.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-npcm-sgpio.c b/drivers/gpio/gpio-npcm-sgpio.c
index d31788b43abc..136838c25756 100644
--- a/drivers/gpio/gpio-npcm-sgpio.c
+++ b/drivers/gpio/gpio-npcm-sgpio.c
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
2.25.1

