Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C5957B344
	for <lists+openbmc@lfdr.de>; Wed, 20 Jul 2022 10:54:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnqJM6qbGz2xmr
	for <lists+openbmc@lfdr.de>; Wed, 20 Jul 2022 18:54:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=qfmNmm4E;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.94.111; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=qfmNmm4E;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2111.outbound.protection.outlook.com [40.107.94.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LnqH124Crz2xn3;
	Wed, 20 Jul 2022 18:53:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMRY5JdkYYDUXPsAc/2dB4SHAhkPvvGxu640vObUcS4GFd3on/eIlAJg8k3JfPQaq0PeSY7XJoLfVweLg5W1EdbgR4q0moVcE0N9HJZd6QLCoLoV4AHztft4ga8nCfX7KfX0eyPsWQCZ0wspUtpneDnSWrZ7ZcC58WV9Qd5r2gRECh2uHGKvVvA/k3gG9xkT+5f6sIkSIC0UMrsJ4AHZcI0FTskuxAvZX+U2gS7FMNM+iq0tl8eCj8Jnoliysm7NbWYT3d4LE0w+UZ3CjSAMFuvqVKtmJ6iXa7LW65BsaEAg8Ox1ajS2FDjFOSv7lk/qo6anbXlI3xR9Ut1mMFvCug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/I8HXa8k6ltAT61Ec8aiSOKPwzSJUCQAD6CVDu/Zss=;
 b=N5W9rFL0j3ipBSl39HCOdhx+qbmXR81xp2ZcAelFQ8MeFxPVhcnHGgag4gH/c2vPDyUUmR6vnX9I+aITEsilhLMGTPMLvChbIHqNzcGtAceDqd0+X9zREcF089DnX/DIOqZjzuSu/jYYdbLo1/olJvSLTgPgrrcJ3j1+YEQ6qhO4hakEKlYDpUEM9rdsvinOtupITMkAvFmZqwKXlhF/44UtWsY7eIZX9U4YchJmzsmZhvxDHu67kSAWcMI7p6usNdg3aWpAtSHkZvrp9dKlJuqT6SKg+IjLz/FG83HQUWWhoKi8g0eOHxAt/9ufmIqohxhFr6y1dyDcZdFlQvMk0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/I8HXa8k6ltAT61Ec8aiSOKPwzSJUCQAD6CVDu/Zss=;
 b=qfmNmm4EVqxEnKQeLZLyqROdRAe6b+JAoq9QXk/gGGE0wi7pVtAAOOSkwmmTg5AxH/TAWTS61JR1OJYbngm6LXBpxBHGq48qcDkIlc2Q2W5q7mC+KZIL0bbVidOv5Qyxvm/FT4ivDk7BYTdzq8rLJzxc7BwrJjGE/TU8Lh14uKM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 DM6PR01MB5289.prod.exchangelabs.com (2603:10b6:5:63::16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.17; Wed, 20 Jul 2022 08:52:59 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e%9]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 08:52:59 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Quan Nguyen <quan@os.amperecomputing.com>,
	openbmc@lists.ozlabs.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: aspeed: document Ampere Mt.Mitchell BMC compatibles
Date: Wed, 20 Jul 2022 15:52:29 +0700
Message-Id: <20220720085230.3801945-2-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220720085230.3801945-1-quan@os.amperecomputing.com>
References: <20220720085230.3801945-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b748bc2a-500f-425c-726a-08da6a2d3ef9
X-MS-TrafficTypeDiagnostic: DM6PR01MB5289:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	4p5VekbN6ZjhNdzivASC/ETmPX2SKGd15SDjXXU+QDGR1PR7JRSlQy2HDD2T8uiwZWCUAMfN+Ex4DHBTUiESb2julHzXK2JpiUbvR2EYKOUfTtVd7/irTg+fnHhCpQ3+f/pKJqqzhMZWWjpyPqLdU5rHLopBUJt5JBhCNFqTjDZSB9O162suzbU84LzBv4F4TFQcXXIvvBcljhMG6SBVmf3Me82g+J33I56JAUwmUDXBkHjYAwXvsRDQXO1whrRgTgscMQuzpb91S4+h08dCmeHSMApx3GWTzh1kB+M/5CEe5JifB1HHqWcIbYyDyZG+MJJ2rkZhaF0QWhdcmw9V6LHNZZFNt1OXQA+Bx2GkQIsGL+05BAiWvwE7xAWMlKf8MwKiCQMDhR7UX0/al5bx/gIfQUatRvlr9vDRQyZEs5htPBAsI4UB/NzbMkugtp2fsvcLYiAleuWcwm576wpnXn2ZWQJ+qiAoM0gzr1gtQKuqbqo+/eqJqYt+h7lfOSUCmn5dag6yGjbDhKZXya+Rxoo5crO70+9FLpQOs7jvI4aI817hQdkO99PpigdvudySkosGSFxBPywB0zsIu3HTPWWCA/gKL55R2Car/h7+H5a7PpuyLfL5YBhMYVac8igmfJph09S0cngwdt0p0cMTUVQD4vfYnY1DMhrvdSPgjzEvDwKM2XiHc8LdygNly/ck+7oAhfIMTtQx21jlNNjtUyAwhCQAU81xCb0eE7Bp8SDm9wmIFnlfBWBnxH64r47ensXYcx9zOdfkQskkFBu0Fg6q/9cfXhWE+2m8y5INrSBkINLqJlNgDE9OOglOEZ3OG27f0gMrTu6PsinKzUYnEQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(366004)(376002)(346002)(136003)(396003)(7416002)(110136005)(38350700002)(6506007)(41300700001)(5660300002)(38100700002)(316002)(921005)(66946007)(66476007)(8676002)(66556008)(4326008)(2616005)(186003)(52116002)(6486002)(478600001)(86362001)(6666004)(1076003)(8936002)(4744005)(2906002)(26005)(107886003)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?8jP598dtVLH3cEM6aw8pcdwdwQf9hlKAX1fA1CGufJqtSc1FSdI5o0JQiftq?=
 =?us-ascii?Q?2D1r9uaMrVRmh0iNYI2xgcimDK88gSstwD6afVgpcBpP92RfKdzdn6szD8M2?=
 =?us-ascii?Q?o90PWTobifGKY/uocy2Wqms8VL7bolNGM9P5dBxuKkXxzUhBZu4Rdts1PB4t?=
 =?us-ascii?Q?d6rLPfZlweSCXX7S6QyB6VpPS0WpzdiQRrSyhxnJy6Dwgg3x7wcQBbaWA9aL?=
 =?us-ascii?Q?1TS1NQC832mxfVBPn59CVznAzAf5X08G6nNu/8IZ7YDHBq6Vk8ps1Qk4fsOd?=
 =?us-ascii?Q?6CjDsqIEJV7H6meRP/+6i4QcnfdPrDW+gxtfsN/pWyGxPmBuoMlx5sPPPtZ4?=
 =?us-ascii?Q?LQL8/7HVeEp/VxMqB4UD7PKzzoYW9KvNWjS2kl3jnM+Rwl9iRiUBKDerzUXi?=
 =?us-ascii?Q?WD0iAbkrOUQNLdt2JtMKbvLl0V5YfwuDP8ej2ai3zbVEbkhJhFNUC2YuYsvk?=
 =?us-ascii?Q?VAqibMxsLCdRhUTfpSwshWUksa/ntcEUvn/Sfyxd+ptANrXII2NEBTukROzP?=
 =?us-ascii?Q?EVB/igehenrixWtgxCb96+B+/AichIHJUhIM8K91QbK+Q/9pfsx0obWepFme?=
 =?us-ascii?Q?BwAv3OaxfXW97ZqVZspBFwUt3MXCiyo4mNVB5ZAV+Q7XMAbt/GOsWJm2fV46?=
 =?us-ascii?Q?lNLLZCyGJRdq2xZEsVRPXOVE4tY91L3Kq4UUre4Odc7CzEKq69kz8Pine0P3?=
 =?us-ascii?Q?+dlDZH3uxCnkfDBZwdcN6Hc0rwXsJDnJaq2Zoj7zhRnlhAxAf3cSr5q86ooW?=
 =?us-ascii?Q?5E8VJVpz69t4nDAC7aNDxX9yg9z5f8cufdpp3M2tDaRHXHG340f+NNksy3IG?=
 =?us-ascii?Q?2darhAVj44Q8yiqYGBFyAlM6BovR6oY6/TgqkqOUBaeDOg0vgSfBrp0ovs1t?=
 =?us-ascii?Q?YDzqwYIJugD3STAoHOEEeaiIN2M1gdlHv3J3Sh1psWUtoW5H6DQ2m8oaIDkJ?=
 =?us-ascii?Q?smsMHtTYsPlwDzWxlv8qwSZ7YMhAKToSihTx6A2qno6Ilda85RdDo4CrIYL6?=
 =?us-ascii?Q?W4a8zoQRmfXCMn1GU8t2L5LNxz2qdd6g+a9rQDlW36qlqJNkSDi6+9lr0TBX?=
 =?us-ascii?Q?jX8cI50YrOOJuIaU5zUObiBBKNN8X6T0doodbNAF1LwLdbQ2LtXGrjgpMy2a?=
 =?us-ascii?Q?vZ8VMO7zSYeygbjWVBjH/G0WKFMy8TbdKCljFxiNkNI/e9aIesG/aVGFk29c?=
 =?us-ascii?Q?lm4lZsmHU/ipCIY81Jrs9/qz+SNgeywfT754xNQgUUF3r8uKqpuundRIX1Ne?=
 =?us-ascii?Q?vvMA8BmRsqj/eS0E4x8udIiju5RIhCeJKR4bFJ81NWPsW6sPtFjmBkYaC9+w?=
 =?us-ascii?Q?RqaTF9PaMquza+2flq9jYNYZACo0NzKjjhXAHSqHKSHFUPwSfUiXcnMgzcwv?=
 =?us-ascii?Q?Qw30J1rLpiS+2gdMafODL4jLqK3TY1sYnH6YM6LS8oIOlU9tY+JEIANXOsO2?=
 =?us-ascii?Q?lS96lcMkLN6XLGNu2koJVIRu+lFBEzexfTDYLA62zFp9mHVpem+MPegG23Ej?=
 =?us-ascii?Q?DZbn5Lk6osUNNThrY9Gc3dW92zwBvMlGrHMsE/V51kum51bPMfqI99MBeyh/?=
 =?us-ascii?Q?7frU8ZW3tN4QtuZJA/sT8EHvwssNd5L2fSagdJgX7ZfUn7P0u/QQU0yzI6tG?=
 =?us-ascii?Q?gFYNn3O1B5icaJVkAXSpbfc=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b748bc2a-500f-425c-726a-08da6a2d3ef9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 08:52:59.2859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0e9PUNR2BnpzcmqpMgpmhNqwzUJ3WCo7FxNk39t8vmLWNDHJqvOxsk+AbVoRz0/lR9Q5Wx7mowac4ePwdCutwXJzMoQQdHoDUH5CPJv3/Ow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5289
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
Cc: thang@os.amperecomputing.com, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Document Ampere Mt.Mitchell BMC board compatible.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
v2:
  + Introduce in v2 to add Ampere Mt. Mitchell BMC compatible [Krzysztof]

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index d61408194998..b8146d5c4431 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -71,6 +71,7 @@ properties:
           - enum:
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
+              - ampere,mtmitchell-bmc
               - facebook,bletchley-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
-- 
2.35.1

