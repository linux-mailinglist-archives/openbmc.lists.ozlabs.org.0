Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D81980C125
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 07:09:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=e7MFom9g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpWXk72Psz3vgk
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 17:09:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=e7MFom9g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::62f; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2062f.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::62f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpWJD2NHdz3c3y
	for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2023 16:58:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dNDjXXw/Fg5qtF6JevZppbd2844DvVmlFVfiANWYY85S5xewW/IF4WU7yPaEML+J7EW1gzf9J5/DvDSInz4klK2M/PiMJVeKar9JqKvwGW6cu3QSFofRfWUqkanPmkBpF8e0xm2q36fl4Fb8CgkSQDKvUh+U7glpTzGIXb8ibJ9cp2iGSNLq4LNl1GEkw5hsgeYJY7493c9w37lJOfAbisdNAC3PX3874cWQaP5Q79NVl3uzhG2ORKgMLmBgOzISqQNF1r0Ht8JEmRGquiuhzHFg5hIc8vaO2VOmJiSlE0/z5OidO3p9iL++sxAuLF4f1/1IVcOqy2XBpAmLqKgNCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGTire1khymAurDE24N2Ga1RZMcRUKvih7zqhbJUcjI=;
 b=gxMKLpef6qFQ7LXaFtKXaQT2G30qSTcVcg38Rzqcx0yVfBwdkftUtu8sLX52c2eeGHobjXYwEvQdY+BNDmoVQqpLf6/RyDjaVoa/jtVB3DG/f7m0WMoNVEG6kSPJL9wYZ5YVcX6bFqL2Vr42d+78Ahys/8HsFGyc6cBbEij9f8FRLMRcg6qpv0luWgVH16U/oXDtid/Rb+frFuGhaWFLr//wr/BEsPZjHs0vEDFCeIFt/5O1geZtdtMi2oz2Rvm9XbMT4c2GN/KaTKcat+FDdnWNLpI7O5QPho3OZKw6t6bhpadNY7zjkQH+pWMdEY+1oEsbzqAnvMEDPM5nyFRCLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGTire1khymAurDE24N2Ga1RZMcRUKvih7zqhbJUcjI=;
 b=e7MFom9g1lMlJAUTePa2gH5okjWvi8ePzhLl+FqApDA4QHn+dga58TJDgTAAM2KsZDyri3tPTSy3XRJVeaRc+J2TuzzGS7XcoPWB0KnmrJg7TwZHsMQ2p3HPVagVE0gABujlpgpAB0MQu6QY2lEmaXQygjAqnaAxWMm9iFqekLZFQ4psrepYqELKU/aNnO23hX/HDkxkLs0kYO/PAz7BtxDftrV+x/ViG1tBPsazm6lZFvNMvIOJ4WA2VVjZPN4kBvBT0qlc2JDNrx6z4v8tmfQpvMQ9sQm0dIm7n8fcAEU3MVgkv3RroRSXVQ22sYahMhv3TfQmlQEU7T/Y001QzA==
Received: from SG2PR06CA0233.apcprd06.prod.outlook.com (2603:1096:4:ac::17) by
 SEZPR04MB7185.apcprd04.prod.outlook.com (2603:1096:101:17c::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 05:58:01 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:ac:cafe::ee) by SG2PR06CA0233.outlook.office365.com
 (2603:1096:4:ac::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 05:58:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 05:58:00 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 v2 11/14] ARM: dts: aspeed: yosemite4: Revise mx31790 fan tach config
Date: Mon, 11 Dec 2023 13:57:35 +0800
Message-Id: <20231211055738.215773-12-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211055738.215773-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211055738.215773-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|SEZPR04MB7185:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a113f85b-e32c-4d7d-dbf3-08dbfa0e21e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	LofD19XPYXNNkkqZ4Sw7feWh2eoJ9ZWHBGwTHT+nb3exmgyrSIzhY7XYnb+EOI4gayLHBSHCzcW9vfp6UblSOVfqkYLtXXC+L6Sps/5AknIHriq/Ll5H1RpVBjTYVRruaxUD5bfhbsly298rjQ4jtzOZ0yAE2KkxYsL2BDZ2YYEzn5jO1dv7C8SGHTp9adNrlcdfFAQnUt3NhtQN5qsaRn0sTuMEjIa0a5fgyaihGX+HsVsWyPsdw/fLejhg5AnnExsj0m4NwiMbN3ztucitweIOS1ZyJxHncZwRnZ6cartSRldN1supU/0lSFGRjyzw8/1VSmwGh4WMOuXJEau2+LQVE5GlSWLC5VeJSFHf5fPqRXarcBZIrYqyetXnR5qk1RXB5gXoMbgMomSfeCPvCBT++BKRnvowZMF84wHo7McPI7knZMU9BkAQSP/FAi/hK859yDXBYZD54I2Ew7Fr4XvbjcOMeSNmafco/e4+KaVptR6RLu3brWCTKxXQcXpFeaFo+1LiDyatuK6zQNvdhut9CEk884+Gir2a2v5QlTT4CaIkrxkk+NO3Ht6yVn95wh+zN1i9Z0hMtn0ryx+gka8bzlaVCOwvijA3WPPYAOJJXsJYqEjNaPK3qiyaaOBmD8ZLw1eBVc8XNZcxxO/8cT36qqkrJYs+Putd+EHnp/6CuMabla8G6YbE40qPzAgH8VhY6vy7vsaP64ZcWllyzQ==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(376002)(39850400004)(346002)(136003)(396003)(230922051799003)(1800799012)(186009)(82310400011)(64100799003)(451199024)(46966006)(36840700001)(2906002)(41300700001)(36860700001)(36756003)(86362001)(82740400003)(356005)(81166007)(956004)(2616005)(336012)(6512007)(107886003)(1076003)(26005)(478600001)(6666004)(6506007)(47076005)(9316004)(6486002)(83380400001)(4326008)(5660300002)(316002)(36736006)(70586007)(70206006)(8936002)(8676002)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 05:58:00.5195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a113f85b-e32c-4d7d-dbf3-08dbfa0e21e6
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB7185
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

Revise fan tach config for max31790 driver change

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 48 +++++++++++++++++--
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index eb3687bfd632..073f27f1e35f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1095,8 +1095,18 @@ adc@1f {
 
 			pwm@20{
 				compatible = "maxim,max31790";
-				pwm-as-tach = <4 5>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x20>;
+				channel@4 {
+					reg = <4>;
+					sensor-type = "TACH";
+				};
+
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
 			};
 
 			gpio@22{
@@ -1108,8 +1118,18 @@ gpio@22{
 
 			pwm@2f{
 				compatible = "maxim,max31790";
-				pwm-as-tach = <4 5>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x2f>;
+				channel@4 {
+					reg = <4>;
+					sensor-type = "TACH";
+				};
+
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
 			};
 
 			adc@33 {
@@ -1145,8 +1165,18 @@ adc@1f {
 
 			pwm@20{
 				compatible = "maxim,max31790";
-				pwm-as-tach = <4 5>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x20>;
+				channel@4 {
+					reg = <4>;
+					sensor-type = "TACH";
+				};
+
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
 			};
 
 			gpio@22{
@@ -1158,8 +1188,18 @@ gpio@22{
 
 			pwm@2f{
 				compatible = "maxim,max31790";
-				pwm-as-tach = <4 5>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x2f>;
+				channel@4 {
+					reg = <4>;
+					sensor-type = "TACH";
+				};
+
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
 			};
 
 			adc@33 {
-- 
2.25.1

