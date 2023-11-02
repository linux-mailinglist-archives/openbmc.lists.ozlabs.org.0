Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F267DEB83
	for <lists+openbmc@lfdr.de>; Thu,  2 Nov 2023 04:40:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=DPbRSFgV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLV4d5BYkz3cRH
	for <lists+openbmc@lfdr.de>; Thu,  2 Nov 2023 14:40:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=DPbRSFgV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::60f; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2060f.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::60f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLV4058tZz3c5k
	for <openbmc@lists.ozlabs.org>; Thu,  2 Nov 2023 14:39:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBhh7OHz24rZohpSSyJywWZVoJ1Tz4BPs3kWWZzprlFqWInzTGEmwRwLa+XWQu4s/BNajlf7nrsqpHJVpev05mueU+ZMBiu7ek1t/MF4tfUXaiL4NQWBkqduCV9NWe+GmrE8prJtzhE4iAOGAJr7FOVqGyreGaEbsWY+sMIcFfxfWY9qIz4FbkSYZyGKPbaJgb5+l8hGKUicCaYSHE4muVbY2hDA2LXoz7RdRRU6jtabivu62+JrLY1hJT3TSyLCuNYusRQ5Oxj0Xet+HvYGKhrOd1+FupbR2D7dUMRNLoGGQOB2WY6B0Zv4dLgxOy/MgtX9Z2TOz9YTLsd6VSQ5WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3+nhEz0BGiSo+PrI5whvo96dvD84gF4JIDuBmsQrVU=;
 b=YajCY6hVUkRb333DABeFGsLa6XfphM3T3VJyLMMttqZOl8mT9y/23sS28uJMHgXeKfjl00OLDUBj3tdbrg9s3R8s2sSnDGinNb1DSV+bljrgilWcskuaQTvPipXVz7UAOfieHhOsWLQ1G6R2GkQla192aFn9F13KJE1j6vjBRICHjHSSSosTMruj1UeuY7j+NJkYkyyMh3N7MMFmNnHKos2FYQqHlQtWXQIGYQ6gPsjzjme9hVsvpWJI5G4TnhTfB8JFTwt/Iw7F54To/5+I+VETnmQUwJf1oS6x4SJL41qg1tdTA/ZpTzeLwGV2qYOAXqm/4uD75pJBnb2wgtKJxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3+nhEz0BGiSo+PrI5whvo96dvD84gF4JIDuBmsQrVU=;
 b=DPbRSFgVLywu1p0hxUwxkye6CqIxo7ir79LKDujcgItpSLKkJCp1ygLFFWa4TjsXJcRV9UDR4aRQl84v7ZMF8geyob5dSjU8VVqLVF2yi49S2akAfdYBzqOC2ow3w/cZVGKljmF95pbFGkyfToqguoMrARwrHOk8ZfwYEQoe52e1jAoehZIA1iRHzgF/wvZjBqflK5sZLnB1tx/4oOrHaDb5Aacp5aCPAVjq/B+RgVs/Y7q9dElu7yiSjwux7VxmufLtjpMKU3zoXSzDNq8Z36HVPwJq0psjttKUiSYZgKv+84L3Tmp0Prv9Teo7Ta567bWaLjECJCMSQErK2kYrmw==
