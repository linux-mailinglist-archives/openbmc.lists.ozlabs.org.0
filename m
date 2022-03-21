Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FDE4E2399
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 10:47:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMVCS6sN0z30Kj
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 20:47:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=GRNQ3syM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8b::70a;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=GRNQ3syM; 
 dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2070a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::70a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMVC15xHhz2yxW
 for <openbmc@lists.ozlabs.org>; Mon, 21 Mar 2022 20:47:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYrUiMFLd7nOUZDfH43VI16lOLZff3PgohhyQy/LXhAMGrhBk95K0/e9ZRLPab3klYwGNuLjrYgEnzbsscIppXptzcSGuIl32341m0nBKIiPdbIHw20NXyxU7zsY9xRjHBZ1F9JC8tRzky0pmvd2Wvs6feX8OA3x2TnFSVcpauej4hmDTPOMYluwnFgGt8OT0mdG4+omdhlT6Ys21WAYp+YubqL9wXJn/pAWSkTdIVPPl5Skl3c0M/Hro/8l1NhHh7HwMn2eDQNSYD1bxkmU4YwnkEJZr0J0BOukTsNDAEbuY/M2J/T/Os/cdPYl2G0DVfTyWEK9xrq2mmx0mcgZCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlXjFh9ZGSYjymspz3NVf/3Iii+bAImAkYO6nQ6oZU0=;
 b=XqspCN5oX3kc8st98HuwHcRCG0w64/Xw/OIVNBxq0D1axIO2kaM9ZjghyBgu56qxQ+ehuJ3IQhHin41DET2odxehTFgbtj04exCZsvz5oyKtBe/MLhWgN/wUHBODPMb1ajmjOmLjiiC1ef59FXdVobo33Cvlw0sgEglBXk1aRqYAd4oUmnea+HON+qfBZXs+ABL7Cmd+YWH99ROi+AvIIaHTDv0tzdW2HN0YKEbWLMiLKcFrnvGOmBWaObsW1PQXeyCQtiXW9VuiAHerZJxMYkWfE21K0IBcz2ic0WY4v7i3TPFPwDOm93K7ca8+Qczp8M68eVCGzEsNS+L8/OWUHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlXjFh9ZGSYjymspz3NVf/3Iii+bAImAkYO6nQ6oZU0=;
 b=GRNQ3syM9DITzMpnM4fXQ6T4lsjzmbSmS+AzO45D8349mrdrLSHLf539T5dCul82FEHJLwEa0RM5pHKKU8Eel7tQRzeOqH3nMllRDNiLqL9JlKrz4M/i0tzeKOPFwgqWXED6kxbTIOLQwSBmwHTkvhUk6rQGUyvLLjAYrjvDjWY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (13.101.206.88) by
 PH0PR01MB6667.prod.exchangelabs.com (13.101.39.79) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.17; Mon, 21 Mar 2022 09:46:48 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6%8]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 09:46:48 +0000
Message-ID: <8f01a63d-0d10-81ee-7398-b69e496964f8@os.amperecomputing.com>
Date: Mon, 21 Mar 2022 16:46:36 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v7 9/9] docs: ABI: testing: Document the Ampere Altra
 Family's SMpro sysfs interfaces
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220321081355.6802-1-quan@os.amperecomputing.com>
 <20220321081355.6802-10-quan@os.amperecomputing.com>
 <Yjg2AkYOCTi2CXc1@kroah.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <Yjg2AkYOCTi2CXc1@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:202:2e::17) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55cd84e3-361f-4b7a-67a0-08da0b1fb771
