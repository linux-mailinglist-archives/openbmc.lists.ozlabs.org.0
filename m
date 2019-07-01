Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3885B473
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2019 08:03:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ccJB5KhJzDqSw
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2019 16:03:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=chyishian.jiang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hZXQ267P"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ccGZ6bzHzDqSt
 for <openbmc@lists.ozlabs.org>; Mon,  1 Jul 2019 16:02:30 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id cl9so6720775plb.10
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jun 2019 23:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CvuT93uGwLh7SWpMurI8X+dr3BifnScrSZgot390FuM=;
 b=hZXQ267PKOfszDfgyv9dw6jDGr59eN27PahzZCf8OhL4nH3MpQDubLExZT0w0ancA9
 awKPfxhrtz4Bd27WvMcbSfFrkUZeloez0SaBKOX+LadA73YWrUTypwUSjTjPOrTBpswI
 4zsilRgvSHao+cVcaG+B5nPv729S8tOlKx02rHZ1XHvImiWATpSeRRvR9FaQM5rZIXzA
 Uy+1zyvC3qkjp62NJCLkML4MZLFkswoR5EZlItvr+UuVqDoLZSAD8BRS/hT8+JQiwxtb
 ASNs2Y7AYxDM8wgBWoV1wAtu58b5IEanQQkGlNa7VAp3N3QPvWIhU0GbO8qgr25cU+Xg
 XlTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CvuT93uGwLh7SWpMurI8X+dr3BifnScrSZgot390FuM=;
 b=QAl7o03xiDURxI61+Udh2tcr2b7RUJ/qGbO18lNUZGaaA+2D3NhGUIJMrPZIlrN/sH
 Ik9jSmdha2/9YlLpTFSPokn+7GixQq5QkRgSsYOosao5rl0UZxZvvmS6vlkZFJm8KQd+
 4HqH3izyzVD582y/SXTVSK/WrPQlwrt9oaZ7OltqH8/h8N7jJRVrIL0GQBHiJM/DGAaG
 nU/6V7v+369OKt5feQA1wTwTVeN+H0g0pLd25Ss096UZivoAtN5bvrICTYS7ugOTWzoy
 Zo3+5HaK6eh1CUx+jR3wBrRjWUMPxkvaOcKp3HHJUTPkvNv3bCfmISci3he9nrs4xdsV
 Qfvg==
X-Gm-Message-State: APjAAAVWx8LspRfhSuXQ/lKVPe04Vitrx6dkCP8sJQoep8d9dDWsIT3m
 mnHEHRb2QCKmXcg56Oxujwo=
X-Google-Smtp-Source: APXvYqye4AArdXaL5bnIlZdt36fR422bUTInt1qfG/JseFKstA7rDDjSdWgqjQQPNc7hR5LUWmcPqw==
X-Received: by 2002:a17:902:aa5:: with SMTP id
 34mr27943816plp.166.1561960948397; 
 Sun, 30 Jun 2019 23:02:28 -0700 (PDT)
Received: from localhost.localdomain (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id w14sm8672127pfn.47.2019.06.30.23.02.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 30 Jun 2019 23:02:27 -0700 (PDT)
From: Samuel Jiang <chyishian.jiang@gmail.com>
To: joel@jms.id.au,
	tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com
Subject: [PATCH dev-5.17 v1 2/6] ARM: dts: nuvoton: nuvoton-npcm750-runbmc:
 add fan and led functions
Date: Mon,  1 Jul 2019 14:01:33 +0800
Message-Id: <20190701060137.22116-2-chyishian.jiang@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190701060137.22116-1-chyishian.jiang@gmail.com>
References: <20190701060137.22116-1-chyishian.jiang@gmail.com>
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
Cc: openbmc@lists.ozlabs.org, Samuel Jiang <Samuel.Jiang@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Samuel Jiang <Samuel.Jiang@quantatw.com>

Update nuvoton-npcm750-runbmc dts fan and led functions

Signed-off-by: Samuel Jiang <Samuel.Jiang@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts | 64 ++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
index eec815d2a638..bcd7f1063399 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
@@ -269,6 +269,58 @@
 				};
 			};
 
+			pwm_fan:pwm-fan-controller@103000 {
+				pinctrl-names = "default";
+				pinctrl-0 = <   &pwm0_pins &pwm1_pins
+						&fanin0_pins &fanin1_pins
+						&fanin2_pins &fanin3_pins
+						&fanin4_pins &fanin5_pins
+						&fanin6_pins &fanin7_pins
+						&fanin8_pins &fanin9_pins
+						&fanin10_pins &fanin11_pins>;
+				status = "okay";
+				fan@0 {
+					reg = <0x00>;
+					fan-tach-ch = /bits/ 8 <0x00 0x01>;
+					cooling-levels = <127 255>;
+				};
+				fan@1 {
+					reg = <0x01>;
+					fan-tach-ch = /bits/ 8 <0x02 0x03>;
+					cooling-levels = /bits/ 8 <127 255>;
+				};
+				fan@2 {
+					reg = <0x02>;
+					fan-tach-ch = /bits/ 8 <0x04 0x05>;
+					cooling-levels = /bits/ 8 <127 255>;
+				};
+				fan@3 {
+					reg = <0x03>;
+					fan-tach-ch = /bits/ 8 <0x06 0x07>;
+					cooling-levels = /bits/ 8 <127 255>;
+				};
+				fan@4 {
+					reg = <0x04>;
+					fan-tach-ch = /bits/ 8 <0x08 0x09>;
+					cooling-levels = /bits/ 8 <127 255>;
+				};
+				fan@5 {
+					reg = <0x05>;
+					fan-tach-ch = /bits/ 8 <0x0A 0x0B>;
+					cooling-levels = /bits/ 8 <127 255>;
+				};
+				fan@6 {
+					reg = <0x06>;
+					fan-tach-ch = /bits/ 8 <0x0C 0x0D>;
+					cooling-levels = /bits/ 8 <127 255>;
+				};
+				fan@7 {
+					reg = <0x07>;
+					fan-tach-ch = /bits/ 8 <0x0E 0x0F>;
+					cooling-levels = /bits/ 8 <127 255>;
+				};
+			};
+
 			spi0: spi@200000 {
 				cs-gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
 				status = "okay";
@@ -279,6 +331,18 @@
 			};
 		};
 	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio3 13 GPIO_ACTIVE_LOW>;
+
+		led {
+			label = "led-green-arm";
+			gpios = <&gpio3 14 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
 };
 
 &gcr {
-- 
2.20.1

