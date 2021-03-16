Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E74833D1B9
	for <lists+openbmc@lfdr.de>; Tue, 16 Mar 2021 11:22:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F08Vy3Yldz30Dx
	for <lists+openbmc@lfdr.de>; Tue, 16 Mar 2021 21:22:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=qHDwXKsA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.92.114;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=qHDwXKsA; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2114.outbound.protection.outlook.com [40.107.92.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F08Vj0RPWz2yhG
 for <openbmc@lists.ozlabs.org>; Tue, 16 Mar 2021 21:22:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2P8rnkj7OJRXZ9KGlTh+gLTrpWoJG/F/cXWXZrEyIQBwMzR1kizY0qEXxz3eqQk06NQMp5KrWbcnMgwTrVHTzXeyDKm0BXHOI3X+CnrxqDvMfxd7WvGY+G8PWdyWiU7kelRAoG8Re0BRlB3NRwSRRhFqfLFvxQNbCzWmhqCPnLahv/RxmjtEMfHyr6AnENhLNgegqEXCSmbgnoQY/wu8aUS4NM1WKOuhA2vOl8RRg6iA79zXNwDxaVbRpt3gWPzxB2gmP1SSK5R2RioxC6CWYTCnsMhJ3pqXJvrdd/mmpL6Ble5ULTTdIutJE4z4mO8phcfXDHhPPap5erufyXxVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bozjelaWNtrKvUQjNWfQF3ePojZq/fCIg7AyhsbHUUU=;
 b=ZDQGxH9xUZDn1RejkAQb8yR7nqnpR9JbkZyQ5PfCRNcQthE0D5PcxjO0PhMFAppWKSUq/8/D5//zh5yNIYUcRWwpbKUX9H/yNJaTdCcBxVIRmg8CutOSWcr1TYRrmLkx3JcUOqxIGOHcp3RgeRoSwWI+9wS+6uniAsZQOZBfWETbcExGDX4EdIqj9/rQ97nzgUQHSYTiOi0Jwn6ohu5DuU0wcWStn3Cxk8sIV+VtfZ33gTQkSDMZjRcZmURhDDs8tI99IQJ4azgtdNfHqJR193f6iQclBfwWeQQ2PxQqRld7RkcSn74j/j1LDVjfQJLKAQZfdQX10RW3JWTnyMvX5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bozjelaWNtrKvUQjNWfQF3ePojZq/fCIg7AyhsbHUUU=;
 b=qHDwXKsALXf8I4P7AvvfNBfp2wHE15UjgUMNXIGKOGGenYgaTM3ExBJ5/o7ry+Mfd1r9SNFD5+OxVpfOnL1ovSRf8SCG3sKL/GAJWziEps4hrF8jZ244qxAjEy/u9iVccC4pHTR34lqJqU38M2HEBlKOHoDPR8XvgVQwSfDvKzo=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 BYAPR01MB3654.prod.exchangelabs.com (2603:10b6:a02:8b::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31; Tue, 16 Mar 2021 10:22:28 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::650e:6480:5f2a:4b96]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::650e:6480:5f2a:4b96%6]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 10:22:27 +0000
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Thang Nguyen <thang@os.amperecomputing.com>
Subject: Where to collect information for Redfish System's Processors,
 Storage, Memory data
