Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2062D393ADB
	for <lists+openbmc@lfdr.de>; Fri, 28 May 2021 03:00:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrmZq25cfz3062
	for <lists+openbmc@lfdr.de>; Fri, 28 May 2021 11:00:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=q4FUn6Pa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.243.98;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=q4FUn6Pa; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2098.outbound.protection.outlook.com [40.107.243.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrmZS3PW8z2yR7;
 Fri, 28 May 2021 11:00:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLXPvZguBtFg08MaNn1FONJg6hw0CGlOcrQAl/jKU4sKgBb6E3omYE0aBXf1b9qZLFEQD8QQemiwK5SQN+GSppIYy3N1pouR5eIaKB/pTfnUbQEAJfBO6wTwpo412rGlUBIuDO39vL9b538JUTxB8hWkXh3YWApQNtVuGReimA8cHpYIAFcVXx+b1B639Ffxk24WVDpd4LG8odjeNG+ocJkmW3XWZ/laRcCy+rRWF2zKvS22rFojzaYyDBYdsUDm1legiIMxa1sMV93ssijc5IH0DYvacpPfIhuMW7naT9oUNEUgqoHWaaXbNkhgwx1xnhixYaw13PcL7tmctR1FEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDn9iAFMjOMAlM5Xi6Jqz/Kmk5xMa6HKjiX/Vf5R+1w=;
 b=T4hgez9mFO3yeghmMiGOG8VIhf2Nq6Z81xV3crQ7f7ATEABBxBhbW8FNDCexl4uRIS38uHJFbu+mrooj0lJqUpl6Lo/oY5ocnOh+kTKK9Q8XQ7PjHCfWW69UCWsfI90qDc3ayf+TsK5spzZtBZ0uWKOCZH2VQygLtcCKRGXIs37yzHXQ+aL++AnfnHYJv66SsVNYxDVveuwsnDM2mx50iK5DSqRt8gbH/Am+9PRN1Bb2j7+8vDPKS9xDVTza9NiWean8fHEhEkAF/n7XEX+YvmEbfKpj4WjFsHD11IyP+aoDu2ntmBJkG909clXwCQAplq/zzFpw/jPo/D0Q76Ttuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDn9iAFMjOMAlM5Xi6Jqz/Kmk5xMa6HKjiX/Vf5R+1w=;
 b=q4FUn6PamUh7AvaNz83vBWSKfaDiJRna7P58suOuzNg8vTGzc/Ndka9E+TFCqtgB3KDGzhrwJKGRAcwCMWyyS2HyjWy6WsviiiSE7YXRjBdS1TKnE8uO3V+eQPCm4PFLVLwMj5qLV9cNdY7k4cczV610KmC2lzksW+6NIKCDMwc=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 CO2PR01MB2198.prod.exchangelabs.com (2603:10b6:102:10::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.24; Fri, 28 May 2021 01:00:25 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::1905:a396:9968:3a5]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::1905:a396:9968:3a5%5]) with mapi id 15.20.4150.027; Fri, 28 May 2021
 01:00:25 +0000
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
 <HK0PR06MB3380BFA9FD9EF8F51F9DCC23F22A9@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <3eba7d01-2507-17c6-2b27-7f1a7e286413@os.amperecomputing.com>
 <HK0PR06MB3380CCA6A264A6D0E6E462FDF2299@HK0PR06MB3380.apcprd06.prod.outlook.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <b39c7434-4926-4bb1-88d8-59c6464f3fb1@os.amperecomputing.com>
