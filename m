Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DED4CF3A5
	for <lists+openbmc@lfdr.de>; Mon,  7 Mar 2022 09:33:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBsCy2RxVz3bTK
	for <lists+openbmc@lfdr.de>; Mon,  7 Mar 2022 19:33:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=HwucqLfK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eaa::72e;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=HwucqLfK; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::72e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBsBW2D5xz30N4;
 Mon,  7 Mar 2022 19:31:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iALLaEarkQLidoXSncR040++ALD0r6y1Wo1z1qgdM+YzFwtcY2BDqAlpbkh8tjcSKME/yTOUBX5UYT3WH/Iz1xi9Wm6thfOJ2akUUl98Iw7DJF9J9sj/UmJgPD+JzxXxuhmEMjmtl23MpjUQQDTHC9frhMqZyDauffeAT7xd1l0wBTxCxF21ujNOphRR5tFGWqEDto/0gFGs5pv2ps6DV7tpSsV8xhUaq3UkHZo/7opQAVW8gzrxbLsxR0KSdwROdGeGSsmg7n07HpGmZRApTGNbzzDrGosgUl97zcRuJfOAtKg21YWzMMm8rA8YgTfYMaDq3fEBdP+FdkuR8AqInA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UtSw1F0Qshef0rdJOhpgEfvLLe/SIVvhWWneVsZyQQ=;
 b=cuO5B0R2zcird71mp82+vgpjTKzb7w4CiUhJqYW1fdLiIIkSdqHSWO0xCONhlZ/VRdrhwbYYI8g+qeqby1XitGgS2Crdc6RrQ9oJqujd/GS7MkUrX3AVN0pBedaS9/kA4+q13YzILhMeQi/BluocG9F/K3fhfZpB6GvJJeisP08VO0tl8S3MJ4yUg6o46DNuQzpPLqAR7vVZn36HMTjw+gvLmKucrTlavcZoM2TkKyi6AsECQPjQGGvA1676pl6j7yweUcei5tcHHlQUa+41EBokEuZ6/Cg0OcBqoyYXuFeQdVLDmYBzPwecp9MAfxQgQYbrMR4xDj1jdX2glLG+8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UtSw1F0Qshef0rdJOhpgEfvLLe/SIVvhWWneVsZyQQ=;
 b=HwucqLfKIvmVbUjq2Kto3DkoN8v+9m0yACjXB1VZN1N6ZzyLX5PDLR+ZGVfaHIEtSj6gjr2PqO6Q7+BfBUaRGe/KxU4SjN79KEn9BMCSPUBIxY6tLI+IKID1T2KjcOSIxl5J+r67FbFzevnPTSMwwpGdFjqqirVyrOGfjZX3tYY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 MW2PR0102MB3498.prod.exchangelabs.com (2603:10b6:302:3::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.20; Mon, 7 Mar 2022 08:31:29 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 08:31:29 +0000
Message-ID: <b5976993-aee0-b5f3-2762-8066d7f083d1@os.amperecomputing.com>
Date: Mon, 7 Mar 2022 15:31:13 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
From: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v6 5/9] regmap: Introduces regmap lock helpers
To: Mark Brown <broonie@kernel.org>
References: <20211224041352.29405-1-quan@os.amperecomputing.com>
 <20211224041352.29405-6-quan@os.amperecomputing.com>
 <YcXI73GKNdx/gvUb@sirena.org.uk>
