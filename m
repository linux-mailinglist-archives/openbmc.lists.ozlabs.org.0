Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11037F1218
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 10:24:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477LhJ0sjszDrcN
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 20:24:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gmeCYOzX"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477LXW25kXzF5Lv
 for <openbmc@lists.ozlabs.org>; Wed,  6 Nov 2019 20:17:31 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id c13so18382148pfp.5
 for <openbmc@lists.ozlabs.org>; Wed, 06 Nov 2019 01:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pvETq++L0sfvJDo0Ujf7rGASfz2pwG/aDIcZe0oPC2w=;
 b=gmeCYOzXzLPuajqx/BaDO/mM62+3JXRT2zxsHIQXBgog+a23S3vi7YNmA5I4boTT9a
 vUKbA6K+oSYrtjxR7kl6xB3MEdC3ImudslALKHq4giEJJmgiAyxYD42s1I3f1ETCJprs
 QDRxD7lQ1kvjebOv9mzKmORDw2Nf6n2GqOjvbiVbf4LGnwk9R00sKb34yHV/PHHP200H
 srn6lEw7CfD3eEx4nKoEQZ55OL7ncb+w+mBnvs29gqwEGqdwF6x/4M6EjvXfhgQa4Nf6
 TEReYoxUF9jYuSKhbfml5hQu4SXmBZPIxUEvz8hjE9iMj6FvfTMmfTeCiuQhMq0UWMs+
 H21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pvETq++L0sfvJDo0Ujf7rGASfz2pwG/aDIcZe0oPC2w=;
 b=OAqVhc3rXgF8LaVHUC97RPYO8uVNJnqjPhkVokOt2UBSozBO7cz6LY3JA0bPoLxse1
 PgKKuDe+WQlzr8yKKWepojMGI94PraAJ2Lb1PqKn2fLHZY5AaAkWPcrFVtxylLTu4qIY
 gkSumM0eHBQmq/K/uc7hsAvx+1AHtL14PPDUA9sB14PCGvYZOwtm2r+zHireCIL+WI95
 xvGrBxEPECVo3wxXBVrcLPFhgJIrdKOwQIllUcYfJ/ukMkpDzgCn3/P2zgbxHTLIV0o7
 89oVlwWNtwCQocDD39mQKPKSRHoJ/2ECvehMvInLkDS6MTU/32X9peq0K3TgFYFA/k4y
 Xyxg==
X-Gm-Message-State: APjAAAWD/HSMz5ummhVluoTrMZn98WMjNyNdX8fgKUAL1IdPpPcxhXD2
 mIeLNx9YjNKEsq0wATi6Bx8f6Fh9QnQ=
X-Google-Smtp-Source: APXvYqwsQyJZyePXNaDdUOWvGefXlxpAL+UgKzUqGuCdWqMFga+rIQnrRvvZ2yJQ18Sf/iWtyztOGQ==
X-Received: by 2002:a17:90a:8816:: with SMTP id
 s22mr2437717pjn.31.1573031848502; 
 Wed, 06 Nov 2019 01:17:28 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id j25sm21144182pfi.113.2019.11.06.01.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 01:17:27 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH linux dev-5.3 4/4] clocksource: fttmr010: Add support for
 ast2600
Date: Wed,  6 Nov 2019 19:47:05 +1030
Message-Id: <20191106091705.7416-5-joel@jms.id.au>
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

The ast2600 has some minor differences to previous versions. The
interrupt handler must acknowledge the timer interrupt in a status
register. Secondly the control register becomes write to set only,
requiring the use of a separate set to clear register.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/clocksource/timer-fttmr010.c | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/clocksource/timer-fttmr010.c b/drivers/clocksource/timer-fttmr010.c
index 8a79025339d0..688d540ebddd 100644
--- a/drivers/clocksource/timer-fttmr010.c
+++ b/drivers/clocksource/timer-fttmr010.c
@@ -37,6 +37,11 @@
 #define TIMER3_MATCH2		(0x2c)
 #define TIMER_CR		(0x30)
 
+/*
+  Control register set to clear for ast2600 only.
+ */
+#define TIMER_CR_CLR		(0x3c)
+
 /*
  * Control register (TMC30) bit fields for fttmr010/gemini/moxart timers.
  */
@@ -163,6 +168,16 @@ static int fttmr010_timer_set_next_event(unsigned long cycles,
 	return 0;
 }
 
+static int ast2600_timer_shutdown(struct clock_event_device *evt)
+{
+	struct fttmr010 *fttmr010 = to_fttmr010(evt);
+
+	/* Stop */
+	writel(fttmr010->t1_enable_val, fttmr010->base + TIMER_CR_CLR);
+
+	return 0;
+}
+
 static int fttmr010_timer_shutdown(struct clock_event_device *evt)
 {
 	struct fttmr010 *fttmr010 = to_fttmr010(evt);
@@ -244,6 +259,17 @@ static irqreturn_t fttmr010_timer_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t ast2600_timer_interrupt(int irq, void *dev_id)
+{
+	struct clock_event_device *evt = dev_id;
+	struct fttmr010 *fttmr010 = to_fttmr010(evt);
+
+	writel(0x1, fttmr010->base + TIMER_INTR_STATE);
+
+	evt->event_handler(evt);
+	return IRQ_HANDLED;
+}
+
 static int __init fttmr010_common_init(struct device_node *np,
 		bool is_aspeed,
 		int (*timer_shutdown)(struct clock_event_device *),
@@ -404,6 +430,13 @@ static int __init fttmr010_common_init(struct device_node *np,
 	return ret;
 }
 
+static __init int ast2600_timer_init(struct device_node *np)
+{
+	return fttmr010_common_init(np, true,
+			ast2600_timer_shutdown,
+			ast2600_timer_interrupt);
+}
+
 static __init int aspeed_timer_init(struct device_node *np)
 {
 	return fttmr010_common_init(np, true,
@@ -423,3 +456,4 @@ TIMER_OF_DECLARE(gemini, "cortina,gemini-timer", fttmr010_timer_init);
 TIMER_OF_DECLARE(moxart, "moxa,moxart-timer", fttmr010_timer_init);
 TIMER_OF_DECLARE(ast2400, "aspeed,ast2400-timer", aspeed_timer_init);
 TIMER_OF_DECLARE(ast2500, "aspeed,ast2500-timer", aspeed_timer_init);
+TIMER_OF_DECLARE(ast2600, "aspeed,ast2600-timer", ast2600_timer_init);
-- 
2.24.0.rc1

