Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 323D060EEC7
	for <lists+openbmc@lfdr.de>; Thu, 27 Oct 2022 05:41:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MyWgk0gd0z2yy7
	for <lists+openbmc@lfdr.de>; Thu, 27 Oct 2022 14:41:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Ye6cLYGY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.237.115; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Ye6cLYGY;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2115.outbound.protection.outlook.com [40.107.237.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MyWf131VZz2xYy
	for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2022 14:40:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWXZvvONFkwD4qZRlFGO4Zwic9s9EEp8zbhQrlPYNCNCZkM7ymzqzrXIsNgrfH92byVzstAPg3+jt60JOR5UfWfWKpeb+aiZnOJ3Rd/ZaF58CBVwfpV5s0c/4yzivWiM8uruvkBg77+3CnVPWbDXTXnLkxwie+I3Kf+1nb7vtyL0G9oek2Aa0fJurpIY2JW1b9sKaLSSIvODP6bfX2BfYr5cjTFkkLHmaTEoojCehmLp6m57DMzDFZB/wpKj61gzZ4e4+GONLxn7hihQ1vqy7AOzCkk0zH97cz4/XP4tx3dTpb/bmvpWpKRd6fiB+Qt7CKlx/QJQdCYcs67bg/mNxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDWAuiEqNHzVSGN1pS5lXaqUypBb5u9JB4DnRI9rRaE=;
 b=b7vVEL6PZlNvMXFWdR3L2R4RRVx1suZ58ebBy/mJEwkIi/cuGpjXqFyzAtb6vWNp8KlUUdIT9ss1HZiN6VmDiASlUivXSuY5kF/qJJBer/rMLbnzZh1STX0wc4CxtWHsOsMYg2dFQNO4f9qjpkfE1Nw00EdqoURRJ/Dfjm47zCNW108yZdxa14hXfRnM1kcSGrBtQDGkp+JMUcN5eqavAet2lc7I6FKawHvQMEliFKFXbulYRfaIQbO6cL5vLITIrYXDglZ7FedNrArN4MG3XDPlo0Ifp/ioad2bWygH39a4BpFHEFpWoX0JzVk3yt3Y3JAylNTR1UKKuUzFjK1W2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDWAuiEqNHzVSGN1pS5lXaqUypBb5u9JB4DnRI9rRaE=;
 b=Ye6cLYGYwItu7JZ68L6/yy3LfkUotWrLS8GXSsiNbXk5QXA7fAUf7aKmxON45x1nuhTIm8pToU1Dtrt5WYLKpegjzJXnO4AYG1XS3xqVUHvNEhGtMvALyoZQI8UOy/15PpABICaI91sEndSNEaZJB/ZTKoiz/29g4WMtRLapXbE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 SN6PR01MB4992.prod.exchangelabs.com (2603:10b6:805:bf::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.28; Thu, 27 Oct 2022 03:39:48 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::ebe2:243d:ff84:aaa8]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::ebe2:243d:ff84:aaa8%3]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 03:39:48 +0000
Message-ID: <0887669d-fc6a-1382-a272-e231014a196f@os.amperecomputing.com>
Date: Thu, 27 Oct 2022 10:39:36 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v9 8/9] mfd: Add Ampere's Altra SMpro MFD driver
Content-Language: en-CA
To: Lee Jones <lee@kernel.org>
References: <20220929094321.770125-1-quan@os.amperecomputing.com>
 <20220929094321.770125-9-quan@os.amperecomputing.com>
 <Y1aHiaZ1OpHZIzS9@google.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <Y1aHiaZ1OpHZIzS9@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0015.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::15) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|SN6PR01MB4992:EE_
