Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A92BB95002D
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2024 10:45:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=HxTOHfZm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjlML4DrSz2xHW
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2024 18:45:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=HxTOHfZm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjlLV1d8hz2yMb
	for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2024 18:44:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YEkqj4NM3sOsh+QNpIbYLs9NKQmkGpcnOt7E3Mgi6oqdmqV53zmj5lnmPPkkXvzqLkPrWzTn8ORwAhk4mso3Mga1a200XFff1Ql4LJ2XLIGGTiysQ6MbvALrs4vLFWZr8ZmfQxgq7iAuNodJ++fofu3c0OPX5VNJiVoj86xUSK7dcZQgtR0y+nzcvDZ26pFELYvZEo8Sk8RiiftZfTuTlxbm3TtZUqsDzbz6A0i2oM7A/Hhc5uKC/fHOXzJo6WmTSKNQGDtC3SBHed0cZ8DQ9qfGP5Ql7+yZUuq0OVaDI6pzffFh4ixAEiXLqkHKKyBVlKvCTBOuBoyl7i45fTdSHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J718f9mra827pVm5knGK8PCcntg8oCXm8Ds/uzA8i5w=;
 b=EM+0S9t8mIBVTizw6hLat5p5FKmuX/XN6Tt9LrparRRnyj9e1sUkZo8h0MgMNAAtpG4VWElgoOwEmLqYhAwiwg2lBCA4rP6oo96y7xgGOw6lOTCFE0ZmlE/u/wpnWqAsz6uKg7AGvoQLcep5BaRP4Ik37zhBbTJYZLMZJIEXZjYhtrJLfK6XrMDzexFCbaUhxbaoLQN4SfKy/ASdKvNVurgz2ME91GzXfDATGCKES+uKPrHLaZCG+TZbJDGgJWR87e/yOgrjQ+TGm9MqBW5I7+SoZzUxGw4fCRMse7gB4CuCngA4AamQr/SQsfkvOiCPPrAzT3bBlhnwhwUzjtBE/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J718f9mra827pVm5knGK8PCcntg8oCXm8Ds/uzA8i5w=;
 b=HxTOHfZmP+zTOj440FrUGKeE/Sczy9DUt/Tfb5reSbOgE97Aln6K3ENytlHHp1FFP4dTpd6soLWSMgqEokypzCWUp9dFU6NZrguz8vsKVqMmswFRbAwI2pMFuW3ahs8/cs8XpCY2LdOPzZch1BDvEBVmKnR681o1/iq4RjliVSc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 CH5PR01MB9029.prod.exchangelabs.com (2603:10b6:610:214::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.22; Tue, 13 Aug 2024 08:44:12 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 08:44:12 +0000
Message-ID: <50014195-b7b7-4fa8-ae37-2c3e57826c1b@amperemail.onmicrosoft.com>
Date: Tue, 13 Aug 2024 15:44:01 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/1] Update the max31790 driver
To: Chanh Nguyen <chanh@os.amperecomputing.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Justin Ledford
 <justinledford@google.com>, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Open Source Submission <patches@amperecomputing.com>
