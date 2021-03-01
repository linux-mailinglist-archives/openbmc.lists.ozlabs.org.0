Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB0B327E8B
	for <lists+openbmc@lfdr.de>; Mon,  1 Mar 2021 13:46:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dq0Pw2r2rz3cQf
	for <lists+openbmc@lfdr.de>; Mon,  1 Mar 2021 23:46:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=VdL9Jmsj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.244.103;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=VdL9Jmsj; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2103.outbound.protection.outlook.com [40.107.244.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dq0Pc5nQsz30LZ;
 Mon,  1 Mar 2021 23:46:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SH74+kRDxQUUmd1/r8AtMrhvdjHLXV6ArVrxCRA0l0fmqLhNaCqqV12/RB6KvjIO/K9hKoblYW+0W8xiUCc8hvZ8gW3ZobiBc/XHeFIOaZZjslQ2l8h0byrC7dzb2mXhrvVMScOF/HEIVwAYpNLSbxvPIMEvzCCawHGzYUwDXh714uNEoDLizsIInVij2CFEZNehZOS4WHMBlnn+D1agyIl1PFMh1tjE1lrZIyuRQJTmCUSTuQzDMBRng4x0AXv2SgrJsASdOTOHJrFV0BzVNPl7Pp/L3xWEwWvIuV0t++1FJrf2LRobY5f4I7IUFf6tuvEHV3A0BOjx/MRapibqtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guj5ZvMxk9PlGkADhiHwbUMQ51dQ3aBSm26frPeNQeU=;
 b=MaRPfABuxuQUrtIf3o6W1fFbAmFRX7uuolgMvYaUgciXCpN48p9nrCAvnEhCTfqdoWMihz/ujMrmADph4qTYU9fSQ0OsQwNU32xcKOpqLvoFnkZ2GOxBQNNjGxVrsKgWNQqYsxa7gXJsX4Y4yZQyAKtn9OXbQym/YTKvm4FeRjcoUNPuVnc8rbFSbQfIu4QztPDqQKBshQz4giT/SVriK4YZX76H5BrAYQj0uD6q3t/upSOomJ97RKKhaVaOvdml7+NsMouCP1MAVHuwYNuubDdl/sVQaeyau4SvP9fUKbH6oczPLbQ9JMCwGr+OPoUgOic7SRputIsfd8Kmcz65Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guj5ZvMxk9PlGkADhiHwbUMQ51dQ3aBSm26frPeNQeU=;
 b=VdL9Jmsje0iydCzot3Poysgmj6BzXWakEaH7h3broMCb8EKCXDUqqAZkd2WHMWLtUwt7Wxh6ldESEACYtbuMmGP3399XrDVJarUksbW0ZFKZg6HlB9ifilkLwc4VrtGkf3VQbp+du7KYZz5hHMIA6cujeW91TEvEQx8xbJyU2dE=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none; os.amperecomputing.com;
 dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR01MB2720.prod.exchangelabs.com (2603:10b6:300:fd::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.23; Mon, 1 Mar 2021 12:46:19 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::682c:4e20:b53d:e660]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::682c:4e20:b53d:e660%7]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 12:46:19 +0000
Subject: Re: [PATCH 2/4] mfd: simple-mfd-i2c: Adds Ampere's Altra SMpro support
To: Lee Jones <lee.jones@linaro.org>
References: <20210225101854.13896-1-quan@os.amperecomputing.com>
 <20210225101854.13896-3-quan@os.amperecomputing.com>
 <20210226083114.GE641347@dell>
