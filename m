Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0718C4E6EA9
	for <lists+openbmc@lfdr.de>; Fri, 25 Mar 2022 08:15:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPtf56pJBz30Bc
	for <lists+openbmc@lfdr.de>; Fri, 25 Mar 2022 18:15:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=tFY92wS9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eaa::704;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=tFY92wS9; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20704.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::704])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPtdY6Bqjz30D6
 for <openbmc@lists.ozlabs.org>; Fri, 25 Mar 2022 18:14:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aG3MZof8SebsTrC6fjwEI3tvgUHG1EArcIwUF8yxP3uXkJQTY9LzWpG0oZbEgkMX8yw0cUbW+qG0sHalYAbChi7Akp25BvAVg6hgLOvHfVu2/GEpuSdxIX3xvcdOZqWz0aBlM89uvJ5+z3wva3f89vCLyTryZKbG+KRfZeUK+RzL8D7W+SzJ4+99O6grCyNxV5bV4O1ZEOLg8nAIs3VvNkhS14xOV1Qw3kYH8puqbIUbiEnQRytf6BFBLI/zwmpIrbPSxIcOdxphuDTu0bWRKCB3mK6fj3zshrMJCXH0uW2HpqrhKPDio8eDrmpjkqMLwTqsy2S4kWSLjvTZy464xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N9+N1K229mRbayj/wys3v/AgMptJmcUQvpBhO5YaIcM=;
 b=M6Gh5lxS1Rz65ZCyYPmYXIP2ZU9fNsrAoc90XicGTMUjZtZjIRuGpKa9IMlDqnwTTldchOjAVtDx72fwOuE4lUzg3yUAgUZh45vjRUZS3P7AgPRiCwvXmrFyXRU8zZEbaBmcrTUIA/WtfJZPiKdytRWKJ6Xkcce+QgD8gSqE7Bg7uW75k/lNgnULGYuALU44TXNR7cy8bzv88PIfpoi5fq3NlTiicbAd15ftu6O4ytu5yJw67oZSP4OAnotCfrfN35+E485wihsxOCPOoUbWg2BII0II6H4JwaE2ddhxYUf+bKpa+4SOPQ9mYLjpJdhBDVAsmI5N3nMjwZAtYFCEpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9+N1K229mRbayj/wys3v/AgMptJmcUQvpBhO5YaIcM=;
 b=tFY92wS9AH2lVSNrjhAJWTTxfPH/I0zT5BLb9GiKEMdN5h0hwjNSpalR6QAnjSGfNZZEswMlt7Fx2Fv19GcWFZNUGpiv6xGNR+Js825Sv7LGYG/VRFcOcDnNVemsLsTdbI9m/DNQwpyHkWEGuyQe0fFBgJr/eIwtMWUCVmKKuag=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 MW2PR0102MB3465.prod.exchangelabs.com (2603:10b6:302:5::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.18; Fri, 25 Mar 2022 07:14:38 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6%7]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 07:14:37 +0000
