Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 835F89489F4
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2024 09:20:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=hpPSFCJ9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WdPpy3B7Fz3ck2
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2024 17:20:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=hpPSFCJ9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c000::1; helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c000::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WdPn86Yk1z3cnv;
	Tue,  6 Aug 2024 17:19:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MAs7fNWLJ9WmNYovujCgwwPBG3UbVSUgtsSZkCLocWX1kscAgsHbm4+oA3E2l5xA0qfMHT0DvMUOaiFN1IfgQKlpOZfQN79T17J8Ane5VX97WK2J6I1r4WlE92N0iG8pE5VsxVuIjz1Hbgz4wtIWig2pvtbsmhMuGPwkEveDrAZoicLhUWyQj7UTSIUpaDs1nS3G/WkUqEyN5cXZqGyEJek0sBEpW0kanBvs79Qr3f3UV+gv0nFH++AOqf6BpoTKdJ+Yo2GTuSf4mJSEzIAjBO6ncaL4XEUQyvjLAt2/9qABqQmhtHtR0k9AhHn/FiMOrD5YLUsaLLBk9+l53eulFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IybX/xWZctyuJQSm4ttyCDf0Qo3/yZxSsRESn2e071Y=;
 b=nqloVIgwP6lqWit+7SWx5FvmiBxfCx7iBW/2wezLTKH3M/17rlD0W0rkSWO3bElNd6tZDaxRrjjvToe4mygS6OV4h5CXielDfbLbxSKDyvV6AAVyqHt4u2/aYS4/lu3ozbMbr00ZXVJsUklvsLt7B3g5nHVbFkQczjQZ0x3D9JSlKWY2sUP78G9j+EsZwl1OKzYJzLAIao3zS5x20B63XT6BPa//ac1bsLhUwmoAB5REoool6UU2+NPdyxZWXxcaJl0C2oHkLIq9e6tdibEGlSRGdMD17CcFpCbDvTBmpPFhcmmHJ4f4QjnT2XDjBJVQUzwBaXbqGCMBeVMeyw+cyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IybX/xWZctyuJQSm4ttyCDf0Qo3/yZxSsRESn2e071Y=;
 b=hpPSFCJ9eUUzoZ069lGNja2KZadA3ndOZc+haM194mBAhTdKk5MBcsI1n1byMBe+BwLeqI+JWJTD+yqljlIWHUHiG2x4nM+WHBFTz2mg6gXOwarMgamfC0xfA/orL9tYQdjpREDvngRay3JTyIbRSke3yCNddHe4oQNmNk9fGGs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 BL1PR01MB7770.prod.exchangelabs.com (2603:10b6:208:399::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.25; Tue, 6 Aug 2024 07:18:49 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 07:18:49 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH v2 1/5] ARM: dts: aspeed: mtjade, mtmitchell: Add OCP temperature sensors
