Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB34F228C24
	for <lists+openbmc@lfdr.de>; Wed, 22 Jul 2020 00:44:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBDDp704szDqcg
	for <lists+openbmc@lfdr.de>; Wed, 22 Jul 2020 08:44:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=ibm.com (client-ip=103.200.3.19; helo=segapp01.wistron.com;
 envelope-from=jet.le@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=ibm.com
Received: from segapp01.wistron.com (segapp02.wistron.com [103.200.3.19])
 by lists.ozlabs.org (Postfix) with ESMTP id 4B9xxL61QMzDqlp
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jul 2020 22:00:18 +1000 (AEST)
Received: from EXCHAPP02.whq.wistron (unverified [10.37.38.25]) by
 TWNHUMSW5.wistron.com (Clearswift SMTPRS 5.6.0) with ESMTP id
 <Te07f5f0bc9c0a81673230@TWNHUMSW5.wistron.com>; 
 Tue, 21 Jul 2020 20:00:09 +0800
Received: from EXCHAPP01.whq.wistron (10.37.38.24) by EXCHAPP02.whq.wistron
 (10.37.38.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 21 Jul
 2020 20:00:08 +0800
Received: from gitserver.wistron.com (10.37.38.233) by EXCHAPP01.whq.wistron
 (10.37.38.24) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Tue, 21 Jul 2020 20:00:08 +0800
From: Jet Li <Jet.Le@ibm.com>
To: <joel@jms.id.au>, <andrew@aj.id.au>, <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.7 v1] ARM: dts: aspeed: rainier: Add I2c buses for
 nvme use
Date: Tue, 21 Jul 2020 19:59:42 +0800
Message-ID: <20200721115942.27009-1-Jet.Le@ibm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 48EA9C111AB47F72EA8541FD11E31684D4AF8EC1B29937FCD1016EFD7FDB1A1B2000:8
X-Mailman-Approved-At: Wed, 22 Jul 2020 08:44:03 +1000
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

Adding pca9552 exposes the presence detect lines for the cards
and tca9554 exposes the presence details for the cards.

Signed-off-by: Jet Li <Jet.Li@ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 105 +++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 1ae119a..76a7e82 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -248,6 +248,21 @@
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
@@ -562,6 +577,96 @@
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
1.8.3.1

