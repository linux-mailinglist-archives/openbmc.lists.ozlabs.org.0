Return-Path: <openbmc+bounces-405-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AC4B12780
	for <lists+openbmc@lfdr.de>; Sat, 26 Jul 2025 01:35:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bpkl06ySDz30PF;
	Sat, 26 Jul 2025 09:35:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753486540;
	cv=none; b=h+zc11u5rbusHxW+MhYTj/DVbYp1wSBr/E9Em7lBwb3kRowN1Oydmd/6h/+dul4VH7631cUOhoPn5MPWlWuu4NP4bWKEpzuhB2qCnLqTR16qF7wH1t44fXJWLSc3gt+tn013Ggepu3A8g3ISi8rVvU46ajGts7F9gmWaAEA35REn86hvdRTSk0WAFK2TvZD5D3+4+il7ojD+9g6uOKJ1FNHzFmkfQ2u1ulQOntSsfgjPnuhPJTwUd9CCIiRnIfWJ+Y2p13rYS7FxNkwwDksICDRHRHx00V7xX+Ry+/QN3axsr+kDcTGSP4bixL1cDMm4ckIYRQtDG8WmD+e+BPzCEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753486540; c=relaxed/relaxed;
	bh=BUWxFVay5Uvb/Ee/VbOABwzsIKnSVTbfr5wEdAvDZCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ixQKqZ/LOA4e9Q4qSSxqhLdRbNZRRSY3WYwwBbD6m1ikTJA1wScxNlmsEJoONLM1K8hl1rsZa6DNNmUTlCgXiyJcKNPKYxPuBh7DHChEq9GiZF24GlEooqA5dtGu3zqAyLxzOXWUJbKWUGoG6WQLY38K0bqP/D8LbjT6zUsw0j01RK7eOb2lq3DpgS0EpZoXzpEw7GwHB5dZLglwvecJ0p+KTHkqVxZWb/wIDb5brxK8qqhlyMrLR0XrE/BsWDH5tWDk4PZTPnRhxl+DqDAsiHlkGP+vehJXeQdMVBWddlVmmQEHVQKsrhvQsfJnVppIUkbeGZbmGPu58b89EyXqOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TwQE6fPk; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TwQE6fPk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bpkkz163pz30FR
	for <openbmc@lists.ozlabs.org>; Sat, 26 Jul 2025 09:35:37 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-311c95ddfb5so2084180a91.2
        for <openbmc@lists.ozlabs.org>; Fri, 25 Jul 2025 16:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753486535; x=1754091335; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BUWxFVay5Uvb/Ee/VbOABwzsIKnSVTbfr5wEdAvDZCI=;
        b=TwQE6fPkVxGLWlRYmwDWJcbzdX57EyFu7gJ9veWhfZspw2+6c5rixW6/S8zgLXlepM
         /OzFXTwpvk03rYxOiaPeo5YZY4HnZuxKwZBmnJb1ZPhFBbQojdU/xBuF05Il9NHZDTUZ
         WsdbsiEp4XbD8pETGHgOJYE4yEcXeH9zKd1puGhuw1yFdQeTRwnhLDUjorh6Gawzl303
         /OSIHCYa+5/mDOWHwuF9jcTkna5IVVCe+mcoZWVR4giocIGwMAMthnX4SsN+FV3NZyWM
         RR9xn2VSPbvvjTAM8swIq9tMw19K4jKoCJ5sPhdh/KK09kl+KHogBa/fqYegHuKEZbF1
         MvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753486535; x=1754091335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BUWxFVay5Uvb/Ee/VbOABwzsIKnSVTbfr5wEdAvDZCI=;
        b=WRBuVq58snGLTfxgdoMKMt6f/TaY9CBxJAEvyfvUZebAjpMJ+bMLXo6mbE9MGVGLqh
         fIUWkzvn2+Cvezc8kzrh+5c7Sp5RZs20WMNFSt2Rj3UhJZArTImt/0ODoa1GFgzOmBjd
         HxiOHkgA3ezT2JehDpUFkclY0QDct4m13NitseyebtfpnjGOE11nPAfofpUekIRSrchA
         hDlBC4mG0tNER2AbyEubCe5woN9CRQ9tj8dQrpzTw+GC0uv/eeZsuzgn+cKWfBMAFbWt
         lmEvO5OKmYrx1woJZ/sqhgIyX77DDvGECGMALvgfXTeGCX3xCv7yGFc37Ne4Fw8Qe2G+
         hfPg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ0Z+B+JHnSveOSV0C5DKQsaMsc7OGUFQ6lDajk29FTglpWrQjyq7GgWkdlkMS5lRx+I68GD+l@lists.ozlabs.org
