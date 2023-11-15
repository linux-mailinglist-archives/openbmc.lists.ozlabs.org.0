Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C647ED4E9
	for <lists+openbmc@lfdr.de>; Wed, 15 Nov 2023 21:59:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVwX02RqYz3cb7
	for <lists+openbmc@lfdr.de>; Thu, 16 Nov 2023 07:59:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.176; helo=mail-oi1-f176.google.com; envelope-from=robherring2@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVwWf4BjMz3c8r
	for <openbmc@lists.ozlabs.org>; Thu, 16 Nov 2023 07:59:08 +1100 (AEDT)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3b2e72fe47fso63614b6e.1
        for <openbmc@lists.ozlabs.org>; Wed, 15 Nov 2023 12:59:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700081945; x=1700686745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWue5MGrIGXtdwa0DXl26EeYVBaPfv4b8agF9tN7BTk=;
        b=Kai2kmsPVM2A9V9vOwGoejnYlDnCGApnzMkX9aPKOjkbJDRcvRwFspaBDV0fz+WnPG
         WuN60iIU/LedQdt0xeBFNog+oBPS0BlODxmkseHl7DZVSegJ9dJymm0k0fidsjfv1Deq
         KkrEHsjBKL73jf2Z1Wim+ZcmOLLKraaRy6KfMisbaeHHLLKHFYYRR/Jc9ksQ79bxZfho
         kzqzOZMnYOXhnwP5vKo9frfL/NOyK6q1sSzCpXqJtaqvQI1l5ksmeLmD0E8lLSg+9hpb
         wbkxT4jnJS9/rpXMsFDEKWUlf1gG7lDGti/QduGH7+ONumoyEvXLZs2VBfsiSyaH6MxM
         bytQ==
X-Gm-Message-State: AOJu0YxWxKQN4AxfOkOlJXsU42/jIAjERBb7oOsXt9fXz7ekFk2hAi1d
	6Q4j64/9E3Romytkh1ryjw==
X-Google-Smtp-Source: AGHT+IFuVEdngiswllHpeBpLA6ZHJAf8BU1GB6j5HsXZXn+UNlYH2/CSecjlOqxQWtnfpSG25qCQ2A==
X-Received: by 2002:a05:6808:4193:b0:3b6:cb02:533b with SMTP id dj19-20020a056808419300b003b6cb02533bmr13975007oib.44.1700081945112;
        Wed, 15 Nov 2023 12:59:05 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a9-20020a05680804c900b003b29c2f50f0sm1588527oie.18.2023.11.15.12.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 12:59:04 -0800 (PST)
Received: (nullmailer pid 3732930 invoked by uid 1000);
	Wed, 15 Nov 2023 20:59:01 -0000
From: Rob Herring <robh@kernel.org>
To: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Philipp Zabel <p.zabel@pengutronix.de>, Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [RESEND PATCH] reset: Use device_get_match_data()
Date: Wed, 15 Nov 2023 14:58:48 -0600
Message-ID: <20231115205848.3732609-1-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
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
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Use preferred device_get_match_data() instead of of_match_device() to
get the driver match data. With this, adjust the includes to explicitly
include the correct headers.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/reset/reset-npcm.c       |  5 ++---
 drivers/reset/sti/reset-syscfg.c | 11 ++++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/reset/reset-npcm.c b/drivers/reset/reset-npcm.c
index f6c4f854f2be..8935ef95a2d1 100644
--- a/drivers/reset/reset-npcm.c
+++ b/drivers/reset/reset-npcm.c
@@ -6,8 +6,8 @@
 #include <linux/io.h>
 #include <linux/init.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/reboot.h>
 #include <linux/reset-controller.h>
 #include <linux/spinlock.h>
@@ -351,8 +351,7 @@ static int npcm_usb_reset(struct platform_device *pdev, struct npcm_rc_data *rc)
 		}
 	}
 
-	rc->info = (const struct npcm_reset_info *)
-			of_match_device(dev->driver->of_match_table, dev)->data;
+	rc->info = device_get_match_data(dev);
 	switch (rc->info->bmc_id) {
 	case BMC_NPCM7XX:
 		npcm_usb_reset_npcm7xx(rc);
diff --git a/drivers/reset/sti/reset-syscfg.c b/drivers/reset/sti/reset-syscfg.c
index c1ba04f6f155..2324060b747c 100644
--- a/drivers/reset/sti/reset-syscfg.c
+++ b/drivers/reset/sti/reset-syscfg.c
@@ -7,10 +7,11 @@
  */
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/module.h>
 #include <linux/err.h>
 #include <linux/types.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
 
@@ -183,14 +184,14 @@ static int syscfg_reset_controller_register(struct device *dev,
 int syscfg_reset_probe(struct platform_device *pdev)
 {
 	struct device *dev = pdev ? &pdev->dev : NULL;
-	const struct of_device_id *match;
+	const void *data;
 
 	if (!dev || !dev->driver)
 		return -ENODEV;
 
-	match = of_match_device(dev->driver->of_match_table, dev);
-	if (!match || !match->data)
+	data = device_get_match_data(&pdev->dev);
+	if (!data)
 		return -EINVAL;
 
-	return syscfg_reset_controller_register(dev, match->data);
+	return syscfg_reset_controller_register(dev, data);
 }
-- 
2.42.0

