Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE44650AEE9
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 06:20:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kl1R24Hx5z3bYb
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 14:20:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=aRv/LgyZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::70f;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=aRv/LgyZ; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2070f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::70f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kl1N12BW1z3bbB;
 Fri, 22 Apr 2022 14:17:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3f3fFFR5nCz79c1agStHeeCjzsDKBBXM5zEy+LsaNsB5ZzEysxNzbVjlx4mTI86h3egqQzcieUsA/LbJG1h7bNZLj2MGrmlvjl2FbKcI6BgJvh78m1c9QpGDCFvyGmoyehPnVFvtsWPpshdqLGprm+7KSc1gL8bxY3fyeAKNEujEiwctLE5kYwhinZzwaHiXSgfptIWd3VOo5MWdAk2YV/IPAV3CtmwacBnRI1f8hLSBqQ0cN6bRJPr/kKQ6qM0JX5RJURyKBEYZWJONCSOPOxIz2fK2O9kKZnLQGm9HkhNgcjSrGhxjWyBncca7pYNESeJPEL+qR+CRUdrcIEj2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8omORoRY5GJn8BYoDOVegpYoOZ845Ck39hesIml8I0=;
 b=nCCuic6/bpsWGS4xWZMhp64GhjH9rBhxo4wmEnDh89vgKOCQbrHk6j+Af6MTmEFQQPJjrfyjcoBoRFMFsFJ+iBHi1EFLcuj2dMcVKReovbL1Nq1aj+qoYYEL8G9QQjuC3IGLS9QPGmdbMyGB7uO4Gmd2pVwIDLRm12lkpa27WPaH0u4ryR1fduypxjSEXDutB4uP0VcVrbBCm9DGT33j94Jb3gM9RqKjoJeHfg9zEp/dyZfm7lnc0I4wp6heGaGXKn8njcaHmWKq0yse0qwCB3KYE4vIAJCnaLU7rUQLj42R2HN98+MR9b4LS5Khe2PPtfwf8D63yZFd1bccHnvVZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8omORoRY5GJn8BYoDOVegpYoOZ845Ck39hesIml8I0=;
 b=aRv/LgyZRiMp8eWlgbuny33IH7+XyS2hUDcKDSzbGTmHfp3DXbPUjyIncE16OSNfp8x03xVrfhR0ZLeRAv++via6wpPr0Rx+9KQ5l9Twjo0YwfrKIfnifaql5gYAj7Zmn+/rxt/GvwByagwQPYuZvCR5GjySXX7MoqsyitCsl+I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BN6PR01MB2644.prod.exchangelabs.com (2603:10b6:404:d0::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.13; Fri, 22 Apr 2022 04:17:19 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c%3]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 04:17:19 +0000
Message-ID: <6fcbe1e0-b011-7537-b61b-50bfe15f0ce5@os.amperecomputing.com>
Date: Fri, 22 Apr 2022 11:17:08 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH v7 3/3] i2c: aspeed: Assert NAK when slave is busy
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
 <20220422040803.2524940-4-quan@os.amperecomputing.com>
