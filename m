Return-Path: <openbmc+bounces-116-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55788ACC539
	for <lists+openbmc@lfdr.de>; Tue,  3 Jun 2025 13:21:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBSvh6cMVz2yKq;
	Tue,  3 Jun 2025 21:21:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748943690;
	cv=pass; b=Cuj6yYhSKaa1Kb3G6z9uai3wEolZG+MjSARBHVZ9zNjYVM23E8vDiAEw9JbzUtRdJboRKGxMa3hn8O8EgFFKfas0MVMSDkCh+KszoLe2dDJwuTScVeLouqdyRihIdWWBQubm+ZaGQz3kVH4R5AZHuaO6KDVubcD2MNTgEzwQOE08lNe0lJrA0yw1kMI/TI6L3e9RcZsEz/LwRRL5IPvOBkJe84cLHVLht+3kjAn6ndhEb8UqrMC4waMn0uGnsDiFpcoxcdLSWQOfL7ZpzdnPoVFLgHLnQ0ltGhVgtMCKgapKDQ/ckA1jkqEeWjxLIVRed5hsBtrCLgnopF3+qOlBgQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748943690; c=relaxed/relaxed;
	bh=+6m543ia5fr8oJocIBbCjFksGHXNBZLjfQLcdlYZZBw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=geeTZrIVpaZafzd2ffbc9e8nz69z02U/P6C/SEa/Zqc1U5NVnpPrqDUI5Qgh2Q5fuNPmK0ncpmfXfRANPCe6Az72wDn0MRX95Q39o3xg7e+1WbgpZ4RJD37ysFV5nzVOS4Qrx0FPZTsOZlpNa/jPfaO7x+lXEIlEIRsAK2EVMvQhoxYpAdIWfa520hhS36vbfMZkYG/nmRQpFYu7fsk4ubaE97cw2ikhbH437hZBynautgMnPpckYX8YpFGPigg5Scmatdsi+dAw+w7nEJAzFMMKmaOOcyLV8TP7CrGVQkothaGRB2yu+xsO5C4+swiOoSU9WOLAsn/H1E377uhKlQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=axis.com; dkim=pass (1024-bit key; unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256 header.s=selector1 header.b=cQbuwTpm; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=jesper.nilsson@axis.com; receiver=lists.ozlabs.org) smtp.mailfrom=axis.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256 header.s=selector1 header.b=cQbuwTpm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axis.com (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=jesper.nilsson@axis.com; receiver=lists.ozlabs.org)
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBQhS4wrlz2xDD;
	Tue,  3 Jun 2025 19:41:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UNoSY5yRtfDl8CpT8qVsGCx0Z8QRS7q6/T/e6bCGsxmBB1P9Sc5nv2hKk5lcXYh8mgRaHAwepXdBsq6LFjKfTByV16p63t1Fb+lQCnNkxl9sql5n/PWkDxul78u8bV6MwWE47v0PITwxOdj1GHRhevoE28xMI9V4JlluNvPidIWtNeN8gv8imJFqamyJ6NfSk1IE2ICmw1WbUvzrcjrbkT87fmNutgrIY50tNLaEf+2Fz8zGsPmYE6PgiHB4EmcfUfX/wLQEXlupUeUSYBd3FQtxRQwzbqts2Uv99ertCPmha0PtXk2hgTLiRkoeNyafn7kvCNvJLrI2ocSnOelk0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6m543ia5fr8oJocIBbCjFksGHXNBZLjfQLcdlYZZBw=;
 b=Um4dWEvy1XnqSvBae6mmdAJeHNzIAnNS/5j4qeBwZLSdy2kJHSYWuu2l3ymdp0Ba6sNOcZTLbeuLdFLswGEmXEKTBtY0O11YTHXVUfB4FOwQpA7Sj3SNYAKDLOOFR/NEuQHdt3ODCkc24aZmsmweSwT5HH0tNdjuTKbFHygG6e1bg5fnmIgZ9CmIrA5b5SmP3gbrR3yszMYhW41ggtI9Mrv+fVrivx5txL6RPSoyWCvxfl/sQ0vzuFymbBHhQNyMwLWGnE8F+zSq3NcX8J6IzDd3BOL7VDnPCegHIXVAEqQMvT2Fnoq+BTvQNi2aHu7Jwtzs1XzkDUDMPN2h0cSOiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=amd.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6m543ia5fr8oJocIBbCjFksGHXNBZLjfQLcdlYZZBw=;
 b=cQbuwTpm9QWtwgvur8WTcs1U/yyW1zreOuuohmt6HFCFMLVbn9QDAzPJe4mWammjNn41XV7ksMJriC+uxFsAEK0fG34EHa29vpnxHC7nT74gw32rFIX6eD7sgdRn0FV1Z4TXco/LejJ1vN+6ybGjqDQ7IKw4CHV6d7ET6UT20cg=
