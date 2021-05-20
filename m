Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6F438B131
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 16:11:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmBVL3S5vz302c
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 00:11:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Yfx4aMmg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.220.136;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=Yfx4aMmg; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2136.outbound.protection.outlook.com [40.107.220.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmBTy412yz2xYZ;
 Fri, 21 May 2021 00:10:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K26ULtCzB3+f0tT9Nf2QoD23veRRoeKuRhtNHbdX3ODgetx1BbDYHTXW1X07l894vgfJD94lmryNX4D5D1Fy1AlbWWe0OMFQvSRU0epWV7t6BnIZ08IL9rY5Ol0Ls0NB5Eg4BwM49Kb3I7EJXu8S9TSCWWMjQPh16/QIJqKIojp7zZYu1NcA7X050wbNJUE07wQG/Hl95AYTuk1FHizUgWJcV+uJrx0xVmEKhlD3lwSwpODPZR96RK4FZnuQLNko8T6UJO/VDnfw2+4BXCaXj/qXx/5+Z+atJRtNRyCN12VFiqllU2t76X/PHANJFa07JOZDnreAmmIPdHYAfrB7nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GE86ePyOSJRCi3OwXbN7VwYhAoaN3TRx06w3gkUP+w=;
 b=k4gE5ANqu+n21FLzrEmNab3f6WDBle4qMnoaOvoGoL8LZ2kAezQo9PGmSdaxUk4TueAn/MNJDztmyXZSY3hkjMZhZj6BXxMX9sBYNd+Wtac6gs0iwr3UkLYjb1AzodKSEAk0DRduqp+QimydHnZ5oEnzkr/eINJtvPz2g+/pxWtRK5mySTkgYVpT5TCpupn+CpvurUKd3t4RTptmAjNxCxEkuTbIs98uWsoKV6eb4ZLdWYL+t3Syfoy26mgO3xOSV6KF0A+6bdmF4MFWe8d2UVn+4S6wPiyRNWqO2S83flMVy0Ku4u4AYK3c0uQnKYJri9BLw9wbfe7DlxXHkYmE4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GE86ePyOSJRCi3OwXbN7VwYhAoaN3TRx06w3gkUP+w=;
 b=Yfx4aMmgQQJOnVsug0qV1iwImmZHiVmfdno13EJrZQU4smKE8NE1UictkiBZijKLO6HWZ3Do+eMV7vnjZ5vXJrlL797XkQLxyewfLpqqsP/+vdbcgE/YMN+B3KobiuyW0Yfk+r6GFBNvzNCBC/brxp9maQCnb6wxl2e9QsXQgOE=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW4PR01MB6146.prod.exchangelabs.com (2603:10b6:303:7c::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.28; Thu, 20 May 2021 14:10:39 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4129.034; Thu, 20 May 2021
 14:10:39 +0000
Subject: Re: [PATCH v3 5/7] i2c: aspeed: Add aspeed_set_slave_busy()
To: Ryan Chen <ryan_chen@aspeedtech.com>, Corey Minyard <minyard@acm.org>,
 Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Brendan Higgins
 <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Wolfram Sang <wsa@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <20210519074934.20712-1-quan@os.amperecomputing.com>
 <20210519074934.20712-6-quan@os.amperecomputing.com>
 <HK0PR06MB3380BFA9FD9EF8F51F9DCC23F22A9@HK0PR06MB3380.apcprd06.prod.outlook.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <3eba7d01-2507-17c6-2b27-7f1a7e286413@os.amperecomputing.com>
Date: Thu, 20 May 2021 21:10:21 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
In-Reply-To: <HK0PR06MB3380BFA9FD9EF8F51F9DCC23F22A9@HK0PR06MB3380.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2402:800:623c:5f9b:6031:ff4f:8fc2:44d0]
X-ClientProxiedBy: HK2P15301CA0005.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::15) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2402:800:623c:5f9b:6031:ff4f:8fc2:44d0]
 (2402:800:623c:5f9b:6031:ff4f:8fc2:44d0) by
 HK2P15301CA0005.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.2 via Frontend Transport; Thu, 20 May 2021 14:10:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 988d9efb-bffa-4853-948d-08d91b990b77
