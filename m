Return-Path: <openbmc+bounces-1041-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A81CC5B22
	for <lists+openbmc@lfdr.de>; Wed, 17 Dec 2025 02:25:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWGMm09X2z2yMB;
	Wed, 17 Dec 2025 12:25:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=52.101.85.29
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765934755;
	cv=fail; b=WJSLCM/NfKfFR6ymWCoyMIiY4YRlARi1W/OvpASRPYWl73BJ/xF9CpyQCj4dFBkfJKR+DVIGVQeZaonfFe9Hjly/UzruNt5lKNeI4slCaf/6vY2YdMS7/GEGf+xgr8w1GdTQ7rfaqyiYoHe8Ksn+MmYjw9fgKF3zOxW0IMd7gNxU/tEgdpIDaykSYCFrHmuuYXr5G4coGpb2+S34CKa0X1qwG1ftrVboFWT3EWof9dQGsfGROzP+mZ9MR80lNxaV2Ppt4NM78ZJJ1VosR50afVijiZhyJC0lzbwWEN5ZZURr/qLjyV8a43v7khd6PtnHErmiRGzX4MiKqXVTNKp+KQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765934755; c=relaxed/relaxed;
	bh=KWCjFkLUVhYCPDA6lUNjtD8ZEiLkaGYJsDrNZOZBgC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZofVHxi1V9mBlegGssWc2p3nauhNIBMENALsABt5HURFdcaE6nrILvJRTzbVvvf1WA9NFYbzK5HB7gg1Jorm00PEOdkOxBLEHQ8Cl8m9uwZCpETOV3QMdViyiTglPqlpbkEfa975ph8m/C6Bi6IlMYw4WbFVkNsngJyMnSm0z2nuLAP8KV50ERvE+cx1RzXe7w6eLNVi7FSfOZyZ6RsuaXNuYjpPDzPqmVp3O5x7jHFCxJT8ZAsr3i8Ujflg8bPVBLw4tf0sW6ZcjNuBLMFjACArX6zdS5trlyp9Psy+d0C+hMhAgyP1UF/bfmEvS4qb6DwQ78F4KCdOJ9G6W8xg5w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=fail (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XnFXh4hX reason="signature verification failed"; dkim-atps=neutral; spf=pass (client-ip=52.101.85.29; helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XnFXh4hX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.101.85.29; helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010029.outbound.protection.outlook.com [52.101.85.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWGMl2WFnz2yHD
	for <openbmc@lists.ozlabs.org>; Wed, 17 Dec 2025 12:25:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xvg5NGRJa9Grrm2W45GtMgS8BRGZuasFiXIvvKyTdJ0+xzeZAwyz+fVID4cH2BMUwILFS8YBmL8wBWq8LN5UIStGfaEwrjdvRWWfeuzax9bohCZkzM3HG+feTW6t6siQjv4N33Y3UnK27G3cqdtsbReJZcGAa4NtlY4DivarAGk9jPEWr8JiEhgJK7UZH8A23fcYMuGyQtEqU1VItkjz/ypCOGs/F7vkiZgJo9XpEn7zgH0VdsXHjyhdPO24LF/FETM9PQ13s8lbiqzfG/eeIHbGwSGH0Lu6gwb1wnYZbcvDtYV8IoUTsGFMo45iw0aRcCTE40fYIF+cSYR69kK6vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBNlfT1+EYvhehWyEwkC0Mu36kdi1P1ww3TXG1lziCQ=;
 b=brfLvZvaVw5W9nGGE3+/v9+kVD7phKHjkXcBV7ZAacuiX4lkyIKvQPC+AqMu386vrxcLIszag9U2jIXag6bW74KytQ9vdt1Ka1iZLs5yN9SY4fSherwhiRG7bGnrxiFUxlZEKAnHbMRqbqSu9e1tiEaMTw8wJtMKVofte/pWeLdKdQGuB63rPOFggNZsTd6tN+6wXm5qna2AixNyHYNqHz8fxLSR7aFiEn+YAMwO03UTIRjjJxJPPm0FNGkFYjHP9vu5rEpRdKVc7kSiBrKKdeTqDtYZeFDuPGgrhKj1pNAIrmWAf1egAr6XYRR66NI8mOSTOJT3B5ph22Gz2ShDiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBNlfT1+EYvhehWyEwkC0Mu36kdi1P1ww3TXG1lziCQ=;
 b=XnFXh4hXa5aqoB0Gml7GN5QsDHnOW+L9nq42UU8XagCTHpaygQkqaltAKh7fD8+LDyPouulnC6NrCTK600Jezf29fJWO4LVs8PuVciHnxb6XOXvxPSkQ43dn9cbpGEMeIsDBSeFxUKNQNB6wOlQR6rGGkA7W9fPVu2G0grQZW2IUttOA2tx9OxUqdlVDsBI+w7B4E/qyteERcFlF0XZVKMDj/Fchh2oFh87qFjll/NOAZw9TVS5ryUzNgpZhsHAbCWmQUQlvIuCVf3bu/5pZoD0Kk5an1W/lnjl+O2QtkL0qpVkEgi6Goe8wqsFo5A7mLmdAF/THcjgwMfe8sUmYUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by DM6PR12MB4251.namprd12.prod.outlook.com
 (2603:10b6:5:21e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Wed, 17 Dec
 2025 01:25:14 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9%6]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 01:25:14 +0000
Date: Tue, 16 Dec 2025 17:24:58 -0800
From: Marc Olberding <molberding@nvidia.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org, eajames@linux.ibm.com
Subject: Re: [PATCH u-boot v2 1/2] drivers: spi: Add support for disabling
 FMC_WDT2 for aspeed
Message-ID: <aUIGahkzzL0N0Bqa@molberding.nvidia.com>
References: <20251202-msx4-v2-0-a605d448bd02@nvidia.com>
 <20251202-msx4-v2-1-a605d448bd02@nvidia.com>
 <cc4141d2b1636c99c8f25b378f34ca214289a51a.camel@codeconstruct.com.au>
 <aUIEFWIUWoMlbEMC@molberding.nvidia.com>
 <f69874a680db4abdf0bc3af59ea7f559db925dca.camel@codeconstruct.com.au>
 <99968f334d03e901a6fe29b97369a75d05d881ba.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99968f334d03e901a6fe29b97369a75d05d881ba.camel@codeconstruct.com.au>
X-ClientProxiedBy: MW4PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:303:8f::33) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PPFDAD84AB72:EE_|DM6PR12MB4251:EE_
X-MS-Office365-Filtering-Correlation-Id: f14d1a4f-8b65-490a-108e-08de3d0b2108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?NIegOnWjkYU4R8aGUeQ7QSgdFG6tPHqVPbrs6M88B4xAOmRD/WDg9YNOv8?=
 =?iso-8859-1?Q?BS7GzKFyLnzPHqEvMFJNOpk2yNH+ZlW/kQ0xcJ0IRhkzfgF8NoTHyLbgap?=
 =?iso-8859-1?Q?8ulTq0tIUJlBDpiBtwErfInrj8xRAsstwV+ftYN52hG+RnI04eCvIkVi4b?=
 =?iso-8859-1?Q?7DLc1ofuqtyNuXCXLv95+rYUl/A1JMp3uqJIY6T7ismzwfRiPSD1CKop3Z?=
 =?iso-8859-1?Q?STUNUuoixli0iHcUDBw6kGSW+24IuewDw6FZd6GbV0Op8IRwI9JTIYTaME?=
 =?iso-8859-1?Q?iF58AnkHfmEn5z1yIgYwa1hwBr1rVyk8oO4hMER6ESW73v9YAth1qtRR4x?=
 =?iso-8859-1?Q?EOxfJu+W+wVIcKPRvI4KjKj3IPmVrmRCAsB4AR27yuuHUjjGfqFWS/2lDs?=
 =?iso-8859-1?Q?HHXAtxvNqNRW43kPforh8IiI0w0SUy8+sneqcgy5Mjb1sPFJx1y7GyCTph?=
 =?iso-8859-1?Q?Bjt79dzJZF7qN937R4XM13SX/5JFevKNpzb+x1CN7kYOY/yPxZJ7TT/TIQ?=
 =?iso-8859-1?Q?OZCmGgiSNfpNrXntmQTi1n20o3JPQgM8VoA9ZygiBqG2yYwxGM1xjl9WUr?=
 =?iso-8859-1?Q?BSIlX6cljHSBZQ/vmkTGY3K1h5vBYzHL2m/RUGf3wApGDxQxJ9Y8F5BWvf?=
 =?iso-8859-1?Q?5F3WQp9Lapev2m8i9xBSru1nYlVIfomltia12cR7VHx9veItTC8zvj84XM?=
 =?iso-8859-1?Q?hpeKNKPUpGqCflwGi5vM4sdO5YvdY6iMiJBtz8YLRq8MKfWhBS8fkatHqb?=
 =?iso-8859-1?Q?EDOtU7krU8dZkZG+zz7X4cKy9+D1uOS9Td+YLj7kqvonyr5vGg3qmgWB4t?=
 =?iso-8859-1?Q?s147HQ65MFXl1MfSmTNNmTYkuWbjdXS89ndnFkAclwPsSzpK/MZVquFqsF?=
 =?iso-8859-1?Q?qFNhgFBDbjkFHroY7gz2AOfPUXlFMAA9uUFFiKAHbxW9jntVXuZPC677ZE?=
 =?iso-8859-1?Q?Hp0xqFXgyZpIRO4iMaVPb6AinTKZa1UdJqJ7OTb6PTs7IxmmxMXTn+Rm4A?=
 =?iso-8859-1?Q?dqglpYo+lchCu0MBHGVTKumRcQZj0XF5OJu4iEHgzJE8JQwYNdUXkO59bE?=
 =?iso-8859-1?Q?2dNtoHzv7NIhvaRZ/crnXqvyWO5YYuPME2ab0z/nRJKZaWptWiw3r1r1Bh?=
 =?iso-8859-1?Q?mqKpHiAz5kmL8EC1s6ucrRRIv+YKhxvQOs/sORmeKF+H4ACPiM1RN6FoLu?=
 =?iso-8859-1?Q?lGa9j9oJsRGB/a50ulWAJgaeNepXWqXphTdyCP1qUmvoHN5l7omwJXe80d?=
 =?iso-8859-1?Q?lmP9uLa+4lA1gneKww8PFalLar6FN7Jipv8gqPxRy+c1+4cNkSFrfvMdjW?=
 =?iso-8859-1?Q?xVy9KYxKQBH5nqAgR6QBltFaqqHFXTlbfhLBfQTPELCoBMvmW7xFLBzXvL?=
 =?iso-8859-1?Q?vpNzZmIPp195TspdrZDgEo6j/bx5TARV4Rmck3F2sbyX4EoQdVyxhBa6nB?=
 =?iso-8859-1?Q?C99VGlw74rb4hUT+Zej3WwB4oRAk1CJfP42G97GbOMJLapJWubdEPViok0?=
 =?iso-8859-1?Q?/E5joXS45oSSbu5toPkKC7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?aGVFEcTRqYcGRG3gKGA8RVCteID4+3w61ASo9yW7JLi5BOadmoaU2c2RpF?=
 =?iso-8859-1?Q?3mnqOE9g+bbvPvqZh9MI2m9O91voTMsK0dXLibGdKR3oVKbltJbepNnwOq?=
 =?iso-8859-1?Q?Ai9CJzW6lLFTYKmAuP6XTF9ArUg1WlblA9QBRBn4RleXUi1oE1T8Nmi1Uw?=
 =?iso-8859-1?Q?z947komRiGXL/kKB9qCQzkt4D/ozLFW7Lm0wn6D/Vp7SVFA6pdFoJ4cfgW?=
 =?iso-8859-1?Q?Z0RDTCoksXKMUszgBgJI/I/XHTV++eLsHhlUKSXomFKP3KdHG+jxD4/gpP?=
 =?iso-8859-1?Q?HXSKirYkv3QHqiReMIViwn0vloQrLKFjLcg3LE7RRRWsD7ielTWdsm/HqP?=
 =?iso-8859-1?Q?uIZ2aormBz70DmmcRWMNI2qEY/8+PyXoD/NZprC3qdfISc7sjmykk1OwZ7?=
 =?iso-8859-1?Q?u2myiDhexf5Ny7aQfIMJHJoWKopz8O4gXrWnNxs/14tmElsO/Ut7wJSch6?=
 =?iso-8859-1?Q?YEM1y8JnOi20AIeEO3lMZ6hCWOhuYJRox+PdeKQSJr0OglGDHljpMbs5GT?=
 =?iso-8859-1?Q?+YcHkSYkZJgUoPkEDsNAwbQJl1FiO93ooFkCDNZOxdA4WCmvxXM6Gbq3XB?=
 =?iso-8859-1?Q?q5cQWVgEuIZtvg6Bj0tUtRyYCARc8/+SfV2sDcua6AKkCJiLcRCglIuQHw?=
 =?iso-8859-1?Q?DfUhMTYnYLANQWpxFuY8uG/ZN1vyJPcy0HNMVt9uvBHZ645aWIFjkLzY96?=
 =?iso-8859-1?Q?nLZhptZVyca+cck9yO9Xq9DkhEzn+pyEgY9lCTUKcjLr891Yeb7XMmkkom?=
 =?iso-8859-1?Q?Q6AMZuQXf6Unakz7HQK/T2SeA5JfzUU2Dj+8n0cnkg8lmCcimo0oscW/Py?=
 =?iso-8859-1?Q?Eul6SZH3Z2iGN+HNM6rLTTU2AV6kHM79bby4v6rNo4U3VQiJhiKVoZyOs7?=
 =?iso-8859-1?Q?X2t7gn1b44fsRZMpvbZgl6OCGlNLGi69ZD/3N5ANPWteKTMSeu6UHas4qj?=
 =?iso-8859-1?Q?DyhTeWtc1rOLzpiNCYPAQ/qkq4+cKamMG5evaIBaiFtWTkMpryPSt1y+0a?=
 =?iso-8859-1?Q?1TRudS/d19KWXGEIHnkQip6nDiO/lbyHOV5zCvVHgpdQ8ZLR/ZzjdjHbT1?=
 =?iso-8859-1?Q?JRSDE27jfglNmdjjMU/TXXawRCJm2qXOccJKwZO5OWW3KueE8b8/SnA1eD?=
 =?iso-8859-1?Q?rxhBDbJMMOlto2UIW6XBXJ8tetqFakfUo7BHr0iwbID8rOcbt1csZH4TMQ?=
 =?iso-8859-1?Q?rS+6Gljza9Hxwpc7zU5N4hHMLdHTL5y/pa3zumaVEMWsvdD7xona1i8sup?=
 =?iso-8859-1?Q?+0nOiuqbvEAFRudhmVijDW2exYShM/bSteRtdY4xzqxUkBk1Osn79lKmQO?=
 =?iso-8859-1?Q?qWoj+Xk3oPUL1cc1MoFPG7KuI7a1unKaWPnu/mULne8V3iM3mtToCM70rr?=
 =?iso-8859-1?Q?Cz0nj6WbbRkxVGXISnDAqP3xTewnMl4E8A8l0l+N6iiXIQ1So51cRVKv1v?=
 =?iso-8859-1?Q?knlKXYTkdctGsndA3bhuylk5WTwxrTZTol/PscQziOXu9xLPY8aaq1XuCy?=
 =?iso-8859-1?Q?jTrgpM2oqQooa0TNyarou2/o6+VK2oszFgpxVZbI8YpvkxGLDrQfo20YqT?=
 =?iso-8859-1?Q?LbMRJeC0bYrkgsgTrIZT1ipUFRvQ/JxTEnfIQpNWrtrdqYzB9OjHlZC1zM?=
 =?iso-8859-1?Q?qOUeLow2YN2zWJh8OWFWfrE3U1qCJd8Rg4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f14d1a4f-8b65-490a-108e-08de3d0b2108
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 01:25:14.2405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MZeuZZuFi2ey1LzMbYQz0QcLZommWBR/ufadfRNsdAPzO3OX1B6dK5oRxVYR1RqVSoYlsTiDe01CjI2GVg8xhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4251
X-Spam-Status: No, score=0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Dec 17, 2025 at 11:51:23AM +1030, Andrew Jeffery wrote:
> On Wed, 2025-12-17 at 11:48 +1030, Andrew Jeffery wrote:
> > On Tue, 2025-12-16 at 17:15 -0800, Marc Olberding wrote:
> > > On Wed, Dec 17, 2025 at 09:53:33AM +1030, Andrew Jeffery wrote:
> > > > On Tue, 2025-12-02 at 15:52 -0800, Marc Olberding wrote:
> > > > > Adds support for disabling the ast2600 FMC_WDT2 through
> > > > > a device tree entry in the fmc node.
> > > > > Set `aspeed,watchdog-disable` in your device tree to have
> > > > > the driver disable it.
> > > > > 
> > > > > Signed-off-by: Marc Olberding <molberding@nvidia.com>
> > > > > ---
> > > > >  drivers/spi/aspeed_spi.c | 19 +++++++++++++++----
> > > > >  1 file changed, 15 insertions(+), 4 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/spi/aspeed_spi.c
> > > > > b/drivers/spi/aspeed_spi.c
> > > > > index
> > > > > 54520122f1c48c8b2052b4b1e47445a9b990d25e..de954e477aa15e6d1be04
> > > > > 2a2aee47f5a501178da 100644
> > > > > --- a/drivers/spi/aspeed_spi.c
> > > > > +++ b/drivers/spi/aspeed_spi.c
> > > > > @@ -30,14 +30,16 @@ struct aspeed_spi_regs {
> > > > >  					/* 0x30 .. 0x38
> > > > > Segment Address */
> > > > >  	u32 _reserved1[5];		/* .. */
> > > > >  	u32 soft_rst_cmd_ctrl;	/* 0x50 Auto Soft-Reset
> > > > > Command Control */
> > > > > -	u32 _reserved2[11];		/* .. */
> > > > > +	u32 _reserved2[4];		/* .. */
> > > > > +	u32 wdt2_ctrl;			/* 0x64 FMC_WDT2
> > > > > control */
> > > > > +	u32 _reserved3[6];		/* .. */
> > > > 
> > > > Ugh (passing commentary, not your fault).
> > > > 
> > > Yeah this sucks, if you have a better idea, let me know.
> > > 
> > > > >  	/*
> > > > >  	 * Set safe default settings for each device. These
> > > > > will be
> > > > >  	 * tuned after the SPI flash devices are probed.
> > > > > @@ -1907,6 +1914,10 @@ static int aspeed_spi_probe(struct
> > > > > udevice *bus)
> > > > >  	 * SPI controllers
> > > > >  	 */
> > > > >  	priv->is_fmc = dev_get_driver_data(bus);
> > > > > +	if (device_is_compatible(bus, "aspeed,ast2600-fmc") &&
> > > > > +	    dev_read_bool(bus, "aspeed,watchdog-disable"))
> > > > > +		priv->disable_wdt = true;
> > > > 
> > > > We're not setting it to false, just declaring it above, which
> > > > means if
> > > > this branch isn't taken then its value is undefined.
> > > > 
> > > > Perhaps initialise it to false by default.
> > > 
> > > Ah, I figured that priv would've been callocd by the driver
> > > framework
> > > before being passed to probe.
> > > I'll change this to 
> > > priv->disable_wdt = <boolean expression>
> > > 
> > > in the next rev. Thanks.
> > 
> > Oh, wait, the stack variable is just redundant? My eyes glazed over
> > that.
> 
> Nope, ignore that too, I misinterpreted the diff.
> 
> Ugh, sorry for the noise.

No worries, I think the unconditional assignment is cleaner
and I've already made the change. I had to go cleanup your device tree
comments anyways, I'll send out v3 once I flash to hardware.

Thanks,
Marc

