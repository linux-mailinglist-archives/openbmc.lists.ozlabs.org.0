Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE5A4C3C15
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 04:00:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4ZJp3whmz3bPX
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 14:00:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=WONBLuTK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:feae::717;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=WONBLuTK; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20717.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::717])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Ywq5kTmz3bVW
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 13:43:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcsJlp+95GyVDyGrsjOrJjCdx22Wk40QLNBZq7m/jA7aF3RH8b2Dr4CK8SabHLcPWQobQDGdwXx8GKa11OM+s8GB2bHk6BCVJPUMf4FOPwih//Qu+KhkLv1nxkMOrauePiRWI8vLYDZIIQDa0bIi90jXulit5yJ9Hpn3Y3SZ4+QTRgugrQMsLY1dUZ+VWcWPU3QFa0MqLzbTtuptwIqXxisLsa2Ve9Vi4lyycT4iWMWjnWrRfGQOG4ml46LWPhGIE7mU9RWnMVDqEQUk9i+Y1XU+VTKljnKf61LIiTyyeqjGtM/nyU3oCIQl5lSGQZfwCaK2Ei4XsIO4Awj8f+dJGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+lDA+cwKAwLni6JaBf4DM3e7hoEXBiygRE8wtArx4s=;
 b=C6o3aaKbrgqCO5GWT5jk4NAspqQ2ctGM/S6VdjxfcvhRRAUh3MafGQek9MIwg2mfOFmojIGcu8lS3R6y4sk2zwc6+zCc7RGyI69EuoE2JaOHoEZWyIqP03wYnBWNk0kUGJUY6aMUlEC6Q0w2Yoy5KAddeIiwfzZaxpKxz0A9s8/yzJ+HVlxcT3QyBdRBUuJZ7tRsUaonqZt87PjUdFs+w5xYt4ebjydNCJTs1doBs+xB5jP/QNeJ9G37GCsND5J8FNDTyLnH/ZxUItHjm/AIvpYimyiPwjV+M7pi45e9PhIK837QrFFtWd6PwAjuu1wsbQ3UkP8+zJ5yA3bF1Y52jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+lDA+cwKAwLni6JaBf4DM3e7hoEXBiygRE8wtArx4s=;
 b=WONBLuTKIIngmJqM7yEV5ofXDNHTn2Tg9cSOzu+gv2RfCEEpTgimA3CTdLuJvdGOd86z3xr2QQrmj5UlwXHI2Ai71QwySohh49GHmLTKzVJWwGLJV4X8+xUVwNHp9ovvqbmXC0Y1wqwYOZziXRXGJUgQWF6tAJRU+JSDbhkr6rc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SEYPR04MB5644.apcprd04.prod.outlook.com (2603:1096:101:51::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Fri, 25 Feb
 2022 02:42:49 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 02:42:49 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 24/26] mtd: spi-nor: gigadevice: gd25q256: Init
 flash based on SFDP
