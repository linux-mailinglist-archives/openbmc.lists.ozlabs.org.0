Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B22D6F1203
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 10:21:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477Ld55D5YzF3Dv
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 20:21:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aDoMLVEk"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477LXP2R45zDqJX
 for <openbmc@lists.ozlabs.org>; Wed,  6 Nov 2019 20:17:25 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id 3so18377567pfb.10
 for <openbmc@lists.ozlabs.org>; Wed, 06 Nov 2019 01:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3naVDG9c+hz6/Z7X8/ImB3hSE5w7Qy3YFszuHTpM04M=;
 b=aDoMLVEkxtF5zSUL1p2RaE4uSEyrF8ZYCrHnYaqHVvUZtgvYbH9TOkbUiCkT03zGJC
 wUh8TYyNo0VVWLKhdBlKCEhT/HRt9k8K8OeM61vyTVCCompuSIXcz48vjv5A1EiyeVzS
 ZjLcLFTE8aUTWauQjKREZPtNb3mL8z3TVBhBgEX9vdjGuIgiaqKeheRZ2Ed3TU4+cI3N
 kpsVuilLdkjICfs9KqVqdEJtaBCJ8PTI9B/f+1jWb9aw/i+llQT7xSrKXDyPzcKos3mS
 Ky8uvFPCa7p9OXNSqa0t8JB1WEIAzdiAEjTzg3PfwC5wxwmsTRPgCbEbYWbRm+Twd6Qd
 T6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3naVDG9c+hz6/Z7X8/ImB3hSE5w7Qy3YFszuHTpM04M=;
 b=mCBpuU09ihM7aGTqkXiPn6wn9mL/AICfeklt1MtLD0/TZjC27ZET6xv4u8kJC/wuhy
 pcwGyVi5GHq38AEiyLr0eoDqqfxFcdMNcFbV6usCK4MWpdJTy2kM3886xHbq9CsIVN65
 8Vrp+sn7yGblC9WEi+h3Omvv2eYAxcvCz87H4rGbgBtESARbO1m4xkr3oBMBTNj3fRVS
 aP/IwJxuVgebbt/CgEmRbX1xbQznkLL45MLk5WJ/2BCXfkaPQ8J7FID9BEdCmK3oEod5
 qh+0UrkrPKwfhQB2hLkRedbj5Ia8XA9Rc6GGF4PJN6TbwaWK4ovct1xE/RBPMfmctDCF
 eZmQ==
X-Gm-Message-State: APjAAAWetoucU6j/m5TeJu0LQq+7+kgqAGwxggvnWWTFh/qxaOZ/Lt2a
 3xcTRGHUy9YcTNZb8TKIvYN5Gw6TrGg=
X-Google-Smtp-Source: APXvYqydKI0Qwa5kYGrHg+Wj7HXNaZr7SVlzVDtUATnOP4DILsaBtxQWY6Xl7EibmTAu37muqtoZIA==
X-Received: by 2002:aa7:8dd4:: with SMTP id j20mr2046061pfr.36.1573031842683; 
 Wed, 06 Nov 2019 01:17:22 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id j25sm21144182pfi.113.2019.11.06.01.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 01:17:22 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH linux dev-5.3 2/4] clocksource: fttmr010: Parametrise shutdown
Date: Wed,  6 Nov 2019 19:47:03 +1030
Message-Id: <20191106091705.7416-3-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191106091705.7416-1-joel@jms.id.au>
References: <20191106091705.7416-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In preparation for supporting the ast2600 which uses a different method
to clear bits in the control register, use a callback for performing the
shutdown sequence.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/clocksource/timer-fttmr010.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/clocksource/timer-fttmr010.c b/drivers/clocksource/timer-fttmr010.c
index fadff7915dd9..c2d30eb9dc72 100644
--- a/drivers/clocksource/timer-fttmr010.c
+++ b/drivers/clocksource/timer-fttmr010.c
@@ -97,6 +97,7 @@ struct fttmr010 {
 	bool is_aspeed;
 	u32 t1_enable_val;
 	struct clock_event_device clkevt;
+	int (*timer_shutdown)(struct clock_event_device *evt);
 #ifdef CONFIG_ARM
 	struct delay_timer delay_timer;
 #endif
@@ -140,9 +141,7 @@ static int fttmr010_timer_set_next_event(unsigned long cycles,
 	u32 cr;
 
 	/* Stop */
-	cr = readl(fttmr010->base + TIMER_CR);
-	cr &= ~fttmr010->t1_enable_val;
-	writel(cr, fttmr010->base + TIMER_CR);
+	fttmr010->timer_shutdown(evt);
 
 	if (fttmr010->is_aspeed) {
 		/*
@@ -183,9 +182,7 @@ static int fttmr010_timer_set_oneshot(struct clock_event_device *evt)
 	u32 cr;
 
 	/* Stop */
-	cr = readl(fttmr010->base + TIMER_CR);
-	cr &= ~fttmr010->t1_enable_val;
-	writel(cr, fttmr010->base + TIMER_CR);
+	fttmr010->timer_shutdown(evt);
 
 	/* Setup counter start from 0 or ~0 */
 	writel(0, fttmr010->base + TIMER1_COUNT);
@@ -211,9 +208,7 @@ static int fttmr010_timer_set_periodic(struct clock_event_device *evt)
 	u32 cr;
 
 	/* Stop */
-	cr = readl(fttmr010->base + TIMER_CR);
-	cr &= ~fttmr010->t1_enable_val;
-	writel(cr, fttmr010->base + TIMER_CR);
+	fttmr010->timer_shutdown(evt);
 
 	/* Setup timer to fire at 1/HZ intervals. */
 	if (fttmr010->is_aspeed) {
@@ -350,6 +345,8 @@ static int __init fttmr010_common_init(struct device_node *np, bool is_aspeed)
 				     fttmr010->tick_rate);
 	}
 
+	fttmr010->timer_shutdown = fttmr010_timer_shutdown;
+
 	/*
 	 * Setup clockevent timer (interrupt-driven) on timer 1.
 	 */
@@ -370,10 +367,10 @@ static int __init fttmr010_common_init(struct device_node *np, bool is_aspeed)
 	fttmr010->clkevt.features = CLOCK_EVT_FEAT_PERIODIC |
 		CLOCK_EVT_FEAT_ONESHOT;
 	fttmr010->clkevt.set_next_event = fttmr010_timer_set_next_event;
-	fttmr010->clkevt.set_state_shutdown = fttmr010_timer_shutdown;
+	fttmr010->clkevt.set_state_shutdown = fttmr010->timer_shutdown;
 	fttmr010->clkevt.set_state_periodic = fttmr010_timer_set_periodic;
 	fttmr010->clkevt.set_state_oneshot = fttmr010_timer_set_oneshot;
-	fttmr010->clkevt.tick_resume = fttmr010_timer_shutdown;
+	fttmr010->clkevt.tick_resume = fttmr010->timer_shutdown;
 	fttmr010->clkevt.cpumask = cpumask_of(0);
 	fttmr010->clkevt.irq = irq;
 	clockevents_config_and_register(&fttmr010->clkevt,
-- 
2.24.0.rc1

