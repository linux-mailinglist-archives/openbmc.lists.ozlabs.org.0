Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD017FE960
	for <lists+openbmc@lfdr.de>; Thu, 30 Nov 2023 07:54:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=KC7aP7KE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sgn3b4RNYz3bwJ
	for <lists+openbmc@lfdr.de>; Thu, 30 Nov 2023 17:54:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=KC7aP7KE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eab::70f; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2070f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::70f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sgn2v6z00z2xTP;
	Thu, 30 Nov 2023 17:53:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bm2wJD1/XX0jwu13eg18TbCg37/GZY8UJAOHq1x/Gg3ZWnjPWpxbABaH2RykTHBaal6Qq9Y9nkOueJJUWcudkq+XNc1nDNa3IX0N4lYP2+h3K9i2etowiHXHbu41MDRWtCwFTPkB6X5EEcQh5A8nKHiC+W09OzYFScI+iishYIgyJ7WPamrUzlao8cZ7U6hSbfLr6U8ibzgz/FcXENaFTLbQCghJPK7og2+890N09GYfJMFfAM3R9XT/AnlFYvQt5J2rvSHGu1QGIc6vYfQWwWiUT6jVXlmGBcn47uA+t8G605UShy/Ofj60Qbn2tD9C03yLB+2FjuGr/Gd8j3gVYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pWZWTJbUNpUH9CKcskt3w3iTc7Gdexx9FtD1NF8krg=;
 b=S6+I4jZnVEU8p5kMtmxLvLsdjyoNpC/Hxeli8m+eHLBDfpXWJtJj7FxvEeLxzqyPGE1gkBUL4veKN5TKkwDJj3HE+WZXDjwQMBUvmL62bgfOSE1BRiTcXswxVA7DIjJAdZea+BfZ8nFNRDnerA9smRPhO/uqyKQeGPWyKr6PIoBoY3Vl64QSDD61x7VqL3sVxb4cWErv+Vg5W1WGFiRNtGWBxXWUaI/gs1tWWl4b+Sv69l23q/zVuDrVxCaRawoS1ee+8UftuU8mWdUkviP9cihHTNdKVlxgt+5OpvIC7nf24iFGGWBgqjUEhHwVEc5vbx9mr8dbFFh+WohR+e3N+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pWZWTJbUNpUH9CKcskt3w3iTc7Gdexx9FtD1NF8krg=;
 b=KC7aP7KEw0C4jvoZ4byxzILNfRT7l9iV+UrbRuiEyXSOpRY+Y14vefG5Do8sQzAuqMd+Ax6kBO59zTp+yBwX+e2cQo9TwUzrZj4yhH/mW2eSzsopaxKe/sANqZkZNV/2lg22fG4LMO9VWfeTe6PxlzGLwOQHO6sQSmUHoFJ1vlk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 CO1PR01MB6615.prod.exchangelabs.com (2603:10b6:303:f4::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.24; Thu, 30 Nov 2023 06:53:04 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68%3]) with mapi id 15.20.7025.022; Thu, 30 Nov 2023
 06:53:04 +0000
Message-ID: <62c7d0cb-76e4-4dbc-a7c6-f912a15d3aa4@os.amperecomputing.com>
Date: Thu, 30 Nov 2023 13:52:51 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND 1/2] i2c: aspeed: Fix unhandled Tx done with NAK
Content-Language: en-CA
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa@kernel.org>, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20231128075236.2724038-1-quan@os.amperecomputing.com>
 <20231128075236.2724038-2-quan@os.amperecomputing.com>
 <4a9fe86f0349106adaa4e0c04c5839bab631f26c.camel@codeconstruct.com.au>
 <99dff4f2-cfe1-4a3d-a10b-313b9e7a29b3@os.amperecomputing.com>
 <c3813b6f01405f7060b68352fd03ddb727bb3438.camel@codeconstruct.com.au>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <c3813b6f01405f7060b68352fd03ddb727bb3438.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::18) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|CO1PR01MB6615:EE_