X-MS-TrafficTypeDiagnostic: PH0PR01MB6667:EE_
X-Microsoft-Antispam-PRVS: <PH0PR01MB6667D7F5035F6759862A801EF2169@PH0PR01MB6667.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iel9N90c92GVQLQJBxGSXQks1dvmkwlF9+i1fUeVO288oOEpfFLCuLNznGZDl3Q9Ud5jmPL6Em0mus6UEREUaJZqi0Xho9wkyuMLBFGF1JWevqoWzkJKj9aHyXX14sD6zj18OM8UDf1jEq+SONvldEHViQqoMvDWWhHyXxb3ZHpeJd3giP7yqmko0L9WpUAp0IQ4lqLL+nKLr/fdH/NB4dOsTmMgNMgLvq0RIhhLvN3qM6EGPuhPLY6GCLN7ePLBVrRjerpCaaoSbZXXxPSdeMsIWfls4YQMAMUMQXxbsfPvWVXtnMp17y2a/7D0SGIeQMCNd9qnX+NEvEkZ99VFhOrOJwOlOGtt3ry28APRKXBF5WrQAqd7YugTQ4mb49hF/+HYFGOvn5So/XFFk1actQFvjP0OYa8qC6k4izOxPpSzEdJj5ZaHCP+4c7d02uwEuIlLVrCn9/U9imlw6Ddo0DxZ2Up3vOKdkWpNKVl5k7zxKdUaZnA6Pi4aUWCoybfZIBAxRLn7VUmGC1+yq5dnoZsrLJ7qYaB1Nq8H6yS7y+IcO0dwFWL1fBpqIDnxb5XXz6t5jnqkE5LwPaad8yXlgm8C32e7W/GnUlTCWs5xDR/5OPHdsLWi4cUc9GnJVM2PS9m98zzdx9GnNA4XLiPbt+fSeLXo74AdQAXsvxR2sQ8Lhh9W6ywyPTyTcDqCialFHgcD6Dv4nV5UuHmUmD/Nfu0JMvWtqYcxqmTdWvV7dQRyrg0XZ5c4JGj21r0GGlvgHn0sdrknj8nVB6ddBRQ+mrQ0q49IlCANviY/P1Miqm7R+Gp3KhmgbIJbBBaN+8Jf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(66476007)(66556008)(66946007)(8676002)(8936002)(2616005)(6666004)(6916009)(54906003)(107886003)(316002)(2906002)(31686004)(52116002)(53546011)(31696002)(38350700002)(38100700002)(6512007)(508600001)(86362001)(6506007)(186003)(26005)(7416002)(5660300002)(6486002)(966005)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3ZuT2oyMzMzekVCREl0R2ZpZkVnYVI1MytLZGRqcEc3LzFseVJ3TkRQdXJ0?=
 =?utf-8?B?SnZ1TVM4QVk1WGZGZnBNWHF5OGZEYmRMZ2djeENiK1duNG9mb2JySGhreDRH?=
 =?utf-8?B?WmVSdHAraWVjSEVTa0wxQ0FxS09NS2QwdXpzWUgzbmJBRnlqTHBmMEducmhG?=
 =?utf-8?B?QkZRWTVxa2s2RmxTbkNMR1U2cDhjWFJMUkErM1NOUGZpRk5vbFlEbjBMeWM4?=
 =?utf-8?B?dmxmVy9zQURoMXB0dHRubGdXbXAvSzZZY0pyYUJSN0h0MC9aZ3crcmh6MWow?=
 =?utf-8?B?dXRnbHZvMmtRMGpjYUw4Q09pRmVWNHVkUE9rZU80a08yWDVIVC9TbVY4bEJ3?=
 =?utf-8?B?Tit0T0Vlb3hvVU00Q2NkMjFCTFAwWGZiZWpwMGlyUGsyam5ReHlFZUg0Z2Jr?=
 =?utf-8?B?ZXFRMlB6bTMrd21BYndtZVVuZ1krblY3L1JaclRGU2I4ZjBXdEhmUmgrcWdP?=
 =?utf-8?B?RkcyaEYzUnkxcHJ4SDVPQndXbTdaZjhlWFM1OHh0dU9FcHpUWC9zcDNOdFlI?=
 =?utf-8?B?dlkxMWdCS0JkM0VraGRpaUo3OUd4WFlZei9zWHc4QmhYTjFYUTFkYllIcTFP?=
 =?utf-8?B?UitCODI1RHlLRCtKSy8yYTZscnFNUmMrVHlDSlpHU0o0LzRsNnQ1SG80VTUv?=
 =?utf-8?B?cUZZakt3NkprZCtvcFR4cmdqOFY5SnJLOGpmdHlIL0J6d3RjWC9DRWptNXRu?=
 =?utf-8?B?eElVQ1FLMCtjc2h4QnFsbzRQeDN2R0JRLzBJYUdIenVBUWsvekFqNUNuOS93?=
 =?utf-8?B?MmRUcXhyMkhZK1B5NWRQelBqcmxwWEdTbjA5YWJQaUhKMTd2SjhaYjlOeWpO?=
 =?utf-8?B?YmRlaTdidkxuVERGb0l2NHlzOVdFRGxBTFYrMVZDQ0lYMnl2K0RnQmRFc2h2?=
 =?utf-8?B?c2dDMFhPTXNvMHJTQUREcmE0MW5GWmNwSlZmNm4vLzZNQmlGK0tnZkIxZG5p?=
 =?utf-8?B?bk1EOXNic3ZEYldtT2NKK0pyTnVpbnJOcmErMG84a2pUcVpnd1VFQnplTTA4?=
 =?utf-8?B?b29xU0prRGY1enZQdWFUeVN6UXlkbXNoT1dZN1RwVFBEL0doVHNEZGRGMTR4?=
 =?utf-8?B?cHRPcjZhVjgwMzFSWnNsc2lVRE1KRWlXRU5EWEFsN202Y0ZDd2pnRmExM09R?=
 =?utf-8?B?LzdHQTdZUFo4QlptZ2xNUnY5RG1MNUcvL2NPbGt4MHhncW1GUHdxMVNKSFYw?=
 =?utf-8?B?czNFdkdkekNPb3JrSkJLbWlwQzROeFp3SFVFMzhBREJHdDVUUDVuQmtZanZQ?=
 =?utf-8?B?ZGluY0pYeUhkYWU4by9VbkZzT2lXbE5UU0s0OS9kN0hjdE96WGJ4QjdKU3pD?=
 =?utf-8?B?QlhqNnVaUnZ3U3ZZMVBONVp2UFV2Y2txS1dNdXg2RWNJM25KVi9aak9QY1Bt?=
 =?utf-8?B?ZXlGK2QvRXk2RFd2Sks5MmhIQmFQVG1TejhKMmlJVVhoNWFBS2NUcHl1RXUz?=
 =?utf-8?B?dVY0OGUweUhSYUx5SVB5WlJEdEExNG42anRrcTQxNEtYUFM2RXdWS0tDRmhs?=
 =?utf-8?B?aW40UUN1T2poSDY1RnlYa0pROVlFR0d1NUNKdWxlcC9ISEZBdnl6RG5mblE4?=
 =?utf-8?B?U2g2dmZCZGttbkkvL2RKUTRZa09yU0R3MHZKS3NBNUNRL0h4c1ZQWEYvYlVQ?=
 =?utf-8?B?eTdNTDRKVnVnWHJnT1pNMFJGeEpVY28xaUVjcVZwT3BiQzBndzRGTjIrMmZh?=
 =?utf-8?B?TWVSSmV1MzZJOTNzb3Z3K2FjeU5XOERXaWZTaE9SWEI4NFUvNmphV1owQkp4?=
 =?utf-8?B?WVQ5WEsvRGQwQXRhUTZXQWMveG5FQjJ1Umg2WnJnYmMrUGhyOU5teDlDYjUr?=
 =?utf-8?B?alplcGVUd1VxdXZPR2hFc1luN1pVQ0RYa1BLM2tva3BlbVdHcGo4b3hUV2lN?=
 =?utf-8?B?eThkdXZ3V25OdkhWSG1VZHlVTm9TWnhtdXlhYXZvRUtRdXZLKzFMRzk0OXgx?=
 =?utf-8?B?eWVic0NjcG52UDltR2h4NlFBZlhqRkl1MTZlWTNrNld0YzZIWkpqNm5kSCtv?=
 =?utf-8?Q?HqAywV6SHKETKR6cL7WizF+o0jA1w4=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55cd84e3-361f-4b7a-67a0-08da0b1fb771
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 09:46:47.9963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3tHxSEjWFwNwpjs6uxZ0yBDeAKQYSRXXbEJ7X/QQkUeBS88XmZw+K+pVer6N1ifW/juPWRSthfgSiS6cHoFxhoYWNMgKiuDKicED4ywKLSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB6667
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



