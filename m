Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C15762EDED
	for <lists+openbmc@lfdr.de>; Fri, 18 Nov 2022 07:52:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ND6t62LXpz3chn
	for <lists+openbmc@lfdr.de>; Fri, 18 Nov 2022 17:52:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=blHYfQwr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::729; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=blHYfQwr;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20729.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::729])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ND6sN2GrCz3bky;
	Fri, 18 Nov 2022 17:52:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRpKOCMu/mK3xnWcvRwUsTSYEXkQR1yD9H618t/aOYb6qJXp9DnmKzODThpyRjxEoqnQJCcvymnQLl6O3M0eBaGmv5IPmxMbySxX3AJaShunkC//0LWVAME7O6LKj5NcZ6zVKMLEoUZJBO5fPrTzzahrd6GbLJ0hPNPsCd+wiiKde4GmBesI7J8ie2ZGAnAl5CQpStxhHU4qsDxT9CE9XIk6Pi4ekRSJZ1ZKsNxwv233bo9RwdEVYGWXtvm2MRI37Vhvptnat0x1ST9ngIfP4kqEJ1b4nX+XR6BZSAyzXsuSFyabTqPGQJuIiERU95XTB3CK4kSi5XEhct15JLPVpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gxhRXZTUW4ifiiTQ8rRfRhkvi9nYqXJQpQlzx2ATNA=;
 b=P5qAN7uOq3MIkdfzsnZHRN2Nn1tzmKkJeT0m5CiO1Q1qRc2ibXZ8qjPeRCTaD56v/35XIIaHouU2H6eWCqvNx4Ffn86swPflNUDkYtRzEujRw3FRmZ9rHZbVgWP1YUz1aZRfbu3d8F8LAyrtdaYm6GqvGjAGABnMewuWn5068LZQAEJjvQqzBJFD03NFt/lcSv9doC9SZSf69/uVWiQHuHsgHKUKJyKGAN4rrbw93Bb165MMcruEgh4Sug7yJP6660RmO2yXTRpI3AZsmVYZrJDSZQ2lBw6zZKU74qcBYTBOzpAy1Rk8WFvxUVdKwL7dGj6+gDKr2j3CYRi1no0zIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gxhRXZTUW4ifiiTQ8rRfRhkvi9nYqXJQpQlzx2ATNA=;
 b=blHYfQwrabByk5sKTmtoSleSa4sZjm89oyaraByvUCXA2Xmh1ItXOnDl0q1aIngC53httqLkI7pK5XANWh8hSqPKDOXXwDC8GmFmDoB8EvK8J+MABh8C2rwuuGUpxu+7nmAX6a3OvN+lMT7GZpfdqVLbmLyazaci/tvliSk2rlc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 DM6PR01MB5801.prod.exchangelabs.com (2603:10b6:5:200::30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.16; Fri, 18 Nov 2022 06:51:45 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::df7e:7f53:a83f:a86a]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::df7e:7f53:a83f:a86a%4]) with mapi id 15.20.5813.016; Fri, 18 Nov 2022
 06:51:45 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] ARM: dts: aspeed: mtjade: Add SMPro nodes
Date: Fri, 18 Nov 2022 13:51:09 +0700
Message-Id: <20221118065109.2339066-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::27)
 To SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|DM6PR01MB5801:EE_
