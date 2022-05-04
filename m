Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD48B519792
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 08:46:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtS6H4RmCz3bcl
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 16:46:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=ezhy1hxv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7ea9::710;
 helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=ezhy1hxv; 
 dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on20710.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::710])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtS5f0rJkz2yXM;
 Wed,  4 May 2022 16:45:56 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VlkVTd/kQHTvDYjjx1hpPQjQQ2h4vi5Ms5u4KyS9fWdV2Z4A36SLQJQhOUgFSIzjGkBlWeMyVHJotdJCxkfPZwvDS0flxxsFFyyjDAlbOM/TCRMmRR2wmTDwVDsqIOGY3Sikq25f5Rd+5iTwk/zZlHmOInlzMYsSXiEppU0NGoaHn5KfHBZrHjsd8USfN+7AZw51Bogp1N1IUb66pN65y//ZV+QCTJPjulV+BDS3M1+itwtnI+1J7gpIDXZVPESxByPdX8Q6SuVvibPsQO1OOxFQvt6KGNGalprXfn3ZJ5Rdcs4x3iICP2Ih7Z4PYS3dRNEVaIoHNOO/+HvjCGNBmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YBNvu02nrJKElYo856auyp6LznDoZhExN46iThVT8A=;
 b=RUI5cj5MsLkWCpUABy19aVT3ExoyibXxl6cQN/NW9agATGp6CglA1OP+avvqfCvkOWh9VPOqCvBkwxidtc7nH89t+8xHFq1cyI5Mv6WQDA8q0EZMXg+5DoUf1sSk3deEdBFrtu66gRd97c8tLOFfZYnoXyajaXOwxvFWHe8tvHCDvWx0p7fn5m9/Btcp6ZaRxLcbSOw5loJ7G3dIY+KQ5nUeWsfE63UeBmnjuH39YzGWMZPpOM0lksD9xgJUa/NJsAOSXqRTHeZBbaBq54pMS8SjsU2mDxox6VWyRwruwxl0yaeM9CYi+t6GL8JhGwvql3KJJMBE04b7RdiOJLFIQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YBNvu02nrJKElYo856auyp6LznDoZhExN46iThVT8A=;
 b=ezhy1hxvD0pSw3m+nZuUGSCoUzoS442u5He6qvaWLOCwLUxcAgQxiinFhb134nPgbtTJyZ02RpFR0cZX/kG0Z6ih6Hg1ivTC/k4Kzg4KeskvQRwEhuqwvsjn7lMfYTTRglqNkJqE4oQWxEuFIVujBcs3OqGoGFJoJAPB7Y24l+Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 CY4PR0101MB2854.prod.exchangelabs.com (2603:10b6:910:47::34) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.20; Wed, 4 May 2022 06:45:16 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c%3]) with mapi id 15.20.5206.024; Wed, 4 May 2022
 06:45:16 +0000
