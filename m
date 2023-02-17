Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B50469A905
	for <lists+openbmc@lfdr.de>; Fri, 17 Feb 2023 11:23:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJ7Dn5Z7Xz3bvH
	for <lists+openbmc@lfdr.de>; Fri, 17 Feb 2023 21:23:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=uItoYMgG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e88::713; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=uItoYMgG;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20713.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::713])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJ7Cm4tMVz3f5g;
	Fri, 17 Feb 2023 21:22:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MbWHVCmGofe+vptNkzKZZEfafpPP44MClTPD4APqBkkoeyw8Sn/jLRDuMTVawVHpooahhnF8IWF9UBRRCrzb9t6Qxa9/eBNzYspBuQsyW2haK11qHvTEg+9uRfZ0cUr/kPruJeAn3V2LoVZzEctqNGIUkexTblScuWtkVifBYevR/KlRfIDpQh7UVd2JgOOocj2x2WNi0kEkbx7wpUHsETd61C5rEzFoxG6NPqgKsuoW6Mus9sMbBmBblfy3cAlid/dZnj5QDBY82tJ8xVfr44iiIXczVZC8VAcvvPLLs2VZCde9nblASz792ueOf07fK1UrvXYukIaH8P2WCgprAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKL373CjcuzR3fvZWfxjTwV33fkBzAZ3MFds40urUpw=;
 b=bIezg1dP78T1+rcudyLXEiZPihiijVWGWntjoJdoLz6XRpGaOYyIJBijtDshxmSlfxk93N4YqjdOWgHPU0D5jLUesYAP5wE8H79IPfd66qxlhY4RkygtD/cuwxiRxi+fb8/rzuWiNkBtqHwjZQMK8x7QbuSFd88IacUMiloZOBuj32Nf/bDNlRNjl0FxGaLtZAcKX4Ant9QrRNs/ognKt2KFjM5PMDwiHXyYbfOPDKZRaJGh5OJTG+AsP6pO++Wy+eONYHmy/W21op5WDa0ZI2NC6rKKRNrnahMTHmhtRzwGT1dj0MyNAVVY4MPvXBPTPMhqbGAuRTh4vv9BESNE/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKL373CjcuzR3fvZWfxjTwV33fkBzAZ3MFds40urUpw=;
 b=uItoYMgG4LlJ9JdyDyl1tYc1Wm/5icVs8svuo6HWUtDwQMOl93XIFP2skGSb799ph/fQpbvBtE947wPv5nMyqTHYsFzC6iRLOCPaUHvQ+08uCFwPpiSInQyUj0fEEnZh2zFf/4O7zU0serm7d713RXqLycyCd7Bl/7Mdt1W3ou4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN6PR01MB4973.prod.exchangelabs.com (2603:10b6:805:c4::13) by
 BYAPR01MB5143.prod.exchangelabs.com (2603:10b6:a03:1a::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.13; Fri, 17 Feb 2023 10:21:49 +0000
Received: from SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::a807:4f38:56ee:b079]) by SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::a807:4f38:56ee:b079%4]) with mapi id 15.20.6086.028; Fri, 17 Feb 2023
 10:21:49 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: aspeed: mtmitchell: Enable NCSI
