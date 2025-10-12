Return-Path: <openbmc+bounces-729-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4C2BD0078
	for <lists+openbmc@lfdr.de>; Sun, 12 Oct 2025 10:24:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cktnM0qnJz3cYx;
	Sun, 12 Oct 2025 19:24:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760257479;
	cv=none; b=NWu3OW817+zNnamrbNxXvJqYeRPTQzrL8x5ACJQ0PjC6EfHrPRVhZCwg9JFepDe5DPfFYP2kbIWt/6rby/RsGrLYOYl+/TWQQFRkZGuN7Jzhv3J8voLneRw/KdciqQzpwAqkqLRCGf8/b58k/rQdkPFJlnzENW/YEtaGr3po5DotDYFas+eZn3KbRTzmM7heYLjePU4YnxutdnDqa2tLueHYuRO3t34a8QyqVuv02OqfN1to9U3L1Rb/b2mzxDRGo9kis9TTyzx13NgvktLLGwdLQ0/26CyMoPkB+LUFk8y0887KEXKSmj8s+g+BoF+12ckgTuJrr66Yw007cEkLNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760257479; c=relaxed/relaxed;
	bh=fVJ0dG/TdUgg5djFFIgusqQnA2Rduji3ja74518MIfc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nJQFfFKf9gYP9ZZmN3YOTqkGLCdONBgEPOvsxcxuqt/XtQDnSxIIiU2Oavs/qWKCYCvM6uDn+j0yqc8NXROKmWcUYsrymqBTe8u8porGRfxoFLYed0Z4WmL3hD2v7QoqnUSiRcw3NxOHGi55hTN7W6rKbgbtobuZSGrBH864UmLkdgMXZkZGXh/uqwRAXVR3omT5nJcRgVruh1yXiolZN1wztR9q4HvWIidcqRZesDsF5aOfiI8UsVTNK3B2dULumlE+LgkbT7K6zxXLO0ay48T065yvNzB9Wy8RKjl4g96vZRZYlDiIs6Yn+U9uH37TYJVbbGaCei5rzYgq5hEczA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hL38+MoV; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hL38+MoV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cktnL0RTTz2yqW
	for <openbmc@lists.ozlabs.org>; Sun, 12 Oct 2025 19:24:36 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b49c1c130c9so2092904a12.0
        for <openbmc@lists.ozlabs.org>; Sun, 12 Oct 2025 01:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760257474; x=1760862274; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fVJ0dG/TdUgg5djFFIgusqQnA2Rduji3ja74518MIfc=;
        b=hL38+MoVXO1mZEEN63uDveFZvMj1Ru7RnyMBn5HzzVYSxSSh38kTnvtpcccQRskV12
         J76ogSq37NefUcQVuPzjWqqibHy3ytGQCSgU4ihKqyizw6Cb2pFrP0QC3ZexiVIQ7skF
         xdbRWbIm90nKDUGqPTTFgTsQ42mPFb2SZRALbMncKZu6qhD6+HOnXX4yNwUp3Z/lXMCm
         PwEV/7GXKUyTgI0KYhWlc7SBBl3WGVuIXMMUH5N7cxY0g/WQTkn9A04W/ylAwBHfop5i
         bqaDvHwVu5IB/Y6a7CBicqt7qnaGMMJDFYKjsF65oBMJ+SFSo9a3vsxMG+WIuEQMutUo
         sDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760257474; x=1760862274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fVJ0dG/TdUgg5djFFIgusqQnA2Rduji3ja74518MIfc=;
        b=p1TpMIJ+VF/WEBQuBN3005p7p/VBSZ4EZv+u6pwpPxny/LV2cdtAUKUPjyNEuLuQZ1
         Vy2FQkvOIbLq4mCs7PdyEdbEKJbGqbjHOnjcL88uU0MgUEAziGrTzU5AdLBydZ+vvGzN
         kj1xUH4TUgTx+k9Ntdmg90HRf4LeVbng14Ttyjvee//CZz4jJxUgJ5GJEbiCUqlOZ3PC
         4GTv08hsFQSebWdpvZcdqPjAwwJ7Ay83T9bEDfnwTtl5jfK08dwUs+h/aYvk0yKeO4T7
         iXeeHbgVRkMxepbKEi48lg5X2NSWc/nRuza+rqwRqa6RMgi9X270tuV2ZpEJ9apSLCEy
         aHqg==
X-Forwarded-Encrypted: i=1; AJvYcCVuA25yhmAXax0elUB9X4CURUwgmuQM/aWdlUM2+W7RwBldmqK5qtqfhtjV5CQzPKedgupRAPZS@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxhjxKohJoGydqffny9LOCeO9yp6h40c5sn0R7iWMR8JB7RzEBM
	IqDMlmMWJaJco1CKq0QNEvg1YhrYx7BCRKEoVZKQJVmMNVShw17mw1oG
