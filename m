Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06369686D1
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2019 12:07:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nK2R3R1HzDqXw
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2019 20:07:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d44; helo=mail-io1-xd44.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GYy92tES"; 
 dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nK1t28HczDqTk
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 20:06:40 +1000 (AEST)
Received: by mail-io1-xd44.google.com with SMTP id j5so28929501ioj.8
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 03:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=7BCsDJdR5KYaMX3UQplQ6QtuJPUxTxnY/Qc6vVf7TgQ=;
 b=GYy92tES6qIGd/FIHRU6kRF7gZ31p54OfCxRbJbYisMyC/+rU33OJmZIF2+efTUmQA
 GHp9oJGW0ZvI+rDBtptxV+fhyWMBj8rDCYHXlGOH5Q1i9ohJfLEs5Rxg+TNq8MR5fUqL
 Zm5Z03pX2eIT8pG0HmDf6gvujkAK7Z8YwCm9QsiXxmwsnps2gOc7KhM8VDvPnYQrvj9Z
 +DEDygP/VQtYtkycxkPHBjbDOjuK8DbUHf2Yy85pghaRqGvCzUOqzycLGo4Kgy+nu+tT
 aWOGUXSDvF3EVXr8kp407JlZhQzWOKoaG3Hm2Th2ThpVRed+QFUEAHvAKSgXvCvbI0Bq
 YMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=7BCsDJdR5KYaMX3UQplQ6QtuJPUxTxnY/Qc6vVf7TgQ=;
 b=az+mR2SbtSrsjizBSE2Euby0p20ty+8X/SGoXgOVSv6W4oDqeEJ/M/KiYNplXK7kqN
 uU0bTlsfbJ4bdrHPwV4Hun6GKjj8PhRCtfEb29l/dHwq2CWyjovOxTfUmcbza27f8ADJ
 KB08K3GDHM+aoLknP/jDuzquoj6o4D7Gpd+doOcNbdAYkGZx1sooChE1+og4yC9BajCn
 VLy28iRQaRJDVhBi/Fb9s6PHSYiEzFmZizL3HfbibnVxIK6i6lCuq/Qp9drVA+Rkin2u
 S3B69RnauvzZwM589tA1wUnqGkm7X+6EluGpXl/TMMdgStAvnTcO2bs6DTm3vUIdclMD
 OFiA==
X-Gm-Message-State: APjAAAV5MetVlV8UdOsLpLXUNMc9SMBpctkEY3PHWmHi+iRRA0kjgpwI
 RL/fYNfzB9Yesiz64vbLZWx6raV7CFdTXNuXYg==
X-Google-Smtp-Source: APXvYqzLyQe68of5s4q1xFU+Vjpm9l+XKtN5xcapebvBPyqO7sHkGHN5DoefuGT/Cx93PuqqDhC13MKJ47cNQrcCHU8=
X-Received: by 2002:a5d:96cc:: with SMTP id r12mr13141421iol.99.1563185198579; 
 Mon, 15 Jul 2019 03:06:38 -0700 (PDT)
MIME-Version: 1.0
From: Avi Fishman <avifishman70@gmail.com>
Date: Mon, 15 Jul 2019 13:05:51 +0300
Message-ID: <CAKKbWA6S7KotAFtLO=ow=XYnLL2Ny5Mz2kcgM1cs+j=5mHQNmw@mail.gmail.com>
Subject: [PATCH] clocksource/drivers/npcm: fix GENMASK and timer operation
To: Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
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

NPCM7XX_Tx_OPER GENMASK was wrong,
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
