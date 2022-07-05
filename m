Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D52AA566168
	for <lists+openbmc@lfdr.de>; Tue,  5 Jul 2022 04:46:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LcRrV4dTgz3bnd
	for <lists+openbmc@lfdr.de>; Tue,  5 Jul 2022 12:46:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=GumkVZdp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.92.91; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=GumkVZdp;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2091.outbound.protection.outlook.com [40.107.92.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LcRqx2dHvz2ywV;
	Tue,  5 Jul 2022 12:45:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CK06wdyCPte0TULSDHW2NT/O827cNRMOLkTpoeDtVFkgjm8U1cealTnapCNlgGQqsLI6AYL20CdfpcbCW80l77j+GeC8j93V5Y5LSV2Whc0balCJYrl/e0+l3x+MzunFnG5XIT6axud/j6uMB/5EFWaUAV0vdU+Nu2Tq5Y2DPt3QqjPOpBDC2GqdlS2q0SBbv5jLLX1px5Tu8sOBbxZjS9SvBUDmPMtqKa9fvfXVO7qcN962H4ya+KVQsqe9Ns0nWBWusYpjG5jEZARKj8o4WroieBdcQLUj5c+WviwLdBqncyGzrepO50LFdGp7b5PWAeV7EJchsQPW3w2HVRmoLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2wQKYfGYj0Z1ot2IY13ErX0c3h6VTsplYzGatKRLSQ=;
 b=aqItT83KW0Malv8PbvXj4GcJcXvz5Y3ybaPM8jrhuqUXIPzaHEJd0pcLNoPpEQLe0XN22ET7G13feDTgVb674kQ621BB8c0xudL6foPOs4RPMYkrBMBHt01LGrxEHxbsjEGBsdvYEw4ybCBBrZQwDHYAwRmZ0nZVhxeJiWACOY3nkGQGku7uUrvuPX/jyQjsTeoJ/Kd6VMtjBmIQa8IzyBr6V0S2FwhEphpaACVpT8CaTGNd+LvNCRXd8rNJ2SU56dLm6kgZZFaMhaz3GM/z8EnSv25axuiqBMG2x1UrSCguFu+yP0jt/+1i8XqBocMo09v73mB6d+SLdRe09FW+gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2wQKYfGYj0Z1ot2IY13ErX0c3h6VTsplYzGatKRLSQ=;
 b=GumkVZdpruzWQbyu7YwYuDsbfzVKgGZf+QKeWc73mW7fRKwss63Pa6XfVEV2E/A+QsVEbjdm/xPMORL1D10LO1P7xIYucg4jc4bw4VlH99wIp5cpgFuD5YkegZPWx5PsUXUdRySWTXCTgCf4l0YzcG4Q868yvJ9BR16mYCKhOXE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 MW2PR0102MB3404.prod.exchangelabs.com (2603:10b6:302:3::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.18; Tue, 5 Jul 2022 02:45:24 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e%8]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 02:45:24 +0000
Message-ID: <556fa9e1-c54b-8370-4de7-c2d3ec7d6906@os.amperecomputing.com>
Date: Tue, 5 Jul 2022 09:45:11 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0
Subject: Re: [PATCH v7 3/3] i2c: aspeed: Assert NAK when slave is busy
Content-Language: en-CA
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Wolfram Sang <wsa@kernel.org>, Corey Minyard <minyard@acm.org>,
 Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Brendan Higgins
 <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 openipmi-developer@lists.sourceforge.net, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org,
 Open Source Submission <patches@amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220422040803.2524940-1-quan@os.amperecomputing.com>
 <20220422040803.2524940-4-quan@os.amperecomputing.com>
 <Yn+9QBoPdH8fMm/m@shikoro>
 <fc422a06-c035-f6e5-231b-74ea6afe8467@os.amperecomputing.com>
 <YqpB8A2uBi+4epHM@shikoro>
 <bf001ece-e981-3a06-53fe-6a8b637d69fe@os.amperecomputing.com>
 <YqsiRW78NAL9rX9S@shikoro>
 <27f5999e-40a6-311f-20f1-331a0f4447da@os.amperecomputing.com>
In-Reply-To: <27f5999e-40a6-311f-20f1-331a0f4447da@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0173.apcprd04.prod.outlook.com (2603:1096:4::35)
 To SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1bcd87bc-17ef-4c12-d6a5-08da5e306900
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3404:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	tFN+cysuqhLkWHManmgIliKSssTIjLkO0zTDOp6RirCXwcMvjM7rwAn8No48XP+UKuGbqUN7vUNafAyuJYDAfsvRGHEMgE+vF9wJknOqJpI1W7Soi39Zps+rJNi3HDgj8+WRgPzE9+QXa9CJuqMScPJB6ed2Al40VxX1m0QVdvup2PsHLa7gQG196Eeb6GQsu/GxGMk18VDvSeS8GziOh/xIL6O7K3yVMsQW6LqSlmjGIXauM9iH4d6FOBIIDgB4qptxiuu4pK8dDnrzMl/BfLxqtFEJ47Qdl/Ad4wMNT8AuLETjkpaqGAhcy+PBFIUyI+J6LU0viXgGMaMjLphwV6UjZOE7OU1+oaHQkMKezfY5hRmXQahmzNhRX3smQD0OAiPX04GwdN7sHYHisONycvR5lkeu0on15dcEgVBvgUzHYuxWXUbzL0QFaywsTUL1AxE6Ouf6SlN6/wRDiBE0nc4dCyjb3855eMC9St/EYc0q3IuQPCA5QsqE91KVuQk11IsieZRm4SlCXYzYKhnF7Cg+inj/IWwfLFtOr0iwIle8OCzj5+QkbRFISQ8mCl4aY1yvQ8I0vGTObpd5ff26HZIZLnviJCuGT3FlDNhSIfT+ol522yTmL+culngQX+/ZBASAXXeT01I3L7J9yAHpOp5v9Z7TH/eLK9CWePAUpIEYCkrn47/DbdWLcbHmLBt9BjQQGg4SQlWXF4YIc9u+MGVQ69txdCMx7GhKCYe+rOGz97tSBlNH7jno8LkLVc6SK6P4lvGL14n1tuDMP0Ad7UfaIh2T1NBbMVSUC+tzmjSNJlSBnzETSY/PGc0PQY8eqk6Y3wTcprviH4bzzEChiO1FZGOMX5KaRPYAVnhZ3uc=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(346002)(376002)(136003)(39840400004)(8676002)(66946007)(66556008)(66476007)(2906002)(86362001)(31696002)(38100700002)(38350700002)(5660300002)(921005)(7416002)(8936002)(41300700001)(83380400001)(26005)(53546011)(52116002)(2616005)(6512007)(186003)(6666004)(6506007)(316002)(110136005)(6486002)(478600001)(31686004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?aUZkMU1tbVkvWHBMa2lKdElPN3dDTEpyV08zanlLNjkwcTVGeHFQSkEvbHhO?=
 =?utf-8?B?bXlLM00wSXJicjNEdU5XRzRPWm9ETXE1SzdmUVlNbG5FaW1KVGUrcDRnNHRF?=
 =?utf-8?B?QjdvQVZkcWRYTWVMNDg0SUZsV1dLU0RFbGNiOWVnYnhHVjdIajBaVjNaZHZB?=
 =?utf-8?B?RUwrVjFwYWd3aEJuSi8vdVc4ejBKckNLZ3ZVVVV4a3kvL1lBOG84a1dBc0Vx?=
 =?utf-8?B?Y2Y4UURGNjgzYWNtSDllTTBqQ2RRRGpnMVdNWDhnYlExcFdzeVBUVTk1Z1M4?=
 =?utf-8?B?U3RQTG0xeE1Bb2tXY1FKK2RuT3hzMWxzVnZHZ3ZMY3E5Yi9laXNxeER6VWhS?=
 =?utf-8?B?eDFBZ0ZrZzcxMkpQNDFpTnpmbEVTWGtNbVBqRmZlVzBDUGtHdk1PSTRvVjNP?=
 =?utf-8?B?SWZBQ3ZxZmtCQzloeHFkVndicnMrTituaVA5d1Nja2RheTlFL3FlZEV1cUp5?=
 =?utf-8?B?ZGwzdXNhOEUyeGtzc0FYTkdQMlJZSjd0cGlxaUQrZ3NydDlLTHJmWjBpYUFr?=
 =?utf-8?B?RFVsT0luYTZaOEFwR0JMaTJkbmdEdktUeHVRU1RQUkVsY1hCTWdHRTA3UTdY?=
 =?utf-8?B?Z01WTVR3Ymk3NmMyaThXdzhiWUJnRzhQUjVEeWdGRS9aV0xHM3dIWlpPNndo?=
 =?utf-8?B?dGdYRlRJV2FONXhsa1pJZEo3bURvMGovK2J4UjQrdFNSWktyTkxJaGZQSitP?=
 =?utf-8?B?b0pYNFgzYUxYMjJUbmF2YSs1dDg4K05tc1N3SndySmNoSXpVU2JiUHo5Lzhw?=
 =?utf-8?B?YzdaMklSOXhFTVRjbGoya3NwbFRlZ2ZvQ2R0U2ZBOTJSY3dqbEIxV1FrSHNt?=
 =?utf-8?B?WTRlSW4weko5c2UrRjBzUUdSdENFU0FKQ2dFMFJGVXVDeDJwTDFuZWJ4OTc1?=
 =?utf-8?B?MEc0U2F6bmlTWlY5VExJdkdONUtPTzJHdHgzK3lNNktCckttZ3ZnVVpJcHVE?=
 =?utf-8?B?YWFUQWpKeWdubGJkdk1XdCtuMFRtMWhIcGNoT1djc2dhb0xtMXp0MTJaaXZZ?=
 =?utf-8?B?UGZoenB5OU1UWW5aVW0xSHJ5azAyc0hrRnBadWhLU2lVaHVCcUcvZ2tnNG9K?=
 =?utf-8?B?c2REUU0vaFRiVm5nUi9qUXpkV2FRNVpQNlRIL1F0TUg4TERaZ1I3Kzk5M3pD?=
 =?utf-8?B?K1lwNHBKTnlWdVo1N0ZVVlVieFlrcDhCbGEzRThJVUlOMVdDcmwrQXdwa25S?=
 =?utf-8?B?bTBKR3B6T1NoM0lyODVHMWdTWFpicjFTWEFFeEx2V1JaaTk5S05HY1c1c1hp?=
 =?utf-8?B?cnpIUEI5RTh4VnhSYmgxK0kvK2F6SWFRbjR4ckpsZjhHWmdraUJaMHZ6TDgw?=
 =?utf-8?B?QU4vdXNFUklEQ3BTaVBqblRYYUdFaHhKY05UWi9nUjFvOUNBRjR6SEhBNzky?=
 =?utf-8?B?T25mTXVGZUlqbzBOTFZpNFVzRWt3TC93bHQ4YmRKQ3dNZ1VsVzVMTE44T3FM?=
 =?utf-8?B?ZHI0MUI3WEN1SlhXYjVDV2JRVnFFaXhNMTB1aUlvcUFDMnVvY2JkMURTZHVv?=
 =?utf-8?B?dkVreFlPN3ZnNk1sOFdPZnVHUU5WQU1KSFZ1RHB3Nno2VHBZMTQ3NDllODRW?=
 =?utf-8?B?SlZlWE9PMUZ0S1htY0xoY0ZrdVBtaWV6cEIrdThMdjJjUzl4YzhNZG8yenIr?=
 =?utf-8?B?Y3ZaK0tLTFVrL204MGd2YzVDNmxIbmF2WlVHQkd4NmVaK1JaUWRjRGpDcEEx?=
 =?utf-8?B?R0FmaTZkZzZ2VzN5UVZQQm4xdVZDWDRvek5VV0ZJUjJaS0hDKzdaLzJpQWtO?=
 =?utf-8?B?VWpITFI0MGlnN1A4NUlWUGlSY29UMWFWQmtic1M3MTNBdDlQZXplR0YvL1Vu?=
 =?utf-8?B?ZDVzOEZ4aTZzTDYyNHFjZGxMS2wvbVFnVVFFRVFOMHY5dXdkME1sV1Y2djBR?=
 =?utf-8?B?WkJWNHVoOUxUQU5ESGl4SzcwUU5SRVFSSElqQUFtc1pZMGFpek9pdlFZME9J?=
 =?utf-8?B?SUVpUEJwNTRIM2ErQlcrZEZzMm5sbTh2clN4RXBqU1M4a0tDNzB5Y0ZIN0ht?=
 =?utf-8?B?a2FvS2pKOHh2MUJ4MkVndlJ3NXU2MzUvaEo0VGR6T3pYYWJBcnQzWTIwaks1?=
 =?utf-8?B?eGRVSWtjN25tUUZ3RUUrOWRyU2FPZkpyQWV6eWpQWFJrSWZCMUdHMGVvM3Ay?=
 =?utf-8?B?Sy9mT2JyS1Nxdm5PM1dkWEVCeU0wN1cvVVZxanpxWEhqeHIydGliMzdseHhi?=
 =?utf-8?Q?Qdhc8kzdS5XhQiH7bic7Xto=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bcd87bc-17ef-4c12-d6a5-08da5e306900
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 02:45:24.6011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AalGmpKBciwJEVkesT3Il4zEyKMBLEygIqbaFPR0QJXzYUdZR9uhY+natSI5rlGvhugbHcZFLlrh8Ktc27wR2Rc2WEJJlHgfGC46JXryrVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3404
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



On 17/06/2022 14:08, Quan Nguyen wrote:
> On 16/06/2022 19:29, Wolfram Sang wrote:
>> Hi Quan,
>>
>>> On the first occurrence of I2C_SLAVE_WRITE_REQUESTED, the address is 
>>> already
>>> received with ACK. So if slave return -EBUSY, the NAK will occur on 
>>> the next
>>> Rx byte (on I2C_SLAVE_WRITE_RECEIVED event).
>>
>> This is exactly why I2C_SLAVE_WRITE_RECEIVED allows for an error code.
>>  From the docs:
>>
>> ===
>>
>> * I2C_SLAVE_WRITE_RECEIVED (mandatory)
>>
>>    'val': bus driver delivers received byte
>>
>>    'ret': 0 if the byte should be acked, some errno if the byte should 
>> be nacked
>>
>> Another I2C master has sent a byte to us which needs to be set in 
>> 'val'. If 'ret'
>> is zero, the bus driver should ack this byte. If 'ret' is an errno, 
>> then the byte
>> should be nacked.
>>
>> ===
>>
>> 'ret' is used to ACK/NACK the current byte in 'val'. That's exactly what
>> you need, or? Does the aspeed driver not support acking the current
>> byte?
>>
> 
> It is true that aspeed driver does not support acking the current byte. 
> Setting ASPEED_I2CD_M_S_RX_CMD_LAST will take effect on the next Rx byte 
> as per my observation.
> 
> S-> Aw(ACK)-> RxD(ACK)-> Sr-> Ar-> TxD(ACK)-> ... -> TxD(NAK)-> P
>       (1)        (2)
> 
> Currently, setting ASPEED_I2CD_M_S_RX_CMD_LAST in (1), on 
> I2C_SLAVE_WRITE_REQUESTED event, will make the NAK happen in (2) and 
> make the read stop.
> 
> If setting ASPEED_I2CD_M_S_RX_CMD_LAST on (2), ie: on 
> I2C_SLAVE_WRITE_RECEIVED event, the read from Master is never NAK 
> because there is no next Rx byte and Master is already switch to read 
> from Slave.
> 
> I understands that the return of
> i2c_slave_event(slave, I2C_SLAVE_WRITE_REQUESTED, &value) is always 0 as 
> in Documentation/i2c/slave-interface.rst. But with this case, this is 
> the way to NAK on the first byte and I'm wonder if this particular case 
> would be supported somehow.
> 

Dear Wolfram,

 From my particular case, as it seems not to be able to nak on the 
current byte on I2C_SLAVE_WRITE_RECEIVED event (i2c-aspeed), is it 
possible to somehow allow slave to return some errno on the 
I2C_SLAVE_WRITE_REQUESTED event so that bus driver knows what to do for 
the next incoming byte if slave is busy?

As from the docs:

===

* I2C_SLAVE_WRITE_REQUESTED (mandatory)

   'val': unused

   'ret': always 0

Another I2C master wants to write data to us. This event should be sent once
our own address and the write bit was detected. The data did not arrive 
yet, so
there is nothing to process or return. Wakeup or initialization probably 
needs
to be done, though.

===

As the "Wakeup or initialization probably needs to be done" in the slave 
side, in case slave is fail to either wake up or initialization or busy 
in this particular case, there is no way for slave to let the bus driver 
know the status if the 'ret' is always 0.

I'm also agree that it should be always ack on I2C_SLAVE_WRITE_REQUESTED 
event (when the slave address matched and the write bit detected). But 
if slave know it is fail to either wakeup or initialization or busy, the 
bus driver should be able to automatically to nak on the first write 
incoming byte.

Hence, my thinking is to change the above:

   'ret': always 0

to:

   'ret': 0 otherwise some errno if slave is busy or fail to wakeup or 
initialization

Thank you and best regards,
- Quan
