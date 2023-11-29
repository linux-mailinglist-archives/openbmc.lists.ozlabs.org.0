Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDC97FD1A9
	for <lists+openbmc@lfdr.de>; Wed, 29 Nov 2023 10:06:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=kzl9nXNy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgD2f1rlxz3cZr
	for <lists+openbmc@lfdr.de>; Wed, 29 Nov 2023 20:06:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=kzl9nXNy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::728; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20728.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::728])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgD0L3J4vz3ccN;
	Wed, 29 Nov 2023 20:04:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XINBO/T5/DLu/m8QBNd+YDMtvdQX09VPhl3XAwdZ72ajhOM48vW0FbLiFWVAgpU++BCCGE5LjqNHU9BM7amK3Q6piGi7py7adxsilo3s0GPhgxtQ23lrWKiEhXM3Z75uBihqh9U8kLF0kxnm1BVAvKlKVHQvd/2sh/bsL70zt7fOye+3ut7Ee9F3cN2+TyWhvf3lanyXvlROtNTd28SWVukv0B+KqccCTzt0+mqKJR9RsI/SRw2YxD6iAaL0DyIf35r7JDqaOqIDhe/0HQm0st28zFNEJpfFIgGMW1xKJ8c0asIwzkCsIl5J6qKANKfKzZjvjKlExKco+T2zA2HLiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wygqq8z/0CPcEr74FEEBcCeOJA4WpDMNXwBxwonyepE=;
 b=mC9LMinfF+KAfRIPrCm5PskG5tf53KqxkCdZSBtCg4IBwC35XIqI2fPSqTmWUNwux8oQmdBjCB66M7GdCfwcsal8n0BZNIAMY03Wfsg7ajdrVbx16E1J0NsA+5dE6NnjP46cFTIu+wA4gMsPwpJxF8cf6zhCWals0gXejCJNC6FG2MsccyA7Epa/1yU3pr+VkVX0SDp2CAVqaU0Ew5nUulPiqKdY83tBVjRiySSZXh6blEJw6OnJQqob1tR2X8/tFWaruvsifF+x2cpEnatCl6sLeAeYDUE3Q2Z22NI8TgHpRD3LyQ/gU65Thp2EvfuiiyeOtZ1CHaPDKs306Glktg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wygqq8z/0CPcEr74FEEBcCeOJA4WpDMNXwBxwonyepE=;
 b=kzl9nXNyVTdwnA6NOllQ3NbVC2xpXc3tU48ZYAc1wQYJKWLQSMvcUNlxRC+WpvEgaoEg7LqM0laEMDCaR2YJRZo93nTen0oaou0xRTiITSvMnpRiCKk0I0lp7vRNrcgMQ8kllLaJtYZVya+oezruVn31fuyjZZ4X/PPUcb/SqCg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 SJ0PR01MB6302.prod.exchangelabs.com (2603:10b6:a03:299::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.29; Wed, 29 Nov 2023 09:03:59 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68%3]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 09:03:59 +0000
