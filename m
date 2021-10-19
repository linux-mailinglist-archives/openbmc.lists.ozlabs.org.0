Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8932B432E00
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 08:19:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYNqT1rD0z3c8s
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 17:19:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=AWUFF8Nu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.244.107;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=AWUFF8Nu; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2107.outbound.protection.outlook.com [40.107.244.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYNp75hK5z2ynr;
 Tue, 19 Oct 2021 17:17:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/d7nBWtC6zkYZ730TtIHCaOZdcQYsc3UeMdbFi5XCO6T3oELP9havpouwrrrew+vfgGcZjs0KR28ECbt/guR4dOq0ZPRBQXvWNr48Fypn08iljbzuznA1WCiYqdkHAs+ZNi3VZ00g3G+t5GPLZdKk9pmqYl5NPM/U5MFHjN8e/22hZa4Zzzfs9Dx1mdJXB9LQpOG9Q2G2k5IJHx4OMa20E4DbFO/5oTSr9ADTgRHfhY3DWQn9Aw4ml+jur4c7Cvm9r/bj9jND60gv1EHBYRN+YbFvouYN7oGSa7bVahJcp7zyWayGaCEK9IHOFEVOShSyHi+kKu10uJZqfH1BQfzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hDtbPCDHO0b7VTSOjTvs0tCslLIwqtqh0EI7JIMAG3g=;
 b=Gg2ONJWd19Zq+LA14D7JeoUejcxyWuQNn+FdjnRqrMuoAzl0XGxQfpaV4wV0KMTLtr9HwJMHOqnnfPYe3ASswlMT4oBTTBXtcod26Obi3IY6zIf9qXA3b4NOb6KJEBahZMq88/5VGeRdS1UGqkUXPpm185rRrcWS9Iql8cj/tR5KCbAJUi8rn3zy+35vlRk1ap7dJoxC+NRjXQb/Ab7LVxcwzdiGgLlHcXwWaNpimZGBhWk5Apaio8ulpinErikXoHAH6n35BrxK7BvUZexEHKzvcPoFbgrnu9MUpcmQtmjy1JdyAYWQvWvkd6cJ+1EFOAmXKnt6/9qinaMedIKAcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDtbPCDHO0b7VTSOjTvs0tCslLIwqtqh0EI7JIMAG3g=;
 b=AWUFF8NuFN0e7pJsl4stuYk+uPxpzi0LqeWYqz8SnAe/4kSRUrzfoZUT73Ui+2u8HMG0a5zS98c3IxzjtboWLFydUTJd3f4uDvL/IweN89VtcBxMNFCF9BBOhi5izWmefX8yI7UCHpfx2ziueAP9wJjdTfZmaFJUuixg6fF/ITY=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BYAPR01MB5062.prod.exchangelabs.com (2603:10b6:a03:7f::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.17; Tue, 19 Oct 2021 06:02:24 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f14d:21a9:9ebf:2924]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f14d:21a9:9ebf:2924%9]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 06:02:24 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [PATCH v2 3/3] ARM: dts: aspeed: mtjade: Add uefi partition
Date: Tue, 19 Oct 2021 13:01:55 +0700
Message-Id: <20211019060155.945-4-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20211019060155.945-1-quan@os.amperecomputing.com>
References: <20211019060155.945-1-quan@os.amperecomputing.com>
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
 Transport; Tue, 19 Oct 2021 06:02:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a1c02a3-da44-4b4b-262c-08d992c60566
