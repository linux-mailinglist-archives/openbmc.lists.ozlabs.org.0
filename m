Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7C54416C0
	for <lists+openbmc@lfdr.de>; Mon,  1 Nov 2021 10:26:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HjSN06784z2yPg
	for <lists+openbmc@lfdr.de>; Mon,  1 Nov 2021 20:26:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=rJPb73Qe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8a::71a;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=rJPb73Qe; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::71a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HjSMS0VRsz2xXx;
 Mon,  1 Nov 2021 20:26:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HgWsNAjN3M18rIr6hNy//nNNwwKE76lM9J9u9zm73jt+2uiH2+bB7Z4HoJEBV6FsKHp50J4wE53wc4KwsBcifX3vRXQ/STMVA6Nj8MGX+3Mv5tlEiIeHfMa6ujTF2rmQ8Vw1/k8IF0Od2u86lyHTkANsJ8DoX9CWmIYwh+NXiMOnBOKJ5pT5IMz0CFJNovHiu3wCZbFS4knzwwq16+8QhA7DkayM+TY29xIrk0ZRVxhMvU6LPjrOEBBB7zphOJlUx64vbi/CvuiCD+0QeccsRzfmDe3eqCfiwrZQseAc0Tn7krHDHh8Fvwoj4rQvrti3hHD26SiubPcu86SIFJPDKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqblyUT8jhsW9iaKrC6xq886j8rTGsq2fEix2t8Shko=;
 b=g84uAGPb3m0WcvF+0NEET44K3WmUC/bTKolzUJktgU4AodY+9XYObMXySwoPb39JBERvr+AUfIAI4fnbYIsKI26s49cCbYRb2DxnPepZGRch3FrO2DdzfFK/tqW2883Y6IlGBud4gdQRC6FwOwR7M5t4Xe5MmkTG1/T5OBtQM+PzXJitUFXdlucjErWnK5pX2aQxqzQ6LpZvgZ/hXMfFWcvXAhu5US6UhF4L8YXgMeXFVFl/ib4RgUyYb1s0rnTefHuLP+VKvwg48fes9G/CiaRRI3WoSXTIXccXmWhExsCnvYAwghuOLC+6HSU3XKWimNw1gEnarW+Mp/0MoTu3aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqblyUT8jhsW9iaKrC6xq886j8rTGsq2fEix2t8Shko=;
 b=rJPb73QeNPDpSMFcGiQU1Y+eBmlcipP4zQv5YisXXYv4ftWvsy7RpWGJp42vTz5F2fK0xnNM38vmqiRYcCa8WyCaZGrnogdIXalbpEIdlb2ksExE+aT63iwf7j0JN4jxVcskMgSrgdhltTjP93EapPmWlY+HYaztkFTNpDw3Dz8=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none; os.amperecomputing.com;
 dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 SJ0PR01MB7415.prod.exchangelabs.com (2603:10b6:a03:3e0::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15; Mon, 1 Nov 2021 09:25:47 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::c880:9ded:28e8:345a]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::c880:9ded:28e8:345a%7]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 09:25:47 +0000
Subject: Re: [PATCH v2 1/3] ARM: dts: aspeed: mtjade: Add some gpios
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>
References: <20211019060155.945-1-quan@os.amperecomputing.com>
 <20211019060155.945-2-quan@os.amperecomputing.com>
 <CACPK8Xcp0ruL-7p3AA+yvba3Drrwm-=-hMnMpd=a1aHwQHnE1A@mail.gmail.com>
 <87d82a93-cdc2-d95a-4ab9-085ff31c4387@os.amperecomputing.com>
Message-ID: <4eb31178-cf05-24cd-6a75-6628689cef25@os.amperecomputing.com>
Date: Mon, 1 Nov 2021 16:25:38 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <87d82a93-cdc2-d95a-4ab9-085ff31c4387@os.amperecomputing.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HK2PR03CA0043.apcprd03.prod.outlook.com
 (2603:1096:202:17::13) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
