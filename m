Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8007AA67A0D
	for <lists+openbmc@lfdr.de>; Tue, 18 Mar 2025 17:49:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHHqc4rWwz3c9N
	for <lists+openbmc@lfdr.de>; Wed, 19 Mar 2025 03:49:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2406::61e" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742316553;
	cv=pass; b=WQDnm6y1nzC9YMv7SaOF8eX/m41mQa7E+zHSglmO7Ao3HRqpZUs6CVFfjn7Jmr6oUMVcC4PQGixWSVdygr+iRMTX821Kdy+cd9zqnC3C5NtQ6rKJwK0ZzxTlqfFsvQD9BK0K8DVItWpNAupzyEvnxI88Sz5xhqRYe5XZ0e06gTS/ammsSMZY+arCV/Aqmt+shIqvswCYD9ck9mZlcMZWxvzw+HCCKMGSz3IpCNbtavf/xfdckuhRlhVktZvD82I8rxFtWAO22dE9HxmfKLPczcYv1A31nqir2nbhk+SNyQcNzIR6Zn49EHM6/o1cH7YSJxN+dhbNsgIAVGexFBme+g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742316553; c=relaxed/relaxed;
	bh=NGsXXNm76f2MWw61V+w6PvUp1c+Yu8T/zEn+IIqJFQE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TjXdXOVr/eslriTgqx6cAFZ1Vt2uw3a0jmtpDngn0TPTKGRijlRWeL1JYAYc15UsTvBq7Sax0b2heb0ffCHhMJnxPvj8Uaw3DSpTGlMgxUsfwpfolybCNYwOEpwMdETDLPUqbPzJw01FSnZAQm5ywvbt5s/OGcUTz+K72Mvpus9MdyWA497ZqH4OEsB7X4PFaTdvamoXlQBtsFHTSwBxLW4lLk6EvsEnDC7ObGwZqwU1Bet/3DwHfTjzROVm/m9EWRwMSAPweC+rx5JTdFrF+mZA4IPfz46IGuj39H9mzKc0/jpfswufNCTI+mSFdvwvMIm/c6k8sncuxtdG374BSg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RLbU/UiY; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2406::61e; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=rajaganesh.rathinasabapathi@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RLbU/UiY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2406::61e; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=rajaganesh.rathinasabapathi@amd.com; receiver=lists.ozlabs.org)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f403:2406::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHHqX2SYHz2yrq;
	Wed, 19 Mar 2025 03:49:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qVu1/dOvh9sluyoYSGN+OvJhEcpr7OkbogkfVvdmeShm93rPSuohV2tkq8j4Lzw4psJDHhOmcno+TafMyLwfYk+T97qqrlbRoxYRJytpH63tibu5N89sn1zh86XqRLbJxIbYG0fF4ZGfCZ0Dua5Kivqap9ZO+XQGeFsg4IvcHG/dg+h5VRvR26JOlEl0vHITHl99+OSRZiT7PVtM9kSg8fN0gelwxetSj8FM4n16hv9Vi7CjRlECDXVWhnt21jSHubQWwuEf+AEhp4j4y6Zc3E4+D8C5AKNJytQCf+x+zos9C/+Xu4UmlIU45fbVuU6GUcANwAEzXCHcYs4JvKk8Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NGsXXNm76f2MWw61V+w6PvUp1c+Yu8T/zEn+IIqJFQE=;
 b=ylnBmZt+PtkwQnFRF/3/Z2fu0jxKLQYyNy3s+AoDIfcomgf3fUvp1QJQFbCEFbn94nP7s4SNvAorbsobvgJ//JrDx2Fuy9/+lT/qAUy1QF8n3mWvX8nFhCl0nwSkBJ9oZIgM0FquwYQT2Pf5hRLu3QIBpEcKVLMju1NB7z3wFfVniH+XLjxpSOJgcsHDPItosb+imb9h80dLoyWtirWVd74tQMNeTaQ+13xQwUx9mPZ5zDEqrYQcIKy7ZAbSnAw6D8SslEijTORNvW0Is9YWsRkqNAMDoUC2mvC4YI+TSGf/rE8EH0mYJyjIO++0RQyhWFTECwj7Hga9431B0dh4aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGsXXNm76f2MWw61V+w6PvUp1c+Yu8T/zEn+IIqJFQE=;
 b=RLbU/UiYm3pioO3VBgdOaUoDCvb99gxGPdsvewhn9Bwl9PZGNA1cCWt0fmAgA4/g5c/Qio11DzyVmuCigBVckxbrWYIruXfl+0o8EDJiVe3bs5nepPqe7NtKbR1o6oBWArTuVEEadALdeQ+OcCaiMUmyRAx0ihTdwtsHkwsYXBg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6285.namprd12.prod.outlook.com (2603:10b6:8:96::8) by
 DS0PR12MB6632.namprd12.prod.outlook.com (2603:10b6:8:d0::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.33; Tue, 18 Mar 2025 16:48:55 +0000
Received: from DS7PR12MB6285.namprd12.prod.outlook.com
 ([fe80::6acf:b37d:a152:409e]) by DS7PR12MB6285.namprd12.prod.outlook.com
 ([fe80::6acf:b37d:a152:409e%3]) with mapi id 15.20.8534.034; Tue, 18 Mar 2025
 16:48:55 +0000
Message-ID: <ab74593d-a3be-4283-ad83-3525cb6d7dd1@amd.com>
Date: Tue, 18 Mar 2025 22:18:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] ARM:dts:aspeed: Initial device tree for AMD Onyx
 Platform
