Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDF65BF86B
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 09:58:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXW4l4nj4z3c3B
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 17:58:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=LGLXnCsJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.237.129; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=LGLXnCsJ;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2129.outbound.protection.outlook.com [40.107.237.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXW4747Ljz3bXg;
	Wed, 21 Sep 2022 17:57:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HE75CypWTribnqpqbjfBLfWwuM+icRKFtU3xEXh7EcbqKmkVhnOKGyyiM+7lzNCbqG7hpvWCarhp2WImoUI9LYaW7U1JbOZZbRoWznAwG0dQw3Xh5u6Xquk3IgTcfIwZU76XDwl/buMUBEkCoFzoIjC7Mv+uh3IKFghoReTf+U26whZEd1t1p7khMD0UPKeyWOIqTllG1vMwe91ydjGN32sxgccFPbe9eXiXB0QFxfD4MR6A7AxULpLZ34QCH4FeTbLiDQrUoSFwHqTPhsEM1p+SORqcl4HKoZtctW8eepce7gOMf5Xd3vI3p7jJPCqqrfCTpvDb4OgwnmfqgbzXfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rcx6g1DAG5UQalUU7Y0ij/TS+EPCQDGlkJV517EIp+s=;
 b=J23S8M38iEAM+5Z/riSVanzppj5ZqW243mUsQGFZ5zfrZwKkAh/gY2YKDUnAKJSVsLYOdZ5fEmOMYIdFmgYK3iJNkZNMnDROaRc4FOk5s9u8aiMyiDdXwaYaP4qEr6ahGGi2wxCaCnTce0Iiq/WNby9F7+YWSUh+gV3ILr74MtT593lPKy/3FM2oy8IV2/qGf0GHRyufaVgJn60HDHuJhfjZ04nYoHpxuND5X7em7slfOhJZMwkfLsf7j7dgazymszgpLIxGSjuleZqHN8Qjytk23YRnwqqYWNRKqG+dv1HvTz5Rq4WVlMF9WQdXwI9S8MMQXsZLd5yiPTgpeSeGNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rcx6g1DAG5UQalUU7Y0ij/TS+EPCQDGlkJV517EIp+s=;
 b=LGLXnCsJwUIEn2MdxNHhCDwgIhCZ6wWpsFxPp8hiix7uZoU++T7E3Ch8JqYAlb7uEUNLE30UtMQxweeO7tWyQ8XKSFMjAgDc6fdeuiJHURlF3mmR2EebfRZVrRFWgVEkIqPgB1gZ0SgAUOwt6Wn1TcDkh32O/Sum6cFAIZxX6WY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 DM6PR01MB4377.prod.exchangelabs.com (2603:10b6:5:77::20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.19; Wed, 21 Sep 2022 07:57:37 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5632.021; Wed, 21 Sep 2022
 07:57:37 +0000
Message-ID: <60188017-8f96-0773-7eaf-43d877f876b2@os.amperecomputing.com>
Date: Wed, 21 Sep 2022 14:57:27 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Add device tree for Ampere's Mt.
 Mitchell BMC
Content-Language: en-CA
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Arnd Bergmann <arnd@arndb.de>, Joel Stanley <joel@jms.id.au>
References: <20220817071539.176110-1-quan@os.amperecomputing.com>
 <20220817071539.176110-3-quan@os.amperecomputing.com>
 <CACPK8XdDpG3ONM1=-E6qvHL1FgMNWSMPoL_sVGJK6BmmnT3w_w@mail.gmail.com>
 <CAK8P3a2LZKfZpdTQ-R4o9mJ6dk52VRF+Bxj=PJEx-1MA4yH8+w@mail.gmail.com>
 <673e200f-f458-7866-f956-3d5bd7160a49@os.amperecomputing.com>
 <CAK8P3a3MU7shuBpcpRNC5L6xxQmSy8FXCX1jvYXhv-NT3PMYOw@mail.gmail.com>
 <396a3c24-2a86-0d1c-07f9-386a0de1d473@os.amperecomputing.com>
 <b34ab4d0-c14f-caeb-afde-01655b35a236@os.amperecomputing.com>
In-Reply-To: <b34ab4d0-c14f-caeb-afde-01655b35a236@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0052.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::11) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|DM6PR01MB4377:EE_
X-MS-Office365-Filtering-Correlation-Id: 42aa250e-6223-463a-1285-08da9ba6f30d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	nltj+pcHittL5thjtioupy+JLVdCQnr27vEgNBZT+bYP2x3w6SoZLuAxRXRANCD9JulTzQNq2X+Br2o9hUKSogrMo6pcPFmDAQWZepYCtjGAYd9qRruyQeQIxpAyK8uAIBOQHdLHGmJ52SIE5yq+FpaO0Q3SBKV5a9wvN+NfIxnUCj1W3BopfREcIcyYmkVJcAFZ+uyineDs+jcwHGiMczHpPBLdDHjULe/OjjUx2aGjGazFyHAX6gAnTpIk8LloL7xi0zJZxyZ9eybYI/VhOQoxW/YhSVBbNnIwnijodDDzco04vbweSb6bekW/pXp5WJ+32J/y+mMV5f4GUv2dv+L2jN79y5MsESRRStwD+ThI2wCrYGhDlA0IB91G5qDBPux2jhZh6sC6eOuiZw9OMIWqugils93nmDKtABmb72Lp7tpBCi/7R4YSCItBIfxiyPoI8DdQhEbv097vlsNecJZatDJFNYdtYiw7q2iT04KSUkddGL3oprwRrSAwwVMtVf4VbbvDA9FE3v8VSWmxLMJbEAmJbh3Cn7D//5GSuWvLfnRv58/lZuxAb8MdQgh9QiAvGrbnIXtM/MqzmF3nPQUqUmEENn6jO5ZwgQaxgLHfXB5FERBnCjZpKFQ6a+2j6GOFHsucG25V40zJOKkpvkvbLNEEZG8gDE6o+BsgHTbIJ9jrXpUo/k/Mn81NkDiSp6VrHDh82Qjblb/p/HlaeaS2rC8IUC+SeHVV1NJ7WKQ1/cMhgtyRV7ld0yzc6jhEF3xGmy64QCwIjgp+prPVIsqUf1VnjsVJ5ud6Go49DNQ=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(396003)(39850400004)(346002)(451199015)(316002)(5660300002)(31696002)(31686004)(186003)(478600001)(54906003)(2616005)(110136005)(83380400001)(8936002)(7416002)(4326008)(53546011)(41300700001)(52116002)(38350700002)(107886003)(8676002)(38100700002)(2906002)(66476007)(6486002)(6506007)(66946007)(66556008)(6666004)(26005)(86362001)(6512007)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?QWVmbWd3UkVzMDJ6eml5QVBYdWNuVUNZaXg2M0x2ZnhPekNWMnZ1ZW1OMXNV?=
 =?utf-8?B?NU9xQVNuUHJRQ0czTTlNdGlrVDJaL01hUlZUZFF1STRiaDJWZVlLbUQ1QTFO?=
 =?utf-8?B?Tm90SlNJQm5mWU9HVXNNVzFVMFdBdnFoV2s4R0htTFpRaVdsWDdiZHZuM1NG?=
 =?utf-8?B?Tkg4L2ZXSnNZOVhYZHBjdXRJNG0reVg3LzJ4RDdMeSsybG0zWktvRis0RFBI?=
 =?utf-8?B?TXZubm5DaTZWTW9uYk0zSEphcWVpVHRyak1EREZjendGYXRQSkdHRVo0YmpC?=
 =?utf-8?B?TVk0dXBlVm9OYzNJSjYwaGw0djliVzZ5ZFNtUlcwUzdzeFNYUDIwMDM1QllR?=
 =?utf-8?B?ekYzOTBqZEl0VEJHN3FSNDNTMTBZMTh0T0R5QzZLUWVIS2JjcHI5cmhTTVh6?=
 =?utf-8?B?OW1KMEJoV24yVitnNmRDZVZnbUlPQ0EvbWxnMTJPdlA2YXJUdDEvUjN6alRO?=
 =?utf-8?B?eW1COUN3ak8wNUhrN0F4aUh4MDU1ZHpZWlowS0FwZXAxSUd2OHV4M1g1QnlN?=
 =?utf-8?B?bVExV3NPSEYvY3dZVjAzRWhqTVRwemV3bTZwcVNEQUZQZThPdkhNUlhtQXdC?=
 =?utf-8?B?T2xYbUVGSmh3eVJWQU5Rb0FHNW83QVFvV0Z2aERtSjdIK0haTlRZaU1pYllV?=
 =?utf-8?B?bkh3RUswdHFoeHVhK1R6RDZZVytpMHpSZzR2dkhDNERjakVnOWhTTDAyeCt1?=
 =?utf-8?B?MlluRXJPTU9SVFZDWG9aemhZU0U3YUJXOFNDWTJveHNLMjZET0VzVUduemMz?=
 =?utf-8?B?c1FDeWlhVFpLZDYwb2o0aGJWRzB4Q3F3SFZtMlgzSTFTc1VFOTVBWFplQjhI?=
 =?utf-8?B?azdMaVQ4TzBVTEY1U2dOcndwZnlsbzBNL0lNRjFzeE5uS3owRmplTHpjMloz?=
 =?utf-8?B?SmF2dFFHV0w0dDBNN20yTFJjY2tzMkFaUWE0cmJpRm92L2pHS2wzeE5aMVU2?=
 =?utf-8?B?anlQbHQ4QXdhRGRBdUd2Q0RFdHVUQ1YzMCtVU0JWMFhjZi9uVC96NWFXK05K?=
 =?utf-8?B?ZkNvZzdXcDBxZy83SGtZcW45SG5JS0p0aHgvSDU2bjJXTmdDZG45WXNsL3I0?=
 =?utf-8?B?UTIyZndFaWVubGQ3bEVtd0RGK1dCRHpwV3ZmczJBNXByQllOUjNES1paanE3?=
 =?utf-8?B?ZnA0aWdLQ3E1elZhVnlLdXVrTEg0T2FTWUFaRW9BT04rSWRFdjg0QUp4blpR?=
 =?utf-8?B?SFB5akxNbW0zZkpidjcvR2ZjcE00QVV0c2ZXRE9JKy9wY2pGWHBTaEFuSFc4?=
 =?utf-8?B?NityR0tRUjFmZ1JsT0ZNaHBCRnZEcFNvVkVGaTVpN2NzZnhRdTdueHNTQUpw?=
 =?utf-8?B?Mk9KTDJxRHZjbEpTSGlRRkpqd2Rwb01RUk93andrSEcwLzZURG1WQTNCaTBp?=
 =?utf-8?B?L2EweGdFbmMzZitQcGx1SnZydzZYYk9KUlUweFFaNnVzMXVNMWdNaE1tVkZG?=
 =?utf-8?B?akNSM3dQQks0dzlPUW1QdlgwVnNqUGJ0ejB5eDZ2ZGdVQ21rV1p3QlpaNTd3?=
 =?utf-8?B?RkpPNWZ6R2lBSjVOYUlTanhvdjNWWURZWUd0VTRMQW5lRTlkRUpRMnVPejVT?=
 =?utf-8?B?WVA2azRFUFVIVEdURk5MZEZkQTNiSkcraDV4L1k4SmNRR1FQTU55emJzeWll?=
 =?utf-8?B?T1JLSnB1b3piejZ0MWU2dlJsdThCL0lOMERybFNxOWxyRHZRcGNkU2ZvMmZo?=
 =?utf-8?B?d2pRQ3Rqcm02ZmE2V2tNUW1ubjFjZUYzZDl3NWpPSGl4UnhmeFlzNm0vZ1Uw?=
 =?utf-8?B?cktJQkJyVXVIenI1R09JOTVsS2xhRDE5S0xJUEdVRXd2b0tXVjJYS0FjcmRO?=
 =?utf-8?B?RUM1K2gvVEUxZXdVVDY3c0ZCemNsK1JCUVdiaFhGTU0wNjIxN1RkV0NBRSts?=
 =?utf-8?B?bTdSNG11Rm5TT3VGTlJsMVJLNzhEWnNhNGVibVJ2dnNLMzQ5L280SnpKcEY4?=
 =?utf-8?B?ZGFTU0IyTThHS2lsY2lRYnVVTXBZdVVjWElhazIram05MHBGVktPR3FrcFBp?=
 =?utf-8?B?ZW9UbGRZYkQzbzZqdVFSbHlUaVRxZlorN1RUZTNBeVB0Q3RMcDFlS0tpSmFX?=
 =?utf-8?B?aUw1Mjcxb1hjR3ZxdU5xc2NncjRpZ25tdUV5WjhiNDdGZzljYk0rdTF5OHYv?=
 =?utf-8?B?dGNmZ2FDZUxrL1JYL1pyQnVGMEJjOGFUcSs1c2VCeWpzYTkyNDJkcTFvRk5m?=
 =?utf-8?Q?nqkKOJ01LnGodRQz/a/PbEA=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42aa250e-6223-463a-1285-08da9ba6f30d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 07:57:37.4536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WXvF3sPGefCPKceNTvTr82nIKhfb62LiXaJvMzqxvwuOeh9czV8ak3dJNDd5ojuAnnRIT/blvk4Vf3EyOxIJmNNMeH63kBOvA46lWQr42X0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4377
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

Hi Arnd,

I'm really sorry but I have to ping you again as I'm confused and still 
wonder if anything else could be updated to this patchset. Could you 
share some suggestion on what to do next ? or should I resend it?

The only thing left is Joel's complaint about there is no output to test 
with bootargs removed. I have tried and see it could be fixed by using 
the -append option with qemu.

Besides, Joel also says it "looks ready to merge" and give a Reviewed-by 
already.

Thank you and best regards,
- Quan


On 13/09/2022 14:42, Quan Nguyen wrote:
> Hi,
> 
> Just a gentle ping on the patch.
> 
> Thanks and best regards,
> - Quan
> 
> On 05/09/2022 16:45, Quan Nguyen wrote:
>>
>>
>> On 25/08/2022 19:35, Arnd Bergmann wrote:
>>> On Tue, Aug 23, 2022 at 10:27 AM Quan Nguyen
>>> <quan@os.amperecomputing.com> wrote:
>>>> On 18/08/2022 19:06, Arnd Bergmann wrote:
>>>>
>>>> Thanks Arnd for the comment.
>>>>
>>>> I think adding -append could solve the issue.
>>>>
>>>> But as the bootargs still exist in all other
>>>> arch/arm/boot/dts/aspeed-bmc-*.dts should we still keep bootargs for
>>>> this dts?
>>>
>>> I think it should still be removed. Only 238 of 2547 set the console 
>>> using
>>> bootargs, so that would make it more consistent with the other files.
>>>
>>> Changing the files that have the same issue is a separate matter.
>>>
>>
>> Hi Joel,
>>
>> In the meantime, I'm just wonder if you could help to test the patch 
>> with -append and get it merged.
>>
>> Thank you and best regards,
>> - Quan
