Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 692FE4C0A07
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 04:13:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3LhK5wbrz3bVG
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 14:13:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=ty/vxTJX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eaa::705;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=ty/vxTJX; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20705.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::705])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3Lgr11mRz2yHZ
 for <openbmc@lists.ozlabs.org>; Wed, 23 Feb 2022 14:12:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QitYOBVRjfr4WUlb1aI34xL82byNdova3pwy0ocOtTHek5r1jVkul+YJAlXudG5R1im7PKb2AoiVqFjs9IMPj1cGNjHf0YR8ep/25uox8grrAZpL/q2Wc96K2r33HQROjtqHxa6qoE6mg1D/2udnyjQxlh8xtFKiAOeiP9PKxsQajb1af3j5lXbtmQaPrRIviSmGjQEF1WU8kf/VkRbzVWkZ07uXOKFLdMOLafsiIsQUjFPmqLPyhe6HWae4yObNQbJJBTrxqwJTAtsqY+K2Cl3DSY7sz0xvJrDToG7ha6NKKwi0i8yfhFUr20g4FYskuKrC0fHUWIJf6igPH3vxRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGVluDJO5QtqLWuXM3eDsFOFsdRLsuIg/YBA8XMLTW0=;
 b=Q0o147kycTSHlFSzcByWVXc7Txxg58wzNNrVd32CUpPdaQEaEeQ8lHSi9mXcAY6fIK+9Ir5j2UCPZtxGQUfZD4O0hZ/cT9puEg2E+zMBMyIF4J00m6uNG8jI5tn3DqqsB6V5hKI6cC+YPF9v+TjxFtQ0AxPzC/scistJX2K2u0XhfrXOh1m8R+vD6lsEXwo9wUXS+Y59G0uxwpEQXHL3TvBuUZ54T/aDjEXGbn5qJYvIpsLGKkOyaZ8HmXr3XwS3X8suqeo+8+PZmLgkBqFaEWE2x+IPHdc8MvhrEA7ZxsjG1y7JfvdCxErrvBDqp5oPS2ev3IcdfUBObyIywiFwrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGVluDJO5QtqLWuXM3eDsFOFsdRLsuIg/YBA8XMLTW0=;
 b=ty/vxTJXl996QQQLLTUIFyB1nEFrNSOROFcj8TNZAJa26bRvajFa630qPWIuWQtXRmKMR26dSdcqwed7TqS7ljeO0NKZ1pzf+rabE8TEFpYanbiDWE1tQ+nKjusKrn1GE9rasVERmHvvJdVhzAyabF5+ZLalmXAHN9/7/ZtnUMk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from SJ0PR01MB7238.prod.exchangelabs.com (2603:10b6:a03:3f7::22) by
 DM5PR01MB2553.prod.exchangelabs.com (2603:10b6:3:40::18) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.25; Wed, 23 Feb 2022 03:12:18 +0000
Received: from SJ0PR01MB7238.prod.exchangelabs.com
 ([fe80::1075:ab65:c374:87c8]) by SJ0PR01MB7238.prod.exchangelabs.com
 ([fe80::1075:ab65:c374:87c8%8]) with mapi id 15.20.4995.027; Wed, 23 Feb 2022
 03:12:18 +0000
