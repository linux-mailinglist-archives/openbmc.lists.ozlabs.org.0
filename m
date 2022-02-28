Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 303464C69F9
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 12:15:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6d811xLCz3bp2
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 22:14:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=ipj6EAUH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eae::71f;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=ipj6EAUH; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2071f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::71f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6d7Q6WNzz3089;
 Mon, 28 Feb 2022 22:14:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOtKYS6YNhdhnZkQu8C8mckOMaWTcnfA8Eb0i7yrQySru/gDbpjUR9ZpqJ5JxYS+OPH128vpvdGwNSakln8UptJd6diNVlWEDzfXuS6QWOH6Ou4zpifd0hvk2yCw3eMNOU0+mRh4354b3Wj1uot1Qnezo8UCe+4pKEtS1PNnhK7+c6O1IjSIxhkmqG0oG2MNp+RlW9kBbi5GfNcKIRJQopxuRpWwwGtm7X5GAoG2rIkmOUJDEZzwLb73f6W/lFw+2zVaZhUgXG51JsoTjLUQ85rWqNIF4GEVpl7gJgP8dam78XnTk/Z9qAnN/ZSupsHZDsq83fyGp3L4jSNad7S7UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RU4PHkyZcD2KUky0PpeUNVUHTAMp4NsTgdg57ZV2FgE=;
 b=neXoG0ZXyuv6xHCDv1fSOzvGJe1qIBqtGdhp4cyfwiaSCxfTOmwPIE51r842D6zqKpG6660qWxpprqCLxKArUqJaVM2Up5NmBjAbmJ7hz9Bc0A4CjkyTA0A0BmFaoisdf45nL37ZuF4eNN3s1G160oyVF+z+31LSpZZfkwOOOyErVbYrYlpCO+JOXtzyI9Ai/qiU5Hfe8f6+8AMhotIHZ8zlM7CeQXUDwKILDdHKMkiAGtGIbD3I0pwGl9YlgitWDAM9t0DMhNGf2/V4OV/NIMwHIkai/gPJKrCBtyWicZI76LqwS5wG6RRKgqmALzm4kEjH4RLIwkRWrKb2Cj9LsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RU4PHkyZcD2KUky0PpeUNVUHTAMp4NsTgdg57ZV2FgE=;
 b=ipj6EAUH7nMxOJfcHRrG0wa1ZGToAvCK0oZ75ml/Ydq3xy2+9sKYOdLWOrBCZU1YbJzT/pDubjxkhJrOEq6LDpQiAGWuNL/blEXtypT+MvGzxyubgBit940dCB7sqeKSCxgmYj9EavbpVromP+YnVOMxFVmXbQkEIGrB6JpIlGE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 CH2PR01MB5864.prod.exchangelabs.com (2603:10b6:610:41::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.25; Mon, 28 Feb 2022 11:14:04 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::d9a2:2761:a4c0:1e1c]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::d9a2:2761:a4c0:1e1c%4]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 11:14:03 +0000
Message-ID: <83d4e9d2-fc45-83d7-aedc-e5e14ff3c8ef@os.amperecomputing.com>
Date: Mon, 28 Feb 2022 18:13:46 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v1 0/5] Enable second flash, update gpios pin and merge
 adc channels
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20220228000242.1884-1-quan@os.amperecomputing.com>
 <CACPK8XfCskh7KPhXJqOR9ZLnoBdd64SL9D1z5HoDC+_VVs4LCg@mail.gmail.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <CACPK8XfCskh7KPhXJqOR9ZLnoBdd64SL9D1z5HoDC+_VVs4LCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR04CA0059.apcprd04.prod.outlook.com
 (2603:1096:202:14::27) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17ba813b-1a6f-4746-c70c-08d9faab6d89