Received: from DUZPR01CA0259.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::7) by GV1PR02MB8514.eurprd02.prod.outlook.com
 (2603:10a6:150:9a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.23; Tue, 3 Jun
 2025 09:41:01 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::d9) by DUZPR01CA0259.outlook.office365.com
 (2603:10a6:10:4b9::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.24 via Frontend Transport; Tue,
 3 Jun 2025 09:40:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 09:41:00 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 3 Jun
 2025 11:40:59 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 3 Jun
 2025 11:40:59 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 3 Jun 2025 11:40:59 +0200
Received: from pc36611-1939.se.axis.com (pc36611-1939.se.axis.com [10.88.125.175])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 17C26F86;
	Tue,  3 Jun 2025 11:40:59 +0200 (CEST)
Received: by pc36611-1939.se.axis.com (Postfix, from userid 363)
	id 13AE262A92; Tue,  3 Jun 2025 11:40:59 +0200 (CEST)
Date: Tue, 3 Jun 2025 11:40:59 +0200
From: Jesper Nilsson <jesper.nilsson@axis.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, "Broadcom internal
 kernel review list" <bcm-kernel-feedback-list@broadcom.com>, Ray Jui
	<rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, David Rhodes
	<david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, Jesper Nilsson
	<jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>, "Manivannan
 Sadhasivam" <manivannan.sadhasivam@linaro.org>, Damien Le Moal
	<dlemoal@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, Michal Simek
	<michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>, "Jianlong
 Huang" <jianlong.huang@starfivetech.com>, Hal Feng
	<hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <patches@opensource.cirrus.com>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@axis.com>,
	<linux-riscv@lists.infradead.org>, <linux-rtc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH 16/17] pinctrl: Constify static 'pinctrl_desc'
Message-ID: <aD7DK5V7WV5YOfX2@axis.com>
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
 <20250528-pinctrl-const-desc-v1-16-76fe97899945@linaro.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250528-pinctrl-const-desc-v1-16-76fe97899945@linaro.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B620:EE_|GV1PR02MB8514:EE_
