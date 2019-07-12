Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 100EE66720
	for <lists+openbmc@lfdr.de>; Fri, 12 Jul 2019 08:40:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lNb367ZKzDqnF
	for <lists+openbmc@lfdr.de>; Fri, 12 Jul 2019 16:40:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=chyishian.jiang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="r42hwweS"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lNVq1nRSzDqYn
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jul 2019 16:36:34 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id ay6so4277937plb.9
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jul 2019 23:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HmoV93eVHDmf+tDjviEdZxt4ffC2EeQ+WM2fJskEQVw=;
 b=r42hwweS8dZmZCG+/XZXrcN/4b21Ey6vxmLXbi5pG7qe3y1fhCLlAe15HNHOYTQ7/t
 9cpLwrSR6Q2pnHFtdAk1xZ5y7aQstHbz5H6sWMXuVVn7l4r9dNbRj50JgUwR1pX6IV/5
 2xlMgJNGdBN758xLai2jiix9ZPsDD/u+uY9whX14CuT6oEH8GfVIz3glRi/qg9tt1CIQ
 cdRDw8+6Yr/ZrSVWQjZdjv7igvLWd4pKxstdQDpUJjvgcykt16j45VQoEATt7SdsM2Ly
 g5g0G9Tt7mcI857aPhrg4bOHX/RBrr/prYaJofvY9PK3HyQ3tGOo6OyIGcUvoiNDQaaT
 b9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HmoV93eVHDmf+tDjviEdZxt4ffC2EeQ+WM2fJskEQVw=;
 b=n8WfFF0yRRmCmWJj40wsB3fZM8WBCkC+Dd6/vhBpTNjMcyEStuiJfXZBWqe1L5BiZQ
 dXpLcfHRHActHIk6zat1UMUZYUER2J+Z5ZddVr3T9BhhvyHBPEwZt5rvSgscw3GqPJet
 lbm73AboqVlGuLqOuKrNB8snyxZiU/h3nrwbkWjfcVd9tpw0UsNzJg4vI8IGk64NW9Tr
 jX2DxrGLNlrOYd39dO9sT9WQrhZcySOtNZTzyvQ4WamdqPlTkZdoguSlJfDhePYJfevd
 GRj1WYzACaZDjadR6wdDlSAjJmlen4qZVGq3xvNYJWzz0TE8bMWxGBG2WihXb6bLniwm
 2l8Q==
X-Gm-Message-State: APjAAAULaCkC4efP2/pqb1+u273EvEz9waMMLr1Fa1AQgTClXP2EK5KL
 4wooOKLzR+JgMKfAJXJInGg=
X-Google-Smtp-Source: APXvYqyV4V37tyWdL6fnTpMic5tmMIZo1kn1RqbDOGGiTtABGN8nhoYxGBsxNeU5kdOJqmplnrBxdA==
X-Received: by 2002:a17:902:ab8f:: with SMTP id
 f15mr9312787plr.159.1562913392701; 
 Thu, 11 Jul 2019 23:36:32 -0700 (PDT)
Received: from localhost.localdomain (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id z19sm6610488pgv.35.2019.07.11.23.36.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 11 Jul 2019 23:36:32 -0700 (PDT)
From: Samuel Jiang <chyishian.jiang@gmail.com>
To: joel@jms.id.au,
	tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com
Subject: 
Date: Fri, 12 Jul 2019 14:35:08 +0800
Message-Id: <20190712063511.96268-3-chyishian.jiang@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190712063511.96268-1-chyishian.jiang@gmail.com>
References: <20190712063511.96268-1-chyishian.jiang@gmail.com>
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

this 

From: Samuel Jiang <Samuel.Jiang@quantatw.com>
Date: Mon, 24 Jun 2019 19:03:27 +0800
Subject: [PATCH dev-5.2 v2 3/7] ARM: dts: nuvoton: nuvoton-npcm750-runbmc: add
 fan, peci, led

Update nuvoton-npcm750-runbmc dts fan, led groups and enable peci

Signed-off-by: Samuel Jiang <Samuel.Jiang@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts | 78 ++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
index dc34f53af0b7..90210217d54c 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
@@ -277,6 +277,70 @@
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
+			peci: peci-bus@100000 {
+				cmd-timeout-ms = <1000>;
+				pull-down = <0>;
+				host-neg-bit-rate = <15>;
+				status = "okay";
+				intel-peci-dimmtemp@30 {
+					compatible = "intel,peci-client";
+					reg = <0x30>;
+					status = "okay";
+				};
+			};
+
 			spi0: spi@200000 {
 				cs-gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
 				status = "okay";
@@ -287,6 +351,20 @@
 			};
 		};
 	};
+
+	leds {
+		compatible = "gpio-leds";
+		heartbeat {
+			label = "heartbeat";
+			gpios = <&gpio3 14 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		identify {
+			label = "identify";
+			gpios = <&gpio3 15 GPIO_ACTIVE_HIGH>;
+		};
+	};
 };
 
 &gcr {
-- 
2.20.1

