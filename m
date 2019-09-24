Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B774DBD331
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 21:57:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dBmz2Fd7zDqPW
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 05:57:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dBYc3vq8zDqZx
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 05:47:48 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: joel@jms.id.au
Subject: [PATCH v3 linux dev-5.3 07/10] ARM: dts: aspeed: Add Rainier system
Date: Tue, 24 Sep 2019 15:47:56 -0400
Message-Id: <20190924194759.26854-8-bradleyb@fuzziesquirrel.com>
In-Reply-To: <20190924194759.26854-1-bradleyb@fuzziesquirrel.com>
References: <20190924194759.26854-1-bradleyb@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Rainier is a new IBM server with POWER host processors and an AST2600
BMC.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
v3:
  - removed i2c, mac
  - moved reserved memory
  - set correct memory size
v2:
  - reordered rainier DT elements (alphabetized).
  - added rainier rtc, lpc-ctl, reserved memory, mac devices
---
 arch/arm/boot/dts/Makefile                   |  1 +
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 57 ++++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 5af075c2f819..3ad9706337a2 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1278,6 +1278,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
 	aspeed-bmc-facebook-wedge40.dtb \
 	aspeed-bmc-facebook-wedge100.dtb \
 	aspeed-bmc-facebook-yamp.dtb \
+	aspeed-bmc-ibm-rainier.dtb \
 	aspeed-bmc-intel-s2600wf.dtb \
 	aspeed-bmc-inspur-fp5280g2.dtb \
 	aspeed-bmc-lenovo-hr630.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot=
/dts/aspeed-bmc-ibm-rainier.dts
new file mode 100644
index 000000000000..f56a7dddba62
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2019 IBM Corp.
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+
+/ {
+	model =3D "Rainier";
+	compatible =3D "ibm,rainier-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial4 =3D &uart5;
+	};
+
+	chosen {
+		stdout-path =3D &uart5;
+		bootargs =3D "console=3DttyS4,115200n8";
+	};
+
+	memory@80000000 {
+		device_type =3D "memory";
+		reg =3D <0x80000000 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells =3D <1>;
+		#size-cells =3D <1>;
+		ranges;
+
+		flash_memory: region@BB000000 {
+			no-map;
+			reg =3D <0xBB000000 0x04000000>; /* 64M */
+		};
+	};
+
+};
+
+&emmc_controller {
+	status =3D "okay";
+};
+
+&emmc {
+	status =3D "okay";
+};
+
+&fsim0 {
+	status =3D "okay";
+};
+
+&ibt {
+	status =3D "okay";
+};
+
+&lpc_ctrl {
+	status =3D "okay";
+	memory-region =3D <&flash_memory>;
+};
--=20
2.21.0
