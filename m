Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6BB38E491
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 12:49:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpYqZ2dNjz305s
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 20:49:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=EAFV1EUC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.93.97;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=EAFV1EUC; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2097.outbound.protection.outlook.com [40.107.93.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpYqD35Ynz2xxq;
 Mon, 24 May 2021 20:48:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OgSHIW665QOr9ECwBpoYrXNX6G/p72o4MCBTVsa/taEq62glYk7GevAmGFCoEvOHhAsJnqt1plYpGy9utoK3fVa87/hFOMbcxQnSvuOhbJspG2oyzZa59ws1Gfe8AIkIWLQG60Rx72eJI8//sKIFpr5D4/qjmBsBLAerTMCB3PZBJBxmZwbNxZYwLTspdWwU+N2XE6VjXCOZgemNQmMO3gQTdFW5R03voJh9h3zF/wPwPNmmTMraooV9GKKBUFDDLDcz/vF5clu9/8gvKaBRo/me1n+z5rLl8q06vyWhd2wenONkaMAE+vFG2rO6Ror66qDjuero7yH5sQbk933P4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brwWNJcuj78QpoWCn9TF7n2MA+rHQmFSdWsuiRUmVNQ=;
 b=ZLFK9dXkdHDNwXYPQD5cKTMnaQnUHVysxUj+vBSVZqi+6oEAvEQLZ3A23wyNSnrmQwXCp0Uo0VLwT5jVpfwK1DGRMTbFe2Jj/tAv9TMA9mZwgEUJLLRNXXiQTFc1JbifI54CAlMpK7eMVEm97RncXoqTkFo+ibRLCzLWDJ2uuEvtaySgjEFcoiyliXFz7z5yi5mt+77Q+gHvFsH7PXkheWSrnAPZljW6SA9BReazH3BfUsPysrSovKvBuhaqnN7Ky8zlfMNSR6SOYczjdgZO2zS8mfFAvfcLMGpPr+3jpKHy0wnFWR/8LTQBRAx8dmPhXyp76JxQjH9E3Au3bqOWXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brwWNJcuj78QpoWCn9TF7n2MA+rHQmFSdWsuiRUmVNQ=;
 b=EAFV1EUCHGX+UhnHHqcFX55vCvAsuSX4Jp337OEhC2yx4aoAx1tgdUIE4oMghRCLKvHrk2yMm2MkjHKkvl/HLroC6Bw4YZVe1/rQ2zvijNeHhXiW2t/gdb/9qaPZsVKpF5T1D4Pb5OWpjod5+Lm7bzanHnwkw7b6nXbqLZJP+gs=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW2PR0102MB3546.prod.exchangelabs.com (2603:10b6:302:2::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.27; Mon, 24 May 2021 10:48:48 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::1905:a396:9968:3a5]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::1905:a396:9968:3a5%5]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 10:48:48 +0000
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
 <1648966e-3e45-9661-c5dc-5ac2f40e2581@os.amperecomputing.com>
 <HK0PR06MB338093E5E0D0DBA9EA7C1168F2269@HK0PR06MB3380.apcprd06.prod.outlook.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <917237ce-98f8-df5f-32b6-b4145ac47ac9@os.amperecomputing.com>
