Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8105ACF14
	for <lists+openbmc@lfdr.de>; Mon,  5 Sep 2022 11:46:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLkF14Hy4z2ywN
	for <lists+openbmc@lfdr.de>; Mon,  5 Sep 2022 19:46:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=ZnfwFQzX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.102.92; helo=nam04-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=ZnfwFQzX;
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2092.outbound.protection.outlook.com [40.107.102.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLkDR6bgKz2xHK;
	Mon,  5 Sep 2022 19:46:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sz7GIbxOD50T9TjW8Fc+h6BLpDayf6vUqZEg4xVEO6IFxAQcD4ark6RtLQ+oYqqG/s1P8C7pyLkMrI+B+O2d1XA1oDpwvg1WQZnGbsLQPEbP6E8fs2IRQLKi8N5GducsFgWhaJgMpIYuchn9M30H8Y3ZoxEu2DwCQdETxRoHW8YMv7mT5UxLH0cZCBrrGUJu4xBQpG3xyGRmBgfe6V6SEhafFbhct0nhqP3mxm1U/DIUmvUQ+GInHYEHDzRMufu5mbOreG338M4ZYzyyCIua6nSCKSuWeYEz/NcUI7v8OF2b0JnaUemJfs6EUA4jRcqzNp7Wrd5WVt7mxnufNCs/5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uaPe1x8UmzRRp8hIuGMX2AGNtu34DYSfcGNzi6aINI=;
 b=WGZqydKAPX+pbX3EIPMR7ZbnCgVvYEo+wCmmBiV5SMZz2XT33w1zOKUjD0PPKRbhoU55IIPG0B7c2Fy1+rEdoDJqw94DAZG6z3HIpRzb441q38hzd3U4zeCixmNOVvmeJyfR6KXxWyhMWUznxjbny2al7KqaKIZgVYEyuOctgs1eh3hC6b7IGyXQ/rJA6KshtfJNxC7cy1NFLYtI/T8MsxvRl6KlIEYUE6/+jd7TAHSm5W8ahifkmnQKOewfOcjwsjNrxMKG/99sHqekcP5igJmrDv2/b7eCZBsCVuJSLqdc9/FZU9cMBbspoodDR92zEAPRx0Buz8AmmNfZeCaPdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uaPe1x8UmzRRp8hIuGMX2AGNtu34DYSfcGNzi6aINI=;
 b=ZnfwFQzXDnJLfr2Lj24APDpGatKHVsesKrHaFK2surb9HEmUjbdMlEvbBoYWCrWj0+GJ/0nMODEsl2fWLoy7Eb1G+JnA5KuCZDhrrkZQPCOBeQ4pdgtkf6UQYGJH0bnTw6jDPf8nRyQ5uywUKyGiemnVnAK8S/PwilNROjCLjos=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BL3PR01MB6868.prod.exchangelabs.com (2603:10b6:208:353::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10; Mon, 5 Sep 2022 09:45:54 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::48f7:ac49:a2f8:614e]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::48f7:ac49:a2f8:614e%6]) with mapi id 15.20.5588.015; Mon, 5 Sep 2022
 09:45:54 +0000
Message-ID: <396a3c24-2a86-0d1c-07f9-386a0de1d473@os.amperecomputing.com>
Date: Mon, 5 Sep 2022 16:45:45 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Add device tree for Ampere's Mt.
 Mitchell BMC
Content-Language: en-CA
To: Arnd Bergmann <arnd@arndb.de>, Joel Stanley <joel@jms.id.au>
References: <20220817071539.176110-1-quan@os.amperecomputing.com>
 <20220817071539.176110-3-quan@os.amperecomputing.com>
 <CACPK8XdDpG3ONM1=-E6qvHL1FgMNWSMPoL_sVGJK6BmmnT3w_w@mail.gmail.com>
 <CAK8P3a2LZKfZpdTQ-R4o9mJ6dk52VRF+Bxj=PJEx-1MA4yH8+w@mail.gmail.com>
 <673e200f-f458-7866-f956-3d5bd7160a49@os.amperecomputing.com>
 <CAK8P3a3MU7shuBpcpRNC5L6xxQmSy8FXCX1jvYXhv-NT3PMYOw@mail.gmail.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <CAK8P3a3MU7shuBpcpRNC5L6xxQmSy8FXCX1jvYXhv-NT3PMYOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::30)
 To SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a0364ea-7f3b-4715-5af7-08da8f236ce7
