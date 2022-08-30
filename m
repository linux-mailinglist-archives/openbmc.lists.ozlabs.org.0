Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 205E65A58D6
	for <lists+openbmc@lfdr.de>; Tue, 30 Aug 2022 03:10:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGq3Z21gVz3bnM
	for <lists+openbmc@lfdr.de>; Tue, 30 Aug 2022 11:10:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=YonBmmMS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.94.103; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=YonBmmMS;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2103.outbound.protection.outlook.com [40.107.94.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGq326cBLz3bTZ
	for <openbmc@lists.ozlabs.org>; Tue, 30 Aug 2022 11:09:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DG8aVweBmrzM4CwIdO1z81iuWr3auD3OAGmJKjYOFobgKSMiCoEfcVmN2XVK7YEcwIMTbxLfW3jijV0gqpGhLtwDklomUcVhmGiOM1hj8piOIbgcB/fdVGS6tFBofvXujoV4z4flTbTz4moFmY6M+ShJXYwqhzz2ftEFBMQcCEtsMScRDKW7rqomF0EJH5Nk+Po5maGoPq/tk/hgNuKZbkgSrYrq3ehXhPCiotcxNl0kuVeBtcmIPFlp07YWlvQxsQIGed9JCgE5RYDs2xIDOj0mZp6Gf36V1J4UD27DckwNLXIolRQuCAHOLxAbLUzSODJ1gBPZ8Nu+D3gdVEyFjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLerW21VeCW4+ZusI8uvy+sWNAaTNLWLlPGXiqEmiw8=;
 b=hZV2OAtvVzbeArL4uO3GFFLkosD3aT6K+gIgz41K6CODoB55VTFZs6t+W6yURPb8U0Hv7Y1jjklaVzvCkg3ng+STdf1w7rK+z/N/5O4NxqPhYk96/RjNul92qahCT8kk9jZmk/84LGiVX1Z4vpucPCOp2x+UbH7yL/oRm+KcV9ro/pvVBWbERwB9IlWB5icbE9FAk85IebqYUiWnkoolWGrrmpqvnYjYOPm99U3uXlvHS0k1AKXWEp3/htpIWkxwBl3rNZhX80Q6zW3ZXEXKB11kTYt8S1hZqGVBEPxpXs2e8tQj8sGb4pGU5mlrodNxQgx4ZBmarLFG36HbsYN2+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLerW21VeCW4+ZusI8uvy+sWNAaTNLWLlPGXiqEmiw8=;
 b=YonBmmMSIxDVOP4BtOnfOnPNbd6YGHll2yAjlZ30SHcsC/iseF8PRLeIihrVnswLK8FtpdsrIpnmr5UN7493qw9MTC5GZCUdczK9QUQn3WMVETuU0VsW2klabRDUBG/bKTYzYnojDYR4KUBD/OWTiPwp5+J3WwvmxpDcR12af5A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BL1PR01MB7747.prod.exchangelabs.com (2603:10b6:208:39a::12) by
 SA0PR01MB6473.prod.exchangelabs.com (2603:10b6:806:ec::8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15; Tue, 30 Aug 2022 01:09:12 +0000
Received: from BL1PR01MB7747.prod.exchangelabs.com
 ([fe80::755d:a8d2:1c13:c40c]) by BL1PR01MB7747.prod.exchangelabs.com
 ([fe80::755d:a8d2:1c13:c40c%8]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 01:09:12 +0000
Content-Type: multipart/alternative;
 boundary="------------YRq7qAxgES0Hj0eSPtwTIpyy"
Message-ID: <e3c30a49-0d78-dea6-c643-8b611a507f53@amperemail.onmicrosoft.com>
Date: Tue, 30 Aug 2022 08:09:04 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: Read smbios2 file failed
Content-Language: en-US
To: Brandon Kim <brandonkim@google.com>
References: <CAMqwjCAaHrv0SgA_1hDEjjnX1fur6ijmCJCrn1gTPbr5Z2-ONw@mail.gmail.com>
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
 <705b683f-00e5-8d3e-0a9a-8598351d43ac@amperemail.onmicrosoft.com>
 <CALGRKGPZjJY=KNJexGfpfhs_bo=GQe9b4kRvvsZCiAYUa6XXdw@mail.gmail.com>
From: "Thang Q. Nguyen" <thang@amperemail.onmicrosoft.com>
In-Reply-To: <CALGRKGPZjJY=KNJexGfpfhs_bo=GQe9b4kRvvsZCiAYUa6XXdw@mail.gmail.com>
X-ClientProxiedBy: SG2PR02CA0105.apcprd02.prod.outlook.com
 (2603:1096:4:92::21) To BL1PR01MB7747.prod.exchangelabs.com
 (2603:10b6:208:39a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a656567-8184-47c6-5e1d-08da8a243fc1
X-MS-TrafficTypeDiagnostic: SA0PR01MB6473:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	mznmrU2kQ5xr5PlWMVDlDnhzkJfFn/mvlcrUP/x55in8nF2/o4Oix3MFQRC4ismwkRv5qofM/2SWosbsqOT6MTWZpQQ8uYmEdD5/XiHbVHXiGM0NEAf3L147cjJ4HByi0MJy7chTSGaOcAjDt867cMmOxM07DF/KIpoMjFBHkpF74Za6LAxHXQfedNU6PaNCk7wTcQpH7ov6HsOvtti1oyHTGN2W66hSsoiRDyt4vgra/4xPnJcitmpqlYeSKCqlsYjHgPs0DTpBVqDYyGcuTNrcdK50Cfdc+ZQlW1KK/0yAp1dgFSNKyieyf8ttxU48JLc4ZZflJLnDdt2iwWFm1bsOJf5q1cuTsoxaooJwt0N7W8Z065Jgt78x4ODG1yXEG2HAhVxE/Zr8vLwUxjsyS6Qa7bjH2RbhjQ68S/yjPKhmrJnleosiTiT5ZGrqUxKPPC7OTsSVXvPsFYl5fSrMrBjh6BBcal1Nyyf9Ye7Rhp80As2cyk+Rir5pYLdKid4epwG7Bm5CZAus4P5Xx0PKnvB1fFIBQ7OuGlCIvv0vp/gAKjERnkTKp5CMrdT6IufKL33kt7Gi/aCRG58WGecWJOdMv/Oo9PJczZvxcASVr71KlJlRXc2pEjBESxohKwML0a55miUR0hvFdlkBhjVaVxRzZbAfNfjqI8yV0yFLl8M5JoiA5vAWoQF+U8pYXXVAsleAuuytXqU8YzgLLnHmWxIGx4L5qBvHBjpe6ckKY7ifhJxiJpi1UpY8F681nCtAJAReUesfHbQjBJ1ctIrBm0JnThbuplY1Fukm5sIsLg7jfW0IBuNLMtDE9nrzIbSxwoHspIs+ETXT+OkfRbICew==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR01MB7747.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(136003)(366004)(346002)(376002)(396003)(8936002)(4326008)(66556008)(66946007)(8676002)(5660300002)(66476007)(2616005)(30864003)(316002)(31686004)(6916009)(2906002)(26005)(6486002)(478600001)(6666004)(6506007)(41300700001)(33964004)(966005)(53546011)(52116002)(66574015)(38350700002)(6512007)(31696002)(83170400001)(166002)(83380400001)(42882007)(186003)(38100700002)(41852002)(43740500002)(579004)(559001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?dHhjOVJRTDFxcklja2p1NG1nb3pqakxvWURVRGVvY0YwRWphckFVVk5pYys5?=
 =?utf-8?B?bW1sYTdaOG85bWdma09HK3duZlRVaE1rbDBxNmxlV3Z3NE81ZmxGSHA5ZHJm?=
 =?utf-8?B?cnhzSHd3dWM3Zm0rNFpsYy9rbW8vVHJNQmUwTVkrTUZCVEh6ZDVFS1lVYWIx?=
 =?utf-8?B?T3hGMENFaS9jS3VqR1RTVlFKc0pjNThtenVYV2VWOTVnY2wyMjhUS0xoKzRy?=
 =?utf-8?B?U1RIQ1VlTVVCUHdma1VZU1l6S3FUMy9WTUtUTkl0eEgwVTMvQWIzMjQvZ3Ex?=
 =?utf-8?B?RU9jVnp5aER6UGhvZDVpYnJPZEZzWlUyNTE0OXZFcUUvdjVSNC9lU3JyL01T?=
 =?utf-8?B?QnBHSVNsakw2aUsvNTRFODJQZ2haTkt0UkpXakxHc2NIcGRzbytkZHp4cGxW?=
 =?utf-8?B?UDZjSDRmTU1DNzUzUzgwRnN2VU9pcTVxRktKQUV5cmhrd3F6NnRXVklqQ0Vo?=
 =?utf-8?B?eW1PdEc2dlR5eVQ3b2dzZ2JZUlhlZ1RDSW1IYkxDOFMraUg3U2s1MjBIQVBF?=
 =?utf-8?B?bXMzdURZR1oyWFVadWo3QWFHVnFrUmRORW5FZzZRejdKR3B6VXpQLzlmUFh1?=
 =?utf-8?B?QW8yZ1NDYUU4UVZvYTk5dWgxS3FtM0tRMmR3L1psVTVNdFNIaHdmRzZiL3Z3?=
 =?utf-8?B?Rkl5U2FKVm9FalVlck5hMGJZM3BOaFVhRDZLWUQ5ZXFHeTdReVpueThHQkdw?=
 =?utf-8?B?WUJUNGVhOG9nU0F1SnkzcStLNFlRNW0wKzBCb2x0cVNjU0svT3dvd25RbnhU?=
 =?utf-8?B?bStWcGZzODVud29Oai9NUmVUYUJva1J4WkxUM0NmeFNKcVM4UTQxWU9WeHNQ?=
 =?utf-8?B?emlaWnNYak5vK1RlbnZ5bXFBVFFXcEpXL2g3UDBDaWJ4VEtSMEJFK3NjR0VB?=
 =?utf-8?B?ZCt6bkxEYkFVNy9NbkkxaFBSRHEwblhZV05ibnMvOURhSjNhZ0Mzbzl3c1Zk?=
 =?utf-8?B?REgvemdPY0dQMUNRb2c0MEV3dW15bFlUbEtDV0N0aHRyVko5Y0lmN2NhQThX?=
 =?utf-8?B?cVJNRnhYbnd5MVk4eEorM3dkQXpIMFJUa3NMd3p4ODhac3hHWEMzOFlnVWdp?=
 =?utf-8?B?UXA0WTdCMk0rWG9DbUM4U0E3a0luOG5zZHZsem5ETnRsWmZqMUZ4WkJ6Q2I5?=
 =?utf-8?B?ekttQUlJbjVTVkg4aW56SFphNlc5MTEzeXBDYVFsL01JWEpxN3RNWVdTUUda?=
 =?utf-8?B?U2VCNWV6cC9NWm55YU5tdk45akpUdFZaV0g1SEk4YlMrUTI0b3pTeVQ0dmdG?=
 =?utf-8?B?Rms5MzFDRXJuS1VkYi91ekxDWXlaV21ESmx1bURncTlHYktPak1sdGs2NmJu?=
 =?utf-8?B?U3ZRZEpUQ25acjlhNzQ1UkVqN29KbVo0dm1UTFZLUHVFSG80eUZDUHF0clUy?=
 =?utf-8?B?SmhFcWZxclJLOHlxdFJ4dzBKejdCbERKK2ZGeGxMQ2daOEN5MjVBM3Z5dlpt?=
 =?utf-8?B?aXl0ZEYweks4dTZnRmNFV1JlMnZ6dEVwRVp0WjVsYXd3bU9IQXVnY1lCeFFO?=
 =?utf-8?B?Yk5DVTJYWS9DVlozNTFLSWsvLzd6NkZsRlpLTjZHZ1BBUlArNDVRZGhJVC8v?=
 =?utf-8?B?Y2VGMFg5TGd3cnNuK3NndTVucWtRYk1UVThhZG5VQTB1aEgwUW1oTERtTGxY?=
 =?utf-8?B?d00yKzBlRUxVc0c2cGRVRTlYdy9OUG5TVlBTczh5OEV3YWw3VE5pQjd6N0ow?=
 =?utf-8?B?dkhWdWdWUmxvNnhaR1RibkhmSUN1bEtlSkxNdDlWdnRpR0xTeGRFMVNQc3RD?=
 =?utf-8?B?Q0JDeDN3NjZpOXgrOXdUUjRzR3dCanlBc3pLeWJsRmZrUHlhSEdLUmNHUzJG?=
 =?utf-8?B?MnNJcUM2bEY5NHZtYlE4Y3RmQkRiL3VoSHVoaDNBc2V5YWdDcnVFdWkrQ1la?=
 =?utf-8?B?SXNvdVIyTkVvUDVmblRmWkh5T2NmOExubzV6Qi9uMkFPcVZ4UThTZjNBcGJE?=
 =?utf-8?B?YXArUVdLZW85MzluQTRacTQ2Tzl3VVVwWURmVWJmOE9RVGU2UGF1QWx0c1E3?=
 =?utf-8?B?eDlTaSs0bC9vL1QyYmEvUjZZSUxFRDlWaHhFSEw4clJxdTE4L2FadVNEdmZE?=
 =?utf-8?B?U29SdFZ3My9DaHk4amZheEEvbDVoWHdkb3Zsa2p1V2RCaDVOYUlhWlpPMU8v?=
 =?utf-8?B?V3pSeExZSmRad0orSEw2NUwwN2U0MjZNZzFybVhXcFduYkJlL3NzZlBCUzhD?=
 =?utf-8?B?T2c9PQ==?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a656567-8184-47c6-5e1d-08da8a243fc1
X-MS-Exchange-CrossTenant-AuthSource: BL1PR01MB7747.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 01:09:12.3045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tG3+67C+Z4QspUEo2BiLH+y58eLWMhrIzgodt634mSc5t/XupnwmYoFfwBhf7auNXvzbWDjwMOx9sWw545tqzNAAeR0gdYmdB3w9fyy6nDcMMPeJGL/nfwuYqoB+pmug
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6473
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--------------YRq7qAxgES0Hj0eSPtwTIpyy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bradon,

smbios_transfer in u-root is from linuxboot in which not all systems 
have. I just want to evaluate if it can be supported in other 
environment like EDKII via inband IPMI (for example SSIF). However, I 
can still not be able to send any raw command (might be missing some things)

I don't need to have all commands but just 1 or 2 commands like 
BmcBlobGetCount or BmcBlobEnumerate so we can have a quick check.


Best Regards,

Thang Q. Nguyen

On 30/08/2022 00:56, Brandon Kim wrote:
> [EXTERNAL EMAIL NOTICE: This email originated from an external sender. Please be mindful of safe email handling and proprietary information protection practices.]
>
>
> Hi Thang,
>
> Because we use IPMI blob - it's not so easy to list out all the raw
> IPMI commands, but it's certainly doable. However, the smbios_transfer
> code is the easiest way (and "should" work) to send all the correct
> IPMI commands. Are you also facing similar issues?
>
> Thanks,
> Brandon
>
>
> On Sun, Aug 28, 2022 at 8:52 PM Thang Q. Nguyen
> <thang@amperemail.onmicrosoft.com>  wrote:
>> Hi,
>>
>> Instead of using  smbios_transfer in u-root, what is the IPMI raw
>> command to send blob data to BMC?
>>
>>
>> Thanks,
>>
>> Thang Q. Nguyen
>>
>> On 24/08/2022 23:37, Brandon Kim wrote:
>>> Hi Chris, thanks for adding more debug messages.
>>>
>>> We don't see this failure.. I'm guessing we're 100% sure that IPMI is
>>> not an issue here (I think not, since we're able to enumerate the
>>> blobs)? Could you check to see if the open was actually successful and
>>> that it was written with the correct flags?
>>>
>>> Could you also ensure you're at the very latest SRCREV of OpenBMC as well?
>>>
>>> Thanks,
>>> Brandon
>>>
>>> On Wed, Aug 24, 2022 at 2:25 AM Chris Chen (TPI)<Chris.Chen3@flex.com>  wrote:
>>>> Hi Brandon and Jie,
>>>>
>>>>
>>>>
>>>> I think I have added "smbios-ipmi-blob" library and also updated the SRCREV to the latest in the smbios-mdr_git.bbappend file.
>>>>
>>>>
>>>>
>>>> So, I added some debug messages in the "phosphor-ipmi-blobs" and the "u-root" repos respectively. I figured out one weird thing that is the BMC-side doesn't receive the "bmcBlobWrite" command, and then Host-side gets failed due to no response. Following are the messages I captured, could you help to have a look at it and give some clues? Thank you.
>>>>
>>>>
>>>>
>>>> === Host-side ===
>>>>
>>>> $ sudo ./smbios_transfer -num_retries 1
>>>>
>>>> 2022/08/24 16:40:53 Transferring SMBIOS tables, attempt 1/1
>>>>
>>>> 2022/08/24 16:40:53 BlobGetCount
>>>>
>>>> 2022/08/24 16:40:53 ctransferSmbiosData - total blobCount=4
>>>>
>>>> 2022/08/24 16:40:53 BlobEnumerate
>>>>
>>>> 2022/08/24 16:40:53 ctransferSmbiosData id=/flash/hash
>>>>
>>>> 2022/08/24 16:40:53 BlobEnumerate
>>>>
>>>> 2022/08/24 16:40:53 ctransferSmbiosData id=/flash/image
>>>>
>>>> 2022/08/24 16:40:53 BlobEnumerate
>>>>
>>>> 2022/08/24 16:40:53 ctransferSmbiosData id=/smbios
>>>>
>>>> 2022/08/24 16:40:53 BlobOpen
>>>>
>>>> 2022/08/24 16:40:53 BlobWrite
>>>>
>>>> 2022/08/24 16:41:03 ReceiveResponse - failed to read rawconn: i/o timeout
>>>>
>>>> 2022/08/24 16:41:03 BlobClose
>>>>
>>>> 2022/08/24 16:41:13 ReceiveResponse - failed to read rawconn: i/o timeout
>>>>
>>>> 2022/08/24 16:41:13 Error tranferring SMBIOS tables over IPMI: failed to write and commit blob /smbios: IPMI BlobWrite /smbios failed: failed to read rawconn: i/o timeout; IPMI BlobClose /smbios failed: failed to read rawconn: i/o timeout
>>>>
>>>> ==============
>>>>
>>>>
>>>>
>>>> === BMC-side ===
>>>>
>>>> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: Registering OEM:[0X00C2CF], Cmd:[0X80] for Blob Commands
>>>>
>>>> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries - Enter
>>>>
>>>> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries dlopen:/usr/lib/blob-ipmid/libfirmwareblob.so
>>>>
>>>> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: config loaded: /flash/image
>>>>
>>>> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries dlopen:/usr/lib/blob-ipmid/libsmbiosstore.so.0
>>>>
>>>> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler - createHandler
>>>>
>>>> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries dlopen:/usr/lib/blob-ipmid/liblogblob.so
>>>>
>>>> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries dlopen:/usr/lib/blob-ipmid/libversionblob.so
>>>>
>>>> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries dlopen:/usr/lib/blob-ipmid/libfirmwarecleanupblob.so
>>>>
>>>> Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries – Exit
>>>>
>>>> …
>>>>
>>>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter
>>>>
>>>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=0
>>>>
>>>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]:Blob::getBlobCount  - Enter
>>>>
>>>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler::getBlobIds - blobId=/smbios
>>>>
>>>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]:Blob::getBlobCount  - Exit
>>>>
>>>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Exit
>>>>
>>>>
>>>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter
>>>>
>>>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=1
>>>>
>>>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: BlobManager::getBlobId - ids=/flash/hash
>>>>
>>>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Exit
>>>>
>>>>
>>>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter
>>>>
>>>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=1
>>>>
>>>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: BlobManager::getBlobId - ids=/flash/image
>>>>
>>>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Exit
>>>>
>>>>
>>>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter
>>>>
>>>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=1
>>>>
>>>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: BlobManager::getBlobId - ids=/smbios
>>>>
>>>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Exit
>>>>
>>>>
>>>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter
>>>>
>>>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=2
>>>>
>>>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]:Blob::openBlob  - Enter
>>>>
>>>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: openBlob path=/smbios
>>>>
>>>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler::open - Enter
>>>>
>>>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler::open - Exit
>>>>
>>>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]:Blob::openBlob  - Exit
>>>>
>>>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Exit
>>>>
>>>>
>>>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter
>>>>
>>>> Jan 01 00:08:35 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=6
>>>>
>>>> Jan 01 00:08:35 hudsonbay-obmc ipmid[190]:Blob::closeBlob  - Enter
>>>>
>>>> Jan 01 00:08:35 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler::close - Enter
>>>>
>>>> Jan 01 00:08:35 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler::close - Exit
>>>>
>>>> Jan 01 00:08:35 hudsonbay-obmc ipmid[190]:Blob::closeBlob  - Exit
>>>>
>>>> Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand (replyLength==0) - Exit
>>>>
>>>> ==============
>>>>
>>>>
>>>>
>>>> Regards,
>>>>
>>>> Chris Chen
>>>>
>>>> ________________________________
>>>>
>>>> 寄件者: Brandon Kim<brandonkim@google.com>
>>>> 寄件日期: 2022年8月24日 上午 12:43
>>>> 收件者: Chris Chen (TPI)<Chris.Chen3@flex.com>
>>>> 副本: Jie Yang<jjy@google.com>; openbmc<openbmc@lists.ozlabs.org>
>>>> 主旨: Re: Read smbios2 file failed
>>>>
>>>>
>>>>
>>>> !-------------------------------------------------------------------|
>>>>
>>>>     This email was sent from someone outside of Flex. Do not
>>>>     click on any links, reply or open attachments unless you
>>>>     recognize the sender and know the content is safe. If
>>>>     suspicious, report it tospamsample@flex.com.
>>>> |-------------------------------------------------------------------!
>>>>
>>>> Hi Chris,
>>>>
>>>> Yes, running the go program you compile and running smbios_transfer
>>>> binary as you did, should do what you expect. However, there is a
>>>> PACKAGE_CONFIG you will have to append for the ipmi-blob side of
>>>> things to work:
>>>>
>>>> Please try building with the following line in your meta layer's
>>>> recipes-phosphor/smbios/smbios-mdr_%.bbappend
>>>>
>>>> ```
>>>> PACKAGECONFIG:append = " smbios-ipmi-blob"
>>>> ```
>>>>
>>>> Cheers,
>>>> Brandon
>>>>
>>>>
>>>> On Tue, Aug 23, 2022 at 12:40 AM Chris Chen (TPI)<Chris.Chen3@flex.com>  wrote:
>>>>> Hi Brandon and Jie,
>>>>>
>>>>> I would like to send the SMBIOS table from Host to BMC by using "smbios-ipmi-blobs" interface. And according to Jie's clue (can send the smbios tables to BMC either through LinuxBoot or host), and then I saw both of you were contributing to the"https://urldefense.com/v3/__https://github.com/u-root/u-root/blob/main/cmds/exp/smbios_transfer/smbios_transfer.go__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS55JUTxghw$ 
>>>>> ". Therefore, I have some questions about this, could you help to answer them?
>>>>>
>>>>> I'm assuming that I can build "smbios_transfer" command and execute it on the Host-side (with installed Ubuntu 20.04), am i correct?
>>>>>
>>>>> In fact, I'm not familiar with u-root and GO language. However, after referring to some websites to install GO and download u-root, I for now have built the cmd out and run it on my Host. Unfortunately, the result looks like failed.
>>>>> ===
>>>>> $ sudo ./smbios_transfer
>>>>> 2022/08/23 14:47:14 Transferring SMBIOS tables, attempt 1/2
>>>>> 2022/08/23 14:47:34 Error tranferring SMBIOS tables over IPMI: failed to write and commit blob /smbios: IPMI BlobWrite /smbios failed: failed to read rawconn: i/o timeout; IPMI BlobClose /smbios failed: failed to read rawconn: i/o timeout
>>>>> 2022/08/23 14:47:34 Transferring SMBIOS tables, attempt 2/2
>>>>> 2022/08/23 14:47:54 Error tranferring SMBIOS tables over IPMI: failed to write and commit blob /smbios: IPMI BlobWrite /smbios failed: failed to read rawconn: i/o timeout; IPMI BlobClose /smbios failed: failed to read rawconn: i/o timeout
>>>>> ===
>>>>>
>>>>> Do you have any suggestions on this error?
>>>>>
>>>>> ps. I'm sure the IPMI BT interface is workable.
>>>>>
>>>>> On the BMC-side, I just need to enable smbios-mdr package, correct? or anything else?
>>>>>
>>>>>
>>>>> Thanks.
>>>>>
>>>>> Regards,
>>>>> Chris Chen
>>>>>
>>>>> ________________________________
>>>>> 寄件者: Chris Chen (TPI)<Chris.Chen3@flex.com>
>>>>> 寄件日期: 2022年8月19日 下午 05:50
>>>>> 收件者: Thang Nguyen<thang@amperemail.onmicrosoft.com>; Jie Yang<jjy@google.com>
>>>>> 副本: Garrett, Mike (HPE Server Firmware)<mike.garrett@hpe.com>; Andrei Kartashev<a.kartashev@yadro.com>; CS20 CHLi30<chli30@nuvoton.com>; openbmc<openbmc@lists.ozlabs.org>
>>>>> 主旨: 回覆: Read smbios2 file failed
>>>>>
>>>>> Hello everyone,
>>>>>
>>>>> I would like to send the SMBIOS table from Host to BMC by using "smbios-ipmi-blobs" interface. But, after reviewing all your discussions, I still have no idea how to enable the feature. Could you help to share more details with me? for example,
>>>>>
>>>>> How to generate a raw SMBIOS table with MDRv2 header? (like using "dmidecode --dump-bin" and what else?)
>>>>> How do start sending SMBIOS binary file at Host-side? (As I know, the FW update mechanism through IPMI blob would need to build a host-tool, named burn-my-bmc, on the Host and then run the tool to start image data transformation. Does the "smbios-ipmi-blobs" with the same method?)
>>>>>
>>>>>
>>>>> p.s. The OS running on the Host is Ubuntu 20.04.
>>>>>
>>>>> Thanks.
>>>>>
>>>>> Regards,
>>>>> Chris Chen
>>>>>
>>>>> ________________________________
>>>>> 寄件者: openbmc<openbmc-bounces+chris.chen3=flex.com@lists.ozlabs.org>  代表 Thang Nguyen<thang@amperemail.onmicrosoft.com>
>>>>> 寄件日期: 2021年9月17日 下午 09:40
>>>>> 收件者: Jie Yang<jjy@google.com>
>>>>> 副本: Garrett, Mike (HPE Server Firmware)<mike.garrett@hpe.com>; Andrei Kartashev<a.kartashev@yadro.com>; CS20 CHLi30<chli30@nuvoton.com>; openbmc<openbmc@lists.ozlabs.org>
>>>>> 主旨: Re: Read smbios2 file failed
>>>>>
>>>>>
>>>>> Thanks Jia for your information
>>>>>
>>>>> On 17/09/2021 05:36, Jie Yang wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>> Actually I added an ipmi blob interface to smbios-mdrhttps://urldefense.com/v3/__https://github.com/openbmc/smbios-mdr/tree/master/src/smbios-ipmi-blobs__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS54qpIAumA$   . With this interface you can send the smbios tables to BMC either through LinuxBoot or host. The LinuxBoot codehttps://urldefense.com/v3/__https://github.com/u-root/u-root/tree/master/cmds/exp/smbios_transfer__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS54GUWKtiw$   . Writing and committing to this blob will generate the MDR header.
>>>>>
>>>>> -Jie
>>>>>
>>>>> On Thu, Sep 16, 2021 at 4:19 AM Thang Nguyen<thang@amperemail.onmicrosoft.com>  wrote:
>>>>>
>>>>> Thanks Tim, Mike and Andrei for very useful information. We can make it
>>>>> work by adding MDRv2 header.
>>>>>
>>>>> I am finding some information about the IPMI blobs commands. I can see
>>>>> some notes at
>>>>>
>>>>> https://urldefense.com/v3/__https://github.com/openbmc/docs/blob/master/designs/binarystore-via-blobs.md__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS57DJil0FA$
>>>>>
>>>>> https://urldefense.com/v3/__https://github.com/openbmc/phosphor-ipmi-blobs/blob/master/README.md__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS56DlU_SCA$
>>>>>
>>>>> But I have not found more description about the IPMI blob commands like
>>>>> NetFn, Func, ... that I can send a file from Host to BMC. Do you have
>>>>> any information about them?
>>>>>
>>>>>
>>>>> Thanks,
>>>>>
>>>>> Thang Q. Nguyen
>>>>>
>>>>> On 16/09/2021 09:40, CS20 CHLi30 wrote:
>>>>>> Hi Thang,
>>>>>> Did you try to use smbios_entry_point or DMI from host to BMC /var/lib/smbios/smbios2 for parsing?
>>>>>>
>>>>>> You can refer this sysfs-firmware-dmi-tables as below:
>>>>>>
>>>>>> The firmware provides DMI structures as a packed list of data referenced by a SMBIOS table entry point.
>>>>>> The SMBIOS entry point contains general information, like SMBIOS version, DMI table size, etc.
>>>>>> The structure, content and size of SMBIOS entry point is dependent on SMBIOS version.
>>>>>>
>>>>>> The format of SMBIOS entry point and DMI structures can be read in SMBIOS specification.
>>>>>> The dmi/tables provides raw SMBIOS entry point and DMI tables through sysfs as an alternative to utilities reading them from /dev/mem.
>>>>>>
>>>>>> The raw SMBIOS entry point and DMI table are presented as binary attributes and are accessible via:
>>>>>> /sys/firmware/dmi/tables/smbios_entry_point
>>>>>> /sys/firmware/dmi/tables/DMI
>>>>>>
>>>>>> Best regards,
>>>>>> Tim
>>>>>>
>>>>>> -----Original Message-----
>>>>>> From: openbmc [mailto:openbmc-bounces+chli30=nuvoton.com@lists.ozlabs.org] On Behalf Of Garrett, Mike (HPE Server Firmware)
>>>>>> Sent: Wednesday, September 15, 2021 9:19 PM
>>>>>> To: Andrei Kartashev<a.kartashev@yadro.com>; Thang Nguyen<thang@amperemail.onmicrosoft.com>; openbmc<openbmc@lists.ozlabs.org>
>>>>>> Subject: RE: Read smbios2 file failed
>>>>>>
>>>>>> We recently did the same thing and got it working.  All you have to do is take the RAW smbios records blob in binary form (delivered as noted below in whatever way you choose) and prepend a specific header:https://urldefense.com/v3/__https://apc01.safelinks.protection.outlook.com/?url=https*3A*2F*2Fgithub.com*2Fopenbmc*2Fsmbios-mdr*2Fblob*2F33c948a473bd273fea0cff82d4c99b70b7784be6*2Finclude*2Fsmbios_mdrv2.hpp*23L114&amp;data=04*7C01*7Cchli30*40nuvoton.com*7C81a4bd29e4904bf4d84608d978510b92*7Ca3f24931d4034b4a94f17d83ac638e07*7C0*7C0*7C637673526954552742*7CUnknown*7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo__;JSUlJSUlJSUlJSUlJSUlJSUlJSU!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS56BTyjjfg$    iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=oQwcozsSoGlgSFwztPFV3FAoPpRZGYoZ7pc0%2BxDi1MA%3D&amp;reserved=0
>>>>>>
>>>>>> It is a little bit fragile as it introduces a dependency on the file download logic to write a non-standard header defined in another service that could potentially change.
>>>>>>
>>>>>> Mike
>>>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: openbmc <openbmc-
>>>>>>> bounces+mike.garrett=hpe.com@lists.ozlabs.org> On Behalf Of Andrei
>>>>>>> Kartashev
>>>>>>> Sent: Wednesday, September 15, 2021 3:17 AM
>>>>>>> To: Thang Nguyen<thang@amperemail.onmicrosoft.com>; openbmc
>>>>>>> <openbmc@lists.ozlabs.org>
>>>>>>> Subject: Re: Read smbios2 file failed
>>>>>>>
>>>>>>> I don't know what is format of "dmidecode --dump-bin", but if it just
>>>>>>> raw dump of smbios then you only need to add mdr header.
>>>>>>>
>>>>>>> See answer for the same question here:
>>>>>>> INVALID URI REMOVED
>>>>>>> 021-July/026882.html__;!!NpxR!2w0FkPs2KyaB6XOvB8et52bWKqAMLImmL-
>>>>>>> iUk9A_zZbJ8WLhMeXdvRAp-pcxt8Q$
>>>>>>>
>>>>>>> On Wed, 2021-09-15 at 12:41 +0700, Thang Nguyen wrote:
>>>>>>>> Hi Andrei,
>>>>>>>>
>>>>>>>> I see output of "dmidecode --dump-bin" follows SMBIOS specification.
>>>>>>>> As
>>>>>>>> the data for smbios-mdr does not follow this, do you know about the
>>>>>>>> document or any information I can reference to prepare data to send
>>>>>>>> to BMC??
>>>>>>>>
>>>>>>>>
>>>>>>>> Best Regards,
>>>>>>>>
>>>>>>>> Thang Q. Nguyen
>>>>>>>>
>>>>>>>> On 14/09/2021 15:51, Andrei Kartashev wrote:
>>>>>>>>> No, it is not same as "dmidecode --dump-bin".
>>>>>>>>>
>>>>>>>>> On Tue, 2021-09-14 at 13:46 +0700, Thang Nguyen wrote:
>>>>>>>>>> On 13/09/2021 23:56, Andrei Kartashev wrote:
>>>>>>>>>>> You need to somehow deliver smbios data image to BMC. This
>>>>>>>>>>> means, your BIOS should implementat some logic to transfer
>>>>>>>>>>> this data.
>>>>>>>>>>> For BMC side see example here:
>>>>>>>>>>> https://urldefense.com/v3/__https://apc01.safelinks.protection.outlook.com/?url=https*3A*2__;JSU!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS57ySTDXQQ$
>>>>>>>>>>> F%2Fgithub.com%2Fopenbmc%2Fintel-ipmi-&amp;data=04%7C01%7Cchli
>>>>>>>>>>> 30%40nuvoton.com%7C81a4bd29e4904bf4d84608d978510b92%7Ca3f24931
>>>>>>>>>>> d4034b4a94f17d83ac638e07%7C0%7C0%7C637673526954552742%7CUnknow
>>>>>>>>>>> n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik
>>>>>>>>>>> 1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=cG6ZZzOSXkuUtcQuuoymsRdP
>>>>>>>>>>> p24mINa%2FhCy%2BYhe%2FNmk%3D&amp;reserved=0
>>>>>>> oem/blob/master/src/smbios
>>>>>>>>>>> mdrv2handler.cpp
>>>>>>>>>> Hi Andrei,
>>>>>>>>>>
>>>>>>>>>> What is the format of smbios data to transfer to BMC? Is it the
>>>>>>>>>> same content of "dmidecode --dump-bin" command from Host Linux?
>>>>>>> or
>>>>>>>>>> anything special in formatting the content to send?
>>>>>>>>>>
>>>>>>>>>>> On Mon, 2021-09-13 at 17:40 +0300, Alexander Raih wrote:
>>>>>>>>>>>> Hi guys, I am beginner in openbmc I build openbmc with
>>>>>>>>>>>> smbios-mdr repository and I have error:
>>>>>>>>>>>>
>>>>>>>>>>>> Read data from flash error - Open MDRV2 table file failure
>>>>>>>>>>>>
>>>>>>>>>>>> There isnt file in /var/lib/smbios/smbios2
>>>>>>>>>>>>
>>>>>>>>>>>> How I can resolve this problem?
>>>>>>>>>>>> Help me please!!!
>>>>>>> --
>>>>>>> Best regards,
>>>>>>> Andrei Kartashev
>>>>>>>
>>>>>> ________________________________
>>>>>> ________________________________
>>>>>>     The privileged confidential information contained in this email is intended for use only by the addressees as indicated by the original sender of this email. If you are not the addressee indicated in this email or are not responsible for delivery of the email to such a person, please kindly reply to the sender indicating this fact and delete all copies of it from your computer and network server immediately. Your cooperation is highly appreciated. It is advised that any unauthorized use of confidential information of Nuvoton is strictly prohibited; and any information in this email irrelevant to the official business of Nuvoton shall be deemed as neither given nor endorsed by Nuvoton.
>>>>> Legal Disclaimer :
>>>>> The information contained in this message may be privileged and confidential.
>>>>> It is intended to be read only by the individual or entity to whom it is addressed
>>>>> or by their designee. If the reader of this message is not the intended recipient,
>>>>> you are on notice that any distribution of this message, in any form,
>>>>> is strictly prohibited. If you have received this message in error,
>>>>> please immediately notify the sender and delete or destroy any copy of this message!
--------------YRq7qAxgES0Hj0eSPtwTIpyy
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p>Hi Bradon,</p>
    <p>smbios_transfer in u-root is from linuxboot in which not all
      systems have. I just want to evaluate if it can be supported in
      other environment like EDKII via inband IPMI (for example SSIF).
      However, I can still not be able to send any raw command (might be
      missing some things)<br>
    </p>
    <p>I don't need to have all commands but just 1 or 2 commands like <spa=
n style=3D"caret-color: rgb(36, 41, 47); color: rgb(36, 41, 47);
        font-family: ui-monospace, SFMono-Regular, &quot;SF Mono&quot;,
        Menlo, Consolas, &quot;Liberation Mono&quot;, monospace;
        font-size: 13.600000381469727px; font-style: normal;
        font-variant-caps: normal; font-weight: 400; letter-spacing:
        normal; orphans: auto; text-align: start; text-indent: 0px;
        text-transform: none; white-space: normal; widows: auto;
        word-spacing: 0px; -webkit-text-size-adjust: auto;
        -webkit-text-stroke-width: 0px; background-color: rgba(175, 184,
        193, 0.2); text-decoration: none; display: inline !important;
        float: none;">BmcBlobGetCount or </span><span style=3D"caret-color:=
 rgb(36, 41, 47); color: rgb(36, 41, 47);
        font-family: ui-monospace, SFMono-Regular, &quot;SF Mono&quot;,
        Menlo, Consolas, &quot;Liberation Mono&quot;, monospace;
        font-size: 13.600000381469727px; font-style: normal;
        font-variant-caps: normal; font-weight: 400; letter-spacing:
        normal; orphans: auto; text-align: start; text-indent: 0px;
        text-transform: none; white-space: normal; widows: auto;
        word-spacing: 0px; -webkit-text-size-adjust: auto;
        -webkit-text-stroke-width: 0px; background-color: rgba(175, 184,
        193, 0.2); text-decoration: none; display: inline !important;
        float: none;"><span style=3D"caret-color: rgb(36, 41, 47); color:
          rgb(36, 41, 47); font-family: ui-monospace, SFMono-Regular,
          &quot;SF Mono&quot;, Menlo, Consolas, &quot;Liberation
          Mono&quot;, monospace; font-size: 13.600000381469727px;
          font-style: normal; font-variant-caps: normal; font-weight:
          400; letter-spacing: normal; orphans: auto; text-align: start;
          text-indent: 0px; text-transform: none; white-space: normal;
          widows: auto; word-spacing: 0px; -webkit-text-size-adjust:
          auto; -webkit-text-stroke-width: 0px; background-color:
          rgba(175, 184, 193, 0.2); text-decoration: none; display:
          inline !important; float: none;">BmcBlobEnumerate</span></span>
      so we can have a quick check.</p>
    <p><br>
    </p>
    <p>Best Regards,</p>
    <p>Thang Q. Nguyen <br>
    </p>
    <div class=3D"moz-cite-prefix">On 30/08/2022 00:56, Brandon Kim wrote:<=
br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CALGRKGPZjJY=3DKNJexGfpfhs_bo=3DG=
Qe9b4kRvvsZCiAYUa6XXdw@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">[EXTERNAL EMAIL NOTICE: This e=
mail originated from an external sender. Please be mindful of safe email ha=
ndling and proprietary information protection practices.]


