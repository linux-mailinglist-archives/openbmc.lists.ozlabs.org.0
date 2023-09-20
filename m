Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFBE7A7239
	for <lists+openbmc@lfdr.de>; Wed, 20 Sep 2023 07:41:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=gfszFkDs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rr6pW44cZz3byh
	for <lists+openbmc@lfdr.de>; Wed, 20 Sep 2023 15:41:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=gfszFkDs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::601; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rr6my1K5Yz3byH
	for <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2023 15:40:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7Yq0nFVRkQ0EylBFzKXN1Jn3hq9/eNagRSn6GqTqZhCuCH3lN94g5HSF5ZLchDYnFLEYhr51E7z0Tp6VqO1s2WtALKH7JjQdK+n0x9OK98KZZentV1yRGBa3oPWP002gOBJnb/dl05iAusJeRq0My+PjdMj6ofw7Iw38q8LkunKbntRsj7S3M2N2qFUq4IlzFSwwGZG+edFsSqI7fAjxjiAPT2hw7TsLPFhiFRpdHwJ5E7HUkR2wGKhDWSTznAFWG9woytcNzcM29AUeTgouUdGnux/kgdaNJLJDCIET3pEO7tnpgVJ1PMWQXgQbeMxQS/p+QgT7iPYsYI7d4Pdng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3oO7r7WsUJ/OE0wADxn96ECPTsxTj6DWjDbQqHW9N14=;
 b=jZFiXCQGe8ZOokeivyGuUHCLSI5UrG1UlWnhyC4vQxAxYVqwDyYIyWGFdJFGWZu2FsSw/2FG1XJ6iBXDebXRYYz/All7fh5C2vpIN6rvvatIVdOtyq8Ab1aKmbeNGkhCrZ5DX8mG72tdhBu+4zVR+iI3kPFJyO0kgLRhtH8MNo8JWt4mHYyc4tyPTsGqFvsT8xPDzqglDMPVe+HU/e+0kZ0X5He4gX1jWlINgVYJwnoV9Yxm81EAvFf0Dc3jrqiU3Tzn6upJdYvSEH9uZTA0p9hLcMgB7lf1nJWZ/VfqeAjDVlDeAOP6MO6cFEQl+5INTikBiMsUnfDYBr+nrAwVRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=jms.id.au smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3oO7r7WsUJ/OE0wADxn96ECPTsxTj6DWjDbQqHW9N14=;
 b=gfszFkDsN91GmG/QRn29Amp7p1LGRQWhMbN55CGSBp2r0DPuLHAOFqbOq073667SFP2yBUSAGdU2224agXB9G5kSLvCncohvHSQE8xb2WbyumkA52jee7H09n12v3oVwMqhmXNWZHIxU7OjNKeiusSTmd8n50pqVLIjwOfI5xzfbrrRRL2eCKsSujAHExCIktkpE4HzOJ32tAk4Imf2KvuYf92rL5mU0/5HUg/twSTLhrSQiKSi4Zdkx1AhG8nEbp0idDX9SKOww635wSjpdLV3uLSj3a3E8GSgVO7gVnKsDoNvLfWvbXoAD/SaxQEryJyFnUhKM5THwzueebSWk5w==
Received: from KL1PR0401CA0024.apcprd04.prod.outlook.com (2603:1096:820:e::11)
 by TYZPR04MB5760.apcprd04.prod.outlook.com (2603:1096:400:1fd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Wed, 20 Sep
 2023 05:39:40 +0000
Received: from HK3PEPF0000021F.apcprd03.prod.outlook.com
 (2603:1096:820:e:cafe::25) by KL1PR0401CA0024.outlook.office365.com
 (2603:1096:820:e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.29 via Frontend
 Transport; Wed, 20 Sep 2023 05:39:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021F.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server id 15.20.6792.20 via Frontend Transport; Wed, 20 Sep 2023 05:39:40
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org,
	patrick@stwcx.xyz
Subject: [PATCH linux dev-6.1 v1 1/2] dt-bindings: hwmon: add INA233 binding documents
Date: Wed, 20 Sep 2023 13:39:31 +0800
Message-Id: <20230920053932.1556545-2-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230920053932.1556545-1-Delphine_CC_Chiu@wiwynn.com>
References: <20230920053932.1556545-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021F:EE_|TYZPR04MB5760:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: df63f9a8-89c8-45cc-5b10-08dbb99bfc28
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	tQsvvljmC+JOPoxKVuHSBG1/WOaiSs37pjKHwvJwBQYaFyzUn0cF8DlxY40aCEghjBKZN1hx3BAuIF5AvmVymmvCEmsE4wjoiSGbAj3/E5hMo18KhnFoRyWwTt9hNnKZ0Sk9RCqJUmLAE5sOkOqf1yvDTQg1b4PzNxNbAeTY5JhivX7Rsj3bRzytvsTtv0ePlL344ICQDEs5iA2BG+W/2rQo1cu77mmhFyHsGpPVRtEbmPIb5f0KrplWCenOlKlHpi+XawjGW/RwhzUQ25uNH7swFFIQWUbDyun1ZEBaYWUCR/ZoIW+XvNDAnDoYCj3a1CMS4xQSSJLuBIoJsozIkj+qe6LEw7BN7nL4L/WWBp0BtBzUHZLwlNu3LM55A+ONOItGl5xyjWPgpWdb/E0TneNPzcoJYap0NaGcQ3jdcVN3lJ/+JTN7ZmWCuiooSsWRAz0HROhb7SNQeuOqtf8tAdySr/JzJQB5Q9z8TPwK3yzFADujqt418chvM98rV+tsW6+EVSFoBeo3vspNzPfuYrCfmo0oBcFVvyu68wjopQ6bG84dzzt5ac1KL0HIF+9gUDnzXdtMcgqi+5RJl2HAw+LtQgQ/eK9J1CqT4TWdaBTfTmeG9+IgNj8sa8kZiSsoQnAViLfYy/RI0iraTUTjMEGsftxShvj/tyFxpeS0JqvyqECnYClc9zfmJhD5dbcNGw9ViAMAQaJzLanuN/+1QA==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(39850400004)(136003)(376002)(346002)(82310400011)(1800799009)(186009)(451199024)(36840700001)(46966006)(478600001)(6666004)(6512007)(6506007)(6486002)(8936002)(8676002)(70586007)(70206006)(316002)(36736006)(5660300002)(107886003)(2616005)(36860700001)(36756003)(82740400003)(86362001)(40480700001)(4326008)(26005)(336012)(47076005)(2906002)(956004)(1076003)(41300700001)(9316004)(81166007)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 05:39:40.3692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df63f9a8-89c8-45cc-5b10-08dbb99bfc28
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021F.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB5760
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

