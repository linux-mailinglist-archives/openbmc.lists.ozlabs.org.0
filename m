Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D6F4C6014
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 01:08:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6LLV4s6Yz3bYY
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 11:08:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=DuT03DlT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eaa::70b;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=DuT03DlT; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2070b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::70b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6LFS5YRDz3bZ4;
 Mon, 28 Feb 2022 11:03:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncXTOrJiSDSx4AfHgDYpA1t32Ai3I0lYfM5h+qBFuxoZ6YfbgmaVdwGouWDWr7bZ44jH8G4/OOUsf0jt+DMIx5zDYYLgpR9HcXGG9Lz5McPE6gbGsaaUTFo14P2UGurtSKvLgFPekiKWxSW4tTC6/Hort1h3L9EYLxUqNIPNSHxMPo8ugvJ7f3miZnpe8JqJGn5XVlkyoZQzDIh4Q8q6tVjR0+CDAnKTQJvjXFXWs6dA5TQws2VgqyslSD2mRZ/wojYYk53xmoLkuWxVbkXKF2VjoKdmG6gcVcQhiHQatuvFGj5zAwh74iolhasdeMLm07Jcz8yzytaFnbqN8YErZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zRZz+hN+eF0UbNgdxvbHUvQTPGyb+w3UDApYugpm80=;
 b=gv9+pBef6uVumXqEUY7PNzaQC+H/4O3kkmS9qXN08W/xVKIfLUmbp4xRESu0y6mykPOMVlwM9WTk9mkZUl79oDLqKSnXzNPbTGRZwuPysa7zFlUqKQkoUwXhha9EJRF6rX4T4/dfmWz804E3f2UZP46SFVk5BEgFebRTdcSqLZmPjmw/0cLNvCzKC+KJLry/AO4n2Ds9J1htXxMzj9Gfv1lV9txI0JY0Xw+ISrb2YS7cftCiYbBUqxaJWU03r1xuANqkwxD3wtBRverIgIiEHJlgYG/bw11T7+A40YRjepbFufmi+SikI15BeUZPpjPfNF69mSH5+6TrZYjZUuh9vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zRZz+hN+eF0UbNgdxvbHUvQTPGyb+w3UDApYugpm80=;
 b=DuT03DlTfmH/2gpD2nmdL3Ent3TULMIqjfazlBOj8gKwqJCH8dz50fEQSTcgEY2Mn5JqD4SeN8NJPuIOqM2bj1SFl+mmcMpA6ikrNL3wGiBV3LHkvWoawB9kXqHTY9+1Pt/bKz8pgwgbajY54XpEnDSXHVZ+gyyUkqSW/ueI+C4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 PH0PR01MB6184.prod.exchangelabs.com (2603:10b6:510:14::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.24; Mon, 28 Feb 2022 00:03:04 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::d9a2:2761:a4c0:1e1c]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::d9a2:2761:a4c0:1e1c%4]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 00:03:04 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [PATCH v1 1/5] ARM: dts: aspeed: mtjade: Enable secondary flash
