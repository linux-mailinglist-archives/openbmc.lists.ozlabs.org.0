Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 734265F6209
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 09:51:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjkCL2GXYz2xHw
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 18:51:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=REsG+Fb2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.95.91; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=REsG+Fb2;
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2091.outbound.protection.outlook.com [40.107.95.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjk6f1Qhgz2xfv
	for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2022 18:47:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQWc/3tCibQdhcxgxGWm6mDg8P/EhijJS6EnLg5RQLZ/ger+Lz7qV2jtMFKLOoh96kvzXk7al1n39VOqQZL4Fy0vgYg0MjeMhfJF3fGq4Q+cP6bTgbfBGLYhKdbCoFqR5KzGaSD7MrnZfZAOOcVkq3Kbsc5czq32Godlx5Kv6pEqSABl8dZu9DKG5b+P6msMmJCyuHPe3Kv9088LpS5+fowFKGSeQSpne1J4NVAbfBTqSSMemduPFEGAc8uqft2UlR6VKkfRA/vS7W3su7HnGmY+dgEiirnirgIwR0p6APZ43GH4TnrlrY4jqEFNf8LgxZ3ZbPo5mekGbU1kCy6RRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gJlGuWPnYVuWgThQg8kGAIbcXslAHwW8zhAc38G4QuU=;
 b=hVbos3TitcymkfwgV2IKpWR0InNthAeEdC7jk+D2QAPg/oLdcrmTFniIpFipWX9yL7NcM1VYBVou9iGoSVnkw/LqLtlrkZC1mehMEsSNUzUPger/2QzCnAaDwyp30Mv3WkssGtXziVQSLS4EMnfekiO2X4g7skpogsbkDSRFT7Sb2OenBKZ9dGrZwoDdXZIFWraNxJmdvPj+VVlhU9r6QvdsSHNpX9MPN0qbYbYW6/SpWhCJsd3lR/5QbjSICzPAOIhVqA3M6tjTs3/1tMF5L4DKNoIRaZ0PX4MbHaIaM3NRYHJbyNgq3WJCwEsuGOwmFN7RWRgWw5NTiPVmEM4ANg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gJlGuWPnYVuWgThQg8kGAIbcXslAHwW8zhAc38G4QuU=;
 b=REsG+Fb2Qcxqw6b7/TfDZtSUJxDyJAhuyRsjFGXoPFr3KwZWllu5C60gxqpnXQepVbWNZWepXOQntiY5S73ODAkFgZ0DkBRE4gnvFybpF/A3ASaEzITDdXxDkmhEO+VH+RcCtkZcLFP8wf1OWCIi6TWzkjPeAmDcTYv1Wb5Vr2c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BY5PR01MB5796.prod.exchangelabs.com (2603:10b6:a03:1be::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.20; Thu, 6 Oct 2022 07:46:59 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5676.032; Thu, 6 Oct 2022
 07:46:59 +0000
Message-ID: <71c965a2-dea8-6681-3032-0adff805202b@os.amperecomputing.com>
Date: Thu, 6 Oct 2022 14:46:47 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH v9 4/9] docs: misc-devices: (smpro-errmon) Add
 documentation
Content-Language: en-CA
To: Bagas Sanjaya <bagasdotme@gmail.com>
References: <20220929094321.770125-1-quan@os.amperecomputing.com>
 <20220929094321.770125-5-quan@os.amperecomputing.com>
 <YzbrgSE0958gjjgj@debian.me>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <YzbrgSE0958gjjgj@debian.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0122.apcprd02.prod.outlook.com
 (2603:1096:4:188::10) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|BY5PR01MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: d4e45656-87ac-458b-6853-08daa76ef2dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Sy6yfbAIi+bwOqVSXixZkcTqgfgo/dcW+QBOlGSjmkYwuqNdi0uQQA0jVrKyAoWJ8BIpF2R9lzZ3EPYg0fX5vMVXO2+NsS5hpd8fMlJXX+VVpR0p1ZX8uDTfpjBszGOXcAgsB4B39cV4CaTt2n6ffy5KMhlFOgI/6Zs0oZXyKLHVeZGZiqfkrn6pRCZjyrR6BSVGzOLk5ubryu6pTMzBqH9bMX5gwva2b7eIjtY8AExpomtLw4plUJlnjQ3jSJ0mvkA8RkAKHnTzDosGq9lZHbOAHwG40RViipiQUI+USMsbY+CXGVVG7iZ7StDBIbTa2q3ry27at+kP21j6QkPz8SLI8DWbgy4EEkbSIzso/ax83TtM9tK2ViYyJ3tznjM7dhodMKApSy1E3ZFhHi66kiVqVVROSa8S1mk8f80NdhUOg9BkHozf9mlJAaeXoZ8LamVr3bzbSVu8YeDxa1IzFhHaZkpipRlAmmyyG0Jz3buCCVAIBeqTitaKSJ2KGgs2GbXjrduLOg0Vx5tb8n0CWfU15+ToP8psMA7JgXNDLUKM7UcwQqt4KR+5X4mQbnnL5PmlWvWdyqTd+O6FFLsb7fGZCyxDIywQvf7BizB8EfSXPVf1wXaNIAtw26QtUV/IcXD5eZOVlGz0IpbCH0zWMqkMJzDT3yQ7g7Wg/iB3xSReaMpwitjgvN8sICS9z971dmM074gld0w5h4hG67XBxQ8XFD1jfoW/ZmjFX2TMKaEQEHTeUVc3MySeSwn5rCIHLoeePm1CDskpHU7tgfChOvSXzH1oQ7ObTpInlRCjYiE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(39850400004)(376002)(366004)(451199015)(38350700002)(31686004)(186003)(478600001)(38100700002)(6486002)(54906003)(31696002)(30864003)(7416002)(83380400001)(66556008)(41300700001)(316002)(66476007)(2616005)(8676002)(6666004)(6916009)(107886003)(86362001)(6512007)(8936002)(26005)(5660300002)(53546011)(66946007)(52116002)(4326008)(6506007)(2906002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?c2tLTC9FaU55WjdyVWV6anlYK2tRdHE0WVJEY1VjRTZTd1lDVXF0RjZXVHpt?=
 =?utf-8?B?TXV1azIzUitWL3BPbkxDcDVOT3F2Mjg4RlM2SUVhYUVHdlRqaUZFancySXBr?=
 =?utf-8?B?T0MwYzBDYmNiSWpZaW1NQXlhNGlFM1czc3VBSk4xRFNyWEVlOEpmbGtUOFdO?=
 =?utf-8?B?K01BWkdxVUFqaGkxQXB3N2hKV2VDcCtDUks0UFZCMDVRUEsvVkQrMkYrdHIz?=
 =?utf-8?B?V3VBZ21ILy9XbThmKzBuWUlJdlhXaGlMeEdUOUprR2tBdE1VZC9hWnA4Sis0?=
 =?utf-8?B?RXBUWTZKNFFVWlVBVUZwczJXVi9DT3pNZWw3MlRxT2IxUjF0a0NCSXh0TkhS?=
 =?utf-8?B?ZUszejE4eHhidXl5eXhXL0JuME5INDZ3ZzRhTzhTVXkyckVPUlpFZ3VJUkhB?=
 =?utf-8?B?ZHBTRzloMkRrc05hNnZVenpobWtZdFRocjVlTHV5blZpMk1MMVB4UTRvSHpO?=
 =?utf-8?B?SUxNK2NXdnBjTmcrTkxWUUdudFVJUmdraElmdTlHZnV4SXkyU0hhbUNVSEc0?=
 =?utf-8?B?b29tQ2REM2tYQis0eThsdHRMTTBPNlhMcm5JekVxL3k3Y2JnazRVNVAvcG5z?=
 =?utf-8?B?SzY5c1YwV2k5WVEvbzViQWFrb3hoN3FQdFo3WHlhSTFzVm9iOEEyMXU4Z3NK?=
 =?utf-8?B?YjFqVnorcDZUcGFzTElzRGlvb2NPSkF5RTFta2xWQURhblBLWjk1eWk1SHA3?=
 =?utf-8?B?S1VNaVFiWTlGUHo5QlZzbW51eWF1eUtmN1V3eHhDVm5JK2Q5MUJTK3BaaFlh?=
 =?utf-8?B?aU5Dd0F6NXdkOFcwNitXeDNONjM0L3VMY1dvQXZuci9LK255ZG5JLzBnTGdN?=
 =?utf-8?B?d2F2RE8wVjYwZ0ptNm5hNU1iUEdITTE0TmRXaEJGeVkwY3luTnd2VjBvR2kr?=
 =?utf-8?B?WEQwdVcyZzZUM3A2YjRZRWRsVmdXblZHZmRONWF3cWIrUFo0QkQxOGNPUXJC?=
 =?utf-8?B?UEJCWHhjZGFVdWZjMmFvenNyZ1dhZEN6RnplMkFUeXZMcFNqR1B2VkZsa0l0?=
 =?utf-8?B?UElrVkIrTWYwWjJnTDRjcXlpVGtidTVoSGxVbmhtdTl3ekt5cFJTcVFJSnVk?=
 =?utf-8?B?NEpFMis2cnE2TXlzUDgwSVVuaDBTK2p4V0hmVEgxZVcrR3paNTBSaTBYTDN4?=
 =?utf-8?B?MEloYkxIaEMwM3J4eDViUXVQWkFkaklGTDU4RzVsb0RSejJEWnAzT2hjUXJt?=
 =?utf-8?B?a2J3RlRZVnhnc090TjZIS0NERDlobnpjc3Bqejl3dWRxUlJOZmFOaUx3aWZm?=
 =?utf-8?B?UWVFZC95bTZsT0Z5SGFGNG5DQld4dEZvdnV4dWt5eVpYdnMrcjRPd1JFenhz?=
 =?utf-8?B?Q09BYmZOZVQxQUE1REI0MzAzVGFSWTluQjJLcHkwYUgrYW1USDJtZHdyQUFQ?=
 =?utf-8?B?S3M3NHQ5bzRNdzFBN05xVXQ3aTNlVXpzbTZIS2J5c1lWeWFPV3FFMTBXZFR6?=
 =?utf-8?B?TEJtVkNrWjRIQVIrakM4MFY3cy93ZkI3N2w2TXlybTVRZDFNNkprVlpEVVFm?=
 =?utf-8?B?cGZaL0RLYkRSM0xpQnBjRW5QQTlhME9SZXREK1ZMZG9zcERDTUErWURrc0RX?=
 =?utf-8?B?bTJMN05nVmRFSVJWNUVQcUkvQXh5aFVaWWZyUTkrWkdsWmI1dno1MjRIOE5K?=
 =?utf-8?B?UjJwb0EvZUtjMEN1WERseHcvRDhjM0h5dWdTSHpUcmw3ZWY1N0JHNkU3V3R5?=
 =?utf-8?B?WG55NlUwNGJwTVROdUJ1ZUZjbGI1NGtrUk9ZanFuZkhJTGZ5dncranNFVWN6?=
 =?utf-8?B?WHovZExVOTZyNHQrazREUGJFYmVxUk5kRkpkUDBLTzJMdkNrV1dCYlMwNkd0?=
 =?utf-8?B?VXVvKzVza0tlQ2RXSkdHaEMveFdZai81UGFlOE8yMzFWNHQ4R2dreWJ3ZjhC?=
 =?utf-8?B?UC9UVXR3d1h2MjBiZzdBYnRYNHhIUUkxc0FqVEZjaXRIdXQrWWxYbWRNek5y?=
 =?utf-8?B?dE9WKzlMeE5GT2hZY1ZYUlc5T0tHU1hSZzhXNWNOWjZmdjVzYXEwS0phaE1q?=
 =?utf-8?B?US9FTzFrNDBQRElJTUtZVy92K1V6SE9lWHhFbm55LzB1aSs5ZTM2RmNQM2cv?=
 =?utf-8?B?NEQwZ0E5NENJL1RPZWxOSStSNElPalRVazBmREhUR0pSN0h6aXMyVVZEWWNW?=
 =?utf-8?B?VHBUZVJjajZ1UUZkN1VFMDdhMFRyTWpzazRqTlJxN0xmUW1hb2RDUlZpNGQw?=
 =?utf-8?Q?buL1KIrOhZ17lf3zlRNyEWo=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e45656-87ac-458b-6853-08daa76ef2dd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 07:46:59.2761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EgBjwOir9/DePpyrFVy9XiUYgzjcyWTxozUQy6py1749B5bgBcQ2Y8WGIU3Bz34IvAD0/QL+qlOoiXa0e6bbfYQF4GaQlBYXAcnpbpjyaq4=
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



On 30/09/2022 20:13, Bagas Sanjaya wrote:
> On Thu, Sep 29, 2022 at 04:43:16PM +0700, Quan Nguyen wrote:
>> Adds documentation for Ampere(R)'s Altra(R) SMpro errmon driver.
> 
> s/Adds/Add/
> 
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
> 
> The documentation above produces htmldocs warnings:
> Documentation/misc-devices/smpro-errmon.rst:53: WARNING: Literal block expected; none found.
> Documentation/misc-devices/smpro-errmon.rst:87: WARNING: Malformed table.
> Text in column margin in table line 17.
> <snipped>...
> Documentation/misc-devices/smpro-errmon.rst:135: WARNING: Literal block expected; none found.
> Documentation/misc-devices/smpro-errmon.rst:145: WARNING: Literal block expected; none found.
> 
> I have applied the fixup (with grammatical and formatting fixes):
> 
> ---- >8 ----
> 
> diff --git a/Documentation/misc-devices/smpro-errmon.rst b/Documentation/misc-devices/smpro-errmon.rst
> index b17f30a6cafdab..de8719cc47fd3c 100644
> --- a/Documentation/misc-devices/smpro-errmon.rst
> +++ b/Documentation/misc-devices/smpro-errmon.rst
> @@ -7,18 +7,18 @@ Supported chips:
>   
>     * Ampere(R) Altra(R)
>   
> -    Prefix: 'smpro'
> +    Prefix: `smpro`
>   
> -    Preference: Altra SoC BMC Interface Specification
> +    Reference: `Altra SoC BMC Interface Specification`
>   
>   Author: Thu Nguyen <thu@os.amperecomputing.com>
>   
>   Description
>   -----------
>   
> -This driver supports hardware monitoring for Ampere(R) Altra(R) SoC's based on the
> -SMpro co-processor (SMpro).
> -The following SoC alert/event types are supported by the errmon driver:
> +The smpro-errmon driver supports hardware monitoring for Ampere(R) Altra(R)
> +SoCs based on the SMpro co-processor (SMpro). The following SoC alert/event
> +types are supported by the driver:
>   
>   * Core CE/UE error
>   * Memory CE/UE error
> @@ -29,165 +29,178 @@ The following SoC alert/event types are supported by the errmon driver:
>   * VRD warn/fault
>   * DIMM Hot
>   
> -The SMpro interface provides the registers to query the status of the SoC alerts/events
> -and their data and export to userspace by this driver.
> +The SMpro interface provides the registers to query the status of the SoC
> +alerts/events and their data and export to userspace by this driver.
>   
> -The SoC alerts/events will be referenced as error below.
> +The rest of this document will refer SoC alerts/events as errors.
>   
>   Usage Notes
>   -----------
>   
>   SMpro errmon driver creates the sysfs files for each error type.
> -Example: ``error_core_ce`` to get Core CE error type.
> +See :ref:`smpro_sysfs` for the list of errors and the corresponding
> +sysfs files.
>   
> -* If the error is absented, the sysfs file returns empty.
> -* If the errors are presented, one each read to the sysfs, the oldest error will be returned and clear, the next read will be returned with the next error until all the errors are read out.
> +* If there is no errors, the sysfs file is empty.
> +* Otherwise, when errors occur, the oldest error
> +  will be returned on sysfs file reading and cleared. The next read will
> +  return the next error until all the errors are read out.
>   
> -For each host error type, SMpro keeps a latest max number of errors. All the oldest errors that were not read out will be dropped. In that case, the read to the corresponding overflow sysfs will return 1, otherwise, return 0.
> -Example: ``overflow_core_ce`` to report the overflow status of Core CE error type.
> +For each host error type, SMpro keeps a latest max number of errors. All the
> +oldest errors that were not read will be dropped. In that case, the read
> +to the corresponding sysfs will return 1, otherwise return 0.
>   
> -The format of the error is depended on the error type.
> +The error format depends on its type.
>   
> -1) For Core/Memory/PCIe/Other CE/UE error types::
> +1) For Core/Memory/PCIe/Other CE/UE error types
>   
> -The return 48-byte in hex format in table below:
> +   These errors return 48-byte in hex format according to the table below:
>   
> -    =======   =============   ===========   ==========================================
> -    OFFSET    FIELD           SIZE (BYTE)   DESCRIPTION
> -    =======   =============   ===========   ==========================================
> -    00        Error Type      1             See Table below for details
> -    01        Subtype         1             See Table below for details
> -    02        Instance        2             See Table below for details
> -    04        Error status    4             See ARM RAS specification for details
> -    08        Error Address   8             See ARM RAS specification for details
> -    16        Error Misc 0    8             See ARM RAS specification for details
> -    24        Error Misc 1    8             See ARM RAS specification for details
> -    32        Error Misc 2    8             See ARM RAS specification for details
> -    40        Error Misc 3    8             See ARM RAS specification for details
> -    =======   =============   ===========   ==========================================
> +   =======   =============   ===========   ==========================================================
> +   OFFSET    FIELD           SIZE (BYTE)   DESCRIPTION
> +   =======   =============   ===========   ==========================================================
> +   00        Error Type      1             See :ref:`the table below <smpro-error-types>` for details
> +   01        Subtype         1             See :ref:`the table below <smpro-error-types>` for details
> +   02        Instance        2             See :ref:`the table below <smpro-error-types>` for details
> +   04        Error status    4             See ARM RAS specification for details
> +   08        Error Address   8             See ARM RAS specification for details
> +   16        Error Misc 0    8             See ARM RAS specification for details
> +   24        Error Misc 1    8             See ARM RAS specification for details
> +   32        Error Misc 2    8             See ARM RAS specification for details
> +   40        Error Misc 3    8             See ARM RAS specification for details
> +   =======   =============   ===========   ==========================================================
>   
> -Below table defines the value of Error types, Sub Types, Sub component and instance:
> +   The table below defines the value of error types, their subtype, subcomponent and instance:
>   
> -    ============    ==========    =========   ===============  ====================================
> -    Error Group     Error Type    Sub type    Sub component    Instance
> -    ============    ==========    =========   ===============  ====================================
> -    CPM (core)      0             0           Snoop-Logic      CPM #
> -    CPM (core)      0             2           Armv8 Core 1     CPM #
> -    MCU (mem)       1             1           ERR1             MCU # | SLOT << 11
> -    MCU (mem)       1             2           ERR2             MCU # | SLOT << 11
> -    MCU (mem)       1             3           ERR3             MCU #
> -    MCU (mem)       1             4           ERR4             MCU #
> -    MCU (mem)       1             5           ERR5             MCU #
> -    MCU (mem)       1             6           ERR6             MCU #
> -    MCU (mem)       1             7           Link Error       MCU #
> -    Mesh (other)    2             0           Cross Point      X | (Y << 5) | NS <<11
> -    Mesh (other)    2             1           Home Node(IO)    X | (Y << 5) | NS <<11
> -    Mesh (other)    2             2           Home Node(Mem)   X | (Y << 5) | NS <<11 | device<<12
> -    Mesh (other)    2             4           CCIX Node        X | (Y << 5) | NS <<11
> -    2P Link (other) 3             0           N/A              Altra 2P Link #
> -    GIC (other)     5             0           ERR0             0
> -    GIC (other)     5             1           ERR1             0
> -    GIC (other)     5             2           ERR2             0
> -    GIC (other)     5             3           ERR3             0
> -    GIC (other)     5             4           ERR4             0
> -    GIC (other)     5             5           ERR5             0
> -    GIC (other)     5             6           ERR6             0
> -    GIC (other)     5             7           ERR7             0
> -    GIC (other)     5             8           ERR8             0
> -    GIC (other)     5             9           ERR9             0
> -    GIC (other)     5             10          ERR10            0
> -    GIC (other)     5             11          ERR11            0
> -    GIC (other)     5             12          ERR12            0
> -    GIC (other)     5             13-21       ERR13            RC# + 1
> -    SMMU (other)    6             TCU         100              RC #
> -    SMMU (other)    6             TBU0        0                RC #
> -    SMMU (other)    6             TBU1        1                RC #
> -    SMMU (other)    6             TBU2        2                RC #
> -    SMMU (other)    6             TBU3        3                RC #
> -    SMMU (other)    6             TBU4        4                RC #
> -    SMMU (other)    6             TBU5        5                RC #
> -    SMMU (other)    6             TBU6        6                RC #
> -    SMMU (other)    6             TBU7        7                RC #
> -    SMMU (other)    6             TBU8        8                RC #
> -    SMMU (other)    6             TBU9        9                RC #
> -    PCIe AER (pcie) 7             Root        0                RC #
> -    PCIe AER (pcie) 7             Device      1                RC #
> -    PCIe RC (pcie)  8             RCA HB      0                RC #
> -    PCIe RC (pcie)  8             RCB HB      1                RC #
> -    PCIe RC (pcie)  8             RASDP       8                RC #
> -    OCM (other)     9             ERR0        0                0
> -    OCM (other)     9             ERR1        1                0
> -    OCM (other)     9             ERR2        2                0
> -    SMpro (other)   10            ERR0        0                0
> -    SMpro (other)   10            ERR1        1                0
> -    SMpro (other)   10            MPA_ERR     2                0
> -    PMpro (other)   11            ERR0        0                0
> -    PMpro (other)   11            ERR1        1                0
> -    PMpro (other)   11            MPA_ERR     2                0
> -    ============    ==========    =========   ===============  ====================================
> +   .. _smpro-error-types:
>   
> -    For example:
> -    # cat error_other_ue
> -    880807001e004010401040101500000001004010401040100c0000000000000000000000000000000000000000000000
> +   =============== ==========    =========   ===============  ====================================
> +   Error Group     Error Type    Sub type    Sub component    Instance
> +   =============== ==========    =========   ===============  ====================================
> +   CPM (core)      0             0           Snoop-Logic      CPM #
> +   CPM (core)      0             2           Armv8 Core 1     CPM #
> +   MCU (mem)       1             1           ERR1             MCU # | SLOT << 11
> +   MCU (mem)       1             2           ERR2             MCU # | SLOT << 11
> +   MCU (mem)       1             3           ERR3             MCU #
> +   MCU (mem)       1             4           ERR4             MCU #
> +   MCU (mem)       1             5           ERR5             MCU #
> +   MCU (mem)       1             6           ERR6             MCU #
> +   MCU (mem)       1             7           Link Error       MCU #
> +   Mesh (other)    2             0           Cross Point      X | (Y << 5) | NS <<11
> +   Mesh (other)    2             1           Home Node(IO)    X | (Y << 5) | NS <<11
> +   Mesh (other)    2             2           Home Node(Mem)   X | (Y << 5) | NS <<11 | device<<12
> +   Mesh (other)    2             4           CCIX Node        X | (Y << 5) | NS <<11
> +   2P Link (other) 3             0           N/A              Altra 2P Link #
> +   GIC (other)     5             0           ERR0             0
> +   GIC (other)     5             1           ERR1             0
> +   GIC (other)     5             2           ERR2             0
> +   GIC (other)     5             3           ERR3             0
> +   GIC (other)     5             4           ERR4             0
> +   GIC (other)     5             5           ERR5             0
> +   GIC (other)     5             6           ERR6             0
> +   GIC (other)     5             7           ERR7             0
> +   GIC (other)     5             8           ERR8             0
> +   GIC (other)     5             9           ERR9             0
> +   GIC (other)     5             10          ERR10            0
> +   GIC (other)     5             11          ERR11            0
> +   GIC (other)     5             12          ERR12            0
> +   GIC (other)     5             13-21       ERR13            RC# + 1
> +   SMMU (other)    6             TCU         100              RC #
> +   SMMU (other)    6             TBU0        0                RC #
> +   SMMU (other)    6             TBU1        1                RC #
> +   SMMU (other)    6             TBU2        2                RC #
> +   SMMU (other)    6             TBU3        3                RC #
> +   SMMU (other)    6             TBU4        4                RC #
> +   SMMU (other)    6             TBU5        5                RC #
> +   SMMU (other)    6             TBU6        6                RC #
> +   SMMU (other)    6             TBU7        7                RC #
> +   SMMU (other)    6             TBU8        8                RC #
> +   SMMU (other)    6             TBU9        9                RC #
> +   PCIe AER (pcie) 7             Root        0                RC #
> +   PCIe AER (pcie) 7             Device      1                RC #
> +   PCIe RC (pcie)  8             RCA HB      0                RC #
> +   PCIe RC (pcie)  8             RCB HB      1                RC #
> +   PCIe RC (pcie)  8             RASDP       8                RC #
> +   OCM (other)     9             ERR0        0                0
> +   OCM (other)     9             ERR1        1                0
> +   OCM (other)     9             ERR2        2                0
> +   SMpro (other)   10            ERR0        0                0
> +   SMpro (other)   10            ERR1        1                0
> +   SMpro (other)   10            MPA_ERR     2                0
> +   PMpro (other)   11            ERR0        0                0
> +   PMpro (other)   11            ERR1        1                0
> +   PMpro (other)   11            MPA_ERR     2                0
> +   =============== ==========    =========   ===============  ====================================
>   
> -2) For the Internal SMpro/PMpro error types::
> +   Example::
>   
> -The error_[smpro|pmro] sysfs returns string of 8-byte hex value:
> -    <4-byte hex value of Error info><4-byte hex value of Error extensive data>
> +     # cat error_other_ue
> +     880807001e004010401040101500000001004010401040100c0000000000000000000000000000000000000000000000
>   
> -The warn_[smpro|pmro] sysfs returns string of 4-byte hex value:
> -    <4-byte hex value of Warning info>
> +2) For the internal SMpro/PMpro error types
>   
> -Reference to Altra SoC BMC Interface Specification for the details.
> +   The ``error_[smpro|pmro]`` sysfs returns string of 8-byte hex value::
>   
> -3) For the VRD hot, VRD /warn/fault, DIMM Hot event::
> +     <4-byte hex value of Error info><4-byte hex value of Error extensive data>
>   
> -The return string is 2-byte hex string value. Reference to section 5.7 GPI status register in Altra SoC BMC Interface Specification for the details.
> +   The ``warn_[smpro|pmro]`` sysfs returns string of 4-byte hex value::
>   
> -    Example:
> -    #cat event_vrd_hot
> -    0000
> +     <4-byte hex value of Warning info>
> +
> +   Refer to `Altra SoC BMC Interface Specification` for details.
> +
> +3) For the VRD hot, VRD warn/fault, DIMM Hot event
> +
> +   The return string is 2-byte hex string value. Refer to section `5.7 GPI
> +   status register` in `Altra SoC BMC Interface Specification` for details.
> +
> +   Example::
> +
> +      #cat event_vrd_hot
> +      0000
> +
> +.. _smpro_sysfs:
>   
>   Sysfs entries
>   -------------
>   
>   The following sysfs files are supported:
>   
> -* Ampere(R) Altra(R):
> +* Ampere(R) Altra(R)
>   
> -Alert Types:
> +  Alert types:
>   
> -    ========================  =================  ==================================================
> -    Alert Type                Sysfs name         Description
> -    ========================  =================  ==================================================
> -    Core CE Error             error_core_ce      Trigger when Core has CE error
> -    Core CE Error overflow    overflow_core_ce   Trigger when Core CE error overflow
> -    Core UE Error             error_core_ue      Trigger when Core has UE error
> -    Core UE Error overflow    overflow_core_ue   Trigger when Core UE error overflow
> -    Memory CE Error           error_mem_ce       Trigger when Memory has CE error
> -    Memory CE Error overflow  overflow_mem_ce    Trigger when Memory CE error overflow
> -    Memory UE Error           error_mem_ue       Trigger when Memory has UE error
> -    Memory UE Error overflow  overflow_mem_ue    Trigger when Memory UE error overflow
> -    PCIe CE Error             error_pcie_ce      Trigger when any PCIe controller has CE error
> -    PCIe CE Error overflow    overflow_pcie_ce   Trigger when any PCIe controller CE error overflow
> -    PCIe UE Error             error_pcie_ue      Trigger when any PCIe controller has UE error
> -    PCIe UE Error overflow    overflow_pcie_ue   Trigger when any PCIe controller UE error overflow
> -    Other CE Error            error_other_ce     Trigger when any Others CE error
> -    Other CE Error overflow   overflow_other_ce  Trigger when any Others CE error overflow
> -    Other UE Error            error_other_ue     Trigger when any Others UE error
> -    Other UE Error overflow   overflow_other_ue  Trigger when Others UE error overflow
> -    SMpro Error               error_smpro        Trigger when system have SMpro error
> -    SMpro Warning             warn_smpro         Trigger when system have SMpro warning
> -    PMpro Error               error_pmpro        Trigger when system have PMpro error
> -    PMpro Warning             warn_pmpro         Trigger when system have PMpro warning
> -    ========================  =================  ==================================================
> +    ========================  =====================  ==================================================
> +    Alert type                Sysfs name             Description (when the error is triggered)
> +    ========================  =====================  ==================================================
> +    Core CE Error             ``error_core_ce``      Core has CE error
> +    Core CE Error overflow    ``overflow_core_ce``   Core CE error overflow
> +    Core UE Error             ``error_core_ue``      Core has UE error
> +    Core UE Error overflow    ``overflow_core_ue``   Core UE error overflow
> +    Memory CE Error           ``error_mem_ce``       Memory has CE error
> +    Memory CE Error overflow  ``overflow_mem_ce``    Memory CE error overflow
> +    Memory UE Error           ``error_mem_ue``       Memory has UE error
> +    Memory UE Error overflow  ``overflow_mem_ue``    Memory UE error overflow
> +    PCIe CE Error             ``error_pcie_ce``      any PCIe controller has CE error
> +    PCIe CE Error overflow    ``overflow_pcie_ce``   any PCIe controller CE error overflow
> +    PCIe UE Error             ``error_pcie_ue``      any PCIe controller has UE error
> +    PCIe UE Error overflow    ``overflow_pcie_ue``   any PCIe controller UE error overflow
> +    Other CE Error            ``error_other_ce``     any other CE error
> +    Other CE Error overflow   ``overflow_other_ce``  any other CE error overflow
> +    Other UE Error            ``error_other_ue``     any other UE error
> +    Other UE Error overflow   ``overflow_other_ue``  other UE error overflow
> +    SMpro Error               ``error_smpro``        system have SMpro error
> +    SMpro Warning             ``warn_smpro``         system have SMpro warning
> +    PMpro Error               ``error_pmpro``        system have PMpro error
> +    PMpro Warning             ``warn_pmpro``         system have PMpro warning
> +    ========================  =====================  ==================================================
>   
> -Event Type:
> +  Event types:
>   
>       ============================ ==========================
> -    Event Type                   Sysfs name
> +    Event type                   Sysfs name
>       ============================ ==========================
> -    VRD HOT                      event_vrd_hot
> -    VR Warn/Fault                event_vrd_warn_fault
> -    DIMM Hot                     event_dimm_hot
> +    VRD HOT                      ``event_vrd_hot``
> +    VR Warn/Fault                ``event_vrd_warn_fault``
> +    DIMM Hot                     ``event_dimm_hot``
>       ============================ ==========================
> 

Thanks Bagas and will apply in next version but it may be moved to 
Documentation/ABI as per Greg's suggestion.

- Quan