Date: Fri, 25 Feb 2022 10:42:19 +0800
Message-Id: <20220225024221.19422-25-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225024221.19422-1-potin.lai@quantatw.com>
References: <20220225024221.19422-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:202:16::19) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 711a161d-1770-4d43-0bfb-08d9f808810a
X-MS-TrafficTypeDiagnostic: SEYPR04MB5644:EE_
X-Microsoft-Antispam-PRVS: <SEYPR04MB5644DC24BB1D0279C767C5FC8E3E9@SEYPR04MB5644.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KXdvi1PXtxWvNqTSlViyKIh0JsZL9brzqtn1ZBPkTcZjCT/+3CHjb+jK+r+4J86iptzohfAzC4Myfyx8LiDCyvpf7LSt0u/h3VCscnneREqSN5msMzSbGokjlpqWIiRMsjYV+hk4MAMidY344N33YjBfvVOhP1fgraQlytx06/O4xnZw89VTTL05DBJBZS9nB0htE9LfkKkCn2f1ZxRJhnL7Dc+K9zWY6zcf9QPsYlGkXS2rJyUA3t5bZagj53hjO/yrXbS7WFYh1NujCYWfgml1CHH9DaZ2ZJQAKr5YfMbPDnt6VJzXHfJ7DYLN6AIhAVa/7mDW9Z0AECjBTsmplq1V8Vj+0bOxoqHuRXfIF08wsF6e7CCVUgaE9zZ5ePzC568kDoaG7TjxmzjFo+dxFZ68HJMi+IylOJuV9U7iJc+uNq1oXRO2XzlWtQtHce3eD8qhZTUZ4I6OMnN8HnRx4b1EqwOy1cO6v5AjYaSrKSasQfkPg3cdE6NZdNDJbJKqN3BFUiUuwNRzHzYfoGN+pmZm+oQH28mv8C+kVY58xnDgA3jaVKLggkfNvFHECG158qrFDmFm4OpDNAalX5NotwwetI6w5AiUEJnP1bRs0d/v+TdLguwS2W2/zk9bDORo+EUqnYZhXdYObi0VN1cXZptsvdf0UGjal5d4eeUg526f9F5sUUaPFyp0/P4ORAkWicRqkMIexSUJT8oylatW9hwobph+HV/yJ9MYHf/1G03IkfXdyZff4UePtiazZ6iMZupo/zhTtKSID7yg7ygZUgNqoHu4St/tHHvoS5K/a6E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(44832011)(36756003)(54906003)(2906002)(6512007)(316002)(86362001)(6506007)(6666004)(6486002)(966005)(186003)(38350700002)(52116002)(5660300002)(8936002)(2616005)(8676002)(66476007)(66946007)(66556008)(26005)(38100700002)(508600001)(1076003)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/eGlxyyqJDdpS6Qi+QfK5PX/m0dMkYHyXEUSvgXJ2Lwr8g3AKQ1dGso5N5+3?=
 =?us-ascii?Q?oammgkIOVGjpFhRawRMZanT344ROIJ6zr+Elfj5RDMdoZugxIK2Xz2vgJX0w?=
 =?us-ascii?Q?JYZNRfz9nLKWO7e3uILWLtkIDtj7kzKKZVOSxOiCcCl4oRQ/c0hehfYD86yM?=
 =?us-ascii?Q?qLitPDDV8QGWiPFYWrPbIUlarLq6K2h+kA9oFTfnxyBpELlpbE+j46sMV+1J?=
 =?us-ascii?Q?VNTd7B8xhpVcEcbq+rbTvGAV9E/4yXpcii+mogPc5+YoZRwH4/Oywv27L3u7?=
 =?us-ascii?Q?yrNa6zp+qlVrwpVWX2uvObyvKXjfb80+cHsNMAWwQTp++ALvACXMfCxw0TGg?=
 =?us-ascii?Q?zYfkugn+yvQyd2Ts8Z8KMd0SlqYQx1ybdah0DVcMKI0NCobdsihcaIdAdoWE?=
 =?us-ascii?Q?EwFlPhOFAf77XIazYqhh9gVc0BHNXDoXNASV00Qi/IlQdfz9HiQK92gmwMfB?=
 =?us-ascii?Q?MivgI1MHOHgIjxERKqtBQve9HB/5cBxZcltfasBA39xepSC5AW7O+jeRu8S0?=
 =?us-ascii?Q?N0702X8A/d15Sc9XH3K0Oi7LqmAxVPpmn6zlofdqHjmEgXGZhpcXKBtPvu0l?=
 =?us-ascii?Q?wHHPjYpoPq7xzVefyBvO8ZqCg8KcpZfUbyn4oNKZtQgkKsUTj4SO++cNSBTH?=
 =?us-ascii?Q?HvGzYM9diOeMAn23ibBoRsthYSxDeWSWJCB3Bs/TPjIflW63N0z1ZclcayVy?=
 =?us-ascii?Q?NiRFgGcF4SvVIGa+5mx0H+OvI93HtpvJ2ltWaMGE4rpXav7RiAFOPc/PZt6q?=
 =?us-ascii?Q?35E5UjjN4hF3CvS8wEec2ff2CINLI0caoWtxoA2RJ4TZQygRZJUNdN/5F3H1?=
 =?us-ascii?Q?tM6bdObyb7sJa1+HFr4BKOzrko0C7gIcgMrZY6hq+RYsG7BmKcAVxxkamcgR?=
 =?us-ascii?Q?yxMYDI3m9YhVHVIr7VV+7J7potFpm4Ub18hB6bPQLqEXx/kt+jYrHH0zlOuV?=
 =?us-ascii?Q?xia6o4umRCZiQ7MCchtPCs5/7MGBi8C81sadKwWtW1dj+ddmRUIUd+hq2SJs?=
 =?us-ascii?Q?OzvK40eiATjGaAgd700hUkP/Cx9S9agNjG/L6lWaNmKPF8WcPZn88Yamf/p6?=
 =?us-ascii?Q?OBod+4V2TCUB/Tjb1eJk1yQQHAtDH4OXSu/ZupeZBQUsCTuy//GxHp55FTmx?=
 =?us-ascii?Q?GVCpruRY0HM8ADdvNhgNm+WQGtHvgFuwqn4KCm34jiTS2osGjfIRBZ7uG4b5?=
 =?us-ascii?Q?i3fH7ttGo6546ezFQTEbvDcU+CzvSxKaMNlJqfpxr6atADofdhE02UzVRzW4?=
 =?us-ascii?Q?V73+mfxbMaf5oLIIdKexcvV/O6K8NVib5yhggZDZw95N62eV8shlHm6k4+o3?=
 =?us-ascii?Q?59462oJgLWwZ2W+rERqUQocHGlnUiw9L+xHOFtVBfjyM2naT7+/SVpCVWJ3U?=
 =?us-ascii?Q?FF0WuZ1s1SQwsjjzXQ6aJCKEa3L6FQWABB+QgOsJcQ2ExfECYK8ywJAwGywL?=
 =?us-ascii?Q?52qYnyZTNW5zNfdgHvFECZCXcmffOwQRF8HsuIQZ7/0GYOrZ79K+0F4V+b+o?=
 =?us-ascii?Q?F681WrPuoj51XBlJ0japBT2+RG8dboJNsYFAZ/KWzOiR7rNh1oftFYk5bKbG?=
 =?us-ascii?Q?woG0Dx+5PVLjCqkehSu28StFw+iM5wwHrDY1hpneQof0U74nGlp8DaTS8BY2?=
 =?us-ascii?Q?ZZ97GapmA/i83t9SHPYigYY=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 711a161d-1770-4d43-0bfb-08d9f808810a
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 02:42:45.8919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T3xcv1uK5wjpPqkowHWgb/9znB+U5cxFQtfnLBlOXUUG724zCFFlJPITMDlQngipT+vS9FkzXxeApFuUBIADdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB5644
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tudor Ambarus <tudor.ambarus@microchip.com>

Get rid of the static initialization of the flash parameters and
init them when parsing SFDP.
Generated a 256 Kbyte random data and did an erase, write, read back
and compare test. The flash uses for reads SPINOR_OP_READ_1_4_4_4B 0xec,
for erases SPINOR_OP_BE_4K_4B 0x21, and for writes SPINOR_OP_PP_1_1_4_4B
0x34.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Link: https://lore.kernel.org/r/20211207140254.87681-14-tudor.ambarus@microchip.com
---
 drivers/mtd/spi-nor/gigadevice.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index 0c32e029b975..e9817233c51f 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -53,8 +53,8 @@ static const struct flash_info gigadevice_parts[] = {
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
 	{ "gd25q256", INFO(0xc84019, 0, 64 * 1024, 512)
+		PARSE_SFDP
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		.fixups = &gd25q256_fixups },
 };
-- 
2.17.1

