Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C54346AB386
	for <lists+openbmc@lfdr.de>; Mon,  6 Mar 2023 00:33:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVJ0v4pcdz3bjd
	for <lists+openbmc@lfdr.de>; Mon,  6 Mar 2023 10:33:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=akSBuUsP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eab::706; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=akSBuUsP;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20706.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::706])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PV5xg650gz3cBF;
	Mon,  6 Mar 2023 02:59:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIL733nuE3JqNXVU8kbXf5H24bS/1MeNInTGnzxcnlUq1hkfJP1PtGmhYgvpbxljIEAETrjgr87V1Du8pHvNdW6xmSBJPZvsdetdUnYmBXgWwlNtOF8OL2BBmaVPkKHVylE55nBNkkMZzrQM2pPs42sE9C/lz8tFX04U+qb9AfhbOWGGs/t0g4CET74f+Bp67gDnFRjM1DfTifcdPJAnotwW2fBiCcbWkr613szSfL5puc34HMraJ37Pt0Ec8b9sN3iXifKEUFa/rJ3qdi+XnngPI2bOzaE7gSrgYgJ9TKk0+ofZb7dB/9iyGyRA10MYf0bYVdAUnLrl3zZDhXqp0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8KAazWr8bzih0StHuM0uGuwRVNUUEcAdBzDtQJ9ZTg=;
 b=DOEFHX9XrKxuILMCkwRh8g19AI4+NF5gLXanlqakNJgKSEYq6wEzsPLZfr+OvYdJiHn+eig6YWshsppnAXvsc9pRyOnCgfcobMUup+iNIiPzTAjaEWq7Ol4VtLg/CmyGACF34YxIoNrRT1wXuJvF8gIZ56tSq9uQvz+G1kVMJir8dquv4R23zFiCFFq9TMM80hwCNizr4KbEKgJzGPc8PiLxgCaf9AUfv3ewIQlrbrtIpEyjTKLtNt0Gb8x/C7EV8LBr2noXhdYYRPrYUUa0aCubOila3BoBr22T48bn7RJk032DuRQwGfxFOAAiLi3AaeRj8jSylOIhbt7uLgMfLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8KAazWr8bzih0StHuM0uGuwRVNUUEcAdBzDtQJ9ZTg=;
 b=akSBuUsPf9oakYlu3xQHBA0CRf+1Rhj5ngoPrjESbl4fYAuaGuTG9Uys3JekTXjQ/ZdxThgVv82fqZWFPfz9KuxVfMj/Vn5A7RjJEv/IA8Gbb23pLZ084/mwiGCi/k7t7w4h0u6lydZAQ4WeR0yXAHrqAQYC1XL9sRVg1uavWJI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from SN6PR01MB4973.prod.exchangelabs.com (2603:10b6:805:c4::13) by
 BN6PR0101MB3138.prod.exchangelabs.com (2603:10b6:405:2e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.29; Sun, 5 Mar 2023 15:59:09 +0000
Received: from SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::a807:4f38:56ee:b079]) by SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::a807:4f38:56ee:b079%6]) with mapi id 15.20.6178.013; Sun, 5 Mar 2023
 15:59:09 +0000
Message-ID: <8033851a-6eaf-e4e7-5e80-0a1f7331c67a@amperemail.onmicrosoft.com>
Date: Sun, 5 Mar 2023 22:58:57 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2] ARM: dts: aspeed: mtmitchell: Enable NCSI
To: Paul Menzel <pmenzel@molgen.mpg.de>,
 Chanh Nguyen <chanh@os.amperecomputing.com>
