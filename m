Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FFE6C5AFF
	for <lists+openbmc@lfdr.de>; Thu, 23 Mar 2023 01:08:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Phlzw0333z3cj9
	for <lists+openbmc@lfdr.de>; Thu, 23 Mar 2023 11:08:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=NHhhXuIz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:fe59::60b; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=supreeth.venkatesh@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=NHhhXuIz;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhlzC3zTXz3cBk
	for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2023 11:07:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ep9aCt5AFcQ25ZI1jyZrTv7B8T1GJVeDzU1nH1c74MRcLZIte6pkpVI+8VdJw8CwRQq6/hXLfhGYQ+yRqQuqwd4tPGdQFCrAsLYWw8yhTUU0wYeQzX8x0ml9htwHbAwti2topDW7Hy270FvOPR+mE6/Neyaqs6vqrSzHvctJ/UYuys/8Gu1NCWLB1JAiSbFUYriokjT7y40jhcXjcbN7pUINkpPZ/AmU6NyZPNTshNu71J+MVw+AeZWJUV5K+tXJAMBS59JvfVoxPNQI7KyIa0EMt6QKijm1ulR/5+Ptmt+CSQBjd3k0EyPoD3ehOA/lCrIwtB5sR94HWfvyaCG4hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4xnyaECsXPoLn1uZ2f7TviJQm2K63xvwVSvrmEys/w=;
 b=WrCi2cgvaxjwVjSHkmM/HKnIreij0IqIIBtGnXzZjOQuuH5cqsY4vbJfL4znSlt12rqMDchjiPbAKAmIbVBhDdWDY80zO9lJBPCtOLm3GzzKVlg2XY+4pl+TBU6Io28m9ZfJfNKkb7oFJ9GWUx54u+DIBxYEf+9Fdb4l+waZXnP3W1iZzxskQ67Rxc5omkjhp8OtHxpgqYYR0raaiVJfYmHq4QGIdjnBxPWXG1VMp8yZrJ74uF4+zs5yj6wxwM8/oLzDEJLPDADxkVeNUXmUwdT2blLMisR6Z+dhQTom4/EiBcKXpQKHOi2LF5AfnZGX6ZCqrU9CUO4UwEWV8gw9tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4xnyaECsXPoLn1uZ2f7TviJQm2K63xvwVSvrmEys/w=;
 b=NHhhXuIzWv7zkbrAFZnOIrgDTw9RNh3eC5MPU7MNEdIyqEBBkhDRGX08nZxwEJAMmL9tw7qZjXcqtqDoeKeuh/0q9+TdmPyinhMS7mqAvhyqxBkdqgKQanF/kDjjlSJ8MreoVjoKRiwRs9fpbTxiPAAkeoLccj43Fm+Uw8vYfkQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4752.namprd12.prod.outlook.com (2603:10b6:805:e9::10)
 by MN2PR12MB4335.namprd12.prod.outlook.com (2603:10b6:208:1d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Thu, 23 Mar
 2023 00:07:27 +0000
Received: from SN6PR12MB4752.namprd12.prod.outlook.com
 ([fe80::8465:3c53:e5fd:9028]) by SN6PR12MB4752.namprd12.prod.outlook.com
 ([fe80::8465:3c53:e5fd:9028%4]) with mapi id 15.20.6178.037; Thu, 23 Mar 2023
 00:07:27 +0000
Message-ID: <d9f7b650-2e8b-7bd0-2125-035531ce549c@amd.com>
Date: Wed, 22 Mar 2023 19:07:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC] BMC RAS Feature
Content-Language: en-US
To: Lei Yu <yulei.sh@bytedance.com>
References: <07621845-19a4-0568-be0e-f556ba40b813@amd.com>
 <ZBmJpxTnEVVpfsz2@heinlein.taila677.ts.net>
 <255d7c9a-ce17-bbe1-7312-990d0221cf36@amd.com>
 <CAK7WosjjdVwNqSwkY2mxYhgAeKdwigtyLryTfJ9r6ShjfbRuCA@mail.gmail.com>
 <65515592-8f77-1c8f-731c-165fb833344b@amd.com>
 <CAGm54UG+S7gFkCaKJm_7PxOCDu0haZ4FWUxj716JBGVY-gaTFw@mail.gmail.com>
