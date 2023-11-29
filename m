Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B011E7FD19F
	for <lists+openbmc@lfdr.de>; Wed, 29 Nov 2023 10:05:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=dPPEzR4P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgD1K1S6wz3cfB
	for <lists+openbmc@lfdr.de>; Wed, 29 Nov 2023 20:05:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=dPPEzR4P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::707; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20707.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::707])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgCzX2GLxz307y;
	Wed, 29 Nov 2023 20:03:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oDmAKf5FXsWvAFG8t80y35WPaKnCIoonfpx1BxilJgK3wme6swPwMqDbKuBEJg0sqFuy0f4WN+k/u6s9njWmsVaMbTkM+KKJatkw3rz1+eFhDH9BsLHSof4EI61gp6NEZk20qX/usisUpBUW2klJvnTD41Eq0BidlD9Ahc7A9iOzvqh1HeiLn9Q2U/4n3M3wKqzuQByRNcpmX1L+vNFZhzmZvpybRXjU5CJVGTqQEB2sSACBElNi6a0ymMHSThJ3/Kffayo8uAhvSmUIgG16R5ecq3pTIbMUzEULYSggc8I8xOtVfaQ3hytzO49nCelh/WKnYZx2L7u+ObY/5sd3YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IL1nm4fC+hlcn//HNVJqhJpD8X8IOsUEC82dtMSyqFM=;
 b=MicGmwB80F/SUQgDMk+LAaKBlSYTuVWmk/9113zRB07Pv4zc7qb1V1or/kS+1O0GJ5UtQ9rBd+wxO42hMjIZcG8JNCANdZmesPl+62Mf4GWC7uxEh3uwcIi5/mln49kCiQiKwIxWqZRuUKCMN95/ARHUqci6hg/BgT6Y5FJJgGTufUuMN4rnU1WtzZaqTmfcSYBqEaf/uU2noxNXVQtoNWcXXwZ1JS1ZcD29vbJm4oFLDO65Sa0sqXJdyvqILlu90tz6xJjysIZ20jG+tvBagB5cNzWGrDUJzOua3lY6ZAO+m7sZSqaCvhSaekywPJugdRdjbkkzB7lB7B/eMThhMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IL1nm4fC+hlcn//HNVJqhJpD8X8IOsUEC82dtMSyqFM=;
 b=dPPEzR4PApDoGAIp/fze8jDhjXS94bpwYp3h6UBoEtB4PsetulEP5y5ecchqAZ0XJU3CpaKld2noUaLIj5MaktAz0Y8zI6jq14WXyWodGDf85EQsq4Zo2pqoMDOBylwRquHCz50Y0XpHJylZbTr1g/X0nk7C5F/S1CSxW6cVcwE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 SJ0PR01MB6302.prod.exchangelabs.com (2603:10b6:a03:299::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.29; Wed, 29 Nov 2023 09:03:17 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68%3]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 09:03:17 +0000
Message-ID: <3f37c359-1c71-421f-b7d9-054696735adc@os.amperecomputing.com>
Date: Wed, 29 Nov 2023 16:03:11 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND 1/2] i2c: aspeed: Fix unhandled Tx done with NAK
Content-Language: en-CA
To: Andi Shyti <andi.shyti@kernel.org>
References: <20231128075236.2724038-1-quan@os.amperecomputing.com>
 <20231128075236.2724038-2-quan@os.amperecomputing.com>
 <20231129003542.jfhhotebweb3uwyb@zenone.zhora.eu>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <20231129003542.jfhhotebweb3uwyb@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|SJ0PR01MB6302:EE_
