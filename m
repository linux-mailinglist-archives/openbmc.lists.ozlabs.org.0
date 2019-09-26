Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A33CBEAA1
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 04:33:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dzVx4pY5zDqhK
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 12:33:13 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dzTS1xfjzDqfr
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 12:31:55 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 1/2] ARM: dts: Add 128MiB OpenBMC flash layout
Date: Wed, 25 Sep 2019 22:32:29 -0400
Message-Id: <20190926023230.29810-2-bradleyb@fuzziesquirrel.com>
In-Reply-To: <20190926023230.29810-1-bradleyb@fuzziesquirrel.com>
References: <20190926023230.29810-1-bradleyb@fuzziesquirrel.com>
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

This is an alternate layout used by OpenBMC systems.  It describes the
fixed flash layout for 128MiB devices.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../boot/dts/openbmc-flash-layout-128.dtsi    | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 arch/arm/boot/dts/openbmc-flash-layout-128.dtsi

diff --git a/arch/arm/boot/dts/openbmc-flash-layout-128.dtsi b/arch/arm/b=
oot/dts/openbmc-flash-layout-128.dtsi
new file mode 100644
index 000000000000..4e2819a8dac6
--- /dev/null
+++ b/arch/arm/boot/dts/openbmc-flash-layout-128.dtsi
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+partitions {
+	compatible =3D "fixed-partitions";
+	#address-cells =3D <1>;
+	#size-cells =3D <1>;
+
+	u-boot@0 {
+		reg =3D <0x0 0x60000>;
+		label =3D "u-boot";
+	};
+
+	u-boot-env@60000 {
+		reg =3D <0x60000 0x20000>;
+		label =3D "u-boot-env";
+	};
+
+	kernel@80000 {
+		reg =3D <0x80000 0x780000>;
+		label =3D "kernel";
+	};
+
+	rofs@800000 {
+		reg =3D <0x800000 0x5800000>;
+		label =3D "rofs";
+	};
+
+	rwfs@6000000 {
+		reg =3D <0x6000000 0x2000000>;
+		label =3D "rwfs";
+	};
+};
--=20
2.21.0
