Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B5180C117
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 07:03:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=S02Bu+uS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpWPs09DRz3vkk
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 17:03:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=S02Bu+uS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpWJ1209Qz3bcP
	for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2023 16:58:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WSPTD4PHnPIz6QzMPEf/JnllvkQIR7NPBed9PeQR0L1mK0etRHY/odEDyflNBPmEp995ZehyKxUN3ourEiZqvZO6m9xs2Ym5NJVXLaUo6RBoIYAIbD8cVeNYV+9fuRLoWLS34HOT4T+7plUKy5oUxGBMd49OnhUvLu4l46FTs8YZMPSClRyIMnqmCOIXYCoQC7vT//kb0+2tst00Ex7Ue9sCVDoW097z6kx5yi6yzEIXUkECCnMgmBSKFa2/pViBuOvs5ihvrg02Y41tg03w0CwUPcrdvWaJBaG0siMgZmvWkM4M7ginnbHiH+geC66q426d8A0d164KSjnOC95QXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9POU9qli8Y0G3IvdZsP/n3F+xvU76du76ssEtkRE+ao=;
 b=IbXXngv3qTUskK4/v2ZnSynfb7O44dmNI44tngbhzqSzOVDV28Wb4F3tVWTX4pwNPqDKVmJ4WLec0NoLjDnkv4N3Nf8JcF1G+x2d3vf5aWZyrOxMGMSGOMPo8ahUmSMWvdaTpF1ONlJu3TxDFEuGhQVaLWGMQOaJWTX+XhhloLiFLiHvsOA1ZQPycKS+z9N4ohODmy/+sHkjxyKROUAgZn577IxBbQSeraCqcxPN7cQwg8LSfvSFVg3VJcQDnj3L09iUc7B4wmeIQMmzE6haH5v2GsvSnYxi+HRaITPYHzEjmvHgaVPLWkSZUU8yOhHwK9g0R1mxPiuwbCPtLpDrdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9POU9qli8Y0G3IvdZsP/n3F+xvU76du76ssEtkRE+ao=;
 b=S02Bu+uS4BW9giwYfYwwhl49s/o6lXEz4A2jF6iSbV81DzETJvdWG2P5ALk8oweYfx5U2Xfcqs5NOKa5AYjKXZh3PgPfkqp6fHgNiqlYomMYjP1KXIYJIP/QtTzHmeO79wMxM823Zn6Ui8EolRHfGibCKgIPjHh8LOw8iarImQouzYdOAF+q7oN5xGvtBAOQu6WB0glSbsssYAfdmj6vdpML5ZLvaKWtZ5ZyXR1MD04KzXE1Ec6X50jPJk2Pj+fUKZFCHzZTuLVVOpM2RHNW7EvAx89Q2hw2T4kwBxLsU4wFlRanlow5qYusH6Db8IXPrUOrMFG2gADFjC2EQmC+3g==
Received: from SG2PR06CA0245.apcprd06.prod.outlook.com (2603:1096:4:ac::29) by
 PUZPR04MB6314.apcprd04.prod.outlook.com (2603:1096:301:fe::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 05:57:48 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:ac:cafe::a3) by SG2PR06CA0245.outlook.office365.com
 (2603:1096:4:ac::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.29 via Frontend
 Transport; Mon, 11 Dec 2023 05:57:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 05:57:46 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 v2 03/14] ARM: dts: aspeed: yosemite4: Enable spi-gpio setting
Date: Mon, 11 Dec 2023 13:57:27 +0800
Message-Id: <20231211055738.215773-4-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211055738.215773-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211055738.215773-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|PUZPR04MB6314:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: aec1fd73-d1ed-4281-5cc8-08dbfa0e19b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	xhuXL2NsJUZ/mRm77sSqsuQPMCt3okJTbNdee4yl/za6UNgr0o0nxKjDhwlJzFQ7tmxUNF8a1iFNJpFRX0byvMbdBGrxpIwRP9PXAfXC/Qb60v5tNL5df6ZOyortKAIBuAdkTjLCea+8lWBsM0WFvS7hzY5uusvLhAljC+6gpCmlqRkWg49fi5KDwo0u8bK3G0vIIJK2odBgpJYD0u3Eo54ng+NYm/BhHZSDRmJwH5JRPKL4IfDUXeL2mUNFtxw+/NBo7r729QoanrXabfJFSGZ8+ULHxEFj+f8+qGqZysb7C3Oi320FKCrJE2msvgX0LaSP8bzCeaDdLHMpvB2nRr2Nm6W3aGilq8XboPw1CDBcx8rCvuJTc5AW2el5Q3amkD1W/OgTB/untMtrEecynEdAJ6ieFMAtkwwQueL7CRhNhGh/otJPX+uaguNtFl3OY6hd7Nn+FgRHe8bwD4lgT4MNS2nCPZlsgY050ShRtkzspKl3fztyf8zrPr0oZ4iF9IvaeksIZaodjU1MiEG1jCyQjyVh637vLEPBvaaWaHPnhWBRroBmjr9zdXUKtq28IHVlFwZra2Tu6OSKTg7GRtWnE7ax3HsvMLRNSN7+CE0BTb/BV3KHgnE09pr+FEkNnqlu7nlbe1MjQ97yi+q7VkAGQPBG0yR3uYU93OtYOXfMQJeaTwCg/7VyqsJA1e7/WXeO8DlUyAcMhHmSLyHTxg==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39850400004)(376002)(346002)(136003)(396003)(230922051799003)(451199024)(64100799003)(186009)(82310400011)(1800799012)(46966006)(36840700001)(1076003)(26005)(107886003)(956004)(2616005)(336012)(6506007)(6666004)(6512007)(36860700001)(47076005)(9316004)(5660300002)(41300700001)(2906002)(478600001)(6486002)(4326008)(8676002)(8936002)(70206006)(70586007)(316002)(36736006)(82740400003)(81166007)(86362001)(356005)(36756003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 05:57:46.7537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aec1fd73-d1ed-4281-5cc8-08dbfa0e19b2
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6314
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

enable spi-gpio setting for spi flash

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index c32736fbaf70..0449a7e36ff6 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -53,6 +53,24 @@ iio-hwmon {
 				<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
 				<&adc1 0>, <&adc1 1>, <&adc1 7>;
 	};
+
+	spi_gpio: spi-gpio {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-sck = <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
+		gpio-mosi = <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
+		gpio-miso = <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>;
+		num-chipselects = <1>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
+
+		tpmdev@0 {
+			compatible = "tcg,tpm_tis-spi";
+			spi-max-frequency = <33000000>;
+			reg = <0>;
+		};
+	};
 };
 
 &uart1 {
-- 
2.25.1

