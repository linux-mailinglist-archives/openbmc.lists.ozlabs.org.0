Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD227A7268
	for <lists+openbmc@lfdr.de>; Wed, 20 Sep 2023 07:57:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=2BHdcFMe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rr7953J2qz3bT3
	for <lists+openbmc@lfdr.de>; Wed, 20 Sep 2023 15:57:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=2BHdcFMe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:704b::618; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20618.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rr7712M2Hz2ygX
	for <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2023 15:55:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=meRBZ3dKZ5wT90A65WizZCHKHY/9m0x4Za4SZTOlXUV1IGonU+LgqzXA2FKizJFh4fATAf2exzI/oF2FycJDPWv6cI6MdHttjO/OPFkfFzuisjtgz/lOq1Cgs2kAh1KPO5ii3mDnO3sdq9dwWcH3Kay7Qr7VwRgox7VY0bDGFXlRfL9YncUDWjg/GMmi5eranCH9aJ/Tb80XWFR58omWPRpqQ4w4SLSUFIPvGcPLjvn7WBpTHXbiVsJAXpgRZ3bIS33LuJ7OngipEYkXJkQiDGroX7RP8S300kwmOo1N+Cum2pfgBtWmTBWOgugY4dcm36ovissx3qpHE6mgtoxn9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WE/fOaj/x+ZHUTB3X5c918nR23QEjN2cDNBUBKdFliE=;
 b=JWbnsw9iuQ7lasr2iYsjfTl9YS7/l3//QozSQ1C8CdSXJmn49GFq6He/H3eHeB/IORjRvwcnogXwG28Qg+v8Ci5HBxr2tcP+gInRnohfg0hSGDNyIomCZ3ejeiba+4U3XG7yDLoygeKrnRDWjHcElA0BUFum/weLPvBYdg24nlJ2IjFpIkWXM0QUK80JhkFN4+tvCzofuH8ne4vduL282pcpXDvV2lydQJaHPEFESEArAcaFZi6jhZrHYMWVXenr7VxItIEaLCj5UeFjlUzPSLwuXf51wIbzNrNZwFXECoTELw/4mgWhfKWSBvSB+QJhojGPghWIjDm6NneRoS0AjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=jms.id.au smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WE/fOaj/x+ZHUTB3X5c918nR23QEjN2cDNBUBKdFliE=;
 b=2BHdcFMeVFQsRrSzLjOghSxCMYS8ksInawSPVFyM5XukL4mbp93lIGROnG10hKRsep2l4Nwypjb8CA+Nd8YLr94UlbTXxSx2ahlVGk4KtRK8/z9PYo5izdAEwTOO3M8cnvB9yBUaDf4NiOPwIiA4tphCTwM6rVQelzu+BGGgLF/nxmqrrKG4PK5CoiN2vr+/jFonsd2pIzXFkqAGGpwpzosALZ7idrBmyon+HMwOID0yoVL2A5qOQEwoFjBhbQvyfw6+Ror3xPLj4D15+XGMtDY8gqDlEDssPhYVkiEfQt9VkdanItN4GJSqBvscrLLZS/tjthTtbrXmmF3gRSu4bg==