Date: Tue,  6 Aug 2024 07:18:02 +0000
Message-ID: <20240806071806.1666550-2-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806071806.1666550-1-chanh@os.amperecomputing.com>
References: <20240806071806.1666550-1-chanh@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0026.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::13)
 To BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|BL1PR01MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b60d184-1fe0-4afb-fe93-08dcb5e80436
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?mqeODwpPKx9ZLRGSSudhl+2mMwW/fRugA0CyPzpyjfofrkFRW9YzPlGXdOsN?=
 =?us-ascii?Q?UcYOovBjz92sIxFp9P0gUXgRJxCaSKzhD7CClfy+mHoDFJs4FEXVug3J5ymX?=
 =?us-ascii?Q?ycnCGDbByFPUggeVzutEfOLYfayzQoUh5O2y9P5cif4WV/PDz6Kkpm8wmRPU?=
 =?us-ascii?Q?9l39c1BIXHiwvAijvwGVXKwY+79Nq8bAIeaMLvC7nMkItkEv00z3s+hBhS2x?=
 =?us-ascii?Q?cyoUzXnrJkcIM/UGXgogAqKa3NeowQWZbP2CzrgjbB6Z4/KJr7Xqk4q+CbCr?=
 =?us-ascii?Q?kHVhKsNpnTaee4z02qYaGAUVtoh4TsnUtPp1ZlyQv1RToxUCsTqQUJygEpTA?=
 =?us-ascii?Q?zckG2BEDGHUgrDozgpmP9UguNg5fEt2Y9sth7YD9RLjkqAjx98cBMtm6G58l?=
 =?us-ascii?Q?xDxb8Y9YPxnILFW1sky0Mfvt/TVZBL6iqYy7ZWZarOh3OYXdvf0zCOi9hs/k?=
 =?us-ascii?Q?KPBPnP6YW7ATaldwHnKIrPRDd38uxzmEFvCVQNeKxhnret4Oi0/b7BsS6ZwC?=
 =?us-ascii?Q?m4PTicqL9PGLvnuBMKAtMJIMNP+noCIOd/KsiOucRLdYPYKtJ9lJuTpdMyXF?=
 =?us-ascii?Q?US3Xkxp413LqN07yszo4f1/eLyJ+jrhA+Doz7XBNdrpIJWmdPNaMi6it84TO?=
 =?us-ascii?Q?OcOHD0ycJi30bkDfnKQtsvbTEGOgOHukTl8FrhNsP1cRh+n20J0S4WAm6Wv8?=
 =?us-ascii?Q?LVs3uAqKbD3kd03p7rV+brKzK72Uk2tzoNlhe3lHFPDbIWUigHpwOZ3Y7Qtb?=
 =?us-ascii?Q?3nF7lTOkPffxsObcjU+9g8sTMBbuXuqoGEqdetuIZ+QSoBSUPpkjY99BqYPx?=
 =?us-ascii?Q?IblWIzGoz81XHk69ffW+wP+HT+WD81UWvvAgtM4HvpXtbr2wfn39wvsaEm2+?=
 =?us-ascii?Q?KfgGRDlXKW/yLI8ZIhMa5iIf09KbtKwa8rHn8mbGYxoa9NzOTjbrWn6ylrPt?=
 =?us-ascii?Q?sSrCZug5tdiv4inJHd93nz0dbSU08iNhFsd0/ksKNLt1NLbRSDffS2vIZ7uL?=
 =?us-ascii?Q?wQaUdFdfKY4fLBqFfnPSZSTsbBmNIlpTjD/5rPjdMeW93RbQPvBOTsfO+BSi?=
 =?us-ascii?Q?sKM+mH8STb02TaLAVjiL51Z+4RrOQu4mYLSBvWldJRgQ0tsfg4ByMk8zWA8l?=
 =?us-ascii?Q?GLJ6/wxWHahZsLMQiLY1evdYQFeJjA5UMKvajl0zQoJLe68jzGtXdoHrVRHz?=
 =?us-ascii?Q?5f7kEn68RQlL5CH2b4R/RbcVs9YzkZICj2OybiAsQsW0Kn/JLiie605NLE2X?=
 =?us-ascii?Q?iZaFNw0EKQttqc5n9fJC8cN4r+lE44nJHsW8klFYMvkKiFh2+Kev3+GfnA+t?=
 =?us-ascii?Q?Jtscc0sCT6LoKje9etxEcW+xSfoVAM1omI+fLCPaJYVSVT+w9DN1CDzylJnt?=
 =?us-ascii?Q?z3oXrEsHVTvEA3HfalsiNgT82/LwAqnoezu85Nqpi+pUbiroZj7cpLfQkXSG?=
 =?us-ascii?Q?DLeaiwTAtiA=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?IFChm4zb9oMkfFxx/mx9Dez7LLxgLC4SWYGW+M+ijwvvkxexY7w2dE+qmrqh?=
 =?us-ascii?Q?wij20FtgrJ2BvHx/od+R8t7Yx613p/ltWKd0+wuCqG1xPQtu8NB3s3ANIeEo?=
 =?us-ascii?Q?2X8eXrBxd2gwXCM/27nVq73vKKh9VLB/BZPaoFjbLbGRc0p9mexTgcoS7/kQ?=
 =?us-ascii?Q?C1/NMKwFKYhxszZMfE7sooo04zb7oIgH3MjKJc9kjEWrPqSND1NMdZZRylRE?=
 =?us-ascii?Q?R5dBzc8iEbLRTncbKs5z6nbyHNDRXSgVY7KXdQmNAq9mfCu7N1pOUUuyJYfZ?=
 =?us-ascii?Q?fLhBUFB5cnwty8ePpVoHzgNH/UPc2aMt8z8w6DQ9fLG0upecB3bDrxcAK5cY?=
 =?us-ascii?Q?HAXHHKkkG50y8ag5UuUq9j51gJDHxT+uO+tnpoyYFvKu1K64zwX93xUnswwy?=
 =?us-ascii?Q?Tm03ibl7mDXey47PqfBXbPkqWJrsJh1C8Im15mhJG23TXl5+JfU1JAt1XvDU?=
 =?us-ascii?Q?DbmMOPLZZcKBHrSFvM91TiNOFeYHHXiMJpSTUeuPKzW57iIvXlB564gu27o1?=
 =?us-ascii?Q?OyB68PLbo2H+5mZDoO4BS43c56qHm8+5i0N8DpaTuSn68Zrt89DXmtOaUkxm?=
 =?us-ascii?Q?VfcKjGZPnxCeHQzI2XnZqA7WyeEiFq8rpLmRp4UYs0fqcjNFqUrbnkP67MmN?=
 =?us-ascii?Q?lGdK2EDzlGJHygYfhtVNay60sFSYNCk5wtNr+3SXpa6HSiSfiaMwVckhmVtU?=
 =?us-ascii?Q?4KUJfxRPnhcyq877SqBjctF0VhIK/G6ElYWKmCpxRlsApAFirF9c6aos+Rqz?=
 =?us-ascii?Q?2p4JfMxcnhoMZ+8+M/05gSwK7Bghlg3Sn2pBqTKAGFZR+zG2Vs5C6OlCmf+e?=
 =?us-ascii?Q?vElRu415qT3ajVhWEbk6rKe9IpHYBrfdQ6fba09o6KCOvjN8kIEzK++8a8eJ?=
 =?us-ascii?Q?9R2mT7PzCE5iUwQzw1rsZ+KYuBiA/QWmhDRvNHhWr0F/aHyh0Q66XChd6Smn?=
 =?us-ascii?Q?RfSS4F/ndRa4vzvZKTces0+L508xN8Nu+u+m0olbIG81YFDZUFMPcTb7Jj3I?=
 =?us-ascii?Q?wpEO3qbuI8x02+3sU5qbGCnBIF/u8JXrgPY6AcRPtEgQCr7UKXKuCfAflXCb?=
 =?us-ascii?Q?2M1sjwDB285C4bW7xP2Ld4CbJDIiKB5aySDjMickrvtYVi2VVV8XVEgjg43/?=
 =?us-ascii?Q?8RqUhTVVawJL9rz7rVJ4xNXLTs2Adrnr4IeL2q/vi1DTGBTMYOYWyyocZZqb?=
 =?us-ascii?Q?7P/kzw8JFtmRg4cz/Hfu28Jgb+PghA41T8FpsJCA5TYUqCHM5Qfodim0LVvS?=
 =?us-ascii?Q?qSOsucCOzQZH7dVgoby3fDRUVUBfAKoZIs1YM4H7rATDbyfbGr9JXmrSdOnb?=
 =?us-ascii?Q?P7vhXWPAPEMXGiDbEkJQb5M8U8jV8c7fNhFkoTF60OdxvPoGsHUJ3OeBkFaL?=
 =?us-ascii?Q?RUEGeST+jvek0q5noR9XqQJGkNhDlDoeo7YBq8C6/OypnWKoG/17CpX1o5pT?=
 =?us-ascii?Q?LzdUO/w9BbREtEFLwMw/AapVZs0DK4MYqrPIMoMXYJe4gXXp5FhRPF2WDYMG?=
 =?us-ascii?Q?ELMC+RRqqtWh7z6BN/0Ygpypc1giC/fc9UtxS2Ocvv8h/XkRjz1v1rmn3b9K?=
 =?us-ascii?Q?wQQoSXYfHckogVSGiGRK2S3g1hLTC0F8cXsldrHFdxK69o1g97nhtQKHVHUL?=
 =?us-ascii?Q?hiqfULrI7JAxkwQjjb8qRqU=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b60d184-1fe0-4afb-fe93-08dcb5e80436
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 07:18:49.1313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PospGRv1+sxRw4bGMR46V4R/aPZSfVJ7bCkwAJSGd/l8ea/pwIJYWlEnykMHC/De1Z4LhRzZLFP2sVDXF+3XudA+U7XDw3DvJzdSunJklBEJ8bzJYdydptDlhvMWVj2V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR01MB7770
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
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>, Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Define I2C alias ports from I2C Switch 0x70 at BMC I2C5.