Content-Language: en-US
In-Reply-To: <YcXI73GKNdx/gvUb@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0231.apcprd06.prod.outlook.com
 (2603:1096:4:ac::15) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88a8ff70-30fe-4d51-cc9b-08da0014e036
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3498:EE_
X-Microsoft-Antispam-PRVS: <MW2PR0102MB3498457C32FD7A7DAAD46A49F2089@MW2PR0102MB3498.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WlCqqQbMKi1Hirp9X97GQhaG2oi1X1DjtqD+zbq7bsKf80q5BreMLX/MkJ119AujpaILygQPRuHC2Y/K+WIlu1TJ6VNHyQfuWEmPyndsjCSks79gA7ClMzmyQoKdUmU4lcB0Rh3RnxpfW0CBZHrZy7M820jnslQFCDKqQCgEWyt/JgSyjxOcRtq+CCwBKPqt97sgSPhvOVaf2dh2ji0BaIXGFdVWr1D1rxm/YSgvemMMYsSb7GkNZT0H+yBjanXH+pn94o9NUh7ZqeDyWaOZFajExF3Xpg2rjU0ndelhG56tqbLJ/biye8vxjtn+K8oq5uAx0mVWXR2K2PzidpiD1U0BpIveX/43N3roziK1nrQCC3h6tDHwGgPXFyA8TkITaT7Cmhah1CUHSPjHmiZc3R6DylhzbB3muox7vSmoydyPq6aFF3a+8xbCFn1tQWinYQ+UW4m21301laOEfa/paHUaXR9Y+iR37shXiOb5LtWZVMDmft4mOI+73KgorLb/hsMuwZDtX5DnOUDm1M7hAfykvYVMqVa95Rt8dN5s5agctjlgbRf2uGx7FcjgQNSPS7xHl4qXuj2wzoQIUoa4QK5BUE8uy7zstd0gX2Pnzl11LasdlFPiHUjppIaAFhbzEABfJMh7BJmXfResO2/S3HJq0FEe2ZPpi4KU9/nIwpGj9sWinDU8Op2cNNS3fqcrEojhGidtHGV/xVLu06r4Aeisv/dUN1pLRO3xs5E54M8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(5660300002)(52116002)(6916009)(31686004)(6506007)(26005)(38350700002)(8676002)(66476007)(6666004)(86362001)(6486002)(55236004)(53546011)(54906003)(316002)(31696002)(2906002)(186003)(107886003)(66556008)(4326008)(83380400001)(508600001)(8936002)(66946007)(7416002)(4744005)(38100700002)(2616005)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkVHYXdGK21valdlYUN6WmQrcGpGWXV0L1RxMlNQb0JnNzdBenBFVUdDR0lq?=
 =?utf-8?B?c0xCWGVkWDdEUHdxOTBUZUlacTJPY3NrcTViNlRaNm9xRHVicFh1UkNObEhJ?=
 =?utf-8?B?ZGlvZGF5bUlUTnNRKy9jbXBZNkx2VE5Lb2xUME5HQmRLdHZjWjd2eGx6Q1Rl?=
 =?utf-8?B?SldYWHJIQ1RqUFBHeU9rT1VCdm9uTmMrbk9sUDdBdVpuZHJQdlBLVk5HUkxH?=
 =?utf-8?B?MkFLNjZSVTZJTC8wa3BiMmNzTzhlc094Q2UzMEJNUU14NEtIWWRDa1Y1VEk0?=
 =?utf-8?B?SzBGUjV0c1dXTk52b3dXUWs1YkJSaUZvWjdzTWRrUjgyb0IwQjJOYmthbWdz?=
 =?utf-8?B?dWdOYWRZbWpUUUY2WkRNNFpVZXJQWURpenhtOS9vREd5RWJqV0hVai9LTUJw?=
 =?utf-8?B?bnh6bS9tZEVydHBWZ2JkdEtFYVJhckducVZSQkt2dTlKc3BZZFRFSHZaV0Vi?=
 =?utf-8?B?MzM3NDZvZVdTMmpEQS8rNCtieTY5WXN5SHJuTTRZT3BSZXZXMW05TUVrZFow?=
 =?utf-8?B?UjhETWRTNUtnYjR3NGR5cnVjY3hKSW1PVVJVbHUyVG9UL3RTcHJhdzQrY0I2?=
 =?utf-8?B?eGJuM2svdW9FQ3RGbXhZaE0wRFdTL1d0ZTd1NDBqc0c2RHFucE5DbzRCZllw?=
 =?utf-8?B?cXpvUkZRaU00SzdaZHRDVHYrcjdKSlgvdTYrd1hwY2x0M2xCTFk5L0NZWUpz?=
 =?utf-8?B?aUk4S0pObzNvY0NvSDZZdmFwVmVRMlNZY082S0lNYkhrWmlWbW9GTU1KNE1Y?=
 =?utf-8?B?Y1JJZWRnWmg1N09Wcm1iVGRlR05kb2llb0hYdXJib2ZGSmZOQ2RyMlRSOEJB?=
 =?utf-8?B?MUlFUGZEelorK2FEL0dSSmhCNnBRTzN6UG9yVmVqdnhhOFFjN1FKL3JwcFl4?=
 =?utf-8?B?RmNLdEx3REVad25udWJiT3k2NHQzcXJtUVpZNU1BZnRRRWRTdHZvOXRxVzRL?=
 =?utf-8?B?cHp3NTRoczMxWjhzUHBUZGlpSzlPbloreDVPSExxMEhFUWV5ODI4dlA2V2Vp?=
 =?utf-8?B?SkNJQzVpNnFNU3pub3VNVXlwTHdSajQ4bVNCb1J3TFdYa1ZSYk5NM3FrRUlR?=
 =?utf-8?B?SHA1cW5UNS9SeUlHekhueUtRa0Q1b01UWWZnY0dlTlJ0NGhaczBQb09XbnlP?=
 =?utf-8?B?U2xBQzErQm9uM1JDaitBaDAzOHhSZDBpQ01iZ093bHpzTUh2YlRYc3RPdmJI?=
 =?utf-8?B?RVprcmF5bHJwUkNuKzNXMy93T3FWemd2eFFMVnl1T1BIODVjN21GbEwwc0gy?=
 =?utf-8?B?a1dkTTlOT3l0Z1p4QzdMb2ZGYkNWNmtHdUNTc0V1VWRtakwwQS9oTlFJMmp5?=
 =?utf-8?B?ZU51djVWWjgyNUY5QXBVQmtyeEgrSThoQVhHNkhVNXBpOXpmRTcwY0d4alB6?=
 =?utf-8?B?dkdBUkVvTTg4T2pKUG9tcEZzSlZGYnNJOFJ3QVM3VW8rQUtGK3ROSnlJYTMy?=
 =?utf-8?B?SHFxUWJWdUIwUXBtcDd4c21MN2k2ckVwK2FzVmEwNEhsRWlpUFJMV1BNL3hO?=
 =?utf-8?B?bncwblQ3dFBoRFNic3dnQ1R0cHFMeDVDY25RZHZYNUM5OWtDbXdYUCtzcXIx?=
 =?utf-8?B?UzhuTW9qL1hoTVBnTnh2WGFmYXI3Zmpjc2w0UlB6MmlYckRTaXBjeGlkV3JP?=
 =?utf-8?B?VUFuSkhpWWI5dXdYK2VFM01OUTFBQUQ0YzE1TjJOYnJEUVFsUFRFcTNvSDVl?=
 =?utf-8?B?d1ZObE00WlliWkUveWpVMmtKVFcyQ1pmRDR0U1NFTWUvRWw3dDVBNVBNRjRT?=
 =?utf-8?B?b2hleW5uVUk4Q3FzeTZ3MTZISnpZSGZMeW9QcjhhMDVuU2MxdWZnSEE2cW5m?=
 =?utf-8?B?eFZ5QVdmWWYyTEF2cXNhekdXMGNqWnMvWDU3cGNid1NDcC9jTnBjVTJ4Ujg5?=
 =?utf-8?B?cllnRWZicDBPYXFWeDhTeE9TeTljd1U3bXdTWDAwYnJROWFubjhHdm9COHVW?=
 =?utf-8?B?azB3am9yTDhUa0Q4M0Raa3hJUU4xZjF1M2s1Z0VpKytKNGJqTXhvQ0s1VGxL?=
 =?utf-8?B?Ym1Ybi9xdlFweVR0c2dNTzFwc1RjMHQwTmdwQlJucUh5WjJOSEhyZGgvMEZS?=
 =?utf-8?B?emp1S2pjaDBTYXpvb1gwcXo5OEs4QVhPTHRwZHFKenpxY3FDWnFZSkw2dGR6?=
 =?utf-8?B?clYxbXhHZnR6S1ZsSENER1l4eXFlem1JakxnU0ZLMlVKcEZRblA0SXRwODVi?=
 =?utf-8?B?WjZJMkV2RGlnRHNySFBTWGx1YzdGSkxkc1k0cGltUGt4TElMY0hZVnJKUXh6?=
 =?utf-8?Q?Uih2KUmUyfGxT0D4lbIdn1GeRPMMjDAiiXHEVTBrFI=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88a8ff70-30fe-4d51-cc9b-08da0014e036
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 08:31:29.0557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d2EwDppoyxadIxoB1XAGsqz5b0q+FzGsv+bgv+o25neU8fpaZwsD9g54f8n7bT0hTEdIbBQ1JjBndYKUTTYukiD5Nn4Kg8ql7bn9ZLlSyFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3498
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
Cc: linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Phong Vo <phong@os.amperecomputing.com>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, openbmc@lists.ozlabs.org,
 "Rafael J . Wysocki" <rafael@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Derek Kiernan <derek.kiernan@xilinx.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Arnd Bergmann <arnd@arndb.de>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Rob Herring <robh+dt@kernel.org>,
 Open Source Submission <patches@amperecomputing.com>,
 linux-hwmon@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 24/12/2021 20:19, Mark Brown wrote:
> On Fri, Dec 24, 2021 at 11:13:48AM +0700, Quan Nguyen wrote:
>> This commit introduces regmap_acquire/release_lock() functions and makes
>> them available for drivers that need atomic access of regmap registers
> 
> You've not explained what something would need this for and how
> it's expected to work - we don't provide unlocked access to the
> regmap to client drivers so I don't see how one could safely use
> this.  It's unclear to me what this would mean or why it's not
> better implemented in the client driver.

Thanks a lot for the review, Mark.
As per my comment in the other email, this code will be removed in my 
next version.

Thanks,
- Quan
