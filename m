Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AC27E51D6
	for <lists+openbmc@lfdr.de>; Wed,  8 Nov 2023 09:21:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=0xc5RKiI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQJ2X4hBmz3cF4
	for <lists+openbmc@lfdr.de>; Wed,  8 Nov 2023 19:21:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=0xc5RKiI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::629; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQJ1t4m6Rz2xFl
	for <openbmc@lists.ozlabs.org>; Wed,  8 Nov 2023 19:20:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqURpw+l+OvxvmOfpfkodRW2HVHO6XRTg4Cg4Kq2IBdegfmlDm/g9l+tu0TK1tp8lDGPUTDBomO0L8dFkWwf5lLp541eD3Kvh4MNuPI2BVc3YH6i0dmlLW9MyYXf/Zfg3lWT0jpWH3Z6JmDOFCH/iykHVlI/pi33M3gkSPJW7W6uDmf1Scw9+NdCK8JYXJvNgF0DIEb/pig/TKHM9zeTTpoTGozI6Frd8rGbQN5vkHhF+N7hIrNtJs/xmUpU8Q5I4AIwi0g9wuPr5ckl2R2sUs2cAlyHuiDo/GmlScmX68ON5tjOtpOkGMhRj7j4Gn6Fnigts9iv/DHIWnUedIG/bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PuPjiPCA9sFK1LuvVxaj+dVrTU1x/FJgsuJkCW5VPtg=;
 b=hBQ/Nsepha4YWy/gVzRU2Kc8OB2i70pPgbyIs9BSiSr3m7u9z17vLt0nN/DGohPlt4AVVscv/QWTwzUX0JNju+n8EWl7iAtXPIFHzA59Xhsi/ot//45IPXqiFnIY9fjlBNRKHqla5ksFqOYrkk0oRJw859iTWVefgcNh6E5z5/+lpr6EB8rxjdRKOvDwvuNaz1qijsQK8Iyb/8uacJmvZiqAGqAFToPJOnagj7TsRWy9WEF/gtO2Vo7ETJ5qLyAllex4dT38JfW8baUyl7qRuDoIoj0NzLOZfj+dCiHRdfrkxBTsT9PmE//eqj8X5hmzy8HupqXk0+c02pWR+axFlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PuPjiPCA9sFK1LuvVxaj+dVrTU1x/FJgsuJkCW5VPtg=;
 b=0xc5RKiIC+pScMx7dUwoHSpr6ITEn16v/bm9V/coUFaHuQpdRssJl6eAVLmGiw6fDSlmKIFO9gkJzDAun0W6LvrWvzl6q4Vx257pX2Y0RjS48RZAyxNM0B28O04BPg9MMeIlHMfd2BeF1vFBRdwn0vjWh8pK7TpxrnZV6WhYlvIbJ8J91xSBEoARYKjSKnPk8gUMvzVVbOk4owLmck2yLhV5qIt1dtdCIIwnxsFiqT83+Zc7MVuhXmk/yW0ATnSzhs+wTASMRdl2+cl0q6UPfItK2MrVNpXS5IrTUB7JUzreoNf9g1hipN5rrgMF+jZXtz6g1fEf6MMWejsUj3brxg==