Hi Thang,

Because we use IPMI blob - it's not so easy to list out all the raw
IPMI commands, but it's certainly doable. However, the smbios_transfer
code is the easiest way (and &quot;should&quot; work) to send all the corre=
ct
IPMI commands. Are you also facing similar issues?

Thanks,
Brandon


On Sun, Aug 28, 2022 at 8:52 PM Thang Q. Nguyen
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:thang@amperemail.onmicros=
oft.com">&lt;thang@amperemail.onmicrosoft.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
Hi,

Instead of using  smbios_transfer in u-root, what is the IPMI raw
command to send blob data to BMC?


Thanks,

Thang Q. Nguyen

On 24/08/2022 23:37, Brandon Kim wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">Hi Chris, thanks for addin=
g more debug messages.

We don't see this failure.. I'm guessing we're 100% sure that IPMI is
not an issue here (I think not, since we're able to enumerate the
blobs)? Could you check to see if the open was actually successful and
that it was written with the correct flags?

Could you also ensure you're at the very latest SRCREV of OpenBMC as well?

Thanks,
Brandon

On Wed, Aug 24, 2022 at 2:25 AM Chris Chen (TPI) <a class=3D"moz-txt-link-r=
fc2396E" href=3D"mailto:Chris.Chen3@flex.com">&lt;Chris.Chen3@flex.com&gt;<=
/a> wrote:
</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">Hi Brandon and Jie,