Received: from [192.168.10.85] (115.77.54.81) by
 HK2PR03CA0043.apcprd03.prod.outlook.com (2603:1096:202:17::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.6 via Frontend Transport; Mon, 1 Nov 2021 09:25:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d24f3781-ee90-4fb2-e45b-08d99d199676
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7415:
X-Microsoft-Antispam-PRVS: <SJ0PR01MB74153541233ADBB6F5406E75F28A9@SJ0PR01MB7415.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L98JFjZHFk6qCMmHoLHsZrULjNvgEsLtATnPMNB1W5t3Vp8qJU/k8uqd0EPJUksApleaYoduutNMWiCv570+RPxkgzg3u+MN9o59IxMo9Or58kRPgFm1EouE6VwzND+gwG+4DY+4qXh67DoCQBB9L68fKd0yKNO64xw4gX76FaS7GjrBU5CLJkmlD4/6G4IgSFFh/ECkuZd0yslOtbfoLGkKcNvv2MqIUDVoSV162DB30M1RGVKRJyQiw0ryBO75zUMKDg+rEkkX9P8y9arfzlO/8lpsi/t6Zb5/O0QyvnE7bt5Pj4rYcX3GYL1fn+J4MIMyueZtPShWX4aKDYMJn+Em+VvVw8SHUiKiSWjILJXpyp9S+PKLMfxts7w9e0vsfdtXBFgRu+6pZfkaXS8eWexfL9wPTgaoyM6E3ckyfaqhdQXwYLw7mDVHQ7SFwlGhQP88QDqqDNS49D1sQH99A0al3wEWf72dhQO7iBggRUoa9Zih1A4dMA908Ci5uMSf2tS5n5bsXdFD5gKExKm8MfQdwsk8VvEMb3fLZgeoNhi4Z+itiSIH5yUWPgzabZ4cV1HIa2ECzgjkYUHAOxToolZGbylhQdK70pFWsIIjbr/kmWdo5xA1ZIp+P13Vf/cwYun3cgOyBsBMjbyLrAuOte5Q8amaGh7Q5iV4xAX613OBeld5//e9w2NMso3KnlQ4dR/tblnwYE8nmttlMd1NRG6mjAdhYvzkPC3J6lYmwn5/VqMHHnOivfF896e1YlMtL8V1xV7/lcd/MYVu48U/8fZ4LTlTfLBBTh68nXiF4Xhfw+OyfmFcOGHI9V3YdpFwAiPQ93CFh1iuQmAKCj1gyJ0z019GSD3xwy7A+bR0VkG+0NE6PA9/SagQztbLHmGP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(53546011)(966005)(508600001)(31696002)(2616005)(956004)(107886003)(86362001)(31686004)(52116002)(66946007)(4326008)(38100700002)(316002)(16576012)(38350700002)(83380400001)(6916009)(8936002)(66476007)(2906002)(8676002)(54906003)(5660300002)(186003)(66556008)(6486002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3M0OEJlT1pMMUZkdDFkQStSdU5OVU0rTEpyWk14RjdwZ29KMjFmYTRiVW5N?=
 =?utf-8?B?b1BRUStKdDMrYWdEdENjSTF2V0tZNjhTeHBydUlUR2pwRE51Q1c3ZEJhWk4y?=
 =?utf-8?B?MXduNWY1ZkVPeVpSZHRmY0NuRWQrd2dSZ09GdnZvZ1JlN2c2NUJaL1B2Tnox?=
 =?utf-8?B?RExicWU5VDhxK2hKejBrakRmODIxRTlCdnF5OFNsNFIwR3BKVjhjN2xMMUla?=
 =?utf-8?B?OXJjcFEydlNPeklhbVVzeG1qaGMvNXY0OUpoQVVrc1VVbTNTYjUySm5LMnNR?=
 =?utf-8?B?ZTU4RUZpRmVIRXg3UnA5bE9SME1qa2tzWHpPZDRTTnlFSFdsd3pxdDl6Wmdt?=
 =?utf-8?B?b1Ivam1aUXhra1pQLzZsV3QrYkJtUlEzbHJXRjNkckxaWkVQMy9vQnc0enl0?=
 =?utf-8?B?OVFQZDdIOHJKTTY0d25LOWRYRjQ0MmdnQkE0UTRqM0ppckVJbnBBLzJkUzFw?=
 =?utf-8?B?cy9ZdHI3c01aT003V2xldWlpbm1CUXluZG5wck9xQWJDT1B2MXgyMktyVnlh?=
 =?utf-8?B?NU1pQTVJenJaZjM1WldFZUZaeks5NEZyVTM2MHV3Zk9GSTgxYnVIdUd1elJY?=
 =?utf-8?B?T3Y3SjJsWGplampuZ3FlTkxHWVpockt5ZHpZeEtKMVdJUnhrNWdWREJqdTNa?=
 =?utf-8?B?M05QM0pWM2VmZ1VySWFLQllqNTNmOUo5TkVIVEZHOG5qUDhrL0toR1dQQmU5?=
 =?utf-8?B?cjRRN0xsRVJlRXBNYzVvKzJ2dUg4UnN4YmRDNnorZTI4TkNzQkRCTklpRjN4?=
 =?utf-8?B?dm9SZFM4RWIvSVYydXpGcmM1dFRCQ0p5ZU9yM3RHamU4RVlkMHF2QTQxZUV0?=
 =?utf-8?B?UjJHNyswR2dMci9QVnFYKzNtSnhmRkpmbmNkWTluYzNPRFN3d2pmQnh3ZnZG?=
 =?utf-8?B?YUNJV3JPMWsyTDAvMERvQ2JoOVN5RnNjK3JONkdFVncrZTdDckxCU0hxNlJZ?=
 =?utf-8?B?Y3VGN2Z0SVdLNGcySnVDbXdPRE1mR1V0ZmxHOW1DVXkxREVSWHdWN1JxT2s4?=
 =?utf-8?B?MnByWVREVGMzbENCQ1lWWjJWU0lyVjJQa2tHNnJOSFF1elc0TUlNUXlOM1Z3?=
 =?utf-8?B?aDJZV0I5eWJXZ2FSVkJWc0tDbHUyT1Bmdk9PeDFHYTZ3YWErbnp4VE9ydWhn?=
 =?utf-8?B?TC9yQWhqZ2l5dzY4Qzlqem1SbXlEWC95aGVmK3V1eDY5SGN1ZjdleThLOFp3?=
 =?utf-8?B?M0RyeFUvTldqTlpZWWtRLzBDL1F2VVkzSnBkUVd0WjI3WkJhSEtuUUNZUUxC?=
 =?utf-8?B?RHJVTldVV3NWQmRxQzQrZnNXM2Z3ZFBrcUwrVDBvUmNaUFNMbThqZC9PTE9S?=
 =?utf-8?B?bnlIcVl2eDZVZW9xNTQ3V1crS3VnVkFDL29zcFQyYVpGSnM2WmJ2czQxaC9m?=
 =?utf-8?B?M1VYVEt5dnFrL1ZPOTFDS0FybzBmNU85MUdrWUFrUVFLV1duMGsyd2tKdkhC?=
 =?utf-8?B?blowc3hpZitUUGpUeDV5R3F2Q1lPc3hSNjJrcFd6K1h5SFhZOGV3T0ZxbzZl?=
 =?utf-8?B?S2Z6d0RWUDl1amExVFNvWU5GY05QT0pIeGxpK01mTTdJTmtVZmVrTlhqazJM?=
 =?utf-8?B?U3lCcVpaZTEwZGNjU1FpTHpiYkJoU3lqTEVJRENwSW1JV1VvZ09IL2pKT0tv?=
 =?utf-8?B?WXQ4UGNQUVdZOE9aa0U3M0xGMzc3Ni9GTkJvcWhkYWU4QnJCbEVBT1VsVi81?=
 =?utf-8?B?YUFLSllRRDFpQVUzNWZ1TlR6QmYrQWpGL3Z4R2JuOEJqRFRyLy9KaFFXenND?=
 =?utf-8?B?WkRpSEZkZFpGQTl5R2wzdDB3a0ZBVlVVc3dlUmVVZFU1ekc3T2dwTHJ0UHRW?=
 =?utf-8?B?M3BkMGdyNGk4TERLd0gvTWVOcXh1SkQyZGlocmNsYSs2WTBLeFpTdGRGbjhI?=
 =?utf-8?B?bGo2RzhBR1hqdE9uYi9rNTJTa3hua1lHTE5rRWpOWkpYb21sZFZiemRObCtl?=
 =?utf-8?B?emQzWU5XL2ZEYWkwbHVyVEZZZnNZaGFZTkhQRHp1OXI1UTIyMHVQRHc4L01O?=
 =?utf-8?B?d3FOVzV4V0RIZUJHb3lRY1pieVA3d3BEMWVjenJvNTJ3eDh4S2Z2eEZLcEhH?=
 =?utf-8?B?YW43SlNGTnFzN29IRnowbUprRmhmOUNaeFpWSEdqVDVyVTFXaHlVRC81YWFi?=
 =?utf-8?B?TkJRZUFCSlJPallmaytkTHJVdDVNcVZwMG1VaU9xd2RrT2t1RWpvSG5rY2h0?=
 =?utf-8?B?dG1wZzA3a0RuQ2pJL2ZyczhJL3NZVEE4ZU1YUnVYaXRnY0M2N2JVcTgrdEc0?=
 =?utf-8?B?MGdraUh4RFVmS2RtWmhPVFNFWExBPT0=?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d24f3781-ee90-4fb2-e45b-08d99d199676
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 09:25:47.6331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iACUcMsSKxYPDsqAgovTNy5ehWPlI0kf1NXgHXL3W7uB6wQOSM1wDb2EUPddbK2Wkza6+lHK+ycTCMGNtiihh3C/q1x1dsG6sc2LWEY395k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB7415
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>,
 Open Source Submission <patches@amperecomputing.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Joel,

I found this patch appears in linux-next tree as in [1], can we expect 
the remain two patches in this patchset ([2] and [3]) will be merged soon?

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20211029&id=0b32c1b4071c482f2cf98b717cfc7380423ec619

[2] https://www.spinics.net/lists/kernel/msg4115571.html
[3] https://www.spinics.net/lists/kernel/msg4115572.html

Thanks,
- Quan

On 25/10/2021 11:44, Quan Nguyen wrote:
> On 19/10/2021 13:46, Joel Stanley wrote:
>> On Tue, 19 Oct 2021 at 06:02, Quan Nguyen 
>> <quan@os.amperecomputing.com> wrote:
>>>
>>> Add S0_SCP_AUTH_FAIL, S1_SCP_AUTH_FAIL gpios to indicates firmware
>>> authentication fail on each socket.
>>
>> These use the gpio-keys API to expose the GPIOs. I think OpenBMC is
>> moving away from this abstraction, and instead reading the GPIOs with
>> the gpio chardev interface.
>>
> Thanks Joel for the review,
> Yes, will switch to use gpio chardev interface and will remove these 
> gpio-keys defined in next version
> 
>>>
>>> Add gpio RTC_BAT_SEN_EN to enable RTC battery adc sensor.
>>>
>>> Add BMC_I2C4_O_EN gpio to go high at boot to enable access to I2C4 bus.
>>
>> OpenBMC has started a process to document GPIOs that are exposed to
>> userspace, initially so a common userspace can be used across
>> machines. I like doing it for the additional reason that it provides
>> consistency in the naming.
>>
>> https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md 
>>
>>
>> If you could take a look at that document and add your GPIOs where
>> possible, and then update the device tree.
>>
> 
> There is on-going discussion about naming of the RTC voltage sensing 
> enable gpio pin in [1], So I'd like to address this change later in 
> separate patch when this is settled. Hence, I will remove this changes 
> in next version.
> 
> [1] https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/48018
> 
> About the BMC_I2C4_O_EN, this is needed as gpio-hog to make the i2c bus 
> accessible at boot time so I will keep this in next version.
> In fact, I'm still a bit of confuse if this pin needs a common name as 
> it is just to enable the bus access and does not serve for any 
> particular common purpose.
> 
> Thanks,
> - Quan
> 
>>>
>>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>>> Signed-off-by: Thang Nguyen <thang@os.amperecomputing.com>
>>> ---
>>> v2:
>>>    - None
>>>
>>>   .../arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 21 ++++++++++++++++++-
>>>   1 file changed, 20 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts 
>>> b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
>>> index 57b0c45a2298..3515d55bd312 100644
>>> --- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
>>> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
>>> @@ -86,6 +86,18 @@ S0_cpu_fault {
>>>                          linux,code = <ASPEED_GPIO(J, 1)>;
>>>                  };
>>>
>>> +               S0_scp_auth_fail {
>>> +                       label = "S0_SCP_AUTH_FAIL";
>>> +                       gpios = <&gpio ASPEED_GPIO(J, 2) 
>>> GPIO_ACTIVE_LOW>;
>>> +                       linux,code = <ASPEED_GPIO(J, 2)>;
>>> +               };
>>> +
>>> +               S1_scp_auth_fail {
>>> +                       label = "S1_SCP_AUTH_FAIL";
>>> +                       gpios = <&gpio ASPEED_GPIO(Z, 5) 
>>> GPIO_ACTIVE_LOW>;
>>> +                       linux,code = <ASPEED_GPIO(Z, 5)>;
>>> +               };
>>> +
>>>                  S1_overtemp {
>>>                          label = "S1_OVERTEMP";
>>>                          gpios = <&gpio ASPEED_GPIO(Z, 6) 
>>> GPIO_ACTIVE_LOW>;
>>> @@ -590,7 +602,7 @@ &gpio {
>>>          /*Q0-Q7*/       "","","","","","UID_BUTTON","","",
>>>          /*R0-R7*/       "","","BMC_EXT_HIGHTEMP_L","OCP_AUX_PWREN",
>>>                          "OCP_MAIN_PWREN","RESET_BUTTON","","",
>>> -       /*S0-S7*/       "","","","","","","","",
>>> +       /*S0-S7*/       "","","","","RTC_BAT_SEN_EN","","","",
>>
>> I suggest you create a proposal to call this one
>> battery-voltage-read-enable. I know that some of the IBM machines
>> intend to have this same GPIO.
>>
>>>          /*T0-T7*/       "","","","","","","","",
>>>          /*U0-U7*/       "","","","","","","","",
>>>          /*V0-V7*/       "","","","","","","","",
>>> @@ -604,4 +616,11 @@ &gpio {
>>>                          "S1_BMC_DDR_ADR","","","","",
>>>          /*AC0-AC7*/     
>>> "SYS_PWR_GD","","","","","BMC_READY","SLAVE_PRESENT_L",
>>>                          "BMC_OCP_PG";
>>> +
>>> +       i2c4_o_en {
>>> +               gpio-hog;
>>> +               gpios = <ASPEED_GPIO(Y, 2) GPIO_ACTIVE_HIGH>;
>>> +               output-high;
>>> +               line-name = "BMC_I2C4_O_EN";
>>> +       };
>>>   };
>>> -- 
>>> 2.28.0
>>>
> 

