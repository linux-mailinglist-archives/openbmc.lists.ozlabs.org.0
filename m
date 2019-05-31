Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE4A30EE1
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 15:29:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Flfn2mZMzDqZL
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 23:29:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=franhsutw@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fHEABxLB"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FlbZ6ccBzDqWF
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 23:26:48 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id y11so6195445pfm.13
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 06:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k6E5Ogo9jYc91AiQ8WebDHVPyyZblZI4Qy3nP1ktOw0=;
 b=fHEABxLBJjVA4qLF6ZFn6etVi18ApISaVQBw2V3/BKfe1sWeh8Aj7/f1+2lDhKVJet
 DbVDPqwBIaPfX02YGQljMVQGqLXjedGa0eMccllnV/VC19ad4zMR2WQPjb7+j0mk2WbW
 KRLBTrDHGjW/O8J9skaxPIVrh8o8SLEWUlCEaIL2RRY+u01K/OIrQqGjgocStQZspWhx
 Z13vv9O2UvrtDBSIe04LFvXlOTCguw4eyJpG6YMHfmqySr3ecDRTntC5ByI1Pvffsy+9
 vuhPOY9uSpLVtPx5pWXYmvRlkvx2/zzWX105E7Jm/m7r/AT9y0TMyuJsInMitcN22ces
 QGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k6E5Ogo9jYc91AiQ8WebDHVPyyZblZI4Qy3nP1ktOw0=;
 b=NB7GuWC9kOYa5YAYw2XcT4HkG99Siek3XR5GMbSYoHtLlgu1O6hVi4hK8aqiVOPuvx
 ufwE2vJRHDW6W2XVSqJ6gamFen4q06jsgvY8Y40fFAsRQv/3byMa6dQ856TerDNVPKJ0
 Dp6XR8W3n4nY0dNEQwAar0UAjVvriopzZ7BMYLEr7pLXZvLbervduHImvWgNyG0RzmQG
 Mn7HCl2TcDS5fqhqYsRDBNPzRpUgHq64Gn1vyxFRy4cpXeLrnS1obwMBrsTwNGUgVcSk
 Kh8/mUMvBDPxRXSEQhRU0mFGhJYJfWtDnuTes2KpGipaCmdQUIYRHhFpBZyn7bGqxQLk
 IUlw==
X-Gm-Message-State: APjAAAXLNzh6zFLiX3pPOr3LpCDPyJ6QD2ed9/XQoRIg0auxuIScb9vo
 738CKqG+7nyHsFD4yYfi/a4=
X-Google-Smtp-Source: APXvYqwVdts85TPxzAouo9WVduNTorWDJiPzdg5RQoBJojBE8Ocl5fl1xBz7OLTyKYIZVCCRNVffyQ==
X-Received: by 2002:a62:4dc5:: with SMTP id a188mr10166318pfb.8.1559309205009; 
 Fri, 31 May 2019 06:26:45 -0700 (PDT)
Received: from localhost.localdomain (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id p20sm15444571pgk.7.2019.05.31.06.26.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 31 May 2019 06:26:44 -0700 (PDT)
From: Fran Hsu <franhsutw@gmail.com>
X-Google-Original-From: Fran Hsu <Fran.Hsu@quantatw.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH dev-5.1 v5 1/4] ARM: dts: nuvoton: Add NPCM730 common device
 tree include file.
Date: Fri, 31 May 2019 21:24:37 +0800
Message-Id: <20190531132440.37572-1-Fran.Hsu@quantatw.com>
X-Mailer: git-send-email 2.21.0
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

Quanta GSJ BMC uses the Nuvoton NPCM730 BMC soc.
This file describes the common setting of NPCM730 soc.

Signed-off-by: Fran Hsu <Fran.Hsu@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm730.dtsi | 57 ++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm730.dtsi

diff --git a/arch/arm/boot/dts/nuvoton-npcm730.dtsi b/arch/arm/boot/dts/nuvoton-npcm730.dtsi
new file mode 100644
index 000000000..20e13489b
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

