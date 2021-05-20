Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E739A38B1A9
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 16:25:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmBpg6pxfz302D
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 00:25:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=SS8uEUg0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.101.134;
 helo=nam04-mw2-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=SS8uEUg0; 
 dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2134.outbound.protection.outlook.com [40.107.101.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmBpG0jc2z2xg6;
 Fri, 21 May 2021 00:24:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThQc8l5cPAxt0X8UDgMAhzhNFjkJfFjJs6na7vGkFze03dzEAF+fISHwG360YktOZgsTrOD7ROEjcQetKoZ61BR2jRg666xCCB34366KeJvascW9WM06fv8bNdZWYdcEtBMll75r/9kxkdRoj87itn2u9fokyZWzFc84FWw4Ss4+eamKW+35QMKd0lrg5HPgMQ2IqkB7EZcV3HDytUSWJG0SY+SmqgW1ej7tqrNU+0jb5S1swXHKdcrtoPkbDTQD9XMitsaU8kc4BzVeYYkwzSrVC3SGcqSoq8kkFb1PaVl/l63hxcL06a0IKmzunzKSv5B/hJK4l3l8Vt/2ODcFEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Czb2tMM+hL8/ExpxHxdKem2pI+LOhiqEXGR/6kZRt0I=;
 b=iqdCf5x7ktXLsUUuOVE84MBUjzY0urblTpkdjfvELAj0vMG1XscYcM1Y0lA5BffZTq8bwlcr1F1LgIO65udrNzAkapQAJ4xrwyDtk18zwSsPUWUcdz//EtAUUO9IbrhwuoHozGJkCVuWkwGSX2u9tD8JIY0wUY+K1CmZKOwrMvIKhjVq1pa7y2uZXA5HeqxrGIkVCJaiWfd6PG+cy8BRSf3cc2SEZ4lvMco/1a5DNsKzCNe0Dpz/y5gUAyOE01vl3cJhICq28qgEtf15Zb1BEwzRdaXnj+XvGFnsIbOshzHjR7Ts9wTcBGcTFehOZwtkBY3Ns5lCx9m2kqfc10c9wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Czb2tMM+hL8/ExpxHxdKem2pI+LOhiqEXGR/6kZRt0I=;
 b=SS8uEUg0w+1+NFsKpUa+TKqSwKhgg89uiTByxxnZThzIBmmDDk7swquiMbqhAZRmx3BnByB6PeUgVDCpsJSu4NwxWM4Eeipz/93x0R6/J9ks5LXdCZs/Els3txLLw5DT9r/Nx84S1uNx/aflm574ihBeR4J60ZwQAVqlhZ9KdUc=
Authentication-Results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW4PR01MB6146.prod.exchangelabs.com (2603:10b6:303:7c::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.28; Thu, 20 May 2021 14:24:49 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4129.034; Thu, 20 May 2021
 14:24:49 +0000
Subject: Re: [PATCH v3 7/7] bindings: ipmi: Add binding for Aspeed SSIF BMC
 driver
To: Rob Herring <robh@kernel.org>
References: <20210519074934.20712-1-quan@os.amperecomputing.com>
 <20210519074934.20712-8-quan@os.amperecomputing.com>
 <1621438164.118346.3134230.nullmailer@robh.at.kernel.org>
From: Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <d935935e-018d-f2b2-d129-60a37f85926b@os.amperecomputing.com>
Date: Thu, 20 May 2021 21:24:27 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
In-Reply-To: <1621438164.118346.3134230.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2402:800:623c:5f9b:6031:ff4f:8fc2:44d0]
X-ClientProxiedBy: HK2PR02CA0216.apcprd02.prod.outlook.com
 (2603:1096:201:20::28) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2402:800:623c:5f9b:6031:ff4f:8fc2:44d0]
 (2402:800:623c:5f9b:6031:ff4f:8fc2:44d0) by
 HK2PR02CA0216.apcprd02.prod.outlook.com (2603:1096:201:20::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:24:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51846f47-9d21-45b1-0ff7-08d91b9b060c
X-MS-TrafficTypeDiagnostic: MW4PR01MB6146:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW4PR01MB6146E89270DBCF6318AF5CECF22A9@MW4PR01MB6146.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cgm8s571/mWlq+4z3Qclmz3ggY4d1dMqfzaCKvyHIWrIw9HJlCu5mEKRbwU0zWiGLoW3FyEXeomtzHHGo6I7f+AxrimCOsu6pnj1MkfTb373f13mn8Ux6Fmg1gfzPq9WuoOE7Uj+eHZhlVRIpGw7GATF2tlpOZ+hacZg6CXXCFsWM6JN1algnVrrzEvrmyCeIg2Q5fo4XBWPipEFuqj1z06arYltfuUbJRgQC0thXF28Py6dY9utOTRDQK0kEhtPuV/WketIMx5G7uhIzD0o7Ei1E0EaXHS220B7WlCEKTwm3RFekHVAstrIUlm2Cgva2zfbYrvQ/lV86piC0+QTtkDaYhld/rLWk9B4qcGBFeBqmoIKLXwR90REWJbHGO2MYstfZv+FqkDnBSpfL8HMedyuQBUvNM7xGpPw54qHiFZKu8HA/v+i7rihag1DIVo3pkKgWLlGX+sNHfqc/cR0fFrYS23mTVAkNcHBtMrC8OOW0GS7og4CvzJnMfxCYCPus+TUxqMeHTb4aXMBdbciN2F+DK0IHXUPJFnuHD+0l6++VLa6kze+UyIGGH+a8BoUaMWAGF0q0B7ImwT14Wo6i6XfLx8+uSEUet8RqybFkMBD8bI45jvYi6CpLxALPgpRIhFVqgEpwc+Vc+bG5E3/q/C/kBraZtUIcdhWGt2rwh0nXLLSePiyKSZaimFv0VLhFD9YfEGBYUaci21szAaqKAx2GtD1WOWGsQzlHmuGalZ8g4OMi65tdWH/J2124VgJiKFqpklsxOgkWAVe5vULGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(376002)(136003)(396003)(366004)(16526019)(966005)(316002)(8936002)(86362001)(186003)(53546011)(7416002)(52116002)(66476007)(6666004)(38100700002)(83380400001)(4326008)(2616005)(6916009)(5660300002)(6486002)(66556008)(478600001)(8676002)(54906003)(31696002)(66946007)(2906002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VWUxTmw5ZTVoUU1OeUlSenp5ZnUyR0hMSi9UQ0I0ZG0zcFc5M1VROUhSSHV3?=
 =?utf-8?B?c2IwSUpLc003c0ZWWFltS3BaUWI2bWpYWEJnblhzRkxXbUN0ZkpWMGxPV2lO?=
 =?utf-8?B?WVM1Y2lLNk5wSGhFTG1WNUVvT3p1ZkZxMWJocnB2QlBWWDg0d2s2TkpXWFU5?=
 =?utf-8?B?SDA2cm1LRm9sbHpTSm13RTE3RXR4Mm1xbkRhSTM2TkhaRFkwa3FsVVlJVkti?=
 =?utf-8?B?M0JuTjNLNkJCWG5zLzZFNjhtOVowdG5GN0lYT2dwbGFoQ0xNUFJyc3VrWHZ6?=
 =?utf-8?B?S2RPZytIRmgwbkdVR2VUWlhJMUlhTjZYdzQ5NTc0dDRjQjNlNm0vcnFpTjZ4?=
 =?utf-8?B?eXJ5aTUvMzd1TC8zcW5XOWVjWEtaVjNSbU5tTWlzcWhlb1FoWXpBenVCSmUx?=
 =?utf-8?B?emo1T3RDREU0R2MxbFVuNlN2S3d3aWhrM2NRZ0VWUUVIZ1F3RjRkOVJjWkM3?=
 =?utf-8?B?STRJdkJzK0xYcnFQQ2J4azdGWWthWTkxSmxGWisycTlvTnFTT2hrZTltbDdF?=
 =?utf-8?B?a2Q2dnFMYTFCdWJ0V1hScnlDTERUYVRqcUZISzFyZFpMVFRyaXl2TC9JTTdx?=
 =?utf-8?B?MGdsUUw1bWg3QVVZaUxkU2RCWWNiTDh4dHR5cElYeDZJank5eEJrS3VsQzlI?=
 =?utf-8?B?VFNhWHF0WXI4RFFCNlo4WkhEaE85Z2p5TlVDeU5tVm5idDRXT1FrcXpoWUhp?=
 =?utf-8?B?U00xSFBoT0h1ZlM0T3AvM2lkRDU0K0F0Y0thc0VuOXFiQVZ5RXV6V1FMd3U5?=
 =?utf-8?B?WmIwVHN6TE1OemdHMU1TdGZTMTA1MG45WWJZL2NpQ2M4ZFlKUU9DNVhkbkxj?=
 =?utf-8?B?ZFRVZEZWNE10NXk4b3dZZjZHbGE4U1VMYjk2VnduK0p0V2xXTWVpcmt5MEV5?=
 =?utf-8?B?SVcwdDQwTXZlWVFKL205MW4zMnA5MTRLdC8wdDNZWGtwWGVrUHNWS1ZNMFFB?=
 =?utf-8?B?L3ZMR0pPRDFadHBtZlQwZjUyTVRVTzRiOUFHaDgzaHh6VkVkd0ZCRHdnT1Nh?=
 =?utf-8?B?ZkVwNk5XTGlOVlJRUkE5NHppOE8xamoyaFdzL3AzUEFHUmpGMkJsMy9EeFdF?=
 =?utf-8?B?bjd0OE9LMkFueEU5UDJyc1JIbW56ZlkzM3NmeTB6WEhzQUhDd2QweHhxcGJ2?=
 =?utf-8?B?Z0NBN2RNTFR0bHNNdFZ3TkF4eW83ZCs4aW5WTll4VHRLd0czWmxHdnhoZjRz?=
 =?utf-8?B?dUdwVW9BNVYxRXFSQ0E0UDAvZ3VXcnVZMURLSDYxNy81SVNTbjVMY09tVVkw?=
 =?utf-8?B?TDJKVEJiaS9Yb3FDNnU1Z1ZMcW5jVHFWcXl3QjBleWw0aE9ZL0tNMldLdlRF?=
 =?utf-8?B?MkNZRUxhOGMzUldnaGlZcjBlRzdoQk03dU95S0hrcXlZcGFDYXcrcUJXRjkv?=
 =?utf-8?B?RnZxcVVzWldVUldMU3hvL1BxQmJlNUgyeWlzZ0Y2MFdRRUlMUHdGVlRZSnhX?=
 =?utf-8?B?U1VqWXcxZzBDbjA4NU5pazdOaHRQcTdmbVlsbzZXZ0hJNVVHRTFOYXRQTUg0?=
 =?utf-8?B?QXB4T0NiTG9vME5odW1YZmFHeGIwWEM0MUZwNG1DdGppaDZlOERUeUdMUFdp?=
 =?utf-8?B?T282VGtZdTJtUzNrYnN4ajJlbk9CbW0ySHZZWCtKd2pTZE8zdU1IY1FDWkM2?=
 =?utf-8?B?dG02NXNPZm5wZ2V6QU9DWHM4Q3dJM2E4SXhYL1RydVphYlZTamw5Qk14ZldP?=
 =?utf-8?B?UnhjYUtxaFFIbGc1blVtN3UwanQ4NjBqU3RmTm9naW4wbXU5Q2IwaTRqUGZE?=
 =?utf-8?B?c2l4Z2s4d0hWbVBURDNPZlFxcjFOSC80NlhaYlgyT1ZBandpYXY4bEhMekRv?=
 =?utf-8?B?dDZuWjhnR0MzL0M1c0R1YWkya1VGNnJxRWNYU1l3N3dNWXpZcGlMTjE1WWZJ?=
 =?utf-8?Q?yRXW7yhYMsjQQ?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51846f47-9d21-45b1-0ff7-08d91b9b060c
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:24:48.8428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yw+BgjxxQKv8OI4FxOPN15npAQfSJO+287eiAQv+DWKqcTFbxpsFA1+jEAiHHGM8zZR3hZTGKYFDb9BNH0z8u3kIGH72ttf6VsbYsAb3TOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6146
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
 Corey Minyard <minyard@acm.org>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Phong Vo <phong@os.amperecomputing.com>, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net,
 Open Source Submission <patches@amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 19/05/2021 22:29, Rob Herring wrote:
> On Wed, 19 May 2021 14:49:34 +0700, Quan Nguyen wrote:
>> Add device tree binding document for the Aspeed SSIF BMC driver.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>> v3:
>>    + Switched to use DT schema format [Rob]
>>
>>   .../bindings/ipmi/aspeed-ssif-bmc.yaml        | 33 +++++++++++++++++++
>>   1 file changed, 33 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.example.dts:21.13-26: Warning (reg_format): /example-0/ssif-bmc@10:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
> Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.example.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.example.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.example.dt.yaml: example-0: ssif-bmc@10:reg:0: [16] is too short
> 	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
> 
> See https://patchwork.ozlabs.org/patch/1480727
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 
Thanks,
Will fix in next version.

- Quan
