Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C4C80C047
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 05:08:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=qnazsROS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpSsH6mfmz3dVG
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 15:08:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=qnazsROS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::723; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20723.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::723])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpSqf0Qcnz30gs;
	Mon, 11 Dec 2023 15:06:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDXk6Rv+VjdAlL98H8LPKostv/4WbTD2fwzYN4SS4lr5XuJHied57Zm1RcqFYtLbdZ3cWi4cX8/ML7ncDivQ6ELr8/MVR050uh8CHtvNZVEy881DpvOhqfaACsGsqNbOjUYTAWKOU+OsrI2ZcK5PAAcwUkC4JUQLgqtk5a9wvktTViEUlqvdrqXO2En6alllTADR9bpRTDUoRFBC3pq4pvoajcyFvJsM0/BeawlSsJei3Aj1nDnOonr/a0rSnmfFSHd+MwM3+TjsxsKegsk+JddrwQaJ6vI7R0LE1S0AxxzIU53M5DybM8lAaF29XOp/U6sLFH+eP2dQvD/eSlxlkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RuLEcFv8sKNk1UYJyP9qSg6zaau5RM162yX2EBQ0rY=;
 b=RN/5+GfXhPghVsqae2+aLIQxnH+2oEsvrSPQVyU2nRNAAK6r8WQJnTxTYgbrwTY1nq9lyIFe6qaxABaR03c0GF1rkAZYhpa5EyrhlHaNGpK+esUGF1N08OA2HSJqd70GLEe6F6cc/XnQazXuF4K0bytbtvsNoxc5QTe9w7R0vPH5Esu6f6V8/g3zNiTKrUBawr4CCUGdtlmq/qGnRr4zmB/7TmsfFFWyCd2YK2ga9SZ+WLWHqp9iJYg8Usr41XHfTzlgAZjXSz3F3VzKPJHD8Bk12H/PgPE3cQnzzPEgsiGS9sQUjAODv+3ZEq3dUHHbtkSSr7zLBFJJ1lmj/fflKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RuLEcFv8sKNk1UYJyP9qSg6zaau5RM162yX2EBQ0rY=;
 b=qnazsROS9BpFPPZfFS3j0pHUTDzZdY2Xe/be+HLBhsoMgGCGNedsMtgQsnIn6jQSbXcH+VfUpIXzdHOa/PwuaNrNyZFnh+eMWzod63aLfDR+wbATUi+KQYxh6EQpAre7WpPn5tj/ANW3IUYvuzMKaAfhUE3UL/ZsEWrOUmOUXmc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 PH7PR01MB7821.prod.exchangelabs.com (2603:10b6:510:1d9::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 04:06:33 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68%3]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 04:06:33 +0000
Message-ID: <c868594e-834f-462d-ade0-94c6b133cfbd@os.amperecomputing.com>
Date: Mon, 11 Dec 2023 11:06:27 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] i2c: aspeed: Acknowledge Tx done with and without
 ACK irq late
