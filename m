Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1913E83370E
	for <lists+openbmc@lfdr.de>; Sun, 21 Jan 2024 00:29:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V+ePDw0f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4THXk86hzWz3cS5
	for <lists+openbmc@lfdr.de>; Sun, 21 Jan 2024 10:29:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V+ePDw0f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=fr0st61te@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4THXjV2dnWz30fD
	for <openbmc@lists.ozlabs.org>; Sun, 21 Jan 2024 10:28:28 +1100 (AEDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50eac018059so2630106e87.0
        for <openbmc@lists.ozlabs.org>; Sat, 20 Jan 2024 15:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705793301; x=1706398101; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9edRhZV4RNwO8Pc3qdkyouN8izXXmhlK/VxhTNYo/PU=;
        b=V+ePDw0fCmJXFbQDIuBZfAf4ZgxSqxdItil9/X87KHyGpOUBNGewHoApbBUOssgV1C
         VbSA1Z8EHe9oSGVQNf+vZGuJlG+eW5jq1n9G6fewlC0Dunxzo5nfwtg5PZvX4vfb1arn
         XjdXqPj+A+GfXr79UBBaeLXGkDIivnEHoyAKgiLL0GU4+kyriEdUQwpuZ02oI6RAv5bl
         QucI7B60KUmiVOoLJnvnyHwrLP6Qp7Ug1yP7vE23A9wDsKH8sfycivynutCEG8K44aoz
         XIDKqA6cDGUl4JDceGNgfZsPizhVnvJjScxeh/IOS2iP5yddYDzXiV+gwSHhWz2TUGsU
         +6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705793301; x=1706398101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9edRhZV4RNwO8Pc3qdkyouN8izXXmhlK/VxhTNYo/PU=;
        b=Bo/Zod5m+Wh0jAntHR2SDAbvAEp7afMU5i2BEyRQ00PaGW83ItflrXQifKjAvgyo9p
         IkYq2AUN2gnXx7V3TJEsI5vJG0+9xSi9wXeOw6wfbi1b+3tgfys2DQhnytoJOLrPbTMq
         e31rnEurFCqftAugkw+Jnxbf823UU2KjyDAX2YeDI2WhW9xC+34no/mjZ+X+AGA7+2mz
         s38CXxAvEoitdoVrlNE3riVenGWpirQ3Cy5UX+ALeYmX+IMQ65kV6tCmnH4SvflbAiEU
         BrHVcfaIpBfnZ01KfByo7rPaQkveusMCrCQjPiX7gAaCSFTbpiXnpUsXCqpFLLe839+g
         sGOQ==
X-Gm-Message-State: AOJu0YwVsuuHKgiFmUStOCxKsB3+rGh3MHWDuv026mm2CQfbeQGwHKvt
	iV+tyKj9vbjNJSLElLwT+0/dWQtUVgq8KP+6b/TqJE0ZjT9mAKqw
X-Google-Smtp-Source: AGHT+IGqec656dWjXblkH052MdUsIYmWTp/Q3eb+cv7rSNv1hkNN5duWuf/ufF1K1+lZAgZROGg/NQ==
X-Received: by 2002:a05:6512:3b90:b0:50e:d5e2:92cc with SMTP id g16-20020a0565123b9000b0050ed5e292ccmr1187939lfv.81.1705793300877;
        Sat, 20 Jan 2024 15:28:20 -0800 (PST)
Received: from fr.lan ([81.200.17.74])
        by smtp.googlemail.com with ESMTPSA id x25-20020a19e019000000b0050e77abd553sm1475416lfg.76.2024.01.20.15.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jan 2024 15:28:20 -0800 (PST)
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>,
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
	Aspeed BMC SW team <BMC-SW@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	Tom Rini <trini@konsulko.com>
Subject: [PATCH] pinctrl: aspeed: add pass-through pins and siopbi/siopbo
Date: Sun, 21 Jan 2024 02:28:13 +0300
Message-ID: <20240120232813.32474-1-fr0st61te@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Cc: u-boot@lists.denx.de, openbmc@lists.ozlabs.org, Ivan Mikhaylov <fr0st61te@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add THRU0-3 and SIOPBI/SIOPBO pin groups/functions.

Signed-off-by: Ivan Mikhaylov <fr0st61te@gmail.com>
---
 arch/arm/dts/ast2600.dtsi                | 20 ++++++++++++++++
 drivers/pinctrl/aspeed/pinctrl_ast2600.c | 30 ++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/arch/arm/dts/ast2600.dtsi b/arch/arm/dts/ast2600.dtsi
index beabcf14f8..43db80edfe 100644
--- a/arch/arm/dts/ast2600.dtsi
+++ b/arch/arm/dts/ast2600.dtsi
@@ -2028,6 +2028,26 @@
 		groups = "SPI2MOSI";
 	};
 