References: <20240813084152.25002-1-chanh@os.amperecomputing.com>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <20240813084152.25002-1-chanh@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::15) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|CH5PR01MB9029:EE_
X-MS-Office365-Filtering-Correlation-Id: b786233a-1561-4307-9f9e-08dcbb741a9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?cHBPdkhEVjZXM3dKRDY3di9CU2IzQ0pjSGxPYWxlSDJGbFhXU2tVcVY5bmRX?=
 =?utf-8?B?a2tpWDN4bTV5VGhYU0M0TFVheUZCZlg4Unp6RkdZNStEWG1JRjZGNUxudTJZ?=
 =?utf-8?B?VWdRY1hyTnVMOFpBVWxiTVFIaVJFckY4S3o3Zk9oZXM4ZWFhTWUvbDJlRzRX?=
 =?utf-8?B?L3gra3AvbXVJbE9JQmFJWDQyNzduUDNKbXhyVWNQeHBlQjFhcWR6OWRadGxY?=
 =?utf-8?B?bE5WemR6RGtHaWRPUFNoSE5oWWp2V2Y4ZFc4SzdyZHVkK3RIQlVWQXc5ZjN3?=
 =?utf-8?B?Y2lJRWpQcDRLWVg1NTJQc1ZUMVM5VTdFUDYrREQwWG9GZUs3WFJFMFFTc1FC?=
 =?utf-8?B?TGhKT1Q0Uk9aVS8xeWUzVm1EdVVVaW5OMXRHK3N4dE9zQ3lHMjJPVWEyeTJP?=
 =?utf-8?B?alg2RHZLYTRSV1JwWWRVbWIzNFFMdUFpN3ZYbkpSSW9IVDFUT3BTTTEzang4?=
 =?utf-8?B?MHE4Y3lEWWN4NEFWcE1OamFNb0VockpWeHpRWjl0Z25uQTNJd1R5OHdsNXpO?=
 =?utf-8?B?bEV0YU5FWGhITFRFRzNLSmxndXdJUnd4ekRNQlVRSDMyenM2RzY5cTR6WWNs?=
 =?utf-8?B?b1lEM3NORk9Ta3lDTmRmajhaRFhJWU5NbEVacjBWQkgvNHVMN29TY1M4cFA1?=
 =?utf-8?B?RmwxWS9HcFVZR0tZSTlqRVJOSzROajhVUWszMWhRMU9IWVpUZlBva2pENFF0?=
 =?utf-8?B?WDNWOUlOaEgwS2duZkdXU001WW1aNGcyeU5hVGhLUjlNWXhMTzA1MjltdlYw?=
 =?utf-8?B?a1YyY1NueUM1SW04SGhyVSt3MUZSeWFWUVdDeHhkc1ZLNEIycGs2Mnp1K1k0?=
 =?utf-8?B?VUlBSzVLejMwRktKYVNsYlEwUlRuMk5idlJnOG5pRFU4SG0rVExQR3RxM0Mx?=
 =?utf-8?B?T3o1L0hOdzlXRnZDZDBYVEJxU2Z6MW9IcEVjcWM4eE1YKzdFeG9vdHoxNzV2?=
 =?utf-8?B?Q2p0K3U3Tm1uRFlCVDVhZ0U3aERKaGttWmd1bkJEL0lVWUV4UzVKREZTQWZR?=
 =?utf-8?B?RExEQ1liY28vL2EwOVU2OHNDVHIwMEpBbkhuUGJiSWlFczQvY0Q2c2JzOGov?=
 =?utf-8?B?djFjN0djeGpzUzMwT1B5cnNDNENyUFBheDNaK0RTOEptKy9HZ21RYmttRlg2?=
 =?utf-8?B?cmZYRVlpM0d3MUJIbHBHVXJ6T2w3NWZ5MzBFTTcvQVBtQjhGYVpNb1R0ZXU4?=
 =?utf-8?B?dFIzdEFpTlQwcE9TdkFSallHcnlTa0hncjJwSWZqNjczbGlqMjZxcXRjNTcz?=
 =?utf-8?B?WU1lYnl0VFdtb0dlczMvZmRlVU9Va1JBY0pGL05IWmFiS3hEdGhtVXBzZjBM?=
 =?utf-8?B?SmdnRUJqZlBWRDhCRWJwNWdtR0FZZUplVzM4R1FCY0Q2ZHFrWDlYYmx6aTJl?=
 =?utf-8?B?SFdheGlCbGRxSjRMeDc4NEl0VnI2Ry90dVlwUHVqelpZY0F3OFBSbHlScDln?=
 =?utf-8?B?aC9UV1hPUXl6cGlPL3BIYXZlMzVoRzlITnZtcXBnRFp0cXNUZzZ5SDlBWlNa?=
 =?utf-8?B?aUF3T2dhWGdLWGx1dXM0T3dJb2hlWW5xWjBQc3BGY1V1aXNXZU1IaUVlN2pM?=
 =?utf-8?B?TjlqR0FTVXBvOWNhWkM2UDNZbUxoYnZPRXk0cU5ObmxTWmQ2aHlxVVN3ZC83?=
 =?utf-8?B?NUhKY0V5N0l5NUE5Z09xbVpLYVlZRzB5dWgzMVJjemkvSnhvaGxHeU44YjND?=
 =?utf-8?B?Vlp0dHBiS25lUko1Sjc3cUR1TlFqMm53ZWpsSTYrTUZHNTVVM2c0elk2cG1x?=
 =?utf-8?B?elJXWWlQY3RMN1AwdFBqQys2a3ZVMnFzcWRNakF2OCtpZnVwbnRLbjI1aDBX?=
 =?utf-8?Q?/e1n64r9Wz0NOmz5uFMeuVu2h3ymBvNLOjvIw=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?WStzSGsyTmFUYWtNL2ZiKytJdjlpSnVWZ3dQdzJDMGNxeGY3VlBINzZyZHlT?=
 =?utf-8?B?UWJkT3RRdCs5THc0MXVocElOZllTbXpnVW5CMzA1RjR2MGwxT2l0bTJHbnIz?=
 =?utf-8?B?eGR3QXNtb0NmVmdJR3d3cVZ2MFFWODIrSkcxQXhTdDF5dGtRZHBFeEp6YXVk?=
 =?utf-8?B?Z2VtL1hDcXg4ZTN2WGZLM2wzRkk5cUdDSEdTUllaZktOZ09iT0ZVZGFVTlBT?=
 =?utf-8?B?WTVWOW05bW92SXIyUWNQN0dwMHBGcUxQQi8yWk5IZHJaMUwxL1BqVHQrdU5s?=
 =?utf-8?B?NDQ0SXl4RlE5Sk41TGpXUzMyVEFlTVFLaE9YYUwzc2pDY21lQjY3QzRRY3dU?=
 =?utf-8?B?RTdkYjFBSXdXMWhNYXUzb2UyaVNEVGl0cUZaYTFmNERwbjZHZktKK1ZyV0kx?=
 =?utf-8?B?M1RTby9LTjVPQ2pVZk12RzdVNzRmL2d2QzhkYjJXaCtsdDBvNkFLUHJ5TXla?=
 =?utf-8?B?M2F5MkFEV3VxbUc0Mm1uWVNnS09JYk1XU00xQ3VWRDhMbXBPK0ZCTGk3TEVt?=
 =?utf-8?B?Zmc0TXYrUTc5UXZrNVl1cHVCVlFtZXIwODJxaG8vZCt3ZUJkK29UbjM4bU9a?=
 =?utf-8?B?bWxUWXAxcUdXNzJNd2xqTzlQTFVuY1U3L1hYY3RHN216eWQ2SlpnUVdLemJT?=
 =?utf-8?B?RWQ5TklGb2gzSllianlWT3RRbHJza09xVzRmSVFQSFROMERtaE44a2xERGcw?=
 =?utf-8?B?WjBXdUhCN2F1L3BnOGZlempRekk3cVdtRE14MmhzWkNGYW84OVZMdnJ2N1dl?=
 =?utf-8?B?cWJJWXhQbi84ek8zSEczV2I4dTJ5SldXNlJkWlVRTmdXRUhEdjIyd2RZeXJD?=
 =?utf-8?B?NlZBRTYxTUtMMEF1RjdjZm5yT2d4MUcrMXRZaytlOVoyamxERDFTdi91M1I2?=
 =?utf-8?B?QTdNK1RrRHpDRmV6N1JCdkN1cDk0bXdDMzdUWW1aUzlDWDU5TWtCRUJheWhI?=
 =?utf-8?B?Qzl4Q0c0c0thUEt0TUs1cnZPTEZCUmhNYm5OMWFscDU3dDE3cFIxbm10eTRG?=
 =?utf-8?B?dUt5dy9Wd2NJL1pVa3dacEw5YjB0WSsrcGR1bkJ1TTZiL3lKcVpEZjB3aU8r?=
 =?utf-8?B?S1JRYTkyaEVDa0M2WHQ4YnRKYUE5SWdMQkZ5V2Q2eC9GeGtMdHlwa3FGQ3k0?=
 =?utf-8?B?cTEwQVV2RnIvOGlnMEdpOUxaZks0d0NUSzNHSnFzNDlabGErcUYrTk01MXFM?=
 =?utf-8?B?WmZHMmJVdFNCZWtvZnFCNEZSNHpkRW43QndMaTdKNy9jaGZCVG9IQjdVVEty?=
 =?utf-8?B?c1ZQZFRBZ3ZUMjRhM2xiekFZZlZSMHhHVUtqSWFjL2JtLzNnVFRIeHNQQUQ2?=
 =?utf-8?B?WExvR2FDdmRBdDBuQnYxTmxIbzFSZTc4ckl4NWxDVEpNeGFVc3FtcEQ4QUFp?=
 =?utf-8?B?S0RPeFhOUG9wSzlkY1diUTNsb1ZsSktLY1AxUnpkYzcrUWtDRm4xK3hmLy9m?=
 =?utf-8?B?TTVTc2xFWmNPZ1RBdWtyaGRTL1QwWWdZSVdlNmNvQnlrVnpaL2wzSkdlTWZv?=
 =?utf-8?B?d2dBWFdISzFhUitWNUozcTU4TFhGdTg1UlQ5aEFqWmNYVEl4d2o5dVg0UmVQ?=
 =?utf-8?B?bHgvcjFuWUh6K3d4UzgwS0s0T0QwVG53UkF4enFSQVFxRlNYNFUrbFJXZ0U1?=
 =?utf-8?B?ekNRQUYySVVkdjJiY2hNUVVTUWl5WWlaUUFadExsWklGeUxoR1JYNWF1V0xp?=
 =?utf-8?B?UDRTWWY5Vll5ejQvWnBhU2FJSm9aTHVESHViRUU4Y2pQNmlKRlhqdlBqb211?=
 =?utf-8?B?ZEZBelRPME1mYW5NSUt1eUw5VWQ2VjhyV1J6dXhkd3FadllJZTQzSVNuY29L?=
 =?utf-8?B?bVl5d3UvVDVQWjN1Qm1LUWVsWk5WK0Jzd2tpU1lHQ1EwMU1yN3c3UHhPQmFK?=
 =?utf-8?B?cU05SXZLL1ZKZE1UVzVUOVZveHBOVGdOZ2hHTXBwOFZWNHNkaXJRUTYxaVlm?=
 =?utf-8?B?ZWN3cStjSzRVck1HbVh5TW53Qk5PTUVZSDBOV1czWWxtRitCQ2h5UzYzS3Rr?=
 =?utf-8?B?VlJCU1hXZlZWSHNVUGlOUCtiWkl3eXpHZXZmdzduU2xaN09iSUJXY1UzcEFv?=
 =?utf-8?B?angrbUdzN283OXFjaXM4UjlpdCt2M1JMM1dBcXd1NFR5SzBqUnFqTG1saUZj?=
 =?utf-8?B?SVFTUS9ZMURBUEtIT1A2QU5MSXVTbll4ZDdKN0I5cWdobzlzcmxWUzFUQXJ2?=
 =?utf-8?Q?enLcE6myf8yyvyGnmBT637I=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b786233a-1561-4307-9f9e-08dcbb741a9f
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 08:44:12.0352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a+BNgBAtbnaXkMQQtX2n0cB4ZBc36I7cwp5mTi0fF4gADPU6Id2KVJyW400ttlFCKcZGQ2QqH2x269zCLTcsMn4rpLH/UoMewT4zcUmEpfXG8Sg1ODBNCe4KKzKxGIZe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR01MB9029
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
Cc: Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi all,

