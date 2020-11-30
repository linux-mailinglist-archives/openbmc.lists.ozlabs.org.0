Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0D62C7F9B
	for <lists+openbmc@lfdr.de>; Mon, 30 Nov 2020 09:18:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ckymv3C38zDqgq
	for <lists+openbmc@lfdr.de>; Mon, 30 Nov 2020 19:18:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.237.135;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=cVZf2hcG; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2135.outbound.protection.outlook.com [40.107.237.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ckylv6XRTzDqdx
 for <openbmc@lists.ozlabs.org>; Mon, 30 Nov 2020 19:18:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWJ6hRpT3MHYdtLmfFTaXmN5hjHpnJO4hWNPNZqzQNnkSh2AAQb7Gxyeb0Shucx7DMK2j1CMwWMjrhk7WjfgZsjMUcaA1Utddn/CSO06DQyr43ICynYlp9MNPWIYxmpD7LvnMrGU9fkRfvFF/EIS3WoAP3Qow+R1fsaDJAySwtnEwKkQWKd0C9ag4KOPgFf5IXfEmQSwo24VZAd19yi/mZ/v8BuLJMH4CERxE1fH3cHPBGeIQO8tuLJhYKe3Vw5HsDjU5T46Exv9zfPzSy1C6pk9jMXmbdYEu/QVirGu3/tzNku6rD66q23ypsxMlppThqhdKTPm0tHuRbuiwap7Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9WUnEscFnGop65zrOHJLqah1JWl2/8rN5Bl25AXxyRk=;
 b=Hv7ERdrcElEBTjjCf1SCK+rYxpc5quYzm5BoQgktfqe3gO+QANBTmIHwPUFGgKDI8oRj+99vaic7L+/Z4tq+1E4B8js6ZA0eebzIiWGbnKEPPQgCv/XC7jBKw6Lbtawr7dwp03z9ZkEzOXyR24XD39PlnnOMkQzfzvIa/I4SDst2KdDGzTc737uGxLGLxqOznmuZ8SyliCUEZlq623rinwsT0ksCIa8apmd9WJqQNtVe5WFPinHWwDXZWIAcPj5wjeB5lhos5xyPI+dVYkgP4xc1M+/KsNi4YxtM7X04UM3FqhyW915/QJy7mKMqN0dOPZKp4w9PJRu4SvHcFYA0sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9WUnEscFnGop65zrOHJLqah1JWl2/8rN5Bl25AXxyRk=;
 b=cVZf2hcGXGBjp/7N9u5pMgEFjUb+cTxeh/rtY6XKHiVI87JcAAjHC7wsr9514M8ZC+OACiRXrUTnwln18GtFGnAGd3S3OMPGgI+EDZCkmaS1nGRR3sVBHY0BE/LUSqFbSEXI+LzAz4olYtPRE3QpKwm7/wu7uMKRAMpJLXojPTQ=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW4PR01MB6467.prod.exchangelabs.com (2603:10b6:303:75::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.25; Mon, 30 Nov 2020 08:17:51 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::9978:c933:a050:a0e8]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::9978:c933:a050:a0e8%7]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 08:17:50 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 0/2] ARM: dts: aspeed: Add Ampere Mt. Jade BMC device