Message-ID: <99dff4f2-cfe1-4a3d-a10b-313b9e7a29b3@os.amperecomputing.com>
Date: Wed, 29 Nov 2023 16:03:53 +0700
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
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <4a9fe86f0349106adaa4e0c04c5839bab631f26c.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|SJ0PR01MB6302:EE_
X-MS-Office365-Filtering-Correlation-Id: ea4f85f8-ce31-4754-d044-08dbf0ba1ff0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	MnhrG+PCrdXXneQq9zp0j9zewhKPgeg1QEtdXjcPNkXqc94iFFBORF9FQRBNcSri+i1xV0a1rtBTz3zUUJ6JjQ+yy68grhetHp2JYIXARIOMSJmmD+AhCOYLiqQxOcdF3e44WZDl5xw3dKGimpDA9fz6L84LNnSSGB6wYJ5Fd0SiXaW0L6KcLptwkFmSlJ6vV76zcgHp/fOflyYGkuWMr5EgAUVM8T6MVezuY0vcTWOXb4DL9G8sSvRsB4btJpnQm74XMOZLKIRnvTayyYmHHzgavK+BlJvs7FQUJ9hVYclKaIbbPAXsMgBMrC44KnvNikNOMS/100HnKvT5w7N2EO6ZwkVQx0B37ovAyiVUxWf2L4v1tnDvhCrHSYLu8OrnZxPADhHbXQz9LckAZbio4eHXHjKS5Vr5+K2UJnYeiiyhhzi59uLjG7x9FN7Am94U7CTCyMdVwCmu62sms9mxM7KeHDcAbd1GJ1KEhYkdl4kJxGYiCWogWKirA12q7AVe87HbmH4twKrpiUm4c3mv2DO0qgcuicgN/qIH5SdzGmp/t5DXdk7f0WwJogk31X7fp1WiVMqsrhfi9+eS2K+TtQMA5nR9HZQ/J2FDWu5VhElXyVp8sOL+YHY0k62YibJD
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39850400004)(396003)(346002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(41300700001)(83380400001)(921008)(316002)(6512007)(66556008)(66946007)(54906003)(478600001)(66476007)(6506007)(6666004)(31696002)(107886003)(53546011)(5660300002)(6486002)(7416002)(966005)(2906002)(86362001)(26005)(110136005)(4001150100001)(8936002)(8676002)(4326008)(2616005)(31686004)(38100700002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?b0svbXNvTXczaDlDMVpjUVZSNjdFcUh5ZVJXUEd6Z1AzdHdtYXRQbDZKOSs4?=
 =?utf-8?B?Q0ZMaWFsSTJwNzFKMnM4T2k3Z2h6ZnZpcFdRb2JYRjhOWEFwOTZPK2ZSWk5s?=
 =?utf-8?B?T1FGa280OGtrRmNJM1hGa09XUDdYdCtnbVFvSTdsdmY2cW1jNHY3TEdsWlk5?=
 =?utf-8?B?Qno4NnJZZkkrV0hqbzhBbG5vNHlNWTNTS3dkUEtaZlh1VGZOazdPRGwxVSs0?=
 =?utf-8?B?OGhHeXJWZlhmOStmMnZqbXcyNGdNQnM1R3RwbnQvRm1PVnpDS3lId3ZReElz?=
 =?utf-8?B?UnV5VGtwVTBIOW5WU2grUVROMkFJYjAvSW1EMXNTSFliZWdXQitmNGpXSC9o?=
 =?utf-8?B?RHFvL2NZeE5udjlrSUVvclVxaTlCVjBBNGdkRmZlY2tKdFNUb200UmdjTkdx?=
 =?utf-8?B?emVXaUdWTWxDNkg3ZGd0TEJkUm10RHdYcUlWeFRYbjc5bEQyQ2gxMi9Na2xh?=
 =?utf-8?B?YXhPMmZiTXN1R0tKYjgwbHp3S3EySVBlSkhUZUVpbmpIK0hsaHF5d3JaaTZI?=
 =?utf-8?B?bWFSemVqOFZwVHF3ZmxRWjFhY3FsK0dDeXd3TWQ3c1pOcE91NXhJQjdxTTB2?=
 =?utf-8?B?bEpsSEhremFOTW8zaXhEMkorbWhkdHhwZ1pXV0ExZTY1ZnNMYWRNWXU1dDJy?=
 =?utf-8?B?dm1xd2FjSVk0eWVZWk40UFNiNUF4RUpibExqY2VsZVlVYk5UZ2FvUy9YdWh0?=
 =?utf-8?B?MnQzZS9GL0hWN2d6K0UrMXZXREkrbXViMjQ2U3FLdlhiYVM0RFBGQ0pveERQ?=
 =?utf-8?B?RGlnL2dRRzZSZXd5a2N4d3VJdTl0a0ZSKzlRVWFOeVdHa0V1NlQvUHF5ZkVK?=
 =?utf-8?B?TFhac2dCMHJRN1R0OXVxT0NGaFlNcVEranNkQ3dPbFB4TTF0Nm9PV3JzTFRD?=
 =?utf-8?B?OWMwandQQmt1eDRjekRzbzlUbkFwT01PdHBmYmpkUzBKV2xtMjdGZjhveGFm?=
 =?utf-8?B?NDdwL09PdUo5RVgrOCtzQlNoNVIyRi9YMTR3YnVWdXkxam9DbUF1QjVhOGc2?=
 =?utf-8?B?NHlKTk9UalF2UnJiYnVpK0l4L2dNZ0hveGNQcWcrNkFqRW1Zb0hxN3F4NlNq?=
 =?utf-8?B?ekdqRGt4SmlUVWFpVTF3U2g4alZtZkgyRmE1WC9keHlUZW5uQUZOS0g3VDdP?=
 =?utf-8?B?TENTUUJCeFJXZnREL3h2Y011VkpNNDZBNnd3eWtUREZaUkcvN2Qzb25ZaE52?=
 =?utf-8?B?TldQRGlzd0hDMUpQRVhYMEpVRUVacnVlYzNnOXYzTXpVYklBMGI2eTRtSm1z?=
 =?utf-8?B?M003ZWpweEg2bHo5Q05mN0Fvc1BqUnlkUU5VRkcrOG5jVEl0YzRDMWRON2VK?=
 =?utf-8?B?MzhVVmQ5R1dmSmg2TStMZTIrUy9DRWFwalBRWTlTM3dTYmZEV2RVc3dpaHhk?=
 =?utf-8?B?V29VaXBDV1J5SHNUS053cFdTWWRVNDBxZVNObFhqVWxyRTVqN0FLMkQwU2JS?=
 =?utf-8?B?cEI4NmxMeHJPaCs0MUZzYU5qMTRuWGZYc0Yzc2lmWTJjYzlWNmpRZksyUkJJ?=
 =?utf-8?B?ejR3cWpPZEdMK2tDbUQ3MkdZMHRhMDZ2SWUzcGpIZjlNUnRkaU55ZDltdWFu?=
 =?utf-8?B?UWt3M0s5SG1OL3NxdU9zZkJ6S28rN2tscFFLem5HZCtoUUNjWG4vQnFubDBm?=
 =?utf-8?B?cDM0cU4yVERQZjVGLzRTdWhvS0pOTGg1RnF5VFRmWHc2WGhWRk1SNi9Fc2c5?=
 =?utf-8?B?eEF5NU80YjJzUEEwb3NCTDZ5bWR3ZGpBckdmQlVRSlNBOXlhTlcwUTh4aUFq?=
 =?utf-8?B?SUdQbG1YUDI5dFFDZEdaNVh1K201S3JEdjVzcGhrV2F1L3dWQkg4MkN0cjB2?=
 =?utf-8?B?Y3l5NU1yWjJvbHAva0hMaDVpNFhRbWlYSXlMM21yRUNwU3F5OU0wM2hTQVpv?=
 =?utf-8?B?QVJtNjhpdzJLMVZwbVpJSDFlTnlaR2hSYXp2dTFrNSsweExrN0RKd2t3K1J2?=
 =?utf-8?B?LzBYOG9jU2lrY0NkUU56bEs1VEp1N0JqVm1NakFFelgrbDdZRk5DRFE2RWo5?=
 =?utf-8?B?OFk4dEV4WXhpck5TZVRvRkNtZjFQbDRhdDFmNEpKWE5aRUU5c2Z3K0ZpK2tI?=
 =?utf-8?B?QzdmR1V6VzRlS3lmNzR2L21QZ2IrOVE4N1lnU216bUFOcDlmZ2swOWtHb1kz?=
 =?utf-8?B?ekUwWTl1YnMvVzFHR3RQbkI0RXQzZHBWalZ0RHQwY1BzL1hOTGlHMnRoWldo?=
 =?utf-8?Q?DNvZETRKSgqjASWGe73Er1g=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea4f85f8-ce31-4754-d044-08dbf0ba1ff0
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 09:03:59.4725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLUzdXXcjMg27yui4oFrJoCJ2fPnXeiserFz3GjZQT4vyNsJydAtTtIBJTTBNK5QJjoMtCROzEytyKvjUQky7yZID6ywuNjv8pFGDCDuHAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB6302
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



On 29/11/2023 07:19, Andrew Jeffery wrote:
> On Tue, 2023-11-28 at 14:52 +0700, Quan Nguyen wrote:
>> Under normal conditions, after the last byte is sent by the Slave, the
>> TX_NAK interrupt is raised.  However, it is also observed that
>> sometimes the Master issues the next transaction too quickly while the
>> Slave IRQ handler is not yet invoked and the TX_NAK interrupt for the
>> last byte of the previous READ_PROCESSED state has not been ack’ed.
>> This TX_NAK interrupt is then raised together with SLAVE_MATCH interrupt
>> and RX_DONE interrupt of the next coming transaction from Master. The
>> Slave IRQ handler currently handles the SLAVE_MATCH and RX_DONE, but
>> ignores the TX_NAK, causing complaints such as
>> "aspeed-i2c-bus 1e78a040.i2c-bus: irq handled != irq. Expected
>> 0x00000086, but was 0x00000084"
>>
>> This commit adds code to handle this case by emitting a SLAVE_STOP event
>> for the TX_NAK before processing the RX_DONE for the coming transaction
>> from the Master.
>>
>> Fixes: f9eb91350bb2 ("i2c: aspeed: added slave support for Aspeed I2C driver")
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>> v2:
>>    + Split to separate series [Joel]
>>    + Added the Fixes line [Joel]
>>    + Revised commit message [Quan]
>>
>> v1:
>>    + First introduced in
>> https://lore.kernel.org/all/20210519074934.20712-1-quan@os.amperecomputing.com/
>> ---
>>   drivers/i2c/busses/i2c-aspeed.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
>> index 28e2a5fc4528..79476b46285b 100644
>> --- a/drivers/i2c/busses/i2c-aspeed.c
>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>> @@ -253,6 +253,11 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>>   
>>   	/* Slave was requested, restart state machine. */
>>   	if (irq_status & ASPEED_I2CD_INTR_SLAVE_MATCH) {
>> +		if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
>> +		    bus->slave_state == ASPEED_I2C_SLAVE_READ_PROCESSED) {
>> +			irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
>> +			i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
>> +		}
> 
> So we're already (partially) processing this a bit later on line 287:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/busses/i2c-aspeed.c?h=v6.7-rc3#n287
> 

Thanks Andrew for the review.

I think it's worth noting that the byte mode is used in this case.

About the code you mentioned, it is for the general process of single 
Slave transmission with NAK which should be interpret as I2C_SLAVE_STOP 
event.

In this case, there is a mix of Slave events:

   + I2C_SLAVE_STOP (due to INTR_TX_NAK, BIT(1) of previous transaction)
   + Followed by I2C_SLAVE_[READ|WRITE]_REQUESTED (due to 
INTR_SLAVE_MATCH and INTR_RX_DONE, BIT(7) and BIT(2), of next transaction)

That is the reason we need to emit the I2C_SLAVE_STOP first for Slave 
backend to process.

>  From the description of the problem in the commit message it sounds
> like the ordering of the interrupt processing is incorrect. 

Yes, this is correct as per my explanation above.

Prior to
> this patch we have the following abstract ordering of interrupt
> processing:
> 
> 1. Process ASPEED_I2CD_INTR_SLAVE_MATCH
> 2. Process ASPEED_I2CD_INTR_TX_NAK when in ASPEED_I2C_SLAVE_READ_PROCESSED
> 

 From my test, the flow is as below:

   1. Process ASPEED_I2CD_INTR_SLAVE_MATCH, slave_state is set to 
ASPEED_I2C_SLAVE_START
   2. As there is INTR_RX_DONE and slave_state is 
ASPEED_I2C_SLAVE_START, depends on the data received, the slave_state 
moves to either ASPEED_I2C_SLAVE_[READ|WRITE]_REQUESTED.
   3. When reach to the if statement to process INTR_TX_NAK, slave_state 
is already moves to either ASPEED_I2C_SLAVE_[READ|WRITE]_REQUESTED, not 
in ASPEED_I2C_SLAVE_READ_PROCESSED anymore. This eventually evaluate as 
false and the if statement is bypass. IOW, this INTR_TX_NAK is not process.

> With this patch we have:
> 
> 1. If ASPEED_I2CD_INTR_SLAVE_MATCH then process ASPEED_I2CD_INTR_TX_NAK when in ASPEED_I2C_SLAVE_READ_PROCESSED
> 2. Process ASPEED_I2CD_INTR_SLAVE_MATCH
> 3. Process ASPEED_I2CD_INTR_TX_NAK when in ASPEED_I2C_SLAVE_READ_PROCESSED
> 

With this patch:

   0. The I2C_SLAVE_STOP is emitted to backend Slave driver first to 
complete the previous transaction. And let the rest process as before 
this patch.

   1. Process ASPEED_I2CD_INTR_SLAVE_MATCH, slave_state is set to 
ASPEED_I2C_SLAVE_START
   2. As there is INTR_RX_DONE and slave_state is 
ASPEED_I2C_SLAVE_START, depends on the data received, the slave_state 
moves to either ASPEED_I2C_SLAVE_[READ|WRITE]_REQUESTED.
   3. When reach to the if statement to process INTR_TX_NAK, slave_state 
is already moves to either ASPEED_I2C_SLAVE_[READ|WRITE]_REQUESTED, not 
in ASPEED_I2C_SLAVE_READ_PROCESSED anymore. This eventually evaluated as 
false and the if statement is bypass. IOW, this INTR_TX_NAK is not process.

> That feels a bit complex and redundant. What I think we can have is:
> 
> 1. Process ASPEED_I2CD_INTR_TX_NAK when in ASPEED_I2C_SLAVE_READ_PROCESSED
> 1. Process ASPEED_I2CD_INTR_SLAVE_MATCH
> 
> Moving back from the abstract to the concrete, implementing what I
> believe we need would look something like this patch:
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 28e2a5fc4528..98dd0f35c9d3 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -251,6 +251,14 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>   
>          command = readl(bus->base + ASPEED_I2C_CMD_REG);
>   
> +       /* Complete any active read */
> +       if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
> +           bus->slave_state == ASPEED_I2C_SLAVE_READ_PROCESSED) {
> +               irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
> +               i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
> +               bus->slave_state = ASPEED_I2C_SLAVE_STOP;
> +       }
> +

It is not confirmed through test yet but I'm afraid the switch case part 
will emit another I2C_SLAVE_STOP event in case there is no mix of 
interrupts.

>          /* Slave was requested, restart state machine. */
>          if (irq_status & ASPEED_I2CD_INTR_SLAVE_MATCH) {
>                  irq_handled |= ASPEED_I2CD_INTR_SLAVE_MATCH;
> @@ -284,11 +292,6 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>                  irq_handled |= ASPEED_I2CD_INTR_NORMAL_STOP;
>                  bus->slave_state = ASPEED_I2C_SLAVE_STOP;
>          }
> -       if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
> -           bus->slave_state == ASPEED_I2C_SLAVE_READ_PROCESSED) {
> -               irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
> -               bus->slave_state = ASPEED_I2C_SLAVE_STOP;
> -       }
>   
>          switch (bus->slave_state) {
>          case ASPEED_I2C_SLAVE_READ_REQUESTED:
> 
> Thoughts? I haven't tested it, it's just something to throw darts at.
> 
> Andrew
> 
