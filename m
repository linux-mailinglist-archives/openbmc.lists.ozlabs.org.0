Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 989915F27A3
	for <lists+openbmc@lfdr.de>; Mon,  3 Oct 2022 04:07:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mgkkc3ZtHz3bmL
	for <lists+openbmc@lfdr.de>; Mon,  3 Oct 2022 13:07:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=MVHD9lkz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.93.121; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=MVHD9lkz;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2121.outbound.protection.outlook.com [40.107.93.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mgkk23y6nz2xKV;
	Mon,  3 Oct 2022 13:07:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVUGOZA2Aj2BLlEsXeqPPukUv1B0k7gm6Xupia8A0cLFqVbxO72NRuJUT/Fp5hgA3Ad/2tIDqmeg/+k2leGkRE2kmK2a7Xn7b0MsAyTzhdoLYklOn6aj8JR4t44BLeZeHZsOMW48eNUf5u0xnSwIvtqXT85/vBgxKoPps5OS95+6uTv5NSihSACsyJQf9SjGTlZ3skNc92AgPuCVmXzfN6A0EQs6l4zcubkylvWMas9nporPpuNTTthuhk38XMVQjVYmyPudl/jDf1PvgcwWktEXkVDoueU8RTZuuYda1953FlGTQlGUNn4VxH3+NyqiUtL2EDLALXxCyhqA056tng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJF7lEU29hulWOvjccvil+fYO0JjpejxOmTyumoNdbo=;
 b=AGTdC/GTAxqBekv6M/djp7t97yJkJaitcCEwxC9sgwuen6boetBp5OBM9IvquELQGkYgqKe/A3J64+ms4CA85xwwBc5ZAWlhxKU0NIMnQ97rSBO9LiJ3Mr6h4Bg6jdxsgxEFQqxdMqeBddDLh5lYguDraV7W6S4j8GolniW5a1glk6nwCOt7xaZBx3Trf8U7MbTTRIyuL5uwuS8Ycy44xZlMf5tkFa0y7LQnkbXBAuUzaXL8KWn66UqcQfjLTlkWwZHQAaSpjp8Y0dTpVsVct2JF4fD5ye7N0p3k/aF4OxEuLf37N6isq7FmsWU24+GsJ5o9PZ7VxAwPzMLvm8bfMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJF7lEU29hulWOvjccvil+fYO0JjpejxOmTyumoNdbo=;
 b=MVHD9lkzP8dbRH5dSM9xKB4MN3+XJmWuV6ac7eSrbudv0RsKA505DPYIhY/1vbzSuxBibeqwzPS4U5iTg9zVzOT0hVQq1fQrUtWjGkQ5myq8l+TCdTPLxMGrfQMGSAFSGSNhcN6UXyp94px+XNfIpptCnReM0d8fctn4WBGBL9k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 MN2PR01MB5776.prod.exchangelabs.com (2603:10b6:208:191::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17; Mon, 3 Oct 2022 02:06:58 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 02:06:57 +0000
Message-ID: <b35f756d-08e7-6eed-5992-ad63ee419e1f@os.amperecomputing.com>
Date: Mon, 3 Oct 2022 09:06:46 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH v9 3/3] i2c: aspeed: Assert NAK when slave is busy
Content-Language: en-CA
To: Wolfram Sang <wsa@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 openipmi-developer@lists.sourceforge.net, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,
 Open Source Submission <patches@amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>, thang@os.amperecomputing.com
References: <20220929080326.752907-1-quan@os.amperecomputing.com>
 <20220929080326.752907-4-quan@os.amperecomputing.com>
 <YzjFRrCRZBAaSRBL@shikoro>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <YzjFRrCRZBAaSRBL@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:3:17::16) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|MN2PR01MB5776:EE_
