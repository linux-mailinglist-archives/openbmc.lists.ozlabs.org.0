Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6473240A6DB
	for <lists+openbmc@lfdr.de>; Tue, 14 Sep 2021 08:47:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7v6M1X6Xz2yJJ
	for <lists+openbmc@lfdr.de>; Tue, 14 Sep 2021 16:47:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=zh4NRkph;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.223.114;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=zh4NRkph; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2114.outbound.protection.outlook.com [40.107.223.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7v5r2sssz2xtb
 for <openbmc@lists.ozlabs.org>; Tue, 14 Sep 2021 16:46:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L48HKNhJ6pt3yvWwEadvCByiPEAd83Dvq/wGFcQ7+raaKTfTXMEQO/riEy8jgoWrG5zMzgFUwUYrCg5NK9/nIomlOMnmTyqvIj74vsxxAy8ZyC6hVzdXLd13wOW8GLWQ6oqRDiVqizTC2M8fhavI2eijUrExx0FS4D5SoTtdXK6SBurDE0W1fFoMek9W3HDb899Kf5zimbdPojLZbg4+ufUQuNKkwvOFqPSrqyi4bwcjvbw4EfWv4neHm2L990Y/cLOHUjsTC8tml74w6sJ1GUUWabftsUvXch01Y76TT1SbiufctyHn8vkTI+O8AoWS4X1uTd+jYCYptwvptUYP5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=SvfRFc4kNPdjkhE8MFLmotq4YFewpQrtbUqj8AvMLH8=;
 b=HV8QXPmzYEuGsfU4cUqeeJKdKI7yI1gbXRl/pfgMgxBZh0I9MPo7msIP9KUKRsBTfGrm0QTAxWdGWbGPvzB23aAClkJBALLnk2KzkjYl/X7kubeU6zmJ9UHY6zfCBhJT2pI60idrvckmeKzywHPxWyvRunq5hGYEsB8l9Ms/Nm+iWH7ZzOzgcdjjm52EYNL5F7BGpbt77ZzQNhk2QBYuKRprmF6RXQkZMdsDI7RRzJtWz8OXo79mNmgCFj2EDxPgmtcB2pZgXa/qEql57rL+ZqqBoAQRwogKV6E8xQxl7PrpXyV88Luk/zS+BCX4qWCxfJ+DvgksqqRrgmFqI7FSyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvfRFc4kNPdjkhE8MFLmotq4YFewpQrtbUqj8AvMLH8=;
 b=zh4NRkph9TvhXb7P7RheQ/ZOpPhWX/n1Mm89h2l/J/oeLbfhZGdwo2M7El9mopTOhvm23CW/n1nqWkTdPRKA48hi2R2vzqc/WM5YsgPG3wRysuwQ7XdEUUAzz+8oGngt4+1WjEkgaabwI8nCXjvNB8jeZTzCtRvVe79sINpjDvM=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 BYAPR01MB4005.prod.exchangelabs.com (2603:10b6:a03:16::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14; Tue, 14 Sep 2021 06:46:35 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::545:38ca:33b2:afdc]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::545:38ca:33b2:afdc%6]) with mapi id 15.20.4478.026; Tue, 14 Sep 2021
 06:46:35 +0000
Subject: Re: Read smbios2 file failed
To: openbmc@lists.ozlabs.org
References: <CAMqwjCAaHrv0SgA_1hDEjjnX1fur6ijmCJCrn1gTPbr5Z2-ONw@mail.gmail.com>
 <d190054863c8112a66baad2f50dda7c6bdc45717.camel@yadro.com>
From: Thang Nguyen <thang@amperemail.onmicrosoft.com>
Message-ID: <5f94cf85-6ded-3520-8ad2-592fade91e81@amperemail.onmicrosoft.com>
Date: Tue, 14 Sep 2021 13:46:26 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <d190054863c8112a66baad2f50dda7c6bdc45717.camel@yadro.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: SG2PR06CA0100.apcprd06.prod.outlook.com
 (2603:1096:3:14::26) To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
