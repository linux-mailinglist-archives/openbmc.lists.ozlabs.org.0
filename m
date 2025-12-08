Return-Path: <openbmc+bounces-979-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2352CAE60F
	for <lists+openbmc@lfdr.de>; Tue, 09 Dec 2025 00:07:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dQHgQ15jpz2xrM;
	Tue, 09 Dec 2025 10:07:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=185.132.182.106 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765189269;
	cv=pass; b=clorhq/TvVmZtYzjyoS3T5bk0N2NkXQA6OF6vv2MJR/uOSkGsPBgatCo1nVMWX3pS7wTqho3AyTkPAGsWSsKAxztAQJ9h5ormbfHbXPSrzP31R7vcYyr/vVA/xtNKTDGDnSIFurYK02uM9TD1481AX/V2rOA+8+ySJ+0M1XKdBQnl/OdEsgcEHd7YTl8W89Qw5O6iLDpOxhsziq0EKx36IwNY1+QkAEgOi2hkysgLwinjLHiX6FS/dFp2MkLexHhHtXCcF0iCotlgyQZDEJsFASryrrJ8Ta1NYJIwE0nDVG08M1mUH2ujMw4EDMLzSErUs4ad6nxrCMFjI+q3SHmEw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765189269; c=relaxed/relaxed;
	bh=mat8OVY5218Vd1FS4lIFAtiDvJ2/KSQh65s78qMo+tI=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WoE7TRNZAzdP8r+eV19uNyK+25Zcz7h+9sKz7zzIYiAVhhvodbdalWHhJjHhMROHuxyfu5xq1rQ6D94CIOsOXbbMdsb3q5vCD+eqUmM/2j4XAsSQ58f3SP26e1fQSdBojqTFXTuiPeLQza5KUnFX4rkkLNC0tMqKiTn5f6g9Ba6ySLMbgjBzikcOeerhBmxZ7baoBVfPUW3kZdUwuQs9fm00aJ3iafS0/YUj/0lzvCpHiDZIdL3W9OmQkr+FZEHSAPvKq3yuMfJYxJcR850rnX7tBfL2QgLUfFCUT5iUqLI2oK57jdOsXNoQbfnxuVqx43Pt7aAdhzgZGs1L9EeQ8w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=NSSf2vIt; dkim-atps=neutral; spf=pass (client-ip=185.132.182.106; helo=mx07-00178001.pphosted.com; envelope-from=prvs=4437d7b9d3=antonio.borneo@foss.st.com; receiver=lists.ozlabs.org) smtp.mailfrom=foss.st.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=NSSf2vIt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=foss.st.com (client-ip=185.132.182.106; helo=mx07-00178001.pphosted.com; envelope-from=prvs=4437d7b9d3=antonio.borneo@foss.st.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1923 seconds by postgrey-1.37 at boromir; Mon, 08 Dec 2025 21:21:02 AEDT
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dPygL5Mvsz2yMh
	for <openbmc@lists.ozlabs.org>; Mon, 08 Dec 2025 21:21:01 +1100 (AEDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B89hpqb1564254;
	Mon, 8 Dec 2025 10:48:11 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com (mail-northeuropeazon11010026.outbound.protection.outlook.com [52.101.84.26])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4avasnnvxf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 08 Dec 2025 10:48:11 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=crzdYd4b+1vGv8wpdNSuwLWmD904/+zH1+9T3uXVKjK6JCR2wt7N/kFo2vf/idWmplSVwWPxrInsWFZrgibHnI+sXF4aatJ+4JcYeMu0OutmxxgluHUIkyAXSODjbWjMHW3g3YzXXZTJN7ZvNp5agmp8kMBYoKPNeKtuG19gs9dVjJflwatijzcDnGLbnVSgKRJpq50FZsvBRMYPBB3uHJRHUVX5ioFSjYhPBATXnF2sQQRO54HZv/FJXiiLnxDgBZ0/h0wLdhYzQ7bGxLnWAeurtqCSmp8QRmsgErCgkTNwwFKayl6kCHoWXT+kpqHHRxEXkZbc0T4akjGA9yeIzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mat8OVY5218Vd1FS4lIFAtiDvJ2/KSQh65s78qMo+tI=;
 b=alkAMyQHb9AtPXfTZ7ZVzpPZnFztmeAUbQPepIiHZnmZ0gGqcMpHVtjC+nCZHgvtwGr0O6jW9Xx+0rfGso5qObgXegfb/kCvW0wc6C11tIorkAtN4XJYmoo8Fk3g1bbzb2KQpa7///sPyi83PXCdO2/rysH4VF6+XNh0bNc3rs3uacUmBem1VHjcgCEdIUOe2FeowWAgsBDcxLkkkAp6+EGHxi+ObkTi546FAGMMJLU5PEZkoBW0w3tRlzsfYLkHLd7lq5Aj03tqqk281wKLEOtbzD7PTGWGNv5kgf2bsw7ZaxcbPb+7J7Gy1AtlwCtoelZJvFNvlqtMnVL3qbnJbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=arndb.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mat8OVY5218Vd1FS4lIFAtiDvJ2/KSQh65s78qMo+tI=;
 b=NSSf2vItHErnh1Lgh5fakOxvOqefofteT4KJVsk04ndiS7qVPwQbHUpxOpqhhlk8QJx+ub8Am/7beMHoXXztfoDdlAFqfJUT1FEw6/H9aoqhZUoKoTRsIrHuhIBDHrQS+PgycOfZM9FOMDq8Lu02bjMioByX59dHK46v1kaF32scNKuo4F2QzqY0TDTPhg+dEokGOyTlPQS/dq34b7Nq0RAwdn6IkhkgKjdrz1mNwJp95teG4yaek10in/qxRbMSbL73YGj0T281oxRG7bV2k3RN/lGsIRgPOaBSC42v+MhyCx1E64UQg4a2AagOuUFcnNIyqh32JbRJwTwcgBfP+Q==
Received: from DU2PR04CA0191.eurprd04.prod.outlook.com (2603:10a6:10:28d::16)
 by DB5PR10MB7722.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 09:48:08 +0000
Received: from DU6PEPF00009524.eurprd02.prod.outlook.com
 (2603:10a6:10:28d:cafe::b7) by DU2PR04CA0191.outlook.office365.com
 (2603:10a6:10:28d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 09:48:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF00009524.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 8 Dec 2025 09:48:08 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 8 Dec
 2025 10:48:49 +0100
Received: from [192.168.8.15] (10.48.86.11) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 8 Dec
 2025 10:48:06 +0100
Message-ID: <0220ec0592b6ef8936c25cffbc6cbfa0539fb71a.camel@foss.st.com>
Subject: Re: [Linux-stm32] Kconfig dangling references (BZ 216748)
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Arnd Bergmann <arnd@arndb.de>, Randy Dunlap <rdunlap@infradead.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
CC: <linux-sh@vger.kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Vaibhav Hiremath
	<hvaibhav.linux@gmail.com>,
        "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>,
        <andrew.jones@linux.dev>, Paul Cercueil
	<paul@crapouillou.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <chrome-platform@lists.linux.dev>, <openbmc@lists.ozlabs.org>,
        <x86@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Matti
 Vaittinen" <mazziesaccount@gmail.com>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Paul Kocialkowski <paulk@sys-base.io>, <linux-sound@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM"
	<linux-gpio@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux
 ARM <linux-arm-kernel@lists.infradead.org>,
        <linux-mips@vger.kernel.org>, <asahi@lists.linux.dev>,
        Srinivas Kandagatla <srini@kernel.org>,
        "Jonathan
 Cameron" <jic23@kernel.org>
Date: Mon, 8 Dec 2025 10:48:04 +0100
In-Reply-To: <5e335232-89b4-4c35-93bd-efad7e4d8995@app.fastmail.com>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
	 <5e335232-89b4-4c35-93bd-efad7e4d8995@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
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
X-Originating-IP: [10.48.86.11]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009524:EE_|DB5PR10MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fd57370-59d4-46e8-5842-08de363ee48e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|7416014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TTg0WHRIL0JYNFZEMjBBUU1Ka0grdUxoczZDL3BpWmJjK0JDaEdEUDFQRk5T?=
 =?utf-8?B?eGY3SnRYSWhWQmlSd1N6Y0ZzcXBGMUlrNkdPQmh3NTIvMzJGNlNkWWlKVFp5?=
 =?utf-8?B?bEcweGxTYzZKOU4zWG9lUTV1QUlnK3N2WnRGMS9YL0gzQkM3WWh1b2MwUnJI?=
 =?utf-8?B?N1hNRnRBQWV0ZHNEcng4VTJJbWh0Y2hnYk5rR2ZVSVNEL1dSK05tZjBVM2l3?=
 =?utf-8?B?aFRCcFp1K1FFQXFDbVd2ZW91Z29TV1pWRjIxS2lhTXpCTVhoblhJbDY2Mk84?=
 =?utf-8?B?ZmYzTFdkMWtpa1hscEYyZEhQVTQrREsrNkhxMFNyL05BSFlFVVR4cjNudXZN?=
 =?utf-8?B?WmViNXlrSzQ3TjA1OWcwek5WL1ZOdVR1emhRM0lJeHhEU2w3bG5GRVZ3K3BX?=
 =?utf-8?B?VjZtL3dZcXgxOUVldzRtMHRhcnpLUEFKMEpDVDdFMEVJNUdkYmtrMTlnNjNl?=
 =?utf-8?B?eFdqV3VxdXpxMGVrVDZPOWhGNC9hdWFnOElCSktDeE5xWWRZeFBzTExBQXk5?=
 =?utf-8?B?WWhrTG9adWs0ZlJqaFczZTlCbTFXbVA1U2pVaVZaUGZFL0YrSlhxQWZnSklp?=
 =?utf-8?B?M0d1dkI4bGRUazN5TmprOVRoNEFiTVVDMU1lUXExZ3BOOG5rRUJvb1RjZVkv?=
 =?utf-8?B?a3FOM2dvNG5aUFo3QlFUVzlsVUtTR0dDVzFlNXZqWUVaRmFQMUtTSEE0SjV0?=
 =?utf-8?B?RmVSbW5DWmR6MitXYjZrdmdwa05va1R0SHF2WUtGRzdZNUd1OVZEL1J5VThM?=
 =?utf-8?B?bVdzVjQvZlVXVXUxOGcvSVBwblIyM0dHT2NOYjA0TjZwMDJzYzJEVWxMSEhL?=
 =?utf-8?B?ZHZKL0tRUGtDNjZFYzVFRHlMaExsWG9nU0VVVXlHRDFsRmZRT01zZUJBdFNN?=
 =?utf-8?B?c0RUWGZQTXpUY3pjNDZ1eWgwL2ViNlFEWWx5WnZaNjZhYjV6eEtIZ01sb0FL?=
 =?utf-8?B?RWg3OElyaVQzNEJySmxyemZUdENBMWVjc1k4ckxRdEl3TWIxa3FZQ21xazN3?=
 =?utf-8?B?T1Ezd3dYV3o3cWlKTU52S2wramdZbEx0R2dkNC85Y3c1amgvR3RUMjZJUElh?=
 =?utf-8?B?WDNSMWtGL05nUk1yS1lZN1V3SzhsR2s5SC9wQnFkeG4yQTNMYkw0bFI1NkpB?=
 =?utf-8?B?SzlTYk5oM3orMzZBdnJUdjVIUm1VZlJXNjdTSzRjUnpvWXc2c3BzZHpuM05V?=
 =?utf-8?B?cDlXQk0xUDlNY3hUYXpNTG1hNmFpZjRhSDI0YWE0Z2ZSUFAxMWpNVjd5WXNq?=
 =?utf-8?B?cEhsQ0hvZDBmL1hreXZaUWlVbmh2ZTNmMUVqYndyeE9SQi9NbFpVcXNyeGJv?=
 =?utf-8?B?QVVMbTdrWVdVZTdqVk5Ddk9wcEp6N3ZzUnA5dkxoNTBOcHRIczF6eU9reERo?=
 =?utf-8?B?VEFpTUlCbU12MzJIeHc0RjBQakR2aWZBTWhBTEt0Z1BhRCsrb1lUWU1aS0tv?=
 =?utf-8?B?MXNtZEJTeVpYdGRHS3lUNVhjNmpVRGRXR2hTNGFuZ3pkVlQ0T1EzSG13VVpi?=
 =?utf-8?B?Wm1YWmVmNEp0eS9pMGM4bk1TZGFGM3Bpd21oa3FsMDI0bU9BTjYxdnhHRDFS?=
 =?utf-8?B?V3IvN25xY0FHT2l4bFlhNmZ1Zk5RVkhnZzJEbUpQSzQvZFdPYVFEU0JhMWZW?=
 =?utf-8?B?QzdFbFVUWTk4WFFpZlRyLzM4NGhpQWhuc2NNR1lUb05KaWdzU0R4YXltZnZh?=
 =?utf-8?B?SW1ucFNCejN1bzg1UUtKUTlJT0lhNk5FVjdJeVRVcU1lUFFmTWJOS3VSUXIy?=
 =?utf-8?B?bzk3bklXT3I2K3BjV2R3Vit6N0ovZFZJQ21WVVdvQ1ArRGlEcFhSNWVpY2lh?=
 =?utf-8?B?YVgxMkhjNCtMbVBnSFJvRFVaMzdNTFF5TDUzUU90MFBMRWZzMjVJWUtGY1Er?=
 =?utf-8?B?dy9DaXV4SUR6RXAzNDZVOHlFNUV4WDFoK2pLVFJ0TWVyeXd4L29JWWVlS1c3?=
 =?utf-8?B?Nmg2NTVURk51UEN3R2VjV2p2SWNGekN4aTNodE1TNDVLcFE3NjZvNnVKS1hJ?=
 =?utf-8?B?STRKaDBqellDeHh3Z1gxblhsQ2Rrcm5jZVNYMi9MZjVGVk82YlZyR1ZCTml3?=
 =?utf-8?B?OEg5WGVaY280WE4wL2lCanFiMVNBd0ltNXczUlR2TXdFb0hGWjBBMTRvWGZE?=
 =?utf-8?Q?TK5U=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(7416014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 09:48:08.2448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd57370-59d4-46e8-5842-08de363ee48e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR10MB7722
X-Proofpoint-GUID: IDDwaqm75msPnFWovAsNuP1ADWZ3kEMM
X-Authority-Analysis: v=2.4 cv=J/anLQnS c=1 sm=1 tr=0 ts=69369edb cx=c_pps
 a=/z/ujZMLhdj11oxtLm6Teg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=InKxkLVgudg0ERFLr0cA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: IDDwaqm75msPnFWovAsNuP1ADWZ3kEMM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA4MiBTYWx0ZWRfX2Bd67npMN73F
 /P1IV/XjkkjLznRhzBPVUkiNK6yZrr1PKsdRKix0i+7v0OGHzQb4ewnSDGxWkjLVjp5mXgZggle
 y30tR33BkMSJpAWS639xLjVqvVdNewUyTC4UBjoN8rwyHADRBKcd/+vgCVL00cJ+sIsBxmFKtED
 pcsrfpVFtv/uvl1XjoWxyd4qPIEYGjY8TByA6KuVPGXekxJ7oPgz6EfoBKtd4hAZSUBoCsmh4cw
 MOnyQ/Gwz1BIxjPpY2AsweP48QtxdPqthHTnCAKxLuU6up7sFF8zc5iBH7sd5axAP6E0qlMGgoS
 C0dJ7Qv6iHNOtcOfKcKMSHHBj0KArKDLQ2psUJZp8jGnHc8TVeeMkIi/0nGpY87L0NR8yakFF4Y
 dw9J8vDeNYPdFXNImo/31WYGPVH0GA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080082
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 2025-12-08 at 09:55 +0100, Arnd Bergmann wrote:
> On Mon, Dec 8, 2025, at 03:04, Randy Dunlap wrote:
> > from=C2=A0 https://bugzilla.kernel.org/show_bug.cgi?id=3D216748
> >=20
> > The bugzilla entry includes a Perl script and a shell script.
> > This is the edited result of running them (I removed some entries that=
=20
> > were noise).
> >=20
> > I'll try to Cc: all of the relevant mailing lists or individuals.
> >=20
> > ...
> >=20
> > MACH_STM32MP25 ---
> > drivers/pinctrl/stm32/Kconfig:58:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0default MACH_STM32MP25 || (ARCH_STM32=20
> > && ARM64)
>=20
> This was likely intended for 32-bit kernels on 64-bit STM32MP25
> chips, which we don't support. I think this can go.

Yes, I fully agree!

I have a series pinctrl stm32 to be rebased on v6.19-rc1 and I can include =
the
drop of MACH_STM32MP25 inside it.

Thanks,
Antonio