Date: Mon, 30 Nov 2020 15:17:31 +0700
Message-Id: <20201130081733.18893-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2PR02CA0195.apcprd02.prod.outlook.com
 (2603:1096:201:21::31) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK2PR02CA0195.apcprd02.prod.outlook.com (2603:1096:201:21::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Mon, 30 Nov 2020 08:17:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 351bcc1d-a159-4422-69aa-08d895086d85
X-MS-TrafficTypeDiagnostic: MW4PR01MB6467:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW4PR01MB6467C2F07DE8242BB182F7C8F2F50@MW4PR01MB6467.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U2pPJJGVCcIqOUETuvJpaOGJ5BcXMYIQdudhF0qzDxABBEJK+0o5qGCJekeab6fXGUKT4c/1/OV+ZYiWMhFAYlyU5n1n4TUdtYsZGrL0BiAfdqrlkCylrJCkVeHkY5e0GXRnQswGNhtVFwHHd7bvTFM/JERJXW8Yg3pVm+cm69/o2yqytxYJP+3yqjx0SHDdc3UMVpHU/d2TqHP1N4FYffrH69rKqGr8GfupGhJYBJ+FbMKv4kO6l4nsAiNujodtDeH0OkKhkFm2Pb2+5tH9R0ye8fLGxg+VmXJAAbh3/fppIC7fiLfoLF2dVSEqLHvcH+WoH0SBDzojvATIFcGSRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(39840400004)(376002)(396003)(6666004)(83380400001)(5660300002)(52116002)(2906002)(66476007)(66556008)(66946007)(26005)(4326008)(6486002)(316002)(478600001)(54906003)(86362001)(16526019)(1076003)(186003)(8936002)(956004)(8676002)(2616005)(4744005)(107886003)(6506007)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0vW7EmblaXMDpJYluinwXHqQyHxq9QJE2T3ddVP9o2RTIE4zF8QpSuSKLqxR?=
 =?us-ascii?Q?1ysODnUEzw+iqsUE7mXzgVjTa2YQH9cTck9g568G5IBtdJNyM+2wpnIvO18i?=
 =?us-ascii?Q?jvzp1cH0OAnqtqwjsB5xk6V9m8URkik5DaU4lupNoabTcEK/98QpT2E6ZFiX?=
 =?us-ascii?Q?HBRG7RGhw6q5rAMHc7FzY6ZBkY6QHJV0wwgT8dBv41fmwTiFZAs3ex+Row/T?=
 =?us-ascii?Q?z6hsysxWVuKc2VeP46/eg1WSwzqpqs/U8yBSVOyqLAOXGoz7DdYxhUGKEsJi?=
 =?us-ascii?Q?qJkq7dgczx/25H1dWlfsT7jWUotQdhs1u97lwyq0JB5SHooTbOD4jFqiI5Sf?=
 =?us-ascii?Q?1MuMpXMqStbsNj6Qd2rB/6yM/ASqtI7J1KjRtGbxQNAeGcY1dnLWjavdOhRZ?=
 =?us-ascii?Q?0lyrzauVVIKZt5tITUNBIyOgSe1UQcr7xSD92q+Pi4y+pslwOboe2Zjp2Gih?=
 =?us-ascii?Q?eWf5Npr6ntbW7JpnFJ+AMO7eXwDzvPpDQLttEIWo6DTayJw29tiee9QIb8Zn?=
 =?us-ascii?Q?MEWSCoLDjrQj+T6r+Ls6tXduyNFRxwnkd9FRa3vXpj0nTvoP7pyg6TXnnJR2?=
 =?us-ascii?Q?zxHZIxtELFNnNB1xXP1IUDVK07UWXXG54KNT277OqjtJ7+jjCLXrCmcJbH9r?=
 =?us-ascii?Q?Gs3Ss2b/WlTdGkyfE5/kvIw5KK7XftILjloqPZVMaQInN0jsHdUF+b6kG9cn?=
 =?us-ascii?Q?YROkS2iYU0jgIfB9wbqQ+55ZLkH0NFk9UCXHC2epnzAkzLPnzqACd0X/NVP/?=
 =?us-ascii?Q?sNCn+vuaTmIwrj9uGD3wR65UT6B8kw2H0oUd8nrdED6xhuERugqqrL9kV6hZ?=
 =?us-ascii?Q?aUiFsqqjCFqgWbA5cPWl0xNHccvwP6H+PF7p511x7ZFCeprFp1GlEKkCQYzD?=
 =?us-ascii?Q?ZMDYP+ogT0kjAFKS83lKUwjSic2CSMyoTjNBKjWoiQ5XdwQ6eBoQmh62cE5N?=
 =?us-ascii?Q?V+V8yEFIiFE1TnFRR+c+F5pWdAtuj8vKy1tPfvM7/NyGJBz2unBVBo000ZwZ?=
 =?us-ascii?Q?mBLO?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 351bcc1d-a159-4422-69aa-08d895086d85
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 08:17:50.8428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q0mGdNkqI+0s4UIxixAZHpn8gUNGThHyxtX2bvaB6S+C+Zq9V/s7R6cvrUkZYUsW/vDaynq0neLh6g31D3ydow5ZLQF6ZzhN6zG0Uzod1bY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6467
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

ARM: dts: aspeed: Add Ampere Mt. Jade BMC device tree.

v2: - Removed unused flash_memory and mac0 nodes [Joel]
    - Removed blank line at end of file [Joel]
    - Fixed "ampere" entry to follow alphabetical order [Joel]

Quan Nguyen (2):
  dt-bindings: vendor-prefixes: Add an entry for AmpereComputing.com
  ARM: dts: aspeed: Add device tree for Ampere's Mt. Jade BMC

 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 558 ++++++++++++++++++
 3 files changed, 561 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts

-- 
2.28.0

