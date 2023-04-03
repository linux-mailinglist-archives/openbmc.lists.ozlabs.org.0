Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAA86D4E14
	for <lists+openbmc@lfdr.de>; Mon,  3 Apr 2023 18:37:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PqxPp1zMpz3cXX
	for <lists+openbmc@lfdr.de>; Tue,  4 Apr 2023 02:37:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=NQtDwtt0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7eab::603; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=supreeth.venkatesh@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=NQtDwtt0;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20603.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::603])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PqxPF17nkz3bj0
	for <openbmc@lists.ozlabs.org>; Tue,  4 Apr 2023 02:36:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVms5oWqcLvsXIzvZJ5V3FFc4/M8623zPJaYFybwkjPM6OBI0OmudW3YDIjyjDZyN5yibT2wzV8jDdpT79RHPR6vCyywmMrH74VqiwmV2TPt3X2PHEYAQFNesQrGbPsafNgneOsjVaHOwHGkfykGBUMgwimbMAxKEyNmEzH+JiZ63uC8YfTv8lEPClv0wV4tiqvW8iUs3pS1RiitOVsQxUOg2wfK52OAH8dYXyZPY+o45b96VIOzWy10i5NG1fd5Hi/elaQSk/cuKOFUkIMKhphGbPbrtQUCxg72+UhrCv+iODuxor4Xp62DP2HF9nlUMwh0yVUV674MPMeim4N8Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxBoq35PureqTAAJ7Icwjy6i5BNQeJS0pkoBgv8WsF4=;
 b=c0eyb1PJSHpj+b7MBpb5QcXaihzi0cpShecXQPlvaJGYCXpkUNCkHLJvVzXByjVS+2Y5fpE3gx3d3a+5o+VnaIclNyG33wPcUpbEEft8E26DN3t0pFDmGIDNIBDL4KsL8krAseuBt0lrPHkLhs9hI1ohlcGjI7j+W3918D29fgM+oUFaBu0uf/LYOoD5JCNX61/mBvFLO3dXEocVExlnAFOjuGVDYi+uI5wz0djlpriv5hf0e/5P1vDU2Tzl+IESzwW/JAhcLE4rD2Ftia8B1NSsm73mfVA0/7Qh3b38rNhVbCb5l4uJvcnF/tK/cPVjkFr0IPKpiAqhgaRIwZHWIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxBoq35PureqTAAJ7Icwjy6i5BNQeJS0pkoBgv8WsF4=;
 b=NQtDwtt0Re2eshWEmOde1fEQA3jXZ/a0BLnz6EKGwFlTdKU5Y9j5EJGRzHn52wFL+Jd2Jz4Dw9qfQxJY1R7J+AtYjJd7zp/OADnDRZoWtikvkL/u3jdQoyVlAlq3pWqfThPZ2+Ek1/ImHawhcVK7Fjiv2Iw8i6cQgP3Ss+9LBWU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4752.namprd12.prod.outlook.com (2603:10b6:805:e9::10)
 by IA1PR12MB6137.namprd12.prod.outlook.com (2603:10b6:208:3eb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.30; Mon, 3 Apr
 2023 16:36:27 +0000
Received: from SN6PR12MB4752.namprd12.prod.outlook.com
 ([fe80::d191:788f:c62f:9d87]) by SN6PR12MB4752.namprd12.prod.outlook.com
 ([fe80::d191:788f:c62f:9d87%4]) with mapi id 15.20.6254.030; Mon, 3 Apr 2023
 16:36:27 +0000
Message-ID: <71a122a9-07a9-06a8-ee1a-dd108db63df3@amd.com>
Date: Mon, 3 Apr 2023 11:36:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC] BMC RAS Feature
To: Zane Shelley <zshelle@imap.linux.ibm.com>
References: <07621845-19a4-0568-be0e-f556ba40b813@amd.com>
 <ZBmJpxTnEVVpfsz2@heinlein.taila677.ts.net>
 <255d7c9a-ce17-bbe1-7312-990d0221cf36@amd.com>
 <CAK7WosjjdVwNqSwkY2mxYhgAeKdwigtyLryTfJ9r6ShjfbRuCA@mail.gmail.com>
 <65515592-8f77-1c8f-731c-165fb833344b@amd.com>
 <CAGm54UG+S7gFkCaKJm_7PxOCDu0haZ4FWUxj716JBGVY-gaTFw@mail.gmail.com>
 <d9f7b650-2e8b-7bd0-2125-035531ce549c@amd.com>
 <d65937a46b6fb4f9f94edbdef44af58e@imap.linux.ibm.com>
