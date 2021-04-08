Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F29203582AA
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 14:03:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGKdx0Hz2z30Mp
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 22:03:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=G/Z4X6HD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.92.135;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=G/Z4X6HD; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2135.outbound.protection.outlook.com [40.107.92.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGKdc3SZ3z2yhc;
 Thu,  8 Apr 2021 22:02:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J54UQYDTp1WbeoIUGfupkMWIFMsTHBTDMpu/onjMux5RyoqwYzbeiiuYdiyrlC2RIOgvy1UKblxcY8cQPgZeqn+tECqXBukpGVEOXO4Jwuwzv9SFkA3nnbl74prMhTB4XcCn2qrD14OvQT/YwuXTr3D2lTS91+/+9e5q1o1OPxAOx+jfHzBc2k49HP0Pjn4OwE9mdqGuhHrjToDjpKZU7cq/rEHN2/TSUXKbWuWIALcD8dopGYmZyZTSPxmHiV5qBOAYO2agPgb0ggmVCSfbB3IKj+ZeAltfQBHnYkOmD50/bPH6pbJGQ6fGd6YeDQJcrNRFmr8JVMlK4HccxwQP5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMh9+u3Oy7cayqroERhmB2wi4ZXKPLCoVo3atCLBIH0=;
 b=iYMapnb/agMtMc3QjwroaIpN3KAohKcUUI0Faa2fuzdq5JBtkHLmGRMVhiK+nfJKUsH57Mha9bD14YL0rac6xVtlIQ5yPSonlekObttcAqM6c7QzmLehwsuzfPkBKOQJfaPQQbTs4yRE/M1jWCNv4jmsFEmGawMH8MBqvkxZ8p8jY41WMbkSX04BYUEUkTU+iwlUb+X/9aMqlf7DfjrkJKYXbDWquRC/000Dc/WY2VtA/fK6HW7G0xDvdVX7VjV07pOrAzsRAyUMVhHgOYYvtThPwqnKZ8gIp1Y2ykugcp9eHqQxXp02AXgKI4iVkqYY7oSzzNgDFIjbd21tZUnA8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMh9+u3Oy7cayqroERhmB2wi4ZXKPLCoVo3atCLBIH0=;
 b=G/Z4X6HDywuIFwEyil5NjNjQOcjvTDeSkya170jjY0PvpYKsen3JoNdqLyMekw8L9Jy45fJPHVnw0isqRvE+6sByNg1Au0LeKKzSa8QJpzvV0pZSrFJqTHN3JXpmWhzUDZkFOAxE0h8/9605cAbMPihXZcFeu/QO6Ro/durFCi8=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none; os.amperecomputing.com;
 dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW4PR01MB6321.prod.exchangelabs.com (2603:10b6:303:7b::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.18; Thu, 8 Apr 2021 12:02:34 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4020.016; Thu, 8 Apr 2021
 12:02:34 +0000
Subject: Re: [PATCH v2 3/4] hwmon: smpro: Add Ampere's Altra smpro-hwmon driver
To: Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
References: <20210329015238.19474-1-quan@os.amperecomputing.com>
 <20210329015238.19474-4-quan@os.amperecomputing.com>
 <bac92db0-3ef6-1615-0e92-aabd54fd0580@roeck-us.net>
 <136d036c-1d10-cecd-abcb-d206a0c6fa51@os.amperecomputing.com>
 <d9ef40ea-e4ee-cea8-96df-90ffabdff53c@roeck-us.net>
From: Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <8267ad09-26dc-7581-567e-7286f4d7435e@os.amperecomputing.com>
Date: Thu, 8 Apr 2021 19:02:09 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
In-Reply-To: <d9ef40ea-e4ee-cea8-96df-90ffabdff53c@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2PR04CA0087.apcprd04.prod.outlook.com
 (2603:1096:202:15::31) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.33.17] (118.69.219.201) by
 HK2PR04CA0087.apcprd04.prod.outlook.com (2603:1096:202:15::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.16 via Frontend Transport; Thu, 8 Apr 2021 12:02:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72e787bf-bbd9-4835-5a5a-08d8fa86319d
X-MS-TrafficTypeDiagnostic: MW4PR01MB6321:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW4PR01MB6321587D8DF2C34FC4745A27F2749@MW4PR01MB6321.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I8F4txeu2/p+wiIs2ngWRhV5dwYVIrktA8OC0NND9Sccfyos7wR/na69sZCZ87HWiplmOTuU6EBZv5cjhVffasTLevXrKFQaNUzHjGB4VdWyPdQjlFMGquClmVdA+282U6DaFW21QUCaV1iBq7nPYObx3xKVXdJAFnOBEwDTYlwkZhQ1r98Gh9aroAhDOvvkjzAzdMACO2EVsFTIFmb0TaDVMFCET92StF60TTd1Vq6uAjnwr9JfjDSslJEt/Bhk7n0FL/cG+Phe0LEFasTi1jZkzaGqzqHp9Tal1L5X5WVBM3iXt1Io/M6+ntM7Hje9BtDHbCrhlsQmTL8v+j+e+wWTW6HCtkif3ghtB1v0xyx5g6gxwDXHFlwrHzp0TGmCgLFGJb0NfG0nx8+jThfcYss1IsithEQVfl/pUf6/+C7UcKcx5auph2Y5Ln6waqGzNrdVWkIx9X19i/rUJ2mh4Tbiw+tiJWAUA5BEudAqgNIfoXh0jcIxXTYvA8d9egbe6qke6BUolAqbvPV7K/rE1ujzSoaFhRk2EkHxv1CKCOUJ5+mycV00H6Quek7Tgljcrs/0AxiyQ1IeFskj2iyI4cm8zBCpjB6lhcgZ8QobLoxYdcC1vD7PEfn3iu5RROaVkWmm/7OYSV20qDtlBCDxI50v/kQdV9OiwKv36mB6b0EKPlEYHbXr8cnaP0AG3qRdQ+aPFEo9TNWzlrmORKW7iw0dWMLjz5SKKo8Qty4Kh6HeNBB667Ybjjs6IqeaxmCYZP4VDnTgAryrbgP5Pb+Sfw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(39850400004)(366004)(346002)(38350700001)(2616005)(956004)(2906002)(316002)(16576012)(110136005)(54906003)(6666004)(38100700001)(16526019)(26005)(6486002)(186003)(53546011)(5660300002)(8676002)(52116002)(8936002)(31686004)(7416002)(107886003)(478600001)(4326008)(66476007)(66946007)(66556008)(921005)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UU5pZFJ4Y21lV1hVcDY0M0JFVFc2VEtHYzlTNi9GWmkyZ2hMcVFZR2RGZXdP?=
 =?utf-8?B?Qms4bTJ3RVpBbzRBNEhTZWh6U3VROHhpcTU2eTNWWTVIbkxFWklJSFpBNGFX?=
 =?utf-8?B?bG5tVFJYMzdQOTh5ejJ2M3o1aU9jY3lkcGxyYjdYS1BNYk9BSjVOQUNnWVJy?=
 =?utf-8?B?OXczZ1B0czJGRUVJTlowdFhNc3M3R1NCNitoV1ozSW9hNllLL2cvL3huVlkx?=
 =?utf-8?B?MXNLUERwMFdMU1ZLVzFKU0t0SGdVVmRScXhEQm5YdEFnc3BSb1UwUGxROUlC?=
 =?utf-8?B?QU5ZRVBTVkVaWE4zc3Z6ZGFpWENKdTRIT2NvSGN1aC84RXN3OStnWXR0em51?=
 =?utf-8?B?UjlRQTBHVlNMOTVHd3dCMFByeFNkb0VzeFpTS1daM1dkdlNvbkNRMnhOenBP?=
 =?utf-8?B?WDZ5bXljcDhpbUtKZTAzL3hrMUdGRVk1NjdnVkRpNFBweWhHd28rOURad2lD?=
 =?utf-8?B?citSWVpmNFJJZzV4dC9oSzlwUFFaQTE2dTJHVHE2RzFHaG9LYm80VjZPYk5J?=
 =?utf-8?B?aGoyYXJDdHpHNVk0bkJjaGV0UE5mM3lNT0IvelVURFhodHBzMzFPcUlOM3VF?=
 =?utf-8?B?cTBpS28wQmRnaXRGb3IrYUJ5RHNVZHAzVUgyRTd1d3FYRkFaQUVmdURnOFJE?=
 =?utf-8?B?dGh5dmVXNTZ3Qkw0YUdvOU5UZjQxcmdBSzRLRWVyTjNYK1hUUEdNMXIxeTFF?=
 =?utf-8?B?SmRPbXdoby9MNlFZN3FmTmlOcEM2UzluWEdFYWR4NWxoQXI4RXJKR2srQWxD?=
 =?utf-8?B?MDhsY0xpUmloYktJVjVnWnc5cjlndVRtRnhpNEY4OXB0UVZLSlZkN1BnL2g1?=
 =?utf-8?B?SktZL05nT0NCTEl2KysvT2l4NlczdUNpSXBreHJFS2pLb2oyYzliMzdWWm9y?=
 =?utf-8?B?T3lTcmE2dGVDN0lJdFFjOHlpMW0rSzdnZ3BvdGYzdkE4cS96NzBEbjJHMC9t?=
 =?utf-8?B?Vm4zU1VtWnZQb0E0TUhSVTNhUTZsVXVjTGx3TWR5dVNvLzg5Zm85L2k2Rm40?=
 =?utf-8?B?WDJoL0hIay9Ndm0rV2QwRFlrSjZqNjYxUG9lOCtWSDVYUUNFSEc2TnhuYWZl?=
 =?utf-8?B?UXZFVW9YV2xQVFE0bU0xaXc2Y2Z4ZmpZYnpGUm1sdWRSQXBDN21rRlNCSCtI?=
 =?utf-8?B?aFhuUnkwVnVHZUQxQnpvTHNaTExJai85RElwUThha3dPNjE1eHBTTVdqYUpS?=
 =?utf-8?B?R1k3QkRUbEtyeGF5bENIVmV2SmZrRzR2THlja3RWUGlSdDNkTXliYWhZcFJ2?=
 =?utf-8?B?U3hJUngzbFlUQmk3cmJKcldxdXBZbS9GRmxYQ05pWU9odFV6aWpRQkZvdEo2?=
 =?utf-8?B?OGJaRVczOVhocmcycUJEejNGajNwYUt1THlVd3Nxc1hxK28vK3RzUlBlS1dn?=
 =?utf-8?B?eFRvRzNKa20yZGN4QkZXU1d6TWc1K00zUGsyQk52bGlxbGI5aHZNTS8zR3hj?=
 =?utf-8?B?UGdsU0JHdXhPUHRVRFJjZU1NcjhDay9QU0hKQjBTMzRiZFBTNU5Vc2o2M0pt?=
 =?utf-8?B?MGdYUENuS0dRVDgvbUxJdVk5TFBsWlROenRNVzErQVA5R1BnOVRmQWtvV3ZJ?=
 =?utf-8?B?YnEvYStucFRTQnZMZlRxTUlHejJDSS9LMm5nZmRobCtFVmRqZ0VpUENBbnBy?=
 =?utf-8?B?ZWhVZ1lJKzJYY0JnSlBYTVVQdUg0Q2U3d1VTUmUxNFZaWERLdE5jQ3dUdDBi?=
 =?utf-8?B?a095TldxUEtpOEhSNHpoUlVyaHJTVDB4WXBFcjRzRnRoMndSTFVOaU5Cckdr?=
 =?utf-8?Q?40ZoLncC9mFubutEF7gLkDri/bz99IBy7E7mZsA?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e787bf-bbd9-4835-5a5a-08d8fa86319d
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 12:02:34.3489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rdl91M+t02iq/4s9I7Xyeq0U1t4sMXAg5y04tnqwKgZOqtBYUt9H1ZrvpsBt/5bipdW2RvGcU0xgFGavC7lHiL6hu6t4nMtw79CyeaVaK24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6321
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 07/04/2021 19:11, Guenter Roeck wrote:
> On 4/7/21 12:41 AM, Quan Nguyen wrote:
> [ ... ]
>>>
>>> But then why don't you just use reg_ext to store SOC_VR_HOT_THRESHOLD_REG
>>> or MEM_HOT_THRESHOLD_REG ? It is already available, after all, and with it
>>> the code could be simplified to
>>>
>>>          ret = regmap_read(hwmon->regmap, temperature[channel].reg_ext, &value);
>>>          if (ret)
>>>              return ret;
>>>
>> Thank you for the comment.
>>
>> Will change code follow this suggestion, will include in next version
>>
>>> I don't have a datasheet, but I do wonder what is in bit 9..15. Any idea ?
>>> Main question is if there is a sign bit, as theoretic as it may be.
>>>
>> The original intention was to use this as 9-bit 2-complement value follow LM75, but the fact is that the operation temperature is 0-125 C degree, so we simply use it as-is.
>>
> 
> The operational temperature is not the question here. The question is if the
> chip _reports_ a sign. If it does, it should be handled, even if it is outside
> the operational range. The reported range is relevant here, not the operational
> range. After all, the chip won't really blow apart at -1 degrees C.
> 

I think I've got it, will handle the sign bit in next version.

-Quan
