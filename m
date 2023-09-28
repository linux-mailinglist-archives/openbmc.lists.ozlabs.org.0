Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EC57B1C7B
	for <lists+openbmc@lfdr.de>; Thu, 28 Sep 2023 14:32:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=M7Vi4MS8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxCY521yFz3bqW
	for <lists+openbmc@lfdr.de>; Thu, 28 Sep 2023 22:32:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=M7Vi4MS8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com; envelope-from=aladyshev22@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxCWB5NrQz2ytJ;
	Thu, 28 Sep 2023 22:30:45 +1000 (AEST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b9d07a8d84so213440191fa.3;
        Thu, 28 Sep 2023 05:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695904237; x=1696509037; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUX/UAbHIqbeqOjhPaMPY2ZesCBPS6XxII45ueUUUxU=;
        b=M7Vi4MS8Lkzh20tp/Bj77hs46pAeNiuApU5sRcOONQhum2OGPys1b2KvT2Zo5qMGRD
         uTaF5/cINQo23N4LUxdmaLLA/s3cKCBAbB4wIQdduFRFMGCVfwPhNQMD3oF2okY17Scg
         NmEhtqFdTkSZhz7XEZ9iJI1JuZk+qhQOxMi//LIeEzTdkqbmcA3PckAQgdm8ck81y/Y/
         JOxkdz8wKFHETDAXij22dAIuQJ0X/qrjEBvWjt64S+tZ+LKrOHCnb8sE25lauEfP9y4X
         1wjEQEyyCS879FApxg35jAd2fQq/DxC3uEGmiA5Yt8fPZdMhTaIYAzU6osJe9S28FJwC
         eHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695904237; x=1696509037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUX/UAbHIqbeqOjhPaMPY2ZesCBPS6XxII45ueUUUxU=;
        b=RDRT6+9LEvO8HEP5VQFEnG/kUb8C1MnVWfZrxHAvSyIccVauO5gVwx2t8Y8rJAOIhd
         b1DAroY4EJVunjKWeZgwcEKDGrsvc+sBbhOZ9zBT/sCkXp02vj23g6mAmO7uJhyAkkEx
         MLmzsfByfN2DfEtcqQ1Wzrmu+brmHdXuiRtyzxt4MBtVd4SbruWT6QTuEVYTXquvzSfM
         P4+ncUixQJYUi+Pyuyc/zuB7boveRm9894liuocgQvrvoBS3CkZU1r64UMzQEuAOlBHU
         aDwKth70ETRV2ZvMY0weAHv3LGIFfA6iN22WDjgnqNhry/Dof4MGwQ/TqaJ3u4D8HRUr
         kuag==
X-Gm-Message-State: AOJu0YwT1kckkVXp3cq2ZLa1Qv9IewhBvgh17yHCeP4xIBDYU9WWwHf+
	6xlgkTKEY8MRkXTviBud+Nw=
X-Google-Smtp-Source: AGHT+IHOoVrnykSWjbCmQfiEGZtmRDV+0Xk3hQX2T+BQSwnmo0QhwPppf4zwYYCAZaxFOF6wP63EgQ==
X-Received: by 2002:a2e:8448:0:b0:2c0:1982:3893 with SMTP id u8-20020a2e8448000000b002c019823893mr887770ljh.16.1695904237031;
        Thu, 28 Sep 2023 05:30:37 -0700 (PDT)
Received: from PC10319.67 ([82.97.198.254])
        by smtp.googlemail.com with ESMTPSA id x6-20020a2e9c86000000b002ba045496d0sm3588724lji.125.2023.09.28.05.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 05:30:36 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: 
Subject: [PATCH 1/3] ipmi: Move KCS headers to common include folder
Date: Thu, 28 Sep 2023 15:30:07 +0300
Message-Id: <20230928123009.2913-2-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230928123009.2913-1-aladyshev22@gmail.com>
References: <20230928123009.2913-1-aladyshev22@gmail.com>
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
Cc: tmaimon77@gmail.com, linux-aspeed@lists.ozlabs.org, tali.perry1@gmail.com, edumazet@google.com, jk@codeconstruct.com.au, matt@codeconstruct.com.au, benjaminfair@google.com, openbmc@lists.ozlabs.org, joel@jms.id.au, kuba@kernel.org, pabeni@redhat.com, minyard@acm.org, aladyshev22@gmail.com, openipmi-developer@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org, andrew@aj.id.au, venture@google.com, linux-kernel@vger.kernel.org, avifishman70@gmail.com, netdev@vger.kernel.org, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The current KCS header files can be utilized by both IPMI drivers
(drivers/char/ipmi) and MCTP driver (drivers/net/mctp). To be able to
use them in both cases move the headers to 'include/linux' folder.

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 drivers/char/ipmi/kcs_bmc.c                           | 8 +++-----
 drivers/char/ipmi/kcs_bmc_aspeed.c                    | 3 +--
 drivers/char/ipmi/kcs_bmc_cdev_ipmi.c                 | 2 +-
 drivers/char/ipmi/kcs_bmc_npcm7xx.c                   | 2 +-
 drivers/char/ipmi/kcs_bmc_serio.c                     | 2 +-
 {drivers/char/ipmi => include/linux}/kcs_bmc.h        | 0
 {drivers/char/ipmi => include/linux}/kcs_bmc_client.h | 3 +--
 {drivers/char/ipmi => include/linux}/kcs_bmc_device.h | 3 +--
 8 files changed, 9 insertions(+), 14 deletions(-)
 rename {drivers/char/ipmi => include/linux}/kcs_bmc.h (100%)
 rename {drivers/char/ipmi => include/linux}/kcs_bmc_client.h (97%)
 rename {drivers/char/ipmi => include/linux}/kcs_bmc_device.h (96%)

diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
index 8b1161d5194a..d29a8505d6ed 100644
--- a/drivers/char/ipmi/kcs_bmc.c
+++ b/drivers/char/ipmi/kcs_bmc.c
@@ -5,15 +5,13 @@
  */
 
 #include <linux/device.h>
+#include <linux/kcs_bmc.h>
+#include <linux/kcs_bmc_client.h>
+#include <linux/kcs_bmc_device.h>
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 
-#include "kcs_bmc.h"
-
-/* Implement both the device and client interfaces here */
-#include "kcs_bmc_device.h"
-#include "kcs_bmc_client.h"
 
 /* Record registered devices and drivers */
 static DEFINE_MUTEX(kcs_bmc_lock);
diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index 72640da55380..3dc0dfb448f5 100644
--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
@@ -10,6 +10,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
+#include <linux/kcs_bmc_device.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -21,8 +22,6 @@
 #include <linux/slab.h>
 #include <linux/timer.h>
 
-#include "kcs_bmc_device.h"
-
 
 #define DEVICE_NAME     "ast-kcs-bmc"
 
diff --git a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
index cf670e891966..bf1001130a6c 100644
--- a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
+++ b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
@@ -8,6 +8,7 @@
 #include <linux/errno.h>
 #include <linux/io.h>
 #include <linux/ipmi_bmc.h>
+#include <linux/kcs_bmc_client.h>
 #include <linux/list.h>
 #include <linux/miscdevice.h>
 #include <linux/module.h>
@@ -17,7 +18,6 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 
-#include "kcs_bmc_client.h"
 
 /* Different phases of the KCS BMC module.
  *  KCS_PHASE_IDLE:
diff --git a/drivers/char/ipmi/kcs_bmc_npcm7xx.c b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
index 7961fec56476..160553248a93 100644
--- a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
+++ b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
@@ -10,6 +10,7 @@
 #include <linux/errno.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/kcs_bmc_device.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -17,7 +18,6 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
-#include "kcs_bmc_device.h"
 
 #define DEVICE_NAME	"npcm-kcs-bmc"
 #define KCS_CHANNEL_MAX	3
diff --git a/drivers/char/ipmi/kcs_bmc_serio.c b/drivers/char/ipmi/kcs_bmc_serio.c
index 1793358be782..24df7144a189 100644
--- a/drivers/char/ipmi/kcs_bmc_serio.c
+++ b/drivers/char/ipmi/kcs_bmc_serio.c
@@ -5,12 +5,12 @@
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/list.h>
+#include <linux/kcs_bmc_client.h>
 #include <linux/module.h>
 #include <linux/sched/signal.h>
 #include <linux/serio.h>
 #include <linux/slab.h>
 
-#include "kcs_bmc_client.h"
 
 struct kcs_bmc_serio {
 	struct list_head entry;
diff --git a/drivers/char/ipmi/kcs_bmc.h b/include/linux/kcs_bmc.h
similarity index 100%
rename from drivers/char/ipmi/kcs_bmc.h
rename to include/linux/kcs_bmc.h
diff --git a/drivers/char/ipmi/kcs_bmc_client.h b/include/linux/kcs_bmc_client.h
similarity index 97%
rename from drivers/char/ipmi/kcs_bmc_client.h
rename to include/linux/kcs_bmc_client.h
index 6fdcde0a7169..f6350c9366dd 100644
--- a/drivers/char/ipmi/kcs_bmc_client.h
+++ b/include/linux/kcs_bmc_client.h
@@ -5,8 +5,7 @@
 #define __KCS_BMC_CONSUMER_H__
 
 #include <linux/irqreturn.h>
-
-#include "kcs_bmc.h"
+#include <linux/kcs_bmc.h>
 
 struct kcs_bmc_driver_ops {
 	int (*add_device)(struct kcs_bmc_device *kcs_bmc);
diff --git a/drivers/char/ipmi/kcs_bmc_device.h b/include/linux/kcs_bmc_device.h
similarity index 96%
rename from drivers/char/ipmi/kcs_bmc_device.h
rename to include/linux/kcs_bmc_device.h
index 17c572f25c54..65333b68c0af 100644
--- a/drivers/char/ipmi/kcs_bmc_device.h
+++ b/include/linux/kcs_bmc_device.h
@@ -5,8 +5,7 @@
 #define __KCS_BMC_DEVICE_H__
 
 #include <linux/irqreturn.h>
-
-#include "kcs_bmc.h"
+#include <linux/kcs_bmc.h>
 
 struct kcs_bmc_device_ops {
 	void (*irq_mask_update)(struct kcs_bmc_device *kcs_bmc, u8 mask, u8 enable);
-- 
2.25.1