X-MS-Office365-Filtering-Correlation-Id: 45948500-1d48-43f9-ad1e-08dbf1710048
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ol0/wShLCdjrs1iF44JviqJVIPxRvO/vVwelR/VfdPBL90mTumfG/SMFxPZ+YK57fS8m1+FgPRwxKgpKdo5JpDC+uAwNBQPPji+vLHbKyOSRnJrcc690v1BmQr4uctYPUj5LfGsEOGTQxnleLHod55Tcc//Sde2TpdBX3JDYk/iI4eJ4ExoLYWgz6myveOMDU5Ovn2IOTBc0zmq6Oh2xR19AShX7DrknLhJGq1vBvrmSbQ28Y3ZIlovUo++Y1NACYJDxP50uta7JSHDX2HlCXxcJlf33J7UeJY/4WWns2XAetLpVIos3FDcT9mZugNJrIzOqCymQEFpWt/amjWzgdZaSn2J/yXx9y2SA3FCVHvOanbowb4GwoBfyJIumWE9lKnAVyr0VZw4dgiJWcNVTnwBjp6j2S5t51ghdOp25rd2H+4djmIGkOPU0hHplo4oPqaPFzITP2FQCGvqZBMDcCRYEkfVhi0krtiILO6gIuvnIUKkdFDanqtg866uo31zmDmzK5UDM5aC4LtDAaqTi6Svvkwn4aqG2Il8xcChwWJ42SH8K/y3HakstYP8bb47tMNhnKjOYTsVV403+Xwx82R8+ynvp6f670nhO8w4RvDdjObACYC9YEy9ztOHk6kmF1P7yc8hlZb32egTLnYCF4knkhGvFztSnuHannDdXBlQ=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(39850400004)(366004)(136003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(316002)(66899024)(66556008)(66946007)(66476007)(54906003)(110136005)(966005)(6486002)(478600001)(6666004)(7416002)(5660300002)(921008)(41300700001)(2906002)(4001150100001)(31696002)(4326008)(8676002)(8936002)(86362001)(83380400001)(2616005)(38100700002)(26005)(107886003)(31686004)(53546011)(6506007)(6512007)(202311291699003)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?SFhoSUp5S3ZYYnNkM3pNcDlucE1tQnEwdXlKNVZmdGhOOUV0b24vRGJ1dU5W?=
 =?utf-8?B?L2drWkw3Z05mMlhuQXJBbytuMERITUYxYUlWSnkxRUZnTjFxQ1greDRPU0Nj?=
 =?utf-8?B?UE5zNFlnaE9hY3Frdm9CSnVpWmpNTlJJMDdPQllPTXdacGJwR0dCZ3VaQXpn?=
 =?utf-8?B?V2ZlSXVoaHdPeGZsRjZ6R050T09EbGx4aXZUVEVaQ28ySko3U2tMY1ZvejY2?=
 =?utf-8?B?bXY1MVBJRG5QdkxVN0dtc09ONFJZWGxvYXd3WUVWb1J4RHlRdUxDYmxrSVY4?=
 =?utf-8?B?Z0k0algxZjZFZlVTVVdMbS9vc0RDSXBJa0VrZytpUnA4TG85YzBsWndwREZU?=
 =?utf-8?B?bHFmdklpODl2dXJ5ZEtUV0Zod0FpVGtGWDI2aHQ3S1J6c3VoUUd4Z2RqMC81?=
 =?utf-8?B?d1JqUkNnZW1lYkI2U3pYZFRTY0J4TDRZTEpZdEF4V1BwZHJXUXM3dVM1bWVO?=
 =?utf-8?B?UXFGUEh3WnpCczVlUWVkUDR2L0pIQ1loaDVPbmhUSGhuaExVdksvM09PK2hj?=
 =?utf-8?B?b3d3MFFlVVdGOCtGaCszU1ZJZVpsQ0lRR3ZxVytVZnFveXNWRjlOaXFlK0lk?=
 =?utf-8?B?R0NENVRMVHMvQkV1dVB2K0pERkE2OXU3TEVRb3BWNjZWanQxT2lhOTJKbGZN?=
 =?utf-8?B?S1lKZFBuVTEyM2lvaDcrcWhBcEJoZy93MWdWM25uM2g2K1VsL0IzYUdoZjln?=
 =?utf-8?B?WlZOeVVYcXhObThBUnRhaW1UdUVjZVNGTk9DNHYyK3RzVDZkN2NwTnU2NHN0?=
 =?utf-8?B?KzdJdFp1Q0NXVS9PVmxOMlVmakh3ai82WnN2ZnR4VkMydVUxbjIwb203R2hQ?=
 =?utf-8?B?Y1hicVo3SnBvSmZ3MWw2b0R0OUFObjZXK1V0UDhQQ0Rpc2pKS1FpNmtBTngx?=
 =?utf-8?B?S2JVbFQvamZmSnp4dHJWVkpzeDVtZFFWN0VHL3I4NkI4N2lMNjZtK0tPdXJx?=
 =?utf-8?B?UDZ0V2pneldpUjZYV3JvZlY2bmZ2ZE1GL0tiRi92MjFEaHNtS2RwS2R2aTBX?=
 =?utf-8?B?a0FrK3RMZWRjeE15NGl1RzJMa1hkWlh1SWs3TmNGcWNNOW4zdVp1ZkJiQkZz?=
 =?utf-8?B?NTd1SjVvV2dJUHMvZjhhQ3ZSQVFFVW5acmpYUERPeXBhQXgrZ1RQR29zZ21r?=
 =?utf-8?B?ZWJNZkdXSW1CZFVITFBoWmxpV1U1ZG9xZTJEdnR5bUpxUzdLVVZWcGQrOCto?=
 =?utf-8?B?T25CUG5EekpBTCtHWklSSlJQMXdPOFhJUmY0QmM0SDdPeGVxaWlIQS83bVZ5?=
 =?utf-8?B?c2ZKNWU2VjF2bmwxMHFOdjRTRzN1WlNsRk10TmFKS2txai9hbXgydS83NHE1?=
 =?utf-8?B?WCsyOGs2bzhUNTBxK2trQVczKzc5VkdpTjFkSkFjaDRTd09vTEVJREQwUy8x?=
 =?utf-8?B?cXBCRFB6UDkvSDZGUHJ5WnUxOEozY1l4WmN5Y09JWnEwRkRNMlFPYk9PTWlX?=
 =?utf-8?B?NFVYbEllVXhETG9yckVXNnMrUm5jV0QyOVg5eXZWOG81SGwwZFRkRCtpU210?=
 =?utf-8?B?OHZPOUZKOGl1U05hbXh0VVlyNWJyMmNCZEJpaDNEdTIxSVQxam1TYVAzckFK?=
 =?utf-8?B?OUZxa2xoQ1crYThzNGJIaFlQL0NNUGdMNUtCNHdjblpFNnVBUDZDOGZhMzBJ?=
 =?utf-8?B?cjFOc28xa0ZFc0FRdTNJcXhnT3VIRjdlMnE1dkN3UE5FZ3hjUUYzWXM3aVdw?=
 =?utf-8?B?SFBYdmFJOEtFOWhiV2lUbnJyWlYvck5YaHd5K0xOVFRNRHhvb2dUV3hvWVdk?=
 =?utf-8?B?aUVCUWYrL1djTTlnb0FNVVN0a3pWZE9oN3pHOFZLU2FHd2RUNjFHU2YyVks0?=
 =?utf-8?B?anNxeE9mWmhRVC9GekFnMGZSbzRPd25Oc0dEcUZDWDc2Rkp4Y29XY0RwdzdN?=
 =?utf-8?B?ZDloK0FIK1Nra3BkWStqaUhMam1zUFJ3RlVJNnROY0xNZVBlUEhBR2tSaTNx?=
 =?utf-8?B?NkMyU2MvMk5LcFBkTnpBUFpDWmxnN2llVjJHRStIS2MwUU84SUlQMVo4RFFB?=
 =?utf-8?B?ZE5YRUhKaUtHRFN0V2ZQcFhPTTNiMXkxZ3d5REFmdDdqOXhRZndFZHprZU1t?=
 =?utf-8?B?bFJWMkJoSWsvR0gxUFNpbEJNeXc0Zy8vS1BwZjlENVFEOFZ1N3ZpSUxvWFN4?=
 =?utf-8?B?THowWGYrM28yMkZrV3NFM205bzhDaFUyblFsYjNWb3Q0MmxYL2w3WDRTM0R6?=
 =?utf-8?Q?eyyMQCAwX8snj7zTO1qW+BQ=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45948500-1d48-43f9-ad1e-08dbf1710048
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 06:53:04.3345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3if41o26B/USXZHcjK4wSkgwDTyy6cRm23yJ8n7i8F/W0kYa6eSWfxcG4xDqjB0pOMvz80daAHGWWj6CagbRb0DZeITThK/LsP3ziZE+dlg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB6615
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