X-MS-Office365-Filtering-Correlation-Id: ec6b9c9c-6df5-4ad0-6380-08dab7cce5f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	QGLYpD6vzWBhYbnzPWVLMwPSuPUqVulIedhR65kEVZnCFRHAJUuq4FowxwfI6yA7KiGVNM7i0k7Sf5qP6NT9s91uQwBuFQQIEJLEs+a1EM7hfedMsUIW2/I6yypz2ACLCMH/KnR8StM5/LuC8y8gr/2sO9YlCZt0rAuwzVKgMqZ8WIDtf63FO3/0WAYt9VKeM25w42juv65WoNIWp+abIQC1fg6um/l2yhPzA8L+PTMkh5yKiRTp83G3XJsP40Ef3pTh3vtyAk+Pi7KMtu0mjJFAIOw8Z4DzsXdrWme/TjwtheDYKm7oTIb0M4u7+4zWnjbn8gS4aEu6QysUjLcHsezIBsIYA6eMAFOMiOOi4rMKbmiBhBqG6g3ob8fsgU//aH5S5rNggnCnw+e6okXlcfLCrgb9vzGCCSgGtBweYXVuRsL+9CQxCjRdnF+07iDF5cdA3vJ+27Jh3ukpiAqJjNn0dq1KQ/wHq637ghOekjW8q6oFVNN0QkewPBGurDjA31vvigmufhaqDVWvjFAcavBnnzN7FpF2LmvSXxNZ/e4QZUuGadCkHhQwo+kpUc45wlbhCf9VjXSJ0h6skw+M/UAX529SCHoItst2UKKTEwEk63VCwcCdG5UdMUN8e0RZOdIK0eMiRjXVO50rjrhrfiiTydiF+RdTPBjGSUNOONyHuJEBTRgfZ0a9hnqO30hsc/anpBinD4H3Q1AtKQSSeYl3geGOJIeaaZuiUFa48gr5qoe6r3Z8cHGP/Rv6B3UHdqm3JhkbwRYDiQP1a4weIW6f8+GVaH89qMER3wilgug=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(136003)(396003)(366004)(346002)(376002)(451199015)(83380400001)(31686004)(186003)(478600001)(6486002)(2906002)(7416002)(38350700002)(38100700002)(86362001)(31696002)(6506007)(6512007)(53546011)(52116002)(26005)(2616005)(6666004)(107886003)(66556008)(4326008)(8676002)(54906003)(41300700001)(66946007)(66476007)(8936002)(5660300002)(6916009)(316002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?ZGR6Z2ZUTDR6dDdOMStUdkw1Um1sZ1dWQllYMGJpR29UQWsxWFZLeVh3Y2sz?=
 =?utf-8?B?V05QLy8vaGV2MEF4Wk5vdFljR2NXZkpHNXZMRkcxeFp3bGJPNW1jbWFKTmFz?=
 =?utf-8?B?U0xRYUNjd3VmSllkZU11SlBvbEM5cnRGVjQwd2FWdnhtalZTV21NQ3VoUXR5?=
 =?utf-8?B?Y1ppR1NHa0pkeEFrVHI5K1htQjJGbDhCWjQwTitlK21UNkZLREJQaitsVEIz?=
 =?utf-8?B?b1JTcS9obDcxaS9wbzB6aGEyMFBHMTFlWU5qT0wvNEV6K1N6YXRueWU4bTVX?=
 =?utf-8?B?MzdTQkZTQ0hkMkJSM0NrWTlBVWNLV3JpYVR1SndlU1hlTGlwV2krM0VNdmpi?=
 =?utf-8?B?c2tVaFZCU29iUXNXamdDRGR0K1RRVW45VUNsTVYybGpIcFJEU25DbW1aTnJx?=
 =?utf-8?B?VHNHemZ1cWFWMHphZGh1eHh2MUNTNkQ1TE8rbnNuNkVVV2U4bDFic0IxUGQr?=
 =?utf-8?B?V1ZLeFFsYzNsOG4vSDdJTWQzZmNCZWZpTEFXVDgwbW1WL1dYcTNtdG0vbjBB?=
 =?utf-8?B?U3NLNlpkcU9ENk5kOC9MbHpBeUw2dHpFb1lpcHFlb0VIMTM5ak84Q0d2L2hH?=
 =?utf-8?B?Z1BDZnd3WkZmR0N3ZVNIOWdnd2RVdXdVaDlHQkx5UWM4U0lkYnlvbWlaRS9n?=
 =?utf-8?B?OXFYNCtKOWM5cjl5eWhwaldIYWlJb3pDTTAvVGVwVjRnek0rV0svTkZsdFNW?=
 =?utf-8?B?azI1ODJRdVZJbHJXZUVsYUY2aVQrZVhzYzlua3pUTlJXRXhLNGlPYWFMSmM5?=
 =?utf-8?B?WnJteHlBb3Z4NUlHL05JMjl4MWFsUGE1UGE3SER3TzJuL3ByWkxZTXJuMVVQ?=
 =?utf-8?B?eDJET09ZWEgwdFhaa3Y5SGZrU2tmUFI0TFltZnVrUHRDWmF0Y09pUGpHbGdH?=
 =?utf-8?B?WFlhMzFzY3pvMTE4SlZPbjRCL09tNnRXOUQvTUdEOVRxdGdEUEtLQUlIcTNT?=
 =?utf-8?B?RVhDNFZGMmxBYzNqTHJkdTFGUEJ3elhKRW5Ic0ZUWUQzWk8zZEFOZ1huNm0x?=
 =?utf-8?B?S0V6UHJhMXlKMHJlbDlFZzdxdlduNGxxeEpNK2ZFcHJmYWZsRzI1bmtRQUp2?=
 =?utf-8?B?M2tPL0d2MTZwNytBZmdTUmNpZFRvU1BrTTVZc3BaYkFvdFplUTYybDZZVDF3?=
 =?utf-8?B?OEl0TlZiTDJkVXMvWW1ESysxZDh3b0VlSm1RUzBIUFVUcTllWTZSMVl3SzU2?=
 =?utf-8?B?ekoxWkhxZ24yNVRIU3JKd1VxdW8xM0ViWFZqSEZqbXR0V0p2N3RvR3J4RzRu?=
 =?utf-8?B?TG1ndTJFaVllZjFMWHV3NTBGWUhmYXRYaUsybGxpQkxVRXBhai9Nb1kzZFpo?=
 =?utf-8?B?Y3pKcFdaa2lQQ0c4YVFxbENTbkpvVllmaFMvMm5id29tOE5PeWRwQ1ZoTGhY?=
 =?utf-8?B?eTJvZXdJVHBRay9Ca1hXQ1YxQjlXeWh4MjlrZGpqU3NxSlVEY1BzQitpZDVH?=
 =?utf-8?B?WlF0NytEZVRjMkNyWlhGVlBiOUxDODljRzR2cmxHUzFvRldQVXpKTjZRWmVT?=
 =?utf-8?B?SmNPVzQvOGFZMVYyZnlVeC8xNHNISzJ4eGJHZmRQUGZGU1dUQyt0cnFicHd5?=
 =?utf-8?B?MHZUQUs2K2kzSVlzRUs0ZHNEdmw3QkZ6K3NNNHVnYU1Sd0lDNGFWNk1KWGtU?=
 =?utf-8?B?R1BsVFB3Z2Y5YUkwMGpxR3NYMk5hVW0vV1ZFeGRZVVFWZWJIVWN0QmFIcEph?=
 =?utf-8?B?STdTTnAraHJSL1pITHJqLzFZTXRnS0ZjT1pFamlEc3k1K1R4U3d5akZKSkZs?=
 =?utf-8?B?WUM2ZDI5RDVQVzdmVzVycituck5YT1JhS0lVcTVmV3hwOUtYMVI2OGVxV1h6?=
 =?utf-8?B?ck1IalR4aWZGb2NUbVpQMUdRMlpvbTdIeVVOdlRTOFE2akxaNHJIT3RxNXBQ?=
 =?utf-8?B?L0RvZytmWFdnamh1K3FHbENJVVFUSE55Y3RoS2ZXVzE2ZmxBakhoTkpRaDBo?=
 =?utf-8?B?MFVvSmd4L290K0U1WmFkbW1Ua2NobWxzRkdIVVhBeFhOTDljRmJQOGJKcXFt?=
 =?utf-8?B?SVlBM0QzNXY5TkVyRFcvM29wZFRQVjZkOFdtM05UUVUxTUUrZCs5ajJIMllr?=
 =?utf-8?B?V3FEREczaDVXRlBlaFRQUkpsMU9wOXNrN0RWWlBQZTRpVjJ0cVJ2WmtMODBj?=
 =?utf-8?B?UGZHcFpkNDhMTnV3TVR5ZkFUenZYQkFuVTNiSktiSmR5Rmx2UElHb2F3VHF2?=
 =?utf-8?Q?PVRw/z0MTMVv4Ce+PlbRotk=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec6b9c9c-6df5-4ad0-6380-08dab7cce5f8
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 03:39:48.8181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ZJrdj4Ze/Qylcn+Lmn4ZX+vY/HKJuuE+u4KWuMkzHeCfxPZqlZgqVcEdULN9jxcXi/8/RQ01sN2+tGoefuZrvowXg0Xupmk3Sa4fXeLMwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4992
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, thang@os.amperecomputing.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Derek Kiernan <derek.kiernan@xilinx.com>, Open Source Submission <patches@amperecomputing.com>, Thu Nguyen <thu@os.amperecomputing.com>, Guenter Roeck <linux@roeck-us.net>, macro@orcam.me.uk
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 24/10/2022 19:39, Lee Jones wrote:
> On Thu, 29 Sep 2022, Quan Nguyen wrote:
> 
>> Adds Multi-function devices driver for SMpro co-processor found on the
>> Mt.Jade hardware reference platform with Ampere's Altra processor family.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>>
>> Changes in v9:
>>    + Rename smpro-mfd.c to smpro-core.c                   [Lee Jones]
>>    + Fix include files in alphabetical order              [Lee Jones]
>>    + Add defines to avoid using magic numbers             [Lee Jones]
>>    + Return -EINVAL if device does not match              [Lee Jones]
>>    + Remove unneccessary comment                          [Lee Jones]
>>    + Refactor error path handling in smpro_core_read/write()   [Quan]
>>
>> Changes in v8:
>>    + None
>>
>> Changes in v7:
>>    + Smpro-mfd now significant changes in compare with simple-mfd-i2c
>>      driver, remove the copyright note about simple-mfd-i2c    [Quan]
>>    + Install bus->read/write()  to handle multiple types of bus
>>      access.                                                   [Quan]
>>    + Update license to MODULE_LICENSE("GPL")                   [Quan]
>>    + Add others minor refactor the code                        [Quan]
>>
>> Changes in v6:
>>    + Update license part to reflect that this driver is clone from
>>    simple-mfd-i2c driver [Quan]
>>
>> Changes in v5:
>>    + Dropped the use of simple-mfd-i2c driver [Quan]
>>    + Introduced drivers/mfd/smpro-mfd.c driver to instantiate
>>    sub-devices. This is to avoid DT nodes without resource issue [Quan]
>>    + Revised commit message [Quan]
>>
>> Changes in v4:
>>    + Add "depends on I2C" to fix build issue found by kernel test
>>    robot [Guenter]
>>
>> Changes in v3:
>>    + None
>>
>> Changes in v2:
>>    + Used 'struct of_device_id's .data attribute [Lee Jones]
>>
>>   drivers/mfd/Kconfig      |  12 ++++
>>   drivers/mfd/Makefile     |   1 +
>>   drivers/mfd/smpro-core.c | 138 +++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 151 insertions(+)
>>   create mode 100644 drivers/mfd/smpro-core.c
> 
> Applied, thanks.
> 

Thank you for picking the patch.
- Quan
