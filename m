Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B073250AEE0
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 06:17:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kl1MZ3dQQz3bZX
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 14:17:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=mOMy3S9S;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe5b::70d;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=mOMy3S9S; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2070d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::70d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kl1M42nJrz2y7V;
 Fri, 22 Apr 2022 14:16:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HLbgCY1qIkpHuYtDDNYW3YuZP1BBAHw47TwZ6gPnKy84pYyxYoc0Y+NNb7jyB9j2I0nVCwiOgAWKhv8J2j3g7kVhQq8qr67qIt1w3mZpZVEvAVIX0ftIuDHLIRAOuit6871GWOgWsKmRPHuIP6q+IovR/vkCWJCpSxD5fC/H9W2rpZQqdy+O6LObX32Kd9xdSEobtMroAicm9GI3xsgZLM6c5pn7NmhrPgwK4S5rEQTR/2C7F2IFLV+JfxuEPc9GUrcyrVSJ9gTBBZeT9ptgL2YP186h91PNvn3A56eFaQmZh0DuLlDK6G7re6P+dsmhsjidCK0uLTaHiE5Ieb6UIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqJ0do5Ufr31eAIWkzJkXcZrHV55htGGO9+Kc3unhmg=;
 b=Ur/+HxmMozp2dO4kBz7EZYOF62OjzTp/bv6fiP+xwOypwGGhdIwZH5qO00RNbnD21iPqeXV8WqEL7cvf0T+nugOPLHhUN5H8Bjs0X6qYqyV83LPo3WGmIhup6jPccvWA3d/6+RSaX+K7gt4jGK0RcYXJ1JDzlTpmJIP429qfWeSnbtV0yaAv8Q+rfBETMt0LrjeBqCItYZR3YzALavPMdS4JcGKqIVyZ2vbmKDuXl78uKIwO2n537Qh7H3SrVrytbGvsLzM5IFv6auPK6h7Wf8MmE4mDuFgNN1TCU5BlMM1qojnlp1NjfVgLvz7llt8QY95T7v2mdjfzcCS+5uM0yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqJ0do5Ufr31eAIWkzJkXcZrHV55htGGO9+Kc3unhmg=;
 b=mOMy3S9Sw62GHvFD5Z+QCRXKPKDTDjAjRpziWCCDujva2r/hzCeH+dv6gkycwaDxxSJHKvbjucmawkm52P/J+FU6a92i2LuZruDiQwCZsnt/9k4I4ADVgDhFztqaSc5yXhDimGSbahFId7JsGIDLNTplxZd6DYbLZYX5LeoodaE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BL0PR0102MB3587.prod.exchangelabs.com (2603:10b6:207:38::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.25; Fri, 22 Apr 2022 04:16:27 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c%3]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 04:16:26 +0000
