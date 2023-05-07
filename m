Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C87C26FBEB8
	for <lists+openbmc@lfdr.de>; Tue,  9 May 2023 07:30:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFmvN4V7Qz2xdt
	for <lists+openbmc@lfdr.de>; Tue,  9 May 2023 15:30:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=oRVcdM8n;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8a::72b; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=oRVcdM8n;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2072b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::72b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QDd225WhVz308w;
	Sun,  7 May 2023 18:31:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OaOgYDcV7CbUODNHzrOL3RlMk77jlA7qRKfj8pFecUxOAqlWUP7XG/x2DfAeE8vBc5Bgn1CI6pM/2CLjiWmVDg3pQ2fibv01/tdUaHuQY3/yfroqnL00m8HY0dmTFz9Ce3RYdkjNUZodGroCmcaQj0yiPVrPn3kiGUzj9LBX4wAwxpjzMk28S7u/PDc+rjRmSaXsjeNuO479Wy9OeMm6Bq1vubNHcCfbyw9umsEVVzL0gcdwf4hgx/0JN6J+412Xr0Pf6HQZDxuVnDcV5VqNCNMzusmSePNIT2Dnv1C2/TCpOJo9KWlx40670Fg16TqyFVgHebOzSMi8KWhUZdeyVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBjmjof9Oa4JwrT/Urrwr3h05cupXUUl46Mmq6hAZ00=;
 b=BWyNSSiTWyLYn4eEsMeD/UqE9onyvSji7f6ImpECCT799SNcfwGHG+JjKUeCiZ7a15ykbkalWCLVOGXONIPZQxiPOeiCeEppNAcDLu5GaA9yPUAPdfm8dMVRiO6MG4wTalWrp0LHmGUFz6rN0m79Ez6W0eOM2QVWtpReUB0mJQfKowM4iIhmtpv4MroON+ytdP/16CfTbQ2TzHEb7VS8CxZufEE0rlAQk61b63trr06trwcku7cV3qXlxmNJtgBnGdS1x3BHNs98mA9fXu0G/a0oHwuNx+W9HeIIiDi6NOBnKrtY4rsV/P3ecsr4rJHGViqm4Nh7aIh6w6erxxd5/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBjmjof9Oa4JwrT/Urrwr3h05cupXUUl46Mmq6hAZ00=;
 b=oRVcdM8nW+UNyZwHizcXjVVOCCk1JPgG18XLX1qORQ2rcLB3V+tPcrHHT6X2ZwbC/f3sEatNn+sdj/psOiHdSEK7ge1woMqQKIMYg3oCcuDavwpY2GfsQ8oXJfEjftjRWa1L/H466xkjLgOgtIf2vZk/feAl+GP7ME892LbDlGM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from SN6PR01MB4973.prod.exchangelabs.com (2603:10b6:805:c4::13) by
 MN2PR01MB5758.prod.exchangelabs.com (2603:10b6:208:17a::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.29; Sun, 7 May 2023 08:31:31 +0000
Received: from SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::9caa:9d8e:688e:9e1d]) by SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::9caa:9d8e:688e:9e1d%6]) with mapi id 15.20.6363.031; Sun, 7 May 2023
 08:31:31 +0000
