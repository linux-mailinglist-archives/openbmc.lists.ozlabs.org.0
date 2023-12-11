Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A39380BFDF
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 04:27:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=JBW1j2Gv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpRyZ5spBz3dVj
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 14:27:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=JBW1j2Gv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::627; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20627.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::627])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpRg300BBz30PD
	for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2023 14:14:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lF+CAxKHTENHsR2DQ/jWhaBOz3+QnEauDM442tAprvfMDxehSkFC8Y2PqeWOtiNM5WfPQqNxYGlzH/ytaVBkunzkpU2Ebwz/BW9dA6uJ+wHbjQEFV1OiluDExbT8j640aKPwMHLR6YlL9VxcAmR4BNjszLYlnYDleRRBWlM5TcPS9avnUwprq2ArC2aMPbuCsBeww81mr0QbC4rC7BvKPzezfnZYr7zvdXm0urQ+6HztHQnAwkTvJVLDVHOjy29RAg3o2u0XLWyVqTibK52WcVmJXbxILZLShfiLGzBdm7NsfDCUykkFhywKusLPsE0vGYuKZY1q7frvcb+3hG7Otw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ngrZal1T5zKIoze4a9wDrSNcGDO8QNLgbJOqp4+OZ4=;
 b=CziYg+udoRFoNzSj5Ho4gLHMjKy3l87UlbyG08B76ACLqrGrl8YorWZGNwspVKUug4roa0DxB5fwwS+AzjmWdZdHl83gmYDNiYwwXGPy8Gee3sB3m+TgThPX3xJeyhLU20IXBt/L3leXh2QP3cGw3AOLgYXm/IMx+xm1TyroaSc+me+IEMao1YFb9Q3jj53aZ4JRkTEcAsJIPuPYH/gBUC4NTnfpBLFnEVLwbnddjv9QKKqhE1kgLBdJBQYyAShYZCcJcNjtS8u5qvArAyr7Vw7CF2CYrpU5TgFEBGFt8v5vckgvBaXMiD2qkxe9hT0e0zpbql9LkUOZ6D09fdxm6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ngrZal1T5zKIoze4a9wDrSNcGDO8QNLgbJOqp4+OZ4=;
 b=JBW1j2Gvamb6LQ43S5Ofu1ICijRz9w8+I8eSpFEMm3KMM3sNfwTwGqiTbtOgcMtF2PYc85CciEbMVD6VHGiyM9ihGykPWTYWfqxw66uwfegTNzeYVPJLFj/qDfHCdjpKlL0QjG7UFl0s58y6JrLFtv1cgAL4TC2sdMyD/JmHtO9NqiOwX4lHB7IDnUlQAPD/3NEuHfrZj7prohjA5Ux3eliCaSl2g+5eXms2WtxstgIYaGuFi0e+7iabCc2bFmHApqUDUPxiG5Jv7L+dYk4zFduByi2I4Zq4kD5aQFIsWkItw8Qhmds08J/A89nfYlhidkwSVfFVEGDLpXfpC0JfbA==
Received: from SG2P153CA0036.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::23) by
 TYZPR04MB5973.apcprd04.prod.outlook.com (2603:1096:400:202::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 03:14:02 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:c7:cafe::28) by SG2P153CA0036.outlook.office365.com
 (2603:1096:4:c7::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.3 via Frontend
 Transport; Mon, 11 Dec 2023 03:14:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 03:14:01 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 v1 13/14] ARM: dts: aspeed: yosemite4: support mux to cpld
