Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3DF47EB50
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 05:20:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKv3m1gwWz2yg3
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 15:20:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=AnF6YvZ0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.220.93;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=AnF6YvZ0; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2093.outbound.protection.outlook.com [40.107.220.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKtyV2fYLz303F;
 Fri, 24 Dec 2021 15:15:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZWUao/TizGJtDBBZAZJvK3IFL7+F8umEELei7i1OEyCuB6bPPBdiZwnZfizREvkriHE6aETAl3CRUXQrch6CTz54U/1MoVZ4tKxUI3jUDrehfXwSn9W/U8vFNC+pVT5qOP/eTenrUoD2R2EoIPjIsvveq4mxPS1ebhBR6wTwgptz/nTbRSNomJSsS4SQpJM4G+N7zBDZ1LwvKG7rlOtC7w33+4Da3ADJMEvKJqzY4028I9EZITbROb74gsYsevv94ahydPfF7ovxPz94uG6KETMyeY8HYcuHadnpGYhgk79CclV3ZKRRwq2eCjntHnDEx8cHrq+en3JsHOovcvz6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0m6hg2N/AGxBq1YA3Oi4cH4LZf8yHO+dWJhgmq1b3M=;
 b=JkjYHtkAONd41LGCdLwtmbU54oiCS9H8vuMVdCZZYM7xM8GZomvlmdSB++bRIAEbIEonc5kA9MltRMYOhx65MLp9muBIvIU2fxabfS92QKouok8RIM91H1kW2nm/XvDOxU0ByIJDmCtWOSKVhpq1ZlW98FZICeWI47ZzkBkmaU7RcGFhseKm2jVw+2KEIJI/skL6Cbo8vAieuuvl+ipb2SIOrQRDDtIE188O1xBqtE1MbqIYrNyu56ac4zdqGAVSbMbl7BrD/5YATQ7aJbTAXJLBW2RjcNtW5WJ6hhcHCNRXA+MX6UgscOj8H1Dn1r4sF5qxSp5hyMBISNfj5DW89g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0m6hg2N/AGxBq1YA3Oi4cH4LZf8yHO+dWJhgmq1b3M=;
 b=AnF6YvZ0zdIbeOHuwwU8z/Ei7hEFGdYwnlKAhnDIv7O079tT0Hyzl5F6DvdOJSO7F0ExH1hbxV7O9d6BoiMA97PPSPEnY3I3AqLTRh8Y+NAIqlhTwc4eN5SqdsrUDvcmpn4gURMfhBmrN96AaF7vXkhi0psZHuqZp1xbOzCTxFU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BYAPR01MB5189.prod.exchangelabs.com (2603:10b6:a03:78::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4823.21; Fri, 24 Dec 2021 04:15:17 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f957:680d:69b0:9999]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f957:680d:69b0:9999%4]) with mapi id 15.20.4801.019; Fri, 24 Dec 2021
 04:15:17 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Subject: [PATCH v6 5/9] regmap: Introduces regmap lock helpers
Date: Fri, 24 Dec 2021 11:13:48 +0700
Message-Id: <20211224041352.29405-6-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20211224041352.29405-1-quan@os.amperecomputing.com>
References: <20211224041352.29405-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0134.apcprd06.prod.outlook.com
 (2603:1096:1:1f::12) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ae92ab6-25d7-4939-4bbe-08d9c693fdfe
