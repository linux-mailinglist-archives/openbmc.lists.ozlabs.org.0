Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 234382017E
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2019 10:46:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454Q572P1gzDqbF
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2019 18:46:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=franhsutw@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z0BUt97l"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454Q4X32VhzDqZG
 for <openbmc@lists.ozlabs.org>; Thu, 16 May 2019 18:46:00 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id y11so1463169pfm.13
 for <openbmc@lists.ozlabs.org>; Thu, 16 May 2019 01:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d4h1E/yatgT+rf64kqBXtFAoUtOpyZWwvUrP9czpAvI=;
 b=Z0BUt97ltZg99BehhCXN3Ak8MP2/HCthPxj21aeFCscJ8MnyfjmVdi7lP2aq4T8no3
 U3dyHsuQDUxTQwY5y/Tc0XiirUuDiEl7BY1IodgJeyuxznPjKMdyuWhGPHmgZ2KCrQuY
 PaO03/nFBWIrWoQczqSGl8X6EltwmyyAzy+12BpM2ifAqilIvfQInnz8SHSusRmIQ8vA
 2P5cXlDYGpV1q09WZE63/mEWpcl50Ln2S+zeO114KuZLpTC8ddWpWdGtDlrEhpZdh5Mf
 DEpvhnwkaufSGhdXZxuU5ZW0uOillnopnXkWz3UwsU0xLqrsMk0QEwNVjL2REV5hBGx9
 lQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d4h1E/yatgT+rf64kqBXtFAoUtOpyZWwvUrP9czpAvI=;
 b=c7cUJNyjG4GCuxjnKkuybVv7YsgLOu4uFJTIF9WzUnaaVnt+zCyZV1XXxnQWMxSOdm
 0vuCizUtcXAC2qPI6UpVY6DS09xTFIfrDHjwgdKRMZSzxID90WaDzwkUgPxb2DaZRPur
 uh2Wc5VJE4hgboCyEpyAgIxH8l3sXA5g9czHOD1Pr/R7nwEzuWisCWdoRHhM7grNZP4l
 0M/MM1PzZNAqCgkNQBvYkVTGIPK8Ic302yQ9VP23xG5Mu+doZ3ClD36Tow+3fC0bqm/e
 VsNHDmio9er0DaBqOHMqCjvg1Jn8P5bvJEcu44nCSAoX8gSh9dHG1+uW5W+JhH1aPfWi
 DYNw==
X-Gm-Message-State: APjAAAXNGnEIcMsJdadiAtYuhE0OlGWulnGch8yINLqlmX+M2EiLQeOO
 oN3FmIG9F3/Lp0DJjwRg6jw=
X-Google-Smtp-Source: APXvYqzkzVnFx29SGXQ9AsUIRsGdN4SimB6+OAH7zHYvn75KX4U0d1ybPoA2U4y0H8cHe9ge1SUmcw==
X-Received: by 2002:a62:5581:: with SMTP id
 j123mr53116524pfb.102.1557996357774; 
 Thu, 16 May 2019 01:45:57 -0700 (PDT)
Received: from localhost.localdomain (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id b186sm6233286pga.5.2019.05.16.01.45.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 16 May 2019 01:45:57 -0700 (PDT)
From: Fran Hsu <franhsutw@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH dev-5.1 v3 3/3] ARM: dts: nuvoton: Add NPCM730 common device
 tree include file.
Date: Thu, 16 May 2019 16:43:49 +0800
Message-Id: <20190516084349.11556-3-franhsutw@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190516084349.11556-1-franhsutw@gmail.com>
References: <20190516084349.11556-1-franhsutw@gmail.com>
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
Cc: openbmc@lists.ozlabs.org, Fran Hsu <Fran.Hsu@quantatw.com>,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Fran Hsu <Fran.Hsu@quantatw.com>

Quanta GSJ BMC uses the Nuvoton NPCM730 BMC processor.
This file describes the common setting for NPCM730.

Signed-off-by: Fran Hsu <Fran.Hsu@quantatw.com>
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

