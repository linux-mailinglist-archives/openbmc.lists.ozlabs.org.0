Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D81825B03
	for <lists+openbmc@lfdr.de>; Fri,  5 Jan 2024 20:16:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gDuiYFLQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T6Cq80FQnz3cY8
	for <lists+openbmc@lfdr.de>; Sat,  6 Jan 2024 06:16:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gDuiYFLQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7e88::631; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=supreeth.venkatesh@amd.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20631.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::631])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T6Cpb2XqCz3cDT
	for <openbmc@lists.ozlabs.org>; Sat,  6 Jan 2024 06:15:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AxmzVGgcKA4EbWJiXCUS4qAbDGmbXFXyenjHsxyksi3H2I6690bsMkuXgEKI+wuicLzh8XzzLsEFIp2wLwaUTlXtLZVM557RGuXlxPHVFWbN8Wu1mGcm/mJ6rwizKBwxn0Wnf1785IDsGWxC+o3+wZPV/IFFk07TNCSnGKj3faEGzhpu8qW6iE/RTSM9A8L3d53OTJ1hQKx2bkpErDVLKeONQ0ewVZveuxxwJ79Akt+J+sRoCA+v3mzxes/FmG68ezf+BOjhwIL9N38n135OEdEl4HOo+EBwgHzWbHmmiHLflLSonLotzmZ/ynDBVffp4QRv2u7wjYaOy+/jNSaRbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfOT04zk853M/2OLxcIkEzFOUOtnmyXBzfOia5v3BXo=;
 b=cpV980SOMTrPYD+kY6BbSlPYYRrAqDgDZrdMHY93G07wQawDzpekBvGfKC3KERW2TwmL2ZigIqampNceVUqTX2spuBL7R2YharK6bx1JEf+88jcVzEmJoqBbyxlRPEoRiPqB0GldabKjjTprrv6Mqnprlcd2UMN011MlktZ0GS7Y78HaOEpTCYLiuPgrcARIGV0XFCiRps4S+J2llbE389adpFYjRTnjv4PNWNyVuZBfCz6jwtrTFRiu7/2W/JPbIWORkHXz9erUqnfmIX1EIfXMfuDZhmDPjmPGGUS9M/JpkO62xSelfSct0C/as0vC6dmxq+GaMxuDskioRbI2Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfOT04zk853M/2OLxcIkEzFOUOtnmyXBzfOia5v3BXo=;
 b=gDuiYFLQECvDuGCh3JsqrCo58u0h077U+h5xDNLSFRO8uRBXuwEcVMv/mYdkwcgs2cYKOXl0WhfE18lmSRUn2alKFY7pCyvr1p+FVOj1qXUo+kBAAVpW9R8D0TfBruFmDmi/LrmPzu3b3p6UF/HuDwEXaLZsDe5lyMBxD0iDJrE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4752.namprd12.prod.outlook.com (2603:10b6:805:e9::10)
 by SA1PR12MB7318.namprd12.prod.outlook.com (2603:10b6:806:2b3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Fri, 5 Jan
 2024 19:15:08 +0000
Received: from SN6PR12MB4752.namprd12.prod.outlook.com
 ([fe80::af8e:dc64:c494:f7c1]) by SN6PR12MB4752.namprd12.prod.outlook.com
 ([fe80::af8e:dc64:c494:f7c1%3]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 19:15:08 +0000
Message-ID: <22c17c28-43fb-59c1-4dee-ed992a7448c6@amd.com>
Date: Fri, 5 Jan 2024 13:15:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
Subject: [RFC] Advanced Platform Management Link Specification for AMD
 processor family
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0501CA0004.namprd05.prod.outlook.com
 (2603:10b6:803:40::17) To SN6PR12MB4752.namprd12.prod.outlook.com
 (2603:10b6:805:e9::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB4752:EE_|SA1PR12MB7318:EE_
X-MS-Office365-Filtering-Correlation-Id: e31f7347-37a1-41f7-7cfb-08dc0e22a15f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	aHKPZn9QrkDhj63jFesBAEpXtpc+G6l7Dh+bc1+t7CDbmUKvlnZXcSOKBicoqYKljpLKnxs0tD2Oc0f4G2coy76zC8wersVrO/OxrW7YzPT+9vrbK6KDfqva30YjePDMnFi83t8+sQduppYpT/i8VOvtE6pMwYlHi2kmuGDmWo08k5zA5eEZ1LipdA9w7+0yvEhl6fBjCK9N7rQ6+CAFwu3FzHyI+qloJzsNgAWYAGkM1u/MnRn7f6QU2iJbq6xAoOGOeQK8q3wE4WWAmsK3EN758YCN9llCocAm4urZ1f6pW9RhMJAFqolq0pPzKimyr2yKtoSuhOSntNztpj6D/QKUvaPzIkxBbHkJjyS8nPOlYn3VJ1vjGjK8NJXlB90p5vDNWG4PQmVKKKYPBlGEYc01Ux/1d85clfRq2W4tefFuc27i0Yo4C9Pd17j1L6VY1MAJy3eENk7zBvrOQBCeBFMo34Sg0oX4vD8JHd0V7dx7M05L8KSBb963uOIhcnRZZJpkJCZpBNvJTmb6iesgT24QNoJp5c3M8Pz2vy2y9g/XjleGzpxaGiCyDJuwG1XC9tw7hx5FS7W+R20RXEMgYa00nQ2mPX9lU+bgErZfmiwxwwJXdOXJuLnOVBnKxFR5wzM+zuWhbzK/xn2oApQByHEYuxfgGnBu++/his82OqyxzYNY1EzJQSsKUXNFCf7E
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB4752.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(396003)(376002)(136003)(230173577357003)(230922051799003)(230273577357003)(1800799012)(186009)(64100799003)(451199024)(2906002)(38100700002)(36756003)(86362001)(31696002)(41300700001)(66556008)(66946007)(6916009)(83380400001)(66476007)(316002)(6486002)(478600001)(966005)(26005)(2616005)(6506007)(31686004)(8676002)(44832011)(6512007)(8936002)(4326008)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?by9RQ1NOVzk0UXJTbmVXaXR5dUtUREdObGhjcTBlcHlZM0pNL2ZuVVRiSzA0?=
 =?utf-8?B?YWJHU2NBZWJMZUVhVk55bVhSbGpPcXM0VDBaTnVPTWFNUHQyZEtoR3Uwa3JO?=
 =?utf-8?B?WDM1cDNxSjhoYlF0M042WlNuUEMwNnlVdE5mbVl0bXZrM29UTHEyaDBGY0J3?=
 =?utf-8?B?Zk9tN2M0alVaY3JpOHRzcGthK3lLN3NkNCsvM1pyL3IrVjcwZWRadFRtQTN0?=
 =?utf-8?B?L3lMTXBzbzJoYlYrYUFibU8yWDdLWDBiallkM2JwMlgrWGxPNWRsSktLSnVO?=
 =?utf-8?B?QTB5aC9BV3BZdHg5eTZHVEpoVTdlaXZsc0dLUWIweVNBWUtJQW1IUkQyM2Zn?=
 =?utf-8?B?REMvVnJacm1BWVJ2dURac003eVV4REpxbGF5TzFwbE1reXY2MytndUh5Q0xN?=
 =?utf-8?B?eittK2pkaWJ2NXVJQjkvTGJIQVp6K2Q1dnJZNTRwTHlFeFFaNmtna0JYMjJ3?=
 =?utf-8?B?UkZVR2dkRjM5d2Z5MlpVRUZRYjFtMEZaUkpBb1BWMkd5VytCQXZOWTNxZWpH?=
 =?utf-8?B?RVd6RG9uTHVXeFQ3VlFaTWNiVDdWcGgzZzhWMStVVEVrc25TK2NPTTZYTHF6?=
 =?utf-8?B?OFdwNUhpempWc0hPYzJrVmZyQzgwSHZMTFgvU0lOQ244UEduZTdkUXhIdDZa?=
 =?utf-8?B?eVdSRkdJbnhqTmx4dFhPY2xUTWkvWDB2YnFvQnY2K1ZEM2h0YlJWclRUT0Np?=
 =?utf-8?B?U0RVcFUreWtTNGlkaks0OTFrT1ppK2FxbkUvTGxuQ1hzWVNFSzVWRWY1NW50?=
 =?utf-8?B?aSt1d2tVVElVNTNGMTFveFg2OTc5VGg3T296Z2tXTHVIUHVNbmtRcXhTaUI0?=
 =?utf-8?B?bnc3Q0tRRnducHZKV200RGVCaExBaDVzMVpXdnRZYkZwdUZ6MHIzeVJOWXU4?=
 =?utf-8?B?REpVWHZxRWMxUzZzNnc5UVg0V2t6aUJ5K3VoV3IxZXpVZXhVcnc4RVFiT3BM?=
 =?utf-8?B?QVU5ZC9vbHkxdzA5OUIzOFJvMjlxblJmSi9jNWNPejF2dTlnSzhlK3gvK0Rp?=
 =?utf-8?B?QUhjS1hxZk1ucC9hTGFURmw3dnM1ZmxqK2hBZjkzMktxb0FLd2dORUtncFAr?=
 =?utf-8?B?eGVqMmIrRE5xR1JIRDZHY1U0bmZSSGlHQXMvZDM3ZklLOEpzWFpBb0NuYWtO?=
 =?utf-8?B?QXRuOWpJYjNNemFuMnpMckJrRGlibUh1dzZUM0RpNkNSNXJmWFpmemZQempp?=
 =?utf-8?B?MWRnK0JVdTFjUXNBUzlCeUhjQVAwUXArT1RHUzZaMTlHRlM2ZUxpNmtLWFdY?=
 =?utf-8?B?eWlUS3U3TFZHYWlDYi9xWGxEN2ZEUmNHRHdtbjUvZmF5TDJySnBtZkphYUZV?=
 =?utf-8?B?dExLTDM5RGt3TFB0S1B4eG05bUxjSHBvQ1o4RlJTR0FoNnUweGFIVWRqZmJ5?=
 =?utf-8?B?QjAxb21RNUlwd0x2aVoxV2dzRFJJSkJTY0RDQzBUTVFzK1d4R2IxWVVBVFdz?=
 =?utf-8?B?UmthQ2FiS2dPM05KZ0twc1FSU3FrVEdzcnpic2dxUWNGeUFhNjIycWVZVzZH?=
 =?utf-8?B?d20rOHhZb3QwUHFxL1pKVnJ0MWRweDJBdkRGOG1UZUpEME8xK3hVVWZ6ZHBp?=
 =?utf-8?B?SXk4OUlCYVM4Y2dsTWVmVUExaXVHWjhaZElpNG1GbkxPL0RCRWdjVnU1azl2?=
 =?utf-8?B?cHgvZElzbGM4Uy9PM3c3WWlYd0dqMnlJcFBxdExPSytObERSNnpNb0JsUEdW?=
 =?utf-8?B?RUF3TXRzWEZkZUF6RUlWMkpGUExIZ2xGalp0QkhzaEJaVFhuVW1iUGdMcFRX?=
 =?utf-8?B?Qzl4ZXkzVnFpRTNyQXh0VTZuNjlSY3U0NjU4TEJrdGw4azA5d1Z2Nk1xUGV5?=
 =?utf-8?B?WWtTcVFmQVZWZXF1azI2QXRGWTd2UWZGcXo4bVFpdCtNMHZtcXZSMjVVcGph?=
 =?utf-8?B?YkJhWWZuTEFtTUsxTFVOajE4ZEgwdFFJUk9IWCtpSXp2K3JyU2ExbFh6Vjd5?=
 =?utf-8?B?UHUvNnlyUk5jenY2UGJtcXMzYnVjZ0F2bVNWYXFlTGpXbFBVWDNQNVJIS1Vy?=
 =?utf-8?B?am1KNk9GV1JaYnpUM0hxempBckdBRkhBVElwTXRHS1lsUFJnb1R1V0VFc1I2?=
 =?utf-8?B?RkdjVHdXaC9adnRsT2NXUWdONUlwRHA5cko0aC9LUGpCSVNVSmZNM3REYkJJ?=
 =?utf-8?Q?sRU4zrdswTT9Ot5Ppb/bDBzY1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e31f7347-37a1-41f7-7cfb-08dc0e22a15f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4752.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 19:15:08.0769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eyl7u6VMuDGHciNuIl6Hqe7YRvGwbB5FuqnsSA+aXl85TBI6sj+XPc834LZwF+w1bth3FRsF7NY9XzaIs2qMOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7318
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
Cc: supreeth.venkatesh@amd.com, jayanth.othayoth@amd.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

OpenBMC team,

Background

Advanced Platform Management Link Specification is an AMD standard for managing AMD family of SoCs/CPUs/GPUs.
The Advanced Platform Management Link (SBI) is an SMBus v2.0 compatible 2-wire processor slave inter-
face. APML is also referred as the sideband interface (SBI).
APML is used to communicate with the Remote Management Interface  and the Temperature Sensor Interface.

SBI Temperature Sensor Interface (SB-TSI)
SB-TSI is used to access the internal temperature sensor and to specify temperature threshold.


SBI Remote Management Interface (SB-RMI)
SB-RMI provides an interface for an external SMBus master that can be used to perform tasks such as monitor-
ing the processor MCA registers, monitoring the current P-state or controlling the maximum P-state allowed.
SB-RMI supports signaling Alert_L when a MCE is received by any core, or when software sets SB-RMI
02[SwAlertSts]

There exists a reference implementation of 
a. Linux drivers [Which we will try to upstream to Linux/OpenBMC Linux kernel]
b. User space library [https://github.com/amd/esmi_oob_library]
c. Test/example applications to exercise the library/driver

Question/Ask

We have OpenBMC applications [both new and extensions to existing OpenBMC apps which we want to open source soon].
However, it depends on the underlying user space library [Which is hosted on AMD's GitHub - https://github.com/amd/esmi_oob_library].

Is https://github.com/amd/esmi_oob_library hosted on AMD's GitHub acceptable to the community?
if not, We are open to put it out in one of the OpenBMC hosted repositories while following the OpenBMC guidelines.
It would be really helpful,if we have guidelines around Processor specific components that can't be generalized at this point in time.
Thanks for your comments in advance!

Supreeth
