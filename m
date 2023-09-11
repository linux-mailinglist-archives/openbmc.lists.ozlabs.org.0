Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B28979A106
	for <lists+openbmc@lfdr.de>; Mon, 11 Sep 2023 03:47:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=kHLeW1tC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RkV2j61QCz3bvY
	for <lists+openbmc@lfdr.de>; Mon, 11 Sep 2023 11:47:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=kHLeW1tC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::609; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20609.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RkV020ztTz2yPq
	for <openbmc@lists.ozlabs.org>; Mon, 11 Sep 2023 11:45:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLV6NQwQ/n9cKdaBBBEb6FDRqwvhgRwWM53WF2ab0LeXvdHS2gfAQHzYZE1a7X0hNd2X1r+ipcPFT45Rs3g1ZCMRWVAlAVbmgt/W5hJ1dtwcBTJR+Zk8GXfoEmmQ9CIQ9RLb/6FvKWjeSnm/lo6E1NeQcQyE7J/cMUW1ukQ4IsT1eEZ9cV4cmPezjP3iMWna6Gi4NBbQnVPsZAERsFOzqXHx2cVimt4xpUMezWWdcikpDVn5Jg82Q/QjWj3RyrYSdd06nLkq3TKQTdbxX7hCzgIF3pVG1kkYubFmlx129lTIxF7c+8rPdqRkcmQh8zjKo5SU/pVNVH3+Bg6wTU3/MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zIhFBBAEzYH5/9QKWua9/4N+LiGX0YtNFEK9QNnTHg=;
 b=c9fFMoHp014P2FPUM51ax4c3wIDA77PQSMsDikQVtrEk0OEHAAUUvgltIzDp6rCZQ87PL0U7Qcg2StII1TzT85A12f9AyaVG+uZVQKd6oruzOKfxLCcwdAAHqqlCiLkNPy608Nss3eImYRpJew/bhwwkIf+a4u1+522p9zAPGCcvwQ600Wn4nDaGi99VNQgjvksAOYW5o6cy4YF3jlLgcWOF4eLxgkKvAvW5TJlZNwb1cdiij920SX+CUALytC/YS0AAre1xb0jbK2hzTj+tVk6CQ/WuW/zy7ocFJg0f87CbR9vPt1i3pCSC/RsoIHEv9NAJJLUJ3cmn/bF69Lye6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zIhFBBAEzYH5/9QKWua9/4N+LiGX0YtNFEK9QNnTHg=;
 b=kHLeW1tC5jbbfvbg+6bE2EHJgvWqGUUM92W8gKvN3Go8wp2oVzPluR/LCf4hSbvQfmAqi2BiMNfpDmlOdGK9jFm9c1LkBTQzwh0bSV8W5vaq6u/HI7wr3GwNIS78RJZu7Jpb0e4fGdsxJ5wWdjtCwgnfLYfjqQnE6wjyrbJqiJGr/RETbzcCjYJCuwFOTpS58E74UVdALEllqhSJrg/L9ErZaEPmqcM2beerih3H2kfOQZhOyph3TL7keMvpBsqni/0Dq6U8vTyWVTen5ocLNlbfslw1zJ6fJN93wdvxmBk+LmQsBaS9VbUKbu8JV3WyeZZZ8fMZ3lxBeCDYdOIzaw==
