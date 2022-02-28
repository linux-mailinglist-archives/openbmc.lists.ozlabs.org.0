Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 279184C600F
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 01:05:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6LHT2RnJz30Hp
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 11:05:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=o9EISi/U;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eaa::730;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=o9EISi/U; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20730.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::730])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6LFD0RmHz30MH;
 Mon, 28 Feb 2022 11:03:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fjy/e+CnJey7X8eU2zYcs/7le15yvhWID73Ahke8R9DKySipmtDpvYzPujaMCFKGT202gfiuCWiB9fhdrVV9rjzcTGRcPM7/PNuAuWovSs3TH9UZa/o6W4K57ypJ0L4+yNJVsBpJneVMEa/qAUwheIbtT8uJ/mkcig9ptfNNS/HPvw7oHzdxYvXphJMnPsCUhfxYCh08up6amV9vZQw0lUrIcwGgUCnpLqDPaWpM+1SYIH4RXBBbbbi7Pi2Z5g6hkIwZMwgn4QXlo2OtCuwA+x6pWK4xHYmXO4MxHT2tiLVGMOw8EZmQijebhfpACE87PSSO0HkKaY+ulKpJwDXWGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5MC+vNcSEL8urpIDAtFLq6u2bIajaVe2/TneK26FeuM=;
 b=FjC1vD3nyhKMS4yhY23vLZUxwfYEnR9gsSiUs9vb9xnAJNF55VzlosDN7B6kyjx177QxRIFEDNRhwTfod/PCmCXy8yWmxFTOpUwI1+oACEYwD0oRR4DmEf0vrrHeGBOhZgJHd3y/ISA4g8hU64uohb9ccApl1/O6gLZPDlTDtIbizRK/fXoJofB0iBLXAPkfPoihoUR0YUp8UL8LjuCrsku1xMrnDwTnGlkC1mXmm4cVvDgSoO64JHej3l2XVhXFC644dNJ3SbwCvMw5XiD096mJd/ocmVvQkTFryzXDJDlQYUm8fcmV5TdSAj6El2k1mU5bQZ/sWAPpyt5YULu2ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MC+vNcSEL8urpIDAtFLq6u2bIajaVe2/TneK26FeuM=;
 b=o9EISi/UltYHWU9DV8//QhfQphadOQo1GgADzH83zZ4ROld8sPn5nlYCVKX/yAhy8mHlgL8lpy1+X/TnBr+LOXZuHx3zy04uSOdsqR9nbsmmdUykAnqB7Pt0CWRciLJRZ+GRdwyzpaU08bvWjAQwNxL4U4K80HC1bxYBYad2GEE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 PH0PR01MB6184.prod.exchangelabs.com (2603:10b6:510:14::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.24; Mon, 28 Feb 2022 00:03:11 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::d9a2:2761:a4c0:1e1c]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::d9a2:2761:a4c0:1e1c%4]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 00:03:10 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [PATCH v1 3/5] ARM: dts: aspeed: mtjade: Update host0-ready pin