Message-ID: <3338ca49-61e7-b20e-f4f8-61b1531c3e81@amperemail.onmicrosoft.com>
Date: Sun, 7 May 2023 15:31:22 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH 4/4] ARM: dts: aspeed: mtmitchell: Add MCTP
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>,
 Chanh Nguyen <chanh@os.amperecomputing.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20230425065715.21871-1-chanh@os.amperecomputing.com>
 <20230425065715.21871-5-chanh@os.amperecomputing.com>
 <f5c261ff-7901-434a-aa2f-3b2f684cb4a7@app.fastmail.com>
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <f5c261ff-7901-434a-aa2f-3b2f684cb4a7@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0132.apcprd02.prod.outlook.com
 (2603:1096:4:188::15) To SN6PR01MB4973.prod.exchangelabs.com
 (2603:10b6:805:c4::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4973:EE_|MN2PR01MB5758:EE_
X-MS-Office365-Filtering-Correlation-Id: 33c06409-df8e-49b8-d35f-08db4ed5753e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	4/T/tekyuchm4EuOzZbD6ygAQvt7TxEH2x9k6XLXLArcwOQH9WfRsn3ptdpZ/yx1t32SFcI7Ifwuo0bn2xmrnNak/GMhAszlaSJvFi4rGfR3Rf1uLI0Y7JVPvI3I6eEGh5Zep7nYnbGvnFQpq4j0hu85ZQm0GIVhw8FkM3c3P6jwEHJ2yP83IyELc4hgSrMBJmWlUNhRUf9XaaQ0ceFokOePLHpZ8jCqO57OA3BT/QYEhos3MUUxOiTxbsGC47LnWBiM7+cUfBnRJAGKr2RcBK8UL2/gg/xstgK8109KBp1ZKtrN2Kt6fg9tLmNMpe8JjlrM+96LJM1eNvIz8IZgJhgi9f0yua8f/ILrihrHjs5T38ABccyI8XFvwLqOHp0qKdpbIa5w+ILKQwogDZ5a92qY7bPNdRNaIgJN+wJybcUzjAX1h4EF0cav1osGePhqjZrxBs+ZroA5niGpZZxNHmbtS+C5yai/B/nJ/d87ePGfTedYupDe8lpKy4xf+YD/3O83RthA4KoYO9tUkkuOde8HezkVHUR4o60lF7oek76o+Z0ve2xFiEgl930xh+2gnOiIP8PuPh5U9Gz8ZWLelK22BSsUENeizeh7qcd5osJL7c4RcFNAe1DLPrKlZrvFvJJXvshq1hCeSBqZx4qhGw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR01MB4973.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39840400004)(136003)(376002)(396003)(346002)(451199021)(6666004)(6486002)(42882007)(186003)(2616005)(38100700002)(921005)(31696002)(83170400001)(26005)(6506007)(53546011)(6512007)(83380400001)(66476007)(66556008)(66946007)(4744005)(2906002)(110136005)(31686004)(41300700001)(5660300002)(8676002)(316002)(8936002)(478600001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?UkIzbmtLWllSV2ZxMUhsR1ZqYjBUOUZWd1QyZ3VVTEh2c2IxdnZUbjNicTdY?=
 =?utf-8?B?T0VnRlRmb0o1SkJXUW1aTDE2N2RleUNBWDhsS1NOb2JjckkzNzRjL09MSE10?=
 =?utf-8?B?WHpUU3RIaWN6NHFkY2ZrLzNKbUFwZHE3OHdaMHpFK0tkeEZVMW9JaHJpeGl0?=
 =?utf-8?B?d0JSYzN6dnNhOFZHSWhiTXpKSVBCTCtKSlJJL3B4TlJnQ0R6ZUU4dDlQMWkx?=
 =?utf-8?B?R25PME5qRGRpMzJ6eWFvL0F1SEp2MDAxMUJKVHkweWI5SHJCZWJkSzIzVXk5?=
 =?utf-8?B?WHpCeDU3OWRxMTNYa0U0WFlYY1VRV0ZyWXp2U1hBUWN5dTdMWTFxTjZaK1JD?=
 =?utf-8?B?bkNQUUxwR1hLUUpwNGpQZkhvUXJqeXhYZ3hvNDQ4MEpkSE4rMlpuSW02c1FR?=
 =?utf-8?B?NkhIellrQkdEbXp6a3REdHo3TzFtbjVtTStlczMrMnVLWmwxQ2FBbnNJNkVX?=
 =?utf-8?B?R2VFbmNIYWRlQlZPcTBJcmVmNGIzT2hPWVR6SFYvSVNaY0hQbHc1Q3FGbGpN?=
 =?utf-8?B?QVh4cDFhSnJHQ0FCQWd6QUxnRjRzQnpVKzFaRDdQS1ppMnZrN1NVNUZudjU1?=
 =?utf-8?B?YmtGR3FDYjcvZ0dMWUtUVnNJSkIzY1RvbDVmODl1N1J0K3dVVXgvQ3kyZDFk?=
 =?utf-8?B?aGhueGVjV2hhV2liTUFOalVESitNMGpjRnIzYmt1U01FZ1ZOVnBuZTRxT0Uv?=
 =?utf-8?B?SFR6WmlmUFlwRVdDd0JmOVBScEY2NDIxVUxPRVBsWmJwTGQ3YXUyZ3R0Vjh4?=
 =?utf-8?B?YjY2S1VhYjVTdEx0TmtHcjVRL2FMeFg4dmd6cjhEMHJac1IxVFI4Vko3MFIz?=
 =?utf-8?B?cDhhRWZON3dsSFJ1U1E1bkNyUHhlSEdQeHlrQ3ljUGNvOVFJeTFvdjhWZDNv?=
 =?utf-8?B?aEJwKzZrVlZ1aTIvRnNDZGpHNXNrbHZpZ2pYNk1BY0o2a3MyaGp5anVTU1J1?=
 =?utf-8?B?MFNLK0VXMC9BclpvUU9YQWhralVMU0dSMmpkNmN2MUJxenRtY3diUDlhb3lT?=
 =?utf-8?B?QkdYUTNwNnlEZFhMTnpvbXpqelVhNUxnN2tGN09ma2tpODFJdXBmVERveW9u?=
 =?utf-8?B?NU84Z0dRNDJYU2Npam5mbThXT2hYd2I3ZXdlNlVlRlNPV0ZzZ0pJc3RtWklJ?=
 =?utf-8?B?M0lNVHIrRHg2Tjljc0ZnZVBnZ0tNdzZuRTJNK1dvcXBjcDYyekFZVHBvaDVL?=
 =?utf-8?B?MkZKQmZtcEFCWU02aTZpck1JdGlHcEZ3ZmphcnpMMnJicVo1cGxVMTMyU3Jw?=
 =?utf-8?B?U3pzak1NbDJHL1F2ajJHaGgvSWdQeHZ5MHJrQm5jRUNPYkFCVnhXNXJCdGZi?=
 =?utf-8?B?Um5VMjZmUVlkUDE1UHVVZU1IQWhMVm96c1NvbSsvSTFodVUwSEVBN1NEUFRM?=
 =?utf-8?B?b2pUZExnaHVMazN3dVBuUUZvMllpR282amZxZnUwa0wzM2pTUUpMUnU0Q1da?=
 =?utf-8?B?aytvOWhpZFR1akxOSG5HWEZHbHBzZEZUbjVtOWVFR1lNbmk3eUVDV0tjL3Bt?=
 =?utf-8?B?cXg0dGlsUVdKMmQ3WUxUN2JRNHc2WUo3bUNlUnZWQjNYeC9Pazd4VVFrTGhO?=
 =?utf-8?B?TG1nSCtlTHEzZTU4dDNERDFCVDVIbHNZa1hkZ1h2NEZpZURneXdrSTJndzhm?=
 =?utf-8?B?MVVKZkNEVm1vSk5hS1BIOXFyRllmdGN5TnV4M3ljV3FBdmZGMTZIbEVCWjBY?=
 =?utf-8?B?c1ljL0NsQzdKVlMwbDdQaFhjT0FjUVRuSU9MTUNBbEhZTERiTXJsMEttazNP?=
 =?utf-8?B?K0hjaHY4YUFVcmtRQlU1dDh6c1ovTGx4aWo0Z041REZuSXBTYnJVaVJmam1u?=
 =?utf-8?B?TDJoTEtGZUpzeDhvUzNuT0JWODd6V2srK3hzdGxmSzNTV3FXTXorSjJqY1JI?=
 =?utf-8?B?R09NazVtRUt0Wk9NaXJVODZ2MFNnMTl3UU9aNTdhNEJxSjl2T2ZzNzF1UnhE?=
 =?utf-8?B?eDJYM1RVSGRVOFpUOGlUdHJhRHR5V3kwNzhHTnlqVlB0RHlES0N4RDBrbXoy?=
 =?utf-8?B?UE1GMExaTUNselFzK0NaTG55NzRYbWNnbXlwTXhpOVpsOWMwb3pWc05VbWpS?=
 =?utf-8?B?VDM2OTNiY2l1SzMvTmxZOHNpeFJSTFFPRWhQRERMVEMyaStGSkFpOFRLOUgy?=
 =?utf-8?B?MlRUbFY4ZVZ2YjBGRDVENVZJOWlNeG8zck5LZHdmRjhoenFKNE5Ic3pReVhy?=
 =?utf-8?Q?PVPb/xHqTnN+W1HL+8hQ8Dc=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c06409-df8e-49b8-d35f-08db4ed5753e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4973.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2023 08:31:31.2470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gz2lVkC6SFC39V1gu7uKe+zAGATPG73nuE6D0NF608J16NrBVhuYeI2veKTQ6BzmCIU0rJBO/iwxOfcTiWVvXyROMTz7fUULTMf2Q7IGVVIX8MNNVSpmiKdyWDy0/Wr3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR01MB5758
X-Mailman-Approved-At: Tue, 09 May 2023 15:28:47 +1000
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 27/04/2023 08:04, Andrew Jeffery wrote:
> 
> 
> On Tue, 25 Apr 2023, at 16:27, Chanh Nguyen wrote:
>> Enable MCTP driver on I2C3 bus for MCTP transaction
>>
>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>> ---
>>   arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
>> b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
>> index 0b5ea8620063..33e06eafed31 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
>> @@ -366,6 +366,13 @@
>>
>>   &i2c3 {
>>   	status = "okay";
>> +	bus-frequency = <1000000>;
>> +	multi-master;
>> +	mctp-controller;
>> +	mctp@10 {
>> +		compatible = "mctp-i2c-controller";
>> +		reg = <0x10>;
> 
> This needs to be `reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;`
> 
> Andrew

Thank Andrew, I will update that in PATCH v2.
