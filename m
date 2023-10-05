Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B5F7B9BA8
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 09:59:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=D4yk9Kme;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1P8P6ff8z3clc
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 18:59:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=D4yk9Kme;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e89::718; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20718.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::718])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1P7f4dSjz3c7C;
	Thu,  5 Oct 2023 18:58:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYGdSIzDftFZDqltXxMkwh3tCP6Is81cF8Rf2a9p3/XbKP638nHKpafybDW3ds2ErpDVdovN/RusG1YfhplDxi+xif3sB2mxrKaFRtRBpeUqwyI2c+dDN+J0REk7GY2mRu4phwwfLQjvmcdYuRCME6OuiDpytPN333hPnqJhEV0TXDJkM8htsO3pcn5i0mp25eaPPfBHwDXVzItCE8IV7uPO7+vYeyG+2iogmJMiBsewoUYKAJnAN0j+TOm9NXEBibmKI+qEZGxWtsNjRSg73yTxRtTP5SfGIT9tw0L/tCoiKY8tINdCi6U25Lmcmji9NfDf7eWOchyDq5RqkcnbtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydHh/l1sh6UkJhZ5XA4ks/BG0zk6Oag5AGnYMCGnB5g=;
 b=BSLxvNwP9vwEt6ebDoGWrfJnd0S7fhKFQUk7Cn44E3xtZI4nbZu252rslrhdurJ2nHK2iCajsEpzkcr8mWxki6CdqUg73GpCLwGrAScsDcli6KNU5eJidRc4cSBu0/Kx5ONSEKUNNbdRfBaD6RIkasO28bP3nfcuH5bsJobA0BSa1zV0JOxGvAfyrMkv/vrsQPzUoRju0BhAaDd/Xh/zCZLme58uJ46r7pysneqeQsAyNvFUFfzQECjns7TdBIuiLc4x4e7y5pwVn49As0929EYY1UDKGgQkr0MBoAPQXk0NMyr/AUJlkqP6621WIEYykziQaWXk3TR8K7Agysg7Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydHh/l1sh6UkJhZ5XA4ks/BG0zk6Oag5AGnYMCGnB5g=;
 b=D4yk9KmedcTxAuWAy6D7EhiijpeFuWWBiFV6sp2+0oxHLbD3VT8wGiF6XMurx+d1FhHxtYDLGHzc+80vz0BAIi1Nc7YZ0Rrk0xWa4ux7xuZVyMnwBfmss/ubreaabKpovMCfo69nXlYq08M29YiDiWEhdTGcsCbIxFzVLs5rq84=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 CH0PR01MB6954.prod.exchangelabs.com (2603:10b6:610:107::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.37; Thu, 5 Oct 2023 07:57:57 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::d0ff:a03f:8178:8414]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::d0ff:a03f:8178:8414%6]) with mapi id 15.20.6838.016; Thu, 5 Oct 2023
 07:57:57 +0000
Message-ID: <052ccd48-2541-1ef3-1f33-75b7d49611ad@os.amperecomputing.com>
Date: Thu, 5 Oct 2023 14:55:21 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v2] i2c: aspeed: Fix i2c bus hang in slave read
Content-Language: en-CA
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Wolfram Sang <wsa@kernel.org>, Jian Zhang <zhangjian.3032@bytedance.com>
References: <20230927154244.3774670-1-zhangjian.3032@bytedance.com>
 <ZRZ/ObZmntMLw2r+@ninjato>
 <975c69de32eefb124fe668e921e8dbda86962deb.camel@codeconstruct.com.au>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <975c69de32eefb124fe668e921e8dbda86962deb.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KL1PR0401CA0033.apcprd04.prod.outlook.com
 (2603:1096:820:e::20) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|CH0PR01MB6954:EE_