References: <20230228102820.18477-1-chanh@os.amperecomputing.com>
 <775059b1-4697-b745-4743-55f7f7a9143e@molgen.mpg.de>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <775059b1-4697-b745-4743-55f7f7a9143e@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:196::12) To SN6PR01MB4973.prod.exchangelabs.com
 (2603:10b6:805:c4::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4973:EE_|BN6PR0101MB3138:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b2e3191-9e8e-4627-020c-08db1d928e38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	L5a180dP/Vg4Ji/D5JT65hL99LQ2dUzggVu/n5XcNXQzc2MRYh0YKvyF0jAg1E3AmctBfl8fM5L4atrNSl+0pz4hddaMp70OL/E9FDreSbw6Hcw7aA3uxNUU83wvw33dJYjkWMMb+jqY7QscTyGdJAeGRF3sXwqdYNDSKvfBWM3jK/obX1diiAP7TN3P2ezC3nc9UQnebNuNJcH8hMUHZWnDNbViDwifOnL+cDyTWaNU/AIEAn+FI+0mJxwsGVsprY5MsdunpetdN+OvontCi8h4PG7BSVqyGg3DPGSgfZGT471Tbb4noM98k33BCIewtLRmyA8clQAdTzB/44d6/ozLIhKOaLfUzDV5SFP8/mMnTUXpBadFT/a+O6YQkzlfxm5dAf21kYLB9/iqDhmJbHgAlSzHCY9INne/JDIgd+daBuLCBsEY047W1kX7jfE/PKySPtDjHZOLGzieG+VZ1TxBpt7Xc7T3o3d6IzhuI+jFpQT3+h1CTkwb6iJN3VTdpBd6SAj7HYeucvPgtBxwCb8YtNNpx+F4sYNt4neP7n+ynMc/SuXCwb1m8cdDR2F00Sk4NmjOxQlouH+PY5wEChMiN4fuKbWyXbyBs4+Iu3gAIY69TMDh3s1sFMKMATo5kPl0f679jnCwCKd0sB6uEzCb74C9H9wW6dWbxHHpXktBKNTvaGpEXugFvLb/Yk6WzxmCOu1XKJ2S5t5eG70VLFgsCUXNRJFSxgBpmkvAQ84=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR01MB4973.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(39830400003)(396003)(346002)(376002)(451199018)(2616005)(6486002)(6666004)(478600001)(31696002)(316002)(38100700002)(110136005)(54906003)(83170400001)(31686004)(83380400001)(8936002)(41300700001)(26005)(6506007)(53546011)(6512007)(186003)(42882007)(2906002)(7416002)(5660300002)(66556008)(66946007)(4326008)(8676002)(66476007)(449214003)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?eSs3eW5JbGZVS1RwNmZVcURDU2t0aUtQQlk1UjZYTnRqYUE0YkxnQzBUU3da?=
 =?utf-8?B?ZHdJYUhqNDFQdEVVMDYyeEZTRStmb29GV0U5QWhPbWx0NlA3UHRXVmxlcjVT?=
 =?utf-8?B?WEZpMDFUZmpOazlQT2JUUXpJQXJjOG8rbmlxUW4yU3I4QzNXV0pSbENZdWJ5?=
 =?utf-8?B?TDFWNHdlZlZrV1RpU0FzWVJPY2RmQWpKSlVHaDhMZkNsVkUyYlhVbW8yMHZw?=
 =?utf-8?B?c2JrSXJuQi9YcFRrTVpCWW1hRVZHUzBBdnVPSjhhcU5oZFhuVElVRFB4Wlp3?=
 =?utf-8?B?VlI5TUh5bE1GRzM0aUpXWlR5YmtpUG8zMHlBRHpGOW5YZ2NqSmZKbm1vMEUy?=
 =?utf-8?B?dzZUTW1NNnp4cE1wVE5ROEVuckh5MC9jdGFhUytGcnJBMEYySVYvNnJaWjM1?=
 =?utf-8?B?b2k4TjhBSlhJTjhZdERURmREMmg5QzVpZ1k2ZmpwcGRIWml6VU9LbUdHRUhj?=
 =?utf-8?B?QlVJTkpaTytUeEtFU2pzekJoK2V6TjF3MTBYUFhOdmVBNzJEbllzS2ZGQk9T?=
 =?utf-8?B?L3JpK0t3U1g0dkxvREJGdmdJcEcwUnpURVAwQjZEcFF2dDZhZWJ4RUJXMVd1?=
 =?utf-8?B?enVleDhhMGVXcFNYUGFnbGdWUFFnYUFwcDIxMWlSdG00dmNXVForaHF0c3Nn?=
 =?utf-8?B?bzJOdEx5eldCOGg4S1dIYjd2bjdEa3R6RG9xb3gyY3lKaUd0TjV2Mm1XamR6?=
 =?utf-8?B?UmJ4WUh3RzF1SVA1TTNLWXBsbWd2L1ZnWi9TUkpjZHNzYjlIajZ6azBidGh3?=
 =?utf-8?B?USsrMm05bmtSRFdlUU1mYzZDVXBidEJEVmcyd3BaVHJBeXdMYW9DR3FwenhT?=
 =?utf-8?B?c2c2WldsaXdVK1Z6emFzNnQrMkNySXdYMXVtSFA2WTN5Wm9tWWQ5ZWVLMGNa?=
 =?utf-8?B?QkRlUmR5S05tMC9ZWnZyQnptcXJRVWl5cjV6MllUbXJERVFIczV3cmpFbEdj?=
 =?utf-8?B?aVI4OE9vNkdyM0hKNWlGK1R1TzM1NTZqc25iaHNLaG85MVNpeTlFOXZoSkxN?=
 =?utf-8?B?Ums3ay90NjMrU1hncUFsMmxFYUlHMElJWXpMTzQ4NENpQWZvVUlJL3RENUJq?=
 =?utf-8?B?SjN3cVgwbVI3R2k1OUlzTWlEZkhYdlpBcmdtaUhESWxDaGV6RGlKTFg5MlNL?=
 =?utf-8?B?c1FHVS94L0pnR0NFNzZYSXREd2IyN2pQL1FKVVkza0lYRUZ0bWlnMkhGSDV3?=
 =?utf-8?B?MXVqY1hFMVNvUXplN01QWjRmMXlXMEFPUWIxTkxXbTBUKytjYmV6SnRpc0xo?=
 =?utf-8?B?YnBKZ2pmMUppS0lIOFlvNmxnZ0hSK1BhcHlMQ2JFclFUY2IyVmkvNHFiaHNi?=
 =?utf-8?B?TTZTckowOHFSUHdyNUZGc1NTODJxNC94TERrL3piRnJWMWFYMmZNWkx5VXF4?=
 =?utf-8?B?MkI5ajdkblJycXVhbW5HS3J5T0VyUk44ZW5tNW40UFZDL2pPUE5wT0R3Y0Vw?=
 =?utf-8?B?d2EwaGxDeVVjeXNlTWEyQytmRTNvUTJEUGIvWTI3YjRmcVlJemd6TTluUkVB?=
 =?utf-8?B?cksrVG9oZnljeXNoL3ZhSFNIMHJzMWVwdnF5UldGczB5aWQyRkxCVDRQcklT?=
 =?utf-8?B?SDY3aVlXelZjSFBTN25DU2NJT3lEc25FQWNrWit6RjdDck9vQ0dXUERiZENF?=
 =?utf-8?B?MytsaVZVZ1d4U1N3Smd4SGZjaUhQQ1Z0bkF3Ui9Ja0dZc2pJcDhHdGVCWndh?=
 =?utf-8?B?WldpclFEZFBxZGZxaWFJbDl2eWpyZVBlK3ErRkIxMXpFVmdaUXJXSlJGQXZR?=
 =?utf-8?B?UFV2NlRQdFVDRVZtL056emRmUDNJREVoaGN1S3NRK0c3NEpKN3dtSER4d1BL?=
 =?utf-8?B?VTc3cEhVT3l4RVhXSEN0WkV2QUdpSHlIVWJmTlVIeU5Ub29HeEZOQmJlYS83?=
 =?utf-8?B?UWt0Qm8xenJUNUs5U3lRaU54VW1DYXJTTVZSWUFiL1BwMUprMDlYbU5WVW5h?=
 =?utf-8?B?SzhYeUtnSlE3NzhaZEN4ZTJPZTk4aThtK1VTcmFBUW1MMTczMVVjbFRYbkx2?=
 =?utf-8?B?bWlBSm9SejFRYW5xM3lQT1NXZjl6ZGw1MkNVcGpNbUJVUWV6U0JSVlVaTi9r?=
 =?utf-8?B?UW02bWVuY2MyeUlDQ28vZldLTWRkeXpQeGY0QmFHSXBNK3F4Ykw3c2JrM0lL?=
 =?utf-8?B?OXpZeVNOdzVnSlJLbGhRV1ZJalp1b2ZvODRxVkQ0aEsxWnZia3Q2SWNZcG16?=
 =?utf-8?Q?EzaJm9yl6Ep1c3qhhWSKfK8=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b2e3191-9e8e-4627-020c-08db1d928e38
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4973.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2023 15:59:09.3241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOkOqp5rQEFtjCYK7tAUzM7khBfX3fYqoQ5zdDhlC4TYZQv33Ne0+jiY9qRMsBRu+nP5oYAcMpouDpgUkd8a+Mx/laoo4wDcBnnmAGFeniurF+4lD2whdKz9UmMTX2Ba
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR0101MB3138
X-Mailman-Approved-At: Mon, 06 Mar 2023 10:24:04 +1100
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 01/03/2023 14:51, Paul Menzel wrote:
> Dear Chanh,
> 
> 
> Thank you for the patch.
> 
> Am 28.02.23 um 11:28 schrieb Chanh Nguyen:
>> Support the mac3 (RGMII4) as an NC-SI stack instead of an MDIO PHY.
>>
>> The OCP slot #0 and OCP slot #1 use a common the BMC_NCSI signal,
> 
> *the* seems a leftover.

Thank Paul,
I'll remove it.

> 
>> so we use only one of them at the same time. The OCP slot #0 will
>> be enabled by PCA9539's setting by default.
>>
>> Also, enable the OCP Auxiliary Power during booting.
> 
> Is there a reason not to make this a separate commit?
> 
> 
> Kind regards,
> 
> Paul
> 

I wouldn't like to separate it.

This is "Enable NCSI" commit, so I would like to support all configs, 
that make NCSI feature works.

Thanks,
Chanh
> 
>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>> ---
>> Changes in v2:
>>     - Change PCA9539APW node name.                     [Krzysztof]
>> ---
>>   .../boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 37 ++++++++++++++++++-
>>   1 file changed, 36 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts 
>> b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
>> index 4b91600eaf62..1e0e88465254 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
>> @@ -251,6 +251,14 @@
>>       pinctrl-0 = <&pinctrl_rgmii1_default>;
>>   };
>> +&mac3 {
>> +    status = "okay";
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&pinctrl_rmii4_default>;
>> +    clock-names = "MACCLK", "RCLK";
>> +    use-ncsi;
>> +};
>> +
>>   &fmc {
>>       status = "okay";
>>       flash@0 {
>> @@ -439,6 +447,26 @@
>>       status = "okay";
>>   };
>> +&i2c8 {
>> +    status = "okay";
>> +
>> +    gpio@77 {
>> +        compatible = "nxp,pca9539";
>> +        reg = <0x77>;
>> +        gpio-controller;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +        #gpio-cells = <2>;
>> +
>> +        bmc-ocp0-en-hog {
>> +            gpio-hog;
>> +            gpios = <7 GPIO_ACTIVE_LOW>;
>> +            output-high;
>> +            line-name = "bmc-ocp0-en-n";
>> +        };
>> +    };
>> +};
>> +
>>   &i2c9 {
>>       status = "okay";
>>   };
>> @@ -530,13 +558,20 @@
>>       /*V0-V7*/    
>> "s0-hightemp-n","s0-fault-alert","s0-sys-auth-failure-n",
>>               "host0-reboot-ack-n","host0-ready","host0-shd-req-n",
>>               "host0-shd-ack-n","s0-overtemp-n",
>> -    /*W0-W7*/    "ocp-aux-pwren","ocp-main-pwren","ocp-pgood","",
>> +    /*W0-W7*/    "","ocp-main-pwren","ocp-pgood","",
>>               "bmc-ok","bmc-ready","spi0-program-sel","spi0-backup-sel",
>>       /*X0-X7*/    "i2c-backup-sel","s1-fault-alert","s1-fw-boot-ok",
>>               
>> "s1-hightemp-n","s0-spi-auth-fail-n","s1-sys-auth-failure-n",
>>               "s1-overtemp-n","s1-spi-auth-fail-n",
>>       /*Y0-Y7*/    "","","","","","","","host0-special-boot",
>>       /*Z0-Z7*/    "reset-button","ps0-pgood","ps1-pgood","","","","","";
>> +
>> +    ocp-aux-pwren-hog {
>> +        gpio-hog;
>> +        gpios = <ASPEED_GPIO(W, 0) GPIO_ACTIVE_HIGH>;
>> +        output-high;
>> +        line-name = "ocp-aux-pwren";
>> +    };
>>   };
>>   &gpio1 {
