Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D03758A7AC9
	for <lists+openbmc@lfdr.de>; Wed, 17 Apr 2024 04:55:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=k20Cvit/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VK59q690bz3vXK
	for <lists+openbmc@lfdr.de>; Wed, 17 Apr 2024 12:55:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=k20Cvit/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:2414::700; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:2414::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VK59J4kB8z3bnL
	for <openbmc@lists.ozlabs.org>; Wed, 17 Apr 2024 12:54:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1a/5McrpOV5lcfCB98MJ3qjQAjUZv1B8I1bZKK91og6sUrt7VIgCS7mX6lkqB83mYPo+ajmOs1kVShzQNGqmEEmZ4WDjcv+3ZYPN/Bq5osFvcrrFER8Ug3HyPu0HOfVca9w+FjHySOV7nzh+5jf0bP4RBuPYPxTDloMZXF50+I7+VJDUbVlyqK4oGdha17ZMSOEpiyLtiUfoRHk8MeJROSZBzvlBN+TFVBxnSnqiH3ARg5pspmLd4FKDqpNrmehUd1+v3zJwc0i52VS+wpP44yxpX/5PnSZ3/l6fSB3Usvd+16rs9CYo4tmS581bz4y0NExieApODHAA7O9mML81g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QvGKNw4lYWjAOSNCzGrpqOwmynRYmMy5OMgWuAWKiys=;
 b=WI2eAxajrp39vJhm9YtCjoiNG2wWREfrPJy00ZZlKqlcwjj+yISqDKpmvezKx8AQEdYaoTPkzbLDtFGECJ716SPh4uBTksNeSXE16zkQPiXKcCwW2fShBvReRUz27kOlysDp7GuKDa5w08nGyohOtmxr0KjO1tnYq5wtawJ+n/b4DNi5XuLGzijqrr11uIoAf64ja7qQTDXoBbbQzn6PtGRlLe3UCOvN6QZOQugEy09BpRmrkTQ1aB7doswHts5LfYSp6MTn6DORQn0bNQL6EwgNyuC0UyXqOOb1KB5VX21HGpBs7EIHBVzWOzD93wwUmaSrvEGHsnlJYNDctJdffQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QvGKNw4lYWjAOSNCzGrpqOwmynRYmMy5OMgWuAWKiys=;
 b=k20Cvit/uHLWZq7hcorEc12Bf0bXZeGbvd7JqSJtebGALWalq+YC4uV+Vc5/Kq2dzOryyZlGqwWM6u7ijqWsSIV4d7u52JQACxTFkZdkrXYpqMQ8rSNZYH8AfH2FnHjKTu10DhVpuYVBXM5SisDVLChGxQoz0t/8PSa8Pc4joPo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BY5PR01MB5938.prod.exchangelabs.com (2603:10b6:a03:1bd::12) by
 BN0PR01MB7168.prod.exchangelabs.com (2603:10b6:408:157::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.50; Wed, 17 Apr 2024 02:54:19 +0000
Received: from BY5PR01MB5938.prod.exchangelabs.com
 ([fe80::66a0:fe74:f7f:6baf]) by BY5PR01MB5938.prod.exchangelabs.com
 ([fe80::66a0:fe74:f7f:6baf%4]) with mapi id 15.20.7452.049; Wed, 17 Apr 2024
 02:54:19 +0000
Message-ID: <8ff7df9e-9ca7-47d3-a1b0-4997a0713341@amperemail.onmicrosoft.com>
Date: Wed, 17 Apr 2024 09:54:03 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] hwmon: (max31790): Support config PWM output
 becomes TACH
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Chanh Nguyen <chanh@os.amperecomputing.com>, Jean Delvare
 <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Justin Ledford
 <justinledford@google.com>, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Open Source Submission <patches@amperecomputing.com>
