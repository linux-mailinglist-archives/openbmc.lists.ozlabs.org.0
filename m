Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6B1F506
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 13:02:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tdrq0Q33zDqMs
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 21:02:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=ray.lue@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vzr1TdUv"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tdqc20HBzDqMq
 for <openbmc@lists.ozlabs.org>; Tue, 30 Apr 2019 21:00:59 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id u17so2898751pfn.7
 for <openbmc@lists.ozlabs.org>; Tue, 30 Apr 2019 04:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=WC3L39kZUzETd/chRm2rczn/nzsMh9TmBkCYdZ7BDlA=;
 b=Vzr1TdUvljTfwT3g+zXvl3xwrz68i26Il+qcOFuITlY2XgOKnRdmq5GchY0YlJluC6
 qiw+FhhAlhvB8F83gu+4Tzwzwip3Y72CDp8gvMUGD0HLKU4VGVtY6BaTe0LWrzVSXy78
 OvSzMiFYp2LyFJ3hZznF524oaDv+d+qaWdj0ivYliuSJfTQqQLMlEJBoFdr2sAYOm4Ew
 319zV/BusyJZFuA0MAvPETL/Wp/96gpfQFXvdCuDsqIWEXSWpvmP4JMRx48atZIfl2W0
 UZNWpDAHsAY1hcFMVlwUVWxjL3EeI9FB0n879p/LZ6qe2Y0Pmoc81CLU6HOzqu6CoqLD
 bOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=WC3L39kZUzETd/chRm2rczn/nzsMh9TmBkCYdZ7BDlA=;
 b=uoA8ybUI3iXpKEPmFBsl1ecMCCWKZmrDhwe2+xgYjjIdcz2ULBopazXqyadFlrGCwC
 UIAhKz0n5yFP+LhxFFds2RReId18sUj1TDCJwFiqjL4BLpPpcwLSqoDKuykZCf20uWYr
 ZL1yZs6bQ90ccnaqyFEaogV/dZ27GaKJ1WxzGvLYhQby0CLNiax+TTFrVe9tmvY2B6Mg
 IPdoDpWxblWi2RwMlWJ6B61jo7LKs7biL0hO1RI8MBfYnHRz0mg7jrOdlrX98lplcF4Y
 bzKKUkmIEDbFLj8G8+V9BbrwybPHZcfR3EsW7zQRj8hzKuR/rvLkFT7Bs8B8t7s4+ljG
 3Wwg==
X-Gm-Message-State: APjAAAXc+6FUw2jggD9awX81k+Di5sbtdJX9aNMykZQbZTjoLY6MxbX9
 /CzzXJRagwb3SqQXfiXV2ffSnj5URpY=
X-Google-Smtp-Source: APXvYqwvAiGIuBvSVD1c7ZsC3Jn5eNd57E0FkLDxagpw5N9SzU9M/z93UpbIxM2TZpSSQ34tQvhnWw==
X-Received: by 2002:a62:e411:: with SMTP id r17mr24456869pfh.127.1556622055554; 
 Tue, 30 Apr 2019 04:00:55 -0700 (PDT)
Received: from localhost.localdomain ([220.130.36.2])
 by smtp.gmail.com with ESMTPSA id f21sm2888450pfn.30.2019.04.30.04.00.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 30 Apr 2019 04:00:54 -0700 (PDT)
From: Ray Lue <ray.lue@gmail.com>
X-Google-Original-From: Ray Lue <ray.lue@mic.com.tw>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.0 v2 1/1] ARM: dts: aspeed: Add s7106 BMC Machine
Date: Tue, 30 Apr 2019 19:00:19 +0800
Message-Id: <1556622019-7790-1-git-send-email-ray.lue@mic.com.tw>
X-Mailer: git-send-email 2.7.4
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
Cc: Ray Lue <ray.lue@mic.com.tw>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

s7106 is a Tyan platform family with an ASPEED AST2500 BMC.

Signed-off-by: Ray Lue <ray.lue@mic.com.tw>
---
 arch/arm/boot/dts/Makefile                  |   3 +-
 arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts | 175 ++++++++++++++++++++++++++++
 2 files changed, 177 insertions(+), 1 deletion(-)
 create mode 100755 arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index bd40148..bc38f77 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1247,4 +1247,5 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-opp-witherspoon.dtb \
 	aspeed-bmc-opp-zaius.dtb \
 	aspeed-bmc-portwell-neptune.dtb \
-	aspeed-bmc-quanta-q71l.dtb
+	aspeed-bmc-quanta-q71l.dtb \
+	aspeed-bmc-tyan-s7106.dtb
diff --git a/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
new file mode 100755
index 0000000..563558d
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
@@ -0,0 +1,175 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+
+/ {
+	model = "Tyan S7106 BMC";
+	compatible = "tyan,s7106-bmc", "aspeed,ast2500";
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,115200 earlyprintk";
+	};
+
+	memory {
+		reg = <0x80000000 0x20000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		vga_memory: framebuffer@98000000 {
+			no-map;
+			reg = <0x98000000 0x00800000>; /* 8MB */
+		};
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
+			<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
+			<&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
+			<&adc 12>, <&adc 13>, <&adc 14>;
+	};
+
+	iio-hwmon-battery {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 15>;
+	};
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		label = "bmc";
+		status = "okay";
+		m25p,fast-read;
+#include "openbmc-flash-layout.dtsi"
+	};
+};
+
+// UART1 is used only by the host. While the BMC does not need to access it,
+// enable it here to make sure the UART's clock gets enabled.
+&uart1 {
+	status = "okay";
+};
+
+&uart3 {
+	status = "okay";
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&lpc_ctrl {
+	status = "okay";
+};
+
+&lpc_snoop {
+	status = "okay";
+	snoop-ports = <0x80>;
+};
+
+&adc {
+	status = "okay";
+};
+
+&pwm_tacho {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm3_default &pinctrl_pwm4_default>;
+
+	fan@0 {
+		reg = <0x03>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x02>;
+	};
+
+	fan@1 {
+		reg = <0x04>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x03>;
+	};
+
+	fan@2 {
+		reg = <0x03>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x04>;
+	};
+
+	fan@3 {
+		reg = <0x04>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x05>;
+	};
+
+	fan@4 {
+		reg = <0x03>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x06>;
+	};
+
+	fan@5 {
+		reg = <0x04>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x07>;
+	};
+};
+
+&i2c0 {
+	status = "okay";
+
+	nct7802@28 {
+		compatible = "nuvoton,nct7802";
+		reg = <0x28>;
+	};
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "at,24c256";
+		reg = <0x50>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&i2c5 {
+	status = "okay";
+};
+
+&i2c6 {
+	status = "okay";
+};
+
+&i2c7 {
+	status = "okay";
+};
+
+&i2c8 {
+	status = "okay";
+};
+
+&mac0 {
+	status = "okay";
+
+	use-ncsi;
+	no-hw-checksum;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii1_default>;
+};
+
+&ibt {
+	status = "okay";
+};
-- 
2.7.4

