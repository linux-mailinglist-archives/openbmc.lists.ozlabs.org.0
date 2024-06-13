Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 810169077EF
	for <lists+openbmc@lfdr.de>; Thu, 13 Jun 2024 18:11:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gTn7l5HM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0S8W2q8Zz3cXR
	for <lists+openbmc@lfdr.de>; Fri, 14 Jun 2024 02:11:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gTn7l5HM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0S7y1TTlz3cVG
	for <openbmc@lists.ozlabs.org>; Fri, 14 Jun 2024 02:11:08 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-705cffc5bcfso709592b3a.3
        for <openbmc@lists.ozlabs.org>; Thu, 13 Jun 2024 09:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718295067; x=1718899867; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wX/FvAR/PCQAGrTIyLaOf/2ODMrnS/BNkBPUna13VU0=;
        b=gTn7l5HMEF+MAN+/fbqjsJq1XaoP58SHYKYgzbI0HmBS97DFfGEpUVvUvliHbpY5gL
         RBX2uQVrJRYIX6dl9ke/6jZ6tbiWwe7VxSDIXUEluLb5prGiB5YOM0orCLzMRnVdHIs/
         XUeg1kD3IaVQokbWBG+r4GKPipHqpdl8/+DrXlpbP71JpM8Y98aWQfR2enoGKEshk00n
         GcR3naW+RGwwKLL1IFZ9l9Oj8lKZLwpnYFUWw6i7U5bkLzcRvrff73q+v5bLutD0qi4p
         VMHcGJkGbYpp7LmIoEktBhWFKe0hd/7VMSsc7SgqKrZPXVwa7cxlkJlgtJCSk7/W1qCd
         fgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718295067; x=1718899867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wX/FvAR/PCQAGrTIyLaOf/2ODMrnS/BNkBPUna13VU0=;
        b=hQQCjXRuqp9aDM2WEcvWnS2acBPKrfAs6uWPiHj9vL3aiyXH1lvnoxjP0DkF+gutq0
         kg2eiFpYPflJJhxXLAUago5dsOE8mJb34T0H3rhpty6zv51CnqrOpKP3ZS21E7IXkJFC
         VVOwsKhoXAsyDTsZNNmfsGo/nVL5DBay1wBoQL7ulI8zk9pN20ZpIpk5CF7Ve5f+1XvM
         C5Gu4sqLXGgbI1wZ4h+vDHy3TFy+m1x+hPhTefeTqPIZ26eY7jCBfscq2S9QAXyJkWh6
         eeQGivzb4U3Fv7JmBaeWtUiu/hxMcZKUJcV8B2H9d4WhKFFhcVzumAiSlbIR9GvlUWVX
         YfEg==
X-Gm-Message-State: AOJu0YzH+Be9jfnMja7qhetahYDnwVHy7lpqzncEkL3lmbNyrx621EI5
	yWG0dDNx4fUq3iypgP5bnnPe3UvLTQPJl20KpHvZnrVbvGLLC2b/maXG4Q==
X-Google-Smtp-Source: AGHT+IGtW3L5vz8auHQrGcyYSfve4d9Ca/CXW9wQV2fsjOv3WMTJ5QiCEANwXZicoCF6/gr368vTGA==
X-Received: by 2002:a05:6a20:321b:b0:1b8:391f:dfaf with SMTP id adf61e73a8af0-1bae8255741mr262857637.52.1718295067447;
        Thu, 13 Jun 2024 09:11:07 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc97fd59sm1499407b3a.84.2024.06.13.09.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 09:11:07 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz
Subject: [PATCH u-boot, v2019.04-aspeed-openbmc v3] ARM: dts: Aspeed: Add Facebook DTS
Date: Fri, 14 Jun 2024 00:09:00 +0800
Message-Id: <20240613160900.1624493-1-peteryin.openbmc@gmail.com>
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
Cc: Peter Yin <peteryin.openbmc@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Initial introduction of Facebook
equipped with Aspeed 2600 BMC SoC.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
Change log:

v2 -> v3
 - Rename ast2600-facebook.dtb

v1 -> v2
 - Revise common to harma

v1
 - Create facebook common dts
---

 arch/arm/dts/Makefile             |  1 +
 arch/arm/dts/ast2600-facebook.dts | 66 +++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 arch/arm/dts/ast2600-facebook.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 6f4b4d8a17..13374bb12a 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -686,6 +686,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2600-dcscm.dtb \
 	ast2600-evb-ecc.dtb \
 	ast2600-evb.dtb \
+	ast2600-facebook.dtb \
 	ast2600-fpga.dtb \
 	ast2600-greatlakes.dtb \
 	ast2600-intel.dtb \
diff --git a/arch/arm/dts/ast2600-facebook.dts b/arch/arm/dts/ast2600-facebook.dts
new file mode 100644
index 0000000000..b988ff755e
--- /dev/null
+++ b/arch/arm/dts/ast2600-facebook.dts
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2024 Meta Platforms Inc.
+/dts-v1/;
+
+#include "ast2600-u-boot.dtsi"
+
+/ {
+	model = "Facebook BMC";
+	compatible = "facebook,harma-bmc", "facebook,minerva-bmc", "aspeed,ast2600";
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