+	pinctrl_thru0_default: thru0_default {
+		function = "THRU0";
+		groups = "THRU0";
+	};
+
+	pinctrl_thru1_default: thru1_default {
+		function = "THRU1";
+		groups = "THRU1";
+	};
+
+	pinctrl_thru2_default: thru2_default {
+		function = "THRU2";
+		groups = "THRU2";
+	};
+
+	pinctrl_thru3_default: thru3_default {
+		function = "THRU3";
+		groups = "THRU3";
+	};
+
 	pinctrl_timer3_default: timer3_default {
 		function = "TIMER3";
 		groups = "TIMER3";
diff --git a/drivers/pinctrl/aspeed/pinctrl_ast2600.c b/drivers/pinctrl/aspeed/pinctrl_ast2600.c
index 97e8b4ec9b..8a4f9705ca 100644
--- a/drivers/pinctrl/aspeed/pinctrl_ast2600.c
+++ b/drivers/pinctrl/aspeed/pinctrl_ast2600.c
@@ -267,6 +267,14 @@ static struct aspeed_sig_desc fmcquad_link[] = {
 	{ 0x438, GENMASK(5, 4), 0 },
 };
 
+static struct aspeed_sig_desc siopbi_link[] = {
+	{ 0x418, BIT(6), 0 },
+};
+
+static struct aspeed_sig_desc siopbo_link[] = {
+	{ 0x418, BIT(5), 0 },
+};
+
 static struct aspeed_sig_desc spi1_link[] = {
 	{ 0x438, GENMASK(13, 11), 0 },
 };
@@ -303,6 +311,22 @@ static struct aspeed_sig_desc spi2quad_link[] = {
 	{ 0x434, GENMASK(31, 30), 0 },
 };
 
+static struct aspeed_sig_desc thru0_link[] = {
+	{ 0x4bc, GENMASK(25, 24), 0 },
+};
+
+static struct aspeed_sig_desc thru1_link[] = {
+	{ 0x4bc, GENMASK(27, 26), 0 },
+};
+
+static struct aspeed_sig_desc thru2_link[] = {
+	{ 0x4bc, GENMASK(29, 28), 0 },
+};
+
+static struct aspeed_sig_desc thru3_link[] = {
+	{ 0x4bc, GENMASK(31, 30), 0 },
+};
+
 static struct aspeed_sig_desc fsi1[] = {
 	{ 0xd48, GENMASK(21, 20), 0 },
 };
@@ -458,6 +482,8 @@ static const struct aspeed_group_config ast2600_groups[] = {
 	{ "EMMC", ARRAY_SIZE(emmc_link), emmc_link },
 	{ "EMMCG8", ARRAY_SIZE(emmcg8_link), emmcg8_link },
 	{ "FMCQUAD", ARRAY_SIZE(fmcquad_link), fmcquad_link },
+	{ "SIOPBI", ARRAY_SIZE(siopbi_link), siopbi_link },
+	{ "SIOPBO", ARRAY_SIZE(siopbo_link), siopbo_link },
 	{ "SPI1", ARRAY_SIZE(spi1_link), spi1_link },
 	{ "SPI1ABR", ARRAY_SIZE(spi1abr_link), spi1abr_link },
 	{ "SPI1CS1", ARRAY_SIZE(spi1cs1_link), spi1cs1_link },
@@ -467,6 +493,10 @@ static const struct aspeed_group_config ast2600_groups[] = {
 	{ "SPI2CS1", ARRAY_SIZE(spi2cs1_link), spi2cs1_link },
 	{ "SPI2CS2", ARRAY_SIZE(spi2cs2_link), spi2cs2_link },
 	{ "SPI2QUAD", ARRAY_SIZE(spi2quad_link), spi2quad_link },
+	{ "THRU0", ARRAY_SIZE(thru0_link), thru0_link },
+	{ "THRU1", ARRAY_SIZE(thru1_link), thru1_link },
+	{ "THRU2", ARRAY_SIZE(thru2_link), thru2_link },
+	{ "THRU3", ARRAY_SIZE(thru3_link), thru3_link },
 	{ "I2C1", ARRAY_SIZE(i2c1_link), i2c1_link },
 	{ "I2C2", ARRAY_SIZE(i2c2_link), i2c2_link },
 	{ "I2C3", ARRAY_SIZE(i2c3_link), i2c3_link },
-- 
2.43.0

