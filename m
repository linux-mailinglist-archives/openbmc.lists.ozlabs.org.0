Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D576258864
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 08:43:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgcwR4vdRzDqMb
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 16:43:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=ibm.com (client-ip=103.200.3.19; helo=segapp03.wistron.com;
 envelope-from=jet.le@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=ibm.com
X-Greylist: delayed 310 seconds by postgrey-1.36 at bilbo;
 Tue, 01 Sep 2020 16:24:13 AEST
Received: from segapp03.wistron.com (segapp02.wistron.com [103.200.3.19])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BgcV62HHtzDqDm
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 16:24:13 +1000 (AEST)
Received: from EXCHAPP04.whq.wistron (unverified [10.37.38.27]) by
 TWNHUMSW4.wistron.com (Clearswift SMTPRS 5.6.0) with ESMTP id
 <Te15671c5a1c0a8167231c@TWNHUMSW4.wistron.com>; 
 Tue, 1 Sep 2020 14:18:58 +0800
Received: from EXCHAPP01.whq.wistron (10.37.38.24) by EXCHAPP04.whq.wistron
 (10.37.38.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 1 Sep 2020
 14:18:57 +0800
Received: from gitserver.wistron.com (10.37.38.233) by EXCHAPP01.whq.wistron
 (10.37.38.24) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Tue, 1 Sep 2020 14:18:57 +0800
From: Jet Li <Jet.Le@ibm.com>
To: <joel@jms.id.au>, <andrew@aj.id.au>, <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.8 v2] ARM: dts: aspeed: rainier: Add I2C buses for
 NVMe use
Date: Tue, 1 Sep 2020 14:17:31 +0800
Message-ID: <20200901061731.12694-1-Jet.Le@ibm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: ECB9F56885DE658C1C377987E6FC483D66357B97D69BEB10BD5CA8CC3E1DC31A2000:8
X-Mailman-Approved-At: Tue, 01 Sep 2020 16:41:55 +1000
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
Cc: Jet Li <Jet.Li@ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Jet Li <Jet.Li@ibm.com>

Adding pca9552 exposes the presence detect lines for the cards and
tca9554 exposes the presence details for the cards.

Signed-off-by: Jet Li <Jet.Li@ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 105 +++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index d20cdf3c..e803133 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -300,6 +300,21 @@
 		compatible = "atmel,24c64";
 		reg = <0x51>;
 	};
+
+	tca9554@40 {
+		compatible = "ti,tca9554";
+		reg = <0x40>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		smbus0 {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "smbus0";
+		};
+	};
+
 };
 
 &i2c1 {
@@ -614,6 +629,96 @@
 		compatible = "atmel,24c64";
 		reg = <0x51>;
 	};
+
+	pca1: pca9552@61 {
+		compatible = "nxp,pca9552";
+		reg = <0x61>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio@0 {
+			reg = <0>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@1 {
+			reg = <1>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@2 {
+			reg = <2>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@3 {
+			reg = <3>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@4 {
+			reg = <4>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@5 {
+			reg = <5>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@6 {
+			reg = <6>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@7 {
+			reg = <7>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@8 {
+			reg = <8>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@9 {
+			reg = <9>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@10 {
+			reg = <10>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@11 {
+			reg = <11>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@12 {
+			reg = <12>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@13 {
+			reg = <13>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@14 {
+			reg = <14>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@15 {
+			reg = <15>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+	};
+
 };
 
 &i2c9 {
-- 
2.7.4