On 30/11/2023 08:20, Andrew Jeffery wrote:
> On Wed, 2023-11-29 at 16:03 +0700, Quan Nguyen wrote:
>>
>> On 29/11/2023 07:19, Andrew Jeffery wrote:
>>> On Tue, 2023-11-28 at 14:52 +0700, Quan Nguyen wrote:
>>>> Under normal conditions, after the last byte is sent by the Slave, the
>>>> TX_NAK interrupt is raised.  However, it is also observed that
>>>> sometimes the Master issues the next transaction too quickly while the
>>>> Slave IRQ handler is not yet invoked and the TX_NAK interrupt for the
>>>> last byte of the previous READ_PROCESSED state has not been ack’ed.
>>>> This TX_NAK interrupt is then raised together with SLAVE_MATCH interrupt
>>>> and RX_DONE interrupt of the next coming transaction from Master. The
>>>> Slave IRQ handler currently handles the SLAVE_MATCH and RX_DONE, but
>>>> ignores the TX_NAK, causing complaints such as
>>>> "aspeed-i2c-bus 1e78a040.i2c-bus: irq handled != irq. Expected
>>>> 0x00000086, but was 0x00000084"
>>>>
>>>> This commit adds code to handle this case by emitting a SLAVE_STOP event
>>>> for the TX_NAK before processing the RX_DONE for the coming transaction
>>>> from the Master.
>>>>
>>>> Fixes: f9eb91350bb2 ("i2c: aspeed: added slave support for Aspeed I2C driver")
>>>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>>>> ---
>>>> v2:
>>>>     + Split to separate series [Joel]
>>>>     + Added the Fixes line [Joel]
>>>>     + Revised commit message [Quan]
>>>>
>>>> v1:
>>>>     + First introduced in
>>>> https://lore.kernel.org/all/20210519074934.20712-1-quan@os.amperecomputing.com/
>>>> ---
>>>>    drivers/i2c/busses/i2c-aspeed.c | 5 +++++
>>>>    1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
>>>> index 28e2a5fc4528..79476b46285b 100644
>>>> --- a/drivers/i2c/busses/i2c-aspeed.c
>>>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>>>> @@ -253,6 +253,11 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>>>>    
>>>>    	/* Slave was requested, restart state machine. */
>>>>    	if (irq_status & ASPEED_I2CD_INTR_SLAVE_MATCH) {
>>>> +		if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
>>>> +		    bus->slave_state == ASPEED_I2C_SLAVE_READ_PROCESSED) {
>>>> +			irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
>>>> +			i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
>>>> +		}
>>>
>>> So we're already (partially) processing this a bit later on line 287:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/busses/i2c-aspeed.c?h=v6.7-rc3#n287
>>>
>>
>> Thanks Andrew for the review.
>>
>> I think it's worth noting that the byte mode is used in this case.
>>
>> About the code you mentioned, it is for the general process of single
>> Slave transmission with NAK which should be interpret as I2C_SLAVE_STOP
>> event.
>>
>> In this case, there is a mix of Slave events:
>>
>>     + I2C_SLAVE_STOP (due to INTR_TX_NAK, BIT(1) of previous transaction)
>>     + Followed by I2C_SLAVE_[READ|WRITE]_REQUESTED (due to
>> INTR_SLAVE_MATCH and INTR_RX_DONE, BIT(7) and BIT(2), of next transaction)
>>
>> That is the reason we need to emit the I2C_SLAVE_STOP first for Slave
>> backend to process.
>>
>>>   From the description of the problem in the commit message it sounds
>>> like the ordering of the interrupt processing is incorrect.
>>
>> Yes, this is correct as per my explanation above.
>>
>> Prior to
>>> this patch we have the following abstract ordering of interrupt
>>> processing:
>>>
>>> 1. Process ASPEED_I2CD_INTR_SLAVE_MATCH
>>> 2. Process ASPEED_I2CD_INTR_TX_NAK when in ASPEED_I2C_SLAVE_READ_PROCESSED
>>>
>>
>>   From my test, the flow is as below:
>>
>>     1. Process ASPEED_I2CD_INTR_SLAVE_MATCH, slave_state is set to
>> ASPEED_I2C_SLAVE_START
>>     2. As there is INTR_RX_DONE and slave_state is
>> ASPEED_I2C_SLAVE_START, depends on the data received, the slave_state
>> moves to either ASPEED_I2C_SLAVE_[READ|WRITE]_REQUESTED.
>>     3. When reach to the if statement to process INTR_TX_NAK, slave_state
>> is already moves to either ASPEED_I2C_SLAVE_[READ|WRITE]_REQUESTED, not
>> in ASPEED_I2C_SLAVE_READ_PROCESSED anymore. This eventually evaluate as
>> false and the if statement is bypass. IOW, this INTR_TX_NAK is not process.
>>
>>> With this patch we have:
>>>
>>> 1. If ASPEED_I2CD_INTR_SLAVE_MATCH then process ASPEED_I2CD_INTR_TX_NAK when in ASPEED_I2C_SLAVE_READ_PROCESSED
>>> 2. Process ASPEED_I2CD_INTR_SLAVE_MATCH
>>> 3. Process ASPEED_I2CD_INTR_TX_NAK when in ASPEED_I2C_SLAVE_READ_PROCESSED
>>>
>>
>> With this patch:
>>
>>     0. The I2C_SLAVE_STOP is emitted to backend Slave driver first to
>> complete the previous transaction. And let the rest process as before
>> this patch.
>>
>>     1. Process ASPEED_I2CD_INTR_SLAVE_MATCH, slave_state is set to
>> ASPEED_I2C_SLAVE_START
>>     2. As there is INTR_RX_DONE and slave_state is
>> ASPEED_I2C_SLAVE_START, depends on the data received, the slave_state
>> moves to either ASPEED_I2C_SLAVE_[READ|WRITE]_REQUESTED.
>>     3. When reach to the if statement to process INTR_TX_NAK, slave_state
>> is already moves to either ASPEED_I2C_SLAVE_[READ|WRITE]_REQUESTED, not
>> in ASPEED_I2C_SLAVE_READ_PROCESSED anymore. This eventually evaluated as
>> false and the if statement is bypass. IOW, this INTR_TX_NAK is not process.
>>
>>> That feels a bit complex and redundant. What I think we can have is:
>>>
>>> 1. Process ASPEED_I2CD_INTR_TX_NAK when in ASPEED_I2C_SLAVE_READ_PROCESSED
>>> 1. Process ASPEED_I2CD_INTR_SLAVE_MATCH
>>>
>>> Moving back from the abstract to the concrete, implementing what I
>>> believe we need would look something like this patch:
>>>
>>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
>>> index 28e2a5fc4528..98dd0f35c9d3 100644
>>> --- a/drivers/i2c/busses/i2c-aspeed.c
>>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>>> @@ -251,6 +251,14 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>>>    
>>>           command = readl(bus->base + ASPEED_I2C_CMD_REG);
>>>    
>>> +       /* Complete any active read */
>>> +       if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
>>> +           bus->slave_state == ASPEED_I2C_SLAVE_READ_PROCESSED) {
>>> +               irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
>>> +               i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
>>> +               bus->slave_state = ASPEED_I2C_SLAVE_STOP;
>>> +       }
>>> +
>>
>> It is not confirmed through test yet but I'm afraid the switch case part
>> will emit another I2C_SLAVE_STOP event in case there is no mix of
>> interrupts.
> 
> Ah, good catch. I think we can rework things a bit to rationalise the
> logic at the expense a bigger diff. What do you think about this? I've
> boot tested it on an ast2600-evb and poked at some NVMe drives over
> MCTP to exercise the slave path.
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index aec8966bceab..3c9333a12967 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -249,18 +249,47 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>   	if (!slave)
>   		return 0;
>   
> -	command = readl(bus->base + ASPEED_I2C_CMD_REG);
> +	/*
> +	 * Handle stop conditions early, prior to SLAVE_MATCH. Some masters may drive
> +	 * transfers with low enough latency between the nak/stop phase of the current
> +	 * command and the start/address phase of the following command that the
> +	 * interrupts are coalesced by the time we process them.
> +	 */
> +
> +	if (irq_status & ASPEED_I2CD_INTR_NORMAL_STOP) {
> +		irq_handled |= ASPEED_I2CD_INTR_NORMAL_STOP;
> +		bus->slave_state = ASPEED_I2C_SLAVE_STOP;
> +	}
> +
> +	if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
> +	    bus->slave_state == ASPEED_I2C_SLAVE_READ_PROCESSED) {
> +		irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
> +		bus->slave_state = ASPEED_I2C_SLAVE_STOP;
> +	}
> +
> +	/* Propagate any stop conditions to the slave implementation */
> +	if (bus->slave_state == ASPEED_I2C_SLAVE_STOP) {
> +		i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
> +		bus->slave_state = ASPEED_I2C_SLAVE_INACTIVE;
> +	}
>   
> -	/* Slave was requested, restart state machine. */
> +	/*
> +	 * Now that we've dealt with any potentially coalesced stop conditions,
> +	 * address any start conditions.
> +	 */
>   	if (irq_status & ASPEED_I2CD_INTR_SLAVE_MATCH) {
>   		irq_handled |= ASPEED_I2CD_INTR_SLAVE_MATCH;
>   		bus->slave_state = ASPEED_I2C_SLAVE_START;
>   	}
>   
> -	/* Slave is not currently active, irq was for someone else. */
> +	/*
> +	 * If the slave has been stopped and not started then slave interrupt handling
> +	 * is complete.
> +	 */
>   	if (bus->slave_state == ASPEED_I2C_SLAVE_INACTIVE)
>   		return irq_handled;
>   
> +	command = readl(bus->base + ASPEED_I2C_CMD_REG);
>   	dev_dbg(bus->dev, "slave irq status 0x%08x, cmd 0x%08x\n",
>   		irq_status, command);
>   
> @@ -279,17 +308,6 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>   		irq_handled |= ASPEED_I2CD_INTR_RX_DONE;
>   	}
>   
> -	/* Slave was asked to stop. */
> -	if (irq_status & ASPEED_I2CD_INTR_NORMAL_STOP) {
> -		irq_handled |= ASPEED_I2CD_INTR_NORMAL_STOP;
> -		bus->slave_state = ASPEED_I2C_SLAVE_STOP;
> -	}
> -	if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
> -	    bus->slave_state == ASPEED_I2C_SLAVE_READ_PROCESSED) {
> -		irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
> -		bus->slave_state = ASPEED_I2C_SLAVE_STOP;
> -	}
> -
>   	switch (bus->slave_state) {
>   	case ASPEED_I2C_SLAVE_READ_REQUESTED:
>   		if (unlikely(irq_status & ASPEED_I2CD_INTR_TX_ACK))
> @@ -324,8 +342,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>   		i2c_slave_event(slave, I2C_SLAVE_WRITE_RECEIVED, &value);
>   		break;
>   	case ASPEED_I2C_SLAVE_STOP:
> -		i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
> -		bus->slave_state = ASPEED_I2C_SLAVE_INACTIVE;
> +		/* Stop event handling is done early. Unreachable. */
>   		break;
>   	case ASPEED_I2C_SLAVE_START:
>   		/* Slave was just started. Waiting for the next event. */;

Yes, this looks much better. I'll confirm these changes through test and 
will post the next version ASAP.

Thanks a lot for the review,
- Quan