Message-ID: <c34486d6-50c0-761e-7fd2-d6ba3b14ebce@amperemail.onmicrosoft.com>
Date: Wed, 23 Feb 2022 10:12:13 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: New u-boot-aspeed-sdk runs slow and cause wdt2 timeout on ast2500
Content-Language: en-CA
To: openbmc@lists.ozlabs.org
References: <CAGm54UE7-QxGBniV3J2jnBiW4ygvRcHxKd=G88PsOiNZP+hBTA@mail.gmail.com>
From: Thang Nguyen OS <thang@amperemail.onmicrosoft.com>
In-Reply-To: <CAGm54UE7-QxGBniV3J2jnBiW4ygvRcHxKd=G88PsOiNZP+hBTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY4PR21CA0036.namprd21.prod.outlook.com
 (2603:10b6:903:12b::22) To SJ0PR01MB7238.prod.exchangelabs.com
 (2603:10b6:a03:3f7::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3629db9-dde0-40bf-3b19-08d9f67a4cc3
X-MS-TrafficTypeDiagnostic: DM5PR01MB2553:EE_
X-Microsoft-Antispam-PRVS: <DM5PR01MB25534517748FFED6C233B0098D3C9@DM5PR01MB2553.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hbus/1p5UMit2vAdT2ylHp65UCArPPTqs8AtlE2skYRCIqwYT+Be7BFT9ueb9xnCsFztX6lPfcdf5AdzQZsAuYh1ne5oEq5c8k+iLoSW8b3XFiHNEXQvpTEOFVwQu8SdMC15Y3yn3iUH/uyl3z05ljqUpeE0WAoKcagpm2n9wcOeNACip9UsA/zCaltPGgIv/L7e/oSQX0cFulEjRgIdpS8UaBvJhy19y6HfBxscp4N3SNCXzw+a70IDtMBxxgRmJ1sSlFOOkg1RxHHYKnwq6F8SswB/R3mGT8u0OoHOITvbb8Zhe69GLpyEkMMg7KDng0iTRtV4tv8Z6SgqX0G+dCDf5bW9GAr/QjOfWB2C8TxGCHXOilxMoO9JIXiCYZpZ/wzhaU+mLjNYLRTULwwvcA2hq7/qnBzf5kqcPc6SDtKrBqSefWlccUHjK/KPbUSlfPuuhlPtTtQMlS+H8VMOoEhquj0LcYo2Bgdh8PMf/KQAHirGwew/o3nJxVTkNfRc+p9Ido+isEDqNomN/K7+ZrIYHRpV/k4YcJvslJfGlfR4hhWb69T/ph2+zBThpgETVp7p/VasVpFAqMfkzyj+6CL8k8Q66qLyhxc56CbwPx8IPUlGOdYP/lcYOwll2j9mW3dF2WqyT51Jo+R6K+UyhQOvgk21GhSbiGLMtbx86aK/Wr3wIxUPSSs+OFga10Ta5zL8Do2f30fHsfT+WQclHD8I4rfLWB+Q6CesMo7KZPU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7238.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(2906002)(83170400001)(6666004)(52116002)(5660300002)(53546011)(42882007)(31686004)(8936002)(6506007)(2616005)(6486002)(8676002)(66476007)(66556008)(38100700002)(6512007)(38350700002)(31696002)(186003)(26005)(508600001)(66946007)(316002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a05KWDFhVTZXRTZ3OVE3anFxS0pZTzAwSkVOejdJb3F1Tk8wY0ZVbWcrNlRk?=
 =?utf-8?B?TmY2Y3RGejBERnRJd2NCbjIyMWtTT2g0a3duRHBySUs1TGZKVGxTaExUL3Er?=
 =?utf-8?B?WS9VTlpKYVdqdVI1M3VTUXB4MU54czRyc04rN0J1NlJ6ZzRkU1g0NzZJWUFt?=
 =?utf-8?B?Sm1Dd3plRktBZXZ6clBKT1V2dXNZSE5scm9DUFF1dGozT2NMVEp6ajM1Zi9E?=
 =?utf-8?B?ZUlDbWxiZnZlUUtBdy80NDNSN3ZRandtV0N0S1VpNzVEbEpGTVp5cmhrM3ha?=
 =?utf-8?B?WUxhSnVSMzhvcDNINTJiMlZWcmNPU1RyejdSaGg5WFpRSXB2Uk01TklwSkxW?=
 =?utf-8?B?MzVWVldyMlBnNWt6NWpsUlk4M2xHYy9qaDRyMHU3bTlJTDhFZkJVUVlvVDM0?=
 =?utf-8?B?dUVHMEF2YTdRZHBBbnVZTEhmZkV1b3pPUzRzVjBzc3dNLzN0eDVUV2RVYUdJ?=
 =?utf-8?B?SGlTWEJJdTlVaVNoR1FGdFpzMG04Wm55bGMyaDdUY1BGcmNCUEJlZnlXaXBW?=
 =?utf-8?B?KzZvT2hWN2g0NHptMFBVK2Z5NjBaeHAzTmVxVDc2dURKdFZxYVducno4OWRT?=
 =?utf-8?B?TkYxVnE5NjBtaEQrV3ZpMXA0VGoxQjY4TTdEQTBMeEE1TzVJYjVSZ1I0cHJo?=
 =?utf-8?B?WmdUbU5MUCtBMUNMdEllaCt0VkxXdkxiUUlqMWZ1bjRJOFVEMTBTY1lsNDJF?=
 =?utf-8?B?emNtRW4zRW9LTU5pYUNoUmFRRldCYXpuWW84QnR6VUluVTAvRlhIU2M5RU9T?=
 =?utf-8?B?M1lRUDhlVXI4YmYxZ0hFOS9oQVoycFMzcjFVeXpjRGVSZVdDNHpxNmJBZjV5?=
 =?utf-8?B?dFh1V2ZxMkdEYkVEU0FxK2wzaTVuRS82dVhCM0V4U2dDdW1tVXNQQWwwa2l4?=
 =?utf-8?B?SEEvUjlhS0ZubUM1d1ZrU2hrN0NKb2pTaXRoOXFRaFgvVDV6NUJjVld0Nmlo?=
 =?utf-8?B?aTZaU0RTR0lvK2FuSjlaRkRkRFpJQlZHYmNQK3BocVZ3eVlxV25Ma2V5RFB1?=
 =?utf-8?B?Vi8zS0x0UlNYdWlIYmUwTmUxdFZwVXVFb3JTRjdITER5UnlmZ0hMOGxNS2o0?=
 =?utf-8?B?TDhxODZ4KzFoclJFZCtkc1hVRW5MTElQekZIZGJQU2lvTXVmcGtpVkZUYmkw?=
 =?utf-8?B?TGgwTVU3ei9vMkhxZ0M2ODVLc2pQZzFHRlFhaGxuOWR6cDRMUk45dUwwelVo?=
 =?utf-8?B?ZUl5N1BYUFZROGp2K0Z6c2xBMDIzajdSektUZ3lHb1dqUHk3cDNlWEUxVUlZ?=
 =?utf-8?B?UWRpRGExUFZrQlRiMDgwUi81NGtFa0x4WHJEWnJxbHUyc0NndnNlSGdKUTAr?=
 =?utf-8?B?WnU2WUlRZGVoRVdWeDdIdkZlaXdYUFI1bFFwbnlEL2lTYVMzUndua2tnVTFW?=
 =?utf-8?B?NXhoYUxMd2tHNFgyQUovME82ejc2ZzhrWG9Kc2EzRUlnZk5zRm55WTJCekNG?=
 =?utf-8?B?Y1B4YWUxZ1dqeXVYMWs1c2tHNjFZb0pCMGtUMmlYbGNjRzZmRGR3UkNqZXVS?=
 =?utf-8?B?dUJHK3djYVVLRnJPU2ZpdGVzY05vbzByRm5POXNVL2hqbkh2TlFpd2Z0Q1dk?=
 =?utf-8?B?VXRYOGJZMkIzMTIzNmV0U1owV2J1RDN6elVScGdUUExxQmk5U0J6S0tLcG02?=
 =?utf-8?B?SVllenNrdXJrTlo5U01zdDg4VGJIWkt5OWRON3E1UVU2WXVGVUk2cWhGYkM5?=
 =?utf-8?B?TEZCMEFlajdLYVgxOTMxMVkrem1kZjNNNDkwUkxnVEh0Nkh2OStrMUJJdTlL?=
 =?utf-8?B?b1NQUFNzUHQ5VzU5N0ZXSkVLSzMvQm52bE4yaWtYdkpmREJvRGxvdHNrRnpJ?=
 =?utf-8?B?c3RsWGhYS203SituU0kxdDVVdWVyTXgzdzZkdTkyQm1iNmtMZHl1NG4yeUZh?=
 =?utf-8?B?bWpwVjBFZitlVFExU2czNjhBQ3p4UzVDQTdOV1dxNjVTaXN0TnlIOURSSG9K?=
 =?utf-8?B?QmRwSHBlTlljL2ZlNVBabEErTThCd1p3VDlUbFdmTVYvRHh6RDdmcElHYmJv?=
 =?utf-8?B?RjE2UFlZZkVsY0ZjSzhzbXdQdUhRVDFCQ2FyMjJhcnh3R2k1M2Z0cHgrVnUx?=
 =?utf-8?B?MGFiOWdrQXVSdmgrN0NGS1R6clc5YTRzcW5xTDUvSVh6TURmc2NPaUVOQlVu?=
 =?utf-8?B?SkMwRlV6UUNqRUdobXhUVFlSZlNDanJ5Vld4UTBVckhVSEF6R2xEL1BUY2sv?=
 =?utf-8?B?b1pOWVFIOXlBQ3JLejl6dkFhRTJIb0l0Rk13YnZNS3BWS1VaNVZtQ21sWWxq?=
 =?utf-8?B?WjlJVGlSMWFwTE1OWUR5MEhSY3Q5YkxXdDFXWmRFSi9IOWJHMTlWc2UzK0ha?=
 =?utf-8?B?d1k3ajU5WXFkVTMvMktxM2x2WktrS1E4bXpTMjJBYVk4S2o5MGJmdz09?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3629db9-dde0-40bf-3b19-08d9f67a4cc3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7238.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 03:12:18.5503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+tnr5Gll+tSIlUBc5JD47qbcKH1vz1gWxSOonXege6DtLOr3wKMD0TwkflU3sSYg79AzeS1fKDK3BFJbwg/F31Ho+Dg9VZGvdV88LSf3O0msopFyxg+vy4VweDoA8ue
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR01MB2553
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


On 23/02/2022 09:15, Lei Yu wrote:
> On the latest master with u-boot-aspeed v00.04.09 SDK, an issue occurs
> on g220a that it runs slower than before and gets wdt2 timeout.
> We reverted the u-boot to a version before v00.04.09 SDK (b0fe8fd9d)
> and the issue is gone.
>
> Below are some details:
> * Before v00.04.09: u-boot works OK, and it takes about 9~10 seconds
> to load and start the kernel including the 2 seconds timeout for
> autoboot, the kernel starts OK and it kicks the watchdog as long as
> the driver is loaded.
> * With v00.04.09: u-boot runs slower than before, and it takes about
> **16 seconds** to load and start the kernel (including 2s timeout for
> autoboot), then the kernel does not have enough time to run and loads
> the watchdog driver, and the wdt2 times out on about 22s.
>
> Be noted that the issue is observed on g220a that is based on AST2500,
> and could not be reproduced in QEMU. I think it could be reproduced on
> other systems with AST2500.
>
I checked and saw the same issue with Ampere Mt.Jade. If I stop and 
u-boot prompt and disable watchdog via "mw 0x1e78502c 0", the command 
does not happen.