Message-ID: <925a9eba-db8f-fba0-7d17-db32860c44ba@os.amperecomputing.com>
Date: Tue, 16 Mar 2021 17:22:13 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2PR0401CA0002.apcprd04.prod.outlook.com
 (2603:1096:202:2::12) To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from HCM-FVFX4014HV2J.local (118.69.219.201) by
 HK2PR0401CA0002.apcprd04.prod.outlook.com (2603:1096:202:2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend
 Transport; Tue, 16 Mar 2021 10:22:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ded9ddd-58b3-499c-22f6-08d8e8656613
X-MS-TrafficTypeDiagnostic: BYAPR01MB3654:
X-Microsoft-Antispam-PRVS: <BYAPR01MB3654659D7C3371F94DCC8B618D6B9@BYAPR01MB3654.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HkiXhOKzwYSUmgZb4a7EmJhtgG8gwdBQF8iSPMS93P4+rvVWmUHeQEMNz/TiLzceE5RUP7VAlCdc6qLFeAr5Ojc7J47EFzM2TSahQMHV1aYXWQKBGakA70+spnJSrYE81Un/i0SQHOz8jp0DPtJks1KhR5NimpP7LmWW2HZH9VFBQv4kyX6zgsU6enO238kTVbfNbqnyisnw2rTOgZIdW58RoRiwJVydTzHN6E5a2dC0l3jP1S52V1zr57GWaRdPm/16DShY7D+ZGutIIlNqLKdwyZZWY5ci1zRhnYSYWQyIKZqq/RjfjxhJwhzyjEOAW0AOiAahvkrA+kagH+3BzyKTfdokZ40hnmZ5zRKqw6uf7q//GtH372puU79Iz7ydwz8rSTKGz9syKk1aUKlITNnIlhCQ49sXvOHaLdMOGjkNGXc2GIL+DVdn3VhBfndD4nQFhbyWgO4rXX7WoKl7yl17Ni3AJ6v8TfuFQQGvNk7f/2XP+A8BMyu6llG9WCUv1RH0tLeUglIQrNcEsd9TfGGCmmu3zqJ5q2K3w2E8jhldnAZwr/+8MMPY6cuHkrMD4LDVH07FO5M4nWXM66gz0czM1GK+D+UKREVOD1jMS6zLqa2c9SfdZ/nVqZBWd44IJwJIyYu4bsmfJLd6KAvFnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(136003)(366004)(39850400004)(8676002)(6512007)(6486002)(66946007)(26005)(2906002)(16526019)(66476007)(478600001)(5660300002)(316002)(186003)(2616005)(6666004)(956004)(19627235002)(52116002)(6916009)(6506007)(31696002)(8936002)(31686004)(86362001)(4744005)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VGhIdkhQVVNmTHZKVXdDOCtyK2QyeTBSZGRpR25tWVhORXdwYzRQQ0xSSndq?=
 =?utf-8?B?QzZqYVBKYjVkLzI3MWpyNUo5NlRLZnFhTU9DS1hMQ1h3ZklaWUlIdXY2YW5j?=
 =?utf-8?B?bHZKU0FyNE5wQ21ETjdtcjBnejB2ZCtXSnhNMmloL2V2YnBKQUhDUXE1M2VJ?=
 =?utf-8?B?NVJTVmV0MmFKS1dxWlljL0x6TDBKMmpwZURzQ0llMDVUeHJxSERDN2c1U2F0?=
 =?utf-8?B?bHlUNEtqT24rVWh6UldtZno2WlhPZWc4b3VCaFVmSWFPWG5ydzBIYzNEOUhz?=
 =?utf-8?B?bXRHZGJRZG5FdEhORHBSejB2ektoWXc0R29wZHNrUHhGbWlwaHJpRTRsSGIx?=
 =?utf-8?B?Z1Q3bDZ6UkJLTW5EelRhYksrMjVDZmVoZGxHQmNnbDMwTXorSC92MHV5bjdV?=
 =?utf-8?B?Tys3MlArcFhOK1pYOFAwais2dlhySytGRUdXeFlHaVgxSUhvbDEycmIxUEpB?=
 =?utf-8?B?UVhuSExnL3BkTGh1SHBEYnZibWR6SW5tYUREOHEwVFpIYmJVY0lrYkZ5ekpX?=
 =?utf-8?B?NW43QnpadUY4dFJjNzN2b0F6eFBGS0FDTHVscHVYZDRLT044UkVrbW1vOE9x?=
 =?utf-8?B?RzlIZEFYSzNueHhyY2pZUDkzMG9HOVdFVHorcW1xRFZxU0RFYnFDWUU2NGIz?=
 =?utf-8?B?V2FMZUtoU1luZnhUUUZTTWhjc2ROTmd0dDJEblJhRUZydndCUFZBRGpkdjdL?=
 =?utf-8?B?dXBtQ09PYXFrT0Vab21JTEdhWlZHQzNxUm5CdVp2RnBHR05GMk1SV0lTTWZX?=
 =?utf-8?B?cmtsU3ErMUY3TlRLT2pMNDN2aHE1c2xlZ3hNNlgxWFFrVjhXRTY4bkpNK3Ir?=
 =?utf-8?B?ZGUwczVGdkdOQzBCMkpCdVJ0UmxDdUpJWUhZSXAwenBqZ21UTmRNZkJTWmNF?=
 =?utf-8?B?UjVEcmZwcXZPemwrbkFTWE90bDFIS2tDbG43Nlc4eTQ0VlcxbFJLK3NvTW41?=
 =?utf-8?B?d1VVdy93azd2Wit1RHFSUVZrV3I4K3lUWGdSbGVaV3BJbUU5M3ZYNS9sRVlU?=
 =?utf-8?B?NGdQRXdtYUJ5VlZCakhyNHhmR3BPWjZwQ05sL2hTdnJvR2ZwVHdXbDFLSWs4?=
 =?utf-8?B?RUlteVh2YXBDR3pVWVFTdEJadGtKYk9KaTRCa2VvMXZSbmlTeVZ0eGdLenpS?=
 =?utf-8?B?SVNYVGU2c0ZoWjV5bXcvL3lSeFIyU1duL1d5MEZuSlp3Uk9icnRoTThxYWRh?=
 =?utf-8?B?VWxrVXRuYjdSL2M4T0tUYm9jZE1hZkN2Skl5SzdONEZLdy9qNGhGdVo5ZGRH?=
 =?utf-8?B?Q29MYzhTRUJ3NjZSdjVQQ3ZKRm9zeXhhRU9aUFNHaWNXZVZiUmVDUzNsbFBl?=
 =?utf-8?B?WHprNzhzM1JGd0tBMnRmaHVzdVF5ODBuRGtsZVYrRWxjQkRPMkl0bjJaSU9R?=
 =?utf-8?B?NGd1ODVHVUlZNnZqVENRMHA2U3R2ZXVHYXNXWFdNeEUybmF3STAxQ1doMzFP?=
 =?utf-8?B?cXMra1lDNGtiMFRWdnJDN3dqdlJMWElqRmdQM0grVkZpL2JtVERoNWIwNW5z?=
 =?utf-8?B?VFBNcFl0MERWaTlHZUU5RmJaVXlwQzE1RnB2K3NReXJJMjB5RndrWmlHclhM?=
 =?utf-8?B?RWl0WjlQN05pRDJNNUh6b1lnYU1qdkR2dWg4eEhObXd5dS9TbVk2NHQ1R2RN?=
 =?utf-8?B?UUFPOWtBNnY3bmtrTlVuUE83Ukd4L3p0eC80ZXAwcTRrTXZ3cDd4emJJN2VN?=
 =?utf-8?B?SVJmVU9UeUhCYnRhdVJEUWhHY0dvNmlnZi9PLzRzekM4bklITmdwcy9Xa1c4?=
 =?utf-8?Q?n3omnfmdYVxZA+yZqC95zRA2dvn3cURQwYfG45K?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ded9ddd-58b3-499c-22f6-08d8e8656613
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 10:22:27.6085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iFnjjd8n7pKSzT+XJAq7WzuckdPjvsZTe1dWgc73sHP7o2IUBQSma/wpOxg/NRiRsIgrNo8qfkc/ULGM+z7eiOhxbYCXYM62326a8SNKRLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB3654
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

Hi,

I am looking for how to support Redfish System schema which information 
from Host:

- Processors: redfish/v1/Systems/system/Processors

- Storage: redfish/v1/Systems/system/Storage

- Memory: redfish/v1/Systems/system/Memory

I looked into the bmcweb repository at redfish-core/lib/memory.hpp and 
redfish-core/lib/pcie.hpp but just see doGet() function to read data 
from dbus to report via Redfish. There is no doPost() function to post 
codes to Redfish.

My questions are:

1. How can Host BIOS collect information and send to BMC so that BMC can 
report via Redfish? via in-band Redfish?

2. If the information is not from BIOS, how can BMC collect information? 
What recipes/repositories are used to collect information?


Thanks,

Thang Q. Nguyen -