Received: from PS2PR01CA0070.apcprd01.prod.exchangelabs.com
 (2603:1096:300:57::34) by SI2PR04MB6098.apcprd04.prod.outlook.com
 (2603:1096:4:1f9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Thu, 2 Nov
 2023 03:39:09 +0000
Received: from HK2PEPF00006FB1.apcprd02.prod.outlook.com
 (2603:1096:300:57:cafe::8a) by PS2PR01CA0070.outlook.office365.com
 (2603:1096:300:57::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Thu, 2 Nov 2023 03:39:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB1.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server id 15.20.6838.22 via Frontend Transport; Thu, 2 Nov 2023 03:39:08
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.5 v4 2/3] dt-bindings: hwmon: add MAX31790
Date: Thu,  2 Nov 2023 11:39:01 +0800
Message-Id: <20231102033902.3884466-3-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231102033902.3884466-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231102033902.3884466-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB1:EE_|SI2PR04MB6098:EE_
X-MS-Office365-Filtering-Correlation-Id: ed8aa1cd-7075-473f-795a-08dbdb554538
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	3QoENkzXl6397Zghk9BtmBUtENOu8uMNpQnISmW24sfNXr2yLNYvQauQ1eos8cKqqAlo/sPqkrGfBR0m8YZ4BAT4LUInNNqlvK1tLseNnv9MnI/f0Oxa4JcKmOGIV+E+/1ZjO1RkTN3KShTOoxAh5CvI4JBki7HAiVtkM1NZ2gUIfEPEQxmPhSwMJYyQWkC8sJpwg+afw5C2ORnXGmlNHjXFwSApZlPk/lnsX/hjvuYYKW5tQ4RILnC7vJeDeY7zT6NO0JmSrwiWETmkyGvVy00YLu1K/nclVaf9NQ3IHL/bcLL32bv9ziwpiVNOJPtPj/QNiwZ/xyaAFBOkq4XJy+7s9+ci4gcu/G8zdLvyxo89ysj1/7rJoN7sU5JQV464keI59O0b8EaUABr6seKZS/HIeIxyg4zwpJ5QJP1cOiMxnkzkKl/OIm7bwMuS0fgKG/qOKPC9ufgeQGsA214fcbibtl05r3Ei2YjtMHt1mEIULU8Lv6qGYULoc5Aj+B+V2PsEHzxC6BYVBDe+PX6fjEbuY0idOV+O4LpaBrC9oiA5SE4/cQgQcxeRQo7z1d1O7LyR21FPUEod8rAExfGUplP7eLDVeZY0knYEtFtcgLjRcAkZdBHgazsUUMNjvje2ir6fMTaT4CvKbG9CERZPV2MOayvFxE9qJ9ei115B0MuPUjSVOld62Yqd8tVVj2jLqKXQCZ0mfwKCAyBl60jn1EF9fH2GlR2gZNG+PVVwWt8=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(346002)(396003)(376002)(39860400002)(136003)(230273577357003)(230173577357003)(82310400011)(1800799009)(451199024)(64100799003)(186009)(36840700001)(46966006)(5660300002)(8676002)(8936002)(4326008)(107886003)(36736006)(70586007)(70206006)(41300700001)(316002)(966005)(6486002)(478600001)(2906002)(6666004)(40480700001)(6506007)(36860700001)(2616005)(47076005)(356005)(81166007)(36756003)(956004)(1076003)(6512007)(82740400003)(336012)(9316004)(26005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 03:39:08.1995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed8aa1cd-7075-473f-795a-08dbdb554538
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB1.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB6098
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

Add dt-bindings for the MAXIM MAX31790.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
Changelog:
v4 - No change.
v3 - Use 'sensor-type' in 'channel' node to config pwm as tach.
   - Changed the status in MAINTAINERS to 'Maintained'.
v2 - Add dt-bindings for the MAXIM MAX31790.
---
 .../bindings/hwmon/maxim,max31790.yaml        | 89 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
new file mode 100644
index 000000000000..7f717ab4caac
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/maxim,max31790.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim max31790
+
+maintainers:
+  - Delphine CC Chiu  <Delphine_CC_Chiu@wiwynn.com>
+
+description: |
+  The MAX31790 controls the speeds of up to six fans using
+  six independent PWM outputs. The desired fan speeds (or PWM duty cycles)
+  are written through the I2C	interface.
+  The outputs drive “4-wire” fans directly, or can be used to modulate
+  the fan’s power terminals using an external pass transistor.
+
+  Datasheets:
+    https://datasheets.maximintegrated.com/en/ds/MAX31790.pdf
+
+additionalProperties: false
+
+properties:
+  compatible:
+    enum:
+      - maxim,max31790
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^channel@[1-6]$":
+    type: object
+
+    additionalProperties: false
+
+    properties:
+      reg:
+        items:
+          - enum: [1, 2, 3, 4, 5, 6]
+
+      # There are 6 PWM output channel in MAX31790 that allows to be configured
+      # as a TACH input by setting the Fan Configuration register.
+      # The default setting will be PWM output.
+      sensor-type:
+        items:
+          - enum:
+            - PWM
+            - TACH
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pwm@20 {
+            compatible = "maxim,max31790";
+            reg = <0x20>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            channel@3 {
+                reg = <3>;
+                sensor-type = "TACH";
+            };
+
+            channel@6 {
+                reg = <6>;
+                sensor-type = "TACH";
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index f9cc9f25799f..b0c86d70b034 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1360,6 +1360,12 @@ F:	Documentation/devicetree/bindings/hwmon/adi,max31760.yaml
 F:	Documentation/hwmon/max31760.rst
 F:	drivers/hwmon/max31760.c
 
+ANALOG DEVICES INC MAX31790 DRIVER
+M:	Delphine CC Chiu  <Delphine_CC_Chiu@wiwynn.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
+F:	drivers/hwmon/max31790.c
+
 ANALOGBITS PLL LIBRARIES
 M:	Paul Walmsley <paul.walmsley@sifive.com>
 S:	Supported
-- 
2.25.1