In-Reply-To: <20220422040803.2524940-4-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9a2a244-7436-4722-5285-08da2416fd95
X-MS-TrafficTypeDiagnostic: BN6PR01MB2644:EE_
X-Microsoft-Antispam-PRVS: <BN6PR01MB2644DCA27D694741C8ACE499F2F79@BN6PR01MB2644.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0UHUR0Q04PjPsE1LO/jScVbtQ9hQ6MtgfRdmM+icpNFwpBHTMN1mYba3TC3s4F8P13SVUTHYAYCweEiJwQN2vlXYOqIZ5D3jpoTAngOFja7qeU3sMLFsX/cNAxxzmaH5PIiDw4fywqcWEN5Rhf+GXt/zDnLUYeEWJjvjg7ekc120eOkWJZMy/IAVQvtQiIRbt52raKh+wKiH7p9vfKygS2JBlKm4I3RT1OJf4uOTSiEs/iZxqFBKW5sXzv1lCL3ssDCnaF1Wogv+b3a/MK0bRMC71QDIpk0O7ctTndRcVM2ypeES+klAxdjV1kLFshysVJtg0f/hnnGEJawtVOPfKsRk/FyyorMf7IVY6YyY9Cuw2H/lpQjUroWHAUR+dmqxAsQ82mMhzDroS5SeU2xSnhLrFoxCHzi7D5T2sdX3UActneXRrKW1PyRfrPdGdq8ApIpJXfMRFozphsJ289SMiJFB2vy3LGEA0V7LHQEyPBb/8A8HBae0EQ47eCT4lSY8pQauzl6pmFBLChnK0Wvwj2CMzkKTdo3aDgSUaxTeET74WG0+138gvFqYIYwuk9wllsaYEyhdhzfn4XUKq3RdirLdAvuTwV4aRtjeR+3jMkmGevdq/3xB0aTQbmaArj+Inb20CFRVj/zPYnF2TVAwgCz0BMp950fCz9PUBAV37skkBWB1zJf4C/LmsZQ81N6Q+X7azZBzbFlMlrpFqNLGg0HAljUJpp/BkJvtamHPwtGi68GrNJiTfqymBkcdFNyf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(31696002)(2906002)(86362001)(316002)(6486002)(52116002)(6666004)(8936002)(508600001)(38350700002)(110136005)(6512007)(83380400001)(54906003)(66556008)(107886003)(4326008)(53546011)(921005)(6506007)(31686004)(5660300002)(186003)(26005)(2616005)(66946007)(38100700002)(8676002)(7416002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFFnZ0YxNUVmeGFlbGRvU00xTWk0TXJ5QXhIdDVRWGo2Y3l2L0tSNzRFcmcz?=
 =?utf-8?B?TlErb21NbndySDRqWTg0ZW1KWkRYUU1FbWNGT1p1aXRFQlhZaVJkM3lhMmJ0?=
 =?utf-8?B?anFJUEYrY2xuUzBFdWVLOHZhb1J3RnRyaUw1eWtvQ0kvd005UEppMm91UGRv?=
 =?utf-8?B?ZHdRbHlJVnZrWHBmWC9nYnhSY2paUmNsQVBnYlA5NjhMQjY0aWdEWDBFc3Rs?=
 =?utf-8?B?Ui9OUk9wZjhXV096eFc3d1dBUUIrOE5vdE54UkplWmd5dWFhQnp6TWEvMGlC?=
 =?utf-8?B?M3RnZ3BydU1LS3VjM1FWL0dlZXRqYzgxa1NYY2pPOTVNNUptd0d5aFJlbHg5?=
 =?utf-8?B?UUE2UGZjNFJBTFp3bjNaclJoNUdtbkNEMklJK25PeHJ5T3FiZFdPMCtmRENl?=
 =?utf-8?B?WmpWZCtsVTJ5dUVJaFJhWEQrbG12ODcyQ1RBSVNWQzhPTDlVdyt1a285S09t?=
 =?utf-8?B?NmR4eU1GS3ordXdjRzdUcGpHVVM1V2Y0NVBiYnlFNUZNS0pHYXVPbGczblRQ?=
 =?utf-8?B?Zks0K1AxUWtyMVlnbmdUZVBHZ2FrWlFoRjQ3dFJaZGh2UEdna1dGWGMyOWV2?=
 =?utf-8?B?V3MzK1dOVFBSZFY2VFpIMDNzQlhHVDdLQktrVk1UcVE1QVhlYjFqcXR3S1l5?=
 =?utf-8?B?eTRIWFBwNWMrZTNuZnFHaWdqTG1iWFZ2L3FYYURvVG1kZ2lHK2RvNVJQSTRq?=
 =?utf-8?B?cTVxc05DU0J5cHFFdWtYUk5XRDNPd0VJZGpGNlVoZlpJOTRzSHdqNXZzWng0?=
 =?utf-8?B?UStRTGY3NWxrTUVPMHVLaXJWTGF5ZVF3K3hsODN0d1RJZW5mcWNRcllieVdC?=
 =?utf-8?B?L21wZTg3QU40NDIxOVpWSkJGTElpVTB5MlVGbmZ0czgrcW9BOU91ZjU1Vy9s?=
 =?utf-8?B?Ykl4NnFkNU5BcW44amNsWktOQU5hZC9zblc5dmxaZXdibHRhZWQyS20xM2Iv?=
 =?utf-8?B?N2lFdmZIME5wWFVQbkYxYyswWHJHckRUenlXTFlJb0h3R2VTYSthUmt3U054?=
 =?utf-8?B?RUE1a3dSRkJtTTRYNlJZYjRwNzc4a3ZLbjNWL1BuWTFYc0w0VzYvRHlkWUtK?=
 =?utf-8?B?N2JCOXVKQlRhMkRZV3UrcWtZWHRNRVZXcjVTdG9kdFpSVmZESng0c200cHFE?=
 =?utf-8?B?ck40ZHUvTENQZk5zNlhnV1NERmZYN0RnOEYvWHJ2WVpHWEhzK2diVFFwTXBn?=
 =?utf-8?B?NDBlVFhxY2JHaUJ6K01jRis5VitLR0gzMXY4MWY0Q2hINVZMc003OVY2RCtY?=
 =?utf-8?B?M2krQ0V2Wmp0eno1T3RJbGpRR1creVBheDEzcWIwS0hFYk9YOXZxanc0WHNk?=
 =?utf-8?B?VlQzOFkxd01QV0dnU1F0M0J6dUxKaTkrYlU5ckJRcyt1cmRjWHdrZ2M3TWdm?=
 =?utf-8?B?TEpRZjRMU0JGOHM1MzdRMEpiT1pYcUphZ0FZY01UMXhaQURqa3dUOERJSjBh?=
 =?utf-8?B?NVRZRFNCZlV3eC9qaUdrWmhUSktPQldBdVZoOGlOWTd5a2hWN0RoeGR0QmlZ?=
 =?utf-8?B?YTM2Z1JsSVd2M2dTSVZaQXBqeWVhU0dsMUJQS1Jyc2phM1I2MEZ5WTRIclFE?=
 =?utf-8?B?dlc0TElVTnorOVVxNzNuU0U1VUVzK215QmlSVUYvTHZoUDFBTi9IN2dhZzdC?=
 =?utf-8?B?Q0ZPaWdSaEFaL3Q0L0ZBWjJXeXNvRDNTNkc3WmNQV1RkK09zTXFKWTVVL1dC?=
 =?utf-8?B?YlprVGl5dnhJaGpWY0IraW83dzhpbS9YVUkrOTQwVWdIbzFnT3pLOTF5QXBJ?=
 =?utf-8?B?d0lWRXRJYzBrV1RRL1V0Tzl2d3V3MHFnTU1CcjZKVW9GMDdibDN2cGYwd0k0?=
 =?utf-8?B?RHdBN216WDh1VGF4dldMM29wNjRrNHNKdWhndkk1azNNeitpOE5mL25vOHNt?=
 =?utf-8?B?TkNmaXBoNXRKUmZUTUt0MWJRWVZXdXRvVEE2YjBmYjBJdVUxd2g3Q2txM00z?=
 =?utf-8?B?bi84V3R6VEhhZHROMENPZlJFVFl2Mk1zNlFrZnhzbitXdzlIZlVvd1pDWlB3?=
 =?utf-8?B?dzI4UUxtVDNkUk5sUWoyUGQyKysvWllCMWQ2aTUxeHVSQ1kxSk1VQkFtaTJw?=
 =?utf-8?B?WFU3bUczYWwrN0pOZlVLK2NVSmd5ODVuR2hTUlV4QVUyWTJpMFhqR0l2NWVt?=
 =?utf-8?B?Y1NwMUdYdnlPd2JGaVIvQmNaSmpRU3E3U2EveStwZS9US3JtcGE3OGdHRVVV?=
 =?utf-8?B?aFZlWUR4ZnpVRCs4MkxlWS83cXdoV0g4bmdjMURoVlhwYjdhTnhvN2JhLzB1?=
 =?utf-8?B?WW9tTm55TWhOY24rUTA1Y2U0cVJmck81aHhSSjc4b3l2TnJoWTd0bjMzWGJi?=
 =?utf-8?B?N3lGUEZta0w0MTVvZ3o3OWpMcFozdzNXUU03M1lMdHZMY25Td25Hb2hnM0FH?=
 =?utf-8?Q?qhhnmajVyYEFzNPaP0W+k5OfO2aADM9i5yxZu?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a2a244-7436-4722-5285-08da2416fd95
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 04:17:19.2084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A9DWohszdBS51oM4HXuxEEqDFvNzCilHFO7lZe4OrVXcC/NkbWmtPk0qY/Qv4lSuCNBiJ7zpA4nsU7XgbU5QBi8qysVTzQh4K7XovZ6L7H4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR01MB2644
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
> When processing I2C_SLAVE_WRITE_REQUESTED event, if slave returns
> -EBUSY, i2c controller should issue RxCmdLast command to assert NAK
> on the bus.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> v7:
>    + None
> 
> v6:
>    + New introduced in v6                      [Quan]
> 
>   drivers/i2c/busses/i2c-aspeed.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 771e53d3d197..ebc2b92656c8 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -244,6 +244,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>   	u32 command, irq_handled = 0;
>   	struct i2c_client *slave = bus->slave;
>   	u8 value;
> +	int ret;
>   
>   	if (!slave)
>   		return 0;
> @@ -311,7 +312,9 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>   		break;
>   	case ASPEED_I2C_SLAVE_WRITE_REQUESTED:
>   		bus->slave_state = ASPEED_I2C_SLAVE_WRITE_RECEIVED;
> -		i2c_slave_event(slave, I2C_SLAVE_WRITE_REQUESTED, &value);
> +		ret = i2c_slave_event(slave, I2C_SLAVE_WRITE_REQUESTED, &value);
> +		if (ret == -EBUSY)
> +			writel(ASPEED_I2CD_M_S_RX_CMD_LAST, bus->base + ASPEED_I2C_CMD_REG);
>   		break;
>   	case ASPEED_I2C_SLAVE_WRITE_RECEIVED:
>   		i2c_slave_event(slave, I2C_SLAVE_WRITE_RECEIVED, &value);