X-MS-Office365-Filtering-Correlation-Id: 807b2a9e-76f8-4652-e104-08dac9315aeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	X/AeZjrQ9e0NuSSydUZXoMf8QeznadP4emuo1QyXi/0u9P8zGo9YJgZ1WYDKEbeNjmnztSsVPbO5T9JvbW3hpajLhfkg6Xnu02HSMRon1ZcVLDNL46CeDoMid8Ng/OyQaMGL48Yo8B8WdioKR+wtF70/6e6uRvOIOi7na0JSG6ljQmpY9DuGMfpZvH25pmSb9E+AMVqwo/pFIalzK5DSS/puUcTrnOExDdGSs3iVsX2vAj4qb/KUhjHFZ5K7tH1cCz5YuefP7wt0Z1LO5ewJwrQx+lXvv+ZM+ko8Scy1FlDbiMolnu1VTDSns+wPmmrDHol692CYzPuW2VeEJurGbyRXpvbNBzpRpIIJjg9ih4oMBZV9vONzq3M//hNkBpZ/ze9ONH+qDn62DPGwjRbXvhwSrYlf0jW2mLP0JtEroUB6Lc3aOzNDZ/Agx4rL6cvXEJ62LOIEz2eijy3s8AvJUEiIPBz9lcWteCEFGWtkhVrECfu0xCydZchnIIGnId+7RprbJnNibku/3nNh+kRV6yGjBqQeAPPZpvlesoyIntfdZoCsz1DnEJTZhrf+vT4Fjwk2X8WgBonmOsyYKIMTzwLcOIHbWVNFDwfs/LuRv+3INi1oFey3B3CowlmLg3/7BiYltHlcuhuMtXBxmfNUdL4Kuvi15Yzi9vGspG2BJv619AqJEbyoilN6fyTg+LL9
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(396003)(376002)(39850400004)(346002)(451199015)(86362001)(6486002)(110136005)(6512007)(6666004)(6506007)(26005)(478600001)(52116002)(8936002)(66946007)(66476007)(41300700001)(66556008)(8676002)(5660300002)(316002)(107886003)(2906002)(54906003)(4744005)(4326008)(38350700002)(38100700002)(2616005)(1076003)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?pnslQmetZtTMpGBWLolcBAEfLQB76a8XAaweYSFhnYCmkOIhga1Rzb7fO9Fg?=
 =?us-ascii?Q?uJBlDfyA6aaMnAsUXrB8B5s8SM/6McqIFycZv4+FaSQ+jFFHb2HUEDHUnY+s?=
 =?us-ascii?Q?42CMeSx7Eoj8XpjGUB4C1b5goS59b41EJHqDJ1dFHmgdctq4BxKOEiYe158Y?=
 =?us-ascii?Q?rPxOp44hCRSJimF3tIr0YyByJ/A9LM5kUG/COsbYhagqw+c3VH81TTuhbQQd?=
 =?us-ascii?Q?bp3VoAIl3ed3Dkpp/1Wtv0r0NkMPSxqbwciKDf0b85rujO2h4WCH+vEZZ52c?=
 =?us-ascii?Q?lJcwf2HPxjpPg9hOw+BrH+i2aLhMPOVd5UoSKItbJeRGTNI7AqNYd3nt28gG?=
 =?us-ascii?Q?CwMJoLnGCIq9VnEUUY759/IlXYVUsnOmPMnBLwrIAxWUpJ5pybTiMpXmIK5w?=
 =?us-ascii?Q?oDcgRjm23EF4TlPUhZGadWiGrSyEgHW4bwMkWe2rUV3IgRz+ziS83LLE85i7?=
 =?us-ascii?Q?JnZYEwUdZt6fgImiO0wva7tynkzqdqhxFTmlO0bCDT7RuvlBUfEIizyqil3n?=
 =?us-ascii?Q?M19i9nxG1C/dbsyuKRs1yf9FthYDx2/eovHkjma3dD1pyB7sTvhVaEGrOJpK?=
 =?us-ascii?Q?NCpNRd3VJwZfXmT0YJZ0Fj83I04WsGm2wmhxTc1qwgzSWLtI4Y8tPpuT3a+9?=
 =?us-ascii?Q?wzctEwg/1QNUS+IZndhrgdze2TDvAKNzZMfDmNABF/eSuGRmlhffsAzqS1oS?=
 =?us-ascii?Q?kOheGx0o9DZ4v7I2SUenLIFG2GzxQWgpnbMsOD48rWCjt3MPxHMze1EiGZid?=
 =?us-ascii?Q?aN+bcUc7E0u58BZN88qqrSDHQ4CdT8DQU2OmCmFsvfe//myRr0adZV4yS5vU?=
 =?us-ascii?Q?7clkMhNC8/sCwzao5KTqXhTvuMq16MTYrfxSO/YUf0kU/T5McTqCaVFVAmCZ?=
 =?us-ascii?Q?AFYMhsiB1cmTHMgRznLla3/4/u0BWBohI5ofghAOE5xLBd1kSzl0QW3Mvt+C?=
 =?us-ascii?Q?zuMOI2coQwxKi5gozyL6WIpS0okH9T5IMocEtjCD3+4ALk7okLWZVUYmCdgm?=
 =?us-ascii?Q?ZSfwU76IsHXPEdYMgqQheGKJ8ckbS3p284nmox9xeaoV6OhDZoZy37F/lm1G?=
 =?us-ascii?Q?/XdiIHKWDar2crs6T6tJm5vbLtQNI5aJSTXZ4TMA5qqz8QmkM3DbSrlzCWm3?=
 =?us-ascii?Q?7NTA1O4O0Aa/YMuaWuDzaN+zHUCCW8dKvDyGM29BG+5Or/v5wlVS+0w8lDwr?=
 =?us-ascii?Q?brIfhp5z04m3LLpRQ5eambadlQ1Pa/RLy9sFHaYyvmu4SfGWHZ4JkEULyVNS?=
 =?us-ascii?Q?+5lDX50AVRYKjdbmh3cTWMRHqIv0+VZrJmeEwUy3WE+lHGNn4SxTzsff+A7k?=
 =?us-ascii?Q?9FDO9pqQeph/RrUojc6gLH3ZyhKU7IA4hROInzngYA8m6Pz6OgORatijHDvY?=
 =?us-ascii?Q?nJ0hp/VxuiPkY9tSGacvuFTvmoVHPtYNb0kZwcQbYvI+agZpAzk2g7G45UEs?=
 =?us-ascii?Q?Jhar6dpXtmBfhEV5L7ZXtYsifYkfKnq/XIUtwEdDrd1vTlpVwYINoOZc38wE?=
 =?us-ascii?Q?FCOfVPbm5joGjESiRXbHlcyI2I5mhItaFutwxUC1Nhw03kpMF71ucHTxdQ16?=
 =?us-ascii?Q?xMfj9ujl1lcf1zAiQ7STC+T5leXCxPAu5AJEegnSUTmbsICGyT09xFzueKk1?=
 =?us-ascii?Q?7C/H9m8VQYR5Jle2QGH4Xnw=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 807b2a9e-76f8-4652-e104-08dac9315aeb
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 06:51:45.0004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EEEZ+x8iapOaPX768+wZPen0+zV4ArHb6Q00o16JI6pEeslbi3yY55AJKUJUkVcynwVS123CjDURK51trk9B1Nr+89ytuxmv0oTWyuqCGsw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5801
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Quan Nguyen <quan@os.amperecomputing.com>, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add SMPro nodes to Mt. Jade BMC.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
index 353359822d7b..0a51d2e32fab 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
@@ -354,6 +354,14 @@ &i2c1 {
 
 &i2c2 {
 	status = "okay";
+	smpro@4f {
+		compatible = "ampere,smpro";
+		reg = <0x4f>;
+	};
+	smpro@4e {
+		compatible = "ampere,smpro";
+		reg = <0x4e>;
+	};
 };
 
 &i2c3 {
-- 
2.35.1

