Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE67AF1211
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 10:22:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477LfP5RtfzF4gb
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 20:22:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="M93SoCoX"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477LXS2m0bzF5MM
 for <openbmc@lists.ozlabs.org>; Wed,  6 Nov 2019 20:17:28 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id r4so18374942pfl.7
 for <openbmc@lists.ozlabs.org>; Wed, 06 Nov 2019 01:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wigKnx55CwbHshgUiFaVzzGEeLAYy1kZhbF9mN3t1iQ=;
 b=M93SoCoX6NGKhxLcMHK6yD8OLOV98ETw9xpKB09+P6d2sgllOn7Xw+fxNcwJUwsGjh
 uVYuavR+ZLHQxpHJ6QHXfwCuupZ3AbjijTs4eJrmr56DL/pTtJDlYj+opQqJg1830Ewj
 ws2Tsosa4U2FntGnISHssehTMycyxWkhpeCN2MSQQBU7NirrbYLQG0uMcHV+vvfGBM5e
 aTelfrYw0X1oNnm3TyT1k0O9cORh/DbVVDy0uYU2R446w4hF+3ScEzAslwFBbfhBawHk
 QxSeJbXb5/xyKyTjOHjgiEkEFHDY8zwoSN7/TvB7ljkgsZujz94ituVY1iiCwSTHv98M
 tlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wigKnx55CwbHshgUiFaVzzGEeLAYy1kZhbF9mN3t1iQ=;
 b=FnD5r9VKMpLqxYua53HLk5zxspO3H4g6zH/daoJF5hFS/aZZvrGOdKo7lgPekSw+s/
 n/l/lh9d1PMg+QznMSEtrqWMAekJwnlDgZrw4qAWAYO2HqJYwWVGMzLNCMOLQD4dnydB
 rFi4CQZImfiHe+f/sCcebtg/DXLMBlLE3D4rktNE/xvc8nBrtjWZ6mZbZ5cfnKhb5BiJ
 tD+9Ct6aZLA6HRQg6m+uDjGYl4tFKxpbl2DcU6qb4hF1U6C7l1LDFY3yO5mlLDLfa4Db
 /tmyKgsRSzepdU9EYpEd6y8fjdRB8pPWs2tAu0+/RHIDM4oHUgGO8T8QlCKwGYel4k9Y
 GURw==
X-Gm-Message-State: APjAAAUESI3SBBfHWsLR32QibACXaQdNFJ3fwkwk4+IhSfFakqVddFSO
 6sezrEiD4857bk+0vTvHMwwroyD0/fU=
X-Google-Smtp-Source: APXvYqybLvep9fnAeTDrOlvBB1Pokcjwl4lVIVwDnvL5Q8kciN2ih3aUyqha1ywO2IJFMJuU7ntePA==
X-Received: by 2002:aa7:8197:: with SMTP id g23mr1993814pfi.247.1573031845465; 
 Wed, 06 Nov 2019 01:17:25 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id j25sm21144182pfi.113.2019.11.06.01.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 01:17:24 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH linux dev-5.3 3/4] clocksource: fttmr010: Set interrupt and
 shutdown
Date: Wed,  6 Nov 2019 19:47:04 +1030
Message-Id: <20191106091705.7416-4-joel@jms.id.au>
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

In preparation for supporting the ast2600, pass the shutdown and
interrupt functions to the common init callback.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/clocksource/timer-fttmr010.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/timer-fttmr010.c b/drivers/clocksource/timer-fttmr010.c
index c2d30eb9dc72..8a79025339d0 100644
--- a/drivers/clocksource/timer-fttmr010.c
+++ b/drivers/clocksource/timer-fttmr010.c
@@ -244,7 +244,10 @@ static irqreturn_t fttmr010_timer_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int __init fttmr010_common_init(struct device_node *np, bool is_aspeed)
+static int __init fttmr010_common_init(struct device_node *np,
+		bool is_aspeed,
+		int (*timer_shutdown)(struct clock_event_device *),
+		irq_handler_t handler)
 {
 	struct fttmr010 *fttmr010;
 	int irq;
@@ -345,7 +348,7 @@ static int __init fttmr010_common_init(struct device_node *np, bool is_aspeed)
 				     fttmr010->tick_rate);
 	}
 
-	fttmr010->timer_shutdown = fttmr010_timer_shutdown;
+	fttmr010->timer_shutdown = timer_shutdown;
 
 	/*
 	 * Setup clockevent timer (interrupt-driven) on timer 1.
@@ -354,7 +357,7 @@ static int __init fttmr010_common_init(struct device_node *np, bool is_aspeed)
 	writel(0, fttmr010->base + TIMER1_LOAD);
 	writel(0, fttmr010->base + TIMER1_MATCH1);
 	writel(0, fttmr010->base + TIMER1_MATCH2);
-	ret = request_irq(irq, fttmr010_timer_interrupt, IRQF_TIMER,
+	ret = request_irq(irq, handler, IRQF_TIMER,
 			  "FTTMR010-TIMER1", &fttmr010->clkevt);
 	if (ret) {
 		pr_err("FTTMR010-TIMER1 no IRQ\n");
@@ -403,12 +406,16 @@ static int __init fttmr010_common_init(struct device_node *np, bool is_aspeed)
 
 static __init int aspeed_timer_init(struct device_node *np)
 {
-	return fttmr010_common_init(np, true);
+	return fttmr010_common_init(np, true,
+			fttmr010_timer_shutdown,
+			fttmr010_timer_interrupt);
 }
 
 static __init int fttmr010_timer_init(struct device_node *np)
 {
-	return fttmr010_common_init(np, false);
+	return fttmr010_common_init(np, false,
+			fttmr010_timer_shutdown,
+			fttmr010_timer_interrupt);
 }
 
 TIMER_OF_DECLARE(fttmr010, "faraday,fttmr010", fttmr010_timer_init);
-- 
2.24.0.rc1

