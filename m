Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDF62E2375
	for <lists+openbmc@lfdr.de>; Thu, 24 Dec 2020 02:47:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D1Xyf4yYmzDqLv
	for <lists+openbmc@lfdr.de>; Thu, 24 Dec 2020 12:47:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.102.92;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=EjHyOErU; 
 dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2092.outbound.protection.outlook.com [40.107.102.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D1Xxr0kb4zDqLh
 for <openbmc@lists.ozlabs.org>; Thu, 24 Dec 2020 12:47:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fv9T8rd1zCKlVL0mW6h4TwYmrJ1hNPsuqGH6GW8Se2vQW0RFjB1BzdB9kuBIZ8QiOG7CCSQXcdr25Bn2RuBwf/JFyYiIv15CyFfDiZGW3F1N0l30OxdCxDoDmfUGK083AzRKhfNXYJXiimGnszjUbae2jD2IJJ41tbg6F0mtNwvHHiawC1LJLrTvnwkZT2R+2/ILN0vN/xjkhqs3bMY0W69A9I9RKOOkhBuERRfi+/ncEPDZbx//MHnQi8W7W7A5u4mork83TAlCjbbcBQeNZAVw1CjIAmwChQl6F5NTDmyXwoyLRov9WYzw0fuTfVmUvdkGawZsGRTmNWV61KXM3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1eyu7rwE2p9jaTD6SnF/mc3ChggUxRTMJJJBHpUN4rU=;
 b=bgAD2dTM8es3bA+w6Sjeg+8huCGmj5fi+3E6dfxQ3zA4BdyXLDp6IwbCALuMjIPe5FyUZobCEFP01FHl2nWwF694/pNU23D8hdystEykVoxPlrLiE5N2WWt6x9Nfh0KYg6e87mEkmSb+85d4IrCr6QFsc/3fKmBlP+Sn5P2CytDW6ZREvrDLBCUdjWxgxuWa7o76+NhphakfUOBexyHwZqpHKURnFYsUcxWdDc1L9xcWtDJT553AD9zzTvVMlaP3T9LLp/jk2o79Yv5cAAI87PHl5Uc0dRJ25xHMNgx7JRZIT0OqOvwetle8Ytaxp8X5jMLb8TICo4mWpoULfyaMkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1eyu7rwE2p9jaTD6SnF/mc3ChggUxRTMJJJBHpUN4rU=;
 b=EjHyOErUOP0D4yUVNUw+BrVCbRwnDRZd9XpouQ95bw66kvm9XfCVvUFlg9Gr267WJZmVig/kmciE0JZ1NsSQu+s9qK0RXG0KwH/3oSYA3VAE/ZeSUqA2CTGblyI4tV2y18vwDB3Uq2wkrbEhFeBImtJBDy6AkLWVPBUr2bT/Bxg=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from CO2PR01MB2039.prod.exchangelabs.com (2603:10b6:102:7::6) by
 MWHPR01MB2285.prod.exchangelabs.com (2603:10b6:300:28::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.29; Thu, 24 Dec 2020 01:46:57 +0000
Received: from CO2PR01MB2039.prod.exchangelabs.com
 ([fe80::8077:5998:860:1210]) by CO2PR01MB2039.prod.exchangelabs.com
 ([fe80::8077:5998:860:1210%11]) with mapi id 15.20.3676.033; Thu, 24 Dec 2020
 01:46:56 +0000
Subject: Re: create meta-ampere folder in openbmc repo
From: "Thang Q. Nguyen" <thang@os.amperecomputing.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <d5302c4f-c0c4-0bde-2a60-e943a2f41788@os.amperecomputing.com>
Message-ID: <0e2507bc-f8c5-85c4-cd39-4c603a729f4c@os.amperecomputing.com>
Date: Thu, 24 Dec 2020 08:46:47 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
In-Reply-To: <d5302c4f-c0c4-0bde-2a60-e943a2f41788@os.amperecomputing.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2P15301CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::13) To CO2PR01MB2039.prod.exchangelabs.com
 (2603:10b6:102:7::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.32.175] (118.69.219.201) by
 HK2P15301CA0003.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.8 via Frontend Transport; Thu, 24 Dec 2020 01:46:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: faa7f9ba-794d-46c3-fc33-08d8a7adcc23
X-MS-TrafficTypeDiagnostic: MWHPR01MB2285:
X-Microsoft-Antispam-PRVS: <MWHPR01MB2285A4082937C709ACB4E6598DDD0@MWHPR01MB2285.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wzMkyY6/xLd1dZGIM+Fo+CrtkDzl3P7xpQsZCWe4/oppZJDiBE24cri/cdD3PI7rOoO+tRbDrkOv1qMJhtNjYCJUK3O8RyW1fv7CTrXbkSF4pI+jIC2MqDufMcC0GrK+ChfzDOjOQR6AkbEv/bbppzzfFpiUhESUvfBzr8ItJ2C4YaXOFIFDPdSDrUv8PR1O9JhUEiGiJZTupgftq5hfhmgDPO9scUF373cfBnnNQZApHu6FF6EwDHsj7c0qWICYRCaRYMMDusKsIrpSgQ0EgY/836xfrwQoNCMUh9bkU2DsoqVUMsPWQcf5pZLXjFEgIsmCvh6tiBizWtZOPT4OTbdaCvu43O4EM6JPC8MkjAT4I/Ve5hMiFdVNTsX2Nd4Hpb7GcCO8sGAs4xaS2r0PYlEb8uCURzQ6bPodqfDcIaV9wegCPea7dZ2qYJqk7hHWGCdt1WqGyJ6NH4iDW9ReKV1Ulf1IWLCXzayg4jlgvkgUc3JKFd4Or23One9vlBp2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO2PR01MB2039.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(366004)(39850400004)(136003)(316002)(6486002)(66556008)(66946007)(66476007)(16526019)(86362001)(110136005)(956004)(186003)(53546011)(16576012)(52116002)(2616005)(31696002)(26005)(5660300002)(2906002)(8936002)(4744005)(478600001)(6666004)(31686004)(8676002)(41852002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YXlGV1lOZkt2NFg5MzVGS1BUeHFBeEY2TjZ3QkZOUHBQNUdlYUhsTko4ZHBn?=
 =?utf-8?B?R05Wa0Mxdk9KWFJ5NHBGSWdPdW00ZmxBMGFuYnRiU1ZFcXhSY1Fla3pjSkM5?=
 =?utf-8?B?Wm05Y29TeWFMdGl4WGwxamJQQTZXYkZHeUlwL2MrWlR6TXdNdG9PWEsvQXhT?=
 =?utf-8?B?bkMrZnFOVVJxMlNJRlBLVXFEYzhZQ3ZUSGV2VEJKMSt1NzZtZTFLMnV5UVlq?=
 =?utf-8?B?Z3FZQTB1TnhlZEpQc05IUFdCb05ZR0c0c0xrVmxRMTY2bnR2a2dicjVFQ0pt?=
 =?utf-8?B?QnhTY3ZRdHJGZ0psZFRxSzE3R1RTeHM3Q29nL09DTVVGR25XUXNTTWJKZmc2?=
 =?utf-8?B?eW1zOXRnOHhJOTB5dGJCenhiVE4vYnFlMWFRQTlKM2JwNnF6aWdWWTBlQklH?=
 =?utf-8?B?MzNUdTVYV3E5cjN5Y2pYanJoOTRLRDBGVkhwTmNhUzFKdFVENW9UYmN5cVVP?=
 =?utf-8?B?V3FhUTRxOFJISUVsMUVVV0hsR3IySE5MUExHck9XdlVHaWFVczVScy9hTVZ4?=
 =?utf-8?B?a0k5MzZJd2hWRjRFYlI4TWRUYXVuQ29UdXZiTlp3dS9KSmJ1Z1hIWE5Ea3Iw?=
 =?utf-8?B?ZnJhTVhENks5RXIraE9FZjk3UzUxQXoxZWt1MkRRTkZlVE0yVXdqZGcrYjZV?=
 =?utf-8?B?TFU3YUZyM3JMWllycVhockt2MURyTzZWMEVYWjdpTDdUWGtyN2cvWGlwRTNk?=
 =?utf-8?B?UWVudFR3YVhVNTVSZ1ZJTUwwUlhyNEFxVnNmWGtmZ0czMkkyMFArd0NuRTlY?=
 =?utf-8?B?enRVZ3hBdW9iVWtBNEJCcGMwcGFZY1M4cTJyZXYvanJyMDZnL2RNRU5CMTJr?=
 =?utf-8?B?N2xFd0drZ2RFOW1lZnZvbUxiVk9Mb3N5Rkd2eHpBRkd2WVc1UUNCNnpyM3ov?=
 =?utf-8?B?bWlRLzVjc3kxOUdPbC9xZXdtd21zbkszSWNnQ3IxM25QZTE0eXpNemoxdHZl?=
 =?utf-8?B?aW9EUE9vSFBuOHZucXFHY3RoY0xQREk4ei9qV25pcXZKWHZJbUloVDdCT1dD?=
 =?utf-8?B?UDVia1NSeHdZeWMvaUVNRVhxV0hSOE5TMmZuR1VsM1N2SnFaMjJJbGxLMUVS?=
 =?utf-8?B?eldLNzhyN3c2NHZMbWJVWWpJT3lsbnFCY0ljZzVsQkdoNkw3QVJNbWZFMlpG?=
 =?utf-8?B?cS8zcHZqbkM5WnhGdDVGUVdBLzdNWTE0QUZTRURsRFA4Yzlad2VFM0VMZ3B4?=
 =?utf-8?B?aHJ1dFF6cjVqbFpCSGlEMy9NakkwanEyVlJXL2oyU1BtdnV1REhWRytKNG5r?=
 =?utf-8?B?VnUvNEdHVkdXVW5uaVY0MStSZWIzOVJweWR0d3RxalZaMkF4cTl4a29vQUpD?=
 =?utf-8?Q?P4PvcHGTdlBhTpDqoQTyz7TElbyOQRonfn?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthSource: CO2PR01MB2039.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2020 01:46:56.5178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-Network-Message-Id: faa7f9ba-794d-46c3-fc33-08d8a7adcc23
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TA87n7dMuDrnd9gpxugzHV2yfA3tIX8wqzDnQ4ZYIPvTjCZP+btc2B/05nWCWGosOE0gNkaHuib9B+Vgp3s7rlTiYT3bllTdBS+xu++xQZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2285
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Brad,

Can you help create the meta-ampere folder inside the openbmc repository?


Best Regards,

Thang Q. Nguyen -

On 12/16/20 16:54, Thang Q. Nguyen wrote:
> Hi Brad,
>
> Please help add meta-ampere repository into openbmc as a subtree.
> The meta-ampere repository has been populated with basic bring up code.
>
> Thanks,
> Thang Q. Nguyen
>