Message-ID: <0d8605f2-0556-3b83-998e-823b924b9a1a@os.amperecomputing.com>
Date: Fri, 25 Mar 2022 14:14:24 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v7 5/9] misc: smpro-misc: Add Ampere's Altra SMpro misc
 driver
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220321081355.6802-1-quan@os.amperecomputing.com>
 <20220321081355.6802-6-quan@os.amperecomputing.com>
 <Yjg1nREijopyA+8A@kroah.com>
 <e9f92650-4f7c-260d-8aa2-92d1c84bf74a@os.amperecomputing.com>
 <YjhNP+Jzn/z4+5Zw@kroah.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <YjhNP+Jzn/z4+5Zw@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::6)
 To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01dfc0bc-c229-4c92-8aef-08da0e2f1f01
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3465:EE_
X-Microsoft-Antispam-PRVS: <MW2PR0102MB3465F56E5B4A09BBDAB7D949F21A9@MW2PR0102MB3465.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PBxdOvT2EVMR5IBGa66eunnrRdmugOljVY8v/G7my8olN9b1KnE2ktqpU0npCgVn169FjxIrEBJPlL5OXLl7cvPgL8brtAOwObHcCWRj7YmfVk9U+n/5mW1X5ZrRrqtJOeOaL7m3oAvmMBwxnoF3nDPpYPynd9dTKP8iPsHbmnulV3GYixBklbFN2M984ejtENYJBHd4at0ACy2jmTYs4FHDVD91ZyZPjoSoXgdO2wLksQPv0WU5gWPmQmh4OVQiVdTclRACYTNrg+RdrvV++bpET+v60xRgmW0srB6LzmN4+lHqhNVCeL80XziMXRLBU0YjGRBXIl2UOU2qk3CHsVDApiFXVHP+9wrJobAhaBLfpuNsrkcfPU4pDO+61p/FcPTQkDCt99fzXEiDbWMMLLiyxvwfEc5g3P3HOqhvFQTvXf9PFGj2MAviDh6y7l5tWHE/UF3CGTZPbCj3ofP3Npb3yh+g23Q8U3qh7STwXXmggDf0M9Pw+63NmetfW3Kk7e7oZAMWR9bbIYpchozm7P50dUkOzs/MkX6QEIL82qZT/JLVAP15Hj/baDoKsnqMDBK7kbJYFn1Jbe3V4ZH9jQwSllotDEmOKCXmR/SasRBx3meBwwlibgBm9GxbEyL9lVN+1MDYZO8/4y6BZmhSUlqTvuCKy4ODeBaxRAr6JKYgp6xvyqblkbsqWru7FGRt+vy3EepOMHS9+Hl1/ETXBlgzkVjnjOAok8CdPI7qwEDw0R/H3YKJPkKKmdhZ2iai
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31686004)(8676002)(38100700002)(83380400001)(2616005)(86362001)(31696002)(53546011)(6512007)(7416002)(5660300002)(6506007)(6666004)(8936002)(52116002)(6916009)(66556008)(2906002)(38350700002)(54906003)(316002)(508600001)(66476007)(66946007)(107886003)(186003)(26005)(6486002)(4326008)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmVMYk1xeUZKSC9aQ2lCeG9FWEp3T2xJNHdsOGtzSUZ5OXlMdDBiV3hqb2g4?=
 =?utf-8?B?K2h2SlhYMUxoMzA1aWRPV1VpeDIwOSt6WGtJNFptZnpkbW5ENzVoc1grY080?=
 =?utf-8?B?d1psdk9vQTF3QVlSeG4zRmthYzF1SUFRcDEzUC9rdDE2NzVac3M1ZjhWTmZl?=
 =?utf-8?B?T3Q0SFVjNnE1VThsdGFCS3dQM3R4bFI0U2xKSWZGWUxEaUZLcW9rK1FscElE?=
 =?utf-8?B?UzFzVDlIVnlVVlA1em5GdWZBWkJpY0k4emV0NldMaS9xTDdKWFZaOGphMEZB?=
 =?utf-8?B?S2FFN2VGbVNlSUZjaFpyK0o1RTl5ZUZVSTNBdUtERFowaExrR1IwcGFvZlVx?=
 =?utf-8?B?VU9xbEswRndJaVg2WUVCNDF3OGFPeWsrQzNlR0U4WFN4c0wzam5zYkoxRGhV?=
 =?utf-8?B?WmR5NEJOZ2swdTJpZXZwSTN5VHJjVXZRTVlBSmU5VDlualpzQUg4VjlFNWUw?=
 =?utf-8?B?UlJvSGF2WGxVOFlOcGhvWVAveUpkaHorQXBMdmkxemJ1eXVXQTJvY2h1clVL?=
 =?utf-8?B?RVVsbktRdVU1VGE2Yys0MEYzWit6dE5wOEVxazR6amVRZTc2Vzg3d3RMYkc4?=
 =?utf-8?B?b3l6UFoxMXUvN0hod0RTdi9lS2VTMGFLK1E3ZzVRR3JmSXdLNFlrWjNkdEVI?=
 =?utf-8?B?WEsxUW1IcnpDM3Q4eG5oNHk4U3lFV3JDc01BOGdJWHovQXYwRWNKQnIwR1Z4?=
 =?utf-8?B?RTZkWmxDUmRCZ3l1ODQyak1WSndQaG1LcVpSUFZGY0d1QTV1RDdiM3h1YjJN?=
 =?utf-8?B?eDkxWS93bWMrWGRKZHduS2JzamMwc095S2VYYmRoQlkzYzVOS3J2endDYkVw?=
 =?utf-8?B?N1lSY1lCcnl5VFQxRUcvd2hPQVROZWJubW1JWmRUY2sxZmhTMEFibThCZTE3?=
 =?utf-8?B?M1dLOVRRSEduUkdsVFNoVGlQVU1CcVd4aUtnVkQ1V1AxSFZtZXcyOUhsdFpM?=
 =?utf-8?B?Y1FLMURHcUZ2dU9GWG1SZnJ0WnBCTnU4aUlMQXM0TFpMcTExVmdNREZnMEhm?=
 =?utf-8?B?dkl5TVFGQXFjM3NSQUpGUnZMakY4aEw1dkVTZ3pUc3ZNWEJzblJla0cxa2dN?=
 =?utf-8?B?WGhSR1JvaU9uVFN0bWdBejF2dWZ0T040ajh3blQ3ZlA5TXVzOVBXQXZPMk51?=
 =?utf-8?B?Wk1TZEFsSG1mTmFGOElnT21sM0t1YWlIQjE5aXZ5bVpYK256eTB5Q1Q2M3pI?=
 =?utf-8?B?c3VnQnJ3M2Z1RU1Qdm1KMVNXTmtzZ2Jzb2ZmT2w4clhZbmNaV2lCZ0xaMlcx?=
 =?utf-8?B?aWo4dzNnOEp6QmhwYjFVdEJrUDJFQi9ZR28xZHFEUlNCSFlNOWV5dkNIaXBl?=
 =?utf-8?B?Y2ZNVGFhWEMxbzkxY1J6L1ZSbXJGdThNZ0h3OUlvWHprVXdDT1hkeTFsRWZ3?=
 =?utf-8?B?aEpiaVZYaUNLVXN1OHhkTDk3QWVSNkFkcm9yMm5KZUxJMXBrNFlsV3NESFJa?=
 =?utf-8?B?MzdvZEJGbWw4NjltZG9NdHY2Q2FqaklPQXFCQ2dxeWsrbkF0SDVaN0JvVDB3?=
 =?utf-8?B?V05NWVhTbjM4QmN3anA2REFTRGlaL2IwakJnRkExVmlhTUJQZnhEZU1XeWtG?=
 =?utf-8?B?azlJRjNhRGRBRUdVTDJNYUFaRjJoSmFielhxSWxPNjBZTTQ0UFNFWDdJKy9p?=
 =?utf-8?B?SEovK2ZhN3Ewbkxndk1yZ2l2MkNlY2psRHI5ZnpNd2hBRk9BRFI4MlV1WCs2?=
 =?utf-8?B?bDVxYnV5ZFd1T1dqeDlyaXR5S3hXVWNJN0lzQ25PQjI3eUNZbHJFMWRzSnF1?=
 =?utf-8?B?cGZEK0p6aTJhNERYeFN6dERXRjloaEdjMjFKemljdVhnaTRhNm9rZDczdXdD?=
 =?utf-8?B?VGVrZGIxVzJzdDVDc3diaSt0UnZ3VE1QanROVE55YjdaYVcvM3pDWk0wa3F0?=
 =?utf-8?B?M1c5YVB6YUM2bzZVSERMeTlaOGNySmhiMlN0OURrY1JmUDRBZXJ1dzBKUVFQ?=
 =?utf-8?B?ZWJDckVlbDZhem9NNWpyUlFMcnlwWDUybUwzbWFyYVBGWFprU0JLYWJEMWkz?=
 =?utf-8?Q?biDwm/7z0aHrvYgoI4cjb9fSyX0VV8=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01dfc0bc-c229-4c92-8aef-08da0e2f1f01
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 07:14:37.6555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 845t9BOadNgylpYl9b8UwTlaWA6hOsEAEvx8zESCe5C96XcCFBpTguDAUU6tXBmQ5WjqM7S2NtOb22vrxSfrtPoOnCsSZb9vaBUHm0nMbpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3465
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
Cc: "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Phong Vo <phong@os.amperecomputing.com>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Thu Nguyen <thu@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Open Source Submission <patches@amperecomputing.com>,
 Lee Jones <lee.jones@linaro.org>, Derek Kiernan <derek.kiernan@xilinx.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 21/03/2022 17:02, Greg Kroah-Hartman wrote:
> On Mon, Mar 21, 2022 at 04:46:50PM +0700, Quan Nguyen wrote:
>>
>>
>> On 21/03/2022 15:21, Greg Kroah-Hartman wrote:
>>> On Mon, Mar 21, 2022 at 03:13:51PM +0700, Quan Nguyen wrote:
>>>> This commit adds driver support for accessing various information
>>>> reported by Ampere's SMpro co-processor such as Boot Progress and
>>>> other miscellaneous data.
>>>>
>>>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>>>
>>> No Documentation/ABI/ entries for your sysfs file?
>>>
>>
>> Thank you, Greg, for a very quick review.
>> I have put this file in other patch.
>>
>>>> +static ssize_t boot_progress_show(struct device *dev, struct device_attribute *da, char *buf)
>>>> +{
>>>> +	struct smpro_misc *misc = dev_get_drvdata(dev);
>>>> +	u32 boot_progress;
>>>> +	u8 current_stage;
>>>> +	u8 boot_status;
>>>> +	u8 boot_stage;
>>>> +	u32 select;
>>>> +	u32 reg_lo;
>>>> +	u32 reg;
>>>> +	int ret;
>>>> +
>>>> +	/* Read current boot stage */
>>>> +	ret = regmap_read(misc->regmap, BOOTSTAGE_CUR_STAGE, &reg);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	current_stage = reg & 0xff;
>>>> +
>>>> +	/* Read the boot progress */
>>>> +	ret = regmap_read(misc->regmap, BOOTSTAGE_SELECT, &select);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	boot_stage = (select >> 8) & 0xff;
>>>> +	boot_status = select & 0xff;
>>>> +
>>>> +	if (boot_stage > current_stage)
>>>> +		return -EINVAL;
>>>> +
>>>> +	ret = regmap_read(misc->regmap,	BOOTSTAGE_STATUS_LO, &reg_lo);
>>>> +	if (!ret)
>>>> +		ret = regmap_read(misc->regmap, BOOTSTAGE_STATUS_HI, &reg);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	boot_progress = swab16(reg) << 16 | swab16(reg_lo);
>>>> +
>>>> +	/* Tell firmware to provide next boot stage next time */
>>>> +	if (boot_stage < current_stage) {
>>>> +		ret = regmap_write(misc->regmap, BOOTSTAGE_SELECT, ((select & 0xff00) | 0x1));
>>>> +		if (ret)
>>>> +			return ret;
>>>> +	}
>>>> +
>>>> +	return snprintf(buf, PAGE_SIZE, "0x%02x 0x%02x 0x%08x\n",
>>>> +			boot_stage, boot_status, boot_progress);
>>>
>>> sysfs_emit() please.
>>>
>> Thanks, Greg.
>>
>> Will switch to sysfs_emit() in my next version.
>>
>>> Also, this is 3 different things, put all of these in different sysfs
>>> files.
>>>
>>> thanks,
>>>
>>> greg k-h
>>
>> Actually, no. It is single value of boot stage.
> 
> You are displaying 3 things in a single line, those are 3 different
> things.
> 
>> Let me explain:
>> The boot progress consists of three things together: boot_stage, boot_status
>> and boot_progress and they have no meaning if reported them as three
>> separate values:
>> + boot_stage is to indicate the boot stage
>> + boot_status is to report the result of that boot_stage: started, complete
>> or error.
>> + boot_progress is to report more extra information for the stage other than
>> the boot_stage/boot_status.
> 
> Why are these just not 3 different files?  They describe three different
> things, please do not EVER force userspace to parse a sysfs file other
> than a single value.
> 
Thanks Greg for the comment.

As there are multiple boot stages that occur even before the firmware is 
able to report, the firmware will stores all the stages and make them 
ready for later access. Later, on each access, ie: read to sysfs, the 
earliest boot stages will be read out and the next stage info is made 
ready for the next read by clearing the current reported stage.

As these three piece of info only make sense when put together, we chose 
to providing a single file only so that when the sysfs is read, we can 
provide them as a single value and do the clearing so that the next read 
will return with the next stage.

My intention for next version is to report a single 12-byte hex value 
for this sysfs.

- Quan