X-Gm-Message-State: AOJu0YymWX58gQiSgkfSfWQoB6zc7O0FKVWknmP85ZW/bZE9XwrGh1np
	qau54e478JpjkuyGrEXg1RJL1s6Qa9WNGW8w+f5VLmaIav4DvwGKD7HA
X-Gm-Gg: ASbGnctANmHxyhJFCJfTP5/LQ73p5GxwZNvC/J+WkndCK7IGxrU3gA35UH/vtT2WMFt
	80bEoayB3p1vgseP+I3bEgj0ixJlQ9Lpr6G9jKyJzPwOJZrEnJtOfR6rh+9OJF5/1aQt9PBil2e
	E4SCI00qXQnsyvoNDDUfW03W/KxGKGoqBhRPUAMCyc0+ZJ8pDpYtkvHJ3MsS6+mbua6pDZqitH7
	ZAswW3TJpZT34+k05qkE0eosSIbbdjxPXrp+qYh1fNrMYTlQJf1K64PfKD1QoTap09V4qI0FPmK
	q1xLBQLCE0qLEMrDHvU7EmezXtu0PrM5j/AwRw/++OyhCXyuCADbDITCzBY9rf2V6A4XM4FgL8e
	Mn8nd8eQDeT/mm9RC7mo9GhPlMyCZsqjuZLPfrta1bs78MEJyI1Y1n6Jt1Y8ebHhAapz9/QEZh+
	4iRwYXTePNdZQGFlg1I8/IOcMiOCj88azL/Q==
X-Google-Smtp-Source: AGHT+IEogG8c5vbGfewihosRMKwMcktbBMLd+1Qzr5iJPFZwkIf4wFI5A8qbnIAXdgkHGtBFtm8yKQ==
X-Received: by 2002:a17:90a:e187:b0:315:9cae:bd8 with SMTP id 98e67ed59e1d1-31e77a02721mr4859840a91.23.1753486534717;
        Fri, 25 Jul 2025 16:35:34 -0700 (PDT)
Received: from cosmo-ubuntu-2404.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e6625070csm4367507a91.1.2025.07.25.16.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 16:35:34 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: chou.cosmo@gmail.com,
	cosmo.chou@quantatw.com,
	Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH linux dev-6.6] gpio: pca953x: Add support for level-triggered interrupts
Date: Sat, 26 Jul 2025 07:34:59 +0800
Message-ID: <20250725233459.22315-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Potin Lai <potin.lai.pt@gmail.com>

Adds support for level-triggered interrupts in the PCA953x GPIO
expander driver. Previously, the driver only supported edge-triggered
interrupts, which could lead to missed events in scenarios where an
interrupt condition persists until it is explicitly cleared.

