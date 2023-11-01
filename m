Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA477DDF8E
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 11:37:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Tzlv/kvS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL3PH2skqz3cGY
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 21:37:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Tzlv/kvS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::620; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20620.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL3BM3Kf4z3cSH
	for <openbmc@lists.ozlabs.org>; Wed,  1 Nov 2023 21:28:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Muj2twdQ80clBpWLl422Gd5Sm3KfKzwpL0n9VIQ43u/nJnu6JFG0f9ocE/rnxwHOUhvrlbGaj0makSq9GCu05YjzdzUkdPwm93pETQCth5csgoj1HI/18uizMX0EiznyWHQbrbUGzonViFoU82XFTPrVxSpJwpyI5H6CRLqv5vTijNyR0FrsgBQaGAZ7tqgqZuPOPKrcrhoZKG5FnCTMNhVe/L2UfkXkF7Yq5sqpKaJrN2rkRI3iE17TdOPkOcmJZc6+5MMF65/UoCVnGmFoc6MiX00bEpFRX1D8Z7L1TS72ude2vDmbyrEN6BVmyF7NbnEFuYQIHCnpzgKim5t/Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9hJP4cxinrgJgR2dHN8WewCHihh7cN0JE99FmSA1C0=;
 b=R8cxII8NAMQPaadIs89spNyQ9AhFAqwTb1NbQn3c9iAJMsxUE4KscAKVjLRz8ZKppU8v5T4f7RbIPDx5JN4OBQII6mixPqc9YB+JQyYoHnlq/GueExZaf7zdKRRfaRhp539+WjrlcLGZsIfNonaOS4C6+6kOhL9ZDHPihl1gaTxn2YntOYclUmN0d+74Ll9IvJ0y43iAJRi80zBC91XuX1seU3IaTixN/zRhQdsHZ7+SEsutaMKNSNGrPNszzt2GX8XVBwKhK+3AXPYli7oDAvosKk6gpVU+ZwIF0Ox39rGfjsOtEAIox+oCC5xrp5dqHZu8Xflb92Q+6VEAgQYvoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9hJP4cxinrgJgR2dHN8WewCHihh7cN0JE99FmSA1C0=;
 b=Tzlv/kvSu+jmm+ReHnNNBSuRVH/bs0SmB6T37XkkNb6yqJ6oP4glYxRJ/IZwpxoNTaHsKPvNI8tg8K4UKQixk7ud8lmG7AGIF3QCVwW6PqFju9HI+f8TIeVIvM5aUViSN1MPt1wAwFuwOE393dBW6RLQOKTj7CyvndKjkXx7aYf5919OJqROjEPKf40jNDjh9bsRtqRwzt6bxDkvFkJXeHkhMSdaTTZXVuhYwzw3hk+ynCYo7PJy4uNruxDQ+FNWH2xMRMzgW4TtfwPEaOAlJp1jXJX+9hIqq1wFYgyyJGP5IMu6oVxZtV3TvdxFnTIWXZ0/LbH266Mf9bIa9aKN6A==
Received: from SG2PR04CA0175.apcprd04.prod.outlook.com (2603:1096:4:14::13) by
 PSBPR04MB4056.apcprd04.prod.outlook.com (2603:1096:301:d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.31; Wed, 1 Nov 2023 10:28:07 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:14:cafe::76) by SG2PR04CA0175.outlook.office365.com
 (2603:1096:4:14::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Wed, 1 Nov 2023 10:28:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server id 15.20.6954.19 via Frontend Transport; Wed, 1 Nov 2023 10:28:06
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH v1 06/11] ARM: dts: aspeed: yosemite4: Revise quad mode to dual mode
Date: Wed,  1 Nov 2023 18:27:33 +0800
Message-Id: <20231101102751.2538864-8-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|PSBPR04MB4056:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5640d995-7c92-4db1-4965-08dbdac53cfa
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	XRkdmbom6uhXPmR2WYNnHQ9iMjgDEyeVRg5/3DDkN2fvG7nWElqAX36HBKxnMRmu9YT9NrZQ05epBWPRhhLq0LoNsPTCf6P2wYifYK26g+f1Yn3QRnPOwYVOWdWqjsZP4qo+7gAU/xeW6iIBqWu5+ZuOml9dJvcghXS9lVjoj1CR11sBgQd0Am41PAmYo9qz1FcoQfVDzsvEaUTdAhCekjBDHJRRHjhN54Y9jemTui5s/A6vkuZqEwICeQMXXQU1Pq4xSjUh9uvw8ZjKbNu7kcWPcwf5KW/BGYhyhiBvRkwAdCOvAevjH+eNFPSyiiQtm+JDyZMUMk/Tv0SLdgN3uM+tSOue3E5M9PnMyBObZefMhltcEwg3/EbqUTA+EmqTC+7hSBU9/lWLGIKTfcNSKCHsWdGIsZTyeNthCp6Ov2C9tCFG7syaAznTQKEvFnONQReI4nPrpXTVExG+ZWIXDzO1xVGhlVAafwYObi/J00VyMkIBL38aTnzWxz2szH/f5zQbCm0U0AmrKN4NoBScRyABSNAa7FVdEKNxLHHMisWRXEb5ae4W3FSWHuvVzB/2/DOZpQQnOEgzKHL4rjwijWqn2XppSMM3XRqoVwV5kv0N1NNTXQGs/o2CCjpBFLYzt+xAXHSI8LQSk0rv6KsCeCBw1Mi7b+mIkSUA0CZ8SQa6jWsZSg2FCnEX189fC1HIh5SBM6leISB+xi3DrmDNQg==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(136003)(376002)(346002)(396003)(39860400002)(64100799003)(186009)(1800799009)(451199024)(82310400011)(36840700001)(46966006)(82740400003)(6506007)(86362001)(6512007)(6666004)(356005)(9316004)(81166007)(2906002)(5660300002)(6486002)(70206006)(26005)(70586007)(478600001)(2616005)(83380400001)(336012)(956004)(107886003)(47076005)(1076003)(36860700001)(40480700001)(316002)(36756003)(8676002)(41300700001)(8936002)(36736006)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 10:28:06.6536
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5640d995-7c92-4db1-4965-08dbdac53cfa
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSBPR04MB4056
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

Revise quad mode to dual mode to avoid WP pin influnece the SPI

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 0e9095c83a59..7fe80ad271aa 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -149,15 +149,17 @@ flash@0 {
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
-		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
 		spi-max-frequency = <50000000>;
-#include "openbmc-flash-layout-64.dtsi"
+#include "openbmc-flash-layout-128.dtsi"
 	};
 	flash@1 {
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc2";
-		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
 		spi-max-frequency = <50000000>;
 	};
 };
-- 
2.25.1

