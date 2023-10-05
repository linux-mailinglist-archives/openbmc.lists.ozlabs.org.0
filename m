Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ACA7B9A97
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 06:02:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=lDorl9VV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1HvD1WnMz3vbc
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 15:02:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=lDorl9VV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::716; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20716.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::716])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1Hms0jHLz3cVy;
	Thu,  5 Oct 2023 14:56:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edc/2lDySQJTGyRIanNFGg/ugE1NaOO5z8sb9fAEQnWM6DeIFwyeGd9e0SmSUHTaYTMbRNIkh7DV0IKZ2pWh7Z90ks0sJ/d93SqZJU2mZjjVACgikfa/Q3STDFsSi70YU3gqDXf+sKdEP8kLZYP2x/SHueBvX1X/rwlXqbNY7Mb9akNUdLxK1cDuECdUKJqUz+bEJ4999gDLOI2M+3RC/b35VxygvXqqq4GRXYY7mvxYNcSWXSMN7ULTWmiVOhHmhSGOwFr2FN9+tCZN06MMA1E1tnjeKz9BxfiCMRmsGuOBwz5QBaCXJKI1sCGE0628LUIV0p8UutQo1/K+eIdiwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2YRvhkYxkoI28ok2JRnBvUbyFP4eWS0Ftc22vlF1y4=;
 b=Xp1QpoVbpFso8sTVcLsxUcCaxfPHb1BUVXRCF5xxiFmZm2TWzz0i8m4vbz8srsUI8PK3tFC7LN6Ti8DqpFRmFudR/vO7S9T73vCG7uih6dIHutqtEz9AlbdZjx4oaNmpg0+ryevX3Q775dbk+XCJU0baVXTdj/EPM2Ugy9uwTEBnqIacSCC63rJj5fuG4lGzHbrewKv0xa2k5nD3pbDQExwNiaX4N1Lnue9L1vTgTfKtXMO59VABjiuH08JeWYWDWPTkO72cDYB7BLiuWyAY0TMb3yE1nXFR3/FXZpOq894eLC/3SjNCAfMNVpG0ImtOJXrco0BoBpqU3NtKd2jjqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2YRvhkYxkoI28ok2JRnBvUbyFP4eWS0Ftc22vlF1y4=;
 b=lDorl9VVMEm1Syb+KCcXGcRghFPOVDOwScdcTT2gJIgCAyBRbJxxqnLaqGVxGzjHAdCXtiATU+X3L7WV/csXAdYtPZXMbgFLmCgLoymM4xl1NU0S4ufdvuezmleGSHEgigVdbKhLzb/Z6j7RDyTdp8IjfwyGjRojxFZmBo4lomo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DS0PR01MB8010.prod.exchangelabs.com (2603:10b6:8:151::19) by
 BL1PR01MB7649.prod.exchangelabs.com (2603:10b6:208:394::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.25; Thu, 5 Oct 2023 03:56:30 +0000
Received: from DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::6a3d:61d7:133b:9eb9]) by DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::6a3d:61d7:133b:9eb9%4]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 03:56:30 +0000
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
Subject: [PATCH 5/7] ARM: dts: aspeed: mtmitchell: Add inlet temperature sensor
Date: Thu,  5 Oct 2023 10:55:23 +0700
Message-Id: <20231005035525.19036-6-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231005035525.19036-1-chanh@os.amperecomputing.com>
References: <20231005035525.19036-1-chanh@os.amperecomputing.com>
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::28)
 To DS0PR01MB8010.prod.exchangelabs.com (2603:10b6:8:151::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR01MB8010:EE_|BL1PR01MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 37efcc98-6825-4c05-7d3a-08dbc5570ecc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ZtWj+YQgvO8HzTPyFWE1620RbbZKwEqtyEect+ZnWvC2Or612QfGkG9SlUBj6SZWePj0yooCBufkeh7VgzUWIe5+MLaY+neVn//Rflxxx+AiC8nKPwvquGXb8F1TfiFon1VFTZ01Qpc8DEUM6PSHvwsHNaty86CeSqpbiwTn2T+Zg63J/yp5mwKwtu2sRv29h4qcExGJtlWs4a0xSCN2kcQIMAxT1lbcNAdxItJe+N1wvRX4KRnJCyeJ6/DeYbdDN6zCnoZlIMrPlbuz2w/4s15jGIlitil838rOWR+oIR85/z3/CIAa2+E0uSBU+F83LssphFuqiFVB136ij0f4rTwQBwsdYbqz41MxyUZWC5p7j3MTzTY3Y4tsTpHM7qDqupQivfezyvQC/w4V4HcecfBC4xoD1v0Nq2nfH3pxwmglytnWirPYKxXnvsUw7TiPzDZZ7FFDkT0Lx0/i1vx1af/Pptrazb7GsgHc016eJyKf4IGpjVbpvsgs3EWJ/0iL5SXb57x56JiydTD8sCx5YQMCAPxKfI09p5nSZc09JFMzCPfPggCvQAMWwXkFJDVhnAlJacx+qyvHCGU2OckGej1S5KUYv179LDHFpsayLdXpl7gPLj5SbMu8OHTrEv28eHqd1k0weeCMvxxwLzst2g==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR01MB8010.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39850400004)(396003)(346002)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(38350700002)(38100700002)(6666004)(478600001)(6512007)(921005)(6486002)(6506007)(52116002)(7416002)(86362001)(8676002)(4326008)(8936002)(5660300002)(26005)(316002)(41300700001)(66946007)(66556008)(66476007)(2906002)(4744005)(110136005)(1076003)(107886003)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?nP/6/bjBtJVCnlaLH4pgES6BIeQPpha7ivS7ViixMaOupbLXY9cLH9lSGc/h?=
 =?us-ascii?Q?i5DyiLpsK6i3yJLjdbNS33HiLMJ/9W/GfBCJM+y5G2HnEGJpvfqISVhz81ir?=
 =?us-ascii?Q?VQXL+liIXhMf48XBRD9tXfB2N5DEEY+0gJVih5yx5+LBqDJlfaW/u6RAGEdJ?=
 =?us-ascii?Q?8+lVksM0qU2alOWf/PZxhgOFYWnUEgWHw/uvYA7aLSWoyCugTSylPnwfv716?=
 =?us-ascii?Q?jdl9N/n3Z7A9qspOI6p0+oyzVbDOwQB6QgMtvageKzcu3Lb/a6kteuNm5gpA?=
 =?us-ascii?Q?o3ZNNm3ERO1kLZCAzNBp2pIaBRX4/8Qgvh3S7suS0iEO1wULxpy1zzZ5FRrJ?=
 =?us-ascii?Q?+UCMJVWeKa7GXYv8pey0viqJVOWm1pAirm/UN6BnveWxcPNXqvOAZJLnwMFt?=
 =?us-ascii?Q?ibcPXD0MJJ2ydMhcI/N1OrqMuY2JgPfLTARa56IeKs0ze8e/rGsooqn1zH2X?=
 =?us-ascii?Q?mqESmbhGdDD80+oTjYpvExp4Xt1/KO8jdUYX5QZazHEcu11HrAfpx7rla0Uv?=
 =?us-ascii?Q?v1KD8WnyV+r7CKWAVt1RA/xU/l9VMsNR38NLOx+vo5o+WDw8P/1aqul8DD4p?=
 =?us-ascii?Q?S+jG4CEkZ2hiVmIKRbmUjvfhsy6PwAWBf07Cdo+1oDMN4B2x+9ylYlVrBiMB?=
 =?us-ascii?Q?Mo8GOwhIwbR29uY92dd9orU4IbqtNteaUhf7EC6TFZ0ByqEd+MknsShguHFQ?=
 =?us-ascii?Q?ibg08B3N0icjgfpqse1EXrZsHD8Eg62YNXJfVuzohne+JLes4catJlbuEwrW?=
 =?us-ascii?Q?dn/Gi6Q3Nk7ZwPE+puC7SHQquHkh/rNVxaxzkbhobi//xIRWLqnlap3TeXQg?=
 =?us-ascii?Q?25+DzRJ4CEjKK3Sdmm+j58qcXls7TdIHUhJ0h9BFOvRd+1PlY5HzoCEYB3fD?=
 =?us-ascii?Q?8t5amNp7OIXz5UUrj9LLqz5+nKXkkQXeU/LeC8jtraj9IDv2ZBN/Rywb6AnI?=
 =?us-ascii?Q?VY/VV1KHU5WJTAGbvSWrh/vvhVTVuCp3vUGQwARBPrSUiMs7ThsvAELtkhXy?=
 =?us-ascii?Q?3N3NGs0QZn1R+vr+TmJJGfj3iwtBZTewXA2/riQdfTO2Bz4nkU/qKf0fqRGL?=
 =?us-ascii?Q?a2iolsSyli6VoAjn6O7+rWcttU5O2NmTA8w8csUK+G94uHBFLoj6fPDMrCor?=
 =?us-ascii?Q?Cp1MchG39F0N9P5tEYdoZNOBbGhQvhr0Vbyd1IoHVc0j36ideXIdSVJ7WbV6?=
 =?us-ascii?Q?4pTn+Od5R+Mb3DBgPAPw0mGf6U2TEefB5GsfMO1TTXsZPziSi36hOS4xtKSs?=
 =?us-ascii?Q?gl+lHI04q+mT3tDjifwvc6DJ+TTxcA0IbTP5XycFYF3hO/cEKS3iMTnoxYsN?=
 =?us-ascii?Q?h6surDJl/f0QTM9nYbGUi1R4F3wjwKEbIqz1XU8unb+tvfD7CVIu5aGlILoR?=
 =?us-ascii?Q?+ZNGS4xRSQm0M23djiS9crApQ1WOqRJAe+l0iZAZmXIg80L2sVf9qmw4bDSC?=
 =?us-ascii?Q?qlWT75zDocPHFvxVpVIkRd/lCWsd1SF9fog0yKk2sBW99jQSFZyCX/X/FRF+?=
 =?us-ascii?Q?SG7DoGy7Bmc3lwhhHxVvj1q/cLkrfdBwmKv+OeexTf7gW5w3e4PTUuovj9pk?=
 =?us-ascii?Q?MjFVl0uJvHHdX5TOyNyxzjaArQBi3Tn6fjKGjIUiUywQFq5BZra2OFKyrxp5?=
 =?us-ascii?Q?ahIU2tdhgQuYbOgPXU31ilY=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37efcc98-6825-4c05-7d3a-08dbc5570ecc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR01MB8010.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 03:56:30.7314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lyEXV9wpxdqRpIgCGnLNkvoGZIdy9Prvvq7RA45aNfmDFf8OyBke/6mx+k735Xiln1iNRqyBBapTEARVK8pXlAQSUfSicAkIRu/rQwHbsIzwa6Y3pZzkHGTnjUFeDJq8
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

Add the inlet temperature at address 0x48, which is connected
via BMC I2C8.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
index 88693c2b2dbe..c676172f0dbf 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
@@ -510,6 +510,11 @@
 &i2c8 {
 	status = "okay";
 
+	temperature-sensor@48 {
+		compatible = "ti,tmp112";
+		reg = <0x48>;
+	};
+
 	gpio@77 {
 		compatible = "nxp,pca9539";
 		reg = <0x77>;
-- 
2.17.1