Date: Fri, 17 Feb 2023 17:21:22 +0700
Message-Id: <20230217102122.16547-1-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:4:186::18) To SN6PR01MB4973.prod.exchangelabs.com
 (2603:10b6:805:c4::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4973:EE_|BYAPR01MB5143:EE_
X-MS-Office365-Filtering-Correlation-Id: b65e0dbe-d525-4d94-344e-08db10d0c76d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	mjnJiX1MwqUR967BOMlzPEHIisfJ8d86AnJEDleH07V90MQUCqlo+Q4g7iBO8vaS+WwUs4CAVzsApX5zQxH8r7WKPyiLr2qSxfMEn5DQ799xI7fUn2TnwryUxC5hlFxUpJfuCVEO6hxaRAWKc5a0IDVNqycyzI9RF6kTVHK8WGajNyohCgomHjW4OT0wUODaF7HvsVmV7umLZ8pLjXb4rgF8tgPEEQg0qc2TaP+rBTmyrhpM54ZwLSebFVlA/SWnG8df+psTpBIuES60xkr2nSJr5BfLA0VOYMhfEt1clKs4xLoYwt1xV1tbzhPlK+i9n4/H6UTDFWgglMw98PqmldPS1MyWI0VRw3lVZUIqXjYWjSb++fiQKpU8UuJPs5UXLp6Bsb9+FT/UBx8MuH2MSFA/fcEZ7wtaUyq4/mqpyS/mfzKtVmGnDuJ9IGgAWEmReGHVHCSsGZ0sKeWzLI4/Tm2z128IL7nr0gMzGjDYAjhMxCNq0Zmf41/TrJYoTFbIKIf6NdLg00vOXfYvhOJXVMY50JbCReCYIfLsDA1/9kKsHW/Qy+ElXGyYQLCWoplLZtwSPURl2tENAiwvE//ipCrP6OIjZF7sMqnGyBRWmWg3ntR0vUBLicuxjbWvkZAgHjibEKuMQRO8o136Y76w5AKpYNAcYSBQuRLSKIxc+lUhT9gJ41kgBuQrglQJeZ4oiYoGx4JQ6Wxxdbrq/DOwsO5cVIUezzKCdfeW+gF21B8=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR01MB4973.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(396003)(376002)(136003)(39850400004)(451199018)(2906002)(86362001)(83380400001)(2616005)(38100700002)(38350700002)(5660300002)(66476007)(110136005)(66946007)(8676002)(66556008)(316002)(8936002)(4326008)(41300700001)(1076003)(6506007)(6512007)(186003)(107886003)(6666004)(26005)(478600001)(52116002)(6486002)(449214003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?vtp+gVxTA/yFoc4GfgSDTPqR0R/SZ+P80OXrB7YK6Fy/rtxn2lXXLoiHjPk3?=
 =?us-ascii?Q?7nyWV8FcnKfui3aivjA3EFWg88jCKqN92pUpIJ+Fe1RhNeqFJn0pq1yu9nOR?=
 =?us-ascii?Q?OCfMR6LnIsUFV/9b0DTGVTBjShFjE8ZIn+7ET6zvi7sUQBwYw2Yz8hOuqK13?=
 =?us-ascii?Q?xrSVscfhPW+EF6PoyULiDUC2kADd5Pv26Fk4kRpCnimvh2BR0koxYAOnqVYG?=
 =?us-ascii?Q?yjFAPADaZuFrYb476rCFh3KehqGxXJkWl7kdgOjx3/EzZ72feZdJQqIclZ/9?=
 =?us-ascii?Q?se7zuiHZgJuvx/GeOctt++yF/GyE+ZCMNvTfK5B3HRoDOluSWq5U6KW178rO?=
 =?us-ascii?Q?fc3wvxeioB6BbSvXLZDbOyEE6P6ChE9gsanssUHvgkhyr1zFs+2S2Yt01mP/?=
 =?us-ascii?Q?sGjGROa6RXFO77GDDlN5IR6GXLlKWNBxtLf9i7ebojZkjtAbnooZ7RNQIOhi?=
 =?us-ascii?Q?pxowAnz54QBNK9Jjv/vo8sqMx8bBMugSgNsk6DPK9GoQNn1/M9qHrXZ0Fin5?=
 =?us-ascii?Q?Wn9X1EZC0HjcAvPJhH5jE/7iq7NGv2EC6yBblcjwPv6o7DWYLDfHR5UmQkHW?=
 =?us-ascii?Q?sYqCGF3urPja2RYxJnFhot8e/3iRWAmXEQls3TM9LrHV49cOaQzw1Qr2pxVL?=
 =?us-ascii?Q?8/OHraGKAbo99htPJG6+uGMGmo0nJbn/MckZAyFOp2i25TR34wOY2M1sv7FE?=
 =?us-ascii?Q?jVaBvdIspZVJWmHBMkqgY5qKqzj4ay8hYVASOmmlQFkffeavyshay349uDho?=
 =?us-ascii?Q?u8LgbuxgriU2QVTItsuyTQVwrIL3RLOOsLL0cHq/wtWx7/x62dc27vRZk+Dn?=
 =?us-ascii?Q?nvJUZWWUxJciQEs8/cya2ZQr/8drS2x/2oWlSg4rsSAmr/DFF/WzyGrog6Sq?=
 =?us-ascii?Q?UirC8mK0rj5hfFfTaK3jWObqP5lWtS7w2l49ytJiePiWHos3RzwdWaz5IJyb?=
 =?us-ascii?Q?wJ7VYHoT2T5+2DIJ1tc6Ysc+RrpqePCbYdRv2uoWaKOYD8KBc5m7N/ggo9M9?=
 =?us-ascii?Q?fCqwS8sVQKXfhuPMeghuYW1jng6EbN4xUwol6xzHnb2xhwLnhEzpXs2dAHVk?=
 =?us-ascii?Q?l6/qsMH5sArEpysIU7ppR3Gh9QLtrsh0vDZ/ER0B2udzpISXGzI5azEv0NYD?=
 =?us-ascii?Q?0DAJqe/xQQyXsPHEbQlmE9u0Wko5i2nrUTPrNR1OmgRIygRLqLO1W25entxO?=
 =?us-ascii?Q?20EMa7+/bPZSlw5Ee7SyijryFkAo8pe52IYIE2TU9hC82KPkoKyRaf6dQpQt?=
 =?us-ascii?Q?QLS4wDu7CbDB7Qk7GOtosNFJ0Sg2+DtJVgR0fg07NfCQX3E1VkS0q5ifOHSa?=
 =?us-ascii?Q?PtPjloJ4IvKMVIzwVFFoDYRH0h1+NLcMfou35iTtY/gp65MK47JHXbW+cXVu?=
 =?us-ascii?Q?Dr+QzIDbOCtDEqPBeXX0MyKMfci0zj286NZhr3T2Nfp1A2wK7f92Ccq3+N5B?=
 =?us-ascii?Q?Rv3XYpynmuibpkgbIcT5kO9FpZACb4/Jxf1wIoxZmiubAzx1CE22qfO5npw8?=
 =?us-ascii?Q?0+g7V2TRUxq4PksYexfIiZqTBVeddotCw5S+ZuGz50jFc+4ymU2NYYzk66MA?=
 =?us-ascii?Q?rInUPwPRNNcg4y4gqC/Bk3PJRkmhfjpV1cvGlCFgzqRCiIvA5mwJacUt6MXw?=
 =?us-ascii?Q?HPtpOzq3wjW9vhygBPlEjR4=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b65e0dbe-d525-4d94-344e-08db10d0c76d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4973.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 10:21:49.0778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ItK21EG0epD1BFj8vT/rgg1O2wQC9azQxgsXwqxoet+bm/0I0oH5GeS4nPuOxFfHs8EkM7zrU5p66SgOspWsB2N2QgyvHba2mzvGkqgT/3X/y9QZUG+cfuHOx4UJUfFS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB5143
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
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Support the mac3 (RGMII4) as an NC-SI stack instead of an MDIO PHY.

The OCP slot #0 and OCP slot #1 use a common the BMC_NCSI signal,
so we use only one of them at the same time. The OCP slot #0 will
be enabled by PCA9539's setting by default.

Also, enable the OCP Auxiliary Power during booting.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
 .../boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 37 ++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
index 4b91600eaf62..e8a6b1f08d6a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
@@ -251,6 +251,14 @@
 	pinctrl-0 = <&pinctrl_rgmii1_default>;
 };
 
