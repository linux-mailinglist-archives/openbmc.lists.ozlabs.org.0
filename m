Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 806E654DB83
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 09:26:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNtyR3Fhsz3bhq
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 17:26:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=hpolDLks;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8c::705; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=hpolDLks;
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20705.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8c::705])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNtxr3G2pz2yb6;
	Thu, 16 Jun 2022 17:25:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxgOA98wqiwKRJtZr+RWqwn8ZLSczPPs4DVWDv27zQBy/YGBVSEKEnPRv1g9PZVR4wrBpfHsWqnGbVRiDRdYUG4J1Wbr3MxOag39Cjscrld4lRhitH9pW5EpSGLsNuKmzHU7S/nQr9M//CHNsDHu/wiSvHJQQfhJFbtK0WpG6iZ84Bjr3Vn5qw+wa/W1S+oPLXCa5PlBE6mT6+am/PCmpo9PNOyyOxxwpT0JKf5pWJB8nn/YLdCXwdbcZnxFbdXSRpMSDYl7TQ6k1Gun7RniVSo4/qcFJdXFl8Rmi1Q5x4d2YcnLuv4BGGEFNLQMx5Rb38NXnTMJczcLlHtT40+DfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=juL03iFifOER4WNSwG2f9nk/iUpcJR7GEWZctOjcjvE=;
 b=XVEkAn0WiH5yWmk7QBRC4jbYkvm8/K/K3onlUhifnu82PzAqAGWr+hr87UyjDECrbPgdU7LKVbN3AKmLfmUD+SbFSamJiswFEU38U2rvFUUtMf0e2uoHYMHJsrCASUkEAFBgfMK5gQLDUsgUQGek09gpt18+DeouBXvr7NuCDqjdfgbzs335sZl/CpUmxBbZXcl/e56TC0QHAdMu+ZVrfjy9KHIJhFpweUiGlLndE5f7qLbXRPj/LIlMDwW1ConTbZgOMKZ7yqkBocoIK77A+CgQ7lcUTI74w6iwHPnug33xlsUDmQ6Xyb33mIq4YQVe22QM1ddAQtYg3mkSZQ40kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=juL03iFifOER4WNSwG2f9nk/iUpcJR7GEWZctOjcjvE=;
 b=hpolDLksv0lrRWI49wZqokpQ7WlcwyrVTrfgvhe3IOqbUAG1gxIEvKZLiBh00/HA5Odx+Dki4NyV87I6RsnPH/WDeqFwEUj4WamQx50VOEQnu9xV2xAZTWDl7nqZirMMaB/pZCvwgscxaz0Qcw+fTqQnePXlGuRFHTNkfrGpGyw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 DM5PR0101MB3099.prod.exchangelabs.com (2603:10b6:4:35::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.13; Thu, 16 Jun 2022 07:25:28 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e%7]) with mapi id 15.20.5332.020; Thu, 16 Jun 2022
 07:25:28 +0000
Message-ID: <74f94464-a095-f539-746a-853b8f1d52ca@os.amperecomputing.com>
Date: Thu, 16 Jun 2022 14:25:14 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v8 1/3] ipmi: ssif_bmc: Add SSIF BMC driver
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, Corey Minyard <minyard@acm.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Wolfram Sang <wsa@kernel.org>, openipmi-developer@lists.sourceforge.net,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
References: <20220615090259.1121405-1-quan@os.amperecomputing.com>
 <20220615090259.1121405-2-quan@os.amperecomputing.com>
 <8b7841a9-9313-b1d5-8a80-a65cfa8e7b4d@infradead.org>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <8b7841a9-9313-b1d5-8a80-a65cfa8e7b4d@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2b5dd06-411f-4af8-2289-08da4f696319