X-MS-TrafficTypeDiagnostic: BYAPR01MB5062:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR01MB50620844B1E457751911F61FF2BD9@BYAPR01MB5062.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FSkTQxg8haEGJoiHX79XguMrtC5lhNiUoDPFgPi9mnqfzqG0B5k2T/jSvkw/V+jzbRxoPTZtiOhX+xXyv4nmmGkk+up59XD6rLNGQ3+uqoyKVmp469y3SYwBpFfzVDiIMq+xliZQ7lRlBKvS/9deSXWfZ8RIHUsVst6wADqoZjIYq42JQ5c4dIHL0ynlCyH9CVCNmsnF2BU0hH6GzQ/502DQ88wlwGyEDtWu3FC0/HoEYN9qe+CxQ5GyBxGnhPbv+3y70w1CC8MIqLGQnm72tuzJhf7qWBp8j8L/A0n5T36ylyZSM+ivrNi0G9jEaUHKmeRVdno0lsltEsDpGpEQj1/s0pJUo35EyL348cPEFRCeiC4cgX5hkIO+GSPjUSpzAoyWl4Ce3K8O6n2X02ByT47f9dYe1BQrwiQ7B3BQYA02k1ttqy3tW8iRXbxGMEBReka0DnedVLzWcGxKTu9yBBHGwXpN0Gobq/6YA1EFCKs4UB2gTr1LGlVXb1NKuyprvRHJiPihePhxGMW4DtZvVWVdl81Yjl5X8PUGlpo4Sh+vy0YvWByivtBL0eqIsAW9XN7GF80PqpaA+rhfmSBy2TINnpTYmzAsR71YXCr6cs4TAg0kD94bzadynaGnCc6tXYS6o5xA7vyDbgMmha88xt5lz21HbG0q/08FolDNEdZTaR60QsLb5STc/T1nr8mXE3cAcyD500/mJN1r9UoMfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(6512007)(110136005)(956004)(2616005)(508600001)(66946007)(5660300002)(107886003)(66556008)(6666004)(316002)(8936002)(2906002)(52116002)(38350700002)(6506007)(38100700002)(4744005)(86362001)(6486002)(8676002)(186003)(66476007)(4326008)(1076003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Yd0rJsGLJa/u3DAKbrErJxI3B5G4A4VINACpWpc5nyPs3e8eUaIJu2OdPARJ?=
 =?us-ascii?Q?IP6pyWkcK/yBB0yBtXwNXUYigM+oZIpzWdWkIFXGrkatZl2HF1s00BJS9U6f?=
 =?us-ascii?Q?ZuM2SzAEzFo/4HQjW2Y2XRe//BUcLZpfk0D6cFgfX0589Uyu7carRnBzvn44?=
 =?us-ascii?Q?uRsZtgL8q2QKMR0rB7fdSFOlGFxEn4NZCMgNAxAL7Zki6iNrMQuOnsWk72rQ?=
 =?us-ascii?Q?cv8LqOVgi4hg79Ljv/pCh6Q45fZQC8Krn8U9Vf5zn4kQPP+WsOJMMUC+NRZV?=
 =?us-ascii?Q?XKhBC5Sll//9hgC74dBFGbUvSYEa6J2tS8Ao5WajvUo8NbvHEl4L4LfkRl1T?=
 =?us-ascii?Q?87Wjvanyv+dBFK7pbYsVb9LH1x4kPXjh7xDSkI3SuujKVFKBROWI92UClKlT?=
 =?us-ascii?Q?iu5Kwbk7ZGAB0fgicPSQy8NfrCS4z0iWzYbALStMWBB/wTusLdR7WAWLoC11?=
 =?us-ascii?Q?+ISFrXJi/tNQmZXnNv1hIouyEEhrVLFu5Zxfaf8eDK7Qj+VaNnHZtfr2nudh?=
 =?us-ascii?Q?4YAf+zV9hD+56opfDa9DeBDvyJ5NDEi/lhVcyFgMwHjH5fzjSJKbYBEHIeHj?=
 =?us-ascii?Q?WybtkCJ83GYjkA+QJMd4VqnJGW5ysQhw+MytLi5vwFfW88tiYyWfuNcuFGhl?=
 =?us-ascii?Q?fepf0/aqSAHr80Mug3MxcNu8UfPYYMYnZ9KW3/QcfbQLvYtRqXb32wfTKqXa?=
 =?us-ascii?Q?7XVxRy8sq8Xw3mAcK+fvv1DiHdrhWWIg4ocJ8oL8lKfJ88vzd/SBXZWzXUbu?=
 =?us-ascii?Q?iJI10LwEVLqDBdLXsZsPW2azlMyyFP4+nZHTUR6Qkh0l972/qZMAlvt+BcaR?=
 =?us-ascii?Q?6j09rkGnhAvuovcGrUxjBz6IMP6iqE3+Po99ORMXP94HjDBSlIj7BACEQg4o?=
 =?us-ascii?Q?V/sSV25l7PiQn3gj6doeuT3vnSFCBesynXs32qhZy3xDGgLDk6AHJjfcdm9w?=
 =?us-ascii?Q?shW/Zm4pTbftt4mr6/vZXtlZbkmvNVBqFoXFMgRCtubKbBzDrgKHCnZ++zfh?=
 =?us-ascii?Q?j9g7lJWXBOrU+wpHXgKbTgyPMxTngp9EQJSAeDg1DaBjRzz/8NqsxmFKJqmo?=
 =?us-ascii?Q?1m6wIQ0Wkq/ZIm1Zlj8sFxQ8IfONB0IoIVRa8gJlyX28kUtTwIGICpDVeXMH?=
 =?us-ascii?Q?a0fnLaim/K5aw1iwGoCQGhqFxld5BsQrKVFHY8BDBwsGP9vtn8q8LHciKlTX?=
 =?us-ascii?Q?PuabSuchKxfdMAgVXbg6ru8ZGfP9BodgaVQJziur4+o6HGQRNExmhvvqN8DK?=
 =?us-ascii?Q?BPvrPu23N+Zw9moGqjae1RexNfrqDGxncNriDewp6vOmTDFYK+YKp/HQiNVB?=
 =?us-ascii?Q?eBtsXBpSPX49ftAhuCm3zinn?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a1c02a3-da44-4b4b-262c-08d992c60566
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 06:02:24.5259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: llPh7biSL41yEwdxLbQ8I6nZOBlI17ffcigarhlgJu1E77ElhSFmjRUjeNX7n9z6ox75TkgfY7+iY3MpsuKlHZMHi+xkwoiXSFWCIXqYrzE=
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

Add SPI NOR partition for uefi.

Signed-off-by: Thang Q. Nguyen <thang@os.amperecomputing.com>
Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
v2:
  + Introdued in v2

 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
index 723c7063c223..4c3c3f1a12ea 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
@@ -374,6 +374,15 @@ flash@0 {
 		m25p,fast-read;
 		label = "pnor";
 		/* spi-max-frequency = <100000000>; */
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			uefi@400000 {
+				reg = <0x400000 0x1C00000>;
+				label = "pnor-uefi";
+			};
+		};
 	};
 };
 
-- 
2.28.0

