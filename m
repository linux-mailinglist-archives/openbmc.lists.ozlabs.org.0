Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B94327A933E
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 11:45:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=DvzMUi8j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrrB041hwz3cFw
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 19:45:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=DvzMUi8j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:704b::603; helo=outbound.mail.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from outbound.mail.protection.outlook.com (mail-tyzapc01on20603.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::603])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rrr7M0Y9Vz3cBh
	for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2023 19:43:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lAcciWUUQx3j8mwgZ7XemTtozHW/H4+iPlU0n0efIX72bed1V3h9wwtMtbWI5ojfHUjYKoF1PvqFGoOtJv+Zc2msCwP4cFoi7/Bu/Kq6domKHlKt7OMCyBc8tN/afA0KMO3DOuPfAGuSVuYI5JHMngW4FWKnvc5FO8RWKtItN2CfQbL12gVw7Hlx4qSc7zrm0tBCwvL7Q8hJInYAiukeoON9IKI0fpRXwnT1/mPlq4aeLXTqMSK5/clkDV3Vc19EOfpM7PZASfBC38QGHXdIqCLVOEmsbdfll3IxskDDg8Pw8JWftCGlR2pDU3kuDiY/SaVQge6Y5BbEMGJL/LQk+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKr/gj3HKkh5Qvw2vW5XoZG/OpOno7GrQNbKBxBxLkI=;
 b=NMVWP050hRLt87AuorSnCQEPR3MS5WwDGf6EWzwsrxHLBDEefhS3fC2xwSGuHRTwVx4grDNL6PeTSQ8RIKwGKGKHdG3qi1B5HnFoH1qZ9toHBbmWbDT6aj0H39ulCea/DLa22Ka57Yy/UmVkZfUIV9Fwl27h5lxnhfonnjqzLlj+t+kIQEDBj5AFu4ZAgmT06WcXUk6h9/jMzTc+Liz8X8J/+Xi4TWxsUeol7PCLTWRKTWJCnkxSeMJYDzRCLAAmajqh3g92HDMyPgp/jlRip1fObuU6JZ9syAMdxYftvGX+2R1zWuiiOQXifGDc8e3l/Kekge4aEzSCalpSRu8kCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKr/gj3HKkh5Qvw2vW5XoZG/OpOno7GrQNbKBxBxLkI=;
 b=DvzMUi8jpglPFmbGqJMaoiVVInuHwgxOKT6ZcBe36DQU8DUK+5d1nO/OfA4W6c2hEap7tDk4xS2kRGKVRWMw4VCdRYsFU4ZMX/XvFCCsX76Fio3O2kXVRR4fJ6S4Z13G+BF4f/NMxvu8JGcHfsdblBz8ywqn/WrflAeCw05b44UcHj6KQgVhKudVa2pUp70FZQdAMLqitwWEVYf9KhdTQatcc5bnCcQSB03Cjm87ruMncWQ7lz3xwOiXQyvaKk3d+QbLdhtOPiX4VCbY6knWo/E8u4Nl4ITXqG6lKpTq1gQaC/yDrNJqiWrK3CtZ2O8/QomO/cmOlDOliDP4cD3Wlw==