Received: from PS2PR06CA0013.apcprd06.prod.outlook.com (2603:1096:300:56::25)
 by TYZPR04MB7302.apcprd04.prod.outlook.com (2603:1096:400:453::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Wed, 20 Sep
 2023 05:55:19 +0000
Received: from HK2PEPF00006FB1.apcprd02.prod.outlook.com
 (2603:1096:300:56:cafe::fb) by PS2PR06CA0013.outlook.office365.com
 (2603:1096:300:56::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.29 via Frontend
 Transport; Wed, 20 Sep 2023 05:55:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB1.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server id 15.20.6792.20 via Frontend Transport; Wed, 20 Sep 2023 05:55:19
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org,
	patrick@stwcx.xyz
Subject: [PATCH linux dev-6.1 v2 1/2] dt-bindings: hwmon: add INA233 binding documents
Date: Wed, 20 Sep 2023 13:55:13 +0800
Message-Id: <20230920055514.1668839-2-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230920055514.1668839-1-Delphine_CC_Chiu@wiwynn.com>
References: <20230920055514.1668839-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB1:EE_|TYZPR04MB7302:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: da96d946-3d62-460e-a0b9-08dbb99e2bdd
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	AZNu6vcunEUuJ88Lmj8SP5l+SJUqNsMYIxy0Bl2oErnmgzqgES3PSmPo1Bq1RC1aBhsnXehdskov4vbldLwECy8sERAl4zyBvmm6nwpvj8doggguQ3nXPpNQb5pkALoYG6XUAn8lP9OkVQheomxX+/nlGdt2IcYw9rkcD9c2g5/2zxVQoMeQDVD9O1HxBelM/f68eTAjCk6rAFwHHslFmwogVz8jS2IMf+F4QpNZJZANbdAOCrDMntXfTOIHeOx8gSHYa8DunSZNhG+bW3hJVjTa0U2myhrtQ7su1RqKJ+7gqy348YFqmt17+RhwaAX2NC451iZ7aovo5GdtfPlmuKwj8RVmGta9aDvKWfad/1b0vYOid8pClmV7N20THXNLGzVxC6Yu94l2sNP3lSF+V6OKIR5MXH2d1H8yGzHZy72W1wfEDySirduK9DLNlpXOuJlSi2pfxivtVdyDeuWisqtgBr1P2DcjDrQWqhEXJ5VFUG54+z0flr7WSBjZZHP+35sPQdt6BPQZaTTDX/GfzfPuZ3WGEPhd+0reuxpRwmri6LVpyTx7Cfc1fKzbBveICZA5dbmzIW/w5M4+eHEZtAj1rmV11co8HYhDiqg1kYV/P4rwHe3qdrjypXl3eCzBRRrbACjOgB9Lql0Mf+eGmzffvbj8VqhhMdA16fOea4ahxIj5dWb0QkNcsBF5yF5FLSZPyvAGTIwgcnM2Ke5nFg==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(376002)(346002)(396003)(39850400004)(136003)(451199024)(1800799009)(186009)(82310400011)(36840700001)(46966006)(316002)(36736006)(70586007)(70206006)(40480700001)(478600001)(6666004)(81166007)(2906002)(36756003)(86362001)(41300700001)(5660300002)(4326008)(8676002)(8936002)(9316004)(336012)(1076003)(26005)(107886003)(36860700001)(2616005)(956004)(47076005)(82740400003)(6506007)(6486002)(356005)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 05:55:19.4035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da96d946-3d62-460e-a0b9-08dbb99e2bdd
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB1.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB7302
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
Cc: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add INA233 binding documents for Yosemite V4 config.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
Changelog:
 v2 - Revise Makefile typo
 v1 - Add ina233 driver and binding document
---
 .../devicetree/bindings/hwmon/ina233.txt      | 27 +++++++++++++++++++
 MAINTAINERS                                   |  6 +++++
 2 files changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ina233.txt

diff --git a/Documentation/devicetree/bindings/hwmon/ina233.txt b/Documentation/devicetree/bindings/hwmon/ina233.txt
new file mode 100644
index 000000000000..a1067788ec0c
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ina233.txt
@@ -0,0 +1,27 @@
+Bindings for the Maxim MAX31790 Intelligent Fan Controller
+==========================================================
+
+Reference:
+
+https://pdf1.alldatasheet.com/datasheet-pdf/view/930928/TI1/INA233.html
+
+The INA233 device is a current, voltage and power monitor with an I2C-, SMBus-,and PMBus-compatible interface
+that is compliant with digital bus voltages from 1.8 V to 5.0 V.
+The device monitors and reports values for current, voltage and power.
+The integrated power accumulator can be used for energy or average power calculations.
+Programmable calibration value, conversion times and averaging when combined with an internal multiplier
+enable direct readouts of current in amperes and power in watts.
+
+Required properties:
+- compatible     	: ti,ina233
+- reg            	: I2C address
+- resistor-calibration  : MFR_CALIBRATION which will be set into register 0xd4
+- current-lsb    	: Current_LSB for calibration
+Example:
+
+        ina233@45 {
+                compatible = "ti,ina233";
+                reg = <0x45>;
+                resistor-calibration = /bits/ 16 <0x0a00>;
+                current-lsb= /bits/ 16 <0x0001>;
+        };
diff --git a/MAINTAINERS b/MAINTAINERS
index ccf8d060cd22..3fa307f1157d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10034,6 +10034,12 @@ F:	Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
 F:	Documentation/hwmon/ina209.rst
 F:	drivers/hwmon/ina209.c
 
+INA233 HARDWARE MONITOR DRIVER
+M:     Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
+S:     Odd Fixes
+F:     Documentation/devicetree/bindings/hwmon/ina233.txt
+F:     drivers/hwmon/ina233.c
+
 INA2XX HARDWARE MONITOR DRIVER
 M:	Guenter Roeck <linux@roeck-us.net>
 L:	linux-hwmon@vger.kernel.org
-- 
2.25.1

