Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0945F80C052
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 05:11:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=IXUfMHtd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpSx03cpZz3vd3
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 15:11:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=IXUfMHtd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::710; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20710.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::710])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpStX1qbpz3vXV;
	Mon, 11 Dec 2023 15:09:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WBk7W54NY5E9FpzBAesD3ShCIFLB/fcH3JyIsrpWjmpcpDXChG0JuXbTb7NG2o/juH1A+o1I7eBn/vGWgzHJyakSRjfMLCx6HCNb+/jnaO4OdUXUasE3/B4jojHb/GxnUHFy8S6nU0H5UZ/prR6y4eHrBLB7heaOGPbNGvxiO90rrE9FHt+ZCNVYfKkSk3HhbG6eQrbu0n+6o6iQzve150lBrJ3KdxBvi6yBcCBUbog+4478Ag6sgAFD47d7sjvEgbibOczz1xdueXvUAR4hPvpSAObD/ycuzWnOYI+EdOTFTCJZUjlqTe+Xt2QUKxHM9PyP8I8DdQnewlP9gIMuBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZVfc1QyzEO1ea+sRkqj2VMYPnkp1996ptwV7PaGraA=;
 b=ViR2q/7QQOUqGzm4vF3LvI3i5RT0BSlNUEITpoUeZaTU1CVeohwV7ifC2laNqoBApzW31H3cuLxworQnDvea6J8OagOUJE1m7LpeJNVhj3PppUeS1T9o3Ts/AZ8WaHGjshbLEqMLl5RZOI8AP4omQ8WLF4bTUO7mq27gMh35fLHo09S+hocQRmrDmuVbupnCNbxR5dG3hjcBOH4fETLZqyic3jdXJN0nbhJnWrZtINvh+Up0ogoswKSWhIpsHw1sYMqJps9ktfoMZ2oa2Dd0+5j7zd3O4KrUidBScyq/JU4MpL03C0UvgugAx5zKdEVXwe/QRsrMfCBAPFMriTJQ3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZVfc1QyzEO1ea+sRkqj2VMYPnkp1996ptwV7PaGraA=;
 b=IXUfMHtdmyllJEGDOauwhAfrw/va8ETwkug91rSVR3ESgpJp70JMiBvFTidozw85cl6jNku/6TO/8N0lGQriyJR71oS07JwetBQ4jg9nn13abasVSCIRorcMiYxgZox3KFpG491/uP8fp/XCnb/7Z5KyLWuy0RLySFp1W/VQ5d4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 PH7PR01MB7821.prod.exchangelabs.com (2603:10b6:510:1d9::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 04:09:14 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68%3]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 04:09:14 +0000
Message-ID: <ffcacd0f-85a3-4c9f-9d0d-50425fec4775@os.amperecomputing.com>
Date: Mon, 11 Dec 2023 11:09:08 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] i2c: aspeed: Handle the coalesced stop conditions
 with the start conditions.
Content-Language: en-CA
To: Andi Shyti <andi.shyti@kernel.org>
References: <20231208033142.1673232-1-quan@os.amperecomputing.com>
 <20231208033142.1673232-2-quan@os.amperecomputing.com>
 <20231209202810.r7kkz2hlaonyibha@zenone.zhora.eu>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <20231209202810.r7kkz2hlaonyibha@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0307.namprd03.prod.outlook.com
 (2603:10b6:610:118::8) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|PH7PR01MB7821:EE_