Received: from HCM-FVFX4014HV2J.local (42.116.120.79) by
 SG2PR06CA0100.apcprd06.prod.outlook.com (2603:1096:3:14::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 06:46:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 839c30d0-b42e-41d5-0dd7-08d9774b64c5
X-MS-TrafficTypeDiagnostic: BYAPR01MB4005:
X-Microsoft-Antispam-PRVS: <BYAPR01MB400529192836205266488DD08DDA9@BYAPR01MB4005.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gARKSwzvyMqCFiID9xLRcN1Bh25JfVWYIBpxqIOiMUteeao/2mwnHgaRr+cZ5AfkcAoLXmJESITERU5JPGZkHX/9+lhmNtFrcRwxwbJ7/jW8JgsyAccQeo2FLOEtyDo+xAxucA1lkcz3sOpz79leWqh4H9xQ0NeAN7lCkmdSeeIorIg/S2OS7BCNZNSu6f73StmT0G065SyHvYL3MpHS8sF5jS0GAHDDqJkbsxmzW44/kMbTrqIj5ikQ9ywS7slEbLJPeNGWSG5VUbrdpfq5oYmuKA4qNw50/HSzoftucj8tFKoibdgWdgQLLNLM/CnxKDOAvPvOoufXxRWn6+qSs5t1qpgAEiqybKm2lByahoseG3WtKr2tjGqN6NmHfyOHIoaIJ9neQLdL4S07SU3xBE5Hf9huB5TSpTw4mBs9bexFcGHnrPBcq0VwFSLQd+ejhAVP31+izu6Dpe2PJIm6Kc3Ow+ier5pONclcS24xRjwFyEV6YXxZ4D/b3H5zncF1MfkgjSKu5FAJBZUvCIQr/Tik9RIz6sMEmEDG4MzEAJAfJT7OSHa2B84vJR8zTpH2Huho6sOqIr/RqJpNQjkwhOAPWtsLxrEZizJRTqDeB4Bie8WYWKdckZlmJiNt7s5u7ZJ061XcISaSf1EkU4JWLK3V7kq5gKW2ceZHgOvf6aDwSbRXQj0nlIH5zTeMDbaIsKVVqoESjtmGemP2ATwFG7HrrrRHq1thc5rFff9riDclW9g6FTKXnY8gBYu+oJTBzhfcuu6anEc6RQjXjbOKGPYRUHGCRIIsx1Qpspg3pb6h++0e/NaV2pQYcE7O6pCml9SRHwOINP7JWJ109nhwYnObJMcrM7VG3BdpbiqpC44=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(6506007)(6486002)(83170400001)(53546011)(4744005)(6512007)(38100700002)(6666004)(186003)(52116002)(5660300002)(38350700002)(966005)(42882007)(8676002)(956004)(2616005)(66946007)(66556008)(8936002)(31686004)(2906002)(6916009)(26005)(316002)(508600001)(66476007)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2h3VHNOZjRBVXBablFCKzFDSlpSSmEzUEdLWG9RN21jYVhORE9tYldwVXNB?=
 =?utf-8?B?b2ZUeHpSa3hLR3M1T3pHeTNsQVpuQnRHZEh1YnZKSVNwSGpjNXVoZU02YzZy?=
 =?utf-8?B?cDdqVHBrMDBoZkVmTkx2YlNvM2NKL2RXUHo4UFRwTUVaKzVzNUxtd0thWE9i?=
 =?utf-8?B?Tm5IT2g4NTlNZ1ZGV0VuOFprcG1nV1lvQ2dnaXprczloNHFmNGxnS2paeDQ3?=
 =?utf-8?B?WHVxdVU3UE9Ubmh1eEhNRUpPcGpQcWNHRnRVUjI1dXB0Wmh2aGFseHlrdkMx?=
 =?utf-8?B?SkVPd29PU1lRUERhaWR5dE5mNnR6V2RIays5VEhNcVBLcXBwKzhQNFhVNFFJ?=
 =?utf-8?B?c1dLZ3A5YU1DRTIvOVQvbFVPWldaRlZUZWJJa3UrSklETStRLzZUTDREVTRh?=
 =?utf-8?B?TDFXSnJPREJCQXpQWHVKSHhnS1o3S2RFRWJ1MHZzREZkNjJSaHg5Q2pFRk1k?=
 =?utf-8?B?M29aZG1OVGhwcTV1c1ZUUDhBVkQvRWpxa1Z0eFhRM3FSU2hLVVFjd2tuK0Q3?=
 =?utf-8?B?d3pZQTYvcTNMcTJEVW9QSi92eHdOOXU3VXNsUU9JcDVTN2hTdk1ZbGNUQk5V?=
 =?utf-8?B?NDRhZlVEcExzS1FzUVQrRnhTUkdIYk9QbkljbEVwT2Nqem9PR2ZROVM3d0Nv?=
 =?utf-8?B?N3lDVE5JUU40UHNUZG9FeXNjeTJzc0h0TE00eWg0czFmWWc1VG1yWWhWQkdq?=
 =?utf-8?B?RXdkTm0vTzR6YTU5NEZBL01XMHdFRnA5Q1lFK3NKWTQzTllJU3BmVGdmOExE?=
 =?utf-8?B?bkwzYUJaRzU2QklaTjBUbHpZVjJBb2ErYk50SU1YWGI2dEROcHdKcnBTTjhK?=
 =?utf-8?B?Zm9tSUE5TVFmSTdOakFZQzdYK3BsSGIvZE4xL2lQbVhVWVJFN1VlL0hINE0w?=
 =?utf-8?B?eHVkeC9ucHhXanZERGcwS3lEWUxiQUY4c3Y0R0FzSmk1MnRJN2tRdEpxbG1u?=
 =?utf-8?B?V3dTaC9mejJGNk90UkczUkJxZGhEaDNUbzUwRkQrV1BicXBsWVJib2t5TTU1?=
 =?utf-8?B?U3dSalB5L0I4YnF4MENzbjJ3MElDZjVJdkUxck9CZU9EVEFHZTRZS3hlaXhu?=
 =?utf-8?B?UmV2RHRTUlJYTWxRL2lBTEtPUzlkNGh2TmMwZG5ITmpTNDAySm5DZGI3aW5J?=
 =?utf-8?B?a3I0Tnp5QW1aTmZRME56M2h4Rm85NGgxYlFGYllneW16WUhJOU51eGFkSXdW?=
 =?utf-8?B?dGxPVFN1YW9WNzNNYmp2ZTRXdXQyNlFGNFNFZmRUUlpCb0o1eE5UYVZONnhX?=
 =?utf-8?B?YkVJNmtzK0h2YVlEU1plQlNTa0F6S09lZlM2MmhEN0pHa29XN0Z6NlFOS09J?=
 =?utf-8?B?ZjF1NjhXMFI2VGZkMTRRWHdBTkk3TlNJemN4NGwyS3JzRXd5cmIyd0lNMmlP?=
 =?utf-8?B?ZSt0Mi9FandUL3RyZmI0dnh1SjVxTm93eklINkxNNzQ1QUdOZVkvTWFLSXlL?=
 =?utf-8?B?ZkVjYVRaZmEzUWY2eFRmaFNtVzFZclBxZE9QZEZpTlh3RE5zelh4MTYvRmtZ?=
 =?utf-8?B?Y2RHKzR6TG1ybUEzZjlFKzJjbUU0VWtDUko2bWpOdWYxRElGTzMxdlpiVVdo?=
 =?utf-8?B?K2V0RXl5ZEhmamh3b3ViaUNnb2RLVDlraHJsL0ZRdTB0RmFPZ3RUZDlyRnV1?=
 =?utf-8?B?Mi8rYmFhZDlWOFZFWjd6cWlHT1hpdEJUemp4SWpjcGZFM04xQm96cUF6SWRG?=
 =?utf-8?B?VFhWaFR5WXNZblQwUmJJOUs0WmFLbWtObTR2dktzWlFMSGt3cndqcWVwWWZE?=
 =?utf-8?Q?YHyXSGbV+hQColQPydhkS62grjo23DiMrpEUss6?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 839c30d0-b42e-41d5-0dd7-08d9774b64c5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 06:46:35.1591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ClAe029w4yuCkVpo2E9BLIe+h/LNicYp2YQ/9tbUV5rz8pdBVcNd+vKFA5IXOjGPHVfhyBNZlMweV18EiIokLvftAUso5ytkvu8cw1Ooe7qfttCgcvAL7r2DXFHYClRL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB4005
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


On 13/09/2021 23:56, Andrei Kartashev wrote:
> You need to somehow deliver smbios data image to BMC. This means, your
> BIOS should implementat some logic to transfer this data.
> For BMC side see example here:
> https://github.com/openbmc/intel-ipmi-oem/blob/master/src/smbiosmdrv2handler.cpp

Hi Andrei,

What is the format of smbios data to transfer to BMC? Is it the same 
content of "dmidecode --dump-bin" command from Host Linux? or anything 
special in formatting the content to send?

> On Mon, 2021-09-13 at 17:40 +0300, Alexander Raih wrote:
>> Hi guys, I am beginner in openbmc
>> I build openbmc with smbios-mdr repository and I have error:
>>
>> Read data from flash error - Open MDRV2 table file failure
>>
>> There isnt file in /var/lib/smbios/smbios2
>>
>> How I can resolve this problem?
>> Help me please!!!
