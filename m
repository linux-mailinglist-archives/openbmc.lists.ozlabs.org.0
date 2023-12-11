Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF8D80C127
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 07:10:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=kLbY0jMq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpWYj5mbsz3vtH
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 17:10:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=kLbY0jMq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpWJD3Csxz3c4C
	for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2023 16:58:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dolWLrgLrXORo/aGk87SAVKxyChRgQ8CA6Inx4AVbyEbvU6XbB1XQYGGGN2hbywsO6FqfZqKBIDqWg61teXQl5xfaRRtVERDKrnfAuQgHl5Sxro5EtTBKsBCgoPld6GcIpV/y4DclfyZoLLfecLHVwRWbeXXOnZIMfntdgOUcz6X/Ojtem+aawMFh2JLKDKYTlqEWC+UkLl86xi3sAHRjLAIbbxPxerLLDVIE7YBB7aYxLkJd3g9KeTe3XwYhaONzTCe7Mpc0iIocfJTRIC1EdqV7VLUYp2iFwHDfSYEZUR7f2CPUJroSIgz00nEgtmbIebVUAAsjVFJFCRx5XD3Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ffrzl7Q7LhBDD1DGW62uNYlTs/fc48bAT0TeP8J1+Xg=;
 b=QKLzTwq4tQQSSCgnZLXt1TrKDixFSZYgTUi6eBnYvnKV77BwInOKSsAD7UeOnJ84qwb/bWro9CZqMtcAf63cbRjW8UGrW4XYs9veBIwS0ggozd0erkxsWLlzYYlvJfSCzHIc24nl3MvaiLsRF7O+u+dTeJXK4OWMbpOAX/u8u+PGUinGe0J2Tsc932PGN+fqBPXRySwKUGzdmLlnaWkwEw+SBFjhdErtvdSTZwTucvQzrij5rBuihdL+7iEO7lhcqaowSMz5XNhCxPPn2lwaYucCz/ljsko8SfxN0ZimEmLvhk67+Cpq0nKfAGubFlwxdQ6b+2W7SR1AWe5vU8h1Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ffrzl7Q7LhBDD1DGW62uNYlTs/fc48bAT0TeP8J1+Xg=;
 b=kLbY0jMqS51D19EYw4xwAn46y7hT91iFZyyLp7bXhY77kPGSi9Y+x+I3Lc35MWZTsLQ8rhqcSKn2GATzIypCIPxFpsf8RVii1ZHpQVjqVCum4CuCQeMGsI6dnsve+Ajh1PIpNhXnAGhNt8fw8UlSpWXGGfdwkvuWbEecgt80KMWRDL3+9eIXGkdM3dwlr2HdEXnYitDL1hD3xbUNM7qi0XnqodVTvdsdL7xCDcAGopineEK4CL4+PPwJBRkkEYT+DT1WWWEnXlWGGoVsniRzMSujgLdVAzpVzD2C+De/ls81+cnrMcGeR79PsOZm2OtJKaroHcXk+7aBM7RUoxSI1Q==
Received: from SG2PR06CA0231.apcprd06.prod.outlook.com (2603:1096:4:ac::15) by
 SEZPR04MB5729.apcprd04.prod.outlook.com (2603:1096:101:70::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 05:58:02 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:ac:cafe::b0) by SG2PR06CA0231.outlook.office365.com
 (2603:1096:4:ac::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 05:58:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 05:58:02 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 v2 12/14] ARM: dts: aspeed: yosemite4: add mctp config for NIC
Date: Mon, 11 Dec 2023 13:57:36 +0800
Message-Id: <20231211055738.215773-13-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211055738.215773-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211055738.215773-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|SEZPR04MB5729:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2b60a91b-8fe6-46d7-469f-08dbfa0e22f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	LvbZM3rIoLywo+AOQlsdQuF74IkuzuiI91ljUea7dPp8n9zncYM3XzQtc3aTcAYSdqTd0f96PsKmMEm5EMte2stQ59sGEz5k9Eb1/NuWoTB5rC7Vog2/1kwqyfIxM/jKt/kVYx3x7VB4EkfjuznrSurf6Zc4SAGLVIZDmCrObDYBrDBA0xFbhlBz/9w35d0Dw15jSHr1tfmLU/hXP9Fkc5KMsBxorG9f5ddrWxCFRE4BXbuyjlp46kBK7wxkCaFENIgCSxLhBmgtNC+Na6Ax1RMEMGk5iiciXIKz+I5dSM4B9PRLwMWMZZa2OhzHRnuAEFQS64rLHUXeYicS+740Y8aPAoDi4eKiP/eiWlr4MA4bMY8/215WEBkFm62FxooJEffhHo76W4Glm/1Ayn8ibdkq7MZEBFCHKo2HJr9lH0+q48vhCZxqpQqTpdjrVLSrcN+wJVkt8JAvRcL2W02CBOk7/lbF2MBGyDK/u9EJXPMyneY//MC83ab+FP3D+lz3aMUZ8Rro4Dh9RaXEVeb4k4p17ROBsumNkzMTUvcns2p2jbjwk4o+shpk0yvKClOxFthT77Jq+mTUOX/ZAvLQuhsR19VnkN8Vg/k7eJcgL7MJGraafHR3V/mcWr4+US7KydMLd3jV0Mt3AwOgFJgzbow20HMQJm+DO6WutjalI+lXcpYzRZE0vImmx162zXbK98u2ulnoCPLZwcad2CxEJg==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39850400004)(396003)(376002)(346002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(82310400011)(36840700001)(46966006)(1076003)(26005)(107886003)(956004)(2616005)(336012)(6506007)(6666004)(6512007)(36860700001)(47076005)(5660300002)(41300700001)(2906002)(4326008)(478600001)(9316004)(6486002)(8676002)(8936002)(70206006)(70586007)(316002)(36736006)(82740400003)(81166007)(86362001)(356005)(36756003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 05:58:02.3008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b60a91b-8fe6-46d7-469f-08dbfa0e22f4
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB5729
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