X-MS-TrafficTypeDiagnostic: BYAPR01MB5189:EE_
X-Microsoft-Antispam-PRVS: <BYAPR01MB518984E8B86706CE83D2CC39F27F9@BYAPR01MB5189.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:229;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FYsuEC2P2WngFfY+pK1uXaFknqPHLKeMF38EDtvmHW8Ms/H481bAoZyDzGp0iBqi09Trxm1uAOebZmH5qqDu8fnMp7nkcJfCTeIop3E/GacdFi57dLtGSvxvmTz5tUNMa3s6vm1CJzq4kYxKfOEUNFSVTOZ4F9sYDP+OJ4gKfbmlqQB85kynovg/OqKud7jmKBFvQRNYJzib+O0gNmZZX+/yTPla1zTkmBA0tzd5aGkt7i/owODYeoNQs5+CzsxSMBEBbWZpr0h+vZ+QCNDzReTXBMtNRX7oUBcswN0udkWsOpqk+xD0anuoB0N6AOdaPG+6WA+kIia4pBgWZsIbe7cOuG6h918EEGxJmNQi0oiVwqTmVK2tb4yrNcm/XEf6RVB5JFXY+Eb5xDYnG1mslyRHUwRv3lyoMDw46Q1Uigodj56qrvNN9SEN9ZthyTY/adfYBf19s00j2SSaz4OqI4uZmwB7X51IIxn90Uz4zrWJekb+/XCatZ7Ze5VRX/YE2brHtAFtWb0GDU119SW7wOL9ESy5BVJKDXarW/o3TDjcLrufHik4UpcDmEuqU7kHWNvELehYwdafp+z/xg6wajO6BHjCnFLfqtHQ6+igIGnnNjQei9gODLmaNluPBkuy5LMj13jTvwZLtipq5/j/g9H95q1Y2a/byriOoyHo+aDCm4CgFZySwFzsHAXH0291KUGxIWjLXEPGtfo+Omc1q4QkG4PuV+lSTme7HQaTtmM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(54906003)(86362001)(38100700002)(38350700002)(83380400001)(66476007)(52116002)(5660300002)(107886003)(2616005)(8676002)(66946007)(6666004)(66556008)(2906002)(508600001)(1076003)(4326008)(316002)(6506007)(8936002)(6486002)(26005)(186003)(6512007)(7416002)(921005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5prVHqeWQwOlYA4qG3YV7qVjM19x4bYHLTbbjiFNPqHAz9u97cf9KTzyYTaz?=
 =?us-ascii?Q?rLvYjddDQrK+CQ7kESxaR2KZyXtSiQzJtjdnn02NVW+PBw9NSk2PoGWdw8sG?=
 =?us-ascii?Q?OAgCnDwVnmxpLYJG1ReqsY2huZcjxnsP5WIIxN0hxRnMPmJBWHi3PtPoH5Mm?=
 =?us-ascii?Q?Gm69UutJSdArec1gXwxw/PKcls5azYamgLmoox3MwKMfaAe9P13ro6slAS37?=
 =?us-ascii?Q?gGBzW+kuvgC8O5v3qwRFBraqWmTJF2vgiNsiLkAEOp+GypSqeHZP+pv0BNGU?=
 =?us-ascii?Q?PGkn1228+bJeEE1PV5qDbyti17VHNJsPuLtwCUkw4F+vGLl6NKC6oxlikU+3?=
 =?us-ascii?Q?9mM1aSmjQoUceM92rdOkTKURmFK0Ix+4DV9ovwUyUy0fBjG2PCUvkesV4gn9?=
 =?us-ascii?Q?YapFOjvTDjZSQFzaGDW/oN0XO4OuR0DFQqPpZ+Rl91BYNZPWNjMxXmjtnJU3?=
 =?us-ascii?Q?But5W1ewfnzGrdyftAYhi1iNU/GQHIsn5nQlEmkMOOTareVzsCPYJuFESgsO?=
 =?us-ascii?Q?O5G7K4JdW39MUg0/z7142/f2YPYJE8VP2+4OE7Jner1tFDcjFWUVfzUe9vnE?=
 =?us-ascii?Q?eUVtLhczXJJ5rovJ5JZkNPpru2THbJhcDa/I+cDJJY8/c0kx1XlZ+EqnZ610?=
 =?us-ascii?Q?s2I4S5xlPfYN8FfClxmEHtSGDPRdIVEronuOBmNkBof0D/Z46bIkvn3f/NV7?=
 =?us-ascii?Q?/52uuW5SP8twaNPBXbCsfTGZ1d20PeDTuHZw/7ETsiyFAU6PoMaUtTPC7VSW?=
 =?us-ascii?Q?S46uz/yEITPCii6+nknDtNtdeG/Nip9U1bTKF4uIJMT6kYEgp/JmvNCoplCc?=
 =?us-ascii?Q?Bqb8nzyHkHPQcrb6mSWRuQF0UdNfVgj5E8wCWNZMSatkcxmwFRMoxnY4vYxr?=
 =?us-ascii?Q?vc5UbztXY1RMRD14Zrqb5YhzTKTdCz0zlM9ox3WaHFIiqcEBDdsAi7j37cpY?=
 =?us-ascii?Q?jrvYUfNkdrbhsM5nPvafa2J/IBM0alq9wnym5dD1rL9iHUbaafZClTby+4cl?=
 =?us-ascii?Q?h00/C3sugiDsbWU48+ln6GJNrxZFY6Hi5EI8Z2Xonj9r3aLTXKCImqeOdHsQ?=
 =?us-ascii?Q?rLtOLwGSGE3Uk5z3vmdU+F59obZvRD1vgwTqQMOiAZrRcfI6JKT+SH6aKVL8?=
 =?us-ascii?Q?fPqVec6jzaCsFZlTUrOOLP7KIF/GroBW2I6BW6Bln2vr13KGPVbhBFUoFqfm?=
 =?us-ascii?Q?R1UGW02WmEHI2562/47aOaORRBfleP7MQlFMWa+B5jg6tIsFud6RuPOOOJJg?=
 =?us-ascii?Q?IvUR5eveLTrkyvP91Mus+eHUO0K/FWGNjrATyprs/bpN4292RWp1F3SBeuoG?=
 =?us-ascii?Q?N6fIO0TTSbtt2Dqd0x+E7qJg2thgykgQDklpzjlM2cew5rq2vXIX70ImtJ0I?=
 =?us-ascii?Q?gLVNgWQHkx9dSAPYPifdPoOLF8hq0ZBhz4HMcu1cq6+3SVkq9qjHOtcZzLtE?=
 =?us-ascii?Q?seDqgoPfilGolm+KiLcyHjb/ouivq5OHLchWnO4WTR8ayyxrt+2cdFp5xQ4H?=
 =?us-ascii?Q?M1VGDEz1AGvp/5dw7Gy8nEPt8jb3JtzMYqDO4RhPjh0dGI6Xjx5jBI8CAYcs?=
 =?us-ascii?Q?5i7kYqPQXTpgaIfJ6MZQMqXRbBDHOw3dG7+7MTozcmcYaCPbGzpfDW9DOPp/?=
 =?us-ascii?Q?EliDFAiimGgP1Kb7hCF6/haWsMkH4xmlQUbOy0DkgF1LFXS4DCjpVU1jHDSn?=
 =?us-ascii?Q?5VuVAlTBDwqkcZgc2lUWwESMRCg=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae92ab6-25d7-4939-4bbe-08d9c693fdfe
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 04:15:17.6579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08mA/gR6HXPFlYnkzbBCCH6JdgE4RiSL0biWXEMdMHEqaxg9vyYj/23RDCR6yq+esJj4Y2Z3WyfpF514YiVZ8OywBl8UZYrRAZQdoL7fot4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB5189
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
 Phong Vo <phong@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This commit introduces regmap_acquire/release_lock() functions and makes
them available for drivers that need atomic access of regmap registers

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
Change in v6:
  + First introduced in v6 [Quan]

 drivers/base/regmap/regmap.c | 12 ++++++++++++
 include/linux/regmap.h       |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 2d74f9f82aa9..36921309725b 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -87,6 +87,18 @@ bool regmap_check_range_table(struct regmap *map, unsigned int reg,
 }
 EXPORT_SYMBOL_GPL(regmap_check_range_table);
 
+void regmap_acquire_lock(struct regmap *map)
+{
+	map->lock(map->lock_arg);
+}
+EXPORT_SYMBOL_GPL(regmap_acquire_lock);
+
+void regmap_release_lock(struct regmap *map)
+{
+	map->unlock(map->lock_arg);
+}
+EXPORT_SYMBOL_GPL(regmap_release_lock);
+
 bool regmap_writeable(struct regmap *map, unsigned int reg)
 {
 	if (map->max_register && reg > map->max_register)
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index 22652e5fbc38..0ed12e6ad4fb 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1194,6 +1194,8 @@ int regmap_async_complete(struct regmap *map);
 bool regmap_can_raw_write(struct regmap *map);
 size_t regmap_get_raw_read_max(struct regmap *map);
 size_t regmap_get_raw_write_max(struct regmap *map);
+void regmap_acquire_lock(struct regmap *map);
+void regmap_release_lock(struct regmap *map);
 
 int regcache_sync(struct regmap *map);
 int regcache_sync_region(struct regmap *map, unsigned int min,
-- 
2.28.0

