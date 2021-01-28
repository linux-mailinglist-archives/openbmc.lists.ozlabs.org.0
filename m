Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D7D307E52
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 19:45:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRTtP3kLfzDrgJ
	for <lists+openbmc@lfdr.de>; Fri, 29 Jan 2021 05:45:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=amd.com
 (client-ip=40.107.244.66; helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=supreeth.venkatesh@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=KbPefK/P; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRTGp4hmVzDrdm
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2021 05:17:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XG89E85uv09CLbmdNOKJvP8hzlIV1qjdjknNqd3NSyaaq+i6HFQNxejew5kIicNIjvWz9WZjrCR5h0HFgTPtYI7v1CLIASbztWee4kFYeEddefyMAyI94KPxIVtVa+iXvktBj74ShNfCqpatL6ZWE1nunnpuRTVD8pKxFh4ATiNL+dLFtYR4yQtwv3OnZaRpuqi8duhuO5UkY00TqbQ/Bq69xf8S1BKWeoCwDB0JhRz94NDJAjclZKiJ0ka76FJTIJSsUXOtcr5tS9TqvTswAeVJUN326upNyg63uw5MYUnuDRHtZyuAdB/G1bCqVI2VJB5o48xt1eYu2Dx2rF20Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1LYIU2okY8WTtyjr4SEZcw2IV+vENRP6K6OGqrSMgUk=;
 b=EmcVqW1BF7YR1ZMpTTv82eM14HV9GMuj8KCuFhLJyVbs+WOF7eMewfWX0wVOo9yhTWXUyNTfIOU8xQ4sMKXR/olO28ZwLsWFFennWmmSMYuU3j9p6rWfO2mA8swALW2KZUzGjqs/fc4mhs4Z9jMW99jXeCa/sWR0zE/Qlt4g9pMfSkX6EB3yzT+LkiI4a67pFP+XKHBKfy2RbWSwtqhar1oJLX/oXfCV+Z1KFV8ZB4Z9Aqniz8geSCDnRrXdRb5odYk/YHVD/AR8iRj1WoklX8fFelN2IoK3H39aKFYvhCKtnq8jdBbCoGmtqAd0cYAM3T1f3ucURNIk/rC0tRIUxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1LYIU2okY8WTtyjr4SEZcw2IV+vENRP6K6OGqrSMgUk=;
 b=KbPefK/PWokuQUyjhOpMzTgknIo+vvpPG4b6S+XI4Vig3g6kaP0w1q7/8YpnMCA2QYGIFGYV8Uh7t78C3JjJ4OwMMXis5P/EKgw3DH5iio14h7DDx/K0W4sshwYBmITNhOXpMezc8l8VVm92aDz7UUMFC8BinXiOg3Ud2xOtGKU=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2542.namprd12.prod.outlook.com (2603:10b6:802:26::28)
 by SN1PR12MB2368.namprd12.prod.outlook.com (2603:10b6:802:32::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Thu, 28 Jan
 2021 18:17:45 +0000
Received: from SN1PR12MB2542.namprd12.prod.outlook.com
 ([fe80::d877:4772:5272:33a4]) by SN1PR12MB2542.namprd12.prod.outlook.com
 ([fe80::d877:4772:5272:33a4%5]) with mapi id 15.20.3784.017; Thu, 28 Jan 2021
 18:17:45 +0000
Subject: Re: Progress Codes in BMC
To: Benjamin Fair <benjaminfair@google.com>
References: <4795347F-477D-45EF-A145-0C7B163FE01B@getmailspring.com>
 <CAM=TmwXEmFc95mBEg4G8bUNoBq7qDL9i_vv=YtomRDrVPDYBEw@mail.gmail.com>
 <7821f27b-31d5-a9d9-a6e6-d709e5456af5@amd.com>
 <CADKL2t4EgE3bcnLU9NOP6fL71ifqzVOLH3U9T6ncfUJJKVzK9Q@mail.gmail.com>
From: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
Message-ID: <407d669d-a60f-7052-23d7-ce3b884e833a@amd.com>
Date: Thu, 28 Jan 2021 12:17:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CADKL2t4EgE3bcnLU9NOP6fL71ifqzVOLH3U9T6ncfUJJKVzK9Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: SA0PR11CA0066.namprd11.prod.outlook.com
 (2603:10b6:806:d2::11) To SN1PR12MB2542.namprd12.prod.outlook.com
 (2603:10b6:802:26::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.236.136.123] (165.204.77.1) by
 SA0PR11CA0066.namprd11.prod.outlook.com (2603:10b6:806:d2::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Thu, 28 Jan 2021 18:17:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e5ba263c-c7e9-4d53-058e-08d8c3b9029d
X-MS-TrafficTypeDiagnostic: SN1PR12MB2368:
X-Microsoft-Antispam-PRVS: <SN1PR12MB23689723568291F845BEF60C96BA9@SN1PR12MB2368.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jprZuiyqOjIj07L4aDE4DN18yTIhqcYkUJeu7prhCr/GTyjKdV1hdl4XxZesGHjpk4AZra/3j7ioILA0bBIAxMZdoKh7taxfrjyy2boVEUo7+oA3L6y2W1KzH0TSETCmv4MepsJWNbQOyw3N+EHlOl38fBjxxhH2mqf5tAXP1jTH1t7n2xHZH+6l3Y3IPhAmQyC/ygGWOTd1zfmmYI7S4pBDREmuOvRPWe7Vcm25Dv4cUpTEtiW03S1gXcZTcCbEyAigTCXqn9SzhvwYc41jfTrO9+JE0jejXvBXucAWcLokdKNpGktPZoQEPQfYd2jks4wUUsN1TGK2jyDXvwwC54rHIBHfGOvsmI/K0lR6dIyaQy/F2FrAEa4nKtlMdwHMn4ZsoW8dFGLvvqUjkdph+UxJjZ68yUCwjjpBVoge2hgji5tmxiu/dfoCOuEK+4QN4o899D/gAR2dVHokwdKy/yiOUyxWHHIojyeuObncLQrtRd0dHa/Bvv0csknIMCLS+HKaZ4gZcTT5+AuJMzrB/yT9bXFp0OfgEeyxxovnT0vPC6loZGIXPB7n+YeU6b/DsYKjCPYY8xiqnHiNlGvfHKQRA5TOg8ksYyurRAAKruL1Oy9x3AoxZxLEx56+W07IQkrWGdpVdVqsje0eX9SpzkQSb7xDck0D3uaB8EpIQj0KBMwc7yx/xODTd0COsHfJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2542.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(6486002)(5660300002)(8676002)(83380400001)(31696002)(4326008)(2906002)(52116002)(53546011)(66556008)(3480700007)(31686004)(966005)(956004)(6916009)(44832011)(26005)(316002)(86362001)(2616005)(16576012)(66946007)(478600001)(186003)(8936002)(16526019)(36756003)(66476007)(45080400002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZExid3I3eTJ0ZDdoRFVVSDBWOWJRQVdoT1FYN2V1eDd1MHVVKzhDSnJmWjBj?=
 =?utf-8?B?Tjd1V0hYaXZTOStEc0tVSWF4b3g1anE0TDdBWkhTQVlWb1F3L0pqWFUvMTBU?=
 =?utf-8?B?RlhreDM1bSt6ZStoTk5oWlpDVUJSTjlFbGltd2o4SnpjZ1NvSUZva05keExp?=
 =?utf-8?B?bTMzZnRaaGYvc2xlVSt0RmtHR294SUloNURoWFQxOVRPWGtRUTJNYjRmU05u?=
 =?utf-8?B?TWQ3REtsRVZlN3FaSERHaUljSkJIeVBjcTZwdHFOU1o4NkJ5Smw0Nml4cmhx?=
 =?utf-8?B?MEFMd0JCTUNwTEJ0V1lTMW9uYUtWWDlYQzFlN0lnSHpwOS90L296WU1zdXFz?=
 =?utf-8?B?SWYyU1F1TWVpL3ZMbTNFWFQ4OEUrWjRIZEVmeWN6UzlLT2JwS0VYd2luQnhW?=
 =?utf-8?B?Wm03NlFJL1U0QU90KzI3Ynh0azNlM2xGaDFEaHFqS1FQdlhzdTgrdmtQQloz?=
 =?utf-8?B?aVNhY0xyQzU0K3djVUdiWE5rWnhmUlg2SmhSRWdjMTM2QmRES2x1cmcyT1pP?=
 =?utf-8?B?WXpnc2ZyNkxpQ0Jiem10OXZyYWFqT0xIUjdNUEljTFAxdGtyTHE4QXhiTzlP?=
 =?utf-8?B?WTdkbmNuTUpjMDFHMTlCVG40aTRvblZ5Y1hXaW5oY0RsOEdITmY4M204Y1Ey?=
 =?utf-8?B?QU5rSkZMYkpZUXpZSTBDeCtzb3dKQUk4VmU1c2FieVRWQVlYMW5XMmxlR3dr?=
 =?utf-8?B?MlJXTFoyYlRQYVVrMnQyKzR3M1NGb2Nqb2lrNUZJcGE2MndSb2l2a2I4eUNG?=
 =?utf-8?B?TTRKUWxjU1lJRXQvYUc4ZGZ0R2NhTFdmUHRvWFQ1c3JFamVib3pzNm9UbmJ0?=
 =?utf-8?B?S3JOc0Z2M0xZTXBYNzA3VEpHRnBwUUVPc1Z2bTl5bk43eEpCQkN1QkhLZ0s3?=
 =?utf-8?B?VXEyUUJaOEZPZ3RwK0t2RzVzd3JXWDNFU2J6U0JwNDQvdmVzV2FkUWVOQllq?=
 =?utf-8?B?OXNaSy9zck0wdkJ0b0p5eU9BalpBN3VzTjd1K0w2RHh0QXZBMVozMlA5Yld2?=
 =?utf-8?B?eXl5Vmt4UENDcUR3R1FXVnlld2QvNUk0WHNRU2htWEVPaytxeXorOGpUcExV?=
 =?utf-8?B?RWRhdU1ldlZPNE5nckpSdURtaGsvTEVrcUd0dVFwTnFvWFlTWFZ3L1F0RzY3?=
 =?utf-8?B?UU5pN0ZZQVQrakQvenVVTzNvak90Sk5SZEp6OVIyZ3dMWTc5VEFIc2dKWWpK?=
 =?utf-8?B?RFBaT3p6QW8vK3BLM3hkTFdRdEI1MzlHbk9razFUaWpDeDVad21vck1ETUdU?=
 =?utf-8?B?NGJJYnp5dnVrS0xzZE1pc2lGcWZudTFpbWxDYkJzYWY0NlIreHR6R2ErSDN1?=
 =?utf-8?B?emEwSVBKTTk4RTBJdzVXempnK05TSmxsR2pBZUlUWmIxeUpOam1HUlVqczdI?=
 =?utf-8?B?SW4vR3BEMHN3RzNmdG1yTFBhSzZIN2YzbTlTd3U0dGdnb2NKSzRsOVlqMzVL?=
 =?utf-8?Q?67csSgYa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ba263c-c7e9-4d53-058e-08d8c3b9029d
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2542.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 18:17:45.6784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R1H3yWDedfwTK1kOQ4Udtk6VBmh0RXO91MKy7PE6BlsyE66LV9wSuFXdnqekzg9gzKuzzmYDD/7lWoZejeQh9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2368
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



On 1/28/21 12:03 PM, Benjamin Fair wrote:
> [CAUTION: External Email]
> 
> On Fri, 22 Jan 2021 at 06:19, Supreeth Venkatesh
> <supreeth.venkatesh@amd.com> wrote:
>>
>>
>>
>> On 1/22/21 6:32 AM, Deepak Kodihalli wrote:
>>> [CAUTION: External Email]
>>>
>>> Hi Manoj,
>>>
>>> On Fri, Jan 22, 2021 at 5:25 PM manoj kiran <manojkiran.eda@gmail.com> wrote:
>>>>
>>>> Hi All,
>>>>
>>>> IBM Servers has a feature called Progress codes[1]. These are generated by applications on the BMC & host to show their progress via the standard interfaces like GUI & control panel [2]. These progress codes are used during boot hangs e.t.c to provide additional detail as to how far we made it with respect to boot.
>>>>
>>>> Does the community has shared interests on this & would like to collaborate ?
>>>
>>> I am interested in this problem as well and would like to collaborate.
>> I am interested as well.
>>
>>> OpenBMC already seems to have solutions for POST codes -
>>> phosphor-host-postd, phosphor-post-code-manager and there's a
>>> Boot.Raw.Value D-Bus API. However it would be nice to have a more
>>> generic solution. I think it's hard to converge on the format of such
>>> codes (since they can originate from different layers of firmware
>>> stacks/bootloaders and some of these layers might not accommodate
>>> PLDM/IPMI etc).
>> In this process, We may have to extend
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.dmtf.org%2Fsites%2Fdefault%2Ffiles%2Fstandards%2Fdocuments%2FDSP0249_1.0.0.pdf&amp;data=04%7C01%7Csupreeth.venkatesh%40amd.com%7C318ef94d2e2449628c8f08d8c3b72a7e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637474539330069219%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=rmQNUK8TbASF2%2Fy6N%2BLjjh2tCN8CHKEumXIedUYaRmQ%3D&amp;reserved=0
>> which has a 16 bit state sensor for Boot Progress. As well, We may have to make sure that it gets mapped to
>> Redfish.
>>
>> What I mean by generic above is:
>>> - A generic D-Bus API for progress codes
>>> - A generic app for managing the policies around such codes
>>> - Platform specific "Producers" of progress codes, conforming to the
>>> generic D-Bus API
>>> - Redfish mechanisms (LogService/other) to extract codes
> 
> Yes, this would definitely be useful. I believe we've had discussions
> in the past but were unable to come up with a satisfactory interface
> that supports all of the different types of progress codes.
> 
>>
>> +1
>>
>>>
>>> Maybe some of the apps I pointed above can be extended for this
>>> purpose, but I'm yet to take a closer look.
>> One of the deviations on AMD platforms is that POST code is usually 32 bit code.
>> I did extend phosphor-host-postd to read 32 bit codes and added experimental associated driver in Linux, as LPC ports supported is only two.
>> However, it is far from production quality code at this point. We can definitely collaborate on this to arrive at a generic solution.
>>
> 
> phosphor-host-postd supports the "-b" option to specify POST code
> length in bytes, with up to 8 supported.
Yup. It does.

> 
> The Nuvoton BPC driver has support for 32 bit POST codes as well, so
> you may find it helpful to refer to that when working on the Aspeed
> driver.
Thanks Benjamin. I will refer Nuvoton BPC driver.



> 
>>>
>>> Thanks,
>>> Deepak
>>>
