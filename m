Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8E779179
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2019 18:51:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y5Lq5BWBzDqPn
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 02:51:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iMJBO7Cz"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y5L61Yg7zDqFF
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 02:51:09 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id k8so121580411iot.1
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jul 2019 09:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1rG5B+o2VjO9RrL+xsfmgF+x6faimyKuyYbtOh0syfs=;
 b=iMJBO7CzFDXrKhFARbuDHHMTaO9XVZ8Ne4nthG6sBNughIMiW/tIyaCEt/UWLV4snj
 c5Wz8IRuJq5/HBOtvn0tdicUlfabqLSnYTuauXbU0NHzKZxTplbqTcMojnU6W7MO+4Id
 RNB3zlnATDGznsQemONTue4F1yoPEjfvkANdUR246NFIFKZGUuEZ4uoB6BvRwcq0r6Wd
 uIy98cksW9s+alA+MGQ3XTuLQsdIaWUOTb5OFjJ7Gd8OnerwB4SXx2luTuhjyjMxdEnk
 AwmYFVWGDEaXkcW4D5MQ2cvV+IpMvDhwyREZt/uI72HEqxFHqN0RN/77lG8qQi9Pomyk
 zWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1rG5B+o2VjO9RrL+xsfmgF+x6faimyKuyYbtOh0syfs=;
 b=q9pVkc72+2HS9zQGB3GEqMTJHg0/CExaswtq11RIvadFeHUqbBWnfa3pIY5ekkC7vr
 +kUQQOik7lYhMLCv51yrf4PYwBaTw5co4BCQhEcFbdWSkGuHEyENNemWn7J27j9/uBni
 N2FVSbAE9Gq0k236zOU1qSA5/b8PtU08/DBWV8sm0WjdWerPbexQYQcY4vVeEd1uVf9a
 l3pyw1LDt/+5wyGSyKSuNSIP99yF1Eh+3OHdYCcV+cJ/O8J5vWVD7c2gAaN3tfaE1lZk
 U/JqbuCe4rnS9Fpyjy4DAVpNBT6XGTRF1H/+tQEAL8ZSz9nKboo4DTVaC5AeGvibR2fc
 CSgQ==
X-Gm-Message-State: APjAAAWPPSKVU8/Dz/tIRtaSq2XwH8mtrB+PpmN4SUhAGea8vzBNTNDS
 L+2CUXf0vxawb4qtp0qWQwrhF+mDwZoMtwM/sw==
X-Google-Smtp-Source: APXvYqwrO2Cgbb8VcmJ9nnp34EygSZZ0Ch4eVbj7Lx9YeY3iqvmkcPh+cj+5AYR0nZXcZoPcJa+0ZG2wl+BIm/aXwjs=
X-Received: by 2002:a02:cd83:: with SMTP id l3mr78290994jap.66.1564419067206; 
 Mon, 29 Jul 2019 09:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190729164307.200716-1-avifishman70@gmail.com>
In-Reply-To: <20190729164307.200716-1-avifishman70@gmail.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Mon, 29 Jul 2019 19:50:17 +0300
Message-ID: <CAKKbWA6=9rBhR7iTfH27FZXPtuin9FengQh77T6Qgb3XDuZaYA@mail.gmail.com>
Subject: [PATCH] [v4] clocksource/drivers/npcm: fix GENMASK and timer operation
To: Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Avi Fishman <avifishman70@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

NPCM7XX_Tx_OPER GENMASK bits where wrong,
Since NPCM7XX_REG_TICR0 register reset value of those bits was 0,
it did not cause an issue.
in npcm7xx_timer_oneshot() the original NPCM7XX_REG_TCSR0 register was
read again after masking it with ~NPCM7XX_Tx_OPER so the masking didn't
take effect.

npcm7xx_timer_periodic() was not wrong but it wrote to NPCM7XX_REG_TICR0
in a middle of read modify write to NPCM7XX_REG_TCSR0 which is
confusing.
npcm7xx_timer_oneshot() did wrong calculation

Signed-off-by: Avi Fishman <avifishman70@gmail.com>
---
 drivers/clocksource/timer-npcm7xx.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/clocksource/timer-npcm7xx.c
b/drivers/clocksource/timer-npcm7xx.c
index 8a30da7f083b..9780ffd8010e 100644
--- a/drivers/clocksource/timer-npcm7xx.c
+++ b/drivers/clocksource/timer-npcm7xx.c
@@ -32,7 +32,7 @@
 #define NPCM7XX_Tx_INTEN               BIT(29)
 #define NPCM7XX_Tx_COUNTEN             BIT(30)
 #define NPCM7XX_Tx_ONESHOT             0x0
-#define NPCM7XX_Tx_OPER                        GENMASK(27, 3)
+#define NPCM7XX_Tx_OPER                        GENMASK(28, 27)
 #define NPCM7XX_Tx_MIN_PRESCALE                0x1
 #define NPCM7XX_Tx_TDR_MASK_BITS       24
 #define NPCM7XX_Tx_MAX_CNT             0xFFFFFF
@@ -84,8 +84,6 @@ static int npcm7xx_timer_oneshot(struct
clock_event_device *evt)

        val = readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
        val &= ~NPCM7XX_Tx_OPER;
-
-       val = readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
        val |= NPCM7XX_START_ONESHOT_Tx;
        writel(val, timer_of_base(to) + NPCM7XX_REG_TCSR0);

@@ -97,12 +95,11 @@ static int npcm7xx_timer_periodic(struct
clock_event_device *evt)
        struct timer_of *to = to_timer_of(evt);
        u32 val;

+       writel(timer_of_period(to), timer_of_base(to) + NPCM7XX_REG_TICR0);
+
        val = readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
        val &= ~NPCM7XX_Tx_OPER;
-
-       writel(timer_of_period(to), timer_of_base(to) + NPCM7XX_REG_TICR0);
        val |= NPCM7XX_START_PERIODIC_Tx;
-
        writel(val, timer_of_base(to) + NPCM7XX_REG_TCSR0);

        return 0;
--
2.18.0