Date: Mon, 11 Dec 2023 11:13:36 +0800
Message-Id: <20231211031337.4165619-14-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211031337.4165619-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211031337.4165619-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|TYZPR04MB5973:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 34bdea45-e7e1-47a8-447b-08dbf9f73994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	mJylk7kFgRo6h2bd7+5nMA98ZxfVg9zHvu3DeiWJxp6p3xSPmg82qkoWnw/cmQll7Gs3WWPQgrm+ZphA+YC7HZD0itGFBaqNLeBek1sPKYtFP+IycgOZZ9C7JVoF568KXrkZarftVOnMCLoD9mY8ySIDogzZxMZkfI6F6g1wnS2PJVeMKCcDHSMKqGE+F16zffSzIJKnndHo8zY590AfS7XBT4CBmNaztFHdMh/ldq0piL7J12QWDD9GHVp+SjP0tbTdb4Zq0EDikFHnEjHcFHBEnNFxZm4+qxw6WRQ8pN9jy/u6g0b8WqEUhz0utZw+rLbg+iBSXs+tKmQiE5qtycmnttmjii4tqlazTbvJtPGEOkj2vnmYSg9wHa0AHs/oVKCVXHszzrAC+pP6RMGTl3/Om/4q+I4ogbgL1XW0rKWUpPPnVitd/QDQI+dXOFNBPIO7yjY6Bn13l/2J0P4Tx3McX8zASRGKD7eTwz4FHl3kKCI/QkgyuHgLlMP6t4xD2CxwFprxOjGqE52j0jI3I+UJFaQzmOVaOcNeYXhf5J0Rk/83SVKz3qD5K8w1os4SJlsdA5hBPtiHusUCB/SL3G11CahVtn/7m6sh/bd7A3XmZydsDDNcCQh9f5PoXOgs/Qjlj3q+D3TE4K1K5j/2BhO0HwkvnAvQIAoC4usZgFmVpTRuaYkFZf0G/xLlBbCMGhZq8iHXqucAYJvVJDl/2A==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39850400004)(136003)(396003)(376002)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(82310400011)(36840700001)(46966006)(40480700001)(1076003)(336012)(26005)(956004)(107886003)(2616005)(82740400003)(81166007)(86362001)(356005)(36756003)(47076005)(83380400001)(5660300002)(6666004)(6506007)(6512007)(36860700001)(70586007)(70206006)(316002)(6486002)(8936002)(8676002)(36736006)(2906002)(41300700001)(9316004)(4326008)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 03:14:01.8344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34bdea45-e7e1-47a8-447b-08dbf9f73994
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB5973
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

Mux pca9544 to cpld was added on EVT HW schematic design,
so add dts setting for devices behind mux pca9544 to cpld

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 64 ++++++++++++++-----
 1 file changed, 49 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index c8e3a85b7a11..fdc33bffd467 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -36,6 +36,10 @@ aliases {
 		i2c31 = &imux31;
 		i2c32 = &imux32;
 		i2c33 = &imux33;
+		i2c34 = &imux34;
+		i2c35 = &imux35;
+		i2c36 = &imux36;
+		i2c37 = &imux37;
 	};
 
 	chosen {
@@ -951,24 +955,54 @@ &i2c12 {
 	status = "okay";
 	bus-frequency = <400000>;
 
-	temperature-sensor@48 {
-		compatible = "ti,tmp75";
-		reg = <0x48>;
-	};
+	i2c-mux@70 {
+		compatible = "nxp,pca9544";
+		i2c-mux-idle-disconnect;
+		reg = <0x70>;
 
-	eeprom@50 {
-		compatible = "atmel,24c128";
-		reg = <0x50>;
-	};
+		imux34: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
 
-	eeprom@54 {
-		compatible = "atmel,24c64";
-		reg = <0x54>;
-	};
+			temperature-sensor@48 {
+				compatible = "ti,tmp75";
+				reg = <0x48>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
 
-	rtc@6f {
-		compatible = "nuvoton,nct3018y";
-		reg = <0x6f>;
+			eeprom@54 {
+				compatible = "atmel,24c64";
+				reg = <0x54>;
+			};
+
+			rtc@6f {
+				compatible = "nuvoton,nct3018y";
+				reg = <0x6f>;
+			};
+		};
+
+		imux35: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		imux36: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		imux37: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
 	};
 };
 
-- 
2.25.1

