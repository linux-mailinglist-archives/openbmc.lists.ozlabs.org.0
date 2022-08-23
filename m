Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A1359D48B
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 10:28:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBj6n60qxz30hw
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 18:28:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Rer1UV0K;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.223.112; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Rer1UV0K;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2112.outbound.protection.outlook.com [40.107.223.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBj6D6Y4hz2xHD;
	Tue, 23 Aug 2022 18:28:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGOw57Kz04rFiFqeZ0WiWqWXoGDOgdJyR3wxr8J+wlIN5QjnFfUPcrmspfRq9okKNbqLfOJSXLYNVlDh5dXskeaKtPAD790T6KlrMop/o4+YhWl0qO95IA6oZtIdWUNY8raJwunY/+fG2cOdCcmRC+ebmBMGs/puak8OI25i/+V/JhvzmmKop37qflS8LWxqb9QC63KSGivoPFnd1Iv+Voehz61j4nDDy1SAWX+lD0MMffod4SqgMYcPwvVApYdO4WK6edkWdeNNhhK9wK6+ONXEU4i9u00oGjkW+rPGVt03tkVJ932YWnPrRbfG9Ksfy/JtHUQzkqYpoBQeCZFArw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0/PBCUD4f7PaS4J5lj864PteHQGGmeAj1+g/EZkSBs=;
 b=BkmG7UAVdcGLQQBDTXE/mSc/aUXSxCHcgn3kRyV8MVSQxmCbjPLgHFrY8lQfjHTXrcqwvtqCwT1fYlYrPap/f+mEKnFSXJrxalvhj7VeVmaG8qaKm1aeyLPiSb6ZlbKAczrgboQPNZatKdOrUxL26vuTnG/TaMl8ZxCbf/6JbXwZnHn4cxWb1nU1Tl7RZqsZbXs1T3e0WIGRAka20PakqNn3o04vtZqRqxDtqX9sgkvrlxkzePnbaA/Iug6Wht2VeaP4dWt/p8zydYBkw/gR9+TuuHWEq3Ev1Vm47BN16cNSRmP7ddejTxLFHIbsH6pyDoFpd0Rrm0w2XV5l6unCVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0/PBCUD4f7PaS4J5lj864PteHQGGmeAj1+g/EZkSBs=;
 b=Rer1UV0KidrzmnVbnIqEmoVqFLpunyyREg5UaMDXzfrJEwEPxGpdUngGh47clKmHdYLb0CRcxwFBrUvKt8RxKAbjQDPVIPlL0lTWYOhpcSZUrxaOCx4XhSK8RZONiDcWVYJ5CPmb+UCKJ50MQOQIQXm7nciXWEkHCXC2aB/uvSo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BL0PR01MB4788.prod.exchangelabs.com (2603:10b6:208:7c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.22; Tue, 23 Aug 2022 08:27:43 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::48f7:ac49:a2f8:614e]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::48f7:ac49:a2f8:614e%5]) with mapi id 15.20.5566.014; Tue, 23 Aug 2022
 08:27:42 +0000
Message-ID: <673e200f-f458-7866-f956-3d5bd7160a49@os.amperecomputing.com>
Date: Tue, 23 Aug 2022 15:27:32 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Add device tree for Ampere's Mt.
 Mitchell BMC
Content-Language: en-CA
To: Arnd Bergmann <arnd@arndb.de>, Joel Stanley <joel@jms.id.au>
References: <20220817071539.176110-1-quan@os.amperecomputing.com>
 <20220817071539.176110-3-quan@os.amperecomputing.com>
 <CACPK8XdDpG3ONM1=-E6qvHL1FgMNWSMPoL_sVGJK6BmmnT3w_w@mail.gmail.com>
 <CAK8P3a2LZKfZpdTQ-R4o9mJ6dk52VRF+Bxj=PJEx-1MA4yH8+w@mail.gmail.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <CAK8P3a2LZKfZpdTQ-R4o9mJ6dk52VRF+Bxj=PJEx-1MA4yH8+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0064.apcprd02.prod.outlook.com
 (2603:1096:4:54::28) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab534e5c-b2c9-4752-9119-08da84e15901
