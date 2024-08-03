Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE81F946745
	for <lists+openbmc@lfdr.de>; Sat,  3 Aug 2024 05:50:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=imx8A5za;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WbTHn4JkDz3fT8
	for <lists+openbmc@lfdr.de>; Sat,  3 Aug 2024 13:50:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=imx8A5za;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c112::; helo=cy4pr05cu001.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from CY4PR05CU001.outbound.protection.outlook.com (mail-westcentralusazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WbTH643krz3cVH;
	Sat,  3 Aug 2024 13:49:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u1Reg8tsaQM8E+yZT3yV4YMt8Wl2yrWEJCYkqOYP5sYe+RCDJ47M36b+VejeRr5Z1YC9l1Sbg2gfRAStSzPkCgZBdR92PTB+1fw8t1JVPUqxUCgsd/TZEqe0805O8spJrenQohKs0YHV7AfhYRKyF6K/nFpRI3V73Fgsaa0LXB990KtfAbH794+/GTzm+gxqfzYowzGOcWKlO134mXwiJR/uID46+Om1UME1cPmMY97nOfXb1gbC9I1nbZ36bPNuwOW6zdhD/tGrMgBuncWYoYzIMUsg5nb6ZT91tsDQmFrbtLcistj9RfWoqbDptBkZDeIGV7sFcobjNPG0ppVpug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymXj6070gboA+0DvvZCztfIWJNAexvtkF/zUM6HM5XU=;
 b=qITeE+ODTqcpO6p8WLHdQ1+PHC3k9QWpXO26wjXgkb3SYRYnKlxL/XicTLopkhhO4dOiuhiBnzS/+/bhGf7DnPeRnvfKqb4HSVrxg/CDasLFRuo68krpW9QNes+36s37qBy9j18yKNHd+ueYOXn600z9SRrGOBq0jtQBViZnn0+URhtV+/KBiEfLbXXSf188cNl0sLuhheeSNS+46jcnWjyzDR+1JhLTbcwAnmlKjzbWBn8w5BiFD8GYkbUxeFP3MHpnYkfyrIF2B7EmwZA4RhIQ+TXIz98EmIXH2OiNFPijUMfyWJUENGiqCUCYkQHELFJuFZpoLOj2+IH3TV+A6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymXj6070gboA+0DvvZCztfIWJNAexvtkF/zUM6HM5XU=;
 b=imx8A5za/9nN6YJiMdLIB4BRBsep9ia1ihQy3FbiPxpohD1+xwJ5R4z7989J8vE+ul2qP9kam+1LIXj42A+jG4zMapXBMn7mTnVKrQaXRxglQsxs+jnBrn+Lkpup95u7tqvmMuYutsFuQrLjYMGH86JNphEGSPWhu0a8rx60beo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 LV2PR01MB7647.prod.exchangelabs.com (2603:10b6:408:178::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.23; Sat, 3 Aug 2024 03:49:22 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7828.023; Sat, 3 Aug 2024
 03:49:22 +0000
Message-ID: <1c2dca43-444d-44a7-b304-5fbd59b788a8@amperemail.onmicrosoft.com>
Date: Sat, 3 Aug 2024 10:49:09 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Update the device tree for Ampere's BMC platform
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Chanh Nguyen <chanh@os.amperecomputing.com>
References: <20240801091217.1408809-1-chanh@os.amperecomputing.com>
 <172252600912.120761.16384387883905749466.robh@kernel.org>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <172252600912.120761.16384387883905749466.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGXP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::13)
 To BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|LV2PR01MB7647:EE_
X-MS-Office365-Filtering-Correlation-Id: ec0a3c66-7b45-4c0e-cd43-08dcb36f40cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?K0JHNXYxNmx5K0NnRnZlNWJBVXZBR3BhNWltZnVGUW5TR2NCSVQ0NHpXQ1F1?=
 =?utf-8?B?YzVNc01pWjkzdXEyV1RiWnRDT2d3by94Z0FkTkhpWFZUL3ZaNzBOWkd4TnVK?=
 =?utf-8?B?MDNHZDRvcVpWVzV0Q1RoWjNld2hrNTZWVWpUOWU0NXpTNFdkNGR3ZDE3YjlV?=
 =?utf-8?B?NnRWZnViZDdCaU9FdGhkVW1peVh0MkpyNnRmQ2pLblgzRUROSlZ6SjlPSG1U?=
 =?utf-8?B?SlRRUnVCOGk3OXJRZmxFZ0ZkMGlMTDgwTDNhTXdseVEvcURXRjZ2OVp1UCtn?=
 =?utf-8?B?cHFJZkYzNVRHeTJZVHRWNmloVlpjcTQ4NGIwVFQxS0c4cTNYYnpneUpoMlho?=
 =?utf-8?B?d2FwVFphWEtNY2Q1RmY1VVRnaVdyNkxheC9vYmp1bXRLR1RxQUxtZW5jOHdT?=
 =?utf-8?B?MEk3TlpaVm83K0RKdEpUS1dWK3BMWlc5eWR5cVIxc3RuZUhrVHlLZ1lPNHBD?=
 =?utf-8?B?eHpXRTVkZmxUYUNMQkU3ZERIaTJqUkRidUttd3V3QnA0clJhUnhWSjU0Snc2?=
 =?utf-8?B?U0djUGJyV2xCdDR5elAwaWVTb0t2ZE8xNWVVOTB3V1c1UEhsdWE2bnhxUEor?=
 =?utf-8?B?YW1DcjNtZzZadHlHV0NQQytPYzJzNkFhdy8zQ3dReitPbTRmcjNueVFZY2dh?=
 =?utf-8?B?b0xLTUhqcDhub0lQcWhxa05oYXBjSmxuMU9zUXp5ZFgwb21HTVh6ZG5LeElG?=
 =?utf-8?B?dU5qM2Y1SUpzVjlVUDlYc0ZRV1pudTZLa0RsSzNxOERPQjVCVjI2R3hWWkhH?=
 =?utf-8?B?WUlqY09QVmJBNGZuSFppS09nY0xZdzRvWm51QVh0emZ1WEJ2VlQ0UVBxWE9Q?=
 =?utf-8?B?R2FKcHlQVnM5M1gyTlJ0UGZJNmZVWEd2ZWVYdFVGa1c1M0kwYklDbG1PRTkr?=
 =?utf-8?B?RlJoUjN4WXpWQllCMFVRUUQ5dnF5aGYwNk1vZUJFVmRicG1jS2pxcFEwam1J?=
 =?utf-8?B?YThidXgvb015eHNLWWtOQU5DZVBoZEwxVkM1eDJGVXUrZDFCV0d3VzFMVUE4?=
 =?utf-8?B?NmRacERpeEZoZkJ6OGRuYjg4K0xaRXBZTWE4VDBwWFlLSS9BUm9CWU1UVVFo?=
 =?utf-8?B?dkliOHVpKzIvZ1FSV25PU0I4akRVNk1zN1ZPZWFEb1Z4MFJhRHg3L1k4M3p4?=
 =?utf-8?B?aHlBb3FQT2RKVkxYYW15OG5BRDdmMnp6eHRvVksyd2RRR21zVS83ZUEydWl0?=
 =?utf-8?B?RVRkWmZERXd6Sm51TUN1elEwLzlwQUl4bnRCWVhPS0pDbFEwblc1SURieEhK?=
 =?utf-8?B?T25LYkZvTVFkTFM1em5Nbmdzclk2OVl6SGgzTHhYZjJHd2hHbjJGWGdEL2xP?=
 =?utf-8?B?VHBHelQ4VzdyZDcrZndpU2c1d2h5c3NIVW9jRDF6b1pEWUZnaEFFZU1RQzRN?=
 =?utf-8?B?eVpCN3p4VFRsQzRrK0dZeTI3T3JvVTY0cDVqVkJBSVZwYWJSTVRDbVAxMnAy?=
 =?utf-8?B?Vk4wVm1nVFA2cmVxczRKSVlXZVV1MkN2WFFWb1c0UDh0STc5bjZLMTd5eE1T?=
 =?utf-8?B?dGpuTHJyRk92WWxmQ1k4RlBqd0JXVVYrSmhXK2NmZTNFblhGVmtRYjkySnd3?=
 =?utf-8?B?d1Q5WDZoVjRPV2tlZEl6aGJwZUhYNmk5VGxGMHpmbEF6SHEzTW56VGNnZzVh?=
 =?utf-8?B?VTlCKzEvZSs0d3hubXkvTVY4MzduaHkvcDNlWWMvZlI0ZCtqYWRLK2VWS1Bq?=
 =?utf-8?B?RWUxVytQQ2RaSHYwR1BZcndWVDdFM1VRZEF6WWcyQXNMb0p4SmduZG9ERXJo?=
 =?utf-8?Q?+mz4o2sq5qTe5ibdms=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?YmFNS3UrSG9Ua2krVU1Vb3FOdjIxaFdlOG50NkxURFNSRlMrNjkrOTQrZjJl?=
 =?utf-8?B?ZEFhQXlsUTZGeE9rNVNUTTFCUjlQZENmNXJIL1FOMkE1N2s4dTVwUkRZakh1?=
 =?utf-8?B?aE1PeVh1Y1AzQUozc2VvQ1d1K3VxbC9LSWNPQlBMcFhRaXI2L3FRYkVJWTBx?=
 =?utf-8?B?Mzg3Y3FvQ0dYUVJTZ0UvbDA1U1k1RW5wVTdKSnJXQmV3ZElKVEJ2UC9PZEFx?=
 =?utf-8?B?bmIyalc0dFc4Vk1rbUxwQ09mQzNLWnhBZzlGV3BTRG9lWFR0ODVYV1RmRGtO?=
 =?utf-8?B?eW5nYWc0eGFnTlRrdGVnV0JUVTdPcGpndTV3NHM5T3dXZ2xwWEQySnEzWGY0?=
 =?utf-8?B?SzhQVlpDTGh4bjYzM0tnaTA4dHQ0WjdBUVhJL2tycUw4K1pUeUtmR2hLcUxJ?=
 =?utf-8?B?ZGZYRTZJWUZQajNocWYxeXBrcnlyL0xrYlBWS29CMThHZFU0TmNuWmhpZWVM?=
 =?utf-8?B?aFlYL1kvTW9FbkNBN3pxbzJ3OTlVZm5ITzYwOXFneGsya09mOEtZSFJXZCtE?=
 =?utf-8?B?T212OUVicW0zNEJNam94U0ZGWEMvTGdSV2s5Y2FobnpaT1BlVFBMcHRqOGtk?=
 =?utf-8?B?ZGJ4eUpKK0g1Q1VyT2tmRGp2ZnpRNHRCOEZReisvR3Z6RmkzVlJzdnlxdlFw?=
 =?utf-8?B?ay9LNTc3eHBnN1Zpc1ZIakFSK1BZdmE2Q2NGQ3dWcXhlM2JlSWsxc0JRWVlD?=
 =?utf-8?B?eGxsVWppUEZjL1hmcnZKVG50WjhjeTJBbTYwd2V1d1BJQWU0ZFR3S0crQlVz?=
 =?utf-8?B?M3hOT1RCb0Nzbzl5RTgxRktQYkFuY1krdE5UakU2Q3pPSUxwU2NuODhNMVg5?=
 =?utf-8?B?K1pRQWdCWjNHbjNDL3ZZL3hteDR4NTg4REwxZWhKVCtHbFFrQTFIbVlIcEVQ?=
 =?utf-8?B?eHZ1TXFoWGhmKzlyZHVjUkxOcEhwenBMK2JvR0hjMHNBWm5nMjk2WXIxQTVL?=
 =?utf-8?B?U2RGbG1HckxVTmFuOU1jK2xydnhyYXhRbStzQlNpbCs1M1J0bDR1VGVOTTNS?=
 =?utf-8?B?TXR5Nll3eU9hZ0dTcHhZL2huUmNWRzRMY05uNFovNUwzRUtBTHQ1N0Q5ZnNU?=
 =?utf-8?B?SEw5S2Y0aEdFZEh2ZmVzaE53YVpWKzhENzZ3UUZ3YktuUlV3Qm9pSnVWZkZ5?=
 =?utf-8?B?bDBmQXdTNjFDeFJ6UGUyOVVGdThoT3gyb2ZVcnJFb3g0cUNMQVBFZ0l1Z2tM?=
 =?utf-8?B?TGZ1NWlQTkdEZ0h6Njcva0NhUFQ3bklSWEJBZ1F2T2JkYjNIVWx4SSswNWZ0?=
 =?utf-8?B?cG8rYlNkL2MxMVZpYkxaNzlJTjJaNStxeVRyRlF6ajFNZ25ia3h6THgzeWJG?=
 =?utf-8?B?SUNtVlFKaFkwMExJS0VTRGJxSTIwZzBxcUhJa2pnZ2V4RDVPOWZ3cHpzKytr?=
 =?utf-8?B?ZXlYQ0pURVNGdzRwVitBYWNFVTliOWVVdUg4VERIREJ1MVozMElWYVd0Qy9W?=
 =?utf-8?B?OVd0cVZyOUZjNjlGc2lmQ21PVUxEOUVXWnUyME9FeEd6RFRMbTluYkZCeER2?=
 =?utf-8?B?MUIxeitSVGU2eXdzZnZUQjdzczg5VzdnTjFJTGJyS1ZlaEgzRUhMblk1Qi9F?=
 =?utf-8?B?MFZKbUpWMTBrM2cwSUVudWVYZ21HOTkyRWxjRFY2MENBOEJmZTJRK1YzNDNq?=
 =?utf-8?B?NmhIRjhzeElxTW4xV1M4RWhueVpPMmNUMnlOSTFaczBQbTJ6V2p5ZWNRdUFx?=
 =?utf-8?B?NGhreEZKUi9tRnFQdHBtZzRuYUYvTFVWS3JheDVLYzJoeG5JZ3NTVkhkK29z?=
 =?utf-8?B?dEczYWtNS3VCeTRQSFhDUDBZbkJpcjNMZVVWODN6Z2EzQkhONnB6UDVRekdY?=
 =?utf-8?B?MTl5WkNyTkZVV09VYVFiZlc1Q1ZsTUJzbTFSR2NnMmxTclZwWTR4a3JFMzYv?=
 =?utf-8?B?aEsyeDFoa3lEa1RYV3B4c3dTQk9LSXRYbkxQdDFFTitzcGZocEw4TE1IWVZr?=
 =?utf-8?B?V3Y5Z05JOWtlT3Brd2YxNGxwWEJJTWZld0VRcXdaaUl1QmU0MGxaMEp6RWFY?=
 =?utf-8?B?Y2tlWTJTYXBieG15SXNTQmRSMmIwdkhNS2RhOHUwZUFSL0xIUUJFcys2OWJz?=
 =?utf-8?B?eHBReno0bVlPc3pweTlsWVpsYlBnN2pQNlliOU9yWHZxQXhSalZYMVpqZnF3?=
 =?utf-8?B?aFZpdWZneUZYQzFpM0dRc1lxRUIyWUxZUVZsTUJmYlBiUFpqSjFPWXNSZ2k4?=
 =?utf-8?Q?0maR8v6FJAcaZIV7DrKbcpU=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec0a3c66-7b45-4c0e-cd43-08dcb36f40cc
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2024 03:49:22.1380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMUoXUAFQ365cpUSxUj+P9fD21kwkjHucPh7+yDVeefAPvO5Q5uAPfkNoBRze/NnfjMDGEljT+8aO0ce07160+mBeLj82UIUzELemgbtTu4SNEg32owqfCp85D3mzAhy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR01MB7647
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 01/08/2024 22:29, Rob Herring (Arm) wrote:
> 
> On Thu, 01 Aug 2024 09:12:10 +0000, Chanh Nguyen wrote:
>> Updates the device tree to support some features on Ampere's
>> Mt.Mitchell BMC and Ampere's Mt.Jade BMC.
>>
>> Chanh Nguyen (6):
>>    ARM: dts: aspeed: mtjade, mtmitchell: Add OCP temperature sensors
>>    ARM: dts: aspeed: mtmitchell: Add I2C temperature sensor alias ports
>>    ARM: dts: aspeed: mtmitchell: Add I2C Riser card alias ports
>>    ARM: dts: aspeed: mtmitchell: Enable i2c10 and i2c15
>>    ARM: dts: aspeed: mtmitchell: Add LEDs
>>    ARM: dts: aspeed: mtmitchell: Add I2C FAN controllers
>>
>>   .../dts/aspeed/aspeed-bmc-ampere-mtjade.dts   |  16 ++
>>   .../aspeed/aspeed-bmc-ampere-mtmitchell.dts   | 152 ++++++++++++++++++
>>   2 files changed, 168 insertions(+)
>>
>> --
>> 2.43.0
>>
>>
>>
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>    pip3 install dtschema --upgrade
> 
> 
> New warnings running 'make CHECK_DTBS=y aspeed/aspeed-bmc-ampere-mtjade.dtb aspeed/aspeed-bmc-ampere-mtmitchell.dtb' for 20240801091217.1408809-1-chanh@os.amperecomputing.com:
> 
> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/bus@1e78a000/i2c@480/fan-controller0@20: failed to match any schema with compatible: ['maxim,max31790']
> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/bus@1e78a000/i2c@480/fan-controller1@2f: failed to match any schema with compatible: ['maxim,max31790']
> 
> 

Thank Rob for your review!

I am aware of the new warnings you mentioned. For more information, the 
schema binding of "maxim,max31790" is being progressed by other series  
https://lore.kernel.org/lkml/20240414042246.8681-2-chanh@os.amperecomputing.com/ 


Best regards,
Chanh

> 
> 
> 