I think I have added &quot;smbios-ipmi-blob&quot; library and also updated =
the SRCREV to the latest in the smbios-mdr_git.bbappend file.



So, I added some debug messages in the &quot;phosphor-ipmi-blobs&quot; and =
the &quot;u-root&quot; repos respectively. I figured out one weird thing th=
at is the BMC-side doesn't receive the &quot;bmcBlobWrite&quot; command, an=
d then Host-side gets failed due to no response. Following are the messages=
 I captured, could you help to have a look at it and give some clues? Thank=
 you.



=3D=3D=3D Host-side =3D=3D=3D

$ sudo ./smbios_transfer -num_retries 1

2022/08/24 16:40:53 Transferring SMBIOS tables, attempt 1/1

2022/08/24 16:40:53 BlobGetCount

2022/08/24 16:40:53 ctransferSmbiosData - total blobCount=3D4

2022/08/24 16:40:53 BlobEnumerate

2022/08/24 16:40:53 ctransferSmbiosData id=3D/flash/hash

2022/08/24 16:40:53 BlobEnumerate

2022/08/24 16:40:53 ctransferSmbiosData id=3D/flash/image

2022/08/24 16:40:53 BlobEnumerate

2022/08/24 16:40:53 ctransferSmbiosData id=3D/smbios