X-MS-Office365-Filtering-Correlation-Id: 278a8f74-20d0-4787-fd98-08dbf9feeff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	4F6qwG1wc4wLjxb062CQwY0rQys0tycQmRfTJQb+RFeEsXrNZ4HXgaZ03Kyj67LvgzqcXXOdSc5TDfh5tza5VdOTgtSeCPOxHhCzjEDpf2c6osf+indgoNR8Y2SZ9s8rumzeWKdg2BGumyZch4yTi4yfQHc4szs6ehaVZzhwVqm//hEYRccjaljMOj6/4Mv5mOV6KLGY27v8UCZGfRrWvSjrSl1A9EBXGblXIdr6zjvwvJNepnZt9TGXNKb/EZhDOQu+9SB7dGfxuMTs7yGrhzh+Dlo5udPq3gtSLUaWGdcMUqhP9v6q8oz9Lwj2DcOR97ZKYzqlFlOXFSNkUUMEcnjtuHW4McQE7l1sZw/JnqYX5wyI6D16e33/un78GdvM9O7Ey1uRizbPX6RjnuXyg8ObGVK4vm3LdCLVXK542TqV5pQorcqaFmyTJbmLTH38UHpEAQB4IQyr6S2k6NjzKzLfyIuCCRK3xyHsroiVbikNC1z0BelYw4mZFqzcbJDU6KlZ479M+SHUM88tzY3nSjqTzTop1ihhXExAxRHtQv44dRrZ0E+3h+OFiUxzdbjj3X+ngT1/Gd6g0KOIPE8xnNI661IQPCiH3mSTfXp7/huOe5CTxFEJlbz1/l9wBefd
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(376002)(39850400004)(346002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(6512007)(6506007)(53546011)(5660300002)(26005)(2616005)(107886003)(4744005)(7416002)(6916009)(54906003)(66476007)(66556008)(66946007)(6486002)(2906002)(31686004)(41300700001)(478600001)(86362001)(8676002)(8936002)(4326008)(31696002)(316002)(38100700002)(6666004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?T1paRmlnaEJibVFIWEx1OFJSUkNTL3F6NGZrWG8xRWRVSlh2c3dHQjlMUE85?=
 =?utf-8?B?OGNRU0FFNlNLdWROUlJJY3NzVk9RTnozMzRUOTZ0d0Q0MG81eENTMm41ZjZJ?=
 =?utf-8?B?ZHQ4OVdKL2tPN3BBeUNRYWpHNGM3eUtGUkQ4dk1xYVB3UGhYSFIxbXFRTE5p?=
 =?utf-8?B?WjJNd0tiSnVWd0RkdWh1c3NoaVBPSnZ2TkdZeUdnUTJvMGNnS1NjZzlhMkVS?=
 =?utf-8?B?dUNJcDhPNlJ5ZW82VmZBK1h0T3VxSWdJa1VKdE4zRG5hTHJERXBsTVluV2VR?=
 =?utf-8?B?R2lMMG5KZjNNNUNwaC9uMHRjaHdWekpzUTkyVUp6ZEY3ajVQM2V3RDhPdVpq?=
 =?utf-8?B?aWZxd1NEM0FDRGZqS2h2S1pxOWZvL2FoSnJYbDJOOFB5c2poUTRDamFaalVt?=
 =?utf-8?B?aHFlKzlna256dGcyQ2ZvamM1ZU1jOHVkOFB2M2RlTWQra3U1UnppMkZWaGZv?=
 =?utf-8?B?RkRSeGYvTWJxM2FoK0tYcUgrNjFoWFA0V3F5TXo4eFNKMWR6VWpyb1RLamVR?=
 =?utf-8?B?Tk5zbGVENThuOXBQeEk4UyswS1Q4eHZCdUFiaWNueGV1WHdoZUlEQUNVaWxR?=
 =?utf-8?B?M3pka2hXR2hTM2l6Q3pSbjE2Ky9lSUMzUUtSWStxQ1VNaVdoQ0pEaUpNYnBV?=
 =?utf-8?B?MzB2dFRMQm42OGJMZmVaZEExYjNuQzczUkIyclN3UEx2MWwvMWNIV212QjlL?=
 =?utf-8?B?bEhCMnJYbEtkalRYV3E0VnNIc20vVDFEcEZOdmtDLzFJMDd1T043V2hlTUo4?=
 =?utf-8?B?WERWRDRXY1VEVHFSRWxQYnRFSHFVN0VoZER2UStYOW9TY3JUNlNnaFd4dVp2?=
 =?utf-8?B?MytLclFmTU5RZTN6eHRNZVUxZDk1a3J1SlRJMnVaYkJSanE5dy9UcFpZcW5K?=
 =?utf-8?B?c2V6amhVYm9HMmdmNHIyZ0NtUUpwT0hyT1Y4VmwwTU9LTXhNS1V3Y21uRDl5?=
 =?utf-8?B?cEF4NmlHenFJRDZtZVNYYTAwNXY5dVNKUWtpNEtzRXl0WWt5ZC9udXNNY041?=
 =?utf-8?B?d1FGVSttd0hBQnE5OW1ZUlJxeS9keldXdWcyWlRNQWxrYWVXV2c0OXZZaUZZ?=
 =?utf-8?B?d0gxdEN4QUdqR1d1ZDcrU2drOGgyQ0s5cU5iK2orT2Zvd0F3Z2pObk0yREM4?=
 =?utf-8?B?a25GMlpuRVo0SFFidWwvT2tPcHp1Tm5WbW5rY1pKQW9VRlVVdllBbE1VRjN3?=
 =?utf-8?B?dnVDTjEyTnlETEtvSyszSk5VTjJsMVZJME1taUgzNTlvYkFTMWpYTXA3cDd5?=
 =?utf-8?B?L0g5eXljbHZNajdUdWxIa1ZnNko4UWphQnhzVVBEelovd2tDZ2N6ei9obEp3?=
 =?utf-8?B?UkxVU0thVkdxK1hXN2FDakt3UVpSdDE3emptQUJjV1RmblBjY3pvbmNyejlp?=
 =?utf-8?B?WUFGRHNkSDF5RmM2YjJ4YUhVY1NPZVdFUlVUT2U5djdscys3SUhQT200R0dG?=
 =?utf-8?B?WFF2b045eTZvMmR5anl5azByVjdseUxsOVhmaW0rRmlESUtzYzVKYW5oN1c5?=
 =?utf-8?B?M3M1N2xHVmVQd2hhODNFLytOQk9aYlF4dUlEeVFOVTltN1d6bzQ0MzFkY1dW?=
 =?utf-8?B?dFZhNmJMcU9GRmdhQStsWS9GeUJvbGYyVEl3blZDa0RsR2N5aTIyMWJ1Smhm?=
 =?utf-8?B?azhINzVSMlovZFBxQnVyMmNnUVZCTWQ3M1FBSGNJcmovRUo4RHI5UHY4MEdS?=
 =?utf-8?B?b1pvR0VyYU00NHRKcVZQNnVMZE8vN0c1NWdEdG5ZbHRBeW54NURSTEV0UFFw?=
 =?utf-8?B?M09PS2I5OGdWVnNoTkkrUHo2WU1hblNhRFdCYysvMk0yZ01tODdLSXZaREoz?=
 =?utf-8?B?d0R5emw4T3dBUW1lQXlobmpxcWNsTWNzcklUbnZpTEFYWmgxYXFOTjBhVlFo?=
 =?utf-8?B?VGxQTVBCTzBIWVZWSVVyZkY0OTVDUTl5dGJibXQwZ1VzWW1sbndCN25YMktU?=
 =?utf-8?B?eFY5K1dNMWFpVUdzM3M0NndiM0szTFBUaFpMeHgxYmpIaTVpQktzNjJnbkx4?=
 =?utf-8?B?dW5VdkNJdnZscW1DRzdidCtGZ0x2MnJhdGt2dXJ3aHNzd1paa3M5M0R1UXMw?=
 =?utf-8?B?d2ZIb3pzUG1xRzJPNWx5ZDZHbEliTFlEVWlJQitaU1pmVmpGR2t3c1ZGNmVk?=
 =?utf-8?B?b2xBWjlOMDZFbDQrRVY4T1g2UlV2d2ZaWXArRGV6QUN0aDd6R1pjNTNSOHVG?=
 =?utf-8?Q?mInS04JkJaXZfDfouRhzBV4=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 278a8f74-20d0-4787-fd98-08dbf9feeff1
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 04:09:14.7235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AnFPXQs/zQ3AshaZUiQBiLfjTRDXYzs7ab866CNoy+eOJFvVzJ0B9zoNLWdUDtNsB/W3CR0QJNl1X3mlrLpxqChdu43HdDzDXoaJ1oGaOb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR01MB7821
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
Cc: linux-arm-kernel@lists.infradead.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, Joel Stanley <joel@jms.id.au>, Cosmo Chou <chou.cosmo@gmail.com>, Open Source Submission <patches@amperecomputing.com>, Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 10/12/2023 03:28, Andi Shyti wrote:
> Hi Quan,
> 
> On Fri, Dec 08, 2023 at 10:31:41AM +0700, Quan Nguyen wrote:
>> Some masters may drive the transfers with low enough latency between
>> the nak/stop phase of the current command and the start/address phase
>> of the following command that the interrupts are coalesced by the
>> time we process them.
>> Handle the stop conditions before processing SLAVE_MATCH to fix the
>> complaints that sometimes occur below.
>>
>> "aspeed-i2c-bus 1e78a040.i2c-bus: irq handled != irq. Expected
>> 0x00000086, but was 0x00000084"
>>
>> Fixes: f9eb91350bb2 ("i2c: aspeed: added slave support for Aspeed I2C driver")
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> 
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> 

Thanks Andi,
I'll add your Reviewed-by in v4

Thanks,
- Quan
