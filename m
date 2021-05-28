Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EC4393ABA
	for <lists+openbmc@lfdr.de>; Fri, 28 May 2021 02:54:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrmR842njz300X
	for <lists+openbmc@lfdr.de>; Fri, 28 May 2021 10:54:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=iZeNlSaG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.220.101;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=iZeNlSaG; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2101.outbound.protection.outlook.com [40.107.220.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrmQm12gcz2xtx;
 Fri, 28 May 2021 10:53:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+JwPwi4bTwclT1DonBN7No/HyQsE2nW0fQNT2Dr6l35CRCSawxfC4elfH8dxrM/SxWewNVnrqsSuJBnsounLsW8qsCv4ij1qDHT9i6HsCkQDwaQW+xwqmwb2a1f/iknNvEJNqy6lgfW90R8Hehnfj1efO7kOPNrkhtxNzXcwuZpAlUhQbQaZQTI5mBYvzyfeCfF5roaCdo+xackDcLe357KmASmYNgJ+OONeC6acGjKpbS00Z27AgKFpKKkZ+p/xaJ+uZpoZX91V4B4s2Tx3rH6vgiOZA1YWJVYObSmP9tVlV9tEZ5rJyvSWqyvhv8cU1m6zbTyzImwoLzSWO1NIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q39wZYcnjxMJ+4STf8QsAr2pUVl0olHlxwGASWnb0OQ=;
 b=JWfRhK8qJCnKz6BnfC3WK9LHBcIOfFhg7Qv+8iZSKQZDFsWBqxwPcuSZbfh6MQywbhSUy1rXboS5FM24hXCWKsXBGbAG7Hn1uJ85/0um0v7wgQVAuT2i43l5zm9sQe9jRr4oBtKDOq/EfircPPzCC6MD0Z/gK3mejkqKTsxeO45Vi1vYY5N9ZsOI95UoHY+bu52VSglXFOfGZMimyhyFg/CW7QI3TwgLVN/pa0NQC1rdDly1TjdYwGeP77IuDHPGw9tLt9Gb/2Lxa3Jtp/TUbWcjCOIj9+tG8TTx+evW6XVgfQg48v/Kt5xYdPfio6e7Rwmnb1PjZwxO4KSdjyK/bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q39wZYcnjxMJ+4STf8QsAr2pUVl0olHlxwGASWnb0OQ=;
 b=iZeNlSaG5MrvjVQQvn7UTEXTgBV/N4RdTmwUki7qe/uEO33taKe86jd5KaOTr6DltEi6Z4II2/HG7xrP9lPWI4VDdJCxfKlXp6s9HV8cgH7nSueqtW50llb9nkI91Tq2Fqfkb87+/w/j6s+l0XksIyG3grpA+n1ko+0tyyqvczk=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW2PR0102MB3483.prod.exchangelabs.com (2603:10b6:302:3::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.27; Fri, 28 May 2021 00:53:42 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::1905:a396:9968:3a5]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::1905:a396:9968:3a5%5]) with mapi id 15.20.4150.027; Fri, 28 May 2021
 00:53:42 +0000
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
 <917237ce-98f8-df5f-32b6-b4145ac47ac9@os.amperecomputing.com>
 <HK0PR06MB33805BB4A4D35192A0D95E59F2259@HK0PR06MB3380.apcprd06.prod.outlook.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <14d58497-44e6-265a-af9d-7189379784d5@os.amperecomputing.com>