I dropped the "Support config PWM output becomes TACH" patch. I'm 
implementing and testing the "Support config PWM output become TACH" 
support; I'll push this feature later. Now, I'm only adding the device 
tree binding for the max31790 device; it is necessary for some device 
tree upstreams that use the "maxim,max31790" compatible.

Best Regards,
Chanh

On 13/08/2024 15:41, Chanh Nguyen wrote:
> Add device tree binding for the max31790 device.
> 
> Changes in v2:
>   - Drop "driver" in the patch 1/3 commit title                           [Krzysztof]
>   - Update filename of the maxim,max31790.yaml                            [Krzysztof]
>   - Add the common fan schema to $ref                                     [Krzysztof]
>   - Update the node name to "fan-controller" in maxim,max31790.yaml       [Krzysztof]
>   - Update the vendor property name to "maxim,pwmout-pin-as-tach-input"   [Rob]
> Changes in v3:
>   - Drop redundant "bindings" in commit message                           [Krzysztof]
>   - Add the clocks and resets property to example                         [Krzysztof]
>   - Add child node refer to fan-common.yaml                               [Krzysztof, Conor]
>   - Drop "Support config PWM output become TACH" patch                    [Chanh]
>   - Drop "Add maxim,pwmout-pin-as-tach-input property" patch              [Chanh]
> 
> Chanh Nguyen (1):
>    dt-bindings: hwmon: Add maxim max31790
> 
>   .../bindings/hwmon/maxim,max31790.yaml        | 81 +++++++++++++++++++
>   1 file changed, 81 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
> 