X-MS-Office365-Filtering-Correlation-Id: 228a8820-8495-4101-df87-08dbc578c903
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	IZUMGkba7+D00mPbblEwYZy5v2SfV4VA4Marjj6sxc9oX3A907j+fsjBl8ENSikMV6+Q1hvgN7YIAwYMpwlGBj2A0gVh9JXwxEOQDU2X79H9e8ZMOkWF0UCAqBNAu9EyUNFlxdVvtVNNY8NvOlD0dvsQ2PsRYzHgKGY2JrTIxDmKMs9dq1S7oorWWoT0UIN82w6O2N3qUMs47npFTZO72wbcA3TGGsWA37fWvbBw94oySCzN6sERFQO1PplZexRXKwitCO4Kg2vBKKKjnVbu9sqavSrgUbFZfedHrIPIPSQvXkzqT6M0bJDPY5Tdi7dGdA7ff2ZSozwekFMJPU8mwQPy3hOJt0eGfLwpDIZYb1A0AHYvphHRA6M7959R57TdIumnM5mx+Nz/zyLnBta9sl1FsZtzZX04LpD/PWOnjFscnmsYsFgywQE2bL8SKDdb6W0eLM2yEwR825WffksQlP8L3W5m5+NmqF87n92oGhwCJdkqr2YKuGC9RrvriRclTQ5/anFkPxc4WlapI7fFnYEX3lGMHwO5heL4G8sXGmyZDkIRyTF+mhTaYcxAFkALD+/wNaRovZf54n7eN84xH4SVLHTQcTg6MdakAAiAtqlFI8o7WH/rS+MQQWnzfLncUXtOptuxDt1RZH+nnQhzsg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(376002)(366004)(346002)(136003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(53546011)(2616005)(66556008)(66476007)(66946007)(54906003)(316002)(41300700001)(6512007)(52116002)(26005)(6666004)(6506007)(478600001)(6486002)(966005)(38350700002)(38100700002)(86362001)(31696002)(83380400001)(110136005)(31686004)(7416002)(2906002)(4326008)(8936002)(8676002)(5660300002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?ekUxWVc0WWt0U1dVZnpCU2hGZXBoem9ydjFaSnZ3clRIZ2xybGxDZ05BVHk5?=
 =?utf-8?B?ME5HM0NIcDJwZmZPNE9hNys2QVA2emlaMlpOdlJCTVc4NW41OXJxdmMyem4y?=
 =?utf-8?B?OW5uK3U3dDU5M3JuRlJma1YyNWJ4cHVpNWJwYVpPUXlKQzQyY0xXTVFFdnpp?=
 =?utf-8?B?SDJlZTcyaTU4anBCRkdNNjhlR045R2V4Uk5FRmFSYnY5SXhSSG1aZ3ZQcU9s?=
 =?utf-8?B?c3I0eGhQVHhzR0FibElPM25FQVdrZkZ1V01YZVpCUHZUMC9zeC9FV0RKN0JK?=
 =?utf-8?B?aXFGdDZYbjQ3OG5qTzdKOVhranJ6ckJtMTlDN1pZcHJpYjZia1ZFTWNvS3hu?=
 =?utf-8?B?aDYrRjVuM0VMalJiN0Z1VnptTFpCZ3phMGpCRXlVRGwzYUg1V1NuUlV6Zy81?=
 =?utf-8?B?b3Jhek1URURQNG9WZVlFNEdXRU91VTV2UHUrWFcwaVNqNWhucnVoMGpycU1W?=
 =?utf-8?B?N0N2MGtjTERCK0NCRm5Sa01tL3pub2hlTlA5d2I5dm5rZzhHdUNtUTNqOHlM?=
 =?utf-8?B?dmRldWxIb2R2NnhieGJwVFN0K3BwL2FQb2ZJOC9wVUxmN3ZLZ29qbGw1QnF0?=
 =?utf-8?B?YWxDY21HcGtZd2dTUVBEK1RoSHdoRndsb0hpUS9vaGJ6UjYrUlVLWGJhY1Aw?=
 =?utf-8?B?ZmdzTmFRdTBpWTdKbTF5VC9iSllNbTBjdWIvL2JVMmlGM2NxVzJBTzB2UnNL?=
 =?utf-8?B?S0JKNVE0dFZndUVtNkZkUGFIVDl1Ni9mV0tNQ3p3N1crVUEvSCtZT05JRXk2?=
 =?utf-8?B?amhBTW1EYmRQcm1EVGtDUlNzSnR3L2taRVQzb1gwb1RHVXdPdy8rRjUrQkh1?=
 =?utf-8?B?eW10QTNqTTFnQ3ArUjdZemMxM29Cc09WV1MvOThTbGx4OXdWZmZkc000VXFv?=
 =?utf-8?B?SkF3QnBGNkhOVExnUWIrWHpjbEFobUpLcE5makF1aWZiSHVtUDhoQ1UrekxF?=
 =?utf-8?B?dy9GSERPdjVZczVVM0t3bW85QWxiSWRqdkV1NEREU2l4Z1dYYStWeExsZWZV?=
 =?utf-8?B?RzJEWDRlSWFzMEFKcHlmTnRTaVJCUkxnTnQzQ1JBSGZsL0FtZFlVRVduVkph?=
 =?utf-8?B?R2IxTDRlclNsb0xCbCtnM3QrQ2hMRkdXWFNkRmtuZnJNSk5UTTgrS0pWRVNM?=
 =?utf-8?B?L29XZE1IaFhiWUhTM3NEU0ZNV2IrTXJyNjlWdC95Lys2M3c0RGVlK1VnRFJD?=
 =?utf-8?B?WnF0V3lrQjhSN2pkOHQrUU12blk4dElFNEVrVjhXT0VmajNmMEY2bUdWRytx?=
 =?utf-8?B?V016NzJHK3pWQ1ZYcGpwVFltYWR5cktMRWRWY0NEblNaaENuVHJLSDQzUXI5?=
 =?utf-8?B?cGZROFJjOGN1TjVYV0JFejhMMDFmWitJcnZHMHU0MEtSSENvdmRxOXE4WGZT?=
 =?utf-8?B?QVZQWXRGM2hYR0NPQzQ3WDh5eFVPVDN4TXFJK1YvK1h3N1FlWURGL0VwWDMv?=
 =?utf-8?B?OWZUVXJnMlE4SThLd29CdzlHNTljdnQyWmRsM0dtRjZtSXNWZXNlc3FuY2N3?=
 =?utf-8?B?UVZsNWx2U0lTRmdodGdjelN0aklHSzl0a3VaT2RqZ2U2Ni9tT2o4Z04xOFJj?=
 =?utf-8?B?YXZjTEdOMDJRTlZ3d01Ud0UvQzdxYmkxZTUxVDJFek9UVTN0V0MxdlJRbDhV?=
 =?utf-8?B?Ui9sZ0FOU21ZVWRpbTJVbXd6SzY3N1dhUGVuV0hFSzR6ZFc5M1Z6VHNTeTNj?=
 =?utf-8?B?VzNnaUdSM0ZXL0x5WW8yUStPdEcxQjliMER4R0l5cnBUbG5CTGN6SnY2b2xF?=
 =?utf-8?B?bVdKdVhTUkQ4SU5tcmVrV3h6elFVbUpEVzBLMFBWU3pBVWJNS3pyeG8waHkv?=
 =?utf-8?B?cjVlcnpXTmFnYVV3NUU1cHNLbXFHVW1qNUFJMUVtQ2kxRUt0S0l1eE4vbytB?=
 =?utf-8?B?eUhQYnBTVG1tRWFQRlVBT1MxSHRGMUpKYmw0TUdabkV4ZzcyeDZUYVFEblFG?=
 =?utf-8?B?RmZLSzFFb1JEd0NhOVp2cWpKNXd4MUtQbC95anVuTTE4eDE3dGxBVExiVkcy?=
 =?utf-8?B?WkNCSCsxSWdiLy9iZzdYemhUSjV2L2RXemYzMUFCNWMyUDI4TkRxaXllT016?=
 =?utf-8?B?aExlZ1pBMWp3OCt1eXlHT3ZmeEZReTZjY01EeXh1cjFHMm9Wd2VHQXhuZnZQ?=
 =?utf-8?B?bitBMGNYL0ZWWFY2bXBscEt4U2wzckppamhXdW8yWDJCa3hXMXVKLzVyMVdC?=
 =?utf-8?Q?H7lSOr98ra/NUiYINppL2cM=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 228a8820-8495-4101-df87-08dbc578c903
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 07:57:56.8413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uWdNmek++4BpiBDvpwgo7BgEy5BJlYxlj3MzvVO+ryPazB1sLDWLQarCEXpoSNKHhSYwQxg0ruYtMi0Xv6lOf9z98aIucOrvXESJkyeVEOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR01MB6954
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
Cc: Andi Shyti <andi.shyti@kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, andrew@aj.id.au, "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>, yulei.sh@bytedance.com, open list <linux-kernel@vger.kernel.org>, joel@jms.id.au, brendan.higgins@linux.dev, Tommy Huang <tommy_huang@aspeedtech.com>, zhangjian3032@gmail.com, xiexinnan@bytedance.com, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/ASPEED I2C DRIVER" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 04/10/2023 13:08, Andrew Jeffery wrote:
> On Fri, 2023-09-29 at 09:39 +0200, Wolfram Sang wrote:
>> On Wed, Sep 27, 2023 at 11:42:43PM +0800, Jian Zhang wrote:
>>> When the `CONFIG_I2C_SLAVE` option is enabled and the device operates
>>> as a slave, a situation arises where the master sends a START signal
>>> without the accompanying STOP signal. This action results in a
>>> persistent I2C bus timeout. The core issue stems from the fact that
>>> the i2c controller remains in a slave read state without a timeout
>>> mechanism. As a consequence, the bus perpetually experiences timeouts.
>>>
>>> In this case, the i2c bus will be reset, but the slave_state reset is
>>> missing.
>>>
>>> Fixes: fee465150b45 ("i2c: aspeed: Reset the i2c controller when timeout occurs")
>>> Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
>>
>> Somebody wants to add tags here? I think it should go to my pull request
>> this week.
>>
> 
> I've tested this patch applied on top of fee465150b45 on an AST2600 and
> the the system behaviour doesn't seem worse. However, I can still lock
> the bus up and trigger a hung task panic by surprise-unplugging things.
> I'll poke around to see if I can get to the bottom of that.
> 
> Resetting the slave state makes sense, so with the above observation
> aside:
> 
> Tested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> 
> That said I do wonder whether we should update the slave state in the
> same place we're updating the hardware state. It would cover off the
> gap identified by Jian if it were to ever occur anywhere else.
> Something like:
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-
> aspeed.c
> index 5a416b39b818..28e2a5fc4528 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -749,6 +749,8 @@ static void __aspeed_i2c_reg_slave(struct
> aspeed_i2c_bus *bus, u16 slave_addr)
>          func_ctrl_reg_val = readl(bus->base + ASPEED_I2C_FUN_CTRL_REG);
>          func_ctrl_reg_val |= ASPEED_I2CD_SLAVE_EN;
>          writel(func_ctrl_reg_val, bus->base + ASPEED_I2C_FUN_CTRL_REG);
> +
> +       bus->slave_state = ASPEED_I2C_SLAVE_INACTIVE;
>   }
>   
>   static int aspeed_i2c_reg_slave(struct i2c_client *client)
> @@ -765,7 +767,6 @@ static int aspeed_i2c_reg_slave(struct i2c_client
> *client)
>          __aspeed_i2c_reg_slave(bus, client->addr);
>   
>          bus->slave = client;
> -       bus->slave_state = ASPEED_I2C_SLAVE_INACTIVE;
>          spin_unlock_irqrestore(&bus->lock, flags);
>   
>          return 0;
> 
> 

We tested both Jian's patch and Andrew's patch on our MCTP-i2c bus 
(ast2600 based BMC) and see both patches work well.

We currently use upstream i2c-aspeed.c driver with the commit [1] 
backported. Without that commit, we frequently experienced the bus hang 
(due to bus arbitration) and it is unable to recover.

But, by reverting that commit and with Jian or Andrew's patch, we see 
the bus could be able to recover so we think both changes are good.

[1] 
https://github.com/AspeedTech-BMC/linux/commit/11a94e5918aa0f87c828d63fd254dd60ab2505e5

Anyway, I would prefer Andrew's way because the bus->slave_state must 
always be reset to ASPEED_I2C_SLAVE_INACTIVE everytime 
__aspeed_i2c_reg_slave() is called.

Thanks
- Quan
