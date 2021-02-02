Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A6230B4E9
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 02:55:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DV7Dy0ntqzDqn5
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 12:55:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eaa::721;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=JUoetdNI; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20721.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::721])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DV7D42XkszDqLY
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2021 12:54:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KmQLco/Q5eJOQ5SN3Vpn3g1AolqEKhayB0RNgizturjKzg50CyeeNXPXGyJbTohx2CDmRXcXXrHhxXsJT+G2V3YF8jnnhCyCAFjNiHLao5o+x9x18yi9z3rN5LUsGQKlXKdlRDnLrtpo7VhlVfwP9ktgBXqkUJHgWdBZBQkoNNo88Sadh0M+B4kLW2U6Ia03sl8vpeNANGPh9NBa1eVZTUc+f5Jnd+BQsAbBAPe9lDhrantd8BqaOC9E+gupBQDdtlszD+uH0+PXfpAmk2kZW+agaRsLRui0cKJlECpH6Tm/hU4syoYTxNhwkneT4yHdfDT1fKUGEjeDsDNhDAAkvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cminosA/6ucUVmH32NthxK5LpppMi3K1B25YzMtfCgE=;
 b=Uzl15kIaQMzTQYWbepGRyBXIPkbghvKKxlmnoxnPQ9vuTTjeB4y4CGeAS5cCIYTlszPZjpAgBTQS7caBNMiVQ5Y46OywpZAjrIJmU+8A54U9e5pk3phJCdjO5c7tl6tzgbIO+OyE44cjTifOsSpmRKVcbFWeG4YyT7T6xvQgekarfcVfDVAeeoFgboqmAMji8l4e8n7QBS+hxkVuLu0h8llF6SAQ/I3MXhcXAhXl5WHnMxJjyLxiuGdpCaGZ8W8UWkyboADKvHoyr92PMTsze7LtIflF36t4YzVxapU67z2hvQthNnB9NgtB5G6SlOgxPmE+pt9APUPddqOIpyTqYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cminosA/6ucUVmH32NthxK5LpppMi3K1B25YzMtfCgE=;
 b=JUoetdNIzVAbVgI8hYtC5wwF+jWqNnvq4s6GC+S6BJd+UoIb9fMfQG+XJsFYZH95yVRJS9PbaKGfH9ZKYjKXDSpsMxm+Ge/tbDfXjcZV1kWfzS2qV18xihAUZchY7vK0JpNMpq68vpYegkLohjV1zq16kS1wVHcAzp4mGXBB3kY=
Authentication-Results: fii-usa.com; dkim=none (message not signed)
 header.d=none;fii-usa.com; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 BYAPR01MB3941.prod.exchangelabs.com (2603:10b6:a02:91::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.17; Tue, 2 Feb 2021 01:54:33 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::650e:6480:5f2a:4b96]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::650e:6480:5f2a:4b96%6]) with mapi id 15.20.3805.027; Tue, 2 Feb 2021
 01:54:33 +0000
Subject: Re: create meta-ampere folder in openbmc repo
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <d5302c4f-c0c4-0bde-2a60-e943a2f41788@os.amperecomputing.com>
 <0e2507bc-f8c5-85c4-cd39-4c603a729f4c@os.amperecomputing.com>
 <da62c090-c6a0-1844-cc2b-44846b83c89d@os.amperecomputing.com>
 <3eff5596ee50878be8623c021816977f42111ea4.camel@fuzziesquirrel.com>
 <96568613-294f-8a3b-9aa9-7918b5df2d9b@os.amperecomputing.com>
 <20210130161537.gj6jhwvsnwgdkofa@thinkpad.fuzziesquirrel.com>
 <94d1598b-0dbd-17ad-3326-c581d583cc41@os.amperecomputing.com>
 <20210201134803.ok4bt3hd5xcrirjo@thinkpad.fuzziesquirrel.com>
