Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BBD5B68DB
	for <lists+openbmc@lfdr.de>; Tue, 13 Sep 2022 09:44:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRb8F2vLZz3c8C
	for <lists+openbmc@lfdr.de>; Tue, 13 Sep 2022 17:44:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=jIAVYy3/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.92.105; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=jIAVYy3/;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2105.outbound.protection.outlook.com [40.107.92.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRb6W1JXXz3dpR;
	Tue, 13 Sep 2022 17:42:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PuBfzwSISrCjUkVX4HqqDWto+kaxp0h3eksBYtui8nhpoMOtUk8t3dqBRGTGvjNPFuO6lQEvnd45xxorjTvtirSEXiFxciARHco//lZ9bs0qYukNnovPtL+vHUQAPsTfkCgsmb1O1g3knb7TPHQit77VpHXai/J7BLgWNOzBAvBHrGwRNMc5Xub7u6nMlgd5NEUWQYQrPu1Lquofk6Ro1kCDZg8I5B4sgQYWTS0EpkKNQXkofUVxTN7OtDRATqX/OApDGc90I0ye9ONhu+aJsEsW4+6HOeUWN3A5qVYuCfIhU7OlBLms+NvshX9dTxUHHUef36WO8V3xHn5sp3UN9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UppUR+ksivsVK4AlG9Vk+DM7SriyHHww8cFkH44ohIs=;
 b=YVTnszU9uAOyPWZ3kRr8S9Gi3ZaLpcYpCjO2BBZhrhMtq1XtNwBMGtRKSyHChOrlik+pd26UVqlz7m/5QedytQTeBRMATRoH2Xo6gADeeiS/dJQXN7ELsp/oB2EfCt331j3sxmcMB9s0dM/8bNMoH7+9+ZjBTgs64UPR9l+HnmsWi/WqDE799Shy9iMhGRjfazLeVUzrIEvXRs+c9+eRYkQtjDUnvnc1BlbeAJvGyVbhEW9y8Wn5+cxaOpyXgUdWeUXaRESWL0kNP7yq4f/ArIJ+j6z98o//+yOnWQQ3wo9emD5VnCFtfOpM/po2zTLuQcoBYe0pojoCTbgsnFvKYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UppUR+ksivsVK4AlG9Vk+DM7SriyHHww8cFkH44ohIs=;
 b=jIAVYy3/sq96C6EuDItxaenFrisuzDn5ejSCFBR+CxS8rtjKGBWc4z2uTDgfqg+oa0QyzUC+AivObNvgw4jVcliqT3MC63MczRj3FTlJVcO8C6XlAVBRBSPprCW+p/R/XAkVbJpuYLmIJ5kQMtTY60UwU/4NzynsXsPXhMGGfwU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 SN6PR01MB4205.prod.exchangelabs.com (2603:10b6:805:a6::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.22; Tue, 13 Sep 2022 07:42:26 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::48f7:ac49:a2f8:614e]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::48f7:ac49:a2f8:614e%5]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 07:42:25 +0000
Message-ID: <b34ab4d0-c14f-caeb-afde-01655b35a236@os.amperecomputing.com>
Date: Tue, 13 Sep 2022 14:42:14 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Add device tree for Ampere's Mt.
 Mitchell BMC
Content-Language: en-CA
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Arnd Bergmann <arnd@arndb.de>, Joel Stanley <joel@jms.id.au>
References: <20220817071539.176110-1-quan@os.amperecomputing.com>
 <20220817071539.176110-3-quan@os.amperecomputing.com>
 <CACPK8XdDpG3ONM1=-E6qvHL1FgMNWSMPoL_sVGJK6BmmnT3w_w@mail.gmail.com>
 <CAK8P3a2LZKfZpdTQ-R4o9mJ6dk52VRF+Bxj=PJEx-1MA4yH8+w@mail.gmail.com>
 <673e200f-f458-7866-f956-3d5bd7160a49@os.amperecomputing.com>
 <CAK8P3a3MU7shuBpcpRNC5L6xxQmSy8FXCX1jvYXhv-NT3PMYOw@mail.gmail.com>
 <396a3c24-2a86-0d1c-07f9-386a0de1d473@os.amperecomputing.com>