X-MS-TrafficTypeDiagnostic: MW4PR01MB6146:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW4PR01MB6146687931BE44C97194397DF22A9@MW4PR01MB6146.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jN2oCI6Jfy2etBIpJnUE5zIfWlrcUKRJp8fpzqM4lqDqReYtMdEkGAQ1DmSp8k7u2S+WFZUuyeHAmQtqrLYzH+OFxcdYmHQVvPidHS2Q6TGTyzS8HrJHFIWo6olgC8vjX2XLrE7e9yC49q1LBy7CHji2sdmIxk4CkkJO6PYhz2i8x8TFWco2R/9wtbzcduK1pRWM3gAmWwltbSGf+wHblbDIJHScA2CpP84s5H9K5LSXr7KczLIARz2I/bD1f9BaC7rzN4BOTIdOovxmstIbA5/1EcOejWQB6Qw62dmRl72fXBhV9G5OAV9xjgXAS7kx5Bk/Mbjyd/nCJ/GiZFr/gw0CM5CjQCAdMELaiFzN+fpmKnHRJGNIn0KE7bYGdvpGk/K/Yb6Xjd0o62USokURLmn1PL8H68lXQNEscxI5IlMeJSa3KPW8YVDaNJL9/vQUTr6InCbdL1kwPsqRuQk7DvG141W7eLlKeqYqnTfReg7CR1bDJbxiL3Syklm9OmY+I4Y9DS5yD8dWEC2LjRsrErAe2CYBn0v3A2skpwREfT36OBKliOwyeU9ZAW34XkccAjdizEEYfKFk1s+6z8XcZ9uxf8MvAy9mXtj4Wz7yco/kZwO+tJH9Jv9r2iUEc34KgrkWWeAsDCKI16SGcS6+O93c1kwPbbK95JbG92G+oeOjqnNg5nw+xrMRtLexolsobscmzjDYGbPmCuK6FNdYlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(376002)(136003)(396003)(366004)(16526019)(316002)(8936002)(86362001)(186003)(53546011)(7416002)(52116002)(66476007)(6666004)(38100700002)(83380400001)(4326008)(2616005)(5660300002)(6486002)(66556008)(478600001)(8676002)(54906003)(31696002)(66946007)(2906002)(31686004)(921005)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bHg5dmNTK3FpSUd0RGVhaDRvZ28vcUlZVzJrUnc0QU9wVnFjaHRiS1g1cE9D?=
 =?utf-8?B?S1BwR21Gbmk1K3ltVEtZTGQ1M09wWi85VWJRcG1mVDhBUm9adWJ5dk5sVWph?=
 =?utf-8?B?VGtiVmNGakszZUdLL2dsQ25RaVFLYjR0anNGQ3BuSWJmdjdHR1R2Q1ZqeHl1?=
 =?utf-8?B?eEJieVNFaHVoUVNKZTZNckdoSEtTaVcvNC96ZUVJeER6VkVwWGNXM2FSYllR?=
 =?utf-8?B?VlVXMGl3ZGpxUVV1cVVDWWM1N3h2YkJFSDZuMndlYmZlVGdteTJLeFJoSE03?=
 =?utf-8?B?d3gzUUZSL3cranpYbkFES3p3K2lBYk5UcjNieG4yVFMrVFowUVJjMXVlaXRQ?=
 =?utf-8?B?ZmRWdjBYVzdUcXAxQjlxdzI4clJwYTEvU0lKYjRUM3Zvdjc5VWQzNnRiV1dl?=
 =?utf-8?B?ZndoeUEzMlBJMS9MSjZvcU45anhqbDdzbk5MYTdHWUN1cEpmd1R5YzJzUzBz?=
 =?utf-8?B?RVBqNEYrcmxBUE55eDg5QkJxVUlmQk0zWlBDOFg2c3Vnc1dVVEJmbHNLRTRI?=
 =?utf-8?B?WElHWUhtUGlCenFHVlIzb1NjeDVKc0ptVExTOUluQzhGeWJWdmorZDhJZ1No?=
 =?utf-8?B?dFVjaEx1cVBPU29tcVpGTGRSelR2dnRxWHBIaXYrSFNBSldJWUVWUnQxZXRt?=
 =?utf-8?B?ZTBTMWswaXd6cG9HRXc3QUVoaS8yZTNCcEkrSWFOUmYyV3NHOHNsMFhHL0Fj?=
 =?utf-8?B?WnBLME5mNDE5OEhxVFZKTjdXUWdpd1dpYkpyT1dicUdKMTN0dVBpT2JrcUxx?=
 =?utf-8?B?dHRXTWt3c2ZSUnZlektTSXdkSXBSVlF4S3BlUktCWDJCVWFJdENUTGNvN01t?=
 =?utf-8?B?Rm1CeFFrdmdnYWJKVms4NWtuYUprbVNXaFNoeStyOHpiTnRJMWh6NnpjdFR4?=
 =?utf-8?B?WjM0c2M4aER5TkpyVUdWUE5WQkZFa2hDMWNKd3AxQ1JQR0hhdzNEU2NKQXRj?=
 =?utf-8?B?aXljdSsxZXNDMnh5ZEFaay92SEdHcmdQOFQvQTJsRGE0SitHbzlDcWhIT0gv?=
 =?utf-8?B?Vitvc0M2MWVnT3dkU2x4T1RkNWxMTHpsU3JLaTVNMnFzS3ltUXJqV09wM1U3?=
 =?utf-8?B?ZldrTkhYTk5PMjhTTy9ubFhVdCsyOEFkWjd2YVN2VmhaRWhLUk5jelUvb2hX?=
 =?utf-8?B?LzlFNWYxWWhscVRVKzBpZC9MMjJDWmVnTEh4VCtBVFJIenRGc2l0NHRXbEw2?=
 =?utf-8?B?ZG9rUWNmT0hpelppc3NNWlFkVnhoMHl0ZHZWUGIxRHVqb1B1V1BESTdTZWhL?=
 =?utf-8?B?UGpwM2dTaStsN3pQcWFXWU4xZTBBbnlFa1Y0aU5wTEd5RjZ5RFh0ZHk3a05i?=
 =?utf-8?B?Mk52VGYxZjdKS1ZacURxNGpuQnp4R0R0dDhFWmVPMXg0NUN5ZStTbUJvS0Rw?=
 =?utf-8?B?ZkpTK29KNXJ4WStLRTBocDlmdUZLOUxpL3pPNnN0TGw3cXZLeDJBU2cyNjBZ?=
 =?utf-8?B?bWtHZEdjR2tUbmp2Vm5CVWFBNVZkRFg4eWR6WXNoU0kzWWJpZnJBVHlNR1JP?=
 =?utf-8?B?SWFkVS8zRFF6ZU80bmpKa25MOGpsV2JLd1FEWjl1QzlaZCs1eEI2dVd5YmRQ?=
 =?utf-8?B?VVVjdXVOT3EyaUdpalBwSXJRZm5oSzhKdDFxODhmT3JKUklzNXVzL3JyblZ3?=
 =?utf-8?B?aGVpMTJ0WVNpVzY2S0hDUHRadFZzQ3FXcFlneWN4cGV0WFNLTW9RdGVVUm1E?=
 =?utf-8?B?eGtkWTBZdTFiVjl1YTYwSXhCVUNGOVJzdDdQSXNyY0xPeVJDdzNZQzUxWkNO?=
 =?utf-8?B?NC9wajErWTgwdHdCWEc3VDBtTW1vWjBmOGRUY3FsQjZBVGRQaEcwTTMxSjJu?=
 =?utf-8?B?bnRjUndscVNXNHF2NEZnTlhGWUZMZXl2dDMyMG1QUnNlWHV1UDlQSHdrbytr?=
 =?utf-8?Q?Ptmbnfr1mfGt5?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 988d9efb-bffa-4853-948d-08d91b990b77
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:10:39.4123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 63T0X4gcnmbvlNKVNydmCE7ZyUiC7sdWITt2rT4W9xnH/bnCu157GAQ4Ti6pNqL7zNFlbhUTdeuFpv8X4T07KQ9ctAdBSBmVEoFnajPWBfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6146
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
 Phong Vo <phong@os.amperecomputing.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 20/05/2021 18:06, Ryan Chen wrote:
>> -----Original Message-----
>> From: openbmc
>> <openbmc-bounces+ryan_chen=aspeedtech.com@lists.ozlabs.org> On Behalf
>> Of Quan Nguyen
>> Sent: Wednesday, May 19, 2021 3:50 PM
>> To: Corey Minyard <minyard@acm.org>; Rob Herring <robh+dt@kernel.org>;
>> Joel Stanley <joel@jms.id.au>; Andrew Jeffery <andrew@aj.id.au>; Brendan
>> Higgins <brendanhiggins@google.com>; Benjamin Herrenschmidt
>> <benh@kernel.crashing.org>; Wolfram Sang <wsa@kernel.org>; Philipp Zabel
>> <p.zabel@pengutronix.de>; openipmi-developer@lists.sourceforge.net;
>> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org;
>> linux-i2c@vger.kernel.org
>> Cc: Open Source Submission <patches@amperecomputing.com>; Thang Q .
>> Nguyen <thang@os.amperecomputing.com>; Phong Vo
>> <phong@os.amperecomputing.com>; openbmc@lists.ozlabs.org
>> Subject: [PATCH v3 5/7] i2c: aspeed: Add aspeed_set_slave_busy()
>>
>> Slave i2c device on AST2500 received a lot of slave irq while it is busy
>> processing the response. To handle this case, adds and exports
>> aspeed_set_slave_busy() for controller to temporary stop slave irq while slave
>> is handling the response, and re-enable them again when the response is ready.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>> v3:
>>    + First introduce in v3 [Quan]
>>
>>   drivers/i2c/busses/i2c-aspeed.c | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
>> index b2e9c8f0ddf7..9926d04831a2 100644
>> --- a/drivers/i2c/busses/i2c-aspeed.c
>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>> @@ -944,6 +944,26 @@ static int aspeed_i2c_init(struct aspeed_i2c_bus
>> *bus,
>>   	return 0;
>>   }
>>
>> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
>> +void aspeed_set_slave_busy(struct i2c_adapter *adap, bool busy) {
>> +	struct aspeed_i2c_bus *bus = i2c_get_adapdata(adap);
>> +	unsigned long current_mask, flags;
>> +
>> +	spin_lock_irqsave(&bus->lock, flags);
>> +
>> +	current_mask = readl(bus->base + ASPEED_I2C_INTR_CTRL_REG);
>> +	if (busy)
>> +		current_mask &= ~(ASPEED_I2CD_INTR_RX_DONE |
>> ASPEED_I2CD_INTR_SLAVE_MATCH);
>> +	else
>> +		current_mask |= ASPEED_I2CD_INTR_RX_DONE |
>> ASPEED_I2CD_INTR_SLAVE_MATCH;
>> +	writel(current_mask, bus->base + ASPEED_I2C_INTR_CTRL_REG);
>> +
>> +	spin_unlock_irqrestore(&bus->lock, flags); }
>> +EXPORT_SYMBOL_GPL(aspeed_set_slave_busy);
>> +#endif
>> +
>>   static int aspeed_i2c_reset(struct aspeed_i2c_bus *bus)  {
>>   	struct platform_device *pdev = to_platform_device(bus->dev);
>> --
>> 2.28.0
> 
> Hello,
> 	The better idea is use disable i2c slave mode.
> 	Due to if i2c controller running in slave will get slave match, and latch the SCL.
> 	Until cpu clear interrupt status.
> Ryan
> 
Thanks Ryan,

Do you mean to enable/disable slave function as per example code below ?

         /* Turn on slave mode. */
         func_ctrl_reg_val = readl(bus->base + ASPEED_I2C_FUN_CTRL_REG);
         func_ctrl_reg_val |= ASPEED_I2CD_SLAVE_EN;
         writel(func_ctrl_reg_val, bus->base + ASPEED_I2C_FUN_CTRL_REG);

Will try this idea.
- Quan