Received: from SG2PR03CA0118.apcprd03.prod.outlook.com (2603:1096:4:91::22) by
 TY0PR04MB6328.apcprd04.prod.outlook.com (2603:1096:400:279::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.31; Mon, 11 Sep 2023 01:44:45 +0000
Received: from SG1PEPF000082E3.apcprd02.prod.outlook.com
 (2603:1096:4:91:cafe::1a) by SG2PR03CA0118.outlook.office365.com
 (2603:1096:4:91::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.16 via Frontend
 Transport; Mon, 11 Sep 2023 01:44:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E3.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server id 15.20.6792.16 via Frontend Transport; Mon, 11 Sep 2023
 01:44:44 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.1 v2 2/2] dt-bindings: hwmon: add MAX31790 and INA233 binding documents
Date: Mon, 11 Sep 2023 09:44:36 +0800
Message-Id: <20230911014436.2036176-3-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230911014436.2036176-1-Delphine_CC_Chiu@wiwynn.com>
References: <20230911014436.2036176-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E3:EE_|TY0PR04MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: 9096cf7c-b29b-4183-b51f-08dbb268acee
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	qUvGhzLcy5Ih0ZB6eXiI2q5Fu9M1n5KQwWK5z7IW3UycTsLh5IgJO54v0ViHVR+pB10ncFNqiZmMsOWeV4cR/s4jiT0JXgAwaMvXTjFk5FgK/Lo789lk+81g+RyOWKZ7QUl9r/fsYSpLq3N/hM5jSLeiMdXL/xvfeM5lruIM8YA17WL7CxOnsr9lk76J9ty0k9WsXpeSp9UYmOtwzgy14UQ6v33rO7Ggivi66teT7iM9buwQLperPKe3EdyUuoPkYrZTrkSURQsHm3NN62wD3BcQais0b0j91oqExpSSVWCTO+MEZaiHhj73lp/PRVPtxQnlPTll02IAVDNvDjCv2POEghgWZGsNbKdct1eKUxTlDD2rgkFBqkaahAE8mnDkh3H+IK2qMgYiWokI5BQ8UCm4t6pcspqUNStHIeKP7diOzpe3RBQLc9qzfaI57CGhOF8TEnWfM78lgTPoPDaZTfEB+RuSKz/kERIj2dJ1WEPFNGSwGstdVFRmGwg+s5/LRATJVPMg08pu2tDEJvz3ahFK9YEHq+iXkEuHwt1cv+MopfrN59vsTkgxgUAKNQzkOm/+3NkYZz/hzXCSBQ2fPI4I43dgjSRQT2qITEJzja2t1u6KU6VIT2QPr9HJqOLGjBptOYZF6O8mya+0LzKIqsbR5A7Rw5tNqM6A6CCv0ffBcUCeMy1MMWs7z0oHnAxwjHI2Fd2zH5EXm+OMYxr+KN+aQh/pzPQpq88nQ64KILSwdFNqKe9KdGS+tjWtPLjO
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(136003)(39850400004)(396003)(376002)(346002)(186009)(451199024)(1800799009)(82310400011)(36840700001)(46966006)(41300700001)(36736006)(316002)(1076003)(26005)(40480700001)(107886003)(336012)(8676002)(2906002)(8936002)(70206006)(4326008)(70586007)(5660300002)(478600001)(6666004)(6486002)(6506007)(6512007)(36756003)(36860700001)(47076005)(956004)(2616005)(9316004)(81166007)(86362001)(82740400003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 01:44:44.7912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9096cf7c-b29b-4183-b51f-08dbb268acee
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E3.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB6328
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

Add MAX31790 and INA233 binding documents for Yosemite V4 config.
The drivers' code change will be soonly contributed.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Changelog:
 v2 - Add binding documents for ina233 and max31790
---
 .../devicetree/bindings/hwmon/ina233.txt      | 27 +++++++++++++++++++
 .../devicetree/bindings/hwmon/max31790.txt    | 25 +++++++++++++++++
 MAINTAINERS                                   | 12 +++++++++
 3 files changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ina233.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/max31790.txt

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
diff --git a/Documentation/devicetree/bindings/hwmon/max31790.txt b/Documentation/devicetree/bindings/hwmon/max31790.txt
new file mode 100644
index 000000000000..e00060ddfe15
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/max31790.txt
@@ -0,0 +1,25 @@
+Bindings for the Maxim MAX31790 Intelligent Fan Controller
+==========================================================
+
+Reference:
+
+https://datasheets.maximintegrated.com/en/ds/MAX31790.pdf
+
+The MAX31790 controls the speeds of up to six fans
+using six independent PWM outputs. The desired fan
+speeds (or PWM duty cycles) are written through the I2C
+interface. The outputs drive “4-wire” fans directly, or can
+be used to modulate the fan’s power terminals using an
+external pass transistor
+
+Required properties:
+- compatible     : maxim,max31790
+- reg            : I2C address
+- pwm-as-tach    : config PWM outputs as tachometer inputs
+Example:
+
+        fans@52 {
+                compatible = "maxim,max31790";
+		reg = <0x20>;
+                pwm-as-tach = /bits/ 8 <4 5>;
+        };
diff --git a/MAINTAINERS b/MAINTAINERS
index ccf8d060cd22..6baad9c10669 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1362,6 +1362,12 @@ F:	Documentation/devicetree/bindings/hwmon/adi,max31760.yaml
 F:	Documentation/hwmon/max31760.rst
 F:	drivers/hwmon/max31760.c
 
+ANALOG DEVICES INC MAX31790 DRIVER
+M:	Delphine CC Chiu  <Delphine_CC_Chiu@wiwynn.com>
+S:	Odd Fixes
+F:	Documentation/devicetree/bindings/hwmon/max31790.txt
+F:	drivers/hwmon/max31790.c
+
 ANALOGBITS PLL LIBRARIES
 M:	Paul Walmsley <paul.walmsley@sifive.com>
 S:	Supported
@@ -10034,6 +10040,12 @@ F:	Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
 F:	Documentation/hwmon/ina209.rst
 F:	drivers/hwmon/ina209.c
 
+INA233 HARDWARE MONITOR DRIVER
+M:	Delphine CC Chiu  <Delphine_CC_Chiu@wiwynn.com>
+S:	Odd Fixes
+F:	Documentation/devicetree/bindings/hwmon/ina233.txt
+F:	drivers/hwmon/ina222.c
+
 INA2XX HARDWARE MONITOR DRIVER
 M:	Guenter Roeck <linux@roeck-us.net>
 L:	linux-hwmon@vger.kernel.org
-- 
2.25.1

