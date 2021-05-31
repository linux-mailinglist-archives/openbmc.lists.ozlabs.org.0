Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA84D3954BE
	for <lists+openbmc@lfdr.de>; Mon, 31 May 2021 06:40:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FtjKH0CM9z2ymZ
	for <lists+openbmc@lfdr.de>; Mon, 31 May 2021 14:40:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=syPd1vmJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.243.99;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=syPd1vmJ; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2099.outbound.protection.outlook.com [40.107.243.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FtjJv0Q2cz2xgL;
 Mon, 31 May 2021 14:40:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMtNGV4xNBVt8pNmuRuBy2w4h9Q5THzuLVIOVxO/6iYyXEBn/qq/Hak0RzR384qim7bBN01n9Q3wa5CpPDsecVjhwD14Ba1beKoPjQuhqlCapnro4AEY9UDD7xAeY2AsZLQpMXYjEJ6OGgy4aFTCQZrHH+rtGJ3eriodgjarkZcEJAR/K1qmvWGMOXuygFHGKm4f9iv5119JJFf9I0P0+Jxh3Pfo60giaCrOQCQeXTWHebrArjNnGO+PVFu3e8CiID4vYphIDVog4B97DSKhnRltZzAiR6gfgFkXlq9MVzMck1qiRlOqei5MReDEF+mx6fz/bZz8CcXfrXfLoht+hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICqXDKhCJ1R/lWVouUO+7Pww7EbhoqngrFqn9ZECIRg=;
 b=BmnxJdQZilyo6jNbbYMZGenE0HGZmhQ55hmFGJHkH/EU24yEBnUywwzU65uUntdExCdzBTwWLctWoMygiCLG0usczAZLk4JqoqVQafVPO7b6QeeMybjAEzMxcjpGdXvwszr5p81CBS0/6MZqWWQgKVcwd6n7enzv4FHIYsf3LE1OiDETwjdmU7miwdAbg5KiqBraOkJudgniKk+16fAKMlBceuSaYHuq7SXP7bYvJGgL5n63OFJz2uUp1ZT/X4fm5sSNuonRr6L6bULVE2v59AoV4VPJ6Asr5LKKSyiCF0czFrhTV3nY816iYrG1gtPaYAW8rHX0Jni0pl4tL3xG3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICqXDKhCJ1R/lWVouUO+7Pww7EbhoqngrFqn9ZECIRg=;
 b=syPd1vmJhdQgdKte9QpET1OWxBlUwFRTqL69Eu6xxsIZ+z1q6YsHhzs2uF11SZ1RROzkTFb4amu9aQAz7huOE0KlxlljmWTHzMkunUaCE6fouigAA3Qv40HXpZAcvIlEiRYmTDs9CEu4660v6pF9eqXgkJ8meELVq5+qjjexTk4=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none; os.amperecomputing.com;
 dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 CO1PR01MB6614.prod.exchangelabs.com (2603:10b6:303:d9::6) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20; Mon, 31 May 2021 04:40:19 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::7d5f:eca4:a33a:342e]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::7d5f:eca4:a33a:342e%5]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 04:40:19 +0000
Subject: Re: [PATCH v4 1/4] dt-bindings: mfd: Add bindings for Ampere Altra
 SMPro drivers
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Rob Herring <robh@kernel.org>
References: <20210422090843.4614-1-quan@os.amperecomputing.com>
 <20210422090843.4614-2-quan@os.amperecomputing.com>
 <20210430201918.GA3806853@robh.at.kernel.org>
 <52550615-ae38-d88e-a597-29dc9c71755a@os.amperecomputing.com>
 <ee17c000-6f70-84d9-f7a1-0d30b03dafab@os.amperecomputing.com>
