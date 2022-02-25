Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CBE4C3C1C
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 04:01:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4ZLN05DNz3bZd
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 14:01:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=LdH8kKjF;
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
 header.s=selector2-quantacorp-onmicrosoft-com header.b=LdH8kKjF; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20717.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::717])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Ywr4lD7z3bZL
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 13:43:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbO1tzC97KPD0mdnq20+x8eGZjdzvrKm3nkqgVsrVP39kx9deC0310EEiu626w4hqF8v3rBFdvrpXzdTOp2n+o56YrAqYwLUG+LbQkn5HpAoBRr5Vim/QIXTYxDuZGFlZldOFZAhTvE22s1l6LHbsWPfkrJNfi7EvG8Uui1xSC1NM1LWAxiuZfYZAOTfiiTp7FNbAEWIsPCFXKjBxukrCHrk1/pZ4xniaBTKFlmg0kRqvzS/XfzB78KS6GvV4+4DIOBO7dOS7XcBjF/Qn2f8vrhQWJWITGTYnEnMIAPf8wBaKmx4x3gSiF2Kek3aPc+atA12J/R6i0hKNccEf+fK8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3IMaiWXYBK8hASuqMlaqvYz8nSyLlqLgV5BDJEHyEAw=;
 b=f4kpPWJSaqGNO9GVNEI3BTe7HEpdFDE4EwDZLcdgY1z+qkR2j3TL7wj2t5xyJn0bVCHmRoklIotQpKjUmGMReR7ILdZfhOayFN0dKRwMPTEhsC1d9KkA5A4c1FcZfis9PiE5c0RmYsnubG7yp370H9ZclD8f/F/bjku9JoEJ0H1nPcY27hF36aU0YwnV7WJN/D202HEfaLIiNdQwPGszIJDx4l0e9nc+9upogOlmJ4pzqNeVcpnp1rrF/WlGmvmkF/QqjYBEPXZnCqX7denvmn1mLmykeC+E8+KDtUWf3As0G4U7axSOC7er0vsjeBlxiygnIzQjZlTWhRQRHzx6ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3IMaiWXYBK8hASuqMlaqvYz8nSyLlqLgV5BDJEHyEAw=;
 b=LdH8kKjFZjng9ZnQpVuEV2xXXeYvdl7QvTd9aBgIzTXcEsca/j+sLDsb+fFe4C3vcqsMzERyR40MZXUaE+Vv4bCRRsOQ85Wy2b85DLS2gjtIK09FVtyveEckuGlZmrBltk+rUTcAXSCyEvqtGTTOPjvS9gjGRD5lY3LpSY/Z7X4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SEYPR04MB5644.apcprd04.prod.outlook.com (2603:1096:101:51::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Fri, 25 Feb
 2022 02:42:51 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 02:42:51 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 26/26] mtd: spi-nor: winbond: Add support for
 w25q01jvq
