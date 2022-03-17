Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9F34DBFF4
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 08:06:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJyq44gHcz30KB
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 18:06:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=iJyIynqZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::71a;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=howard_chiu@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=iJyIynqZ; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2071a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::71a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJy2q4d6Jz2xWc
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 17:31:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A4Csvgf3bap/CSS26cDd26ZsPAlquJ8V5sz7nAcyEdm3U7+KjWIGiR2a2zYqhryYjxsS7gSbTbLFv5s+eVYtaRz1maR8WV7gMUMFw1dCCAfXxFc3WfpkJf3v77JTM76eKFtZbXbg/GzuVz+FzDaRaFlWjOFVQWo8Mlfa+GS7FZo2h4TPXyaoOXGHzujWaQOe/LaOOVihW/rYGXbQD2wDdhnyDG6yvBINf/5RwVAB6dDbV0mfWvqft8AwsDtINLjfRe8zu729FgmbSaSz8bSGQw6zqurLwwZS42fZyXdlvGyjmL1G75FeIEbz13uCBFmxH7FPN8upa64ofy3uGgk59g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Yl+qvnafJGlGj7zlFXcqfJaaGoF2nUtByq6ZmOfg6A=;
 b=oZNJGURSLGHeYaEjaFMW1LepWhQWNltUdUDiTsPsHT+lfpbw/th3ZWLGXK6RNA/uX6pIGBXSY7nxW25Dzo3k3/HGezEh9fXR2COwx8ntSw9z/md2TUtMbCEdnqX86WM2JV5kfZHQU/MnYLT/Y9YYmMueMCTWJdrwdQCUNb+WPvZ+L1M9jKTSkvvszEiLCOzlGRSttEJhAfLviT7sOI60GjR4z0V/RTfICT5zWGe4eFCVKAFW8sIDWhxBMUMRWfdtvaUVogW2EvtBIiEow9xyTCFktwuyZlttpfTAnoRlaAxhtwCizzPc28dSRnV/JmeoJtPPnMK2ir/hS2FMASFRFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Yl+qvnafJGlGj7zlFXcqfJaaGoF2nUtByq6ZmOfg6A=;
 b=iJyIynqZ8CtnYjXxuBAzvG/Rn53DqY2tjgUhIqmh+rLyhBpG4clAAtuvCPTL4b1/f/SEhJ3xItGJbf9ce7u7EdqoXdBTG4voaBkNYsHeEreFobGbJEnG2oCr1lTkbfBuOD6Gp2iW+P/oAU709HCV3fI3yukthYkmP8zjgyH4t+0rUjEEWz1yviOwRmlYt/8mV3UUB2C+pVGh2FVchf5joU8fqMGprvA0QvIfUhQEfR2erRV0/v4gIbsyh+3Z2P11ohvZMdBHvOpwaSmxnvlFDLskAp3Sz8y/GLewmNY5BT5Xno1702C5VJ72YLfBHH6H5J25UrjnUO8N3KkSAckRyA==
