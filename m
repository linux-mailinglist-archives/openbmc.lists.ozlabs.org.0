Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8AA5B477
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2019 08:06:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ccLs155dzDqRv
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2019 16:06:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com;
 envelope-from=chyishian.jiang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="J7Ec4KN/"; 
 dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ccGh72PRzDqSh
 for <openbmc@lists.ozlabs.org>; Mon,  1 Jul 2019 16:02:36 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id c13so5468691pgg.3
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jun 2019 23:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zZssYCeoP5aake2EIWMeS48QuEA1jVbjiTGYDLuUZDU=;
 b=J7Ec4KN/nDm+ddECtn+u7YrK2VwOxuN87NhyVb/6nITD487oFxq0sbgEPZ4wjeS8OX
 ZiDkgiBOz91PWg6SEZPx/EYgP+k1oBmrh+kVAw8aPcsOyYhFX0cPwhVIWswXY+4ZIi7A
 r2sr4A0Fjf745GrX+I5uoRvVcNQ5MzEyq6DEZwm4f0zBhqjZB0bWJAfNPeKKJsU/exqt
 9qJTLdywurKWoiTFWv6Khw2uxkeKAn6iZTkE3lmhpL6Zqv07i9zSePAV4N9e4RsJcU/z
 ItHd6Q9QsEwjFAFIWwPfc2k7dTqeJSC6x8flFxftpigzO9dm196RXFJmyMpurEslw76X
 AS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zZssYCeoP5aake2EIWMeS48QuEA1jVbjiTGYDLuUZDU=;
 b=FBfKHk0E1/UalbomjWkkSc094Z9kc0gGiStXoerxOzo+/q7cI/pCZwG/GpAI1LgFTb
 M0auW2vZaRg9ivbK/GxpjHGHQ6WcpTojrfYVrDG/YQMKPTvIK86xfqz4hemyWFv2MOUH
 QL/KfrcVOhKDuT9AUHCDbp6PLDwlGJEAQ88eR/SkXhFMqaVkcmgAWFshsMGsyukLExG3
 66dLj3wPvdk4udY0JusfoYDcEM9NIgmEXy8z5HXofFOC7Mdw3Fb46/9xu9+o4AKqjcyZ
 AbfeZIonH2TrXev4SbiykCS/ZKHGlvewMV7EYuJiYDG91epst8KBMfhJDb5EYDUZ6CWr
 f8Ng==
X-Gm-Message-State: APjAAAWT+55w0cOeV8+YvYErQMBZLf0dgpnpuP08wR7qVhi12BmvtAAe
 n8BewZ/9T4tgDeXJNTnTyKpRq2QFNKQ+3w==
X-Google-Smtp-Source: APXvYqx4vIrOzYvFDJ8ou26m5dCh3RKFp7uEoPB7ffsjxEN1ooyJW4MlpQuWef4vYwghUxnEoOObsw==
X-Received: by 2002:a17:90a:3585:: with SMTP id
 r5mr30232973pjb.15.1561960954534; 
 Sun, 30 Jun 2019 23:02:34 -0700 (PDT)