Date: Fri, 28 May 2021 07:53:28 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
In-Reply-To: <HK0PR06MB33805BB4A4D35192A0D95E59F2259@HK0PR06MB3380.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2402:800:623c:5f9b:282b:d89a:b291:5ff0]
X-ClientProxiedBy: HK2PR02CA0158.apcprd02.prod.outlook.com
 (2603:1096:201:1f::18) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2402:800:623c:5f9b:282b:d89a:b291:5ff0]
 (2402:800:623c:5f9b:282b:d89a:b291:5ff0) by
 HK2PR02CA0158.apcprd02.prod.outlook.com (2603:1096:201:1f::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Fri, 28 May 2021 00:53:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56541955-1b82-4957-d769-08d9217309bf
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3483:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR0102MB3483F61DF1DB680F83373446F2229@MW2PR0102MB3483.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VQzJCcvfCQrxkkvs8P4XHa+nh905K/K6TyVMLzOp3rXS5tMFzgSquft8tDlOpfGsohBzRAstqFqRy1m5kkqw5Y57CipvTIufCJN5zcMqH8yhBJuvXmJRC6ktBLVgq1WxTrplIUB9AA7FHuysaV3fNIvI2Tt3dnqosRa2qYoPR3rm0J17d+NcraOCXZYhW4zbKKepagSSj/vZXMz8wWO7BolPdb4hEkeoLxWWF7PmqdpnhZW/quGsgISGD9URE9kn08lepwF9qfKgwkqUJrAmawzNCMmWNbPMeVOywgWQq2icwskSjQa+xrtuzbhQiNMqQPdPcqggwe1FpuNSUPDQitNoVPgDxe2OZme1VZ4z3DTPNf1gmDhTLHL5uknysUWGohteQ14IcoIQnlP87RV66kaZOeEQfGMT2OUblIFmXaw7Q+sLoFL+MciE6SinT3DQwkydVRWthj5I+DpPOg5LqJlGc+pwwl7pVCPSqEXuyqK/M2SAWonsNVKg+CkvGHBcOmJYa8Xkpt2IYk79Maal35Dm0yKRJ+/zHqq+7LtSDU7jJzG7bT/H2Zq8VWqZ58qd10yAde4Fjfv0CEheGBeo8lB/sjGGiIqFaAaQxByTZiHLCSW7OJf9KUE9Zj+aEJaxpqk+haFm4MI3byyHFRFbua2URTFE08PeTm7+V83fLrIjH7u2hLU5QA6vUaYg2atV+SoXbHsJpX990/pz4Gi7lA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(39830400003)(396003)(376002)(110136005)(31686004)(5660300002)(4326008)(66946007)(66476007)(38100700002)(83380400001)(6666004)(8936002)(31696002)(478600001)(186003)(54906003)(6486002)(52116002)(2906002)(316002)(16526019)(8676002)(7416002)(86362001)(53546011)(66556008)(921005)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?My8xTXBTRkxRdndZcDIvQlEwdlRBdk1vMjA1Z2tXVTVxT29lYzVUdWpVZVdG?=
 =?utf-8?B?a0lUSzh5MHBFQldub0UxR1kzMGxZV1RaaUk1VkJXY0pLc1RRaVVGR0FPV1BE?=
 =?utf-8?B?dSsxVk9tdVVOME9jbVF2aVpoVkJlb1NxQTZwVmRnQVNEek5FaGVnSVpGM0lq?=
 =?utf-8?B?Y2ZEVnNSVW4xaW92ZzlHSWtzVHZQcVJ4WUpZRmxOZFd0OXlTZitNY0ZNUUlo?=
 =?utf-8?B?VnExWWt2K0tWb1hpT2ZIa2t6NXEvOFlaMkJOTFNGeUl2dHlQRnhFTnlHSGVC?=
 =?utf-8?B?em9iajlXYy9LbUVhNUV2VldSUERHZTRkQWpEemw2eVBDVmVUa3FvU0ljL0RF?=
 =?utf-8?B?QllTVGsyMmhhdlk0Y0lUUnZvbXZuWWozdGswK2h1T1dGUnZYOHV3bjhCYzdX?=
 =?utf-8?B?WnFNSVpuNmRTaTF1bDJ2QkRKTTN6TXppVFZWMkNUNndqK0NkSjNCNmtLRU5T?=
 =?utf-8?B?L3NYa1d3eHFxSlk2QkdjazVLRmNadkpxM2JrYWVGOVFEYkwweGR1WHdPMFJ4?=
 =?utf-8?B?MkxKdXd3cUlBYnZyNXdxc1lDRllYYy82QytJOTEzU2ZzMjdlVEx4RWwrUlRJ?=
 =?utf-8?B?WmhEUG1xMnRCb3RtdXFCaFBrNi9ZVURJM0Nld09MOHM2OXJZbzRoRzJNaEhU?=
 =?utf-8?B?WDQ2VE52dEJKSnNXcjBXU3lkRVVLbW1XblNMeDg2Vi9sejJNdkFYSFNjWWdv?=
 =?utf-8?B?Y1FJQzVZRWNXd1lpT3orYUV4a05kSzVDazdlS3VhYitmOE5BeTFnUFlrVmJN?=
 =?utf-8?B?Uy9hZXFZNTJzWW5IYjBGSWNTYkxYZ3NMOVhTcWl5NnlQdm5MajBqMXpzOWJV?=
 =?utf-8?B?NDB5VURKZGpnYU9oSUFaR2huMzc2K1hJdVMxSlNYWmJsK1BBZmR3TWF3TkRZ?=
 =?utf-8?B?ZkQwRmRMUXdLZkd5RjdnQ1Rnd2prNy95MTBtbHVJeEJSRkdsdmkvZVZqLzBO?=
 =?utf-8?B?UDFZbXNiSit1MDRKcHNIYmtDTkJKOXlHN3F1U0N2WGw3TGg1bWdzRzFJazd2?=
 =?utf-8?B?VFZ1eHJreDhyZEJkMnNPWm0xb3FYaTNHaURVQ1pjdlVGYVFGMnoyOW1BcmNM?=
 =?utf-8?B?MXVsL0pSWUVxRGwvampxdVZlOEY2dXZITHpqMGVwY05Xd0xKM0ltc2RGbzhO?=
 =?utf-8?B?bnRhbzVBSWMrdVJNbk9iL01UOVRlMWJqSmxhMGtJU3BGNHRQVGRBTE1UMGFh?=
 =?utf-8?B?M2dqNUhSaUtoZVEvMWFHVDlTeE5HcmJlNGk5Z3E2Rk5ZSk5lVE1ZakIyRVJx?=
 =?utf-8?B?dVBnZGlldThQRjR3YUJ0OEtiQ3dLdHVhRkNtYmNUdjFDQlBVWHM1VzV4QVdj?=
 =?utf-8?B?SmpzbHdUM2M3MnRzVFFBUlBuYVZKejBEWnNCMkRIeEV6ZncvVWJ3MER4OURi?=
 =?utf-8?B?NlRCcmFuZE1ONnh5dHJiY0ovQUdtd0R2UmZ0RXVSZ3VpY2ZhQmhHemc3TjV1?=
 =?utf-8?B?RHVOajRzZFJ0dkF5SjdNVHFkQXlKaVJFTWhWMzQwVnpJN3RzSVR2VXhpNkxM?=
 =?utf-8?B?WkQ2NmQ2QVdxa1hHVU1zNlhZUDlKaFMrMGlXVkRvaU5ubENTTGhhVkQzQ25B?=
 =?utf-8?B?LzFNQ29tMEowNGg0TDBjYjFMZDVjNEZBY0tRWXhrMDRWVHJDNTlvRnJseklm?=
 =?utf-8?B?VkJENlRad0NMUDJ4cDk5b2d0b0RHTnkwdDg3UndvU0ZaWTR4NEk5eXppaHo0?=
 =?utf-8?B?UXNnTHdscFRJMmF1SDBVWndBRFJVZGUySVRDa2JwdjBjcElwbERSTEZhMFR5?=
 =?utf-8?B?aW5MN2syeEVBMnNzWXN4bDU0ajFyRXhhMlNKT0lPSTZiUmoyUzdLNWRhM0cw?=
 =?utf-8?B?cXZVOXArZTRMSUovMVBWMFFla2g3RjVkQnlpcURCaFV1NlZPR1lmMXc3WUhr?=
 =?utf-8?Q?H6YznKBoMLZGM?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56541955-1b82-4957-d769-08d9217309bf
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 00:53:42.1147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oD2YMYBDTiGSDpNXClScmg6UryNON4rslXKi0IYylDbFLhzZut8szT58iaZt3nZbti6Iw5OD6ZJvWiwuUwzvaEchp6BM/x0F17f0ER3YeOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3483
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

On 25/05/2021 17:30, Ryan Chen wrote:
>> -----Original Message-----
>> From: Quan Nguyen <quan@os.amperecomputing.com>
>> Sent: Monday, May 24, 2021 6:49 PM
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
>> On 24/05/2021 17:36, Ryan Chen wrote:
>>>> -----Original Message-----
>>>> From: Quan Nguyen <quan@os.amperecomputing.com>
>>>> Sent: Monday, May 24, 2021 6:20 PM
>>>> To: Ryan Chen <ryan_chen@aspeedtech.com>; Corey Minyard
>>>> <minyard@acm.org>; Rob Herring <robh+dt@kernel.org>; Joel Stanley
>>>> <joel@jms.id.au>; Andrew Jeffery <andrew@aj.id.au>; Brendan Higgins
>>>> <brendanhiggins@google.com>; Benjamin Herrenschmidt
>>>> <benh@kernel.crashing.org>; Wolfram Sang <wsa@kernel.org>; Philipp
>>>> Zabel <p.zabel@pengutronix.de>;
>>>> openipmi-developer@lists.sourceforge.net;
>>>> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>>>> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org;
>>>> linux-i2c@vger.kernel.org
>>>> Cc: Open Source Submission <patches@amperecomputing.com>; Thang Q .
>>>> Nguyen <thang@os.amperecomputing.com>; Phong Vo
>>>> <phong@os.amperecomputing.com>; openbmc@lists.ozlabs.org
>>>> Subject: Re: [PATCH v3 5/7] i2c: aspeed: Add aspeed_set_slave_busy()
>>>>
>>>> On 24/05/2021 17:06, Ryan Chen wrote:
>>>>>> -----Original Message-----
>>>>>> From: openbmc
>>>>>> <openbmc-bounces+ryan_chen=aspeedtech.com@lists.ozlabs.org> On
>>>> Behalf
>>>>>> Of Quan Nguyen
>>>>>> Sent: Wednesday, May 19, 2021 3:50 PM
>>>>>> To: Corey Minyard <minyard@acm.org>; Rob Herring
>>>>>> <robh+dt@kernel.org>; Joel Stanley <joel@jms.id.au>; Andrew Jeffery
>>>>>> <andrew@aj.id.au>; Brendan Higgins <brendanhiggins@google.com>;
>>>>>> Benjamin Herrenschmidt <benh@kernel.crashing.org>; Wolfram Sang
>>>>>> <wsa@kernel.org>; Philipp Zabel <p.zabel@pengutronix.de>;
>>>>>> openipmi-developer@lists.sourceforge.net;
>>>>>> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>>>>>> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org;
>>>>>> linux-i2c@vger.kernel.org
>>>>>> Cc: Open Source Submission <patches@amperecomputing.com>; Thang
>> Q .
>>>>>> Nguyen <thang@os.amperecomputing.com>; Phong Vo
>>>>>> <phong@os.amperecomputing.com>; openbmc@lists.ozlabs.org
>>>>>> Subject: [PATCH v3 5/7] i2c: aspeed: Add aspeed_set_slave_busy()
>>>>>>
>>>>>> Slave i2c device on AST2500 received a lot of slave irq while it is
>>>>>> busy processing the response. To handle this case, adds and exports
>>>>>> aspeed_set_slave_busy() for controller to temporary stop slave irq
>>>>>> while slave is handling the response, and re-enable them again when
>>>>>> the
>>>> response is ready.
>>>>>>
>>>>>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>>>>>> ---
>>>>>> v3:
>>>>>>      + First introduce in v3 [Quan]
>>>>>>
>>>>>>     drivers/i2c/busses/i2c-aspeed.c | 20 ++++++++++++++++++++
>>>>>>     1 file changed, 20 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/i2c/busses/i2c-aspeed.c
>>>>>> b/drivers/i2c/busses/i2c-aspeed.c index b2e9c8f0ddf7..9926d04831a2
>>>>>> 100644
>>>>>> --- a/drivers/i2c/busses/i2c-aspeed.c
>>>>>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>>>>>> @@ -944,6 +944,26 @@ static int aspeed_i2c_init(struct
>>>>>> aspeed_i2c_bus *bus,
>>>>>>     	return 0;
>>>>>>     }
>>>>>>
>>>>>> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
>>>>>> +void aspeed_set_slave_busy(struct i2c_adapter *adap, bool busy) {
>>>>>> +	struct aspeed_i2c_bus *bus = i2c_get_adapdata(adap);
>>>>>> +	unsigned long current_mask, flags;
>>>>>> +
>>>>>> +	spin_lock_irqsave(&bus->lock, flags);
>>>>>> +
>>>>>> +	current_mask = readl(bus->base + ASPEED_I2C_INTR_CTRL_REG);
>>>>> Hello
>>>>> 	Where the bus->base to be remap?
>>>>>
>>>>
>>>> Hi Ryan,
>>>>
>>>> In "[PATCH v3 6/7] ipmi: ssif_bmc: Add Aspeed SSIF BMC driver", the
>>>> ->priv is retrieved by calling i2c_get_adapdata(client->adapter). And
>>>> ->in
>>>> aspeed_set_ssif_bmc_status(), call the exported
>>>> aspeed_set_slave_busy() using ->priv pointer as code below.
>>>>
>>> Yes, I see the probe function " ssif_bmc->priv =
>> i2c_get_adapdata(client->adapter);" to get priv.
>>> But my question I don’t see the bus->base address be assigned.
>>>
>> Hi Ryan,
>>
>> In drivers/i2c/busses/i2c-aspeed.c:
>> struct aspeed_i2c_bus {
>>           struct i2c_adapter              adap;
>>           struct device                   *dev;
>>           void __iomem                    *base;
>>           struct reset_control            *rst;
>>           /* Synchronizes I/O mem access to base. */
>>           spinlock_t                      lock;
>>
>> So when "struct aspeed_i2c_bus *bus = i2c_get_adapdata(adap);", the
>> bus->base should point to the base of the aspeed_i2c_bus, which is
>> already initialized by the aspeed i2c bus driver.
>>
>> Do I miss something?
> Hello Quan,
> 	After study. I think the ssif_bmc_aspeed.c assume the priv data is the same struct.
> 	That is trick.
> 	Do we have a better for slave enable/disable call back to implement this?
> 	If add call back in struct i2c_algorithm; is it workable?
>>

Hi Ryan,

I dont know which is better, ie: adding callback to struct i2c_algorithm 
or to struct i2c_adapter.
I have tried to add generic callback to struct i2c_adapter as below and 
it works.

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 4e7714c88f95..6e9abf2d6abb 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -713,6 +713,10 @@ struct i2c_adapter {
  	const struct i2c_adapter_quirks *quirks;

  	struct irq_domain *host_notify_domain;
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	int (*slave_enable)(struct i2c_adapter *adap);
+	int (*slave_disable)(struct i2c_adapter *adap);
+#endif
  };
  #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)

>>>> +extern void aspeed_set_slave_busy(struct i2c_adapter *adap, bool busy);
>>>> +static void aspeed_set_ssif_bmc_status(struct ssif_bmc_ctx *ssif_bmc,
>>>> unsigned int status)
>>>> +{
>>>> +	if (status & SSIF_BMC_BUSY)
>>>> +		aspeed_set_slave_busy((struct i2c_adapter *)ssif_bmc->priv, true);
>>>> +	else if (status & SSIF_BMC_READY)
>>>> +		aspeed_set_slave_busy((struct i2c_adapter *)ssif_bmc->priv, false); }
>>>> +
>>>> +static int ssif_bmc_probe(struct i2c_client *client, const struct
>>>> i2c_device_id *id)
>>>> +{
>>>> +	struct ssif_bmc_ctx *ssif_bmc;
>>>> +
>>>> +	ssif_bmc = ssif_bmc_alloc(client, 0);
>>>> +	if (IS_ERR(ssif_bmc))
>>>> +		return PTR_ERR(ssif_bmc);
>>>> +
>>>> +	ssif_bmc->priv = i2c_get_adapdata(client->adapter);
>>>> +	ssif_bmc->set_ssif_bmc_status = aspeed_set_ssif_bmc_status;
>>>> +
>>>> +	return 0;
>>>> +}
>>>>
>>>> - Quan
>>>>
>>>>
>>>
> 

