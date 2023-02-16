Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB15B698B24
	for <lists+openbmc@lfdr.de>; Thu, 16 Feb 2023 04:23:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHKz656Gmz3cgv
	for <lists+openbmc@lfdr.de>; Thu, 16 Feb 2023 14:23:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=kgxju536;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8a::701; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=kgxju536;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20701.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHKyP3ywnz3cFW
	for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2023 14:22:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Um9dlpiol9jCm8bWE9fKlT6Izmm23/59jIYoQ7wWokerP1FAFdbXGpugAh7Kbj6vls5nwRTvvOPAwJBkc/N7AI6xQTNCrw4SGGZsHUqHtpSgWTXkDfVlqOJjj/8Ay8QwvZebVfO1tM2cRgPiMJ1sVfUYNtTng2gln74hOVkqhqFFsHuf3v7eQiWLladrAFcG3wSSw5MUeQ5ZZFL+/0CNdi+0PxQwFNtUTW0DIPttM2a9COyRIqFqwcjls0eN7jjMyPTwUfaK7RFxfODfQ1oydTJjllYj2I8n5sQ4SaYxGczi2Lt76zYwVawvfBexpXvUSplPplUV/HLaFsmGdWgmIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaCt3rXAeOQojA+kLSL6NHGJvHVdH9uKRn0Bmeysohk=;
 b=ByMZTysQO2iy/GwDe8AnUX+IOweuqpR/tWU2DlBPxWDeS2SEwv0mFHXBNYSa3Pq7uZrAEJr1mQm0Uirvdi/Pwy8F3ABm3335hPk6ayhNtPDn6S+Kyv9Jr0Hgn8vUBZWPIWDnup+SJUeWW8e9nUTNkvd0ifbwXdcSp9Y1Dd86F2VtqX0p4rUN3PdNc8ginSHyMhMUHs3BwuaFEgIrwQi9YGfV8Vd5D0R10aRZ4hByPyouCexq3BmGiCt1m1qnptkLqhqu3HEGHLHN3iUyNN0T6wxv7jgbL68h7EeM99RFPFHlFR0sQSZEQfRCsR9ezOiJrGO9gso2h2DnGFOZuC0VVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaCt3rXAeOQojA+kLSL6NHGJvHVdH9uKRn0Bmeysohk=;
 b=kgxju536lwS0qs9x2CPyjSLdNYg32jZNeRr+IWBT4OraqUB8fEjOz8k9H4yBUg31TexXONm3MER8fe13LtZZVGqxVQbVmiYr26qRSniBteNJd7oWhoPD8zAOtXbz9QXNhekG4KPZsz+UgwV1unVTVw2daYFofqEiAGtH1Y+9wEE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 SN7PR01MB7992.prod.exchangelabs.com (2603:10b6:806:34a::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.26; Thu, 16 Feb 2023 03:22:31 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::bf6:8038:9fe8:1588]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::bf6:8038:9fe8:1588%4]) with mapi id 15.20.6086.023; Thu, 16 Feb 2023
 03:22:31 +0000
Message-ID: <98b2a8d6-c5bf-a782-7fc1-8874f94edc25@os.amperecomputing.com>
Date: Thu, 16 Feb 2023 10:22:14 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] misc: smpro-errmon: Add dimm training failure
 syndrome