Received: from localhost.localdomain (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id w14sm8672127pfn.47.2019.06.30.23.02.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 30 Jun 2019 23:02:33 -0700 (PDT)
From: Samuel Jiang <chyishian.jiang@gmail.com>
To: joel@jms.id.au,
	tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com
Subject: [PATCH dev-5.17 v1 5/6] ARM: dts: nuvoton: nuvoton-npcm750-runbmc:
 gpios which inside module
Date: Mon,  1 Jul 2019 14:01:36 +0800
Message-Id: <20190701060137.22116-5-chyishian.jiang@gmail.com>
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

add nuvoton-npcm750-runbmc-gpio-dtsi which include runbmc gpios
update nuvoton-npcm750-runbmc gpios which execute inside module

Signed-off-by: Samuel Jiang <Samuel.Jiang@quantatw.com>
---
 .../boot/dts/nuvoton-npcm750-runbmc-gpio.dtsi | 157 ++++++++++++++++++
 arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts  |  37 +++++
 2 files changed, 194 insertions(+)
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-runbmc-gpio.dtsi

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc-gpio.dtsi b/arch/arm/boot/dts/nuvoton-npcm750-runbmc-gpio.dtsi
new file mode 100644
index 000000000000..f2f575d099ab
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc-gpio.dtsi
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2019 Quanta Computer Inc. Samuel.Jiang@quantatw.com
+
+/ {
+	pinctrl: pinctrl@f0800000 {
+		gpio0ol_pins: gpio0ol-pins {
+			pins = "GPIO0/IOX1DI";
+			bias-disable;
+			output-low;
+		};
+		gpio1ol_pins: gpio1ol-pins {
+			pins = "GPIO1/IOX1LD";
+			bias-disable;
+			output-low;
+		};
+		gpio2ol_pins: gpio2ol-pins {
+			pins = "GPIO2/IOX1CK";
+			bias-disable;
+			output-low;
+		};
+		gpio3ol_pins: gpio3ol-pins {
+			pins = "GPIO3/IOX1D0";
+			bias-disable;
+			output-low;
+		};
+		gpio8o_pins: gpio8o-pins {
+			pins = "GPIO8/LKGPO1";
+			bias-disable;
+			output-high;
+		};
+		gpio9ol_pins: gpio9ol-pins {
+			pins = "GPIO9/LKGPO2";
+			bias-disable;
+			output-low;
+		};
+		gpio12ol_pins: gpio12ol-pins {
+			pins = "GPIO12/GSPICK/SMB5BSCL";
+			bias-disable;
+			output-low;
+		};
+		gpio13ol_pins: gpio13ol-pins {
+			pins = "GPIO13/GSPIDO/SMB5BSDA";
+			bias-disable;
+			output-low;
+		};
+		gpio14ol_pins: gpio14ol-pins {
+			pins = "GPIO14/GSPIDI/SMB5CSCL";
+			bias-disable;
+			output-low;
+		};
+		gpio15ol_pins: gpio15ol-pins {
+			pins = "GPIO15/GSPICS/SMB5CSDA";
+			bias-disable;
+			output-low;
+		};
+		gpio37ol_pins: gpio37ol-pins {
+			pins = "GPIO37/SMB3CSDA";
+			bias-disable;
+			output-low;
+		};
+		gpio38_pins: gpio38-pins {
+			pins = "GPIO38/SMB3CSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio39_pins: gpio39-pins {
+			pins = "GPIO39/SMB3BSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio94ol_pins: gpio94ol-pins {
+			pins = "GPIO94/nKBRST/SMB5DSDA";
+			bias-disable;
+			output-low;
+		};
+		gpio108ol_pins: gpio108ol-pins {
+			pins = "GPIO108/RG1MDC";
+			bias-disable;
+			output-low;
+		};
+		gpio109ol_pins: gpio109ol-pins {
+			pins = "GPIO109/RG1MDIO";
+			bias-disable;
+			output-low;
+		};
+		gpio110ol_pins: gpio110ol-pins {
+			pins = "GPIO110/RG2TXD0/DDRV0";
+			bias-disable;
+			output-low;
+		};
+		gpio111ol_pins: gpio111ol-pins {
+			pins = "GPIO111/RG2TXD1/DDRV1";
+			bias-disable;
+			output-low;
+		};
+		gpio112ol_pins: gpio112ol-pins {
+			pins = "GPIO112/RG2TXD2/DDRV2";
+			bias-disable;
+			output-low;
+		};
+		gpio113ol_pins: gpio113ol-pins {
+			pins = "GPIO113/RG2TXD3/DDRV3";
+			bias-disable;
+			output-low;
+		};
+		gpio208_pins: gpio208-pins {
+			pins = "GPIO208/RG2TXC/DVCK";
+			bias-disable;
+			input-enable;
+		};
+		gpio209ol_pins: gpio209ol-pins {
+			pins = "GPIO209/RG2TXCTL/DDRV4";
+			bias-disable;
+			output-low;
+		};
+		gpio210ol_pins: gpio210ol-pins {
+			pins = "GPIO210/RG2RXD0/DDRV5";
+			bias-disable;
+			output-low;
+		};
+		gpio211ol_pins: gpio211ol-pins {
+			pins = "GPIO211/RG2RXD1/DDRV6";
+			bias-disable;
+			output-low;
+		};
+		gpio212ol_pins: gpio212ol-pins {
+			pins = "GPIO212/RG2RXD2/DDRV7";
+			bias-disable;
+			output-low;
+		};
+		gpio213ol_pins: gpio213ol-pins {
+			pins = "GPIO213/RG2RXD3/DDRV8";
+			bias-disable;
+			output-low;
+		};
+		gpio214ol_pins: gpio214ol-pins {
+			pins = "GPIO214/RG2RXC/DDRV9";
+			bias-disable;
+			output-low;
+		};
+		gpio215ol_pins: gpio215ol-pins {
+			pins = "GPIO215/RG2RXCTL/DDRV10";
+			bias-disable;
+			output-low;
+		};
+		gpio216ol_pins: gpio216ol-pins {
+			pins = "GPIO216/RG2MDC/DDRV11";
+			bias-disable;
+			output-low;
+		};
+		gpio217ol_pins: gpio217ol-pins {
+			pins = "GPIO217/RG2MDIO/DVHSYNC";
+			bias-disable;
+			output-low;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
index 71501ccbef18..f39de2822f4c 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
@@ -4,6 +4,7 @@
 
 /dts-v1/;
 #include "nuvoton-npcm750.dtsi"
+#include "nuvoton-npcm750-runbmc-gpio.dtsi"
 
 / {
 	model = "Nuvoton npcm750 RunBMC Module";
@@ -564,6 +565,42 @@
 		};
 	};
 
+	pinctrl: pinctrl@f0800000 {
+		pinctrl-names = "default";
+		pinctrl-0 = <
+				/******* RunBMC inside Module pins *******/
+				&gpio0ol_pins
+				&gpio1ol_pins
+				&gpio2ol_pins
+				&gpio3ol_pins
+				&gpio8o_pins
+				&gpio9ol_pins
+				&gpio12ol_pins
+				&gpio13ol_pins
+				&gpio14ol_pins
+				&gpio15ol_pins
+				&gpio37ol_pins
+				&gpio38_pins
+				&gpio39_pins
+				&gpio94ol_pins
+				&gpio108ol_pins
+				&gpio109ol_pins
+				&gpio111ol_pins
+				&gpio112ol_pins
+				&gpio113ol_pins
+				&gpio208_pins
+				&gpio209ol_pins
+				&gpio210ol_pins
+				&gpio211ol_pins
+				&gpio212ol_pins
+				&gpio213ol_pins
+				&gpio214ol_pins
+				&gpio215ol_pins
+				&gpio216ol_pins
+				&gpio217ol_pins
+				>;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
-- 
2.20.1