Message-ID: <ec7b86ec-827f-da64-8fd2-eae09f802694@os.amperecomputing.com>
Date: Wed, 4 May 2022 13:45:03 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH v7 1/3] ipmi: ssif_bmc: Add SSIF BMC driver
Content-Language: en-US
To: minyard@acm.org
References: <20220422040803.2524940-1-quan@os.amperecomputing.com>
 <20220422040803.2524940-2-quan@os.amperecomputing.com>
 <20220423015119.GE426325@minyard.net>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <20220423015119.GE426325@minyard.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0170.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::26) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d2ad9ec-f369-4b59-426a-08da2d99a54a
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2854:EE_
X-Microsoft-Antispam-PRVS: <CY4PR0101MB285479B70B89F6308F0EF929F2C39@CY4PR0101MB2854.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rAHXJ8pNHrz6ilPcKyvy3fv2QAHnKF/PSqVPopoCCTWRD4M0YbzKVGUqNp9djXPX/u05T3z6wN7N4GZSZ68ZpKXxqjwYfhzOHtrogSL94XAa7MZ0Qp3NKsnKhSXPk3gjqW3ErVDuu5uRX4mADmukFsz5xvHzLVEnkd6HQ5vj8AhsKWXs8Y5RptMghY775s8niqEPHuBmbbvEj7FO6p2zTmfT4QBubeRVXECS82uj3qTf/YXW/fAsT3SRKkiTfFrKrr43L0vYV++S/YHKSQOOWvc8TjB7SQVMhRcHXraiI6lEH13qmx4Cpo5QQ8kUmkxWMPwHFg1qK7d80xng76tHxCX+FUUjk5XZGc8Zrup7JUYhN5w+tDpXX/pywyBbbuGoJZl9F+fVDECI4U6vNUoj3B01fzRKQExc754daNG2Z6vCH6hW1UUz6gHSFVac42+rfw3yaQNK8NFsQv9W400lQ6+jpOCEtzpc1GRjuGhXKCPou8Ujr6wqZiWmcKlrd9CaY3/PDjkL0KBVXvmIGIUNQWToA8rfQGfImoHZKDFVL2+jbgy3enDKzln92dCurx3o636xDCT8fh5NPGks+0tFposwHUwkjKZeIKkpOBRHkoTBo4BxOFlkE5joil5Xix056CafWat8UD29Qts78qAX3TQGYPQOlcvGygvU+4YX9FLCC9rRN/0tu5DE0e87eu7M3vjOOQgvxSIMkowczc0bcIIOT4LdcZv+8LwKFWVKwRdAO8c7YZidYvn/+p4tJKevbIUJZk0plwrnwL13wljHCEADTq/FQiAZvUFkei9IKzr24idDH3lxyTm7KwjuFpOsMUZABW1tHuL7k/J0wi+/w8B4YSPqr2zdRxkagOi6PIw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(5660300002)(966005)(52116002)(107886003)(31696002)(508600001)(6666004)(26005)(6512007)(186003)(2616005)(316002)(53546011)(6506007)(6916009)(54906003)(2906002)(38100700002)(6486002)(66476007)(66946007)(66556008)(38350700002)(4326008)(8676002)(31686004)(83380400001)(30864003)(7416002)(8936002)(10944003)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDc2ZldkS1VTUlh0ZEhZcFRJWjdKaHRESnJyYWpOUGhDbnl0aDhaUWUwNHNG?=
 =?utf-8?B?aFQrMEt1TVc1YnF6QnRBeVBzYmRFK1UxbEdIS0o5eW1xSTFPWWxuS01Odjh5?=
 =?utf-8?B?cDF0ajZHOHBTUERKNTlES29Ga0huYURabmUwbnFWeFZ2ZS9ZcE0xVENQR0xK?=
 =?utf-8?B?L0NUUisxeG1mNmZVa2UwMnpCeXlWRmZpekdtVUhhVFdRZWRXNGE0bFQ4NmlW?=
 =?utf-8?B?dnBscWFJc2dDSHNrR2tMcDdXQ3BmOHRXajVodXY5eklrUnRLTVltOTM0ZndY?=
 =?utf-8?B?eXJCaW14clpxMmZWNDZ0Rm5JN1hPMGxoYjgra0EybVlQN2JyRE9TQXd5YUM5?=
 =?utf-8?B?SWkyOW1QMC92Y3ZLZXNhQTR1RzZyaDN0b2pyamJEdmlHQ0R0MVNyTElTSUg5?=
 =?utf-8?B?MDVId3EvSldvQUZ3YUtNbkZxZ1ludmRoa0FUVjZJTWQ4azExZXg3cEQ1YTFU?=
 =?utf-8?B?RUc2YzFYeHhCQ29ZbWMxNE1aMU5rZGVYWjhhcjJYeGN4ZjdralhNUnpFdk11?=
 =?utf-8?B?OHNJWEV5THExNzZ6SFh6YS9Jc2s3cm9aVGJOeXBMN1ZuOUY2UllLSjQwU3Bw?=
 =?utf-8?B?OXQ5QmhxQkhOZzF0MFVVNGx0NXNDbCt0cndYSG9yb2JpOHNyRFFhR1piNjcx?=
 =?utf-8?B?enVESnhUanRXV1FvWVZqc1RNTDdZQVNPdHdJVVp6OUs0NGFGdTgrenovcGpD?=
 =?utf-8?B?cm9zaS9SdkRKcTM3SGZGVTdCTW5IZjBYem96aU52N2tHeFhtTDRpVGgwSWMx?=
 =?utf-8?B?ZThqZ2FJMzZvUk55VmJuVkNrZnM5c0ZuM29yRWptUXF0L0Zuc2o5YXFtbzNr?=
 =?utf-8?B?elU5Z2JPMmpWSFVsYVo3bWgxckNlbGE2UDYzQS9CSFZ2dEs3dWYvZFdhN24w?=
 =?utf-8?B?ekh5aFBVWEVDWHJzdlBCSTFJSnFrM05pK3dVMmUzbVJoTUVLY1hZQm43ZlhM?=
 =?utf-8?B?aXBaRkV5NHFNOUtVemhXVWRydE1yTzNzWlNvTjhtSThIckk3NjRvODE5aFB6?=
 =?utf-8?B?cVlGaTd0STh0WVhXWFh0WG1pNzk2T3h1bWRYNk9PU1dVeTVSUTRIaDY1TjNJ?=
 =?utf-8?B?R2JrSDdQZUlzbTI2cDM1b2F0VEpJeTFORFJjRzVJbkdYeVcvZDU5WHBBaDQ1?=
 =?utf-8?B?TDVRYUdnZUd6b3c2eXZ2SmdQZzRITkM1NERqVlc1M2I0dHgwa0JiRUJBaVZp?=
 =?utf-8?B?c2JDZ0RJa1FIUmdOTEJ4WmR6cnlxNysvMHg1aFBQK1g3VUt0Um04MFVJOVIy?=
 =?utf-8?B?VEVraDdFTlF2dUtXSVhKSGpXWXdTZ3pRQ2M3TFJiZmFUWm9OanhHQ2VrMVBp?=
 =?utf-8?B?QlFFK2RhUnNwOHNoSHdMZ3BzeHdoTDU4NnM1RzhZdDMzc2N6NHlvOGpSTUcx?=
 =?utf-8?B?eTdLdzZGTTZsTU5Cbjd2bGZxUXd1ZDJlSHNPSDZUZWRKeUFCRWRadDVpWm5i?=
 =?utf-8?B?ZHJnb0d4WlRCMjVhdC8weFBCNThwaGJ2M2NUU0xoWDJOYk1qYzRXL0FWNEdG?=
 =?utf-8?B?bHBUbFkwVHNaWWVUSk8vVnFsb0lhSGQ3TDZQOFpwMEx4TVRQWGJtMlF2Ynda?=
 =?utf-8?B?a2w0UzFKZ2FPTzV2djBkSG53alAxSEp4WncydlVSTHlUZ3lSUGlVMWk2S2x2?=
 =?utf-8?B?L1FzbjV0aHdHQ09BVkpqNzdMQm5wQklybDZCcHhRcXUwWlFVcE5HM01pbnlF?=
 =?utf-8?B?VmJ4czhuVjlZUEVONGhMM28vY1NiRmQ4c1A4dVJKVTRsSG51R3RRMDlEVkVZ?=
 =?utf-8?B?Ryt6WTZDS0NQZC9VOVdNOTduZHVZVGxJUVdVRG9VeDNBMzAwdlJYVXV1dGlG?=
 =?utf-8?B?VHpoQ3I5Z0RWQ2ZFZkkrNVRuWHd0N2dXWUticjYxNmpRRjR1VGM5Nnp6M0Iw?=
 =?utf-8?B?Y3pqSDA4di9wRGtRWmIraGJHUThTVGpxMVNJMGd2SDRRTmFxUmNtSjhPV2tC?=
 =?utf-8?B?d0VCSkhKclVyc0c1RG01ZHJ4Y3hQN1J6VUczQllScmNDK2Y1d1pxYTNBbU41?=
 =?utf-8?B?VzhoSmxWUjBpb215a09vVmtSdzFtbFBZekdHZkV6eThMOTVwU09yU1pRcndJ?=
 =?utf-8?B?cFpPcXJPUzF6dW9CZzZLdHdGc1RLMDY0bzc5U0I5U1ZpSTU4L1ZSblZlSkNm?=
 =?utf-8?B?T2ZuQkQ3TFRQSTB4NDRDd2J1amVRbzMzQ2RFWHF3WGJaakY4YTU2NDVaOW05?=
 =?utf-8?B?NXJET0xsZGlkS0ozRWhVZmgwdG4xS3lRcERMUHRNM09MeitGZ3krWTJHSlAz?=
 =?utf-8?B?bXlMWkQxcmtqOW9jK3ZYTWZsakdITnp1ZGdKVnhWZ0FNT3FQMWo2NUFpc1k5?=
 =?utf-8?B?ZmQrU2ZwSW1ET1grd2pDNk5XUnliaWpIOHZUNU1zdVRQc00xd0xHa1o5d3VV?=
 =?utf-8?Q?EOOq53XQBhyjoq02iqaPx9Dudh9kuuHsnHePy?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d2ad9ec-f369-4b59-426a-08da2d99a54a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 06:45:15.7699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rLJDPZkjWt+qhLkFuLbEEmPty0b4tja3PCD0i79Q2+nmZ8Mcl7pgtofM55VdKzwGOKWIuUCdiPazkFmJB5CtZ2gcmD+S/TbDmEcGFq2q4Dk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2854
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org,
 Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 openipmi-developer@lists.sourceforge.net,
 Open Source Submission <patches@amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 23/04/2022 08:51, Corey Minyard wrote:
> On Fri, Apr 22, 2022 at 11:08:01AM +0700, Quan Nguyen wrote:
>> The SMBus system interface (SSIF) IPMI BMC driver can be used to perform
>> in-band IPMI communication with their host in management (BMC) side.
>>
>> Thanks Dan for the copy_from_user() fix in the link below.
> 
> This is much better, the handling of lengths and indexes is much easier
> to understand.  I hope you agree.
> 
> I may be repeating myself on some things, it's been a while since the
> last submit.  So please forgive me if I do.
> 

Thank you, Corey.
Please do. I dont know how to express my thanks but without your comment 
the code will not get better.