2022/08/24 16:40:53 BlobOpen

2022/08/24 16:40:53 BlobWrite

2022/08/24 16:41:03 ReceiveResponse - failed to read rawconn: i/o timeout

2022/08/24 16:41:03 BlobClose

2022/08/24 16:41:13 ReceiveResponse - failed to read rawconn: i/o timeout

2022/08/24 16:41:13 Error tranferring SMBIOS tables over IPMI: failed to wr=
ite and commit blob /smbios: IPMI BlobWrite /smbios failed: failed to read =
rawconn: i/o timeout; IPMI BlobClose /smbios failed: failed to read rawconn=
: i/o timeout

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D



=3D=3D=3D BMC-side =3D=3D=3D

Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: Registering OEM:[0X00C2CF], Cmd:=
[0X80] for Blob Commands

Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries - Enter

Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries dlopen:/usr/lib/bl=
ob-ipmid/libfirmwareblob.so

Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: config loaded: /flash/image

Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries dlopen:/usr/lib/bl=
ob-ipmid/libsmbiosstore.so.0

Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler - createHandle=
r

Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries dlopen:/usr/lib/bl=
ob-ipmid/liblogblob.so

Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries dlopen:/usr/lib/bl=
ob-ipmid/libversionblob.so

Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries dlopen:/usr/lib/bl=
ob-ipmid/libfirmwarecleanupblob.so

