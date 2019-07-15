Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4A76987F
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2019 17:44:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nSX42GC6zDqVb
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2019 01:44:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="U1qTWOmN"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nSVr3HgqzDq6q
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2019 01:43:47 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id k20so34771104ios.10
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 08:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2ux4r2/PNo8POgrTWBBb9IwIfMsL91QvApA0a47O8zQ=;
 b=U1qTWOmNtX6PNvymsBLNcI7hc6yrlxBO4qqxO7yZStMeLK1saH667xnPH3p3Q8H3Fo
 qY/2p0TyE18U5+WG+fwMapRAZ/ULPxOhndS9KfZd1oyNwAoKnOqU5CsbZaM/FWHFZywN
 ZhhLbxF2XNtZfxeX+NqD1ODiLuqF66ek0PtiC/03BgNqIqWOmDdH3eI/D2ib3QVHwCf4
 pZ3yLIqHreKDMAwOOKLyxleDUKRpemewDRU+ycAmOuHaLdgSxZ+nH++1VibBSPqAxGwQ
 GjzG1egRLI19c0ECiqcOguG09ZfZPXX5kcQgh4PW8mXNWdW/QocunocZPd7WKLtj0G6J
 tBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2ux4r2/PNo8POgrTWBBb9IwIfMsL91QvApA0a47O8zQ=;
 b=PIbM8cW7FPzSJz/uUZ360OlEyiXj3zfHwPQUkn7PTB1tba8OfDqgqu7CgmCsaMlk78
 3f51AkafjlYI4aUpc++BF3FnnTBhdi+3epv6pNwOQmcVBDZEcVFfL1XBV1Y8jmWyGdcU
 vRrKu8OC17/0ZeKiL39oi4h7rvHHfCglAuIOH5O3h9MIZaZq33AMEjf5Th2krK7jWuG1
 aiTw7xLDUmmkKV+UMEX4ucZhg7DFhwDImnvb0aKkFRlEJ0jnpF9p/wa2CrCK7CNpmSem
 vt926K4Kzq4oHQHHDNijPEAwwb+YI/Ggrksc/nkdKLa3qfMVYGbb26CJOXUGEKSaSDIt
 /63g==
X-Gm-Message-State: APjAAAWTMyjgfhEsDQ9JD9hN6Iv/n5YWF79Sk7tmTU6TZ4dTYyi1uJaC
 wBbnjeULxEYgHJg5bxNQcs/DddO66MPo82sA9A==
X-Google-Smtp-Source: APXvYqzUvnC3d2mQv2FQYTr+0Qc6tfJdHOGsUKJd6KbPMqOD4BSCg93CCwy6F2lvkLet3DUSvZS5iv1emwrtu0a/Pq0=
X-Received: by 2002:a5e:a712:: with SMTP id b18mr25011425iod.220.1563205426117; 
 Mon, 15 Jul 2019 08:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAKKbWA6S7KotAFtLO=ow=XYnLL2Ny5Mz2kcgM1cs+j=5mHQNmw@mail.gmail.com>
 <CAKKbWA5nwsa5kcZ8GCuC3WKJptb6RtZ65izFphd=KaALqeg+BA@mail.gmail.com>
In-Reply-To: <CAKKbWA5nwsa5kcZ8GCuC3WKJptb6RtZ65izFphd=KaALqeg+BA@mail.gmail.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Mon, 15 Jul 2019 18:42:58 +0300
Message-ID: <CAKKbWA5AuDRDuczTd+tonhc7hi3L=nKX5MCjbspOvAPNR9odyg@mail.gmail.com>
Subject: [PATCH] [v3] clocksource/drivers/npcm: fix GENMASK and timer operation
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

clocksource/drivers/npcm: fix GENMASK and timer operation

NPCM7XX_Tx_OPER GENMASK() changed from (27, 3) to (28, 27)
Since NPCM7XX_REG_TICR0 register reset value of those bits was 0,
it did not cause an issue

in npcm7xx_timer_oneshot() the original NPCM7XX_REG_TCSR0 register was
read again after masking it with ~NPCM7XX_Tx_OPER so the masking didn't
take effect.

npcm7xx_timer_periodic() was not wrong but it wrote to NPCM7XX_REG_TICR0
in a middle of read modify write to NPCM7XX_REG_TCSR0 which is
confusing.

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
