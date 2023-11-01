Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 959527DDF7E
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 11:33:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=eZapXtA1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL3J13kpXz3cVf
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 21:33:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=eZapXtA1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL3BF3SVZz2xZG
	for <openbmc@lists.ozlabs.org>; Wed,  1 Nov 2023 21:28:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grA2rJi/d6SUyZGkvKfu9jr8XWfHHNVErUxEusRWk40r9D0sB6N1z6htIMYMCfEyRUqZ0KhZv0ogj2lSwNgiCkhP/Z83HmONfxe+evLc1LT1iaG2VN4pHPh1Fnf799W5b5K6gszoa2JZY8CRzaiADzauiV5i6f/vLVRZ1o14XBk9bnOM2ayZh/E0mK9s6J4H33iwIDLwpAMsLEu4n0fuZiAE7ovNTFaCZVo3pZ+MKhmaJo2Yw6PvG5xEr7dF1gIhNzeN1NyQIsGV9qcxJwPj7XnCs6XE1dJAhkr9/i3A9/vaPg4j2AyibqK6f7EJ5Nx1F3xcJwPUl1xMaxDl7I72rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTdra8Q6Ty+kafVG+eRTSPVcdelb5hg9red0Vwq21ms=;
 b=YfjTdijca7CBDGS7xAKcKz337DCBFLPz2cMrhUEx9ZxkDFDMhk4VSZ81/nYQXu29Ow30R0OSkm5eY6TVIblqrbXfsKTUTtPicZIvVna8i6AmLeMrmlBM3s0YoeQZLmoxqOPok3zRK6u+eNi9YEE09I3L8hwMwP726+TUYMt5RfJuQ7mmHVfvvT0LiSeXMqNM1d8b+4grYpS1nhAEy8duC+5vZqEdx8Vx6WzOap4V+urkwuHNZWk8zHNcCL8bZGh/XjsmAHYyW5waZc0+Ticn2Vk53o30kju1b4KqVyENd3NEU5PAFAhkow1oKVCGPXOgivV4mbVZ2UD+75w44q4ISA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTdra8Q6Ty+kafVG+eRTSPVcdelb5hg9red0Vwq21ms=;
 b=eZapXtA10SawI9LHqV9zLU/jcU0n7JkDpMq/GMnMreejCdcqJZhXDyQAZpYiW8w7AtTwFsKWSLnt22J54sX+GvnznhsBCsm7GCtb/Kuw4uXYF/W5GBLPlzDImTylc9xUASS/pZ/2SeDIwNnTLqErxzkJlUqTUDFqi1fIF1lENhUpZN/mhs7bE+SEd6k1Tsg1IdFWsg5T1hMmThgCSGqjiebVV89xww/6KH6aLcduOAGgRuJodsLtZkfvj/sM3Zh2rnk9zNQF+23/TapbcwQTqnWQYjJMwM7RehYhKLxYxAH/VCX6jR9IvtO3KcQW+CPKbKrEcWtpJGsk8rEDtqbMSA==
Received: from SG2PR04CA0180.apcprd04.prod.outlook.com (2603:1096:4:14::18) by
 TY0PR04MB6292.apcprd04.prod.outlook.com (2603:1096:400:267::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Wed, 1 Nov
 2023 10:28:00 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:14:cafe::2) by SG2PR04CA0180.outlook.office365.com
 (2603:1096:4:14::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Wed, 1 Nov 2023 10:28:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server id 15.20.6954.19 via Frontend Transport; Wed, 1 Nov 2023 10:28:00
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.5 v1 03/11] ARM: dts: aspeed: yosemite4: Enable adc15
Date: Wed,  1 Nov 2023 18:27:29 +0800
Message-Id: <20231101102751.2538864-4-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|TY0PR04MB6292:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 99b3b67e-ccff-4615-89c7-08dbdac5390e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	4EwiPgJHae4dxIz/ErzTod8YgVCQ2dWkW14KarThhmIsbbWkpymLrUD4U3zp6hooA+UB9kC9bEozRtmCpqpyM7WuLQpAXIDG7M6bk3E+/zlOhhDg1JvsJj3/LbZo4fOwa0Y8LAb8o5VCU4YcPB+8/iuQxWFu1CsfyDf+g+EAwyiM543azqqp6nluBt12Th+1Z+TShjFQuQi/BGBOn6WYmfVZOAgFyvU8ZKSHFE0bxDFIWJ2ZIM9aVAz7tp6rQPxRAdJytF9jXsxxSXeOlrCoNv/I5zi0KukPAJI+dc76HPX3QZr8PnrS9nDcD6QGdtKssUFagTv10aj2AjkT+3CKFag621acGQQyH0hD7n1LjmjXis67/G3Kd57ff1fs6IHcpCPv+t1dg/dhbGsoYs/UAOEVicDnME/0ijeJbsMTEECrbKbXkNXiiBWUcph8MhlL1nNQnxkZsSEN/UilV8waVsnopdICsWiVQwBk30I92oR4l/HgoyqxMOuUJZiqCl4H/FpEw3XRCsPvWvBdRhJflpqJpvfzw3GnZWwtlnMDZLDOe3u53DwE7hNy3Z+xcBjGB7/tDg/RQU9AMgpF10pusWkP7GGHD1Xib3Pqxf53kSxR9zfQLgI6JmvvFaw7cQqF4Nc73cK+7LitH7Kh04NcnA9GxkPM23wDOM2nU8sLG8mqql7eJlUYQYtQids3ZgRnVsGJecYbE2GBisD/HAOhvg==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199024)(1800799009)(186009)(82310400011)(64100799003)(46966006)(36840700001)(1076003)(107886003)(956004)(26005)(6512007)(6506007)(40480700001)(2616005)(9316004)(47076005)(81166007)(82740400003)(36756003)(356005)(36860700001)(83380400001)(336012)(86362001)(5660300002)(41300700001)(36736006)(316002)(70586007)(70206006)(6666004)(6486002)(478600001)(8676002)(4326008)(8936002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 10:28:00.0911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b3b67e-ccff-4615-89c7-08dbdac5390e
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB6292
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

Enable Yosemite 4 adc15 config

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index a5b4585e81e6..c32736fbaf70 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -51,7 +51,7 @@ iio-hwmon {
 		compatible = "iio-hwmon";
 		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
 				<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
-				<&adc1 0>, <&adc1 1>;
+				<&adc1 0>, <&adc1 1>, <&adc1 7>;
 	};
 };
 
@@ -920,10 +920,10 @@ &pinctrl_adc4_default &pinctrl_adc5_default
 &adc1 {
 	ref_voltage = <2500>;
 	status = "okay";
-	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default>;
+	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
+	    &pinctrl_adc15_default>;
 };
 
-
 &ehci0 {
 	status = "okay";
 };
-- 
2.25.1