X-MS-TrafficTypeDiagnostic: BL3PR01MB6868:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	H9Yq8BFj0318ith82gYvZgYSpYo7heayx2C6hkxCo2PcfFrC6w6tsLi6nX53OcxDar9vXZFVNFTv9GHcqC1PiGUa2DRHGxb2RoEz+sRrbTGdyz3cC692OOWEPaD2tiZBkNyvmNC2Qr6XhjM3v2j58X7IptbCWmnXP9qq1ErEUCKRZPomjGGAKE8WDGoBZR722IiaVVLCqAJz0URF5+PAFVaf6IANXeO3fSRisDDo+j9F3SNturir3KDqZw/h2YwoIb5n/PnwdGiS0DgK++GUJa61JfGHxmR/Ne2jedjBRoraqEPCNyxXfMRb75xmJbOhyvpkZZQWbXDK6QzO1XDZhd7CWrWV43Alljv4EZ7Ni/33v6FyDfFgMYIKUxys0usIjEyeF9nhjXSb7xxgvtmPtIWQsCK/sOWA8isvOj0Leby8D8wsQH9Uwr121xom2x1jmBuVyqPlrQHSB8gKH342fISowwIabrkE2xWaSIi2frU3b36jTGkd1uz/BVXYoEq52RaaLWNpmsvB6XZoKuVztLrTyjOU+Fw3Ifka7yS2ENt+nELOwfw2pMJHHGoUPBtofoG9axgvExObr7AVSA1TuIHw25toAOs+Jst4XstUbfZ2FWiaesHBH0aJzqft4ehOfEWg9kxRfpdW7zfIYFR5Ksql4VDCDhiiFnMQc5Tl9wQee6CxgCOWbEcWdLEk7T7xJBYHqsiwsiDloqMytcFxgvcFPom3bylxiV2NRsnb8gful941isgTTRy0GUCwQhdkRiq5pRj1mIfLZHRM71JzGyXTsMl+PSlngYjxx+6Iqgo=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39850400004)(136003)(366004)(376002)(396003)(2906002)(4744005)(7416002)(8936002)(5660300002)(38350700002)(38100700002)(478600001)(53546011)(52116002)(6486002)(6506007)(6666004)(41300700001)(107886003)(110136005)(54906003)(8676002)(4326008)(66476007)(66946007)(66556008)(316002)(6512007)(186003)(26005)(2616005)(31696002)(31686004)(86362001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?MFlneHN2WVRxcHJKVzBQZkZFQ0NqSTZmek8yd2ZOTTVxYlVodmZrLys3K0VL?=
 =?utf-8?B?K1Jtb3dpWVFjRHJXU1pLS3hLR2NIOGNLb3RueWdLSHhTMURHclNOQmVrKysv?=
 =?utf-8?B?ZEEvTVBiRkNuNkkxM0Q5dnN3TGpCZU5aVDJVc1BPSG4wUTRhbjlwYi9ja1ht?=
 =?utf-8?B?V1FFcDNPOTdWRGpJaE1YaDI2MkVHRnRydjI3YUlZWWE4VHlBaVhxN1lmc0Vr?=
 =?utf-8?B?Z1FkTUZ5cEdXbXY0ZU1FVkFVNHNWeEhCS1dqYmN1cTdIZnE0aUt6ZVNzUWJs?=
 =?utf-8?B?U0c4SEoxY2EwS1ZocXorZUZxN0M3NUlRYloyZmZZd1krRGt4ZkFzallLbnlp?=
 =?utf-8?B?dnFZeG5UL2hiV0J3em13ZUo2VW9FM2hGL0trYTJ4RWtDcDVxcm42ZUhuZEtH?=
 =?utf-8?B?S000QXhZeFFmc1JxbUFuYkVDb1JVRklxTVk5OVN0eEs5VEpsL3hXbVVWTndL?=
 =?utf-8?B?VkxwOXA1bVluZ3Q1ZStHT21SM1ZiVUhia0pJOC9KS0lPV25tQWltNW45R0NV?=
 =?utf-8?B?aWhhczJZaVYwdElRYTBFWFZpOXdzRm50NDArV0R5RXdxRTZVZDlXYzNldzZY?=
 =?utf-8?B?cVdnL2VobnlmRjBiVFYxVDlQU09RZnRwcGo5NXR5ZXUyeVYrNFNkMDhXY1Nm?=
 =?utf-8?B?TjFtZzNFQzhCRm5kUnVSeEVWMzhSYllHSWZtbmxDTjFmUkVRZnZGQlB0U3dj?=
 =?utf-8?B?M0RPZGZIZDhId3Y1NDl0VFZOYWd3Y3o3Y0VldzVFMmpsNzdvWi9VT2RqeUhK?=
 =?utf-8?B?MEpjVmxxakRCdWV0blFJUzRPMFFOTC9mb0lIenRUdVU3WUcyWmw4SVVkVkNh?=
 =?utf-8?B?WFA5c1N5a0I1MHRnamtsU3ZWeS9pZ24rWW5PdjFoV3NvTTdybGxKbzZYd2ZK?=
 =?utf-8?B?UDlUYTlCa2lhVUVaUm1QbHp3ZS9QZy8wYnRkOXhCdVQ2UEFwOTRJdnpKSnhW?=
 =?utf-8?B?blhnMDZORzVsek4vQW5OWUNhNWV1RGJIOHhaeklsb1dtMWxGdWY4MjAvVXBs?=
 =?utf-8?B?R1RQRmNISlRsbndsQWlwMXZYZWpROUdXVjhNemt0Q2M4YUM1NFVrNW43VkU1?=
 =?utf-8?B?OHBYN1BicW1RMGhVMUdOc1VXTzZndEsrYWxNdFBBbS90TlU0NkZZMFVPeVVX?=
 =?utf-8?B?QnFIeFlBeEJqamRMeDMzYTZVWHRxMG9Na1JQbTdoeDVsbWFpNjZ5cnpaQzV0?=
 =?utf-8?B?UjhzUlFUeUJXWmNhQ1FzZHRFMVg4Yi9TVTBOZlpsMmRzVGYvOXhOSlNsWDkx?=
 =?utf-8?B?RkQ2MDZZRk9vMTNTVnU1emlLazdnWk5nUjYxOEVsTTRSMXpKS2x0R2hFY1dO?=
 =?utf-8?B?RXZaM1Q3MWNoYTY4MUZ6U2NjZlNIeGlLUTl4SCtCNTBQUmk3eVlDdlVueGFx?=
 =?utf-8?B?R0xyT01JbWsrY3ZKNWk2ZS9PcnBWbE1Jd0U5ZjJtSVF3Y3dBeE9iQkM2RWZO?=
 =?utf-8?B?bHVZU3ZEMUF0RS9KbFFOaFVCSWFkdVZOaVBSSHlRKytUMnRMbzRIbVY0anZB?=
 =?utf-8?B?TXgyVHdNeVl0aE5rZ2MxV2I4QlZLZUFBQ0FldjdKMXJxYzJSd3VON1kzN1dk?=
 =?utf-8?B?d0ZyUk9GTkNlMlpyZy9uUTQwdElkRnQzVTBlVUVyd0krSDVNSHUyMVgrZDBi?=
 =?utf-8?B?THdjSnpWbU9rcE1EYi8yUmdFSDU1Z21kVW4wd0ozQ0VTRTNjdWphVktVd0NH?=
 =?utf-8?B?bFFDVGVtRWFVallzOVpWUEtRd2RybXNZOWFxU1RRMlphYmp0MHJTbEcvb0Rv?=
 =?utf-8?B?L1NhSnUwUTlnWlRQbVF0NWdGa2d4Y3ZEZG9iYm9vcHd3b0xnZ1BDbmQ5WXFB?=
 =?utf-8?B?SmF2aGQrcmM3USs0RFpSbTE4a2t6UmpEQTA2NWR4WExQOVhqWURkNFI5Nzhl?=
 =?utf-8?B?TWZ3dnh1M0JiQWFKZjh5ZVl1ejFQSm9WTTZoU1JvU0Z5T0ZBT3M0L3pPZGpk?=
 =?utf-8?B?RFFhK3krR1FMY2c5L1NBODllNERJZGhrd1pWOVlTYlNLczB4eXBVc1hGc01W?=
 =?utf-8?B?bkdDNVJ6Nk1uYWRmRnVYc2o1MnRLRTA2U09tWTBnaW9Pcm5oa2RtZ3RYc1M0?=
 =?utf-8?B?Tk1ZOE5xT0R4clBkVjJuQTJITGRVaTdMSXJFY2pBd2l0ZjgzOE1FQ0JKamFW?=
 =?utf-8?B?dW5WS1ZuT1hWeFpLMGkvNytMWlpScm1lS1lFcGJrU2d1elBESDZwV0MyU0lL?=
 =?utf-8?Q?c+su9Fi3h/yw6+akkcHMfMs=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a0364ea-7f3b-4715-5af7-08da8f236ce7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 09:45:54.3668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E9nTPhYltf4mNp8qgXg6vObL7hk+uhSHTEpVzbOgKdZKZc6JKjXtEat1iguPNX+44WolLVcdCAwxdiG1NxAvxDOlR4/Q7PV0vPZmkkt9D8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR01MB6868
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, thang@os.amperecomputing.com, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Olof Johansson <olof@lixom.net>, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 25/08/2022 19:35, Arnd Bergmann wrote:
> On Tue, Aug 23, 2022 at 10:27 AM Quan Nguyen
> <quan@os.amperecomputing.com> wrote:
>> On 18/08/2022 19:06, Arnd Bergmann wrote:
>>
>> Thanks Arnd for the comment.
>>
>> I think adding -append could solve the issue.
>>
>> But as the bootargs still exist in all other
>> arch/arm/boot/dts/aspeed-bmc-*.dts should we still keep bootargs for
>> this dts?
> 
> I think it should still be removed. Only 238 of 2547 set the console using
> bootargs, so that would make it more consistent with the other files.
> 
> Changing the files that have the same issue is a separate matter.
> 

Hi Joel,

In the meantime, I'm just wonder if you could help to test the patch 
with -append and get it merged.

Thank you and best regards,
- Quan