To: Andrew Lunn <andrew@lunn.ch>,
 Rajaganesh Rathinasabapathi <Rajaganesh.Rathinasabapathi@amd.com>
References: <20250318041224.1693323-1-Rajaganesh.Rathinasabapathi@amd.com>
 <20250318041224.1693323-2-Rajaganesh.Rathinasabapathi@amd.com>
 <fdd969cb-aa2d-4d55-949e-e2631757221e@lunn.ch>
Content-Language: en-US
From: Rajaganesh Rathinasabapathi <rrathina@amd.com>
In-Reply-To: <fdd969cb-aa2d-4d55-949e-e2631757221e@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0150.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::30) To DS7PR12MB6285.namprd12.prod.outlook.com
 (2603:10b6:8:96::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6285:EE_|DS0PR12MB6632:EE_
X-MS-Office365-Filtering-Correlation-Id: 356f5599-530c-49c7-eac3-08dd663cc50c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?OXNTODZKc1JJOC9ZSlBhamtrUEFydGdoU213S2hoMjUxN20raXcxTFZGQ0Nl?=
 =?utf-8?B?OWR2ZzVNUmdXc3Q1Qy9nUDJpWjNlWVBDQjR0SXVEUGZGSWc3VHJtWG5wL0xN?=
 =?utf-8?B?REl3MWNrTm11K2drVkpKMFFxbkxCcy9GZWtMVlBtZStNemVaeVJrbVA4SEI5?=
 =?utf-8?B?R0hxZGVxanhlTFlSSmNDZ3dCanBtNldISVFPS2JqY1MwNVg0eHJEaFc1VG1T?=
 =?utf-8?B?T0xnYm1ZcVZZUHZQbzVqMys4WGd5ZzF4aHJ5V2xNYk9zV1VkQWhGMFBpT09t?=
 =?utf-8?B?RzBpalVUb1cwWnFWR2d4SWI3Z2M5elVnRnVOSDJaOHR1NFJvQXNGVzJlcUVB?=
 =?utf-8?B?TzUzNXV6WDVQRTN0NzdFMjhxa09SSEJjODdET1kyWHRsRldvRURMTmpGMGNU?=
 =?utf-8?B?NDdHeHkzaC92bSs0SkJWbnk3aEFMTjlGa3FhWWZJUmRFRHh4ZHFHVEhXYW9G?=
 =?utf-8?B?SnJrUW9CT04wQThETmtQRmFQeCsrM1d6RWp1WEtuTmIwZUY0dURBNldNaXVa?=
 =?utf-8?B?Nlo5a3ZqYVFsT0VjM09uOE9Dc1oyVElHbDdlak1NSC9VYnBMOVd5U1h0aThY?=
 =?utf-8?B?aGtaa2MzU3FrcEpaZ1RPMEhsQ1RvbFMwSFlwNTY5M25CZEZMWGV0Mll5UTdk?=
 =?utf-8?B?UjZXZ2IrNXlJWWU5NlJyaWlHMGNUOUFUNFRPMjVTSzZUL09zTm1tUS9RL3h6?=
 =?utf-8?B?RzZGM1llLzBOQnRQYk45N3QyTjlxaU85OVV4Ukxob2JOd2lQQ0hoTThKZWp1?=
 =?utf-8?B?S2dpVEVsZWcyMkxFekNMUjQvMXh3TDBYNHFYcExEQVNSVStxVnJ6Mlg2czlz?=
 =?utf-8?B?eGU3RkZpdFhXaVh3YXdJTGpUcFM1aHFhQTF3MERNNFJGWURERldSZmNWako3?=
 =?utf-8?B?cnFqWGU3QlJOZi9YdDZHaFJpZ3N6aFR0d3ArV1dTSlpiUE1OWHd6bVJPNFpS?=
 =?utf-8?B?TWpqQ25oOTdKRVpCU2hhamN2UzJRYWpwaGRvL3pEVjMrZVNmeHRLRzV5M3hu?=
 =?utf-8?B?Q1g1aEY0Yi9FTzc4V0NlV1l4KzhxR2RJMGdGNGpyanRSVW9IN2ZyTitPUlMz?=
 =?utf-8?B?blZGZHBpc2ZzeXJtOCtsY2NJbHZnb1B1eDd1eElteFNZVURLRHFCRW11Tjln?=
 =?utf-8?B?d1BpRUhYNzVnZE9mYzlhNko3Ky9wOC95UGNRRDg3TE1yVkZ1aGlRZ213azhU?=
 =?utf-8?B?N29FZTI0VTFMQlNqMUhHTXQ2TWEydDczRzIwWVo1UzE4N2J2MXhIK2srVDZu?=
 =?utf-8?B?RVg2UjFqL3Y2Y1BzVXZnNk9kbnlTbnhneVNvL2VQTnppcXZLMnZPekNuYjV6?=
 =?utf-8?B?T0lKK2VWck1yaXdVME1oOS96bUQrSEVkaE1pRTFPdkRGWTdidFRyRERFQUVB?=
 =?utf-8?B?cllVUmEvMkQ4dG1JRmhUbVYyelA4RXEzWG1WYlh5T2RFL0dZKzNsL2FsVkFO?=
 =?utf-8?B?L3h2L21EaTh1NXFkbWlCMnUvNnBUNEJnelZWSDI4L1JLVWFPNk5qdFhNRnhi?=
 =?utf-8?B?K2dkQ3Y4S0JEM0h0WWdQUmdiMyszVTNJZWg1Zks4THFWei96ci9GWlZ3UVA4?=
 =?utf-8?B?Q2RXZGM3S0k2UTBYWlVNT1ZjS2dvZ1IxS29PUEFscVo5VlU0NWxDSzFPN0Fu?=
 =?utf-8?B?TVhYdTVxdmpBb29PVFJYMUxmaFg4NUlKKytJMGFFQjBEaGEyZEhvU2pEZzFi?=
 =?utf-8?B?M2FkK3VRbElIN3R3d0tocWxaK1FLUXc3citSd0FSVWlxVVY4MHJqVVJrWkM2?=
 =?utf-8?B?VFgzZnFCODc5WnNPbEdBdnBGTllZWFJIZUViSGhmWlBwNldiU2ZQa3BnZ0VE?=
 =?utf-8?B?WWNRUXM1TVBSU1Q3US9xU0k1eWFnOXlmZ3ZwWEVDblNqTCtwUkMrNm5LMTQ5?=
 =?utf-8?Q?jdHYN1CduLFMU?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6285.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?SE16YTUrSENidG1JREtKZ1RaOVU3UG9CWi92UnErM0RxWEhGMjNmWGU3cS9E?=
 =?utf-8?B?Vmk2MlprSHFicjhXcmdrdDV4UWk1KzgwektvYVlGOGY3QVhhNzBXdnBHUjN2?=
 =?utf-8?B?cnl2d3Y2RUY2R2l6UTJiRjRGV2pqOUNqUDY4MkhVc2VpeVl6MjdGaWlGQmRR?=
 =?utf-8?B?aXJEWEFoOWd0dXRqSjBPdFNDZFRUaVlxZTlQaWhIVU05SHpWdWdscHBXYWto?=
 =?utf-8?B?Ull1a2p6NHlQc3VNZ3NoTExVZm9kMXZHVWE0cEppbWl2L3dSem5MSGM2Y1A5?=
 =?utf-8?B?QVRWdjYyMytlRzF2L0F5Y09xclFhOEJ6TjhoYVAwNW94SVFpUC9NbG1seU5Y?=
 =?utf-8?B?bmNxZjFnaGZaNlJvd3BybXh6TVgzbGRKV2NTV09yVVlCSEVXWHQ5WC9XNHFZ?=
 =?utf-8?B?NDI4andwV0RQdUtPZ1BOVE5rU0V4S3BkQnhXL29FZnltYTBXZko3ZkxpS0RN?=
 =?utf-8?B?dmpjbTdOUmVIakRsQjhOZm01MGMrc3RNd0FsL3hvQVk3d1BocUxJWTJPZE9N?=
 =?utf-8?B?RGFJWDlyYjhBTmlSZVZHQVNBKzZhNnhuNlg5T013ZkJkNk0zckREdUtsRE9C?=
 =?utf-8?B?L25HdXpGbklKYy9nYkg0SFFSdjlVeTk4NkVPWU8vZ29pbXJiZE54a2lvVzlS?=
 =?utf-8?B?MU0vcFVwYkVOWVZPMzh4RW5HTjUrd1lLVmZldEI4eHQ1bTJTcnk3dmMxMEFS?=
 =?utf-8?B?SVFiMDNVMHFWVDdXeGR5Qm80Sk5yYngxU29lUnU0ZXRlb3VhNnY1WEZwMngz?=
 =?utf-8?B?aFczcGRQNk5HQlRuY0pjMW5Kc3FkeGJWQnFiTzNIQlVwQ1o4Y29SajN3eTZL?=
 =?utf-8?B?UmljQmZvNGVHVjZLUVd4L0JXSGxXMTVYOEtaMXZGWDFibGZmTzVpeUJBZ0Jw?=
 =?utf-8?B?eGxSY0lnVWRUZGpqSjBsTWVwYmVKR3Fkam5Ud25IVCtQcG5MM3djWmV4V2RO?=
 =?utf-8?B?dXlSbkN1RlVhZ1JBdGpLYk92ZXBSV2xrZDJHS0VLZEEyVDM1ekdCTFpsaEMx?=
 =?utf-8?B?aEl4THhYU1VBSlNINmdwTFo2ZGNZeWNpYUNlSzBCVFFWR0RxRGtUZ3E0b1lR?=
 =?utf-8?B?SHhmTTlGdnZybVFwZEg5M3FLTVRlaU5OSi9hamh3OVYxR0dleVVVV1B2dSsv?=
 =?utf-8?B?dUFyUXB4Vy9hUGFFZ0lhVGp2Q1NNYlY2ZEdKSkxKRWJLbFV2SGZJbzQ3cTA2?=
 =?utf-8?B?UGZ6L3NkTXFqK1lGSG0yQ213MzBQWlNpNHQxdEpNY3IzbW1GRmYxSHZ6SEI1?=
 =?utf-8?B?SnA0L1lpYi9NMTlkZUkrOGMvYWxLbFJQRHlRdWF2ajlZK1NwSHAxOTBwWWQ5?=
 =?utf-8?B?d1FhZ2hIeUUrbjh3M1NGekJ0ZXdVRFBMM0dLb2cvak9BUm9SNnkxNGJ1cjdB?=
 =?utf-8?B?ay84SmZqWUswVGkzZFlUSml1SGlqWUx0V0MyMUlFYnJtc0ZHVHhDcnJZNjNj?=
 =?utf-8?B?STVLcUkrU2xIaC8wdWRXOERFUFZ1MFo2R2s1SC92ODgwMCtPKzZOSFQxWmZr?=
 =?utf-8?B?ajVEWjQ4Z01MK2xCNk9sU2F0V29HdzJiR1hibC9yTzdFcm9FV04yT0dwNkMv?=
 =?utf-8?B?dE5VdXVWem9UWndtOFNqMEc2eStrbXh4UUpDTDRvT1ozNElydHdTU21IM0pD?=
 =?utf-8?B?Yjk2L01uZmlTM21SWVMrM3RSalRONmFveHkxcGd1ZUZrSEp0a0Q0cWU1S0Vl?=
 =?utf-8?B?cVdXUDU0SFFoWXhReEJtVnArcFM3ZDdzNHZzR1B6YXFxNmQ2S05sSm5lZC9y?=
 =?utf-8?B?Tk9OdkpUbnlHazNPcmQwVndSZ1BaM05va2hyUms2Y0Z0T1FLdUN6bW15R1NB?=
 =?utf-8?B?YXpyQ2RDT0tqVk5zcGVSbW5xaU5yT1FzMVdkMlFBMHlDNHFMalBWWVloSFkv?=
 =?utf-8?B?S1MxQUk5UitQZDZtTlhxWFFHamdDcjZ5U1h2Z2xYTzdsSHlzclg4aHhVazMz?=
 =?utf-8?B?elBTZ3pzdnUxZDhSdHlzN2Y3bUtESnZ5c2NBNHRJWUhoUis1RW1tQXpHOXZH?=
 =?utf-8?B?ODFod1ZpSmVsNFdVdThLVm1TR3pQeXBkaUpSWURjMi93SjI5Nml5U1dLeU5M?=
 =?utf-8?B?dWtqQmVMSER5OXNSMnZ5bFJydEhSQkVZYXp3T01aWUZuZk9FMldMWUVldFh5?=
 =?utf-8?Q?B2AckfV2VfPD6DOHeK2b8MYSM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 356f5599-530c-49c7-eac3-08dd663cc50c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6285.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 16:48:54.9948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kZwb2d+0WCuX2frcIDyFHSUqtAIrPz/urbce4uz/8tznaszme3+FGiX2HXgYtRWpDUOVaLseG7sVvn4pf1/8XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6632
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, jothayot@amd.com, robh+dt@kernel.org, joel@jms.id.au, Supreeth Venkatesh <supreeth.venkatesh@amd.com>, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/18/25 19:38, Andrew Lunn wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
>> +&mac3 {
>> +     status = "okay";
>> +     phy-mode = "rgmii";
> 
> Does the PCB have extra long clock lines to insert the 2ns RGMII
> delay? Or are you another victim of aspeeds broken MAC/SCU driver?
> 
>        Andrew
We're following Aspeed SDK and referred other dts based on ast2600.
I assume Aspeed has moved clock delays to u-boot.
Link: https://lore.kernel.org/lkml/SG2PR06MB23150B3673E58737ABB08D51E6139@SG2PR06MB2315.apcprd06.prod.outlook.com/

