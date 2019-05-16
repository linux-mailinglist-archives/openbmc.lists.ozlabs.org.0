Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1FB20461
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2019 13:17:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454TQj5P9SzDqbw
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2019 21:17:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=franhsutw@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TWeh/djM"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454TMS5B3JzDqZS
 for <openbmc@lists.ozlabs.org>; Thu, 16 May 2019 21:14:12 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id g69so1471310plb.7
 for <openbmc@lists.ozlabs.org>; Thu, 16 May 2019 04:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mVl4SxOHa6LwCoDiz4NqhMgaMZM9KtT89DLqH3Squ3Y=;
 b=TWeh/djMgvOpzAfHxPER0uY555P1a/xBgbJOTjhtP49vB7gXWRa6ucZXNZx0g/Tbfr
 GFsyGXQ43m+p3MBO0352p0O+2VpG9QBZJaYprDdEXeYd4m3W4x51oICdgXBcgG6CvJDY
 SL0IletR3A/miGqbQjMXQv2uMS0DuEKPwV1+BmIS7Jaj1qB0XM9s/bFxSN0U7Sacxpb2
 KeEj81pZcdEm3SzpbPfYYE/3gCQenPZEha7ALpsQRx4awX4Qu9luWyMNs+gir7heaGnM
 sdntaHFtqgT2Rj49+SyrPGtae3DnYh93nCXWvOrRn7nkg0j2ke7x42IGPwRGkcqWhr/N
 huZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mVl4SxOHa6LwCoDiz4NqhMgaMZM9KtT89DLqH3Squ3Y=;
 b=fCiAiDSzz7C+nzkPUiU+B5zw0q4JGE/2+/6dZS8QaBbVjTVik7Y5lfgt6lXp2t06Vc
 zQTY5GTzUuXdMdphX0rFefDcvUo7SamX9+VUBRdi0VqV6yFhBmc6iIGjwc21g4ebzXdJ
 REh96GTU8srxFtrwanaxtM6FJBHrQtcuOXL3J0jRq42FuvkooVvkEM4ONKGN5n8C+HV+
 38AJXJmC9xxC7cLgrIxHTWEU0dUD/H4BkVZtuwQitoNShh6olwmF3kMF2wFipnXA0SCk
 ujztcZsurcmQC+DYF8cTI77VOKHCiHHStPF/qoJgQOBgCQ4lUTInXVwkNvEbN5vvAVrM
 3zoA==
X-Gm-Message-State: APjAAAWzjJ2Dq7Wa3SwKaTo5sXmpN4PpvSNNvadlCcyVCehBQQdAcy2h
 wEPUtXyR3I66LUnEDRAkt5u0yfW2PMQ=
X-Google-Smtp-Source: APXvYqzPjZ78u2HgykUwOfSvSHHbLLvKXF6GoCG4tDmq4TcuS/ienrH/ck9S/kaw/buYwhzkLRApEQ==
X-Received: by 2002:a17:902:d890:: with SMTP id
 b16mr1550028plz.91.1558005250011; 
 Thu, 16 May 2019 04:14:10 -0700 (PDT)
Received: from localhost.localdomain (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id n2sm5962742pgp.27.2019.05.16.04.14.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 16 May 2019 04:14:09 -0700 (PDT)
From: Fran Hsu <franhsutw@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH dev-5.1 v4 4/4] ARM: dts: nuvoton: Add NPCM730 common device
 tree include file.
Date: Thu, 16 May 2019 19:12:00 +0800
Message-Id: <20190516111200.13859-4-franhsutw@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190516111200.13859-1-franhsutw@gmail.com>
References: <20190516111200.13859-1-franhsutw@gmail.com>
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
Cc: openbmc@lists.ozlabs.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Quanta GSJ BMC uses the Nuvoton NPCM730 BMC soc.
This file describes the common setting of NPCM730 soc.

Signed-off-by: Fran Hsu <franhsutw@gmail.com>
---
 arch/arm/boot/dts/nuvoton-npcm730.dtsi | 57 ++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm730.dtsi

diff --git a/arch/arm/boot/dts/nuvoton-npcm730.dtsi b/arch/arm/boot/dts/nuvoton-npcm730.dtsi
new file mode 100644
index 000000000000..20e13489b993
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm730.dtsi
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2018 Nuvoton Technology tomer.maimon@nuvoton.com
+// Copyright 2018 Google, Inc.
+
+#include "nuvoton-common-npcm7xx.dtsi"
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	interrupt-parent = <&gic>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		enable-method = "nuvoton,npcm750-smp";
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			clocks = <&clk NPCM7XX_CLK_CPU>;
+			clock-names = "clk_cpu";
+			reg = <0>;
+			next-level-cache = <&l2>;
+		};
+
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			clocks = <&clk NPCM7XX_CLK_CPU>;
+			clock-names = "clk_cpu";
+			reg = <1>;
+			next-level-cache = <&l2>;
+		};
+	};
+
+	soc {
+		timer@3fe600 {
+			compatible = "arm,cortex-a9-twd-timer";
+			reg = <0x3fe600 0x20>;
+			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) |
+						  IRQ_TYPE_LEVEL_HIGH)>;
+			clocks = <&clk NPCM7XX_CLK_AHB>;
+		};
+	};
+
+	ahb {
+		udc9:udc@f0839000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0839000 0x1000
+			       0xfffd0000 0x800>;
+			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+		};
+	};
+};
-- 
2.21.0