Jan 01 00:00:16 hudsonbay-obmc ipmid[190]: loadLibraries =E2=80=93 Exit

=E2=80=A6

Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter

Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=3D0

Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: <a class=3D"moz-txt-link-freetex=
t" href=3D"Blob::getBlobCount">Blob::getBlobCount</a> - Enter

Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler::getBlobIds - =
blobId=3D/smbios

Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: <a class=3D"moz-txt-link-freetex=
t" href=3D"Blob::getBlobCount">Blob::getBlobCount</a> - Exit

Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Exit


Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter

Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=3D1

Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: BlobManager::getBlobId - ids=3D/=
flash/hash

Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Exit


Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter

Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=3D1

Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: BlobManager::getBlobId - ids=3D/=
flash/image

Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Exit


Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter

Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=3D1

Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: BlobManager::getBlobId - ids=3D/=
smbios

Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Exit


Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter

Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=3D2

Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: <a class=3D"moz-txt-link-freetex=
t" href=3D"Blob::openBlob">Blob::openBlob</a> - Enter

Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: openBlob path=3D/smbios

Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler::open - Enter

Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler::open - Exit

Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: <a class=3D"moz-txt-link-freetex=
t" href=3D"Blob::openBlob">Blob::openBlob</a> - Exit

Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Exit


Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand - Enter

Jan 01 00:08:35 hudsonbay-obmc ipmid[190]: handleBlobCommand - cmd num=3D6

