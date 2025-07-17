Return-Path: <openbmc+bounces-368-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96604B088A8
	for <lists+openbmc@lfdr.de>; Thu, 17 Jul 2025 10:59:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjRgy1f57z2yDk;
	Thu, 17 Jul 2025 18:59:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2413::60e" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752742782;
	cv=pass; b=X+btHeEHtr8ng/1TtKKbYCXhfUvbrvoD/bZw0Degf3rnqD3dhFFanOz6GMy/1exajU8OHCp//8kvyRcADeF8W1nQQIdeAlqJQQCwRt5xrLMtBG++d7CwqBBW7hDSYPLcG1+hdm7xc4a6RRTT2LU/foBZTf59u3tBqzspRmWdFgTVZsS7azJVhpEmbRZ/AZNbFW6jk5i+XP6Y5++dnBMkq5JVDJtp2Rw3FiZ2Wu4csLzJk+ervasBBx0h3tZPcNJgZ5p5u/anuOLFQy4tpBOrlPDMgzVoJrqtSzsZ9RJYbd8ztuAz7FL8QbF+UKVLoysp9zgysAoKQVBuH7yqzgd+DA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752742782; c=relaxed/relaxed;
	bh=vUxlGTEhktdMjrZq3s54Ini3nyIX/Afl+r/xfUIbGTs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W0bTIqjX0TiQAg3t0dGDK4NivD4Y5/OY38f6EOVCIocX6Y2xUBUH5On4anikniBHkG6RH5WQpvJZrvgWkKuoFe5o+9C3ekcZnFhu9sLCtuTcSWVy+mC5PSHtpAqR3T3KGa/WEnl5qkXf38c9C3OQj8uAWLg/aTT1HZm9b35iBdkYm+N6/M9NY+RNfa7H6zHWpC7sxC+dh1IrDLoSL69/3ZVmKJ/YEMDTev08j1CYkzxc8gx1s4qezWxho2WpMfm943og4WtlIouKhFKTCRnBCcqmCsHHQzOCTaeDq43gPsPBWqSeitzyDCW4NUuS5H6VG3zebxpaKUl+ctquha3K8Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UsZBNxZn; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2413::60e; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UsZBNxZn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2413::60e; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2060e.outbound.protection.outlook.com [IPv6:2a01:111:f403:2413::60e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjRgx01KKz2xWc;
	Thu, 17 Jul 2025 18:59:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4dQrfb7PvRfybnO+hguQlJOsw1wdOLWRIGCNHuF4zdf/OkA8FWXCzMrGzocphGyXuYtuNBhNjAzP4XJ2ED5kE1ZrMy5+jYKTdvorJneMGc4hGI9iJgkJpYpbO4etS8TIP0fCxAhke0JsrVuyGiY9gP1vxGgZlXxHw7UQ+R/RP/xL0lVscT/yhkI9LnjQObZMMTxVBc0qZfho/eqziQIAXXm9VV6W+G99ajQzzgBapkYHBbqsp/CEDInmZzq96NN0FczV5RZv9KjhOc43zULVa8dfhw6NBGPpxMjZR3GjhZOdAtpBM88fkAELpq8mwOhSsCI0Jx6TxTABY7yjRMmuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vUxlGTEhktdMjrZq3s54Ini3nyIX/Afl+r/xfUIbGTs=;
 b=hfMXEywgVdUdpcQw56TwRf00x38lipT5SI89Tjr9q26ftwj69RTo/kgf5tJ+XsiqxxacVCRw+Vlwe1fLyPM/O3fgBGPk6JOL6AhGjt+wW0i0uoQWRjSMH8rVVnXN0QaZWosDFATdSMzI83rWPhDUAcW65oeXqPKdd8lmzFqSEwQ8Uil2WAdmGzEIP81Dk0iuYYfrtTOU3evGIssw9jAQIEex8ZFeo5U5i0Qw9mMWnGO1uM1n4nk851oHA0fYYSEgaR6PTjO83S04CTJqpnaDfHDet4VJGnH62Yazy+0BgYyYIq61BMEfuqnPC/12cp+2p5gxNLvLABKW9BA7KnxyHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lunn.ch smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUxlGTEhktdMjrZq3s54Ini3nyIX/Afl+r/xfUIbGTs=;
 b=UsZBNxZnVmLUHdCVTCKbSpz0AHPVdxwD+Pb7I7XDAmtfzxisQykP3+e3goZvNDcCHxI/K0sRr2lPISx850qKaoWyTEToHb6cyv4xfl25ii7SJSs8L3VrkSTA5pRXOQDx282nFZXdLCfAzI0qRcTH5BjwfTLl9TvIZSRZ2QHkkRR1Zzd01FnXFjqhvncm899Yd1a+wcsZ/J4mbWtTLYBXB1KncebVWHIngRAaD8rTIXuXtWDAGD/JDB72+jJOD2Pi99fCHXB4m4o0rrGmfTFMEk2m4lfnklFT4vMiNk8LCWXxf/ZrJJGbbnfP1OMO6CPvS7XhQuyPJELZ56lRqHoTXA==
Received: from BY3PR05CA0030.namprd05.prod.outlook.com (2603:10b6:a03:254::35)
 by CY8PR12MB7635.namprd12.prod.outlook.com (2603:10b6:930:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Thu, 17 Jul
 2025 08:59:18 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:a03:254:cafe::df) by BY3PR05CA0030.outlook.office365.com
 (2603:10b6:a03:254::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.15 via Frontend Transport; Thu,
 17 Jul 2025 08:59:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 08:59:17 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Jul
 2025 01:58:59 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 17 Jul
 2025 01:58:58 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 17 Jul 2025 01:58:57 -0700
From: Willie Thai <wthai@nvidia.com>
To: <andrew@lunn.ch>
CC: <andrew@codeconstruct.com.au>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <dkodihalli@nvidia.com>, <etanous@nvidia.com>,
	<joel@jms.id.au>, <krzk+dt@kernel.org>, <leohu@nvidia.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<robh@kernel.org>, <wthai@nvidia.com>
Subject: [PATCH v2 4/4] ARM: dts: aspeed: nvidia: gb200nvl: Enable MAC0 for BMC network
Date: Thu, 17 Jul 2025 08:58:57 +0000
Message-ID: <20250717085857.2707150-1-wthai@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <17cd5195-29d7-44db-8f3c-474dc5c3486b@lunn.ch>
References: <17cd5195-29d7-44db-8f3c-474dc5c3486b@lunn.ch>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|CY8PR12MB7635:EE_
X-MS-Office365-Filtering-Correlation-Id: 93355786-b95b-4fd7-acfb-08ddc510360c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fCCx3zm6wVZjZPl+DNhE4d4YT33/8JxOC8/mvFogU27RnHHKCg/tHpO50fcn?=
 =?us-ascii?Q?Z2Aq8NNV3kWxdPMHOQdISmKIdplDxWbUaV6GFEHSq5JKVSVWdlvI3WIm8Iza?=
 =?us-ascii?Q?ZDeacHep6AuB28xI6BvWlen5emEcf4t4iGOfWMj98RelnI7u6YM2Y+tB/5Gp?=
 =?us-ascii?Q?cbsF0/656fWGhnQl6mqtayggcQc3xc8JSkAhB8HcpCWadbpMckkdfm5DXtNJ?=
 =?us-ascii?Q?eSlLu64+HEomY+IY3O2BQLvftWCosRuEkBYel9loov4C9vI5VApx3utudPQ/?=
 =?us-ascii?Q?TBQad9XYpjio5g86x0XH65oC6tVyKaxvEWzLH11rcq5rupCU7ZDOZ4+1rPtX?=
 =?us-ascii?Q?c090yOMl27LOv+WgywN3rhWadHvkA3n9O7Rw5L8DxwZUIUPvU5wjULpXByXZ?=
 =?us-ascii?Q?RPXyXyz5L/ZlHLjwWXwRrjsVNUHU7IjUbWRNr0j/GWg5XrhFpz0pnB6cUAps?=
 =?us-ascii?Q?oI4XDdScQ7wo6Ak8xbw7gosqxWIaroA73tEElM3GcpKB9Rj+4ekZoMmE7io7?=
 =?us-ascii?Q?CPrBo93LMyonoriTCuxVg5KjeLAqAxsYzYu+5b5XvWC2Z9333RHMOe0doCWv?=
 =?us-ascii?Q?P9Z/DUR5NW+yE5PfHj2FpkwR7x6NQAHir9FB+ZLk25cA99JaTO1YF443ZlLz?=
 =?us-ascii?Q?WTTG98Z8r6O70cICcj8GalubE7zKhBXYZf2s/DyIVbirw11blFTslY7oSvjJ?=
 =?us-ascii?Q?NoOTFcD9BuX1FmpdkJDSO7yveMqaL+/Uw7y0/XHluDtG2F7xNuOJu93FEFVE?=
 =?us-ascii?Q?q+Nahpkf9JVI/LumQf9pKEmM9F5bIzOHaZDHMGaSS+pmn5QPeWdM9wpqS8dU?=
 =?us-ascii?Q?rkfe0FFt7fTjP5QSMnX7/odZhQkHlyfMf3WYutHLWPkAb13Oavub73OZnZ/W?=
 =?us-ascii?Q?n8p7rqY7GpHFaY2nJs9a8QOf12W/DCQxEBtl0ycjn7ZeCCP9FqS42qjImGNz?=
 =?us-ascii?Q?aMcLo+BxpmYKppB/oyXGG8IvXpTkyVjV39j8P6siYi1e5cNfnP9Stk2Tn6KQ?=
 =?us-ascii?Q?iVtm4sQHogRnEr5WIOtkfpQ4svQGInzc3W+xhu3C87QvSqCxTrTcRNJxtIP3?=
 =?us-ascii?Q?i34HusaJXDlKLj415dNFAfN7rTy48naELKKsGl8VH2AL2FWULZk3PNEQQoMZ?=
 =?us-ascii?Q?DVVvUxDba1KTQblX2hkuNKGUB6Wp9dQ+lS3TdMai8elZ88Lfltftpw/xf4ie?=
 =?us-ascii?Q?SnAILhYIf5CqpxM3WRs6HVZpR9kNghy9tp6pr2FfLx1UieRBSoCeC2DmpkcW?=
 =?us-ascii?Q?aJF9gXboCjG6ECbLgES1Wa6wvGqtgW/cbBUdjoVOqwEXkIKhcFvsFbnnpMWy?=
 =?us-ascii?Q?KaE3bFmQ+pJ1kYd5jnUyXjKOQF9WLLs0PyG3Kq2pNF2KY89/ve9PDCTAviWC?=
 =?us-ascii?Q?U8Wmrd4dN5AG16ehonKfxVlJ25zd7VxZfFCRpBY1QdnWhWoqyE5WVMBNh6vQ?=
 =?us-ascii?Q?K19mfRV1BFIMUqR5VqrKVn9TnnJW2GsjuMorVwqw2jLk0nmFx51NQHXg5AsK?=
 =?us-ascii?Q?iJbXfvLib29pginCf5EuF/gQKFYiMHsYo7ae?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 08:59:17.2587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93355786-b95b-4fd7-acfb-08ddc510360c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7635
X-Spam-Status: No, score=-3.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

>> +&mac0 {
>> +	status = "okay";
>> +	pinctrl-names = "default";
>> +	phy-mode = "rgmii-id";
>> +	max-speed = <1000>;

> The MAC is using rgmii. How can it do more than 1G?

>	Andrew

Thanks Andrew for quick reply !
Will fix this in the next version by removing it, because this MAC can negotiate with PHY.

