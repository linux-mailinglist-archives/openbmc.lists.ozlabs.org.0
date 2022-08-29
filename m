Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B2B5A4198
	for <lists+openbmc@lfdr.de>; Mon, 29 Aug 2022 05:53:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGGk51LGWz3bd4
	for <lists+openbmc@lfdr.de>; Mon, 29 Aug 2022 13:53:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=awL3hc9z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.94.114; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=awL3hc9z;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2114.outbound.protection.outlook.com [40.107.94.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGGjY4wgnz2xHH
	for <openbmc@lists.ozlabs.org>; Mon, 29 Aug 2022 13:52:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHgoPiMPRXRhiYBTIxhyWi2eAMPaArs6+/3Y0PBXIxLVtI7ksOs9N9JuMU2GVemkO7klp+n5OrdJy4dMK7hTacKyjpTVzUuKsbW94Bo5pfPe6eAVNu5qA9JeCzpvQqRx/dua/hXOohC8VNG5aqVdsmfVtLt/8L00NNU1wDcw6imuda+zpYV9QlL4UpyHUbORrVS70QS1xOD80UiWzedDoqH4awlFwKYiAVGs/ebTVUgPNEJZodKH6JTt5qszwkU9fD/ALmDN+ngyNeGf5YYcKt2KQ7qGOj0x52prv/8Bh9HG9D48wL8KJzadmoERjFuzcW3wyP6NRwdXH1pbvXoUuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjWb+qkHbtQVHVpB3qFQjoV8x2gOxcxtVIgVbiWmqYg=;
 b=cAXDzKmL9NfBZk2GJRzvDFtmfwahaM+v0P7mlpY60hSNMsWy9i+X+HpK+0CqFg6sByGSu4SzJQz61B0Ic+6+I48zf1BmLL6/3g2uaN7GgTZ+LlZmtX/MZlVdI591R5XNkrGxjgNFH6ZzprWsjMdsGP1trSC6z6FbXaRJ1b28KtPl2nyCV8S0CQQD0D2HiGpVqtdTpyQYy+/r2Vt3xOOfUHKg1tifSgRhircqbQdYERCKg/VQu6LUnvnhtig1BXj4yp6z0Yzya9EIh7rjV8RXE2eIrXPSZfBAARcrZKIqXJWhRP3btdytqqGuevUnTpOtrv+1N8FQwFUZMabx4Y+27g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjWb+qkHbtQVHVpB3qFQjoV8x2gOxcxtVIgVbiWmqYg=;
 b=awL3hc9zxHykEiYZ5KbjgDq/SwQzTJuP+Zfg/sGSpbUYslFsQ4bNfJFhjFejJL2TAU1epvcmZhqznVC2oOJ0PwhSFVp/5mUKXrJuzMr0WfWmPUQYDgEjh+aFDbI1/kptlIzJntgfGZI5Qmvi8H7QfOFUFMTXO0oqGt0C2WcHHhs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BL1PR01MB7747.prod.exchangelabs.com (2603:10b6:208:39a::12) by
 SN6PR0102MB3565.prod.exchangelabs.com (2603:10b6:805:b::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15; Mon, 29 Aug 2022 03:52:07 +0000
Received: from BL1PR01MB7747.prod.exchangelabs.com
 ([fe80::755d:a8d2:1c13:c40c]) by BL1PR01MB7747.prod.exchangelabs.com
 ([fe80::755d:a8d2:1c13:c40c%8]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 03:52:07 +0000
Message-ID: <705b683f-00e5-8d3e-0a9a-8598351d43ac@amperemail.onmicrosoft.com>
Date: Mon, 29 Aug 2022 10:51:59 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: Read smbios2 file failed
To: openbmc@lists.ozlabs.org
References: <CAMqwjCAaHrv0SgA_1hDEjjnX1fur6ijmCJCrn1gTPbr5Z2-ONw@mail.gmail.com>
 <d93fc722-2a24-0921-56ee-b9968edbd6a6@amperemail.onmicrosoft.com>
 <4bda1bb5f09395003c95c645518f34828105b160.camel@yadro.com>
 <DF4PR8401MB06341BDD6521896375C0CF498FDB9@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
 <HK0PR03MB5090C26890DAF0FBB36D883CCFDC9@HK0PR03MB5090.apcprd03.prod.outlook.com>
 <9f4b694e-bfc8-59d7-dec4-5ee8f762c4f5@amperemail.onmicrosoft.com>
 <CAAcJOwv4ieTTcYm60M043iXiWiC9=KNK31Pb7jheedqhr84VLg@mail.gmail.com>
 <7528c7d5-0669-1bc8-5b82-39fad3c9f5a8@amperemail.onmicrosoft.com>
 <DM6PR08MB551466928283CBC3B3D6D68DDC6C9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <DM6PR08MB55145B920E9C7A1509BE9BE2DC709@DM6PR08MB5514.namprd08.prod.outlook.com>
 <CALGRKGPX8ehsNHGLkL=N3A=ZmqVf8tD4i1u8niRnHsnGrwgQYg@mail.gmail.com>
 <DM6PR08MB5514CF4C8AEE58D295B37DA6DC739@DM6PR08MB5514.namprd08.prod.outlook.com>
 <CALGRKGO8QtET2HJZGZ0V99F4KxdXX6gZErWrY3FdNPf=LhdnnA@mail.gmail.com>
From: "Thang Q. Nguyen" <thang@amperemail.onmicrosoft.com>
In-Reply-To: <CALGRKGO8QtET2HJZGZ0V99F4KxdXX6gZErWrY3FdNPf=LhdnnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0046.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::15)
 To BL1PR01MB7747.prod.exchangelabs.com (2603:10b6:208:39a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6eab6436-aef0-4c1a-6c2d-08da8971d781
X-MS-TrafficTypeDiagnostic: SN6PR0102MB3565:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ImAaWnqzrVUECgBrcVgurdD2ZBJeVH3wMytJw1ItiC4ChJDsLV9fe5MStz1xxolghZDXNqf5bIKeIg+3fLAuzWEDCkDmCgakypM8b5i5WCuGUyTcuZ1X0fZWDGvNZHcS4j9O85zy8vdb/QoUl9mRRv2aKdVeOK+vQNR5bJovrnHJ7eDtyz+RCRXG/WmHEBeAi5+sYIDX52he+NAJd9tO1pzTiId3U9pJXq8B+tU30imFvEHt9L8Ru+HCzz+wWYIbHwiG3rhml1oBvuLhuRuOT/EAH6Dm8oW3SeGsP826mXpkIms9qLsDputvJbf8NrSHrV9w7ik72zSiI2X8ZzZBX21F5khKAtBabK/XSErDF5nr+TKHj09Mem8tgsh5N7wMAtQlpCUlcO1oUVd6uBqTK57ilUUhVRnQgjBifZHDVOUL9me6BuNY9sMxo+vLpOJRv+bpCNhrWmO+CncUqgtLHojSSfsKvh5Npit52IzCfJNYuYQMV2qh27G5DxuSpjvdcOSwppgSImfyhSQpv5F1mbJLHQ6dg+YV1s29ZyeNkRr/27xdamH5txo4FAkq4wT4R755fqeK2ZNrcUmeFJUuik2GVZZA2AFe7rHroX4H9djtkrwoXyjZDx892Cxh0XeAw6cZwEWLqHab7DaE2RA+CqNPmy0YOiraOnxuBGJZErlkh2NGCmFx0A3ODiK9HQo2k40GTukX+LaXoF0rntHObZFoVQU5b8bckeDmCWPXva28A5AdIx16p3S8KA9LQAWeTnNOvD8eLOspQUBgg0+iSqWYFXwb/iM/54jnPk2gfBNviG/XHrv5jXMlllPOF8epldcPBcyocQdf4rChgmGk3g==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR01MB7747.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39840400004)(376002)(396003)(136003)(366004)(6666004)(53546011)(6512007)(6506007)(52116002)(31696002)(26005)(186003)(2616005)(66574015)(31686004)(42882007)(478600001)(41300700001)(6486002)(966005)(83380400001)(83170400001)(8936002)(8676002)(66476007)(6916009)(316002)(66946007)(66556008)(5660300002)(30864003)(38100700002)(38350700002)(2906002)(41852002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?WHZ4bHI5L3ZtU0RXTWJsQURkZDJPR3c1bmRCYUVab1haVitsVHpSMkxxSm5M?=
 =?utf-8?B?SnJjQlZyODdKbC85aXFEQm1DVk5rYkk2RjRHelVUVnhoZU9PK1h3SUdjK28x?=
 =?utf-8?B?cHlOQlJZM1JSamNlbnhMWm1pSWgrTzM5NnIyNDkveW5sV2hBcTg3Z0NUTDNx?=
 =?utf-8?B?T2xsdDM4VUowc3JzLzlkVWFrOEVwakRrdWMvVmdnN3lyVHBQY0ZOc0llY0du?=
 =?utf-8?B?N1RwdStKVmJrZTgrMnRLc1Z3cW5nWFRrdEhBVkJQUmM0eVdwYitNUUY1MGpY?=
 =?utf-8?B?QU1TeUFKK01jM1RWLzhqVDdVeGFSa0JtSWJIYUI5NTlhYUZrUklJYUZlS1Qz?=
 =?utf-8?B?Q003aGZuNEpCZW1vMGR6U3RjSFpkR0pDc0o0aEFnZEZjRVBVa1oxNFNadVFD?=
 =?utf-8?B?NEoxQUlYa3VHU2RxendZZ01VNjQ0dWdTKzFjUlQ3Y2lJU1htWFZpOXk3QVNB?=
 =?utf-8?B?QTNzNjFLUUZVekRIbTFTWmFnaU5nUEhPbHEyWnV2UjRuS2c4SXJET0xidTlC?=
 =?utf-8?B?OTlVb3BJT0tyUXZkOWl4QUNZdloxQVpsRVR6ZndqL1VBMXprTndJeFp3TGtr?=
 =?utf-8?B?eDRLTHoxcC9DcE9VZUpFZFEvOGJjc2xSd2g4UFlTV3ZoNm85LzdXbDNqU3lJ?=
 =?utf-8?B?TjJRMmlhY3ZwOHRxZ2plUWJpbWFjcmg1ajZwTmRDWFd1S1ZjNldCM0xETytF?=
 =?utf-8?B?WDFSY2NhNmxDaW9JMXVlWHIyV0E4aEJkTXVpVEJhVzE3Z2RYNzdXYURwT1JM?=
 =?utf-8?B?TDdpVDJaYXJOc2RsYUprazNGUndMWUo0UFFpRTV0RDIwcFhyVUxiRHpUTlVU?=
 =?utf-8?B?d2R5UGFhd3dFRTFlL3k5V0o5VGpXOFlEblRLaDI0SG5XMmtqbzlWRkZlNFk3?=
 =?utf-8?B?RGdSQ2IrdmdxanA5alZxN3hPRXNVOTdrVFhYYjB0c2M1aTkvekR0OHkzVUVJ?=
 =?utf-8?B?WTFlVEJEV3BUTDdlWC8ydnNpR0tRbmNqaXViaW1yS0dOMkp4dEErTnJrTkJP?=
 =?utf-8?B?ZXk5Z1J4Rnh1U0gzWWpXRzk0VVBuUGd3RGt0TUxVQTdhWW82dHZoUzVDVFpC?=
 =?utf-8?B?RThpbnhnTWpKM3ExbGt1Wk41Nzh6RzBXSm51NVB1OTV5cWpCV3JxdlJMcDNE?=
 =?utf-8?B?NzFwT1RxMHNuY0JqbG45WDVuK0dobWhmd0dtL3lWb3NuRDU5TkRMWjIybUlN?=
 =?utf-8?B?ZG96TEVtSzNiZnBKZVcvZDVaV1cvL0xBcjJRQUM4WFZZa2ZDakZUMmpYd3RW?=
 =?utf-8?B?V292VHJrOXVVSmdXOFo5aVZnZHIzR256QWNDa3dZbERYbW1IL2dFemdGWG5T?=
 =?utf-8?B?YSs3NGVMQjU4YVIwWnZWOU1iNmJJMFRkenhPMDhFY3ByTFlCbVpmcEVJT2RW?=
 =?utf-8?B?aDc4TnhNUy91MkhTNlFZS1I1Nktqd2plTEg2cHdXMkU0a003MWZVczhDWGFT?=
 =?utf-8?B?NEJmZi80aVM3TjBoRisxbFF2NXRBR3gydDFaQzBYREdhaTVZUlcvWGw5ai9F?=
 =?utf-8?B?VGs4cUFJL01hRUxXVlQvR1VKS2JLZjBWTENkSkF5UFoxakZOVUk5NXd5UWFW?=
 =?utf-8?B?K3FrdytLNFNhTzBESWRCOW53Z0tueGpwM2JSL1d3MkZPUkhEQTBYOVVJVkUy?=
 =?utf-8?B?eDYyUnN2U0UyRmhwSlluQWtzV2R6M2RLak54eklrZnNiSkg2aU8xeWVEc2Jr?=
 =?utf-8?B?L0VnOTIvK3NkZG1DMnhCeTZ6enROSjZ2WHk5M3BGcWZIOU8zZkhLT3krMWQ3?=
 =?utf-8?B?cTBFR1U0Y3BPRVlqRHZNa3dhVFc0alJKeG9jb2oyNU1qZXRQMXZvMmFUUEd0?=
 =?utf-8?B?N1NQVGRhc05rOWhRSXVqampGeUU4VHNzRE0xNlFnbVVzd2xuYmNqTFJYRVFk?=
 =?utf-8?B?ME1nR1NhenRCV0tWS00yT1k2RHgwSEhsanNhcGQyNVdkNmhPYURyN3lYdkpo?=
 =?utf-8?B?OXgvT3JHaGhZM0hCSHJMNHlYamZFaFJxNW05eE5rQm9XZU01bkJmdG9jQmw4?=
 =?utf-8?B?L3F6VTdXTXpVNW1RWnlNaWRlMExJT21ZRytKNnhQV0RoMHZYNUtpakdJcHY0?=
 =?utf-8?B?d2l5cXViT2p0clRzVGJBWUduenRKQlhLLzRheWV5ZEpoUSs5TWQrSXFmZnJq?=
 =?utf-8?B?bHZUMjZkbWRqenR3UFRwL2ttbDNSWkU5blN6T1crVjh2Q1lSa1Rrc05QNmMx?=
 =?utf-8?Q?a3qCCpmu3+wNzzHeUQiMEw4=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eab6436-aef0-4c1a-6c2d-08da8971d781
X-MS-Exchange-CrossTenant-AuthSource: BL1PR01MB7747.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 03:52:07.1394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7wpI0HJiIuDarR7vrKt1frfPqA323OCkGtIqr6DpBe70XufCHOwvGX0FS/G6oW/W9qEgXbSyPyL3VEZhXXYPOmv5HogIt49i2hUA/9GYGv+lPe3tR/TsLX3UMpkEoBfA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR0102MB3565
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

Instead of using  smbios_transfer in u-root, what is the IPMI raw 
command to send blob data to BMC?


Thanks,

Thang Q. Nguyen

On 24/08/2022 23:37, Brandon Kim wrote:
> Hi Chris, thanks for adding more debug messages.
>
> We don't see this failure.. I'm guessing we're 100% sure that IPMI is
> not an issue here (I think not, since we're able to enumerate the
> blobs)? Could you check to see if the open was actually successful and
> that it was written with the correct flags?
>
> Could you also ensure you're at the very latest SRCREV of OpenBMC as well?
>
> Thanks,
> Brandon
>
> On Wed, Aug 24, 2022 at 2:25 AM Chris Chen (TPI) <Chris.Chen3@flex.com> wrote:
>> Hi Brandon and Jie,
>>
>>
>>
>> I think I have added "smbios-ipmi-blob" library and also updated the SRCREV to the latest in the smbios-mdr_git.bbappend file.
>>
>>
>>
>> So, I added some debug messages in the "phosphor-ipmi-blobs" and the "u-root" repos respectively. I figured out one weird thing that is the BMC-side doesn't receive the "bmcBlobWrite" command, and then Host-side gets failed due to no response. Following are the messages I captured, could you help to have a look at it and give some clues? Thank you.
>>
>>
>>
>> === Host-side ===
>>
>> $ sudo ./smbios_transfer -num_retries 1
>>
>> 2022/08/24 16:40:53 Transferring SMBIOS tables, attempt 1/1
>>
>> 2022/08/24 16:40:53 BlobGetCount
>>
>> 2022/08/24 16:40:53 ctransferSmbiosData - total blobCount=4
>>
>> 2022/08/24 16:40:53 BlobEnumerate
>>
>> 2022/08/24 16:40:53 ctransferSmbiosData id=/flash/hash
>>
>> 2022/08/24 16:40:53 BlobEnumerate
>>
>> 2022/08/24 16:40:53 ctransferSmbiosData id=/flash/image
>>
>> 2022/08/24 16:40:53 BlobEnumerate
>>
>> 2022/08/24 16:40:53 ctransferSmbiosData id=/smbios
>>
>> 2022/08/24 16:40:53 BlobOpen
>>
>> 2022/08/24 16:40:53 BlobWrite
>>
>> 2022/08/24 16:41:03 ReceiveResponse - failed to read rawconn: i/o timeout
>>
>> 2022/08/24 16:41:03 BlobClose
>>
>> 2022/08/24 16:41:13 ReceiveResponse - failed to read rawconn: i/o timeout
>>
>> 2022/08/24 16:41:13 Error tranferring SMBIOS tables over IPMI: failed to write and commit blob /smbios: IPMI BlobWrite /smbios failed: failed to read rawconn: i/o timeout; IPMI BlobClose /smbios failed: failed to read rawconn: i/o timeout
>>
>> ==============
>>
>>
>>
>> === BMC-side ===
>>
>> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: Registering OEM:[0X00C2CF], Cmd:[0X80] for Blob Commands
>>
>> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries - Enter
>>
>> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries dlopen:/usr/lib/blob-ipmid/libfirmwareblob.so
>>
>> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: config loaded: /flash/image
>>
>> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries dlopen:/usr/lib/blob-ipmid/libsmbiosstore.so.0
>>
>> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler - createHandler
>>
>> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries dlopen:/usr/lib/blob-ipmid/liblogblob.so
>>
>> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries dlopen:/usr/lib/blob-ipmid/libversionblob.so
>>
>> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries dlopen:/usr/lib/blob-ipmid/libfirmwarecleanupblob.so
>>
>> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries – Exit
>>
>> …
>>
>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter
>>
>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=0
>>
>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: Blob::getBlobCount - Enter
>>
>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler::getBlobIds - blobId=/smbios
>>
>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: Blob::getBlobCount - Exit
>>
>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Exit
>>
>>
>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter
>>
>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=1
>>
>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: BlobManager::getBlobId - ids=/flash/hash
>>
>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Exit
>>
>>
>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter
>>
>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=1
>>
>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: BlobManager::getBlobId - ids=/flash/image
>>
>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Exit
>>
>>
>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter
>>
>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=1
>>
>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: BlobManager::getBlobId - ids=/smbios
>>
>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Exit
>>
>>
>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter
>>
>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=2
>>
>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: Blob::openBlob - Enter
>>
>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: openBlob path=/smbios
>>
>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler::open - Enter
>>
>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler::open - Exit
>>
>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: Blob::openBlob - Exit
>>
>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Exit
>>
>>
>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter
>>
>> Jan 01 00:08:35 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=6
>>
>> Jan 01 00:08:35 hudsonbay-obmc ipmid[190]: Blob::closeBlob - Enter
>>
>> Jan 01 00:08:35 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler::close - Enter
>>
>> Jan 01 00:08:35 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler::close - Exit
>>
>> Jan 01 00:08:35 hudsonbay-obmc ipmid[190]: Blob::closeBlob - Exit
>>
>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand (replyLength==0) - Exit
>>
>> ==============
>>
>>
>>
>> Regards,
>>
>> Chris Chen
>>
>> ________________________________
>>
>> 寄件者: Brandon Kim <brandonkim@google.com>
>> 寄件日期: 2022年8月24日 上午 12:43
>> 收件者: Chris Chen (TPI) <Chris.Chen3@flex.com>
>> 副本: Jie Yang <jjy@google.com>; openbmc <openbmc@lists.ozlabs.org>
>> 主旨: Re: Read smbios2 file failed
>>
>>
>>
>> !-------------------------------------------------------------------|
>>
>>    This email was sent from someone outside of Flex. Do not
>>    click on any links, reply or open attachments unless you
>>    recognize the sender and know the content is safe. If
>>    suspicious, report it to spamsample@flex.com.
>> |-------------------------------------------------------------------!
>>
>> Hi Chris,
>>
>> Yes, running the go program you compile and running smbios_transfer
>> binary as you did, should do what you expect. However, there is a
>> PACKAGE_CONFIG you will have to append for the ipmi-blob side of
>> things to work:
>>
>> Please try building with the following line in your meta layer's
>> recipes-phosphor/smbios/smbios-mdr_%.bbappend
>>
>> ```
>> PACKAGECONFIG:append = " smbios-ipmi-blob"
>> ```
>>
>> Cheers,
>> Brandon
>>
>>
>> On Tue, Aug 23, 2022 at 12:40 AM Chris Chen (TPI) <Chris.Chen3@flex.com> wrote:
>>> Hi Brandon and Jie,
>>>
>>> I would like to send the SMBIOS table from Host to BMC by using "smbios-ipmi-blobs" interface. And according to Jie's clue (can send the smbios tables to BMC either through LinuxBoot or host), and then I saw both of you were contributing to the "https://urldefense.com/v3/__https://github.com/u-root/u-root/blob/main/cmds/exp/smbios_transfer/smbios_transfer.go__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS55JUTxghw$  ". Therefore, I have some questions about this, could you help to answer them?
>>>
>>> I'm assuming that I can build "smbios_transfer" command and execute it on the Host-side (with installed Ubuntu 20.04), am i correct?
>>>
>>> In fact, I'm not familiar with u-root and GO language. However, after referring to some websites to install GO and download u-root, I for now have built the cmd out and run it on my Host. Unfortunately, the result looks like failed.
>>> ===
>>> $ sudo ./smbios_transfer
>>> 2022/08/23 14:47:14 Transferring SMBIOS tables, attempt 1/2
>>> 2022/08/23 14:47:34 Error tranferring SMBIOS tables over IPMI: failed to write and commit blob /smbios: IPMI BlobWrite /smbios failed: failed to read rawconn: i/o timeout; IPMI BlobClose /smbios failed: failed to read rawconn: i/o timeout
>>> 2022/08/23 14:47:34 Transferring SMBIOS tables, attempt 2/2
>>> 2022/08/23 14:47:54 Error tranferring SMBIOS tables over IPMI: failed to write and commit blob /smbios: IPMI BlobWrite /smbios failed: failed to read rawconn: i/o timeout; IPMI BlobClose /smbios failed: failed to read rawconn: i/o timeout
>>> ===
>>>
>>> Do you have any suggestions on this error?
>>>
>>> ps. I'm sure the IPMI BT interface is workable.
>>>
>>> On the BMC-side, I just need to enable smbios-mdr package, correct? or anything else?
>>>
>>>
>>> Thanks.
>>>
>>> Regards,
>>> Chris Chen
>>>
>>> ________________________________
>>> 寄件者: Chris Chen (TPI) <Chris.Chen3@flex.com>
>>> 寄件日期: 2022年8月19日 下午 05:50
>>> 收件者: Thang Nguyen <thang@amperemail.onmicrosoft.com>; Jie Yang <jjy@google.com>
>>> 副本: Garrett, Mike (HPE Server Firmware) <mike.garrett@hpe.com>; Andrei Kartashev <a.kartashev@yadro.com>; CS20 CHLi30 <chli30@nuvoton.com>; openbmc <openbmc@lists.ozlabs.org>
>>> 主旨: 回覆: Read smbios2 file failed
>>>
>>> Hello everyone,
>>>
>>> I would like to send the SMBIOS table from Host to BMC by using "smbios-ipmi-blobs" interface. But, after reviewing all your discussions, I still have no idea how to enable the feature. Could you help to share more details with me? for example,
>>>
>>> How to generate a raw SMBIOS table with MDRv2 header? (like using "dmidecode --dump-bin" and what else?)
>>> How do start sending SMBIOS binary file at Host-side? (As I know, the FW update mechanism through IPMI blob would need to build a host-tool, named burn-my-bmc, on the Host and then run the tool to start image data transformation. Does the "smbios-ipmi-blobs" with the same method?)
>>>
>>>
>>> p.s. The OS running on the Host is Ubuntu 20.04.
>>>
>>> Thanks.
>>>
>>> Regards,
>>> Chris Chen
>>>
>>> ________________________________
>>> 寄件者: openbmc <openbmc-bounces+chris.chen3=flex.com@lists.ozlabs.org> 代表 Thang Nguyen <thang@amperemail.onmicrosoft.com>
>>> 寄件日期: 2021年9月17日 下午 09:40
>>> 收件者: Jie Yang <jjy@google.com>
>>> 副本: Garrett, Mike (HPE Server Firmware) <mike.garrett@hpe.com>; Andrei Kartashev <a.kartashev@yadro.com>; CS20 CHLi30 <chli30@nuvoton.com>; openbmc <openbmc@lists.ozlabs.org>
>>> 主旨: Re: Read smbios2 file failed
>>>
>>>
>>> Thanks Jia for your information
>>>
>>> On 17/09/2021 05:36, Jie Yang wrote:
>>>
>>> Hi,
>>>
>>> Actually I added an ipmi blob interface to smbios-mdr https://urldefense.com/v3/__https://github.com/openbmc/smbios-mdr/tree/master/src/smbios-ipmi-blobs__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS54qpIAumA$  . With this interface you can send the smbios tables to BMC either through LinuxBoot or host. The LinuxBoot code https://urldefense.com/v3/__https://github.com/u-root/u-root/tree/master/cmds/exp/smbios_transfer__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS54GUWKtiw$  . Writing and committing to this blob will generate the MDR header.
>>>
>>> -Jie
>>>
>>> On Thu, Sep 16, 2021 at 4:19 AM Thang Nguyen <thang@amperemail.onmicrosoft.com> wrote:
>>>
>>> Thanks Tim, Mike and Andrei for very useful information. We can make it
>>> work by adding MDRv2 header.
>>>
>>> I am finding some information about the IPMI blobs commands. I can see
>>> some notes at
>>>
>>> https://urldefense.com/v3/__https://github.com/openbmc/docs/blob/master/designs/binarystore-via-blobs.md__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS57DJil0FA$
>>>
>>> https://urldefense.com/v3/__https://github.com/openbmc/phosphor-ipmi-blobs/blob/master/README.md__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS56DlU_SCA$
>>>
>>> But I have not found more description about the IPMI blob commands like
>>> NetFn, Func, ... that I can send a file from Host to BMC. Do you have
>>> any information about them?
>>>
>>>
>>> Thanks,
>>>
>>> Thang Q. Nguyen
>>>
>>> On 16/09/2021 09:40, CS20 CHLi30 wrote:
>>>> Hi Thang,
>>>> Did you try to use smbios_entry_point or DMI from host to BMC /var/lib/smbios/smbios2 for parsing?
>>>>
>>>> You can refer this sysfs-firmware-dmi-tables as below:
>>>>
>>>> The firmware provides DMI structures as a packed list of data referenced by a SMBIOS table entry point.
>>>> The SMBIOS entry point contains general information, like SMBIOS version, DMI table size, etc.
>>>> The structure, content and size of SMBIOS entry point is dependent on SMBIOS version.
>>>>
>>>> The format of SMBIOS entry point and DMI structures can be read in SMBIOS specification.
>>>> The dmi/tables provides raw SMBIOS entry point and DMI tables through sysfs as an alternative to utilities reading them from /dev/mem.
>>>>
>>>> The raw SMBIOS entry point and DMI table are presented as binary attributes and are accessible via:
>>>> /sys/firmware/dmi/tables/smbios_entry_point
>>>> /sys/firmware/dmi/tables/DMI
>>>>
>>>> Best regards,
>>>> Tim
>>>>
>>>> -----Original Message-----
>>>> From: openbmc [mailto:openbmc-bounces+chli30=nuvoton.com@lists.ozlabs.org] On Behalf Of Garrett, Mike (HPE Server Firmware)
>>>> Sent: Wednesday, September 15, 2021 9:19 PM
>>>> To: Andrei Kartashev <a.kartashev@yadro.com>; Thang Nguyen <thang@amperemail.onmicrosoft.com>; openbmc <openbmc@lists.ozlabs.org>
>>>> Subject: RE: Read smbios2 file failed
>>>>
>>>> We recently did the same thing and got it working.  All you have to do is take the RAW smbios records blob in binary form (delivered as noted below in whatever way you choose) and prepend a specific header:  https://urldefense.com/v3/__https://apc01.safelinks.protection.outlook.com/?url=https*3A*2F*2Fgithub.com*2Fopenbmc*2Fsmbios-mdr*2Fblob*2F33c948a473bd273fea0cff82d4c99b70b7784be6*2Finclude*2Fsmbios_mdrv2.hpp*23L114&amp;data=04*7C01*7Cchli30*40nuvoton.com*7C81a4bd29e4904bf4d84608d978510b92*7Ca3f24931d4034b4a94f17d83ac638e07*7C0*7C0*7C637673526954552742*7CUnknown*7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo__;JSUlJSUlJSUlJSUlJSUlJSUlJSU!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS56BTyjjfg$   iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=oQwcozsSoGlgSFwztPFV3FAoPpRZGYoZ7pc0%2BxDi1MA%3D&amp;reserved=0
>>>>
>>>> It is a little bit fragile as it introduces a dependency on the file download logic to write a non-standard header defined in another service that could potentially change.
>>>>
>>>> Mike
>>>>
>>>>> -----Original Message-----
>>>>> From: openbmc <openbmc-
>>>>> bounces+mike.garrett=hpe.com@lists.ozlabs.org> On Behalf Of Andrei
>>>>> Kartashev
>>>>> Sent: Wednesday, September 15, 2021 3:17 AM
>>>>> To: Thang Nguyen <thang@amperemail.onmicrosoft.com>; openbmc
>>>>> <openbmc@lists.ozlabs.org>
>>>>> Subject: Re: Read smbios2 file failed
>>>>>
>>>>> I don't know what is format of "dmidecode --dump-bin", but if it just
>>>>> raw dump of smbios then you only need to add mdr header.
>>>>>
>>>>> See answer for the same question here:
>>>>> INVALID URI REMOVED
>>>>> 021-July/026882.html__;!!NpxR!2w0FkPs2KyaB6XOvB8et52bWKqAMLImmL-
>>>>> iUk9A_zZbJ8WLhMeXdvRAp-pcxt8Q$
>>>>>
>>>>> On Wed, 2021-09-15 at 12:41 +0700, Thang Nguyen wrote:
>>>>>> Hi Andrei,
>>>>>>
>>>>>> I see output of "dmidecode --dump-bin" follows SMBIOS specification.
>>>>>> As
>>>>>> the data for smbios-mdr does not follow this, do you know about the
>>>>>> document or any information I can reference to prepare data to send
>>>>>> to BMC??
>>>>>>
>>>>>>
>>>>>> Best Regards,
>>>>>>
>>>>>> Thang Q. Nguyen
>>>>>>
>>>>>> On 14/09/2021 15:51, Andrei Kartashev wrote:
>>>>>>> No, it is not same as "dmidecode --dump-bin".
>>>>>>>
>>>>>>> On Tue, 2021-09-14 at 13:46 +0700, Thang Nguyen wrote:
>>>>>>>> On 13/09/2021 23:56, Andrei Kartashev wrote:
>>>>>>>>> You need to somehow deliver smbios data image to BMC. This
>>>>>>>>> means, your BIOS should implementat some logic to transfer
>>>>>>>>> this data.
>>>>>>>>> For BMC side see example here:
>>>>>>>>> https://urldefense.com/v3/__https://apc01.safelinks.protection.outlook.com/?url=https*3A*2__;JSU!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS57ySTDXQQ$
>>>>>>>>> F%2Fgithub.com%2Fopenbmc%2Fintel-ipmi-&amp;data=04%7C01%7Cchli
>>>>>>>>> 30%40nuvoton.com%7C81a4bd29e4904bf4d84608d978510b92%7Ca3f24931
>>>>>>>>> d4034b4a94f17d83ac638e07%7C0%7C0%7C637673526954552742%7CUnknow
>>>>>>>>> n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik
>>>>>>>>> 1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=cG6ZZzOSXkuUtcQuuoymsRdP
>>>>>>>>> p24mINa%2FhCy%2BYhe%2FNmk%3D&amp;reserved=0
>>>>> oem/blob/master/src/smbios
>>>>>>>>> mdrv2handler.cpp
>>>>>>>> Hi Andrei,
>>>>>>>>
>>>>>>>> What is the format of smbios data to transfer to BMC? Is it the
>>>>>>>> same content of "dmidecode --dump-bin" command from Host Linux?
>>>>> or
>>>>>>>> anything special in formatting the content to send?
>>>>>>>>
>>>>>>>>> On Mon, 2021-09-13 at 17:40 +0300, Alexander Raih wrote:
>>>>>>>>>> Hi guys, I am beginner in openbmc I build openbmc with
>>>>>>>>>> smbios-mdr repository and I have error:
>>>>>>>>>>
>>>>>>>>>> Read data from flash error - Open MDRV2 table file failure
>>>>>>>>>>
>>>>>>>>>> There isnt file in /var/lib/smbios/smbios2
>>>>>>>>>>
>>>>>>>>>> How I can resolve this problem?
>>>>>>>>>> Help me please!!!
>>>>> --
>>>>> Best regards,
>>>>> Andrei Kartashev
>>>>>
>>>> ________________________________
>>>> ________________________________
>>>>    The privileged confidential information contained in this email is intended for use only by the addressees as indicated by the original sender of this email. If you are not the addressee indicated in this email or are not responsible for delivery of the email to such a person, please kindly reply to the sender indicating this fact and delete all copies of it from your computer and network server immediately. Your cooperation is highly appreciated. It is advised that any unauthorized use of confidential information of Nuvoton is strictly prohibited; and any information in this email irrelevant to the official business of Nuvoton shall be deemed as neither given nor endorsed by Nuvoton.
>>> Legal Disclaimer :
>>> The information contained in this message may be privileged and confidential.
>>> It is intended to be read only by the individual or entity to whom it is addressed
>>> or by their designee. If the reader of this message is not the intended recipient,
>>> you are on notice that any distribution of this message, in any form,
>>> is strictly prohibited. If you have received this message in error,
>>> please immediately notify the sender and delete or destroy any copy of this message!