Received: from SI2P153CA0013.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::12) by
 KL1PR0401MB4290.apcprd04.prod.outlook.com (2603:1096:820:21::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Thu, 21 Sep
 2023 09:43:02 +0000
Received: from HK3PEPF0000021C.apcprd03.prod.outlook.com
 (2603:1096:4:140:cafe::15) by SI2P153CA0013.outlook.office365.com
 (2603:1096:4:140::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.13 via Frontend
 Transport; Thu, 21 Sep 2023 09:43:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021C.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server id 15.20.6792.19 via Frontend Transport; Thu, 21 Sep 2023 09:43:01
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.1 v1 2/2] dt-bindings: hwmon: add MAX31790
Date: Thu, 21 Sep 2023 17:42:53 +0800
Message-Id: <20230921094253.1309670-3-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230921094253.1309670-1-Delphine_CC_Chiu@wiwynn.com>
References: <20230921094253.1309670-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021C:EE_|KL1PR0401MB4290:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bb5d4c3-4eb9-4871-632f-08dbba8725bc
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	0HN6PjEcn6G0KC+9X33hrlwftGzJnK4z1BZwkMMb0sb61UX/PaEsHzZqchIDD/7WSVyNAsTzLC9423usQvBKl76RQguURmmauDbLDVz1vZt9qDgcmA8b35po8i8cZJ5OWFrT6zlWUvBCdfu+r/4BM4PdILNx2gs2a5aJLvVKSfaoo8yGuBqPAl+RynEF/MxYjHEcssK4+FAtOPdkzxsHqgvfmz4bw63sfg25PW4BLqW0HOgM/FUWKOaU5ovm+dQ9L2MRrIqf/gCyF0ZKGIcTke1K9VqPi5OIFX/QMLleu53rdpfgKxUAi/R66Cy0vfP9DgR6p7ULHuXDMuxCyLg/fJBh29kTYLH+EHtWMQmgZdIIzbnap7o1i4SGvU6j4/5ty5z2JnZt4VNCYqlp9OjqCUNdJENgi1auvnoL4Do48GA1zc+RsV6wkK7ECk4IhDQ9v7g14/QlNZ51r98lehw7MuV/cjmrj45Bae3vodTLsGyLb9s6bldrryJFoCGoCrlhZXG87jWxUQk+l4K2aEP5Ylu7fAz82lkY3bTJn07Oaxtm5xAvUg1GNNfayiddPPJOT/QUnc1Lgv1q4aY7k2zLGXzPSKdi5JYIApe214kqb1lqzBo1vBdUgmYuBe4jUXwRtf7O1pd5LfcyjeZn1kuxEA83WAzyGhuexhumgGEiDPlb2kcQ1FJfuZdhoEDI2HvC
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(376002)(39860400002)(346002)(136003)(396003)(186009)(451199024)(82310400011)(1800799009)(46966006)(36840700001)(2616005)(5660300002)(107886003)(26005)(1076003)(956004)(47076005)(336012)(2906002)(9316004)(356005)(36860700001)(81166007)(86362001)(82740400003)(36756003)(4326008)(40480700001)(41300700001)(8936002)(8676002)(478600001)(6486002)(6512007)(6506007)(6666004)(966005)(36736006)(316002)(70206006)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 09:43:01.8574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb5d4c3-4eb9-4871-632f-08dbba8725bc
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021C.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB4290
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
 .../bindings/hwmon/maxim,max31790.yaml        | 59 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
new file mode 100644
index 000000000000..2bd455b36b3f
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
@@ -0,0 +1,59 @@
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
+properties:
+  compatible:
+    enum:
+      - maxim,max31790
+
+  reg:
+    maxItems: 1
+
+  pwm-as-tach:
+    description: |
+      There are 6 PWM output channel in MAX31790 that allows to be configured
+      as a TACH input by setting the Fan Configuration register.
+      Config PWM output channels in the array as tachometer inputs.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 6
+    items:
+      enum: [1, 2, 3, 4, 5, 6]
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      pwm@20 {
+        compatible = "maxim,max31790";
+        reg = <0x20>;
+        pwm-as-tach = <2 5>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c772c88b6e05..88cc08a887ad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1362,6 +1362,12 @@ F:	Documentation/devicetree/bindings/hwmon/adi,max31760.yaml
 F:	Documentation/hwmon/max31760.rst
 F:	drivers/hwmon/max31760.c
 
+ANALOG DEVICES INC MAX31790 DRIVER
+M:	Delphine CC Chiu  <Delphine_CC_Chiu@wiwynn.com>
+S:	Odd Fixes
+F:	Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
+F:	drivers/hwmon/max31790.c
+
 ANALOGBITS PLL LIBRARIES
 M:	Paul Walmsley <paul.walmsley@sifive.com>
 S:	Supported
-- 
2.25.1