References: <20240414042246.8681-1-chanh@os.amperecomputing.com>
 <20240414042246.8681-3-chanh@os.amperecomputing.com>
 <79bef664-b191-4905-896c-afab341b982b@wanadoo.fr>
 <9bc38f67-01e0-4a38-8db8-4086a215b474@amperemail.onmicrosoft.com>
 <3a4e0543-fc40-41dc-8aaa-19811b96f1cb@wanadoo.fr>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <3a4e0543-fc40-41dc-8aaa-19811b96f1cb@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY8PR12CA0014.namprd12.prod.outlook.com
 (2603:10b6:930:4e::16) To BY5PR01MB5938.prod.exchangelabs.com
 (2603:10b6:a03:1bd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR01MB5938:EE_|BN0PR01MB7168:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c7955e9-f49f-49db-1b39-08dc5e89abac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?OEhEY2RuOHNPdkQzOEVMcURjT0JVaWtYQmhhS3paUGkzYUNFR2psb2YvdXlu?=
 =?utf-8?B?azZFRlloN0VHUU5rbThCRjk3TTk0Z1g5TVV4N3ZYOHNFRkZNcTZxZytOYWtr?=
 =?utf-8?B?SzRzMCtFWVlLa0pJNXpqWExCQzdWbFpjb3RFWnV0cVJhMnVRdEFRM2I2Mk5v?=
 =?utf-8?B?QXdQS284aWEwZE1zdCtVR2JoRXE1WXdnbXhNZDR1NnJJR0ZrUStTTEtuekg0?=
 =?utf-8?B?djNBaDBHOVp2RlM0RTlNUGsvMHRGNThZU1lQU0JBd0tXOHppV2ZCbUpkajlB?=
 =?utf-8?B?MS9TWlR1V3pyK3pqdDg0b05xQjJJakJGaUVheXZmVXR4TUoxWlJzOXlwSUJY?=
 =?utf-8?B?cDlNZVQ3eXF4WWNkWTQwZFp6WnZ4TDZjbVFpb2xvVkF1OHBGY1hNa1dnc0M4?=
 =?utf-8?B?RnJsUEdLQmJ1L1hReWxuQ3NaK2xEc1FJWnhXbHRMdDFROGt1ZE9xenlab1dz?=
 =?utf-8?B?eWtvZTFmVXFEQlp6TnZrVkNhZWluK0sycFpJSTZPV05nKzhQRGpTbEh5c1o1?=
 =?utf-8?B?eE1UU1lYQWVseWtDZkkyT2lGbnVSVUVrK1BSdHBSTmFrb2pHQ2FMTlZOa0RX?=
 =?utf-8?B?Y3NUL1U3YUx3N1ZMenQ4Nm9aNnlFWnVmZUI5WXZ6WkhEQ1ZTNng4Vyt6bWRk?=
 =?utf-8?B?QXRvcDAxRHRodzVkbU9YT3ZzOTc0dGk1d3Rzb0NsUXNjNVJqQWpmVDZncFBy?=
 =?utf-8?B?amg4Rkl6dERmSmovU1llZ2J6YVNPRmJOQ3lQTlVLdUVnQWlIWnhrdHQrWmhP?=
 =?utf-8?B?QkdTT0xPMnZzYjU2aDA5RUc4UlkyNTlpNDlyOUFCcnRHa2c3Y2ZBYlJiMHF4?=
 =?utf-8?B?bW9QQ2szb3NXWVVRWGxKTS96TFNuZjZ3T21SZmFnaWNxSEdMZ3c0U251Y3c2?=
 =?utf-8?B?eTA5TU1mcDBvY3FGeW8xR1dpR0NDekFrcHVYOUJLenNBZXVsRnA5R2xMbk5s?=
 =?utf-8?B?eTg5WnQvbnMvMDhwYjJETnBSc1k1QmZ3bmpNVUljV01rWDNiZy8vb2RtbXpq?=
 =?utf-8?B?SnJSQlZENk9wN2JVY09FV2NLNkRKcklQSVBPdTQzYkRycTNUbEJGL0VDb3BV?=
 =?utf-8?B?L0ZDbU1ZaytSaTk3akxXNzJNMVVieG9WSFk1NEh4TmhZWkUrdG14M2xMNUM1?=
 =?utf-8?B?U0Q3RlpDQ0VCYlJFR1RkQWhPaUFwMGMvWjlHSHdVN01jL25sczk1WEM2aEJM?=
 =?utf-8?B?T0grMGxoWmg1eU50MEdZOXQ2Y0lvalhrT3BSK0puNlphcFdreTI2WTZTZW52?=
 =?utf-8?B?UTFGL0ZNc1N5YlNFUys3ZzdwT3ZNamhoMytmSTdWY0pNZ1ZBZjIwc0VKSUg5?=
 =?utf-8?B?TWk1aFFQNkNVVmRlUXR4a0lwTGErbzFpbHUyMWRjNWszY0tkOFNKQ2NZMjJY?=
 =?utf-8?B?R0dtdmQyRVUra3NranNWdVpYKzVHUmdheGVJc1RySkc5b0RHVG1FcFIrdnQ2?=
 =?utf-8?B?ODdTY2xOMjFvcWpSTFZ5RVgybXV4Q1lYRnNSVHNKY1hjN3crMTg5dDdza1F5?=
 =?utf-8?B?N2ZySUEvMm11b2xOdUxySXQzbHVueDZ4T2gxMTA3Uy9CQlZrUFRPNEFUZGk4?=
 =?utf-8?B?K3R0VzVRVDNKUXBaVDhhaHROeklBQlJxWmIyRlhiZ1pTMnIvOC9NZHFITjVs?=
 =?utf-8?B?bGJUSXExeC9LaTRtUDZ1WjVRb0tjbVIyWTVTbDZ4WitJQnM1N1FyenlEeWxz?=
 =?utf-8?B?U2Nzd2VBUmtNWUdoRnRYNllQdk5RTHdWRzVDSW42RVVlTExCYnlrQlBqa29p?=
 =?utf-8?Q?8FrrGs3axbu3ZL27OxhfMWgbluG/1WxNHo0gE7R?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR01MB5938.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(366007)(1800799015)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Vm8zUTNiOUQvZWp2U21xZXgrZXBvWEVZdklJazdlV1ZaZnJDWCtESGhUN1Rl?=
 =?utf-8?B?aHY3ZEp1NXp4OEtFUTFtRnRQSnZwNVd3TnMwYzhEclNxQWhvRWpaZFJRQkgx?=
 =?utf-8?B?Rm0ybGI4OVpUakpidlVQbmRVUmMweXNBdTlUK0RETXFWQlFWSzlDVUg3K3pv?=
 =?utf-8?B?ZmNBUm04NWZkVVVuSytiUDNrcCtrS2JpaTJnQWZVaHkxSmVJVFhCenRFdHJr?=
 =?utf-8?B?NkdVdmlrVThhWlkxcTNJbk53N1pnai9yNDMvR1pDK1BlN3prbnRDbG5HVXBB?=
 =?utf-8?B?M202UDQrR2lyeFZTTmxpNzBQeHVONTJydFpLb2tuUmVkRFBsNkc4aWlRcXpx?=
 =?utf-8?B?K3JPVTFGc0dsYitadkRWRTBNUlEzNnFPZ3B6MFZUNDM0cGZxcWFZbVE4OWFu?=
 =?utf-8?B?dEppUDBCWkxZSEVhVk5YMDJ5ZWJtdmM3dUIxV2JyajhiQllVUmZwUEVaSjBs?=
 =?utf-8?B?cUoyVmQ5SW5jRFNaYktmVGV5RER3Qy9JQkpWbWg0NzlmMlQ2UEVyOEF0UmJR?=
 =?utf-8?B?dEdEd0lUMW1RSUhHcmJCNkhnRUswakQxUkdIWkRQMk5kZlpFNGZSbkdQZ1RK?=
 =?utf-8?B?TDA3bmdSREEzSmFoSmI0dTJBYjVuaDI0Uk9rQWRRRGdURU80SExtZStsK3Bu?=
 =?utf-8?B?ZysyclhZUE00aGhHZU9WOUJVOW9PTWc3d2NiTjJDejNnSWY4VE0rVXZsbG1G?=
 =?utf-8?B?Rm9DR1pyelhMbFdFeFFINDFSMnlzNXkvYkZXNDM2RUFUeU5WeEpMNzUzb29w?=
 =?utf-8?B?bW5UZzkwSUZxeFhSZXhQY1NIaytXa2NaS3VBVUdseDZMalFSdGl3WjFuMzNw?=
 =?utf-8?B?aDl0dFR1MzdzWW1wazZJUVpFY3dONjBobE9oQ0NoWkxzRGdlT3hDTTFJK1Fh?=
 =?utf-8?B?emJhQXdWMjlQWUZXNWVKL25mak9OTDJPSDduWUlqMXUwWTE5WVVWTmhiVUhj?=
 =?utf-8?B?ajRkZTdIN0dDdGJyaFZXbDFFT21vaU9BMHlUQ0tMa3c3ZzR6UnJCaDlLTE9Q?=
 =?utf-8?B?LzNBcm9Hd1ROVXA0ajJJa0pGOStLNml1ZDU2Sm5kYnAvTjNRQi9ieHI1SG9K?=
 =?utf-8?B?c0VhcituNTlRWnZTWE1jVmJOelBZTVBnUkZJVWIyL0Rjcm9DbndiTyt1WnhC?=
 =?utf-8?B?V1FQakJSOVZaYzhwb3ZUVFR4TnhsVjhDTnZJOXdLZG96cENWS1hkOWtwUXBH?=
 =?utf-8?B?d0Q3dFJpVFZLSzBTUjcxRlhDVGlHUnVoMHYzRm8yK3gwVitJSGJEYW8waGtl?=
 =?utf-8?B?UkVYZXV0RUlxMndkRkEwVkJaZkZGS2cyaWVqOGt1ZVlPM2c5azYwRXNkcGhY?=
 =?utf-8?B?UHNoTm44cGcwMjhnSmFCUEplSnVsL01GSkErWjZ6UHlJZHhXdkgyclhCR1BK?=
 =?utf-8?B?WGZ2TE5TeTdWZ1pMSEhyV1RZUVRHbzJOVEg2Z2NkMVIxNWErVnNlZjFKKzlZ?=
 =?utf-8?B?aXlLRGQ4d0Y4bHMrWU5ZTVhMbmNKZjVBWloyWXhieUZscVdPbVNIQkk1dGVQ?=
 =?utf-8?B?NDdJWW1LNmp1cWNWRkJYTzZHZnBmZmNWVlZJUWdQMTQ0eVY5SlFjZmFUa1VQ?=
 =?utf-8?B?U3hGT3E3S3AvbFRqRHlFNWt5TXJ1VllHNWhRcnF3REk0ek0yUUI3TGl1Y01T?=
 =?utf-8?B?RTFjUXhFSWFDMjExQ0JzNGViUC96WDE1TWhYdTR2RnNCR09wY2V2WTJNb25o?=
 =?utf-8?B?TEdnZkF5L1E0d1VqMTcxa2pHTUNrb0NkTmRwUzVKeDRDYlVqS00xWFNKeHFN?=
 =?utf-8?B?cTNseTIyWEVpQWtWYWVyZDd0cFlvaWRiVG5WS21KV2dnMXBjNUJiVG42MkRi?=
 =?utf-8?B?cVBaeEdoNzhlSThRcFZlV3llN1pLREpxdFNaSGlVSmdKRlRFY1dFRy9EQis5?=
 =?utf-8?B?NVZDZ21IbUhJN3FUQm5OVm5yK1Z5cEZ0ZkF4TFBPTUlDNWZuT2R6Mk9kMkpF?=
 =?utf-8?B?K2xjT0dOVDZFRHRvTCtnaDJOT0I3dlFTR0RmUkxGdC8waUIrUnFhb0R0OUpt?=
 =?utf-8?B?bUlsZXRXcnBqYjNPS2lhQWRnOUFhS1k4MGgzQ1RsNXg1RWlWaXp6N05HSk5l?=
 =?utf-8?B?TjIrSHNOK0svOUdxTFJJaytlelpZbC9jYkk0T1BNUnFneFkwQ1BVQmYxNkdp?=
 =?utf-8?B?Smp2dmdTSG9vbUZQMDd6L2RUZURxakJZeC8xSVhkOHgvbWZDcmtsL1BETXFN?=
 =?utf-8?Q?pCm1zO85pvW9iWP/xku84gU=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c7955e9-f49f-49db-1b39-08dc5e89abac
X-MS-Exchange-CrossTenant-AuthSource: BY5PR01MB5938.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 02:54:19.0810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x508rOswtbkkDVyeqcDKO5fYEWpIjkG7hwxGlB+Pinmnwrreuvvq4inf1vU//zJI3tdcKMIq/DKDwVWakyxGxWoWuK8Ifli6ytF8SE25EgWgBVBLfb+fqcb9+Zq5hWAM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR01MB7168
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



On 17/04/2024 00:39, Christophe JAILLET wrote:
> Le 16/04/2024 à 07:27, Chanh Nguyen a écrit :
>>
>>
>> On 14/04/2024 15:03, Christophe JAILLET wrote:
>>> Le 14/04/2024 à 06:22, Chanh Nguyen a écrit :
>>>> PWMOUT pins on MAX31790 can be configured as a tachometer input pin by
>>>> setting bit[0] in the Configuration Register. When the bit[0] of a 
>>>> channel
>>>> is set, the PWMOUT pin becomes the tach input pin for the channel 
>>>> plus six.
>>>>
>>>> This commit allows the kernel to set those pins when necessary if the
>>>> maxim,pwmout-pin-as-tach-input DT property exists.
>>>>
>>>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>>>> ---
>>>> Changes in v2:
>>>>   - Update the vendor property name to 
>>>> "maxim,pwmout-pin-as-tach-input"   [Rob]
>>>
>>> ...
>>
>> Hi CJ, what does it mean?
> 
> Hi,
> just a shortcut of my name : Christophe Jaillet.
> 

Thank CJ! It's a pleasure to see your comments. I'm happy to meet your 
review in the next patches.

Best Regards,
Chanh Ng

> CJ
> 
>>>
>>>> @@ -528,6 +532,33 @@ static int max31790_probe(struct i2c_client 
>>>> *client)
>>>>       if (err)
>>>>           return err;
>>>> +    if (device_property_present(dev, 
>>>> "maxim,pwmout-pin-as-tach-input")) {
>>>> +        err = device_property_read_u8_array(dev, 
>>>> "maxim,pwmout-pin-as-tach-input",
>>>> +                            pwmout_to_tach, NR_CHANNEL);
>>>> +        if (err) {
>>>> +            /* The maxim,pwmout-pin-as-tach-input is an array of 
>>>> six values */
>>>> +            dev_warn(dev, "The maxim,pwmout-pin-as-tach-input 
>>>> property exist but malform");
>>>
>>> Nit: exists
>>> Nit: malformed or "is malformed"
>>>
>>
>> Thank CJ,
>>
>> I'll update that in the patch v3
>>
>>> CJ
>>
>>
> 