In-Reply-To: <396a3c24-2a86-0d1c-07f9-386a0de1d473@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0037.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::9) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|SN6PR01MB4205:EE_
X-MS-Office365-Filtering-Correlation-Id: a308a95a-2f5f-4fd7-e043-08da955b8057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	eBixUgJfDYJCSYqCo55NU7u/WXi7/Gq+a2NIj6Qy+jdAxnS2FXo9kOG/bn0GSzrVtEKFMhNVgH8B0B2IIovKkFsay8Ihym3RmpR4NMA6mps6H+0c9HO1vbR3L7p8paYLYQioohvi7HvgJnwF8mcQaLVYC7XPcRQSzsM/B2blqX1rX26LRltq0nBGaFXLlCXldhEB8o27S9W09tsIkVqjVY7x16dCZO+kFgMkTlkYxNCiEJfQbejmkYPOrS8y321X+nq++WyJubrGeijqv/Gr3/svdbRlXQDAsDRuXuinnTZKgX2auRpJ/jvc9+GowBkJNhHo6VK7Jsi7LRfkc0L7suTzVEE5x7up+wvepQT/kuXaAUS0ZviojOMuZ8Vb0/HXFJekCHfAyb9D2UHNGXxRKSKppzakj6LJc451ywmEMZ2LYtakt5oHVeBokgxfgoqi0waS56LLGH3UjqZR502+4uCtvDQRSV7902EtdtClhgXqYCn0SmRRnGqkbSF9Kc6jsqtDJ1ZqNeQOdAvEsUaOMMJfPtuqayvUeeNmLaiQFflea5oj/M5+5Ie0yMHJweeLhTZEqL7IwBPCIPWYEXp9iIOcFsFRvmqOxPVLmRnotfMcBto3/ILYMaqG7wcMhUW3CjltA+35cp/oymmbfS8qXSqUOgKuwnozhKcBD8ZoULuB7h92hvwC0zGbcGMZ81/7iiQVknKweQp8AmcjTuAbKPZCqmExH7dRXEvweZ5JzKL9RYqlJWJi/LdBUZknMoMCbN2uUqLSB33WQBVVz9z5ZvCUzbhRR/r+2eyXm7Ex398=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39850400004)(396003)(376002)(136003)(366004)(451199015)(4744005)(110136005)(54906003)(26005)(6506007)(53546011)(8676002)(478600001)(52116002)(38350700002)(2906002)(2616005)(6486002)(316002)(6512007)(86362001)(7416002)(6666004)(107886003)(186003)(66946007)(8936002)(66556008)(66476007)(31696002)(31686004)(5660300002)(38100700002)(41300700001)(4326008)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?aktxajV3Lzd3VUpldkNzbTJ5a0RBdk8wVW91T2R6QVhqZCtCbjZPeWRwSnpy?=
 =?utf-8?B?VVFabmRqdTVNS3k3QXo2UDJrVDNEV2JQWEFEZnlCN3FPQ2gyNVF6clRiZXIr?=
 =?utf-8?B?QjUrYlVTanE2QkU3b3pGdkJRblFnbld2RE12a0pZaGRKbjNvWGE3VFpaR0Fi?=
 =?utf-8?B?a2Z3eXBmdEQ1M2VLR2ltVzRpaklMUzk2VDFiMFAwU2dLUmd3Vkl4U0FkMGZK?=
 =?utf-8?B?dWgrSktaNHJiZVZkNGh2WDJxRlhKY0pka3lrdEM1RGV4MDhLTmI3bkRzbGZI?=
 =?utf-8?B?ajVJSGloWi9nTCtDNXBUMWVlSHByTzU3MFgwRTNzVmJaV24zOEdwMVNnS0ZY?=
 =?utf-8?B?K2l3d3VjREd3Y0QzYW5JUWJ3MTFYbUo5eGg1ZGw3K0JBbnJJR05tR1BQNVNu?=
 =?utf-8?B?NlZQVEtvVGRGRGIwb1lHdm52M0kzTFptaGFGamJscTg3TVVHQjRYT2d6c0do?=
 =?utf-8?B?WS95K2wzTlJBY2dnTmcxNVlidHJ6QXlvN3lFOTYxcnkreXkzQ0Q4c2ZkWkth?=
 =?utf-8?B?UHZBZERIVm5kcUErcTF1eVJXR0F6M3FtWUsrMU1xZGplSDB0VUJVNVRKUXBE?=
 =?utf-8?B?Z3NOckVJcUswd3VwS2pqcXFwd3hyVEVQdTRIMnJkcFRheHpyWDI3TmU1bnJo?=
 =?utf-8?B?MFU2ZGkzTWhYa25ibGVWTGt0OXZkaCtPaHZXQk9DR1hCOVpsV3cxUWdTdWsz?=
 =?utf-8?B?K1JWMlBQeHJZdWNlTm0wR0FCQUFYOUZXalpFNlMrWkpEd3ZiblhKUUlNbjQ0?=
 =?utf-8?B?YjJ6Mks4VDIreDAzd25KbE9XeTBpbEtrTUpMWW1xVnF1NFRualZYZTZvMFE5?=
 =?utf-8?B?RVNYNTAxa2Nkcm9lbXNBazRwbWRhcTVPQ3FoZytFa0JYVnc4T3pWUE1lelFK?=
 =?utf-8?B?eTlSb0ZvOUdPTmRZcHBqQXMzcHpFY1hxbzlZQU9iZUlrbXFuRXF6L2xpUkZu?=
 =?utf-8?B?UGQ2alBaY1dYcGNFdXdibGFFK3JWS3p5bHNSMitYeXY5aWNNSHN5TmoxQVFQ?=
 =?utf-8?B?OC9TQWRhcVRYS01HbUpGZGc0ejNWWUNQcWFvMnRRK3BiQlNxMmY1MVBreUFO?=
 =?utf-8?B?QVVHQ3ZuUEN6aW9LSlYxRi9ycDdIY3RsQm83a2MvZ1o2Z2daV1VEV0hPQkpS?=
 =?utf-8?B?SDZxMHU4bXhxQkZQVko1dDM2d0NXOEc5Q1ZCNzM1TWJNSHJ5cWUyTFpFdE13?=
 =?utf-8?B?QUIwTkJOYm9JOG5HRnExOTBlMGZTbDgvUm1CUFFHbkk2bXhUc1VrZUJZZmpL?=
 =?utf-8?B?czF1c0hVaHdDZ1J1a3lBWW15UGdrbXYzdlBVR1RmSVBjVlNXSkpUN0d3ZHlT?=
 =?utf-8?B?R3dqZzZ5cUlkYnFZREZxelgxczVNem50Wk1hUzhDNmRRck85dmhzZlVOdDBm?=
 =?utf-8?B?M0haUGQ1Zk1UNEE1UUFMOW5JaHowSFZ4THcrU1RIelFGaENSc2JkU3FCRUVT?=
 =?utf-8?B?VVltWDk5YnVnaERST29PWjUxS3ZweVFpZEJaSzdvY2NLTDVYRkpVaDdUdUtJ?=
 =?utf-8?B?eUFqZWV0ZGJuK2ErSVVUcWZFYUFUNmlIUWpOYnU3N1pxTGZOZmtWVFVzNEtC?=
 =?utf-8?B?Y2k5YWJaRWJUc0dYY2czZmRyR1YrL3JocXVoNlVnREsyZ3JxQi9kckNod2dy?=
 =?utf-8?B?L1JEcmxmWG1pQzVnZC9PVkNUOTRqVmh2QUtZZkVieFEzS0hTUDljNEhRRjlK?=
 =?utf-8?B?aFU0d0YrbVRHQU1EWFhTNzNVVW96ZGVIekVnRElJdWowWlBOM3RJL3VaVHJ6?=
 =?utf-8?B?c04vbHZ4Y1hYRlBYQ1pjZmNSOGJkVnB4elU5WlZkZ3B6M3Jubnp4d1hQdHB4?=
 =?utf-8?B?SG5vczdQU3BMVFNwMlFaWk9IcjQyaTcvaFE2aG00QWJnQXQzTjdXdmFURDhQ?=
 =?utf-8?B?bUtESk9JUHlQQTB5NkVFd3BGWGJuaHVycTh3WFYyTldJaW9Qd00vWmJMQTds?=
 =?utf-8?B?WnpqMzhkbEFGcVVFRUdReWJ6RnhYKzZIU1EwbjlYMkVrQXVCWlAvQWdjNGZx?=
 =?utf-8?B?YmxiMHZKdWtRR2trK1phQ21wUWh0dE1MQ2h1bWtpWUR6bGZuVW9ITURWSXY1?=
 =?utf-8?B?N2J5TmE1NTYvUUdYVENIZGQ5YWNBei9xS2V2TVV2SEp2eVVrYTdZaStGSGsv?=
 =?utf-8?B?MlJ4Mm1JRTlJMExwc3ZBOStyMXNrRWhNMm9XdU4yRCtudGpFdVNZMzJDUzlJ?=
 =?utf-8?Q?x7lGFpTwh676YNNWaeX6r2M=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a308a95a-2f5f-4fd7-e043-08da955b8057
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 07:42:25.7603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yGNrL2TE7NHbQCqmpP5mzdUvkrEjiO/nDf4gimb5LSa7wUKnYHf6+c6zIeSofQBdWKHXXYtKmSd9nRPiESHSkJpdJRmDhcEA5kJ6ZZ3N+m4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4205
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, thang@os.amperecomputing.com, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Olof Johansson <olof@lixom.net>, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

Just a gentle ping on the patch.

Thanks and best regards,
- Quan

On 05/09/2022 16:45, Quan Nguyen wrote:
> 
> 
> On 25/08/2022 19:35, Arnd Bergmann wrote:
>> On Tue, Aug 23, 2022 at 10:27 AM Quan Nguyen
>> <quan@os.amperecomputing.com> wrote:
>>> On 18/08/2022 19:06, Arnd Bergmann wrote:
>>>
>>> Thanks Arnd for the comment.
>>>
>>> I think adding -append could solve the issue.
>>>
>>> But as the bootargs still exist in all other
>>> arch/arm/boot/dts/aspeed-bmc-*.dts should we still keep bootargs for
>>> this dts?
>>
>> I think it should still be removed. Only 238 of 2547 set the console 
>> using
>> bootargs, so that would make it more consistent with the other files.
>>
>> Changing the files that have the same issue is a separate matter.
>>
> 
> Hi Joel,
> 
> In the meantime, I'm just wonder if you could help to test the patch 
> with -append and get it merged.
> 
> Thank you and best regards,
> - Quan