On 21/03/2022 15:23, Greg Kroah-Hartman wrote:
> On Mon, Mar 21, 2022 at 03:13:55PM +0700, Quan Nguyen wrote:
>> Add documentation for the Ampere(R)'s Altra(R) SMpro sysfs interfaces
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>> Changes in v7:
>>    + First introduce in v7     [Greg]
>>
>>   .../sysfs-bus-platform-devices-ampere-smpro   | 133 ++++++++++++++++++
>>   1 file changed, 133 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
>> new file mode 100644
>> index 000000000000..9bfd8d6d0f71
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
>> @@ -0,0 +1,133 @@
>> +What:		/sys/bus/platform/devices/smpro-errmon.*/errors_[core|mem|pcie|other]_[ce|ue]
> 
> Please split this out as one entry per file.
> 

These sysfs share same format of HW errors (the 48-byte Arm vendor 
specific HW error record) but for separate HW domains: Core, PCIe, 
Mem... etc

>> +KernelVersion:	5.14
> 
> 5.14 is a long time ago.
> 
>> +Contact:	quan@os.amperecomputing.com
>> +Description:
>> +		(RO) Contains the 48-byte Ampere (Vendor-Specific) Error Record, see [1]
>> +		printed in hex format as below:
>> +
>> +		AA BB CCCC DDDDDDDD DDDDDDDDDDDDDDDD DDDDDDDDDDDDDDDD \
>> +		   DDDDDDDDDDDDDDDD DDDDDDDDDDDDDDDD DDDDDDDDDDDDDDDD
>> +		Where:
>> +		  AA       : Error Type
>> +		  BB       : Subtype
>> +		  CCCC     : Instance
>> +		  DDD...DDD: Similar to the Arm RAS standard error record
> 
> No, this is not a valid sysfs file, sorry.  This should just be one
> value per file.
> 