Message-ID: <b9e0273c-9fa1-b0e7-8737-863a94767654@os.amperecomputing.com>
Date: Fri, 22 Apr 2022 11:16:13 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH v7 0/3] Add SSIF BMC driver
Content-Language: en-US
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Wolfram Sang <wsa@kernel.org>, openipmi-developer@lists.sourceforge.net,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20220422040803.2524940-1-quan@os.amperecomputing.com>
In-Reply-To: <20220422040803.2524940-1-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56e748ef-9eb2-4e56-6e7a-08da2416de58
X-MS-TrafficTypeDiagnostic: BL0PR0102MB3587:EE_
X-Microsoft-Antispam-PRVS: <BL0PR0102MB35876AFF3BB4C6A1475BE6FAF2F79@BL0PR0102MB3587.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j6gCo7i7qughfr/+40oJYJzwCccgL8m8PSqm9oygv+c0RFgD2KkZeH4raxYK2cJcxVVyvcJMN6QRJj+0pu88qQN4wdHN81tP30mM74NUxXaB+tXeHue+LmaAT+GLqF+yUiDkeCnASjT/rFfxxDuTXXAy3dGaEutp8cHlIXNyUwcfXJMukeppgEhcTxH6aSWxP/GD03RRJqK1OFLHLgvN7gQOy2mrkfo2x3O5fgrOrqmwNC+0JXoHlTO4pt+vVXqf60PfEAJRT7ZZYQD5/6aYqPxzTs1s+vNrtjHd9vlV6w/xWCqWhn2QQapGeNObQeg3A4dZPxKiUN1iAgBXpU4DL+xFCuaq1lK7bjIxHsG9cESiC3qP9GWRYP06SJrbHlJlcMblKnkY3ch67b1ffZFfGQeWt44Z8ECFLRYpWavlF4Hvr8rwala4bBaetgbxWimhaanMG22b7cWbDswJggKu52+1Y72Etsjv/erZ7330UQBiyvKA53rK1fBWG64yxk2s4IcCrALlYlH96b+Wv/erqA3guIxm9IRwlXfh2bRaHemx4iAftfVy1g8KHGXtYbSEZJjF9r/MG8f99l/9HZGJox8tJev0huxTonzHix0W1nQhCX87uH5I4JeQP+mjjPfuN60Ea2UCntpyG4TLGujzM7TgxW4VeeYpkmo1+vV+ZVXBLy/AKun5oWW6q50MKwMVLKAcIpNTwVTW2xWt8ZK3Xcl/KwLvCaT1t3sgv6nVKJCWHQ5FHd32d6zsXM7/qxbTB6Eq3mW2lTZO/Glmc54yv72KrgipMJLFu9NWmSijkYGQKoi58+vvrPcex9WoqYPxlQoC2LjdcdouYuifPLjzbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(186003)(31696002)(4326008)(921005)(31686004)(38100700002)(54906003)(66946007)(7416002)(86362001)(110136005)(8676002)(6486002)(38350700002)(8936002)(966005)(83380400001)(52116002)(2906002)(66476007)(66556008)(5660300002)(508600001)(53546011)(6512007)(6506007)(2616005)(26005)(6666004)(107886003)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXlHUmxBb3dhZ3VLT2RrTzFBbzFaK2NuaUhvck43SzJja3RUbzZrMjZ4dFkr?=
 =?utf-8?B?VmxrRHNyR3Q5ekRJendqMURTeTcxVThtR1B3QTJ5clFxRHZJVXBDKzVrZC9k?=
 =?utf-8?B?OThKd2RDdmhwU2VJN1lqTnkzeWJZYzhnY3BFOFUydlhZd2orNFFVVWkzY3E4?=
 =?utf-8?B?ZWRWNk91ci9pQXhpQmFJb09YaFlmTVdZWDN6dHlvTTVhTUlBYlF0aTVkVG45?=
 =?utf-8?B?RWtkZzNRYWk3NlpUNU5IZUZBVTg0TWl4bDJzZ2NkdHUzNWpuRDZ4bGlybE5B?=
 =?utf-8?B?K2I4cW5ST2w0WHRwa1JpZCtKRGhGdVVGRTRjLzZSbjg0cDZtRnVJWks1elMx?=
 =?utf-8?B?RDNGaHRReVYzbEJhemdxTjd2Zlh1dWF0OHBMVXlHcmFvZEMzdTM3YVRPdERN?=
 =?utf-8?B?STF2SEdTd2pmb2QzeitaaWE3OVJoeGpnSlprbTdLcndxdCtpeUxtQnBmaWY0?=
 =?utf-8?B?S1NIWDA1Z3Y0MWpCQWlYekJRSmdLZ0VzWDNvSnZDZ0RUbEI3UkUzaCs2VEpX?=
 =?utf-8?B?dWYzY1JJSzZOY3YyWTRMM3dOS3EvN1U2Q2dFMlA5L1loNGFxZGJiaDNZNitY?=
 =?utf-8?B?dUN5enRmb0kyaVN4a3UzNzd2RWRiK2RrMDJDQzFLeVR0a3Y1bnpLZzVqT1A1?=
 =?utf-8?B?dW02ZnFxQzV1M3hSeE9WOG9XbDBWZnRJZEZ3UWxOaVNiaDlGOGdMcjhRSUtV?=
 =?utf-8?B?NXRzVHppQU92anFNOXdMTVBRUnpwNGhpZllKcXhqTG40b2ZIRjY5Nm9la2xU?=
 =?utf-8?B?RHNQeFhTbEZScUM1Y05WRjd2ZnFhblRrdUt1TXNoeXBrN0lVMXBtMDVwR0dU?=
 =?utf-8?B?NzNDZkJydkJIT29DOTloQng1cnp2RGQvejlFMkg0ZFpBeXBhTlc1MlJlT3Rx?=
 =?utf-8?B?SEJ4cTd1Nit5UkRjczA0VlFlcEFNeGhwOG1yTzhqWWk1djM1NWNiVHpKcFFn?=
 =?utf-8?B?a2FRK2txUS9OMitNUDhoK213My9aODhBbklMNHFwMkE0UHZqU1pYd3NwdmNE?=
 =?utf-8?B?RHJOSkFPV2h1NXV4TlhIRDNvUjJVUy8wOHIwS1c1Sk1CZ2dDUy93VmJrUUI1?=
 =?utf-8?B?bWZ3UlJIVGVBUG42OXVpM1g5a3FjN2w1MmxhYnVUZUJ0cTRsQi9XeFE5Q2Iz?=
 =?utf-8?B?Q2xQdWM5Z1lZQmREbUIwK3Fsd1ZKRzBwaE50NWJ0UDY5aFRYQzdOZFhJTHBs?=
 =?utf-8?B?eUdpRUg4bnBhUFNEN20xeS81bHAxS1J2a3VoTHNianFzcEFNdHd3OVAzTGhq?=
 =?utf-8?B?Q1djYk9tT0NKNk4vZ1E1YmxidHhzY0VFTWZjdTFMVG5JZjJ6WEs5ZUFMUTU4?=
 =?utf-8?B?WlZ3SDl3TXRSeDJlZG8ybTdiVGN5bkhRTWFMNFBOVDJqeTFGUWFyQk9FZk5E?=
 =?utf-8?B?Z1FNajRBRVhUT01Tc0cyOC9ESlZZT0Z5U2lPdjJZQ0tzZDI3YmRhVllvTkl5?=
 =?utf-8?B?VCtIU3g4SU9wNTJJYW51ZFhNVGpNbkdvT0RjdUc3anQrRCtXbDVNYStKUHJE?=
 =?utf-8?B?NkZoMEdNWDE4UVlOeGZNdlJFSUtpQ00wTm9FZitBa2lZY216R0xZd2V3K0Fw?=
 =?utf-8?B?eGhDR0YwVExmKzVkcFlxbHpUWG9ycmo4UWVLVnJ1VEM5MHA4YXBpejRvL1VO?=
 =?utf-8?B?emh2M2FDNjBaZjM5WWtvYUc3SzFGQlN5NmdZcm4xd3BLTkRkdFVta3BERkxI?=
 =?utf-8?B?ejQ1TnV2WllocDNsUjVMQ09aNjVWSm1VSEVkOXR4aEVVdkdCWVZJL1IxWk1q?=
 =?utf-8?B?TjdyUkdrcEgzYm1UakM2ZXp1ZnFIRnM5Y1BpZHhjbDN5SytWcW9FMW9wNlI3?=
 =?utf-8?B?M3M4SHpHY3BHWTcxdk1ybmJ1RUdwOEpxQXVzdWpYd0ZLV3RIZWtJbGFiSCtP?=
 =?utf-8?B?bUNYcEpkZ1FkRG4yZWUycjBRbmpTWUkrMHdQeUU1N0kwZnY3dndEM25TWkpN?=
 =?utf-8?B?aHpmS0ZyUGwrQ3N4OC9rSFB4NEJZbWpEdE0rd0pWRFkyOFE5Q3U2UUhsNldK?=
 =?utf-8?B?KzBXdURiUkxtMWRIcVRBeHpkaW1NS1hOVXI2UVhkQ2dZa2JrcUpSQVcvWXM5?=
 =?utf-8?B?eElvQ2x5OFJRVzgzNmx1SmNvdm5EakZGcU54Ujg0V1dZcTc1cmZGQkZpUklz?=
 =?utf-8?B?VlVDa1pFY243MVgzdWs3TVpLdnhnbVIySEhnc0xsMm83YWpBQ0dOZXNTS050?=
 =?utf-8?B?emNDbU9hK3hJeTV6REEwcTgwM3VObVQ4YjhOazJ5NGhuWUxaYjZyVUJ2VDRD?=
 =?utf-8?B?dUczcjRVZlhoSUYxNUxtVVg5dUw2NEdlMExMUFptNXNsY0dEZUtJYkNFNnpD?=
 =?utf-8?B?a1YrV2VISnlua2xSaHJlMWd6bERZUlVpRHppQ3JCazQ5L2lXVUZFSWwyTDg1?=
 =?utf-8?Q?ISIuj3a/WPHQmRyhilap1+pRKkT7kT6iKbOaA?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e748ef-9eb2-4e56-6e7a-08da2416de58
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 04:16:26.8314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p009AsYoJ9f+mVuW0Ycn90ZdTNUAyFaotQILy4dNY0oe4iEzBe/GbkMYGaSXfkR4bnyrSWA5BnYNlI75pCoUulBavdc6dmTUZH4oj8Vey+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR0102MB3587
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

