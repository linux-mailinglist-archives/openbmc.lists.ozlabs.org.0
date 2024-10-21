Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D13A9A5ECC
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2024 10:38:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XX7xF0LVhz3ckk
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2024 19:38:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10d::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729499882;
	cv=pass; b=ZP/6ees86jUdvhXg0cRwaqBhbZAa7DnFW+mxXjKFi+xni5lOOzMnzk3Qi+zjzvfVivHFpbUc2U9D9GbxBwpr0TtPhBImhY0oI2hZHk4w2kemOz3mlFMWn+M0+IQKFaCeDHJ/SObIGDUUrTejVFqmLttpUZBxH0sZT/OL9xSMLvEdXaU9e4ZkLBX/SFnSM2CKKY4zIHLAEmZoajVTZ+pu9unoVWSmpaPXk311fF9wKS4eS1pFM5DbXn+aFSpx8Vbe9iWxKehHFraPL7/f1B9EXff4TzcLB6jrrhgRFw6GaA8yw9sERRH0zwJ723YC7Bg4UFQa0gCXb4O84D7lHugaZA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729499882; c=relaxed/relaxed;
	bh=X0U8dp6df4kZBYYBsXzREG/5mXubnxqXc7SLQOI9djc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jBTIJA7TOo2oGpgHhazGTHVVNLgEPBcFIzZZIrpvEzB7xQGgJvj9febpnCuxKXeJb2ojFFltlWECo9V5SrqGEiHyHANiTfX3mQRminPqIsSnH17tUi/SlPzZKkWDHAtTvW5l5Hn2TsSocNr96E9OT3SBPt/1ApwAzFKKVw+GIIIrL0h8FMQrsiwqi/zgN4WElGICvDWVnnkR4Eg4BeeRRQJSD+FzmJz+N5/SuIx6CZenv8iPg+7cVmxy7DwQrUP5fgeTzyKR3t2531sQGiATnXCGEQi12HYbUAIDf8xjeyvuYpwd3siHa17jQ5X2eRrpk9kr1uHw/urDVRE7HqI79A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=nFXWN16N; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org) smtp.mailfrom=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=nFXWN16N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazlp170120001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XX7x5694Hz2xrJ;
	Mon, 21 Oct 2024 19:38:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dE//4tnpilMZ+1JMuyHd1FT5s/GtEiZ3KaNArbeKAlUcezcNnlOMwl2RRNoo7GpSE4yo5FIHY8h+6iVlfRMLnzdYyreJWP89qeW3oKDjLLmbzXvYKKweM9brp5iymsZlgZQ9J2UziS0f9E2tqr0SjNndJPMUsv1yrJvZMRr1Q5bWx1rEWn48IHdzY3FYpvj192JOl2IAai8NJb1a/stTAM7exC84h+kFhhLbcHfllOfNKrV0rukvk9AtyWnmj60Fh++GtIFcB4sPtpOjRYIsCajpiJ73pkP8uLGbRv8lS0peHJCodMkmB73t7S0N7/xkWyRZM2NdPJMlubNudwEJMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0U8dp6df4kZBYYBsXzREG/5mXubnxqXc7SLQOI9djc=;
 b=hXk9qnzb6AfYami8A8/ECSpweDBDejJD4E/b73QGBRxGYvK8wTiPtqdB0ZEaw6t9Rp9446iVC0vy2VCGFklI8r0MTSV4HAUY0ABuIuWGn/8AUJX0oAJNb4VSzZxw3KbYm/+D2yTRnb4n/b4iyEjNFQygsZKvssLEGQnZkim5jfVgEiVjDdZ7lnbxacN8TecK7BqA0NxEPeW+exFVf80hXalAgIGmEtVcpWTRBqVMB2stZTxznDAPuipLIeaKNFPCdr/tzHF9oM/scH5bBp0pmsp/2D8ji0Udd+M1Dvnze2MaEsUOVUJS2AhrfHRl9xZsG5beHcLanbprQN2JkC7Q7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0U8dp6df4kZBYYBsXzREG/5mXubnxqXc7SLQOI9djc=;
 b=nFXWN16NWcQyKpACl+2sPn9KzTw/DF+LVzZGQ5SsZ+DkS024QjmLlGtDk/03ccIgOOuoN8lc5NFJJN1oOf0UwV3WSbI4Wgtg99nwv1rZVLp+nB/iy7q4+oGVxpfxmZkPz0eqiaoALT7JdU5X9CwYXV7ndSM6QhQZd63En8BYV9I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 SJ2PR01MB8049.prod.exchangelabs.com (2603:10b6:a03:4ce::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.20; Mon, 21 Oct 2024 08:37:36 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7982.033; Mon, 21 Oct 2024
 08:37:36 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: aspeed: add Mt. Jefferson board
Date: Mon, 21 Oct 2024 08:37:01 +0000
Message-ID: <20241021083702.9734-2-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241021083702.9734-1-chanh@os.amperecomputing.com>
References: <20241021083702.9734-1-chanh@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0181.apcprd06.prod.outlook.com (2603:1096:4:1::13)
 To BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|SJ2PR01MB8049:EE_
X-MS-Office365-Filtering-Correlation-Id: 3db63af8-a2ae-41c1-f59a-08dcf1ab9d67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?zAJn1Vd9ZEUZgvZeV5TTymiJ2aN0EOfEvb99tnLbcEL0OQ3QznVW807w4gop?=
 =?us-ascii?Q?xbV7xAOjHy4YdUvPkgSvYDzx+HkBRyj7vsJX5/OHfwfOXU7ayPBUblbxOltQ?=
 =?us-ascii?Q?DP/x5eltfEG13JIMYCf/k30lRsEIQ+PyIkoijrK9Iubf6ZgRDRirLqnORYuH?=
 =?us-ascii?Q?eAqSY2QmEANQm98S6N+jOwwKmP1w3TwNQYPxr0ybhKU2qq9Okm/mAQWBUZVt?=
 =?us-ascii?Q?TUJZVFTDBFqJqZoGmqlA9FGW/TVQ9YFME3lzMlQJJPiq+qfC9uvPkaKAOMmo?=
 =?us-ascii?Q?SeyzxVQgS6hqjwBgTFHDWnkcs5CcLEUE+83z2JG/vZhmvCuuGcAS9/ym6aTf?=
 =?us-ascii?Q?JpJuvGoe3cXo6ztNjz1WvzPt7XEWaTg1O5JYI8ZXemE3l+HJgTRy1SMjnm4h?=
 =?us-ascii?Q?rxNWiQyCIf17X1kiZjikIxroK4FDr0rSdJeP/AnvHxZekfPXlmrRt9ejyNvb?=
 =?us-ascii?Q?NHwCJtDxprq5Xhkn5Rl6Ka9HCxQ5FfAM/QiVUqujjAwnODn2ZMJA8guGk5ib?=
 =?us-ascii?Q?7xMxwXcrjew2WWLWD5XnajDqdL/74lM6guh4qdgiJkJHtWpRX+Anwh49rUjF?=
 =?us-ascii?Q?/TLfL8cXFEmGgjVylH45kT1ptxKHD2D/naPTEBJ+UmmtmJi6o/3J+M5dvxA/?=
 =?us-ascii?Q?GSpyNZ6D+1VD6EHg6SMlL56ysY0Ao4YbLts1XheLH+vPJgScG0FR+UhRYe5E?=
 =?us-ascii?Q?L/sZF3peGelqc6L3uk17dBjNbj47DFfEEN54zboEVFCAjaKqnyhf8KvUGlkz?=
 =?us-ascii?Q?sk4Uxnw0uBLi/N/mvD+iBE9AeTPBibHcG2djquqNDuf2HuEUjSlOeE6t/9V+?=
 =?us-ascii?Q?I2IK67WWnpKTt+U+ruL1ZDUyTJad767tqd0uAHrJvgjdXbb+EmjMVSRt9KH1?=
 =?us-ascii?Q?JWDCTGV37H6TtrBFge401WCfCZeke8wk/WlOlH8xAz99uza/Ex+khqkh2G9k?=
 =?us-ascii?Q?NwcAP5PkNjrTxRYs7bzyxhHjjraDVCZPiygIRT1zkVgbPih0bOq0VP74hXN4?=
 =?us-ascii?Q?VOaGxhXFDHq9zaTIr6iHu1dA3DwhuPkQTnDwJv+eR+uVNGIiTE3Iui4WrGXN?=
 =?us-ascii?Q?mgaj8CrjKcb4iWDIEzOJmfM2B8LjrWyF5lltUWBJr8Pc1tSol5Jz8BYpzsg4?=
 =?us-ascii?Q?7ClqX1QbKFEJsvbNOYu0ztoBXQ4JiH2HKhlG07tQffxkdHWMDtWN1r0caUrJ?=
 =?us-ascii?Q?v3qw5vA702Z2zz4/xz7OuI9/vAwHk5DPCk4vA7yjMdpX1AopzyL2DNpDccmb?=
 =?us-ascii?Q?+/mf8lZNPH6dOYXp8CH5t0cPil7hhG2ef8HfA2wqs2oW914VcuU/eu+Ptrmx?=
 =?us-ascii?Q?yySQ9+V4KhVU+ZuhjTuQnOJ7NvlgbWRcw+QEA5R97CBP/V6rTolQJyhiaVlm?=
 =?us-ascii?Q?JNI7cUz0wSdDYGCjWhiXdydkyKGN?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?GBsFoVm7/MwHIJBNMKM7uowJ5gAME8eYQ1ULBiukd/UCHiaEEOASsW/6WsXN?=
 =?us-ascii?Q?V370w3iFslId5VhHlSVafSRMcT654Uuus7U1pbiCDXAPpJJpFDtcSzmbIzFb?=
 =?us-ascii?Q?ufS7NAKJF6CdicRWptcb2zymr6PaoHjqQkz0FtlfTiUsnU9zDjwsbLJ0m0nG?=
 =?us-ascii?Q?llx3dkAjTxylsAU6Ass4bpD50I/ndZ9sT7LsFzX6Z642VHs26Qc9Fb/IyLta?=
 =?us-ascii?Q?lCmBWguoBs1yMJAW1jM3kxTA0Xk/UNPCzpbLGLoyhiaPK+BQKP82ek0MY5Lx?=
 =?us-ascii?Q?Mcbvtt9xuTUlAQ51WYwwciiSXr3sUw34f/q4y9SEKRdHvbD8m5E+43Si1+dg?=
 =?us-ascii?Q?NtpMdL86PmahRJDyQfhYIPUhjyi/wAjtHqpal9oAg0nZMvW4GwPuqKYB8teI?=
 =?us-ascii?Q?kcolL8Pl6uJ/KBS90bnDtnXCGG9Flw2fEE38AweKl8hkb8vhlaBKM4mtmTGi?=
 =?us-ascii?Q?/W7+Y8OpXsrnCF6MDSdZkPi7KFBE+UtIOpsEo4hUGVlVVpg+4VIXY9KooLxK?=
 =?us-ascii?Q?NA5bq51wfdOTckW4RSIqrLRf81Ov5is7lXkuQQNmkUHNXl5O4y6BALZ/eCaf?=
 =?us-ascii?Q?bgQgTZGJmU29wKZMY/O2rhT+0G/8h7NDduUYikyVdIOpTVFoy5tA3cTgrRQk?=
 =?us-ascii?Q?7OfMLVM1VCHL9OKsdpe6OsHtTrR0PEwg4mWBZcM+SWG1UC1/tEBjvFMS2fCl?=
 =?us-ascii?Q?fOpeU1/75OLXfSkFjJJbe2ryzgKyyw/ZMtaUhvjNfwwt0v1ruiP2qfMKnBP5?=
 =?us-ascii?Q?0Mcwtnhq4kZTnS3YCcujeUqjEJ7NxMU+rYgWk7TmBaAPKbZ+DsGkkCTrfJLD?=
 =?us-ascii?Q?2NwfPW1PhZGEwYj3Ug/Cn5C2Rz56Oa34sH258EqOwpHD+R17s2h7E000smJZ?=
 =?us-ascii?Q?+I6v2UQgINNJWfNWsDmSu4b/QgUFRaK/NJdnr4j1P9uaAS8TvP9azBETGK9j?=
 =?us-ascii?Q?V/6ym24olgBh4cddMygHsf6dMdOY5NZ48ZxdNHTTXBeD41mgtWanI26Wyr05?=
 =?us-ascii?Q?Icp1xU56pN/SxjO2dOaIGc0HXd8Plqlfkua3iVGKSgt3HMqrkgvjtXVkeBq1?=
 =?us-ascii?Q?3yaAhQrYhqF0RA4YKGq2zZxXGd7o54BZuc3n+Jpwu2WbgbZAIedKjJnU82uq?=
 =?us-ascii?Q?JLTalkKFcErr/7DW1BYYjiEqotOFM5DX3e+rP5xG1N9MlxVQVX3F6lZTXp9f?=
 =?us-ascii?Q?hfWhcI8vkzIOF2106ku054PSP0eFV9FZbyqMtbixURGEzdx1JoKjkqI0wgIO?=
 =?us-ascii?Q?VkShK5w9up47NjilQVvYSSligM3U0g/UZqVqv3cQsPoQQw1XbrpFD9IcNaR2?=
 =?us-ascii?Q?ZJTGl4+fdk3hiPziM2OKgAt+PkTLTf/99BT0GwOogAg47NHyfW1wjWLu2nxN?=
 =?us-ascii?Q?3bNKpd3yC0MstcHgcBZQhjzlGNgLzRl8DZXcfMXkBWz5PDbn0C/hZaxf+tlH?=
 =?us-ascii?Q?3UtOxB1J2soMVHjKAaMbhmsJM2+TzsVOiFBsOAt1QN2mfHT0FmU6yhlYVncc?=
 =?us-ascii?Q?74WwbfnOCDph+sVhzQa09uPkJAYilZw/dVqvv4QzroXeVwOq5oJGaqUprRjd?=
 =?us-ascii?Q?s+PcdSdeJ8SKj6PWxiMYazlTMHGyq8XCgP2uOk4Xq4vcQRbXc8cQBhSUvGmU?=
 =?us-ascii?Q?I2uT3CKULPfEVqeoW6P3WuQ=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db63af8-a2ae-41c1-f59a-08dcf1ab9d67
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 08:37:36.6727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bk2v+SgPV35JYOjbXGe5gAi4DdVhQ2aOc/otbDorTrrB2GvNpjXtBwXtiOBcs0kErW0QHByYXnkYiGDGTbODNyOg88JSpFCewC02xX77xNCJCEBgcQIn5dHxAUeeOyVr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR01MB8049
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>, Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Document Ampere's Mt. Jefferson BMC board compatible.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
Changes in v2:
  - Document Mt. Jefferson board compatible                   [Krzysztof]
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 2f92b8ab08fa..65bf8a161348 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -74,6 +74,7 @@ properties:
       - description: AST2600 based boards
         items:
           - enum:
+              - ampere,mtjefferson-bmc
               - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
-- 
2.43.0