Content-Language: en-CA
To: Brendan Higgins <brendan.higgins@linux.dev>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andi Shyti <andi.shyti@kernel.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Wolfram Sang <wsa@kernel.org>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20231208033142.1673232-1-quan@os.amperecomputing.com>
 <20231208033142.1673232-3-quan@os.amperecomputing.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <20231208033142.1673232-3-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0P221CA0022.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11c::22) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|PH7PR01MB7821:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e7882fe-6a78-4f21-fede-08dbf9fe8fa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	G4TLnwVCbMGY5bOSe467rnGxJYsE6hIKhb7DuMKAgvJblsOwGPqg6iT18wx+Kz9d7OQjIBp2jOF0AkDCXOWaSN8+1PYwcUWkNa3BcK2EtdrC7mviCNZoaBVCwi80MQ3VdJTy5hbSrD4MzhzG6Hjl23TEswmRJX1e2po8L7iT5Sq74SwJDjYffeAdD2rBfjXceTlbvROpk3LdLqaR5CTKKuGz+763qTtJgRWcXTZm/90w1KEx0Wa1P5B96XDZxo3/JzHn0i9IPzcZFz3bu6lmMBDgYIZATDacC+vy2sXHZkrSHc51z74tEVBGaD0XJNbEiAfOi5c2PAQCcADMn1r3RYS4vjZLoMCQElN4NkI73AATyNyxUV+8SlfERgPCYYGoEodNIsOzAHFn8g/1mqQ6lqrS4kj7n4Nc6IZ5p071w7a5YnM6Pipe3+DTCkDirBmtulmpPi1bs0K9S756oQ5CpevfM1bmNh9wYKtOXhlAWcZcTo1zfKLew9+5VUuZmV200OQhMsNkiTHJD3r714abnRg+F8CX0UF9/IOGeabHmPepSYKGoc+3vSRzWtXClsdjJpGhv5ntgSIB2WbaMMw9VUhy8vAgxAZ4gKJ9oEz5+kgAuuL2ug179+jFiNSUauXT
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(376002)(39850400004)(346002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(6512007)(6506007)(53546011)(5660300002)(26005)(2616005)(107886003)(7416002)(54906003)(66476007)(66556008)(66946007)(6486002)(966005)(2906002)(83380400001)(31686004)(921008)(41300700001)(478600001)(86362001)(8676002)(8936002)(4326008)(31696002)(110136005)(316002)(38100700002)(6666004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?bDlFN0JYcUt3OFA2QW8yblBiQVdCNVhodGtGNWg2R3Y3dzNpMVNBMEZTeEV6?=
 =?utf-8?B?T3d1MXBGdWJGM1RWYjczU0xWallib0w2SlhuTnp6SzJtNUpoNkxoYjcyUmQr?=
 =?utf-8?B?aksxM0ZpakNwU1h3aHFxWHNjL1V2elFXM1M2M2E4VFB4aGcveXRKYWZNU0ZD?=
 =?utf-8?B?UTJGaURQWjZCbHMxalJ5TGRlcVlDN1pKRkU5ci92MjdCa0FPZUI2TEQrdGtn?=
 =?utf-8?B?RXVNTm9XNEZhc2JVSGVBOVNCVzFHOVZPcmFyY0FtNUYwVnRnZEM4Q2xpYmdI?=
 =?utf-8?B?N3NWL2pYM0xPdEhTZXlBTzFCUFFjakRsc1lwTW11ZWluWG80OHR3eldaWkVa?=
 =?utf-8?B?aDVOTmZWcHVjbWJQcmlINkVNc0RFaWM1Q2Z6Q0VuQ0t0a2J2QUlYVjdWMThM?=
 =?utf-8?B?dnJIemIyWERKRzFqUG1GdGVHTXhkeWkyQjE2RWxpM0gremtRTk5XeUwrV2ZU?=
 =?utf-8?B?eittWk1xT2RNLzZHNStqVGZNa0duWTA0WkRqY0ZQdnk3eHJycGRGTWljRUJ4?=
 =?utf-8?B?a1pGbVVRUnBGMCtRU3ExRXR2N1lISVc5bEwvaWUxUG14T21nZmJvOS9ISS9F?=
 =?utf-8?B?TDVsZThHYlB2eDBYTUpsWWtzaXp2ZW1jWVhIRDZ5US9aMDlxTlpTWlB4WW14?=
 =?utf-8?B?Sy8yNy9ZM1h1bmJHRGpHcGJiVnJNTGZhaE5MWFFxRURjTStpQ0hyamNmbjRN?=
 =?utf-8?B?bUt2VlVKSVU1WDNWSDF5Nmt3MzZlSTNtNFpWaEFRSzVIR3h4VWdUNi9NM2JM?=
 =?utf-8?B?R3AyMEtoNFFhdktoR2lJUUI1TVQ4VVcrQlU1bklrSGh6TEtyanJValRnOWMy?=
 =?utf-8?B?RUtOL1VCbDU3VW4ySzh3MjdPNWM4NkVnZ2gwSnZDTTM3Wm4raWoxN3pMZmNE?=
 =?utf-8?B?UmFCc2YvTXVYOG0vWkJhVm45ZkNQQ1FxbEZ1NFo4bkkyRzZQSUs0SlFqSUho?=
 =?utf-8?B?Sm1uV2UyV3dramJGQ2F6SElZT3Q1cURIaG83UERheG9yckdBV2xhMjFqR0NN?=
 =?utf-8?B?aUx2cmN4VDU3R2hQSTFaWWRaNjhHdUlhb29pYUR2WU5ZNVhmb2FoOFpWZC9v?=
 =?utf-8?B?UHN2c0ZBM3FlYmJJbTZTa3JZbFc0T05OdEd0Ulp0TExmTkUxa3ZmYnFsK3RV?=
 =?utf-8?B?ZVI5c0FZRXNoOHd0amZPRDl1c0hjNmVOK0M3bzc4cVpjOXVUZTJxMzlnMkxH?=
 =?utf-8?B?VVU2YXlwT1IvcXFtWFRLdU9CclMyUkdYaytkQnBCZXBsUkNramtmRW5nV2Rh?=
 =?utf-8?B?YVk0dW9yU2RkRTNDSW9MMGJEOUhmVGQ4cVlEcVI3MU9lb0JxeC9ZZkxMdXRh?=
 =?utf-8?B?ZkxMQ0VmNkR4dlJVeWxMZHNOdlhOaTRZeHFDVkhPWGZJMERSQzB3b1VhSXo5?=
 =?utf-8?B?eVVLMVd0b1NWWHd5RDFwNU5zalRwMDhpQkVhSlFwRU5iSTJHNEtaUGtwRzd6?=
 =?utf-8?B?UzA0ZHpHb3g5eFVDc1RzVHE4WWxrc3VOQU5DanRlYnUvNys5SWt6aDhud1o4?=
 =?utf-8?B?SXpXZ3oxcDRUS0ttQWhjdUJud0huOENVKzlMTzFyZWgvWjB3dWhjbk11VWFr?=
 =?utf-8?B?dit4TDJYbkpEc2ZJSnRmS08vQVZYOVdlNE9LR0tVL1NoWGxVYWY4OEZKNWdv?=
 =?utf-8?B?Szg5L1E4OUlwaWl5S1JWUHp2STBwMkJKZmxHUFR1Tytpdi9teGptaVMvL2hi?=
 =?utf-8?B?TVhSUlpJcmNjUUU2RjJXVDFZSmVmSVNRT0FvTWRIZmVWMWUzM003b01XK2Jh?=
 =?utf-8?B?ZFB2MjRzNDFxUkdvTnN4OThHVzUzYW1XMWpneXVTOEVBcFhJUVFDd0RxSVpS?=
 =?utf-8?B?bW11b2pHMGd3R2cvMDVneG93RU5EcEhDMjJkVmlUYWxqR29qb1grdzVLMU9r?=
 =?utf-8?B?QlF2YmlDb2ZicnlWRm0zdXVSRTUwL2V1Z3ZBV1BTYmMvT2VrMVhNdDJPdWtp?=
 =?utf-8?B?VlowNnhLSXg1MmxzSnl1clgrc3dMa0tQVXlTVnZ3ZldFdGdOdXdqT3BydVRw?=
 =?utf-8?B?S2F5TEVoNDNFZ3V3MWVnU1BvclNJZUxpQ1hqeUxVSThPeFhJUVovY1F0S0Q1?=
 =?utf-8?B?ZGl3RnZEQWNsTERaWDBCZzRVelNBRTdvSTRwTnc0aUtDQjlZQStUL2crMXhY?=
 =?utf-8?B?TzR2TjdHalFkMTZkMkNOK2QzMStLWXBmTE93anUrbi9PQ0lIbDBGK0JaOWY2?=
 =?utf-8?Q?pnsdlzy0NCNHxnc02VlldTs=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7882fe-6a78-4f21-fede-08dbf9fe8fa4
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 04:06:33.1421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yhhFD9jdKnZgIkwg7jAbggRV6XF6PGci72KtDwhx5KN6h2dqgNVBsm1uQ4hXhjzTWjOuVEAS+mDjCtMQU16LXRWfGokfaBO5mbET2ZRK8BY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR01MB7821
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
Cc: Cosmo Chou <chou.cosmo@gmail.com>, Open Source Submission <patches@amperecomputing.com>, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 08/12/2023 10:31, Quan Nguyen wrote:
> Commit 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early in
> interrupt handler") acknowledges most interrupts early before the slave
> irq handler is executed, except for the "Receive Done Interrupt status"
> which is acknowledged late in the interrupt.
> However, it has been observed that the early acknowledgment of "Transmit
> Done Interrupt Status" (with ACK or NACK) often causes the interrupt to
> be raised in READ REQUEST state, that shows the
> "Unexpected ACK on read request." complaint messages.
> 
> Assuming that the "Transmit Done" interrupt should only be acknowledged
> once it is truly processed, this commit fixes that issue by acknowledging
> interrupts for both ACK and NACK cases late in the interrupt handler.
> 
> Fixes: 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early in interrupt handler")
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> v3:
>    + Fix the unconditinal write when ack the irqs               [Andrew]
>    + Refactor the code to enhance code readability                [Quan]
>    + Fix grammar in commit message                                [Quan]
> 
> v2:
>    + Split to separate series                                     [Joel]
>    + Added the Fixes line                                         [Joel]
>    + Fixed multiline comment                                      [Joel]
>    + Refactor irq clearing code                          [Joel, Guenter]
>    + Revised commit message                                       [Joel]
>    + Revised commit message                                       [Quan]
>    + About a note to remind why the readl() should immediately follow the
> writel() to fix the race condition when clearing irq status from commit
> c926c87b8e36 ("i2c: aspeed: Avoid i2c interrupt status clear race
> condition"), I think it looks straight forward in this patch and decided
> not to add that note.                                            [Joel]
> 
> v1:
>    + First introduced in
> https://lore.kernel.org/all/20210519074934.20712-1-quan@os.amperecomputing.com/
> ---
>   drivers/i2c/busses/i2c-aspeed.c | 21 +++++++++++++--------
>   1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 1c2a4f4c4e1b..967a26dd4ffa 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -617,13 +617,19 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>   static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>   {
>   	struct aspeed_i2c_bus *bus = dev_id;
> -	u32 irq_received, irq_remaining, irq_handled;
> +	u32 irq_received, irq_remaining, irq_handled, irq_ack_last;
>   
>   	spin_lock(&bus->lock);
>   	irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> -	/* Ack all interrupts except for Rx done */
> -	writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
> -	       bus->base + ASPEED_I2C_INTR_STS_REG);
> +
> +	/*
> +	 * Early acking of INTR_RX_DONE and INTR_TX_[ACK|NAK] would indicate HW to
> +	 * start receiving or sending new data, and this may cause a race condition
> +	 * as the irq handler has not yet handled these irqs but is being acked.
> +	 * Let's ack them late at the end of the irq handler when those are truly processed.
> +	 */
> +	irq_ack_last = ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK | ASPEED_I2CD_INTR_TX_NAK;
> +	writel(irq_received & ~irq_ack_last, bus->base + ASPEED_I2C_INTR_STS_REG);

As there will be v4, I'd like to improve this line of code a bit.

During debug, there are significant number of times when the 
irq_received has the value of 0x00000004 (INTR_RX_DONE) or 0x00000001 
(INTR_TX_ACK). This makes the "irq_received & ~irq_ack_last" turn out to 
be 0.

AFAIK, it does not make sense to keep repeatedly writing the 0 to the HW 
then try to re-read it with readl() every time. I'd like to change this 
HW access conditionally to avoid those unnecessary access.

The change would looks like below:

diff --git a/drivers/i2c/busses/i2c-aspeed.c 
b/drivers/i2c/busses/i2c-aspeed.c
index 5511fd46a65e..0f67218cf04a 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -93,6 +93,10 @@
  		 ASPEED_I2CD_INTR_RX_DONE | \
  		 ASPEED_I2CD_INTR_TX_NAK |  \
  		 ASPEED_I2CD_INTR_TX_ACK)
+#define ASPEED_I2CD_INTR_ACK_RX_TX         \
+		(ASPEED_I2CD_INTR_RX_DONE | \
+		 ASPEED_I2CD_INTR_TX_ACK |  \
+		 ASPEED_I2CD_INTR_TX_NAK)

  /* 0x14 : I2CD Command/Status Register   */
  #define ASPEED_I2CD_SCL_LINE_STS			BIT(18)
@@ -622,10 +626,19 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, 
void *dev_id)

  	spin_lock(&bus->lock);
  	irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
-	/* Ack all interrupts except for Rx done */
-	writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
-	       bus->base + ASPEED_I2C_INTR_STS_REG);
-	readl(bus->base + ASPEED_I2C_INTR_STS_REG);
+
+	/*
+	 * Early acking of INTR_RX_DONE and INTR_TX_[ACK|NAK] would
+        ...
+	 */
+	if (irq_received & ~ASPEED_I2CD_INTR_ACK_RX_TX) {
+		writel(irq_received & ~ASPEED_I2CD_INTR_ACK_RX_TX,
+		       bus->base + ASPEED_I2C_INTR_STS_REG);
+		readl(bus->base + ASPEED_I2C_INTR_STS_REG);
+	}
+
  	irq_received &= ASPEED_I2CD_INTR_RECV_MASK;
  	irq_remaining = irq_received;

Thanks,
- Quan
