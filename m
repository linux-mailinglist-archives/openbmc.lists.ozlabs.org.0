Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BAB35E32
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2019 15:44:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Jqlm13svzDqdX
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2019 23:44:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=franhsutw@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aPNYORnr"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Jqcq5ZxdzDqQZ
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jun 2019 23:38:35 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id d126so14874743pfd.2
 for <openbmc@lists.ozlabs.org>; Wed, 05 Jun 2019 06:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fnsg7RoHNxA79DoHvbxI0hDVu6SuObGyE2qZvAQB/7E=;
 b=aPNYORnrGmJjs5EG3BCDojI4a94/xoceNyJ1csbofosrXuiB/Hd63PmNas0VQe5kU0
 +B0zNZPFqMo48NPe8XAzYE0cHqwcddJuk7QtY+Zl4Vk3IjhM3gkB1/rvQs2mT07BBH03
 Rk13AChDBoipB+87A27Uz9oNBA09VsLlIBrZbxL7nrGVeUvI+swb8FBHJgCvzFRsUSOi
 zqIBVQsIJ4G/37V6oz0sIR45Nih3KGo8sMrlwXpOZFv7LBXkBO/0I57HRNbsJAwbnBnJ
 a8iOCzAjW9okQYstdpVSDH/EMe4uFOorMhbBO7IPJMbBAZVyYil0Ip7+wATxgDOq2z3/
 IusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fnsg7RoHNxA79DoHvbxI0hDVu6SuObGyE2qZvAQB/7E=;
 b=QXNpoH5jzINeJz/lx8PjXHH0DkFE8SMSacV5nOA6PHBqPlbQGQndpGHvHXGZBfYcbU
 JP+iPgFe8//4IcIhcYdlcUae6/l3coHOBJ7njouF6D0noYECavPteHPPjAKgt0rXorYG
 UqM2yMF8AmZAQsg2MTu/7xllrnpdT6UcpkJdSXU0d9G7Dg+332lKsK7CPIWlfbqrVeG9
 N4iD1uCCt8HaFog6gMgJoNwU82JhRDGQXmRySRmlNYuLlgvkpHfGJVZoCj3Q24YWuo3D
 CZeBhMValEoIMRCnEKfiu+6UVFfTdhiyUNSZTH9dCSxHSjIWyMjM0eaXCryXvFbi+oZI
 uckg==
X-Gm-Message-State: APjAAAVSogPyHQ8zNxIaqLufS7Pykd2Nte3McJsIqqTofKghbXpFTiwk
 VKsOJVmNIIal4bzQfBkuBo4=
X-Google-Smtp-Source: APXvYqzZxVeeRABWFZloSvXoWYAfn/7dGemuAQkNeMfTvFLlEjrhNtTliDW80qKPpFhP8DBBU2puhA==
X-Received: by 2002:a17:90a:ac11:: with SMTP id
 o17mr35894665pjq.134.1559741910184; 
 Wed, 05 Jun 2019 06:38:30 -0700 (PDT)
Received: from localhost.localdomain (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id u4sm20469361pfu.26.2019.06.05.06.38.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 05 Jun 2019 06:38:29 -0700 (PDT)
From: Fran Hsu <franhsutw@gmail.com>
X-Google-Original-From: Fran Hsu <Fran.Hsu@quantatw.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH dev-5.1 v6 1/4] ARM: dts: nuvoton: Add NPCM730 common device
 tree include file.
Date: Wed,  5 Jun 2019 21:36:22 +0800
Message-Id: <20190605133625.991-1-Fran.Hsu@quantatw.com>
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

