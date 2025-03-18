Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D44A67CE7
	for <lists+openbmc@lfdr.de>; Tue, 18 Mar 2025 20:15:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHM4D3HVVz3c8n
	for <lists+openbmc@lfdr.de>; Wed, 19 Mar 2025 06:15:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2413::611" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742325320;
	cv=pass; b=MuVBZrHe6+vpKIHhKgp9yETD5ySu60sdaoTNis9QpLjun/oFDHP6S/bYWlVU1jNmx3Sys/ibJ+Zf25sTM6c3TfYBy9GA4gS6Bowe0sRF3jLTxxl7YeVnh8kJQZtJQrmqBJ5TBbemfirCP0W9LNK+kbm0UqZvzMtGSnC8JfEO9cmz6hfPGdkONko9yquB0jkHleSrNZEH01ykWPJtcdIC25GsrGVVWRGSobo/ySgwTfFCNkzeLiFh/kv721CC0YH/opCmMztU7yTqB0UYo8Y2BlP/+1vgbLYtfaVpGEFSbZASCh45BWb8+u9VIan/yZ2HateSdEmnr8BDaB746R9Kig==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742325320; c=relaxed/relaxed;
	bh=/5zRHRwCZFkA4jCPjEZYJbooEOe13KKO4TxrGdRKZ20=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BSUkyjtEVngsO1FyrjH9T98W96SBSvteZmGQVd09fWxmeeDnWZCKVCfgwdZg+JgutWXWuffavlKm5si0jevlrZE7jU46TzEgO1gQKUW+oKjbklDjuk76AzPdI4qZmXGW1KWNYcZLGAR7ImvRka7U5mDprGE3qFrvB2gV9/vI94R+R64vzyZtffqB9wg+CPuc9Kfo6b+26OcIb69tQyq17fkDPdEEELe9xCBCwyVNhDtfCD36KICmCP1cX0KKWbxC/UEdo/dBI2su+Pn85bb2C+R0JXqHSefPL48glSMzYTe4tFyDmOjrIin7+HseaeyMq4y9O20SJmFjffaOWIKD4A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hDN/gZK+; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2413::611; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hDN/gZK+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2413::611; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20611.outbound.protection.outlook.com [IPv6:2a01:111:f403:2413::611])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHM463wKnz2yMh;
	Wed, 19 Mar 2025 06:15:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uk9PVS/rPh1c1B5S2VzbAc/opGFs/qOGbKoFvmC+GAhkUlfUAHeJEaTYKCiOe7pkKsl5yKNF1QdON0K+XssZB7oA1WVPUnDtlFG1ymzrKSWo/ht0kDFFi5aoKp0S2lqZcBiQScEAI7+HvuiVesxY/FuCNPzTQFgRY55s3uFBtfZgsYpY9NPrg8L3fbXFu4nEd9tm2YYz0Xk368bx0SE17J8uWIiMYuLG+DlRYyn1YoYc2TJQ/iLrxrvCzaG7JQZf9pe9KdytnXYArA2FL5f2zvE+C2bFk3YbazgDm8MIqmJYavCYsiMLPyDfCTZ269wpz/QbIN6sA7SXWr0SeWnIcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5zRHRwCZFkA4jCPjEZYJbooEOe13KKO4TxrGdRKZ20=;
 b=xDcXO/9jA5YH5b3rs0ayeI9IaxXI56cchw1TH+WpfiyFmNgkyNwHQoKZG/n6M/B3L/01KcaMGpFcYOjj+KE2469nhmhOgzDtoPRp/pxTprRznAKn7DxkYmiN/M39+6SKcYiobuL5EQKBzCZbjvwrByPS4a3clvauiBneKXwFHZTFmpRDDPQojMA+mmc+OIB+7Y2s59u/AosgYUYIXxvTxf1dnzwY5yrqZUvjvueHzDCBItB5JneJyDIbowR4mA7eNSPTVkQd7gk5/IWav8DzsaJmdvSC62IloUHJ14XGR9AH92DE1dDOv75e8Tun0InvWeeihwBAUIY/XaOUQstVKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lunn.ch smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5zRHRwCZFkA4jCPjEZYJbooEOe13KKO4TxrGdRKZ20=;
 b=hDN/gZK+wHEAlxiuBTZ7W7N2QDHS4ZfhYlVA6cqE0mb4LJAMpq1f3p/AxMpmRMAYFChPYA5+I5DafBPmaDjiZYPM8rGTmO4CclplSBNt3u5PT56CN3MlwcyC5g/68Wc2Pm4tRZpzhgEKj21EhWKV/WJ98vMxUTGWtMffH0uLZHeupGew5adjedAT3mq+4I/ToC8A167cxOhRya2IzzI6cp48pTxUCQTEjPDO0N0pgsUzF9n24qHiQev+3fCbw8lcKzuRe8JEetew8QxyGDKjcjZe27kfSNxzWveOQmO+xz66YohQrZHna4X5GpFS+RLqW+5jEeZLqEcICiZKlrZFTQ==