X-MS-TrafficTypeDiagnostic: BL0PR01MB4788:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	m0W9LgJOyHuBe9H8ZxAvuCfhi/vrXN2VAIt0d4L7MJAoOSJGC9Qh9Y6nvpI1XEzKEV7Goyc3rjGzrHITqs/eDcvZ+vQaejDHdYx5hmDz2pP/+QmG9Zf1FOhKMnNheU4BboC2m46jbJEY1dHSIzUj2yrVzZhgsgXEr8nwVebnjeY92H1/h01M7mdDStTktkY0LYfGH/TlQF7FWUQWW3ciJyxo7kQpuWmig2V//5FwHD9U0lA3xf2toDzIfvMZgY17p4Y6LvicTKmVIOM8dCPqq2aHvh1sZKCIxQ9X/2Iaj5B1SCFJtb2xWYTHc1m2n+LtQOGbz903jxY7N9bRuZmOU4U8m+3KYUWNeT2Y/AeLnDDRJscg/Ti2PPbCKDfh6YbQDeQrDJXjzL3pGgxI3Cp7rD25zWX5tHbAtdpWjRlqmppVDb/fCMlLzX9wuZ39gzZaKtm/8Ov6+02T0z+maLv/GeaTEpmu9T9Y54XVgCGpxkuqFgXLeyNGu5JdvTl3+NnD00pYN+ZZPsK9Sub9om+t9XUichW/9bqQAwSWfwfov2I2JzO5qv5gN3t62VBK18UK69zxIcp3bXvNEsmu5xMO2YgRTG99jQ06yEXv/5V+5ypuS1irsxDmmF818EcjmoR+OeflVlqbw23bSyxQ+NhUl0OGlQBxCIYUxsPvkE8KmPTA7Dmn2D9xffEJ2+jW5X98ptRQU9ZcLsHFe7BtPinUK+arRVdxJclKYAvn+C23i8GKMheglB11Rs2tqxazwQja4EmmmO0YYmp/Y//6fO9IuzEXRMIuXgWHaPDJPd2CnXg=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39850400004)(366004)(136003)(376002)(346002)(66476007)(4326008)(66556008)(66946007)(8676002)(54906003)(110136005)(86362001)(31696002)(5660300002)(7416002)(8936002)(316002)(2906002)(31686004)(38100700002)(38350700002)(6506007)(6666004)(52116002)(26005)(53546011)(107886003)(6486002)(6512007)(478600001)(41300700001)(186003)(2616005)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?dnJEeENLZkhoVlRnaU00MkxlQjFNSDcxU0hmTUhMdVlqbjl5NStMTHZLMXVY?=
 =?utf-8?B?RC84aUdrTnhJR2VoSVZRb3pqYWZxSFBhYlhyOUp3dXVqR3l0QU5qY0o1MG9u?=
 =?utf-8?B?L05RalpOVjVpcmpDTUdXa3Y1cGR2VFpWSGloQzEydTc3b0Q0ZTE2VFcxYlF3?=
 =?utf-8?B?SVVON2phYzdYc3VENDJ5czRGVFJoSWlFY3E5QnRwTDVDdm5SbnFXZlFxUEdm?=
 =?utf-8?B?Q1RzdlQ1VmM2VTZKUGViUDdqeXl4dGdBK3R0RGphakN2YUNMd0hFdFR5ZWpm?=
 =?utf-8?B?TlNjbGtHSGVIakxmeHpxamxpck9zbkQ4YzZuNHltaEk5K0VJbkQzWUY5cExP?=
 =?utf-8?B?U3YxMkNJU25ub0d3cFRiWGZjZDdCTVlXT2RIbkw3SmJub01sTnJFRCtTa3ha?=
 =?utf-8?B?Vjk4WDQ1OFhCTEVSRU5QOGR1UkpOYWlodFk1Yi9kUmlJdS9pWmdUOGpjcjRs?=
 =?utf-8?B?RUw2eS9tUHdxaWF1bnJUbkVIbkh5WmJiQVIvTFJ0aTY4UzNVSDl2Vlk4bmpX?=
 =?utf-8?B?OHU2ak9xSHBXUGFkcnphVGpTaWJpKzdOUVVDUFRleUtvbkNUdEFyZ0VDdjIr?=
 =?utf-8?B?TTBpMmkxY1l1VkxIMW1aczJWVWN1M1FqMkVtazE3SDBXNXE2YkJpMWpKSDM0?=
 =?utf-8?B?R0ZERXpJVHMzMk1sZW5pbnQ1OW1ZTU1nQnM2bzBaamhFS28wRWlSODZNdXJB?=
 =?utf-8?B?bEhvME9YTHhTblcyNURRb20wM2NOVEw3SW1RaC9sa1QxQ0RWektTdEluY0dV?=
 =?utf-8?B?UFdZdHhwMXVSZTRjWllzbFhxVjlKR2lmSG1ieEY3TzJPK0xha0RSeHpMMEl5?=
 =?utf-8?B?OElMdm82SDBPWVpoVVIyWCtpQlBkMFFCakt0RWdiTWV0REhqUGhkdWFPVCs2?=
 =?utf-8?B?RVNFQ2ViOFJHRVdHZWlPbXdpOEtxRzNvb2MzcU53WWtTUXNLVXdPMVVnRWpx?=
 =?utf-8?B?YVFKUEdLeUNyTFpOSTlpUHNtYU9PN1NmSUVaSVd1T29rZVlEbnNvOFMwLzhp?=
 =?utf-8?B?T29TODdsT1gyY1NMa1VJcUtaYXU2cVJBRjhUSzV3TEdMcmFoWUE5ZGlYSGs5?=
 =?utf-8?B?dEFDSFJrek5ZM2pLbjRwZGZkalFPdVE5ODdPTlB0aVY1LzhlMGdUQ2pmTGor?=
 =?utf-8?B?dlRZc1I0V2tiT0xIU2I2T0hlTk5UakwxL1IxdEVlbUl0N3NaRVBYV29DallQ?=
 =?utf-8?B?V1NXeWJ6SXh5MSs2NzVSK21ZSEZqUk4yNWs3elMxV3FlZGQ5R2F0U2FCbWxH?=
 =?utf-8?B?YTk2TXFVMXJaMkRwR045eGdMQUdZRWxvN1ZSU3pJT1R0aDRXaXljRWlXVU5W?=
 =?utf-8?B?YWlkVGZnUHFRbE1aYTRTYnEwRTloY2cxUlNaUXYreXVKS201ZnAzZ1VwV1Rr?=
 =?utf-8?B?c2JrL2t2ZlFmNkpSL3htSHlBWnlBSUxRLzBLdjJyYU5ha3F0Zyt4eWVvR1Vt?=
 =?utf-8?B?a1RhQlZmSE8rYWpjMXdxdVRiWmVYUmxSUm1DSjhsRHo2VDZ4cUY2aUlPWC9p?=
 =?utf-8?B?SHBManQwYlBqT25GOFZyNEN6MUF5ZjYwYnVycXBZTWlFNkZYZkMyK1RFUWlv?=
 =?utf-8?B?WEh0bGluYmxUUWdFbkdhRmpOS3NMNUs0QzRkbU1hYnVDR25qc3JYaFFveW5S?=
 =?utf-8?B?c0tRTTNsUURMUENnMjZQcTUxOXhLOVJDbXp5M24rdmRWVU9STHFtS2ZjMm8w?=
 =?utf-8?B?L2FwWkJwMDhJKzJNRXlaNUNOdGhaNU81RTM5RldtZVQyVWcxcmJlK1dFUEZq?=
 =?utf-8?B?L2U3UXF5WjExRnFtdjF3YlBwa2J5OVR4Vi9ITHJ1K3cyV1BvSGV3SXg3eG5k?=
 =?utf-8?B?alhpNk9XVTJqN1JDVUdWUjJtVEpEOHZ5emRROERTRm1hc1o3TExIRmxEb2lk?=
 =?utf-8?B?cFNRQ3ErNTU2RFJTdnJlcXBPRFJsdnJ1U1hyNGIycVo3OHY1TWhxN3ljeFdW?=
 =?utf-8?B?WGo5R3RncEhCbXczZDVRaXprVURhaVpPbWxOL0x6WnYvWGZ3aDUvQng2eE1t?=
 =?utf-8?B?Yy8wZmdCQ0xPc2tHaDY5UnE4bGJNdVJ2VW5SQU9SanM0SlhRTFlJOG1GcUxF?=
 =?utf-8?B?dkxUdXRqNXRvL0lqekJGY0tFT3gvc0YxOGg3WFI3OS9vaTBDUFgvNFhuOWxG?=
 =?utf-8?B?c0lKOXpvWVM2cjRYRm1pNGIzUFhZb2VyZk93cFIyU2FyM0t6cVRmaWVjVHNo?=
 =?utf-8?Q?nXO2EXhn9RkzodNqpOwejkk=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab534e5c-b2c9-4752-9119-08da84e15901
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 08:27:42.7284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vBMfKqW82urWFPOfbA5dIMzFRFI5zq96iJEO5u9PiX8KydJLRNpBtSeRj6SQT5SWz9kkxO6jczjD0uB5bC75N6jQOWnvUhGQAd9BB0BVrk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4788
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, thang@os.amperecomputing.com, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Olof Johansson <olof@lixom.net>, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 18/08/2022 19:06, Arnd Bergmann wrote:
> On Thu, Aug 18, 2022 at 9:33 AM Joel Stanley <joel@jms.id.au> wrote:
>>> +
>>> +/ {
>>> +       model = "Ampere Mt.Mitchell BMC";
>>> +       compatible = "ampere,mtmitchell-bmc", "aspeed,ast2600";
>>> +
>>> +       chosen {
>>> +               stdout-path = &uart5;
>>
>> I know you've been told by Arnd and others to remove the default
>> command line here, but without it your device tree fails to produce
>> any output in my tests:
>>
>> qemu-system-arm -M ast2600-evb -nographic -dtb
>> arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dtb -kernel
>> arch/arm/boot/zImage
>>
>> Without a working test, I can't tell the difference between a broken
>> device tree and one that omits the serial device on the command line.
>> Can you work with Arnd to come to a solution here?
> 
> If you use qemu as the boot loader, I think the expected way to do
> this is to use the "-append" command line argument along with "-kernel".
> 
> Is there any reason for this machine to be special here?
> 

Thanks Arnd for the comment.

I think adding -append could solve the issue.

But as the bootargs still exist in all other 
arch/arm/boot/dts/aspeed-bmc-*.dts should we still keep bootargs for 
this dts?

Thanks,
- Quan