X-MS-TrafficTypeDiagnostic: CH2PR01MB5864:EE_
X-Microsoft-Antispam-PRVS: <CH2PR01MB58647CF954C0DEF9008F9EF7F2019@CH2PR01MB5864.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mvc/2FpAjvGl9Ym8iLcD2FxdYjYfg8ssqtpRyd9R46iiKntXbM8PShrCTM6HB8I7YSqcEigdcjjLBbNLE/DVX0l/5u0x+gxOSwAQmj7dC6Kr0JipXp6UIIyG3+niglxbK/eCVeZ1nl5Txs+4yTY3Y2ngdg5ccNYQRUH3z1sRTwo2lJ2zK4Cl7ypkCnNgUlCA7/iCP1uHYL4qQoHW+lcesAm6YfQQZw91U7LoIQQq9UaiyfFN/i4WK5n+K/8kYwJlw6KSgSRzT5CJQu4G3l8zjlUuTu/s3CfUzJc2Vpmm32ueMocpoAhlP4ROL99pL20fsOcWyRlM4b585+ztAp8THzavwMvCr5BpiEtYjvuVPHGqY6fjrol4rTfKslCUwm4W4eUYsbKAM9CjbQgRFBhXM4EFV2DAneo6Xn3eRsm1H8LG+hRDdvwhrAGCSgYXN08nyJokRHxuk5fHHNPkznMRv6oihtKHWCDUDvJS389k31APU1qShN5TH5wnVL0KipZbmUaioe19itPwRn5cdPXXs+mJCu6Rt8+27B4lli1TOi4kQLJC7DSdpRpWxz2njiL9pHc2zngu9xyO4WlDvE/AGBd5sULfvgsXqFgA2fUaTuaq0RpwD1spgEVrPYO9llVmrqVCMeftF32XQa8t9ccDkwde701pWbWnu4fyHZ3YsPIf0lN+wqqsNDRPxyUQSfxQH7dyQMbLz9ERMpH8jEOaGGM4Avha5mkZmRqJJi+8vy/MXkCyz5aDfbM9GLFWqSKUXGBNoddqO7D4Hn9R70gTMafJ+hNKLaVF/mw7qgDXcGQPF/CDJ+t4ldIfjZIDgJ88qZ29Oug/NAbgCHwC5hFVLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(6916009)(26005)(66476007)(31696002)(186003)(66946007)(8676002)(6666004)(4744005)(508600001)(4326008)(5660300002)(107886003)(2616005)(38350700002)(38100700002)(6486002)(66556008)(53546011)(6506007)(52116002)(316002)(8936002)(31686004)(2906002)(15650500001)(6512007)(83380400001)(86362001)(449214003)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXRsV2tRVE9UNjlvQUl3Qm0xNk8zVjlFUkF2ZExGelpoRnlOcTUrQmliQU44?=
 =?utf-8?B?REJpdWlQSUxoaUZ2eitFbjB6VzRRRHFqekRiVHNRVnB4STFibE03N0x5UCtH?=
 =?utf-8?B?enRqSUFwSG1BL3diTkNWV0pZeWJDOVc3MnNQa0NvVVhTUTRsRUNOdmd0VU5B?=
 =?utf-8?B?L2Q4Y0NISEo4UUExV3FKUm9ZMTdZRHViV09RZE50NEI2bExNU0swU3ZRNlhS?=
 =?utf-8?B?My85OHczdTg2V2RidVVYd1I0MmVtOUkydjZldHhESCtLZnU5eXd0R1BWamxo?=
 =?utf-8?B?WG5TK2dlSkU5Mnd1Wm1FMkpZNncrUythd09TV29BbC9naml5NEhsYmVQeGVs?=
 =?utf-8?B?bnozNVY2VjBPKzBmdUVVSWZ0R0ErS3cxa0kvWFVKTmI0SjlJbEtWS2tGbGxr?=
 =?utf-8?B?b29LSi9BOEU4Mmkza0U4VWhEL0lLRGpWL3pNOWZsMmRCMUZSeW0yVk5NWkxo?=
 =?utf-8?B?RWY0d2ZmNElEY2xIemFreVNycGtyZk1FaWV6cVlVajkzNHgvTnA4SVV1SXlM?=
 =?utf-8?B?UWZzQUhwNHZ3OWFFTzFYNDMydktpNDRaaGg2Z0lzNTgzaVRrVUlpRkxHZkxY?=
 =?utf-8?B?aTBaTHNYQ2pLNEx5QW1acEc3K0diak1lTW5nN2QwS0lLNEhGMGxUbVZ3bGlC?=
 =?utf-8?B?L1Q0cGxONlQ2dGJJRzhVU0JPeGxkREdPTnBkbEJ3cXlTNkl3OVVQU3FVTUZF?=
 =?utf-8?B?Z3RaZ2QwVWU0M0NtYi9jSWQ2b2xVcW5hQXMvVU1meVlhTVR0YnUwLzNPNTFi?=
 =?utf-8?B?N3ovc0lpSjBPc2w3ZVJWa2wwUGNFTnkvdmFKYmZndzVHOWtkREVYQkpaQmc5?=
 =?utf-8?B?aTFtdXJTZWZJL3V6NkFqWHFmL3VicTVJTTM0ZFhpQjhEaGZHUzFYdFd6ZkUr?=
 =?utf-8?B?dzNNYTAwVllvVUZ3MWREd2ZSdDkzVlJwY0g3UVQ5TmJrVjkzVG8rc0VYTzEy?=
 =?utf-8?B?UFV3V3pLNTBRUTVTN09saURGOE11dUhZdzZaVFpFTCtEZ09EVTZIOFd6aXhQ?=
 =?utf-8?B?eldvTEM5OXlQVXJ6OTk4ZWN3U2xYRTR4VEpCb0FuazB6Q2gyT2RKS0tFS1h1?=
 =?utf-8?B?YTliMHo1bjdYOGlFeUVmRWszdGg4VGkvM0dsRUIyNWFSZU1uMU1ZVW4zWGFW?=
 =?utf-8?B?NzE3QUxsMEMycE4wYStuQ1BnZ3NwVkdaYkhobkNDaGo1bUtTNjFCMUpMR3Bz?=
 =?utf-8?B?ckRxRnJEL25Ic1cyalpYZndoQmJpUGlFVG5pc3JsakxPTXdlNkVlVnNhRkdw?=
 =?utf-8?B?a3lCVEtBaytsUkRoQ0hweSt6T3dmNXFXRDUxOUwxU0NnMUc0ek9aYlhrbjJn?=
 =?utf-8?B?QmxjUk1PRzc3SFYrM3JmaDB3WVp1Wkk1RUpnb1BITlhBWkxnb1VFaVpDV2Yx?=
 =?utf-8?B?OXcrTFpmSk9WQ3JqWVZoa1grc1lHdE12azhxeXZnV3FkUWpzY290bmlVMER6?=
 =?utf-8?B?cWRNUnRocU1NQmlHc1JDaUVuTDZxZ2g3WnZiemhlKzFqMm1tR1NHb252dDZM?=
 =?utf-8?B?TUFMTGRKWG9WRHJCSzdWbWRMOGJ0ZkdqUTVrYjYrVmtkY0pac055UEhacXR1?=
 =?utf-8?B?VzdVb0ZwUm9sUnA1TXNIa3NtL2VpZHpyNDhubW1jd3dRTys4bzVIZkw2S2VZ?=
 =?utf-8?B?bm56WVZYTnlJcjY5b01WOThyejRyZkNRT2lNelgxQ1kyQTZiSFFUUkJxaWNW?=
 =?utf-8?B?Y0NacVRBalRlOCtxUGVIUTFKaDNZaUxIeXQ5WStJY2hiZGw4VDZiaisweUVl?=
 =?utf-8?B?TVlTTzQxMjFhTHJnVlhoN0xFUm5iODBvTU9mWlFRRVVkYktaZy9tdXl3bmdK?=
 =?utf-8?B?cEpsVU5qUU9rc3ZIMGF4Z0VvMnhkRjFrc09aR2pkUXJNZ294Y3RwUkFaRzdG?=
 =?utf-8?B?RiszN0VLeDQ2UHo0bENwMTdVbEM2VGczU1JOMTEyblVzMU5JVHZMUDRRVW5W?=
 =?utf-8?B?bDBBMHhQMWsvdFhpRytCQjVkbTVoY0krdVoyMTRvWURSZ2Y4TUZJMklyMnBG?=
 =?utf-8?B?bmYrakNXUXg2citNbmd3N0UveC9qYkRuN1ZhSGN6Nko5Q1ZtdE1rbkZjSDRF?=
 =?utf-8?B?djJQUU1yQUVHL082UVhyaEFLVHc0bkRLMTVEU2dhQVVDc1ZVRUJvcHlyUFpa?=
 =?utf-8?B?TklOUjBzbVRRbkdCQndLQjZSVnE2aGdkeDcxZ1l5SitKUTRMeXllMFYwQVRq?=
 =?utf-8?B?eURic1dPOThlS0IydlcxNmloeDJFS3UzbzNNUnRjREh5SU9RWW1IN2hhYWpR?=
 =?utf-8?B?dS9jaGE1RnduSStKOUk3c1czbU53PT0=?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ba813b-1a6f-4746-c70c-08d9faab6d89
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 11:14:03.9357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Rpw6o2noCS0WuiXLCBkG4bBKCtatoXCAqsbj+k/zRruKIetx7zZDfei6V6x3btzMK5XkkKTFH4NZ9EiN9oQCz1lZNKYZAGf0Rsf3jJjFEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR01MB5864
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>,
 Open Source Submission <patches@amperecomputing.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 28/02/2022 11:21, Joel Stanley wrote:
> On Mon, 28 Feb 2022 at 00:03, Quan Nguyen <quan@os.amperecomputing.com> wrote:
>>
>> This patchset adds the second flash support, merge all ADC channels to
>> single iio-hwmon node and update various gpios pin name.
>>
>> Link:https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md
>>
>> Quan Nguyen (5):
>>    ARM: dts: aspeed: mtjade: Enable secondary flash
>>    ARM: dts: aspeed: mtjade: Update rtc-battery-voltage-read-enable pin
>>    ARM: dts: aspeed: mtjade: Update host0-ready pin
>>    ARM: dts: aspeed: mtjade: Rename GPIO hog nodes to match schema.
>>    ARM: dts: aspeed: mtjade: Move all adc sensors into iio-hwmon node
> 
> These look good.
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> I'll apply them for v5.18.
> 
Thank you, Joel
-Quan