Received: from BY1P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::6)
 by LV2PR12MB5725.namprd12.prod.outlook.com (2603:10b6:408:14c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 19:14:52 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:a03:59d:cafe::4d) by BY1P220CA0002.outlook.office365.com
 (2603:10b6:a03:59d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Tue,
 18 Mar 2025 19:14:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Tue, 18 Mar 2025 19:14:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 18 Mar
 2025 12:14:25 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 18 Mar
 2025 12:14:25 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 18 Mar 2025 12:14:24 -0700
From: Willie Thai <wthai@nvidia.com>
To: <andrew@lunn.ch>
Subject: [PATCH v3] ARM: dts: aspeed: Add device tree for Nvidia's GB200NVL BMC
Date: Tue, 18 Mar 2025 19:14:24 +0000
Message-ID: <20250318191424.4161850-1-wthai@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <9ccc845b-9392-4a37-8bca-4f54997126ce@lunn.ch>
References: <9ccc845b-9392-4a37-8bca-4f54997126ce@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|LV2PR12MB5725:EE_
X-MS-Office365-Filtering-Correlation-Id: f9522779-8dcd-42a4-66ed-08dd665124bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|30052699003|1800799024|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?w6CMQReyxmjbUj6PtdUdrE9y73y4BEZpqVe/j9zxLIRwp8QcpjOYVKtL62Bw?=
 =?us-ascii?Q?kwhU+ifdYS8++ShMVrhhvN8rSIBngI2+kYsNLAScihCZKi2FZHKfVCAG4A3l?=
 =?us-ascii?Q?WKNSbLc03emBvv7W3XGQoDOs/Fn37HZylXhO24oEdbbDcri1JJVpqFXZarMQ?=
 =?us-ascii?Q?HQ8XAPJWtqxECRAWqH8GLqEiz/o82xFmoKIh0Mga6t5PKsyP4G/V3iSePyfx?=
 =?us-ascii?Q?yCTZKSq2H0mqk7hnAjzbLtR5eFwkZ7O7cykwzmO4zO1FTtdM01nH4Q2hPxVT?=
 =?us-ascii?Q?2boCc47lTUmcYcKYu+663iIyQDXKVbScyLYYi+Xv3V7Caz0aegiIZWlAsxNC?=
 =?us-ascii?Q?DMsC00pBOQy75apDFDTDnbnvCbsZPuTBKxoWwpCeuppFuwJobSa6RGkXFle2?=
 =?us-ascii?Q?Afx23teSAKuFo8ricok/eTRp3yoa7z32GOnwnMNuK3POrB5zOE3Bxt9r76ZO?=
 =?us-ascii?Q?hpeBLqsIgbp00JNepJUIaBgm65s7XtPUrBJLeb0m9w/AH7LQ3ghUwGBo3Wmu?=
 =?us-ascii?Q?HLftbjPrYbL8egYtQN+2RjY6ExZy37ALb0TeglVFa4abMHCXOkracxcxuBQx?=
 =?us-ascii?Q?qNgzkEtDdeTQKCDyZejPyvYUAHP+MuOyNBHvnH16vsKORalUBsvNqcNCOIne?=
 =?us-ascii?Q?a50aKmAwqNHNFT5MSPKC7P/Zbdr+HvPxodnQprYyfmk7s7x+PwORpwDRlTO4?=
 =?us-ascii?Q?orY+W5lgx+itBl8dFvd9N/jo3kdmWV7WqCS5U0kvQwT9cowXnMne8+H653y/?=
 =?us-ascii?Q?NZ3kojbZWA/i5elfE3tLxKWlJZ5j8DKa3sZUsq/35aRkwQOP5DHXoS4YQcD8?=
 =?us-ascii?Q?8wLNMxUu8k3DdYmmDif6YlZO4xwAUwT3kAxXgJw9otYpWmhSNfwe6Tc747Do?=
 =?us-ascii?Q?IQf33wUH9tvF1uDfXtJ269mpFRE+S3+r/rT+FXfcjJd8XrB/TMCKLDmBaYMI?=
 =?us-ascii?Q?64YbqI4YU6deOf/UtHoBiU9Ej/QUbZW9vPyNWiC7XmUFqVW4jz+2p48yIJrw?=
 =?us-ascii?Q?Ozt/J9cxzI+GgTzXZdwoM6FfPTLObWHe6Kv22h+7SisxKM1NgKblauBHEsv7?=
 =?us-ascii?Q?71BMx8CSABo2iYD/DadNXDOzKnRBMDkv8zoCdBbULVoTI/XUBJTjtjGzaBPm?=
 =?us-ascii?Q?+FZTwIaf1OcQwbYhiGTPxajYcTLo5fwxbrzOBAVwhlPCnRTpJoDzCElc6DW8?=
 =?us-ascii?Q?ENXk6tAwxCgZPvreeCkBOVivYOM4DfBrjDW/bwy7xQrnL5wbeXIaVrLbD5X6?=
 =?us-ascii?Q?xX59ivHN4aZ5v9WwEogF+XIwFoWbQOobe0nJQUfrhO61IR69+4NJSaMNa3UT?=
 =?us-ascii?Q?U4P6+/7Ltz7vkQYmHSbzLRo/SS1tki63kjoBQ1QF57jCoqZO6g+IPiyw3UZg?=
 =?us-ascii?Q?ujG6CDk+xLJ3d9nGKIOFh0QkzeI4NGpWG76M3XNnctYTScDLu44EsLhsSP0g?=
 =?us-ascii?Q?Wbl+fKEt6DBO7MVrNw5Z+vL3mdpv50FheYtaX2GQ2fcLNsQP+NxuCg=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(30052699003)(1800799024)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 19:14:45.0161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9522779-8dcd-42a4-66ed-08dd665124bd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5725
X-Spam-Status: No, score=-1.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: tony.luck@intel.com, devicetree@vger.kernel.org, conor+dt@kernel.org, tingkaic@nvidia.com, linux-aspeed@lists.ozlabs.org, pmenzel@molgen.mpg.de, kees@kernel.org, openbmc@lists.ozlabs.org, leohu@nvidia.com, linux-kernel@vger.kernel.org, krzk@kernel.org, wthai@nvidia.com, gpiccoli@igalia.com, maryang@nvidia.com, joel@jms.id.au, dkodihalli@nvidia.com, krzk+dt@kernel.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

>> +&mac0 {
>> +     status = "okay";
>> +     pinctrl-names = "default";
>> +     phy-mode = "rgmii";
>> +     phy-handle = <&ethphy3>;
>> +     pinctrl-0 = <&pinctrl_rgmii1_default>; };

> Please read the discussion again. "rgmii" is probably equally wrong as "rgmii-rxid" you had in v1.

> Please talk with Aspeed and ask them the clean up the mess they made with RGMII delays. Until that happens, adding this node should wait.

Thanks for your feedback !
Talked with Aspeed SOC vendor, will skip this node in the next patch version till the delay issue get resolved.