Add the tmp421 sensors via the I2C alias ports as OCP device
temperature sensors.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
Changes in v2:
  - None
---
 .../dts/aspeed/aspeed-bmc-ampere-mtjade.dts   | 16 +++++++++++
 .../aspeed/aspeed-bmc-ampere-mtmitchell.dts   | 28 +++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts
index 8ab5f301f926..8102f41d1d15 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts
@@ -49,6 +49,11 @@ aliases {
 		 */
 		i2c80 = &nvme_m2_0;
 		i2c81 = &nvme_m2_1;
+
+		/*
+		 *  i2c bus 82 assigned to OCP slot
+		 */
+		i2c82 = &ocpslot;
 	};
 
 	chosen {
@@ -420,6 +425,17 @@ i2c-mux@70 {
 		reg = <0x70>;
 		i2c-mux-idle-disconnect;
 
+		ocpslot: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0>;
+
+			ocpslot_temp: temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
+		};
+
 		nvmeslot_0_7: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
index 3c8925034a8c..3a97e88278d5 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
@@ -15,6 +15,12 @@ aliases {
 		serial7 = &uart8;
 		serial8 = &uart9;
 
+		/*
+		 *  i2c bus 30-31 assigned to OCP slot 0-1
+		 */
+		i2c30 = &ocpslot_0;
+		i2c31 = &ocpslot_1;
+
 		/*
 		 *  I2C NVMe alias port
 		 */
@@ -515,6 +521,28 @@ i2c-mux@70 {
 		#size-cells = <0>;
 		reg = <0x70>;
 		i2c-mux-idle-disconnect;
+
+		ocpslot_0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0>;
+
+			ocpslot_0_temp: temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
+		};
+
+		ocpslot_1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x1>;
+
+			ocpslot_1_temp: temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
+		};
 	};
 };
 
-- 
2.43.0