X-MS-Office365-Filtering-Correlation-Id: 2428eb23-537a-4ff3-456d-08dda282c026
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nnYMCJxzoDCQcS6nCpvjhaZmrnjP64M0FLb9LGa6l8VXtWEfUAelIF7sch0V?=
 =?us-ascii?Q?ZljCL2dH6Fwx9pWx6Z3wnuMYNuMdP1TlppVaBqqf7Is/41DySTXszX6AKHZ6?=
 =?us-ascii?Q?ubU0JWs4nxClsUj8DtmI6c3+hmvaNkY1WXZfTJaBSTOAIESUj6NBWQSiQKP5?=
 =?us-ascii?Q?jwbbHklkxE7vNKBuFmYi/XW6izqvIvs4j9S313Bu0+BD+iBbm6XW6lFqeALP?=
 =?us-ascii?Q?xPyQqNeoF4+oS9zZwgPF7KV+ahVMVul0kHH+1QmvXHYXBLfFnPxlGQ8dootF?=
 =?us-ascii?Q?VQMx7Xu0xkUPRBnf9IUwECb6e4rhXM6Ru8nBVqFgx4sXiARvBkHKJD6EBKuE?=
 =?us-ascii?Q?mu4q0j0n6extG5ohXi6bu8WkgFls2r03lqgThEbHMN58FrWz0G0mG/bJxBhO?=
 =?us-ascii?Q?Y63hLXdKSZynXvu1eFoGjF9dsdy6epYhcXN2EevK3KSkY7kn2FvOl+0pMyP+?=
 =?us-ascii?Q?IJphA69w3x0GiSChmMfzWCCPxqqPQKY4bizYfqjQgVR0sNxpO3WIPUwWnVbz?=
 =?us-ascii?Q?dEYge8fLpjoe4/C+DQm+GzbIa5KWvk6aMSdQ0Sz2389mWqLljesi7HAJx1ce?=
 =?us-ascii?Q?xSViNzMuodIb9bLDfolfLlek20MflM02Fam2yFkY38qvi+eM1l+xvDvF9NOu?=
 =?us-ascii?Q?kAYQXbxeiiuJs1bfFUmv4XUDWbQJ2edyfgw/28za+2ONxC99fDAWcDID91iD?=
 =?us-ascii?Q?bgdAjX1DwEYoxZM1fPC725KrdxrnZ9oNyFYddu1Z+0beVjurQBOdXCFCw28m?=
 =?us-ascii?Q?B5H36TMELodh6+DAcNt4PHaeMuX769uVxJCFAdgWX4j+fe/DH23GRQKl5M/8?=
 =?us-ascii?Q?PmcGT+DS3+IneNXP5ym9m02QKU9iO4MoEOToKw0YpwfLKFekEHsDV9MRv2JB?=
 =?us-ascii?Q?0T5C3kMH4uo421aqn44uhBUFyozzcYElZC9KigFrP3W+QT2EhdCjtDV6La/n?=
 =?us-ascii?Q?qjlbCnEpe6TYROMyCU4tiUA5vZioZAsJb277tM12AooMqtrx356HxauHcdp7?=
 =?us-ascii?Q?8nQXIPDsotnr/j2TfKy8HVncvghlUC2imZ9tUXesdIVmyMsUBhfKZJYoqKKQ?=
 =?us-ascii?Q?sPfldn+9LartxNqPZj2gUUBLYqYB1GimurkZHTmL+8Y4tWT4QyGH7IkMEajs?=
 =?us-ascii?Q?6pt56NKm58cXuVGR4jKCJPGrvsxfyufSJEEG94lL+QjKwOh9kzkT/1WCatHa?=
 =?us-ascii?Q?lHUglkqjJWtSVE4EWeKghjpXY0SPE33LNhDeGsPhoBoBZRwQgqpPYVR+5LvE?=
 =?us-ascii?Q?7Km/3miVXFI0tvHnE7qO24+A9gR+L5cZaIaj7o//mvemWICRYHRxYFuilC/a?=
 =?us-ascii?Q?QBEeGCztj4pbiKcFWP2TOa4qrcLdGpgprFZdwZVjmc4RrKb+6XxXzJKokhCr?=
 =?us-ascii?Q?8kbpbwQvTGKbCznmsQ0kytXCheXr4f164MEKW/2BZ4ya89kXrqURU7hoVY4p?=
 =?us-ascii?Q?DEJk/fd0prvVAGPR7eAzUFCnL25HQStkqUht4PlNPqt+uRTWDILXetPWygl0?=
 =?us-ascii?Q?6u+pbgOxRfrT2lstBKblz/qOs4tfeOprl1Mw?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 09:41:00.9134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2428eb23-537a-4ff3-456d-08dda282c026
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8514
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 28, 2025 at 12:41:12PM +0200, Krzysztof Kozlowski wrote
> The local static 'struct pinctrl_desc' is not modified, so can be made
> const for code safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

For artpec6:

Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com