Date: Mon, 24 May 2021 17:48:38 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
In-Reply-To: <HK0PR06MB338093E5E0D0DBA9EA7C1168F2269@HK0PR06MB3380.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2P15301CA0014.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::24) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.38.33.138] (118.69.219.201) by
 HK2P15301CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.2 via Frontend Transport; Mon, 24 May 2021 10:48:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1729d4ce-64bf-4f50-4861-08d91ea182d9
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3546:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR0102MB3546BE02889C8D457318E9EDF2269@MW2PR0102MB3546.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a4KBT2bMOKOnRf+5vv+o/DLJOtFpYgHTzhNvpCrdKFuAzE2q4xb/ZX5acZlmI88wl0i/wDcX6zcEWudFKo1XqMjYX9dBz+lI++BV0g+9hCjtB4YnutEQyiJNjpCRQfatReePf3telonl1bUae04hHl8q3CnAxpLVAh/GgC1uspwQ9WYusXHJ1Vh1uKmar8zenmYt6yYUFHeG4oTyt0PIvW31ee/os7HyyzUY6jaRl24RSkIbpS0X0oorP+f+3a1/140mJR02dzW9RFJEynkvnTtTo8mSwR7O5JYZQ26BUhChFIcN6uPtP8jqtS5YFvrrTy4zWkp9HOZMk+Jlxv0bJ+31IBPwXaMfGcCb2tQX/ugjKtxKt9oyvpee8uB6yo3wnCNqyMzTuXNrztg1acuR4WAwQugKXeEegHFpy3pZjbpwxflBGHBTg+3BdKTLnRKCAI7llH3HSmFCDyXHyxqwhqLFBago6MeplK9E6rUm+ODqzP2HxezyFhG7ZkOyvdPwJOSnbTV2kfZjFp2kGGqyv42+RX5pI5RGEI+p6tea8VMOuYRm24TY02zNRGTw7wW1omrkyo0RgrylaVziWur6LmsxtNUGHUy7VDjP5qTXnqag5FUbZImqDS1V2wVGKeyOy6npvls9MlDaJhZuq1jLGTR1A2qgehBvDru8c/K7KMcOO0268T+9yxjo8lCvwt4RSTdMhuJ0a7cmMkicSRI6abZ0GuxGoSvbKJeRVUZe4Hg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(39850400004)(346002)(366004)(26005)(7416002)(38350700002)(2616005)(66556008)(8936002)(956004)(66946007)(38100700002)(52116002)(86362001)(921005)(53546011)(66476007)(6666004)(83380400001)(16526019)(16576012)(54906003)(5660300002)(31686004)(4326008)(2906002)(316002)(186003)(8676002)(478600001)(31696002)(110136005)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YTFLVHZzMEMzRW5Xclp4VjhTTTRRV3pXUkg2eDd6QjR0VlRLNXE0bVdnTkhK?=
 =?utf-8?B?L3NFVGhKcEJvVWRlVTRzQUZzdkp5UkRmazh6Wk14WDhHNjUydDRZUEpYWDNx?=
 =?utf-8?B?RGp4WFJDTTRFVVdxOEVjM1VOenpJODQ4TDJKVk1lNG1oN0tBV1hUWGg3bkd3?=
 =?utf-8?B?NUV2MjU4eFFSMVorWklZeXc2M2htRWhYcldTeU1BRElJM285WnhtN2o3L1VY?=
 =?utf-8?B?b0VncVdoTmI1a0tpY3g0OFhKcjJFYjYxdFZnaWkzcjdUb2Ftb0c2Kyt6b21P?=
 =?utf-8?B?Q2hvRTIvYnVCQnVNdHh3TDBmYmxIQUNWVWc3OS9rdldXWitoTVVGZ2RmdndO?=
 =?utf-8?B?dXBQZG1KbEp5VHZ3bEt5Yy80dWJ3Y0k4M3lOS0haTVg0VkUvaUJic1Job3ZH?=
 =?utf-8?B?cGVoVFBrTkVGSlBQMFhoOXZXdDhPSk0xMkhCTnJzWmd5Mzkyd1BDbzFTSFBY?=
 =?utf-8?B?T0JXTlZLWW1leWJUeFd0czMrTkljWjQvczBielBLQlpvS1g3TWkwN21ERU5u?=
 =?utf-8?B?VTZGclZxMzJ5U3loemhPNHl4WU9NU1RDbVRhUmlaYWE4WXdyRzNBbmRCS2M3?=
 =?utf-8?B?cnp3YWFZUitDbVJXNzltck8ycjJCek9tS2kvSVdhZXpxb1pacXZIWGZTeUdh?=
 =?utf-8?B?YWs0WHMzcEpROGsyd0tOS2ZoVUtGTnFtanVLV00xU1F1bVpUd09GVjBjSmxQ?=
 =?utf-8?B?ZVRqSGk0VytIcGljSFM4UVFHdWdkSHZ6OHkxVmtYUzdPWmV3NW9Pd1JweUZC?=
 =?utf-8?B?bHQxNEdteS9ERUZVNXdKVEZWcmJVMTRnZFFJcmlEd2FjSDUzY3pyc1Q1UU9r?=
 =?utf-8?B?dEgvM1doOGJoWHZUcWRldS9UbEt4Z2granZyTnBQNnJNOVc3VEU0bUZwR2Zt?=
 =?utf-8?B?eUtMSkloZjZ6c1oxTkRud3NxaHd2QXZFcGhxUDVTSTRZNW9yeXdRNEJ4TVZ6?=
 =?utf-8?B?Yjc5bVMrcTJXWVBDU3VYYXpaWWlQQmNvaXRpUkRrdFZid2J2K1FUMjBocG5O?=
 =?utf-8?B?eUxNK2lWS2ZkQmpDVi9FNjZJL0tjY04xbk52UGpsdXVRb2NEeWl5OWlnNmNN?=
 =?utf-8?B?WldTTVJxS2tCcDVBVU9LWFU2aC8xZEErakVyTG9LRmFaYUdCWHJzUTNtTW05?=
 =?utf-8?B?SXUvcXpvL2svRy8vd05UTWRMR3F0OENrajVONW53RHJ0ZUtxbUR0ZjBVVFdC?=
 =?utf-8?B?N0FkS3huMjZlK0tDVDMxYzdCWVNkUG1HV3h6QnJUd0hJU1NSMm1PbzZFeTdP?=
 =?utf-8?B?cnRGVnM0Zms1OWdSdDVmbzRPdjZ6MW5MVlVieUgzeThGWk4zaDlTTnJXTEdN?=
 =?utf-8?B?ZTR0WFhzM1hZN20vdjVNL3R6TGNwOWsrdkhXL243RUFzUnhJSWRCM3h6SUdY?=
 =?utf-8?B?b3A2RUhjTFNUTXdnckx6UjZ6b2w1L00vSjNERUdteTBDaEs3QWljcDR5WFBG?=
 =?utf-8?B?dTNoOG5NcC83ZWdHSi91YTdJNWVEUFdXT1A3a0UzYzJ2UGg0d2Q4Sk00TGV5?=
 =?utf-8?B?Q0VEUExXOGxMK2FZdUIyMnZ4a0R0VjVKa0k1V0RpeUxKM2I5VG13TUhzOHZB?=
 =?utf-8?B?Uldqd1psWVUzZi9TWjRYamlPT1RDbWpla1pBRS9YTVZLWmJGdlFTSWtPNzMy?=
 =?utf-8?B?VGE4d2UyenVONmJINkhzcS9MUXJzK0syY0tiaXFJM2pFd0JuZzF1aXNKdHQ4?=
 =?utf-8?B?UlNlb1FFdnBJa2MvclRzcnN6QkJ6ek5ZMEM1R1ZlckNQMXBVWlh5aElDKzdV?=
 =?utf-8?Q?e2UZjERuR3JfnC8xzBzKsxbsFUDDSJuiELrkvyQ?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1729d4ce-64bf-4f50-4861-08d91ea182d9
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 10:48:48.7029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 54AZQNochgV0ywASIGMsxIcV0m/kVnwRGudASBNF5N9iHxtYSOSfNF99uSanVpr4JDtgS/f+/5Xi9Q2/3MF3jb2r1KsC+lrv7IdQGmh8n+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3546
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

