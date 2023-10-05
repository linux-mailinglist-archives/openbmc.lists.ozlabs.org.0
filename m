Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAAC7B9A9D
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 06:04:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=BAK6BAoM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1HxV1nZHz3vbv
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 15:04:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=BAK6BAoM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::716; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20716.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::716])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1Hmt1xZkz3cVy;
	Thu,  5 Oct 2023 14:56:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqwY4uTEL9brdAlqm/A7WGHGR9ynQTgfcS4IoK54mGrt1hWu2qbIUHtCAyix77gw7xn+JZJggYBr05jhhZTqC0Vqw/zO6jcH83/cfWU6HosGsXhYB/aPhUEay2MnMaD/VMnvNj96JLgsH1tU2azUhewWjbJw3zFcLCb7N+4CbODmk2PYfUqQ9T0mr8nWYqNf+HTT1TNi1c+7rgFpvbZiL4W311l8GI64cIO/nO+bG0yEaL1PPNGwos8Yjwh3TccI0+FS0SD3tabUQQ4m+uk4JlNEi3SggiZ1Fn+ArZQvUyOsukf6y4xugcS+mH1nctnjTL7Xso9alPyLAD2xIRnCLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScHazmtWs1dBZVqysRXeNBkQ/bWLkqxG903XHakVtEo=;
 b=VjT8EaWxLeqjRd1Ta0Q2fg96ne5dYL5rz58FYV2103B7tNKbLqcmTJSAq1yGbcSXqgJZ0W0sRr5Tjq7yMVSIAsdaBRHZjrSo0fDfGwrCnkgkuUQeiGaFKshCCVyFthOaLcl91/VAJbg5LkICUIDXCpWy1RKmoOhLUlLAkV2xjkaZArPjnJy7IGaGYjwb6lvj/QXWlI1NTuaPDYUpe6vmbBcNM96GhbIj0r5897ffV+3CjEnp32/tWkKtSB+lI6PeWAQfjH3EMVtowrDvAoUTqQ3ZTJXgx3U+nNo8Hfu0z0TgAww4OmDesuUeO87wcTXTtRgwJTpW7caGPt6VUHz1Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScHazmtWs1dBZVqysRXeNBkQ/bWLkqxG903XHakVtEo=;
 b=BAK6BAoMECXEVovnBS/UKAa/YxTphjeHNB4SXhsojcvuqmZiwMStaYWKWhpzHAl8FfROvb9QlOMqQNG0xRtsxV/ImjbEEm4Rh1LOhYAjqXwQREG5YWbcOxi/C9cQI9/Z6+oM64P6gbsHGTgeNFd+2vk/cGfHFGi6C8HK/jn44KE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DS0PR01MB8010.prod.exchangelabs.com (2603:10b6:8:151::19) by
 BL1PR01MB7649.prod.exchangelabs.com (2603:10b6:208:394::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.25; Thu, 5 Oct 2023 03:56:41 +0000
Received: from DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::6a3d:61d7:133b:9eb9]) by DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::6a3d:61d7:133b:9eb9%4]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 03:56:41 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] ARM: dts: aspeed: mtmitchell: Add I2C NVMe alias port
Date: Thu,  5 Oct 2023 10:55:25 +0700
Message-Id: <20231005035525.19036-8-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231005035525.19036-1-chanh@os.amperecomputing.com>
References: <20231005035525.19036-1-chanh@os.amperecomputing.com>
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::28)
 To DS0PR01MB8010.prod.exchangelabs.com (2603:10b6:8:151::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR01MB8010:EE_|BL1PR01MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ba0df36-14fe-44db-a836-08dbc557155a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	1ey8IaZ1owf+YerlyWMsrHiG7YLqeUJBJlpbZd/ckX1EyPC0FvgOKqBr/sqbrvj+CgFvPvFwA/Kmzcz7q8GZspIAl9KVe78O4utxnmyx5eczIOtITtw49EEDsFpAKx/1sXhIzuYf+i6aAhKXcvgTzUFe92p+6Kr2xmMbsaFVycoYbG+/YtWkan+wL7ZcIYZ3JVX/VAKsq6hxa8PUnoVKKQf0Eds2ZgfJww80AUWbnSCTFj39mF4t78vDnoaEiGgkzDjTB4hgg2nD7frwtC46KY/z2Qzxkly4UBE5WxaqCYEeEazZh+l1sBuWAI//DjOUfFHkUd8k4XIfOY1Ct5JmhwY3z9lXdF/gLWWef/QpZj+kLM9ZyIFJJJoaUL4TibPwNTWXgkCiTh11VsuELhqmXGIxmGWtJOSDgsVd7Wbg1CwlWfc8kQmG2gWeczSbFI7poZTfWkPmvEX5WnPhFVY8NHA+XokCgyqluRoEgKiUSar3gZs+xqy4mQPRA2oCTrci212YmhembutJ2z7N5KMfTn4pOEE/jHHYIKrdsgmOUy1Sc6p17N5T8IXDFyolZoRHLn0wLNtnlLdv/JCGcXDx6YnrrUCbKAQqnK+yTQbJUAF8OkQno6bF4+AkllzyFyW2
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR01MB8010.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39850400004)(396003)(346002)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(38350700002)(38100700002)(6666004)(478600001)(6512007)(921005)(6486002)(6506007)(52116002)(7416002)(86362001)(8676002)(4326008)(8936002)(5660300002)(26005)(316002)(41300700001)(66946007)(66556008)(66476007)(2906002)(110136005)(1076003)(107886003)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?h/7v0AF9Fy+4Bp8R1wE6KbayqeACDD6KgnShhIMkYpEghLSPoHcp5zD9snDM?=
 =?us-ascii?Q?8USiiUJR93CnVmqjFdZG4E6wreVOPvx+eA46IKPFlZ8WkkJEzGAN4wBHcw1l?=
 =?us-ascii?Q?rb2Y2eSMukvg1rRCJR1QTUZ6ERCrP/5ujUUcWWTGbxvYZCGE3+8K59Q7mX14?=
 =?us-ascii?Q?hxgpxhtl4ayg/cNtsSquJ/xkAjx0HjN38lWOCkLCFy8NS5JMS4NMOR8nGelj?=
 =?us-ascii?Q?xRjaACL25l3ApLFyaD1ueJFq4QCVaTxIvcjeEOtclueOw2k51Pnr+hHfbaJ6?=
 =?us-ascii?Q?bF/XyI/1pO24IewryS7Xxn2Pb5boplKE9xg38ttGMJ52XqGVc+Ekk1+HcYuA?=
 =?us-ascii?Q?QQdF2XROjwRzNOooOJy6UrjyLMmm0UO9cMKacaetmaOcLj+o/ZDw4QELHKqK?=
 =?us-ascii?Q?5AtaQLdwhP+D6UUnkBSv7lnyWpt3ztmOnQcjaRKEmWOHWHJYe3Gvx7W3PFkS?=
 =?us-ascii?Q?X83ev6Rvcm8Eg48m9jq2LGAH74eLXm0pkvxQib6akTXqbsQVfy2CirCmtARO?=
 =?us-ascii?Q?ON1AIQDFFjutJ4LX/rS8CA0a83Ay2sAw3/oDQ8B7i8Ba0bTJdrfo9IxkWtnI?=
 =?us-ascii?Q?q1dUnLNGCXn1ECoxqG4fgP6MgnhSek3U7ocSfem/gCV7EYtU6T7JG3jRpTDZ?=
 =?us-ascii?Q?LirPvN52OQ0xvmWY6VX5b+Mlya8GhOWdracPWydEhgQInZxNXVQmX+I03BFf?=
 =?us-ascii?Q?vliErxuCqA+b3xBGMkRJCjjC37LRCfQBpDMwOc66JQKaTVhPk8S8BcGuJKLz?=
 =?us-ascii?Q?VCNfNoRBN6Ku3pn4NDD0EVwE7/SkqXuXVJmFnnu1lAQWUPw+pRyQQZ4/dQlC?=
 =?us-ascii?Q?NQKdJD9ASUv9B6xvnYT3EvHEkphTuplGBNOvgptlSepsDpjoBKC/cIm2ip1A?=
 =?us-ascii?Q?4LS2HhB8yBj83FkP1nN1LR9YrGNnqc5t4AtBDzCQJv9hOizkfR2gzlWGwyPW?=
 =?us-ascii?Q?EdDYMaqzyl2tyaKTNw5yL7gAadZHQq+VBmPVm29gUgTnJv7EEUO00iOqPvOg?=
 =?us-ascii?Q?gpH2vtl+/B3GJHww/KDdo1UAW54sPu/a11oq3Nt9W/O0SxKTjKanFN5JIKEO?=
 =?us-ascii?Q?kmiFYXieWFnMzL+yiwsl+UHg4WHlccKW1rgN7P8iRWk2qrCL7rnRfP4wlIhX?=
 =?us-ascii?Q?XmeW3m69ZiTTIrYJwhNHZBhKGThdidJek5qQWhYEYtz0uuUgnzUlHvpPowvc?=
 =?us-ascii?Q?wcs6gXVf6XtIQobWQy82dmQoufPOifbHvuM2I1u2R+kgkWonTNJuggZ7gAvo?=
 =?us-ascii?Q?gbsa39Ldu7LRAJw0+3H0JHWWbhyyL3ObLsW+ZHZaaNdm1lwlaPivgRFloiC6?=
 =?us-ascii?Q?H4mWqdAauYumveVBjZ2yJFhabNEyoCLjjJHgD5NZrWrZOjIVWQDeaU99p9d8?=
 =?us-ascii?Q?T8U5XFICaI+Wo/qWY8nsOrXYMBkIdno9dUKXo42bZVhDWRdmWMNY1aPlBwBT?=
 =?us-ascii?Q?CvmTo2vBOotNXO8TqriXlFd3ihok/SUIxPqiME1zXiYbKxEYwp+IFPfkHHOs?=
 =?us-ascii?Q?PwjYC4RuDCLUpmlvq8EOTTcVh2jJV00aw5oQCl7tCf8TkUN6ckO7EdzQIgYs?=
 =?us-ascii?Q?kyTXe29mPEeKQjombxGgmm4HyPVeW4q0f8+eVmCYw0OEYTJSxum0RHYD6NQR?=
 =?us-ascii?Q?pC9HsDh9idJeNyyYYnwRZpA=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ba0df36-14fe-44db-a836-08dbc557155a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR01MB8010.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 03:56:41.6890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YM3Nc8A7B4QrvzifuJW+oBBGpH1hynDt8P67kAlzcBT/DPOiOuZkP49EZn6OHnUFNUL5dG+d9zWqBUKV6dr9duKR12MU9WukaOw7+0YY5pLheTZ+bwkz99G5OQYvAYA+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR01MB7649
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