Date: Mon, 28 Feb 2022 07:02:40 +0700
Message-Id: <20220228000242.1884-4-quan@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4d15ce8e-c8f2-47c4-61e7-08d9fa4db4f9
X-MS-TrafficTypeDiagnostic: PH0PR01MB6184:EE_
X-Microsoft-Antispam-PRVS: <PH0PR01MB6184F650589CEAEA3218CF26F2019@PH0PR01MB6184.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z/vG2ye/D9ca7Hmyreh8YT48hZ09DUletdMawA/C8rTL9GFbBkyHFwMz8JpH75vR1xQHkMZA02F4EG7hMmqTtbUX1ju94cdbwp7P/dI4zbzYSS1Tcgwxgdgpjs7YaiAXNxzzkMe4Kge3Rz83VhuKsk2sug0f/R5CeYZvZVPG4p7NzT+bHGVisMCCqUWPa1LTuPb5mDhnybB1tev27u00wYVFKTPK6kd/MRW83FxK2U6mWaiB7aTr4cT3nJbaWAEFlM0WxBjdYasNayWYTzeyf+PiahDat2W0gOrWGC7Ud7PIe+STYDyGh+22zHsQwbaZFD8iKtmU3W0ICrE5fAmsHVn20KNL4AX+jeoW/wvqfbjcCgV+yQocC5a4doW+CPS913Bh9iFcbiFgDALBc3Xqonbj8nH8drYb7NijqBe8pw9J0O7eg3Xu8VbF/roZoZoan/fCPII2iHCZE0ilwy2zNbleLlVyUBICm7NhPKaDoBtpx1/jmHoEZVHoCZ6NiaoidzsOPxVanMIQ5HnjHnwYrNPM+uelDvT6N9Ue3ua+WHN2GrrVZL77n5Q+Ra/o8O9dYGz95YskzUQUBWOJ3ckvwOEjBViWdHU+N/QVeif/5EiFjvk0hP4NU06BdXp7Dbt4jpTGmeQ2hordhbNlTt6syk3c4y/EzlU8fFsbW/WnTCLUKC1kzHAYX937GQMhWg/PYZNTJiiqI75Kdzd6bJvo2lCAKmX9ksPAK7KSWzXY80yNTbI5ZFBFH/m3wtBqDGl36QsTGKbg9drl6yVd3pA0Z6ZNTkUvMMv83UWvJqRPDxGIBZ4ZwoyiJ6ZBJ/X/N2pcDSL3a9SszyeCy+9SQ7hJig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(966005)(83380400001)(66476007)(2906002)(6512007)(186003)(54906003)(26005)(38100700002)(38350700002)(110136005)(15650500001)(1076003)(107886003)(2616005)(8936002)(66946007)(52116002)(5660300002)(66556008)(6506007)(4326008)(6486002)(316002)(86362001)(508600001)(6666004)(8676002)(449214003)(181573002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rYjqBH7SgqJUJQ2mzA7gglCAkzY33W6UPkEw2xSQb6L7XuWFH4ht5ThBy0y2?=
 =?us-ascii?Q?EEahq3y86qMO2V9w/+S1n5v7KqgaDxGt3mgaIJs5fM9wikPV9q9dDvdurpzB?=
 =?us-ascii?Q?wNOIVtNXC6rX3GK5xsAxd2e4QQWMoxnlHQGEFxb8PTPtImSbtAqQuUY0YMGz?=
 =?us-ascii?Q?rvGe7c77UCPy1eTfd1itFEiMLehslTee3GgkmVpvqW0qC2QM4TYGSAycawnv?=
 =?us-ascii?Q?+iK1XM6zHLAD3EyMO12QDA3QgV/kW+uWv1B6NQVbky+ww/P/XCHiIvNKnL0x?=
 =?us-ascii?Q?8QOOO01GCbHpmqq6IjpcrK76Utbzxqoa6VQa19umjSrqJAXIjzL7GxmewrUE?=
 =?us-ascii?Q?d0fESYqEZc6gFOPpDUkdwPQBS+yYlkr+xcfJS7/BnliVwCFTwnRAhHrP9Gii?=
 =?us-ascii?Q?vN7XrwHHk8syNa8T80ThsGVrKdqCuKcXa/hfcwjWW2tmbHjWqF/T1SA7OdZF?=
 =?us-ascii?Q?7dPqG96Er7kVuz2dTMsCf6tjBcsZbeXNO+5Z+s8xjX9+/AVGG+baqIFVYFyl?=
 =?us-ascii?Q?dWRX0QKMwOd17wlqdkqEt8s+fhqiesZkkDjlQVlIK34sXXK3+xiyNe52wq2h?=
 =?us-ascii?Q?ZwwmG/+7JPOoSV8RriOVced6UYAEzxgMk2FZUCc/L8avNZ1iTKMNUoGNCETm?=
 =?us-ascii?Q?I7gZRmETIDjERD0C5nmLoDraC9FDt8vKcJ/CQZ1KkFRBOAla34qN4jHUZ1dP?=
 =?us-ascii?Q?978gswnFuw1Qsw0rODOTgPmd440qPxhGVKIGSEPxEOWl5ewvmVjnSsShypf4?=
 =?us-ascii?Q?ommVvAV8TBLoYGaJWTqq+Cs1XX8Xl+1eGBWvuhywYCViJhJRJTe3oJ+DLI6T?=
 =?us-ascii?Q?8Q3K/zIA2/A8H3xdeSeMRGHnQI0n/9B+dW9U7gUUCyUJZOQOlAqiZczhhwJk?=
 =?us-ascii?Q?c5NkfzsIwcqVQuk+b1A3k3VbVhxiXe9FL9FefgEuTNA883NGIGnetynCpIpg?=
 =?us-ascii?Q?9S/53QUjt4wr6UIOdwqEYM7PHfXXI23UIHD/lNOHInpPmAuYswEavnxojsBA?=
 =?us-ascii?Q?EvNAc9/0sd6CTngH+6Vzy5ri6RkBJNzcb9rEWqn1bOQvBtjCpv3fgYSWi+Zk?=
 =?us-ascii?Q?0yPrzVNde1oO29tfrlUfWqPnqXma5Sr41IIj5Tputddi4XclH6YSsYVS48VR?=
 =?us-ascii?Q?I8LwcNF6Ledcf7kJ2G2X2hotkAii0KPoNGKAMtVBLRZeircKCV+KjxmPfYcE?=
 =?us-ascii?Q?pAkG9IPhqfLsZvLcEft0NAHpUlezTkU1351vXDWqwvky2+16olaFecb4xatT?=
 =?us-ascii?Q?tQ8NmbDqkIN7qjwpW1x45ppc9EEnCTJ4MjpzwJaEMF9uSQLbrI+09+qwO91G?=
 =?us-ascii?Q?64YlCJ71vphQzSvjxU/0gTEz7VWjrtAAtlAeM74JESj7gmk51RlyJra2PykQ?=
 =?us-ascii?Q?N7FJ+xYWSc/44XKPwv86VbiWVKf5NPaKVasohOlQdQp5fWlvI8JSNdn7QIAB?=
 =?us-ascii?Q?JaEQRaklKfiIC0svchP4EuICRxUNZoklub1PPXa96t0OaV+6phVAYlq0nWoJ?=
 =?us-ascii?Q?YijcT+dAVT81G0PtLsRzt/1+ADNGW3djQESOvTXHO63k8w8/d2YQ51Aa3FrC?=
 =?us-ascii?Q?OzrQ5Xt6jOQY54SI0i0HDRVv8eMgyOF3eGRNY+3uY4izBW491DKxaZcoLGSV?=
 =?us-ascii?Q?PrTwvVdNCHJbpB2vZyOU6NxutUqTtSg1pCb5ugoig2oh4X4HRM9QJnXMllld?=
 =?us-ascii?Q?nxV3jA=3D=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d15ce8e-c8f2-47c4-61e7-08d9fa4db4f9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 00:03:10.9053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HI7GBWI6eGbUKs9Poi6We/N+S52LDEm8q0acbqpRZHwmKkygZOxtEnYr2bbMdXKTZQmPgI5Ucj8YURftsfMOvbSREjdGXjKlSBMXPYre7Yc=
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

Update the input GPIO that indicates Host ready.

Link: https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md#host-ready
Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
Signed-off-by: Thang Q. Nguyen <thang@os.amperecomputing.com>
---
 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
index c2b5b3dfeb85..a823571f8f4b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
@@ -860,7 +860,7 @@ &gpio {
 	/*E0-E7*/	"","","","","","","","",
 	/*F0-F7*/	"","","BMC_SYS_PSON_L","S0_DDR_SAVE","PGOOD",
 			"S1_DDR_SAVE","","",
-	/*G0-G7*/	"S0_FW_BOOT_OK","SHD_REQ_L","","S0_OVERTEMP_L","","",
+	/*G0-G7*/	"host0-ready","SHD_REQ_L","","S0_OVERTEMP_L","","",
 			"","",
 	/*H0-H7*/	"","","","","PSU1_VIN_GOOD","PSU2_VIN_GOOD","","",
 	/*I0-I7*/	"PSU1_PRESENT","PSU2_PRESENT","S1_BMC_SPECIAL_BOOT",
-- 
2.28.0