Jan 01 00:08:35 hudsonbay-obmc ipmid[190]: <a class=3D"moz-txt-link-freetex=
t" href=3D"Blob::closeBlob">Blob::closeBlob</a> - Enter

Jan 01 00:08:35 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler::close - Enter

Jan 01 00:08:35 hudsonbay-obmc ipmid[190]: SmbiosBlobHandler::close - Exit

Jan 01 00:08:35 hudsonbay-obmc ipmid[190]: <a class=3D"moz-txt-link-freetex=
t" href=3D"Blob::closeBlob">Blob::closeBlob</a> - Exit

Jan 01 00:08:25 hudsonbay-obmc ipmid[190]: handleBlobCommand (replyLength=
=3D=3D0) - Exit

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D



Regards,

Chris Chen

________________________________

=E5=AF=84=E4=BB=B6=E8=80=85: Brandon Kim <a class=3D"moz-txt-link-rfc2396E"=
 href=3D"mailto:brandonkim@google.com">&lt;brandonkim@google.com&gt;</a>
=E5=AF=84=E4=BB=B6=E6=97=A5=E6=9C=9F: 2022=E5=B9=B48=E6=9C=8824=E6=97=A5 =
=E4=B8=8A=E5=8D=88 12:43
=E6=94=B6=E4=BB=B6=E8=80=85: Chris Chen (TPI) <a class=3D"moz-txt-link-rfc2=
396E" href=3D"mailto:Chris.Chen3@flex.com">&lt;Chris.Chen3@flex.com&gt;</a>
=E5=89=AF=E6=9C=AC: Jie Yang <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:jjy@google.com">&lt;jjy@google.com&gt;</a>; openbmc <a class=3D"moz-txt=
-link-rfc2396E" href=3D"mailto:openbmc@lists.ozlabs.org">&lt;openbmc@lists.=
ozlabs.org&gt;</a>
=E4=B8=BB=E6=97=A8: Re: Read smbios2 file failed



!-------------------------------------------------------------------|

   This email was sent from someone outside of Flex. Do not
   click on any links, reply or open attachments unless you
   recognize the sender and know the content is safe. If
   suspicious, report it to <a class=3D"moz-txt-link-abbreviated" href=3D"m=
ailto:spamsample@flex.com">spamsample@flex.com</a>.
|-------------------------------------------------------------------!

Hi Chris,

Yes, running the go program you compile and running smbios_transfer
binary as you did, should do what you expect. However, there is a
PACKAGE_CONFIG you will have to append for the ipmi-blob side of
things to work:

Please try building with the following line in your meta layer's
recipes-phosphor/smbios/smbios-mdr_%.bbappend

```
PACKAGECONFIG:append =3D &quot; smbios-ipmi-blob&quot;
```

Cheers,
Brandon


On Tue, Aug 23, 2022 at 12:40 AM Chris Chen (TPI) <a class=3D"moz-txt-link-=
rfc2396E" href=3D"mailto:Chris.Chen3@flex.com">&lt;Chris.Chen3@flex.com&gt;=
</a> wrote:
</pre>
            <blockquote type=3D"cite">
              <pre class=3D"moz-quote-pre" wrap=3D"">Hi Brandon and Jie,

I would like to send the SMBIOS table from Host to BMC by using &quot;smbio=
s-ipmi-blobs&quot; interface. And according to Jie's clue (can send the smb=
ios tables to BMC either through LinuxBoot or host), and then I saw both of=
 you were contributing to the <a class=3D"moz-txt-link-rfc2396E" href=3D"ht=
tps://urldefense.com/v3/__https://github.com/u-root/u-root/blob/main/cmds/e=
xp/smbios_transfer/smbios_transfer.go__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw=
8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS55JUTxghw$">&quot;https=
://urldefense.com/v3/__https://github.com/u-root/u-root/blob/main/cmds/exp/=
smbios_transfer/smbios_transfer.go__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8Kb=
ITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS55JUTxghw$  &quot;</a>. Th=
erefore, I have some questions about this, could you help to answer them?

I'm assuming that I can build &quot;smbios_transfer&quot; command and execu=
te it on the Host-side (with installed Ubuntu 20.04), am i correct?

In fact, I'm not familiar with u-root and GO language. However, after refer=
ring to some websites to install GO and download u-root, I for now have bui=
lt the cmd out and run it on my Host. Unfortunately, the result looks like =
failed.
=3D=3D=3D
$ sudo ./smbios_transfer
2022/08/23 14:47:14 Transferring SMBIOS tables, attempt 1/2
2022/08/23 14:47:34 Error tranferring SMBIOS tables over IPMI: failed to wr=
ite and commit blob /smbios: IPMI BlobWrite /smbios failed: failed to read =
rawconn: i/o timeout; IPMI BlobClose /smbios failed: failed to read rawconn=
: i/o timeout
2022/08/23 14:47:34 Transferring SMBIOS tables, attempt 2/2
2022/08/23 14:47:54 Error tranferring SMBIOS tables over IPMI: failed to wr=
ite and commit blob /smbios: IPMI BlobWrite /smbios failed: failed to read =
rawconn: i/o timeout; IPMI BlobClose /smbios failed: failed to read rawconn=
: i/o timeout
=3D=3D=3D

Do you have any suggestions on this error?

ps. I'm sure the IPMI BT interface is workable.

On the BMC-side, I just need to enable smbios-mdr package, correct? or anyt=
hing else?


Thanks.

Regards,
Chris Chen