Received: from SG2PR06MB2315.apcprd06.prod.outlook.com (2603:1096:4:b::19) by
 HK0PR06MB2100.apcprd06.prod.outlook.com (2603:1096:203:49::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.24; Thu, 17 Mar 2022 06:30:49 +0000
Received: from SG2PR06MB2315.apcprd06.prod.outlook.com
 ([fe80::ac36:fcaf:45dc:f830]) by SG2PR06MB2315.apcprd06.prod.outlook.com
 ([fe80::ac36:fcaf:45dc:f830%6]) with mapi id 15.20.5061.026; Thu, 17 Mar 2022
 06:30:49 +0000
From: Howard Chiu <howard_chiu@aspeedtech.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "joel@jms.id.au"
 <joel@jms.id.au>
Subject: [PATCH linux dev-5.15] ARM: dts: aspeed: ast2600-evb: Enable RX delay
 on MAC0/MAC1
Thread-Topic: [PATCH linux dev-5.15] ARM: dts: aspeed: ast2600-evb: Enable RX
 delay on MAC0/MAC1
Thread-Index: Adg5yIom2fJaweEkRDCXav6Ed9+Pkw==
Date: Thu, 17 Mar 2022 06:30:48 +0000
Message-ID: <SG2PR06MB23152A66322ADC7B9CDFF895E6129@SG2PR06MB2315.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 675eee82-4552-4241-88b7-08da07dfad50
x-ms-traffictypediagnostic: HK0PR06MB2100:EE_
x-microsoft-antispam-prvs: <HK0PR06MB2100A817A846591C5A3C0B44E6129@HK0PR06MB2100.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MYWcCx5xVWVBtGHAjVucIn1eujtWtpgZ6eyb/rc5swIGrlwl1IwwkGKCJ4NJg9qIoL2kXHA3Zblpt5Oz/HlIOfhBoazIhoj829yHF3H1i0OiVy/FO+CNv9LN9mKxDsjBq2PdIUj7cfY4Jo/Ru4HKemIdtwG9AbfLECCZflavzYcpDy+Kr4/WHouGo+G4g+Zu8WxVQVtfVrWPgMiUzDSspTlmjxlTW0dptUDyU/CyP/p6V3isuZWjjiNhatVzJ7DqzNzyqQFmVgNvdxub3cr+5a2DV3zt5+WQns6S/Gw5ixrGBM14z/FZ1rDaI82jkw+B2bUIe5BNpNkYm1jGX6+cgYn6qgblLMpwNWDRAekxwjZs/td4FPJfGh+lpelblyYZcFjjflrT29c9Q5aH2AJIzngjLfpwhF98kCDWrKVJAb2hN7E+2jF+rFyDz9jgjFlUCcwFEoBZoKhXNOXalnSz+ga5DJ8SsNkZHAK/pc5bTFqxb8VRukKGR8TCap9bHu91ukAtbr4ZuzgQ/kw5nsuOVde7gyVlAPYfk+Z8aLU/Fepmp1+3pOffi/uxOrvw9LyZI7XYggpwhoEVkuoI+RZvZqwrbwr7V4WT27LMHZRxRBY5VE7C4QlQLrwSGpusuSvhtj349rFHIY4s80Yda2fKxMfXwdVDxMK6U4jDAeup/GEFn0oy0PQBOpm8hHwMoN3w+Sep4O+L8qG7yuJFCsEogQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB2315.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(39840400004)(136003)(346002)(376002)(396003)(366004)(55016003)(52536014)(186003)(107886003)(26005)(316002)(33656002)(122000001)(38100700002)(86362001)(38070700005)(83380400001)(6506007)(71200400001)(7696005)(9686003)(110136005)(8676002)(5660300002)(508600001)(4326008)(66446008)(66476007)(66946007)(64756008)(76116006)(66556008)(8936002)(2906002)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NVIOh7ZPm79PxtVlS2bWXaU/A6XeKrTx1bNgZMo4PO9h7UpPUVVdFKwt4nhx?=
 =?us-ascii?Q?BSW61N3TYYcMUMq3asFHGmr7n+R3Fc0+SkWBoQsSwGX+jBbaWVrk9QjviHUf?=
 =?us-ascii?Q?gxmdxPBSi+awlGA1sdwmcLw3/6s/8Bn1MtPzOKg6Yqr7kMlT2JiYqBjXrNdr?=
 =?us-ascii?Q?PRgSAhHHl13Qet2geGaqJWxI7s18vA+7vqsLzhIw8r9xU3n/v1e3FtdnB80q?=
 =?us-ascii?Q?MWJz7+7ddXn4n9W5NIqejfpcadJQ3cMAHcxYglr5WbrwTRHV5VjJsqRTW/HN?=
 =?us-ascii?Q?8km9x2OBXTtTTUFDHKfYyGnHPbaITvtx5b+9IiBiXl/AsIUWn8HQI260tj7O?=
 =?us-ascii?Q?W8VcSV7grutYWNNlBklf6I6U0Yh85DAB8ZxJtLBUUaDdr4WmqYa+e3F5QqZ4?=
 =?us-ascii?Q?8cCX/qo5xENjwfsWIpKnCkoA962pLO8gfraZlLUJ2KtcxYLVV0oShWFVoHnB?=
 =?us-ascii?Q?QShq9sKQ8RgbrpG9rXThhMp/gFjCe8boP7WV0K5Awg0g+nhxXsVZIDXx0iVe?=
 =?us-ascii?Q?MEqhpQlVcCGN381ggiOs7ba0srbPFdGGtgWR9mL7cy0OvAmqerTH0zyEJ+iC?=
 =?us-ascii?Q?1EVD0m34F2jV6VPbBh51VlzrMcNqXYvkOOOlhYqKu34fXwR+Q7UHmY3oTBMe?=
 =?us-ascii?Q?hbhGuwYJhl9mzgztUMX+sad4XMJB0RQy/wGDuQP432i2d6G4IhNfO4ikyoha?=
 =?us-ascii?Q?9l1h5ZGMVJPNmCVvZbk4qmdBA80A5u4+YtDi8MoekIxDAS7PonjtX5KOv0Mr?=
 =?us-ascii?Q?+QOtgl2iDSTJSR7eUjPHqffs5YS+kyXBKmI1xTRSfIWr94UUOz9CVbuIstQA?=
 =?us-ascii?Q?k/ROuqT25QZDfurrWZAzCSvgtRV+RBgJ+RNJwyH/6oamta1AqgJGyqoIp3R5?=
 =?us-ascii?Q?Gjhmk/tc9CQaVJe3PZe1LH1PMCgDsH4+3scrVAfidJmdIbICWPqWUF1OHN7T?=
 =?us-ascii?Q?o1G+teHJpNz4AklDR5ir/R9LC7FAFQKpwgvZ+NGlAtYMEa7+Hvhq+TcqAzKw?=
 =?us-ascii?Q?O8afMgt4w2JQ5vopVs45Igc3bAVN0927q9JxKe1PZ7FK3zsXap8pVOzolhMO?=
 =?us-ascii?Q?b3gCKtTgQxp2psfU9+0NwcjWTZgl7WTZE0G97BWlIybajT/jMLh+SIkEWxq0?=
 =?us-ascii?Q?/a9300EaaGdFOR0TtH8Lv/cz/2YAHIwzZWqgBL9K3sWqdR6X/Bsoq/ufipOG?=
 =?us-ascii?Q?0he9VmY5iwMiQwIkZPUQNRNJPIMb4Ko0fUaTdMqXunxGH0d7Ay59D5cu5t6+?=
 =?us-ascii?Q?EYc8KLC9DRpMxPKBkcZL1VeJIYLkDZtHXIven/SROOB1VhWMpmaF6m7ZoErE?=
 =?us-ascii?Q?8LLEw260A2AplAAQlnl/fvdZchMPfTDevaap0AWFdWkSY10yQs0bcCK++zZp?=
 =?us-ascii?Q?DqjtUbHHT4kP5/NxEynJ9RZO/Ks0YP7L63/W3uE149zMVgGfAGNnEZQQgOSW?=
 =?us-ascii?Q?A8JP6CPRykmYlgD0jzMliA+GHEOeLdZ7WX/6QYKOW9h0OyloSfh8wA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB2315.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 675eee82-4552-4241-88b7-08da07dfad50
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2022 06:30:48.9903 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /xUGrvmcIgkBjZFC38BBMRWRiJeYFY9p+cz+hDWc4j7vZOx56UB8e9QSc4XKA694iQFsKHU7WzKCLVLGxYjhZxfyckRc+SFGyxbGbPcvgJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2100
X-Mailman-Approved-At: Thu, 17 Mar 2022 18:05:47 +1100
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
Cc: Troy Lee <troy_lee@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The property 'phy-mode' on ast2600 mac0 and mac1 is recommended to set to '=
rgmii-rxid'
which enables the RX interface delay from the PHY chip.
Refer page 45 of SDK User Guide v08.00

Signed-off-by: Howard Chiu <howard_chiu@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed-ast2600-evb.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/a=
speed-ast2600-evb.dts
index a6382082d38c..9a1979541d2d 100644
--- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
@@ -116,7 +116,7 @@ ethphy3: ethernet-phy@0 {
 &mac0 {
 	status =3D "okay";
=20
-	phy-mode =3D "rgmii";
+	phy-mode =3D "rgmii-rxid";
 	phy-handle =3D <&ethphy0>;
=20
 	pinctrl-names =3D "default";
@@ -127,7 +127,7 @@ &mac0 {
 &mac1 {
 	status =3D "okay";
=20
-	phy-mode =3D "rgmii";
+	phy-mode =3D "rgmii-rxid";
 	phy-handle =3D <&ethphy1>;
=20
 	pinctrl-names =3D "default";
--=20
2.25.1

