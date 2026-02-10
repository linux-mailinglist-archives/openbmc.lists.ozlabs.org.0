Return-Path: <openbmc+bounces-1348-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFoyIQ81i2myRgAAu9opvQ
	(envelope-from <openbmc+bounces-1348-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 10 Feb 2026 14:39:27 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DEF11B4D1
	for <lists+openbmc@lfdr.de>; Tue, 10 Feb 2026 14:39:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9N2J3DLKz30Lv;
	Wed, 11 Feb 2026 00:39:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::336"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770730744;
	cv=none; b=SM13uoAbkEbT6vtrwkd0axt8Boru7cIQG/RT/sq6wnKu5PP4pzBJZOq3ha5EIbvXI5ASKLcs8UDsQYQusyB+GscZ6En8Vd7i7KqpRFikWwavwRgXfSS5SSDWBxWWA6dHbQW5D5kY1qwet8e1F15jmm1Ska11fX49dXNZbQe3Hy0miOy43aGoVJ6g3fsd+nDgE+o1G+hoJSFVhHCGJcp3RWwleEHE3elJWZ7aMxt6xk+3fTIModXDmCVId22ktVcHb/aN5dblmGj92q43cy8f2X540SWC5BbuvHdmhl+rskP44iDBZpq5aOGJnEDCjyU27jNRt/IpUMdSiiYTZnBXFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770730744; c=relaxed/relaxed;
	bh=HGNEecakAfXorcTTEznVuRkn8Ex5W+QcTjU+PIsrpQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hfNpRHHU8AL4TFERoOzHM3593YVTP+D8uD/lQBGZDOC4Ma0ovMgPRRhiSwdg+tn0M0KQnZVojt7/E6giDfwJXMLdhdOYfog7RReV6dCZJPht6ehInQdT+gCjXDloasjAnJdTwamadlbqpF82baxjWpydzI8/2IDqi4AtaIjdwr6jnlD6TxuB+xSXZ315WQzi0gfpjJyFs7+ynJ/faaBazgUCHCzMcuv32qRHWWV8mdDwJo2TzXdDwFN45vA/o6oRkVsV8VlrbUxFozWIVrnOSAMTNy452IRJfx6Qkr0Zu7FaKcSfd3Lk/DaicMP/+OzihFpkg2/JjwymlmxIaU9OxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h6fMtwce; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h6fMtwce;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9N2H1BXyz2xQ1
	for <openbmc@lists.ozlabs.org>; Wed, 11 Feb 2026 00:39:03 +1100 (AEDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-480142406b3so43822985e9.1
        for <openbmc@lists.ozlabs.org>; Tue, 10 Feb 2026 05:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770730740; x=1771335540; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGNEecakAfXorcTTEznVuRkn8Ex5W+QcTjU+PIsrpQQ=;
        b=h6fMtwceAyA2jgPVv1aj+Hb2Jj1dR+UlmJGEigiMOVhB0ZXSbhb1+a6trZ14etxRXx
         FmIiSQ3k0SapRYonKxdD2Z7MAjyMZGST92xljxpMGLVdxtwhAjZddkaUKwH/beJ9+ZXe
         zZb6NImd0n+Xk9g98AeAIJQ3fhnvlCw4HdVTPue2ly3cZQ7m49r9GreR/1UZdTcWbjoi
         da3gBBM0vl1Q4Sbalj5jxEr81eB3m25ppfO7+ITzpRou7wIUr0R9ZVllSiyLkH/WpLVr
         TKsea3iatDZvlyqwYVjpQ2ZHvJpQg9fZ9r1LP8Ej7BZYH0fCoVL/Deqj+qtsp84vK90h
         3rAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770730740; x=1771335540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HGNEecakAfXorcTTEznVuRkn8Ex5W+QcTjU+PIsrpQQ=;
        b=eo4BSGIeEIsBIl8tHp8OLicTsm/XdmHORof6mtgEG6y0qbkYiwLdlgT8soOp7xx50x
         Bj391WVhKGF8kSlh8NiGpiDFWrGI56vAcAaudi/B1sCa0d/DHYe3txjW2WWQr+LxiDtg
         1i+66f4x4Cq4ag4Y04N2Htbyx1iEcW/bcrZwmn0JwAnqlAbiGOi5fDJT+8XxlMwFWNbt
         qeAMxcVcMrkZ2IihclnSvwvkHibIFGreALZMimat0dj6u5sVVeZBzNU/M9/ZkXuLFR9h
         yRFXmgfj1OV9R6fRpoXoB+yTW3CiVMD+juKcdfoLMCxMwvut1bb5I760QlI003USX/lu
         bCag==
X-Forwarded-Encrypted: i=1; AJvYcCVJB+1it5xAvb0wDDebFWC5XoEOD5vZC8MxKmm4a+W1sivp/qNo4Z5NoLuBsVgaKyrXiN+ct3s2@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzwbHPuNPW/CHEFUF22D2ztByq7l/GyKdP8hmKNze2eWDaOfsC8
	md5b0hY1OaqHMI+YYv0kG/OUt9qyqFButk3L6bprTcbUmSOAgkCgwxMd
X-Gm-Gg: AZuq6aLqyhk9dQSqLYsYcRgGIoFYpMFxgQdoWyUSSx1ZThzag1kDB7HYolFMpIltoIq
	tK702AqKxXelJcTeErstW5WwUGlcxY/uNIKnaNnATeDGkajx/wwzPls11+HP4M99GMMPFIPpp7w
	IBbBI/6TfMVR7zb9jSf2OvKrFs/HZkM4VNMiRDP32ME/DfbDv2qlOj1VHnaRMyt9IayLYmXGPMQ
	YNdQLIPqQTIwcqwtXAFBSS0k7Lj7D7Phme6OhJydpoaTuyR7Ji80ZSBzlgrik2hmN+fVwHKk0DF
	DP/0R7tLRa8qpFdBEHTnFibaJrI/vxvLFX8enws5JezxJxzb5BLxNRdRdlKMfPUtUOzjiYM7ZI2
	AM6L4LJ4d8MXlbqNTv0dv2PmJsH2/WWlcilvw6WdiLnP8i5atVSxfNUnKFLVbbf9fOR2ddS8VyC
	LQdCmwdHYgcQdye78sP5g+Ph8TuIr9oehXsA==
X-Received: by 2002:a05:600c:3b1e:b0:482:eec4:772 with SMTP id 5b1f17b1804b1-48350833938mr27829925e9.32.1770730739808;
        Tue, 10 Feb 2026 05:38:59 -0800 (PST)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d8df8sm66773415e9.3.2026.02.10.05.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 05:38:59 -0800 (PST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	avifishman70@gmail.com,
	tali.perry1@gmail.com,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 2/2] watchdog: npcm: Add reset status support
Date: Tue, 10 Feb 2026 15:38:43 +0200
Message-Id: <20260210133843.1078463-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210133843.1078463-1-tmaimon77@gmail.com>
References: <20260210133843.1078463-1-tmaimon77@gmail.com>
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
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.80 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:andrew@codeconstruct.com.au,m:avifishman70@gmail.com,m:tali.perry1@gmail.com,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:joel@jms.id.au,m:openbmc@lists.ozlabs.org,m:linux-watchdog@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tmaimon77@gmail.com,m:taliperry1@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[codeconstruct.com.au,gmail.com,linux-watchdog.org,roeck-us.net,kernel.org];
	FORGED_SENDER(0.00)[tmaimon77@gmail.com,openbmc@lists.ozlabs.org];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[google.com,jms.id.au,lists.ozlabs.org,vger.kernel.org,gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[openbmc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-1348-lists,openbmc=lfdr.de];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tmaimon77@gmail.com,openbmc@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: A3DEF11B4D1
X-Rspamd-Action: no action

Add reset status detection for NPCM watchdog driver on both NPCM7XX and
NPCM8XX platforms. Implement GCR register integration via syscon for
reset status detection and configurable reset type mapping via device
tree properties.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/watchdog/npcm_wdt.c | 110 ++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
index e62ea054bc61..ebece5d6240a 100644
--- a/drivers/watchdog/npcm_wdt.c
+++ b/drivers/watchdog/npcm_wdt.c
@@ -12,9 +12,25 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/watchdog.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
+
+#define NPCM7XX_RESSR_OFFSET	0x6C
+#define NPCM7XX_INTCR2_OFFSET	0x60
 
 #define NPCM_WTCR	0x1C
 
+#define NPCM7XX_PORST	BIT(31)
+#define NPCM7XX_CORST	BIT(30)
+#define NPCM7XX_WD0RST	BIT(29)
+#define NPCM7XX_WD1RST	BIT(24)
+#define NPCM7XX_WD2RST	BIT(23)
+#define NPCM7XX_SWR1RST	BIT(28)
+#define NPCM7XX_SWR2RST	BIT(27)
+#define NPCM7XX_SWR3RST	BIT(26)
+#define NPCM7XX_SWR4RST	BIT(25)
+#define NPCM8XX_RST	(GENMASK(31, 23) | GENMASK(15, 12))
+
 #define NPCM_WTCLK	(BIT(10) | BIT(11))	/* Clock divider */
 #define NPCM_WTE	BIT(7)			/* Enable */
 #define NPCM_WTIE	BIT(6)			/* Enable irq */
@@ -45,6 +61,9 @@ struct npcm_wdt {
 	struct watchdog_device  wdd;
 	void __iomem		*reg;
 	struct clk		*clk;
+	u32			card_reset;
+	u32			ext1_reset;
+	u32			ext2_reset;
 };
 
 static inline struct npcm_wdt *to_npcm_wdt(struct watchdog_device *wdd)
@@ -185,6 +204,95 @@ static const struct watchdog_ops npcm_wdt_ops = {
 	.restart = npcm_wdt_restart,
 };
 
+static u32 npcm_wdt_reset_type(const char *reset_type)
+{
+	if (!strcmp(reset_type, "porst"))
+		return NPCM7XX_PORST;
+	else if (!strcmp(reset_type, "corst"))
+		return NPCM7XX_CORST;
+	else if (!strcmp(reset_type, "wd0"))
+		return NPCM7XX_WD0RST;
+	else if (!strcmp(reset_type, "wd1"))
+		return NPCM7XX_WD1RST;
+	else if (!strcmp(reset_type, "wd2"))
+		return NPCM7XX_WD2RST;
+	else if (!strcmp(reset_type, "sw1"))
+		return NPCM7XX_SWR1RST;
+	else if (!strcmp(reset_type, "sw2"))
+		return NPCM7XX_SWR2RST;
+	else if (!strcmp(reset_type, "sw3"))
+		return NPCM7XX_SWR3RST;
+	else if (!strcmp(reset_type, "sw4"))
+		return NPCM7XX_SWR4RST;
+
+	return 0;
+}
+
+static void npcm_get_reset_status(struct npcm_wdt *wdt, struct device *dev)
+{
+	const char *card_reset_type;
+	const char *ext1_reset_type;
+	const char *ext2_reset_type;
+	struct regmap *gcr_regmap;
+	u32 rstval, ressrval;
+	int ret;
+
+	gcr_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
+	if (IS_ERR(gcr_regmap)) {
+		dev_warn(dev, "Failed to find gcr syscon, WD reset status not supported\n");
+		return;
+	}
+
+	ret = of_property_read_string(dev->of_node,
+				      "nuvoton,card-reset-type",
+				      &card_reset_type);
+	if (ret)
+		wdt->card_reset = NPCM7XX_PORST;
+	else
+		wdt->card_reset = npcm_wdt_reset_type(card_reset_type);
+
+	ret = of_property_read_string(dev->of_node,
+				      "nuvoton,ext1-reset-type",
+				      &ext1_reset_type);
+	if (ret)
+		wdt->ext1_reset = 0;
+	else
+		wdt->ext1_reset = npcm_wdt_reset_type(ext1_reset_type);
+
+	ret = of_property_read_string(dev->of_node,
+				      "nuvoton,ext2-reset-type",
+				      &ext2_reset_type);
+	if (ret)
+		wdt->ext2_reset = 0;
+	else
+		wdt->ext2_reset = npcm_wdt_reset_type(ext2_reset_type);
+
+	regmap_read(gcr_regmap, NPCM7XX_INTCR2_OFFSET, &rstval);
+	/* prefer the most specific SoC first */
+	if (of_device_is_compatible(dev->of_node, "nuvoton,npcm845-wdt")) {
+		regmap_write(gcr_regmap, NPCM7XX_INTCR2_OFFSET,
+			     rstval & ~NPCM8XX_RST);
+	} else if (of_device_is_compatible(dev->of_node, "nuvoton,npcm750-wdt")) {
+		if ((rstval & NPCM7XX_PORST) == 0) {
+			rstval = NPCM7XX_PORST;
+			regmap_write(gcr_regmap, NPCM7XX_INTCR2_OFFSET,
+				     rstval | NPCM7XX_PORST);
+		} else {
+			rstval = 0;
+		}
+		regmap_read(gcr_regmap, NPCM7XX_RESSR_OFFSET, &ressrval);
+		rstval |= ressrval;
+		regmap_write(gcr_regmap, NPCM7XX_RESSR_OFFSET, ressrval);
+	}
+
+	if (rstval & wdt->card_reset)
+		wdt->wdd.bootstatus |= WDIOF_CARDRESET;
+	if (rstval & wdt->ext1_reset)
+		wdt->wdd.bootstatus |= WDIOF_EXTERN1;
+	if (rstval & wdt->ext2_reset)
+		wdt->wdd.bootstatus |= WDIOF_EXTERN2;
+}
+
 static int npcm_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -208,6 +316,8 @@ static int npcm_wdt_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	npcm_get_reset_status(wdt, dev);
+
 	wdt->wdd.info = &npcm_wdt_info;
 	wdt->wdd.ops = &npcm_wdt_ops;
 	wdt->wdd.min_timeout = 1;
-- 
2.34.1