________________________________
=E5=AF=84=E4=BB=B6=E8=80=85: Chris Chen (TPI) <a class=3D"moz-txt-link-rfc2=
396E" href=3D"mailto:Chris.Chen3@flex.com">&lt;Chris.Chen3@flex.com&gt;</a>
=E5=AF=84=E4=BB=B6=E6=97=A5=E6=9C=9F: 2022=E5=B9=B48=E6=9C=8819=E6=97=A5 =
=E4=B8=8B=E5=8D=88 05:50
=E6=94=B6=E4=BB=B6=E8=80=85: Thang Nguyen <a class=3D"moz-txt-link-rfc2396E=
" href=3D"mailto:thang@amperemail.onmicrosoft.com">&lt;thang@amperemail.onm=
icrosoft.com&gt;</a>; Jie Yang <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:jjy@google.com">&lt;jjy@google.com&gt;</a>
=E5=89=AF=E6=9C=AC: Garrett, Mike (HPE Server Firmware) <a class=3D"moz-txt=
-link-rfc2396E" href=3D"mailto:mike.garrett@hpe.com">&lt;mike.garrett@hpe.c=
om&gt;</a>; Andrei Kartashev <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:a.kartashev@yadro.com">&lt;a.kartashev@yadro.com&gt;</a>; CS20 CHLi30 <=
a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:chli30@nuvoton.com">&lt;ch=
li30@nuvoton.com&gt;</a>; openbmc <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:openbmc@lists.ozlabs.org">&lt;openbmc@lists.ozlabs.org&gt;</a>
=E4=B8=BB=E6=97=A8: =E5=9B=9E=E8=A6=86: Read smbios2 file failed

Hello everyone,

I would like to send the SMBIOS table from Host to BMC by using &quot;smbio=
s-ipmi-blobs&quot; interface. But, after reviewing all your discussions, I =
still have no idea how to enable the feature. Could you help to share more =
details with me? for example,

How to generate a raw SMBIOS table with MDRv2 header? (like using &quot;dmi=
decode --dump-bin&quot; and what else?)
How do start sending SMBIOS binary file at Host-side? (As I know, the FW up=
date mechanism through IPMI blob would need to build a host-tool, named bur=
n-my-bmc, on the Host and then run the tool to start image data transformat=
ion. Does the &quot;smbios-ipmi-blobs&quot; with the same method?)


p.s. The OS running on the Host is Ubuntu 20.04.

Thanks.

Regards,
Chris Chen

________________________________
=E5=AF=84=E4=BB=B6=E8=80=85: openbmc <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:openbmc-bounces+chris.chen3=3Dflex.com@lists.ozlabs.org">&lt;op=
enbmc-bounces+chris.chen3=3Dflex.com@lists.ozlabs.org&gt;</a> =E4=BB=A3=E8=
=A1=A8 Thang Nguyen <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:thang=
@amperemail.onmicrosoft.com">&lt;thang@amperemail.onmicrosoft.com&gt;</a>
=E5=AF=84=E4=BB=B6=E6=97=A5=E6=9C=9F: 2021=E5=B9=B49=E6=9C=8817=E6=97=A5 =
=E4=B8=8B=E5=8D=88 09:40
=E6=94=B6=E4=BB=B6=E8=80=85: Jie Yang <a class=3D"moz-txt-link-rfc2396E" hr=
ef=3D"mailto:jjy@google.com">&lt;jjy@google.com&gt;</a>
=E5=89=AF=E6=9C=AC: Garrett, Mike (HPE Server Firmware) <a class=3D"moz-txt=
-link-rfc2396E" href=3D"mailto:mike.garrett@hpe.com">&lt;mike.garrett@hpe.c=
om&gt;</a>; Andrei Kartashev <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:a.kartashev@yadro.com">&lt;a.kartashev@yadro.com&gt;</a>; CS20 CHLi30 <=
a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:chli30@nuvoton.com">&lt;ch=
li30@nuvoton.com&gt;</a>; openbmc <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:openbmc@lists.ozlabs.org">&lt;openbmc@lists.ozlabs.org&gt;</a>
=E4=B8=BB=E6=97=A8: Re: Read smbios2 file failed


Thanks Jia for your information

On 17/09/2021 05:36, Jie Yang wrote:

Hi,

Actually I added an ipmi blob interface to smbios-mdr <a class=3D"moz-txt-l=
ink-freetext" href=3D"https://urldefense.com/v3/__https://github.com/openbm=
c/smbios-mdr/tree/master/src/smbios-ipmi-blobs__;!!HSntlCg!TV2b4jzad6O_WAZA=
I1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS54qpIAumA$">ht=
tps://urldefense.com/v3/__https://github.com/openbmc/smbios-mdr/tree/master=
/src/smbios-ipmi-blobs__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5G=
NRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS54qpIAumA$</a>  . With this interface =
you can send the smbios tables to BMC either through LinuxBoot or host. The=
 LinuxBoot code <a class=3D"moz-txt-link-freetext" href=3D"https://urldefen=
se.com/v3/__https://github.com/u-root/u-root/tree/master/cmds/exp/smbios_tr=
ansfer__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKx=
Rrh5vW0XmDcRgtYvjcRTS54GUWKtiw$">https://urldefense.com/v3/__https://github=
.com/u-root/u-root/tree/master/cmds/exp/smbios_transfer__;!!HSntlCg!TV2b4jz=
ad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS54GUW=
Ktiw$</a>  . Writing and committing to this blob will generate the MDR head=
er.

-Jie

On Thu, Sep 16, 2021 at 4:19 AM Thang Nguyen <a class=3D"moz-txt-link-rfc23=
96E" href=3D"mailto:thang@amperemail.onmicrosoft.com">&lt;thang@amperemail.=
onmicrosoft.com&gt;</a> wrote:

Thanks Tim, Mike and Andrei for very useful information. We can make it
work by adding MDRv2 header.

I am finding some information about the IPMI blobs commands. I can see
some notes at

<a class=3D"moz-txt-link-freetext" href=3D"https://urldefense.com/v3/__http=
s://github.com/openbmc/docs/blob/master/designs/binarystore-via-blobs.md__;=
!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0Xm=
DcRgtYvjcRTS57DJil0FA$">https://urldefense.com/v3/__https://github.com/open=
bmc/docs/blob/master/designs/binarystore-via-blobs.md__;!!HSntlCg!TV2b4jzad=
6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS57DJil0=
FA$</a>

<a class=3D"moz-txt-link-freetext" href=3D"https://urldefense.com/v3/__http=
s://github.com/openbmc/phosphor-ipmi-blobs/blob/master/README.md__;!!HSntlC=
g!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvj=
cRTS56DlU_SCA$">https://urldefense.com/v3/__https://github.com/openbmc/phos=
phor-ipmi-blobs/blob/master/README.md__;!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw=
8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS56DlU_SCA$</a>

But I have not found more description about the IPMI blob commands like
NetFn, Func, ... that I can send a file from Host to BMC. Do you have
any information about them?


Thanks,

Thang Q. Nguyen

On 16/09/2021 09:40, CS20 CHLi30 wrote:
</pre>
              <blockquote type=3D"cite">
                <pre class=3D"moz-quote-pre" wrap=3D"">Hi Thang,
Did you try to use smbios_entry_point or DMI from host to BMC /var/lib/smbi=
os/smbios2 for parsing?

You can refer this sysfs-firmware-dmi-tables as below:

The firmware provides DMI structures as a packed list of data referenced by=
 a SMBIOS table entry point.
The SMBIOS entry point contains general information, like SMBIOS version, D=
MI table size, etc.
The structure, content and size of SMBIOS entry point is dependent on SMBIO=
S version.

The format of SMBIOS entry point and DMI structures can be read in SMBIOS s=
pecification.
The dmi/tables provides raw SMBIOS entry point and DMI tables through sysfs=
 as an alternative to utilities reading them from /dev/mem.

The raw SMBIOS entry point and DMI table are presented as binary attributes=
 and are accessible via:
/sys/firmware/dmi/tables/smbios_entry_point
/sys/firmware/dmi/tables/DMI

Best regards,
Tim

-----Original Message-----
From: openbmc [<a class=3D"moz-txt-link-freetext" href=3D"mailto:openbmc-bo=
unces+chli30=3Dnuvoton.com@lists.ozlabs.org">mailto:openbmc-bounces+chli30=
=3Dnuvoton.com@lists.ozlabs.org</a>] On Behalf Of Garrett, Mike (HPE Server=
 Firmware)
Sent: Wednesday, September 15, 2021 9:19 PM
To: Andrei Kartashev <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:a.ka=
rtashev@yadro.com">&lt;a.kartashev@yadro.com&gt;</a>; Thang Nguyen <a class=
=3D"moz-txt-link-rfc2396E" href=3D"mailto:thang@amperemail.onmicrosoft.com"=
>&lt;thang@amperemail.onmicrosoft.com&gt;</a>; openbmc <a class=3D"moz-txt-=
link-rfc2396E" href=3D"mailto:openbmc@lists.ozlabs.org">&lt;openbmc@lists.o=
zlabs.org&gt;</a>
Subject: RE: Read smbios2 file failed

We recently did the same thing and got it working.  All you have to do is t=
ake the RAW smbios records blob in binary form (delivered as noted below in=
 whatever way you choose) and prepend a specific header:  <a class=3D"moz-t=
