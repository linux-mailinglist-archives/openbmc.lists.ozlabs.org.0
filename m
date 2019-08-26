Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5FB9D79F
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2019 22:46:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HPDh04rSzDqhs
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 06:46:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=daniel.lezcano@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="uSRwaaQT"; 
 dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HPCL108wzDqgn
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 06:45:15 +1000 (AEST)
Received: by mail-wm1-x344.google.com with SMTP id p77so837065wme.0
 for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2019 13:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EJr/EagOWWWCEFoK6Cl8RHdd3bbJGdepYKWoaGBi1+8=;
 b=uSRwaaQTED8QF+2S4yqgVSoNPgjxT8uTgt9GhpJsDr+8CvcVzeUbCSE0ERTVchio4p
 QNRdt30i1fpggxajsFk7Voi6prWjddEOIdOxu/GaOqTH1NMqdBXyL9p9OsvjyHBGqz2n
 ZtmiU15CtLVF/qW8QfOji5RW101rf6lV2hH4P8NlLJAV2uMDR1rvyAsAeS2SV4p1eKD9
 ByX/kC7XiDxfjEXRYp4lV1pFvei3AOrAjRvNGOYS5+vNSRte8WFE3BWxQNgdYUSObzPd
 v08kN1XBFh7jYXDKXF1rRiLfgCLVJMRsBl1Gj22oaCtg0kP8zckgIqrdiYBqAj4kZfE3
 5SOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EJr/EagOWWWCEFoK6Cl8RHdd3bbJGdepYKWoaGBi1+8=;
 b=btT/xxJYz7cvypclZwPphD6xEreuIQnaRovlLiB5h8s9apx/BpSDIMBT7I5Pn8Eje4
 We0N0ZRF9u7Llgt0m+ksSE0nH5qT0a6znPfvNywX9GuBOR9IR2288jhSlQFKz7ZE7aF0
 ZY8ItcDh4i7JcTvpXsR+Gn50rtKO2ovmypcuJ9ac4filfX70slrTnSHSEiCMbkqr9Kf5
 pM0QEVws3ckrXJ91LcgMJWu+f74PW6vLqVG3db1vaedbwXxV+2YFnT7AFO786FzP8q86
 1obqklYFWkWo0Me6LtDfc2GVTpARBPQn3Uz0PyM5JQ/J1oXgGr9YBJP5NsnzWzJGGmE9
 rwgw==
X-Gm-Message-State: APjAAAVcE2lxPmlRq6y/2dFZKO8UAYI74oq2bpGjvJXsCCjRjehsqXNj
 lShM6ShEE/ts7X+bbkJWx548MQ==
X-Google-Smtp-Source: APXvYqwXwSxG80kgpFkYnO+Z1GwvdiIdcVmq6Bkgqse72Bk1nRrZrhz0H9bgN6nDwhLGTu2FJfkc7Q==
X-Received: by 2002:a1c:ed04:: with SMTP id l4mr24638471wmh.81.1566852306477; 
 Mon, 26 Aug 2019 13:45:06 -0700 (PDT)
Received: from mai.imgcgcw.net ([2a01:e34:ed2f:f020:f881:f5ed:b15d:96ab])
 by smtp.gmail.com with ESMTPSA id 20sm549557wmk.34.2019.08.26.13.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 13:45:05 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: tglx@linutronix.de
Subject: [PATCH 11/20] clocksource/drivers/npcm: Fix GENMASK and timer
 operation
Date: Mon, 26 Aug 2019 22:43:58 +0200
Message-Id: <20190826204407.17759-11-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190826204407.17759-1-daniel.lezcano@linaro.org>
References: <df27caba-d9f8-e64d-0563-609f8785ecb3@linaro.org>
 <20190826204407.17759-1-daniel.lezcano@linaro.org>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 "moderated list:ARM/NUVOTON NPCM ARCHITECTURE" <openbmc@lists.ozlabs.org>,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Avi Fishman <avifishman70@gmail.com>

NPCM7XX_Tx_OPER GENMASK bits are wrong, fix them.

Hopefully the NPCM7XX_REG_TICR0 register reset value of those bits was 0,
so it did not cause an issue.

The function npcm7xx_timer_oneshot() reads the register
NPCM7XX_REG_TCSR0, modifies it and then reads it again overwriting the
previous changes. Remove the extra read which is pointless.

The function npcm7xx_timer_periodic() is correct but the code writes
to the NPCM7XX_REG_TICR0 register while it is dealing with the
NPCM7XX_REG_TCSR0 register, that is confusing. Separate the write to
the registers in the code for the sake of clarity.

Fixes: 1c00289ecd12 ("clocksource/drivers/npcm: Add NPCM7xx timer driver")
Signed-off-by: Avi Fishman <avifishman70@gmail.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-npcm7xx.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/clocksource/timer-npcm7xx.c b/drivers/clocksource/timer-npcm7xx.c
index 8a30da7f083b..9780ffd8010e 100644
--- a/drivers/clocksource/timer-npcm7xx.c
+++ b/drivers/clocksource/timer-npcm7xx.c
@@ -32,7 +32,7 @@
 #define NPCM7XX_Tx_INTEN		BIT(29)
 #define NPCM7XX_Tx_COUNTEN		BIT(30)
 #define NPCM7XX_Tx_ONESHOT		0x0
-#define NPCM7XX_Tx_OPER			GENMASK(27, 3)
+#define NPCM7XX_Tx_OPER			GENMASK(28, 27)
 #define NPCM7XX_Tx_MIN_PRESCALE		0x1
 #define NPCM7XX_Tx_TDR_MASK_BITS	24
 #define NPCM7XX_Tx_MAX_CNT		0xFFFFFF
@@ -84,8 +84,6 @@ static int npcm7xx_timer_oneshot(struct clock_event_device *evt)
 
 	val = readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
 	val &= ~NPCM7XX_Tx_OPER;
-
-	val = readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
 	val |= NPCM7XX_START_ONESHOT_Tx;
 	writel(val, timer_of_base(to) + NPCM7XX_REG_TCSR0);
 
@@ -97,12 +95,11 @@ static int npcm7xx_timer_periodic(struct clock_event_device *evt)
 	struct timer_of *to = to_timer_of(evt);
 	u32 val;
 
+	writel(timer_of_period(to), timer_of_base(to) + NPCM7XX_REG_TICR0);
+
 	val = readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
 	val &= ~NPCM7XX_Tx_OPER;
-
-	writel(timer_of_period(to), timer_of_base(to) + NPCM7XX_REG_TICR0);
 	val |= NPCM7XX_START_PERIODIC_Tx;
-
 	writel(val, timer_of_base(to) + NPCM7XX_REG_TCSR0);
 
 	return 0;
-- 
2.17.1

