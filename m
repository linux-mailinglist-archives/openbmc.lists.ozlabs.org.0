Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C7A5F6203
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 09:48:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mjk8j4TF2z3bmK
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 18:48:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=qHDIdivn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.95.112; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=qHDIdivn;
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2112.outbound.protection.outlook.com [40.107.95.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjk5r1kLJz3bmK
	for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2022 18:46:23 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ObJjAkhPg8HqX5+KwKfUrk0y3b7WdYEBO+OK4XY9vMDtMUNiJDI82vILNH7G0u5HOYof5RxgW72T8/QQ8RNoqm0uTNfcMF9aQygdLVC4qm3nX7IWZ+mART4ASNAS6fJtcQpxXM0DojXT69ENtWscDRAdfqyKvlK5YHw64vuplpJj1y3lCGwlhHxFE3v7zoy9ENnb56VyoZO+rNERiHQJJ8Ld/dig8/cjmPj4D0XIoqGuUXth8RLSzKJtbpI4o9ms8OnDpVQHbmxxMATGH2HWxbE/F0BAWil5rw37UYvB/j8w1A8W1GYwi2PWQSAccrag+wDVO9Gnk4h6WeDjbWeSOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QNoKZzHPb1JsMrM91AocBdQ0jdBw3TGrJT0R4uQaakQ=;
 b=KtBkm3GX0F5qxMiN0zkW6gtbhI9n+Em8fgPx72TzizFGEihio15tEf9pp5+GdePhyY7HwZ7DQE2MNkYJHsK4MKeFx34i+du0aG7lv1Ay3hcoEl1MLAQnjuA8AcUB9P1sqoih0s6SMdG12HBOpb0xIaXBhWiUxoLutvdT/ERaGsSXDBtQcCHAK5AUo4g2Vs7rB6nvB5TQXB2p79wTnctK9yid5QmoYZH31ypqqPBPoTDDnP/zR3CNwvg+w5M/fYqO+GY+chlF2koJy5Rp85ditzXZbVB0f5qbzjIWD2sJ00Ml36Mzwv8k2ViSpb2UrulyvOXcmRQlRdMO7Y0E1terCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QNoKZzHPb1JsMrM91AocBdQ0jdBw3TGrJT0R4uQaakQ=;
 b=qHDIdivn6L7sEX5o2gSpnWBGFvAjl1HEplp0mDQAxhbuPAeOTvMWDTPHtDVvgCGYBt4lBAWyvhmqWrkeyC5XPvFu69vDNwDIRlL+x1QebesCrFXtieuvgsGqc0/iyM4bMiuc5hgVopKGanffBuhH0ssZcoPGFeaf0gjMUypefG8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BY5PR01MB5796.prod.exchangelabs.com (2603:10b6:a03:1be::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.20; Thu, 6 Oct 2022 07:46:17 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5676.032; Thu, 6 Oct 2022
 07:46:17 +0000
Message-ID: <ffc5df6d-9eb1-d40f-c749-9d90b07bbf00@os.amperecomputing.com>
Date: Thu, 6 Oct 2022 14:46:05 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH v9 4/9] docs: misc-devices: (smpro-errmon) Add
 documentation
Content-Language: en-CA
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220929094321.770125-1-quan@os.amperecomputing.com>
 <20220929094321.770125-5-quan@os.amperecomputing.com>
 <YzVr6e38fxYylfMA@kroah.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <YzVr6e38fxYylfMA@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0131.apcprd02.prod.outlook.com
 (2603:1096:4:188::6) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|BY5PR01MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f564b24-6b92-442b-fc97-08daa76eda0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	AB/Ymqz4FzWq5Lz3rl7ezFe9GQ5L8gimx/PF2B51P5M0fUK7nvQzy09rrdAOwJjby8SHoOsKgGnf7eP+CFTvGsBu6pa+/4Y/hLuFyf3j23XQeeidyWfvq698m0UW2HVFe9U2fRNBFeETy7jKNniCI3CGrrfrUKHnRhFq4oDk41qgJObL8J+99qgYF/tL2g9AzQmVAqjlhRtGk1tp1UV0Yv7vbPMQ+3s327UsKJENUBV15BJBe0ilVzEm7Duxvi1IqQXemHomV/cJrvU81O6Hlg+hmf36T7Hx6iNtF0ZSMiQuo6cQ+xweUJkIqiPfFi5SC36ZfyBiigJQcGY/r3Q64uaoRrGTil1KYaxMjcHiZxEhoK3Ly6In4iFhTT5DK28En2gresX7tV6WQ7ET9cynWDWu7NFawKZsEcaPcQq2LgfiLzYbQC+Fv9BQeVbA+PZQqbpRTjqZMZpNxdrwiA4WccdQUCI3hYNbCV4iESxeCJfEqcJbZlfbY4lCan4lUuuLb3BuCCjUvuXmVnISz0LJYg7D/+I/m0zVmnpcXlxdQu5tvTUP8k6Ct1LZK4XnaRyJHiaF8CdGfip5cXyCjDbR6vTJrNPm7sl6uxdWyi5xhDWq+m0inKCgbnhiGXNvykPLdtv56JHk/ubMlc6Sof4IwfdBSxFp8F3zW//B29vxtvOqVgq6dPl10kT+vHTeU+VF/7iSbJXjYEA21JwjWnlzLXmeufoL4WCB9lshDTsrdvQytcMoapzTAkG0YJGE/paZm3DtB5D5Xo4D9gyMdEZVrfOsjvw4fSnwIsWsyA8HIpo=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(39850400004)(376002)(366004)(451199015)(38350700002)(31686004)(186003)(478600001)(38100700002)(6486002)(54906003)(31696002)(30864003)(7416002)(83380400001)(66556008)(41300700001)(316002)(66476007)(2616005)(8676002)(6666004)(6916009)(107886003)(86362001)(6512007)(8936002)(26005)(5660300002)(53546011)(66946007)(52116002)(4326008)(6506007)(2906002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?ZUhSL2JxVTBlOWdVUjlxcUVkWmNYeWREaW5QdXNWRjI0SVdTRTVEZ3l6N1Nx?=
 =?utf-8?B?N0JrTUtTR1NIcnZ4UzE0OFkrcWt6UWtjR2l1aHJ6MWRiQUhtQ1pQdUdTT1Mr?=
 =?utf-8?B?WXlxNjlQMzEyWEVseXRaK2Y5SGZUMzk4K2dkdThBdXlFZ0prSkpEUFptOWtN?=
 =?utf-8?B?MFZZWUZwcEVjaCtkcEw0dWZRRUtZSkgzWHdmNUJMVTQxdG15RC9NMWdHU05t?=
 =?utf-8?B?Sm1kRkwwcFBjbFFRUFBQYnNsQ3BBYUtyd0FEeGZWVk9sTWxMTXhBT1RleFM1?=
 =?utf-8?B?T2F1TFhid3NoVytyRUtrVDlqZ0F1VkpoUFIxNm4zdGRROXppZW5zbXFRS1U3?=
 =?utf-8?B?S3llcE1uNC9ueWVhc3ZHZVJOQVVNRXFvQ00zSC9lQ0U3MHVGNmlJc25WeGd5?=
 =?utf-8?B?U0k2L1VaWW05V0FuejV5UVhzd0ppa0YyVFluUjlZcUk0anhlallVZ2ZjcUkr?=
 =?utf-8?B?TXQybjZMRFRVN05hK3dST1ZGUWpCb2l4VXJPcjNuYXVSTE5HUC9GTXdqeTVM?=
 =?utf-8?B?RzNyMFpMV3Z2UE5yckFzdGlZTXZZZTN0QjhOUjBjYjcrWmFpcVRnOTVYVEFR?=
 =?utf-8?B?ZjNnQ3VLcEZRdGhnbDM4a240YW1XVUp6cG05eTVaa2s5UlZxaStLMEVLMEFL?=
 =?utf-8?B?RFhkT3lLVnBRSkV1YXJxS1MyZzNjVXNlUGI3ditrS0lJYzJrWFN1cFFxMG1l?=
 =?utf-8?B?ZmlzMlI2UGpXM3FaRDNxMExINUUxV3pnd0ZDTHcxblV3YWw5aWlCc2ZBV2NV?=
 =?utf-8?B?dWR3L2tUNm5ibVlScXVZMUVsREF5NlBWNVNIOURycUg1bTN1ZlJ4WnRBRDlV?=
 =?utf-8?B?aVJWSlgwVzM5TUl4c01LQ0o3NTUrOEZNbkd1Rnc5cjZXQ0dTUlBLb3NENU1h?=
 =?utf-8?B?YmFKSWsvRlBVbFZnSGoyWjFvTTdUSzluNWpnY0VFUEJtRmZTMElPM2p3b3Bt?=
 =?utf-8?B?WjE4K0R4MTUzU2pKSFJkdVZ6ZnBOaG5BYU5oQ29WeWdPZHJrQzNCYWhSWGpv?=
 =?utf-8?B?WlBuMVIrUXQ4TU5XaEVEYUJMWmZ3QmlCamE3WndFUzNjZk40M0d4UFUyZFVM?=
 =?utf-8?B?U0VDUm4xeCtQdW9sY3JFYVdqbFJYdVpKQ0hsdS9ud3FBWE81UGsvNXNHMWdm?=
 =?utf-8?B?SUdJTDZ3aU1qb0JjZjdGQVVIZHBJa0ViMXd3RXRPZ1l1OEFScUZtOWF0VjFq?=
 =?utf-8?B?RW1CSjFEektFcHRoSlBQTzRsUGNWNjZMUXd6YktFa3JnNFZZYTR2R2NIbEpN?=
 =?utf-8?B?Tm5hWTEzaENqSUVDbnoxSkF6V0FoWUt3VWt6M090MmlYMklXWTluLzJKNlo4?=
 =?utf-8?B?ZTQyMjV0amM0eVllZ0hWMmhBZ25Pam9GSmFlSlArSTNEbFM2QUdoVEthMk1U?=
 =?utf-8?B?UmgxNEpPZUN2bzRCM0tUSkpoL253TFNxYURWeDQ3dVBpWWN1K0dkZHVlV0F1?=
 =?utf-8?B?dDdzZDhWcTFWcDk5WVdSYk8vRGpzb0pxZndoOStIVm5vNVlObVNJdFdHa1hq?=
 =?utf-8?B?UVpSOEhGL1YwdnNuMEJBWjA3RFFhZFR3U1dHWVoyb0J6cWpOU2UxL3MwNEFC?=
 =?utf-8?B?S3N0M1R4ek1LalNjZW5lTW5tWkdPMlh1LzdMb20wdnR6VHJnUXczWWJaNXNl?=
 =?utf-8?B?dG1KRVU2Y255WjRxT1NnSHdvb1Y1STVWYWk3UWl1eXp2ZkJtaldtQVZDM3oy?=
 =?utf-8?B?YmhFK2JQQVNub2cxVC9xeCtCL3U1Y3pQRmtDUzJTVTVoa0QrWTRHeWExU0ps?=
 =?utf-8?B?NXJUY1FpV25BNW5rOWg2NFNuVktQZ21kSGF0UFFtV2tJcUJ4VURnQnFsL3Q3?=
 =?utf-8?B?M3k4N0dWblVHSU9kTjZLb0xlNEN3eVBmZUVJZm9PM1BrTmtHbjBhamZvQnhB?=
 =?utf-8?B?T2g2TlhxN2J3aVU1TmxOa2pRaVVRQm5ZMGJiUWpqOU4zeWtXdisxcGVUa3Ar?=
 =?utf-8?B?ZHJlNE9YQXpXUVNuUjR2Rm5FMnNzYm1xVkhYNmlkTFRWdjhvb01qSXF5UGd2?=
 =?utf-8?B?OW04WUJOcUNHUysydSs4aTRMUkRZeU1LczdNTnZTb0xwdk1ldDJoOGRMZlNR?=
 =?utf-8?B?ZkdmV2FUelMwcmN5RG93OHhBYnF2UUt3KzR3ZmJSUWZJNUN6Z2YxT2lEdzQ3?=
 =?utf-8?B?QkdObHRTVUpVZzcwc2QySWs1TnlIWTRHdUlPTFJ4NFFDNzhaQitqdSs2THd3?=
 =?utf-8?Q?R1nOAUIJad8zWk4FbaG7N18=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f564b24-6b92-442b-fc97-08daa76eda0c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 07:46:17.6777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OAg1/3g4NLrK6IBukoYKxY6hMPoT4YVJEEZQlwer6eTwGLGOBPNBqIs8z46uNILgy6cIVi1zrANfjRZzQIftu/swZO/0t3rugizGGb9YKDE=
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Dragan Cvetic <dragan.cvetic@xilinx.com>, Lee Jones <lee@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, thang@os.amperecomputing.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Derek Kiernan <derek.kiernan@xilinx.com>, Open Source Submission <patches@amperecomputing.com>, Thu Nguyen <thu@os.amperecomputing.com>, Guenter Roeck <linux@roeck-us.net>, macro@orcam.me.uk
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 29/09/2022 16:56, Greg Kroah-Hartman wrote:
> On Thu, Sep 29, 2022 at 04:43:16PM +0700, Quan Nguyen wrote:
>> Adds documentation for Ampere(R)'s Altra(R) SMpro errmon driver.
>>
>> Signed-off-by: Thu Nguyen <thu@os.amperecomputing.com>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>> Changes in v9:
>>    + Fix issue when building htmldocs                      [Bagas]
>>    + Remove unnecessary channel info for VRD and DIMM event [Quan]
>>    + Update SPDX license info                               [Greg]
>>    + Update document to align with new changes in sysfs     [Quan]
>>
>> Changes in v8:
>>    + Update to reflect single value per sysfs  [Quan]
>>
>> Changes in v7:
>>    + None
>>
>> Changes in v6:
>>    + First introduced in v6 [Quan]
>>
>>   Documentation/misc-devices/index.rst        |   1 +
>>   Documentation/misc-devices/smpro-errmon.rst | 193 ++++++++++++++++++++
>>   2 files changed, 194 insertions(+)
>>   create mode 100644 Documentation/misc-devices/smpro-errmon.rst
>>
>> diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
>> index 756be15a49a4..b74b3b34a235 100644
>> --- a/Documentation/misc-devices/index.rst
>> +++ b/Documentation/misc-devices/index.rst
>> @@ -27,6 +27,7 @@ fit into other categories.
>>      max6875
>>      oxsemi-tornado
>>      pci-endpoint-test
>> +   smpro-errmon
>>      spear-pcie-gadget
>>      uacce
>>      xilinx_sdfec
>> diff --git a/Documentation/misc-devices/smpro-errmon.rst b/Documentation/misc-devices/smpro-errmon.rst
>> new file mode 100644
>> index 000000000000..b17f30a6cafd
>> --- /dev/null
>> +++ b/Documentation/misc-devices/smpro-errmon.rst
>> @@ -0,0 +1,193 @@
>> +.. SPDX-License-Identifier: GPL-2.0-only
>> +
>> +Kernel driver Ampere(R)'s Altra(R) SMpro errmon
>> +===============================================
>> +
>> +Supported chips:
>> +
>> +  * Ampere(R) Altra(R)
>> +
>> +    Prefix: 'smpro'
>> +
>> +    Preference: Altra SoC BMC Interface Specification
>> +
>> +Author: Thu Nguyen <thu@os.amperecomputing.com>
>> +
>> +Description
>> +-----------
>> +
>> +This driver supports hardware monitoring for Ampere(R) Altra(R) SoC's based on the
>> +SMpro co-processor (SMpro).
>> +The following SoC alert/event types are supported by the errmon driver:
>> +
>> +* Core CE/UE error
>> +* Memory CE/UE error
>> +* PCIe CE/UE error
>> +* Other CE/UE error
>> +* Internal SMpro/PMpro error
>> +* VRD hot
>> +* VRD warn/fault
>> +* DIMM Hot
>> +
>> +The SMpro interface provides the registers to query the status of the SoC alerts/events
>> +and their data and export to userspace by this driver.
>> +
>> +The SoC alerts/events will be referenced as error below.
>> +
>> +Usage Notes
>> +-----------
>> +
>> +SMpro errmon driver creates the sysfs files for each error type.
>> +Example: ``error_core_ce`` to get Core CE error type.
>> +
>> +* If the error is absented, the sysfs file returns empty.
>> +* If the errors are presented, one each read to the sysfs, the oldest error will be returned and clear, the next read will be returned with the next error until all the errors are read out.
>> +
>> +For each host error type, SMpro keeps a latest max number of errors. All the oldest errors that were not read out will be dropped. In that case, the read to the corresponding overflow sysfs will return 1, otherwise, return 0.
>> +Example: ``overflow_core_ce`` to report the overflow status of Core CE error type.
>> +
>> +The format of the error is depended on the error type.
>> +
>> +1) For Core/Memory/PCIe/Other CE/UE error types::
>> +
>> +The return 48-byte in hex format in table below:
>> +
>> +    =======   =============   ===========   ==========================================
>> +    OFFSET    FIELD           SIZE (BYTE)   DESCRIPTION
>> +    =======   =============   ===========   ==========================================
>> +    00        Error Type      1             See Table below for details
>> +    01        Subtype         1             See Table below for details
>> +    02        Instance        2             See Table below for details
>> +    04        Error status    4             See ARM RAS specification for details
>> +    08        Error Address   8             See ARM RAS specification for details
>> +    16        Error Misc 0    8             See ARM RAS specification for details
>> +    24        Error Misc 1    8             See ARM RAS specification for details
>> +    32        Error Misc 2    8             See ARM RAS specification for details
>> +    40        Error Misc 3    8             See ARM RAS specification for details
>> +    =======   =============   ===========   ==========================================
>> +
>> +Below table defines the value of Error types, Sub Types, Sub component and instance:
>> +
>> +    ============    ==========    =========   ===============  ====================================
>> +    Error Group     Error Type    Sub type    Sub component    Instance
>> +    ============    ==========    =========   ===============  ====================================
>> +    CPM (core)      0             0           Snoop-Logic      CPM #
>> +    CPM (core)      0             2           Armv8 Core 1     CPM #
>> +    MCU (mem)       1             1           ERR1             MCU # | SLOT << 11
>> +    MCU (mem)       1             2           ERR2             MCU # | SLOT << 11
>> +    MCU (mem)       1             3           ERR3             MCU #
>> +    MCU (mem)       1             4           ERR4             MCU #
>> +    MCU (mem)       1             5           ERR5             MCU #
>> +    MCU (mem)       1             6           ERR6             MCU #
>> +    MCU (mem)       1             7           Link Error       MCU #
>> +    Mesh (other)    2             0           Cross Point      X | (Y << 5) | NS <<11
>> +    Mesh (other)    2             1           Home Node(IO)    X | (Y << 5) | NS <<11
>> +    Mesh (other)    2             2           Home Node(Mem)   X | (Y << 5) | NS <<11 | device<<12
>> +    Mesh (other)    2             4           CCIX Node        X | (Y << 5) | NS <<11
>> +    2P Link (other) 3             0           N/A              Altra 2P Link #
>> +    GIC (other)     5             0           ERR0             0
>> +    GIC (other)     5             1           ERR1             0
>> +    GIC (other)     5             2           ERR2             0
>> +    GIC (other)     5             3           ERR3             0
>> +    GIC (other)     5             4           ERR4             0
>> +    GIC (other)     5             5           ERR5             0
>> +    GIC (other)     5             6           ERR6             0
>> +    GIC (other)     5             7           ERR7             0
>> +    GIC (other)     5             8           ERR8             0
>> +    GIC (other)     5             9           ERR9             0
>> +    GIC (other)     5             10          ERR10            0
>> +    GIC (other)     5             11          ERR11            0
>> +    GIC (other)     5             12          ERR12            0
>> +    GIC (other)     5             13-21       ERR13            RC# + 1
>> +    SMMU (other)    6             TCU         100              RC #
>> +    SMMU (other)    6             TBU0        0                RC #
>> +    SMMU (other)    6             TBU1        1                RC #
>> +    SMMU (other)    6             TBU2        2                RC #
>> +    SMMU (other)    6             TBU3        3                RC #
>> +    SMMU (other)    6             TBU4        4                RC #
>> +    SMMU (other)    6             TBU5        5                RC #
>> +    SMMU (other)    6             TBU6        6                RC #
>> +    SMMU (other)    6             TBU7        7                RC #
>> +    SMMU (other)    6             TBU8        8                RC #
>> +    SMMU (other)    6             TBU9        9                RC #
>> +    PCIe AER (pcie) 7             Root        0                RC #
>> +    PCIe AER (pcie) 7             Device      1                RC #
>> +    PCIe RC (pcie)  8             RCA HB      0                RC #
>> +    PCIe RC (pcie)  8             RCB HB      1                RC #
>> +    PCIe RC (pcie)  8             RASDP       8                RC #
>> +    OCM (other)     9             ERR0        0                0
>> +    OCM (other)     9             ERR1        1                0
>> +    OCM (other)     9             ERR2        2                0
>> +    SMpro (other)   10            ERR0        0                0
>> +    SMpro (other)   10            ERR1        1                0
>> +    SMpro (other)   10            MPA_ERR     2                0
>> +    PMpro (other)   11            ERR0        0                0
>> +    PMpro (other)   11            ERR1        1                0
>> +    PMpro (other)   11            MPA_ERR     2                0
>> +    ============    ==========    =========   ===============  ====================================
>> +
>> +    For example:
>> +    # cat error_other_ue
>> +    880807001e004010401040101500000001004010401040100c0000000000000000000000000000000000000000000000
>> +
>> +2) For the Internal SMpro/PMpro error types::
>> +
>> +The error_[smpro|pmro] sysfs returns string of 8-byte hex value:
>> +    <4-byte hex value of Error info><4-byte hex value of Error extensive data>
>> +
>> +The warn_[smpro|pmro] sysfs returns string of 4-byte hex value:
>> +    <4-byte hex value of Warning info>
>> +
>> +Reference to Altra SoC BMC Interface Specification for the details.
>> +
>> +3) For the VRD hot, VRD /warn/fault, DIMM Hot event::
>> +
>> +The return string is 2-byte hex string value. Reference to section 5.7 GPI status register in Altra SoC BMC Interface Specification for the details.
>> +
>> +    Example:
>> +    #cat event_vrd_hot
>> +    0000
>> +
>> +Sysfs entries
>> +-------------
>> +
>> +The following sysfs files are supported:
>> +
>> +* Ampere(R) Altra(R):
>> +
>> +Alert Types:
>> +
>> +    ========================  =================  ==================================================
>> +    Alert Type                Sysfs name         Description
>> +    ========================  =================  ==================================================
>> +    Core CE Error             error_core_ce      Trigger when Core has CE error
>> +    Core CE Error overflow    overflow_core_ce   Trigger when Core CE error overflow
>> +    Core UE Error             error_core_ue      Trigger when Core has UE error
>> +    Core UE Error overflow    overflow_core_ue   Trigger when Core UE error overflow
>> +    Memory CE Error           error_mem_ce       Trigger when Memory has CE error
>> +    Memory CE Error overflow  overflow_mem_ce    Trigger when Memory CE error overflow
>> +    Memory UE Error           error_mem_ue       Trigger when Memory has UE error
>> +    Memory UE Error overflow  overflow_mem_ue    Trigger when Memory UE error overflow
>> +    PCIe CE Error             error_pcie_ce      Trigger when any PCIe controller has CE error
>> +    PCIe CE Error overflow    overflow_pcie_ce   Trigger when any PCIe controller CE error overflow
>> +    PCIe UE Error             error_pcie_ue      Trigger when any PCIe controller has UE error
>> +    PCIe UE Error overflow    overflow_pcie_ue   Trigger when any PCIe controller UE error overflow
>> +    Other CE Error            error_other_ce     Trigger when any Others CE error
>> +    Other CE Error overflow   overflow_other_ce  Trigger when any Others CE error overflow
>> +    Other UE Error            error_other_ue     Trigger when any Others UE error
>> +    Other UE Error overflow   overflow_other_ue  Trigger when Others UE error overflow
>> +    SMpro Error               error_smpro        Trigger when system have SMpro error
>> +    SMpro Warning             warn_smpro         Trigger when system have SMpro warning
>> +    PMpro Error               error_pmpro        Trigger when system have PMpro error
>> +    PMpro Warning             warn_pmpro         Trigger when system have PMpro warning
>> +    ========================  =================  ==================================================
>> +
>> +Event Type:
>> +
>> +    ============================ ==========================
>> +    Event Type                   Sysfs name
>> +    ============================ ==========================
>> +    VRD HOT                      event_vrd_hot
>> +    VR Warn/Fault                event_vrd_warn_fault
>> +    DIMM Hot                     event_dimm_hot
>> +    ============================ ==========================
>> -- 
>> 2.35.1
>>
> 
> Why not just put this in the driver itself to be generated automatically
> instead of living in a file that will never be noticed if anything ever
> changes?
> 

I'm not sure what you mean by "to be generated automatically" but 
information can be documented in the driver code itself and in the 
Documentation/ABI entries.

Will drop this file and move them to both the driver code and to the 
Documentaion/ABI entries in next version.

Thanks,
- Quan