Date: Fri, 28 May 2021 08:00:09 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
In-Reply-To: <HK0PR06MB3380CCA6A264A6D0E6E462FDF2299@HK0PR06MB3380.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2402:800:623c:5f9b:282b:d89a:b291:5ff0]
X-ClientProxiedBy: HKAPR03CA0018.apcprd03.prod.outlook.com
 (2603:1096:203:c8::23) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2402:800:623c:5f9b:282b:d89a:b291:5ff0]
 (2402:800:623c:5f9b:282b:d89a:b291:5ff0) by
 HKAPR03CA0018.apcprd03.prod.outlook.com (2603:1096:203:c8::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.9 via Frontend Transport; Fri, 28 May 2021 01:00:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea143a87-bf0b-4016-3041-08d92173f9c9
X-MS-TrafficTypeDiagnostic: CO2PR01MB2198:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO2PR01MB2198455E558449CE699E2505F2229@CO2PR01MB2198.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rk5VS9hxAec1YMWxgTM6dYFueMpK+1brq3zNoPetNcMPzn59K/F4dMwKG/932uLy3xpcZO2MlIRvalNMJjW8UaYmSIHNtL9LyqY9BjVuAAHR73PSjEKiqtJIepycO5Jdf9tjR+FQZaMZg58B/CJS4rUYR6G2kYmxE0q6pzUEUef/YSFg2VZ78OfRvlEcvoz6YDJF+8BJ+U1HZ+GkAiWb7n8RQAkOQ/I7B9hndlDDfE5kVSkgOJPNt/8Fn/Qn7pl/BBEhaXIs/9Ji201DA+KNxT0cL3ZEkDv48PEgy6hnnAxCu6cXTmwvGHeLqwXFOydd3pjo7KIxY+HAV3bXyUGd+LKuxZWU7ITv37DAPGvVvFArR0RhEJUgoadNWpa1rKPlUP68oBBPKTPc/h6yJNbNkF4EmPKilYvlociXNRieOA8+jm4m1DYdCiQOsnTiyyG6HnWMINUUOPpP8FZkocNeaZqitQnYxE7x85bBht4vp8QlXJ3UT4Wl4svvjaC07EMdhLYjgW4p9gSYj4lkUwQzZBmR9kKEH3oybW/ZrXpME4f82quGJWQte8oYJ+rJPtr/WqlhZI2URrU8yFA6S3txXM+WMgVBO2s2COfUSbSgOAAbC3OnJn4Vy3So/gtb7B7OnHjXR43M7YQki8BwcJgNDFLW+uEwu0slbP0AI4pijJvo2BV4NChq1g13XdSkCdYzJyGTBePnq2lAn6PsDvJQaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(366004)(346002)(136003)(376002)(396003)(7416002)(31686004)(52116002)(54906003)(53546011)(110136005)(478600001)(83380400001)(6486002)(316002)(66946007)(6666004)(8676002)(66556008)(66476007)(4326008)(8936002)(5660300002)(2616005)(921005)(31696002)(2906002)(86362001)(16526019)(38100700002)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YWUzMmxpM2U4cUw2cUl4SWR1S1dvSnk4SzNFdnpTaXJnTTB4QWJHSVpmYVpK?=
 =?utf-8?B?V1ZBdUVJeXFTbTdSSmxrcGg0bit6aXdZSjlCbGhXdmxDVFFmQlV2THN0bVhk?=
 =?utf-8?B?TWpPc1RIYzQzL0pXUHE1UnR6T3V5QmFCVmdlazhONkdSSG5yaTFnMVhNdkJH?=
 =?utf-8?B?M0RKTU84WFhsV0VYVndNcVExTVhzR3JITmdoazVBclJLVEduZTF0N2JLODRi?=
 =?utf-8?B?enRpZUVwZUlnVTh6ZmlFYVZ3Rk9IWjJsTXVtd2EwVjAyY2tVbEJEbVZYWjRS?=
 =?utf-8?B?MnVnZnJZRmlTQ3MrSythV3lCOTdKRFBnV0JJZ3NHajBzUWZud3h2SkJ3YjJh?=
 =?utf-8?B?U3Y0WUFkZTRFNHpBbVRKcHBSMStiMzNpQVkyVXRYVGlQNVZzMllGd2kwUDdU?=
 =?utf-8?B?SklpRE5JcHRHN01pVXlkWFBoWDRsUll2UFVMdjQ4cVRRSVU4bTlqM0U2LzR2?=
 =?utf-8?B?eFErODZtRjhtV3VhRnY5cUFRMjA1YkRxd2NtdDVBNHMxWFYveWZPZ2R5M2NN?=
 =?utf-8?B?TGEyVGNoVEt5NEZNalJYR0Rpd3hxQkU5UEg3cVJRTnBwMGlvM0dyRjNZaU1p?=
 =?utf-8?B?ZC8rNjJZRzNuNjBLNS9BaVVpWHl0OUcxVkxwa05jQzkwem94amhxdXBQcEtx?=
 =?utf-8?B?WnFGUXFmWVdRb3JzVFFsQXdzYktkQWVLU1NwVmV1cE05dWJRVThSYXFYS0NF?=
 =?utf-8?B?SGxLK2hFODRuWjlRcnZVRnNPWlFTVDlEYVh5bHhvaStGRVlvTjExTVNRRlA1?=
 =?utf-8?B?Qkw1UHg4N2FlYmN0cDhHU2I1aFJudjQyeUNQNFo4SjlYT0RJRHpsRnRNTEcy?=
 =?utf-8?B?cjhOS3ZMZW1uWFE0KzhKMHQyMzVvRlNkSSt4VjlBTzVYd3ZRY0ZpZVByaDEr?=
 =?utf-8?B?dHZXNVBjZ3dDVHBmcnBUOERNNGRpUHpySWFJZCtrZzBpM0JFenQ0QjdYajNh?=
 =?utf-8?B?Y2F2bGpxMGIreS9kK0VrV3Yyb2R5cUNNZ29ZaHBMMndmRzhveXNnbWZHbENQ?=
 =?utf-8?B?SGE4VlRkNk1MalZvc0NHWkpDeUJhQ21lc0dUTUkybXd0c3NUaWd6WndURWQ2?=
 =?utf-8?B?SDg2Q25VZDM4eFdINGF2elV1TW5xY29mS2FNZWtKMnRCa0dNUG41Y2FMejlI?=
 =?utf-8?B?VUZzUTJSYnE2NmxhTm5JanFEZUFMZkR6aktQRUlrVDA4amFmT1h6SkJsSUN2?=
 =?utf-8?B?Smt3ZitxcllEeDhYME1ySldhOHBiRVNySTUrbnBWMW9yaDhSZU82SndaRXln?=
 =?utf-8?B?L25MR2sxRUdIRmk3THNHSnNsZ00yWTZaYi9pejRvSjZIVFVaTkd0R3F3L1g4?=
 =?utf-8?B?S3FjTk83K1ZhTUx2L1Z1WVNCbGxEUnZYQVUvclBGWXIxa1daUEt6K2pKU3hQ?=
 =?utf-8?B?MDZGQ2hSN0tIK3V5THZyYWxocFFiZFVMTkZERlNzZ2xNMGxSdzRNdE9lL1U4?=
 =?utf-8?B?SU1TU0ZYU0tGN3VZdFVQbnphSE5talhnTXVrSG1ZeHp2a09ZNzR4aUN6NS9G?=
 =?utf-8?B?ckJudEU4TGV1QzJGR3E4V1FOeHowT2FDbk4rcklsOVlid1dTcGdiS0c5OFZC?=
 =?utf-8?B?QXAxbVlKMHJZQ2NnMFJnak8vdDdDNGRQQnJvUWlxcW9qWnQ0UGQwSXBrVmZi?=
 =?utf-8?B?aFZFZjFnSmNNVmU3dDMzMSt4YnlRU3pwYkR1bStNU0tmZDdtMWE4eDh5OUVG?=
 =?utf-8?B?WUltajRKV0t4U3ZmdzNsRk5vdmozQVNta05uUFUvR001OE4wYWZkTFdPODhE?=
 =?utf-8?B?V2xxdWNjZ3lHL3FoYXEvS2lBcXp5OE4vVGR5bzRnYjg4S1ZxY0UzSHBRaDQ5?=
 =?utf-8?B?bkVZRFJQNThlcmgza0lyMkluSkQ4MFpCMitCakxEbjhkbEUwUjNmcjFNQWVm?=
 =?utf-8?Q?44PGJOmWkmBL3?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea143a87-bf0b-4016-3041-08d92173f9c9
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 01:00:24.9081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vVJabVf+RsS400jpaALiAK8RDhw01uEKDpxQv9pynsvMg8y0p39r1J2K6t+dsyP7NbFILX6sAm4mgnokOBin8i3P2fjWJD15uoOMSQRFkuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR01MB2198
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

On 21/05/2021 13:09, Ryan Chen wrote:
>> -----Original Message-----
>> From: Quan Nguyen <quan@os.amperecomputing.com>
>> Sent: Thursday, May 20, 2021 10:10 PM
>> To: Ryan Chen <ryan_chen@aspeedtech.com>; Corey Minyard
>> <minyard@acm.org>; Rob Herring <robh+dt@kernel.org>; Joel Stanley
>> <joel@jms.id.au>; Andrew Jeffery <andrew@aj.id.au>; Brendan Higgins
>> <brendanhiggins@google.com>; Benjamin Herrenschmidt
>> <benh@kernel.crashing.org>; Wolfram Sang <wsa@kernel.org>; Philipp Zabel
>> <p.zabel@pengutronix.de>; openipmi-developer@lists.sourceforge.net;
>> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org;
>> linux-i2c@vger.kernel.org
>> Cc: Open Source Submission <patches@amperecomputing.com>; Thang Q .
>> Nguyen <thang@os.amperecomputing.com>; Phong Vo
>> <phong@os.amperecomputing.com>; openbmc@lists.ozlabs.org
>> Subject: Re: [PATCH v3 5/7] i2c: aspeed: Add aspeed_set_slave_busy()
>>
>> On 20/05/2021 18:06, Ryan Chen wrote:
>>>> -----Original Message-----
>>>> From: openbmc
>>>> <openbmc-bounces+ryan_chen=aspeedtech.com@lists.ozlabs.org> On
>> Behalf
>>>> Of Quan Nguyen
>>>> Sent: Wednesday, May 19, 2021 3:50 PM
>>>> To: Corey Minyard <minyard@acm.org>; Rob Herring
>>>> <robh+dt@kernel.org>; Joel Stanley <joel@jms.id.au>; Andrew Jeffery
>>>> <andrew@aj.id.au>; Brendan Higgins <brendanhiggins@google.com>;
>>>> Benjamin Herrenschmidt <benh@kernel.crashing.org>; Wolfram Sang
>>>> <wsa@kernel.org>; Philipp Zabel <p.zabel@pengutronix.de>;
>>>> openipmi-developer@lists.sourceforge.net;
>>>> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>>>> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org;
>>>> linux-i2c@vger.kernel.org
>>>> Cc: Open Source Submission <patches@amperecomputing.com>; Thang Q .
>>>> Nguyen <thang@os.amperecomputing.com>; Phong Vo
>>>> <phong@os.amperecomputing.com>; openbmc@lists.ozlabs.org
>>>> Subject: [PATCH v3 5/7] i2c: aspeed: Add aspeed_set_slave_busy()
>>>>
>>>> Slave i2c device on AST2500 received a lot of slave irq while it is
>>>> busy processing the response. To handle this case, adds and exports
>>>> aspeed_set_slave_busy() for controller to temporary stop slave irq
>>>> while slave is handling the response, and re-enable them again when the
>> response is ready.
>>>>
>>>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>>>> ---
>>>> v3:
>>>>     + First introduce in v3 [Quan]
>>>>
>>>>    drivers/i2c/busses/i2c-aspeed.c | 20 ++++++++++++++++++++
>>>>    1 file changed, 20 insertions(+)
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-aspeed.c
>>>> b/drivers/i2c/busses/i2c-aspeed.c index b2e9c8f0ddf7..9926d04831a2
>>>> 100644
>>>> --- a/drivers/i2c/busses/i2c-aspeed.c
>>>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>>>> @@ -944,6 +944,26 @@ static int aspeed_i2c_init(struct aspeed_i2c_bus
>>>> *bus,
>>>>    	return 0;
>>>>    }
>>>>
>>>> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
>>>> +void aspeed_set_slave_busy(struct i2c_adapter *adap, bool busy) {
>>>> +	struct aspeed_i2c_bus *bus = i2c_get_adapdata(adap);
>>>> +	unsigned long current_mask, flags;
>>>> +
>>>> +	spin_lock_irqsave(&bus->lock, flags);
>>>> +
>>>> +	current_mask = readl(bus->base + ASPEED_I2C_INTR_CTRL_REG);
>>>> +	if (busy)
>>>> +		current_mask &= ~(ASPEED_I2CD_INTR_RX_DONE |
>>>> ASPEED_I2CD_INTR_SLAVE_MATCH);
>>>> +	else
>>>> +		current_mask |= ASPEED_I2CD_INTR_RX_DONE |
>>>> ASPEED_I2CD_INTR_SLAVE_MATCH;
>>>> +	writel(current_mask, bus->base + ASPEED_I2C_INTR_CTRL_REG);
>>>> +
>>>> +	spin_unlock_irqrestore(&bus->lock, flags); }
>>>> +EXPORT_SYMBOL_GPL(aspeed_set_slave_busy);
>>>> +#endif
>>>> +
>>>>    static int aspeed_i2c_reset(struct aspeed_i2c_bus *bus)  {
>>>>    	struct platform_device *pdev = to_platform_device(bus->dev);
>>>> --
>>>> 2.28.0
>>>
>>> Hello,
>>> 	The better idea is use disable i2c slave mode.
>>> 	Due to if i2c controller running in slave will get slave match, and latch the
>> SCL.
>>> 	Until cpu clear interrupt status.
>>> Ryan
>>>
>> Thanks Ryan,
>>
>> Do you mean to enable/disable slave function as per example code below ?
> Yes. it is.

Dear Ryan,

This solution looks good. I'll switch to use this way in next version.
Thanks for the suggestion.

- Quan

>>
>>           /* Turn on slave mode. */
>>           func_ctrl_reg_val = readl(bus->base +
>> ASPEED_I2C_FUN_CTRL_REG);
>>           func_ctrl_reg_val |= ASPEED_I2CD_SLAVE_EN;
>>           writel(func_ctrl_reg_val, bus->base +
>> ASPEED_I2C_FUN_CTRL_REG);
>>
>> Will try this idea.
>> - Quan