X-Gm-Gg: ASbGnct7a1OlfrH8ycTb93vxQDHQa9dc3veR2KLwqL5owys4QMrUVbAumm1tRDQ0dnP
	Z9yQkp4mSgZY9siOd1qD8sWh81c04tVaQsV/4K+eHbdJ1BVjuUBHVY5L12VEwQuOWVU6oDh/wH+
	dq4Rr14mWGPKV5eJ62pcAMjxD4PFD1wphIPFVdsPpOghZ8Ku6/8EQNkoxsN7kJ+Ql8uvDwOq4xg
	mHPUnJbnRZVQDnduorurLBpsGuOlnhX3IGhwVyVZstpBHuuS14rO4TZ4qDceR2aeyCphg3R06Oc
	LBGmG0IBSUTJUUW9GjfZd39pFPtb6KcCGwDuyr/q5sLmdW+2T91qVBfL8LjU699QCeEcNZzXttg
	Zj/UYaLfuXjfV9piQFOj7Q4UtkxkvZlfKGxHMTp/AFZRO3nC313ueWPLwAnewXpGpCIZKbtTh3k
	buEIUxbPA0Q6V0W4wOkmX1jgc/sRv7TbrYcEb9ASyU7BAHFs4G1yCz
X-Google-Smtp-Source: AGHT+IFVmCG4QKHMSGDjfF59E797xRGSJtz7hvs1BghgpLcVXllUZZHL7NXSemBgxndx6zYYCCBAww==
X-Received: by 2002:a17:903:1aee:b0:264:ee2:c3f5 with SMTP id d9443c01a7336-2902723bc78mr239635225ad.19.1760257473646;
        Sun, 12 Oct 2025 01:24:33 -0700 (PDT)
Received: from cosmo-ubuntu-2404.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e1ccc4sm101478325ad.42.2025.10.12.01.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 01:24:33 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: chou.cosmo@gmail.com,
	cosmo.chou@quantatw.com,
	Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH linux dev-6.12] gpio: pca953x: Add support for level-triggered interrupts
Date: Sun, 12 Oct 2025 16:22:24 +0800
Message-ID: <20251012082224.506443-1-chou.cosmo@gmail.com>
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
---
 drivers/gpio/gpio-pca953x.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 442435ded020..ab2c0fd428fb 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -215,6 +215,8 @@ struct pca953x_chip {
 	DECLARE_BITMAP(irq_stat, MAX_LINE);
 	DECLARE_BITMAP(irq_trig_raise, MAX_LINE);
 	DECLARE_BITMAP(irq_trig_fall, MAX_LINE);
+	DECLARE_BITMAP(irq_trig_level_high, MAX_LINE);
+	DECLARE_BITMAP(irq_trig_level_low, MAX_LINE);
 #endif
 	atomic_t wakeup_path;
 
@@ -773,6 +775,8 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 	pca953x_read_regs(chip, chip->regs->direction, reg_direction);
 
 	bitmap_or(irq_mask, chip->irq_trig_fall, chip->irq_trig_raise, gc->ngpio);
+	bitmap_or(irq_mask, irq_mask, chip->irq_trig_level_high, gc->ngpio);
+	bitmap_or(irq_mask, irq_mask, chip->irq_trig_level_low, gc->ngpio);
 	bitmap_complement(reg_direction, reg_direction, gc->ngpio);
 	bitmap_and(irq_mask, irq_mask, reg_direction, gc->ngpio);
 
@@ -790,13 +794,15 @@ static int pca953x_irq_set_type(struct irq_data *d, unsigned int type)
 	struct device *dev = &chip->client->dev;
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
-	if (!(type & IRQ_TYPE_EDGE_BOTH)) {
+	if (!(type & IRQ_TYPE_SENSE_MASK)) {
 		dev_err(dev, "irq %d: unsupported type %d\n", d->irq, type);
 		return -EINVAL;
 	}
 
 	assign_bit(hwirq, chip->irq_trig_fall, type & IRQ_TYPE_EDGE_FALLING);
 	assign_bit(hwirq, chip->irq_trig_raise, type & IRQ_TYPE_EDGE_RISING);
+	assign_bit(hwirq, chip->irq_trig_level_low, type & IRQ_TYPE_LEVEL_LOW);
+	assign_bit(hwirq, chip->irq_trig_level_high, type & IRQ_TYPE_LEVEL_HIGH);
 
 	return 0;
 }
@@ -809,6 +815,8 @@ static void pca953x_irq_shutdown(struct irq_data *d)
 
 	clear_bit(hwirq, chip->irq_trig_raise);
 	clear_bit(hwirq, chip->irq_trig_fall);
+	clear_bit(hwirq, chip->irq_trig_level_low);
+	clear_bit(hwirq, chip->irq_trig_level_high);
 }
 
 static void pca953x_irq_print_chip(struct irq_data *data, struct seq_file *p)
@@ -839,6 +847,7 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, unsigned long *pendin
 	DECLARE_BITMAP(cur_stat, MAX_LINE);
 	DECLARE_BITMAP(new_stat, MAX_LINE);
 	DECLARE_BITMAP(trigger, MAX_LINE);
+	DECLARE_BITMAP(edges, MAX_LINE);
 	int ret;
 
 	ret = pca953x_read_regs(chip, chip->regs->input, cur_stat);
@@ -856,13 +865,26 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, unsigned long *pendin
 
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