Received: from SGAP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::18) by
 SEYPR04MB6703.apcprd04.prod.outlook.com (2603:1096:101:df::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.29; Wed, 8 Nov 2023 08:20:27 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:b6:cafe::e) by SGAP274CA0006.outlook.office365.com
 (2603:1096:4:b6::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Wed, 8 Nov 2023 08:20:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server id 15.20.6977.16 via Frontend Transport; Wed, 8 Nov 2023 08:20:26
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.5 v4 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver bindings
Date: Wed,  8 Nov 2023 16:20:18 +0800
Message-Id: <20231108082019.1601366-2-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231108082019.1601366-1-Delphine_CC_Chiu@Wiwynn.com>
References: <20231108082019.1601366-1-Delphine_CC_Chiu@Wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|SEYPR04MB6703:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f89800ef-4e95-4375-0072-08dbe0339024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	GdwmxFTxjUzzP3QBWXRKOuaGed0Ld5/FtizYGoxd7OBhL1egFvqHDc2lGA7wRRkpa0hQSqXVqnkE3E5RpNDrD0rK+n5bcbed7aQTWMTHpsWhvChi47IHL8cBRep24hMlx+C5keSFYbOX2PP0PhnYgZVhLdWlM8lkrkZqS3nyqPbEXlKFw6sWTBrLzdouCboLXyuD4QZul1Ge+20E3lThWnsTk4PI4GvZ2tflemIdanymbWTfzx3fuF9Ptze9POiDlMhYWL85u5m9YDeEeD4C7mwQFoO3/XVV9USNYBOIecj0lBRllGs7eqcH6vKWKEcuX3Jyl3v0TWBMnjGe8bRtTgccTxxzMoFD6JajTe9meat8drpJm16FzeIA5woE+793nqhlysFFN9uHRn1je/1nOW73Gz0zeR50sf1Kue5Tbh1QCgMqrWWzw/ihWr6Hf0cN0+HMwlgWExEbQE4VrHdNCJHw4bN5Vp4yuS3fIs7ggd2K+zFZotrYMn2OOfC0tIua/ID1tIMnuEi24w9yWRrLccgAgMXVroW8c1xBfyMgXspvvQlIuke/qm6QQGeXOhgUA1XeYFLQsawvYq79UH+/T+T9BSFdEjCYii835rgFHPQa7QcMNQ5hVCPBzIP84uTuiOPTcGv3TENi0JeeXVyktu/w6tcVXtVB70/2Q4tPyAKqYajpYEXIUOyx9xLMeyePt78OauS6HdBpiExODLMAmQf5+PGqqcLTI0Jpn99p0lE=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(82310400011)(36840700001)(46966006)(82740400003)(26005)(1076003)(956004)(107886003)(70206006)(70586007)(2616005)(478600001)(6506007)(6666004)(336012)(966005)(9316004)(6486002)(6512007)(36756003)(40480700001)(4326008)(8676002)(41300700001)(8936002)(5660300002)(2906002)(36860700001)(81166007)(47076005)(86362001)(316002)(36736006)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 08:20:26.6477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f89800ef-4e95-4375-0072-08dbe0339024
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB6703
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
Cc: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a device tree bindings for ltc4286 device.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>

Changelog:
  v4 - Revise some inappropriate writing in yaml file
  v3 - Revise adi,vrange-select-25p6 to adi,vrange-low-enable
  v2 - Revise vrange_select_25p6 to adi,vrange-select-25p6
     - Add type for adi,vrange-select-25p6
     - Revise rsense-micro-ohms to shunt-resistor-micro-ohms
---
 .../bindings/hwmon/lltc,ltc4286.yaml          | 51 +++++++++++++++++++
 MAINTAINERS                                   | 10 ++++
 2 files changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
new file mode 100644
index 000000000000..d26f34fb7ea7
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/lltc,ltc4286.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LTC4286 power monitors
+
+maintainers:
+  - Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
+
+properties:
+  compatible:
+    enum:
+      - lltc,ltc4286
+      - lltc,ltc4287
+
+  reg:
+    maxItems: 1
+
+  adi,vrange-low-enable:
+    description:
+      This property is a bool parameter to represent the
+      voltage range is 25.6 volts or 102.4 volts for this chip.
+      The default is 102.4 volts.
+    type: boolean
+
+  shunt-resistor-micro-ohms:
+    description:
+      Resistor value micro-ohms.
+
+required:
+  - compatible
+  - reg
+  - shunt-resistor-micro-ohms
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        power-monitor@40 {
+            compatible = "lltc,ltc4286";
+            reg = <0x40>;
+            adi,vrange-low-enable;
+            shunt-resistor-micro-ohms = <300>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index d9ba580fd4ba..e46a6e43ff64 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12363,6 +12363,16 @@ S:	Maintained
 F:	Documentation/hwmon/ltc4261.rst
 F:	drivers/hwmon/ltc4261.c
 
+LTC4286 HARDWARE MONITOR DRIVER
+M:	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
+L:	linux-i2c@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
+F:	Documentation/devicetree/bindings/hwmon/ltc4286.rst
+F:	drivers/hwmon/pmbus/Kconfig
+F:	drivers/hwmon/pmbus/Makefile
+F:	drivers/hwmon/pmbus/ltc4286.c
+
 LTC4306 I2C MULTIPLEXER DRIVER
 M:	Michael Hennerich <michael.hennerich@analog.com>
 L:	linux-i2c@vger.kernel.org
-- 
2.25.1

