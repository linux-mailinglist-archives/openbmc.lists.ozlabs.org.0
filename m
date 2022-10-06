Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7225F6215
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 09:52:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjkDv2cbbz3bq5
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 18:52:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=A/F9/OHt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.94.105; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=A/F9/OHt;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2105.outbound.protection.outlook.com [40.107.94.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjk7Q0H6tz3c38
	for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2022 18:47:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQcz/8htferT+xZwc+evlhoRH+oVwuaz3IL31j6mMz/0Jg2uR+hAfmJ9vPZzPinWFxKf7t8Fw5Q4YZM8VrUic5bcS04b8gJB9Yde495sCl+E7rHeQjEX0xQrsJ+WC7MOix+0WcwPQBwAj04i91QCIhGSYJPPaoOHHdu+j2AGmrR3JMZZ3JKdsleP8FPqKHIEgRuyllnMiHmPs/JB8VOilW9KdAaZP6eBWqFVfwPsOwxHIOg+nccBBI/0Nf9XXzr04lDo/231OIJRqIYo/FPzUFwWGnwIsAYBHaO63BzHSHM02MYAwZBEuivVFZMuZ+ofZXvw6allh0ExfW0Vezh1xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enczcvdx0nyhMukYWzqc3bZ+Oi0yC5V6r4NxR4F5BqE=;
 b=lpL9D9D6A5rRArQ3hNkXO1tDhDfx7zciSrLaX4os/k51xQMP6yegiZgwvzBi4Hg1pIwJ+0HI5oZDUBZx9BKr0vzRySXMVCmtUmkwwNlYGGtInEBSb8jdkp+1p3KKFDpalFWTZPMG1oOgZgnSgjXG1qZ4I+NQmk1Ed+upbUyUhVFx69cxRVMHqEJP0JgzHOwdO93jcw3+BM9Aasc9agsYOgoWDEVlSJD2RCNZLPHuVijS1kb9P9u7SK2dzmCNsgEjKLcNUdscZ6WJ/UBC3jB1T2TAeDxSTVM8zBtjXJHM2z3ENGxXFBDMcXHDJtOVCUkqoL/V8SzvJTss0WjcREFBUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enczcvdx0nyhMukYWzqc3bZ+Oi0yC5V6r4NxR4F5BqE=;
 b=A/F9/OHtpMniPF/zDHw0q/wHmKr8zMLBujlWmDly3yxL1MwKgPPZKCxYABytmrPwr5HrOAvxtZWN2ElzxgCQyBJenSjhjqtyeBotvtVoBMwnBREr8mAn8z5T38ninqhTKvXb0ORpfuLpHgHLwv7ACnsDyJPDU7K7qJw7s9L+QLk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BY5PR01MB5796.prod.exchangelabs.com (2603:10b6:a03:1be::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.20; Thu, 6 Oct 2022 07:47:28 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5676.032; Thu, 6 Oct 2022
 07:47:28 +0000
Message-ID: <53807596-4e18-2d64-121c-64716982fcb2@os.amperecomputing.com>
Date: Thu, 6 Oct 2022 14:47:17 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH v9 6/9] docs: misc-devices: (smpro-misc) Add documentation
Content-Language: en-CA
To: Bagas Sanjaya <bagasdotme@gmail.com>
References: <20220929094321.770125-1-quan@os.amperecomputing.com>
 <20220929094321.770125-7-quan@os.amperecomputing.com>
 <Yze98CgmGuNA0uGr@debian.me>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <Yze98CgmGuNA0uGr@debian.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGBP274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::33)
 To SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|BY5PR01MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: 6311a72f-1683-496d-d18d-08daa76f03e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	tcdY01ja9RtZC+BdaZGEu/j3ESEqqXGezfTt3Ej4odwUsG9uovf4j2DPQzgYytbk8EhbZ9gTu92BgyOUvwTV5EVPls52Q5c7IGGBFmhxSN2ViesK5hjQWnNln0/IrYAjdYHkbA0ElAD+1K+Dp/5lQUzbdApgh9VwOfujfSs8FJUojZOPM5ZLLSRBQL2Pl1EiC+bKP5JgAGMIA0KxTZyMevU1eJjyQctVlziat7mmaF2o+UftcwFdny2bcUvpnhbOx4hgE/5yXtyqA5hg/9ZfBKi0gCOPS/ygIEpY2JcGyXtc/q52ZVEKsofw4SSfNr6r88ctZmXYjj2Ywx80YzM6E1WOCRODt7IkYg+LlB/UeDC0XRCsSZNwcF6D8bKBmFrZHVdCLIaExlRcZa9Bap0fGtCpCIg29LHG2jfjbSmJRRYjtTMjYrA6AIoIKHcLNWLEYujZPiCTaT1wvCx87ZEmAx8HDJC9GRoefenQJokNtxL+lvdBpUpl/Zu2M+DGtkg9lGJONSHd3GGC3z1T9+aIXbD+wwIvdbLktjhoqOqc2FGXczN7BCDQ7i6X9BSheqE+82m4U0qJSDw7SQZCCYBknGRc1jQ2yUbZc0FWPjBOxk9UZfMMWIbz5jrsVLC++x4i9IpSMsQl5OLxd9N1P36BiyAnDmxQhfO8Qg+5UQXQRqTnnRr93JXVmq7CP1p1RZfRzUI7fyVw3VTBmqnFmLqmTvFHlU/GIqXCa78PrRe0bMDoe2IVstSbfKCjNdIw/RZw5qLuspFgekIG0dl1c4DO5B12My23q2Z9iFhH/KiCFXg=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(39850400004)(376002)(366004)(451199015)(38350700002)(31686004)(186003)(478600001)(38100700002)(6486002)(54906003)(31696002)(7416002)(83380400001)(66556008)(41300700001)(316002)(66476007)(2616005)(8676002)(6666004)(6916009)(107886003)(86362001)(6512007)(8936002)(26005)(5660300002)(53546011)(66946007)(52116002)(4326008)(6506007)(2906002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?WXVZV2txTnV5cTcwMFZPbGllOVVQQ09CbGVzNUF6RUt3RmFwdndBQVQwRm9l?=
 =?utf-8?B?RmxROWxIWlNHMkdreUxxRVR0alZsOFJka2RBdFBWMmlwdmVhTVlGMnZSUlRx?=
 =?utf-8?B?L1gwVWNjZEh3c2JZK0lBeWtmRVl0eFpMdk5PdFZheHdMTHlseTFyNU9yTFQ1?=
 =?utf-8?B?MUhZS283VmxWZW82RzIxb2E3aS9TLzNya1RpRTJHQ3ozYXlnSW01TXJDdWhK?=
 =?utf-8?B?ZmZiWWVPR1NOUGtpNDhFMHBFOVdUUlpGTlpGSkZVZHZMdDlTc2pCMktIYy9L?=
 =?utf-8?B?U3dxL3NlTXgrUXB0ZUJOZ2hVVzkzVE1tbkJRWnhUTmFmMm9iS1c3RG1hVUlI?=
 =?utf-8?B?N0dsa3JZZ2RjaklGTXdMd1h0NTJGclZWZ2Z1ZTFIN0tGMGNsbmdYZnB2amlO?=
 =?utf-8?B?aGJMYjF5WnJqaU9qVXVsTHRsMkdmM0dLWjh5eDVtNnFRTUkyalNGUW5hUTNN?=
 =?utf-8?B?K3N2OEVjd1VHRkd1VmtlV1hoejNEc21OWjJmWVlXWjFGUnFyb3kvZUx2dVVj?=
 =?utf-8?B?TjlTVCtQclRWQ0RqRjFDaHAyTjBJckFyOHlRQXJEdVk3Ly9OcGtzS0lhM3J4?=
 =?utf-8?B?QkxCM0dNWkFoQ1k1MHhMUjFRejRmN1RLMWc2OVNTMnBiYkNuSmZGUVNlQ2U2?=
 =?utf-8?B?cndZK2dBcWJGUTVrZkxMRkR5Nm9wekhCb1Rwc1lpcTBsQUhlYnZtSVAwaklT?=
 =?utf-8?B?cllIR2ZhY2hvZlpYbFc5NWJ0R2sxT1VXWkx4cE9mYUc3cUszNENFZHJUVFJI?=
 =?utf-8?B?K25UNlM3ZWU3SThsK1pkRVNaTmJFR3FrZDRWUEROaCtKQ3A5TERwRFpYVXVs?=
 =?utf-8?B?WS9xa2ZmYUZHT2VSdXMycUFQanlyWEFZaUZ6bENQVTZJV0Q5WWhXNzBpR29k?=
 =?utf-8?B?SVpNSlA2RUxpclJENHdOcGlVMEFnRnZwUGM5SzloQXlqSVNyZmNUSTU3TDVQ?=
 =?utf-8?B?dFZUbUhLa0g0bGNkY2VXZWJsWG5RYUFWNjVXcW9QZEcyTjBuV2VmTVliT1ZF?=
 =?utf-8?B?UmRyd1B5ajV4bWk0QXFBdkJEaDBjREh5b1doNE1uWGhEaXFrVzVtL1QrOEtm?=
 =?utf-8?B?Z24wZGgzeHBGL2NkdXZpTTRnUUlsV05ic3FrWHREeCtldnNYcGxBYm40VWZZ?=
 =?utf-8?B?MHI0WjdWMVFnbi9IK2c4dWU1cWlJUUVLbTRmU3BkWkNIQURyd285djhsUXYr?=
 =?utf-8?B?Yi9CcE53MVNSSTNPTXZmdHlpcForR3E5WVZ5RFVoZXNNeGRGUXd0VFgrSlpY?=
 =?utf-8?B?RUp2NnhWcGN4cFVWMHVZdDhOMXpCL0d4NDlFbnlrVDh6d0M0N2JHdnR1YkNI?=
 =?utf-8?B?N3IyeE13ck9MZW5jcTlDZzRxeWM2WmlpWldCcnlLSGt0MURyaHk3cUM2SmNk?=
 =?utf-8?B?V1Y0OWN5V2lkcEZZWHlnUW5UVVVXTE9QNldIVlFMcjluR3IyWVV2R1AwNnFD?=
 =?utf-8?B?eWkxL01BUkdoTFBvS1UyU1lobFQ3cmJOVDVxTkVKNSs4S1RSUzQvWXlSL2dK?=
 =?utf-8?B?azZhS2NYUDY4VVlMdm1FVDlwd09tREg0cG1kbTVJTFI5UHBtZWZvZGNJc1h4?=
 =?utf-8?B?dUhQN2psb0dsbTcwc0VIalpXYVNvY1hOUFFFY0M2ZitaakRIWE9QMXRkWmtk?=
 =?utf-8?B?WTVvanl5OFROUUsvaEY0UGVRRFdZNUFWVGE5RUlDeUVabS9RaTN4NFgzYlFG?=
 =?utf-8?B?ZnZmZW1Ma004cVI2MTNzb1RUQnZTWCtubnBVRWh1bzdOdmZHUzJrc2ZUcTlO?=
 =?utf-8?B?SHpIa0Q0MTgxU0E2TE12c2xOaDFIRENIWlJPaDlmeWNBVnN6cTE0OXhZYmIy?=
 =?utf-8?B?NlN1Z0F4NkUwc29TemZQQ2lrK0d1RGk5UFRjZ3FJaExkbE5TUUR6NHhXNWhn?=
 =?utf-8?B?V21ZbGJMZU1jN1c2S290REZ1Z1RlcmU2WjlHZ3RXRENZencyZm93R2ppYnlq?=
 =?utf-8?B?eFhSU0s5c3hIcWprQjZWcTlCSkROUXFMU0ZCODdncHdBNndGNmhxdHFsd2No?=
 =?utf-8?B?R3lvR0s5bE50bGlGWWdkbUtseTZlMUJ0YVoyb1VnV1Y5V0Z0Qk54eXZ0NDk4?=
 =?utf-8?B?bGRzR0xFMmFiMG1oMFhyaE9SdHFBaTNHeUtseTRvTVJaSE5VMWNPZWtWcW51?=
 =?utf-8?B?dWM1SkN6cENxTEVqNUJDWTlBaktPNjF1K3FNaTlQWUhicFlqcWs1U2Jzc09C?=
 =?utf-8?Q?sz9OniHKEEAwgYt9yjzK82Y=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6311a72f-1683-496d-d18d-08daa76f03e9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 07:47:27.8803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wRUBAq5MYf/ri/OYpS5ILjuupoCv7qC0iCkIk/mjigKdj1DWco7/much82KdlOh1z1Rhli/aU6gyFjnBbZIqlEFW6/yZ2gTk7JczL6xVXtU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR01MB5796
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Phong Vo <phong@os.amperecomputing.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dragan Cvetic <dragan.cvetic@xilinx.com>, Lee Jones <lee@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, thang@os.amperecomputing.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Derek Kiernan <derek.kiernan@xilinx.com>, Open Source Submission <patches@amperecomputing.com>, Thu Nguyen <thu@os.amperecomputing.com>, Guenter Roeck <linux@roeck-us.net>, macro@orcam.me.uk
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 01/10/2022 11:11, Bagas Sanjaya wrote:
> On Thu, Sep 29, 2022 at 04:43:18PM +0700, Quan Nguyen wrote:
>> Adds documentation for the Ampere(R)'s Altra(R) SMpro misc driver.
>>
> 
> s/Adds/Add/
> 
>> Signed-off-by: Thu Nguyen <thu@os.amperecomputing.com>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> 
> Does this patch originally authored by Thu? If so, add From: line before
> the patch description.
> 
>> diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
>> index b74b3b34a235..b40cd1b402f7 100644
>> --- a/Documentation/misc-devices/index.rst
>> +++ b/Documentation/misc-devices/index.rst
>> @@ -28,6 +28,7 @@ fit into other categories.
>>      oxsemi-tornado
>>      pci-endpoint-test
>>      smpro-errmon
>> +   smpro-misc
>>      spear-pcie-gadget
>>      uacce
>>      xilinx_sdfec
>> diff --git a/Documentation/misc-devices/smpro-misc.rst b/Documentation/misc-devices/smpro-misc.rst
>> new file mode 100644
>> index 000000000000..d21be4a09e69
>> --- /dev/null
>> +++ b/Documentation/misc-devices/smpro-misc.rst
>> @@ -0,0 +1,82 @@
>> +.. SPDX-License-Identifier: GPL-2.0-only
>> +
>> +Kernel driver Ampere(R) Altra(R) SMpro miscellaneous
>> +====================================================
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
>> +
>> +This driver support the monitoring and configuration of various miscellaneous
>> +data provided by Ampere(R) Altra(R) SMpro processor.
>> +At this time, these include:
>> +
>> +  * Reading Boot Progress information
>> +  * Configuring SoC Power Limit
>> +
>> +Sysfs entries
>> +-------------
>> +
>> +1) Boot progress
>> +
>> +SMpro misc driver creates the sysfs files ``boot_progress``.
>> +The format of ``boot_progress`` file is as below::
>> +
>> +<boot stage><boot status><boot progress>
>> +
>> +Where:
>> +
>> +* Boot stage::
>> +
>> +    0: SMpro firmware booting.
>> +    1: PMpro firmware booting.
>> +    2: ATF BL1 firmware booting.
>> +    3: DDR initialization.
>> +    4: DDR training report status.
>> +    5: ATF BL2 firmware booting.
>> +    6: ATF BL31 firmware booting.
>> +    7: ATF BL32 firmware booting.
>> +    8: UEFI firmware booting.
>> +    9: OS booting.
>> +
>> +* Boot status::
>> +
>> +    0: Not started.
>> +    1: Started.
>> +    2: Complete without error.
>> +    3: Failure.
>> +
>> +* boot progress: 32 bits boot progress code
>> +
>> +The sysfs ``boot_progress`` only reports the boot state when the host is booting.
>> +If the host is already booted, it returns latest state.
>> +
>> +Example::
>> +
>> +    #cat boot_progress
>> +    0102808454A8
>> +
>> +2) SoC Power Limit
>> +
>> +SMpro misc driver creates the sysfs file ``soc_power_limit`` to get/set the SoC Power Limit.
>> +
>> +Reading this sysfs return the current setting of SoC Power Limit (W) in decimal string.
>> +Writing the desired value in decimal string to set the SoC Power Limit in Watt (W).
>> +The range of SoC Power Limit is 90-500(W) and will be ignored if out of range.
>> +
>> +Example::
>> +
>> +    #cat soc_power_limit
>> +    90
>> +    #echo 95 > soc_power_limit
>> +    #cat soc_power_limit
>> +    95
> 
> The documentation above can be improved (both grammatical and
> formatting):
> 
> ---- >8 ----
> 
> diff --git a/Documentation/misc-devices/smpro-misc.rst b/Documentation/misc-devices/smpro-misc.rst
> index d21be4a09e69c4..f33466152ac402 100644
> --- a/Documentation/misc-devices/smpro-misc.rst
> +++ b/Documentation/misc-devices/smpro-misc.rst
> @@ -7,76 +7,77 @@ Supported chips:
>   
>     * Ampere(R) Altra(R)
>   
> -    Prefix: 'smpro'
> +    Prefix: ``smpro``
>   
> -    Reference: Altra SoC BMC Interface Specification
> +    Reference: `Altra SoC BMC Interface Specification`
>   
>   Author: Thu Nguyen <thu@os.amperecomputing.com>
>   
>   Description
>   -----------
>   
> -This driver support the monitoring and configuration of various miscellaneous
> -data provided by Ampere(R) Altra(R) SMpro processor.
> -At this time, these include:
> +The smpro-misc driver supports monitoring and configuration of various
> +miscellaneous data provided by Ampere(R) Altra(R) SMpro processor.
> +Currently, the driver supports:
>   
> -  * Reading Boot Progress information
> -  * Configuring SoC Power Limit
> +  * reading boot progress information
> +  * configuring SoC power limit
>   
>   Sysfs entries
>   -------------
>   
>   1) Boot progress
>   
> -SMpro misc driver creates the sysfs files ``boot_progress``.
> -The format of ``boot_progress`` file is as below::
> +   The driver creates ``boot_progress`` sysfs file. Its format is described
> +   as::
>   
> -<boot stage><boot status><boot progress>
> +     <boot stage><boot status><boot progress>
>   
> -Where:
> +   where:
>   
> -* Boot stage::
> +   * ``<boot stage>`` can be:
>   
> -    0: SMpro firmware booting.
> -    1: PMpro firmware booting.
> -    2: ATF BL1 firmware booting.
> -    3: DDR initialization.
> -    4: DDR training report status.
> -    5: ATF BL2 firmware booting.
> -    6: ATF BL31 firmware booting.
> -    7: ATF BL32 firmware booting.
> -    8: UEFI firmware booting.
> -    9: OS booting.
> +     * 0: SMpro firmware booting.
> +     * 1: PMpro firmware booting.
> +     * 2: ATF BL1 firmware booting.
> +     * 3: DDR initialization.
> +     * 4: DDR training report status.
> +     * 5: ATF BL2 firmware booting.
> +     * 6: ATF BL31 firmware booting.
> +     * 7: ATF BL32 firmware booting.
> +     * 8: UEFI firmware booting.
> +     * 9: OS booting.
>   
> -* Boot status::
> +  * ``<boot status>`` can be:
>   
> -    0: Not started.
> -    1: Started.
> -    2: Complete without error.
> -    3: Failure.
> +     * 0: Not started.
> +     * 1: Started.
> +     * 2: Complete without error.
> +     * 3: Failure.
>   
> -* boot progress: 32 bits boot progress code
> +  * ``<boot progress>``: 32-bit boot progress code
>   
> -The sysfs ``boot_progress`` only reports the boot state when the host is booting.
> -If the host is already booted, it returns latest state.
> +  The sysfs file  only reports the boot state when the host is booting. If
> +  the host is already booted, it returns the latest state.
>   
> -Example::
> +  Example::
>   
>       #cat boot_progress
>       0102808454A8
>   
> -2) SoC Power Limit
> +2) SoC power limit
>   
> -SMpro misc driver creates the sysfs file ``soc_power_limit`` to get/set the SoC Power Limit.
> +   The driver creates ``soc_power_limit`` sysfs file to get/set the SoC
> +   power limit.
>   
> -Reading this sysfs return the current setting of SoC Power Limit (W) in decimal string.
> -Writing the desired value in decimal string to set the SoC Power Limit in Watt (W).
> -The range of SoC Power Limit is 90-500(W) and will be ignored if out of range.
> +   Reading the file returns the current limit. Write the desired value in
> +   decimal to set the limit (in watts).  The valid limit range is 90-500 W.
> +   If the value is out of range, it will be ignored.
>   
> -Example::
> +   Example::
>   
> -    #cat soc_power_limit
> -    90
> -    #echo 95 > soc_power_limit
> -    #cat soc_power_limit
> -    95
> +     #cat soc_power_limit
> +     90
> +     #echo 95 > soc_power_limit
> +     #cat soc_power_limit
> +     95
> 
Thank you Bagas but as per Greg's comment, this file might be dropped 
and move to Documentation/ABI in next version.

Thanks a lot for the detail change.
- Quan
