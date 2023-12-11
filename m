Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AD980BFD7
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 04:21:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=eZugAWS0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpRpg30KDz3vYm
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 14:20:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=eZugAWS0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::604; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20604.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::604])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpRfq4n7Kz30gG
	for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2023 14:14:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EgcFuyGujb4aiYr1UA5YyfIeEBCRv0q/ZBUqYQGtWD/zAxCbHaEmcHm1r7ppC1wgcVln+aRqKHeQKfgT0eAOeU+UHTE7l6UPrmXUaKCmmhWcxWp/4fxKceQx5hE2SYQakleXWTzlBKu5VtDsRRleR3w2mZsEC+MPEDHNSDYhFvh+XGGV1BiJGFXjyQAaw6TC0pY7D38tFKU3T8ymiheP8+eMHFvkZFIAg5O6FdOIY+EOJDImTBTOAscNUwO84p0Y6uYEeDjxLRNNKjweXWRTOSCDf3a3qxUa6+nKJSvf8jEAVPEBKQVzyQX7W/DyVWyVhK1KdUiGCRSoqDiznrSTJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S68zvDbwuc+EpYmRfn5ns/lT6xUCcZUwkslYayui3bY=;
 b=Hufzngx5gncj3pGTVBu+D3QcpMU0Ei1rNqtQEliSZ+P6jVYGbTKefj+rYUSO8mqlVaETjrWWmMf208Ilm2xhEGY99HJGXGVSy/CwQPvpcYOEG5MertvYeyRQr87Wo1ol96n+D8FXg9OhSdlODteX/F1HuegKWF2NfX1zynEA72IqFdz9fAq1VDpoIqjpbl9QC5JgZIWqyNrGysCxBfZc3aU4RWLD4Dc60mvDoO8IQB0Kqhw2WW/FY2OpR7ovstZN1Szw5DTOb4AbI+9nqxx+I9xopsOBuSVJt9WbTQ++6t/BwI0K1EuxYVTycbw4ejQMWzcmfuAy6zPtqEQqpB14cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S68zvDbwuc+EpYmRfn5ns/lT6xUCcZUwkslYayui3bY=;
 b=eZugAWS0huxAAkSApfSw9YslWS5mUTVdzfSxd0DFCrDbLxRqaiJ8gqrLIrxKpPqtFeVvqfWG6lCJiAzY6VeIUa57X1A2ijKET4Ue/6p0E+7dn+sEFA48mARu06LRwuGeM9jQcJCYGbA0s8PbDcoC+a1gS/Qo/jsDl3wxbtYGHvD8cmjHlUnMMNo7hy842dy7tXGFjypwLEzscdML2vFqbea4wj0S223r8VSKjzAaxjHqjTQur8rQwKCKPC5qFHYXbu/6QQL1AxFpBCUf72t32eD3hpiOboKVC3fES0bnwyhLw8o2/h00b28gw7Mqm4JsxT5xRTy1OdAAIUrdiF8Elg==
Received: from SG2P153CA0029.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::16) by
 SEYPR04MB6481.apcprd04.prod.outlook.com (2603:1096:101:bf::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 03:13:51 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:c7:cafe::db) by SG2P153CA0029.outlook.office365.com
 (2603:1096:4:c7::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.3 via Frontend
 Transport; Mon, 11 Dec 2023 03:13:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 03:13:50 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 v1 06/14] ARM: dts: aspeed: yosemite4: Revise power sensor adm1281 for schematic change
Date: Mon, 11 Dec 2023 11:13:29 +0800
Message-Id: <20231211031337.4165619-7-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211031337.4165619-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211031337.4165619-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|SEYPR04MB6481:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1a76718c-232d-4d3a-dc81-08dbf9f732da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	qrjstlBpMHXgT91/TLInmVZCj/SF+O2P0Zdz3Z8l8iE0ltW51zFUJafhZGfvUgSvvK09tHem69yJFSKD0r1c3rArItRdnAAD8E2MlpDIXZBzAdfbGJx/oohdvrvQcRXsygRV8SFWra4rohFhFsD5n7WBHSrY6KOFzCX+9VlSMnyInnbLFpuBXrLCtO+ER5DBKgqwKk6ElKrorURnAqVJUMTNTfnrLX2gVj2f0McB9dQjCQq6PtsvsEWa/u8E8dhRnKsKUi+uuPSsIHB7ARJ6fkn5KphnnDetQ5oRqdsTfxePiyzzDbSt+WZoJMstoVevzuzip41AcWIZ85ZCDCddgStJbfe3iUKuaE0rE2mIsGlWoBy4d9oylJOSkCVNl/pTKAUaVDxRp2UEac8S8N4T7E8V0k4HZ1beY4qw0/Rb3P0d/StaaozxFpZhTuCSBlsg495Vv+9xJRK2NK9l/SKMCffSjgpD7Jw/Cpt8SyNd1P99eNQrLeZvMp9sVNEEoERQ/FdYrdkH77gmeI6FHDQ4hNc3BlE0567J/GlS1Dn183y4FnNfkNov+LrIKe3/koqVyOKEN5LKsRni73SkrLS8rJ+0JHgziMTKf7hMbNaPI4rWAb4R9CxtEhp/x9hMoEJ0HXVplwesl+0xyc2wK4an0i7FdbGJjWBkcmDdk5AoHHubqFWWj156xdXgSbqgG8dy2A6xBYzuJMoTVUPZKzkc7g==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39850400004)(396003)(376002)(346002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(82310400011)(36840700001)(46966006)(1076003)(26005)(107886003)(956004)(2616005)(336012)(6506007)(6666004)(6512007)(36860700001)(83380400001)(47076005)(5660300002)(41300700001)(2906002)(4326008)(478600001)(9316004)(6486002)(8676002)(8936002)(70206006)(70586007)(316002)(36736006)(82740400003)(81166007)(86362001)(356005)(36756003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 03:13:50.5530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a76718c-232d-4d3a-dc81-08dbf9f732da
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB6481
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

Revise power sensor adm1281 for yosemite4 schematic change

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 24 ++++++++++++-------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 7fe80ad271aa..7f0134fcee57 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -176,8 +176,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -193,8 +194,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -210,8 +212,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -227,8 +230,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -244,8 +248,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -261,8 +266,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -278,8 +284,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -295,8 +302,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
-- 
2.25.1

