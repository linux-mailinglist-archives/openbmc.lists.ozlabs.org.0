Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 246D8432DFF
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 08:18:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYNpg3hX8z3cN2
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 17:18:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=dzv623B1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.244.107;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=dzv623B1; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2107.outbound.protection.outlook.com [40.107.244.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYNp6249dz2ynr;
 Tue, 19 Oct 2021 17:17:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVsfoTI4Gb5CpRZLJMbffa+H5AKxPwx9krnTnx6FC5GR/inKkFCrrpz7GRFaNZUCNcNHTiDHU9RB1XkDgquxzQNs6tZlU2dWrR/QZV9zQGo+Qv6qDlvyzvGA2i25YBru7ghibuWLTNSwW03xAXnogy4oR1JW9+WoI/67Qarr5pbVfQTP7UFdPot6gKgj/4rIk5xtyN8esKLpklSc2B3CMkdBxNH1vYwpFIUaVwJMOpl4zRHj1X1d4ADbGPdOCF2LknhiofigGtB6uTsrdWdo/eYv14OnrLPCdvyCvWhWfBHRoNZK1E9XLNZnKfsLl6UGM2Bt46fzz9yLfBCB7ZoZ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kv4/+TRblO4J544PIc42mHH7u3vjlrwCQiVV6hLPe84=;
 b=HBbXLdqNGdOMnfdPESotinmYUaO1qUSFsvnqMQ2JSid0CkCICMwnMnPZEpOJkMsG8aPo34/Cga5qH1OYTUFnSRSZREqsUesfKSzE5HwCzsBOMeKk5UlSScF9K5SRFFWbeKPotGbktE0zGAZZGkr1rZC16RMxhJ/sPkt5kP3Vz/V/X9v0gOOpmxFmf8Nn5iwVSP6YTpJM+fIy1o+Go0Qu+d7UQibHqRe20TX2OIplbUN4bKYGNUsh7IWArsVHGWugBta9ofceav6PDe0wwmUXBuxp7/PYo3v9pC5Y7V3rwehYzrHU6zLVrYvq/q0CLxBR37oK5jD6ZSIBPuL+GPGHmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kv4/+TRblO4J544PIc42mHH7u3vjlrwCQiVV6hLPe84=;
 b=dzv623B1z7IJq0DnhwLUhO8GSZT2DQ3oBFvVqdHHokIdjYX9k6/h8TYcEEgXb65zU8pcy9lwsNuT9/WnFpcXZaeC+0cdet8TxVULB3SPBkjvuy29UJQLewBol/G1aJ1/avcQPVwahv5z+GECpXEgr7P44GZRZZqzfDEsOykRICQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BYAPR01MB5062.prod.exchangelabs.com (2603:10b6:a03:7f::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.17; Tue, 19 Oct 2021 06:02:15 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f14d:21a9:9ebf:2924]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f14d:21a9:9ebf:2924%9]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 06:02:15 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [PATCH v2 0/3] Update gpios, nvme i2c busses and uefi partition
Date: Tue, 19 Oct 2021 13:01:52 +0700
Message-Id: <20211019060155.945-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK0PR01CA0059.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::23) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK0PR01CA0059.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18 via Frontend
 Transport; Tue, 19 Oct 2021 06:02:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6381198d-ee16-4aeb-0a93-08d992c5ffe9