Adds the I2C alias ports to each NVMe drive via the
backplane card.

Besides that, it also adds the eeprom and temperature sensor
on the backplane card.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
 .../aspeed/aspeed-bmc-ampere-mtmitchell.dts   | 267 ++++++++++++++++++
 1 file changed, 267 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
index eb8d5e367276..1f70e3e4e83b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
@@ -14,6 +14,42 @@
 	aliases {
 		serial7 = &uart8;
 		serial8 = &uart9;
+
+		/*
+		 *  I2C NVMe alias port
+		 */
+		i2c100 = &backplane_0;
+		i2c48 = &nvmeslot_0;
+		i2c49 = &nvmeslot_1;
+		i2c50 = &nvmeslot_2;
+		i2c51 = &nvmeslot_3;
+		i2c52 = &nvmeslot_4;
+		i2c53 = &nvmeslot_5;
+		i2c54 = &nvmeslot_6;
+		i2c55 = &nvmeslot_7;
+
+		i2c101 = &backplane_1;
+		i2c56 = &nvmeslot_8;
+		i2c57 = &nvmeslot_9;
+		i2c58 = &nvmeslot_10;
+		i2c59 = &nvmeslot_11;
+		i2c60 = &nvmeslot_12;
+		i2c61 = &nvmeslot_13;
+		i2c62 = &nvmeslot_14;
+		i2c63 = &nvmeslot_15;
+
+		i2c102 = &backplane_2;
+		i2c64 = &nvmeslot_16;
+		i2c65 = &nvmeslot_17;
+		i2c66 = &nvmeslot_18;
+		i2c67 = &nvmeslot_19;
+		i2c68 = &nvmeslot_20;
+		i2c69 = &nvmeslot_21;
+		i2c70 = &nvmeslot_22;
+		i2c71 = &nvmeslot_23;
+
+		i2c80 = &nvme_m2_0;
+		i2c81 = &nvme_m2_1;
 	};
 
 	chosen {
@@ -534,6 +570,237 @@
 
 &i2c9 {
 	status = "okay";
+	i2c-mux@70 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+		i2c-mux-idle-disconnect;
+
+		backplane_1: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+				pagesize = <32>;
+			};
+
+			i2c-mux@71 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x71>;
+				i2c-mux-idle-disconnect;
+
+				nvmeslot_8: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x0>;
+				};
+				nvmeslot_9: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x1>;
+				};
+				nvmeslot_10: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x2>;
+				};
+				nvmeslot_11: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x3>;
+				};
+				nvmeslot_12: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x4>;
+				};
+				nvmeslot_13: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x5>;
+				};
+				nvmeslot_14: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x6>;
+				};
+				nvmeslot_15: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x7>;
+				};
+			};
+
+			tmp432@4c {
+				compatible = "ti,tmp75";
+				reg = <0x4c>;
+			};
+		};
+
+		backplane_2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x2>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+				pagesize = <32>;
+			};
+
+			i2c-mux@71 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x71>;
+				i2c-mux-idle-disconnect;
+
+				nvmeslot_16: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x0>;
+				};
+				nvmeslot_17: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x1>;
+				};
+				nvmeslot_18: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x2>;
+				};
+				nvmeslot_19: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x3>;
+				};
+				nvmeslot_20: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x4>;
+				};
+				nvmeslot_21: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x5>;
+				};
+				nvmeslot_22: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x6>;
+				};
+				nvmeslot_23: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x7>;
+				};
+			};
+
+			tmp432@4c {
+				compatible = "ti,tmp75";
+				reg = <0x4c>;
+			};
+		};
+
+		backplane_0: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x4>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+				pagesize = <32>;
+			};
+
+			i2c-mux@71 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x71>;
+				i2c-mux-idle-disconnect;
+
+				nvmeslot_0: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x0>;
+				};
+				nvmeslot_1: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x1>;
+				};
+				nvmeslot_2: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x2>;
+				};
+				nvmeslot_3: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x3>;
+				};
+				nvmeslot_4: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x4>;
+				};
+				nvmeslot_5: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x5>;
+				};
+				nvmeslot_6: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x6>;
+				};
+				nvmeslot_7: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x7>;
+				};
+			};
+
+			tmp432@4c {
+				compatible = "ti,tmp75";
+				reg = <0x4c>;
+			};
+		};
+
+		i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x7>;
+
+			i2c-mux@71 {
+				compatible = "nxp,pca9546";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x71>;
+				i2c-mux-idle-disconnect;
+
+				nvme_m2_0: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x0>;
+				};
+
+				nvme_m2_1: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x1>;
+				};
+			};
+		};
+	};
 };
 
 &i2c11 {
-- 
2.17.1

