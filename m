Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D23947DD7
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2024 17:18:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=BCebPtO/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wd0TF2j4fz3cmV
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2024 01:18:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=BCebPtO/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wd0Sg66Dbz30TQ
	for <openbmc@lists.ozlabs.org>; Tue,  6 Aug 2024 01:18:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k2n8HvmhXR/Wp7HR7W0x4V0/yhFxIb27G0RMN1hKHgmS71ld180pLiQUIp3oXPG5HNGM5+56iBhQWDR5IyRbtbMtYUCkkfORxJ3AecRyhzkA+7dfzOObeDy7DULFUvC+4N/DmhXM7Imyi33ofvpFpqbMUIZytTpkptPn1chbQAl5+OSc8s8XURdk/lxIWbypNdoTs0sTOo95ZFeW4g1rgGAYSsaPxpfpvZOff8pEr0Ea3e+KGdtVnk1UZR/Sri3GG7UEVqTc86n9Muze5vu2/9S2fayk4Sb06oHSG5rMj5ck/ZIfXHJAkaPF2edqHVpWRqUSt+93VBIiQF9wFrVvEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WD96EttyfPtwAH8trgFEaEiL69FELnECa0A+difCvNo=;
 b=IUY0+flncOoYT/rDPjczNZzu7nzCfYNWfSYrMQV1s96irHWijRxSDyHSfBxBuv7G5sXtWOQqJqOkv5Z54aqYOiI2EZZclzgadApb5GSyKUfs63MjAoZM75ILNwMJj1H0fRdkXcEPN7dT2cEETo1nC8WDGV2ngr3K6zkAISJFn4kWsEq+/+DQ3RVtVaYxXkoijhJ8QlQ5ghX7UVf/SH4bf5plDep7a2fPd74LeIKgY9Z/ibJZsNEYue6xThH5rwVSdA80oJWVUfo761SUmxun9suOriT8qQUkGl5EfbL+VTWwHhsE0WNIL9YpBzMQ0u+wng6qKPvrRy9bHRRfmC3lug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WD96EttyfPtwAH8trgFEaEiL69FELnECa0A+difCvNo=;
 b=BCebPtO/Iwgbj4HxhdamLhbynpDOjZuTnmZlv7GNzqUrxX0jSDGJW+ecTAyHVE6Dq+M4xs6ZP6PDWIcTbJLMMVjC2uM/nine+J8m5BKujgX0/ct+Tzzg32LyOes+ivf9M0hUmMVPvUHfBo9BtYzCGFKEe6Ic9GInCCWrZ70ORCHtiGnx3bTSeZVmo+Gnx62WdRVJtOi1l3aEgT/01OHAWW2x1jhEGiw+jQAEiO7TEAORX3AzIMvXNDD6URsT4kxJx7NJ43c51n4WVlSk01HCQAjnzhrzx7Hq69oPaKJD9copoFHrWBDJ5uTW2I4L7Tp7ZcPdcHNNt+1MuyB5Yl9suw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10911.eurprd04.prod.outlook.com (2603:10a6:10:58c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 15:17:55 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 15:17:55 +0000
Date: Mon, 5 Aug 2024 11:17:45 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stanley Chu <stanley.chuys@gmail.com>
Subject: Re: [PATCH v1 2/2] i3c: master: Add Nuvoton npcm845 i3c master driver
Message-ID: <ZrDtGcjfwEKcjyFm@lizhi-Precision-Tower-5810>
References: <20240801071946.43266-1-yschu@nuvoton.com>
 <20240801071946.43266-3-yschu@nuvoton.com>
 <Zq0Ge097urOty5l+@lizhi-Precision-Tower-5810>
 <CAPwEoQNrGE8cgxEYxezZmFufpK3C18Cn9rw4mjQNSjtV-eWSrQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPwEoQNrGE8cgxEYxezZmFufpK3C18Cn9rw4mjQNSjtV-eWSrQ@mail.gmail.com>
X-ClientProxiedBy: BY3PR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10911:EE_
X-MS-Office365-Filtering-Correlation-Id: 9349caf0-450d-4430-b04d-08dcb561c7eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|52116014|366016|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?K3pTckc1ZWQvU1JDcy9kamQrUXVMd0ZaQjlxdkprT3NPNEt3Rm50OXNvSm9G?=
 =?utf-8?B?ZTFvc3NzSTVXSXpvQUlseWl0bHV5V01QWGc3QWVXdkVLV3VseDdMSmpWeWRW?=
 =?utf-8?B?c2plNHRzZ0IxV2lrSEdMOUxINiswdFhRd1RZNlBPVWtnMGI0Q0owTy9zaEFM?=
 =?utf-8?B?Q2ZGVWZ5TU1XSkFmdzJHT2RWOEhSV1JETjU0SU0xM3NXOCswblhXWGV5cVRu?=
 =?utf-8?B?Vy9JNlQxOTRaUzBISGxzQ1d0MDFvM2ovZE5zMGFCdUFBdGdPdFJmS1RtL2Mv?=
 =?utf-8?B?NlZkQ2lZdExyYlFycStzb01TNlNFSE5YWkJ6K1Z1VnYydWNFRUgyb2cxQlRW?=
 =?utf-8?B?UW90eitrVVZzdVZwVGRMY3E5MXh3cmxnbGdSVVlBeEFSemNYdENzdnprVFVw?=
 =?utf-8?B?MWZMOC9scFpTQVFlU3VxRk5BWWhPZ1A5ZFVBcFphdjFScEZRZjdIdkc1M3Nu?=
 =?utf-8?B?WkJFQktWbkFVdVAySU12ZGRXTEtxcldMaU5JSXpYMi93NEdvWkg4Z045RCt0?=
 =?utf-8?B?cER3K0haYXlUUUpwOVMxVEVNVGRmMFg2RXBVWDdyd3lWVWxFb1lucTMzRE5I?=
 =?utf-8?B?dmRKUG1IUmdXRGkzcjZVR1FraHFiRUdiVmNrOXEzbm1VSmdIZ0xVcEpyWndU?=
 =?utf-8?B?Vjd3Q2hMZEIxVEkvRVUxanFkMWRreUZBZldzbUJlK2lDNDBhWnlLK2xDMzlV?=
 =?utf-8?B?VlF5bjJhaHdZbVJCVGlCQ05sMFUyd3FJdEVrQWhiZCtpT1hJQmJWa2kxeVRw?=
 =?utf-8?B?MzcrY1d6dGc2aFpiUVRhYXp6WDY5SnViK1lNZ216ajN0WW15RWoyclV0RVQy?=
 =?utf-8?B?TkJkVVVjQXJVbVNBc2dKVXZEVU01UTJqd0tJdk5CZVhLMlAzUWRjbWNzOWMw?=
 =?utf-8?B?QmlMZm15UWh3dzFNTVU5VEhxK0VScGwyS05ranR6SjhVYzJQNnVnYWlYTlla?=
 =?utf-8?B?SHREUnhvMVVDaWFvWTJGcWl5S05JRnpnaHBsVW8wejJnTFBZZ0FSay9TREhK?=
 =?utf-8?B?U3VKTytuVnk1Yy82ZTBIQ3NxVzljU1hpK1dXVHNGWnlTTTBpd3VPN1JLUXgr?=
 =?utf-8?B?NjROZ1hOSTBtRUd0SzNMdkVxeUJrTUlzU1hDT01jSXpTNmtoQm5ETG9jOTRF?=
 =?utf-8?B?Z3RPa2RMcmhjUC9lcFJtVzZya3o0NmNLZVF5elA4WElsNVFrejZFVVFlL2dN?=
 =?utf-8?B?WWhHMGFXTUdLRmJWTjdtd1BjTERMakhqNWx2Q2VPK3RaVDFabTl3QmF3Vy9q?=
 =?utf-8?B?SWcwTTl2MGs4SHMySXFUYW1FQWJZY2laVGZaV1RiZys4M1VISmhJRnBVcnd3?=
 =?utf-8?B?U0RFNFo0VHNKNWgzQ2l2S1JJV21NblZaMUNYSlRNaWY5a2d1N3E2NjJtY0tp?=
 =?utf-8?B?OWx5aUJZWXEvSGNCWm5IUGJvMmM5MUxqMlM1S2JqZmtUOGlpa1lLTk85RUgr?=
 =?utf-8?B?WFBNdmJSSm9iY2U3YzcxSzU4RG1kelJ2SENDQlVWWVpUUE1Nc0pGc0dlTWNh?=
 =?utf-8?B?Tnpmejl5empFaDNSVmVZTXNwQm9xOHVlT2ZsUzE4eHRSbnIwTjRwdVRxZmQy?=
 =?utf-8?B?blpWbGVHa0RDelRRL2J1cm5wM1h0eUx3bzZSa29vTnVMYUY4ZCtJcWZEa2dZ?=
 =?utf-8?B?cDlWeUpvM0dvVDJHMmg2V3pSREFZeEpiaU0vQTFyMm1GWHkxR25uQjU3OVNN?=
 =?utf-8?B?RGt2WVNsNjN4MUJjR09zTjFHYkdvc2U4RzVwZCt0V3QrZHVDQXN3c2pSUGpI?=
 =?utf-8?B?N1VlYkNJbkRSSW5MRmd1dDdJaFNFdGJsMkxaWlhjZ1JZRmVNTURZczNadjdv?=
 =?utf-8?Q?B7kEegBBl1CRYRCMf+1e+6KVVN/SjrOjdNyHo=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?bXdNck1TVElydll2SEhCQU9RMS9lNzhYNXlta1FSMVU4aWE4azNyUmQ0ZUJB?=
 =?utf-8?B?aFZnUm1tZVl6ZXBnN1dnM1BzcHBlbi9zTlVFeWdBV0NWLzl6QnZXZ1M1NXFL?=
 =?utf-8?B?ejRJdzZCUGpzNWFtTVBwbzhjcUxMY3NmWWR0YTIyVDUwNVpWRVhnWGpyL252?=
 =?utf-8?B?ZDVsUlM3QVN5TGtYeFplOHJ6NUJJWmRCbVdXbE1JUEJxVUVOWEhsZmhoNjhi?=
 =?utf-8?B?c09veXBuaTdCNmRiR25aOTl2c0VZSUZaMXlUc3pBdm5oT3VVNERacko4cnBU?=
 =?utf-8?B?S0psQVhiSVlXdURHbDRhM2E3MlJrOHErMGY3ZFZoMytvemNmeCtibzkyNzhi?=
 =?utf-8?B?Z05VVmRmbEZsNzhDY3RGTUIrSU5QdytLMnlQTTNuazRzbXU2SmFVWWxQVHh6?=
 =?utf-8?B?Q1VnZEE4d1hpclJseFpjY0pBdDMvaHVXRndIcWZWZzhsdFhRTFRBRXhqdkZh?=
 =?utf-8?B?ZDdMM2pxK1d6RXhSa2ZqRk92Z1hEdDhtRHdYdjRZaWsybU1vV1lkL1NMcTlQ?=
 =?utf-8?B?amhwYkc2Y0RuYkpwbnZ6TVNVUUR4L2hTZVJmRkRNbndmaWZ0cDF0UzV4NUtO?=
 =?utf-8?B?U0lkQWladmgxcUlYZ1Y1VUxOSnhNSk1JL2tFTUQwdWExeHdWbkNmQVZiS0V1?=
 =?utf-8?B?ejJ6eTNWY0hLYWRMQlZWMml2UkZJcWM4Mlp1a2tlSFVlKzZYUTdzVmo0SGRY?=
 =?utf-8?B?QU5zNGlaUTB6TmRjTGVhUWMxMk1GYldIOEg3cXJWeG5vaWdhRzN3QkVGRUlt?=
 =?utf-8?B?blhmRkN4dzVtV0dZa2hrQmhXbWh4Q2ZxeUltYzg0YWs4cHZWeFdCc09TdWUy?=
 =?utf-8?B?eHdwTElPenN5R205Uzc1cGxEWUV2YkZsTGhSTEdIakhZb3NoMTdqcGkxSTlS?=
 =?utf-8?B?b3BtOHJha3kzc0I5bGI5ejJYb1J6TGtFaHp1VkxDdmU3eHp2eE5pWmgrbXY3?=
 =?utf-8?B?TUFaS0lVWWxrbzdXV25RdTNhcjhBL2t1Umx1Zm0vTmVrd3l6UFp5MzN3WTY3?=
 =?utf-8?B?b2tpd3BwSnIwSWlUaFA5WVFrK2dwMjMxZndMMXRsRnh1cUYxWEoyeVVIakdq?=
 =?utf-8?B?MzQzVkx0Rkw3dDBOVzlWVHNleXh6djl2TmtIUzl4a3FYK0NKWUtRL0J2eTl1?=
 =?utf-8?B?eWphVlY5REVKKzc1SXZzNXZPTXdPMnRSTFErRVhpYVgxUm9sQi9Bamg5NDV2?=
 =?utf-8?B?WUJLSitDdkpRRlhiR2hwOXU3RkNrZWJjbnA3eEY2aEZtNnhiaTZTakp5NFlT?=
 =?utf-8?B?WE1oUUR1SlZnTUQ2WHdrbGJiaEhGN0Y2cVVoTFhUcFVZUWhVaXFWUWhFTEZN?=
 =?utf-8?B?V3BvaXZQbEJiYStCbDdiR25Pdm5Cb0szSEVNdzAwMTVxeFlGVW9UY2FteHla?=
 =?utf-8?B?ZksxaTFEa2E5aWdmRHJMU3Y3cE1RNjdSd2xnZnFxSHl4bmhyWU0yWnlYNGNp?=
 =?utf-8?B?eDExQmhyNHo0OTNxT2lBb0JrSlRkYkppWTdNeVEyWVQ0VTBmT0xGcWRUb2dq?=
 =?utf-8?B?bTBqSitzdWJ1aUh4a0ppU3dXcVBKTjNJalhMM3ozaU9MNUpjcE1MdWo1SjZL?=
 =?utf-8?B?QktiZTBuYXo0Ykx3Nm9jenR1RDcydkxKN2tYVTA3MGtCWXE4aEdtSGM3MmJM?=
 =?utf-8?B?YXdEMXBiOFhBVnNkcmF5U1JmeC8xUzgxTnRTbjBKT1V0bUw2YzFpTE45a0ZB?=
 =?utf-8?B?d0E0R1ZFTFNyOFNwRGkveHI4aitLMmVHMUpwZjhGVytIbVVTUkRaZit3SnhV?=
 =?utf-8?B?QXhnWWZjRmpFTDI1MDhpU3F4TzdyZFFQbHhubUlodE9mbEZMcXVuUkpBODRm?=
 =?utf-8?B?TEFrOGtPanNvTTdoR1E1dzVDcGNpeDlLb3plNGRWTC84R1N3UWt1NW1oYVN4?=
 =?utf-8?B?SlgzVE1SRXhMbndXYzc1eEM2MitKbFNiTFVzWDVMcHBoN3JyUDlKbW9ST0Nw?=
 =?utf-8?B?L1hXa29hbmd2NG1tQVBsblV6UjlTRjBadU9PYmp5ZVczdEU5YkNrUjE0MTlk?=
 =?utf-8?B?eitPYWJWVVVncE5tNEt3QzdHQ2V5dW5HTXduYnJ0cmhqOXR6anVWZmJMdy9J?=
 =?utf-8?B?bWdhUlNESGVrN2s1Y2FVa09CMmowSS9pRThaQnhxbmpsVVlLZjQyRzRBVGVZ?=
 =?utf-8?Q?5O4E=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9349caf0-450d-4430-b04d-08dcb561c7eb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 15:17:55.5136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UXx+FH6OTFybN4QexavRMjs3J38TmFjvIjKDY0YzhjJOswP0nwIBh00E/KprcQrWctcbfo5cqTkmSH7EnZkWog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10911
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
Cc: robh@kernel.org, alexandre.belloni@bootlin.com, yschu@nuvoton.com, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, kwliu@nuvoton.com, cpchiang1@nuvoton.com, krzk+dt@kernel.org, linux-i3c@lists.infradead.org, tomer.maimon@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Aug 05, 2024 at 03:19:34PM +0800, Stanley Chu wrote:
> On Sat, Aug 3, 2024 at 12:17 AM Frank Li <Frank.li@nxp.com> wrote:
> >
> > On Thu, Aug 01, 2024 at 03:19:46PM +0800, Stanley Chu wrote:
> > > Add support for the Nuvoton npcm845 i3c controller which
> > > implements I3C master functionality as defined in the MIPI
> > > Alliance Specification for I3C, Version 1.0.
> > >
> > > The master role is supported in SDR mode only. IBI and Hot-join
> > > requsts are supported.
> > >
> > > Signed-off-by: Stanley Chu <yschu@nuvoton.com>
> > > Signed-off-by: James Chiang <cpchiang1@nuvoton.com>
> > > ---
> > >  MAINTAINERS                             |    7 +
> > >  drivers/i3c/master/Kconfig              |   14 +
> > >  drivers/i3c/master/Makefile             |    1 +
> > >  drivers/i3c/master/npcm845-i3c-master.c | 2364 +++++++++++++++++++++++
> > >  4 files changed, 2386 insertions(+)
> > >  create mode 100644 drivers/i3c/master/npcm845-i3c-master.c
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 42decde38320..2d30b6e418d8 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -2670,6 +2670,13 @@ F:     Documentation/userspace-api/media/drivers/npcm-video.rst
> > >  F:   drivers/media/platform/nuvoton/
> > >  F:   include/uapi/linux/npcm-video.h
> > >
> > > +ARM/NUVOTON NPCM845 I3C MASTER DRIVER
> > > +M:   Stanley Chu <yschu@nuvoton.com>
> > > +M:   James Chiang <cpchiang1@nuvoton.com>
> > > +S:   Maintained
> > > +F:   Documentation/devicetree/bindings/i3c/nuvoton,i3c-master.yaml
> > > +F:   drivers/i3c/master/npcm845-i3c-master.c
> > > +
> > >  ARM/NUVOTON WPCM450 ARCHITECTURE
> > >  M:   Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> > >  L:   openbmc@lists.ozlabs.org (moderated for non-subscribers)
> > > diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
> > > index 90dee3ec5520..a71d504d4744 100644
> > > --- a/drivers/i3c/master/Kconfig
> > > +++ b/drivers/i3c/master/Kconfig
> > > @@ -44,6 +44,20 @@ config SVC_I3C_MASTER
> > >       help
> > >         Support for Silvaco I3C Dual-Role Master Controller.
> > >
> > > +config NPCM845_I3C_MASTER
> > > +     tristate "Nuvoton NPCM845 I3C master driver"
> > > +     depends on I3C
> > > +     depends on HAS_IOMEM
> > > +     depends on ARCH_NPCM || COMPILE_TEST
> > > +     help
> > > +       Support for Nuvoton NPCM845 I3C Master Controller.
> > > +
> > > +       This hardware is an instance of the SVC I3C controller; this
> > > +       driver adds platform specific support for NPCM845 hardware.
> > > +
> > > +       This driver can also be built as a module.  If so, the module
> > > +       will be called npcm845-i3c-master.
> > > +
> > >  config MIPI_I3C_HCI
> > >       tristate "MIPI I3C Host Controller Interface driver (EXPERIMENTAL)"
> > >       depends on I3C
> > > diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
> > > index 3e97960160bc..3ed55113190a 100644
> > > --- a/drivers/i3c/master/Makefile
> > > +++ b/drivers/i3c/master/Makefile
> > > @@ -3,4 +3,5 @@ obj-$(CONFIG_CDNS_I3C_MASTER)         += i3c-master-cdns.o
> > >  obj-$(CONFIG_DW_I3C_MASTER)          += dw-i3c-master.o
> > >  obj-$(CONFIG_AST2600_I3C_MASTER)     += ast2600-i3c-master.o
> > >  obj-$(CONFIG_SVC_I3C_MASTER)         += svc-i3c-master.o
> > > +obj-$(CONFIG_NPCM845_I3C_MASTER)     += npcm845-i3c-master.o
> > >  obj-$(CONFIG_MIPI_I3C_HCI)           += mipi-i3c-hci/
> > > diff --git a/drivers/i3c/master/npcm845-i3c-master.c b/drivers/i3c/master/npcm845-i3c-master.c
> > > new file mode 100644
> > > index 000000000000..19672fdbe2b8
> > > --- /dev/null
> > > +++ b/drivers/i3c/master/npcm845-i3c-master.c
> > > @@ -0,0 +1,2364 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Nuvoton NPCM845 I3C master driver
> > > + *
> > > + * Copyright (C) 2024 Nuvoton Technology Corp.
> > > + * Based on the work from svc i3c master driver and add platform
> > > + * specific support for the NPCM845 hardware.
> > > + */
> > > +
> > > +#include <linux/bitfield.h>
> > > +#include <linux/clk.h>
> > > +#include <linux/completion.h>
> > > +#include <linux/debugfs.h>
> > > +#include <linux/dma-mapping.h>
> > > +#include <linux/errno.h>
> > > +#include <linux/interrupt.h>
> > > +#include <linux/iopoll.h>
> > > +#include <linux/list.h>
> > > +#include <linux/module.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/of.h>
> > > +#include <linux/reset.h>
> > > +#include <linux/i3c/master.h>
> > > +#include <linux/pinctrl/consumer.h>
> > > +#include <linux/platform_device.h>
> >
> > Please sort include files
> >
> > > +
> > > +/* Master Mode Registers */
> > > +#define NPCM_I3C_MCONFIG      0x000
> > > +#define   NPCM_I3C_MCONFIG_MASTER_EN BIT(0)
> > > +#define   NPCM_I3C_MCONFIG_DISTO(x) FIELD_PREP(BIT(3), (x))
> > > +#define   NPCM_I3C_MCONFIG_HKEEP(x) FIELD_PREP(GENMASK(5, 4), (x))
> > > +#define   NPCM_I3C_MCONFIG_ODSTOP(x) FIELD_PREP(BIT(6), (x))
> > > +#define   NPCM_I3C_MCONFIG_PPBAUD(x) FIELD_PREP(GENMASK(11, 8), (x))
> > > +#define   NPCM_I3C_MCONFIG_PPLOW(x) FIELD_PREP(GENMASK(15, 12), (x))
> > > +#define   NPCM_I3C_MCONFIG_ODBAUD(x) FIELD_PREP(GENMASK(23, 16), (x))
> > > +#define   NPCM_I3C_MCONFIG_ODHPP(x) FIELD_PREP(BIT(24), (x))
> > > +#define   NPCM_I3C_MCONFIG_SKEW(x) FIELD_PREP(GENMASK(27, 25), (x))
> > > +#define   NPCM_I3C_MCONFIG_SKEW_MASK GENMASK(27, 25)
> > > +#define   NPCM_I3C_MCONFIG_I2CBAUD(x) FIELD_PREP(GENMASK(31, 28), (x))
> > > +
> > > +#define NPCM_I3C_MCTRL        0x084
> > > +#define   NPCM_I3C_MCTRL_REQUEST_MASK GENMASK(2, 0)
> > > +#define   NPCM_I3C_MCTRL_REQUEST(x) FIELD_GET(GENMASK(2, 0), (x))
> > > +#define   NPCM_I3C_MCTRL_REQUEST_NONE 0
> > > +#define   NPCM_I3C_MCTRL_REQUEST_START_ADDR 1
> > > +#define   NPCM_I3C_MCTRL_REQUEST_STOP 2
> > > +#define   NPCM_I3C_MCTRL_REQUEST_IBI_ACKNACK 3
> > > +#define   NPCM_I3C_MCTRL_REQUEST_PROC_DAA 4
> > > +#define   NPCM_I3C_MCTRL_REQUEST_FORCE_EXIT 6
> > > +#define   NPCM_I3C_MCTRL_REQUEST_AUTO_IBI 7
> > > +#define   NPCM_I3C_MCTRL_TYPE_I3C 0
> > > +#define   NPCM_I3C_MCTRL_TYPE_I2C BIT(4)
> > > +#define   NPCM_I3C_MCTRL_IBIRESP_AUTO 0
> > > +#define   NPCM_I3C_MCTRL_IBIRESP_ACK_WITHOUT_BYTE 0
> > > +#define   NPCM_I3C_MCTRL_IBIRESP_ACK_WITH_BYTE BIT(7)
> > > +#define   NPCM_I3C_MCTRL_IBIRESP_NACK BIT(6)
> > > +#define   NPCM_I3C_MCTRL_IBIRESP_MANUAL GENMASK(7, 6)
> > > +#define   NPCM_I3C_MCTRL_DIR(x) FIELD_PREP(BIT(8), (x))
> > > +#define   NPCM_I3C_MCTRL_DIR_WRITE 0
> > > +#define   NPCM_I3C_MCTRL_DIR_READ 1
> > > +#define   NPCM_I3C_MCTRL_ADDR(x) FIELD_PREP(GENMASK(15, 9), (x))
> > > +#define   NPCM_I3C_MCTRL_RDTERM(x) FIELD_PREP(GENMASK(23, 16), (x))
> > > +
> > > +#define NPCM_I3C_MSTATUS      0x088
> > > +#define   NPCM_I3C_MSTATUS_STATE(x) FIELD_GET(GENMASK(2, 0), (x))
> > > +#define   NPCM_I3C_MSTATUS_STATE_DAA(x) (NPCM_I3C_MSTATUS_STATE(x) == 5)
> > > +#define   NPCM_I3C_MSTATUS_STATE_IDLE(x) (NPCM_I3C_MSTATUS_STATE(x) == 0)
> > > +#define   NPCM_I3C_MSTATUS_STATE_SLVREQ(x) (NPCM_I3C_MSTATUS_STATE(x) == 1)
> > > +#define   NPCM_I3C_MSTATUS_STATE_IBIACK(x) (NPCM_I3C_MSTATUS_STATE(x) == 6)
> > > +#define   NPCM_I3C_MSTATUS_BETWEEN(x) FIELD_GET(BIT(4), (x))
> > > +#define   NPCM_I3C_MSTATUS_NACKED(x) FIELD_GET(BIT(5), (x))
> > > +#define   NPCM_I3C_MSTATUS_IBITYPE(x) FIELD_GET(GENMASK(7, 6), (x))
> > > +#define   NPCM_I3C_MSTATUS_IBITYPE_IBI 1
> > > +#define   NPCM_I3C_MSTATUS_IBITYPE_MASTER_REQUEST 2
> > > +#define   NPCM_I3C_MSTATUS_IBITYPE_HOT_JOIN 3
> > > +#define   NPCM_I3C_MINT_SLVSTART BIT(8)
> > > +#define   NPCM_I3C_MINT_MCTRLDONE BIT(9)
> > > +#define   NPCM_I3C_MINT_COMPLETE BIT(10)
> > > +#define   NPCM_I3C_MINT_RXPEND BIT(11)
> > > +#define   NPCM_I3C_MINT_TXNOTFULL BIT(12)
> > > +#define   NPCM_I3C_MINT_IBIWON BIT(13)
> > > +#define   NPCM_I3C_MINT_ERRWARN BIT(15)
> > > +#define   NPCM_I3C_MSTATUS_SLVSTART(x) FIELD_GET(NPCM_I3C_MINT_SLVSTART, (x))
> > > +#define   NPCM_I3C_MSTATUS_MCTRLDONE(x) FIELD_GET(NPCM_I3C_MINT_MCTRLDONE, (x))
> > > +#define   NPCM_I3C_MSTATUS_COMPLETE(x) FIELD_GET(NPCM_I3C_MINT_COMPLETE, (x))
> > > +#define   NPCM_I3C_MSTATUS_RXPEND(x) FIELD_GET(NPCM_I3C_MINT_RXPEND, (x))
> > > +#define   NPCM_I3C_MSTATUS_TXNOTFULL(x) FIELD_GET(NPCM_I3C_MINT_TXNOTFULL, (x))
> > > +#define   NPCM_I3C_MSTATUS_IBIWON(x) FIELD_GET(NPCM_I3C_MINT_IBIWON, (x))
> > > +#define   NPCM_I3C_MSTATUS_ERRWARN(x) FIELD_GET(NPCM_I3C_MINT_ERRWARN, (x))
> > > +#define   NPCM_I3C_MSTATUS_IBIADDR(x) FIELD_GET(GENMASK(30, 24), (x))
> > > +
> > > +#define NPCM_I3C_IBIRULES     0x08C
> > > +#define   NPCM_I3C_IBIRULES_ADDR(slot, addr) FIELD_PREP(GENMASK(29, 0), \
> > > +                                                    ((addr) & 0x3F) << ((slot) * 6))
> > > +#define   NPCM_I3C_IBIRULES_ADDRS 5
> > > +#define   NPCM_I3C_IBIRULES_MSB0 BIT(30)
> > > +#define   NPCM_I3C_IBIRULES_NOBYTE BIT(31)
> > > +#define   NPCM_I3C_IBIRULES_MANDBYTE 0
> > > +#define NPCM_I3C_MINTSET      0x090
> > > +#define NPCM_I3C_MINTCLR      0x094
> > > +#define NPCM_I3C_MINTMASKED   0x098
> > > +#define NPCM_I3C_MERRWARN     0x09C
> > > +#define   NPCM_I3C_MERRWARN_NACK(x) FIELD_GET(BIT(2), (x))
> > > +#define   NPCM_I3C_MERRWARN_TIMEOUT BIT(20)
> > > +#define   NPCM_I3C_MERRWARN_HCRC(x) FIELD_GET(BIT(10), (x))
> > > +#define NPCM_I3C_MDMACTRL     0x0A0
> > > +#define   NPCM_I3C_MDMACTRL_DMAFB(x) FIELD_PREP(GENMASK(1, 0), (x))
> > > +#define   NPCM_I3C_MDMACTRL_DMATB(x) FIELD_PREP(GENMASK(3, 2), (x))
> > > +#define   NPCM_I3C_MDMACTRL_DMAWIDTH(x) FIELD_PREP(GENMASK(5, 4), (x))
> > > +#define NPCM_I3C_MDATACTRL    0x0AC
> > > +#define   NPCM_I3C_MDATACTRL_FLUSHTB BIT(0)
> > > +#define   NPCM_I3C_MDATACTRL_FLUSHRB BIT(1)
> > > +#define   NPCM_I3C_MDATACTRL_UNLOCK_TRIG BIT(3)
> > > +#define   NPCM_I3C_MDATACTRL_TXTRIG_FIFO_NOT_FULL GENMASK(5, 4)
> > > +#define   NPCM_I3C_MDATACTRL_RXTRIG_FIFO_NOT_EMPTY 0
> > > +#define   NPCM_I3C_MDATACTRL_RXCOUNT(x) FIELD_GET(GENMASK(28, 24), (x))
> > > +#define   NPCM_I3C_MDATACTRL_TXCOUNT(x) FIELD_GET(GENMASK(20, 16), (x))
> > > +#define   NPCM_I3C_MDATACTRL_TXFULL BIT(30)
> > > +#define   NPCM_I3C_MDATACTRL_RXEMPTY BIT(31)
> > > +
> > > +#define NPCM_I3C_MWDATAB      0x0B0
> > > +#define   NPCM_I3C_MWDATAB_END BIT(8)
> > > +
> > > +#define NPCM_I3C_MWDATABE     0x0B4
> > > +#define NPCM_I3C_MWDATAH      0x0B8
> > > +#define NPCM_I3C_MWDATAHE     0x0BC
> > > +#define NPCM_I3C_MRDATAB      0x0C0
> > > +#define NPCM_I3C_MRDATAH      0x0C8
> > > +
> > > +#define NPCM_I3C_MDYNADDR     0x0E4
> > > +#define   NPCM_MDYNADDR_VALID BIT(0)
> > > +#define   NPCM_MDYNADDR_ADDR(x) FIELD_PREP(GENMASK(7, 1), (x))
> > > +
> > > +#define NPCM_I3C_PARTNO       0x06C
> > > +#define NPCM_I3C_VENDORID     0x074
> > > +#define   NPCM_I3C_VENDORID_VID(x) FIELD_GET(GENMASK(14, 0), (x))
> > > +
> > > +#define NPCM_I3C_MAX_DEVS 32
> > > +#define NPCM_I3C_PM_TIMEOUT_MS 1000
> >
> > Above register layer out is very similar with svc-i3c-master.c, I suppose
> > you can reuse it and just add DMA support port.
> >
> > Frank
> >
>
> Hi Frank,
> Thanks for the review.
> There are some reasons I decided to add a new driver for our own platform.
> - we have different design logic in the ibi handling to meet our
> requirements. This affected the major part of the interrupt handler
> and master_xfer function.
> - npcm845 i3c uses the old version of silvaco IP and three are several
> errata workarounds need to be applied. Some workarounds are specific
> to npcm845 hardware.
> These changes may not be proper to apply to svc-i3c-master.c.

