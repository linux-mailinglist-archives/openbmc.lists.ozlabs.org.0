Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F3035281A
	for <lists+openbmc@lfdr.de>; Fri,  2 Apr 2021 11:08:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBZ352kGTz3bxl
	for <lists+openbmc@lfdr.de>; Fri,  2 Apr 2021 20:08:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=XceAnJ11;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.93.101;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=XceAnJ11; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2101.outbound.protection.outlook.com [40.107.93.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBZ2k4tDpz3bNd;
 Fri,  2 Apr 2021 20:07:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IsYfy1P64v3p0ThBkNC3iCLK/05o8uvNGqi5sbDsvfOJVWKkNUODX+yFYzHf38uDY1wNODhDnHBPc59eDhudEl+ZFKhmd4FJz3S03maIJkEHBdp/smv7JOwYL0wPEDZK9w8KwSqNkPi4N3OrQVyEr1AbMAwH+VaXYKKrF35pwZW7xNvntHvUqR6H59RxNxC+uDmWgAgd2lQF6anedKV0h/z0A8RygNmzKEUlopQGAEeFZbZgWN+RrxnqArI0/51+4QA/W1osVcFTMEXcAitopAYHjqHqXPRm7sqZ4TK0sKYF0BCOT+U8S+M5LQ+8Cf+7KMtMrev3R5xnJ6nEvKxPPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvloSivmijiHKfQne5a7I41PrcMF16roAk/XHMOvbRI=;
 b=mqGZT/dozrmU29R3kzxswTllKdYm79LVDYL41/ziiwoHcZNvOFhoswTgwQ6IXDeEEQ64D2sAAOkA2oTjnv51M82gGOnZUZUi6PNYE0+QNN1YEtMvZp9Gpic9OV3NoiJ+WXI8753SPFfrKeSGybP9hkJAz5bIYidDLRT8Ysx/swYQssN1BMPrj35ysn+sU2jm/MbxLUxbjXCEmyXSrYafKGNNXUuemT9866Ua6V7sn9oC86ZrITrm2jBLhSG96Jbh/AaCatlfFo+dMIvPi0vptnWe70MCQ8GO5ToSAzMRxDt4CVWrC6F5OWD5AZkQ/ZWarjE/5uZhF2RYT3+xGUIGHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvloSivmijiHKfQne5a7I41PrcMF16roAk/XHMOvbRI=;
 b=XceAnJ113SxOO+tMGPZbCWSNEuTJn8D5zEXgRdWvboHwF+hqxkdfxZjJ6eGPcNWMKjQRjxN2vlm8hacYFDP9e24rL8rIz9m1YVn68WgWuIoX9fdwJ+TzMdU+eQfqWkLn9nLEQjUAw+Ik7yg+hfMWbdGEs1VaBeeat/D0ZdjfNOc=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none; os.amperecomputing.com;
 dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW4PR01MB6179.prod.exchangelabs.com (2603:10b6:303:67::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.26; Fri, 2 Apr 2021 09:07:48 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.3977.033; Fri, 2 Apr 2021
 09:07:48 +0000
Subject: Re: [PATCH v1 2/3] drivers: char: ipmi: Add Aspeed SSIF BMC driver
To: Joel Stanley <joel@jms.id.au>
References: <20210329121759.5644-1-quan@os.amperecomputing.com>
 <20210329121759.5644-3-quan@os.amperecomputing.com>
 <CACPK8Xf5d67-KR9AQ9QMcyT2Or9ieF_Q+_RbMMTHt4ckiKi6_A@mail.gmail.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <e0016596-9ac8-8a54-68bf-42a6959e78be@os.amperecomputing.com>
Date: Fri, 2 Apr 2021 16:07:34 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
In-Reply-To: <CACPK8Xf5d67-KR9AQ9QMcyT2Or9ieF_Q+_RbMMTHt4ckiKi6_A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HKAPR03CA0016.apcprd03.prod.outlook.com
 (2603:1096:203:c8::21) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.100] (118.69.219.201) by
 HKAPR03CA0016.apcprd03.prod.outlook.com (2603:1096:203:c8::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.8 via Frontend Transport; Fri, 2 Apr 2021 09:07:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b557966-526e-41ec-8d7a-08d8f5b6c93d
X-MS-TrafficTypeDiagnostic: MW4PR01MB6179:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW4PR01MB61790981612EB910D0C7D388F27A9@MW4PR01MB6179.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cEV6kW+wpNGouOxTloiTuEKKWycdmtPcuJ6M4T5FP4IoQwYAvxkxgDTKpJNTjdMXYh0RyrYroouysPrwpZ09ASYaG4tFoz3nHpDINqd5iUo2FXt2XJhP3QhfIWnud9s0mdCVPETJa7CYP2pxvbx4RM4eOj9bHl9Z5yjp+qbpSg2+vpP/n2sOXiQlM/fqHs9yLj3jzmBsuBEdsq6XHV1ILoaeXld5Ihlt0kPnkWxrXuHW1+elIKU/XzgoWwFWiw/C9SBxjX7htaIDmmsi1UXsXTuPZsFZt6lf/0zblLdZh7Npeq/63d8rBQbDkwKFUjopRaPqn4Jhwnrw9VTAK+VKLOhZoL95hEOm8n0m1l4Y+wvRRvLKnGLPdFqQBNa+XYpeZ4TmtXnIhgYDgSQ84R5z8zJ5sk1xasr6f7QRzJXddy0mRr3Okj/t9xySpRLq+StsI+OrVZvMkJ2JciCwgounQNVmwZcQlS5Hm8tTAikGfZZr4i0IFiFNvXnfYybWkL7xKZLFCoFWi+sMabPx8jDSYfR4XuW88NDshz14gKZZKjFGWRyRAWG8ny3RWeh6zsrHNuATkKFyjlkLEn8RV5sCPkl2bumZeyxGgreIya5Jz8mI0HU24m9MsV9qYsFEPdxUkSNzwSblE5wR87W+JTAJkQXDavudZ9BUc2YzuKSx2QWZU/+XKrgCIrBpyAKhWvXQy70VitxTL56QIKd2neIFughIkCsIw8Zzb8z9VKKu1EhXEDQakwzmpm/roNQKrjPodPeJSuzMLlz5g9ZIFqQr516nI97+UrM0bKSrF9Oh/YnlA6WpQLOSfjHt25j3z9wy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(396003)(39850400004)(136003)(6916009)(2616005)(956004)(54906003)(66946007)(66476007)(66556008)(8676002)(6666004)(186003)(86362001)(16576012)(5660300002)(52116002)(316002)(30864003)(53546011)(31686004)(6486002)(478600001)(83380400001)(26005)(38100700001)(16526019)(8936002)(107886003)(2906002)(31696002)(7416002)(4326008)(2004002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZHRXaGIzZ3dqQXlDRlZOTnZYUm14a2JHaWNwSkUvNC9oZWZGUkp2MWhOMS9Z?=
 =?utf-8?B?bThhUTA3RmNoaGNhZTJkZTJMRG5GMmZweWdOZ2c2d1VWZHBSc3FQSno3UDRJ?=
 =?utf-8?B?d3Z6R3QydUlXVDg1Y21GUFVsZUFRbDJ2NHBHeC9OSjNZNGdiYWVxc0taYVVT?=
 =?utf-8?B?dWxnN2RwZVFsbWJxRi9LSXpLOFZWVzc3YWtvc2FFZktDTGczd09DdGFtbUpR?=
 =?utf-8?B?UEg0Y3U3U1FrN2tpKzllMjdwYm16SHRkUWVXQ3IzaHlIUUYwL0FqamdXR3Y3?=
 =?utf-8?B?aXljOGdnTm9uRlBMWWwwR2h0aFBDZGMxQ2NGeVpReFhmZTFxK3d2ZlBYUkVH?=
 =?utf-8?B?VXJvM2hwakRhTk8xajA5QzMzeUtySENRdThrd1RGc2o1VStFbjEyVFRvdU0y?=
 =?utf-8?B?REVCK1doWnNmOFpScFJEVkxadytpbklqcFljTmRmOFBjRlVMaDZpbll1dzRh?=
 =?utf-8?B?QkNPY0RVdjlyanYya1hCOTJLTzB3dVorOEp6bE1WMG1ZaDJLQWRJQktiK2da?=
 =?utf-8?B?OFNXejVtVVE5L29abSswaENTMkVobXFCL0RvTXY4dWo4VCtYMlo4VHg0YlFp?=
 =?utf-8?B?UVNwaWJuK3ByQXJXbEFJOW00NlZRSnN4Z3dnallxUmJBYTJpTkJhT2hFeXRY?=
 =?utf-8?B?TDd4YU1lditUY3VDN1lSUUhIdXNWSURvclJvUDFsUUlBc3BHeXpicFc0bmZs?=
 =?utf-8?B?QkhzSE5wVXZWLzk0cVFQWXRNMXpBSnI4MUZxeXlYdmxuTFROZmljQjFzWStD?=
 =?utf-8?B?V1ZLRzZiM2Z3elM3Nll6MzllNFQyM3JWSVkwdDU3bTMxTjBnRk13WnB5V08w?=
 =?utf-8?B?NG9TTlEvU0NIWSthYWlhNFV5Mkw4QTU0V3JscUFJbkpFd1MrNUk4OWZTLzRL?=
 =?utf-8?B?UktUT2t6VHllZThoWURRdFRQZ2lsVnhGTVdMU09UUEcxY1ZJWDRoSXcyWU0w?=
 =?utf-8?B?WURHRVdxalByL0ErbzI5d25PYjJwbGFCclYyWlhLTThoTEZyZmxMekxBUUdT?=
 =?utf-8?B?VnhvWC9JcUJzV0dOZ0tyVzlLS3F1aHJoemlOVUEwMzBCUE5iSG9vWDhsS25L?=
 =?utf-8?B?U3R0elRPODQ1V0JleEpETDQydndjMUN2ZkdZUzBScnpVU2xjdVhzVEs1b2Nl?=
 =?utf-8?B?dkgxeDZ2Uzd4bERGTStnNWk5RG9RbGtJZzRqd0NzaWFJZHRONGFJb2MyTXc3?=
 =?utf-8?B?MmhQd0crcGRmdmlyS21KcHRuM25zaXZLMjJNQWd1THRBb1d2YytPeXdoQlBk?=
 =?utf-8?B?MHJCUTZVdTRNRUFHUi9Rc2NNTW9hdG50bU94dWhLcnhqLzl0YXA4TTJ0RXBs?=
 =?utf-8?B?MDc2dUtTRFByUi9xVXQ2eHNsWmdSeDdZWEdnWTFmYktFNFFFTUZrTFFXZkU0?=
 =?utf-8?B?b1pQeDNnbWk0QXkvcTdUOUprbFRsRmxNRnN3UHloUERheGsyS3FRc1RGS3FO?=
 =?utf-8?B?RHRnY25MN2xta08wU0tmdk1WOGxnbGZnYytrdUpVZi91aTdaa3pabGJEM0Ey?=
 =?utf-8?B?c0xQMkNvWDVESWVFcGJaOUx2L2tsVDRYQjlEYURoaCtLanN6YytBLzd0ZEpY?=
 =?utf-8?B?eVZEb0orZ2Q1UjhybkxiRGlVWEczOTdEOHE1N0lCRkxwbUgrZmtsWE5zeUhW?=
 =?utf-8?B?bXVLTnFRdjNnYWhLb29MbTRjcFE0T09YWXoyanVpa0tGUXZlTVJDZVZ4L1FG?=
 =?utf-8?B?YmZHQU13UFc5SmJ4MzAzVTM3YVJtTXZTbFNYTUxpc0FrbFNyNnV3R2VoaENl?=
 =?utf-8?Q?DnQHukp9EkPYG6PO6jgmpd+OeeVIyIx7wcR/Xmz?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b557966-526e-41ec-8d7a-08d8f5b6c93d
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2021 09:07:48.5790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+/kt/6b71RhZ9g59fX6SRV+CjFdbb/tIitGO4j0bZwep/iwm+INm76rH25V0V1hS9W04YXKsOT0rSVEqao7j6I5xloR4+WhTW5Q0bSTr5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6179
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Corey Minyard <minyard@acm.org>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net,
 Open Source Submission <patches@amperecomputing.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 31/03/2021 14:21, Joel Stanley wrote:
> On Mon, 29 Mar 2021 at 12:18, Quan Nguyen <quan@os.amperecomputing.com> wrote:
>>
>> The SMBus system interface (SSIF) IPMI BMC driver can be used to perform
>> in-band IPMI communication with their host in management (BMC) side.
>>
>> This commits adds support specifically for Aspeed AST2500 which commonly
>> used as Board Management Controllers.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> 
> I don't have any SSIF or IPMI related feedback on your patch, but some
> general things I noticed when reading it.
> 

Thank you, Joel,
I'm really appreciate your comments for this patch series.

And, as there is a compilation error detected by kernel robot test, I 
was hurry to send out v2 just to fix that just before your email 
arrived. So I'd like to address all comments in my upcoming v3.


>> ---
>>   drivers/char/ipmi/Kconfig           |  22 +
>>   drivers/char/ipmi/Makefile          |   2 +
>>   drivers/char/ipmi/ssif_bmc.c        | 645 ++++++++++++++++++++++++++++
>>   drivers/char/ipmi/ssif_bmc.h        |  92 ++++
>>   drivers/char/ipmi/ssif_bmc_aspeed.c | 132 ++++++
>>   5 files changed, 893 insertions(+)
>>   create mode 100644 drivers/char/ipmi/ssif_bmc.c
>>   create mode 100644 drivers/char/ipmi/ssif_bmc.h
>>   create mode 100644 drivers/char/ipmi/ssif_bmc_aspeed.c
> 
> It would make sense to split the aspeed implementation into a separate
> patch form the ssif framework.
> 
Yes, will do in next version

>> +++ b/drivers/char/ipmi/ssif_bmc.c
>> @@ -0,0 +1,645 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * The driver for BMC side of SSIF interface
>> + *
>> + * Copyright (c) 2021, Ampere Computing LLC
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License as
>> + * published by the Free Software Foundation; either version 2 of
>> + * the License, or (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program.  If not, see <https://www.gnu.org/licenses/>.
> 
> You should omit the licence text; it is replaced by the SPDX tags.
> 
My bad, will remove in next version

>> +static int send_ssif_bmc_response(struct ssif_bmc_ctx *ssif_bmc, bool non_blocking)
>> +{
>> +       unsigned long flags;
>> +       int ret;
>> +
>> +       if (!non_blocking) {
>> +retry:
>> +               ret = wait_event_interruptible(ssif_bmc->wait_queue,
>> +                                              !ssif_bmc->response_in_progress);
>> +               if (ret)
>> +                       return ret;
>> +       }
>> +
>> +       spin_lock_irqsave(&ssif_bmc->lock, flags);
> 
> What's the lock doing here? We've just waited for response_in_progress
> to be false, so we then take the lock to check what value it is?
> Should it also be sending some data in this function?
> 
The lock is to make sure ssif_bmc->response_in_progress are completely 
processed, ie: when the lock already released.
My concern is that reference to that value without acquiring lock may 
not be true as it is under other possess.

In fact, the lock here is for the whole data pointed by ssif_bmc 
pointer. Hence, every reference/modify to this data must be done with 
the lock acquired.

>> +       if (ssif_bmc->response_in_progress) {
>> +               spin_unlock_irqrestore(&ssif_bmc->lock, flags);
>> +               if (non_blocking)
>> +                       return -EAGAIN;
>> +
>> +               goto retry;
> 
> The goto threw me, so I tried re-writing it without. Again, I don't
> quite follow what the spinlock is doing.
> 
> while (1) {
>      if (blocking) {
>          ret = wait_event_interruptible();
>          if (ret)
>               return ret;
>      }
> 
>       spin_lock_irqsave()
>       if (ssif_bmc->response_in_progress) {
>           spin_lock_irqrestore()
>           if (!blocking)
>               return -EAGAIN;
>       } else {
>          spin_lock_irqrestore()
>          break;
>       }
> }
> 
> 
I'm afraid we would need to re-acquire the lock before modifying 
ssif_bmc->is_singlepart_read and ssif_bmc->response_in_progress below.

>> +       }
>> +
>> +       /*
>> +        * Check the response data length from userspace to determine the type
>> +        * of the response message whether it is single-part or multi-part.
>> +        */
>> +       ssif_bmc->is_singlepart_read =
>> +               (ssif_msg_len(&ssif_bmc->response) <= (MAX_PAYLOAD_PER_TRANSACTION + 1)) ?
>> +               true : false; /* 1: byte of length */
> 
> I don't follow the 1: byte of length comment, what is it telling me?
> 
> The ternary operator is a bit messy here, I'd go for a good old if statement.
> 
The comment indeed does not provide any info here. Will change back to 
if else statement and add more meaningful comment if necessary in next 
version.

>> +
>> +       ssif_bmc->response_in_progress = true;
>> +       spin_unlock_irqrestore(&ssif_bmc->lock, flags);
>> +
>> +       return 0;
>> +}
> 
>> +/* Handle SSIF message that will be sent to user */
>> +static ssize_t ssif_bmc_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
>> +{
>> +       struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
>> +       struct ssif_msg msg;
>> +       unsigned long flags;
>> +       ssize_t ret;
>> +
>> +       mutex_lock(&ssif_bmc->file_mutex);
> 
> ->file_mutex is protecting the device against more than one user of
> the character device? Can you enforce that in open() instead?
> 

The current use is to serialize access among read()/write()/poll().

About enforcing open() to return -EBUSY to protect the device against 
more than one user, we can either implement follow example of 
drivers/char/ipmi/kcs_bmc.c OR drivers/char/ipmi/bt-bmc.c

But I'm still wonder what should be better between atomic_t open_count 
(bt_bmc.c) or simply reuse the file_mutex similar with kcs_bmc.c.

>> +
>> +       ret = receive_ssif_bmc_request(ssif_bmc, file->f_flags & O_NONBLOCK);
>> +       if (ret < 0)
>> +               goto out;
>> +
>> +       spin_lock_irqsave(&ssif_bmc->lock, flags);
>> +       count = min_t(ssize_t, count, ssif_msg_len(&ssif_bmc->request));
> 
> count is user controlled, so I assume ssif_msg_len will always be less
> than or equal to struct ssif_msg?
> 

The size of struct ssif_msg is 255 bytes, and the ssif_msg_len() should 
always return less than this number unless the ssif_msg->len is wrong 
and exceeded the size of struct ssif_msg.

For safe I think it should be changed to the min among count, 
sizeof(struct ssif_msg), and return value of 
ssif_msg_len(&ssif_bmc->request).
ie:
count = min_t(ssize_t, count, min_t(ssize_t, sizeof(struct ssif_msg), 
ssif_msg_len(&ssif_bmc->request));

>> +       memcpy(&msg, &ssif_bmc->request, count);
>> +       ssif_bmc->request_available = false;
>> +       spin_unlock_irqrestore(&ssif_bmc->lock, flags);
>> +
>> +       ret = copy_to_user(buf, &msg, count);
>> +out:
>> +       mutex_unlock(&ssif_bmc->file_mutex);
>> +
>> +       return (ret < 0) ? ret : count;
>> +}
>> +
>> +/* Handle SSIF message that is written by user */
>> +static ssize_t ssif_bmc_write(struct file *file, const char __user *buf, size_t count,
>> +                             loff_t *ppos)
>> +{
>> +       struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
>> +       struct ssif_msg msg;
>> +       unsigned long flags;
>> +       ssize_t ret;
>> +
>> +       if (count > sizeof(struct ssif_msg))
>> +               return -EINVAL;
>> +
>> +       mutex_lock(&ssif_bmc->file_mutex);
>> +
>> +       ret = copy_from_user(&msg, buf, count);
>> +       if (ret)
>> +               goto out;
>> +
>> +       spin_lock_irqsave(&ssif_bmc->lock, flags);
>> +       if (count >= ssif_msg_len(&ssif_bmc->response))
> 
> Is that test correct?
> 
As the "if (count > sizeof(struct ssif_msg))" above ensure the data will 
not exceeded the size of buffer, ie: sizeof ssif_msg, we can now to make 
sure the actually data size to agree with ssif_msg->len, ie: the return 
of ssif_msg_len().

But as this test looked "not easy to read" so I think I will fix this to:

    if (count < ssif_msg_len(&ssif_bmc->response))
         ret = -EINVAL;
    else
         memcpy(...);

Hope this way made it easier to read.

>> +               memcpy(&ssif_bmc->response, &msg, count);
>> +       else
>> +               ret = -EINVAL;
>> +       spin_unlock_irqrestore(&ssif_bmc->lock, flags);
>> +
>> +       if (ret)
>> +               goto out;
>> +
>> +       ret = send_ssif_bmc_response(ssif_bmc, file->f_flags & O_NONBLOCK);
>> +       if (!ret && ssif_bmc->set_ssif_bmc_status)
>> +               ssif_bmc->set_ssif_bmc_status(ssif_bmc, SSIF_BMC_READY);
>> +out:
>> +       mutex_unlock(&ssif_bmc->file_mutex);
>> +
>> +       return (ret < 0) ? ret : count;
>> +}
>> +
>> +static long ssif_bmc_ioctl(struct file *file, unsigned int cmd, unsigned long param)
>> +{
> 
> If you're not using this I suspect you should omit the callback.
> 
Will remove this in next version

>> +       return 0;
>> +}
>> +
>> +static unsigned int ssif_bmc_poll(struct file *file, poll_table *wait)
>> +{
>> +       struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
>> +       unsigned int mask = 0;
>> +
>> +       mutex_lock(&ssif_bmc->file_mutex);
>> +       poll_wait(file, &ssif_bmc->wait_queue, wait);
>> +
>> +       /*
>> +        * The request message is now available so userspace application can
>> +        * get the request
>> +        */
>> +       if (ssif_bmc->request_available)
>> +               mask |= POLLIN;
>> +
>> +       mutex_unlock(&ssif_bmc->file_mutex);
>> +       return mask;
>> +}
>> +
>> +/*
>> + * System calls to device interface for user apps
>> + */
>> +static const struct file_operations ssif_bmc_fops = {
>> +       .owner          = THIS_MODULE,
>> +       .read           = ssif_bmc_read,
>> +       .write          = ssif_bmc_write,
>> +       .poll           = ssif_bmc_poll,
>> +       .unlocked_ioctl = ssif_bmc_ioctl,
>> +};
>> +
>> +/* Called with ssif_bmc->lock held. */
>> +static int handle_request(struct ssif_bmc_ctx *ssif_bmc)
> 
> Could return void.
> 
Will do in next version

>> +{
>> +       if (ssif_bmc->set_ssif_bmc_status)
>> +               ssif_bmc->set_ssif_bmc_status(ssif_bmc, SSIF_BMC_BUSY);
>> +
>> +       /* Request message is available to process */
>> +       ssif_bmc->request_available = true;
>> +       /*
>> +        * This is the new READ request.
>> +        * Clear the response buffer of the previous transaction
>> +        */
>> +       memset(&ssif_bmc->response, 0, sizeof(struct ssif_msg));
>> +       wake_up_all(&ssif_bmc->wait_queue);
>> +       return 0;
>> +}
>> +
>> +/* Called with ssif_bmc->lock held. */
>> +static int complete_response(struct ssif_bmc_ctx *ssif_bmc)
> 
> Could return void.
>
Will do in next version

>> +{
>> +       /* Invalidate response in buffer to denote it having been sent. */
>> +       ssif_bmc->response.len = 0;
>> +       ssif_bmc->response_in_progress = false;
>> +       ssif_bmc->nbytes_processed = 0;
>> +       ssif_bmc->remain_len = 0;
>> +       memset(&ssif_bmc->response_buf, 0, MAX_PAYLOAD_PER_TRANSACTION);
>> +       wake_up_all(&ssif_bmc->wait_queue);
>> +       return 0;
>> +}
>> +
>> +static void set_multipart_response_buffer(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
>> +{
> 
>> +       default:
>> +               /* Do not expect to go to this case */
>> +               pr_err("Error: Unexpected SMBus command received 0x%x\n", ssif_bmc->smbus_cmd);
> 
> Use dev_err if you can, so the message is associated with the device.
> 

Will try to use dev_err() in next version

>> +               break;
>> +       }
>> +
>> +       ssif_bmc->nbytes_processed += response_len;
>> +}
>> +

