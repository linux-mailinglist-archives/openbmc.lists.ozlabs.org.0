Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0A8356527
	for <lists+openbmc@lfdr.de>; Wed,  7 Apr 2021 09:24:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFbVd3YJPz30Cc
	for <lists+openbmc@lfdr.de>; Wed,  7 Apr 2021 17:24:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=vcPf+Z0A;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.243.130;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=vcPf+Z0A; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2130.outbound.protection.outlook.com [40.107.243.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFbVJ4BC7z301X;
 Wed,  7 Apr 2021 17:23:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cGeNa9y7Dy9MxZmHmKFT7I4PoH67HYCHqYyQ5yL/BsuCWH0OgdPnQBtPAgLVWUMrXGI6pf0W035UDbgGqt+zomvv+HhGkwrOCeccmJm8uUO+kNZicuMyEiZkCez+4C4XJ0raOGuz/4TPDwul598PqPbr/hn4210AUNUvR2VvyXvaYR9uLEBGbWVOgGZQPHQDTbkwZA/9Sn92ERkRhHMeW35eWZJ8LHPqOnbBBVBlX01ET0wTA+kssz1OHv6keRMqFoetL4YLdhcCT+hTQjzVzPXQNIpNnvv5cOGW8Rbqu4XF5KQ1v6cHtOQ8Rku2QTlielaDczmKX1hXlXkAPgcuNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WkYhpq+MblylCJrujjQy2VfL2tPsVj3NCde7ZlPywA=;
 b=iSuIeYp0Tg/VUbkPkXwldDzogHY4Q3d1hhFUiHLylQjE/jbxdqqtb1HhJBWfpdHoq8bADXbJNw49Mz7HByaz0sKAeF514GGf1G4pAmlIoJ2L98yMdiDzf+7Jl8QIqQrMsF9vR4tPZk4OUR9fJZbOiTghEt7L4aXV6hJFzQjSejQZpCXaCZP+Qob6iumOe+b8nVXhj6rAYsle/M1S6QQ7mox4yYgv/AAmKEn+nxDI5mU+SqjxjIf0rE0jNX+ZiSBnQ77v7Ds4cC+ITTPMMzPstpV/z3JqVNXIUhDZVkX3j5WhBkW7OIv0YlYecKoj/zbxPjp93Bf3zitZViC7D7PL5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WkYhpq+MblylCJrujjQy2VfL2tPsVj3NCde7ZlPywA=;
 b=vcPf+Z0AfEG/Sfyc28EkbnKmmqO+c/Nvn3ZFIoNWeQ2k9aXVdHXBLc05C/xfjjjUPCekyJBd97AekrvpAB1GIOVhQtPcKVggkAJoUb5JS2djzHlcjvm/hgnVzwwduEalg9sZprkqsrXWdYshY/GEmsaC3j/hTN7qfdpKLNSTn0w=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none; os.amperecomputing.com;
 dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 CO1PR01MB6582.prod.exchangelabs.com (2603:10b6:303:f2::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.27; Wed, 7 Apr 2021 07:23:44 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4020.016; Wed, 7 Apr 2021
 07:23:44 +0000
Subject: Re: [PATCH v2 2/3] drivers: char: ipmi: Add Aspeed SSIF BMC driver
To: Philipp Zabel <p.zabel@pengutronix.de>
References: <20210330141029.20412-1-quan@os.amperecomputing.com>
 <20210330141029.20412-3-quan@os.amperecomputing.com>
 <20210402120137.GA26002@pengutronix.de>
From: Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <82887823-b6b7-3d53-0fe3-571cbb2552c8@os.amperecomputing.com>
Date: Wed, 7 Apr 2021 14:23:32 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
In-Reply-To: <20210402120137.GA26002@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2P15301CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::31) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.33.17] (118.69.219.201) by
 HK2P15301CA0021.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.3 via Frontend Transport; Wed, 7 Apr 2021 07:23:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88f1e623-8bc4-4fc1-f7a0-08d8f9961373