> Comments inline...
> 
>>
>> Link: https://lore.kernel.org/linux-arm-kernel/20220310114119.13736-4-quan@os.amperecomputing.com/
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>> v7:
>>    + Remove unneccessary del_timer() in response_timeout()        [Corey]
>>    + Change compatible string from "ampere,ssif-bmc" to "ssif-bmc"  [Jae]
>>    + Add MODULE_DEVICE_TABLE(of, ssif_bmc_match), fix blank line    [Jae]
>>    + Dropped the use of ssif_msg_len() macro, use the len directly [Quan]
>>    + Solve possible issue if both response timer and ssif_bmc_write()
>>    occurred at the same time                                      [Corey]
>>    + Fix wrong return type of ssif_bmc_poll()         [kernel robot test]
>>    + Refactor and introduce ssif_part_buffer struct to replace the
>>    response_buf to manage each send/receive part of ssif           [Quan]
>>    + Change SSIF_BAD_SMBUS state to SSIF_ABORTING state           [Corey]
>>    + Support abort feature to skip the current bad request/response and
>>    wait until next new request                                    [Corey]
>>    + Refactor the PEC calculation to avoid the re-calculate the PEC on
>>    each I2C_SLAVE_WRITE_RECEIVED event                             [Quan]
>>    + Fix the use of error-proned idx                              [Corey]
>>    + Defer the test for valid SMBus command until the read/write part
>>    is determined                                                   [Quan]
>>    + Change/split unsupported_smbus_cmd() to
>>    supported_[write|read]_cmd()                                   [Corey]
>>    + Abort the request if somehow its size exceeded 255 bytes      [Quan]
>>
>> v6:
>>    + Drop the use of slave_enable()                             [Wolfram]
>>    + Make i2c-aspeed to issue RxCmdLast command on all
>>    I2C_SLAVE_WRITE_REQUESTED event to assert NAK when slave busy   [Quan]
>>    + Make i2c slave to return -EBUSY when it's busy                [Quan]
>>    + Drop the aborting feature as return Completion Code 0xFF may stop
>>    host to retry and make ipmi_ssif.so fails to load               [Quan]
>>    + Add timer to recover slave from busy state when no response   [Quan]
>>    + Clean request/response buffer appropriately                   [Quan]
>>    + Add some minor change on error and warning messages           [Quan]
>>
>> v5:
>>    + None
>>
>> v4:
>>    + Send response with Completion code 0xFF when aborting         [Quan]
>>    + Added bounding check on SMBus writes and the whole request     [Dan]
>>    + Moved buffer to end of struct ssif_bmc_ctx to avoid context
>>      corruption if somehow buffer is written past the end           [Dan]
>>    + Return -EINVAL if userspace buffer too small, dont
>>      silence truncate                                       [Corey, Joel]
>>    + Not necessary to check NONBLOCK in lock                      [Corey]
>>    + Enforce one user at a time                                    [Joel]
>>    + Reject write with invalid response length from userspace     [Corey]
>>    + Add state machines for better ssif bmc state handling         [Quan]
>>    + Drop ssif_bmc_aspeed.c and make ssif_bmc.c is generic
>>      SSIF BMC driver                                               [Quan]
>>    + Change compatible string "aspeed,ast2500-ssif-bmc" to
>>      "ampere,ssif-bmc"                                             [Quan]
>>    + Abort current request with invalid SMBus write or
>>      invalid command                                               [Quan]
>>    + Abort all request if there is pending response                [Quan]
>>    + Changed validate_pec() to validate_request()                  [Quan]
>>    + Add unsupported_smbus_cmd() to handle unknown SMBus command   [Quan]
>>    + Print internal state string for ease investigating issue      [Quan]
>>    + Move to READY state on SLAVE_STOP event                       [Quan]
>>    + Change initilize_transfer() to process_smbus_cmd()            [Quan]
>>    + Introduce functions for each slave event                      [Quan]
>>
>> v3:
>>    + Removed redundant license info                                [Joel]
>>    + Switched to use traditional if-else                           [Joel]
>>    + Removed unused ssif_bmc_ioctl()                               [Joel]
>>    + Made handle_request()/complete_response() to return void      [Joel]
>>    + Refactored send_ssif_bmc_response() and
>>    receive_ssif_bmc_request()                                     [Corey]
>>    + Removed mutex                                                [Corey]
>>    + Use spin_lock/unlock_irqsave/restore in callback             [Corey]
>>    + Removed the unnecessary memset                               [Corey]
>>    + Switch to use dev_err()                                      [Corey]
>>
>> v2:
>>    + Fixed compiling error with COMPILE_TEST for arc
>>
>>   drivers/char/ipmi/Kconfig    |  11 +
>>   drivers/char/ipmi/Makefile   |   1 +
>>   drivers/char/ipmi/ssif_bmc.c | 780 +++++++++++++++++++++++++++++++++++
>>   drivers/char/ipmi/ssif_bmc.h | 107 +++++
>>   4 files changed, 899 insertions(+)
>>   create mode 100644 drivers/char/ipmi/ssif_bmc.c
>>   create mode 100644 drivers/char/ipmi/ssif_bmc.h
>>
>> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
>> index b061e6b513ed..18a89093d64e 100644
>> --- a/drivers/char/ipmi/Kconfig
>> +++ b/drivers/char/ipmi/Kconfig
>> @@ -169,6 +169,17 @@ config ASPEED_BT_IPMI_BMC
>>   	  found on Aspeed SOCs (AST2400 and AST2500). The driver
>>   	  implements the BMC side of the BT interface.
>>   
>> +config SSIF_IPMI_BMC
>> +	tristate "SSIF IPMI BMC driver"
>> +	select I2C
>> +	select I2C_SLAVE
>> +	help
>> +	  This enables the IPMI SMBus system interface (SSIF) at the
>> +	  management (BMC) side.
>> +
>> +	  The driver implements the BMC side of the SMBus system
>> +	  interface (SSIF).
>> +
>>   config IPMB_DEVICE_INTERFACE
>>   	tristate 'IPMB Interface handler'
>>   	depends on I2C
>> diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
>> index 7ce790efad92..cb6138b8ded9 100644
>> --- a/drivers/char/ipmi/Makefile
>> +++ b/drivers/char/ipmi/Makefile
>> @@ -30,3 +30,4 @@ obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
>>   obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs_bmc_aspeed.o
>>   obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) += kcs_bmc_npcm7xx.o
>>   obj-$(CONFIG_IPMB_DEVICE_INTERFACE) += ipmb_dev_int.o
>> +obj-$(CONFIG_SSIF_IPMI_BMC) += ssif_bmc.o
>> diff --git a/drivers/char/ipmi/ssif_bmc.c b/drivers/char/ipmi/ssif_bmc.c
>> new file mode 100644
>> index 000000000000..4cff5e1a075e
>> --- /dev/null
>> +++ b/drivers/char/ipmi/ssif_bmc.c
>> @@ -0,0 +1,780 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * The driver for BMC side of SSIF interface
>> + *
>> + * Copyright (c) 2022, Ampere Computing LLC
>> + *
>> + */
>> +
>> +#include <linux/i2c.h>
>> +#include <linux/miscdevice.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/poll.h>
>> +#include <linux/sched.h>
>> +#include <linux/mutex.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/timer.h>
>> +#include <linux/jiffies.h>
>> +
>> +#include "ssif_bmc.h"
>> +
>> +static const char *state_to_string(enum ssif_state state)
>> +{
>> +	switch (state) {
>> +	case SSIF_READY:
>> +		return "SSIF_READY";
>> +	case SSIF_START:
>> +		return "SSIF_START";
>> +	case SSIF_SMBUS_CMD:
>> +		return "SSIF_SMBUS_CMD";
>> +	case SSIF_REQ_RECVING:
>> +		return "SSIF_REQ_RECVING";
>> +	case SSIF_RES_SENDING:
>> +		return "SSIF_RES_SENDING";
>> +	case SSIF_ABORTING:
>> +		return "SSIF_ABORTING";
>> +	default:
>> +		return "SSIF_STATE_UNKNOWN";
>> +	}
>> +}
>> +
>> +/* Handle SSIF message that will be sent to user */
>> +static ssize_t ssif_bmc_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
>> +{
>> +	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
>> +	struct ssif_msg msg;
>> +	unsigned long flags;
>> +	ssize_t ret;
>> +
>> +	spin_lock_irqsave(&ssif_bmc->lock, flags);
>> +	while (!ssif_bmc->request_available) {
>> +		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
>> +		if (file->f_flags & O_NONBLOCK)
>> +			return -EAGAIN;
>> +		ret = wait_event_interruptible(ssif_bmc->wait_queue,
>> +					       ssif_bmc->request_available);
>> +		if (ret)
>> +			return ret;
>> +		spin_lock_irqsave(&ssif_bmc->lock, flags);
>> +	}
>> +
>> +	if (count < min_t(ssize_t, ssif_bmc->request.len + 1, sizeof(struct ssif_msg))) {
>> +		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
>> +		ret = -EINVAL;
>> +	} else {
>> +		count = min_t(ssize_t, ssif_bmc->request.len + 1, sizeof(struct ssif_msg));
>> +		memcpy(&msg, &ssif_bmc->request, count);
>> +		ssif_bmc->request_available = false;
>> +		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
>> +
>> +		ret = copy_to_user(buf, &msg, count);
>> +	}
>> +
>> +	return (ret < 0) ? ret : count;
>> +}
>> +
>> +/* Handle SSIF message that is written by user */
>> +static ssize_t ssif_bmc_write(struct file *file, const char __user *buf, size_t count,
>> +			      loff_t *ppos)
>> +{
>> +	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
>> +	struct ssif_msg msg;
>> +	unsigned long flags;
>> +	ssize_t ret;
>> +
>> +	if (count > sizeof(struct ssif_msg))
>> +		return -EINVAL;
>> +
>> +	if (copy_from_user(&msg, buf, count))
>> +		return -EFAULT;
>> +
>> +	if (!msg.len || count < msg.len + 1)
>> +		return -EINVAL;
>> +
>> +	spin_lock_irqsave(&ssif_bmc->lock, flags);
>> +	while (ssif_bmc->response_in_progress) {
>> +		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
>> +		if (file->f_flags & O_NONBLOCK)
>> +			return -EAGAIN;
>> +		ret = wait_event_interruptible(ssif_bmc->wait_queue,
>> +					       !ssif_bmc->response_in_progress);
>> +		if (ret)
>> +			return ret;
>> +		spin_lock_irqsave(&ssif_bmc->lock, flags);
>> +	}
>> +
>> +	/*
>> +	 * The write must complete before the response timeout fired, otherwise
>> +	 * the response is aborted and wait for next request
>> +	 * Return -EINVAL if the response is aborted
>> +	 */
>> +	ret = (ssif_bmc->response_timer_inited) ? 0 : -EINVAL;
>> +	if (ret)
>> +		goto exit;
>> +
>> +	del_timer(&ssif_bmc->response_timer);
>> +	ssif_bmc->response_timer_inited = false;
>> +
>> +	memcpy(&ssif_bmc->response, &msg, count);
>> +	ssif_bmc->is_singlepart_read = (msg.len <= MAX_PAYLOAD_PER_TRANSACTION);
>> +
>> +	ssif_bmc->response_in_progress = true;
>> +
>> +	/* ssif_bmc not busy */
>> +	ssif_bmc->busy = false;
>> +
>> +	/* Clean old request buffer */
>> +	memset(&ssif_bmc->request, 0, sizeof(struct ssif_msg));
>> +exit:
>> +	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
>> +
>> +	return (ret < 0) ? ret : count;
>> +}
>> +
>> +static int ssif_bmc_open(struct inode *inode, struct file *file)
>> +{
>> +	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
>> +	int ret = 0;
>> +
>> +	spin_lock_irq(&ssif_bmc->lock);
>> +	if (!ssif_bmc->running)
>> +		ssif_bmc->running = 1;
>> +	else
>> +		ret = -EBUSY;
>> +	spin_unlock_irq(&ssif_bmc->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static __poll_t ssif_bmc_poll(struct file *file, poll_table *wait)
>> +{
>> +	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
>> +	__poll_t mask = 0;
>> +
>> +	poll_wait(file, &ssif_bmc->wait_queue, wait);
>> +
>> +	spin_lock_irq(&ssif_bmc->lock);
>> +	/* The request is available, userspace application can get the request */
>> +	if (ssif_bmc->request_available)
>> +		mask |= POLLIN;
>> +
>> +	spin_unlock_irq(&ssif_bmc->lock);
>> +
>> +	return mask;
>> +}
>> +
>> +static int ssif_bmc_release(struct inode *inode, struct file *file)
>> +{
>> +	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
>> +
>> +	spin_lock_irq(&ssif_bmc->lock);
>> +	ssif_bmc->running = 0;
>> +	spin_unlock_irq(&ssif_bmc->lock);
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * System calls to device interface for user apps
>> + */
>> +static const struct file_operations ssif_bmc_fops = {
>> +	.owner		= THIS_MODULE,
>> +	.open		= ssif_bmc_open,
>> +	.read		= ssif_bmc_read,
>> +	.write		= ssif_bmc_write,
>> +	.release	= ssif_bmc_release,
>> +	.poll		= ssif_bmc_poll,
>> +};
>> +
>> +/* Called with ssif_bmc->lock held. */
>> +static void complete_response(struct ssif_bmc_ctx *ssif_bmc)
>> +{
>> +	/* Invalidate response in buffer to denote it having been sent. */
>> +	ssif_bmc->response.len = 0;
>> +	ssif_bmc->response_in_progress = false;
>> +	ssif_bmc->nbytes_processed = 0;
>> +	ssif_bmc->remain_len = 0;
>> +	ssif_bmc->busy = false;
>> +	memset(&ssif_bmc->part_buf, 0, sizeof(struct ssif_part_buffer));
>> +	wake_up_all(&ssif_bmc->wait_queue);
>> +}
>> +
>> +static void response_timeout(struct timer_list *t)
>> +{
>> +	struct ssif_bmc_ctx *ssif_bmc = from_timer(ssif_bmc, t, response_timer);
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&ssif_bmc->lock, flags);
>> +
>> +	/* Do nothing if the response is in progress */
>> +	if (!ssif_bmc->response_in_progress) {
>> +		/* Recover ssif_bmc from busy */
>> +		ssif_bmc->busy = false;
>> +		ssif_bmc->response_timer_inited = false;
>> +		/* Set aborting flag */
>> +		ssif_bmc->aborting = true;
>> +	}
>> +
>> +	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
>> +}
>> +
>> +/* Called with ssif_bmc->lock held. */
>> +static void handle_request(struct ssif_bmc_ctx *ssif_bmc)
>> +{
>> +	/* set ssif_bmc to busy waiting for response */
>> +	ssif_bmc->busy = true;
>> +	/* Request message is available to process */
>> +	ssif_bmc->request_available = true;
>> +	/* Clean old response buffer */
>> +	memset(&ssif_bmc->response, 0, sizeof(struct ssif_msg));
>> +	/* This is the new READ request.*/
>> +	wake_up_all(&ssif_bmc->wait_queue);
>> +
>> +	/* Armed timer to recover slave from busy state in case of no response */
>> +	if (!ssif_bmc->response_timer_inited) {
>> +		timer_setup(&ssif_bmc->response_timer, response_timeout, 0);
>> +		ssif_bmc->response_timer_inited = true;
>> +	}
>> +	mod_timer(&ssif_bmc->response_timer, jiffies + msecs_to_jiffies(RESPONSE_TIMEOUT));
>> +}
>> +
>> +static void calculate_response_part_pec(struct ssif_part_buffer *part)
>> +{
>> +	u8 addr = part->address;
>> +
>> +	/* PEC - Start Read Address */
>> +	part->pec = i2c_smbus_pec(0, &addr, 1);
>> +	/* PEC - SSIF Command */
>> +	part->pec = i2c_smbus_pec(part->pec, &part->smbus_cmd, 1);
>> +	/* PEC - Restart Write Address */
>> +	addr = addr | 0x01;
>> +	part->pec = i2c_smbus_pec(part->pec, &addr, 1);
>> +	part->pec = i2c_smbus_pec(part->pec, &part->length, 1);
>> +	if (part->length)
>> +		part->pec = i2c_smbus_pec(part->pec, part->payload, part->length);
>> +}
>> +
>> +static void set_singlepart_response_buffer(struct ssif_bmc_ctx *ssif_bmc)
>> +{
>> +	struct ssif_part_buffer *part = &ssif_bmc->part_buf;
>> +
>> +	part->address = GET_8BIT_ADDR(ssif_bmc->client->addr);
>> +	part->length = ssif_bmc->response.len;
>> +
>> +	/* Clear the rest to 0 */
>> +	memset(part->payload + part->length, 0, MAX_PAYLOAD_PER_TRANSACTION - part->length);
>> +	memcpy(&part->payload[0], &ssif_bmc->response.payload[0], part->length);
>> +}
>> +
>> +static void set_multipart_response_buffer(struct ssif_bmc_ctx *ssif_bmc)
>> +{
>> +	struct ssif_part_buffer *part = &ssif_bmc->part_buf;
>> +	u8 part_len = 0;
>> +
>> +	part->address = GET_8BIT_ADDR(ssif_bmc->client->addr);
>> +	switch (part->smbus_cmd) {
>> +	case SSIF_IPMI_MULTIPART_READ_START:
>> +		/*
>> +		 * Read Start length is 32 bytes.
>> +		 * Read Start transfer first 30 bytes of IPMI response
>> +		 * and 2 special code 0x00, 0x01.
>> +		 */
>> +		ssif_bmc->nbytes_processed = 0;
>> +		ssif_bmc->block_num = 0;
>> +		part->length = MAX_PAYLOAD_PER_TRANSACTION;
>> +		part_len = MAX_IPMI_DATA_PER_START_TRANSACTION;
>> +		ssif_bmc->remain_len = ssif_bmc->response.len - part_len;
>> +
>> +		part->payload[0] = 0x00; /* Start Flag */
>> +		part->payload[1] = 0x01; /* Start Flag */
>> +
>> +		memcpy(&part->payload[2], &ssif_bmc->response.payload[0], part_len);
>> +		break;
>> +
>> +	case SSIF_IPMI_MULTIPART_READ_MIDDLE:
>> +		/*
>> +		 * IPMI READ Middle or READ End messages can carry up to 31 bytes
>> +		 * IPMI data plus block number byte.
>> +		 */
>> +		if (ssif_bmc->remain_len < MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION) {
> 
> Shouldn't this be <=? If you were sending something that was exactly 94
> bytes, for instance, you should have a 32-byte start, a 31-byte middle,
> and a 31-byte end.  If you don't have <= here, you would have a start, two
> 31-byte middles, and a zero-length end, which is forbidden by the spec.
> 
Thank for the comment.
Will fix this in next version.

If so, in "94 bytes" case, we have to assure the end part length is at 
least 1 bytes. the last middle in this case must be 30.

>> +			/*
>> +			 * This is READ End message
>> +			 *  Return length is the remaining response data length
>> +			 *  plus block number
>> +			 *  Block number 0xFF is to indicate this is last message
>> +			 *
>> +			 */
>> +			/* Clean the buffer */
>> +			memset(&part->payload[0], 0, MAX_PAYLOAD_PER_TRANSACTION);
>> +			part->length = ssif_bmc->remain_len + 1;
>> +			part_len = ssif_bmc->remain_len;
>> +			ssif_bmc->block_num = 0xFF;
>> +			part->payload[0] = ssif_bmc->block_num;
>> +		} else {
>> +			/*
>> +			 * This is READ Middle message
>> +			 *  Response length is the maximum SMBUS transfer length
>> +			 *  Block number byte is incremented
>> +			 * Return length is maximum SMBUS transfer length
>> +			 */
>> +			part->length = MAX_PAYLOAD_PER_TRANSACTION;
>> +			part_len = MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION;
>> +			part->payload[0] = ssif_bmc->block_num;
>> +			ssif_bmc->block_num++;
>> +		}
>> +
>> +		ssif_bmc->remain_len -= part_len;
>> +		memcpy(&part->payload[1], ssif_bmc->response.payload + ssif_bmc->nbytes_processed,
>> +		       part_len);
>> +		break;
>> +
>> +	default:
>> +		/* Do not expect to go to this case */
>> +		dev_err(&ssif_bmc->client->dev, "%s: Unexpected SMBus command 0x%x\n",
>> +			__func__, part->smbus_cmd);
>> +		break;
>> +	}
>> +
>> +	ssif_bmc->nbytes_processed += part_len;
>> +}
>> +
>> +static bool supported_read_cmd(u8 cmd)
>> +{
>> +	if (cmd == SSIF_IPMI_SINGLEPART_READ ||
>> +	    cmd == SSIF_IPMI_MULTIPART_READ_START ||
>> +	    cmd == SSIF_IPMI_MULTIPART_READ_MIDDLE)
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>> +static bool supported_write_cmd(u8 cmd)
>> +{
>> +	if (cmd == SSIF_IPMI_SINGLEPART_WRITE ||
>> +	    cmd == SSIF_IPMI_MULTIPART_WRITE_START ||
>> +	    cmd == SSIF_IPMI_MULTIPART_WRITE_MIDDLE ||
>> +	    cmd == SSIF_IPMI_MULTIPART_WRITE_END)
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>> +/* Process the IPMI response that will be read by master */
>> +static void handle_read_processed(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
>> +{
>> +	struct ssif_part_buffer *part = &ssif_bmc->part_buf;
>> +
>> +	/* msg_idx start from 0 */
>> +	if (part->index < part->length)
>> +		*val = part->payload[part->index];
>> +	else if (part->index == part->length && ssif_bmc->pec_support)
>> +		*val = part->pec;
>> +	else
>> +		*val = 0;
>> +
>> +	part->index++;
>> +}
>> +
>> +static void handle_write_received(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
>> +{
>> +	/* msg_idx should not be 0 when reach here */
>> +	if (!ssif_bmc->msg_idx || ssif_bmc->msg_idx > MAX_TRANSACTION)
> 
> Should be >= 0 here?  If not, (PEC maybe?) you should document why,
> because it raises red flags.
> 
Yes, will fix in next version.
The msg_idx should not be 0 here because it must be at least set to 1 in 
process_smbus_cmd() before calling this function.

The MAX_TRANSACTION is 32 bytes payload + 4 bytes for slave address, the 
command, the len and the PEC.

So I think it would change to:
if (ssif_bmc->msg_idx >= 0 || ssif_bmc->msg_idx > MAX_TRANSACTION)

>> +		return;
>> +
>> +	if (ssif_bmc->msg_idx == 1) {
>> +		ssif_bmc->part_buf.length = *val;
>> +		ssif_bmc->part_buf.index = 0;
>> +	} else {
>> +		ssif_bmc->part_buf.payload[ssif_bmc->part_buf.index++] = *val;
>> +	}
>> +
>> +	ssif_bmc->msg_idx++;
>> +}
>> +
>> +static bool validate_request_part(struct ssif_bmc_ctx *ssif_bmc)
>> +{
>> +	struct ssif_part_buffer *part = &ssif_bmc->part_buf;
>> +	bool ret = true;
>> +	u8 cpec;
>> +	u8 addr;
>> +
>> +	if (part->index == part->length) {
>> +		/* PEC is not included */
>> +		ssif_bmc->pec_support = false;
>> +		ret = true;
>> +		goto exit;
>> +	}
>> +
>> +	if (part->index != part->length + 1) {
>> +		ret = false;
>> +		goto exit;
>> +	}
>> +
>> +	/* PEC is included */
>> +	ssif_bmc->pec_support = true;
>> +	part->pec = part->payload[part->length];
>> +	addr = GET_8BIT_ADDR(ssif_bmc->client->addr);
>> +	cpec = i2c_smbus_pec(0, &addr, 1);
>> +	cpec = i2c_smbus_pec(cpec, &part->smbus_cmd, 1);
>> +	cpec = i2c_smbus_pec(cpec, &part->length, 1);
>> +	/*
>> +	 * As SMBus specification does not allow the length
>> +	 * (byte count) in the Write-Block protocol to be zero.
>> +	 * Therefore, it is illegal to have the last Middle
>> +	 * transaction in the sequence carry 32-byte and have
>> +	 * a length of ‘0’ in the End transaction.
>> +	 * But some users may try to use this way and we should
>> +	 * prevent ssif_bmc driver broken in this case.
>> +	 */
>> +	if (part->length)
>> +		cpec = i2c_smbus_pec(cpec, part->payload, part->length);
>> +
>> +	if (cpec != part->pec)
>> +		ret = false;
>> +
>> +exit:
>> +	return ret;
>> +}
>> +
>> +static void process_request_part(struct ssif_bmc_ctx *ssif_bmc)
>> +{
>> +	struct ssif_part_buffer *part = &ssif_bmc->part_buf;
>> +
>> +	switch (part->smbus_cmd) {
>> +	case SSIF_IPMI_SINGLEPART_WRITE:
>> +		/* save the whole part to request*/
>> +		ssif_bmc->request.len = part->length;
>> +		memcpy(ssif_bmc->request.payload, part->payload, part->length);
>> +
>> +		break;
>> +	case SSIF_IPMI_MULTIPART_WRITE_START:
>> +			ssif_bmc->request.len = 0;
> 
> Spacing issue here.  You need to run patches through checkpatch.pl
> before submitting them.  Also, the empty lines here and above are
> inconsistent with the rest of the file.
> 
Yes, will fix in next version.
But it was always checked with checkpatch.pl everytime. Dont know why 
checkpatch.pl did not catch it.

>> +
>> +		fallthrough;
>> +	case SSIF_IPMI_MULTIPART_WRITE_MIDDLE:
>> +	case SSIF_IPMI_MULTIPART_WRITE_END:
>> +		/* Do the bound check here, not allow the request len exceed 254 bytes */
>> +		if (ssif_bmc->request.len <= MSG_PAYLOAD_LEN_MAX - part->length) {
> 
> Again, the <= is not normal for this check.  If it's correct, it needs
> to be documented.
> 
Will rewrite this part in next version

>> +			memcpy(ssif_bmc->request.payload + ssif_bmc->request.len,
>> +			       part->payload, part->length);
>> +			ssif_bmc->request.len += part->length;
>> +		} else {
>> +			dev_warn(&ssif_bmc->client->dev,
>> +				 "Warn: Request exceeded 254 bytes, aborting");
>> +			/* Request too long, aborting */
>> +			ssif_bmc->aborting =  true;
>> +		}
>> +		break;
>> +	default:
>> +		/* Do not expect to go to this case */
>> +		dev_err(&ssif_bmc->client->dev, "%s: Unexpected SMBus command 0x%x\n",
>> +			__func__, part->smbus_cmd);
>> +		break;
>> +	}
>> +}
>> +
>> +static void process_smbus_cmd(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
>> +{
>> +	/* SMBUS command can vary (single or multi-part) */
>> +	ssif_bmc->part_buf.smbus_cmd = *val;
>> +	ssif_bmc->msg_idx = 1;
>> +
>> +	if (*val == SSIF_IPMI_SINGLEPART_WRITE || *val == SSIF_IPMI_MULTIPART_WRITE_START) {
>> +		/*
>> +		 * The response maybe not come in-time, causing host SSIF driver
>> +		 * to timeout and resend a new request. In such case check for
>> +		 * pending response and clear it
>> +		 */
>> +		if (ssif_bmc->response_in_progress)
>> +			complete_response(ssif_bmc);
>> +
>> +		/* This is new request, flip aborting flag if set */
>> +		if (ssif_bmc->aborting)
>> +			ssif_bmc->aborting = false;
>> +	}
>> +}
>> +
>> +static void on_read_requested_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
>> +{
>> +	if (ssif_bmc->state == SSIF_READY ||
>> +	    ssif_bmc->state == SSIF_START ||
>> +	    ssif_bmc->state == SSIF_REQ_RECVING ||
>> +	    ssif_bmc->state == SSIF_RES_SENDING) {
>> +		dev_warn(&ssif_bmc->client->dev,
>> +			 "Warn: %s unexpected READ REQUESTED in state=%s\n",
>> +			 __func__, state_to_string(ssif_bmc->state));
>> +		ssif_bmc->state = SSIF_ABORTING;
>> +		*val = 0;
>> +		return;
>> +
>> +	} else if (ssif_bmc->state == SSIF_SMBUS_CMD) {
>> +		if (!supported_read_cmd(ssif_bmc->part_buf.smbus_cmd)) {
>> +			dev_warn(&ssif_bmc->client->dev, "Warn: Unknown SMBus read command=0x%x",
>> +				 ssif_bmc->part_buf.smbus_cmd);
>> +			ssif_bmc->aborting = true;
>> +		}
>> +
>> +		if (ssif_bmc->aborting)
>> +			ssif_bmc->state = SSIF_ABORTING;
>> +		else
>> +			ssif_bmc->state = SSIF_RES_SENDING;
>> +	}
>> +
>> +	ssif_bmc->msg_idx = 0;
>> +
>> +	/* Send 0 if there is nothing to send */
>> +	if (!ssif_bmc->response_in_progress || ssif_bmc->state == SSIF_ABORTING) {
>> +		*val = 0;
>> +		return;
>> +	}
>> +
>> +	if (ssif_bmc->is_singlepart_read)
>> +		set_singlepart_response_buffer(ssif_bmc);
>> +	else
>> +		set_multipart_response_buffer(ssif_bmc);
>> +
>> +	calculate_response_part_pec(&ssif_bmc->part_buf);
>> +	ssif_bmc->part_buf.index = 0;
>> +	*val = ssif_bmc->part_buf.length;
>> +}
>> +
>> +static void on_read_processed_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
>> +{
>> +	if (ssif_bmc->state == SSIF_READY ||
>> +	    ssif_bmc->state == SSIF_START ||
>> +	    ssif_bmc->state == SSIF_REQ_RECVING ||
>> +	    ssif_bmc->state == SSIF_SMBUS_CMD) {
>> +		dev_warn(&ssif_bmc->client->dev,
>> +			 "Warn: %s unexpected READ PROCESSED in state=%s\n",
>> +			 __func__, state_to_string(ssif_bmc->state));
>> +		ssif_bmc->state = SSIF_ABORTING;
>> +		*val = 0;
>> +		return;
>> +	}
>> +
>> +	/* Send 0 if there is nothing to send */
>> +	if (!ssif_bmc->response_in_progress || ssif_bmc->state == SSIF_ABORTING) {
>> +		*val = 0;
>> +		return;
>> +	}
>> +
>> +	handle_read_processed(ssif_bmc, val);
>> +}
>> +
>> +static void on_write_requested_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
>> +{
>> +	if (ssif_bmc->state == SSIF_READY || ssif_bmc->state == SSIF_SMBUS_CMD) {
>> +		ssif_bmc->state = SSIF_START;
>> +
>> +	} else if (ssif_bmc->state == SSIF_START ||
>> +		   ssif_bmc->state == SSIF_REQ_RECVING ||
>> +		   ssif_bmc->state == SSIF_RES_SENDING) {
>> +		dev_warn(&ssif_bmc->client->dev,
>> +			 "Warn: %s unexpected WRITE REQUEST in state=%s\n",
>> +			 __func__, state_to_string(ssif_bmc->state));
>> +		ssif_bmc->state = SSIF_ABORTING;
>> +		return;
>> +	}
>> +
>> +	ssif_bmc->msg_idx = 0;
>> +	ssif_bmc->part_buf.address = *val;
>> +}
>> +
>> +static void on_write_received_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
>> +{
>> +	if (ssif_bmc->state == SSIF_READY ||
>> +	    ssif_bmc->state == SSIF_RES_SENDING) {
>> +		dev_warn(&ssif_bmc->client->dev,
>> +			 "Warn: %s unexpected WRITE RECEIVED in state=%s\n",
>> +			 __func__, state_to_string(ssif_bmc->state));
>> +		ssif_bmc->state = SSIF_ABORTING;
>> +
>> +	} else if (ssif_bmc->state == SSIF_START) {
>> +		ssif_bmc->state = SSIF_SMBUS_CMD;
>> +
>> +	} else if (ssif_bmc->state == SSIF_SMBUS_CMD) {
>> +		if (!supported_write_cmd(ssif_bmc->part_buf.smbus_cmd)) {
>> +			dev_warn(&ssif_bmc->client->dev, "Warn: Unknown SMBus write command=0x%x",
>> +				 ssif_bmc->part_buf.smbus_cmd);
>> +			ssif_bmc->aborting = true;
>> +		}
>> +
>> +		if (ssif_bmc->aborting)
>> +			ssif_bmc->state = SSIF_ABORTING;
>> +		else
>> +			ssif_bmc->state = SSIF_REQ_RECVING;
>> +	}
>> +
>> +	/* This is response sending state */
>> +	if (ssif_bmc->state == SSIF_REQ_RECVING)
>> +		handle_write_received(ssif_bmc, val);
>> +	else if (ssif_bmc->state == SSIF_SMBUS_CMD)
>> +		process_smbus_cmd(ssif_bmc, val);
>> +}
>> +
>> +static void on_stop_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
>> +{
>> +	if (ssif_bmc->state == SSIF_READY ||
>> +	    ssif_bmc->state == SSIF_START ||
>> +	    ssif_bmc->state == SSIF_SMBUS_CMD ||
>> +	    ssif_bmc->state == SSIF_ABORTING) {
>> +		dev_warn(&ssif_bmc->client->dev,
>> +			 "Warn: %s unexpected SLAVE STOP in state=%s\n",
>> +			 __func__, state_to_string(ssif_bmc->state));
>> +		ssif_bmc->state = SSIF_READY;
>> +
>> +	} else if (ssif_bmc->state == SSIF_REQ_RECVING) {
>> +		if (validate_request_part(ssif_bmc)) {
>> +			process_request_part(ssif_bmc);
>> +			if (ssif_bmc->part_buf.smbus_cmd == SSIF_IPMI_SINGLEPART_WRITE ||
>> +			    ssif_bmc->part_buf.smbus_cmd == SSIF_IPMI_MULTIPART_WRITE_END)
>> +				handle_request(ssif_bmc);
>> +			ssif_bmc->state = SSIF_READY;
>> +		} else {
>> +			/*
>> +			 * A BMC that receives an invalid request drop the data for the write
>> +			 * transaction and any further transactions (read or write) until
>> +			 * the next valid read or write Start transaction is received
>> +			 */
>> +			dev_err(&ssif_bmc->client->dev, "Error: invalid pec\n");
>> +			ssif_bmc->aborting = true;
>> +		}
>> +	} else if (ssif_bmc->state == SSIF_RES_SENDING) {
>> +		if (ssif_bmc->is_singlepart_read || ssif_bmc->block_num == 0xFF)
>> +			/* Invalidate response buffer to denote it is sent */
>> +			complete_response(ssif_bmc);
>> +		ssif_bmc->state = SSIF_READY;
>> +	}
>> +
>> +	/* Reset message index */
>> +	ssif_bmc->msg_idx = 0;
>> +}
>> +
>> +/*
>> + * Callback function to handle I2C slave events
>> + */
>> +static int ssif_bmc_cb(struct i2c_client *client, enum i2c_slave_event event, u8 *val)
>> +{
>> +	unsigned long flags;
>> +	struct ssif_bmc_ctx *ssif_bmc = i2c_get_clientdata(client);
>> +	int ret = 0;
>> +
>> +	spin_lock_irqsave(&ssif_bmc->lock, flags);
>> +
>> +	switch (event) {
>> +	case I2C_SLAVE_READ_REQUESTED:
>> +		on_read_requested_event(ssif_bmc, val);
>> +		break;
>> +
>> +	case I2C_SLAVE_WRITE_REQUESTED:
>> +		on_write_requested_event(ssif_bmc, val);
>> +		break;
>> +
>> +	case I2C_SLAVE_READ_PROCESSED:
>> +		on_read_processed_event(ssif_bmc, val);
>> +		break;
>> +
>> +	case I2C_SLAVE_WRITE_RECEIVED:
>> +		on_write_received_event(ssif_bmc, val);
>> +		break;
>> +
>> +	case I2C_SLAVE_STOP:
>> +		on_stop_event(ssif_bmc, val);
>> +		break;
>> +
>> +	default:
>> +		dev_warn(&ssif_bmc->client->dev, "Warn: Unknown i2c slave event\n");
>> +		break;
>> +	}
>> +
>> +	if (!ssif_bmc->aborting && ssif_bmc->busy)
>> +		ret = -EBUSY;
>> +
>> +	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ssif_bmc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>> +{
>> +	struct ssif_bmc_ctx *ssif_bmc;
>> +	int ret;
>> +
>> +	ssif_bmc = devm_kzalloc(&client->dev, sizeof(*ssif_bmc), GFP_KERNEL);
>> +	if (!ssif_bmc)
>> +		return -ENOMEM;
>> +
>> +	spin_lock_init(&ssif_bmc->lock);
>> +
>> +	init_waitqueue_head(&ssif_bmc->wait_queue);
>> +	ssif_bmc->request_available = false;
>> +	ssif_bmc->response_in_progress = false;
>> +	ssif_bmc->busy = false;
>> +	ssif_bmc->response_timer_inited = false;
>> +
>> +	/* Register misc device interface */
>> +	ssif_bmc->miscdev.minor = MISC_DYNAMIC_MINOR;
>> +	ssif_bmc->miscdev.name = DEVICE_NAME;
>> +	ssif_bmc->miscdev.fops = &ssif_bmc_fops;
>> +	ssif_bmc->miscdev.parent = &client->dev;
>> +	ret = misc_register(&ssif_bmc->miscdev);
>> +	if (ret)
>> +		goto out;
>> +
>> +	ssif_bmc->client = client;
>> +	ssif_bmc->client->flags |= I2C_CLIENT_SLAVE;
>> +
>> +	/* Register I2C slave */
>> +	i2c_set_clientdata(client, ssif_bmc);
>> +	ret = i2c_slave_register(client, ssif_bmc_cb);
>> +	if (ret) {
>> +		misc_deregister(&ssif_bmc->miscdev);
>> +		goto out;
>> +	}
>> +
>> +	return 0;
>> +out:
>> +	devm_kfree(&client->dev, ssif_bmc);
>> +	return ret;
>> +}
>> +
>> +static int ssif_bmc_remove(struct i2c_client *client)
>> +{
>> +	struct ssif_bmc_ctx *ssif_bmc = i2c_get_clientdata(client);
>> +
>> +	i2c_slave_unregister(client);
>> +	misc_deregister(&ssif_bmc->miscdev);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id ssif_bmc_match[] = {
>> +	{ .compatible = "ssif-bmc" },
>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(of, ssif_bmc_match);
>> +
>> +static const struct i2c_device_id ssif_bmc_id[] = {
>> +	{ DEVICE_NAME, 0 },
>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(i2c, ssif_bmc_id);
>> +
>> +static struct i2c_driver ssif_bmc_driver = {
>> +	.driver         = {
>> +		.name           = DEVICE_NAME,
>> +		.of_match_table = ssif_bmc_match,
>> +	},
>> +	.probe          = ssif_bmc_probe,
>> +	.remove         = ssif_bmc_remove,
>> +	.id_table       = ssif_bmc_id,
>> +};
>> +
>> +module_i2c_driver(ssif_bmc_driver);
>> +
>> +MODULE_AUTHOR("Quan Nguyen <quan@os.amperecomputing.com>");
>> +MODULE_AUTHOR("Chuong Tran <chuong@os.amperecomputing.com>");
>> +MODULE_DESCRIPTION("Linux device driver of the BMC IPMI SSIF interface.");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/char/ipmi/ssif_bmc.h b/drivers/char/ipmi/ssif_bmc.h
>> new file mode 100644
>> index 000000000000..2c3fc2a4698f
>> --- /dev/null
>> +++ b/drivers/char/ipmi/ssif_bmc.h
>> @@ -0,0 +1,107 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * The driver for BMC side of SSIF interface
>> + *
>> + * Copyright (c) 2022, Ampere Computing LLC
>> + *
>> + */
>> +#ifndef __SSIF_BMC_H__
>> +#define __SSIF_BMC_H__
>> +
> 
> Is there any value in having a separate .h file for this?  Unless you
> want to share something with the IPMI host side, which might make sense
> on some of the message numbers, but not a big deal, and even then you
> could put the .h file with the .c files.
> 
> Except for the userspace API, which I will address later.
> 

So far, there is no benefit to have separate .h file. So it will be 
merged into one single .c file in next version.

>> +#define DEVICE_NAME				"ipmi-ssif-host"
>> +
>> +#define GET_8BIT_ADDR(addr_7bit)		(((addr_7bit) << 1) & 0xff)
>> +
>> +/* A standard SMBus Transaction is limited to 32 data bytes */
>> +#define MAX_PAYLOAD_PER_TRANSACTION		32
>> +/* Transaction includes the address, the command, the length and the PEC byte */
>> +#define MAX_TRANSACTION				(MAX_PAYLOAD_PER_TRANSACTION + 4)
>> +
>> +#define MAX_IPMI_DATA_PER_START_TRANSACTION	30
>> +#define MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION	31
>> +
>> +#define SSIF_IPMI_SINGLEPART_WRITE		0x2
>> +#define SSIF_IPMI_SINGLEPART_READ		0x3
>> +#define SSIF_IPMI_MULTIPART_WRITE_START		0x6
>> +#define SSIF_IPMI_MULTIPART_WRITE_MIDDLE	0x7
>> +#define SSIF_IPMI_MULTIPART_WRITE_END		0x8
>> +#define SSIF_IPMI_MULTIPART_READ_START		0x3
>> +#define SSIF_IPMI_MULTIPART_READ_MIDDLE		0x9
>> +
>> +/* Include netfn and cmd field */
>> +#define MSG_PAYLOAD_LEN_MAX			254
>> +/*
>> + * IPMI 2.0 Spec, section 12.7 SSIF Timing,
>> + * Request-to-Response Time is T6max(250ms) - T1max(20ms) - 3ms = 227ms
>> + * Recover ssif_bmc from busy state if it takes up to 500ms
>> + */
>> +#define RESPONSE_TIMEOUT			500 /* ms */
>> +
> 
> I seem to remember mentioning this before, but there is no reason to
> pack the structures below.
> 

The packed structure is because we want to pick the len directly from 
user space without worry about the padding byte.

As we plan not to use the .h file in next version, I still would like to 
use packed structure internally inside ssif_bmc.c file.

> And second, the following is a userspace API structures, so it needs to
> be in its own file in include/uapi/linux, along with any supporting
> things that users will need to use.  And your userspace code should be
> using that file.
> 

Meantime, I'd like not to use .h as I see there is no demand for sharing 
the data structure between kernel and user space yet. But we may do it 
in the future.

>> +struct ssif_msg {
>> +	u8 len;
> 
> Just to be 100% safe, it might be better to use a u16 on this.  The spec
> sort of limits this to 255 bytes, but it also sort of leaves it open to
> be larger.
> 
Yes, u8 only limited to 255 bytes and there is no space for future grow.

>> +	u8 payload[MSG_PAYLOAD_LEN_MAX];
>> +} __packed;
>> +
>> +struct ssif_part_buffer {
>> +	u8 address;
>> +	u8 smbus_cmd;
>> +	u8 length;
>> +	u8 payload[MAX_PAYLOAD_PER_TRANSACTION];
>> +	u8 pec;
>> +	u8 index;
>> +} __packed;
>> +
>> +/*
>> + * SSIF internal states:
>> + *   SSIF_READY         0x00 : Ready state
>> + *   SSIF_START         0x01 : Start smbus transaction
>> + *   SSIF_SMBUS_CMD     0x02 : Received SMBus command
>> + *   SSIF_REQ_RECVING   0x03 : Receiving request
>> + *   SSIF_RES_SENDING   0x04 : Sending response
>> + *   SSIF_BAD_SMBUS     0x05 : Bad SMbus transaction
>> + */
>> +enum ssif_state {
>> +	SSIF_READY,
>> +	SSIF_START,
>> +	SSIF_SMBUS_CMD,
>> +	SSIF_REQ_RECVING,
>> +	SSIF_RES_SENDING,
>> +	SSIF_ABORTING,
>> +	SSIF_STATE_MAX
>> +};
>> +
>> +struct ssif_bmc_ctx {
>> +	struct i2c_client	*client;
>> +	struct miscdevice	miscdev;
>> +	int			msg_idx;
>> +	bool			pec_support;
>> +	/* ssif bmc spinlock */
>> +	spinlock_t		lock;
>> +	wait_queue_head_t	wait_queue;
>> +	u8			running;
>> +	enum ssif_state		state;
>> +	/* Timeout waiting for response */
>> +	struct timer_list	response_timer;
>> +	bool                    response_timer_inited;
>> +	/* Flag to identify a Multi-part Read Transaction */
>> +	bool			is_singlepart_read;
>> +	u8			nbytes_processed;
>> +	u8			remain_len;
>> +	u8			recv_len;
>> +	/* Block Number of a Multi-part Read Transaction */
>> +	u8			block_num;
>> +	bool			request_available;
>> +	bool			response_in_progress;
>> +	bool			busy;
>> +	bool			aborting;
>> +	/* Buffer for SSIF Transaction part*/
>> +	struct ssif_part_buffer	part_buf;
>> +	struct ssif_msg		response;
>> +	struct ssif_msg		request;
>> +};
>> +
>> +static inline struct ssif_bmc_ctx *to_ssif_bmc(struct file *file)
>> +{
>> +	return container_of(file->private_data, struct ssif_bmc_ctx, miscdev);
>> +}
>> +#endif /* __SSIF_BMC_H__ */
>> -- 
>> 2.35.1
>>
>>