By enabling level-triggered interrupts, the driver can now detect and
respond to sustained interrupt conditions more reliably.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
Link: https://lore.kernel.org/r/20250409-gpio-pca953x-level-triggered-irq-v3-1-7f184d814934@gmail.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
[Cosmo: Resolved merge conflicts for backport]
Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 drivers/gpio/gpio-pca953x.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index faadbe66b23e..07951ca1cf56 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -207,6 +207,8 @@ struct pca953x_chip {
 	DECLARE_BITMAP(irq_stat, MAX_LINE);
 	DECLARE_BITMAP(irq_trig_raise, MAX_LINE);
 	DECLARE_BITMAP(irq_trig_fall, MAX_LINE);
+	DECLARE_BITMAP(irq_trig_level_high, MAX_LINE);
+	DECLARE_BITMAP(irq_trig_level_low, MAX_LINE);
 #endif
 	atomic_t wakeup_path;
 
@@ -767,6 +769,8 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 	pca953x_read_regs(chip, chip->regs->direction, reg_direction);
 
 	bitmap_or(irq_mask, chip->irq_trig_fall, chip->irq_trig_raise, gc->ngpio);
+	bitmap_or(irq_mask, irq_mask, chip->irq_trig_level_high, gc->ngpio);
+	bitmap_or(irq_mask, irq_mask, chip->irq_trig_level_low, gc->ngpio);
 	bitmap_complement(reg_direction, reg_direction, gc->ngpio);
 	bitmap_and(irq_mask, irq_mask, reg_direction, gc->ngpio);
 
@@ -783,7 +787,7 @@ static int pca953x_irq_set_type(struct irq_data *d, unsigned int type)
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
-	if (!(type & IRQ_TYPE_EDGE_BOTH)) {
+	if (!(type & IRQ_TYPE_SENSE_MASK)) {
 		dev_err(&chip->client->dev, "irq %d: unsupported type %d\n",
 			d->irq, type);
 		return -EINVAL;
@@ -791,6 +795,8 @@ static int pca953x_irq_set_type(struct irq_data *d, unsigned int type)
 
 	assign_bit(hwirq, chip->irq_trig_fall, type & IRQ_TYPE_EDGE_FALLING);
 	assign_bit(hwirq, chip->irq_trig_raise, type & IRQ_TYPE_EDGE_RISING);
+	assign_bit(hwirq, chip->irq_trig_level_low, type & IRQ_TYPE_LEVEL_LOW);
+	assign_bit(hwirq, chip->irq_trig_level_high, type & IRQ_TYPE_LEVEL_HIGH);
 
 	return 0;
 }
@@ -803,6 +809,8 @@ static void pca953x_irq_shutdown(struct irq_data *d)
 
 	clear_bit(hwirq, chip->irq_trig_raise);
 	clear_bit(hwirq, chip->irq_trig_fall);
+	clear_bit(hwirq, chip->irq_trig_level_low);
+	clear_bit(hwirq, chip->irq_trig_level_high);
 }
 
 static void pca953x_irq_print_chip(struct irq_data *data, struct seq_file *p)
@@ -833,6 +841,7 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, unsigned long *pendin
 	DECLARE_BITMAP(cur_stat, MAX_LINE);
 	DECLARE_BITMAP(new_stat, MAX_LINE);
 	DECLARE_BITMAP(trigger, MAX_LINE);
+	DECLARE_BITMAP(edges, MAX_LINE);
 	int ret;
 
 	ret = pca953x_read_regs(chip, chip->regs->input, cur_stat);
@@ -850,13 +859,26 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, unsigned long *pendin
 
 	bitmap_copy(chip->irq_stat, new_stat, gc->ngpio);
 
-	if (bitmap_empty(trigger, gc->ngpio))
-		return false;
+	if (bitmap_empty(chip->irq_trig_level_high, gc->ngpio) &&
+	    bitmap_empty(chip->irq_trig_level_low, gc->ngpio)) {
+		if (bitmap_empty(trigger, gc->ngpio))
+			return false;
+	}
 
 	bitmap_and(cur_stat, chip->irq_trig_fall, old_stat, gc->ngpio);
 	bitmap_and(old_stat, chip->irq_trig_raise, new_stat, gc->ngpio);
-	bitmap_or(new_stat, old_stat, cur_stat, gc->ngpio);
-	bitmap_and(pending, new_stat, trigger, gc->ngpio);
+	bitmap_or(edges, old_stat, cur_stat, gc->ngpio);
+	bitmap_and(pending, edges, trigger, gc->ngpio);
+
+	bitmap_and(cur_stat, new_stat, chip->irq_trig_level_high, gc->ngpio);
+	bitmap_and(cur_stat, cur_stat, chip->irq_mask, gc->ngpio);
+	bitmap_or(pending, pending, cur_stat, gc->ngpio);
+
+	bitmap_complement(cur_stat, new_stat, gc->ngpio);
+	bitmap_and(cur_stat, cur_stat, reg_direction, gc->ngpio);
+	bitmap_and(old_stat, cur_stat, chip->irq_trig_level_low, gc->ngpio);
+	bitmap_and(old_stat, old_stat, chip->irq_mask, gc->ngpio);
+	bitmap_or(pending, pending, old_stat, gc->ngpio);
 
 	return !bitmap_empty(pending, gc->ngpio);
 }
-- 
2.43.0