On 24/05/2021 17:36, Ryan Chen wrote:
>> -----Original Message-----
>> From: Quan Nguyen <quan@os.amperecomputing.com>
>> Sent: Monday, May 24, 2021 6:20 PM
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
>> On 24/05/2021 17:06, Ryan Chen wrote:
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
>>> Hello
>>> 	Where the bus->base to be remap?
>>>
>>
>> Hi Ryan,
>>
>> In "[PATCH v3 6/7] ipmi: ssif_bmc: Add Aspeed SSIF BMC driver", the
>> ->priv is retrieved by calling i2c_get_adapdata(client->adapter). And in
>> aspeed_set_ssif_bmc_status(), call the exported aspeed_set_slave_busy()
>> using ->priv pointer as code below.
>>
> Yes, I see the probe function " ssif_bmc->priv = i2c_get_adapdata(client->adapter);" to get priv.
> But my question I don’t see the bus->base address be assigned.
> 
Hi Ryan,

In drivers/i2c/busses/i2c-aspeed.c:
struct aspeed_i2c_bus {
         struct i2c_adapter              adap;
         struct device                   *dev;
         void __iomem                    *base;
         struct reset_control            *rst;
         /* Synchronizes I/O mem access to base. */
         spinlock_t                      lock;

So when "struct aspeed_i2c_bus *bus = i2c_get_adapdata(adap);", the 
bus->base should point to the base of the aspeed_i2c_bus, which is 
already initialized by the aspeed i2c bus driver.

Do I miss something?

- Quan


>> +extern void aspeed_set_slave_busy(struct i2c_adapter *adap, bool busy);
>> +static void aspeed_set_ssif_bmc_status(struct ssif_bmc_ctx *ssif_bmc,
>> unsigned int status)
>> +{
>> +	if (status & SSIF_BMC_BUSY)
>> +		aspeed_set_slave_busy((struct i2c_adapter *)ssif_bmc->priv, true);
>> +	else if (status & SSIF_BMC_READY)
>> +		aspeed_set_slave_busy((struct i2c_adapter *)ssif_bmc->priv, false); }
>> +
>> +static int ssif_bmc_probe(struct i2c_client *client, const struct
>> i2c_device_id *id)
>> +{
>> +	struct ssif_bmc_ctx *ssif_bmc;
>> +
>> +	ssif_bmc = ssif_bmc_alloc(client, 0);
>> +	if (IS_ERR(ssif_bmc))
>> +		return PTR_ERR(ssif_bmc);
>> +
>> +	ssif_bmc->priv = i2c_get_adapdata(client->adapter);
>> +	ssif_bmc->set_ssif_bmc_status = aspeed_set_ssif_bmc_status;
>> +
>> +	return 0;
>> +}
>>
>> - Quan
>>
>>
> 