X-MS-Office365-Filtering-Correlation-Id: 91b6c609-64d2-4d94-3c8d-08dbf0ba06fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	PanDX648oj0iWPqYA8fONq8LfBJnkVZL6v6o0B88ikRq++Htll2fIGNWpy962SFxeGJqeVJTf0pM9I614zoOMyn4SfY/BVWK1vcuhDo+A2asZy4QBcjt9MWfFr3olJYaPjklfH5JX1KIaEhDi10RL9z2r0v4NjPqWYZF5F3CgUlVTVtulramOwv7SdaHxjmUgstBG5krtHcqNuViLY16nxbjXMpQrrmeouuAhuoA6svroHuCWZb5ezKKVE6ZmStj2W6DPGdzm5BjNAeSumYMjSAl5GKeikEEm7iNKkCNeRUzn2/Jb/CQPM7hBMI8S1UpGRrtXfenYEnXtmNdqMzwGlN8zdyCwt3nNtvIrALTROFGQIhq6I9VUf7F1dvK5jL2b44CXgww28EdDVem2b4RAzbwd7cpDdABqg4TMrfk3px3XUFUa5nbtOzShE8VjaSWTparp1L/n/N8U+FjZXeQyG6hK3UyEyUK6u8QQftUMovX1T+LtGDZAnHsMXp8IeLyB/obwmSCS+d30aKmR90DefFPjVGI/adEryh97xIjd7AbW7+S8CDDrma3MfoYwoXSqXaW6IKX9KUDFdy7Om2fp8/GbVpDixB7CBW0INRkofg=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39850400004)(396003)(346002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(41300700001)(83380400001)(316002)(6512007)(6916009)(66556008)(66946007)(54906003)(478600001)(66476007)(6506007)(6666004)(31696002)(107886003)(53546011)(5660300002)(6486002)(7416002)(966005)(2906002)(86362001)(26005)(8936002)(8676002)(4326008)(2616005)(31686004)(38100700002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?TTdCVVhQc3VKKzIzQ015UUY3N0I5YWMrd002am55d2RaL3JpZ2twcEtXRWxr?=
 =?utf-8?B?ZVBWdlduaHVGWTRGNVo1SDJmR1Zxa2VOTys1NmVGbzNxRzlEdzdFSEJldWt3?=
 =?utf-8?B?eG55cWpWZzVMeDM0OWFRQlRaT254L0p6aUFzQWVHbFY4Rzd2cXRJTzZ1eS9D?=
 =?utf-8?B?Wm1OblVMSXgweE1nT21yOVI3T2t6Z00vYjFZeDJPOFh0N1R1T1pMNmpyOE90?=
 =?utf-8?B?b0VQdUpLK3VFdVcxWG4xODdSM1FVMm5aRldnNk43aW02aW5INFZSMGVITWRV?=
 =?utf-8?B?M01ZdDdlT0k2THpiMWFsQXlnNlhZc2RHNk5GR3AwQ1VaRGV6YkF5QWZwak16?=
 =?utf-8?B?eGFCbm1VWk9ja01uejdMd01PNFJKTFRoWEJCRHFTQm5wTkJvYWs0WDlXNVJn?=
 =?utf-8?B?TyttVzluS3hXVzl2OTFtTWlaY1REcHZBNVFVT3pLQ1hHVnZWWHZOWnhwdEI2?=
 =?utf-8?B?cGJzdFljUXNRbDV3cWtnWVB5UUNIQVFrZDEwcG85OWdtMXRNTjR2T3dOSG1q?=
 =?utf-8?B?WnQ4YlgrNUZJSXNDMGlsaDRhMFk5KzNPTmd2U1gxN1ZVeWFtU1Z2ZUtWZU9Z?=
 =?utf-8?B?WVVvYUI0YlRES21vaS9wYjdnVzYwVG9HVUNDeGVacDBZWWhOS1FYc1dScDBL?=
 =?utf-8?B?a2FlUmlFdW1TTDltYmIwNDdFY2xHNzhITGMvY2FKUVlFbmlibVpQNmlaTlhE?=
 =?utf-8?B?bTRMcW5DS1V6UTFidGwrcllwdXVlU0RQZVFuSFNkUlMwMWNTaVNJS1ZYc3hE?=
 =?utf-8?B?aW1XMHlLUlJMYTd4NVYrRFZXT2RhcDFFU1BFK1E2Q3JveGhiV0QzUTVtUStx?=
 =?utf-8?B?S09pYWlkc0kvRXJ3ZDJLRmtrRHkzZE40dkY5WmRvSlhhNDg5aktJSTQrQWFq?=
 =?utf-8?B?aWxFQVN1VDZuVFU5OUNuWTB1N0lkSzR2eVNubHA4VWFYUnJobHI3a2Z0MUVR?=
 =?utf-8?B?aWFIczk5KzZFU2pnZjNmVEdrYlJMaFhrU2lOK25JanNxWVhEdStYc3B6WUN1?=
 =?utf-8?B?L3BnOXNHcEVlWXdkMEhzd200dWpVMzlMcHZVRmhqbVdwY0NHQU9YL1hpQXll?=
 =?utf-8?B?Y3FvYnJqd3k3cUpSTDl2YjcrSWVSYk5qUGNMWHFyKzl0c2hBRTF0a0haTnpO?=
 =?utf-8?B?Vmh1QTQwVTBudnRKWEVpTkw1S0tZRlB2OUwxaXhLaWZtK2RaV01FSW9NRmky?=
 =?utf-8?B?dFpLSUY1R1Z1SXpEZURRODZXREJWMGJ5QVprMGxxRUhUWDlLQ2p5ZXFyU0pK?=
 =?utf-8?B?TTgwOEV4RXJFd2NJRHVQcHMxRDFzWU1zT3VKQXJLZTBQTDJZcXNCczN1YTM0?=
 =?utf-8?B?bjJ0UW9Xcjh4Nms1WmdCVFpsM1Q0VEl3RkFVUENQTnE1NE94QnIzckJHeHhC?=
 =?utf-8?B?Q0ZxY0VaL0RwTGd0bkduUWh0YitDSm9adUJQTnk1MG4weDNSMXc3L2FhLzZm?=
 =?utf-8?B?YXBsMkFCaWFWNWpUdllKdDRSSnNPeFZGTStXMmw5NnNHekI2TXZ3dzEvNmpa?=
 =?utf-8?B?azRjYnl2NWxqZTA5M0grVFQzUG9UQzJVemdMaFlnT1Q5Y0dLSTVEOC9JdkZQ?=
 =?utf-8?B?eWZhd3BhS0FQeVVDcWI2WVJycUlTSTZraHBZSVFSZDFVbUpOMVJEWVh2WVhr?=
 =?utf-8?B?aXpPSCtlWHRqR0J2ZWV3LzhoMUoweFBSZStsejhyZlVQS0J0b01CZWNxbmlt?=
 =?utf-8?B?VHB1bGRheGE5eTBGeDY4SU9RUjlXeDBCNGFNRUdQT09HRlQ2WkFURWVaZUd1?=
 =?utf-8?B?V29zNmZzT0RvRG9iNXU3ZGpSUXl5SXJodUJ6ejJiN3V3Y25PZDZObTRHRytT?=
 =?utf-8?B?TTlFSi9IL2Nzc0RHVC94aDF2NEdMaG1qbjhWSEdtVEc3TXpnck5CRXB1a1FO?=
 =?utf-8?B?ZHk4TTZxUlhsZWNFREcvL050QnJETE03RkdQdkd5aGNxalE3d2RwYVAvUjN6?=
 =?utf-8?B?Q2hyMWNCbUt0L2xKQ0FtWFZMcGpoZDNrbElkUzM2dnpPTkxFMWdBYkpQQ01z?=
 =?utf-8?B?aXp3UlppNWs5WDArMnRUazBMdWRrcTlMVG8rYWVGd3dDeDFqM1FWdCsranE3?=
 =?utf-8?B?K2k1aCtkdnlXTndCQi9SajVCOUxFVnpuSXVGdGlhT0pHN0VvbG91Z0FwOFNn?=
 =?utf-8?B?WU1JS1dzMmNQYzZIWkRkbkQxZ29jMndoNzB5WWp6cXhIUHBraVhnZ1N5MGNo?=
 =?utf-8?Q?Je991DuIKzOHT/km23nElfo=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91b6c609-64d2-4d94-3c8d-08dbf0ba06fc
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 09:03:17.6830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eEQgCjP2gtjBO9UmqiNNu4OHStKzPlwd5Lr2cIPKcaixNWCtdo1UsVkdVm2X9HOGlD5qiCBf48/68BsbiraDx737osVtJfmuraWl9QHthxQ=
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
Cc: linux-arm-kernel@lists.infradead.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, Joel Stanley <joel@jms.id.au>, Cosmo Chou <chou.cosmo@gmail.com>, Open Source Submission <patches@amperecomputing.com>, Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 29/11/2023 07:35, Andi Shyti wrote:
> Hi Quan,
> 
> On Tue, Nov 28, 2023 at 02:52:35PM +0700, Quan Nguyen wrote:
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
> this is a duplicate of a later "if (...)" satement. What is the
> need for having them both?
> 
Thanks Andi for the review.

I assumed the if statement you mentioned is here in [1]. If so, then 
that is not duplicate.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/busses/i2c-aspeed.c?h=v6.7-rc3#n287


The if statement is to process the case when Slave sending data to 
Master but being NAK, the I2C_SLAVE_STOP event will emit later in 
switch-case statement. But it is only for the case INTR_TX_NAK without 
INTR_SLAVE_MATCH.

The new code is for the case of INTR_TX_NAK with INTR_SLAVE_MATCH. What 
it does is to detect if there is a mix of INTR_TX_NAK of previous i2c 
transaction and the start of new i2c transaction, indicate by 
INTR_SLAVE_MATCH which is only raised when Slave found its address 
matched on the first byte it received. If so, the new code will try to 
emit the I2C_SLAVE_STOP first to complete the previous transaction and 
process the rest as a new request.

So if this was the case (with INTR_SLAVE_MATCH), the INTR_RX_DONE should 
always raise with INTR_SLAVE_MATCH because Slave did receive the data 
which matched with its Slave address. And this will be translated into 
either I2C_SLAVE_[READ|WRITE]_REQUESTED and that make the if statement 
you mentioned [1] evaluate to false and skip.

So, in short, the new code is trying to handle the case of INTR_TX_NAK 
with INTR_SLAVE_MATCH first before let the rest process as normal.

Thanks,
- Quan
