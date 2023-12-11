Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B47C80BFDE
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 04:27:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=s3E/GL20;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpRxb0ZNBz3cWm
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 14:26:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=s3E/GL20;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::626; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20626.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::626])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpRg26tQ4z30ht
	for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2023 14:14:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PP2QEQIYbwI3qdYeXluYwqIJ9MDmAwJo/UwNrjALx0jWKLCdVY6n6aCyPGCOylNLQ3i2eqGvUuTEWPn0Sofru3U8vxmCUOh3wrKp1eF9yF7S2hID5VG2tHRQlW8txlLs4KEDspc5RXT2hek7V+kDop886t9a01B020n7vXMRO32ICkzoZWwyhl7jDvDGNtjUMyuQaNdDsJ5IMk20xX+T9JsuONRuCLL1AouNy7dLD1PbtJJTYPI5qzH/5z+3U8IsSRci9me2wfb27lvByDdo3t6RWHlQEUlCzKocMpjZNpyA17EeC/gF03o/HqCNsPiDsJTiiNxDXXL1j/QO8gMeEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ffrzl7Q7LhBDD1DGW62uNYlTs/fc48bAT0TeP8J1+Xg=;
 b=VRfPEV5GVgqXyvlx6RBtDnei2RHHPN9W/4sUu5L2iJSYnrOCwKUoqlkPwJaHgKIAlEnky1vUsvwOPRf/nUILGyMU6wx8s5SL8PLYQ/T1AkMSMnFdAZUMOzcTOw9PJ6EKSHlFVskJZWtT96zrjhvpf3CVoqoK1vqdN3E8tFk2H7UDJ2f2UkeQ+ju/lqK5K09JznBIY40BNsyfXhUr16/FSnOkkWvCl1kwacMaeJRz/2PBkUWu4i0AUwGcn/3VMP6ylhVe1lUNWbuKYkJZJ3kGoOvX2a/iVGFmS7eYQ5He0gyxAHLnPyFRcHC2sICtqML9WEfippRUiJdEO0Jz06dYHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ffrzl7Q7LhBDD1DGW62uNYlTs/fc48bAT0TeP8J1+Xg=;
 b=s3E/GL20pJpQfhdqMnVxGkOAQYWvDYgLc8i9e2GbflMU6HXBN+DmnoGqscaKHPe9JFCCKUqrJD7RcO/+itjcQ1uvE9nuv2aYijwYvLdMkc1OCdsqG2NIezIyzfpW1vVIZKx2No+zsaKM5fFTDoeVIo3esTNkRiveco+E85lLymYU1OfomdZDFoXCjqreJ7Lv66bEjeMthtdjtogGkmTb43bT8dKfZBgtJU+CXEv4vTP+kMqqEMay9MLswo+5KPP6PhJqhgWW7KoTCQRRcghDPt0PDkuEYESPSn1WzkgbVeC+KyvRazD0YDTyR9FMTgZif/QSOYBZVLEnroK60WhBdQ==
Received: from SG2P153CA0021.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::8) by
 SEZPR04MB6456.apcprd04.prod.outlook.com (2603:1096:101:9e::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.25; Mon, 11 Dec 2023 03:14:00 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:c7:cafe::88) by SG2P153CA0021.outlook.office365.com
 (2603:1096:4:c7::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.3 via Frontend
 Transport; Mon, 11 Dec 2023 03:14:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 03:14:00 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 v1 12/14] ARM: dts: aspeed: yosemite4: add mctp config for NIC
Date: Mon, 11 Dec 2023 11:13:35 +0800
Message-Id: <20231211031337.4165619-13-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211031337.4165619-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211031337.4165619-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|SEZPR04MB6456:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dbb8b06c-1b5d-4973-14f2-08dbf9f73882
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	fan4SjUao0c2lt8oR8TnPRxi0Jr5K5OEiItM2j5DnaoZ0/18Il90JG3hotA0a8XYS7mMN7g8+qZZDb4/iCX8voIMs7Z8nhQU8YKuDThPcDWGrcFoOMnevr5KrfVJJV8i37H/wbmnwgnEegI/fin0OZpdCjHAVlfZq7aIQfNO/sqmmzKBlso8XHyjd91Srzxdy0+tOgstWFAm3t/n2BbzEdr/x3eLGHt4bxQcAO773l/1RxEAb+Y4jnPPHksemeWcpCYW0KI3jMsEH6cg6mkhKDlKVILa5dWWwdmtkEy3ALE16dGnmGRotrShkMRQy9k72d8X/qfOliHiRgUsghFDWUVXplu5pWpFZKMQ9OusfelKcwKoGmlrW7nfgW3wGjTDeqWtiJy1AjCx7VZoAoqgW6yodwGA1mMCbo2UutRVHVEUNXOrAlvLuUkuo+YsWI68HBTAftKBSHyBfCwQyPwEgp8tJGjrefbrMNcyk6Httu2wOw/CqRIbZmsqLQ+uJzOxxeObKCXYRYCnTkyiiRyUGIQs/YQ9cCn1A3fL2raSwwzmfPxPi+Syi1bSlTWwchkNVEZNnv1KgDpkZ5fN2dQaFFD4UqdrBqSX/9uY6K8J7U6t1ME/73IKMKg3J+NKscC6QZJYqXllDDmn07G1Q02hdKnUMFdcPoMnGVlCHaW9p1psdcJnGnggfI5ZW67MJM/hfe4GNPNdNnmUWVshcxbspA==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(136003)(376002)(39850400004)(346002)(230922051799003)(64100799003)(1800799012)(451199024)(82310400011)(186009)(36840700001)(46966006)(47076005)(6506007)(86362001)(36860700001)(40480700001)(26005)(336012)(356005)(81166007)(82740400003)(2906002)(6666004)(9316004)(5660300002)(2616005)(1076003)(956004)(107886003)(6512007)(4326008)(8936002)(8676002)(36756003)(41300700001)(316002)(478600001)(70206006)(70586007)(36736006)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 03:14:00.0375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb8b06c-1b5d-4973-14f2-08dbf9f73882
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6456
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

add mctp config for NIC

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 073f27f1e35f..c8e3a85b7a11 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1273,40 +1273,64 @@ imux24: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+			mctp-controller;
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			emc1403@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
 		};
 
 		imux25: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
+			mctp-controller;
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			emc1403@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
 		};
 
 		imux26: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
+			mctp-controller;
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			emc1403@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
 		};
 
 		imux27: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;
+			mctp-controller;
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			emc1403@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
 		};
 	};
 };
-- 
2.25.1

