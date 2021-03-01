Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D23D7327E4A
	for <lists+openbmc@lfdr.de>; Mon,  1 Mar 2021 13:29:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dq01t5Xpjz3cYR
	for <lists+openbmc@lfdr.de>; Mon,  1 Mar 2021 23:29:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=o5ihlqvU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.68.118;
 helo=nam04-bn3-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=o5ihlqvU; 
 dkim-atps=neutral
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680118.outbound.protection.outlook.com [40.107.68.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dq00m4lSrz3bPK;
 Mon,  1 Mar 2021 23:28:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYMcxVTkIaINalHVkfMbVJSqBqB163ljLRYaXRBqr3pouoaqsEzodCxHfaWiNWgk83WuFQSPmEVHkF6VXMe3GoLWTyz5uTNxO7ETtfmcnIJUMBtMPGCw4Excyr6a3f389Kzjp/fIsbZQEGJSg+EfJ4/Rd0H7x/XwL+7BI/WwY/T61ZnBEUHA46R/v9xUOxRcGrJEl4Tshsf0VoBZ/AJXUCCqbVv+SSu98ADCM3yhE9BEf+lgCeuntxQDPgdOTQwq6hx2C34/rbGxab+3ng5DmO7jaVkR3tO5zK319yfvhJauRi4EaWV4etZZr9YFONuNkEYNSF9rQ1pvrtq6eTw3AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HvgJdm9WTgdxqG4sVhrA0Qge2THBuWhNAEsD77i4dI=;
 b=IET3X34AHXPqZYHt0Hhqab34LapIc2Fy29CSHYjXLaCSUw7RP1YFZxiOmXCJid1udveHvz/Y2mfEKiwnEXouW3be4kyJGx6HVujfW5R1fpH+mCobc3O04nulnESVbtGzegt23e6rszm8i7PdWYfzNvthNbc0Gbnn4iaOJ3+aDbHO4WcK94tdUM2B7AVbVwfVVKwZB7DFMuMIGyCzNlZpG/220/qScmcYVHGvLFqZ7ixpB8HosI3+f7ldOEJcUfUdH0JsMTzm3N9Nl/0bxwec5ZWxgKaInKmeFVULFoi81F+MBBsHjopcVNeW2PyHl3T51eF6oiha0RBnrjAXMNXomg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HvgJdm9WTgdxqG4sVhrA0Qge2THBuWhNAEsD77i4dI=;
 b=o5ihlqvUcdj5pHBJe4sid5WrInvyxbmUrO2Dw+5QTNCsrf1CUYDcTIsAQdjIbcYKXketPS5j+yAhCBv+vZST8MZEam6PakLZzstVDyD7O5jz0xf7+HYUP1qpAqCTXEWHtiO96OuOgwLlCwD+AnKLg48ipyq80S4nSn4luPVkHH4=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none; os.amperecomputing.com;
 dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR01MB2271.prod.exchangelabs.com (2603:10b6:300:21::8) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.20; Mon, 1 Mar 2021 12:28:19 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::682c:4e20:b53d:e660]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::682c:4e20:b53d:e660%7]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 12:28:19 +0000
Subject: Re: [PATCH 4/4] docs: hwmon: (smpro-hwmon) Add documentation
To: Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
References: <20210225101854.13896-1-quan@os.amperecomputing.com>
 <20210225101854.13896-5-quan@os.amperecomputing.com>
 <00d6d57e-86a4-bd61-335c-3ff42c0dc1f7@roeck-us.net>