From: Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <f4b00f4c-6e6c-810d-d16d-5d01ebf4d36d@os.amperecomputing.com>
Date: Mon, 1 Mar 2021 19:46:08 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
In-Reply-To: <20210226083114.GE641347@dell>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2PR02CA0168.apcprd02.prod.outlook.com
 (2603:1096:201:1f::28) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.33.120] (118.69.219.201) by
 HK2PR02CA0168.apcprd02.prod.outlook.com (2603:1096:201:1f::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.20 via Frontend Transport; Mon, 1 Mar 2021 12:46:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3ce00d6-1599-41f5-248e-08d8dcb002d3
X-MS-TrafficTypeDiagnostic: MWHPR01MB2720:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR01MB2720258E3EECFA95A223ED40F29A9@MWHPR01MB2720.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V0KBaay5DVObAVOelw2zyXGUe5CcfvutSp2W3yTdZcyJRF6MVnvhXndOUs2LoKjw7/9InOZVmNk32BdicquYWYlRxH1whcbZKhxG6D+6Fcw15PKPJOrIYvX/jIt49Ral2OyLok8LcF67kIOephdWS1dt8asU2MCmPiE/RmF2Lp1FI6kN+B16YYMmw+Ue2A8Tw6QhlqbZkOpmCmng6Kyo23IEJgfhcTChiLpf9qtuvWWIaZXnZW/CBz1BCuCqb2TYfYiQYD8DKKMkjO/xUTdmk3Fy42RCuCbdJMabiO3Ot4/wI/P7KQiXlIqBO8rw9QculJNilV3HeNG/3MlO5oKNJ+E2E19Dr2nDWjYuVAwiJcqDnRou1himWob1AGld5/xRbKoE22J1VnBDxOMrI+cc9N74Oc1UvSm4BVJq96fQOpDRN8Ci19VIGzOdgDAcoBffZc2iEII9RTu9mn8IxZm2QxsqcsOlngSRkDSxSep9orbnAQn/H+nVWUODk4msEGEudJKbWgb+SjT40gcXoezGYcWqBbCuUqIQcahu0gEMCHzcifQkCz1YdeF1OOgDuG4CcT4Q0fnZmmveEHHHEz6+FoWPimla4rZJ7E/WgppWWn0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(396003)(376002)(346002)(136003)(83380400001)(16526019)(186003)(26005)(86362001)(31696002)(8676002)(8936002)(4326008)(6666004)(53546011)(107886003)(5660300002)(6486002)(478600001)(66946007)(66476007)(66556008)(956004)(7416002)(2616005)(54906003)(16576012)(316002)(31686004)(52116002)(2906002)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZHB1bmtZNm0wOUhLOTZpSS85dGs1c0F4azFjMk9aTWhaNUl4SVErWFAzTktq?=
 =?utf-8?B?YVVOd3ordEI2YmJsMkwxdzBpaVY1aTJGeGxKWGpCcFNxTWdnUlFOVk5MUHFm?=
 =?utf-8?B?SkJPYkl3YW5WeS9ySEpZMUJJUFJ5ejJtRHVPSk9jOHJiQTF6MlhEdmE3WXkw?=
 =?utf-8?B?ZHRMLzV3Z1E5ZzlBVmJmdHpYS2JiNVVkNjFERVpKTkh5dHJoajAwODZZR1lI?=
 =?utf-8?B?TnFZVDAzSTlKU2k5WlBPbjA4YlgzU1dxM3YrT00vZmxWVmpiWkpPQ3JZc1F0?=
 =?utf-8?B?MVhIYnYwcHBiVWZKWTM1cWpmeDNndmF1WUl1MUFKVFRKcldZQ0RaazVRZXpa?=
 =?utf-8?B?QmRBQ1lVL3Y3cjd4VlVzOHBsbHRpWVVNejFNK1JlbGQ0OWRHYjQ5aUVmTldE?=
 =?utf-8?B?cTVhVkhkcERvUS9yL2ZRN1JNQmJKa2Joekk3MU5mL2FnV04vYlE5ZXp0ME0x?=
 =?utf-8?B?c2RIS0RqdXlIZ3Q1bmI5WXZDQUxmYlh0dCtJcFUvWldDcGFBbi84aHh3YXlN?=
 =?utf-8?B?L3ZEOFNKSHY0MTNYZ21NeWFicGF1OTV6dlZtU3FJRE9nR2Z1WHQ5a3craWk0?=
 =?utf-8?B?cktSUDFFQUo1Yi9KeDJrOEpiUjhuWGVUZkdJQXFLcWtXYnRRNERXSWRBSW5I?=
 =?utf-8?B?OXJPWmxUaXlFNjNpZG1wOTFvUElsc3BtQ1VyOC9ZNXFnRU5sa01iYkd6SDRQ?=
 =?utf-8?B?VjdSM2YreHcxRVhvdklLNVFDVnpTbFdMSEMrN200SmJqQ2hWVWZaQmE5dlB5?=
 =?utf-8?B?S08vVUx1YXQ5SnZPZy8vaEw5SzhCRTdQb3RMWUh4UC9NVCthcU53SGhUeTJJ?=
 =?utf-8?B?VzlHU2hiaDhmL2V5SU1qUExsM0dJYlIwVE1Sa1BtelRJaEttV2kyckpJbTc5?=
 =?utf-8?B?eTJJUE1GYTErSnlKOW9yejRRWlNFOEloMlNGbEpHc0ZCTVF6emdXdnR3aWFO?=
 =?utf-8?B?a1JaSTB0WmdJc1hCaWZkZlRXb29kNnVWTE1EMVNhWXNrNEhydlBwSHNrcERs?=
 =?utf-8?B?YUNMZ082cnFidWpReE0rQzQxODBCMFhleTZuK01oemN1dmgrT2tvT05HRFdI?=
 =?utf-8?B?Y1FMVG56Z3pxMnIzZnpvUUxNbnU2WmNKcWZRc2V0aUkvNzJWWk9nV0k4WGU1?=
 =?utf-8?B?WU1kbVBiRnJvTGt4MXNlRkdObUU0N2pXOW5SaklwNG1DRTVRRlFaaTV6NHJa?=
 =?utf-8?B?UFdrNU8wUlRXaVBmdmRCY3lqcEpXN3BOMGFNQ0xLdzVvYmVPakZQcWRZelg0?=
 =?utf-8?B?anRxVlJnTjAzOWpaKzl1SFcwQlRkMExZL2t6OGNkUm8zQUl1d3h5NGZMYm5p?=
 =?utf-8?B?MG52VkorYzQrMzFxK3BjajU5VVgzZm9idk9GMGdPSmpQUzE2RnlJcG5vSWVI?=
 =?utf-8?B?UFQ2Wm82eU9LMG5oQUdXQWw0K0dzVUlBZEh3K09YRjNscVpxdG94OVBuRjk4?=
 =?utf-8?B?eEFPanU2OERFUmR4UXREOHlkRmdGRDgvODh3NGxPSmZDZ0s0QVBPMnVaTDR2?=
 =?utf-8?B?VVpGcFJMRG9TQjhLRDRVb3pDZVFhMG52bmJyclFtaGZRMDg4MTVOZjR3RkxG?=
 =?utf-8?B?VmtyYUtNUCtZVnJwc2I0WXpQYkZiVUFGQlBVN2d6STkzdm1zZ2wxZlVtZzFZ?=
 =?utf-8?B?b2tPZHoyY1VpOWZ0Wm5PajZwRXNYeGM1Tkh2MTFONmUvdHpxdHNycGFFUFhO?=
 =?utf-8?B?NktrWU9Sb3JYTnJnLzZHSGEwT2FKVkFKZkluVk5HQ0lHMkdqdGRWb0dxanM1?=
 =?utf-8?Q?RklODXOBsyQbKsHPVnJYBTOd5dwV8zLJOWyJpK2?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ce00d6-1599-41f5-248e-08d8dcb002d3
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 12:46:19.7299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hiJ7K4wi5e/aqydDEKPRZrpRCQ6WGOF3ktq/w4qTf1GRqWihVEI3zJEI4wYt6tRiHKC3hdKqgsF+wpMapKW/KRnvFeO3epy/Y4BO69/McaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2720
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
 Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>,
 Open Source Submission <patches@amperecomputing.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 26/02/2021 15:31, Lee Jones wrote:
> On Thu, 25 Feb 2021, Quan Nguyen wrote:
> 
>> Adds an MFD driver for SMpro found on the Mt.Jade hardware reference
>> platform with Ampere's Altra processor family.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>>   drivers/mfd/Kconfig          | 10 ++++++++++
>>   drivers/mfd/simple-mfd-i2c.c | 15 +++++++++++++--
>>   2 files changed, 23 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>> index b74efa469e90..5414371bdea1 100644
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -77,6 +77,16 @@ config MFD_AS3711
>>   	help
>>   	  Support for the AS3711 PMIC from AMS
>>   
>> +config MFD_SMPRO
>> +	tristate "Ampere Computing MFD SMpro core driver"
>> +	select MFD_SIMPLE_MFD_I2C
> 
> Nice to see another user here.
> 
>> +	help
>> +	  Say yes here to enable SMpro driver support for Ampere's Altra
>> +	  processor family.
>> +
>> +	  Ampere's Altra SMpro exposes an I2C regmap interface that can
>> +	  be accessed by child devices.
>> +
>>   config MFD_AS3722
>>   	tristate "ams AS3722 Power Management IC"
>>   	select MFD_CORE
>> diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
>> index 87f684cff9a1..0459a9fbd3f5 100644
>> --- a/drivers/mfd/simple-mfd-i2c.c
>> +++ b/drivers/mfd/simple-mfd-i2c.c
>> @@ -21,14 +21,24 @@ static const struct regmap_config simple_regmap_config = {
>>   	.val_bits = 8,
>>   };
>>   
>> +static const struct regmap_config simple_word_regmap_config = {
>> +	.reg_bits = 8,
>> +	.val_bits = 16,
>> +};
>> +
>>   static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>>   {
>>   	const struct regmap_config *config;
>>   	struct regmap *regmap;
>>   
>>   	config = device_get_match_data(&i2c->dev);
>> -	if (!config)
>> -		config = &simple_regmap_config;
>> +	if (!config) {
>> +		if (of_device_is_compatible(i2c->dev.of_node,
>> +						"ampere,ac01-smpro"))
> 
> Could you use 'struct of_device_id's .data attribute instead please?
> 
Thank you, but I'm not sure if I got it right.

Do you mean we could use .data attribute to get the expected 
reg_bits/val_bits values and translate them to simple_word_regmap_config 
without the need to match the compatible string ?

>> +			config = &simple_word_regmap_config;
>> +		else
>> +			config = &simple_regmap_config;
>> +	}
>>   
>>   	regmap = devm_regmap_init_i2c(i2c, config);
>>   	if (IS_ERR(regmap))
>> @@ -39,6 +49,7 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>>   
>>   static const struct of_device_id simple_mfd_i2c_of_match[] = {
>>   	{ .compatible = "kontron,sl28cpld" },
>> +	{ .compatible = "ampere,ac01-smpro" },
>>   	{}
>>   };
>>   MODULE_DEVICE_TABLE(of, simple_mfd_i2c_of_match);
> 

