Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C40D444FA9
	for <lists+openbmc@lfdr.de>; Thu,  4 Nov 2021 08:26:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlFYT0C7kz2yK6
	for <lists+openbmc@lfdr.de>; Thu,  4 Nov 2021 18:26:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=C/OeyaoU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.244.123;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=C/OeyaoU; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2123.outbound.protection.outlook.com [40.107.244.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlFXx5LVBz2xY9
 for <openbmc@lists.ozlabs.org>; Thu,  4 Nov 2021 18:25:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gxNsWM9oJUof8zlgAAy8FGM4xzbQZbD9M073s1NOBGSFAAwL7+sOQrVCtXqWXTzxiqNe5nQox9PeKcPw06PjJaWNUUCg8GNYpKZUbZeU3/aFgqr0/EDly928pipn3EiD8q25IKizv10mliaZq86YpScHujOLh0/I8WxXbCc2Oozudy3ZL1cVC9Q8fQ2EmOJvdbqEBOisg7Bm5p5zFYyPa9rECNicscVYGuVQjvPpell5SyrNzNBnaD7anO6uolrBYiiaxh4N5lCv9P7l7meBnPf2bKdf0lvBbL+TTDwcHmN4S6P0paeMsZVbMo8pP8QxdUAWt8954LJKg1BI1WTc3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tc//ZWYmcV6/UaTZtEzLQRS+oYcmtQvbP7XQnj3c7xo=;
 b=FkuzitBpiHdncA2gSskguvrPh1Y4FQcKI/eaHE1eARPTf/8TH9xz56wKxmM2FoHYfWNB5LQNDRs0Pgsfmg5WJXV7hrkciOhED733mV6Cqt5BNRYXbHSMc7tzPrc/APW++ipILurkc2oeXriwFYFGX8nCKY4HypNL6m97aFW5JOMQUGTzTL4G6pb5s+U9udJbB2OrKXhB99rhhnaF1pBEi3xUTHXmrbs45tM6lWXHNQXealmz4LXcxuFgLBpffBaRbfOlgoRhahK24Kl+YqvS1BIoKJIJhJIA5a5T5+0wSHZvDzPAkQgup0W/V1ClkcAngqT/ZHgbe98UCrqVSNXzbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tc//ZWYmcV6/UaTZtEzLQRS+oYcmtQvbP7XQnj3c7xo=;
 b=C/OeyaoUTBMKybAQ3LB4JHvkwWwA8BHSxwhbjG2nKwz6QAUoBcxvRBZmvIVfBcapMdNikY4ZwmqSCTBfMN1SYKKK3ZCPpNTDkmUyf5IUcyzhHlYHrvkzWswgzuyqJUjQUEy7q3lng9agpFmDRfY8hdxwZFR3fDhk1E/D1WPNfgA=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from SJ0PR01MB7238.prod.exchangelabs.com (2603:10b6:a03:3f7::22) by
 BYAPR01MB3943.prod.exchangelabs.com (2603:10b6:a02:82::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10; Thu, 4 Nov 2021 07:25:16 +0000
Received: from SJ0PR01MB7238.prod.exchangelabs.com
 ([fe80::1d89:1ea0:77b9:2328]) by SJ0PR01MB7238.prod.exchangelabs.com
 ([fe80::1d89:1ea0:77b9:2328%9]) with mapi id 15.20.4649.017; Thu, 4 Nov 2021
 07:25:15 +0000
Message-ID: <696d0f43-c665-d79d-f493-60843e239da4@amperemail.onmicrosoft.com>
Date: Thu, 4 Nov 2021 14:25:05 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: Cherry-picking 5.16 commits into OpenBMC Linux?
Content-Language: en-US
To: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
References: <CABoTLcQHOcfvHkCGX0nMUxFzmTcceuBhL3CQERn66CT8UsSvwQ@mail.gmail.com>
 <CACPK8XcRfTkZynhnmYn0ySq82MjJQZwgy_4UjKpcxYgF5cG7xw@mail.gmail.com>
From: Thang Nguyen <thang@amperemail.onmicrosoft.com>
In-Reply-To: <CACPK8XcRfTkZynhnmYn0ySq82MjJQZwgy_4UjKpcxYgF5cG7xw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGAP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::32)
 To SJ0PR01MB7238.prod.exchangelabs.com
 (2603:10b6:a03:3f7::22)
MIME-Version: 1.0
Received: from [192.168.86.197] (1.52.235.153) by
 SGAP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Thu, 4 Nov 2021 07:25:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36952c66-1cb9-4aff-207b-08d99f643f23
X-MS-TrafficTypeDiagnostic: BYAPR01MB3943:
X-Microsoft-Antispam-PRVS: <BYAPR01MB39430836CA5FBCE8375DF7AB8D8D9@BYAPR01MB3943.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NzG+UsO+dHHGJzuQkky/n4ABZk/mWx0TxHe2R35wlHRgtKaoX0gIBSmOSJp4kxcNBQ/AUpMycZCP0U5TiwmwFpDFgh0eyGZA/+YyioaKEXoidh8tWxCSTEzn8QDeAfVGHhGhRycIbFFWW+t9lIQzMecAYv9NVqHSrnMChUVc3HpFqQoBx4gYsJbQGb4Suo07nTEkKkX5ei6Rq2AZK0IT1LNcDZkEJPkerMTKMzmmADuT+R6BFivFMQbB/FicGNqypzZZPvUML1HME3gNxaMDrkc7FOBb9PKqeHNem9WI8iIWXlskdVVfoYiz0BBkgQiY0nL9M28XW7kk1GknCasOC67SkyCErAZDWmd3YO1Jcppnv6hneT4P18kk3Rg69zuwj7gneC3tHSpuZmi/rPTglvtlGkJSkOLO2t2zGDwVhgFxal8pCRmkRDzFRyWWKMCQX3aBLoRkjGfxBSc/DCyouhco/K4NLA8sL6s/k3w9c8i2Pij2TOJkw7vObPTAApVy1RkD4CPfJhIHMWcC6ZT/DxsZE8H3Uzgkzq1GGqyo+Nbyvh7oAOb5QdJqmmMQm9mQ46CE9anYGN0Op297gKHFCwi+r1F43+UD9BpZ4CqEcvvDxLBrjhAhMC21wfcUpTloTYDhfPQ6b1gFnEcwHqcpdPqFBPZOEfcKghoVgSiYzgBIeRbLwyQooRudyk9TIYQOEAOzKLhZsxN4cvpY1CXSudveYJ6qJv1fXH8le6RMhjybEbw+R+SXfwqcc7CqcnbgoFBrJ+nWqcZCVjl4P68iIQqqPdoIsaom5qEn0cUKsEtPtD9qHv6Ii+igmpn/kxa77x321IuGn7ms0K20o4Wkng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7238.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(26005)(31696002)(38350700002)(66946007)(6666004)(83380400001)(53546011)(66476007)(83170400001)(6486002)(5660300002)(966005)(186003)(8676002)(2906002)(508600001)(31686004)(6916009)(42882007)(66556008)(316002)(8936002)(52116002)(2616005)(16576012)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VW1DQkppLzhGRWYzMERsbjNuZWhDVnBmQWpKNzRmQnFlYlkvTy9zOVJCb3c4?=
 =?utf-8?B?TW9xWDNUcHA5azM5QVlnMG5zTDEvRFlhN2NoaC9mWU5UUEhFdW1zR2lGY0M2?=
 =?utf-8?B?MDhIQjFmM210ZllKRWgzdmpob1FTTjBYWHd0UnNhbmYybFVva0wzSy96WTFt?=
 =?utf-8?B?STFISG03aXNLMksraHNJUWJzTVBpWCt0dm0vY1hRSDR6dkJjRzEzNHZrWlM0?=
 =?utf-8?B?cFlmWVJxRGl4TlBUZUtzaE1hNGtIYXkzOG9OeWxubGdGbWwxRGpGOFBQQzFp?=
 =?utf-8?B?WmR6bDZQTE9TYndIV3g3R3YrZnRSOXJSQ2J0Q2k5ODNBWlE3OXF4MHdkeU1o?=
 =?utf-8?B?cFE2cjRzZE03Sk5Zb2pzUlRYUDgzbVpyUmdQSmpzQVEyNGREZ2duQTNzK0la?=
 =?utf-8?B?Y0h2V0xjQUlEcUVrMUt1UDdickE0Q2krU2hTaDhRaVp5QmgrNkJpampHMFo5?=
 =?utf-8?B?TTRSOEVrbkxhY245aWlTYnVBaDB6T2NBRjZucEFDUHJtV3h3UGYyY1JRbTg2?=
 =?utf-8?B?N3hJYnpvMndYbENPY2M2ZVNpTHdTU0gyamxpR002WHpCd2poVmU4SU9iZlhh?=
 =?utf-8?B?Wmt0QnFQdXFXVXVRbmc5OTZqTmJmUlh0YTZKSERjYklBOE4zSXNualI4V3Yz?=
 =?utf-8?B?RzM5UjhyNGVOOTBNRkxieldpeitjd0lFRUpHdG5OWG1udTF2TW1XUFYwQ3ND?=
 =?utf-8?B?VFl4UUs5MG9EdmJCcnM1cFNPVXkwUFFwL1hsU1ZWNmdKN0JIRUtxYzdENmN5?=
 =?utf-8?B?bjQya3Blay9XeHlnbE9yakRVeldJNjdLbzkvSHVZTmFmSGlwa2RxVXYvd3Az?=
 =?utf-8?B?WlZocEM1NURlR3dFcFUzOExJZDFiR0E4cUFDVkE3OWpkQmY0eWFrZk1jQ29R?=
 =?utf-8?B?NGt5bEFQZ2lCZnY3OUdDZU5Qb296SHhIKzQyejBWYmE5TEdZNlNSUGh0b3VY?=
 =?utf-8?B?RnNPT0ZDWHhGQVNTcjZrUThKRG1QdkxjdzVIYUU3bHhNRm5nU2M0cWh0TVU0?=
 =?utf-8?B?cnQ1VVVia2EzTmdqazMwMXgzN3VqUWVOVm1FdTU2YWNjcUlkU0ROT1NVcDJt?=
 =?utf-8?B?R3JOQ3dIV0RHSWs1OGNVbXpFdU91U3ZYa0dCR0hoaGxyWkFWREpsZStRcHRB?=
 =?utf-8?B?UFpNc1h5Rk5ya1ZCSkcwR2RyQmNxWGxoVW1VbWRhSVlZWmwwei94dlc1bUNM?=
 =?utf-8?B?cWN3UFpodGl4SXF4c25TUFpqbWl3OFY4S1ZnQzFkRUJRUUlLekpDVU9DNEg4?=
 =?utf-8?B?eTNuN0s4KzlUMUpkN1loSW5xQk5hLzlvd2lJSUtzeWxMMlFUWHNyOUpTV2VP?=
 =?utf-8?B?VDdSaDJIMnl5TWdmM3IzdDQ2SjZrTnhqWUdxRWFRTURjeWQ1LytxdHFicXMw?=
 =?utf-8?B?dXFBNGZJK1lwYnRZSVpoZkVSQlYzSGhad1pKRlRzZ090Q3VLMHVrbTdJTzJ5?=
 =?utf-8?B?NnRxREZ5Ry9WeVpQaXZPR003d3V2YXhLaXBnUkI1dVdCSi9TTHREc2EySnlI?=
 =?utf-8?B?OWJrMEhkdWpJWld2YmRjNm9OME1uVjV5MUZDWkttY2JXbG9ZdzZKZ0hYdGdD?=
 =?utf-8?B?TFZNc2VaKzlJRlFoYm1zUmJNeWlwdGRkS2tXemJMN3h6dGwycUJpbHNsakox?=
 =?utf-8?B?QVIvOWpXcU94Y1YveDRuUW02dUtja1NwUUNIU2hHLzIydTJaYkpGUE9jcEFK?=
 =?utf-8?B?czE3a1l0dWltOEF5ZmFpMWVTeXFwQXp5aEFKTjQ0cUF6T0FSeU14aHJZTXF6?=
 =?utf-8?B?bFFvSnYweGlFVWN3UmdVY0JqMlY5UG5BekMraWtVL2pCQ0k3YVFVMVZMMjdI?=
 =?utf-8?B?a2crV2poSUFzcWcrQVgzY25JSXRuRUZVUllJSHFucm5XaUwvRlNaaVJtY0FV?=
 =?utf-8?B?ajNzZ2NmODRDT2NwRGlnVHR2UlhnWDZSN3NIcnAvNjI2d2hZMG1zc1dIbDNV?=
 =?utf-8?B?NXZCWCs1UW8wMlp5cFBiVFpyVWxnU1k5U0VyRzA1Tm5HR21VWStJTk1PZHln?=
 =?utf-8?B?QjhLZkRKK1hscVBmaVZsOVhlMGNBTFJ2SnhSdE90T1M2OXBPMVhHbDB4UVpG?=
 =?utf-8?B?a2hRd1hLSituRWhNdmNYZDlHdVpRd2JTRjZmZExlREd3UFFjVXNzRENRYWp0?=
 =?utf-8?B?NFRRaVp6OG91MFc4NXdHRXZ6RWNCR2FqZFpjcWhXNlVWbDJkRlpXMW0zcFhw?=
 =?utf-8?B?ZDlqaVJXL2JIOWFTYzJLaTBaNTdUa2taeVk0TnFlUUpxNFdRckNLZzA1Nk1J?=
 =?utf-8?B?ZXdEV2pKWjZJMG52K29xS1BrYnhEL3dUY0Q5bjFlMjRJT2N3MXdJT3ptYzB4?=
 =?utf-8?B?NEE2Q0NWalZWVnQyb2NJRlFBWmhKei9jMTBCYnVwMytXSUpORnpIUT09?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36952c66-1cb9-4aff-207b-08d99f643f23
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7238.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 07:25:15.5334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dpAkdpb4OhJz76EbCCrrghBjbQ4ExKS2ENhTlhIAhB5kfarDKzObYshUR0NHrkOOFndcqiOZy/mxrH8S/fd9/0vIo4rmD1P/NOdQ3xIvXKA4zIFM02FS5j5dZGDlJnFl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB3943
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

Hi Joel,
We have some commits for Mt.Jade device tree that have your Reviewed-by:
https://www.spinics.net/lists/kernel/msg4115571.html
https://www.spinics.net/lists/kernel/msg4115572.html
And another commit applied at 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20211029&id=0b32c1b4071c482f2cf98b717cfc7380423ec619.
Would it be possible to apply into OpenBMC kernel 5.15 tree? I need 
these commits to replace some u-boot patches in meta-ampere.

Thanks,
Thang Q. Nguyen

On 04/11/2021 06:22, Joel Stanley wrote:
> On Wed, 3 Nov 2021 at 16:29, Oskar Senft <osk@google.com> wrote:
>>
>> Hi Joel
>>
>> There are a few commit that I sent upstream that have been accepted by
>> the maintainers (i.e. have the appropriate "Reviewed-by" tags) that
>> are waiting for 5.16 to open.
>>
>> I'm waiting for these patches to be available to be able to send a new
>> meta-tyan directory to OpenBMC for review.
>>
>> Would it be possible to cherry-pick these commits into the OpenBMC
>> Linux tree to speed up this process? Or is this something you
>> generally prefer to not do?
> 
> Yes, this is exactly what the tree is for.
> 
>> Specific patches:
>> https://lore.kernel.org/lkml/20211020164213.174597-1-osk@google.com/t/#m8f7ac85809049fadcabf6e0bed1ebab12e71f094
> 
> I've applied this one.
> 
>> https://lore.kernel.org/linux-arm-kernel/20210909004920.1634322-1-osk@google.com/
> 
> If you take a look at the dev-5.15 branch, you can see that this one
> is already applied.
> 
>> There will also be an update to the DTS from the second patch once the
>> driver change from the first patch has fully landed. Or should I
>> better send that DTS change now and we'll take it into OpenBMC Linux
>> together?
> 
> Send the dts change to the upstream lists. I'll review and put it
> straight in the openbmc tree.
> 
> In general I encourage developers to send patches straight to the
> upstream lists, and once they've had a review there send me a note to
> backport them and I will do that as soon as possible.
> 
> Cheers,
> 
> Joel
> 