Added Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
as I'm not aware of the email change
- Quan

On 22/04/2022 11:08, Quan Nguyen wrote:
> This series add support the SSIF BMC driver which is to perform in-band
> IPMI communication with their host in management (BMC) side.
> 
> SSIF BMC driver in this series is tested with Aspeed AST2500.
> 
> Discussion for v6: https://lkml.org/lkml/2022/3/10/340
> 
> v7:
>    + Remove unnecessary del_timer() in response_timeout()        [Corey]
>    + Change compatible string from "ampere,ssif-bmc" to "ssif-bmc"  [Jae]
>    + Dropped the use of ssif_msg_len() macro, use the len directly [Quan]
>    + Solve possible issue if both response timer and ssif_bmc_write()
>    occurred at the same time                                      [Corey]
>    + Fix wrong return type of ssif_bmc_poll()         [kernel robot test]
>    + Refactor and introduce ssif_part_buffer struct to replace the
>    response_buf to manage each send/receive part of ssif           [Quan]
>    + Change SSIF_BAD_SMBUS state to SSIF_ABORTING state           [Corey]
>    + Support abort feature to skip the current bad request/response and
>    wait until next new request                                    [Corey]
>    + Refactor the PEC calculation to avoid the re-calculate the PEC on
>    each I2C_SLAVE_WRITE_RECEIVED event                             [Quan]
>    + Fix the use of error-proned idx                              [Corey]
>    + Defer the test for valid SMBus command until the read/write part
>    is determined                                                   [Quan]
>    + Change/split unsupported_smbus_cmd() to
>    supported_[write|read]_cmd()                                   [Corey]
>    + Abort the request if somehow its size exceeded 255 bytes      [Quan]
> 
> v6:
>    + Drop the use of slave_enable()                             [Wolfram]
>    + Make i2c-aspeed to issue RxCmdLast command on all
>    I2C_SLAVE_WRITE_REQUESTED event to assert NAK when slave busy   [Quan]
>    + Make i2c slave to return -EBUSY when it's busy                [Quan]
>    + Drop the aborting feature as return Completion Code 0xFF may stop
>    host to retry and make ipmi_ssif.so fails to load               [Quan]
>    + Add timer to recover slave from busy state when no response   [Quan]
>    + Clean request/response buffer appropriately                   [Quan]
>    + Add some minor change on error and warning messages           [Quan]
> 
> v5:
>    + Correct the patches order to fix the bisect issue found by
>    kernel build robot
> 
> v4:
>    + Fix recursive spinlock                                      [Graeme]
>    + Send response with Completion code 0xFF when aborting         [Quan]
>    + Fix warning with dt_binding_check                              [Rob]
>    + Change aspeed-ssif-bmc.yaml to ssif-bmc.yaml                  [Quan]
>    + Added bounding check on SMBus writes and the whole request     [Dan]
>    + Moved buffer to end of struct ssif_bmc_ctx to avoid context
>      corruption if somehow buffer is written past the end           [Dan]
>    + Return -EINVAL if userspace buffer too small, don't
>      silence truncate                                       [Corey, Joel]
>    + Not necessary to check NONBLOCK in lock                      [Corey]
>    + Enforce one user at a time                                    [Joel]
>    + Reject write with invalid response length from userspace     [Corey]
>    + Add state machines for better ssif bmc state handling         [Quan]
>    + Drop ssif_bmc_aspeed.c and make ssif_bmc.c is generic
>      SSIF BMC driver                                               [Quan]
>    + Change compatible string "aspeed,ast2500-ssif-bmc" to
>      "ampere,ssif-bmc"                                             [Quan]
>    + Toggle Slave enable in i2c-aspeed to turn on/off slave mode   [Ryan]
>    + Added slave_enable() to struct i2c_algorithm to control
>      slave mode and to address the recursive spinlock      [Graeme, Ryan]
>    + Abort current request with invalid SMBus write or
>      invalid command                                               [Quan]
>    + Abort all request if there is pending response                [Quan]
>    + Changed validate_pec() to validate_request()                  [Quan]
>    + Add unsupported_smbus_cmd() to handle unknown SMBus command   [Quan]
>    + Print internal state string for ease investigating issue      [Quan]
>    + Move to READY state on SLAVE_STOP event                       [Quan]
>    + Change initilize_transfer() to process_smbus_cmd()            [Quan]
>    + Introduce functions for each slave event                      [Quan]
> 
> v3:
>    + Switched binding doc to use DT schema format                   [Rob]
>    + Splited into generic ssif_bmc and aspeed-specific      [Corey, Joel]
>    + Removed redundant license info                                [Joel]
>    + Switched to use traditional if-else                           [Joel]
>    + Removed unused ssif_bmc_ioctl()                               [Joel]
>    + Made handle_request()/complete_response() to return void      [Joel]
>    + Refactored send_ssif_bmc_response() and
>    receive_ssif_bmc_request()                                     [Corey]
>    + Remove mutex                                                 [Corey]
>    + Use spin_lock/unlock_irqsave/restore in callback             [Corey]
>    + Removed the unnecessary memset                               [Corey]
>    + Switch to use dev_err()                                      [Corey]
>    + Combine mask/unmask two interrupts together                  [Corey]
>    + Fixed unhandled Tx done with NAK                              [Quan]
>    + Late ack'ed Tx done w/wo Ack irq                              [Quan]
>    + Use aspeed-specific exported aspeed_set_slave_busy() when
>    slave busy to fix the deadlock                 [Graeme, Philipp, Quan]
>    + Clean buffer for last multipart read                          [Quan]
>    + Handle unknown incoming command                               [Quan]
> 
> v2:
>    + Fixed compiling error with COMPILE_TEST for arc
> 
> Quan Nguyen (3):
>    ipmi: ssif_bmc: Add SSIF BMC driver
>    bindings: ipmi: Add binding for SSIF BMC driver
>    i2c: aspeed: Assert NAK when slave is busy
> 
>   .../devicetree/bindings/ipmi/ssif-bmc.yaml    |  38 +
>   drivers/char/ipmi/Kconfig                     |  11 +
>   drivers/char/ipmi/Makefile                    |   1 +
>   drivers/char/ipmi/ssif_bmc.c                  | 780 ++++++++++++++++++
>   drivers/char/ipmi/ssif_bmc.h                  | 107 +++
>   drivers/i2c/busses/i2c-aspeed.c               |   5 +-
>   6 files changed, 941 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml
>   create mode 100644 drivers/char/ipmi/ssif_bmc.c
>   create mode 100644 drivers/char/ipmi/ssif_bmc.h
> 

