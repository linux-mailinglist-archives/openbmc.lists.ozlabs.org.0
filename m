Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 967024407D7
	for <lists+openbmc@lfdr.de>; Sat, 30 Oct 2021 09:23:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hh9kv3NQHz303F
	for <lists+openbmc@lfdr.de>; Sat, 30 Oct 2021 18:23:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=cuYLTpVS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.101.106;
 helo=nam04-mw2-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=cuYLTpVS; 
 dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2106.outbound.protection.outlook.com [40.107.101.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hh9kQ5K8Jz2xtf
 for <openbmc@lists.ozlabs.org>; Sat, 30 Oct 2021 18:23:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtUXs3g8Wgwxkab1d69DpE5qIOAmkZ1VC1ESc83wBAxkvhZOrOjDOLNLtP9/3kHxbZtIhQVoHINkL5Kzt8rwfX2+SiBJ70Rqu8Gq8/Y4iZJ0C/aZkStqfmjrlBQ7okrY8wPDnCFHBiLEBCVdnALjkycSPFASAA32xNVEWzqZpFXHrOLvySdADIakK5qsfl58AHB3q2GG35yPmvE1v4acpPQ2KrnsSsYz9ZD1qqT1137OWk+F5JSr9LoAgTw7WE/XdihNPNdLwPNJaMfNXaiOPwAYmmqvnmo1DfQ1q97k3XtRECFHlINcbieLifBd919dFntbhdtIygvwSr0xr9lvzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdTgii4LzEHigkqo57DyC6ZdvEJT6P1S8fOnLs/X6b0=;
 b=Ca3Y1HlPTRP0dRb+KlFBXSB71dYSKTnUA+vodEvBRW7aoBLy4C4H6l0+gEqXxcSBQ/K+S6zCO42yZ2Q5LBlbwTahjYhEdBRSJuuwouA0vG2wCHy+PSBEjfeY5CDwxj5upvxA7be53ImqVqMJFffjOw585+d76bTOsbeeL/kOGvhtUvYV1uhKv+2Bsxfd9w7ewTazUXBWS3Ij4Ii6+nErmOojjzUebIq8es6LYPsM7Qy3ckoqMUKOe8d50t3LQ+19mq+pbccESZj3J9QySHn3+tRB/Ph3QR4t3Y8fL8uhDiJ6jLEDW9SrXO7at7x7kJngf8b4FeA88i7uqxoQuxYQUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdTgii4LzEHigkqo57DyC6ZdvEJT6P1S8fOnLs/X6b0=;
 b=cuYLTpVSBV4IirBJrIODVNq+h1UIDS4GNZszojZLU9M2Q1ZGJa1O1yT+/9+OMmi20kpvEGyYY9DMDl8p//ehZ0iq7tzvDWhpg6AmP4Lp0+sWL9fzwRs/a4Pf53agd9oqFvtGGvPW/jX7xyRg9XQpzlhZbE/2PRFr3EBrVFzkXA8=
Authentication-Results: bytedance.com; dkim=none (message not signed)
 header.d=none;bytedance.com; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from SJ0PR01MB7238.prod.exchangelabs.com (2603:10b6:a03:3f7::22) by
 BYAPR01MB4181.prod.exchangelabs.com (2603:10b6:a03:13::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15; Sat, 30 Oct 2021 07:22:47 +0000
Received: from SJ0PR01MB7238.prod.exchangelabs.com
 ([fe80::1d89:1ea0:77b9:2328]) by SJ0PR01MB7238.prod.exchangelabs.com
 ([fe80::1d89:1ea0:77b9:2328%9]) with mapi id 15.20.4649.017; Sat, 30 Oct 2021
 07:22:47 +0000
Message-ID: <f8871d43-0a8f-50f1-c672-ef079ebe532e@amperemail.onmicrosoft.com>
Date: Sat, 30 Oct 2021 14:22:39 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [External] Fix u-boot 2016.07 env fail on 64MB layout
Content-Language: en-US
To: Lei Yu <yulei.sh@bytedance.com>
References: <dcebf35e-56a3-4f16-0380-841925e093f4@amperemail.onmicrosoft.com>
 <CAGm54UEHiq0BwAMGWAZ=dsfydwDxLD8yvqfZ5FEuWCQY4h=7Jg@mail.gmail.com>
From: Thang Nguyen <thang@amperemail.onmicrosoft.com>
In-Reply-To: <CAGm54UEHiq0BwAMGWAZ=dsfydwDxLD8yvqfZ5FEuWCQY4h=7Jg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR0302CA0011.apcprd03.prod.outlook.com
 (2603:1096:202::21) To SJ0PR01MB7238.prod.exchangelabs.com
 (2603:10b6:a03:3f7::22)
MIME-Version: 1.0
Received: from [192.168.86.197] (1.52.235.153) by
 HK2PR0302CA0011.apcprd03.prod.outlook.com (2603:1096:202::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.5 via Frontend Transport; Sat, 30 Oct 2021 07:22:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96b1c0ad-b199-4b89-9e71-08d99b7612a8
X-MS-TrafficTypeDiagnostic: BYAPR01MB4181:
X-Microsoft-Antispam-PRVS: <BYAPR01MB41814F812F352E23FB2231A28D889@BYAPR01MB4181.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wvUxO0iamDYuEi7blUrYoeCNOIVk6GPGe5sj/K4dXTlRjpsARrKe2L01Q3Lkvd0jvGpuG8NhUNnRHioZOgd4CCoiL9Yk1L/qG8j7au8hyqhdMtoiD6vKhFtd469iUUI9tVQZMmr5bBTjp1TOW/9E4QuCqAOyzDp8x9UHXFuij2BzQFGZB6uaooKpBPPjhinp2U632cPDBaZbA2FMc5Nq9Tz2q8XcrJuSWSm8bIAthSad4RkRPhWfpvURGwEzclVtBnnushwOhdiJOPbjZ/zpS/bKBUcObkBU1nPLKct6210iV79rgCHAMWh+LUYX6PD1bkcWeplzjHv5Pv/13Auld+I+RocUzS4naCYQ3TFY7FNZD23wfWsV1xeVM/Ih9MooLhrUOmNsLuaowvzvCpNjywdaE++9XtaE6hlp+8HwCo/3wOpLSAYgajOT6Yx+w2UUy+SZo2nU+RcWMkJlwbBqe88fsA16G++2Sn5nkGYJVS+QUASrei3V/yAzAwbaQk9iWrTasqOhfx/3RYMukI5iJpGL5Lq2aHEfIY1iKUYwaUdAp/Mgrd0rdZNJX1TLWEIzx8D2D+ymJfXCdUilkyK7tca20kmg7Rr/Mwrbk/q+WVihyPAXmLyfs9wfTN9+Xn5A9rgNzVhaTYrUZ8NpD0OOm53HlOczaxkIJbUCpV0p7OBXr+NI9UoaWBEApRmxDahK0+FiCWI2zAZDaXtEk+k7niNk54vhGGFj+Mf7yTd3pN7pwhDZ70RJEDLJjtp8FIIGOxatKBaxp8SCyM+SctvwHL7p54UsEVkFSdibOIJHBcWgk6jbJ2s3buAcqNxQ4UDe541I5rNfmK66HY4XgfCONe8pEcsbV2rJygY+4I0bNBI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7238.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(66476007)(66556008)(6486002)(38350700002)(66946007)(52116002)(8936002)(83380400001)(4326008)(5660300002)(508600001)(316002)(966005)(31696002)(38100700002)(26005)(53546011)(186003)(8676002)(956004)(42882007)(31686004)(83170400001)(16576012)(6916009)(2616005)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjBoMDZteVdSK01PT2hrK3hJaUtZYzcxS0FGK2ZrVXNLdnFjVVhjM0FjVU9R?=
 =?utf-8?B?YThEODNRa1VnMThDRUtyK0VzNWdyTkZ5ZWxPb0hSSkdTSEk5MjIrM29oSFlT?=
 =?utf-8?B?Q1I5QkhyUGtZemtSZ0ZrdW1ycDVIUjJlNzZJR1NSaENnamNiOExwV1A3N29r?=
 =?utf-8?B?RlZXZ2lMSGtmeXhhc2kwR3NKdm13bzVGRjFMWnIyZzJUMHZSWWZ4OFhJYWI5?=
 =?utf-8?B?SWo0ZVhqejUyeXNXN2tqalRqWjNDT2ZBVFlJbU9RSnZDcnBzTVR0dVlmeG9C?=
 =?utf-8?B?QkRTVzVzVmR6alY0NkZReWdKTDRRQzFIN1VwNXpMTFpIcTlHTUtGemx2TG9a?=
 =?utf-8?B?QkdjY2JPbkdncmtaMWhIczFKS1RmREJpMndpY2FwR0x3dzl0SkhyYXRzc05C?=
 =?utf-8?B?cEliYXlBZ3h1Ui9oYUh5bXpaMk1EMVRxa3NQaDVaYm5KNDR4SUR5Z2N5OXVI?=
 =?utf-8?B?QVA2Q1BRK1Y3Zzk0TzZQczBBTkZNQmhoZHJmeHJlRTlJZzBydUNhWkN6cXcv?=
 =?utf-8?B?TXJTNmowalhkWGJ0M05ycGthU0R4QmJiTy9nQkRFbkp1MGVqNkdyNFhsRkQ1?=
 =?utf-8?B?Ty80MHlZMkN4RnAyMGlhM3FYc3VLV0hBbXBJT1I3eno4WXRPT3hyamMrVmlI?=
 =?utf-8?B?b3VkSkFtSno5ZGtXZTVUa2FFQUs1OU5ZeHVuajJFaE5UZjFoZ0tTOW5uQ29X?=
 =?utf-8?B?VTV5MXErakMwVWUwYzNyTXZSV0RmVEk4cDVPeVJQVWdDeGRPNEZkcFkxYUZj?=
 =?utf-8?B?eDBPRzQvdGtYNzNIRTgxUUVBcWRoamNxWWxsZnZpM2lOVkxISTVmeXA1K0RW?=
 =?utf-8?B?YlIycDN3RG9BbkxhZlhUYk9CdU9NQU40aCtPZ2E5S1loeWZBTVRuWUpXdTFD?=
 =?utf-8?B?NGdjdUpCVkl1RHBHY1d0RXhVQzQ3N1ltVDNRTzM3cU54d3dCRW1VSll3VHM2?=
 =?utf-8?B?QjZUOVVLTll1dWZENFhOWWRVQ3E4YTJzVm5lcGlSZjVPaDhUcndBZEM1NUo2?=
 =?utf-8?B?U3ZoeFpMRE9vNHJNTDFKWUZXajVnb0VYUkp4MFJJdDV5bCtpTWJqS2FsbEp4?=
 =?utf-8?B?MldGa2NMNmt4ajlkQ3pkejRwN2tCdnJwS3NPTDlraHIvK0E0ZXhBaEVSMzZo?=
 =?utf-8?B?emROTFpLWUl2S0ZXamFhWW9YSWdrVnFNWDlNMDU2RnFJdzBaUTJZKzZsTmVS?=
 =?utf-8?B?RWI3WklaU3RGOG1hUHJJb3BMLzNkb0RvRWpldnRVWkNzSU1oNjRuN3o1ZnFv?=
 =?utf-8?B?SnlwU0hGRUNleVZqZi84MzFGLysySjBTVlE0bEcvYkdlK0lRS1Y4ZVliY1dk?=
 =?utf-8?B?VVhUVmVVM3ZONVBCdHRaQ0JwU1graE40V3o0WXFPNFRoSUViUmpVeXdkaXRN?=
 =?utf-8?B?Z0hXK2x5VDAvdWVVRUg2a25OMzk2bFI1WWw3bVR0dHhJendCVWxFd3Q5KzQ0?=
 =?utf-8?B?dWRGTjZpYTNLdnlKY1VwU0hBM09pM2YzVFA4cytkZEdZOHRuazcwVXpzd25K?=
 =?utf-8?B?dXFsTUY5SkVCVTNLajdhczErRE1oY2U0S0p1Ky8zdlNXd01nZ2JDdHBvN1p4?=
 =?utf-8?B?bHBRNmtyYVRsbU1uSmkrdHc1NEZ4RThqOTd4QkovcGV3US91SlVkVjFjVzEw?=
 =?utf-8?B?ajhJeWgvZ3lISEZCTnVlOW5IN1hxSVZ4ZDFaNHJDUTdBaE5QWE1vUjZoOTFn?=
 =?utf-8?B?dkpaUmdlSGVsUURPWHdUb3liLzFjNnFuNysxRWtVTWd2RUJ3WG56N2VYWXVS?=
 =?utf-8?B?UWw0WXpkc0QvbEVtb3lmdmlTaktIMzBsWE5BS25NeGxQT2NpY2NlMTJWdmRD?=
 =?utf-8?B?SGZMalNhVlIyTFhLQmsrdEQySXdoQ09LdUpjbGx1QUhKZkpLQVZGK2ZiTllD?=
 =?utf-8?B?cGwwc1dTc0djWVFjMmQvZURMZHZCak9oWVJnMjk2SkhMQi9WSGZaYUdDSWs1?=
 =?utf-8?B?R250UnZPZFA1a0NGS3FmRXRKVExJc2dQWkp2ek15b3plSklraXlHcWMrdDdN?=
 =?utf-8?B?TVlFV2l3RTFFZWdZMWlMMkw0M1Y2YTFBcThabjRJUlVDZ0hBSDdFTitHekpj?=
 =?utf-8?B?V0pjemlFZlIvcXMxdnl4ZXBzTC9DQnNUWFd3OWNsa3MyMFFHZ3IwU0dEcnMx?=
 =?utf-8?B?OXhJSEZkNS9MbUNiRGc1SEFnQkFJUDBYZFZQNkViT2Z1M0wrOWtsZmVJRHBz?=
 =?utf-8?B?UTlZMDVzYy8xS2dLemRRZ2tnWXpsS09SQjNLaXRLelRrMTBYM0JEaENEUE1s?=
 =?utf-8?B?R3pJWVdTdUF1NXJ3OG13UTcrejBtSmVzS2VrZ2UvYStGWVQ3RHlZSzAzeFpT?=
 =?utf-8?B?QkxkUE9Ob1pRZDM5NlhUNFN4dGlZRVRzbWE5c1VHYWRzc2ZDWWVMdz09?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b1c0ad-b199-4b89-9e71-08d99b7612a8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7238.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2021 07:22:47.4208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7UXrfV6vJbgRk6ekR0VKARFByEXwRVZq+4hU2bvzcxOfzz4seoLwIeMpISYUR36ZBGjvxtgFgpDgx+bJnfu8MXa6akmQ1uYgfxwSl+1kHB3Po8VnsnEBgslmX3kgZYw9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB4181
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 29/10/2021 19:39, Lei Yu wrote:
> Please refer to
> https://lore.kernel.org/openbmc/CAGm54UGMSVkT=3WLVLrJwcW8OGcQJZOGYnhVvOrF1qVC7xtdvA@mail.gmail.com/
> In short, it's suggested to use the u-boot-aspeed-sdk recipe instead
> of u-boot-aspeed for the 64MiB layout.
Thanks for your feedback. I tried u-boot-sdk before. But I just want to 
know if we have any solution to support in u-boot 2016.07 instead.
Supporting u-boot-sdr will need to add device tree for our platform. If 
no solution for u-boot 2016.07, I will change to u-boot-sdr.
> 
> On Fri, Oct 29, 2021 at 7:16 PM Thang Nguyen
> <thang@amperemail.onmicrosoft.com> wrote:
>>
>> Hi,
>> My platform uses Aspeed2500 BMC with 64MB SPI-NOR. Since the change in
>> BMC SPI-NOR layout at
>> https://github.com/openbmc/linux/commit/985c3f59cc645c397726ad4ca0872cfaf7ef2579,
>> the patch
>> meta-phosphor/aspeed-layer/recipes-bsp/u-boot/files/0001-configs-ast-Add-redundnant-env.patch
>> becomes incorrect for 64MB layout (but still correct for 32MB SPI-NOR
>> layout).
>> Do you have any idea on correcting it for 64MB layout?
>>
>> Thanks,
>> Thang Q. Nguyen
> 
> 
> 