X-MS-TrafficTypeDiagnostic: BYAPR01MB5062:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR01MB506221B3C3E8FD03A3029B11F2BD9@BYAPR01MB5062.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4HJ7oqO/AiWdc3B3oom6Z9aRzq1qY77InmXTiTyl+Tx8TBRUFUeAMUM9faH9HCE6IFNQgvaSAPkwfL9EsWBuJkKymj34dXfnEgvsx9tao06nabYkcpxyiF6T6S5ju8g+3q76d2DrRruxmKRNhT8zC0F9bI7pE2hf3hOT4vFVxxbVVQZNkpOipA3D/qFQmsVIMtLyEMzM55GGU8GOVxCYdVnK0xKS52PcTOdvNiEw9r+piB2LzZdo6gJpiUbA/2VAJN+woYHG/xEaIcksj9WTpd7V+DVTPXt7uzJOt0007GQQK0lmwAL2u+iiKxwBlYncCFwO8kSsGtALfUfoOyv4FSSekNUQfwEn/LOz2HCrELXIkz7jwQJb58hvyjwqkUMT/f/MoynjToFwX98OAOq/NuJhP/q7xeBlwUnZTj2xB/QwSIWSfTFCc9p2pvQT0c/kx9zTG+uzAgcUN5hvtZKhNvDe77xZJ6yOk3Ylmeuq/NTNCOPZd6FHwy85Y3jpW9EQLM+b7Hr7+QxU8hJBNtMHM9bTwhB8fst+7tsWjxNnn/V9rpsoS8+h5oojWe2F8Zus504mbkDWVYGG31LScYj66JFX7Wblggd+rcw6OEbWnZoTCk+9NgiVt7yotySx2V/03ceuVqwAj4kFmY2Ea+xi5oz8ka+Ti5Ioqb+rlt2+N4BB0O8aaExctyFDRJJlnsZSZLWcX182mbUjnl1nul52+X7gmlu2ndlC0xdBJkBaDAmYE+ZZ9R9J1AuyXN7kFGeQ55wyXUPemfiEhpgINAnFSK1g2bom/AbevSBPJJESXiw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(6512007)(110136005)(956004)(2616005)(508600001)(66946007)(5660300002)(107886003)(66556008)(966005)(6666004)(316002)(8936002)(2906002)(52116002)(38350700002)(6506007)(38100700002)(4744005)(86362001)(6486002)(83380400001)(8676002)(186003)(66476007)(4326008)(1076003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?68Ubw/cLHlztKThhL3ayp9qfQappd+fLNhctHCf/zMq22wuGASQpJDNaE5Bs?=
 =?us-ascii?Q?5cax0+0vbjqDiOod9UiiHs4eGwNltucceqoyrOYdzSOfkf8EFZJ004DzFYF5?=
 =?us-ascii?Q?t29voWy3uCWP/q8xHD2SZ4pt0mC3tR8dYbHaIoFN3i02xdJrSPVKLpgSCf78?=
 =?us-ascii?Q?0eSWrJsVtLIku2qUdFevH9rrrsWRaRJqthc1ROwNYQVNaij2FuDjVW6fV5q7?=
 =?us-ascii?Q?Eygwzm4uWTxmsu9R0qY4M9c27ROzKfX8CSLeDhFSqbJApNam9knHLU8R6V7T?=
 =?us-ascii?Q?I3irbNoiGi/Veq+2JHWMo2s8cSPPHK5FUhchQm3/f2bMWRof76XXXjVk1Vxj?=
 =?us-ascii?Q?kL1ersDAvtpn6bzxtu7usGhPZGTdc4rh+SJbzXDthXHeAAB9hbEc02NMZER2?=
 =?us-ascii?Q?2GekSCggXZ4bu0kqGK8pCzW6T18BHb4j26U4IJYx3DkwezfUXNu2jvj9WT9A?=
 =?us-ascii?Q?i+7zAfEZCYa4uLDiGNNV9EfeG5wTNCtrYzsGtaLtztavlukvUzMcakclXm3v?=
 =?us-ascii?Q?8dB/FKjdP4MUq6BYvs3NO+VEuyprtEgPmGwyOXGJDjJiJ9KaZh37E/C5ao5a?=
 =?us-ascii?Q?HzpGKJudCvhDqUZamiqJBB3u0naTw8wuWblahid5otksJ01FKg4UnzcHcNuU?=
 =?us-ascii?Q?WTLQOaq6d/eg8Psn5irtB0kUv+HszOX2NwzPUR9N6hBlpUBVxpTyBCGoHllJ?=
 =?us-ascii?Q?bTCq+3dCzJX2nBT14X7d5EDCFYOorN69I5P4aF5JjQIJqzPHOHlktlaG1cL3?=
 =?us-ascii?Q?vhrvDhfIfuQ9QloCUexI/d8iHSvqo7JpU9WIMOfnGJjBGKm1SwI638fh+uTl?=
 =?us-ascii?Q?L7LGkEB6BA0sHMEyItWWQ8sWqPfy3YQzVXcx4M7iOXCIaLnb6r7Mwpw1j6G3?=
 =?us-ascii?Q?zpRAf85oB8IhQmQjpsLGaQGB1xA81zIIW226IXKi+L+IsUmWodjUDVCzPwC5?=
 =?us-ascii?Q?Ixu0txMouY1l1eLKWlkbXASX1i5nZfMmulAM6rQw/48vtaTYcFMqLdycmoLP?=
 =?us-ascii?Q?Mxj6j3aWrw4AkEC5QYSmqv99xaAsTCEyQYk1oBLh/JYTT80A4Wy7B6/YKT9d?=
 =?us-ascii?Q?KZs5RXpMAGKUMLGc/+eW/qb+xZKE9ficdzCK9hoQU9JHFMnxCXfn8XnjE5ya?=
 =?us-ascii?Q?QfEl0WcY4Jhj8ERJ6kiwmuVOy2zZxxzs65NG22zodL2fdglZn8AwsoscM4f8?=
 =?us-ascii?Q?oe5AwowQujbZEE9S+VMwYdjWrn8Te55f1Xb54n7Ir6KzxMURRMyTWcoAQ6LH?=
 =?us-ascii?Q?t/cH4qTr/NbPxQB5xYKgye+43BgI9XqUBq/N7VhxogPkNNxDlKJKq++9zbPG?=
 =?us-ascii?Q?PJzVPLP/KX4sVYIo+uDNrYR7?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6381198d-ee16-4aeb-0a93-08d992c5ffe9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 06:02:15.4418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nq1ZIVlnAy566SbSW1TFdeb/IFJ//BEggjvoX2Afl0pITiYeDgeT2/kwfxqoSKSd4O9h8fjuJbjlib88CfLBeMMwk09RQ92w/4vsw6lSHCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB5062
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

This patchset adds gpios, i2c configuration busses for NVMe
slots and uefi spi nor partition for BMC on Mt.Jade hardware
reference platform.

v2: 
  + Added changes for NVMe slot i2c busses and uefi partition [Quan]

v1:
  + Add some gpios                                            [Quan]
  https://lore.kernel.org/r/all/20210917082945.19111-1-quan@os.amperecomputing.com

Quan Nguyen (3):
  ARM: dts: aspeed: mtjade: Add some gpios
  ARM: dts: aspeed: mtjade: Add I2C buses for NVMe devices
  ARM: dts: aspeed: mtjade: Add uefi partition

 .../arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 288 +++++++++++++++++-
 1 file changed, 287 insertions(+), 1 deletion(-)

-- 
2.28.0

