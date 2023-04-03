Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 043786D4DF8
	for <lists+openbmc@lfdr.de>; Mon,  3 Apr 2023 18:34:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PqxKx5xC4z3cCD
	for <lists+openbmc@lfdr.de>; Tue,  4 Apr 2023 02:33:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=pxCNEBTG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7e88::601; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=supreeth.venkatesh@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=pxCNEBTG;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PqxKK0bhcz3bh5
	for <openbmc@lists.ozlabs.org>; Tue,  4 Apr 2023 02:33:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQnJl5z3PfCo633+H8gY3RikNhq1HzYmh32g/r18x1Wc7yEW+jMfqL91y2nP1tg8wUOl85GdZbsTcRk+ZBsiDNlAJ2rCW2KSimDFk1KRonZBT41OBiRxTq+cJkKqX2s9qTbjCZRQ/+Ns0rGq4PWGr4cSXSy3oWex3fzLlJsJvzYP60SerxP9Nm6rSWOYymhGcDIjo+4ZQwGPxuwoA8H9HoZDaHsI7O2KCuUeF4NcwBrSTH0Zrapmk/Hm0ZlnFhIoJKd8EkTktzma9rTcvV2yVvCOZZSYo7vhthuJkKOR7WdSr1ULgaJ4iGeliyYT5/gExpWQO1KuXokL8a47F8pqTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QfYlgw2IZEg3midsX+BoJs8xtBy7YC+wwwsk5ELKhSA=;
 b=kyfovbfq0odgLO9KjaSSSjJdkRtH3u0lI55PJJyij4dNSobd1yrZA4hDNntTCbiUUA9aHh4BSuv+x+a0Zb7aFHRCKZwNb3TnAb+LuKIfyWx+UU/Q2UFd+ft3IzwFdr7WVVTQfVigSQph1IXCj1m/xVXpjYODsOwQsuCRFMZVVmeMGPmkD7gO7+pN6IqnOfp/u16GMUIcCTqxpTuq5H8tocwtshNelBA+qjiP760bPIARI9d5NNWmO2G2V83d8ugNtu0+ISwfpTqnGappaksTxo1jZ/UfEAY9caSIW3ZfrBRm0cqJmHH2jyNi1FI8Ocxyq9eM0IP47BIdQXABK2QPGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfYlgw2IZEg3midsX+BoJs8xtBy7YC+wwwsk5ELKhSA=;
 b=pxCNEBTGihobqdbjn/3bsqQwuLfiWb32k2HrDg9PC5LS9PLPPrzH5yMp2Q/UV8hNRfNxBjz50298c9iLSXq+4equ3uu6qRphpmJeKoBCcFRUnqxJ5Wkr3UBCkQbjVozOsQYr8RSkMWIw6zuhUmBna+bnz2vV4HjWQOzUd4yBj2s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4752.namprd12.prod.outlook.com (2603:10b6:805:e9::10)
 by PH0PR12MB8052.namprd12.prod.outlook.com (2603:10b6:510:28b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.30; Mon, 3 Apr
 2023 16:32:57 +0000
Received: from SN6PR12MB4752.namprd12.prod.outlook.com
 ([fe80::d191:788f:c62f:9d87]) by SN6PR12MB4752.namprd12.prod.outlook.com
 ([fe80::d191:788f:c62f:9d87%4]) with mapi id 15.20.6254.030; Mon, 3 Apr 2023
 16:32:57 +0000
Message-ID: <340546d6-2fcb-d405-0f12-9805e0f36ec2@amd.com>
Date: Mon, 3 Apr 2023 11:32:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC] BMC RAS Feature
To: Patrick Williams <patrick@stwcx.xyz>
References: <07621845-19a4-0568-be0e-f556ba40b813@amd.com>
 <ZBmJpxTnEVVpfsz2@heinlein.taila677.ts.net>
 <255d7c9a-ce17-bbe1-7312-990d0221cf36@amd.com>
 <CAK7WosjjdVwNqSwkY2mxYhgAeKdwigtyLryTfJ9r6ShjfbRuCA@mail.gmail.com>
 <65515592-8f77-1c8f-731c-165fb833344b@amd.com>
 <CAGm54UG+S7gFkCaKJm_7PxOCDu0haZ4FWUxj716JBGVY-gaTFw@mail.gmail.com>
 <d9f7b650-2e8b-7bd0-2125-035531ce549c@amd.com>
 <ZCq8NrJdaT7UTd8J@heinlein.vulture-banana.ts.net>
