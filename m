Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AED99489EC
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2024 09:19:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=YEA74uhW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WdPp13tVCz3cRc
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2024 17:19:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=YEA74uhW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c000::1; helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c000::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WdPn70PrVz3d8Y;
	Tue,  6 Aug 2024 17:19:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+wL/0zHUZoU1CHWSNwKTYQVbYnVYjePS+TCXyrez3IJfBsEMdgofLb5BRJTIWH43RGZ/v18pQXiD0eOonupZ0kq2+dUgn9+I60H8AEyIRMChMFSJkWXJ1T2s/cMLHGc7j1fIvSqLYA1i+0WRYrourQcF0S5vW3MyK7wjOrA0sbYMsvM7rwmaYhwbCKxt1Ij5laJMqMmRPDM9lcROTQau/0ncjSVqH3ZqwmrG3dQMivFux3kB+XULd2gEOJ7FOktqYDZWiCY4eGH5lQqqAtbXdX0eKx3SjcFpi6zHbf2EoN71cT2oHVYDOGtVVKZxGKqzwVFoYlYFjvWJ7Dp1b/O3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSlC+QZBh7PlW57YN4hOYbKZS4rHVDOeOH1Wlswriqo=;
 b=JEqjE861itQXKlrhlPZYVX+o3KIAvcn3LfkKPlmxg/LdDRW+N95oeR/QnH8xfr+qNrO3UuCmgAfV0aExfTqf/mPAP19itD683I48IR2R8kSFJPuUsiaFjQRNQ9WIAfajEEEBeJYWcCgR5CRMEm0Z0dzfMMZRTMFRDJmPn/PdAkKGVIxWsFwAv2uivAdTishujcuW6o0N24vz43HJt3gwKt1zht9cB1Tqu2R/3Q8OjVNL2Z4XrNB0VhM36Z8VNnG42NGNxZxTLOcoY5Pj8yV4hH0L5FbpiBLHAF1tRNf43LCNhbJxU0QlC6cI+iTLmtAKzIhiGOWLRISVaLyhvM4SSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSlC+QZBh7PlW57YN4hOYbKZS4rHVDOeOH1Wlswriqo=;
 b=YEA74uhWALUJNx+1x0neuzXuu426fB09XMb97kH8Cr2OxCRiTRXXUkT7W3HjEEClV+FjQdVeORbqpBK1o9Lk0n9jn4pqamL137FegN9q1BoOoZgZVZuJyvZu8AgiIFS0WyA7MwqkWAj4lCXwrC8drdqfnTD1AA6a63xvNWHvOR4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 BL1PR01MB7770.prod.exchangelabs.com (2603:10b6:208:399::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.25; Tue, 6 Aug 2024 07:18:41 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 07:18:41 +0000
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
Subject: [PATCH v2 0/5] Update the device tree for Ampere's BMC platform
Date: Tue,  6 Aug 2024 07:18:01 +0000
Message-ID: <20240806071806.1666550-1-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0026.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::13)
 To BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|BL1PR01MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: b09c0d08-0c2d-4bae-941e-08dcb5e7ff93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?M41iYkBSHVL/v/ih2HbD5sBAFpnTfumFU/Z12cajDp6o3rfIXMVDvRl9/vSE?=
 =?us-ascii?Q?89FB9A6LCrUsMfWqRh0mLqwBEBxBFEOnyNC67xJCOHdqJ+7q2RwCOgnp/oAb?=
 =?us-ascii?Q?9pmje1r7mBCrcskMnpx/b7V0P5iEnKNWGqKDyoN5aT+Q87g9L4MMUwdZJIOB?=
 =?us-ascii?Q?1Vbu70YGlEsDBcZG9qOnW9YYsRBHQdPbcqVHawmLU69HrbUVMBuwV3hnKmX5?=
 =?us-ascii?Q?s0POYQc3PuuyOpU7Da2TT3GaznKAka87tA+gHjP+0NiIJI1W4Fub9rCA5WAP?=
 =?us-ascii?Q?aI27juYLn5EThEkQJRHTx1iLHfaloO6qGVezqRqNGB1k55OHnEtUrXAGcLJq?=
 =?us-ascii?Q?TvR6wZ1Yes/GOAnnTN7qIeRRbtW/452hrshBTBofKk3U4gMLLaT26hHGwvWe?=
 =?us-ascii?Q?1ORGj/6axS48MI/hc8hxFHv6TiZmsxt8Z0Aasdh9KIwmcBbbKNyjuE9oGekM?=
 =?us-ascii?Q?IVXA4SRUomhAtlLDpsPm3HDUzDIHbNmiEVHEYtNT5ae8HH+8/DFJj2Ry4OFE?=
 =?us-ascii?Q?Iuop2rZNvCJULkadxPqzMNE8QwbgiYEblFSBc4Z7nMTJpZGnLs8ZawaNOigL?=
 =?us-ascii?Q?6Qu2jAaukV7aIv2q1kBTWfIiyg92/EGAsCQA1UhIYRiPWaqx2gdpNoYHDk2p?=
 =?us-ascii?Q?Xq8lbPOidSA1OAwHBhzNuxn91DisC7UdNz/Owiq05/72FG1f3ipbeLvXbeB+?=
 =?us-ascii?Q?6g7NM939FUgJXZ8CgcGqs5sRcDgbq3qkBknDpXuiCpLmz6RrXpMszqfHoW+7?=
 =?us-ascii?Q?mDD44SvKzZtUsnCOrfyLplWvYi2sAD2k/Vs89nS4mIdYEh3izvG2QaCE9yYW?=
 =?us-ascii?Q?ou3z+UgzG7pAdCuyyF7hkYxcECLCA+dbwIo9W0CelyussZGdXneXTuvfXyJ8?=
 =?us-ascii?Q?+nyrKZfUkSrYsA0jZIS0y2fdDla/yp6h+XTN15lSy5EVEuAx4T+/1xly0Mti?=
 =?us-ascii?Q?UmWgvyZfBidJoiC4MSruXzGa4HRmXgh/q4gK1/YUuYp407mVh7hcPREmsC7N?=
 =?us-ascii?Q?B+VFOr/iFQKKR/4ktqoNOpCVCA2mGMkqXZnQKBKv1p3wZIkQEViYbzxKLrQA?=
 =?us-ascii?Q?vJoBMWH/uQ7d5BdSr6hwcIhiNQt9C9z1B4FwpyGf33uXrmoHgX6ldc2Thb78?=
 =?us-ascii?Q?+BnGqJ2vENbd7kvEXdEWQgeHh5nD3uWKdg0YBgmhH33sgBlnWgryqv6rtn0G?=
 =?us-ascii?Q?Eo+98NWp4c+bv8ZHbl43NUaPlNgbg79MPAPV9lzyGTBHrVkK5OTsax4/+Rqo?=
 =?us-ascii?Q?6Aonw9Kai64w2CkiDQ8aut9GHu6eOqh8FPh1bf+9BDmA57qluJ4cBE2xDw4s?=
 =?us-ascii?Q?563cOjdZE/dyQVjX3TCyq8D7StGkYS0s8qUrH9J96RKEhFZjG7w+5ieq/UOa?=
 =?us-ascii?Q?516d5XQ8j0vQeL/+hYzpL6M8oZk87IJ3B97hvodBuO7Ucy9HGY7z3q3eA8Zx?=
 =?us-ascii?Q?33iatZNhlsg=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?dH4pYriJ9trio2IfvS8g2G1vQFDD2upkJVG5U/xGUkvwQ+agJGl0LoNR/2+j?=
 =?us-ascii?Q?eazVUQAQnnjXzbY5QzAaG9aHXtUNqWtfSuZiKsrvYdnu4/VuyAt72MdeZhLH?=
 =?us-ascii?Q?tzFlvqb/zGMvzLKKAh8GYq6Vc/yy9V0IBXkv9/eAyQkBoCORElKtnq5LfJ8H?=
 =?us-ascii?Q?ftV/t6WD6QWAEcGR1d8NrOrF5aMz0tPWrTXuGe59v6DXqnsr7/ABJOKDtc0V?=
 =?us-ascii?Q?KsgQT1YOX3kDwvMjHu77W7ospWCwby4U2YVcSeecn306W8TrPldGZKVy3Ye3?=
 =?us-ascii?Q?quaG8fF0g8QfZZJg07PKu0xG/bM6CW5ZkgLlytQXYhbCE3xA+n6DYaQXteuf?=
 =?us-ascii?Q?k+HxfXov9YZCkRUlOv1jRMeE3BoKjY8G6Q2MVRuqEmr7FLcsi5ns99X+oBku?=
 =?us-ascii?Q?kibn4eR3yskfCKYzVnDwYch9zRhH6AqS1wkPrMjAtk7ewjwHDvuZdRdaaohB?=
 =?us-ascii?Q?tyK4QNbAo/OW79Ssw/IgGU4zzfU6DSHzo+Mhpe3VfAzGtxkLH8DqQqHuZ4py?=
 =?us-ascii?Q?Lel11hzVAPL4frh14v+5nlT/Xww4SDsqG4FtOFlKLBqhLQNQNQf009wI364p?=
 =?us-ascii?Q?cBywIRis6e3l+9O4rp2T9jvnfHgvPLOwF6lMS108b644ISepsk9bSBPCdMWi?=
 =?us-ascii?Q?xe/D6Vom9nxnn6WlsMV5tEfpP6qPJfoldTYVAixeAFt0fHrOK63MznS5c0O8?=
 =?us-ascii?Q?RyGW4MK/pshJ8puJjUK0JW/Xe+Ttuvd8Sq9grYAGIs5WzZd8bCpQ9MFGRRPN?=
 =?us-ascii?Q?L42vdZ+VJ4ujUkXUktaLYxTfjqKdeiKoKwynktj8U9QcY7nUaskmgURng/UZ?=
 =?us-ascii?Q?sAjqRBem+OcgVuKdYj+vr/45avQuLkoiTWItnC2Q4b4v7/B+dry2bAhB7E1d?=
 =?us-ascii?Q?A7i5BrEYW8X+ZxU+YbsVa+djw8DPsZD3MPp+hFiTpQgn6VbPhZVkH4Rz93OY?=
 =?us-ascii?Q?C+UY3bjtVeUgrGAPIFCnOZHQ7Py559m+MzMnrre2EBuuxRC12vlRAfaz2cNB?=
 =?us-ascii?Q?8XWo7QSt8uI8Ct1yrFqWAIqW50DVRYm44/S+BuYdE3rAD1sdX6quFwqXBVqK?=
 =?us-ascii?Q?uDClkWMlTr10/uNIhia7RLsr+A3h2bxgcT8zCIOiSOs3PwzvTAUIOqdsQ7AG?=
 =?us-ascii?Q?sF+P3A21CLRucyvrvw2cg4a8ovz4vFlU/NVQoUBmNpz234W8K2im036Ws/Uj?=
 =?us-ascii?Q?SdsfIuvioyFe8plHFjDga4Th+iFLPMHC3CW7n7DGqYLRGueLu5A0Kp4tAK1S?=
 =?us-ascii?Q?reXHgncx/7MNdN++7lQtYG1xw/T/GoXzX7P2Pxm2RBvjPQ+UB3cgBMrlLj0m?=
 =?us-ascii?Q?XkslOoWMweStjUylLyinNAa2MgX/BYMJvzS37SKtlwDu7JBKjRSvEAso5bqe?=
 =?us-ascii?Q?qMcdxHANwMgsvCPNyaNlZmBAVH2b4jQCQZPxOf518eE7EEHod3a+PoMyKcc5?=
 =?us-ascii?Q?P3GF2rIdFKxja639586cPv338tKbzWj6es9/iRw00wxFRDc+n+SPZ4k4lkTA?=
 =?us-ascii?Q?lWv0KKTXd7I5+ab4OkRMGAWISXOknPBSjcGrQFABAWLrIbxvjciTyTDVFbEh?=
 =?us-ascii?Q?gSwubG9lzCSJSh8lMv+i1Im4vfiST5+fc/ADGIIHm6vB8TjLyjdXGy2dwtz0?=
 =?us-ascii?Q?LNvZW3PJfD9qEZFm+6MIdpw=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b09c0d08-0c2d-4bae-941e-08dcb5e7ff93
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 07:18:41.4229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w47FJtFyjPu6ErnPYYa5Up0avDtHAG6CO3rPc6/DIX0Hx/M0u3yIHllvqGDgR6GhCQTiw0oOl2NHnaiP9TJlak2eWgJCV8WZSN3yL9FjO/2k49ivLb2mDMzfbSS1AILu
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

Updates the device tree to support some features on Ampere's
Mt.Mitchell BMC and Ampere's Mt.Jade BMC.

Changes in v2:
 - Add eeprom nodes to the riser cards and update commit message   [Chanh]
 - Remove the "Add I2C Fan controllers"                            [Andrew]
   
Chanh Nguyen (5):
  ARM: dts: aspeed: mtjade, mtmitchell: Add OCP temperature sensors
  ARM: dts: aspeed: mtmitchell: Add I2C temperature sensor alias ports
  ARM: dts: aspeed: mtmitchell: Add Riser cards
  ARM: dts: aspeed: mtmitchell: Enable i2c10 and i2c15
  ARM: dts: aspeed: mtmitchell: Add LEDs

 .../dts/aspeed/aspeed-bmc-ampere-mtjade.dts   |  16 ++
 .../aspeed/aspeed-bmc-ampere-mtmitchell.dts   | 154 ++++++++++++++++++
 2 files changed, 170 insertions(+)

-- 
2.43.0

