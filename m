Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B88D64C600C
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 01:04:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6LGc5qQrz3bXg
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 11:04:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=dEACstto;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eaa::730;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=dEACstto; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20730.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::730])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6LFC3d5pz30MH;
 Mon, 28 Feb 2022 11:03:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eW8jZ2QXu3ZvUMTFYo0ZkgjYMACgadSIHMORgMume00eKyokQDkgkf9BA54OtRsX0U3+1C2N9JRmfaD59DZZCX88Bl29EATeMYMwIcD5iCJq9807NPa73UD0PSM169MQTdijB9++p+SwtM3qPob0DUY7rFlxqXqniQaZTYgINThl5NJzVGIpqZZsfCOF46orLUODZWB1NDc7F9YxqZK8q9+ZpQDzopjikOdoSZj2hWh2eYEclsd+Z5oMSGxvYKwV++Y5ceLqolN1pxFX26uKmKoHqEEg8CS6b8mtP0kGjleyiMK8KZ4+CCw5KsABs+OHuqG3QJcMArl6oYaKWnKBhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQrWSHSaCz8Y7iGHdfiZ/4e/9RgZWmRUZVI1KPLqR1Q=;
 b=KscIbObWHeotyAQPe94qbPP14z2XB7aJwI121vEKmywUgAY9BQdOoLBmWzSU+W0CaFsK0B0Bw/XTJyCNBbNCMPNGsNnQ7e7+vicpJI3CntlI0B0KV9MWuqOETnWE5QQ+r9p6xO/nWJuhDUIKvfVCmpxGn81/Xg1724v0gj/W69MOFdUaP+rv0vT9ol1Dvq3j+hUmIw0mM5v2/Fn6cliBegk1Qk4NYmVDmJn08/JTEGQUpaOt+Rdsz4A/sJnLfYZ0ngZioayP/CGYWWsA7UQvfV/VkNhoeZ+6PaPLnqD1VJ90UBr5GPJSachQmRLEwq4ecEFqcU+UlDW8VHd+PCHdPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQrWSHSaCz8Y7iGHdfiZ/4e/9RgZWmRUZVI1KPLqR1Q=;
 b=dEACsttoZeQBziSL5Mbg+lU01CWX/FA3gSMkjG07hFKciDWxoLgfoatjW3faXE2Cm7K4fMxJTp26qvJwitnNOEtIVSvmLglSWlM7sLTAxMYBYSMHnA4TKV/yfMiEZXMfRSs44Md8pcUb/tiYSW/IdYVJJhPLpmwbS267d1pRpiI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 PH0PR01MB6184.prod.exchangelabs.com (2603:10b6:510:14::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.24; Mon, 28 Feb 2022 00:03:07 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::d9a2:2761:a4c0:1e1c]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::d9a2:2761:a4c0:1e1c%4]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 00:03:07 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [PATCH v1 2/5] ARM: dts: aspeed: mtjade: Update
 rtc-battery-voltage-read-enable pin