From: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
In-Reply-To: <CAGm54UG+S7gFkCaKJm_7PxOCDu0haZ4FWUxj716JBGVY-gaTFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR07CA0056.namprd07.prod.outlook.com
 (2603:10b6:610:5b::30) To SN6PR12MB4752.namprd12.prod.outlook.com
 (2603:10b6:805:e9::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB4752:EE_|MN2PR12MB4335:EE_
X-MS-Office365-Filtering-Correlation-Id: 8313ae3e-a5f7-451c-2461-08db2b329645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	rIPXNI+SPZ8A4jdO9YX+q1Ld8nv06dcS1iC47saIYkl6Jv8aAq0Sy2PQn6MBYQQR2B0JUGudPfXSUSepNh13AE11SDcWXn5DnPlaD9UQAQIupwj4pkcK1KkuQAvb5tMSqKUfzSsZ7F5ieQyR1IlhDORgTfHORxrVwl2fU6/A6nF3E2eTa2F1MbVLOkHrjyBa2zviwdabp5fDARsD6FPVzAAxMBsbEWaxVwOSnx6xSE3y0pZIFXWbsYBl8Vkqjpwd+JlkcZp7BEvC5TaIThalt8XdlKMkcpFTVtaFr6Xcms+jXO75IRrESBjCF70BmMvFksm6K0/+Y79j4uBBlnZo3d+AJ5i9lAlwbIG2Gpid78F0IOIKUK/Q+hpMgBwkeNsW90j7TMdtVkLoWv+fDdNMmPUswqFB5BNu/BZ0bHUeBQysCDxMtk8UGBFEosX/brRWQaE+Gwys7xv07Hsf11+EcZ7jYJgo4GVVBJKFSx60Ty4f4WMnyfvaXo7JKGrN8dbwlpPFQQMFz/MOgYKknToQva4xyyLJqAZPYI1SXvJcJBfY07eWvq/8C9f+pNMpHn2ZlQNxER/MJN4OzJ6QcfhPbJxpbWplUKiucwjyGLikEzIwcyCL8U49GPflWvC7WQFHZpcAR9EH7JLYVYh1oURId/beKrL6u1Mo5aX4+EoIdP+A61OoDh2jHZgXUohFec7x/ybywkNmC2TyEuWXXfEBTCaWHmZPZovb7Z7bDC0TswAiKh06U9Gv9hScoqMmEuHPj7l0OTd1vyYdXyRn7Hgkxg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB4752.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(376002)(396003)(366004)(346002)(451199018)(31696002)(316002)(36756003)(54906003)(44832011)(4326008)(8676002)(6916009)(8936002)(66946007)(5660300002)(41300700001)(66476007)(66556008)(86362001)(2906002)(478600001)(83380400001)(31686004)(6666004)(53546011)(186003)(2616005)(26005)(6506007)(6512007)(38100700002)(6486002)(966005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?NEJsaTNaNW95Ums3aDBJUFJzNStVa1BvUXJQclhtVjFYa2hYMG9MeURYUVZ6?=
 =?utf-8?B?R1l4U3c0bm81c0ZQM3Noc3N3d1VyRGNscXphQXVubUtFZDhCbDZnRGhWQitV?=
 =?utf-8?B?T1lEY3RyckszZlppWS9IZ3F0Ulc3TkRKVThPY1NGa1R3b3JNMWhJZkxTUVVH?=
 =?utf-8?B?UVR1SlZTR09SWUhIQzhOc3ArWjN5ZVlycjcrRTgwckdsWFZCaFlvY25qak8x?=
 =?utf-8?B?ek1LS2VUbnp4dmpZYkdpVzVScUpXN0JOaHdLZnRJZnkyUkpSQTVERWI1MGNJ?=
 =?utf-8?B?VkhoNmZNVHZaUk1CK3FpZlBmV3hxZS9lQ0ZoaHVsRE4rRDU2Vkw4QkVXSEJJ?=
 =?utf-8?B?blR0ekJwbi9MMVRmWVFOUks4YW94R2RxZHMwZms2MGJUNHZrRS95bGw4MlJs?=
 =?utf-8?B?bUk5NExzNC9USDlNRUZlK29wYVBnbDdab3NuZ2lReTFKUGoyU0VGelo0S2pD?=
 =?utf-8?B?SFZZVWlxcnl1WkxFMXQ2d1hVQVRYTG5EZVJPVnp0cEwvYnhPZHhnWmlmUHRT?=
 =?utf-8?B?MWVIWTJjemtYemRCN1NkWnJFdFFTNldnaWJ4MUo5eDJiZmZXYmlUSEtld01W?=
 =?utf-8?B?U0NlVGpTMkNDcm1UbHRWKzU4QXJjYVo4cUlCenRKUG9oV0JYelh3ei9OYXFv?=
 =?utf-8?B?bmhEUHhLaFJpSXdObCtFajFBZTlzeVVDT1B3SEZobThIQWZrMGNkWDZmcmw3?=
 =?utf-8?B?WkVtVjdmT1IrM0pJWHYwTjNYRjl1UC9TNTY4NWg4dEt5TmpJSTUzaUNKbEpE?=
 =?utf-8?B?QkdKUDBVUDRpM09LYU5Fam1Oa2RVWThXUzJFQUJqV3E5RWJKWGU1L3pkWHdX?=
 =?utf-8?B?ZXhOb3VGMnVWMWVaWEFYekZjREh5U0pVa09jTnJiSkJBMDdEY2EydWh5NFVV?=
 =?utf-8?B?VFdDd2p1Q3RYSXdUb0xSbjZMSnc5OU02VXhsNERyN3BoaGJ5SVpjOE5mVmJW?=
 =?utf-8?B?SGZWL3EwcXRtOFpYczh4UHFpeUZYYWlKVWlwN1p6ejNYUXA2Vk1JK3EwY0d6?=
 =?utf-8?B?TzVhZDEzRHVmS0FmR1dSbjhXSmV5NlFWWWR3d1NBSVd6STV3V3BwNzNnNEg2?=
 =?utf-8?B?d2pSSkFTdHYrbVBMa21nMEpSaEFaaW82N1ZuMkg0ai8zUTFFWVV6QUs2VjNm?=
 =?utf-8?B?NXpsWDFmTWhQMm9oUENTaEExWG5kdFZQVTJVc3BadTN3bCtaOXI2VTlrcEVG?=
 =?utf-8?B?SmJNM2FvNENHekRCWjNUMkFkY1RPRkk5YkJucTk4UWlFY1gwZ1pFR2pweVpT?=
 =?utf-8?B?YUN2cHo3ZWxIOEJsQ2ZYdTVHSGNWV3NLV1gvZE1PQjNkQTVMdGxEWEZKUjJJ?=
 =?utf-8?B?N25LSFB6eXJ0RStwOFBEUXNnelhuSFFEUktrUGdQVDB5b2RXbGRFanQzVVFJ?=
 =?utf-8?B?aG9CVExMNW1maVp4TDdWbGkya3MzOHNQVnRiUGNGZk01S1lLMkdKZ0wxa1pE?=
 =?utf-8?B?dHMwQW1rVjhlRDB2NWpSR0lQaU1vbUxOVUhrM3NBNHBlQndURG51RTBhWUFE?=
 =?utf-8?B?djRkRm9uRk5zRW1QWHFkWkhFbllRVytheHQ4UE44dlR3VnJQcjFwQXI4YWNa?=
 =?utf-8?B?Mk9lb1FZYkpGc2FBRUdtcUp4L2VvSkFDK2Evd2lIY2Q4UHB2OERvVDU0VHNx?=
 =?utf-8?B?Tml3bFVKZUtDNDVkWTZ3a0wzMDU1SjM1Wm13NUZSUU1XQ3U5Ti9CZ2tZOVpi?=
 =?utf-8?B?TjdZTktrdzVuaUxzL3RodUw0WU5waTZybWZ3ZWdMYVlMdVBoT29tTS9Gc2Nn?=
 =?utf-8?B?Tk1TN3pPOC9kaVZEK2w1MXlLOW1sQVpkSXA3WnJWeEZQVnF4L1hFLzlvZU9q?=
 =?utf-8?B?OXAvbWxTUllERjFGUHNxVFZVZHhrZWJpM1YrNmRRTW1Oa0loYnJDc0xPR042?=
 =?utf-8?B?MXBFVmNGOEZTc3ZlVm9QRlVJY3k2QnVQQUsyS1A1VnZPZjUyVVdOYlR5ZUJO?=
 =?utf-8?B?aU9SR1dBcEZlaHQ1OWpINXhUdmlTT3JlaXlWcnQ3SVVVcnRnR09UWkQzYjFq?=
 =?utf-8?B?NC8wQlB1YUJ2VkhYS1p2UnZ5OXdsYzR3enYzZ3g1dnFSSmp3MEY0UGRvUzJv?=
 =?utf-8?B?SHR6bEU4ZFpJa3poZWd1YzJuNjd0UnNGR2FyWk50N2NrV0lqZ3c2ZFlpR0ZM?=
 =?utf-8?Q?CL38xrCU1a/yFFqbuQ2Lcxvug?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8313ae3e-a5f7-451c-2461-08db2b329645
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4752.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 00:07:27.4092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJcuhTjFUZbJ5okSum5aQgAEhTnNcGmv/vPQMO8K3VyGL47ZvFaB+9u2FGn8K/XJwFZPCp/KPI0NV12whePoLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4335
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
Cc: Ed Tanous <ed@tanous.net>, Michael Shen <gpgpgp@google.com>, openbmc <openbmc@lists.ozlabs.org>, dhruvaraj S <dhruvaraj@gmail.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>, Abinaya.Dhandapani@amd.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 3/22/23 02:10, Lei Yu wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
>>> On Tue, 21 Mar 2023 at 20:38, Supreeth Venkatesh
>>> <supreeth.venkatesh@amd.com> wrote:
>>>
>>>
>>>      On 3/21/23 05:40, Patrick Williams wrote:
>>>      > On Tue, Mar 21, 2023 at 12:14:45AM -0500, Supreeth Venkatesh wrote:
>>>      >
>>>      >> #### Alternatives Considered
>>>      >>
>>>      >> In-band mechanisms using System Management Mode (SMM) exists.
>>>      >>
>>>      >> However, out of band method to gather RAS data is processor
>>>      specific.
>>>      >>
>>>      > How does this compare with existing implementations in
>>>      > phosphor-debug-collector.
>>>      Thanks for your feedback. See below.
>>>      > I believe there was some attempt to extend
>>>      > P-D-C previously to handle Intel's crashdump behavior.
>>>      Intel's crashdump interface uses com.intel.crashdump.
>>>      We have implemented com.amd.crashdump based on that reference.
>>>      However,
>>>      can this be made generic?
>>>
>>>      PoC below:
>>>
>>>      busctl tree com.amd.crashdump
>>>
>>>      └─/com
>>>         └─/com/amd
>>>           └─/com/amd/crashdump
>>>             ├─/com/amd/crashdump/0
>>>             ├─/com/amd/crashdump/1
>>>             ├─/com/amd/crashdump/2
>>>             ├─/com/amd/crashdump/3
>>>             ├─/com/amd/crashdump/4
>>>             ├─/com/amd/crashdump/5
>>>             ├─/com/amd/crashdump/6
>>>             ├─/com/amd/crashdump/7
>>>             ├─/com/amd/crashdump/8
>>>             └─/com/amd/crashdump/9
>>>
>>>      > The repository
>>>      > currently handles IBM's processors, I think, or maybe that is
>>>      covered by
>>>      > openpower-debug-collector.
>>>      >
>>>      > In any case, I think you should look at the existing D-Bus
>>>      interfaces
>>>      > (and associated Redfish implementation) of these repositories and
>>>      > determine if you can use those approaches (or document why now).
>>>      I could not find an existing D-Bus interface for RAS in
>>>      xyz/openbmc_project/.
>>>      It would be helpful if you could point me to it.
>>>
>>>
>>> There is an interface for the dumps generated from the host, which can
>>> be used for these kinds of dumps
>>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/openbmc_project/Dump/Entry/System.interface.yaml
>>>
>>> The fault log also provides similar dumps
>>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/openbmc_project/Dump/Entry/FaultLog.interface.yaml
>>>
>> ThanksDdhruvraj. The interface looks useful for the purpose. However,
>> the current BMCWEB implementation references
>> https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/log_services.hpp
>> [com.intel.crashdump]
>> constexpr char const* crashdumpPath = "/com/intel/crashdump";
>>
>> constexpr char const* crashdumpInterface = "com.intel.crashdump";
>> constexpr char const* crashdumpObject = "com.intel.crashdump";
>>
>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/openbmc_project/Dump/Entry/System.interface.yaml
>> or
>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/openbmc_project/Dump/Entry/FaultLog.interface.yaml
>> is it exercised in Redfish logservices?
> In our practice, a plugin `tools/dreport.d/plugins.d/acddump` is added
> to copy the crashdump json file to the dump tarball.
> The crashdump tool (Intel or AMD) could trigger a dump after the
> crashdump is completed, and then we could get a dump entry containing
> the crashdump.
Thanks Lei Yu for your input. We are using Redfish to retrieve the CPER 
binary file which can then be passed through a plugin/script for 
detailed analysis.
In any case irrespective of whichever Dbus interface we use, we need a 
repository which will gather data from AMD processor via APML as per AMD 
design.
APML Spec: https://www.amd.com/system/files/TechDocs/57019-A0-PUB_3.00.zip
Can someone please help create bmc-ras or amd-debug-collector repository 
as there are instances of openpower-debug-collector repository used for 
Open Power systems?
>
>
> --
> BRs,
> Lei YU