xt-link-freetext" href=3D"https://urldefense.com/v3/__https://apc01.safelin=
ks.protection.outlook.com/?url=3Dhttps*3A*2F*2Fgithub.com*2Fopenbmc*2Fsmbio=
s-mdr*2Fblob*2F33c948a473bd273fea0cff82d4c99b70b7784be6*2Finclude*2Fsmbios_=
mdrv2.hpp*23L114&amp;amp;data=3D04*7C01*7Cchli30*40nuvoton.com*7C81a4bd29e4=
904bf4d84608d978510b92*7Ca3f24931d4034b4a94f17d83ac638e07*7C0*7C0*7C6376735=
26954552742*7CUnknown*7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo__;JSUlJSUlJ=
SUlJSUlJSUlJSUlJSU!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7Dif=
Qr1xCsFKxRrh5vW0XmDcRgtYvjcRTS56BTyjjfg$">https://urldefense.com/v3/__https=
://apc01.safelinks.protection.outlook.com/?url=3Dhttps*3A*2F*2Fgithub.com*2=
Fopenbmc*2Fsmbios-mdr*2Fblob*2F33c948a473bd273fea0cff82d4c99b70b7784be6*2Fi=
nclude*2Fsmbios_mdrv2.hpp*23L114&amp;amp;data=3D04*7C01*7Cchli30*40nuvoton.=
com*7C81a4bd29e4904bf4d84608d978510b92*7Ca3f24931d4034b4a94f17d83ac638e07*7=
C0*7C0*7C637673526954552742*7CUnknown*7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ=
QIjo__;JSUlJSUlJSUlJSUlJSUlJSUlJSU!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8KbITI=
WTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS56BTyjjfg$</a>   iV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DoQwcozsSoGlgSFwztPFV3FAo=
PpRZGYoZ7pc0%2BxDi1MA%3D&amp;amp;reserved=3D0

It is a little bit fragile as it introduces a dependency on the file downlo=
ad logic to write a non-standard header defined in another service that cou=
ld potentially change.

Mike

</pre>
                <blockquote type=3D"cite">
                  <pre class=3D"moz-quote-pre" wrap=3D"">-----Original Mess=
age-----
From: openbmc &lt;openbmc-
<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:bounces+mike.garrett=
=3Dhpe.com@lists.ozlabs.org">bounces+mike.garrett=3Dhpe.com@lists.ozlabs.or=
g</a>&gt; On Behalf Of Andrei
Kartashev
Sent: Wednesday, September 15, 2021 3:17 AM
To: Thang Nguyen <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:thang@am=
peremail.onmicrosoft.com">&lt;thang@amperemail.onmicrosoft.com&gt;</a>; ope=
nbmc
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:openbmc@lists.ozlabs.org"=
>&lt;openbmc@lists.ozlabs.org&gt;</a>
Subject: Re: Read smbios2 file failed

I don't know what is format of &quot;dmidecode --dump-bin&quot;, but if it =
just
raw dump of smbios then you only need to add mdr header.

See answer for the same question here:
INVALID URI REMOVED
021-July/026882.html__;!!NpxR!2w0FkPs2KyaB6XOvB8et52bWKqAMLImmL-
iUk9A_zZbJ8WLhMeXdvRAp-pcxt8Q$

On Wed, 2021-09-15 at 12:41 +0700, Thang Nguyen wrote:
</pre>
                  <blockquote type=3D"cite">
                    <pre class=3D"moz-quote-pre" wrap=3D"">Hi Andrei,

I see output of &quot;dmidecode --dump-bin&quot; follows SMBIOS specificati=
on.
As
the data for smbios-mdr does not follow this, do you know about the
document or any information I can reference to prepare data to send
to BMC??


Best Regards,

Thang Q. Nguyen

On 14/09/2021 15:51, Andrei Kartashev wrote:
</pre>
                    <blockquote type=3D"cite">
                      <pre class=3D"moz-quote-pre" wrap=3D"">No, it is not =
same as &quot;dmidecode --dump-bin&quot;.

On Tue, 2021-09-14 at 13:46 +0700, Thang Nguyen wrote:
</pre>
                      <blockquote type=3D"cite">
                        <pre class=3D"moz-quote-pre" wrap=3D"">On 13/09/202=
1 23:56, Andrei Kartashev wrote:
</pre>
                        <blockquote type=3D"cite">
                          <pre class=3D"moz-quote-pre" wrap=3D"">You need t=
o somehow deliver smbios data image to BMC. This
means, your BIOS should implementat some logic to transfer
this data.
For BMC side see example here:
<a class=3D"moz-txt-link-freetext" href=3D"https://urldefense.com/v3/__http=
s://apc01.safelinks.protection.outlook.com/?url=3Dhttps*3A*2__;JSU!!HSntlCg=
!TV2b4jzad6O_WAZAI1wboTdRw8KbITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjc=
RTS57ySTDXQQ$">https://urldefense.com/v3/__https://apc01.safelinks.protecti=
on.outlook.com/?url=3Dhttps*3A*2__;JSU!!HSntlCg!TV2b4jzad6O_WAZAI1wboTdRw8K=
bITIWTzC2fn5GNRJ7DifQr1xCsFKxRrh5vW0XmDcRgtYvjcRTS57ySTDXQQ$</a>
F%2Fgithub.com%2Fopenbmc%2Fintel-ipmi-&amp;amp;data=3D04%7C01%7Cchli
30%40nuvoton.com%7C81a4bd29e4904bf4d84608d978510b92%7Ca3f24931
d4034b4a94f17d83ac638e07%7C0%7C0%7C637673526954552742%7CUnknow
n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik
1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DcG6ZZzOSXkuUtcQuuoymsRdP
p24mINa%2FhCy%2BYhe%2FNmk%3D&amp;amp;reserved=3D0
</pre>
                        </blockquote>
                      </blockquote>
                    </blockquote>
                  </blockquote>
                  <pre class=3D"moz-quote-pre" wrap=3D"">oem/blob/master/sr=
c/smbios
</pre>
                  <blockquote type=3D"cite">
                    <blockquote type=3D"cite">
                      <blockquote type=3D"cite">
                        <blockquote type=3D"cite">
                          <pre class=3D"moz-quote-pre" wrap=3D"">mdrv2handl=
er.cpp
</pre>
                        </blockquote>
                        <pre class=3D"moz-quote-pre" wrap=3D"">Hi Andrei,

What is the format of smbios data to transfer to BMC? Is it the
same content of &quot;dmidecode --dump-bin&quot; command from Host Linux?
</pre>
                      </blockquote>
                    </blockquote>
                  </blockquote>
                  <pre class=3D"moz-quote-pre" wrap=3D"">or
</pre>
                  <blockquote type=3D"cite">
                    <blockquote type=3D"cite">
                      <blockquote type=3D"cite">
                        <pre class=3D"moz-quote-pre" wrap=3D"">anything spe=
cial in formatting the content to send?

</pre>
                        <blockquote type=3D"cite">
                          <pre class=3D"moz-quote-pre" wrap=3D"">On Mon, 20=
21-09-13 at 17:40 +0300, Alexander Raih wrote:
</pre>
                          <blockquote type=3D"cite">
                            <pre class=3D"moz-quote-pre" wrap=3D"">Hi guys,=
 I am beginner in openbmc I build openbmc with
smbios-mdr repository and I have error:

Read data from flash error - Open MDRV2 table file failure

There isnt file in /var/lib/smbios/smbios2

How I can resolve this problem?
Help me please!!!
</pre>
                          </blockquote>
                        </blockquote>
                      </blockquote>
                    </blockquote>
                  </blockquote>
                  <pre class=3D"moz-quote-pre" wrap=3D"">--
Best regards,
Andrei Kartashev

</pre>
                </blockquote>
                <pre class=3D"moz-quote-pre" wrap=3D"">____________________=
____________
________________________________
   The privileged confidential information contained in this email is inten=
ded for use only by the addressees as indicated by the original sender of t=
his email. If you are not the addressee indicated in this email or are not =
responsible for delivery of the email to such a person, please kindly reply=
 to the sender indicating this fact and delete all copies of it from your c=
omputer and network server immediately. Your cooperation is highly apprecia=
ted. It is advised that any unauthorized use of confidential information of=
 Nuvoton is strictly prohibited; and any information in this email irreleva=
nt to the official business of Nuvoton shall be deemed as neither given nor=
 endorsed by Nuvoton.
</pre>
              </blockquote>
              <pre class=3D"moz-quote-pre" wrap=3D"">Legal Disclaimer :
The information contained in this message may be privileged and confidentia=
l.
It is intended to be read only by the individual or entity to whom it is ad=
dressed
or by their designee. If the reader of this message is not the intended rec=
ipient,
you are on notice that any distribution of this message, in any form,
is strictly prohibited. If you have received this message in error,
please immediately notify the sender and delete or destroy any copy of this=
 message!
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------YRq7qAxgES0Hj0eSPtwTIpyy--
