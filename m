Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D775C38E3E1
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 12:20:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpYBs5SCkz300Q
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 20:20:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=aZZltRPU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.100.96;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=aZZltRPU; 
 dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2096.outbound.protection.outlook.com [40.107.100.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpYBR5Wvkz2yhF;
 Mon, 24 May 2021 20:20:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQrP0ldsgS3hvEv2pIw2pvqG/yCg2IFc4AF+ufrGdpMjjuPDf8Q2LO54k9hrHKzs0Hup+ReOBQCPlLuurVT/LWeH6f2+HCTIVewSRuNllkT85cg0/khElOi1qXp3WFWbz6uMx+tz+LGLMYJ+rEesaScPIQPdehWpli4wRhqo6//OPJz1zerzdNBiJYFhNbN2/IwmESofdZoKVGK0gKFNWQ6xTgCUcRIlVS7IBE95PxKhwSeEWLuLEuzXWETe53jhMRHC8QGgqJiGDzCCrDsX7JuPZ8EfS//HjVlClMpmxzdmFSZFkHllE0LxCtDpx97uPZ+qSRThP2TkEz5z9TPB7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04EolnKMFloxx7kfhpCzsHCe0LNLSQ6q8fACLQSUCjo=;
 b=RSfW7plvebREg2IgzUodn3R+iMljPrwH+eXQ/q/ycY7jb5bhJpxbpsAHB7iMcOkWwjRlig7DHPQRWWT3cPjZWs+aRLMgDKyMIxWRHL3yoliIF/FumPh/1xBk1H5GWyQagww63VI4BSCc1NWC3mm9WiOW3smQnwzziUJt9kYaqAdsg0T8vv8dk7XhffjnTSnA9m5oZ5274nH5j/rhFeWUKX+tVDzojyE2i6YZNsc+FMi6fTrWHEcL+Jiusp3S8DfFwdHwgcuApdr49wgzTGCeYUu0ODzS3p4h6glLzvckHR6d8zFaXmd9YTqN9V7UKj3rCQgfeHo2dkWgKh7etkRYhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04EolnKMFloxx7kfhpCzsHCe0LNLSQ6q8fACLQSUCjo=;
 b=aZZltRPUAwrhDSAU+v5pnkSv/JOKZJAIgVdn2ku0+Qv/8ejingl4FsNttYhEQFWlA+6XQOKGPtpQ2Gur8s6cr/3SMGj1zbCDmeXIUxK7SQuMG3nRXk5iONLG0E8JIU6UD7CvySuVptIWZ2Zc41ThNFN+jDD7b/T0Y2GoZ55FHQQ=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR0101MB3070.prod.exchangelabs.com (2603:10b6:301:32::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.27; Mon, 24 May 2021 10:20:22 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::1905:a396:9968:3a5]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::1905:a396:9968:3a5%5]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 10:20:22 +0000
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
 <HK0PR06MB3380FD2B7649CFB48BEA2D4FF2269@HK0PR06MB3380.apcprd06.prod.outlook.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <1648966e-3e45-9661-c5dc-5ac2f40e2581@os.amperecomputing.com>
