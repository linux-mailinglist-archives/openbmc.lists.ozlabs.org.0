Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F9D2CEACC
	for <lists+openbmc@lfdr.de>; Fri,  4 Dec 2020 10:24:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnS2j1znwzDrHg
	for <lists+openbmc@lfdr.de>; Fri,  4 Dec 2020 20:24:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.237.113;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=byCJl6Br; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2113.outbound.protection.outlook.com [40.107.237.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnS1v4Q6KzDr6B
 for <openbmc@lists.ozlabs.org>; Fri,  4 Dec 2020 20:23:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6E2Pvo4+bNmSztarRhixS/toNajvf3TOC3Wb1qMvA/kcpDADkM02wl77hA5Qk7MpIanQJLEMU2MwE/jCJDwKtzvNDXtnXhdKABXt/owMVwh2e2XmtdwV1XieQR3MiIxgucpRAuwUUvg8H8LHHiWpiRO9qQxlNoCjZAB/mDE3rAI+kMTBvFLqfqj9S0rIj5kzzciPSlDlEJWy2zVaj++LS3rKeY4zH6tn5weIq8xtGb6wh9jqKnRyD5Z0jXeoXiMWcytdiqbC3oVB8O9CkkS9yavv8etauTwtg6b6M7bBTzXlFFbzJ8SlQV6/r78avL1tWWBVrnioJjTdNOulYa94Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iard0FUlK1O8ETOZ+KpQdtd3F9JC2LbPPuJuy5/mIsw=;
 b=IdXm054PEXQEyIHcXTXWYRa56+xESApu2AgZ8uJ5ZReDtjvasqMR88uOOXJaVDSKGNIQMjAD2MGpZNToasjqKkJ8G2iLeQlP+OsmCilEY/ucxmI+5/zkrrk4uRm412bh/SlHewl3igOmyqpGiCebnUnUEVjUHALiZg/71E8kcEYU0s15XWbYYa91RPEd+RoXLrw2eCjjS50p82a12h6JJUo7PbO01B0yh5/um01HjfVQD86AJktRvO2wx2rCFefSHxgDEcznZQ2qYzw8l/yR0WpOelVUpzhzih23pgzVMrSJ17nUlRswdyfHwpSI3tgLvAT7fbvm2bKccRt8wmrTNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iard0FUlK1O8ETOZ+KpQdtd3F9JC2LbPPuJuy5/mIsw=;
 b=byCJl6BrgYSDruoLbanxvDJ0Nqc5M6ZXS9eM2uoiTFW27+XKbExm7Ommd3LBG+KX3p8exa4c/V83Q7vxyQrZAuEK2GWRlj7V0VoWkSlHkz0pppmGwWh94zXH3KfKgybA4vqw4e+aIWflRrFP0Q1ZXymQvEBhFJgnEFE8DkXibZo=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from CO2PR01MB2039.prod.exchangelabs.com (2603:10b6:102:7::6) by
 MW2PR0102MB3609.prod.exchangelabs.com (2603:10b6:302:12::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.25; Fri, 4 Dec 2020 09:23:38 +0000
Received: from CO2PR01MB2039.prod.exchangelabs.com
 ([fe80::9406:896e:16e9:ed0]) by CO2PR01MB2039.prod.exchangelabs.com
 ([fe80::9406:896e:16e9:ed0%2]) with mapi id 15.20.3632.021; Fri, 4 Dec 2020
 09:23:38 +0000
Subject: Re: Request for ssifbridge repository
From: "Thang Q. Nguyen" <thang@os.amperecomputing.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <1630860a-0de3-a89e-ab70-66ade1d8e0ef@os.amperecomputing.com>
Message-ID: <53f8ee9b-1715-0711-667a-47f0d44cae77@os.amperecomputing.com>
Date: Fri, 4 Dec 2020 16:23:31 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
In-Reply-To: <1630860a-0de3-a89e-ab70-66ade1d8e0ef@os.amperecomputing.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HKAPR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:203:d0::25) To CO2PR01MB2039.prod.exchangelabs.com
 (2603:10b6:102:7::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.33.9] (118.69.219.201) by
 HKAPR04CA0015.apcprd04.prod.outlook.com (2603:1096:203:d0::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Fri, 4 Dec 2020 09:23:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa2db3cf-a362-45c5-67e5-08d8983647f4
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3609:
X-Microsoft-Antispam-PRVS: <MW2PR0102MB36091E222468FFCBA8D11E8D8DF10@MW2PR0102MB3609.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Prvlsq/7bqblk5IK829+HfrJqqW8Pb5cIFYt0T2hrn5e/33/5vmg6Qt9p1HqDvVFuj3Y2xbgpCzrJbQOP4im4amnX4Qh3hpLMp5I8gPimCiAFaI0/BW5Jrw7zhlcXIrST1KQzu1zQHZu7OGH5KIVSXI4NSaHOHEW8bpQc/THVB956z2CsHXjAe/B0MCnmO6cQ0rQvC2i7Fy0j4hMmOnGjZ/FNq68ME4TSH0f6vEu0UR/vd40jSITCVzTIdG9CglDL5jFn6XH3W96YiorLlJUeuc9sQjg9WPU8Bn/givoraFRp/eb5Ta4lB3vemPx5YVdDL0oPtZnPge/uyTwg/tlw5JcFawhHo0f2KwxiLnZhuu7fF5aoaIOAiO0PV43wJ1So4z5l1AHFN/jsC094hliplo9Sf6evejwF8nVhIaLcNzC+huQrhr4hbgo95SSS7SAyNDJPOTIUrY8PRmiJwKrUM63GI6aKbKMsQNqX7hl5fT6uH2qWVEs2UrK8jr9ZPLd9BslVLT4cH+nQpwKcmFqPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO2PR01MB2039.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39850400004)(376002)(396003)(346002)(6486002)(4326008)(86362001)(316002)(478600001)(52116002)(8936002)(2616005)(8676002)(16526019)(186003)(956004)(966005)(31696002)(66556008)(16576012)(6916009)(6666004)(2906002)(31686004)(26005)(3480700007)(66946007)(66476007)(4744005)(5660300002)(53546011)(41852002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WUpSeDJqM082NXNZNDByamU2ZVZXczlTdEJXb0FpRW9CZ0NpaVkxQ1dMOElw?=
 =?utf-8?B?YUtTdi9BUXU2c1NmNXlTd2VKOEEwa3NLUDI3UnVXTTBQMDJlcm9ldXpJaUJB?=
 =?utf-8?B?blJlT2tyN1hsd3NRbmp0emsxTzE3dTdsckZZMHRVSWFuWEVsVWkrY2xZRGc4?=
 =?utf-8?B?QittT2hxdWdrdllyTVdPenNjV0NNa1BVQm1oWG5mbklFRm9ZU0xZSE5pdDgw?=
 =?utf-8?B?UWpSL0NDQTg5OERucDNYSm9xQytnQzZoVzBYYTUwWTFTVDNTeFYzbUVNWjFC?=
 =?utf-8?B?bm5UK24wV05xVzNjY0ZRZ3RwYjJOaG9ITlJDSkt3NlhRbDVrWUg5SHpXRml5?=
 =?utf-8?B?YnUrUy9EZnkrczBXTVJuTlJ6MlkvNURNczZUK1psclU3WTFLWk55THJiK2VN?=
 =?utf-8?B?RkxYVlJNVGlNYzMyQ0pvRXI1Ny8zdkw4S0Y4TGlsanZsY1IrbjNNd0wwcWg5?=
 =?utf-8?B?aW1BNWhwandQbnZoVzF0RHZzeEpRVUFFdmRlR29XTmMyckFDNndVZ3owRVVC?=
 =?utf-8?B?d3VQRG9XYUNiZEVaNnIwd3pVNVNKY0djQUkwam9ndWZ4LzNIandWSDRBZk8w?=
 =?utf-8?B?dE8wYXBYVFB1ZnkwSDI2T29BMlpjNVdGZkJveDFHYkpSNTdhNVdMeW83d3Zo?=
 =?utf-8?B?bjk5RXhwRGg4d25xWkRDdXE3UEVvQmVpcFRYYXlSMUZ2dXB3VHZsalhoYnc5?=
 =?utf-8?B?cktJTC9Yd096K21IdGVhZFZxYXhVVHkxZlNQQWhjOXAyL253VGR0dUtuSVo3?=
 =?utf-8?B?VFBPSktLNFFTZGszNnFjRzJWRkFoNGlEcUZGdFB4MU41M3Jqankwa0xCUTVU?=
 =?utf-8?B?NWs5VzQyOW5jeGRTcXNZVk5yOTh3aE1aWkpqZk1sN0JqVE1uZzZDYzYyb0o1?=
 =?utf-8?B?aXBEOStiMGFxaUpZWEVHTHZCU3kxUzBEc2xXRXFVRTF0amRqaXVaK3BxdG9l?=
 =?utf-8?B?c2E0SklFRUtCVjlSTzJlZG9yLzd4L0ZjWjQrWkZIY0NqTEhsTk5MejF6bHY0?=
 =?utf-8?B?ZFpnWDY5aHlLcWJjZERKaFRNYzVsZVhreTVIUXVWNHl5VW1XT0w0Zkl6ZWEz?=
 =?utf-8?B?VFgyTFhhRERXb2UxK2Npd1dENWgxSEpvQURiMFJKVHZaUmVCZ1BtVFNaMkc2?=
 =?utf-8?B?eEJidkw3L0hFNjJuYU1HOVRVY04rRnZDYnBuMnNURFFnQUE5VjlnUnlRMTlE?=
 =?utf-8?B?TFhLNU4rVm1COXZadGFnMzhRVkRYSnBzbkxSOGExVkh6b09GMGVNeTI4bEhq?=
 =?utf-8?B?cHhwcS9TbS9Cb3VHTUd6aStCL3VkWWFBdERNTzVYT0piMi92SXpIbFJSb3hn?=
 =?utf-8?Q?mU1WIyqWj5YpCFQG/mikBbPzOHo6Ak1i4N?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa2db3cf-a362-45c5-67e5-08d8983647f4
X-MS-Exchange-CrossTenant-AuthSource: CO2PR01MB2039.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 09:23:37.8139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6AfNqseZLfIQrKQE2Edc9xnnjVumgRPVIQedbBm26nwOvNvMIDZ9T2MI98cyubqUmScY1FOKq37AUT3BJa2YHVP1mGlTqDpxbqxI1vpOKf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3609
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

Hi Brad,

Could you help to create the ssifbridge repository under 
github.com/openbmc for IPMI SSIF support?


Best Regards,

Thang Q. Nguyen -

On 11/25/20 13:48, Thang Q. Nguyen wrote:
> Hi Brad,
>
> Could you please help create a new ssifbridge repository under 
> github.com/openbmc folder? We intend to publish our SSIF bridge source 
> which is based on https://github.com/openbmc/btbridge but apply for 
> IPMI SSIF.
>
>
> Thanks,
>
> Thang Q. Nguyen -
>