+&mac3 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii4_default>;
+	clock-names = "MACCLK", "RCLK";
+	use-ncsi;
+};
+
 &fmc {
 	status = "okay";
 	flash@0 {
@@ -439,6 +447,26 @@
 	status = "okay";
 };
 
+&i2c8 {
+	status = "okay";
+
+	pca9539@77 {
+		compatible = "nxp,pca9539";
+		reg = <0x77>;
+		gpio-controller;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#gpio-cells = <2>;
+
+		bmc-ocp0-en-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_LOW>;
+			output-high;
+			line-name = "bmc-ocp0-en-n";
+		};
+	};
+};
+
 &i2c9 {
 	status = "okay";
 };
@@ -530,13 +558,20 @@
 	/*V0-V7*/	"s0-hightemp-n","s0-fault-alert","s0-sys-auth-failure-n",
 			"host0-reboot-ack-n","host0-ready","host0-shd-req-n",
 			"host0-shd-ack-n","s0-overtemp-n",
-	/*W0-W7*/	"ocp-aux-pwren","ocp-main-pwren","ocp-pgood","",
+	/*W0-W7*/	"","ocp-main-pwren","ocp-pgood","",
 			"bmc-ok","bmc-ready","spi0-program-sel","spi0-backup-sel",
 	/*X0-X7*/	"i2c-backup-sel","s1-fault-alert","s1-fw-boot-ok",
 			"s1-hightemp-n","s0-spi-auth-fail-n","s1-sys-auth-failure-n",
 			"s1-overtemp-n","s1-spi-auth-fail-n",
 	/*Y0-Y7*/	"","","","","","","","host0-special-boot",
 	/*Z0-Z7*/	"reset-button","ps0-pgood","ps1-pgood","","","","","";
+
+	ocp-aux-pwren-hog {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(W, 0) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "ocp-aux-pwren";
+	};
 };
 
 &gpio1 {
-- 
2.17.1

