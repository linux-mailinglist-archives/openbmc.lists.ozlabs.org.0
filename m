Return-Path: <openbmc+bounces-72-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78995AC6EC6
	for <lists+openbmc@lfdr.de>; Wed, 28 May 2025 19:09:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b6wvj3yPpz2xQ5;
	Thu, 29 May 2025 03:09:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=67.231.149.25 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748452144;
	cv=pass; b=E/Kg1lpWj2argi0Gyhw1yBC08ZHNxHA+nV9Iwljv0PB7HIVsMpGIQw5Zz+QKj5OOyezbQ46fJcKD3uiXhPyx2KLfXbxTc1STXkkyXUqdOyZsCw2lusbz4KigZdUNNWHLkRso3pN0v6Mot3IhlLsCJhIIawU7YDYN89jgp0PSZxO6/0TcJD4Cyi1KXxopcGiEk6ElhqUnrnMY4tymNoAGjfBmO3oc/0H+uUv+ZyAWsbofn3IWnhkqv98ZEfeqllPXfmoMBaBT8TUpotUBG01G6dpKGgOeNw4l/dJOWS/trfYWWc57iacsEWOk30wrgf667zbTh40h4yKQN+Wa+wuwww==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748452144; c=relaxed/relaxed;
	bh=u08B+em4gzK6P9FvSleq/IeRx5REGlJAmj6OjBJhsys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UbFxzBi9gwxuSvtziZM3gaaRtckQGby92XivZC+X2BXwG95TVoNXy++5gDssqo2alAe4D65i5Ht4SdYpHv5aUpjQl5XILpy9xiizpfcM9uJC0TFNVb4iTxOdmFYOEbPgG9Z1O0S9i4vG4lsvN3JWba7+nlaba5CvjkeFaEIyN3N5bw6RnxYvZJHP2Bp4B6S65ZtsDT+wdt00qupbYv5MIx4Yp3/yfahGCVRSCdnrbARhJR/hLPJBmJYNoqNG7zv8zptZp/87IN1X95nPHg7oW0eTj0wDrjnJhik+s6X8txAaMF+m/+HZ5B826VOczHZ7h9gGQo49PDTLZN0ZqIz8zA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; dkim=pass (2048-bit key; unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=kfGWocLV; dkim=pass (1024-bit key; unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=IYdfo65I; dkim-atps=neutral; spf=pass (client-ip=67.231.149.25; helo=mx0b-001ae601.pphosted.com; envelope-from=prvs=5243f7f934=ckeepax@opensource.cirrus.com; receiver=lists.ozlabs.org) smtp.mailfrom=opensource.cirrus.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=kfGWocLV;
	dkim=pass (1024-bit key; unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=IYdfo65I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=opensource.cirrus.com (client-ip=67.231.149.25; helo=mx0b-001ae601.pphosted.com; envelope-from=prvs=5243f7f934=ckeepax@opensource.cirrus.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1592 seconds by postgrey-1.37 at boromir; Thu, 29 May 2025 03:08:59 AEST
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6wvb2tWjz2xCj;
	Thu, 29 May 2025 03:08:57 +1000 (AEST)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SDiAOs031715;
	Wed, 28 May 2025 11:41:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=u08B+em4gzK6P9FvSl
	eq/IeRx5REGlJAmj6OjBJhsys=; b=kfGWocLV76iX64DqEWbqEOkt64mWbWldJ+
	r8EuZh5mGmabK6gtUfv6meM1Fwor7UgqZ8Gcq2EnikyKxLePDgW5WgHfUlPr5YCi
	DQP2IdC5YcBftBjNUc6K8cdW00XWKzR3FWHMjAnXq/qcf/VdR+67SJnyUR1BtdJa
	AQ9cJ83s6X0oHDp32yEnEbyR7EwWhrHLjpBvHLFCaxVt6OpjtjVVtVpoGB7pfmq9
	fC/tvQ3rTizAYP1mPrv77mqpEgT4WIbGptP+IrypkbQbDAOo9KJtrNaNkQn+aY0q
	R3llRnj2+rEAbXj24HHx/YhgGLmxGlz2Ai0dQkn8EzZ/3t5gH7bw==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2125.outbound.protection.outlook.com [40.107.237.125])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 46x3msra2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 11:41:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yaZTHDs5t21c2Fnb6GU+D7mSjgmDKVhAuJAr1XS+fb6lY0o9EgwM73D7jOSHpdxk2MAyHvtgWGvTrTtvAqRccExwm/ReDJvl46MLqKGHsvhHBi/zeJdaHfVmQtFwPRc6I2/JhLnxFv5/guo6XTOHGH8fK2PvC/mIrxWE6suxbzkDb4RbkMBU4HEefHetSnSmpiLBki+2arAKCifDOKAYzu7lfAqciJi1v4vC0wSZ1Xkop48vNTY3PmHhjt4wcJ2qTWe6QVSVaN9c9mexjdfqxSy0IXUZ86GeGLLKzzYPC2hTFVQRb1Zl4P3DCRMK68Z7gOLyovO/gpbgZR44AJoyoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u08B+em4gzK6P9FvSleq/IeRx5REGlJAmj6OjBJhsys=;
 b=WqLIbtEmT1N8KPX2UBD4nUzF2nEt4Dp4FgBNkHbgx0WSDu59zmR6cvJUa4iiqO3Hk4J8ZdSkB0IHaZ2Haf9yAX1q5nytGZ6fEXbvPWszQsvU8ecbJkAFg6LhdM7p3pk+BfwPUYHomjmhQBAYB3jK9ci8d2eH4x76sVFsb8y9fv2EGqkRPyVDL60YRYwu/1MGuPDDaG9dm5bmvTPmYlC+TrLabwr1WZDZKlA5XwznJlvuK2RBklgKWNpCvXays5jUeMySdj3QBGc4TytkRJc/Crgpwjs2VXwLoCCtTEow8QqK26DN6ybXwvlf5yXJJauZTCBenIBZMAJvr3OBrbEP0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=amd.com smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u08B+em4gzK6P9FvSleq/IeRx5REGlJAmj6OjBJhsys=;
 b=IYdfo65IywPdGNiU7yuA3Eye0+K2riFsoZde3T1Tu40iu5ZlvynqHwUGPO3CZmUr/KCvRbAdVd//ps0Ynz+bXCfPc8iHezyH01K1jKruKfgvcx14ojVxq0hkujxPItkaOeb4njj7jbrpvG2H6TeodlzwamiDWkN/FJdsH7nok/g=
Received: from PH8P220CA0034.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::17)
 by DM4PR19MB6025.namprd19.prod.outlook.com (2603:10b6:8:6c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 28 May
 2025 16:41:24 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:510:348:cafe::86) by PH8P220CA0034.outlook.office365.com
 (2603:10b6:510:348::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.21 via Frontend Transport; Wed,
 28 May 2025 16:41:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Wed, 28 May 2025 16:41:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 71C38406545;
	Wed, 28 May 2025 16:41:21 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 4A81E820249;
	Wed, 28 May 2025 16:41:21 +0000 (UTC)
Date: Wed, 28 May 2025 17:41:20 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Joel Stanley <joel@jms.id.au>, Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Damien Le Moal <dlemoal@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
        Michal Simek <michal.simek@amd.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Jianlong Huang <jianlong.huang@starfivetech.com>,
        Hal Feng <hal.feng@starfivetech.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@axis.com, linux-riscv@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 16/17] pinctrl: Constify static 'pinctrl_desc'
Message-ID: <aDc8sEMh2UpcHzVr@opensource.cirrus.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528-pinctrl-const-desc-v1-16-76fe97899945@linaro.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|DM4PR19MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: 08f9df47-b677-4a4c-3ecf-08dd9e067b1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VBEBjkAyTr2kN8QdSs5yBj6FRJ96ftcJDl2LthDFL3T/SWMTgRwHtbQN8eEY?=
 =?us-ascii?Q?OLN0Bibox3b/rgwbsd9da7jE4g7qYBb+8nacteJM85/WDgW+cTLSnWLTd6Uv?=
 =?us-ascii?Q?KMOl0gZ14B0eR/D0iiH12Vcp25jRSfuulayJW6coo/ndMs6BmuWqnuyBmeDK?=
 =?us-ascii?Q?XnIcgp77Nx9/1fZnoZMpB4m0Nu0I+KgxXBav0fWMrsIBb5yXUWqwX0nrjIa9?=
 =?us-ascii?Q?4jQIl4isCnCRZ/CRS+iImfZXEwQ2wh0H97i/8lnjK4bsBnCV0Zle6ACUwcPO?=
 =?us-ascii?Q?1kIU4b0hcRNiJHoaA9NnlQc/gEJYshqDkakhKX8vwaTL/GeYjAF6HXWOfBt1?=
 =?us-ascii?Q?+D2RMaRn/upVD2sfqzTevNuyLrsX/ZPFy9NQd54SGXEfMkJILkj5yG4VJbj2?=
 =?us-ascii?Q?qiZVLfHvfpa+/R0QDxNzKXa/PhU4Cana0zrsAGqY9UJ7LFl1WP0ilUqFFrDo?=
 =?us-ascii?Q?r5kg1b6X7rhbg+uKFHLED++FagdzPbdeb//JPO7jbfifIe4OeM0xtT+jqyvi?=
 =?us-ascii?Q?6XKmeGRI+Qw+b1cq4jODBsmxSN4cEk6DRh2RlC28lvjqze+8YleGxlVyzGha?=
 =?us-ascii?Q?7RAhHXjvaje1oC+QcyLzAt02gWZtq53wipgSz/LPixeeziTK30nSVF9tBe5K?=
 =?us-ascii?Q?yepUe1179kfWAFGcKSsI/21i3cKqYZfLALMynD9axBYv732BHPc8b8yJCMwi?=
 =?us-ascii?Q?JyAjmVaecSFYlDqaJMKsIPiDKj7h55aEDrEZcDT1hnCzHfwpOarrA5cphZAs?=
 =?us-ascii?Q?XtAFrXOKs2uxWGQcZ0lYKL1yci/3feXheOAPU0MMyFtCepw7NRZWyMcHT+qw?=
 =?us-ascii?Q?qKqF4tPNVsYBNxxbgKspg8psGTi22YqyrwafZVuggNe+Eu4Fno8P6RqAg2Uu?=
 =?us-ascii?Q?PNim4XuU1KWYE8juLIvuYLKwgOjo77dr/y6mPLKmL/gFmzX+hvC7CXg88LYe?=
 =?us-ascii?Q?XLhEnzx/l9dJxXaoYcSI89TgGBroQsRd9lxSEKBSc/TKXmiLozCJIpMzTOcb?=
 =?us-ascii?Q?bwvUoGObEgtPf+uN3NsWAhEYivhSdBcNbQXcN1ruazynRRku2v4aQaKbRdZI?=
 =?us-ascii?Q?Z1llvbNHfahNb9fr75cdHFjfjhel5ADtf3dmX3e3d2AMfMK3xLwl5GxrK0+n?=
 =?us-ascii?Q?D1lDZp6GJT6DZwfSw6oixXuxYnCfZsWVHNWAqmpmzOOThfFImrcQijF5QSam?=
 =?us-ascii?Q?ciwvf/paT1kBGlTrYLv/5i+2Ts0bv6lDn5hml4xe4T/SuLznBCFMMcWNzjfW?=
 =?us-ascii?Q?d7vq65hH8i1rbJmGk/1nSMzqOS/rUJXCImh+CF62j+8L4umMfm2FOqMqo/yE?=
 =?us-ascii?Q?qepxP0zXPJeu/UkucazQRq1fiEpQxlcaZLe3WXJ4QvI0IHXSM+HrQPM1HF+L?=
 =?us-ascii?Q?+h+tgrbBkknjXWlUzeIDXpLf53QwNUe/TQw4lcTTZtV+MBKHuxlA/OLXQYTS?=
 =?us-ascii?Q?NYd289wkYBlQ4a/RGBgiG8q5NrJkz8gs0vwIyoIWOU/ctfe+qm+O5woiedZc?=
 =?us-ascii?Q?yFKY5cggqSIdpbGKguROvrCPub6dOqBSr64G?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 16:41:22.6358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f9df47-b677-4a4c-3ecf-08dd9e067b1d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB6025
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE0NSBTYWx0ZWRfX/77eowpPrNJV okq6AGhdh+AeiBWGgUus89iUbeeaBfd7Mg7o+Qg5Aq+ap5mU+ABWR9xIGXXrgUETVF51XLqcO0K EBQ4ZEK0J4mPeaewxak2JSy6cuw7J/uOyD/zRuLQrElfr65RzqbAAQyw3u1wu3ni071nJfxLScB
 EUbUVDKMobW0SZPK4hVoBDkc7HcqKEFzKLSuLpCJaiRGN5Tw4XYLeD6Ku8nxqwMBmRq2u/TLRBR WebC+iuPrSTvxiAbrYr6GXASv4/sn18IlcmbO9op+iJyx4BN320G9Jg+qd97rHk+F8ADbFjH9Qw NFPsgP23DASexd8l/WwclQNdR7loBCgz+tRZUYx7bPtcBqZ6dXVNs8dHu523n9WXOYpYH3keJLQ
 QFl8eJF43GCDRdEAUvhvm5SeSj4ZmfcvSHlYGnhPTjXNjWXnpzhJy8uic1W0ZmMl33rpfkNp
X-Authority-Analysis: v=2.4 cv=Qohe3Uyd c=1 sm=1 tr=0 ts=68373cb9 cx=c_pps a=azKGx87FDiaoMypZd7Lp/w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=RWc_ulEos4gA:10 a=KKAkSRfTAAAA:8 a=w1d2syhTAAAA:8 a=pp8jMgpbGpZJBU6_-_QA:9 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: FhwEZxe0gSqpkkLY4NWltVICs7azydqM
X-Proofpoint-ORIG-GUID: FhwEZxe0gSqpkkLY4NWltVICs7azydqM
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-0.7 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 28, 2025 at 12:41:12PM +0200, Krzysztof Kozlowski wrote:
> The local static 'struct pinctrl_desc' is not modified, so can be made
> const for code safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

For the cs42l43:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