Content-Language: en-US
From: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
In-Reply-To: <d65937a46b6fb4f9f94edbdef44af58e@imap.linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0P221CA0046.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11d::19) To SN6PR12MB4752.namprd12.prod.outlook.com
 (2603:10b6:805:e9::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB4752:EE_|IA1PR12MB6137:EE_
X-MS-Office365-Filtering-Correlation-Id: 82244829-3cdc-4c75-494d-08db34619203
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	0o5SdIsEdhybtE+jBvK4jZ2DGQ2cn4LLkr7IB/HlBLqYF/WiwWnzWOqkrUFBcKAq4YF1xQLmXGKrhOH4DYZ3DPiD1bYeoyRgkUiu3dOok/dI7HQL+lOaf7uYiuzUptTsQjqPgZld331M0NIAIszPrJPMUr4+bxH+Fi0dbPqIK8K4W/Lvz1mzB3tPq6MiivIPeOBkIhQClsTmAe8LNqPDNRRk6jV3OprjqdM3kULWvjaG2PJTVgjDL+gx/9SuSh9NJ9O0xTkjIpgJoAy2U0fyHUGng2AFZ2R+RN8754UWRTnfmEIsxjQqguV15BI0Wmvfp/0WxXtKoXZQzXRnjQCYrTZPepikJ7A0JeSpV94SjNNt2AkYcdPi705f4qTV9LkU+uYyo6gGdk+cxlYpHT8MZnwy9//RTjUNPvQGEVvyIG2XpoRANra09xNd/+Px0B5rzV3fgd8s92OCXQZfoQEA5zZIoV2c7BBUxHqdHAtAplfHOIrbwBjp4Js8S8wFOT0RvHisaFp6A+BH7F8WwwfJYEvE9UhHpMlrZH/FFLk7/X/Mjgz9/win+abuDAns1zaHRNiNvjtgXdaX9p8U8duPLKuQ4HbNJlfN1WK0JXst4tD4xYfteKnX0OmygwM4EDxv3YEHXi1neX2LRDtqpRPssjVDeIt7cF095RssJ+IFReZ6GJK1j+mO99D5LPuXX4IK
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB4752.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(451199021)(6506007)(26005)(6512007)(186003)(966005)(53546011)(8936002)(83380400001)(5660300002)(2616005)(8676002)(41300700001)(66556008)(6916009)(2906002)(66476007)(6486002)(66946007)(6666004)(316002)(44832011)(54906003)(478600001)(4326008)(36756003)(86362001)(31696002)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?cWsycit0T01xdFhURWZ2Zi9XamZIdk5TRHQ0U0NpL2pnYUdqdTI0NkdORlBG?=
 =?utf-8?B?V3l2Lzc5QThKMzFwR3JqcnEvMUV0NE1GbmpzVlc4dzVYM09BUFZGbmZRb2lw?=
 =?utf-8?B?aXdNVmk0b2pDUmZMOWx5ZTBFQm4vV29yV2NTNGt5OTV2YW5JaXdPS0hKQXhJ?=
 =?utf-8?B?azdnTW1NVllLSEVDck5McHRCemx3MEJDVnBEd0NQaVRIMjFBMEdRN2I1OS93?=
 =?utf-8?B?NmFEZ0F5NjJGRytDOHNSd1Mva01TdkU0UGdKSE43ZVFDZmcyaWo3Qis2bkkx?=
 =?utf-8?B?MXRtdSsrN2pVQVRNOVQrb0FObnhOMGxWVC9NaUNaMHRpU1dTNFl5N3pNRURs?=
 =?utf-8?B?SzJUU3ZsYytsRElVMjk3b3JVWWY5TFFXV0JZNG5aOWdiOUNzcWwrVWhrM0pw?=
 =?utf-8?B?eTEwcXVibVpFSkF1bThrTVRsNmxwTnZib2dkYlZjdEp2Y1VYQW1mTkordXVo?=
 =?utf-8?B?WXk1UDJRTzBFeGk1ejIzV2RNOGkxT3ZVMkhNY1RTM0ZORkpCVGtYdWxJc0dE?=
 =?utf-8?B?TmkyR0RVUDRQQnZmcXhxS0FIR2k5THQzdm5Iakw0V0RwRmhVQkt1YngyTGlw?=
 =?utf-8?B?ZXd4VUdrNEZlVnJYQ3ptR1Brc0VVTWp3cXBZQUtIL1dzUEU5UXU0cHBtdjJG?=
 =?utf-8?B?dnVUV3d0U3dRank4VlljNFhGQVBEbUkvL25OUU1ISFpLYUFicHJTUllQNmh0?=
 =?utf-8?B?bHhCS0JjOHllSHplRENIUDlMODRWYTFVSVhXNVo2akpsYkRkSHgrYmJrdjNH?=
 =?utf-8?B?ekxyZ2UrOFRWajE2cW5kVkhHUlh6Y1FxU2lWdGl3TUIvZndZbWtYK0xUakVX?=
 =?utf-8?B?V05VRjVxZnBkYUsrQmNZNDQwYWp0dlROU1BlSmxaTHhxcXIyZEtQaHFXMUla?=
 =?utf-8?B?WFBRdVFHMEF2NkF6bjZPaVpUcWpMUkY4MjNjWlVUYlhoZStwaUpTODhHS3ZO?=
 =?utf-8?B?bUg0OVNKcGFpRzlZbGMrSkwyT2dSb0Y1RDhycHhSOWtWS3BwY25idmYxRE1j?=
 =?utf-8?B?QUtpUWhNL0lCMkFFRkVneUpPL2hRbk92QzJoWldwTitJOXVVdkc4eXN5NS9u?=
 =?utf-8?B?eWd1QXpmc3g5OGhYbTZ2QTBxY3UrclkramJUc0I0TU82WTJ6SUhmWE1vekdy?=
 =?utf-8?B?aTZVTmRxdko1eEpzUU9aZjRDc3NsTWRvUDQrM0R4ODRMa3JnR0hmOTIvb0xj?=
 =?utf-8?B?d2pwcnJnbEhlL3ZucGFYbkxxMkpqL2cwUGhGdCtuNDk2VkZRR2JVcXA0M2F4?=
 =?utf-8?B?S3hnSUVIWjlCdCt2VzNaZDNpbGZHekU3Q1FuK0VQdnI3aFBOZzViTXR2WTYy?=
 =?utf-8?B?M0VmMGluMTl6TWNZcE1ldGtkWHZ2bWJPSWN0Y1FiU1YwTEFtS0drQS9RM0hJ?=
 =?utf-8?B?VGVkQW93ZGVSZU1EdFV3YzRXY2xicVdBRS9xbVAzWUFjMW9ObHdlZmY4N04z?=
 =?utf-8?B?Ris0SEcwZUI0QjN4WFhpamI2NWt4UEFrRDBIRW1DaGVRNlI4OS9JOUZ2M2tS?=
 =?utf-8?B?YUdyZFlxcjhqRVlOcXB6WVh1VERiMnZ4ajE0UlJLeXFPZ1pLN0F4Z0kxbHV4?=
 =?utf-8?B?UU9UdHNDVE9ILy9obEk0bGRPZDNVT0J0QksvMXk4aHUvdzExYWdiZU9XNnhY?=
 =?utf-8?B?bkhZVHpGK21MWVQxdFJKTG1UUm9xOFduTzJYL1l4TGx0bmYwRTBKNk1xME1z?=
 =?utf-8?B?NTRWMEtHdkFVWUJrZUYvMk1RbGRkMDdRYTRxb1ozS0hHRGExVWMzNkYyR25Q?=
 =?utf-8?B?UWhzNmtvMUZZZTR3YXVKUm1nZUdBV1NWdU9LTDNQRGRnNW9kQ0ZSQjZqNVp0?=
 =?utf-8?B?aHRsb09jMHViY0lpem5YTkpBOGNVZ0FRVys3Nm9LMUpPNTZWL2pHM3BrZzJV?=
 =?utf-8?B?aUMzNllBaU5VMGpScXZlR2JKZzBpZVU5OFkxS2l2U0JXRU1iSHp0ZGordE1X?=
 =?utf-8?B?c0hUcWxuRTMwTE42U0FFem8rUjBud0kwOUtYQVhDd3FGWkUvaFYzODdwTlBB?=
 =?utf-8?B?UlJNTE5pbVdNVGxnMFF5d0JjUlJ5OTlja3Nqek9TSlRBNFYrSElla1l3aUtL?=
 =?utf-8?B?UFZvUlByeXdDbjMwa1Y3TFVpNWIxZEVJTnkrRHBxMC8yRjBuMUdjZ0dvZ25Q?=
 =?utf-8?Q?pGe+4sKnWhWfxSwnPprhVX1Pk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82244829-3cdc-4c75-494d-08db34619203
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4752.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 16:36:27.5120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DXJziOfpf2w0zh43Kj26XyBMrnT2BdYiZ2pUM5ZO0lZksPrJIiw+TgyKrp5fGNWwxgXYrmWqiS9GiveEn+Ir5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6137
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
Cc: Lei Yu <yulei.sh@bytedance.com>, Michael Shen <gpgpgp@google.com>, openbmc <openbmc@lists.ozlabs.org>, dhruvaraj S <dhruvaraj@gmail.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>, Ed Tanous <ed@tanous.net>, Abinaya.Dhandapani@amd.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 3/23/23 13:57, Zane Shelley wrote:
> Caution: This message originated from an External Source. Use proper 
> caution when opening attachments, clicking links, or responding.
>
>
> On 2023-03-22 19:07, Supreeth Venkatesh wrote:
>> On 3/22/23 02:10, Lei Yu wrote:
>>> Caution: This message originated from an External Source. Use proper
>>> caution when opening attachments, clicking links, or responding.
>>>
>>>
>>>>> On Tue, 21 Mar 2023 at 20:38, Supreeth Venkatesh
>>>>> <supreeth.venkatesh@amd.com> wrote:
>>>>>
>>>>>
>>>>>      On 3/21/23 05:40, Patrick Williams wrote:
>>>>>      > On Tue, Mar 21, 2023 at 12:14:45AM -0500, Supreeth Venkatesh
>>>>> wrote:
>>>>>      >
>>>>>      >> #### Alternatives Considered
>>>>>      >>
>>>>>      >> In-band mechanisms using System Management Mode (SMM)
>>>>> exists.
>>>>>      >>
>>>>>      >> However, out of band method to gather RAS data is processor
>>>>>      specific.
>>>>>      >>
>>>>>      > How does this compare with existing implementations in
>>>>>      > phosphor-debug-collector.
>>>>>      Thanks for your feedback. See below.
>>>>>      > I believe there was some attempt to extend
>>>>>      > P-D-C previously to handle Intel's crashdump behavior.
>>>>>      Intel's crashdump interface uses com.intel.crashdump.
>>>>>      We have implemented com.amd.crashdump based on that reference.
>>>>>      However,
>>>>>      can this be made generic?
>>>>>
>>>>>      PoC below:
>>>>>
>>>>>      busctl tree com.amd.crashdump
>>>>>
>>>>>      └─/com
>>>>>         └─/com/amd
>>>>>           └─/com/amd/crashdump
>>>>>             ├─/com/amd/crashdump/0
>>>>>             ├─/com/amd/crashdump/1
>>>>>             ├─/com/amd/crashdump/2
>>>>>             ├─/com/amd/crashdump/3
>>>>>             ├─/com/amd/crashdump/4
>>>>>             ├─/com/amd/crashdump/5
>>>>>             ├─/com/amd/crashdump/6
>>>>>             ├─/com/amd/crashdump/7
>>>>>             ├─/com/amd/crashdump/8
>>>>>             └─/com/amd/crashdump/9
>>>>>
>>>>>      > The repository
>>>>>      > currently handles IBM's processors, I think, or maybe that is
>>>>>      covered by
>>>>>      > openpower-debug-collector.
>>>>>      >
>>>>>      > In any case, I think you should look at the existing D-Bus
>>>>>      interfaces
>>>>>      > (and associated Redfish implementation) of these repositories
>>>>> and
>>>>>      > determine if you can use those approaches (or document why
>>>>> now).
>>>>>      I could not find an existing D-Bus interface for RAS in
>>>>>      xyz/openbmc_project/.
>>>>>      It would be helpful if you could point me to it.
>>>>>
>>>>>
>>>>> There is an interface for the dumps generated from the host, which
>>>>> can
>>>>> be used for these kinds of dumps
>>>>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/openbmc_project/Dump/Entry/System.interface.yaml 
>>>>>
>>>>>
>>>>> The fault log also provides similar dumps
>>>>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/openbmc_project/Dump/Entry/FaultLog.interface.yaml 
>>>>>
>>>>>
>>>> ThanksDdhruvraj. The interface looks useful for the purpose. However,
>>>> the current BMCWEB implementation references
>>>> https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/log_services.hpp 
>>>>
>>>> [com.intel.crashdump]
>>>> constexpr char const* crashdumpPath = "/com/intel/crashdump";
>>>>
>>>> constexpr char const* crashdumpInterface = "com.intel.crashdump";
>>>> constexpr char const* crashdumpObject = "com.intel.crashdump";
>>>>
>>>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/openbmc_project/Dump/Entry/System.interface.yaml 
>>>>
>>>> or
>>>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/openbmc_project/Dump/Entry/FaultLog.interface.yaml 
>>>>
>>>> is it exercised in Redfish logservices?
>>> In our practice, a plugin `tools/dreport.d/plugins.d/acddump` is added
>>> to copy the crashdump json file to the dump tarball.
>>> The crashdump tool (Intel or AMD) could trigger a dump after the
>>> crashdump is completed, and then we could get a dump entry containing
>>> the crashdump.
>> Thanks Lei Yu for your input. We are using Redfish to retrieve the
>> CPER binary file which can then be passed through a plugin/script for
>> detailed analysis.
>> In any case irrespective of whichever Dbus interface we use, we need a
>> repository which will gather data from AMD processor via APML as per
>> AMD design.
>> APML
>> Spec: https://www.amd.com/system/files/TechDocs/57019-A0-PUB_3.00.zip
>> Can someone please help create bmc-ras or amd-debug-collector
>> repository as there are instances of openpower-debug-collector
>> repository used for Open Power systems?
>>>
>>>
>>> -- 
>>> BRs,
>>> Lei YU
> I am interested in possibly standardizing some of this. IBM POWER has
> several related components. openpower-hw-diags is a service that will
> listen for the hardware interrupts via a GPIO pin. When an error is
> detected, it will use openpower-libhei to query hardware registers to
> determine what happened. Based on that information openpower-hw-diags
> will generate a PEL, which is an extended log in phosphor-logging, that
> is used to tell service what to replace if necessary. Afterward,
> openpower-hw-diags will initiate openpower-debug-collector, which
> gathers a significant amount of data from the hardware for additional
> debug when necessary. I wrote openpower-libhei to be fairly agnostic. It
> uses data files (currently XML, but moving to JSON) to define register
> addresses and rules for isolation. openpower-hw-diags is fairly POWER
> specific, but I can see some parts can be made generic. Dhruv would have
> to help with openpower-debug-collector.
Thank you. Lets collaborate in standardizing some aspects of it.
>
> Regarding creation of a new repository, I think we'll need to have some
> more collaboration to determine the scope before creating it. It
> certainly sounds like we are doing similar things, but we need to
> determine if enough can be abstracted to make it worth our time.
I have put in a request here: 
https://github.com/openbmc/technical-oversight-forum/issues/24
Please chime in.