You can use quirk for errata workaround. I go though this driver, most part
is copied from svc-i3c-master.c. If use one driver, it will be easy to do
fixes in future. Actually, there are still fixes patches under our test.

Please try use one driver.

Frank

>
>
> > > +
> > > +/* This parameter depends on the implementation and may be tuned */
> > > +#define NPCM_I3C_FIFO_SIZE 16
> > > +#define NPCM_I3C_MAX_IBI_PAYLOAD_SIZE 8
> > > +#define NPCM_I3C_MAX_RDTERM 255
> > > +#define NPCM_I3C_MAX_PPBAUD 15
> > > +#define NPCM_I3C_MAX_PPLOW 15
> > > +#define NPCM_I3C_MAX_ODBAUD 255
> > > +#define NPCM_I3C_MAX_I2CBAUD 15
> > > +#define I3C_SCL_PP_PERIOD_NS_MIN 40
> > > +#define I3C_SCL_OD_LOW_PERIOD_NS_MIN 200
> > > +
> > > +/* DMA definitions */
> > > +#define MAX_DMA_COUNT                1024
> > > +#define DMA_CH_TX            0
> > > +#define DMA_CH_RX            1
> > > +#define NPCM_GDMA_CTL(n)     (n * 0x20 + 0x00)
> > > +#define   NPCM_GDMA_CTL_GDMAMS(x) FIELD_PREP(GENMASK(3, 2), (x))
> > > +#define   NPCM_GDMA_CTL_TWS(x) FIELD_PREP(GENMASK(13, 12), (x))
> > > +#define   NPCM_GDMA_CTL_GDMAEN       BIT(0)
> > > +#define   NPCM_GDMA_CTL_DAFIX        BIT(6)
> > > +#define   NPCM_GDMA_CTL_SAFIX        BIT(7)
> > > +#define   NPCM_GDMA_CTL_SIEN BIT(8)
> > > +#define   NPCM_GDMA_CTL_DM   BIT(15)
> > > +#define   NPCM_GDMA_CTL_TC   BIT(18)
> > > +#define NPCM_GDMA_SRCB(n)    (n * 0x20 + 0x04)
> > > +#define NPCM_GDMA_DSTB(n)    (n * 0x20 + 0x08)
> > > +#define NPCM_GDMA_TCNT(n)    (n * 0x20 + 0x0C)
> > > +#define NPCM_GDMA_CSRC(n)    (n * 0x20 + 0x10)
> > > +#define NPCM_GDMA_CDST(n)    (n * 0x20 + 0x14)
> > > +#define NPCM_GDMA_CTCNT(n)   (n * 0x20 + 0x18)
> > > +#define NPCM_GDMA_MUX(n)     (((n & 0xFFFF) >> 12) * 2 + 6)
> > > +#define GDMA_CH0_EN          GENMASK(6, 5)
> > > +#define GDMA_CH1_EN          GENMASK(22, 21)
> > > +
> > > +struct npcm_i3c_cmd {
> > > +     u8 addr;
> > > +     bool rnw;
> > > +     u8 *in;
> > > +     const void *out;
> > > +     unsigned int len;
> > > +     unsigned int read_len;
> > > +     bool continued;
> > > +     bool use_dma;
> > > +};
> > > +
> > > +struct npcm_i3c_xfer {
> > > +     struct list_head node;
> > > +     struct completion comp;
> > > +     int ret;
> > > +     unsigned int type;
> > > +     unsigned int ncmds;
> > > +     struct npcm_i3c_cmd cmds[];
> > > +};
> > > +
> > > +struct npcm_i3c_regs_save {
> > > +     u32 mconfig;
> > > +     u32 mdynaddr;
> > > +};
> > > +
> > > +struct npcm_dma_xfer_desc {
> > > +     const u8 *out;
> > > +     u8 *in;
> > > +     u32 len;
> > > +     bool rnw;
> > > +     bool end;
> > > +};
> > > +/**
> > > + * struct npcm_i3c_master - npcm845 I3C Master structure
> > > + * @base: I3C master controller
> > > + * @dev: Corresponding device
> > > + * @regs: Memory mapping
> > > + * @saved_regs: Volatile values for PM operations
> > > + * @free_slots: Bit array of available slots
> > > + * @addrs: Array containing the dynamic addresses of each attached device
> > > + * @descs: Array of descriptors, one per attached device
> > > + * @hj_work: Hot-join work
> > > + * @irq: Main interrupt
> > > + * @pclk: System clock
> > > + * @fclk: Fast clock (bus)
> > > + * @sclk: Slow clock (other events)
> > > + * @xferqueue: Transfer queue structure
> > > + * @xferqueue.list: List member
> > > + * @xferqueue.cur: Current ongoing transfer
> > > + * @xferqueue.lock: Queue lock
> > > + * @ibi: IBI structure
> > > + * @ibi.num_slots: Number of slots available in @ibi.slots
> > > + * @ibi.slots: Available IBI slots
> > > + * @ibi.tbq_slot: To be queued IBI slot
> > > + * @ibi.lock: IBI lock
> > > + * @lock: Transfer lock, prevent concurrent daa/priv_xfer/ccc
> > > + * @req_lock: protect between IBI isr and bus operation request
> > > + */
> > > +struct npcm_i3c_master {
> > > +     struct i3c_master_controller base;
> > > +     struct device *dev;
> > > +     void __iomem *regs;
> > > +     struct npcm_i3c_regs_save saved_regs;
> > > +     u32 free_slots;
> > > +     u8 addrs[NPCM_I3C_MAX_DEVS];
> > > +     struct i3c_dev_desc *descs[NPCM_I3C_MAX_DEVS];
> > > +     struct work_struct hj_work;
> > > +     int irq;
> > > +     struct clk *pclk;
> > > +     struct clk *fclk;
> > > +     struct {
> > > +             u32 i3c_pp_hi;
> > > +             u32 i3c_pp_lo;
> > > +             u32 i3c_pp_sda_rd_skew;
> > > +             u32 i3c_pp_sda_wr_skew;
> > > +             u32 i3c_od_hi;
> > > +             u32 i3c_od_lo;
> > > +     } scl_timing;
> > > +     struct {
> > > +             struct list_head list;
> > > +             struct npcm_i3c_xfer *cur;
> > > +     } xferqueue;
> > > +     struct {
> > > +             unsigned int num_slots;
> > > +             struct i3c_dev_desc **slots;
> > > +             struct i3c_ibi_slot *tbq_slot;
> > > +             /* Prevent races within IBI handlers */
> > > +             spinlock_t lock;
> > > +     } ibi;
> > > +     spinlock_t req_lock;
> > > +     struct mutex lock;
> > > +     struct dentry *debugfs;
> > > +
> > > +     /* For DMA */
> > > +     void __iomem *dma_regs;
> > > +     void __iomem *dma_ctl_regs;
> > > +     bool use_dma;
> > > +     struct completion xfer_comp;
> > > +     char *dma_tx_buf;
> > > +     char *dma_rx_buf;
> > > +     dma_addr_t dma_tx_addr;
> > > +     dma_addr_t dma_rx_addr;
> > > +     struct npcm_dma_xfer_desc dma_xfer;
> > > +
> > > +     bool en_hj;
> > > +};
> > > +
> > > +/**
> > > + * struct npcm_i3c_i2c_dev_data - Device specific data
> > > + * @index: Index in the master tables corresponding to this device
> > > + * @ibi: IBI slot index in the master structure
> > > + * @ibi_pool: IBI pool associated to this device
> > > + */
> > > +struct npcm_i3c_i2c_dev_data {
> > > +     u8 index;
> > > +     int ibi;
> > > +     struct i3c_generic_ibi_pool *ibi_pool;
> > > +};
> > > +
> > > +static DEFINE_MUTEX(npcm_i3c_dma_lock);
> >
> > Why need globel lock for dma?
> >
> > > +
> > > +static int npcm_i3c_master_wait_for_complete(struct npcm_i3c_master *master);
> > > +static void npcm_i3c_master_stop_dma(struct npcm_i3c_master *master);
> >
> > Is it possible reorder function to avoid declear function here?
> >
> > > +
> > > +static void npcm_i3c_master_dma_lock(void)
> > > +{
> > > +     mutex_lock(&npcm_i3c_dma_lock);
> > > +}
> > > +
> > > +static void npcm_i3c_master_dma_unlock(void)
> > > +{
> > > +     mutex_unlock(&npcm_i3c_dma_lock);
> > > +}
> >
> > I think above two help functions is not nesseceary at all.
> >
> > > +
> > > +static bool npcm_i3c_master_error(struct npcm_i3c_master *master)
> > > +{
> > > +     u32 mstatus, merrwarn;
> > > +
> > > +     mstatus = readl(master->regs + NPCM_I3C_MSTATUS);
> > > +     if (NPCM_I3C_MSTATUS_ERRWARN(mstatus)) {
> > > +             merrwarn = readl(master->regs + NPCM_I3C_MERRWARN);
> > > +             writel(merrwarn, master->regs + NPCM_I3C_MERRWARN);
> > > +
> > > +             /* Ignore timeout error */
> > > +             if (merrwarn & NPCM_I3C_MERRWARN_TIMEOUT) {
> > > +                     dev_dbg(master->dev, "Warning condition: MSTATUS 0x%08x, MERRWARN 0x%08x\n",
> > > +                             mstatus, merrwarn);
> > > +                     return false;
> > > +             }
> > > +
> > > +             dev_err(master->dev,
> > > +                     "Error condition: MSTATUS 0x%08x, MERRWARN 0x%08x\n",
> > > +                     mstatus, merrwarn);
> > > +
> > > +             return true;
> > > +     }
> > > +
> > > +     return false;
> > > +}
> > > +
> > > +static void npcm_i3c_master_set_sda_skew(struct npcm_i3c_master *master, int skew)
> > > +{
> > > +     u32 val;
> > > +
> > > +     val = readl(master->regs + NPCM_I3C_MCONFIG) & ~NPCM_I3C_MCONFIG_SKEW_MASK;
> > > +     val |= NPCM_I3C_MCONFIG_SKEW(skew);
> > > +     writel(val, master->regs + NPCM_I3C_MCONFIG);
> > > +}
> > > +
> > > +static void npcm_i3c_master_enable_interrupts(struct npcm_i3c_master *master, u32 mask)
> > > +{
> > > +     writel(mask, master->regs + NPCM_I3C_MINTSET);
> > > +}
> > > +
> > > +static void npcm_i3c_master_disable_interrupts(struct npcm_i3c_master *master)
> > > +{
> > > +     u32 mask = readl(master->regs + NPCM_I3C_MINTSET);
> > > +
> > > +     writel(mask, master->regs + NPCM_I3C_MINTCLR);
> > > +}
> > > +
> > > +static void npcm_i3c_master_clear_merrwarn(struct npcm_i3c_master *master)
> > > +{
> > > +     /* Clear pending warnings */
> > > +     writel(readl(master->regs + NPCM_I3C_MERRWARN),
> > > +            master->regs + NPCM_I3C_MERRWARN);
> > > +}
> > > +
> > > +static void npcm_i3c_master_flush_fifo(struct npcm_i3c_master *master)
> > > +{
> > > +     /* Flush FIFOs */
> > > +     writel(NPCM_I3C_MDATACTRL_FLUSHTB | NPCM_I3C_MDATACTRL_FLUSHRB,
> > > +            master->regs + NPCM_I3C_MDATACTRL);
> > > +}
> > > +
> > > +static void npcm_i3c_master_flush_rx_fifo(struct npcm_i3c_master *master)
> > > +{
> > > +     writel(NPCM_I3C_MDATACTRL_FLUSHRB, master->regs + NPCM_I3C_MDATACTRL);
> > > +}
> > > +
> > > +static void npcm_i3c_master_reset_fifo_trigger(struct npcm_i3c_master *master)
> > > +{
> > > +     u32 reg;
> > > +
> > > +     /* Set RX and TX tigger levels, flush FIFOs */
> > > +     reg = NPCM_I3C_MDATACTRL_FLUSHTB |
> > > +           NPCM_I3C_MDATACTRL_FLUSHRB |
> > > +           NPCM_I3C_MDATACTRL_UNLOCK_TRIG |
> > > +           NPCM_I3C_MDATACTRL_TXTRIG_FIFO_NOT_FULL |
> > > +           NPCM_I3C_MDATACTRL_RXTRIG_FIFO_NOT_EMPTY;
> > > +     writel(reg, master->regs + NPCM_I3C_MDATACTRL);
> > > +}
> > > +
> > > +static void npcm_i3c_master_reset(struct npcm_i3c_master *master)
> > > +{
> > > +     npcm_i3c_master_clear_merrwarn(master);
> > > +     npcm_i3c_master_reset_fifo_trigger(master);
> > > +     npcm_i3c_master_disable_interrupts(master);
> > > +}
> > > +
> > > +static inline struct npcm_i3c_master *
> > > +to_npcm_i3c_master(struct i3c_master_controller *master)
> > > +{
> > > +     return container_of(master, struct npcm_i3c_master, base);
> > > +}
> > > +
> > > +static void npcm_i3c_master_hj_work(struct work_struct *work)
> > > +{
> > > +     struct npcm_i3c_master *master;
> > > +
> > > +     master = container_of(work, struct npcm_i3c_master, hj_work);
> > > +
> > > +     i3c_master_do_daa(&master->base);
> > > +}
> > > +
> > > +static struct i3c_dev_desc *
> > > +npcm_i3c_master_dev_from_addr(struct npcm_i3c_master *master,
> > > +                          unsigned int ibiaddr)
> > > +{
> > > +     int i;
> > > +
> > > +     for (i = 0; i < NPCM_I3C_MAX_DEVS; i++)
> > > +             if (master->addrs[i] == ibiaddr)
> > > +                     break;
> > > +
> > > +     if (i == NPCM_I3C_MAX_DEVS)
> > > +             return NULL;
> > > +
> > > +     return master->descs[i];
> > > +}
> > > +
> > > +static void npcm_i3c_master_ack_ibi(struct npcm_i3c_master *master,
> > > +                                bool mandatory_byte)
> > > +{
> > > +     unsigned int ibi_ack_nack;
> > > +     u32 reg;
> > > +
> > > +     ibi_ack_nack = NPCM_I3C_MCTRL_REQUEST_IBI_ACKNACK;
> > > +     if (mandatory_byte)
> > > +             ibi_ack_nack |= NPCM_I3C_MCTRL_IBIRESP_ACK_WITH_BYTE |
> > > +                     NPCM_I3C_MCTRL_RDTERM(NPCM_I3C_MAX_IBI_PAYLOAD_SIZE);
> > > +     else
> > > +             ibi_ack_nack |= NPCM_I3C_MCTRL_IBIRESP_ACK_WITHOUT_BYTE;
> > > +
> > > +     writel(ibi_ack_nack, master->regs + NPCM_I3C_MCTRL);
> > > +     readl_poll_timeout(master->regs + NPCM_I3C_MSTATUS, reg,
> > > +                        NPCM_I3C_MSTATUS_MCTRLDONE(reg), 0, 1000);
> > > +}
> > > +
> > > +static void npcm_i3c_master_nack_ibi(struct npcm_i3c_master *master)
> > > +{
> > > +     u32 reg;
> > > +
> > > +     writel(NPCM_I3C_MCTRL_REQUEST_IBI_ACKNACK |
> > > +            NPCM_I3C_MCTRL_IBIRESP_NACK,
> > > +            master->regs + NPCM_I3C_MCTRL);
> > > +     readl_poll_timeout(master->regs + NPCM_I3C_MSTATUS, reg,
> > > +                        NPCM_I3C_MSTATUS_MCTRLDONE(reg), 0, 1000);
> > > +}
> > > +
> > > +static void npcm_i3c_master_emit_stop(struct npcm_i3c_master *master)
> > > +{
> > > +     u32 reg = readl(master->regs + NPCM_I3C_MSTATUS);
> > > +
> > > +     /* Do not emit stop in the IDLE or SLVREQ state */
> > > +     if (NPCM_I3C_MSTATUS_STATE_IDLE(reg) || NPCM_I3C_MSTATUS_STATE_SLVREQ(reg))
> > > +             return;
> > > +
> > > +     /*
> > > +      * The spurious IBI event may change controller state to IBIACK, switch state
> > > +      * to NORMACT before emitSTOP request.
> > > +      */
> > > +     if (NPCM_I3C_MSTATUS_STATE_IBIACK(reg)) {
> > > +             npcm_i3c_master_nack_ibi(master);
> > > +             writel(NPCM_I3C_MINT_IBIWON, master->regs + NPCM_I3C_MSTATUS);
> > > +     }
> > > +
> > > +     writel(NPCM_I3C_MCTRL_REQUEST_STOP, master->regs + NPCM_I3C_MCTRL);
> > > +     readl_poll_timeout(master->regs + NPCM_I3C_MSTATUS, reg,
> > > +                        NPCM_I3C_MSTATUS_MCTRLDONE(reg), 0, 1000);
> > > +
> > > +     /*
> > > +      * This delay is necessary after the emission of a stop, otherwise eg.
> > > +      * repeating IBIs do not get detected. There is a note in the manual
> > > +      * about it, stating that the stop condition might not be settled
> > > +      * correctly if a start condition follows too rapidly.
> > > +      */
> > > +     udelay(1);
> > > +}
> > > +
> > > +static int npcm_i3c_master_handle_ibi(struct npcm_i3c_master *master,
> > > +                                  struct i3c_dev_desc *dev)
> > > +{
> > > +     struct npcm_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> > > +     struct i3c_ibi_slot *slot;
> > > +     unsigned int count;
> > > +     u32 mdatactrl, val;
> > > +     int ret;
> > > +     u8 *buf;
> > > +
> > > +     if (!data) {
> > > +             dev_err_ratelimited(master->dev, "No data for addr 0x%x\n",
> > > +                     dev->info.dyn_addr);
> > > +             goto no_ibi_pool;
> > > +     }
> > > +
> > > +     if (!data->ibi_pool) {
> > > +             dev_err_ratelimited(master->dev, "No ibi pool for addr 0x%x\n",
> > > +                     master->addrs[data->index]);
> > > +             goto no_ibi_pool;
> > > +     }
> > > +     slot = i3c_generic_ibi_get_free_slot(data->ibi_pool);
> > > +     if (!slot) {
> > > +             dev_err_ratelimited(master->dev, "No free ibi slot\n");
> > > +             goto no_ibi_pool;
> > > +     }
> > > +
> > > +     slot->len = 0;
> > > +     buf = slot->data;
> > > +
> > > +     /*
> > > +      * Sometimes I3C HW returns to IDLE state after IBIRCV completed,
> > > +      * continue when state becomes IDLE.
> > > +      */
> > > +     ret = readl_relaxed_poll_timeout(master->regs + NPCM_I3C_MSTATUS, val,
> > > +                                      NPCM_I3C_MSTATUS_COMPLETE(val) |
> > > +                                      NPCM_I3C_MSTATUS_STATE_IDLE(val),
> > > +                                      0, 1000);
> > > +     if (ret) {
> > > +             dev_err(master->dev, "Timeout when polling for COMPLETE\n");
> > > +             if (NPCM_I3C_MSTATUS_RXPEND(val))
> > > +                     npcm_i3c_master_flush_rx_fifo(master);
> > > +             i3c_generic_ibi_recycle_slot(data->ibi_pool, slot);
> > > +             slot = NULL;
> > > +             goto handle_done;
> > > +     }
> > > +
> > > +     while (NPCM_I3C_MSTATUS_RXPEND(readl(master->regs + NPCM_I3C_MSTATUS))  &&
> > > +            slot->len < NPCM_I3C_MAX_IBI_PAYLOAD_SIZE) {
> > > +             mdatactrl = readl(master->regs + NPCM_I3C_MDATACTRL);
> > > +             count = NPCM_I3C_MDATACTRL_RXCOUNT(mdatactrl);
> > > +             readsb(master->regs + NPCM_I3C_MRDATAB, buf, count);
> > > +             slot->len += count;
> > > +             buf += count;
> > > +     }
> > > +
> > > +handle_done:
> > > +     master->ibi.tbq_slot = slot;
> > > +
> > > +     return ret;
> > > +
> > > +no_ibi_pool:
> > > +     /* No ibi pool, drop the payload if received  */
> > > +     readl_relaxed_poll_timeout(master->regs + NPCM_I3C_MSTATUS, val,
> > > +                                NPCM_I3C_MSTATUS_COMPLETE(val) |
> > > +                                NPCM_I3C_MSTATUS_STATE_IDLE(val),
> > > +                                0, 1000);
> > > +     npcm_i3c_master_flush_rx_fifo(master);
> > > +     return -ENOSPC;
> > > +}
> > > +
> > > +static int npcm_i3c_master_handle_ibiwon(struct npcm_i3c_master *master, bool autoibi)
> > > +{
> > > +     struct npcm_i3c_i2c_dev_data *data;
> > > +     unsigned int ibitype, ibiaddr;
> > > +     struct i3c_dev_desc *dev;
> > > +     u32 status;
> > > +     int ret = 0;
> > > +
> > > +     status = readl(master->regs + NPCM_I3C_MSTATUS);
> > > +     ibitype = NPCM_I3C_MSTATUS_IBITYPE(status);
> > > +     ibiaddr = NPCM_I3C_MSTATUS_IBIADDR(status);
> > > +
> > > +     dev_dbg(master->dev, "ibitype=%d ibiaddr=%d\n", ibitype, ibiaddr);
> > > +     dev_dbg(master->dev, "ibiwon: mctrl=0x%x mstatus=0x%x\n",
> > > +             readl(master->regs + NPCM_I3C_MCTRL), status);
> > > +     /* Handle the critical responses to IBI's */
> > > +     switch (ibitype) {
> > > +     case NPCM_I3C_MSTATUS_IBITYPE_IBI:
> > > +             dev = npcm_i3c_master_dev_from_addr(master, ibiaddr);
> > > +             /* Bypass the invalid ibi with address 0 */
> > > +             if (!dev || ibiaddr == 0) {
> > > +                     if (!autoibi) {
> > > +                             npcm_i3c_master_nack_ibi(master);
> > > +                             break;
> > > +                     }
> > > +                     /*
> > > +                      * Wait for complete to make sure the subsequent emitSTOP
> > > +                      * request will be performed in the correct state(NORMACT).
> > > +                      */
> > > +                     readl_relaxed_poll_timeout(master->regs + NPCM_I3C_MSTATUS, status,
> > > +                                                NPCM_I3C_MSTATUS_COMPLETE(status),
> > > +                                                0, 1000);
> > > +                     /* Flush the garbage data */
> > > +                     if (NPCM_I3C_MSTATUS_RXPEND(status))
> > > +                             npcm_i3c_master_flush_rx_fifo(master);
> > > +                     break;
> > > +             }
> > > +             if (!autoibi) {
> > > +                     if (dev->info.bcr & I3C_BCR_IBI_PAYLOAD)
> > > +                             npcm_i3c_master_ack_ibi(master, true);
> > > +                     else
> > > +                             npcm_i3c_master_ack_ibi(master, false);
> > > +             }
> > > +             npcm_i3c_master_handle_ibi(master, dev);
> > > +             break;
> > > +     case NPCM_I3C_MSTATUS_IBITYPE_HOT_JOIN:
> > > +             npcm_i3c_master_ack_ibi(master, false);
> > > +             break;
> > > +     case NPCM_I3C_MSTATUS_IBITYPE_MASTER_REQUEST:
> > > +             npcm_i3c_master_nack_ibi(master);
> > > +             status = readl(master->regs + NPCM_I3C_MSTATUS);
> > > +             /* Invalid event may be reported as MR request
> > > +              * and sometimes produce dummy bytes. Flush the garbage data.
> > > +              */
> > > +             if (NPCM_I3C_MSTATUS_RXPEND(status))
> > > +                     npcm_i3c_master_flush_rx_fifo(master);
> > > +             break;
> > > +     default:
> > > +             break;
> > > +     }
> > > +
> > > +     /*
> > > +      * If an error happened, we probably got interrupted and the exchange
> > > +      * timedout. In this case we just drop everything, emit a stop and wait
> > > +      * for the slave to interrupt again.
> > > +      */
> > > +     if (npcm_i3c_master_error(master)) {
> > > +             if (master->ibi.tbq_slot) {
> > > +                     data = i3c_dev_get_master_data(dev);
> > > +                     i3c_generic_ibi_recycle_slot(data->ibi_pool,
> > > +                                                  master->ibi.tbq_slot);
> > > +                     master->ibi.tbq_slot = NULL;
> > > +             }
> > > +
> > > +             dev_err(master->dev, "npcm_i3c_master_error in ibiwon\n");
> > > +             /*
> > > +              * No need to emit stop here because the caller should do it
> > > +              * if return error
> > > +              */
> > > +             ret = -EIO;
> > > +             goto clear_ibiwon;
> > > +     }
> > > +
> > > +     /* Handle the non critical tasks */
> > > +     switch (ibitype) {
> > > +     case NPCM_I3C_MSTATUS_IBITYPE_IBI:
> > > +             npcm_i3c_master_emit_stop(master);
> > > +             if (dev && master->ibi.tbq_slot) {
> > > +                     i3c_master_queue_ibi(dev, master->ibi.tbq_slot);
> > > +                     master->ibi.tbq_slot = NULL;
> > > +             }
> > > +             break;
> > > +     case NPCM_I3C_MSTATUS_IBITYPE_HOT_JOIN:
> > > +             /* Emit stop to avoid the INVREQ error after DAA process */
> > > +             npcm_i3c_master_emit_stop(master);
> > > +             queue_work(master->base.wq, &master->hj_work);
> > > +             break;
> > > +     case NPCM_I3C_MSTATUS_IBITYPE_MASTER_REQUEST:
> > > +             ret = -EOPNOTSUPP;
> > > +     default:
> > > +             break;
> > > +     }
> > > +
> > > +clear_ibiwon:
> > > +     /* clear IBIWON status */
> > > +     writel(NPCM_I3C_MINT_IBIWON, master->regs + NPCM_I3C_MSTATUS);
> > > +     return ret;
> > > +}
> > > +
> > > +static void npcm_i3c_master_ibi_isr(struct npcm_i3c_master *master)
> > > +{
> > > +     u32 val, mstatus;
> > > +     int ret;
> > > +
> > > +     spin_lock(&master->req_lock);
> > > +
> > > +     /* Check slave ibi handled not yet */
> > > +     mstatus = readl(master->regs + NPCM_I3C_MSTATUS);
> > > +     if (!NPCM_I3C_MSTATUS_STATE_SLVREQ(mstatus))
> > > +             goto ibi_out;
> > > +
> > > +     /*
> > > +      * IBIWON may be set before NPCM_I3C_MCTRL_REQUEST_AUTO_IBI, causing
> > > +      * readl_relaxed_poll_timeout() to return immediately. Consequently,
> > > +      * ibitype will be 0 since it was last updated only after the 8th SCL
> > > +      * cycle, leading to missed client IBI handlers.
> > > +      *
> > > +      * Clear NPCM_I3C_MINT_IBIWON before sending NPCM_I3C_MCTRL_REQUEST_AUTO_IBI.
> > > +      */
> > > +     writel(NPCM_I3C_MINT_IBIWON, master->regs + NPCM_I3C_MSTATUS);
> > > +
> > > +     /* Acknowledge the incoming interrupt with the AUTOIBI mechanism */
> > > +     writel(NPCM_I3C_MCTRL_REQUEST_AUTO_IBI |
> > > +            NPCM_I3C_MCTRL_IBIRESP_AUTO |
> > > +            NPCM_I3C_MCTRL_RDTERM(NPCM_I3C_MAX_IBI_PAYLOAD_SIZE),
> > > +            master->regs + NPCM_I3C_MCTRL);
> > > +
> > > +     /* Wait for IBIWON, should take approximately 100us */
> > > +     ret = readl_relaxed_poll_timeout_atomic(master->regs + NPCM_I3C_MSTATUS, val,
> > > +                                      NPCM_I3C_MSTATUS_IBIWON(val), 0, 1000);
> > > +     if (ret) {
> > > +             /* Cancel AUTOIBI if not started */
> > > +             val = readl(master->regs + NPCM_I3C_MCTRL);
> > > +             if (NPCM_I3C_MCTRL_REQUEST(val) == NPCM_I3C_MCTRL_REQUEST_AUTO_IBI)
> > > +                     writel(0, master->regs + NPCM_I3C_MCTRL);
> > > +             dev_err(master->dev, "Timeout when polling for IBIWON\n");
> > > +             npcm_i3c_master_clear_merrwarn(master);
> > > +             npcm_i3c_master_emit_stop(master);
> > > +             goto ibi_out;
> > > +     }
> > > +
> > > +     if (npcm_i3c_master_handle_ibiwon(master, true))
> > > +             npcm_i3c_master_emit_stop(master);
> > > +ibi_out:
> > > +     spin_unlock(&master->req_lock);
> > > +}
> > > +
> > > +static irqreturn_t npcm_i3c_master_irq_handler(int irq, void *dev_id)
> > > +{
> > > +     struct npcm_i3c_master *master = (struct npcm_i3c_master *)dev_id;
> > > +     u32 active = readl(master->regs + NPCM_I3C_MINTMASKED), mstatus;
> > > +
> > > +     if (NPCM_I3C_MSTATUS_COMPLETE(active)) {
> > > +             /* Clear COMPLETE status before emit STOP */
> > > +             writel(NPCM_I3C_MINT_COMPLETE, master->regs + NPCM_I3C_MSTATUS);
> > > +             /* Disable COMPLETE interrupt */
> > > +             writel(NPCM_I3C_MINT_COMPLETE, master->regs + NPCM_I3C_MINTCLR);
> > > +
> > > +             if (master->dma_xfer.end) {
> > > +                     /* Stop DMA to prevent receiving the data of other transaction */
> > > +                     npcm_i3c_master_stop_dma(master);
> > > +                     npcm_i3c_master_set_sda_skew(master, 0);
> > > +                     npcm_i3c_master_emit_stop(master);
> > > +             }
> > > +
> > > +             complete(&master->xfer_comp);
> > > +
> > > +             return IRQ_HANDLED;
> > > +     }
> > > +
> > > +     if (NPCM_I3C_MSTATUS_SLVSTART(active)) {
> > > +             /* Clear the interrupt status */
> > > +             writel(NPCM_I3C_MINT_SLVSTART, master->regs + NPCM_I3C_MSTATUS);
> > > +
> > > +             /* Read I3C state */
> > > +             mstatus = readl(master->regs + NPCM_I3C_MSTATUS);
> > > +
> > > +             if (NPCM_I3C_MSTATUS_STATE_SLVREQ(mstatus)) {
> > > +                     npcm_i3c_master_ibi_isr(master);
> > > +             } else {
> > > +                     /*
> > > +                      * Workaround:
> > > +                      * SlaveStart event under bad signals condition. SLVSTART bit in
> > > +                      * MSTATUS may set even slave device doesn't holding I3C_SDA low,
> > > +                      * but actual SlaveStart event may happened concurently in this
> > > +                      * bad signals condition handler. Give a chance to check current
> > > +                      * work state and intmask to avoid actual SlaveStart cannot be
> > > +                      * trigger after we clear SlaveStart interrupt status.
> > > +                      */
> > > +
> > > +                     /* Check if state change after we clear interrupt status */
> > > +                     active = readl(master->regs + NPCM_I3C_MINTMASKED);
> > > +                     mstatus = readl(master->regs + NPCM_I3C_MSTATUS);
> > > +
> > > +                     if (NPCM_I3C_MSTATUS_STATE_SLVREQ(mstatus)) {
> > > +                             if (!NPCM_I3C_MSTATUS_SLVSTART(active))
> > > +                                     npcm_i3c_master_ibi_isr(master);
> > > +                             /* else: handle interrupt in next time */
> > > +                     }
> > > +             }
> > > +     }
> > > +
> > > +     return IRQ_HANDLED;
> > > +}
> > > +
> > > +static int npcm_i3c_master_bus_init(struct i3c_master_controller *m)
> > > +{
> > > +     struct npcm_i3c_master *master = to_npcm_i3c_master(m);
> > > +     struct i3c_bus *bus = i3c_master_get_bus(m);
> > > +     struct i3c_device_info info = {};
> > > +     unsigned long fclk_rate, fclk_period_ns;
> > > +     unsigned long i3c_scl_rate, i2c_scl_rate;
> > > +     unsigned int pp_high_period_ns, od_low_period_ns, i2c_period_ns;
> > > +     unsigned int scl_period_ns;
> > > +     u32 ppbaud, pplow, odhpp, odbaud, i2cbaud, reg;
> > > +     int ret;
> > > +
> > > +     /* Timings derivation */
> > > +     fclk_rate = clk_get_rate(master->fclk);
> > > +     if (!fclk_rate)
> > > +             return -EINVAL;
> > > +
> > > +     fclk_period_ns = DIV_ROUND_UP(1000000000, fclk_rate);
> > > +
> > > +     /*
> > > +      * Configure for Push-Pull mode.
> > > +      */
> > > +     if (master->scl_timing.i3c_pp_hi >= I3C_SCL_PP_PERIOD_NS_MIN &&
> > > +         master->scl_timing.i3c_pp_lo >= master->scl_timing.i3c_pp_hi) {
> > > +             ppbaud = DIV_ROUND_UP(master->scl_timing.i3c_pp_hi, fclk_period_ns) - 1;
> > > +             if (ppbaud > NPCM_I3C_MAX_PPBAUD)
> > > +                     ppbaud = NPCM_I3C_MAX_PPBAUD;
> > > +             pplow = DIV_ROUND_UP(master->scl_timing.i3c_pp_lo, fclk_period_ns)
> > > +                     - (ppbaud + 1);
> > > +             if (pplow > NPCM_I3C_MAX_PPLOW)
> > > +                     pplow = NPCM_I3C_MAX_PPLOW;
> > > +             bus->scl_rate.i3c = 1000000000 / (((ppbaud + 1) * 2 + pplow) * fclk_period_ns);
> > > +     } else {
> > > +             scl_period_ns = DIV_ROUND_UP(1000000000, bus->scl_rate.i3c);
> > > +             if (bus->scl_rate.i3c == 10000000) {
> > > +                     /* Workaround for npcm8xx: 40/60 ns */
> > > +                     ppbaud = DIV_ROUND_UP(40, fclk_period_ns) - 1;
> > > +                     pplow = DIV_ROUND_UP(20, fclk_period_ns);
> > > +             } else {
> > > +                     /* 50% duty-cycle */
> > > +                     ppbaud = DIV_ROUND_UP((scl_period_ns / 2), fclk_period_ns) - 1;
> > > +                     pplow = 0;
> > > +             }
> > > +             if (ppbaud > NPCM_I3C_MAX_PPBAUD)
> > > +                     ppbaud = NPCM_I3C_MAX_PPBAUD;
> > > +     }
> > > +     pp_high_period_ns = (ppbaud + 1) * fclk_period_ns;
> > > +
> > > +     /*
> > > +      * Configure for Open-Drain mode.
> > > +      */
> > > +     if (master->scl_timing.i3c_od_hi >= pp_high_period_ns &&
> > > +         master->scl_timing.i3c_od_lo >= I3C_SCL_OD_LOW_PERIOD_NS_MIN) {
> > > +             if (master->scl_timing.i3c_od_hi == pp_high_period_ns)
> > > +                     odhpp = 1;
> > > +             else
> > > +                     odhpp = 0;
> > > +             odbaud = DIV_ROUND_UP(master->scl_timing.i3c_od_lo, pp_high_period_ns) - 1;
> > > +     } else {
> > > +             /* Set default OD timing: 1MHz/1000ns with 50% duty cycle */
> > > +             odhpp = 0;
> > > +             odbaud = DIV_ROUND_UP(500, pp_high_period_ns) - 1;
> > > +     }
> > > +     if (odbaud > NPCM_I3C_MAX_ODBAUD)
> > > +             odbaud = NPCM_I3C_MAX_ODBAUD;
> > > +     od_low_period_ns = (odbaud + 1) * pp_high_period_ns;
> > > +
> > > +     /* Configure for I2C mode */
> > > +     i2c_period_ns = DIV_ROUND_UP(1000000000, bus->scl_rate.i2c);
> > > +     if (i2c_period_ns < od_low_period_ns * 2)
> > > +             i2c_period_ns = od_low_period_ns * 2;
> > > +     i2cbaud = DIV_ROUND_UP(i2c_period_ns, od_low_period_ns) - 2;
> > > +     if (i2cbaud > NPCM_I3C_MAX_I2CBAUD)
> > > +             i2cbaud = NPCM_I3C_MAX_I2CBAUD;
> > > +
> > > +     i3c_scl_rate = 1000000000 / (((ppbaud + 1) * 2 + pplow) * fclk_period_ns);
> > > +     i2c_scl_rate = 1000000000 / ((i2cbaud + 2) * od_low_period_ns);
> > > +
> > > +     reg = NPCM_I3C_MCONFIG_MASTER_EN |
> > > +           NPCM_I3C_MCONFIG_DISTO(0) |
> > > +           NPCM_I3C_MCONFIG_HKEEP(3) |
> > > +           NPCM_I3C_MCONFIG_ODSTOP(1) |
> > > +           NPCM_I3C_MCONFIG_PPBAUD(ppbaud) |
> > > +           NPCM_I3C_MCONFIG_PPLOW(pplow) |
> > > +           NPCM_I3C_MCONFIG_ODBAUD(odbaud) |
> > > +           NPCM_I3C_MCONFIG_ODHPP(odhpp) |
> > > +           NPCM_I3C_MCONFIG_SKEW(0) |
> > > +           NPCM_I3C_MCONFIG_I2CBAUD(i2cbaud);
> > > +     writel(reg, master->regs + NPCM_I3C_MCONFIG);
> > > +
> > > +     dev_dbg(master->dev, "dts: i3c rate=%lu, i2c rate=%lu\n",
> > > +             bus->scl_rate.i3c, bus->scl_rate.i2c);
> > > +     dev_info(master->dev, "fclk=%lu, period_ns=%lu\n", fclk_rate, fclk_period_ns);
> > > +     dev_info(master->dev, "i3c scl_rate=%lu\n", i3c_scl_rate);
> > > +     dev_info(master->dev, "i2c scl_rate=%lu\n", i2c_scl_rate);
> > > +     dev_info(master->dev, "pp_high=%u, pp_low=%lu\n", pp_high_period_ns,
> > > +                     (ppbaud + 1 + pplow) * fclk_period_ns);
> > > +     dev_info(master->dev, "pp_sda_rd_skew=%d, pp_sda_wr_skew=%d\n",
> > > +                     master->scl_timing.i3c_pp_sda_rd_skew,
> > > +                     master->scl_timing.i3c_pp_sda_wr_skew);
> > > +     dev_info(master->dev, "od_high=%d, od_low=%d\n",
> > > +                     odhpp ? pp_high_period_ns : od_low_period_ns, od_low_period_ns);
> > > +     dev_dbg(master->dev, "i2c_high=%u, i2c_low=%u\n", ((i2cbaud >> 1) + 1) * od_low_period_ns,
> > > +                     ((i2cbaud >> 1) + 1 + (i2cbaud % 2)) * od_low_period_ns);
> > > +     dev_dbg(master->dev, "ppbaud=%d, pplow=%d, odbaud=%d, i2cbaud=%d\n",
> > > +             ppbaud, pplow, odbaud, i2cbaud);
> > > +     dev_info(master->dev, "mconfig=0x%x\n", readl(master->regs + NPCM_I3C_MCONFIG));
> > > +     /* Master core's registration */
> > > +     ret = i3c_master_get_free_addr(m, 0);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > > +     info.dyn_addr = ret;
> > > +     reg = readl(master->regs + NPCM_I3C_VENDORID);
> > > +     info.pid = (NPCM_I3C_VENDORID_VID(reg) << 33) | readl(master->regs + NPCM_I3C_PARTNO);
> > > +
> > > +     writel(NPCM_MDYNADDR_VALID | NPCM_MDYNADDR_ADDR(info.dyn_addr),
> > > +            master->regs + NPCM_I3C_MDYNADDR);
> > > +
> > > +     ret = i3c_master_set_info(&master->base, &info);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static void npcm_i3c_master_bus_cleanup(struct i3c_master_controller *m)
> > > +{
> > > +     struct npcm_i3c_master *master = to_npcm_i3c_master(m);
> > > +
> > > +     npcm_i3c_master_disable_interrupts(master);
> > > +
> > > +     /* Disable master */
> > > +     writel(0, master->regs + NPCM_I3C_MCONFIG);
> > > +}
> > > +
> > > +static int npcm_i3c_master_reserve_slot(struct npcm_i3c_master *master)
> > > +{
> > > +     unsigned int slot;
> > > +
> > > +     if (!(master->free_slots & GENMASK(NPCM_I3C_MAX_DEVS - 1, 0)))
> > > +             return -ENOSPC;
> > > +
> > > +     slot = ffs(master->free_slots) - 1;
> > > +
> > > +     master->free_slots &= ~BIT(slot);
> > > +
> > > +     return slot;
> > > +}
> > > +
> > > +static void npcm_i3c_master_release_slot(struct npcm_i3c_master *master,
> > > +                                     unsigned int slot)
> > > +{
> > > +     master->free_slots |= BIT(slot);
> > > +}
> > > +
> > > +static int npcm_i3c_master_attach_i3c_dev(struct i3c_dev_desc *dev)
> > > +{
> > > +     struct i3c_master_controller *m = i3c_dev_get_master(dev);
> > > +     struct npcm_i3c_master *master = to_npcm_i3c_master(m);
> > > +     struct npcm_i3c_i2c_dev_data *data;
> > > +     int slot;
> > > +
> > > +     slot = npcm_i3c_master_reserve_slot(master);
> > > +     if (slot < 0)
> > > +             return slot;
> > > +
> > > +     data = kzalloc(sizeof(*data), GFP_KERNEL);
> > > +     if (!data) {
> > > +             npcm_i3c_master_release_slot(master, slot);
> > > +             return -ENOMEM;
> > > +     }
> > > +
> > > +     data->ibi = -1;
> > > +     data->index = slot;
> > > +     master->addrs[slot] = dev->info.dyn_addr ? dev->info.dyn_addr :
> > > +                                                dev->info.static_addr;
> > > +     master->descs[slot] = dev;
> > > +
> > > +     i3c_dev_set_master_data(dev, data);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int npcm_i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
> > > +                                        u8 old_dyn_addr)
> > > +{
> > > +     struct i3c_master_controller *m = i3c_dev_get_master(dev);
> > > +     struct npcm_i3c_master *master = to_npcm_i3c_master(m);
> > > +     struct npcm_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> > > +
> > > +     master->addrs[data->index] = dev->info.dyn_addr ? dev->info.dyn_addr :
> > > +                                                       dev->info.static_addr;
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static void npcm_i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
> > > +{
> > > +     struct npcm_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> > > +     struct i3c_master_controller *m = i3c_dev_get_master(dev);
> > > +     struct npcm_i3c_master *master = to_npcm_i3c_master(m);
> > > +
> > > +     master->addrs[data->index] = 0;
> > > +     npcm_i3c_master_release_slot(master, data->index);
> > > +
> > > +     kfree(data);
> > > +}
> > > +
> > > +static int npcm_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
> > > +{
> > > +     struct i3c_master_controller *m = i2c_dev_get_master(dev);
> > > +     struct npcm_i3c_master *master = to_npcm_i3c_master(m);
> > > +     struct npcm_i3c_i2c_dev_data *data;
> > > +     int slot;
> > > +
> > > +     slot = npcm_i3c_master_reserve_slot(master);
> > > +     if (slot < 0)
> > > +             return slot;
> > > +
> > > +     data = kzalloc(sizeof(*data), GFP_KERNEL);
> > > +     if (!data) {
> > > +             npcm_i3c_master_release_slot(master, slot);
> > > +             return -ENOMEM;
> > > +     }
> > > +
> > > +     data->index = slot;
> > > +     master->addrs[slot] = dev->addr;
> > > +
> > > +     i2c_dev_set_master_data(dev, data);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static void npcm_i3c_master_detach_i2c_dev(struct i2c_dev_desc *dev)
> > > +{
> > > +     struct npcm_i3c_i2c_dev_data *data = i2c_dev_get_master_data(dev);
> > > +     struct i3c_master_controller *m = i2c_dev_get_master(dev);
> > > +     struct npcm_i3c_master *master = to_npcm_i3c_master(m);
> > > +
> > > +     npcm_i3c_master_release_slot(master, data->index);
> > > +
> > > +     kfree(data);
> > > +}
> > > +
> > > +static int npcm_i3c_master_readb(struct npcm_i3c_master *master, u8 *dst,
> > > +                             unsigned int len)
> > > +{
> > > +     int ret, i;
> > > +     u32 reg;
> > > +
> > > +     for (i = 0; i < len; i++) {
> > > +             ret = readl_poll_timeout_atomic(master->regs + NPCM_I3C_MSTATUS,
> > > +                                             reg,
> > > +                                             NPCM_I3C_MSTATUS_RXPEND(reg),
> > > +                                             0, 1000);
> > > +             if (ret)
> > > +                     return ret;
> > > +
> > > +             dst[i] = readl(master->regs + NPCM_I3C_MRDATAB);
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int npcm_i3c_master_do_daa_locked(struct npcm_i3c_master *master,
> > > +                                     u8 *addrs, unsigned int *count)
> > > +{
> > > +     u64 prov_id[NPCM_I3C_MAX_DEVS] = {}, nacking_prov_id = 0;
> > > +     unsigned int dev_nb = 0, last_addr = 0;
> > > +     unsigned long start = jiffies;
> > > +     u32 reg;
> > > +     int ret, i;
> > > +     int dyn_addr;
> > > +
> > > +     npcm_i3c_master_flush_fifo(master);
> > > +
> > > +     while (true) {
> > > +             /* Enter/proceed with DAA */
> > > +             writel(NPCM_I3C_MCTRL_REQUEST_PROC_DAA |
> > > +                    NPCM_I3C_MCTRL_TYPE_I3C |
> > > +                    NPCM_I3C_MCTRL_IBIRESP_MANUAL |
> > > +                    NPCM_I3C_MCTRL_DIR(NPCM_I3C_MCTRL_DIR_WRITE),
> > > +                    master->regs + NPCM_I3C_MCTRL);
> > > +
> > > +             /*
> > > +              * Either one slave will send its ID, or the assignment process
> > > +              * is done.
> > > +              */
> > > +             ret = readl_relaxed_poll_timeout_atomic(master->regs + NPCM_I3C_MSTATUS,
> > > +                                             reg,
> > > +                                             NPCM_I3C_MSTATUS_RXPEND(reg) |
> > > +                                             NPCM_I3C_MSTATUS_MCTRLDONE(reg),
> > > +                                             0, 1000);
> > > +             if (ret)
> > > +                     return ret;
> > > +
> > > +             if (time_after(jiffies, start + msecs_to_jiffies(3000))) {
> > > +                     npcm_i3c_master_emit_stop(master);
> > > +                     dev_info(master->dev, "do_daa expired\n");
> > > +                     break;
> > > +             }
> > > +             /* runtime do_daa may ibiwon by others slave devices */
> > > +             if (NPCM_I3C_MSTATUS_IBIWON(reg)) {
> > > +                     ret = npcm_i3c_master_handle_ibiwon(master, false);
> > > +                     if (ret) {
> > > +                             dev_err(master->dev, "daa: handle ibi event fail, ret=%d\n", ret);
> > > +                             return ret;
> > > +                     }
> > > +                     continue;
> > > +             }
> > > +
> > > +             if (dev_nb == NPCM_I3C_MAX_DEVS) {
> > > +                     npcm_i3c_master_emit_stop(master);
> > > +                     dev_info(master->dev, "Reach max devs\n");
> > > +                     break;
> > > +             }
> > > +             if (NPCM_I3C_MSTATUS_RXPEND(reg)) {
> > > +                     u8 data[6];
> > > +
> > > +                     /* Give the slave device a suitable dynamic address */
> > > +                     dyn_addr = i3c_master_get_free_addr(&master->base, last_addr + 1);
> > > +                     if (dyn_addr < 0)
> > > +                             return dyn_addr;
> > > +                     writel(dyn_addr, master->regs + NPCM_I3C_MWDATAB);
> > > +
> > > +                     /*
> > > +                      * We only care about the 48-bit provisional ID yet to
> > > +                      * be sure a device does not nack an address twice.
> > > +                      * Otherwise, we would just need to flush the RX FIFO.
> > > +                      */
> > > +                     ret = npcm_i3c_master_readb(master, data, 6);
> > > +                     if (ret)
> > > +                             return ret;
> > > +
> > > +                     for (i = 0; i < 6; i++)
> > > +                             prov_id[dev_nb] |= (u64)(data[i]) << (8 * (5 - i));
> > > +
> > > +                     /* We do not care about the BCR and DCR yet */
> > > +                     ret = npcm_i3c_master_readb(master, data, 2);
> > > +                     if (ret)
> > > +                             return ret;
> > > +             } else if (NPCM_I3C_MSTATUS_MCTRLDONE(reg)) {
> > > +                     if ((NPCM_I3C_MSTATUS_STATE_IDLE(reg) |
> > > +                          NPCM_I3C_MSTATUS_STATE_SLVREQ(reg)) &&
> > > +                         NPCM_I3C_MSTATUS_COMPLETE(reg)) {
> > > +                             /*
> > > +                              * Sometimes the controller state is SLVREQ after
> > > +                              * DAA request completed, treat it as normal end.
> > > +                              *
> > > +                              * All devices received and acked they dynamic
> > > +                              * address, this is the natural end of the DAA
> > > +                              * procedure.
> > > +                              */
> > > +                             break;
> > > +                     } else if (NPCM_I3C_MSTATUS_NACKED(reg)) {
> > > +                             /* No I3C devices attached */
> > > +                             if (dev_nb == 0) {
> > > +                                     npcm_i3c_master_emit_stop(master);
> > > +                                     break;
> > > +                             }
> > > +
> > > +                             /*
> > > +                              * A slave device nacked the address, this is
> > > +                              * allowed only once, DAA will be stopped and
> > > +                              * then resumed. The same device is supposed to
> > > +                              * answer again immediately and shall ack the
> > > +                              * address this time.
> > > +                              */
> > > +                             if (prov_id[dev_nb] == nacking_prov_id)
> > > +                                     return -EIO;
> > > +
> > > +                             dev_nb--;
> > > +                             nacking_prov_id = prov_id[dev_nb];
> > > +                             npcm_i3c_master_emit_stop(master);
> > > +
> > > +                             continue;
> > > +                     } else {
> > > +                             return -EIO;
> > > +                     }
> > > +             }
> > > +
> > > +             /* Wait for the slave to be ready to receive its address */
> > > +             ret = readl_poll_timeout_atomic(master->regs + NPCM_I3C_MSTATUS,
> > > +                                             reg,
> > > +                                             NPCM_I3C_MSTATUS_MCTRLDONE(reg) &&
> > > +                                             NPCM_I3C_MSTATUS_STATE_DAA(reg) &&
> > > +                                             NPCM_I3C_MSTATUS_BETWEEN(reg),
> > > +                                             0, 1000);
> > > +             if (ret)
> > > +                     return ret;
> > > +
> > > +             addrs[dev_nb] = dyn_addr;
> > > +             dev_dbg(master->dev, "DAA: device %d assigned to 0x%02x\n",
> > > +                     dev_nb, addrs[dev_nb]);
> > > +             last_addr = addrs[dev_nb++];
> > > +     }
> > > +
> > > +     *count = dev_nb;
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int npcm_i3c_update_ibirules(struct npcm_i3c_master *master)
> > > +{
> > > +     struct i3c_dev_desc *dev;
> > > +     u32 reg_mbyte = 0, reg_nobyte = NPCM_I3C_IBIRULES_NOBYTE;
> > > +     unsigned int mbyte_addr_ok = 0, mbyte_addr_ko = 0, nobyte_addr_ok = 0,
> > > +             nobyte_addr_ko = 0;
> > > +     bool list_mbyte = false, list_nobyte = false;
> > > +
> > > +     /* Create the IBIRULES register for both cases */
> > > +     i3c_bus_for_each_i3cdev(&master->base.bus, dev) {
> > > +             if (I3C_BCR_DEVICE_ROLE(dev->info.bcr) == I3C_BCR_I3C_MASTER) {
> > > +                     if (!(dev->info.bcr & I3C_BCR_IBI_REQ_CAP))
> > > +                             continue;
> > > +             }
> > > +
> > > +             if (dev->info.bcr & I3C_BCR_IBI_PAYLOAD) {
> > > +                     reg_mbyte |= NPCM_I3C_IBIRULES_ADDR(mbyte_addr_ok,
> > > +                                                        dev->info.dyn_addr);
> > > +
> > > +                     /* IBI rules cannot be applied to devices with MSb=1 */
> > > +                     if (dev->info.dyn_addr & BIT(7))
> > > +                             mbyte_addr_ko++;
> > > +                     else
> > > +                             mbyte_addr_ok++;
> > > +             } else {
> > > +                     reg_nobyte |= NPCM_I3C_IBIRULES_ADDR(nobyte_addr_ok,
> > > +                                                         dev->info.dyn_addr);
> > > +
> > > +                     /* IBI rules cannot be applied to devices with MSb=1 */
> > > +                     if (dev->info.dyn_addr & BIT(7))
> > > +                             nobyte_addr_ko++;
> > > +                     else
> > > +                             nobyte_addr_ok++;
> > > +             }
> > > +     }
> > > +
> > > +     /* Device list cannot be handled by hardware */
> > > +     if (!mbyte_addr_ko && mbyte_addr_ok <= NPCM_I3C_IBIRULES_ADDRS)
> > > +             list_mbyte = true;
> > > +
> > > +     if (!nobyte_addr_ko && nobyte_addr_ok <= NPCM_I3C_IBIRULES_ADDRS)
> > > +             list_nobyte = true;
> > > +
> > > +     /* No list can be properly handled, return an error */
> > > +     if (!list_mbyte && !list_nobyte)
> > > +             return -ERANGE;
> > > +
> > > +     /* Pick the first list that can be handled by hardware, randomly */
> > > +     if (list_mbyte)
> > > +             writel(reg_mbyte, master->regs + NPCM_I3C_IBIRULES);
> > > +     else
> > > +             writel(reg_nobyte, master->regs + NPCM_I3C_IBIRULES);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int npcm_i3c_master_do_daa(struct i3c_master_controller *m)
> > > +{
> > > +     struct npcm_i3c_master *master = to_npcm_i3c_master(m);
> > > +     u8 addrs[NPCM_I3C_MAX_DEVS];
> > > +     unsigned int dev_nb;
> > > +     unsigned long flags;
> > > +     int ret, i;
> > > +
> > > +     mutex_lock(&master->lock);
> > > +     spin_lock_irqsave(&master->req_lock, flags);
> > > +     /*
> > > +      * Fix SCL/SDA timing issue during DAA.
> > > +      * Set SKEW bit to 1 before initiating a DAA, set SKEW bit to 0
> > > +      * after DAA is completed.
> > > +      */
> > > +     npcm_i3c_master_set_sda_skew(master, 1);
> > > +     ret = npcm_i3c_master_do_daa_locked(master, addrs, &dev_nb);
> > > +     npcm_i3c_master_set_sda_skew(master, 0);
> > > +     spin_unlock_irqrestore(&master->req_lock, flags);
> > > +     mutex_unlock(&master->lock);
> > > +     if (ret) {
> > > +             npcm_i3c_master_emit_stop(master);
> > > +             npcm_i3c_master_clear_merrwarn(master);
> > > +             goto daa_out;
> > > +     }
> > > +
> > > +     /* Register all devices who participated to the core */
> > > +     for (i = 0; i < dev_nb; i++) {
> > > +             ret = i3c_master_add_i3c_dev_locked(m, addrs[i]);
> > > +             if (ret)
> > > +                     dev_err(master->dev, "Unable to add i3c dev@0x%x, err %d\n",
> > > +                             addrs[i], ret);
> > > +     }
> > > +
> > > +     /* Configure IBI auto-rules */
> > > +     ret = npcm_i3c_update_ibirules(master);
> > > +     if (ret)
> > > +             dev_err(master->dev, "Cannot handle such a list of devices");
> > > +
> > > +daa_out:
> > > +     /* No Slave ACK */
> > > +     if (ret == -EIO)
> > > +             return 0;
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static int npcm_i3c_master_read(struct npcm_i3c_master *master,
> > > +                            u8 *in, unsigned int len)
> > > +{
> > > +     int offset = 0, i;
> > > +     u32 mdctrl, mstatus;
> > > +     bool completed = false;
> > > +     unsigned int count;
> > > +     unsigned long start = jiffies;
> > > +
> > > +     while (!completed) {
> > > +             mstatus = readl(master->regs + NPCM_I3C_MSTATUS);
> > > +             if (NPCM_I3C_MSTATUS_COMPLETE(mstatus) != 0)
> > > +                     completed = true;
> > > +
> > > +             if (time_after(jiffies, start + msecs_to_jiffies(1000))) {
> > > +                     dev_dbg(master->dev, "I3C read timeout\n");
> > > +                     return -ETIMEDOUT;
> > > +             }
> > > +
> > > +             mdctrl = readl(master->regs + NPCM_I3C_MDATACTRL);
> > > +             count = NPCM_I3C_MDATACTRL_RXCOUNT(mdctrl);
> > > +             if (offset + count > len) {
> > > +                     dev_err(master->dev, "I3C receive length too long!\n");
> > > +                     return -EINVAL;
> > > +             }
> > > +             for (i = 0; i < count; i++)
> > > +                     in[offset + i] = readl(master->regs + NPCM_I3C_MRDATAB);
> > > +
> > > +             offset += count;
> > > +     }
> > > +
> > > +     return offset;
> > > +}
> > > +
> > > +static int npcm_i3c_master_write(struct npcm_i3c_master *master,
> > > +                             const u8 *out, unsigned int len)
> > > +{
> > > +     int offset = 0, ret;
> > > +     u32 mdctrl;
> > > +
> > > +     while (offset < len) {
> > > +             ret = readl_poll_timeout(master->regs + NPCM_I3C_MDATACTRL,
> > > +                                      mdctrl,
> > > +                                      !(mdctrl & NPCM_I3C_MDATACTRL_TXFULL),
> > > +                                      0, 1000);
> > > +             if (ret)
> > > +                     return ret;
> > > +
> > > +             /*
> > > +              * The last byte to be sent over the bus must either have the
> > > +              * "end" bit set or be written in MWDATABE.
> > > +              */
> > > +             if (likely(offset < (len - 1)))
> > > +                     writel(out[offset++], master->regs + NPCM_I3C_MWDATAB);
> > > +             else
> > > +                     writel(out[offset++], master->regs + NPCM_I3C_MWDATABE);
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static void npcm_i3c_master_stop_dma(struct npcm_i3c_master *master)
> > > +{
> > > +     writel(0, master->dma_regs + NPCM_GDMA_CTL(DMA_CH_TX));
> > > +     writel(0, master->dma_regs + NPCM_GDMA_CTL(DMA_CH_RX));
> > > +     writel(0, master->regs + NPCM_I3C_MDMACTRL);
> > > +
> > > +     /* Disable COMPLETE interrupt */
> > > +     writel(NPCM_I3C_MINT_COMPLETE, master->regs + NPCM_I3C_MINTCLR);
> > > +}
> > > +
> > > +static void npcm_i3c_master_write_dma_table(const u8 *src, u32 *dst, int len)
> > > +{
> > > +     int i;
> > > +
> > > +     if (len > MAX_DMA_COUNT)
> > > +             return;
> > > +
> > > +     for (i = 0; i < len; i++)
> > > +             dst[i] = (u32)src[i] & 0xFF;
> > > +
> > > +     /* Set end bit for last byte */
> > > +     dst[len - 1] |= 0x100;
> > > +}
> > > +
> > > +static int npcm_i3c_master_start_dma(struct npcm_i3c_master *master)
> > > +{
> > > +     struct npcm_dma_xfer_desc *xfer = &master->dma_xfer;
> > > +     int ch = xfer->rnw ? DMA_CH_RX : DMA_CH_TX;
> > > +     u32 val;
> > > +
> > > +     if (!xfer->len)
> > > +             return 0;
> > > +
> > > +     dev_dbg(master->dev, "start dma for %s, count %d\n",
> > > +             xfer->rnw ? "R" : "W", xfer->len);
> > > +
> > > +     /* Set DMA transfer count */
> > > +     writel(xfer->len, master->dma_regs + NPCM_GDMA_TCNT(ch));
> > > +
> > > +     /* Write data to DMA TX table */
> > > +     if (!xfer->rnw)
> > > +             npcm_i3c_master_write_dma_table(xfer->out,
> > > +                                            (u32 *)master->dma_tx_buf,
> > > +                                            xfer->len);
> > > +
> > > +     /*
> > > +      * Setup I3C DMA control
> > > +      * 1 byte DMA width
> > > +      * Enable DMA util disabled
> > > +      */
> > > +     val = NPCM_I3C_MDMACTRL_DMAWIDTH(1);
> > > +     val |= xfer->rnw ? NPCM_I3C_MDMACTRL_DMAFB(2) : NPCM_I3C_MDMACTRL_DMATB(2);
> > > +     writel(val, master->regs + NPCM_I3C_MDMACTRL);
> > > +
> > > +     /*
> > > +      * Enable DMA
> > > +      * Source Address Fixed for RX
> > > +      * Destination Address Fixed for TX
> > > +      * Use 32-bit transfer width for TX (queal to MWDATAB register width)
> > > +      */
> > > +     val = NPCM_GDMA_CTL_GDMAEN;
> > > +     if (xfer->rnw)
> > > +             val |= NPCM_GDMA_CTL_SAFIX | NPCM_GDMA_CTL_GDMAMS(2);
> > > +     else
> > > +             val |= NPCM_GDMA_CTL_DAFIX | NPCM_GDMA_CTL_GDMAMS(1) | NPCM_GDMA_CTL_TWS(2);
> > > +     writel(val, master->dma_regs + NPCM_GDMA_CTL(ch));
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int npcm_i3c_master_wait_for_complete(struct npcm_i3c_master *master)
> > > +{
> > > +     struct npcm_dma_xfer_desc *xfer = &master->dma_xfer;
> > > +     int ch = xfer->rnw ? DMA_CH_RX : DMA_CH_TX;
> > > +     u32 count;
> > > +     int ret;
> > > +
> > > +     ret = wait_for_completion_timeout(&master->xfer_comp, msecs_to_jiffies(100));
> > > +     if (!ret) {
> > > +             dev_err(master->dev, "DMA transfer timeout (%s)\n", xfer->rnw ? "Read" : "write");
> > > +             dev_err(master->dev, "mstatus = 0x%02x\n", readl(master->regs + NPCM_I3C_MSTATUS));
> > > +             return -ETIMEDOUT;
> > > +     }
> > > +
> > > +     /* Get the DMA transfer count */
> > > +     count = readl(master->dma_regs + NPCM_GDMA_CTCNT(ch));
> > > +     count = (count > xfer->len) ? 0 : (xfer->len - count);
> > > +     dev_dbg(master->dev, "dma xfer count %u\n", count);
> > > +     if (xfer->rnw)
> > > +             memcpy(xfer->in, master->dma_rx_buf, count);
> > > +     if (count != xfer->len)
> > > +             dev_dbg(master->dev, "short dma xfer(%s), want %d transfer %d\n",
> > > +                     xfer->rnw ? "R" : "W", xfer->len, count);
> > > +
> > > +     npcm_i3c_master_stop_dma(master);
> > > +
> > > +     return count;
> > > +}
> > > +
> > > +static int npcm_i3c_send_broadcast(struct npcm_i3c_master *master)
> > > +{
> > > +     u32 reg;
> > > +     int ret;
> > > +
> > > +     writel(NPCM_I3C_MCTRL_REQUEST_START_ADDR |
> > > +            NPCM_I3C_MCTRL_TYPE_I3C |
> > > +            NPCM_I3C_MCTRL_IBIRESP_AUTO |
> > > +            NPCM_I3C_MCTRL_DIR(0) |
> > > +            NPCM_I3C_MCTRL_ADDR(I3C_BROADCAST_ADDR) |
> > > +            NPCM_I3C_MCTRL_RDTERM(NPCM_I3C_MAX_IBI_PAYLOAD_SIZE),
> > > +            master->regs + NPCM_I3C_MCTRL);
> > > +     ret = readl_poll_timeout(master->regs + NPCM_I3C_MSTATUS, reg,
> > > +                              NPCM_I3C_MSTATUS_MCTRLDONE(reg), 0, 1000);
> > > +     if (ret)
> > > +             return -EIO;
> > > +
> > > +     if (NPCM_I3C_MSTATUS_IBIWON(reg)) {
> > > +             ret = npcm_i3c_master_handle_ibiwon(master, true);
> > > +             if (ret) {
> > > +                     dev_err(master->dev, "xfer read: handle ibi event fail, ret=%d\n", ret);
> > > +                     return -EIO;
> > > +             }
> > > +
> > > +             /* Clear COMPLETE status of this IBI transaction */
> > > +             writel(NPCM_I3C_MINT_COMPLETE, master->regs + NPCM_I3C_MSTATUS);
> > > +             return 1;
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int npcm_i3c_master_xfer(struct npcm_i3c_master *master,
> > > +                            bool rnw, unsigned int xfer_type, u8 addr,
> > > +                            u8 *in, const u8 *out, unsigned int xfer_len,
> > > +                            unsigned int *read_len, bool continued,
> > > +                            bool use_dma, bool first)
> > > +{
> > > +     u32 reg, rdterm = *read_len, mstatus, ibiresp;
> > > +     int ret, i, count, space;
> > > +     unsigned long flags;
> > > +     unsigned long start;
> > > +     bool bus_locked = false;
> > > +
> > > +     if (rdterm > NPCM_I3C_MAX_RDTERM)
> > > +             rdterm = NPCM_I3C_MAX_RDTERM;
> > > +
> > > +     /* Prevent fifo operation from delay by interrupt */
> > > +     if (!use_dma)
> > > +             local_irq_disable();
> > > +     else
> > > +             npcm_i3c_master_dma_lock();
> > > +
> > > +     /* Prevent DMA start while IBI isr is running */
> > > +     spin_lock_irqsave(&master->req_lock, flags);
> > > +     bus_locked = true;
> > > +
> > > +     /*
> > > +      * There is a chance that first tx data bit is lost when it
> > > +      * is not ready in FIFO right after address phase.
> > > +      * Prepare data before starting the transfer to fix this problem.
> > > +      */
> > > +     if (!rnw && xfer_len && !use_dma) {
> > > +             ret = readl_poll_timeout(master->regs + NPCM_I3C_MDATACTRL,
> > > +                                      reg,
> > > +                                      !(reg & NPCM_I3C_MDATACTRL_TXFULL),
> > > +                                      0, 1000);
> > > +             if (ret) {
> > > +                     bus_locked = false;
> > > +                     spin_unlock_irqrestore(&master->req_lock, flags);
> > > +                     local_irq_enable();
> > > +                     return ret;
> > > +             }
> > > +
> > > +             reg = readl(master->regs + NPCM_I3C_MDATACTRL);
> > > +             space = NPCM_I3C_FIFO_SIZE - NPCM_I3C_MDATACTRL_TXCOUNT(reg);
> > > +             count = xfer_len > space ? space : xfer_len;
> > > +             for (i = 0; i < count; i++) {
> > > +                     if (i == xfer_len - 1)
> > > +                             writel(out[0], master->regs + NPCM_I3C_MWDATABE);
> > > +                     else
> > > +                             writel(out[0], master->regs + NPCM_I3C_MWDATAB);
> > > +                     out++;
> > > +             }
> > > +             xfer_len -= count;
> > > +     }
> > > +
> > > +     if (use_dma) {
> > > +             if (xfer_len > MAX_DMA_COUNT) {
> > > +                     dev_err(master->dev, "data is larger than buffer size (%d)\n",
> > > +                             MAX_DMA_COUNT);
> > > +                     spin_unlock_irqrestore(&master->req_lock, flags);
> > > +                     npcm_i3c_master_dma_unlock();
> > > +                     return -EINVAL;
> > > +             }
> > > +             master->dma_xfer.out = out;
> > > +             master->dma_xfer.in = in;
> > > +             master->dma_xfer.len = xfer_len;
> > > +             master->dma_xfer.rnw = rnw;
> > > +             master->dma_xfer.end = !continued;
> > > +             init_completion(&master->xfer_comp);
> > > +     }
> > > +
> > > +     start = jiffies;
> > > +
> > > +broadcast_start:
> > > +     if (first && rnw) {
> > > +             /* Send 7E first to avoid collision during master read */
> > > +             ret = npcm_i3c_send_broadcast(master);
> > > +             if (ret < 0) {
> > > +                     dev_err(master->dev, "send 7e error\n");
> > > +                     goto emit_stop;
> > > +             }
> > > +             if (time_after(jiffies, start + msecs_to_jiffies(1000))) {
> > > +                     dev_err(master->dev, "abnormal ibiwon events\n");
> > > +                     goto emit_stop;
> > > +             }
> > > +             if (ret > 0)
> > > +                     goto broadcast_start;
> > > +     }
> > > +
> > > +     if (rnw) {
> > > +             ibiresp = NPCM_I3C_MCTRL_IBIRESP_NACK;
> > > +             npcm_i3c_master_set_sda_skew(master,
> > > +                             master->scl_timing.i3c_pp_sda_rd_skew);
> > > +     } else {
> > > +             ibiresp = NPCM_I3C_MCTRL_IBIRESP_AUTO;
> > > +             npcm_i3c_master_set_sda_skew(master,
> > > +                             master->scl_timing.i3c_pp_sda_wr_skew);
> > > +     }
> > > +
> > > +     if (use_dma)
> > > +             npcm_i3c_master_start_dma(master);
> > > +
> > > +retry_start:
> > > +     writel(NPCM_I3C_MCTRL_REQUEST_START_ADDR |
> > > +            xfer_type |
> > > +            ibiresp |
> > > +            NPCM_I3C_MCTRL_DIR(rnw) |
> > > +            NPCM_I3C_MCTRL_ADDR(addr) |
> > > +            NPCM_I3C_MCTRL_RDTERM(rdterm),
> > > +            master->regs + NPCM_I3C_MCTRL);
> > > +
> > > +     ret = readl_poll_timeout(master->regs + NPCM_I3C_MSTATUS, reg,
> > > +                              NPCM_I3C_MSTATUS_MCTRLDONE(reg), 0, 1000);
> > > +     if (ret) {
> > > +             dev_err(master->dev, "xfer (%d) wait ctrl-done timeout, mstatus=0x%02x\n",
> > > +                     rnw, reg);
> > > +             goto emit_stop;
> > > +     }
> > > +
> > > +     mstatus = readl(master->regs + NPCM_I3C_MSTATUS);
> > > +     if (NPCM_I3C_MSTATUS_IBIWON(mstatus)) {
> > > +             if (rnw) {
> > > +                     dev_err(master->dev, "xfer read: re-start but ibiwon, mstatus=0x%02x\n",
> > > +                                     mstatus);
> > > +                     ret = -EIO;
> > > +                     goto emit_stop;
> > > +             }
> > > +
> > > +             ret = npcm_i3c_master_handle_ibiwon(master, true);
> > > +             if (ret) {
> > > +                     dev_err(master->dev, "xfer read: handle ibi event fail, ret=%d\n", ret);
> > > +                     goto emit_stop;
> > > +             }
> > > +
> > > +             if (time_after(jiffies, start + msecs_to_jiffies(1000))) {
> > > +                     dev_err(master->dev, "abnormal ibiwon events\n");
> > > +                     goto emit_stop;
> > > +             }
> > > +
> > > +             /* Clear COMPLETE status of this IBI transaction */
> > > +             writel(NPCM_I3C_MINT_COMPLETE, master->regs + NPCM_I3C_MSTATUS);
> > > +             goto retry_start;
> > > +     }
> > > +
> > > +     /* Use COMPLETE interrupt as notification of transfer completion */
> > > +     if (use_dma)
> > > +             npcm_i3c_master_enable_interrupts(master, NPCM_I3C_MINT_COMPLETE);
> > > +
> > > +     bus_locked = false;
> > > +     spin_unlock_irqrestore(&master->req_lock, flags);
> > > +
> > > +     reg = readl(master->regs + NPCM_I3C_MSTATUS);
> > > +     if (NPCM_I3C_MSTATUS_NACKED(reg)) {
> > > +             dev_dbg(master->dev, "addr 0x%x NACK\n", addr);
> > > +             ret = -EIO;
> > > +             goto emit_stop;
> > > +     }
> > > +
> > > +     if (use_dma)
> > > +             ret = npcm_i3c_master_wait_for_complete(master);
> > > +     else if (rnw)
> > > +             ret = npcm_i3c_master_read(master, in, xfer_len);
> > > +     else
> > > +             ret = npcm_i3c_master_write(master, out, xfer_len);
> > > +     if (ret < 0)
> > > +             goto emit_stop;
> > > +
> > > +     if (rnw)
> > > +             *read_len = ret;
> > > +
> > > +     if (!use_dma) {
> > > +             ret = readl_poll_timeout(master->regs + NPCM_I3C_MSTATUS, reg,
> > > +                                      NPCM_I3C_MSTATUS_COMPLETE(reg), 0, 1000);
> > > +             if (ret)
> > > +                     goto emit_stop;
> > > +
> > > +             /* If use_dma, COMPLETE bit is cleared in the isr */
> > > +             writel(NPCM_I3C_MINT_COMPLETE, master->regs + NPCM_I3C_MSTATUS);
> > > +     }
> > > +
> > > +
> > > +     if (!continued && !use_dma) {
> > > +             npcm_i3c_master_set_sda_skew(master, 0);
> > > +             npcm_i3c_master_emit_stop(master);
> > > +     }
> > > +
> > > +     if (!use_dma)
> > > +             local_irq_enable();
> > > +     else
> > > +             npcm_i3c_master_dma_unlock();
> > > +
> > > +     return 0;
> > > +
> > > +emit_stop:
> > > +     if (use_dma)
> > > +             npcm_i3c_master_stop_dma(master);
> > > +
> > > +     if (bus_locked)
> > > +             spin_unlock_irqrestore(&master->req_lock, flags);
> > > +
> > > +     spin_lock_irqsave(&master->req_lock, flags);
> > > +
> > > +     npcm_i3c_master_set_sda_skew(master, 0);
> > > +
> > > +     reg = readl(master->regs + NPCM_I3C_MSTATUS);
> > > +     npcm_i3c_master_emit_stop(master);
> > > +     npcm_i3c_master_clear_merrwarn(master);
> > > +     npcm_i3c_master_flush_fifo(master);
> > > +     spin_unlock_irqrestore(&master->req_lock, flags);
> > > +
> > > +     if (!use_dma)
> > > +             local_irq_enable();
> > > +     else
> > > +             npcm_i3c_master_dma_unlock();
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static struct npcm_i3c_xfer *
> > > +npcm_i3c_master_alloc_xfer(struct npcm_i3c_master *master, unsigned int ncmds)
> > > +{
> > > +     struct npcm_i3c_xfer *xfer;
> > > +
> > > +     xfer = kzalloc(struct_size(xfer, cmds, ncmds), GFP_KERNEL);
> > > +     if (!xfer)
> > > +             return NULL;
> > > +
> > > +     INIT_LIST_HEAD(&xfer->node);
> > > +     xfer->ncmds = ncmds;
> > > +     xfer->ret = -ETIMEDOUT;
> > > +
> > > +     return xfer;
> > > +}
> > > +
> > > +static void npcm_i3c_master_free_xfer(struct npcm_i3c_xfer *xfer)
> > > +{
> > > +     kfree(xfer);
> > > +}
> > > +
> > > +static void npcm_i3c_master_dequeue_xfer_locked(struct npcm_i3c_master *master,
> > > +                                            struct npcm_i3c_xfer *xfer)
> > > +{
> > > +     if (master->xferqueue.cur == xfer)
> > > +             master->xferqueue.cur = NULL;
> > > +     else
> > > +             list_del_init(&xfer->node);
> > > +}
> > > +
> > > +static void npcm_i3c_master_dequeue_xfer(struct npcm_i3c_master *master,
> > > +                                     struct npcm_i3c_xfer *xfer)
> > > +{
> > > +     npcm_i3c_master_dequeue_xfer_locked(master, xfer);
> > > +}
> > > +
> > > +static void npcm_i3c_master_start_xfer_locked(struct npcm_i3c_master *master)
> > > +{
> > > +     struct npcm_i3c_xfer *xfer = master->xferqueue.cur;
> > > +     unsigned long flags;
> > > +     int ret, i;
> > > +
> > > +     if (!xfer)
> > > +             return;
> > > +
> > > +     /* Prevent fifo flush while IBI isr is running */
> > > +     spin_lock_irqsave(&master->req_lock, flags);
> > > +     npcm_i3c_master_clear_merrwarn(master);
> > > +     npcm_i3c_master_flush_fifo(master);
> > > +     spin_unlock_irqrestore(&master->req_lock, flags);
> > > +
> > > +     for (i = 0; i < xfer->ncmds; i++) {
> > > +             struct npcm_i3c_cmd *cmd = &xfer->cmds[i];
> > > +
> > > +             ret = npcm_i3c_master_xfer(master, cmd->rnw, xfer->type,
> > > +                                       cmd->addr, cmd->in, cmd->out,
> > > +                                       cmd->len, &cmd->read_len,
> > > +                                       cmd->continued, cmd->use_dma, (i == 0));
> > > +             if (ret)
> > > +                     break;
> > > +     }
> > > +
> > > +     xfer->ret = ret;
> > > +     complete(&xfer->comp);
> > > +
> > > +     if (ret < 0)
> > > +             npcm_i3c_master_dequeue_xfer_locked(master, xfer);
> > > +
> > > +     xfer = list_first_entry_or_null(&master->xferqueue.list,
> > > +                                     struct npcm_i3c_xfer,
> > > +                                     node);
> > > +     if (xfer)
> > > +             list_del_init(&xfer->node);
> > > +
> > > +     master->xferqueue.cur = xfer;
> > > +     npcm_i3c_master_start_xfer_locked(master);
> > > +}
> > > +
> > > +static void npcm_i3c_master_enqueue_xfer(struct npcm_i3c_master *master,
> > > +                                     struct npcm_i3c_xfer *xfer)
> > > +{
> > > +     init_completion(&xfer->comp);
> > > +     if (master->xferqueue.cur) {
> > > +             list_add_tail(&xfer->node, &master->xferqueue.list);
> > > +     } else {
> > > +             master->xferqueue.cur = xfer;
> > > +             npcm_i3c_master_start_xfer_locked(master);
> > > +     }
> > > +}
> > > +
> > > +static bool
> > > +npcm_i3c_master_supports_ccc_cmd(struct i3c_master_controller *master,
> > > +                             const struct i3c_ccc_cmd *cmd)
> > > +{
> > > +     /* No software support for CCC commands targeting more than one slave */
> > > +     return (cmd->ndests == 1);
> > > +}
> > > +
> > > +static int npcm_i3c_master_send_bdcast_ccc_cmd(struct npcm_i3c_master *master,
> > > +                                           struct i3c_ccc_cmd *ccc)
> > > +{
> > > +     unsigned int xfer_len = ccc->dests[0].payload.len + 1;
> > > +     struct npcm_i3c_xfer *xfer;
> > > +     struct npcm_i3c_cmd *cmd;
> > > +     u8 *buf;
> > > +     int ret;
> > > +
> > > +     xfer = npcm_i3c_master_alloc_xfer(master, 1);
> > > +     if (!xfer)
> > > +             return -ENOMEM;
> > > +
> > > +     buf = kmalloc(xfer_len, GFP_KERNEL);
> > > +     if (!buf) {
> > > +             npcm_i3c_master_free_xfer(xfer);
> > > +             return -ENOMEM;
> > > +     }
> > > +
> > > +     buf[0] = ccc->id;
> > > +     memcpy(&buf[1], ccc->dests[0].payload.data, ccc->dests[0].payload.len);
> > > +
> > > +     xfer->type = NPCM_I3C_MCTRL_TYPE_I3C;
> > > +
> > > +     cmd = &xfer->cmds[0];
> > > +     cmd->addr = ccc->dests[0].addr;
> > > +     cmd->rnw = ccc->rnw;
> > > +     cmd->in = NULL;
> > > +     cmd->out = buf;
> > > +     cmd->len = xfer_len;
> > > +     cmd->read_len = 0;
> > > +     cmd->continued = false;
> > > +
> > > +     mutex_lock(&master->lock);
> > > +     npcm_i3c_master_enqueue_xfer(master, xfer);
> > > +     if (!wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000)))
> > > +             npcm_i3c_master_dequeue_xfer(master, xfer);
> > > +     mutex_unlock(&master->lock);
> > > +
> > > +     ret = xfer->ret;
> > > +     kfree(buf);
> > > +     npcm_i3c_master_free_xfer(xfer);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static int npcm_i3c_master_send_direct_ccc_cmd(struct npcm_i3c_master *master,
> > > +                                           struct i3c_ccc_cmd *ccc)
> > > +{
> > > +     unsigned int xfer_len = ccc->dests[0].payload.len;
> > > +     unsigned int read_len = ccc->rnw ? xfer_len : 0;
> > > +     struct npcm_i3c_xfer *xfer;
> > > +     struct npcm_i3c_cmd *cmd;
> > > +     int ret;
> > > +
> > > +     xfer = npcm_i3c_master_alloc_xfer(master, 2);
> > > +     if (!xfer)
> > > +             return -ENOMEM;
> > > +
> > > +     xfer->type = NPCM_I3C_MCTRL_TYPE_I3C;
> > > +
> > > +     /* Broadcasted message */
> > > +     cmd = &xfer->cmds[0];
> > > +     cmd->addr = I3C_BROADCAST_ADDR;
> > > +     cmd->rnw = 0;
> > > +     cmd->in = NULL;
> > > +     cmd->out = &ccc->id;
> > > +     cmd->len = 1;
> > > +     cmd->read_len = 0;
> > > +     cmd->continued = true;
> > > +
> > > +     /* Directed message */
> > > +     cmd = &xfer->cmds[1];
> > > +     cmd->addr = ccc->dests[0].addr;
> > > +     cmd->rnw = ccc->rnw;
> > > +     cmd->in = ccc->rnw ? ccc->dests[0].payload.data : NULL;
> > > +     cmd->out = ccc->rnw ? NULL : ccc->dests[0].payload.data,
> > > +     cmd->len = xfer_len;
> > > +     cmd->read_len = read_len;
> > > +     cmd->continued = false;
> > > +
> > > +     mutex_lock(&master->lock);
> > > +     npcm_i3c_master_enqueue_xfer(master, xfer);
> > > +     if (!wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000)))
> > > +             npcm_i3c_master_dequeue_xfer(master, xfer);
> > > +     mutex_unlock(&master->lock);
> > > +
> > > +     if (cmd->read_len != xfer_len)
> > > +             ccc->dests[0].payload.len = cmd->read_len;
> > > +
> > > +     ret = xfer->ret;
> > > +     npcm_i3c_master_free_xfer(xfer);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static int npcm_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
> > > +                                    struct i3c_ccc_cmd *cmd)
> > > +{
> > > +     struct npcm_i3c_master *master = to_npcm_i3c_master(m);
> > > +     bool broadcast = cmd->id < 0x80;
> > > +     int ret;
> > > +
> > > +     if (broadcast)
> > > +             ret = npcm_i3c_master_send_bdcast_ccc_cmd(master, cmd);
> > > +     else
> > > +             ret = npcm_i3c_master_send_direct_ccc_cmd(master, cmd);
> > > +
> > > +     if (ret) {
> > > +             dev_dbg(master->dev, "send ccc 0x%02x %s, ret = %d\n",
> > > +                             cmd->id, broadcast ? "(broadcast)" : "", ret);
> > > +             cmd->err = I3C_ERROR_M2;
> > > +     }
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static int npcm_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
> > > +                                  struct i3c_priv_xfer *xfers,
> > > +                                  int nxfers)
> > > +{
> > > +     struct i3c_master_controller *m = i3c_dev_get_master(dev);
> > > +     struct npcm_i3c_master *master = to_npcm_i3c_master(m);
> > > +     struct npcm_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> > > +     struct npcm_i3c_xfer *xfer;
> > > +     int ret, i;
> > > +
> > > +     xfer = npcm_i3c_master_alloc_xfer(master, nxfers);
> > > +     if (!xfer)
> > > +             return -ENOMEM;
> > > +
> > > +     xfer->type = NPCM_I3C_MCTRL_TYPE_I3C;
> > > +
> > > +     for (i = 0; i < nxfers; i++) {
> > > +             struct npcm_i3c_cmd *cmd = &xfer->cmds[i];
> > > +
> > > +             cmd->addr = master->addrs[data->index];
> > > +             cmd->rnw = xfers[i].rnw;
> > > +             cmd->in = xfers[i].rnw ? xfers[i].data.in : NULL;
> > > +             cmd->out = xfers[i].rnw ? NULL : xfers[i].data.out;
> > > +             cmd->len = xfers[i].len;
> > > +             cmd->read_len = xfers[i].rnw ? xfers[i].len : 0;
> > > +             cmd->continued = (i + 1) < nxfers;
> > > +             if (master->use_dma && xfers[i].len > 1)
> > > +                     cmd->use_dma = true;
> > > +     }
> > > +
> > > +     mutex_lock(&master->lock);
> > > +     npcm_i3c_master_enqueue_xfer(master, xfer);
> > > +     if (!wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000)))
> > > +             npcm_i3c_master_dequeue_xfer(master, xfer);
> > > +     mutex_unlock(&master->lock);
> > > +
> > > +     for (i = 0; i < nxfers; i++) {
> > > +             struct npcm_i3c_cmd *cmd = &xfer->cmds[i];
> > > +
> > > +             if (xfers[i].rnw)
> > > +                     xfers[i].len = cmd->read_len;
> > > +     }
> > > +     ret = xfer->ret;
> > > +     npcm_i3c_master_free_xfer(xfer);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static int npcm_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
> > > +                                 const struct i2c_msg *xfers,
> > > +                                 int nxfers)
> > > +{
> > > +     struct i3c_master_controller *m = i2c_dev_get_master(dev);
> > > +     struct npcm_i3c_master *master = to_npcm_i3c_master(m);
> > > +     struct npcm_i3c_i2c_dev_data *data = i2c_dev_get_master_data(dev);
> > > +     struct npcm_i3c_xfer *xfer;
> > > +     int ret, i;
> > > +
> > > +     xfer = npcm_i3c_master_alloc_xfer(master, nxfers);
> > > +     if (!xfer)
> > > +             return -ENOMEM;
> > > +
> > > +     xfer->type = NPCM_I3C_MCTRL_TYPE_I2C;
> > > +
> > > +     for (i = 0; i < nxfers; i++) {
> > > +             struct npcm_i3c_cmd *cmd = &xfer->cmds[i];
> > > +
> > > +             cmd->addr = master->addrs[data->index];
> > > +             cmd->rnw = xfers[i].flags & I2C_M_RD;
> > > +             cmd->in = cmd->rnw ? xfers[i].buf : NULL;
> > > +             cmd->out = cmd->rnw ? NULL : xfers[i].buf;
> > > +             cmd->len = xfers[i].len;
> > > +             cmd->read_len = cmd->rnw ? xfers[i].len : 0;
> > > +             cmd->continued = (i + 1 < nxfers);
> > > +     }
> > > +
> > > +     mutex_lock(&master->lock);
> > > +     npcm_i3c_master_enqueue_xfer(master, xfer);
> > > +     if (!wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000)))
> > > +             npcm_i3c_master_dequeue_xfer(master, xfer);
> > > +     mutex_unlock(&master->lock);
> > > +
> > > +     ret = xfer->ret;
> > > +     npcm_i3c_master_free_xfer(xfer);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static int npcm_i3c_master_request_ibi(struct i3c_dev_desc *dev,
> > > +                                   const struct i3c_ibi_setup *req)
> > > +{
> > > +     struct i3c_master_controller *m = i3c_dev_get_master(dev);
> > > +     struct npcm_i3c_master *master = to_npcm_i3c_master(m);
> > > +     struct npcm_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> > > +     unsigned long flags;
> > > +     unsigned int i;
> > > +     struct i3c_ibi_setup ibi_req;
> > > +
> > > +     if (dev->ibi->max_payload_len > NPCM_I3C_MAX_IBI_PAYLOAD_SIZE) {
> > > +             dev_err(master->dev, "IBI max payload %d should be < %d\n",
> > > +                     dev->ibi->max_payload_len, NPCM_I3C_MAX_IBI_PAYLOAD_SIZE + 1);
> > > +             return -ERANGE;
> > > +     }
> > > +
> > > +     memcpy(&ibi_req, req, sizeof(struct i3c_ibi_setup));
> > > +     ibi_req.max_payload_len = NPCM_I3C_MAX_IBI_PAYLOAD_SIZE;
> > > +     data->ibi_pool = i3c_generic_ibi_alloc_pool(dev, &ibi_req);
> > > +     if (IS_ERR(data->ibi_pool))
> > > +             return PTR_ERR(data->ibi_pool);
> > > +
> > > +     spin_lock_irqsave(&master->ibi.lock, flags);
> > > +     for (i = 0; i < master->ibi.num_slots; i++) {
> > > +             if (!master->ibi.slots[i]) {
> > > +                     data->ibi = i;
> > > +                     master->ibi.slots[i] = dev;
> > > +                     break;
> > > +             }
> > > +     }
> > > +     spin_unlock_irqrestore(&master->ibi.lock, flags);
> > > +
> > > +     if (i < master->ibi.num_slots)
> > > +             return 0;
> > > +
> > > +     i3c_generic_ibi_free_pool(data->ibi_pool);
> > > +     data->ibi_pool = NULL;
> > > +
> > > +     return -ENOSPC;
> > > +}
> > > +
> > > +static void npcm_i3c_master_free_ibi(struct i3c_dev_desc *dev)
> > > +{
> > > +     struct i3c_master_controller *m = i3c_dev_get_master(dev);
> > > +     struct npcm_i3c_master *master = to_npcm_i3c_master(m);
> > > +     struct npcm_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> > > +     unsigned long flags;
> > > +
> > > +     spin_lock_irqsave(&master->ibi.lock, flags);
> > > +     master->ibi.slots[data->ibi] = NULL;
> > > +     data->ibi = -1;
> > > +     spin_unlock_irqrestore(&master->ibi.lock, flags);
> > > +
> > > +     i3c_generic_ibi_free_pool(data->ibi_pool);
> > > +}
> > > +
> > > +static int npcm_i3c_master_enable_ibi(struct i3c_dev_desc *dev)
> > > +{
> > > +     struct i3c_master_controller *m = i3c_dev_get_master(dev);
> > > +     struct npcm_i3c_master *master = to_npcm_i3c_master(m);
> > > +
> > > +     /* Clear the interrupt status */
> > > +     writel(NPCM_I3C_MINT_SLVSTART, master->regs + NPCM_I3C_MSTATUS);
> > > +     npcm_i3c_master_enable_interrupts(master, NPCM_I3C_MINT_SLVSTART);
> > > +
> > > +     return i3c_master_enec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
> > > +}
> > > +
> > > +static int npcm_i3c_master_disable_ibi(struct i3c_dev_desc *dev)
> > > +{
> > > +     struct i3c_master_controller *m = i3c_dev_get_master(dev);
> > > +     struct npcm_i3c_master *master = to_npcm_i3c_master(m);
> > > +     int ret;
> > > +
> > > +     writel(NPCM_I3C_MINT_SLVSTART, master->regs + NPCM_I3C_MINTCLR);
> > > +
> > > +     ret = i3c_master_disec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static void npcm_i3c_master_recycle_ibi_slot(struct i3c_dev_desc *dev,
> > > +                                         struct i3c_ibi_slot *slot)
> > > +{
> > > +     struct npcm_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> > > +
> > > +     i3c_generic_ibi_recycle_slot(data->ibi_pool, slot);
> > > +}
> > > +
> > > +static const struct i3c_master_controller_ops npcm_i3c_master_ops = {
> > > +     .bus_init = npcm_i3c_master_bus_init,
> > > +     .bus_cleanup = npcm_i3c_master_bus_cleanup,
> > > +     .attach_i3c_dev = npcm_i3c_master_attach_i3c_dev,
> > > +     .detach_i3c_dev = npcm_i3c_master_detach_i3c_dev,
> > > +     .reattach_i3c_dev = npcm_i3c_master_reattach_i3c_dev,
> > > +     .attach_i2c_dev = npcm_i3c_master_attach_i2c_dev,
> > > +     .detach_i2c_dev = npcm_i3c_master_detach_i2c_dev,
> > > +     .do_daa = npcm_i3c_master_do_daa,
> > > +     .supports_ccc_cmd = npcm_i3c_master_supports_ccc_cmd,
> > > +     .send_ccc_cmd = npcm_i3c_master_send_ccc_cmd,
> > > +     .priv_xfers = npcm_i3c_master_priv_xfers,
> > > +     .i2c_xfers = npcm_i3c_master_i2c_xfers,
> > > +     .request_ibi = npcm_i3c_master_request_ibi,
> > > +     .free_ibi = npcm_i3c_master_free_ibi,
> > > +     .recycle_ibi_slot = npcm_i3c_master_recycle_ibi_slot,
> > > +     .enable_ibi = npcm_i3c_master_enable_ibi,
> > > +     .disable_ibi = npcm_i3c_master_disable_ibi,
> > > +};
> > > +
> > > +static int npcm_i3c_master_prepare_clks(struct npcm_i3c_master *master)
> > > +{
> > > +     int ret = 0;
> > > +
> > > +     ret = clk_prepare_enable(master->pclk);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     ret = clk_prepare_enable(master->fclk);
> > > +     if (ret) {
> > > +             clk_disable_unprepare(master->pclk);
> > > +             return ret;
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static void npcm_i3c_master_unprepare_clks(struct npcm_i3c_master *master)
> > > +{
> > > +     clk_disable_unprepare(master->pclk);
> > > +     clk_disable_unprepare(master->fclk);
> > > +}
> > > +
> > > +static struct dentry *npcm_i3c_debugfs_dir;
> > > +static int debug_show(struct seq_file *seq, void *v)
> > > +{
> > > +     struct npcm_i3c_master *master = seq->private;
> > > +
> > > +     seq_printf(seq, "MSTATUS=0x%x\n", readl(master->regs + NPCM_I3C_MSTATUS));
> > > +     seq_printf(seq, "MERRWARN=0x%x\n", readl(master->regs + NPCM_I3C_MERRWARN));
> > > +     seq_printf(seq, "MCTRL=0x%x\n", readl(master->regs + NPCM_I3C_MCTRL));
> > > +     seq_printf(seq, "MDATACTRL=0x%x\n", readl(master->regs + NPCM_I3C_MDATACTRL));
> > > +     seq_printf(seq, "MCONFIG=0x%x\n", readl(master->regs + NPCM_I3C_MCONFIG));
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +DEFINE_SHOW_ATTRIBUTE(debug);
> > > +
> > > +static void npcm_i3c_init_debugfs(struct platform_device *pdev,
> > > +                              struct npcm_i3c_master *master)
> > > +{
> > > +     if (!npcm_i3c_debugfs_dir) {
> > > +             npcm_i3c_debugfs_dir = debugfs_create_dir("npcm_i3c", NULL);
> > > +             if (!npcm_i3c_debugfs_dir)
> > > +                     return;
> > > +     }
> > > +
> > > +     master->debugfs = debugfs_create_dir(dev_name(&pdev->dev),
> > > +                                          npcm_i3c_debugfs_dir);
> > > +     if (!master->debugfs)
> > > +             return;
> > > +
> > > +     debugfs_create_file("debug", 0444, master->debugfs, master, &debug_fops);
> > > +}
> > > +
> > > +static int npcm_i3c_setup_dma(struct platform_device *pdev, struct npcm_i3c_master *master)
> > > +{
> > > +     struct device *dev = &pdev->dev;
> > > +     u32 dma_conn, dma_ctl, reg_base;
> > > +
> > > +     if (!of_property_read_bool(dev->of_node, "use-dma"))
> > > +             return 0;
> > > +
> > > +     master->dma_regs = devm_platform_ioremap_resource_byname(pdev, "dma");
> > > +     if (IS_ERR(master->dma_regs))
> > > +             return 0;
> > > +
> > > +     master->dma_ctl_regs = devm_platform_ioremap_resource_byname(pdev, "dma_ctl");
> > > +     if (IS_ERR(master->dma_ctl_regs))
> > > +             return 0;
> > > +
> > > +     /* DMA TX transfer width is 32 bits(MWDATAB width) for each byte sent to I3C bus */
> > > +     master->dma_tx_buf = dma_alloc_coherent(dev, MAX_DMA_COUNT * 4,
> > > +                                             &master->dma_tx_addr, GFP_KERNEL);
> > > +     if (!master->dma_tx_buf)
> > > +             return -ENOMEM;
> > > +
> > > +     master->dma_rx_buf = dma_alloc_coherent(dev, MAX_DMA_COUNT,
> > > +                                             &master->dma_rx_addr, GFP_KERNEL);
> > > +     if (!master->dma_rx_buf) {
> > > +             dma_free_coherent(master->dev, MAX_DMA_COUNT * 4, master->dma_tx_buf,
> > > +                               master->dma_tx_addr);
> > > +             return -ENOMEM;
> > > +     }
> > > +
> > > +     /*
> > > +      * Set DMA channel connectivity
> > > +      * channel 0: I3C TX, channel 1: I3C RX
> > > +      */
> > > +     of_property_read_u32_index(dev->of_node, "reg", 0, &reg_base);
> > > +     dma_conn = NPCM_GDMA_MUX(reg_base);
> > > +     dma_ctl = GDMA_CH0_EN | GDMA_CH1_EN | (dma_conn + 1) << 16 | dma_conn;
> > > +     writel(dma_ctl, master->dma_ctl_regs);
> > > +     master->use_dma = true;
> > > +     dev_info(dev, "Using DMA (req_sel %d)\n", dma_conn);
> > > +
> > > +     /*
> > > +      * Setup GDMA Channel for TX (Memory to I3C FIFO)
> > > +      */
> > > +     writel(master->dma_tx_addr, master->dma_regs + NPCM_GDMA_SRCB(DMA_CH_TX));
> > > +     writel(reg_base + NPCM_I3C_MWDATAB, master->dma_regs +
> > > +            NPCM_GDMA_DSTB(DMA_CH_TX));
> > > +     /*
> > > +      * Setup GDMA Channel for RX (I3C FIFO to Memory)
> > > +      */
> > > +     writel(reg_base + NPCM_I3C_MRDATAB, master->dma_regs +
> > > +            NPCM_GDMA_SRCB(DMA_CH_RX));
> > > +     writel(master->dma_rx_addr, master->dma_regs + NPCM_GDMA_DSTB(DMA_CH_RX));
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int npcm_i3c_master_probe(struct platform_device *pdev)
> > > +{
> > > +     struct device *dev = &pdev->dev;
> > > +     struct npcm_i3c_master *master;
> > > +     struct reset_control *reset;
> > > +     u32 val;
> > > +     int ret;
> > > +
> > > +     master = devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
> > > +     if (!master)
> > > +             return -ENOMEM;
> > > +
> > > +     master->regs = devm_platform_ioremap_resource(pdev, 0);
> > > +     if (IS_ERR(master->regs))
> > > +             return PTR_ERR(master->regs);
> > > +
> > > +     master->pclk = devm_clk_get(dev, "pclk");
> > > +     if (IS_ERR(master->pclk))
> > > +             return PTR_ERR(master->pclk);
> > > +
> > > +     master->fclk = devm_clk_get(dev, "fast_clk");
> > > +     if (IS_ERR(master->fclk))
> > > +             return PTR_ERR(master->fclk);
> > > +
> > > +     master->irq = platform_get_irq(pdev, 0);
> > > +     if (master->irq < 0)
> > > +             return master->irq;
> > > +
> > > +     master->dev = dev;
> > > +
> > > +     ret = npcm_i3c_master_prepare_clks(master);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     reset = devm_reset_control_get(&pdev->dev, NULL);
> > > +     if (!IS_ERR(reset)) {
> > > +             reset_control_assert(reset);
> > > +             udelay(5);
> > > +             reset_control_deassert(reset);
> > > +     }
> > > +     INIT_WORK(&master->hj_work, npcm_i3c_master_hj_work);
> > > +     ret = devm_request_irq(dev, master->irq, npcm_i3c_master_irq_handler,
> > > +                            IRQF_NO_SUSPEND, "npcm-i3c-irq", master);
> > > +     if (ret)
> > > +             goto err_disable_clks;
> > > +
> > > +     master->free_slots = GENMASK(NPCM_I3C_MAX_DEVS - 1, 0);
> > > +
> > > +     mutex_init(&master->lock);
> > > +     INIT_LIST_HEAD(&master->xferqueue.list);
> > > +
> > > +     spin_lock_init(&master->req_lock);
> > > +     spin_lock_init(&master->ibi.lock);
> > > +     master->ibi.num_slots = NPCM_I3C_MAX_DEVS;
> > > +     master->ibi.slots = devm_kcalloc(&pdev->dev, master->ibi.num_slots,
> > > +                                      sizeof(*master->ibi.slots),
> > > +                                      GFP_KERNEL);
> > > +     if (!master->ibi.slots) {
> > > +             ret = -ENOMEM;
> > > +             goto err_disable_clks;
> > > +     }
> > > +
> > > +     platform_set_drvdata(pdev, master);
> > > +
> > > +     npcm_i3c_master_reset(master);
> > > +
> > > +     if (of_property_read_bool(dev->of_node, "enable-hj"))
> > > +             master->en_hj = true;
> > > +     if (!of_property_read_u32(dev->of_node, "i3c-pp-scl-hi-period-ns", &val))
> > > +             master->scl_timing.i3c_pp_hi = val;
> > > +
> > > +     if (!of_property_read_u32(dev->of_node, "i3c-pp-scl-lo-period-ns", &val))
> > > +             master->scl_timing.i3c_pp_lo = val;
> > > +
> > > +     if (!of_property_read_u32(dev->of_node, "i3c-pp-sda-rd-skew", &val))
> > > +             master->scl_timing.i3c_pp_sda_rd_skew = val;
> > > +
> > > +     if (!of_property_read_u32(dev->of_node, "i3c-pp-sda-wr-skew", &val))
> > > +             master->scl_timing.i3c_pp_sda_wr_skew = val;
> > > +
> > > +     if (!of_property_read_u32(dev->of_node, "i3c-od-scl-hi-period-ns", &val))
> > > +             master->scl_timing.i3c_od_hi = val;
> > > +
> > > +     if (!of_property_read_u32(dev->of_node, "i3c-od-scl-lo-period-ns", &val))
> > > +             master->scl_timing.i3c_od_lo = val;
> > > +
> > > +     npcm_i3c_master_clear_merrwarn(master);
> > > +     npcm_i3c_master_flush_fifo(master);
> > > +
> > > +     ret = npcm_i3c_setup_dma(pdev, master);
> > > +     if (ret)
> > > +             goto err_disable_clks;
> > > +
> > > +     npcm_i3c_init_debugfs(pdev, master);
> > > +
> > > +     /* Register the master */
> > > +     ret = i3c_master_register(&master->base, &pdev->dev,
> > > +                               &npcm_i3c_master_ops, false);
> > > +     if (ret)
> > > +             goto err_disable_clks;
> > > +
> > > +     if (master->en_hj) {
> > > +             dev_info(master->dev, "enable hot-join\n");
> > > +             npcm_i3c_master_enable_interrupts(master, NPCM_I3C_MINT_SLVSTART);
> > > +     }
> > > +     return 0;
> > > +
> > > +     debugfs_remove_recursive(master->debugfs);
> > > +
> > > +err_disable_clks:
> > > +     npcm_i3c_master_unprepare_clks(master);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static int npcm_i3c_master_remove(struct platform_device *pdev)
> > > +{
> > > +     struct npcm_i3c_master *master = platform_get_drvdata(pdev);
> > > +
> > > +     /* Avoid ibi events during driver unbinding */
> > > +     writel(NPCM_I3C_MINT_SLVSTART, master->regs + NPCM_I3C_MINTCLR);
> > > +
> > > +     debugfs_remove_recursive(master->debugfs);
> > > +
> > > +     i3c_master_unregister(&master->base);
> > > +
> > > +     if (master->use_dma) {
> > > +             dma_free_coherent(master->dev, MAX_DMA_COUNT * 4, master->dma_tx_buf,
> > > +                               master->dma_tx_addr);
> > > +             dma_free_coherent(master->dev, MAX_DMA_COUNT, master->dma_rx_buf,
> > > +                               master->dma_rx_addr);
> > > +     }
> > > +     return 0;
> > > +}
> > > +
> > > +static const struct of_device_id npcm_i3c_master_of_match_tbl[] = {
> > > +     { .compatible = "nuvoton,npcm845-i3c" },
> > > +     { /* sentinel */ },
> > > +};
> > > +MODULE_DEVICE_TABLE(of, npcm_i3c_master_of_match_tbl);
> > > +
> > > +static struct platform_driver npcm_i3c_master = {
> > > +     .probe = npcm_i3c_master_probe,
> > > +     .remove = npcm_i3c_master_remove,
> > > +     .driver = {
> > > +             .name = "npcm845-i3c-master",
> > > +             .of_match_table = npcm_i3c_master_of_match_tbl,
> > > +     },
> > > +};
> > > +module_platform_driver(npcm_i3c_master);
> > > +
> > > +MODULE_AUTHOR("Stanley Chu <yschu@nuvoton.com>");
> > > +MODULE_AUTHOR("James Chiang <cpchiang1@nuvoton.com>");
> > > +MODULE_DESCRIPTION("Nuvoton NPCM845 I3C master driver");
> > > +MODULE_LICENSE("GPL");
> > > --
> > > 2.34.1
> > >
> >
> > --
> > linux-i3c mailing list
> > linux-i3c@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-i3c