X-MS-Office365-Filtering-Correlation-Id: 1490bbca-1b1b-44cc-8ddd-08daa4e3f312
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	fgsekCKofs+++yhDCMllUAGltlP4IMItFEhAImraOsg3FBdMdx1YTiuL3ESPkofEb8341n2KfQzFFbu/SdiMZWUfKNwJ7G0x76liEcCGlNP0C98KxhVXSgAGMTM07NbaJFbAl7OqjmS3YOARRvCnP2Cijk5PyRMFgbHARITLL4kXqoCiLqeuxKnWq99Abvaj1qgIIoL6coxl588R00tDkWm323GHR1HBsITvz63++fDHlCY/UV+I8hpQNRENuU2BE+/w7qrzn1W4/N4lP4UCi5S+ZP7G67FxWn6Rb74M2lkXCgpjx9NAL3gMAg+hZp0XdJoLZvVE81XAz81ydhwSgKJ3aybiqQ7tGngDBlIDQtNaghkSqZAuG9QPzmxTUrMXYZUTiekrxk6j4Ly7ZfBw8Vy/JMqqd+RShHekbig01TN0IXHNThC8Tm/nrHYP8LFcEvV8HhCRJL6LCx3LzSutIp+yMcwQX7uMW5ZZxltOzfbvZ8AlQ1MqjOiBuzkqD+wwfPriAGy2vFeB+qvrU/AjrhuOEhDfRHFCmh6elNag48r1/Uwe0Tu6wbMu9diULpJNeI0gHRP+ED+XTkjeAoGaaAlX7prlD/Y5we5XuKbwtFSbTkmMS/BBF53GRNCTFY+vhuKpvN5pQ7zuRKhFf2TJtDlQGMOQlN60qA5t/pMNH1pcw5+JJ+AdSPhM9RZeGAGDl85ucn6ee1ThXkqBlK/Vj3BZfRWiJq+wwqAsSIZw/NDJkaUBQkuBwd67OKEkDLSv8nvHfcUeP3+4uEGs3W2sgQ+gnLKNSDj7cXNr2aov7yfcSnJe7kr3Lo4ujXEVZ17U
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(376002)(346002)(366004)(136003)(396003)(451199015)(31686004)(2906002)(41300700001)(7416002)(8936002)(5660300002)(110136005)(478600001)(66556008)(66476007)(38100700002)(31696002)(38350700002)(86362001)(8676002)(6512007)(26005)(6666004)(2616005)(53546011)(52116002)(66946007)(6506007)(316002)(6636002)(6486002)(921005)(558084003)(186003)(83380400001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?WTlHbzZKWnVXdFZ5ZDlBbFcvR1lNekY4NVd3REl6cE1jR08rcGo2bGFneFZP?=
 =?utf-8?B?ZTFrTy96Smc3UHFBU05OV1JxazZXT3dGT3IwS0p3RXo0RlpmWHZLOHR4OUg1?=
 =?utf-8?B?VmlubFQ2M3hlcW5xc05EdnBiOWt1V1RJNU9YT3JsUkZRTHM5aVFrVDhxRTRG?=
 =?utf-8?B?Ymp2YTFpb2NyaHcrdVFLVW5QVlVTU0RYSVFlay9JMzhrTmZVb05PTkR5NDVi?=
 =?utf-8?B?MytKbCsvK0lzeHZ4SElvbi9WckFXMTBXU1o1dnFaZGx3Y2oxVHNSbVdtanpq?=
 =?utf-8?B?VTFid3NjRnExR3c1Tk9rZjg0ZU0rQ0dXTHNpNXN1cG1ac2RrVWZmUTEwQStW?=
 =?utf-8?B?aERRQ2I2a2NnclI4UnJHQXhSVS9CaHFBbStUQ2l3WUl6dklGWG9JK3d6RHha?=
 =?utf-8?B?OWQwdWozVDRySTcwL1REZGozYW8xZ1F6c21EcFYvalYzMHJjclFjVHlHSXhV?=
 =?utf-8?B?eUtBYVZpMzc4blNjNSt4RW1Takx3RXF6K0VackdZZjhCdktXTlN1VzZsOEhj?=
 =?utf-8?B?K1pBNFdCeVllUTJ0bWU2dXZXcGx4eW1ENE5FZ1FhdTdZdjV6eEZLRGNnNmFK?=
 =?utf-8?B?UThsQnNUQTVsaGlrS2RBUm14OTRhdHNLM1B2M0hMYWpYS0ZsSDF0UWo0STBs?=
 =?utf-8?B?VjFOaEN5SEZoWW5lYm9JOEw3MWdpWExMNXdZQmg0ejkyd3d6OXFqcGh4NGxE?=
 =?utf-8?B?cU8yV2ZrNFd6NTdLUnpEYlhjWUxuMzA0N0RrSFU5QUc3MU1hVUxyMlJDOHVR?=
 =?utf-8?B?UzY0SW94MEJUdFdqTTVDZ2VTQ1N1QTJndklrUHc4SG9Md0gxV0ZQWFdJeHp1?=
 =?utf-8?B?WjZCSjVsYnZ4VE9QL2JPWm9HOEtkUTd0Z04yT2hQMTFlckZ5dnlmdWx4ZEg2?=
 =?utf-8?B?UjFFR3hZR3dRTjk2SEZ2SDByM0cvaEMxVWRNNGx3S3lDMXZEc0VKWndBUVBz?=
 =?utf-8?B?TWRrS3dYL1dZZ0dEakg2Y3lvNVdERWdybDJCeWt0THZDQ2tBL3lWQUsyVnZr?=
 =?utf-8?B?TWZ4WU5YaERpOUxvb05rTTJlRDVPOE11djFrTHBPMmVVVnkybG16M3FWQzZD?=
 =?utf-8?B?cWR3QWFXT01rbnFFR0hVSExnWkJ5L1gzckNaQW1FVS9kbHIzTVJQeTdnL2hO?=
 =?utf-8?B?bkFwb0Y5RDhWOTNnUEhJQXhVc1dka0J1RFczdFd2VlZHLzYzU21HaEd4M0Fs?=
 =?utf-8?B?RFcyckxiYjJjeGVVQmtDSkY5MEtlUDd4aVM1YTBIRU8wT2RpL1BGWlZsd2pz?=
 =?utf-8?B?WC9jKzkrSTcvcWR4RGVDdmkrOVVSQmRTNWRSZEkvVlIxNnE0cHNjdFRsS3NQ?=
 =?utf-8?B?c1BQUDZTNVVHUE11L09NQW5FWHpRNk5Ec3I2WWVIOFpwTXRkZzltMXEyRHJh?=
 =?utf-8?B?NXNYYVd3aEpQL2JNYTcyQWlyYjBWZytwQ1RLcW5OSWtjbnovUVNRQ2VqekRG?=
 =?utf-8?B?OCtyTFVJdGUzSzdqSWgxVVpjbHN5eEFGOHFYcHRFcWFCVUd2d0N2eExLcUx6?=
 =?utf-8?B?WWhhY3VicmJXQXBMT1AySHZER2VmL2lreG9FMlBPVUdkd09wdERiVDlhbVll?=
 =?utf-8?B?MndpcGVhV0pnbWo0WmtoeHIwL2J6MWZHRzhpMld1eFBzRW0yQnc5Q2N5RGtL?=
 =?utf-8?B?b1kxcjVhOHAyQ1JnY1ZBN3BqSitQb3hwTUwzbzJkVzI5RlRLMDdPc2FXdW5s?=
 =?utf-8?B?YkhCNlZDQjhPZTRkUUFkM3JnaHZQK0h2ajlVelAxZGlGekV0aHJabmxPZnd5?=
 =?utf-8?B?Nkwwb2hBY2Z5bUF5akVleVN3eU4zRmZFMFh0Q1BSaUtEaHd4Y3czbjU1TXJQ?=
 =?utf-8?B?YVAxVzgzQXdOSCtZVElSU2FuVWhYYmo4cm11dWtHSHdpd3VMTXV6cTVaNk5y?=
 =?utf-8?B?MVdnWlNDVjhvTGo0RUZyaUlYYXp4ZUZyY0FUcFBnOEZzWml1bzBFRUNZS0M2?=
 =?utf-8?B?cmhqSDZjNVA2Uy9CVU05SU5CMU1pbjBVTXplQnJFM2lFcGw5QmJRcUFZNnNB?=
 =?utf-8?B?cWZNUWkwWGRGendLRXZYNjkvUy9kMGgwQlc4VE1iWGVNc2E5WTNjb3VDUExz?=
 =?utf-8?B?a1lBOU9udnp4TmY4dldwZk9DL0ZKLy92RHEyWFJhNWhMU25TR2NMZ1E0K2xB?=
 =?utf-8?B?ZkgvVHllZGtvdXIwa3U2SGpQWG5aWGRDbEsrSmtJa3lFNTdzK0NxRFZvYzd4?=
 =?utf-8?Q?I+9o9dOAtyO4OZC4xFXBghQ=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1490bbca-1b1b-44cc-8ddd-08daa4e3f312
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 02:06:57.3644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sHYOweJKfXXSqA6xmj9OR7zcYXRnhtWyowJ4eH446Z5FtYN2k1dz5bxLLAtOqx7hZ8bXZOzPjd/OELqPN8sxV2jZGn/LZVHsRY1rj0ECQUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR01MB5776
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



On 02/10/2022 05:55, Wolfram Sang wrote:
> 
>> +		if (ret == -EBUSY)
> 
> Since we documented this:
> 
> "+  'ret': 0 if the backend is ready, otherwise some errno"
> 
> the code above should be '(ret < 0)'
> 

Will update.
Thanks a lot for the review.

- Quan