Date: Fri, 25 Feb 2022 10:42:21 +0800
Message-Id: <20220225024221.19422-27-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225024221.19422-1-potin.lai@quantatw.com>
References: <20220225024221.19422-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:202:16::19) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90f52ed7-a616-49c1-dce5-08d9f808817e
X-MS-TrafficTypeDiagnostic: SEYPR04MB5644:EE_
X-Microsoft-Antispam-PRVS: <SEYPR04MB56446683355F6D0354CEBB878E3E9@SEYPR04MB5644.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GABUrYVi6RN/n34dHl+MIsgFLd+Z61wuVSNkfP2QiKJmciP5eMmHYmCSAf6iXWhNKcNDqmAbFWeZ8WbxKKtYdDIMoW++qnyX4Le4g7r79b3KlcDYh8NK0aZTIa6Hb5+1CVM1ZNOuTyBmoNE34wetJk+mj08/PV0Z8Gv5ShFl/55R+GiusDqLx6Dfv3PdoeUlw9nJuxOjlqVbkHNMFLCwrC0KPhpxMmJ6jCznLlc4xbFMBbk704O5By6dW6Y2TdTm0Qvp8G6chHZC4GBWFEiXeRuKT++orROu6y05UBZz06mWJZk4dAJm05H/pAncDNKVaUrDmvXKidO69PQqBOIDK/OFlMpTetMkKpzikZT3/QFJvQUqS5QG64mVGh0qIgCqamMHzQw32PMglUZqtCo59WJNibH77mUYbALrr+Q+wp5F71nUiaMJO+wapAd1rtiBSj6AUEqCeamxt/E7kKGKtr/ZyOwmP1r23spu8CY69FZUuUdVlssW/iWeQTFWTsWjFu4LFHvG+Shcduuo72NEgvomYD+WOqZB+RIuaWjN8T6rZvw1/FCYcM5bFZgRMCBbPw6RScbpUo809lOEIvyGsVsawcBpdMjzDjebg3r4BD7nCQZnpvQlbn2B3vyJUTozqr5BMUHK2Kqh9CyYeG17M/XXqZVEfCykhdB5ZgsPLZeOrwjef+8X5OVsZain2mUEp59wpsrzp+fZQHS1UlrMviaJWU8wD0jljQgYIIQytqi4+2T7f5KPs4Syp9ZRmPss2NqR5oCNrVIWwBh34d4B01OY/lirId6jnl9h/pteDJ+n5vvQ9tpWnUoyR3+t681gQzbuQUSkju6hgwFWp5na4BrdgVlYveDr4NK/375wU0A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(44832011)(36756003)(54906003)(2906002)(6512007)(316002)(86362001)(6506007)(6666004)(6486002)(966005)(186003)(38350700002)(52116002)(5660300002)(4744005)(8936002)(2616005)(8676002)(107886003)(66476007)(66946007)(66556008)(26005)(38100700002)(508600001)(1076003)(4326008)(138113003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2AHxLuzL4JUY2gs/ZQHDAnmx3wnUU+9rOPRi7onPUkxx4k62Vb6R1bn0Z50O?=
 =?us-ascii?Q?3FjVVy/qIzWfXsVXFMKjGG7xsv4ETHJNcnIM/Vtr5XdA3jv1sHxzeUKiXzZ9?=
 =?us-ascii?Q?i9Oukm9LLXHKnTGmRKHnQBSuGkp/IBQ7Jjgvscd1dh728ZjM9lVHzunNEiJq?=
 =?us-ascii?Q?tR1/tnqzeaj6DKwWDiVs0bzpWyBECWTZwPSP6om/06ywD1FUJGxqBrW34SOB?=
 =?us-ascii?Q?nGmGXDmZXP7pZ/MZZUY34qIOShInbPA1dvIXh+ikMd049O+QLYSzDFKJUHG2?=
 =?us-ascii?Q?grV0bLLZwoHZ++1clPrHbg3zU/i1HgWqHf1WrzdWEExWlQDx6X1yYDV89vr9?=
 =?us-ascii?Q?KgYaBGSc3gMwc6BkU5sagGJvM8MY1e5zva1dLI1EJQGX0WLxX81CD8PHHx/V?=
 =?us-ascii?Q?TOxqN2bDOCnLRuPOuPi4Hh+zGiuz+7WiFn2m9kBsjVCeISWrYz2k4l+n1plU?=
 =?us-ascii?Q?e9WvBWl76aHn/Mn1qd2LmxrynU5twgC2npfKY1hvfi6epsGhLxHp02DcACzh?=
 =?us-ascii?Q?GKEbdfZF+EB7SeupcFXJToHT99FHSekO5OxpXu4EZeNbQPaEmos18Bjzvw2V?=
 =?us-ascii?Q?4y6nOkJ763z/5809RNwSTIkwQRvMW6D1GUd+GwxgXlzqaDE4p64aIa7+kLX0?=
 =?us-ascii?Q?XJNLKDQQZYLyr59xuHZ9cvq+Kw8lYytfioj9woBLrg7XDWguLlIZIRK2uOyJ?=
 =?us-ascii?Q?i5aWBXvams39QaxaehcHxkjFeSg7r49IzRPTdqT8fETbetkQZxgJFDj/igg0?=
 =?us-ascii?Q?GhYHBybTr38RPdbq6vxnVc/1oXKitvEfrfNl7GJMD47N1YOgU2FzIpx+7uFZ?=
 =?us-ascii?Q?BbOYmwiadGvR+OKRYMRYuH30jLnpzKhiiKck7zE2LBn5oXOdcTOSc6PMSDVP?=
 =?us-ascii?Q?4i+32QoDtMzbhVa5BOxTh3vDqblSqSdNsWtB2aCEODEtg3FnkxsOnTTNCALN?=
 =?us-ascii?Q?+UuCUYwtbsm8cMSZG5W0Ia+CSHg+AcNDGCJnAJmRMW9ix49dxZI5WnjfwMQf?=
 =?us-ascii?Q?SU5wt9N8JTcaybPVXllS6dadvjRFOE/SHYzbB3sY1bO+U243onB9qScMYRkT?=
 =?us-ascii?Q?aUpw1G+dikYtHOiu3hsruH9va3V0sk1DSDaATXRXVKvNsw3uugN3O8iLuIvf?=
 =?us-ascii?Q?CBJmJWvyZH8icyR1qaddBm+V5PMuK0hg5FyBsIMJzE15L3GSZ23UWdpdNYTf?=
 =?us-ascii?Q?KMmj9/Hbd/PSJ3/MXXLzuKD868QEYSp0dwI7DIFhu0UuVQtAB9AUojuLryun?=
 =?us-ascii?Q?I3+sz6PkMJlMitggoxjacr95wvPkT5x7CbtUWMrpNpx+pkQHNLsBxzP2ukZa?=
 =?us-ascii?Q?VjPuvVv86EA3oK9Y4QXdF9C6RPlbZGahqSgylCuVhFbZQJIy6/d8B0NwJfSQ?=
 =?us-ascii?Q?aWmgV83NQvuDPRkV02z4vCcfu+dJeN9Zx/2711cW+30vVfbjN89VMY9379Ui?=
 =?us-ascii?Q?EmB9VYxGfxH1u8V/zDOShwDXMpBPqZJvUYk9BsHQGYH/+9m/CI1o94xxI5kQ?=
 =?us-ascii?Q?Ap8aTf1WL1pzephhGUzV7EqzwnniJTMqNVbFAcPuH7LTVxn/oIRigHBHU0py?=
 =?us-ascii?Q?cffvVX6+QhCe7zCyfpyEXNnsU9ISDjXO1aQ22dNp/oOHdxDCjslTJZVidmGz?=
 =?us-ascii?Q?mJkByUSFho9rANjW5LakHLU=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f52ed7-a616-49c1-dce5-08d9f808817e
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 02:42:46.6731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7xjjpHb3LpQXCUAO2MI49uLXIbfBsUXdNkc0hP208c8n+hPo2xWAfkkg8k5I9yXvakuOMi844aMJxV6WLl5sJA==
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
Cc: Potin Lai <potin.lai@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add support for winbond w25q01jvq chip

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
Reviewed-by: Michael Walle <michael@walle.cc>

---

v4: https://lore.kernel.org/all/20220222092222.23108-1-potin.lai@quantatw.com/
v3: https://lore.kernel.org/all/20220222085148.21594-1-potin.lai@quantatw.com/
v2: https://lore.kernel.org/all/20220222064227.16724-1-potin.lai@quantatw.com/
v1: https://lore.kernel.org/all/20211224104522.24615-1-potin.lai@quantatw.com/

---
 drivers/mtd/spi-nor/winbond.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 59d53b4c39c8..960ce04ab381 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -131,6 +131,8 @@ static const struct flash_info winbond_parts[] = {
 	{ "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
+	{ "w25q01jvq", INFO(0xef4021, 0, 64 * 1024, 2048)
+		PARSE_SFDP },
 };
 
 /**
-- 
2.17.1