From: Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <91003e1e-611c-bb43-00d1-7d1b7a710c99@os.amperecomputing.com>
Date: Mon, 1 Mar 2021 19:28:10 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
In-Reply-To: <00d6d57e-86a4-bd61-335c-3ff42c0dc1f7@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HKAPR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:203:d0::17) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.33.120] (118.69.219.201) by
 HKAPR04CA0007.apcprd04.prod.outlook.com (2603:1096:203:d0::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Mon, 1 Mar 2021 12:28:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 551ecaee-2573-48d1-2490-08d8dcad7efc
X-MS-TrafficTypeDiagnostic: MWHPR01MB2271:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR01MB2271F7EDBB7AA7A07B3EC45FF29A9@MWHPR01MB2271.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 89x/704nSXJOjsux9wUPGq+BxaIDnaFSPTWQEzgrVaZb398ZMcxymijrffbrD6vBEekwNYIE7q1QxGy4VpQmYr95SoyV9UD586BHCfLsLb5gKVPVepqob7+2DyTBY2DmSuGwoApSR6CJCrFaTifTlXs9Ery1iFg7a2zi7tZrz+dmSOqz113F+Zs8quvJpvTxGJK0EqXsa3B5FPlLgQ2X3Ophj+w0OlKa+KuFQ9umFpM/r6tCptKTiZocAIXLEbXdwuS1OjlXAzgFtlPRQpNdxxrsJ/43NBbnhhS8ujZGPng/bV+n2n17tC2hmgPUJ/NF1cjNLhA4ApN8OgdNhw303Izsg9pUcY+YTtUTV5HwiRffJgPxSr8cMKhCYPNW8gWkFSv0Mggp8GnM4wsfZdKmP2rbOSXc1Xa5cdNpJL4B9yHWpwbjTQZAbA7Kn/H0MBVAdIGW1ezxrqbcBK17EqFKneNHy81I2JtmzeejaoDFOwQBM2eo3nmxv/Vaj5c7wfuDP+72C/BUizn16qwfYwCR4YXGu+W9BJyeHdquQhev3SmhDSw5ANKh/rXRiFtEjNs0yarL49qYzx2Mw9U9JO8U5L9RcH2CMkvs7Q3b4LkgClTcsqGjRXuw1+WpuS9UPqNc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39830400003)(53546011)(6666004)(4326008)(478600001)(7416002)(31686004)(31696002)(83380400001)(26005)(16576012)(5660300002)(186003)(54906003)(8676002)(110136005)(316002)(16526019)(6486002)(8936002)(107886003)(66946007)(86362001)(921005)(2616005)(52116002)(956004)(2906002)(66476007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M2ZIQkVmR1lxbVRtNERaSkRjV3grVGlUcE96eGtWRzkzYzh2REhFZjBBRlQ5?=
 =?utf-8?B?azNwKzVZUXJTejhoWkxQK0ZQM3NzKzNGM0ZJQWhlWC9IREwvWmkrUWhONHNW?=
 =?utf-8?B?bEZ4YldoVGJCcWxWKzRzN052QWxBK1BjWVQybERGWWlaRkloOUc5ZkhqbEhE?=
 =?utf-8?B?WWJ3QTRQVTE1eXBYTnUrU3lMZWdObzdnbEZrc3RvNGFwUFBYU29BaldCSFhv?=
 =?utf-8?B?MS9rTWdrNlpKWXBZK2luWEhnQ1FEQjVWY2dReUVONmlhd0wzYi9uN1JUY1NC?=
 =?utf-8?B?VHdCZklHb0lkdnBjWXdCKzQ2T1hFUW4zbWhTcEZXUW42MUZDNUVoZkU3VzlH?=
 =?utf-8?B?YzZtZ2lTVVJ1YlJqekNpbkxob3BCdkUxSkY0RzJobjVlbXJqWjBreHpnNXk0?=
 =?utf-8?B?UFF2OWtHRkVSMTNXMlAxaGNRdGpZemx2NDV3Z010SXh0MFVXTHBWbUZsa3ZG?=
 =?utf-8?B?M2NhN2JicmNlWnBTZnhhRGh3K2E2bk1GejNFUFVWZ1JTSmJCdkdGYThhWUtr?=
 =?utf-8?B?QWt1NjlXRFZBa2daYXVzWFhUendlSmxXK0ZNc2hjckF4NDlnemxmQTQzTUs2?=
 =?utf-8?B?ditsOXJEbTZ4TFEyam1oWlV3LytmSmpzRXBYWkdXT3UrNFA2M3V3cUwxZlUy?=
 =?utf-8?B?UFMxNXVnVWhCZ25LTjBhYk0zUU44cWltd2Z2KzhsWVNNcTg5K0d0TXNZOVpl?=
 =?utf-8?B?czM1WWxra2xMeWNzdVpXOTZlaUFzS3IzZzBWRXl0ZzE4NlpmQlFsRkVNeDd6?=
 =?utf-8?B?YjFma1MxOFNrRzFiUTEwM2RpN0R3UkpuY2RVcmR1Q1RFOEM5TUM3dW5UbnVU?=
 =?utf-8?B?ZzhXVlBUUVlmOUo1Lzlxd2dnYm41OURwQzdqWFc2dGk2QXp3UzU1NVAyZitH?=
 =?utf-8?B?dEQ0cHRzWkQ1N1hpOG8wYU4vS2FmK3F1UTcrZDRDeUZTQjB2cVRtNDJrWTk2?=
 =?utf-8?B?TFFiZ0dRYS9VWTFRU3VkZDUvS3dWd0NVTDY4YU5wc1VPQW5Fa1RiOG8ySjRi?=
 =?utf-8?B?TFZMYmE1TXQ5dWtsR1lyd3JKZ2UwcE1YZkFnb3lNeUJGS2YvelVtNVJPMlN3?=
 =?utf-8?B?L2NGdm9GMjhHTkJhM054SE1RektOSm5DZmN3TEowWGlzMlVnYmlBWENCYUJB?=
 =?utf-8?B?RS9RRC9oZ2Nudy91NGhOQnlsenN5dWg5RXZ1K2tZa1ErTUtsb1BHQUQrQW55?=
 =?utf-8?B?cTQxckduUmZUQ3dHbk51V0l1SWo0d1d5RlFDU1dKa1AvTUZDNUVTOTc1dUtT?=
 =?utf-8?B?UkdjSmNiT2QvTkNRMHZtczdseXhSY0tPZERxZnlMb2xBbFNNK3JNM0NnV3hW?=
 =?utf-8?B?dmozS0hpQlVJS0oremhsT01lWktpb1lsTzRJUEVYNC9lVUhOdmo1MzlFZURo?=
 =?utf-8?B?Um1JcC81MkIyS0JvRGFNVzdwbWVKemU2SVRGSEJLNkYxb0EyNUJManRGRWJG?=
 =?utf-8?B?dUFKN3NxQ29yNHpSOVc4djJnMEtKNHBPdVVuV0hvbms3NmxIeC9yTmMxMzRy?=
 =?utf-8?B?TGdBUjhtYldreHRhVEd4UGxqMXBnN1BSZkVkMnR5V0tRdjhFVU1VdjRBRmMx?=
 =?utf-8?B?WjZNZE0vRkpQaWc2SGU0eHJRTmJJTloxdnkydFpQQ1I3akxRdUtnZHJURmRz?=
 =?utf-8?B?c1c5bXpOWElnclBzcHY2T3AvalRpSGNrWXh4QWJrK1VjMjJXM0s1RzdzVmxL?=
 =?utf-8?B?cHYrM245ZldMVDZGU044N21CK09zQTYvQ2s5eTVlWnBLUk14TlBOc2tObUZa?=
 =?utf-8?Q?L8q2OEv1/ArzmkGbTmmSaArbhOtfWTlPe+7KP9K?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 551ecaee-2573-48d1-2490-08d8dcad7efc
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 12:28:19.4409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W7eJf5BBRtX35sIrTLS5aEBOMYcQkiDZd/vaV6mzz50BeGd89WfOeVMefeubd42FJxQ5GTy72F+5g0YS0/miLxAMEqBWFRZ5y5+ZBmg+Nm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2271
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

On 25/02/2021 23:42, Guenter Roeck wrote:
> On 2/25/21 2:18 AM, Quan Nguyen wrote:
>> Add documentation for the Ampere(R)'s Altra(R) SMpro hwmon driver.
>>
>> Signed-off-by: Thu Nguyen <thu@os.amperecomputing.com>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>>   Documentation/hwmon/index.rst       |   1 +
>>   Documentation/hwmon/smpro-hwmon.rst | 100 ++++++++++++++++++++++++++++
>>   2 files changed, 101 insertions(+)
>>   create mode 100644 Documentation/hwmon/smpro-hwmon.rst
>>
>> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
>> index 8d5a2df1ecb6..b48a980ed08b 100644
>> --- a/Documentation/hwmon/index.rst
>> +++ b/Documentation/hwmon/index.rst
>> @@ -164,6 +164,7 @@ Hardware Monitoring Kernel Drivers
>>      sis5595
>>      sl28cpld
>>      smm665
>> +   smpro-hwmon
> 
> "hwmon" seems a bit redundant here.
> 

Dear Guenter,

That is necessary for HWMON because SMpro supports monitoring and 
reporting various data not only hwmon-related data but also including 
RAS errors, and other miscellaneous information


>>      smsc47b397
>>      smsc47m192
>>      smsc47m1
>> diff --git a/Documentation/hwmon/smpro-hwmon.rst b/Documentation/hwmon/smpro-hwmon.rst
>> new file mode 100644
>> index 000000000000..d546b90982e5
>> --- /dev/null
>> +++ b/Documentation/hwmon/smpro-hwmon.rst
>> @@ -0,0 +1,100 @@
>> +.. SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +Kernel driver Ampere(R)'s Altra(R) SMpro hwmon
>> +==============================================
>> +
>> +Supported chips:
>> +
>> +  * Ampere(R) Altra(R)
>> +
>> +    Prefix: 'smpro'
>> +
>> +    Reference: Altra SoC BMC Interface Specification
>> +
>> +Author: Thu Nguyen <thu@os.amperecomputing.com>
>> +
>> +Description
>> +-----------
>> +This driver supports hardware monitoring for Ampere(R) Altra(R) SoC's based on the
>> +SMpro co-processor (SMpro).
>> +The following sensor types are supported by the driver:
>> +
>> +  * temperature
>> +  * voltage
>> +  * current
>> +  * power
>> +
>> +The SMpro interface provides the registers to query the various sensors and
>> +their values which are then exported to userspace by this driver.
>> +
>> +Usage Notes
>> +-----------
>> +
>> +SMpro hwmon driver creates two sysfs files for each sensor.
>> +
>> +* File ``<sensor_type><idx>_label`` reports the sensor label.
>> +* File ``<sensor_type><idx>_input`` returns the sensor value.
>> +
>> +The sysfs files are allocated in the SMpro root fs folder.
>> +There is one root folder for each SMpro instance.
>> +
>> +When the SoC is turned off, the driver is failed to read the registers.
>> +It returns TIMEDOUT Error(-110) for the read sensors.
>> +
> 
> Maybe better something like
> 
> When the SoC is turned off, the driver will fail to read registers
> and return -ETIMEDOUT.
> 
> Can that indeed happen ? That seems to be highly undesirable.
> 
Thanks Guenter,
Will apply this in next version.

>> +Sysfs entries
>> +-------------
>> +
>> +The following sysfs files are supported:
>> +
>> +* Ampere(R) Altra(R):
>> +
>> +===============    =============   ======= ===============================================
>> +Name        Unit        Perm    Description
>> +temp1_input     mili Celsius     RO    SoC temperature
> 
> s/mili/milli/ throughout
> 

Yes, thanks for catching this.

>> +temp2_input     mili Celsius     RO    Highest temperature reported by the SoC VRDs
>> +temp3_input     mili Celsius     RO    Highest temperature reported by the DIMM VRDs
>> +temp4_input     mili Celsius     RO    Highest temperature reported by the Core VRDs
> 
> What does "highest" stand for here ? Is it the _current_ highest
> temperature, added up by the hardware/firmware, or is it the historic
> highest temperature ? Historic data should be reported as tempX_highest.
> 
>> +temp5_input     mili Celsius     RO    Highest temperature of DIMM Channel 0 to 3
> 
> drop; reported individually.
> 
Will drop in next version

>> +temp6_input     mili Celsius     RO    Temperature of DIMM0 on CH0
>> +temp7_input     mili Celsius     RO    Temperature of DIMM0 on CH1
>> +temp8_input     mili Celsius     RO    Temperature of DIMM0 on CH2
>> +temp9_input     mili Celsius     RO    Temperature of DIMM0 on CH3
>> +temp10_input     mili Celsius     RO    Highest temperature of DIMM Channel 4 to 7
> 
> drop; reported individually.
>
Yes, this one as well.

>> +temp11_input     mili Celsius     RO    Temperature of DIMM0 on CH4
>> +temp12_input     mili Celsius     RO    Temperature of DIMM0 on CH5
>> +temp13_input     mili Celsius     RO    Temperature of DIMM0 on CH6
>> +temp14_input     mili Celsius     RO    Temperature of DIMM0 on CH7
>> +temp15_input     mili Celsius     RO    MEM HOT Threshold
>> +temp16_input     mili Celsius     RO    SoC VRD HOT Threshold
> 
> Report as tempX_max or tempX_crit, as appropriate (eg temp2_max or
> temp2_crit for SoC VRD HOT Threshold). If there is a single threshold
> temperature for all DIMMs, report the same limit value for all DIMM
> temperature sensors.
> 
>> +temp17_input     mili Celsius     RO    Highest temperature reported by the RCA VRD
> 
> Same question about "highest" as above. Either "highest" is
> inappropriate, or there are multiple RCA VRDs and only the
> highest temperature of those is reported (which should be
> explicitly stated).
> 
This definitely need to be re-considered. Will try your suggestion in 
next version.

>> +in0_input     mili Volt     RO    Core voltage
>> +in1_input     mili Volt     RO    SoC voltage
>> +in2_input     mili Volt     RO    DIMM VRD1 voltage
>> +in3_input     mili Volt     RO    DIMM VRD2 voltage
>> +in4_input     mili Volt     RO    Maximum voltage of DIMM VRD1 and VRD2
> 
> drop; reported individually.
> 
will drop as it is "virtual" attr.

>> +in5_input     mili Volt     RO    RCA VRD voltage
>> +cur1_input     mili Ampere     RO    Core VRD current
>> +cur2_input     mili Ampere     RO    SoC VRD current
>> +cur3_input     mili Ampere     RO    DIMM VRD1 current
>> +cur4_input     mili Ampere     RO    DIMM VRD2 current
>> +cur5_input     mili Ampere     RO    RCA VRD current
>> +power1_input     nano Wat     RO    Core VRD power
> 
> Expected scale is micro-Watt.
>
Will change in next version

>> +power2_input     nano Wat     RO    SoC VRD power
>> +power3_input     nano Wat     RO    DIMM VRD1 power
>> +power4_input     nano Wat     RO    DIMM VRD2 power
>> +power5_input     nano Wat     RO    CPU VRD power, total of SoC and Core VRD power
> 
> drop
>
OK

>> +power6_input     nano Wat     RO    Total of DIMM VRD1 and VRD2 power
> 
> drop
> 
OK

>> +power7_input     nano Wat     RO    RCA VRD power
>> +power8_input     nano Wat     RO    Socket TDP
> 
> Report as max attribute
>
Will try this in next version

>> +===============    =============   ======= ===============================================
>> +
>> +Example::
>> +
>> +    # cat in0_input
>> +    830
>> +    # cat temp1_input
>> +    37000
>> +    # cat curr1_input
>> +    9000
>> +    # cat power5_input
>> +    19500000
>>
> 