X-MS-TrafficTypeDiagnostic: CO1PR01MB6582:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR01MB65824B7FA38C17A929E4CE19F2759@CO1PR01MB6582.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jrm5Tie/BEQNcb0nZ9w9yAYdec3AJPTU9JswelOudER30RAb+LV4mbJNAG9Yk219LIecyQuNRoqHkRw1nj61W/KOcBFmRckr7T9eZU4th3rCh59mmmaxR41aRtz5EHm6sONbCrxLqKGjETc7dKkuNrr7Oo2rjfBvJEolROrzc8JS/AObAdei6yFVh7wZSan2SLx2OZbQqvwQ3f5Xi7pWJ/CM08D5if8N3QeS7yZEJBO/dGLlHE2zFCl6JZkGjqVbK4L8HcmSER9G+kEjLP49q8BPEHYKVcIa3hE4pCEZsgJ20i+oHzJTtc/8B50wBVb1/TQJRwigqPzLVK5sCIlPUXonZALDUrwwt3nlRmW5bcYMIgPfWlwzAncqNA3KDaRF9fQjOYvCuWHbLipJmsyee5sQ8kMvKAAwPn6KLUK9yt3J1B3io9jc2DPdszCZIJIHzA7WLt+qTpMePdL//Pf7De2OuEFDRFQVnw9PHIB3g0oDEbQSTR2JLgbepaAyb7MnORFfBmjFGgEV2nd3+iD2rYBMQzUUnMMvM/48+qttO75Dyzi4CVKUBr4Q/X9OTQrN020PuSlRRfchkGDZbJmjBehrqEupV9hWYPNuT4DbQZ6iI5QrnOHiEALinw4wmDSwUVVhYRj69rbdQpKPfnKvBcXiIMCKfif8Vkq1rF1MIA+eucSj/JrL7sqqMqIHcR3jNizWgXm8pJ+cxGiSw/CDj9tNcQmhdBPB/QCBbEcCGQLL/EpnikJ3vUcG6KdT9p6t9EhTeqxKVWI4sDoYXASuZjXBnNuSiI5GMoSY5aQzzGiWsrhuHKYm8gMcMI9vn1gvz5S2Kdt7DgxECk+jcbrEB44ltLN+qwqMz6VUKGDGuU0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(39840400004)(366004)(346002)(6916009)(107886003)(54906003)(8936002)(38350700001)(66556008)(8676002)(2906002)(26005)(31686004)(53546011)(4326008)(38100700001)(5660300002)(83380400001)(16576012)(31696002)(2616005)(66476007)(7416002)(66946007)(6666004)(86362001)(956004)(16526019)(52116002)(478600001)(6486002)(186003)(316002)(2004002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TXVMYTJVVTZleWNKVUFMcldWNHpQYlVRNktTM2Njb0REVnZyNi9ZZnZZUHYz?=
 =?utf-8?B?SGQ5RElqRkhOMktSOHdIVFBiV0Fqb08wa2I2RThRRmwvQXJJMTJndjFpVlpk?=
 =?utf-8?B?UGpybU9QV3IwSzlwaFA1aXdGVnZhb2QwZGphYTRXMXJHNnJRaFAvM1ZtYkhT?=
 =?utf-8?B?eFN3dkJkK2ltQnh1cHp6S1dGVStqUENGc1AvTFlJV1JPb0tVUndqUFBhMllL?=
 =?utf-8?B?STRVUjQ2Tk93L3BYU0xGWGxyVXRwV2x2OGxwbFpQdFhwUjY1T3VXV2lqZmZO?=
 =?utf-8?B?cGFlbXovK2NaVGVCL1JCQ1AwblV4ZUJBMGNqTjlIYjl2UjdkN3lCeXFEb2ln?=
 =?utf-8?B?am1mUzVRVlVnSEp1VFRXMWNVTTJHcm43bHB2bGxyNlh3UnhDK0RIWGkxSFM3?=
 =?utf-8?B?M09NY2xMREtTb2czeFhPbkhMUm4wOC9jZGU4N042K3hFa3k5MHg4UWNMVHIz?=
 =?utf-8?B?OWZvY2ZHaUVBa2NGb1d1VTQ1eEZ0QjlzTUV3SUh5VXpBNUZMbXh2cUYreFZl?=
 =?utf-8?B?VGM1V0o4NkdzcjhvdUhYMk5RS29aN3VFQldVYzJ4UUJsOEVKakxTeDhkRFdZ?=
 =?utf-8?B?YVplVnBPRExYcFRvN3ptRmVrcWpvUDBPR3hJSHhQNzN2R0NvT0ZxWitVd2sy?=
 =?utf-8?B?SVBDNTJRRVdZWG41d2ZnVHBOSDRUMCt1OTlzTDk0VmVHMkZIWHVsWnBTb1lJ?=
 =?utf-8?B?UVlvU21welNaM0JYS0czUDNDWUhtVCtEQW05NUpVTk54aFRGU3Q4Wjd6Mi9a?=
 =?utf-8?B?UncwZUl6MGtYMjdCSzNSMWJLSGljTk5rS1d0OFNhYWxKSEtmLzhLSDhOd2o0?=
 =?utf-8?B?MDlPQTdJM056ZTJWaVJWeEh1Qm41aVlmbTZORnp4VEprQ01KK0MzcHFLU2JD?=
 =?utf-8?B?a1NMbldDNXNOS0ttbW5KcndpRklaOVZMMXBBNTFZUDlBZ2JjMWJQREsrd1Ja?=
 =?utf-8?B?Q0lEdDcxUGRPUTRQV25SSnhCRmlBNVE1bzZZdHFML29oWEVmMGFqaFFuOWx0?=
 =?utf-8?B?aDlETEthVWJiclB2bXRoTGNhQW1adzlvZFR6MEtBSTVkellLY1oxZHVZYlhF?=
 =?utf-8?B?djAyTzJKWi93YzY0K1pTM2YwRFVxTnEvcCtGV2hKRytqZ293TzVkUXB3M3Ix?=
 =?utf-8?B?ZTg3NlFQN2s0YU4xZGZTeFk0OWluSE81b3VqR3lNdkxNUDg2Wkw2Y2VIcHo4?=
 =?utf-8?B?ZGI5ZDE4d2VtcGIxT0FxTXlLaWxkLytPZ2NvdU1JTldoNWR1STNTUDhlWi9T?=
 =?utf-8?B?SWhOVTZxbTdIZU9IdDBKTXVwanZzUW5Bb3FKcGdKbFRyMUxrRXpOT2lBdTQv?=
 =?utf-8?B?VzVqTlBJQUVBOVFueTA3cFpBMkl5VldUYTIwcUFDaHUwMFFVMXpVNTNRamEr?=
 =?utf-8?B?Snk2c2Z3Yk5ZZVNoa1VmOUt1WFBQUXpxVTNZSlRXTkpScVlEU2ZlNy9qRnJm?=
 =?utf-8?B?RzM2Q1ZQUUNzNFhIMGw3d1pYdUVOZGtlMnRCdHZ1Mm1kSmhGNnl0Q083WEhQ?=
 =?utf-8?B?dWpBRmJDT0Z0VVNDc2pUdlJJdG52dFp0Vlc1cHRrRGVFTDRGeDNYcXFXUWxm?=
 =?utf-8?B?MzJ6Skp3Mkk1MUN6NUVuNnFKUU0zMnFycFVSeExZRGdMMldZU0hYSzJwODFE?=
 =?utf-8?B?L3IrQ0lnQkZYT1ZUbDkzYjhtNmtHOS9QM3lqT1RvSEljWHNoV1pWSUZKYnJz?=
 =?utf-8?B?MlRPL2tnUm9qS01TNGY4MDVxRjVpTDlXVEFIQmNrU1pmRW1zcUFVczBDOEtH?=
 =?utf-8?Q?7ANxSK7dNOipkfX7X+XfsvM7K1C4TAWgW7L8+F8?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f1e623-8bc4-4fc1-f7a0-08d8f9961373
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 07:23:44.2791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j3/zi1NbuAoqrpUzJEsiBTO4UNb4VtYuVTx1r1CTotSbPLKajwzI9Z0mw3dKZLbTDmoZb6xAzuBfZmXqEKFVoMDhB5+2s9kyJbEQg2PfDr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB6582
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Corey Minyard <minyard@acm.org>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>,
 Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 openipmi-developer@lists.sourceforge.net,
 Open Source Submission <patches@amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 02/04/2021 19:01, Philipp Zabel wrote:
> Hi Quan,
> 
> On Tue, Mar 30, 2021 at 09:10:28PM +0700, Quan Nguyen wrote:
>> The SMBus system interface (SSIF) IPMI BMC driver can be used to perform
>> in-band IPMI communication with their host in management (BMC) side.
>>
>> This commits adds support specifically for Aspeed AST2500 which commonly
>> used as Board Management Controllers.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
> [...]
>> diff --git a/drivers/char/ipmi/ssif_bmc_aspeed.c b/drivers/char/ipmi/ssif_bmc_aspeed.c
>> new file mode 100644
>> index 000000000000..a563fcff5acc
>> --- /dev/null
>> +++ b/drivers/char/ipmi/ssif_bmc_aspeed.c
>> @@ -0,0 +1,132 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * The driver for BMC side of Aspeed SSIF interface
>> + *
>> + * Copyright (c) 2021, Ampere Computing LLC
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License as
>> + * published by the Free Software Foundation; either version 2 of
>> + * the License, or (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program.  If not, see <https://www.gnu.org/licenses/>.
>> + */
>> +
>> +#include <linux/i2c.h>
>> +#include <linux/miscdevice.h>
>> +#include <linux/module.h>
>> +#include <linux/poll.h>
>> +#include <linux/iopoll.h>
>> +
>> +#include "ssif_bmc.h"
>> +
>> +struct aspeed_i2c_bus {
>> +	struct i2c_adapter              adap;
>> +	struct device                   *dev;
> 
> This device handle is apparently unused.
> 
>> +	void __iomem                    *base;
>> +	struct reset_control            *rst;
> 
> This reset control handle is unused as well.
> 

Thank for the comment, Philipp.

The main purpose here is to get the aspeed_i2c_bus->base of aspeed_i2c 
driver so that the ASPEED_I2CD_INTR_RX_DONE and 
ASPEED_I2CD_INTR_SLAVE_MATCH can be masked while handling the incoming 
request, otherwise, the process is disturbed because these interrupts 
keep occurring with unwanted value.

Other solution we have in mind is to implement and expose the 
EXPORT_SYMBOL_GPL(i2c_aspeed_configure_slave) from 
drivers/i2c/busses/i2c-aspeed.c

Really appreciate if you could comment more on the solution.

Thanks,
- Quan