X-MS-TrafficTypeDiagnostic: DM5PR0101MB3099:EE_
X-Microsoft-Antispam-PRVS: 	<DM5PR0101MB30997BE749C4327A2642526FF2AC9@DM5PR0101MB3099.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	rCDr4GoEGWY6xcAr4osEC84FQckrC901gIwmqM/CuD6PxKV+l8njNSsAivA9qqM4ZZgxopFDnEgwVH2TqidWA6Eu19Xj6HSKx0rZYAbxBNHdgjgqhlANPbOQMOzSeCmWlp/we3rt3AL3cJa7AcV0ZK0uQCgtr7EUHpruQZFTaDkbTskqYZrVgZQ6CtGN5nWn2CvoBJsmDkIGtUt+DszFTILxLLlFgkGMgqhkWrZZJDfVJjWKUUwbrAdn8q2Djng/WKJDgtoR7IbjwHl6+8gPkxwJE3JHvsVHrneOmNwBzqG4vWYawa1nzoR7Okm34+57EbFHJZyzYDwcky/16bkQIWz/x+yM9MB/7FS9TRy/VsgLTJf/pr5s3CwcNsmnDTqjkDWcDzcm8AoedvhgZ5kRiz2kArKGMXoqpaSARvDOuVFusIMxjGTGCRmzK7PrL5Pl1Xkgb2evFwMlE0m+w8FdzYiE4ScQyqYa3w1B01QMTFPTPA25zG5aOcd41KmeKUjlzgaZbPo1UU+Mh+M5mxu2/u0AXmmzMrWqQlj0a5ASYisBVROZEfoxdKqC5/7WmqWi+/I5oxnpdWUNZcMAUt+bz/v0pMix53WdRm1XB4rb27AL96aOo7oYgVq1ls/Ot21S5B/lGDWta9b48EaC0ST7HmqgX8uySU0wBFFocp1CRvzGwL2aN4/rKo3cBH6rsv+Ro5gXSzagrL9zoSFPRShwBEQkO/7CxyVbpDF5Z9X3pzrts7s7LpYUW7I8MuhSf0XV
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(7416002)(8676002)(2906002)(6666004)(8936002)(107886003)(5660300002)(508600001)(316002)(66476007)(110136005)(38350700002)(54906003)(38100700002)(6486002)(921005)(66946007)(66556008)(4744005)(4326008)(26005)(2616005)(86362001)(6506007)(186003)(52116002)(31686004)(6512007)(31696002)(53546011)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?cHRVZlprSURSbk51TEdObnFhczRaL2tuN0F2TkF6Y20xMGllNE9yWVY3dXZw?=
 =?utf-8?B?ZXFUdFY2Y3BMNTdjb1VINjl3NVdSL2l5OWQ1RGM2VGxVV3ZFUCtXVGtvQ2th?=
 =?utf-8?B?Mng0ektoejIzVlV5K0hTTllFUXphY1ppQ1Z0dnJ5Z250UHBDZVVhNE95TDV3?=
 =?utf-8?B?RTR3b0VxRmxpOWpRVko4ZFVaWDlyZFE4clhyaHJtWnZEQzZMd3Y4UXZ0MW1M?=
 =?utf-8?B?M0NlYnF0cFFTMFJMaFN0VUZGYnY2NEJ5NlROU0pYUW9TeTlMbnpTaHhyNjBB?=
 =?utf-8?B?alpiNjNMNCtZRk9lTm9YUUVReFJOYVNkSCtmdWZjSlFlZ014WXBHdWhlc2xm?=
 =?utf-8?B?V3BCKzJ5L2xzbGJXTGlsQlRlcUxEN3MrSW1GU05CS0crckZkLzVBTmNrOVpW?=
 =?utf-8?B?S2cvOGFJR3d0VVdIOTVDY0k3QjA0dlk1RmhaZTh0UlJvOGZnZGFPR21tRXM1?=
 =?utf-8?B?VW8zdkJzd3VaYTNWaTRIOU5RRG5NOVowV3dZTThRaVBNQUJwbWZaTlo2NlVV?=
 =?utf-8?B?U3BzQ2ZiMGM5L0xYOEFtdzVSOTIrRDB0b2R1TjY5SHdDSlptc2FON1huZm42?=
 =?utf-8?B?bTFja3hGeEtWWGNVWHVhUXFNd09YUUVVd2gvT1BjOEsyNVJSa20rUk1mV09G?=
 =?utf-8?B?b29CSUF2QmtPZ1BLWHM1WWt0YitzbEVIR2RUVHQ5NWlTNzliRUxVTXU1am9Y?=
 =?utf-8?B?RkV3eEM0Z1luaG54RUpmSVcxRkJzckdLa2RzaEsyNkdNMVNYNzZwY0NHUjV2?=
 =?utf-8?B?NUZvMVVHZUl0T1d0aGNYMEs0S0ZhQkQ0S2FTd0JjeEdMWTlMNmFTc0N4T2NB?=
 =?utf-8?B?d2F4S2N0Ri9HNE0vVUR1WjhjU0dSTmQ5aEM0QjV2eG84QlpodnNZU01tLzdn?=
 =?utf-8?B?bUluM1pjZjFCN2h3dVhMRXVlQXVwVXZIWlJCb3U3dExjSXRpaTFaWHJRS01q?=
 =?utf-8?B?NzhTbGtycS9Td21EdmozSVB3UmlSdXR3cUJIRW0wa2pPUzM3aVJ0aHhFakxl?=
 =?utf-8?B?M3VHSVUzeU1GbHNqZjFaY2VtZVJ1b0J0YzVpSGhiR2pCVmpweDZwaDFoRTd6?=
 =?utf-8?B?d3Zuem5IdWIwc0trdnJxakFPZWszZ2c2YVI4MUlzcSs0S1JWeVJVUlVKOC90?=
 =?utf-8?B?TkwvWGM4azlIMmdOZ3YzSkliVHpUQ2ViU1Y5cktOcGprMFBkeGhUMHBoVXd3?=
 =?utf-8?B?WlpVYndtVkZyMXBucDFRbEV3TkY2V0ZFM0w3YzlWcnJqdHkvREZGZms5L2JC?=
 =?utf-8?B?SkVOOTNDeUc2T3U4T2w3RzBLMmJEbmZjTVQydEd2L21pMVorb0twSVIrRGdS?=
 =?utf-8?B?cTEydWN5d20xT3JMNzh1UlAyOUxJUThwbFJ5UnE3M1p5SzNDNHJHWG1HRkc1?=
 =?utf-8?B?NlpWMUN2dm9Yc0Nyb01TSDJrN0hSMU00M1gwNnl2UEhCTWFrc0M2bnVsa1lP?=
 =?utf-8?B?dWZiRGhrL2s1THMwQXdUUjNZMlVoc2NlYmRwWmsybGtpam45YmVZY1F2YXpN?=
 =?utf-8?B?WFR4U1laMitDT2t3Ny9YQVVxODAzaEMyYXAvNEJXQ0YrUE9GMGtsSC9MWnNN?=
 =?utf-8?B?aTFudmpuVEllQnN1VHBKUzdNQm1LU2ZNRnEzZ2xOTmtQdXFOSVIrWFFGTzVn?=
 =?utf-8?B?MGxlekNjemNMM3dIc1lLVlRXUTZ2Ri9XV2ZONEx4bG56MFQvQ0s0OU1YSGtz?=
 =?utf-8?B?R204ZkwxdkFneGhJRURieEpROC9iQnFaUVZvNGkvU1QvOXcvYmlXVGFGWTZr?=
 =?utf-8?B?eE42a1oranpTMHg3aGpsaG01dVNFY2F1K0hpbjF5akgvbm4zU3lEQUdRWldu?=
 =?utf-8?B?SmVtejFFYzFDRFoxNmdtV1V6aVJRZTBGQk5wSVlEYjQzQXpROVd0Z25Iblp3?=
 =?utf-8?B?ZkUwQnh1RElJczg5SGtYWjVDYmsyTko1dytZOUQvaHNiSVlVNXR0RjZ5d3pU?=
 =?utf-8?B?djc0R2l4RWFMNHZlc2toOXdWMGlrU2xSSkNDUW5lSmRKN1RhdXlOM2tCNW41?=
 =?utf-8?B?dUVZV2cwanVYVG1QaGhRVjZFZ1dPVVRDUGlwQk5EVGRyM2RrakdTczUySG5n?=
 =?utf-8?B?L1RBcDZzZGdtTVFNcjU3Zk02WXBDY1RNbXJFZm03aldoamhCaTgrY3UwNzVv?=
 =?utf-8?B?SkJLVWhaWTRONVBDV2pxdkgrWFhJOG5XbS9vWUppZWhEZ0pZRm1QdXZjSzVi?=
 =?utf-8?B?RDZvemRyRlpOa1dLWDNaRnQwN09BQmpMc3FlKzBHNFV1WDdNNmd1Mks5WXgw?=
 =?utf-8?B?NkxPT3Z3VWFpMXR4eS9vOHowaThUK2lBS0NrdDJiRk56SXBjWVBFSnV4Yzkv?=
 =?utf-8?B?T3BoOVYxV3NWbFlVNnJuVmpBY3lZOWhQd252K0JOR1IxZUtWblRaUTNxZnFH?=
 =?utf-8?Q?5mJ4OwykjmaPoykPCj5JWBkixBACEIAmL3QXQ?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2b5dd06-411f-4af8-2289-08da4f696319
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 07:25:28.5025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hzt+lPH04neB8PYyFyXTzcpI8nmyCY7ht91kPxFKGQvOaXZwfhSz8stmHp/lF0hyM7pZMtEnHroljByX2dCHU9qItsSqGdUEt5xK+AsE0Xg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0101MB3099
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
Cc: Open Source Submission <patches@amperecomputing.com>, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 15/06/2022 23:06, Randy Dunlap wrote:
> 
> 
> On 6/15/22 02:02, Quan Nguyen wrote:
>> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
>> index b061e6b513ed..18a89093d64e 100644
>> --- a/drivers/char/ipmi/Kconfig
>> +++ b/drivers/char/ipmi/Kconfig
>> @@ -169,6 +169,17 @@ config ASPEED_BT_IPMI_BMC
>>   	  found on Aspeed SOCs (AST2400 and AST2500). The driver
>>   	  implements the BMC side of the BT interface.
>>   
>> +config SSIF_IPMI_BMC
>> +	tristate "SSIF IPMI BMC driver"
>> +	select I2C
> 
> No. That should be:
> 	depends on I2C
> 
> We don't select an entire subsystem just to satisfy one driver.
> 
>> +	select I2C_SLAVE
>> +	help
>> +	  This enables the IPMI SMBus system interface (SSIF) at the
>> +	  management (BMC) side.
>> +
>> +	  The driver implements the BMC side of the SMBus system
>> +	  interface (SSIF).
>> +
> 
> Thanks.

Thanks Randy,
it should be change to "depends on I2C && I2C_SLAVE"

Thanks,
- Quan