From: "Thang Q. Nguyen" <thang@os.amperecomputing.com>
Message-ID: <7e398d28-29f9-4f9e-3162-31014bf8509a@os.amperecomputing.com>
Date: Tue, 2 Feb 2021 08:54:25 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
In-Reply-To: <20210201134803.ok4bt3hd5xcrirjo@thinkpad.fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2PR0302CA0009.apcprd03.prod.outlook.com
 (2603:1096:202::19) To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.7.183] (118.69.219.201) by
 HK2PR0302CA0009.apcprd03.prod.outlook.com (2603:1096:202::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.10 via Frontend Transport; Tue, 2 Feb 2021 01:54:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0f1f013-64a9-47c7-cf6c-08d8c71d7c87
X-MS-TrafficTypeDiagnostic: BYAPR01MB3941:
X-Microsoft-Antispam-PRVS: <BYAPR01MB39414D622EBD22563247D3478DB59@BYAPR01MB3941.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k0te9tjDNZk3AE9CXfqMmHClg0npe80wf4DyOD6EkqwpqapRy/ltENEdL5Tl3HTv/kD4n89mhbv2kZ5ym1U0pFF5CKOZd9SaGwBqkpfA9us7fd5L5n4cLxKZkUkRg8d/VuWJACHtHbiTVrg0WcXuPtqjJyKZVRci0U6bki0PwpZimbpHmhZXAa7pbTuuLj6hVYB1J34HVMeYdnbIsPJ8q3/7HPgILRbinongMoJDRnjqO20mNnKg4JzFUaRA2q6zdWzA0vQQ9teFeUOBqCexSS6eGkb4JW6pXzF/JK8F5YBE090XR3Ee8Sx8oX/6Lw3scmEit4PKi04PDtd463lMWsNLBmHmgHP2giFyLJ5csMId2KqUR7DHvRrL6V1CvTDzfuJWHe/Ais0ZKEqNIrwCHjQYNJv+xxbUhQ7lXh5yARYHn+SJXmh3teC7GQHxQvKumTDA9h5Nm9W2GAnwuxfkAz136Qt7dZICOmn2rDuuumZPiyCZIJ5SQBQjWZ+D3jnHxaTzEIxAgV6/wbUs69ZezBopbVg5PAIpqbvraz8cJYYpdlDcAbMkjCf+DJ/2dFtrf7CZm2Xp9BhOFym0wzLXvpBf9CoIuxuRX2bzWV0UX0nS3ysnlD5KBiZWhPIGnynMlL9ALhJ3EgoN0q/zYb6VZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(39840400004)(396003)(136003)(53546011)(52116002)(16576012)(66556008)(66476007)(6486002)(316002)(478600001)(6666004)(4744005)(5660300002)(186003)(8936002)(66946007)(86362001)(4326008)(31696002)(16526019)(8676002)(31686004)(26005)(2906002)(956004)(2616005)(6916009)(41852002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZDZSTmdUYmdWNnVxTk4ySCtOR2hpK0k2NWxJZ2ROL1FFN0w0b2M2WHVGcmJK?=
 =?utf-8?B?VDBWSnYyZG91UVppbE1yQVRySjhZejkwTDUrZ3d0WXRVUzcvZXFSdmN4akFx?=
 =?utf-8?B?K2tKdGdCT1JFWjJkVTdvOGl2c1o3bXlweVRZVXNRaTZUb2x1SnhTN1ZiV2lQ?=
 =?utf-8?B?d3BoT0haQmZrOE1ZUWdveWZ0cDZwQ0J5eGc3dHhHdk5WbzBkeWh5RiszREJF?=
 =?utf-8?B?VEtRczlvY0RvcGZrZXNUNHB1VjZzSThCcGJXNFFrWUh1bW5XeE9iSjhzaE9i?=
 =?utf-8?B?b3JNMDhXVktNa1RhcXY3T3ZiZlBZSGxleHN6ckhLYjAvRW84TFRIQnZNRUZp?=
 =?utf-8?B?Nld0a3k5K1c3cUlXWWlERlM3ZnE3OTJWN29taWVtU1RhOVFrenFlYm5HZHVh?=
 =?utf-8?B?MTgyU09sS2R3d3FESW1QbHkvMjV1aXkzVG4rV01idnZ4OUttbklZdUl1ZEZm?=
 =?utf-8?B?bVBoZ0JFbTNPa0NzSnQ5RXJabzdaQnRVQ0xTZ2RaVWRUYkV6S0dtRVdiSUV5?=
 =?utf-8?B?UkVHdENzSlh5WVZrQjFLaWtnZ3E1RWxDbHU2ODlzbDA4V1RVU3NGZ1V2ZThH?=
 =?utf-8?B?eHJSTzNoVE0wMGJqNVFzWXhGZldxcmpEa3kxNG1ENUZ3U3BlME5mZENzRmRy?=
 =?utf-8?B?bCtNcE1JcU96VUoyVGNRNEplQVNNNjdIUXpIMEthcitwbEFtaGg4MVVvcW9C?=
 =?utf-8?B?V01HVm1waGNXK1JicGYrNFpiamhIMENieGIwR1JEN2FIMFJZQTcvWlR2MUxB?=
 =?utf-8?B?eVhYQWZWVXFWYVk1Q0E4YWdvQnZ3eTd5Q1dOZndndXpGSVNPK1NkenhSWUNB?=
 =?utf-8?B?SjNVdXZkY1lVSmNSR0NzOTN4bnR4MFlrcWVURWNHaVJSNEsreEVhT244OVZz?=
 =?utf-8?B?V0dpcnBqZWVLaVhjS2MwSGZ6emFmWDBYRmpubFJEVEFQNDFxMVNwRXlHYnJW?=
 =?utf-8?B?bjVDSVdXTEg0S3ZRK0hnSmZrUlFkRmp0RktlaUFaVzNCMlFNMEZzOUMrN1px?=
 =?utf-8?B?YlBDdy8yRzNNZVFXS0dGUEtZdVhRcTdYMHRtZEhONGVxQWQ0RGE5Nk5iMGoz?=
 =?utf-8?B?dkI4V25JNW9nbklqYmJZdWFHYkZNRmJnSVBVSGI5M0ZlRENxa213dk9CVzM5?=
 =?utf-8?B?V3p3bWU1K2c5OWVSSlpRTWhVdlNSK3BlUElTNWljNmhvcmZBWFlab3JZbVpC?=
 =?utf-8?B?MHhhWUxBTS9XckhxakNTV21kdzYvanp3ME9OaVY4QUdBOTRWM05FeVViZ2s2?=
 =?utf-8?B?ekw2emhZTGlZdTZmNjNEZllaeDE0ejF6MExMNVcwcVVKMkY5R042SGRuZW9p?=
 =?utf-8?B?YUltNVg0ZjBlb29FK0RPS2NTaHVPUGl2elg4SzV3TjlWWnhSY0pUWElOZGs1?=
 =?utf-8?B?ZHRTcEladDR6czhzcnh3alFkRCt2OUZYVGRhS0d4Rm5icUxBWDNXTGtUQW5k?=
 =?utf-8?Q?1HTEJX4c?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f1f013-64a9-47c7-cf6c-08d8c71d7c87
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 01:54:33.3037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ih/TZKNtpMRp9NrxN0SqDxbBnws2CdbYVdKV2ipnk2lj8ZVUz8kIdVLKrIQ25ICJut+gHtIM3nwecRYzD3FCRcvtMeKWoi1syXVRgYc2sBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB3941
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Lancelot.Kao@fii-usa.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 2/1/21 20:48, Brad Bishop wrote:
> On Sun, Jan 31, 2021 at 08:01:08AM +0700, Thang Q. Nguyen wrote:
>
>>
>> Hi Brad,
>>
>> I just see 3 commits in the meta-ampere folder while we have 17 
>> commits in github.com/openbmc/meta-ampere. Are the remain still in sync?
>
> Oops - I'm not sure what I was thinking.  I pushed the remaining 
> commits - please let me know if anything looks wrong!
>
> thx -brad 

Thanks Brad. Everything is good for me now.

BR/ThangQ.

