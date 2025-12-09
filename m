Return-Path: <openbmc+bounces-1022-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 779F7CBC3A3
	for <lists+openbmc@lfdr.de>; Mon, 15 Dec 2025 03:07:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dV3P06vHGz2xqL;
	Mon, 15 Dec 2025 13:07:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=67.231.152.168 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765273570;
	cv=pass; b=iTX3g0puoSeBfDbXMoWHR68xMtdz4hmRz2hImQYcSFw1SlD3j47GqyYz9C2dbVz2wx2KqbSYxCHf2sQcwBt1e9NSceyPWx+ZuENqoWcj36h7EimhVCpv4gdtiYLRQqUHehj0yi/ozIM+xXTGHyHQd0f6Xik69qcdKvr60tm3IKLfeA8/1RclSZbEniJbHChFG0OcSLOYgvL5y8vu+LqsEPMIkX5ob+LFNJdZ2v4o+60YwRvQFRmwLMqCMjuCmVaQN/koLY+MsLVtIaHIlfoYboI9mKFNlJjG8/YSUJx+HmhniutNjJvmWCRPMPi6vfDRWM5dJEiXo1CBv/8L1vJPrA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765273570; c=relaxed/relaxed;
	bh=PKHXBFeexF1OLAnNorin/u5kfN3/rLU+xeTkWta0by4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NzCnIoiRtAypFF/wqZa9GzaOdNYj2qY+3bzIh+MbOWH8FDdhZJ34LWLKzESeQ2vTe8eOQQoNfQfS4M5TOMjHuNH7pGRbbwIscbQifL2vROZw3yMv14xl6mINmZq8KVrQBgvS7ZV6jcEEX639kxmA9tTB/IbOb4e6QiYnbg2FGrra8z84AOc7QbKR99/M77F+paceytoUkNG7CqIzQq9tbDSpN1t9nL66VGaS5MkqZaaERoW4cF/wU83WXz5mWK+hnjvUcfEvATosOB4vEW95GXVzqi3NCRv2c61VM/iyp9F4VwzwpoFA06qwbS50tx8sHi8D73itM/pW1jFwq0fK+g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; dkim=pass (2048-bit key; unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=nJMsVbkk; dkim=pass (1024-bit key; unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=rQqSpYe+; dkim-atps=neutral; spf=pass (client-ip=67.231.152.168; helo=mx0b-001ae601.pphosted.com; envelope-from=prvs=1438e353af=rf@opensource.cirrus.com; receiver=lists.ozlabs.org) smtp.mailfrom=opensource.cirrus.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=nJMsVbkk;
	dkim=pass (1024-bit key; unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=rQqSpYe+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=opensource.cirrus.com (client-ip=67.231.152.168; helo=mx0b-001ae601.pphosted.com; envelope-from=prvs=1438e353af=rf@opensource.cirrus.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 510 seconds by postgrey-1.37 at boromir; Tue, 09 Dec 2025 20:46:08 AEDT
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dQYrc3Hslz2xfC
	for <openbmc@lists.ozlabs.org>; Tue, 09 Dec 2025 20:46:07 +1100 (AEDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B94uIYT179684;
	Tue, 9 Dec 2025 03:36:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=PKHXBFeexF1OLAnNorin/u5kfN3/rLU+xeTkWta0by4=; b=
	nJMsVbkk/0REfe2/pWPRS82FuNujSbNQPo1LBhVcs61yKmFSeTF6bSMUpRcXRxX3
	z0I5ZH3ifEWfPTBUhu8BM49Y7ERFF57al/Tsu+Pyvye/a4M2OOE444VSoMohKB2s
	UWNHqcHeOWDIFiom8rfWm7XL9V6rMg3inKg8EvppFi9v6BHg3d5vvMZtO5kakP9E
	Rbui9lEqJxfY4p7/2UoS25vYCT48dlS8qwHZeDN0dmzfuKcvDsKEgmU0BWRqspaa
	afcNJZ2o7CLGamtn4o+gWGTHLvAsbYytt6jvOf6wD9E3K8OvS7x1q5/6TJz5WHf0
	m6wY4CKTeI7uCeVErbnzAQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020138.outbound.protection.outlook.com [52.101.193.138])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4avhskk8kr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 09 Dec 2025 03:36:39 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RucF7YSWv+eVINCnJJz5Q4p7cK7P+xezEF3ZpKz2ripy9635PtU07jdzd7jlH33FCgnQ6awntnCFM76xH1BWfV9yo68ohSXF9RADhUShLbiR1LE1T+j7u1nVDlRFpcdAvhNSgrS9hu2l1xpTUmCDHj6rBz55N2fxzZup0S18G5yQb3BnayyUh3VSfKUkrUzeknxsUEI0Flq0E921EyKgxv9lzN0fLPlWvyyy1awX7hFU6lNQRsz1EHz9zh7BZ+dCaNVq1D6w2vWbjjBV608ojL9UecO4w+Ywo9mGsPdTR30FcP17sn7OkoayeuVH6h/O6cyIGggvFgZQ3ql1Vt7Hqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKHXBFeexF1OLAnNorin/u5kfN3/rLU+xeTkWta0by4=;
 b=ZTo6YWe1S4PjpS9yGxzWHkbTbbx9+oukgTRzY96RYHGY+baBGL7rciiDqFWuCR+zYbu1rhYRv33lOA5fylVrh88ulBwOLJ2b6NVTh4SyDfAG4rBRvrj2IX/i5a7a1gvw5T+K209loVrZPrHByZf6t+6MMIrajpPcV2GgX5dCVhxroUva2LlojsBkAsHMqZPRqAqri2yQHRIPSINBzxIWiMUgdxR5C6ymRjR1t53+Ep/dlmuwTUjEpJIEPklBxVoDV8f0QCss1dCQ8E87sm6oj2FC4xh+ZneSFRef/EpHdw7iI42skgSgzQA/RhMe/4AbdaZQuWXC7aFk5n4poR1qtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=arndb.de smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKHXBFeexF1OLAnNorin/u5kfN3/rLU+xeTkWta0by4=;
 b=rQqSpYe++dHKD8budRum+Pa/h/84bQEYkcJ8NsxvflHiSsdWjJirIQnFztPGqBm2G2XijzizPBOaxCv9Gm5ufnvkqH6gybqoWhVPPeaBzVznebkSoT1WRIPgsPS4DDs/l7EwnLwBLsubeiLWSmfsvcYBPbxhTfYJJQONr8YImys=
Received: from BLAPR03CA0120.namprd03.prod.outlook.com (2603:10b6:208:32a::35)
 by PH0PR19MB5396.namprd19.prod.outlook.com (2603:10b6:510:fa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Tue, 9 Dec
 2025 09:36:36 +0000
Received: from BL6PEPF00022575.namprd02.prod.outlook.com
 (2603:10b6:208:32a:cafe::fd) by BLAPR03CA0120.outlook.office365.com
 (2603:10b6:208:32a::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Tue,
 9 Dec 2025 09:35:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF00022575.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.4
 via Frontend Transport; Tue, 9 Dec 2025 09:36:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6ED37406541;
	Tue,  9 Dec 2025 09:36:34 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5F14F820247;
	Tue,  9 Dec 2025 09:36:34 +0000 (UTC)
Message-ID: <3b72f01e-698c-48da-a40e-431d08c7b847@opensource.cirrus.com>
Date: Tue, 9 Dec 2025 09:36:33 +0000
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
User-Agent: Mozilla Thunderbird
Subject: Re: Kconfig dangling references (BZ 216748)
To: Takashi Iwai <tiwai@suse.de>, Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, andrew.jones@linux.dev,
        linux-omap@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-sound@vger.kernel.org,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-mips@vger.kernel.org, asahi@lists.linux.dev,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Paul Kocialkowski <paulk@sys-base.io>, chrome-platform@lists.linux.dev,
        Paul Cercueil <paul@crapouillou.net>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-gpio@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Vaibhav Hiremath <hvaibhav.linux@gmail.com>, linux-sh@vger.kernel.org,
        x86@kernel.org, Max Filippov <jcmvbkbc@gmail.com>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
 <87fr9luyu7.wl-tiwai@suse.de>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <87fr9luyu7.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022575:EE_|PH0PR19MB5396:EE_
X-MS-Office365-Filtering-Correlation-Id: 08c42c0c-2e81-44e5-7bbe-08de370671fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RHIrRDJGd3cvK1dZN2c3cHlhSldLOW5aNnZtT0JNQmpoR1FwempvU1I3alpZ?=
 =?utf-8?B?MFk4aVJDTlMwLzMxN1h3SWtQWmxMNnVJQkY3OWdBVkpWOWRVWEphMmVXd0hv?=
 =?utf-8?B?SlJUbXBYbFhmajVQajZDa0xOUlhkTmg0VmpHOFhUcDJNVFlWUU1WcEZmMGVG?=
 =?utf-8?B?MDBhU1RScTVVdC9xQ1oxeG44bWE5SDhRdWtHWmRld3NGTFlsTW5hZkxySVNY?=
 =?utf-8?B?ZmM3Z3FwU3ZDOFpnczlJQXRONmNLU2FaMXlTRWE1eHBGY0Q3bzZQMXJIaDgx?=
 =?utf-8?B?bk56QXZBclBXSkNFOGFrRjl0SmY0K2lSTk1hOWI1NlRKeXYyTkRDZGdwZzZm?=
 =?utf-8?B?bllSTSsrbWdwRDN0bVl0aVNhUUQ5RTVHWnBqM3JBU1ZrNEJjR3BVRERHWDJP?=
 =?utf-8?B?TmdXWExBM2gvanRkRUtISVk2RUxSM1VKQ1l2NkhxZFdUV21ha1NrVVczTk1U?=
 =?utf-8?B?aHNkYkFMZlZIcEZuc3dtUmgvQnI5ekVrM2NJN3dOZWllWllaTzZOZHNXaHlz?=
 =?utf-8?B?WDdGNmhnSXFMbFoxVDU4YTdKNTRXdFVRK05zY1IzcWJ6YmtDRDZKQ0tjbVJh?=
 =?utf-8?B?V1dkMVliTVA3cWFYMzhicmNGYVhnYnU5NHJOL2RSdlRCem1RRHN4Y2pjZ0hN?=
 =?utf-8?B?Q3NrSVExYkk1VUZTNW1WdkpxTG1BQWFKQnpqK0ZYZkVWQmM2UDFpVVI5Zkp1?=
 =?utf-8?B?cHBpNVV0TVNQRjlua0M3V3c3OENwaUdpMGQvS01zMFdXMElvVk9mak1XWVNy?=
 =?utf-8?B?S2hiMFFqMUJoTWprTEt3S1RsNFBVWS8zTitMbmNJSW9sRWRIMlBPL2NMbnRP?=
 =?utf-8?B?M05Fc29xNWFuUXlhN002RWR2V0NhS1R5dC84cWRUMkdnbjV2NW1FTHJ1Z0M0?=
 =?utf-8?B?VXZkc0VHa2pjSnhvVzI5QS85SjkxNWhUM3B6bTVPQXRKT2dpZC9jYldFaW41?=
 =?utf-8?B?eFJJTWYvUGp6NVJ6NjdNM1cyaXlIUm0zZndGdTI0MlRCSHlJMjdtWStYRTVV?=
 =?utf-8?B?TndIRXM3Nnl5dUlNS2ZlUk42WnZ3eTlOZGJUbFVETGU2bWJxNnFrNmlnSTBv?=
 =?utf-8?B?WG1ub0UwM0Q5d2lqNjVKdUlpeTlXY2d6M1N6RTYxMTZNajRYejE3ZFdJekRn?=
 =?utf-8?B?VTdBUCtpWWI3RFlxY2FKRVZsR3hwTzVKR1lGYkNWZll2WFFuTzY3eGlLSFd1?=
 =?utf-8?B?NlJkQk1XTmVsem42cGg4TjRhUTlDcWlrOXZjTWpBbVo2bUdtNHgzTlJRcFdS?=
 =?utf-8?B?VDVvWE9hWGtoZ1JnbEd2bWVvYXFob3NSczNFVk5VZjA1dnN3RkU1aXlnaHhG?=
 =?utf-8?B?cnRwVGJLaGpuOW9ZZS9NRGdFUFNyM0UwUEJMT3lXSTRVdDdsZCt5RlF3d3Zu?=
 =?utf-8?B?em1BYmNGL3RKaFc3UmpXUjVYUHl4MitGK3FzVTlKTXhBTjdyanF3RmczY0Va?=
 =?utf-8?B?SHJqSGp5ZklqUy9SZ09sZ2I2VkVVQkc1QzV1bWZjcGJMZVNkVkhEdThScUM5?=
 =?utf-8?B?RnFuYUk2Y3NZZDZDb1cxS0tWYjdUK2YwUmpQN1NGOGE5MUtUM1dvck1PNUlj?=
 =?utf-8?B?Wncwa2lFd09NVWlnQWY4b2xzR3MxRjlzQjVpazJQOWxwQUowODRkK05tRGhj?=
 =?utf-8?B?eXVVZkdpcjZ0ZTFaSjdBd25DMG1SZVIrbVNLQjQwNVBBMmVxcVRoUUplak9O?=
 =?utf-8?B?UXd2RXI0TElBSVZJUHZvZHBjOW9waFpGWlhOZ3BjZVgwcmQwajJ1N0xnWVBs?=
 =?utf-8?B?WUNaSmxMY1BLeS8yekVSZ0JOZDVyOUcvNjBxR2hrVWIveGIrUTc1ai8zd0tv?=
 =?utf-8?B?KzNoZm9SREFJaEpYSjREaStpM1prSUNoVWxZbEgxNEMydmJJc2FXa1ZZMkx4?=
 =?utf-8?B?MXFEVkhJQTlJeGhHUWdCZU1zRDE0eTZHTkJFTnQ0dCt0ZXRPSTVwdTBqTEdt?=
 =?utf-8?B?SUJqTGlYWENpYSs0QnVML0NkOFdtZjRqMVFTUHNsOEI4NXAyZGFsVTNid3Fz?=
 =?utf-8?B?M3ZHK0pKUjFld3FrTms1TXIzcFVKME53V1lBQk9WaGJzZlJhYkxBaWhzN3VO?=
 =?utf-8?B?YytIYnRMeGNSYWF2YVZPNXFDcEh3WFlLRGNrQT09?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(7416014)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 09:36:35.2774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c42c0c-2e81-44e5-7bbe-08de370671fc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF00022575.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5396
X-Proofpoint-ORIG-GUID: HmELDZTK9mzkvQe1JymO9Z9NL6DpSihZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA2NyBTYWx0ZWRfX2rz8c69/HykU
 amDi/ybpGW57WMK6dc8arxp314n78gNQL74C8fKc88pW//+dtIFUEH3C9HGcP1rxLceLzz8KRxC
 uz3g6rG2/b9tj2r4ObAweTO7B/nAS+F/P0kyPiavpUBWeqsrcYM7vXan+fagpB02xzqMeLqcAXZ
 GpvcWKiNNd9j4kdKZu1ikQJKs6XkojQD/OfF693xcQNDyepRUc0Qru8LLrHxJV9hb/mqfWBJZJW
 GNmDvNtdFj3g/zpLDt/IQVyJ8mXOiJeLflQZquZiHsRANq5hw1oA+RQ8z3RlkNbs/lpgUQywV5C
 WPVgsYLvut7rvvl1bG18/ADFTRGdZo/4XolOX6Lwg7lOv3js4+JveFBWhFsK5dUPJunby6TzVxO
 P9CtUWZ+nV6VnkkbgLjiXdMrSdX+Bw==
X-Authority-Analysis: v=2.4 cv=DJ6CIiNb c=1 sm=1 tr=0 ts=6937eda7 cx=c_pps
 a=wpg3e3TFAlO0qOiIlNsFBg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=eQQaxFmmQVRwuAb-A3wA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: HmELDZTK9mzkvQe1JymO9Z9NL6DpSihZ
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-0.7 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 08/12/2025 9:06 am, Takashi Iwai wrote:
> On Mon, 08 Dec 2025 03:04:09 +0100,
> Randy Dunlap wrote:
>>
>> SND_SOC_AC97_BUS_NEW ---
>> sound/soc/pxa/Kconfig:21:	select SND_SOC_AC97_BUS_NEW
> 
> This must be a bogus entry added in commit 1c8bc7b3de5e ("ASoC: pxa:
> switch to new ac97 bus support"), which can be dropped.
> 
>> SND_SOC_CS35L56_CAL_SYSFS_COMMON ---
>> sound/soc/codecs/Kconfig:920:	select SND_SOC_CS35L56_CAL_SYSFS_COMMON
> 
> The buggy commit was 32172cf3cb54 ("ASoC: cs35l56: Allow restoring
> factory calibration through ALSA control").
> This looks like a fallout at changing from sysfs to debugfs, so this
> should be SND_SOC_CS35L56_CAL_DEBUGFS_COMMON instead.
> 
> 

Oh! I checked multiple times that I'd changed all the sysfs to debugfs
and this STILL got through. I'll send a fix.

