Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 042713AAA92
	for <lists+openbmc@lfdr.de>; Thu, 17 Jun 2021 06:55:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G58qx33X9z3bv3
	for <lists+openbmc@lfdr.de>; Thu, 17 Jun 2021 14:55:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=HEENTIb9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.212.98;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=HEENTIb9; 
 dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2098.outbound.protection.outlook.com [40.107.212.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G58qX1N76z2yxm
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jun 2021 14:54:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1TDJHAhtgcm6TeOm6pLjoVoteV8BsrQXybU+Y3ojxu/hE9rr4n2L4rnC0xmdHQQzOam1wqVBzaHNrZm6x2kCBK0YpazzaWkzsO3DVkJM9w/K/Sj461NseddzTrXEJPyv2lB8jIlF9/jpQ4BLD8KzEPTCaeRkGJTPSP7W5/RtsBdrs0zVVk9r5Hg0EwnqzeYGwMeSk0+5fqLIBXCdWfulsZ1wemZE3xEFuLJNhPz5fCONvYjEa2sE3B5ohXH4Lr3q0LkFsLD9cSM/dfQU3E3KMAXmi4tDlzXOA6tgduIIwKjdF0oDr3m3cqLJbGs6tDlpuOYQnkgoGUNWbtAHrevWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woTkzXmfeUJ+qn3/y9AxjQCyrfvGa5njQxqAXrA7+hk=;
 b=iazzwFe7/pGgAHdxTej9NY5g1AihIHlQOv59r9Cva9DLSPjJ5p3sh/mDBaVGc/7Ll8x8CUkjnjUSn2XO7FeZOaeMAhLER9EY8lvqKVP8aV9Qw2YZlqaiqH86km9JJMwxrmy1ZCEwucHdv8+Tlb+0Em5wRCJBR99KjmiwHjjpklUNphg8JTjH80HpI+lFV0K2oEA9Ticpy4L0AkAN/S32pjlWaet1cCFnVdw+1dVPskAo992cakSx8RU9/4YMz68e+yfeWHh1Gwru6dwqhZJfLLmvxooONWM4sVZDtxDFnSmX3Dkeid3JVlpIyAfWiXGHKH9XD3QGPlWdSUeWkjNN7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woTkzXmfeUJ+qn3/y9AxjQCyrfvGa5njQxqAXrA7+hk=;
 b=HEENTIb9wxxkrOI1hT0i7QEF1/htsIpbKW539CExhV+UDs2h7Qs6HA/P0EajnlITmx2foSiq/oyg8Wg5owFb2HTU0+tyNPGsowJyyT/8brV3+6WW6QuyC5BEVUfV+sTRwvYoZcXeaA6YlmKMQIHVubTo76tGh+rMEk54DMAmp3Q=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 BYAPR01MB3653.prod.exchangelabs.com (2603:10b6:a02:8a::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.22; Thu, 17 Jun 2021 04:54:36 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::1456:37cd:724f:6314]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::1456:37cd:724f:6314%7]) with mapi id 15.20.4219.026; Thu, 17 Jun 2021
 04:54:36 +0000
Subject: Re: dbus command to set POSTCode
To: Manojkiran Eda <manojkiran.eda@gmail.com>
References: <dd89f391-87c3-9712-9423-0682fd3b5aad@os.amperecomputing.com>
 <E74141E0-4D17-42F0-A7FA-6752BAA522B7@getmailspring.com>