Message-ID: <aa5997f6-e629-e82b-ea0a-484888c0271f@os.amperecomputing.com>
Date: Mon, 31 May 2021 11:40:07 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
In-Reply-To: <ee17c000-6f70-84d9-f7a1-0d30b03dafab@os.amperecomputing.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2402:800:623c:5f9b:4ce:f00e:7db8:5363]
X-ClientProxiedBy: HK2PR02CA0128.apcprd02.prod.outlook.com
 (2603:1096:202:16::12) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2402:800:623c:5f9b:4ce:f00e:7db8:5363]
 (2402:800:623c:5f9b:4ce:f00e:7db8:5363) by
 HK2PR02CA0128.apcprd02.prod.outlook.com (2603:1096:202:16::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Mon, 31 May 2021 04:40:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95e30351-d8ee-4d5e-1676-08d923ee3164
X-MS-TrafficTypeDiagnostic: CO1PR01MB6614:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR01MB6614C976ED4B71941794951CF23F9@CO1PR01MB6614.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F+MMYn1rAPV7ME8yj50v/gvCs1wAe1YpSXZrVlSP0u8v4oWsMXg1Hgd8nrzp4h06n01uYDAHhlooEyzzD0FXYIfBipY/aRsdhdjHFekFNSV0yJmeO4/eqQtz3erIFwb2L3izJu2VQQIt6VpHcAWPw1g4CUmSFhh2e8A0Tpi3Rtr9yZ1eJUsqoWVAJZBPI90isNeYQYkkUOMakp133YLQm41f2V39AuPEImJ7fxSfcsCrIWuNmswbUcoHadCSGHWiVYoO6KOPDXRep+F57sAOjrZhjdw1J2PzkHIFgJYgSTmSNp9Psjr8b+3x7hO38jNTuwVZy1ywhC7n2mJk4SfsAa5bKdk1W/jknckDXem2NAS6MUh33NtEQiQJRwywz82ub5ERYDn+hnP8pzOh/5acg9w95X00Z3hB1jvKW+OM0GZFAt+cVDcveiFjA+N3hWTYVl4YQJvcQxFVEhDHRd/K1C5+3cCIJBO5SMhXnGTrqfiV6KHrslzBx1vvU2ihD05s9cshsRO1W5EMHsohJWdEq0FsA/d+0wdRZIXoFwi/sapP4Ovacq889C9f2/bDSmY12MvEx5hrZoLjE+rbO81Hx9DpO8918Pv7Z2Xs9KRh+KvUDBdhzLC1IXU0L9Ihuy4JsBOBSV+Vc5p6e3xrIs4Ex6+Xke/131/V8TtGK21FnQ2EOC6cuGEyAsXfY2oOj1rZiwJdEvtxYNcLgb5WxkPrRzzSPOA/AeaOWlb1DhlwzAPBc4t9S6kVBSxXjGoN+igcdZNsxtiQQ2V0P8l4ldA/OA4+XjRHwy6vBkfUx7uERrY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(366004)(39840400004)(346002)(66946007)(83380400001)(38100700002)(86362001)(8676002)(66476007)(54906003)(53546011)(16526019)(8936002)(66556008)(5660300002)(2616005)(966005)(7416002)(6486002)(2906002)(6666004)(478600001)(4326008)(31686004)(316002)(6916009)(52116002)(31696002)(186003)(107886003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OGNOR2NXbWZzRFB6RUp4MS9zWUdOS24xYzhVNlhBNmVTNG8rOG9BUWc0SUJW?=
 =?utf-8?B?cUVhdFpyRnlDVkp1ci9MTFNCUXlNbStEK0xqeDQwdjc0enhmTnNYQTk0S2Jq?=
 =?utf-8?B?NEpvM1NFU3liZXdRWVFqak9WV2FlSUIyUjhtODljdTNlUW45b3VnMzdqNjQ4?=
 =?utf-8?B?c3Zmc2w4THBWbzRoU3BxZ1FQcTdsWU1xc3FXWW05dDhQVlVrRkdyTkUwT2xW?=
 =?utf-8?B?ZWRzMk5RRE9md3I1Nm1IeGhZdWNkNG50dTU5WXFUR2x6Z2ZQdkJvQXpnTFMw?=
 =?utf-8?B?TVNzcGJHSVNxVm5sb3ZSUVc2NVNNR2VMc1lNdXBLOVFIaWhLYjhYcFZjelIy?=
 =?utf-8?B?ampMdUdxMGg4QjhnMXc2b0dKLzRoYmI5NzYxV2pJL0F5NzR6OFFnblV2OTdJ?=
 =?utf-8?B?cVdRV1dmOFhGcDBTSDdPWUNoaGpnM1hsLzUwUnNCVDBxM28yZmlQeElyS0I5?=
 =?utf-8?B?WmFibFpJOU9vOWFmd2dEMkMwZlRMczRmakFQQkt0eHptL0ErQm91dCswQTFm?=
 =?utf-8?B?MDNTdjlJWkNsdmh1dWZPUE1CdCtKVzJhQUhOL2loSnAxbjFVRzFEY2N3RDFL?=
 =?utf-8?B?K2FacmwyTVNmVUt2S0tCOUppNlFVdTAreVBnUSthWVAybjdBcENFUkN3cFZz?=
 =?utf-8?B?KysydUtTSWQ0SEZqVk16SjdzNU40RHVyMDNuS3pwdzBWbFFzQkFieDRmZTJ0?=
 =?utf-8?B?NEkyK2svaUZxelhVaGdnd1ppUHBIUlZXa0NQZUlGWTErQVBHaFpBVzUvNjhy?=
 =?utf-8?B?VytITEVXV2RFcmpRMENJQUF6SEhrVDdNZGdjWVVBbzJQQS9XUFJSZDNycDkz?=
 =?utf-8?B?ZU5PTnAyNGIrdCt3TFJyY3VPQUZJV2tuT0wyOGZYRzJsWmlNWloxQVBqamFw?=
 =?utf-8?B?Rm5uME1mR1EwbmRqYXlaYXBNYkl1N05JT2tlWDk1a1VkejBRbmJTYlYxMlBY?=
 =?utf-8?B?N0tpR1Z3M1FKUFlLQWY5MDhFWlNLbm9WNUxJdFU5MlZtN2ViS0NYWG1OeGZ3?=
 =?utf-8?B?cVRpR2pWLzF2aGxoQUVxRDFkdkc5bG5GMzFFZDRNUEZ2V2I2eWhuaXV3NDBp?=
 =?utf-8?B?SDJKWUhLbGNMc0h3WnNBTDlia2Z2L2hDbHlNTXNRUVpKWFdNY3lTMFRMU3FH?=
 =?utf-8?B?Z3ZvTnBsUUhOaC95WC9KQkQwNVovd0ZEc2E2TVhEY1BuUEJrdDBoM2tiMmhx?=
 =?utf-8?B?U1dRalcwK01hOS95VWI0WkovWEdIVTF5Rzh6UytzQ0c5b0d5bVRmc3RLYksy?=
 =?utf-8?B?L2JmUURaUzFtbkgvOWVjQ2RYdExJVjMwTlVjbHFBRXdQejM5UmxCVkE2Qi9Q?=
 =?utf-8?B?bDlZbytab0JSclo4VTVPVEJZenNBTmZOV3VUK29WdXpSUFkwRnF0TFpYQnd4?=
 =?utf-8?B?Y3VzaWxiNVBsZ1BxaDYzN2FYTDQwWGNRZlJ6bXF3RDlKOVVoSHVVZjRnSEUv?=
 =?utf-8?B?QkJtTEhCb1l3cmppdFgvMzJsTmJZQTQ5MlA1NmM2d3MveWJyOTdmdndLcEZn?=
 =?utf-8?B?NEhLa2NOanFzUnJnRXRIcXYzWThtbDBvT21xeEpaR1pVSzhybWRhM2E1NjBT?=
 =?utf-8?B?TEdCRDF0MXI0ckVRSFFDWSs2dzB2UlFicFYyZEZNdzZ1TU80dk00UGJUaUtY?=
 =?utf-8?B?UTU1NmF1ZVB6MUVsWFIzcGdoVHhyVHdmNGtrRk9wNVAybERFNGNBTzNnTllT?=
 =?utf-8?B?dDk4NjFsM21IUG5xTzBaWlBDM1hva1prNG1GZTdYTS83TVhpZGxodzVWc01U?=
 =?utf-8?B?OVNXa09UbzE0UURnRVFOV1hrT1RaMEdDMlgxak16UXhMdGxNQjFISk5YR01i?=
 =?utf-8?B?VHZhamFZZXozZWt6RFM2VEs3MDBKNUJMMStpNGF2SS9vbDhNN0p4YTJ5dVZ1?=
 =?utf-8?Q?NtZjDbEF6U6TG?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e30351-d8ee-4d5e-1676-08d923ee3164
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 04:40:19.1075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wKCTPCKf7A6V3kxPNtYjhJO195sLWSyzuK7ncbN7SnKRfq4Y6LoZ0YZtB4li8nTp4sIRP9IT3KT9MOr/bmkyI2R4A8V2aBBHMM3TkL959ns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB6614
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, linux-aspeed@lists.ozlabs.org,
 Jonathan Corbet <corbet@lwn.net>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>,
 Open Source Submission <patches@amperecomputing.com>,
 Lee Jones <lee.jones@linaro.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 18/05/2021 06:36, Quan Nguyen wrote:
> On 05/05/2021 15:44, Quan Nguyen wrote:
>> On 01/05/2021 03:19, Rob Herring wrote:
>>> On Thu, Apr 22, 2021 at 04:08:40PM +0700, Quan Nguyen wrote:
>>>> Adds device tree bindings for SMPro driver found on the Mt.Jade 
>>>> hardware
>>>> reference platform with Ampere's Altra Processor family.
>>>>
>>>> The SMpro co-processor on Ampere Altra processor family is to monitor
>>>> and report various data included hwmon-related info, RAS errors, and
>>>> other miscellaneous information. This parent SMPro MFD driver creates
>>>> a single simple register map to be shared by all sub-devices and leave
>>>> all the specific to be handled by the child drivers.
>>>
>>> Again, just because you have multiple functions aka MFD, that doesn't
>>> mean you need child nodes for each function. The only thing you have
>>> in DT is a register address. Does this vary? If so, how often? How many
>>> different versions of a DT do you currently or expect to have?
>>>
>> Hi Rob,
>>
>> Thank you for your review.
>> I will try to explain what I think below and expect to receive more 
>> comments to improve these patches. And if any misundertood, please 
>> help correct me.
>>
>> The idea is to keep the SMPro MFD as a simple generic register map and 
>> expect not to change or to handle any specific in this parent device 
>> driver. This is why we see the simple_mfd_i2c fit in this case.
>>
>> And so, all the specific details will be handled in child devices 
>> driver and we expect to have child nodes for these child devices. If 
>> the child node exist we can then add any specific if necessary later.
>>
>> One case is that, each socket (ie: the Ampere Altra processor) has it 
>> own SMPro co-processor instance in form of register map and each 
>> socket could be either slave or master. Some function may not 
>> available in slave socket but exist in master socket and we simply 
>> choose not to define the child node if that function not existed.
>>
>> The other case is that if there are multi instances of the same 
>> function in one SMPro MFD register map, then each instance might need 
>> to be differentiated by using is own register address or maybe a DT 
>> property. Then we can simply add them to the node of these instance.
>>
>> For your specific questions:
>>
>> + Does this vary ?
>> yes, I think so. The register address in each child nodes may vary if 
>> the SMPro co-processor firmware change its register map layout or 
>> maybe other instances of a function added. Child device drivers are 
>> expected to handle these changes if necessary.
>>
>> + About how often ?
>> I actually can't say how often but the purpose of this SMPro register 
>> map is to provide the info to the BMC. The BMC will need more info 
>> from the host so I think changes will be unavoidable.
>>
>> Please help with your comments
>> Thank you,
>> - Quan
>>
> Dear Rob,
> 
> do you have any suggestion to improve this patch?
> 
> - Quan

Dear Rob,

I'm sorry it's me again, I'm just hope you could share your thoughts on 
the DT node for sub-devices using simple-mfd-i2c drivers.

In commit 3abee4579484 ("mfd: Add simple regmap based I2C driver"), 
there is note that "Once the register map has been successfully 
initialised, any sub-devices represented by child nodes in Device Tree 
will be subsequently registered".

So it seems unavoidable to have DT nodes for sub-devices which uses 
simple-mfd-i2c. I'm a bit confused if DT nodes in this case should be 
avoided.

Please see 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/patch?id=3abee4579484c554961bb0af92a77adc0ebd791d

Thank you,
- Quan

PS:
Below is for quick reference:

 From 3abee4579484c554961bb0af92a77adc0ebd791d Mon Sep 17 00:00:00 2001
From: Michael Walle <michael@walle.cc>
Date: Mon, 14 Sep 2020 23:43:29 +0200
Subject: mfd: Add simple regmap based I2C driver

There are I2C devices which contain several different functions but
doesn't require any special access functions. For these kind of drivers
an I2C regmap should be enough.

Create an I2C driver which creates an I2C regmap and enumerates its
children. If a device wants to use this as its MFD core driver, it has
to add an individual compatible string. It may provide its own regmap
configuration.

Subdevices can use dev_get_regmap() on the parent to get their regmap
instance.

Signed-off-by: Michael Walle <michael@walle.cc>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
  drivers/mfd/Kconfig          | 12 ++++++++++
  drivers/mfd/Makefile         |  1 +
  drivers/mfd/simple-mfd-i2c.c | 56 
++++++++++++++++++++++++++++++++++++++++++++
  3 files changed, 69 insertions(+)
  create mode 100644 drivers/mfd/simple-mfd-i2c.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 33df0837ab415..6e1a38944d282 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1162,6 +1162,18 @@ config MFD_SI476X_CORE
  	  To compile this driver as a module, choose M here: the
  	  module will be called si476x-core.

+config MFD_SIMPLE_MFD_I2C
+	tristate
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  This driver creates a single register map with the intention for it
+	  to be shared by all sub-devices.
+
+	  Once the register map has been successfully initialised, any
+	  sub-devices represented by child nodes in Device Tree will be
+	  subsequently registered.
+
  config MFD_SM501
  	tristate "Silicon Motion SM501"
  	depends on HAS_DMA
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index a60e5f835283e..78d24a3e7c9e5 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -264,3 +264,4 @@ obj-$(CONFIG_MFD_STMFX) 	+= stmfx.o
  obj-$(CONFIG_MFD_KHADAS_MCU) 	+= khadas-mcu.o

  obj-$(CONFIG_SGI_MFD_IOC3)	+= ioc3.o
+obj-$(CONFIG_MFD_SIMPLE_MFD_I2C)	+= simple-mfd-i2c.o
diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
new file mode 100644
index 0000000000000..28e96a246be11
--- /dev/null
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Simple MFD - I2C
+ *
+ * This driver creates a single register map with the intention for it 
to be
+ * shared by all sub-devices.  Children can use their parent's device 
structure
+ * (dev.parent) in order to reference it.
+ *
+ * Once the register map has been successfully initialised, any sub-devices
+ * represented by child nodes in Device Tree will be subsequently 
registered.
+ */
+
