Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8FD709235
	for <lists+openbmc@lfdr.de>; Fri, 19 May 2023 10:54:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QN0xy4WQdz3fCK
	for <lists+openbmc@lfdr.de>; Fri, 19 May 2023 18:53:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Tdgo7u8A;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e83::712; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Tdgo7u8A;
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on20712.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e83::712])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QN0wl6dQ8z3fFF;
	Fri, 19 May 2023 18:52:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjqIodmV1aV21iIFKyAzB+wXj6ryikXr5QVti/jl9pK/iPM+cZfCwnM0huicO4AH5TS42BHTQOVWth2pBagrQM3Ezigha5Ajlj4JPJ5irTudG6f/82b+Detiagyj/tlpzp6Jv77FocpDE7ngmrDtqU15aKdK757wqH7crxydUZ0OLZQwEw4UfGT1y+a1nHzlwLf4ta1gT26tHaho4yjiAsdClQn0jhE3Ga0v74NmJBqPE5QIuI1aUbr+K7V/hA0i/M+tRHkppyBgfJqVGlsGBOVjSNesULZ4QL0nB0Kzn/J70ZTFmw2CT/ZDkGzFu0PXqsooNhDWdYZHQ4yVK0tUjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAOFrwaWIsY3wwzmxDfMl8Wxmdu3D++S5YL7oXsZT2U=;
 b=TjsegqKNPFFbaAia4E949TSSSFXt/laBj2idHQ85CvRIfFUQhsujAS1U3qF7nMukpGl2fG9dFDjdiC5DeJw5dL+lHr/Bw1eAswjImvG0eDJyRPhOAknqlESHCdTbZeeXkmmvXN9mI62OIn3FLztswu5OiCHVBlasiszpm3G/gvWTVm9KQqbFMj7ZmpioZ51UIhmD5U1OGDFMgBO09oj7lDYgynWnXZ3zTddUsa+MUIBHT3IPNbu5UqABmhW7eaH00DSHPscYEd/YO+5+pTJfD/g/UmRZBmdL/92wnHHV+PjZDOww9j9Onieb70Im9t7aSVaYQ60AwDS2R8QzcCYVVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yAOFrwaWIsY3wwzmxDfMl8Wxmdu3D++S5YL7oXsZT2U=;
 b=Tdgo7u8AtCfzxixbvZqiXKpTM72V0nRGJ6ezRBLEIrDMJqJlmCNMwcWCG7YnvtN3DjxipfLgO0d295oqJjdz1qC2BTTtS3M4I4ZXLvuCeyMPOEupUVsnJYuEC7snlEvXoFGr5gI0IKD3cjLwu9ySg+df+/xRKOBJjvN803Lvs90=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DS0PR01MB8010.prod.exchangelabs.com (2603:10b6:8:151::19) by
 BN6PR01MB2675.prod.exchangelabs.com (2603:10b6:404:ce::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.21; Fri, 19 May 2023 08:52:50 +0000
Received: from DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::e439:70c2:7d19:45e]) by DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::e439:70c2:7d19:45e%6]) with mapi id 15.20.6411.019; Fri, 19 May 2023
 08:52:50 +0000
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
Subject: [PATCH v2 1/3] ARM: dts: aspeed: mtmitchell: Enable the BMC UART8 and UART9
Date: Fri, 19 May 2023 15:51:58 +0700
Message-Id: <20230519085200.22020-2-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230519085200.22020-1-chanh@os.amperecomputing.com>
References: <20230519085200.22020-1-chanh@os.amperecomputing.com>
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0004.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::23) To DS0PR01MB8010.prod.exchangelabs.com
 (2603:10b6:8:151::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR01MB8010:EE_|BN6PR01MB2675:EE_
X-MS-Office365-Filtering-Correlation-Id: 98439e10-5a0d-4995-beae-08db58466cbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	FKCL7TF5tWfC9+v9sWSJQRk/fhaKWrS1PQWBzFNkFUzXYjgqpCRtFipSG1dwOzBNOD9j4XOKN6NhBhgD07piqaviotLMUitSRd21uTHVZJKaU5FniToDn64iQyhI9B2VnhioZoK5DKpYxHzTWCGEEFHA+Gkf6dxbwSwNP2UbnX4WJcdjyBT8rfPlCjxMVwRCtBOJZGNa7WjYv2zXv4bnqDXoDHfqTn01rNxGy9se3BQ1k0GDOT0STiDZyb8WrP3c6cJpV7rWRHnBCAudL/W0MeoQZDHoR0vKDwbxIjoe+BH+PfTz6ISueeIHPPRTWz6DMSxeCila+GXQIX3QwBdLdJh7PDaNXwmrk3o4w/iRuHVaKFum8aPlX5WN5tzGCb8B2jCpOzKjzhmyYzTvH8hX6z1q2gBRKJPeseZclX3H8JlRNGvr4nO7V3/Gm0CzGfbh6WfDB8q4UqvgM9XCR3DFv7dMMw6R3WM5ShzTQI/8MWkWy72BruYQn1KiYHbq7jVj8chC0hwT5dk/yLT7exRSR+I510C6BbkNR8VsB6h7DpDefGFFDEchFpNSVX8YjTjyv9C6aOZJ18EmGjIJTWeRNH14UrdY3DdRreOUytUrpNy8GbyATXKjvfEm6FzINQfG
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR01MB8010.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39850400004)(136003)(346002)(376002)(451199021)(86362001)(110136005)(316002)(4326008)(66556008)(66476007)(66946007)(52116002)(478600001)(6486002)(8936002)(8676002)(41300700001)(5660300002)(4744005)(2906002)(38100700002)(38350700002)(2616005)(26005)(107886003)(186003)(1076003)(6506007)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?YJooO+KnG78/Fadxbxg8CaDvQ7jcO8iuVqM10d5bZIpQgHoBXiV0ogtL8r3f?=
 =?us-ascii?Q?0VLIQNFeohpF7z1LWjEii79yucIOAm+qMRsT4Isgwuio1PbroBQBjRAHYAlQ?=
 =?us-ascii?Q?M0nrJWlm6KKuOt2JDXNxzyQQTEhzSJanco7SeLGZVaDhUTzJb99HJnCsHO9r?=
 =?us-ascii?Q?a/uIMjnEPLYFPIZgdIFoJalAMfGFKHS4RJRs77fiCSGnjEzNWNIVSMKmuy0Y?=
 =?us-ascii?Q?SzTgs+42wGOm7F76TGvggdGZDPQ1Avf+hUmdFzPeYgpRnzGVAp/VwRM2AeCn?=
 =?us-ascii?Q?Pae+cXsTSQQJ6FvdT94A40NFLW0etpEf7uJKlmKBO8tvsdYo9EtJUkSy+Vqs?=
 =?us-ascii?Q?3mrw+ZOZa9J7FYUAO5IZnTqAzPaFjROtHVQxGT+W8Rla6YkwY4mrWuuMRdR0?=
 =?us-ascii?Q?0K7nG4TDdwE/g3YU1ogjroiqSH/t7lL6gNh7mZLcftoAupkQ+K4dzg3glGE3?=
 =?us-ascii?Q?EVKX333L36LO846C2zeUPbtK7OC8X3qwOAv4J2AoTYo9hGDAM6mHpviZq7Qk?=
 =?us-ascii?Q?DA/MThXHVk45LcM4vFJLevI8tEQFRicjZC88sSe4H+SAdToPUh4rTOiiZsao?=
 =?us-ascii?Q?TIkfDqEOR7jXdl+FcyomEgozT6QdxsCfkGbxharVcl404CXBG4YCUofj5Sxw?=
 =?us-ascii?Q?uMk8bVfNzsYt+dkkq+NKtV+bsXQAp0eMgcen3GykFo+8/s9ghWMDmDZWjhDH?=
 =?us-ascii?Q?FHNYthU4EbiQtxfollTPeOkab5b6FFIgg9iVOwXYMmCkRsfwWhl0haLAOjbc?=
 =?us-ascii?Q?ourpi6ND7/pBGCX1aN7I9uYOl+MLqpgTO60p6NcKlDNIK2AtNaOoiXK4nUON?=
 =?us-ascii?Q?SlU1PucGZHH/pufiM1TPB03OEjbZF9dZF4R32AX71+B3ezKU+APCoTsO2uUe?=
 =?us-ascii?Q?D5y6KCqOwHl41N69Ail+DX3e53qrFafPcJ+4hYuANhvVPiXtA25VG353ROe6?=
 =?us-ascii?Q?s7tEFvAi0UZKvwHzf9t8uj8c8B18iRlLSexAqUZkJqteD+jgviwOITuaT9yC?=
 =?us-ascii?Q?G6dIuqPm+yyBx3zf8fzGa5rIFosut2ciptmy/++BzY8KhwCNmYqH4dKY4K+f?=
 =?us-ascii?Q?UyCas5x9AqUNJnCvPyjU3dD7zlPOIGl/9agSVc2uIe6zf3ebCIsXi/iLYKyq?=
 =?us-ascii?Q?Qo36kXkGkC8DuyqXN6ogne9cN584kn05TEY6DPb1BfrepHFsCuTGVdKEwXo5?=
 =?us-ascii?Q?Txm3ID8NMsY03Tfiv0+OsTd9VD70TBHIPCt+U4zVBYMzAANPr+ItG2aiECfp?=
 =?us-ascii?Q?GbqPGhP9RQwhpG4BUzOXC7UTAEUfZchi7UbE6/FRYoNVqJ/eWuIhjXz4Ul7L?=
 =?us-ascii?Q?6QBrmAsv5Dkq6rX1gXfl8dOOr72vpnd+/AkEPyFoB3lKq3QPnaIR9Wugx2pm?=
 =?us-ascii?Q?wTWTExhMUip15Gl1JwTdaKAFFkrS4l/kg58tZB91gO9ypg+FJehxf/U+Mzlj?=
 =?us-ascii?Q?x4p99Pg5eIwg7wcsz4NdGQIGikR410BgunyRPL8Kq8JsgmvXCnjMgIU6H0Ux?=
 =?us-ascii?Q?Dl3ed9Pa09UTWuAhQNPhPw3kUEGKhBcmmoXDwUtCMg3r+yMO398h9vxI9IJs?=
 =?us-ascii?Q?Hw5vgToJ5vR5tCuDxsrtgD/ECrfEEY5I6Qf3koU2wCkniCK7x/L8OxtxBG1C?=
 =?us-ascii?Q?tQALoyT27GdaF9yb9llyc2g=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98439e10-5a0d-4995-beae-08db58466cbd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR01MB8010.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 08:52:50.1841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V6AQaiVrm4U+nzowxJ51LnNzYdUExPyDKQCLFEXpRKv75cmfu8OXk3r3v2lUqG3LjYliSyiJjOswbblO62Ty9Oy829GV0ksjXbq/8baMAEZR9MuxX5UrVhxGfIZktEqt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR01MB2675
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

The BMC UART8 and UART9 were connected to the Secpro and Mpro console
of socket S1 on the Mt.Mitchell system.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
Changes in v2:
  - None
---
 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
index 1e0e88465254..e79f56208b89 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
@@ -9,6 +9,10 @@
 / {
 	model = "Ampere Mt.Mitchell BMC";
 	compatible = "ampere,mtmitchell-bmc", "aspeed,ast2600";
+	aliases {
+		serial7 = &uart8;
+		serial8 = &uart9;
+	};
 
 	chosen {
 		stdout-path = &uart5;
@@ -307,6 +311,14 @@
 	status = "okay";
 };
 
+&uart8 {
+	status = "okay";
+};
+
+&uart9 {
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 
-- 
2.17.1