Date: Mon, 28 Feb 2022 07:02:38 +0700
Message-Id: <20220228000242.1884-2-quan@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 35a67513-f1ed-43de-66ad-08d9fa4db107
X-MS-TrafficTypeDiagnostic: PH0PR01MB6184:EE_
X-Microsoft-Antispam-PRVS: <PH0PR01MB61848A261DD29A19B9AF4E6AF2019@PH0PR01MB6184.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UhtfS3YJz8ODIna1i8hVxuZ9apgIlPbPrzMOM7lFUEGFQZ0xScyM4fADyTf5ZuhtHeBXyE0JUnWx7Rd8XHIQyYHQoHHh/av3mf9MQrMOdeV1V1lcLTZbOKIvHCRQAcOAF3YjcgddIJd763MhEVoCo87A2Z5oifDc4o+Z1SFrj79fb/MOO5HL+wu95j2n1iP6GmYURIfww2sdchxGPzg5E9xIn5uVZeZg/x9jXnD0cRX/CaEW8EIT5llnxua9tsbUV4ciAV4QyLSHszsTp33JXZI++24ZEljc8+iu05qMhGFC+G6amXL67XJTkrfc2mtjYK0LQLcDsAF1jrH8rjSFd8TguakbyGJv1vxDQ1kCCrQKVO2P+mA76JVGfSbolCid/nWNltQOmn3r2Ws4VIv+7QG3KRjYub/aIEszcc/MZkb9bkyZGlKCBoyuY74AZKLr28l5cxIb5HBPebcfsgq2KNP0j8OWqFY5d4rt8QfhipIoyxjVPYYdKMz910omiq1TBDmlZAvDKZxISxCvOccIjzew6xGCKQrUCSqr+6tj4cK8aWD/2dRCtOnKicj6wiFDajikEaPuKzIJcpQNA9NUaf+0X7M5FpTbb5ZYUg7Ol79oa6v2f/aU5cJ42cF1O4v4Jkf/hsN4BM2knKc93SDeLI7ejOavVchcetXUTUFoUXmRIPYqjRYGKg5glKDJSAEwhUXN4mJXZmxqVJbR07o1ng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4744005)(66476007)(2906002)(6512007)(186003)(54906003)(26005)(38100700002)(38350700002)(110136005)(1076003)(107886003)(2616005)(8936002)(66946007)(52116002)(5660300002)(66556008)(6506007)(4326008)(6486002)(316002)(86362001)(508600001)(6666004)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1M96glD2B3dCvys4UNz0dKSqewS9HR1gneigUFzgaIE6b/FXVQDUe0wu81No?=
 =?us-ascii?Q?qIzXpxCklRSRj0C3bKkHE6Q746sLINjnoABejT5KbYRyII3SvjaOC3tTSiNV?=
 =?us-ascii?Q?Hv3/8flT/gJC27OlpehOj4UfDO555s7f8fy1XtFxpj5eZ+UL3T+jgJRY927c?=
 =?us-ascii?Q?lTl/VoOAzfrgl/r2XfltABudV6W20twYC1hMfk95Bg3WX50XdrVkbSYJfAuZ?=
 =?us-ascii?Q?uYWX5Umn9Pw31ik8EYkTv3FznT7aN7minF9WkTAYbk9YAOcchWBNMZUjElGE?=
 =?us-ascii?Q?pVdMsBYoIKR2ZgR0lIfZ0S+ByyMav9w/1ZRsQNhq8q8HNvTj/4M7n9FgE/IT?=
 =?us-ascii?Q?4pZ1jm9mNI2KFDN9AJDvTQ0X856bLse6bgGaTnY3dsIibkg2udzMgIOHDAd9?=
 =?us-ascii?Q?NTuAebHeJxv0g0P1hRPSa0wTO2enec5/gNS/k4AA46O+3FJ2kjtK7ORIp7cC?=
 =?us-ascii?Q?nZGn7BEqa2nkeElcvd0Su6ymJ1gWTsph/1gNlQWmh4gKjztzLYmHHdYpivkz?=
 =?us-ascii?Q?vEp9tV0L6jfPiKGbyijzKbLMFFVcWkP0Ecuekr0BwhOsEsTN+qr76jH2IgyH?=
 =?us-ascii?Q?dth7+9ZUJFiO1NZ9N17O5k54gIW7M4uP4Oym7kxsAgLZrNWONRjEeAkB9zFf?=
 =?us-ascii?Q?W6GtaG0mOXK0yRTnI2fwT/B9gAY5XwhHEePKdOO41AeMPv/gkSgVPmEAAfdr?=
 =?us-ascii?Q?lyjueW+/yzQxbAG3h4zihnnNoZjbuOurp4jHFxi+6HUxnC+FvoUBu5k8UoBR?=
 =?us-ascii?Q?3/Qm3oNtH3QwFQb/svoM3olqqv5OFtLDVLvcUk5uDVLjW++g043DoyrcfwMT?=
 =?us-ascii?Q?Ks1DRdb3BZQT7N87VNFU1+Dy2wB/xmI3ZMSKoTA4SFDrg792lfRnsTPgazOq?=
 =?us-ascii?Q?nFTogMlmkCFNSCmptQaAF+TRSNeUg6eA0b+f1F5/xquw9TXtURTOZmMz0rsw?=
 =?us-ascii?Q?tKREI9g0h8VQRu3W/IcpwT2syId4qw69mlnVGuktqQAdOWN5T+V/oElrW5l2?=
 =?us-ascii?Q?K7tMIFAoqoA4HWv5S2kZ8jrsKc9s2Cly5ulENReQAFjP2qG/RP3ZhnV8taJQ?=
 =?us-ascii?Q?swQl3zEijZOZCAWH8q93haPLqOtciW49A4IW3K653Y7KqomVbjDD+WbQHM1G?=
 =?us-ascii?Q?w7To+2g0//vbQ7vsgCJuuNNFKdvFY9LjCsB8TQoe/oRg1IH2ezb2/NYPJsvs?=
 =?us-ascii?Q?3CTzbADog0hpLSbOgNq5lyucd18nSiaSqMRARgyobsWG6WzKJlOGunHtZofK?=
 =?us-ascii?Q?yypFwD8Q5eanP7i7FyU4ej/NvLmy3kDOFUX6wFZ1FzYK7Cnn2eEnx1+3m+JM?=
 =?us-ascii?Q?rwGsiDBoGgW+orJ/5URlVQvJIwcXY0P9gBYCJBkJvKwi2iSmWrNnmUVpxJKW?=
 =?us-ascii?Q?2FxKgRxcTIne+JSPiHHCTYjoU2X/vo730YdjfKmQPj8stdfnsn74dCKhxecx?=
 =?us-ascii?Q?x0O7UJRD+WgyWswuJnTZ+Rdpf6TxVI1pFe4xnqjMqkvIZHRwOBwqfmRYoX/P?=
 =?us-ascii?Q?jCT3IMyheTyoxZmLKIC8ShgJmqvf/P4Trjasg30zKD25d/eHfr2WH4J0ALE5?=
 =?us-ascii?Q?VogvlHN7HYtRYH1qwOl+Zn2sRRQrYbcf0g3XEnM6KGPAKX3o5b7Z/3G8NDC6?=
 =?us-ascii?Q?HuN0+ZcuVxNhoPvq4RDTL85di7ag4GOXT8u9US7+rccMNAeo6VWh9DYtTwpE?=
 =?us-ascii?Q?DvXCgQ=3D=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a67513-f1ed-43de-66ad-08d9fa4db107
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 00:03:04.3018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DA6EiAWV8nWqS4NOnNPGOmdRlwLvByLXBhC+La9bJ89QAA7k9QHF+Qvy6uPM01vmtNvXm6fY8Q6w+K0u8nIb4zpJkD0owJGGxknh2ghzHUg=
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

Enable the secondary flash of the Ampere's Mt. Jade's BMC.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
Signed-off-by: Thang Q. Nguyen <thang@os.amperecomputing.com>
---
 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
index 4c3c3f1a12ea..934bb54b193a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
@@ -362,6 +362,13 @@ flash@0 {
 		/* spi-max-frequency = <50000000>; */
 #include "openbmc-flash-layout-64.dtsi"
 	};
+
+	flash@1 {
+		status = "okay";
+		m25p,fast-read;
+		label = "alt-bmc";
+#include "openbmc-flash-layout-64-alt.dtsi"
+	};
 };
 
 &spi1 {
-- 
2.28.0