Content-Language: en-CA
To: Paul Menzel <pmenzel@molgen.mpg.de>
References: <20230214064509.3622044-1-quan@os.amperecomputing.com>
 <20230214064509.3622044-3-quan@os.amperecomputing.com>
 <866fe1b3-8044-6581-9711-452550f91198@molgen.mpg.de>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <866fe1b3-8044-6581-9711-452550f91198@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0123.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::27) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|SN7PR01MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e3dc8fd-e6c8-4cd6-2807-08db0fcd0991
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Hm4SwgKmTsX2jpRT1PskHJKTfpUPtJ5ZGGRUlCn5cITckJKLCi6cZlpv6tfwuiL7a3uj97uXCdzTZW5FhFBUA0PQUtmmpPKk/bP8EXNAqvn5vE9rnSwRFD9Y3K0hjuNkVB5sBVUyVnHNlClySRuFQjwcCR5t1I/wQGNlER43u5lL1JPnOxhuewaHdBXGx1kcXuN0IbcmZIMQVHPK4oj+zVH5zMnAtQee6lx+X0C7tZsL86Mfh9c5+xJI45xOsKQ6n8TQ7IosNtugSkJAU6yvSRFDHkdARABpCoVCH+MOsjnsKarm+KJ8mrVd/cxmxHkGelHrJuuClJXo5PiEwALMbdjPAEd83XPf3nqZXDtYSTQGW+aFrPC4xwFtSAHlihn5iAEIfcc3x2fY2la15iZgKzT/j/XoreaeW6exnVgXZwgoDvXESU+wnpl0cyovJ0z71UMc5i/WknaNcWi6ndYeJmCkSaLAW0zJo6CR+HZ0+vFDcOReIJoDrIIO8yHycD+1mVPByhXcFcNW/GxJLmNkSaisH0hnC77tD7U+UXM0e3tZ/7wPK3blyGbGAQgYorw7gPCSELd/RKLwSbxLss+6G44oFYOXqHiz+maNPodY+TCQtl0sh/sDM0l0I5SjYscVtK9ubOsvbunGJ80oyalKPQmD8R9UtcRgQ4F+FGYYo0SaW5d50Jxyqo04TnEc6ViT7sZuCw6114Viem1aKJZU/A==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(396003)(39850400004)(376002)(136003)(451199018)(5660300002)(2616005)(66476007)(107886003)(6916009)(478600001)(86362001)(966005)(66556008)(316002)(66946007)(54906003)(4326008)(52116002)(6486002)(8676002)(8936002)(26005)(31696002)(41300700001)(186003)(6506007)(53546011)(6512007)(6666004)(38350700002)(38100700002)(31686004)(2906002)(83380400001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?cnQ4ZlljbjdaT1FLWDdNNHl4cmQwekc4UmZuUjhlMXN2MHF1RXdJSWI1NmxH?=
 =?utf-8?B?VlRTaGw2cEd5SU9qNE5Ca3NhSUJ0Y3FKdSszczdVSlJwU2ZhclhHVUxiNDA0?=
 =?utf-8?B?WStJVW54NXMyU1hzaHJubmdqRVFzUHN4M1plczZUdThuY0lxZ2IxaHBac2tj?=
 =?utf-8?B?SlozdFppenBkeW1ESFRUSENSQm45NGJveHA3WGxteDUvc2tCaVNjY0NQencr?=
 =?utf-8?B?T1cvNzVwekVvcmxhNk85MDN3Z3lCQkR6RDFEVHhqUkhRNVIwRGtReU5HU3l1?=
 =?utf-8?B?WU9SL2thZkgranUwUHlqOVJpSHEyOS93cnh3dCtoWUtlS3p1K2RyRWxWcVI4?=
 =?utf-8?B?WU5Mbm50bWV4L3pPQlVnUU5tZUtiM1A2dnFZKzAzRjFVQjlhdFRXM3c5Wkls?=
 =?utf-8?B?elRiZkg0TmM2dkJKOVNoN1RIalNCM083cjFMcmlad3FNNVBIWVFmWWtqZ1Ex?=
 =?utf-8?B?eDVWY0R3a2tqRlI2c2NOem8zTUNKZUJMbUdOcUYrUVlMMk9sWHA2dFMxS2du?=
 =?utf-8?B?M3F6UGNtd3Rhb0lHTnoyV0Z4Y1RpaFV6WVpRb0NqY1hjeXZxakZOWEFMbU5k?=
 =?utf-8?B?anJkTVBSNm5lV3hFaHhOajNXOUNML2RnbWdKRDdrRFViT0JhRXNMSDR5WFhI?=
 =?utf-8?B?RldwVnlUWitVeUE4L05KdFhMTlIyN3VZbTN5bHlmOTFBdVZ0OGZBTXZjOUtD?=
 =?utf-8?B?RTMra1VUSk1HWkpYdmI3S2djc1U1QkJybzBSWWdVRU9uMXoxSGFKbGlFS2lV?=
 =?utf-8?B?aFM5TzZlejVjMElWWERmR2Z6M1F0c3FTNVdOTmhUSURQYndndlJEMlA3N0xv?=
 =?utf-8?B?SmhjOENzU3lRRDlPTWtGaUQrTlk4UnRzb2wrSkwvajlFNXhPODVaN253UkVU?=
 =?utf-8?B?dzB2RTBTdDZDeU9zY2ZjR2I2OExRdGNNeDQxYXYvMzhuU05RL2tFeG5iK2hq?=
 =?utf-8?B?eTJXS0JTakZGRWJneVdyU3Q5aElsbEM3dEx5eHpna2pxTXF4V3VHb3hiT1JI?=
 =?utf-8?B?QWdvY3dxMmUyRGRBWWx0RUx3bjhDQ0V2Q1lDUzQ0dkMwVGFicXVqNUZBbjZ0?=
 =?utf-8?B?Z3Roc0RqbzJNV1F2bGhOU1pKdkZFWFRaR2wzRjd3VzJ1b0VPSzNORkxhZ3hp?=
 =?utf-8?B?M2JVTVkyRnpKNXZGZVREUEtoREZiYXAvYlZkQkMvL2ZKNGZ3NkhCMVArK3Zq?=
 =?utf-8?B?WkNpQThObnFEZ0s0WE5xbS9Eak5QSjk0N2hiZFZoclZLQlMvLzNXT0Y3WCsy?=
 =?utf-8?B?K2xVc1h1akNTVXgyRm90REtxMXNDeUdPWXc0ME1XdS9RYWVxSGM0ZkQ3Nkdh?=
 =?utf-8?B?UUd6cGNMTGpKTDJVVTN2RCs4Q2ZZSjNlUldjQTVTWkZnVjJTQS9mZ0hxSmNX?=
 =?utf-8?B?cUdNQVcrVDNFaDFFVmdwVVphVkxiaWh3Ym12eFdBTFVpelR0eCtFT1FSaGVU?=
 =?utf-8?B?NUdOZ0xucFRXQ3MvU0NoWDhBbEZZUDcrQnVaYlg2Z1FidzRFZ1VlUHhmVTJM?=
 =?utf-8?B?aGF0Y1p1eUhWQ21LYmVyTG9nWlRkbzhMMlREcDNEck9CRDB6MHpaU1dKdTFG?=
 =?utf-8?B?VkludThINkw0dlVWYnkxQmpYV21KSUJHdnh1VWFzYU9BNEFSZjRJS1ZtbmNz?=
 =?utf-8?B?b3NIdTJHNjlCRXI5MktmQWF3cGRTUWJiZU5ScFNabDhldEdwMFl2L29WSjFK?=
 =?utf-8?B?b2F0ME54Mzd5UUlwRElpaWllbFE0eUYxVzBHN1RuVEhVdC9HaE5weGNld213?=
 =?utf-8?B?RktsaUIyS1d2MTd3ZERWMzF1MFNqZGpvUytVTkg0ZDUwdFVXYVE5NitibGsv?=
 =?utf-8?B?cFFxbDdya0xscVk4eFNoU3NZU2poZlhGK2ZjK2lScFV3aldlUjBqNWRCV3BT?=
 =?utf-8?B?WXVySFRhL2RQL0Q0Tmp6bWtMZ2ZDa3lRU3psMHZMZGwydjIyajMvVDZlTWVs?=
 =?utf-8?B?WFFGVTRFY0p0ZVcyTnNYSGNRaFZ0dlVoRFVpcVM4Qm9mVUtqYXc1SHk1N3ZW?=
 =?utf-8?B?UEU5MjhPcjMvaWtRZjZHMUNqcUlMTXp6RjAxbDAwMmc4am1wOWRoNkNPUlVt?=
 =?utf-8?B?THRXY1pST2l5WEQyM3dYNUJhSzgyWTVTTEpWTXZrZXpZZklhUjAwMU9iWksz?=
 =?utf-8?B?MFkxMytMbmhxMzN1bzh5bG52eitjSXJiN2pFTXFGL1VmSFFGTXI2T3A2dVRI?=
 =?utf-8?Q?m4gA2BzUKClqaDfTbqbRkCA=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e3dc8fd-e6c8-4cd6-2807-08db0fcd0991
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 03:22:31.0808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xrUjYj+GaKf0D8Rdm7FHrrKkmIYYsDaT2v/ocRPU7SEjEvIaQA+LNlQTLQM6k6tFjuOz+dMeBAvXr8AWLpkU3phgod/tuSphMoqsrNExg1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR01MB7992
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
Cc: Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Joel Stanley <joel@jms.id.au>, Open Source Submission <patches@amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 15/02/2023 14:33, Paul Menzel wrote:
> Dear Quan,
> 
> 
> Thank you for your patch.
> 

Thanks Paul for the review.

> Am 14.02.23 um 07:45 schrieb Quan Nguyen:
>> Adds event_dimm[0-15]_syndrome sysfs to report the failure syndrome
>> to BMC when DIMM training failed.
> 
> Where you able to verify that it works? Out of curiosity, how?
> 

Yes, we verified it by injecting DIMM errors and confirm that errors was 
reported correctly via sysfs.
For about how to do error injection, we may  need to refer to section 
3.2 Memory Error Group in Altra Family RAS Error Injection User Manual. 
It is shared in our Ampere Customer Connect [1]. The latest version is 
v1.00_20220329.

[1] https://connect.amperecomputing.com

>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>>   .../sysfs-bus-platform-devices-ampere-smpro   | 10 +++
>>   drivers/misc/smpro-errmon.c                   | 77 +++++++++++++++++++
>>   2 files changed, 87 insertions(+)
>>
>> diff --git 
>> a/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro 
>> b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
>> index d4e3f308c451..c35f1d45e656 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
>> +++ b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
>> @@ -265,6 +265,16 @@ Description:
>>           For more details, see section `5.7 GPI Status Registers and 
>> 5.9 Memory Error Register Definitions,
>>           Altra Family Soc BMC Interface Specification`.
>> +What:        
>> /sys/bus/platform/devices/smpro-errmon.*/event_dimm[0-15]_syndrome
>> +KernelVersion:    6.1
> 
> Should it be 6.2, as it probably won’t make it into 6.1?
> 

Thanks for the catch. Will fix in next version.

>> +Contact:    Quan Nguyen <quan@os.amperecomputing.com>
>> +Description:
>> +        (RO) The sysfs returns the 2-byte DIMM failure syndrome data 
>> for slot
>> +        0-15 if it failed to initialized.
> 
> to initialize
> 

Will fix in next version.

>> +
>> +        For more details, see section `5.11 Boot Stage Register 
>> Definitions,
>> +        Altra Family Soc BMC Interface Specification`.
>> +
>>   What:        /sys/bus/platform/devices/smpro-misc.*/boot_progress
>>   KernelVersion:    6.1
>>   Contact:    Quan Nguyen <quan@os.amperecomputing.com>
>> diff --git a/drivers/misc/smpro-errmon.c b/drivers/misc/smpro-errmon.c
>> index 1635e881aefb..3e8570cbb740 100644
>> --- a/drivers/misc/smpro-errmon.c
>> +++ b/drivers/misc/smpro-errmon.c
>> @@ -47,6 +47,12 @@
>>   #define WARN_PMPRO_INFO_LO    0xAC
>>   #define WARN_PMPRO_INFO_HI    0xAD
>> +/* Boot Stage Register */
>> +#define BOOTSTAGE        0xB0
>> +#define DIMM_SYNDROME_SEL    0xB4
>> +#define DIMM_SYNDROME_ERR    0xB5
>> +#define DIMM_SYNDROME_STAGE    4
>> +
>>   /* PCIE Error Registers */
>>   #define PCIE_CE_ERR_CNT        0xC0
>>   #define PCIE_CE_ERR_LEN        0xC1
>> @@ -468,6 +474,61 @@ EVENT_RO(vrd_hot, VRD_HOT_EVENT);
>>   EVENT_RO(dimm_hot, DIMM_HOT_EVENT);
>>   EVENT_RO(dimm_2x_refresh, DIMM_2X_REFRESH_EVENT);
>> +static ssize_t smpro_dimm_syndrome_read(struct device *dev, struct 
>> device_attribute *da,
>> +                    char *buf, int slot)
> 
> Could `slot` be passed as `unsigned int`?
> 

Yes, I will update in next version.
Indeed, the "slot" will be passed as the last param to regmap_write() 
which is in unsigned int as below.

int regmap_write(struct regmap *map, unsigned int reg, unsigned int val);

So, change to "unsigned int" is corrected.

>> +{
>> +    struct smpro_errmon *errmon = dev_get_drvdata(dev);
>> +    s32 data;
>> +    int ret;
>> +
>> +    ret = regmap_read(errmon->regmap, BOOTSTAGE, &data);
> 
> The function signature is:
> 
>      int regmap_read(struct regmap *map, unsigned int reg, unsigned int 
> *val)
> 
> So why not use unsigned int as data type for `data`?
> 

Agree, you comment is correct. Will change data to "unsigned int" in new 
version.

>> +    if (ret)
>> +        return ret;
>> +
>> +    /* check for valid stage */
>> +    data = (data >> 8) & 0xff;
>> +    if (data != DIMM_SYNDROME_STAGE)
>> +        return ret;
> 
> Isn’t now success returned? Should a debug message be printed?
> 

Yes, this is a success case, there is no dimm training error and has 
nothing to return in sysfs.
If no dimm training error, host will never stay in DIMM_SYNDROME_STAGE.

I dont think printing a debug message in this case is good because 
printing out something like "No dimm traning error" is not necessary as 
I think.

>> +
>> +    /* Write the slot ID to retrieve Error Syndrome */
>> +    ret = regmap_write(errmon->regmap, DIMM_SYNDROME_SEL, slot);
>> +    if (ret)
>> +        return ret;
>> +
>> +    /* Read the Syndrome error */
>> +    ret = regmap_read(errmon->regmap, DIMM_SYNDROME_ERR, &data);
>> +    if (ret || !data)
>> +        return ret;
>> +
>> +    return sysfs_emit(buf, "%04x\n", data);
>> +}
>> +
>> +#define EVENT_DIMM_SYNDROME(_slot) \
>> +    static ssize_t event_dimm##_slot##_syndrome_show(struct device 
>> *dev,          \
>> +                             struct device_attribute *da, \
>> +                             char *buf)                   \
>> +    
>> {                                                                             \
>> +        return smpro_dimm_syndrome_read(dev, da, buf, 
>> _slot);                 \
>> +    
>> }                                                                             \
>> +    static DEVICE_ATTR_RO(event_dimm##_slot##_syndrome)
>> +
>> +EVENT_DIMM_SYNDROME(0);
>> +EVENT_DIMM_SYNDROME(1);
>> +EVENT_DIMM_SYNDROME(2);
>> +EVENT_DIMM_SYNDROME(3);
>> +EVENT_DIMM_SYNDROME(4);
>> +EVENT_DIMM_SYNDROME(5);
>> +EVENT_DIMM_SYNDROME(6);
>> +EVENT_DIMM_SYNDROME(7);
>> +EVENT_DIMM_SYNDROME(8);
>> +EVENT_DIMM_SYNDROME(9);
>> +EVENT_DIMM_SYNDROME(10);
>> +EVENT_DIMM_SYNDROME(11);
>> +EVENT_DIMM_SYNDROME(12);
>> +EVENT_DIMM_SYNDROME(13);
>> +EVENT_DIMM_SYNDROME(14);
>> +EVENT_DIMM_SYNDROME(15);
>> +
>>   static struct attribute *smpro_errmon_attrs[] = {
>>       &dev_attr_overflow_core_ce.attr,
>>       &dev_attr_overflow_core_ue.attr,
>> @@ -493,6 +554,22 @@ static struct attribute *smpro_errmon_attrs[] = {
>>       &dev_attr_event_vrd_hot.attr,
>>       &dev_attr_event_dimm_hot.attr,
>>       &dev_attr_event_dimm_2x_refresh.attr,
>> +    &dev_attr_event_dimm0_syndrome.attr,
>> +    &dev_attr_event_dimm1_syndrome.attr,
>> +    &dev_attr_event_dimm2_syndrome.attr,
>> +    &dev_attr_event_dimm3_syndrome.attr,
>> +    &dev_attr_event_dimm4_syndrome.attr,
>> +    &dev_attr_event_dimm5_syndrome.attr,
>> +    &dev_attr_event_dimm6_syndrome.attr,
>> +    &dev_attr_event_dimm7_syndrome.attr,
>> +    &dev_attr_event_dimm8_syndrome.attr,
>> +    &dev_attr_event_dimm9_syndrome.attr,
>> +    &dev_attr_event_dimm10_syndrome.attr,
>> +    &dev_attr_event_dimm11_syndrome.attr,
>> +    &dev_attr_event_dimm12_syndrome.attr,
>> +    &dev_attr_event_dimm13_syndrome.attr,
>> +    &dev_attr_event_dimm14_syndrome.attr,
>> +    &dev_attr_event_dimm15_syndrome.attr,
>>       NULL
>>   };
> 
> 
> Kind regards,
> 
> Paul