Content-Language: en-US
From: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
In-Reply-To: <ZCq8NrJdaT7UTd8J@heinlein.vulture-banana.ts.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0380.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::25) To SN6PR12MB4752.namprd12.prod.outlook.com
 (2603:10b6:805:e9::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB4752:EE_|PH0PR12MB8052:EE_
X-MS-Office365-Filtering-Correlation-Id: dbe56828-6c3e-40e0-f92e-08db346114e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	1qs2cL1qbw+b0N/++LQOBdthRxVLM3KTNiBEzt5ABWAB832Z2SZtBw9LptOrXqHOCD5ARwhzzWGc+4vFUJI4tEApAMlWwnb7HhrY2BsuWKkyS7ttt9UjIEBjhc4D90MC2bEi/lO4+68BWTsEkW029Crg0CVwPHgktcqQi6Y5VdfbXgTsY6RiYkehWZhkQW2gDzDcvV7wLT8PsSPaCvnrnRUm73sutu8Gco5sT5vrGjwxl6X7XbYe76NBjPXyGsgrLWEXkGqbTqK6onb5noQfqEK7kPBCN0BxoAgk1Xh4pZmwuCSZ4srb8M2f8jPmWjl8PcVbzvSjSrzUH9DFUmOvhMttXUGH3u8Hwx01vKk+YPsf97yKY6Pe88Ax46dS8CwfLu1YGzbqITI/C3pDMH77JbBn1aavYkLzFNcrXa+OIE0aIGkAwAUIs/ho9cwNeFB4oYGs/yPvCNRcZpBXx/9oqFQyTO4F+ljmkYqDSwwrM5UrwLczY1CG3kQloegK2xlplW39CAZX0nIzzN32Ti6kYi/a/q1q1+krwIAtL9Jz4XB6asJL0cF9zX7cu4nPxPTF9Kc1DOjsWBI1DorZu3IxejvgtpT0aVgzINURw1MU8qsf5lksYP+uURJDlQ2KUeUSlJ/Rxo0uI96kM70sX4VTp6mBd/RGGRZ3qGLfBhwVzRr57EM7j0KskOwuJO4DfO7E
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB4752.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(451199021)(478600001)(2906002)(186003)(2616005)(6666004)(53546011)(6506007)(6512007)(36756003)(83380400001)(6486002)(966005)(26005)(8936002)(38100700002)(86362001)(316002)(5660300002)(31696002)(41300700001)(4326008)(66946007)(8676002)(66476007)(66556008)(31686004)(66899021)(54906003)(44832011)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?em9xMVM4UytsMDVpV0hNelNTaW53eVNhZjlJbzJuOEUrMGswQjBrTDI0NFdw?=
 =?utf-8?B?YTNMQXNSRTBySGRyVUdkTFRrODExNVdCc1FPelB0cS9Qak9OdlI1bnY3WkJv?=
 =?utf-8?B?L0hPbFVtWVNsRk1wUlZ2Y2p1K2NIbWcwRzNDdlNTaENpd0JGVlc4S2RPNzFF?=
 =?utf-8?B?N3FBNWtCbnprc21KZmxUdWdLamg2a1hoa2JYWTlhby9PYVdSM3A0NUdjT282?=
 =?utf-8?B?ckM5VGhxWklvRWF5OHA1QVZnWXBlWHhQanFpSnlKcFpVaWlNQXFkS1dZSmNZ?=
 =?utf-8?B?WmtTOUJ6KzRCdExtS09RS2h3U0p4WXpxU1lQd1VRdThWdnJxY3hwbSt5Tmdo?=
 =?utf-8?B?Rk9STWxBQkJ3YlNaMjh4cmJnRCthV0ZLYndld3hqM2VaQWRVL1lLUTVZaTFw?=
 =?utf-8?B?ajlWQzlMemVHdmQ3aGdrdEhyTUFuZGtjT21lNUJObGVaakU2bjdha3VtOWZJ?=
 =?utf-8?B?UmVNNzIwSXNBK21MaStqWlFITVVsVjBhdlFUeWtVcHUxV3MxSEdqbnNnOFpu?=
 =?utf-8?B?OWRGRHFqdjQzZi9aaW9yeDhVOFlsdTdlRjc5YzUyK2xzcVNIaG9oeEdoQmho?=
 =?utf-8?B?NmoxdTRmaUczY0p1ai9YR2pZc3pWRURvOTIzaTZKMEY4ZmJRWUR3ejNSaFha?=
 =?utf-8?B?cWJVdkNvL1JvaWhFZHRCZEt2OGErQSsyOUxydnVYZGJCVmZvRnpKTE9YcXV4?=
 =?utf-8?B?OU1SZ0NkRm9wSE9kZGNReDRxekhaVHhmcUFIOHAvZnZTTzhPMTZGMnRrVHVR?=
 =?utf-8?B?Z2Z5RHU1WlVoSjhqb3loMFZIc3RnQUY4MTNQUEFnNms4bFFOMitSeWRvU1I3?=
 =?utf-8?B?K3o1OE5JNXVXUUJBaU5ZZGR2azhzaGRMTVI5dWFXdXc3dTdxTzR3NnZ6My85?=
 =?utf-8?B?WEdyNFRSVGlJQmIwK05aN1g2YnBUUGtXaDNOSTk1ZExpOFhSQmtwaitsYnAr?=
 =?utf-8?B?dnpEVGNEV1RpaVpxS1FDeU5PWUNHZy9wNllwWU0zMmEyOHJGc0krak5yUlpl?=
 =?utf-8?B?Y3RoL3NoUTB6YXdselhHVS9lNGV1dlgvVzZ5N2xva1dwZ3pBanY2d0R0czJN?=
 =?utf-8?B?MjZBL1pueUVVbldDTHpqMFZndGl6ek9wUkx3REJZV1A0cFJraGlxdVJhZU5z?=
 =?utf-8?B?eDMzcTg3UXNldTNUYncrcTBvWTl2a05RSEk2aVVGSElyNEwvUTc2eHEydWRX?=
 =?utf-8?B?bnFhMWZMaTAwWUpDVUhnSHBEQWt6M3ZxeXZwK0h3a080ZzV1akhXN2h6T0c5?=
 =?utf-8?B?bFFiVURzNGdRdUUwYWM5anI0SUxHTVBGK05ZZWZzLzZrRElKOWQ3T0xFOWp5?=
 =?utf-8?B?TGRHSXdUSHhWS0ZOTWlka21FZHdNTFRHQkdsTFIzY2hNK3FvMWVtYW81Tlpu?=
 =?utf-8?B?Uk5vNk80QUVMNlhiN0tFU2dTQUlzMk5CZ0tLaUlVdm5IaThsODZaZjhjNTE2?=
 =?utf-8?B?ejkwTGJmdFl5UFRYd2RWZlFmUldzdERQVmRGUktFRmJaU2V0ZSt1QVhTMERz?=
 =?utf-8?B?TWpRTTNvbjZ2OTZQbVFKSjRtWWZYL28wMUVBS1BqQjh4RXEwd0RZS3JSVTVC?=
 =?utf-8?B?Tnl4QlJKeGFJSnhrYmZjTWFlRmFSQUw4cHZ5R1lhNi9JY2ZySFNXa09mVWtv?=
 =?utf-8?B?YWdvc0cwajNnWm5NTlRJaHF0K2lEZ2FYSGlhRGdQMWZsckI3cUVhemQ1T3lh?=
 =?utf-8?B?R0k2WXZkeDlvamN6NWZOUDJSbHdlT24xcUNkckRMMnlZcG5sSHh6bW42allx?=
 =?utf-8?B?QlNGSWs5ak01MG9hdWJGK0JaZmdlQk5pTWdsR0t2UGxhdW5pY3JRV0NjWU5t?=
 =?utf-8?B?T2J5dEtROThhUE9XZVYzeWpKaUJNMk41QUdYODYvc3l0aStqMUs1UWkwOVNV?=
 =?utf-8?B?MEF5MXEwQ2pOUS81K3UxOEhlZXJ4VkZTQ0toR1R3YUEvdC9ra1ZLb1NvRTJx?=
 =?utf-8?B?L2d4bjRyV0NMWTRXUTNlekVXUVBURk9GOHd1Ty9qOTF6bmhSNFp5WmFxWUtO?=
 =?utf-8?B?VzZCZ2Q2c3l4QUlCbWVDVjVaQ2lOZkdPN0RCaFIwTi9KRitKWURzS0V2b3VB?=
 =?utf-8?B?RGU1MGh4eVhkTTVMek95bC9Fckt4WXB0dHVvdnhCdEJWY3BqdWZzeVU0TkJZ?=
 =?utf-8?Q?UANHOSt+2OuXjGrQoxVWBX5EL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbe56828-6c3e-40e0-f92e-08db346114e5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4752.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 16:32:57.1363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Je7a925lIR3Y2eT8mEJaUcAtO1AOBzF8KF0/7y258A9x93guxhskP0oY61ihviHrBm7TOVf8mj4E2vEoGTqTWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8052
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
Cc: Lei Yu <yulei.sh@bytedance.com>, Michael Shen <gpgpgp@google.com>, openbmc <openbmc@lists.ozlabs.org>, dhruvaraj S <dhruvaraj@gmail.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>, Ed Tanous <ed@tanous.net>, Abinaya.Dhandapani@amd.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 4/3/23 06:44, Patrick Williams wrote:
> On Wed, Mar 22, 2023 at 07:07:24PM -0500, Supreeth Venkatesh wrote:
>> Can someone please help create bmc-ras or amd-debug-collector repository
>> as there are instances of openpower-debug-collector repository used for
>> Open Power systems?
> The typical process for requesting a new repository is to open an issue
> to the TOF:
>
>      https://github.com/openbmc/technical-oversight-forum/issues
>
> Ideally you would submit a refreshed version of your design into the
> Docs repository, as one of the questions the TOF will likely have is
> "what is the proposed design for this repository".  You will also need
> to have a list of who you expect to be the maintainers (OWNERS) of this
> repository.
>
> There have been a few other issues requesting new repositories in the
> last year.  You might want to read those for examples of the kinds of
> discussion to expect.
>
Thanks Patrick. I have opened an issue 
https://github.com/openbmc/technical-oversight-forum/issues/24