From: Thang Nguyen <thang@os.amperecomputing.com>
Message-ID: <6f412966-d502-466f-dfc7-f066ba691e56@os.amperecomputing.com>
Date: Thu, 17 Jun 2021 11:54:23 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
In-Reply-To: <E74141E0-4D17-42F0-A7FA-6752BAA522B7@getmailspring.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [1.55.92.91]
X-ClientProxiedBy: HK2PR02CA0159.apcprd02.prod.outlook.com
 (2603:1096:201:1f::19) To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from HCM-FVFX4014HV2J.local (1.55.92.91) by
 HK2PR02CA0159.apcprd02.prod.outlook.com (2603:1096:201:1f::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Thu, 17 Jun 2021 04:54:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8851e4f0-193c-49dd-c2e3-08d9314c0144
X-MS-TrafficTypeDiagnostic: BYAPR01MB3653:
X-Microsoft-Antispam-PRVS: <BYAPR01MB36539C7853A6E065CEEA628D8D0E9@BYAPR01MB3653.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xCrP7Z7AuwGAUWvqf+8QxII76KEREGkbfwgUZzDhALRHjjzSkR1di61gPXB/KFa2SXoGk0ATumyOG5Z0a/A07CzDnQzLbC7Xuq+30YTRSLt+LkM85E5dSjRpo4wK+XRfpPegO3m/xV2/QiXXEtNatahp9fFdkiuwnVgdOZQ98hHk32Qzx3XQ96B3cA0xQo/d5jRF5nvHllA6EDoJA/waIuDRgxBz/3srGyCBI3v+sQMzzutn+5wCzFcbMRRcIBZyZjDlVFBr+yotwupyFPDLnRZQrHx+Yz+PdY+Ib19hJDdHy5JZVFoXnHSYlmZoBzxTRokrjinXJzeRoxLVE8XZoL2sZm1AUJG8oIW+IWniEiEN3beUxW9kT4PpP7yRc0i/kMbar5SR8O+10u4blEr/tQ6FA0UjqDWu/k09oHda83OyAbhIEfGFy8NHP1YjDz0n6eZammT9j7BCCcKc715VpQovWYvuIGDTzePFEbxDzvy28gB6b6lFsYsTakJteiAEmLg4+JNlMro90D+88Xyj1Nsa5TYL9avB++4J+VtQuugSnqKYVqVcxgfTfSos6BnJ0uHwDb2oM/c3LvMiJzIi16k95M7c+ZrrrSnKqJp7J0EZZ4GNZMbXCan1fkHUM3LOiO3xdWdnJhzIvF0BD7c73FCX78dstHknHPkKJCQCWSAVpG6xX2YWNF0T3h8zs2DfC170d9AGncfYippLQTEPbRDl0EzS92qhx2v/LkMIdftJjbQEGz777HPBtNjsuEANIaYxGLF14J70r2/D2+T+WGcWH79BNzf/YiRnrK3WiC7PBBOp2GqscyZxq9Y491GlFHUhb0Z7VAX9qHYMZyDAeUHsdHtXFDSIDEBRZ+XBharqH2pw4jyypJth1wKpCTd4xUPgbh1dARSi3+G2+C2uw1zQeNgd2+onRH4p/UD5+nQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(366004)(346002)(39850400004)(5660300002)(6916009)(966005)(66556008)(316002)(6486002)(4326008)(31686004)(478600001)(66476007)(86362001)(8936002)(16526019)(186003)(2906002)(66946007)(83380400001)(31696002)(26005)(6512007)(38350700002)(2616005)(956004)(8676002)(6506007)(52116002)(6666004)(53546011)(38100700002)(36456004)(45980500001)(43740500002)(42976004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFQyTWVuUjdLUzVhSzJNYTlWZ0Z5MVZSMHBEVGczMWp3S2taMmRMOVV6dzEv?=
 =?utf-8?B?REFkWEttQTdOUnViUjM1L1R6RWVGWjNBZzg4dCtTNXdNNk5rbzJ2STF3RVlw?=
 =?utf-8?B?d1lmT2JEelBZamtROTJSZHlxYWdjN2JZblg3UmVZOEZpQ2xoME0zR0RNdVRL?=
 =?utf-8?B?OTdCTWZTeU56TStmYVhoelRscUsxb0xkU01QNUVMODJ2U2pxbFlHNHB3ai9L?=
 =?utf-8?B?QVdoWU5EbXZGcjkrcU90cml3bUZmSFVLTDR2b0haUGJnSTZlN2ZZbmZSZzNV?=
 =?utf-8?B?Q2lOelBDMmxaNFhLd1ZoNVgrRUhPemQ1Q21Wc0d2S3pRY1NiY3Fvbk5wQVNF?=
 =?utf-8?B?TFpSd1ZWMkZxWmZWWUU4SWJ0OCtwOW9SallIZ1drK1YyZWxaWW9VRGMyUmJw?=
 =?utf-8?B?c2JKQVZudjlLZDNRVXNoeDZmM0RoUTNXUFJ0Z0FIK1JOdDJveUFxVXo0TmY1?=
 =?utf-8?B?RlRjY01zbGtvcC9WMjVRVm9lYTZYMS9aYWpFeGdTdklIdkFjQmpwdmk3aVpj?=
 =?utf-8?B?Qy9xemdEcGg5ekRTT29zUEFCS0JucVNMLy9DeUZxRDNqNTFiTkU3TWVSaFBY?=
 =?utf-8?B?VWhFYmx5UFhDWnZHTmgzRTdGaGEzZEJZUVFUNnRhV2JCeDcyRnZhRkNrWk1v?=
 =?utf-8?B?M0w3MHdpaysrVkVTYTlqRXlJaldDV1BoRi8yNEhSTVB1dkRpVHhxakNLc1l2?=
 =?utf-8?B?V09MaGdiTm5qNmV5c3hCZWVpSVFnaVFpTTUzUEg2cTBFcnh3bWVKZ0c4TC9n?=
 =?utf-8?B?ZitCT1d2ZkV4bjlwUGJ3OFFZdUE2bjc2T2pEV3h4a2Vrd1hiaDhvaFlBOElI?=
 =?utf-8?B?S012NGRySlpadDFlZVMzeGNTODJPckdCYU5XcXk0SXB5UDJtZk43U1FqZHVj?=
 =?utf-8?B?Q3hoUHVDNndFbnQyNGUwVVd2RTNLdkpFeUFQV003K2ROVkp1OXBtcjVwWlVk?=
 =?utf-8?B?WFpwVkUvZGpiY2Npb3ZwUkpRejd3SUUrcDlDTlNCaHg5UitSU3Fodk9XQzA2?=
 =?utf-8?B?TlBOTEcvc2RGNDRjczdQZlpWQTduQ1pIS1hMRnA0eVBFa0tja2VGUmMyUk9y?=
 =?utf-8?B?NXNFUnpHbW44b1VGQWFkbXVoOFBvOHNndFhQZjgvc2RRRVBURlhIdWVYTmpz?=
 =?utf-8?B?eUJvQkZkZk50S3RrTnozVWRML0laTTdvUFZSK0U2RktzMzV6K3VtaXllaVdR?=
 =?utf-8?B?VGNqTUVJalNGeGgzOENzQ0hLLzQyOUFzNVFsQ0VWZFo0Skc5ZTQvODFMb0hJ?=
 =?utf-8?B?R2lkSys0NVNnMXdmU1FJcHVYaDFiOEl2WUwrYXFPeXQ5RitpVGhqdHd4Ukhw?=
 =?utf-8?B?TW93cjBCTEJWVVgxdmlQb1ZrSnU2Yjk5Ui9GdVhpeHlsSEVPWFU0TkdMVlRl?=
 =?utf-8?B?YjVTSXZkSlFmY1JLRVIrOTZHSmJHUUlORWhvcUU0dVlraWtrdTFhUVcyOFps?=
 =?utf-8?B?TytmT2M4c3BBY2NCMEFTVWEzc0hOK2M3cnU4aUx1Ulo0UG9RU3Rac0RhT3Bq?=
 =?utf-8?B?LzZCdXdKc3JHRGtQcG5HeFpMTld2Q1lTdTBDUGZ0YVFBUy9lNW5OMk92L2V3?=
 =?utf-8?B?Mmp3b3NxNGd5bjM3bGtlQjlySWxJVU04bW9Qdy8wbWtkRnFrMXh3SGJwWWxQ?=
 =?utf-8?B?bVFiejZCVHkwdkNoZVYxVGtybEszWTFyQk5sMnoxSWFERk9WOFBkREhhdUkw?=
 =?utf-8?B?KzRiNmpCMTlVVWxaYi9GbTllbHRjc2kyTGExc2NVcWNuSVNyc0MrQi9ubDVK?=
 =?utf-8?Q?FJF4NdfYJ0guTqgjYsW0tOej9NkzImda0L5RuxL?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8851e4f0-193c-49dd-c2e3-08d9314c0144
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 04:54:35.9754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W11wwh3r3+BHuJ7ycRrEaChOKKa/oKR2pUZlo6ifhXYEDWia9Umk7n4OKwvriKAkKxUx76igK4k+xItKZrCw5cR2GXlVhOnawaipZY1aPQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB3653
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


On 16/06/2021 20:38, Manojkiran Eda wrote:
> Hi Thang,
>
> On Jun 15 2021, at 9:49 am, Thang Nguyen <thang@os.amperecomputing.com> wrote:
>
>> Hi,
>>
>> I found the command to set POST Code to dbus as below:
>>
>> busctl set-property xyz.openbmc_project.State.Boot.Raw
>> /xyz/openbmc_project/state/boot/raw0
>> xyz.openbmc_project.State.Boot.Raw
>> Value \(tay\) 0x080103050006 72 2 0 0 2 0 0 0 72 0 0 0 0 0 0 0 0 0 0 0
>> 0
>> 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 83 84 65 78 68 66 89 32 32 32
>> 32
>> 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32
>>
> Looking at the command, This looks like a command that is used to set
> the progress code value on IBM machines.
>
>> The first option is the POST Code to set. In this case I use 0x080103050006.
>>
>> However, I have not found any document to specify the remaining.
>> Anyone
>> has document to specify about arguments for POST Code setting in dbus?
> Earlier, the Postcodes used to be just a uint64 number, But it was
> recently changed to `struct[uint64,array[byte]]` to capture IBM Progress
> codes[1] which are bigger than just a uint64 number[2].
>
> IBM Progress codes structure typically have a primary code(uint64) which
> is used to capture the progress towards boot ,and a secondary
> code(array[bytes]) which is used to debug boot hangs to provide
> additional details regarding the problem.
>
> On Intel systems, the snoopd daemon that is responsible for setting the
> Value property[2] would just set the secondary code to an empty vector[3].
>
>
> [1]. https://www.ibm.com/docs/en/POWER6/areai/areai.pdf
> [2]. https://github.com/openbmc/phosphor-dbus-interfaces/commit/9a96970ebb93eb1f495c200801343a4d1c53977c
> [3]. https://github.com/openbmc/phosphor-host-postd/blob/master/main.cpp#L68

Thanks for your information. I see that the array[byte] part is not used 
in PostCode. I can use the shorter command like below:

busctl set-property xyz.openbmc_project.State.Boot.Raw
/xyz/openbmc_project/state/boot/raw0
xyz.openbmc_project.State.Boot.Raw
Value \(tay\) 0x080103050006 0

>
> Thanks,
> Manoj
>
>>
>> Best Regards,
>>
>> ThangQ.
>>
>>
>>