Date: Mon, 24 May 2021 17:20:01 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
In-Reply-To: <HK0PR06MB3380FD2B7649CFB48BEA2D4FF2269@HK0PR06MB3380.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2PR03CA0066.apcprd03.prod.outlook.com
 (2603:1096:202:17::36) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.33.138] (118.69.219.201) by
 HK2PR03CA0066.apcprd03.prod.outlook.com (2603:1096:202:17::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.12 via Frontend Transport; Mon, 24 May 2021 10:20:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13d70335-c9c8-408b-b4fc-08d91e9d89cd
X-MS-TrafficTypeDiagnostic: MWHPR0101MB3070:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR0101MB3070B010D224C97BD865C6D1F2269@MWHPR0101MB3070.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cjDGj7mJAaYPnP+aajisEYx61Mr/EtGunQHgf/J6VEAPNbmY4Jz8O+mRelhuxdPVLAhdxIAQKz3EVuBuyf+W6BwEtfBuiaTxY/V6yTPzurhXjwuMSMaBbPHD8UX3cS2wrOtc1BGzOx5XRZ4IfnNd5Gp5eo8yxBbN3l3H3hbGKuYJVAmSlIcjzEmKNpD9qukUgF0rv8w1u4C/P5AfJQ9Hare4OxNXlqiEamn8igShNXoi31M1zC5nC/NGpiNSWfKMLGvnMh6+SwEX8xkW275yJVV6Lz1LTnoFBrWmU7W5cCgrKSulBYpH/KKlDfK/faPeQZimf4UaVrqLxFqNgJ4JKmkVlbySsfqxmy7V6seC+ZVuKaFWQFpQrv/quxhf4GgZuBI7ivXUk+XzWh+07FzAQfThQn0h2ZxAd9rSfD51TyeSngF7I5Vmo3qwJsHJTqw2R8cLpAx42AaN7eSRKe/z3rav04M9LC3Enm9m5R6u2loLtDLfLrL9MO2cUZtZEwkWXSRLENCV9/qiXQzSDJUYGENjsVD+Mp7soyNLCEuNQ1Nkmlpjg/Gtrv06TMQ4LHuWDs2Q+Yvc6ebuZTsk81qMws6sqO4/PkFIfuyuUD3KWZ8RkP4RY39N/ujepa1G9hObbJ1dxU2wvtcfkiCNWlLiQ5Bl9Ob4uoNdHNFJSlrAop/U3yQGZlgO89vmv6D3vlLVnshhb1eliHn+4F7KjS42q60fZLQOS8lWJl306kurylM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(136003)(366004)(39850400004)(4326008)(8676002)(110136005)(921005)(316002)(5660300002)(16576012)(31696002)(2906002)(26005)(31686004)(86362001)(54906003)(8936002)(956004)(52116002)(16526019)(186003)(6486002)(2616005)(66946007)(66476007)(38350700002)(66556008)(53546011)(83380400001)(6666004)(38100700002)(7416002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZVlPdW5zWHVWTGpTU1FhY1NaNTNacTJQaG1JWVVPU0IrT3A1Z0tzTU13Snli?=
 =?utf-8?B?OEJxYVIrZFBIOXVOa2JaS3hwTDhqaDZ3OUNsbDVKa1lKeXFBOWJJSEQvNUNY?=
 =?utf-8?B?RnBuWk5ReGJFZ2oxbnF3OC96blVFYzBkV2RQeDZWQmdWVmtvTlNabkViZjJ3?=
 =?utf-8?B?TmlNQnlaelN2RzNGZ1VEVTRPQmFoSzVnbHpmbDd4T3RjaXh4VlFUNFNScXJJ?=
 =?utf-8?B?QkNSVjgrcGtNVkxVSVZIMDRmT0VoVTRBSGp2WkE4aGZKd0RIek96NkV2UDF3?=
 =?utf-8?B?Q3ZJNFBtTXVPdTNwK1kxeFRSQUNNYjRuWlBTL0RBRzV2aUlMRUtMaEZzLzNl?=
 =?utf-8?B?aEVGWnBxQVo0STFZQmd3WFB0Mi9QZXFZY1pGVElSQXJ5SlRPN3Z3bDRVUThV?=
 =?utf-8?B?dTJBbFdUVVRuN1RxYXpSc2tzTWt0eFRzWnBVcUY0eFdFT1FOV0JJTTFKN2d0?=
 =?utf-8?B?YTh3bmZSR3VUb1drSGFFNmIxWjkxVkp3WnY2WnpFVU1XR2hLUGIwQTVVWFo4?=
 =?utf-8?B?VldsYUYyWU9nZjhFdW1GNkQvaHRHZWxKODlCRXZaeEM5ZXJlVlNEZnpkSFZ4?=
 =?utf-8?B?MmpUY05XQVQ5aUlxMmNGNUlLS3FlcjAvMlJVL0JycHltYWp6MGJXVkZJNzZp?=
 =?utf-8?B?WEQ0bTFoQ0hNY1A2RjFtY2tKdE50c0YxUGZ4eFBCYjltakZ3dmc3ZDhvelpv?=
 =?utf-8?B?dUFPaDI3WmUrWXRKdmR1bm9rWlljY1dPVTRtaE81Mm44UTkrSnVUWlRobzRP?=
 =?utf-8?B?bmFib05oYlo2UHluWmtBT1pic0ZjNGFDNDI1ay8ydzNLM25tc3VGNU00Q0VD?=
 =?utf-8?B?dWluU0thREdyekd2ZVgybVA0VE9NbkExaFdYU3JNNHQ4Rnc4N08rK0RycGIx?=
 =?utf-8?B?ZTJPd1p1K1I0NlhjMHdUUm1sbWVCYjR2QTgzYUV6RzVsVlhEUk9Ic0hQUmpi?=
 =?utf-8?B?Mi9BN0o3RmhPdmdhTVZLQmtCUExOaXFnT1daRG5XYzZyOVdoajVyN2RLMHFK?=
 =?utf-8?B?RlIvbzZRZ2NDVmd6bDdkWU9MemRiaHJ4UERpM0VJdnU4Y3U3Q0J5TGdOekJ2?=
 =?utf-8?B?UzNacmN4SlozVVJ2L051TkNQNTFKYlVUVjVoTGJTcUhOWEVURlNDcUJsQXF6?=
 =?utf-8?B?K0FaU3p5aUpjSkw3Z2hLd0pTejBRZHVBOGVGYm5DUVY1T3psZThacENrN2pz?=
 =?utf-8?B?MDkzNmpnSW1QeDZwWVFJdVZTT2JMUHFJWmcrM1plTEtrbXJ4Z3dJdmFzQi91?=
 =?utf-8?B?eEtJU21aaWQzUDVQWFIrZTFIUFdnaDZhQy9jUXJaOEo2U0lWWmlwZUc2WVZ6?=
 =?utf-8?B?Ump4THJPVG5TdWk1cUFnMVJvS1FiZHA3ZG9SK0owNDZaRDBITURoQ28vYlBG?=
 =?utf-8?B?SHR0NzN3UHBDTzJBZVdqVk1aVVNwV2NMcmJuVW9vc0VYeHNQUlNTT1o0RXZW?=
 =?utf-8?B?OEl1TnhMRG5yVGZ2RzBzTHNpVHA2RVgwZVNsQkc4N2Q0QWtkb2NEU2JlN0VC?=
 =?utf-8?B?amxGa3lDUllJTFFrNXgvUmVHUVdMTkE0Vy9VYzNSOWRSOXFNVjZIZmplMHdw?=
 =?utf-8?B?ZDVkcjNEL0pOa3BZTGk2bk1aTUZ0KzZ6cmVieG5tSUVzaDJ2bWNZTG12c2xB?=
 =?utf-8?B?eFlYOXo0ck91NlZDMm9SWUVlK3ZZVkttdjJWbDRIaGF0dHZmblRjdzhiMFM3?=
 =?utf-8?B?aXAzazZqaWVERmNzYUJpNlJKeDI1MGhrdUtWNTRXTXlFNGUyUFRWZDlCSXk4?=
 =?utf-8?Q?L9Xtgj67MC+ybcDy9SjdImwoAY/FDfQQgs8NgMT?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13d70335-c9c8-408b-b4fc-08d91e9d89cd
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 10:20:22.3822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XXKY/v9q6d4HRZ8LTHDEb12j647QEWofjzMo1FUkYsP2VV10y9tE8nF6oJb7sb+ySQoGRKtWORx/Hnqi+AE1qoNcZNorhNrn3gYpfDSj4WI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB3070
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

On 24/05/2021 17:06, Ryan Chen wrote:
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
> Hello
> 	Where the bus->base to be remap?
> 

Hi Ryan,

In "[PATCH v3 6/7] ipmi: ssif_bmc: Add Aspeed SSIF BMC driver", the 
->priv is retrieved by calling i2c_get_adapdata(client->adapter). And in 
aspeed_set_ssif_bmc_status(), call the exported aspeed_set_slave_busy() 
using ->priv pointer as code below.

+extern void aspeed_set_slave_busy(struct i2c_adapter *adap, bool busy);
+static void aspeed_set_ssif_bmc_status(struct ssif_bmc_ctx *ssif_bmc, 
unsigned int status)
+{
+	if (status & SSIF_BMC_BUSY)
+		aspeed_set_slave_busy((struct i2c_adapter *)ssif_bmc->priv, true);
+	else if (status & SSIF_BMC_READY)
+		aspeed_set_slave_busy((struct i2c_adapter *)ssif_bmc->priv, false);
+}
+
+static int ssif_bmc_probe(struct i2c_client *client, const struct 
i2c_device_id *id)
+{
+	struct ssif_bmc_ctx *ssif_bmc;
+
+	ssif_bmc = ssif_bmc_alloc(client, 0);
+	if (IS_ERR(ssif_bmc))
+		return PTR_ERR(ssif_bmc);
+
+	ssif_bmc->priv = i2c_get_adapdata(client->adapter);
+	ssif_bmc->set_ssif_bmc_status = aspeed_set_ssif_bmc_status;
+
+	return 0;
+}

- Quan