Date: Mon, 28 Feb 2022 07:02:39 +0700
Message-Id: <20220228000242.1884-3-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20220228000242.1884-1-quan@os.amperecomputing.com>
References: <20220228000242.1884-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2P15301CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::21) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d98eed3-bc91-4265-35e5-08d9fa4db302
X-MS-TrafficTypeDiagnostic: PH0PR01MB6184:EE_
X-Microsoft-Antispam-PRVS: <PH0PR01MB61841B0DC17EA9645E37F8DAF2019@PH0PR01MB6184.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ziBObGPf84oAlWFRIrdGWYUzCQg4wbcDmqo0ZuI/j4CzVFfqe4ImFzCdyQ5GhtelOjFlpCg7wBK/sFMQb5fPqZJGlUwyTtuD+4eyHq164xu07Zy1xnV3EPOLY+HMNZ2QCTbxs6qHG9Icb8KZDcasmxzQBb/MFvDtxgbqekUE47nz80Apsc/jdfDfMSDLa0MAss6b06vOu2z/N9WATP/IAt3ZqZMEMo9lDI/MHXRmbbrQ467s2FbEh5CTU6foGKo+RymcEWZVRavSXJPWL12exrmncke4LWEbuuLhFlz28WdbgzzH6h4RRC6ddguzp8uXF8GVKB3IPzJWBcy/EOS6Z0WDt4FDznQ9J7vcqBQwetmrNAagBv2fEMnWSzrzaIcTxP+Mg4Hc/KwcbDsu4a6/xhoy6CsBzN27EONuNJri/JedaZHPxtNKpzn9kAxWH5+qPuV1wGF2zMfpcU7CKkA6852dsw3+ZY2Chx+9NUozmaSAla20g/qrUb2UCrhLLvIkFEVfgezov4nHw6uLBtd7rIR3CD0J+DIb/IoVu4uta5HDxPftIZPUqfD7Fdn+TaAOi0sXazh+7WaTHz89aK103kV22lzIrukq++2z0AM9megkQNJRvq3Rwdp0NhqPaRHNpBDi+OrYPPoymdqG6F8V/UArdSK6hyutCcRm+syILol3ZVFuqsSjlHu/yZUMW1ecUhxhOwRg2DQcZGtTC09FxAPhZQ8nIW2R6CayEMge2NAdRn3RjveB5e8zYgc9qzZqaNzJgQu6MzspcHaM2p88LucQ8Cl0hdY5OHI6+abM25s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(966005)(83380400001)(66476007)(2906002)(6512007)(186003)(54906003)(26005)(38100700002)(38350700002)(110136005)(15650500001)(1076003)(107886003)(2616005)(8936002)(66946007)(52116002)(5660300002)(66556008)(6506007)(4326008)(6486002)(316002)(86362001)(508600001)(6666004)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nNAnkZM2HqQE+8AnheMAqRlaINqB7agpCvSh4biRQjn62L03tpag0oVNT9TB?=
 =?us-ascii?Q?BTJcrdVBNt3u08PGoLaF3NPJD6Clbl4W6TnJMMYA72HSQYEd3H/HwUC0M2Du?=
 =?us-ascii?Q?D3lC+NkYSxZA7TbdRRaQ0x38p7bRRcVCoxKYcm9bdsNapZpAdfONf/fUWJXJ?=
 =?us-ascii?Q?8s7J7iCxWH0JM299u/0ENyvX7vevRzZ2bxWFrzccOXGPTwXYBBEXp4PH3hF7?=
 =?us-ascii?Q?WkpmExWWnkH6SEqFpbXEhIdPqQYlQNdzlFkChnaBREI7yWupNRHeTywOBvoF?=
 =?us-ascii?Q?psqxkP/qZqLNMToNoSpStbF2IOc4/Jmoi5GdcMSpf8AQ5uxbtz2Xfay5tLnx?=
 =?us-ascii?Q?sPg+l9owmDP/VvSenU88yKmRS1+Hs7J92RCH9LwDpuljKvVBNgqOcEET+Dfb?=
 =?us-ascii?Q?vV8Xk6Zynw4y97Q05Cvva3zugyFJUhlaGtbOLnP0o1fGoZxe96an7wG409jS?=
 =?us-ascii?Q?f050YnTLcw4KKdKI43ELtIU8hHAnmo4IdsdYZ27uCXX9j6IrFZN83BolfuZ1?=
 =?us-ascii?Q?iOIttSPuSARVCOdFbvI5DiEsryPW8grEXtZSJxzgd/qfwBGN5yVWU6p4NAR9?=
 =?us-ascii?Q?ESMYUBwjJKPVktVUaPlCQk1xL1z5LH9XiKm/t8P58QdFdFgwkW7eimtJiN9L?=
 =?us-ascii?Q?G7TgBtv+jp9rAiQupAYj/v4rKT3ZCyMKbbBAhQnk7vZKGGWh/i+GQHOru+bk?=
 =?us-ascii?Q?xZN6yokhxkus+RRtQFLKD4bW0p6i5x+y7pipNxeYmuQEw0hi1ET3d3EJe8rx?=
 =?us-ascii?Q?5IaKg5AiFzFTHqxKTGY06OyLansessTrfSodyqVQDBAL1YnaRNXYoZ6b9eEW?=
 =?us-ascii?Q?xCiu+bJb69pBDVlqYL16bCIZrnAASrFluaeGMPesF1nkDzqyrgFTJ6HTNcZD?=
 =?us-ascii?Q?x3KYXVvL3VSZmf0bLK9rK2NdDYfc6Hl2PL0avtz2d6BF8CbRr+UMx2/WeUXn?=
 =?us-ascii?Q?sfppmxXFaXVr++6BMqPRBpvIIwqjzghcL/lFx2+GyzXBtEPtvFFK6RrPuVMH?=
 =?us-ascii?Q?YxTEXBWSwijztpYIzwuNAVXLMdGMroaQ3tGtjJUOgSbHa2XkTevNwz1S1knV?=
 =?us-ascii?Q?VdtVvWTCIPs+ADPZYYhf8IRdpDdkMWFHJqCjaAFVy7+FrwfxlklePa7Zo+1r?=
 =?us-ascii?Q?9byNGDpXJVilLysQcZS+ZrG7TTk7r8TkG9OyRmhOo+3+wd7Xdb0TubfgThCR?=
 =?us-ascii?Q?0DJKNxvvb4CRP/jWao3nmOTZTJwlDB7Iol1T/kXO7ypny8NE0VG7BHmDY4iQ?=
 =?us-ascii?Q?w3SCsC6DtVCxFGrTQQXRZKuZbLsAEf8FhDVlcUH9VJ9Dg5J2x+cfR6F9g4in?=
 =?us-ascii?Q?Q58oeyEvfL/faEyEFwZi60EC3ITuibdykXQo+4EA5Bi7q0t+yv51fsvrv4n3?=
 =?us-ascii?Q?3vNZIA4z8x1S+7FXIBPJzBK2VX+zneddvQEP89nNou5f0YCQSyMz1AysF+ju?=
 =?us-ascii?Q?FSZBn9mukOoRz1UV6nJ9ckIB2XxgrpKlQtgxjqU1/46pLUKFlIYEsFaKr0CI?=
 =?us-ascii?Q?FOexiD8DBhVy3wB5n2r9XCjdITtQYRzZQ5NUTpCpQqCJh2c4UWz+MoAxrcEn?=
 =?us-ascii?Q?WW0ntzp292SnMVp4Z4OTcKM5LCW9JL3ygZpnwGfm/tReBWyJXA4weHs/Jw5I?=
 =?us-ascii?Q?PWEYQ7ZtO5UJ/9KdgmpBA8t2QMPi19jHpO9wfAixoNtSzZsMqarTYJADABPu?=
 =?us-ascii?Q?o9CoWA=3D=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d98eed3-bc91-4265-35e5-08d9fa4db302
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 00:03:07.6089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IBzysQjG8rugp8ZmpH6FbzFg7BUzwx9zb8MLjV4xBjG89yiSqQoQPV8dOz3JwrKnSrH7lcFHjgyw1DHubflHkOAZjVcAjHw5Skc0xBYYrY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB6184
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Update the output pin name that enables reading RTC battery voltage.

Link: https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md#rtc-battery-voltage-read-enable
Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
Signed-off-by: Thang Q. Nguyen <thang@os.amperecomputing.com>
---
 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
index 934bb54b193a..c2b5b3dfeb85 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
@@ -876,7 +876,7 @@ &gpio {
 	/*Q0-Q7*/	"","","","","","UID_BUTTON","","",
 	/*R0-R7*/	"","","BMC_EXT_HIGHTEMP_L","OCP_AUX_PWREN",
 			"OCP_MAIN_PWREN","RESET_BUTTON","","",
-	/*S0-S7*/	"","","","","RTC_BAT_SEN_EN","","","",
+	/*S0-S7*/	"","","","","rtc-battery-voltage-read-enable","","","",
 	/*T0-T7*/	"","","","","","","","",
 	/*U0-U7*/	"","","","","","","","",
 	/*V0-V7*/	"","","","","","","","",
-- 
2.28.0