This 48-byte value is unable to separate into smaller values because it 
contain all information necessary to indicate a single HW error as per 
ARM RAS supplement document [1]. The format is to make it read-able 
other than a single 48-byte hex value.

[1] https://developer.arm.com/documentation/ddi0587/latest/

> 
>> +
>> +		See [1] below for the format details.
>> +
>> +		The detail of each sysfs entries is as below:
>> +		+-------------+---------------------------------------------------------+
>> +		|   Error     |                   Sysfs entry                           |
>> +		+-------------+---------------------------------------------------------+
>> +		| Core's CE   | /sys/bus/platform/devices/smpro-errmon.*/errors_core_ce |
>> +		| Core's UE   | /sys/bus/platform/devices/smpro-errmon.*/errors_core_ue |
>> +		| Memory's CE | /sys/bus/platform/devices/smpro-errmon.*/errors_mem_ce  |
>> +		| Memory's UE | /sys/bus/platform/devices/smpro-errmon.*/errors_mem_ue  |
>> +		| PCIe's CE   | /sys/bus/platform/devices/smpro-errmon.*/errors_pcie_ce |
>> +		| PCIe's UE   | /sys/bus/platform/devices/smpro-errmon.*/errors_pcie_ue |
>> +		| Other's CE  | /sys/bus/platform/devices/smpro-errmon.*/errors_other_ce|
>> +		| Other's UE  | /sys/bus/platform/devices/smpro-errmon.*/errors_other_ue|
>> +		+-------------+---------------------------------------------------------+
>> +		UE: Uncorrect-able Error
>> +		CE: Correct-able Error
>> +
>> +		[1] Section 3.3 Ampere (Vendor-Specific) Error Record Formats,
>> +		    Altra Family RAS Supplement.
>> +
>> +
>> +What:           /sys/bus/platform/devices/smpro-errmon.*/errors_[smpro|pmpro]
>> +KernelVersion:	5.14
>> +Contact:	quan@os.amperecomputing.com
>> +Description:
>> +		(RO) Contains the internal firmware error record printed as hex format
>> +		as below:
>> +
>> +		A BB C DD EEEE FFFFFFFF
> 
> Again this isn't a good sysfs entry.  You should never have to parse a
> sysfs file except for a single value.
> 
> thanks,
> 
> greg k-h

This error is also unable to separate further as well.

Thanks Greg for the review.
- Quan
