Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A42C78FAF3A
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2024 11:48:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MMAL+3dB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vtm4G0QQhz3cWY
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2024 19:48:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MMAL+3dB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vtm3l156Sz3bnL
	for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2024 19:47:46 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1f6559668e1so20565675ad.3
        for <openbmc@lists.ozlabs.org>; Tue, 04 Jun 2024 02:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717494458; x=1718099258; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1X86UrlNnNHd4MbsG+HMHfkWOAkCb3vE3HB3cFKW300=;
        b=MMAL+3dBYUBM1v878Ng+8mqYraUhb4WcGfZpiApFcIIdwpsHvUBMCtFJkualc2vy8f
         Ha//ChsccX7NaXu4peCjUEwh0uI1VvZMLYW3IdOxU/dn/GRXbCg+WKPooQ5RM3HWafFR
         ahxGvtn0bd5VeALywbkJMNz/jGX5GEiDev3MkHRDJfTVbblvhzQPzVqlRDA8+t89DM9x
         iC5gvnAa+B8SGLusxfnLlcgGkwSMl99TgOmxA1IjFsqw0znYUuRNMEQ0x9F9d4456t+v
         apjPaKsM9s9u8MYROgewBZxtukGvQK3U8XgzPPSCU0Is78vCmJrMUW/tZQuMPNtEdzZx
         ORag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717494458; x=1718099258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1X86UrlNnNHd4MbsG+HMHfkWOAkCb3vE3HB3cFKW300=;
        b=Vad4WIVDbMThoibtgSECDr45l1k6m6k3omeZ7neRPy2MqaXuMdDY/LKci3RpivbhQ5
         lKMnGGWvAIbA1gx36vgN6GXZqgRBjrGFbPfu6E3UFZ9J7QYWyFYEy3pp2TTiSuXZduI2
         dR7I32ytiFPwubck6+q0E4HyAL0XKaFTI46QKvYSPJefUIGJvqxGHzpyrTDzdDcYDqDt
         a1pivDhie3u28Dx3DZRqZKfhoJX8odNgmmQPnLTAyg/BzcY/WEsKqTri+cqBy0Jun9y6
         SvQQALGvncfQaMncGJC7PXEpHvryUDKx0nDa6L0xcMGyXgpz9uUV3ERu8khrl1nIPCRy
         kZ4A==
X-Gm-Message-State: AOJu0YzYbaEO0nW1wKErvPAjU3dhrLD4zrlc9vUd7jvW3BkKpToeLva9
	1YJC3JBRKOGhmgGeXR+R6v2n2RB4F3L3yNjPxqE1qI6QoRMeiIv0gQ3wxw==
X-Google-Smtp-Source: AGHT+IFwopVvMOmoh9w4Xqw90/zx/ZRs58G/QlOyNZBuS76mO4XAbbfq27Q39ChH6wnb+lJEc7WOjA==
X-Received: by 2002:a17:903:41c2:b0:1f6:77fc:881c with SMTP id d9443c01a7336-1f677fca02bmr64191975ad.28.1717494458473;
        Tue, 04 Jun 2024 02:47:38 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323dfe2fsm81193575ad.131.2024.06.04.02.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 02:47:38 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz
Subject: [PATCH v2] ARM: dts: Aspeed: Add Facebook Harma DTS
Date: Tue,  4 Jun 2024 17:45:33 +0800
Message-Id: <20240604094533.2900564-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: peter.yin@quantatw.com, Peter Yin <peteryin.openbmc@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Initial introduction of Facebook Harma
equipped with Aspeed 2600 BMC SoC.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
Change log:

v1 -> v2
 - Revise common to harma

v1
 - Create facebook common dts
---
 arch/arm/dts/Makefile          |  1 +
 arch/arm/dts/ast2600-harma.dts | 66 ++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 arch/arm/dts/ast2600-harma.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 6f4b4d8a17..cb96c0a673 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -688,6 +688,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2600-evb.dtb \
 	ast2600-fpga.dtb \
 	ast2600-greatlakes.dtb \
+	ast2600-harma.dtb \
 	ast2600-intel.dtb \
 	ast2600-intel.dtb \
 	ast2600-ncsi.dtb \
diff --git a/arch/arm/dts/ast2600-harma.dts b/arch/arm/dts/ast2600-harma.dts
new file mode 100644
index 0000000000..11d6d5d60c
--- /dev/null
+++ b/arch/arm/dts/ast2600-harma.dts
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2024 Meta Platforms Inc.
+/dts-v1/;
+
+#include "ast2600-u-boot.dtsi"
+
+/ {
+	model = "Facebook Harma BMC";
+	compatible = "facebook,harma-bmc", "aspeed,ast2600";
+
+	memory {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	aliases {
+		spi0 = &fmc;
+	};
+
+	cpus {
+		cpu@0 {
+			clock-frequency = <800000000>;
+		};
+		cpu@1 {
+			clock-frequency = <800000000>;
+		};
+	};
+};
+
+&uart5 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&sdrammc {
+	clock-frequency = <400000000>;
+};
+
+&fmc {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fmcquad_default>;
+
+	flash@0 {
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+
+	flash@1 {
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+};
+
+&hace {
+	status = "okay";
+};
-- 
2.25.1

