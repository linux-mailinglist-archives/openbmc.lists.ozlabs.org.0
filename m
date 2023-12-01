Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFC88003E5
	for <lists+openbmc@lfdr.de>; Fri,  1 Dec 2023 07:32:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=h8hcUshI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShNXG21L5z3cgN
	for <lists+openbmc@lfdr.de>; Fri,  1 Dec 2023 17:32:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=h8hcUshI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e88::707; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20707.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::707])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShNWf0QH1z2xYY
	for <openbmc@lists.ozlabs.org>; Fri,  1 Dec 2023 17:31:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUIyWkpYNUlRiobWvKfBKrW+Mt3G4wOXJTIoKLJWryTZY0SS54+b15pr7styc7a7oDDjO1Kb/pSPBSMxEX75+cdc6BW1QxpWbRulNh2zo4EjKXJLfVCS3C+aombkryuQR5c29ntRVeb8bm/fQKmCWuescNonUpHb3u8/8nhBMbMwo1UdbTtTuLkoPUtE/aj1szgcfoujzT+KYUYwbYR9QDe7FItWdxUpZwJm/jfYFigBGP3vJayfrRANkV5igX2mabUp9v6jfuUhQWCgnIkF3QdCZiC8B0mxA4uVBSVfoXjy50WbohJDcHXCnHLsvemZUSgWR980Sfr/mtforhIICQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVSn6+mEouHdoIlcKyZKXR30CEfKA/WIL9COV5b69E8=;
 b=Kze9UdpELBPcFK5TOSV6Xjkg+Z0ZwnSSvFbV4/yr7EjJwq+hrPDEh4zuSjRfc4AhgQvVpdvzJmD3+RpCI0/Oagy6SBz9OVYXm9pQtys+ZXx5XriEF6lvgezeUuSiiNWi4HqiHLLHiX6lULJ0WzYwSqVN6ZG6zHrjPWfi53u/eVP+x+vBxoLB80GeTLb92uRtLhXhu+jjLkMwbS+tuow6OfwkKIgQV9t3vzY0bstcxDPKu0CIp3hZBKVoakK/UmcqXmX2JNQzpYbsCAeGn1flFpsB4f5oGDCwhl+9CUbit93LINP9q0Ho9M26dtmNxPTLZMhw4w92l7LufWyU23//Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVSn6+mEouHdoIlcKyZKXR30CEfKA/WIL9COV5b69E8=;
 b=h8hcUshIuZ0VLtVf8ZTfQ4qjL8VFaLqBtlGSHKrJ73+e+qeYhx7FvzOCrau+agmN1iRwgq13H6ZclV3dPp/z/3qPIBXOQsjFTcv4AulDSD4QPvvjL4c1r5PXwwnssCI+8aH52JdPCMs8sh6etij/k23DkFLSmUb0ZCV43uYpayo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 SA1PR01MB8159.prod.exchangelabs.com (2603:10b6:806:333::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.24; Fri, 1 Dec 2023 06:31:33 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68%3]) with mapi id 15.20.7025.022; Fri, 1 Dec 2023
 06:31:33 +0000
Message-ID: <3e8b18e6-673c-4ee6-a56b-08641c605efc@os.amperecomputing.com>
Date: Fri, 1 Dec 2023 13:31:22 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mctp i2c: Requeue the packet when arbitration is lost
Content-Language: en-CA
To: Jeremy Kerr <jk@codeconstruct.com.au>,
 Matt Johnston <matt@codeconstruct.com.au>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Open Source Submission <patches@amperecomputing.com>
References: <20231130075247.3078931-1-quan@os.amperecomputing.com>
 <473048522551f1cae5273eb4cd31b732d6e33e53.camel@codeconstruct.com.au>
 <706506b7-a89c-4dfc-b233-be7822eb056e@os.amperecomputing.com>
 <852eaa7b5040124049e51ceba2d13a5799cb6748.camel@codeconstruct.com.au>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <852eaa7b5040124049e51ceba2d13a5799cb6748.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|SA1PR01MB8159:EE_
X-MS-Office365-Filtering-Correlation-Id: fb98e83b-e607-45ff-a5b8-08dbf2372936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	1AvpgAbzSoxeuGHotuGzot1duUfKD4B2xYAcg3i486vbFsdenQW3Xcb9+R6WzZrQ8X07ntcNy5OGd7d6n3stcgwZEZFcTvOpEbnwNPtIPs8rJDo5K0eF8qr2C7vknmyzDEfkDkJKmsNBSZPEmZ8j3fo2LF5bCzWbD18yl7UJsuWqquOgYXA+l5+/F6VQ7QaGGd/d8sv0t04VoJ6ZjYRAkCnzlWf1J+N+spYTfBZpHlaMVnCgrS8tjE6NMFL+BYQfEKvmzvy972DepY2CtdcXB5aXj7Pv0i+HRT94t83EWepE0gIdf8AK2p7GOFlLeNa3d3eSeACoOvK3CdSC4zHueK4EaSlxIdsS4UrG0zGejyqZGcRzUpmW1lX7r26Q9GsHhOWv4B051IKzDALR07Uk0Xnnt6VrRytYz7vW8Ij0KerwLUzO8s3+MBD/sD5GxRfijYpQZ+OBDsccVTzX1jPgXnE3zkrARRix9pJPo+QGM2eUV1e5UvVrmwszgXGFTzIbbowN+WDAENpIQfJYzARulQPhIoatkgIA5UVIWKpwtXjtDGO9CWCyFYIVzGJmdh3WHh4W175Al6U+sRCXM1GLL4p1GqtDGp0ZbrztrjgjuLiy7xzt7WdUdQViUvM7AN93
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(346002)(366004)(376002)(396003)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(6506007)(66556008)(31696002)(66946007)(54906003)(66476007)(316002)(8936002)(8676002)(4326008)(966005)(478600001)(6486002)(110136005)(86362001)(2906002)(41300700001)(921008)(5660300002)(38100700002)(107886003)(2616005)(26005)(6666004)(83380400001)(6512007)(53546011)(31686004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?enNZcmVTeEZQYklzUzRFNHJLT2hGWTBHVlBVSE5iNGZVbWh2aUpaS1ZOTDRi?=
 =?utf-8?B?OC9Cd29lbFQ3dVdoU0VhY2lIRXFtQUU0VlhVSUdYZXNtWDcrRXlLeWVPTmYx?=
 =?utf-8?B?M2lic09maExhWVB5b3FPc1k5QVZOalVHV2xMVkRid0RTRDdQQ0dickdwNmFL?=
 =?utf-8?B?K2R2YlgrOTQzR2hPbGtPb0tEUTJtWkxLU2E2cW1rNkRhbDRxOTdSN0tBdDRo?=
 =?utf-8?B?cndxVSs4VzhYRFVwVktmcVlXV2NvcVMrbU1VNm9ETGVRelFqZ04yVjk3NGR2?=
 =?utf-8?B?Wk91NDZmQXdiaVBTRVl1VmlKSXNBN3hYVUprSmQ2SmVXSmRwN0lCNnJxTVdN?=
 =?utf-8?B?QWs5UWxkZ0F5Z3lVY2s0ZUZ6MW9OZVprYnBCeVMvc0ZEUGdoZXl4MHNTNTgr?=
 =?utf-8?B?c04rNHFBMXlvdjBqYTBJY01ER3hGTVNBWURSWEg5SThFQ1pIZ01BZTMrMDRZ?=
 =?utf-8?B?NHBZU1cvMDRCYU5PVjUvaHhUV2RBQStHS2pUVmJMeVlvS2lLUTVUK0JERWcy?=
 =?utf-8?B?Y2JGTlg1eWJlc0wvV0R6RXdiZlBCU0tPRllhajBtOGQwZ3NIS1JsUlVBOHRT?=
 =?utf-8?B?eHZQKzdCVlZ4SmRGWkxhOU1sSDVjbjBXeCtlQVhaeFRGRTdpMCtmd1pGZFVo?=
 =?utf-8?B?bnBTQ0MxM0xnTjgyR0ZvbklwMmFxWG1nYVZCbnIwSWV2R0orMUw5OWVXM2xN?=
 =?utf-8?B?dlMyQjdJbkYvd0hxMzZwcUJ0SkxPTmJwcmVOTkk0R0hYbEJ4NU00NFBoRkNW?=
 =?utf-8?B?OXpYdjRuRTNPd2QyMFJZQ1VhbEpFNkNBR0cxT25rb0ZvR0Q0MGR2ODdUem95?=
 =?utf-8?B?Mi9FS09OZ242bXNRRTNhaTRuem13ZmZkcUpMZ0ZlSzJ3dlBWa2huSmw1V0p5?=
 =?utf-8?B?YkRZK1RuQXJ1QWtYbHZabWNaVUlDeFpuWUFScU4rMFRPWDZjcWtRR3N5MEkw?=
 =?utf-8?B?UzNIMTU2NS9hNDRqRy9mWGpDUW1Hajdla3ZFOWJCZjM5dk9BcENodmh3VVVt?=
 =?utf-8?B?WUI1TWd4TitFblBORmJOTTNkWUlpN0QwNExwSmI0VmdWeE9zSW91WFhNUDBE?=
 =?utf-8?B?WGlVZk41K29hMVpVb3lMNGU1a0NJMEZaUXlONk0rZngxWHZJZ3QzZGZPUGRn?=
 =?utf-8?B?OTh0NSsxRmxFWTBEcWFneGhXNmlLY1l6dTNDRkp3VnZJMnd3L29JTVFsNnhM?=
 =?utf-8?B?Rzh0alNnaU5GUFBhVzJMbDFWclVveXpCTFlTWld4a2MzM2R0UHN6Tm9IQ2lO?=
 =?utf-8?B?YW9tR0FPYlhPVmRlNW5VSllmcjY0dWpETEZ5c1ViWGJ4OUhqRnBzRDI1dEhq?=
 =?utf-8?B?YWVIaW1EYU9EaVZZVDlzVVhVdGhEZXZrVkRjQXV6cm1jN2RPQnhZTnBoc094?=
 =?utf-8?B?blN2TG5mNWEycVNjdUN1WDVIbjdrUW5XREE2dUNTTlErY3pUSldZU2U1ZGUy?=
 =?utf-8?B?OGR1eDB0KzNCb0pHMlRYeWNJMzNhOFhJbm9Fd2RhakhteHZsUnlLbVB0VTdV?=
 =?utf-8?B?K1VUSmVmd2lYdFlTNkNaV3dNZEJWWVo4U1RaVWkrL3pKeE02akNwd1BsRXE3?=
 =?utf-8?B?ZW5wRktRb3hBNFRURUlrZlBGRXFuZS9uWTlzd21FakZYaVU3dTlPTmlBaG9X?=
 =?utf-8?B?aEFPUUxGellhNW0vVExpUXYzVlVTTzFaODZCa3kwYStSUTllb3ZLL2JLVmpy?=
 =?utf-8?B?YkwxSi9jaWhKYTdpT3hKUTM3ZjJ1MDVCdzlBZVRPWTBxaEVQSTQwZ0YxR2pZ?=
 =?utf-8?B?Z0ZNSVpkZG4xVHNla2lwNmwzZ1RCTUdscncvaTdDRTRYblQyRkpRenRqd1A1?=
 =?utf-8?B?RERrYTV3YldsV3JmVUdzdWNYenBuT2hLeEozaUQ0VjhZZmlCakZGMXIwMzRL?=
 =?utf-8?B?elllSnZmd0diQ0V4QjVwZTJRV0ZyUlg1a3RSa0YycjBSQno2MVhKbHdBYW1i?=
 =?utf-8?B?a2IzdTY2V0FWYjVFa3lKUWc5MVJHb2tsellrbXVMRHNYVzVDNmVGcVJIdlg0?=
 =?utf-8?B?ekM0QWZxQjdpaEZVbG9DYXRBOE9aQU5LRlRPMnp5emJxQk42RHdheHRqa3R4?=
 =?utf-8?B?MTJjQkVKTFAxUWlTQ0pRSmJXYm13VDFmSDdvdGdDaXNQdFRBV0J4d29MWU0z?=
 =?utf-8?B?cGYxdE9ucDUva3ZOd09tMThSNnZZOEt5QTVKckI0ek5GcnNZYVBtNG15TnBp?=
 =?utf-8?Q?wBeOAunzNf/K9jmVV59oTkI=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb98e83b-e607-45ff-a5b8-08dbf2372936
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 06:31:33.7817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3MnezFXXpLPMo5Crl1BvnTS21AxJS8yaqKBY8MGbBI83DDZRiOc7sxn93RRoPKKvsqsq0OP/FX6fgbZaXHhTpYFJBdDe9P+6X/BxQkTF+TA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB8159
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
Cc: Dung Cao <dung@os.amperecomputing.com>, Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 30/11/2023 16:40, Jeremy Kerr wrote:
> Hi Quan,
> 
>> With this commit, we all see the packets go through peacefully just
>> by requeueing the packets at MCTP layer and eliminated the need to
>> retry in PLDM layer which would need more time.
> 
> It's certainly possible that this tries harder to send MCTP packets,
> but it's just duplicating the retry mechanism already present in the
> i2c core.
> 
> Why do we need another retry mechanism here? How is the i2c core retry
> mechanism not sufficient?
> 
> It would seem that you can get the same behaviour by adjusting the
> retries/timeout limits in the core code, which has the advantage of
> applying to all arbitration loss events on the i2c bus, not just for
> MCTP tx.
> 

Hi Jeremy,

As per [1], __i2c_transfer() will retry for adap->retries times 
consecutively (without any wait) within the amount of time specified by 
adap->timeout.

So as per my observation, once it loses the arbitration, the next retry 
is most likely still lost as another controller who win the arbitration 
may still be using the bus. Especially for upper layer protocol message 
like PLDM or SPDM, which size is far bigger than SMBus, usually ends up 
to queue several MCTP packets at a time. But if to requeue the packet, 
it must wait to acquire the lock before actually queueing that packet, 
and that is more likely to increase the chance to win the arbitration 
than to retry it right away as on the i2c core.

Another reason is that, as i2c is widely used for many other 
applications, fixing the retry algorithm within the i2c core seems 
impossible.

The other fact is that the initial default value of these two parameters 
depends on each type of controller; I'm not sure why yet.

+ i2c-aspeed:     retries=0 timeout=1 sec [2]
+ i2c-cadence:    retries=3 timeout=1 sec [3]
+ i2c-designware: retries=3 timeout=1 sec [4], [5]
+ i2c-emev2:      retries=5 timeout=1 sec [6]
+ ...

Unfortunately, in our case, we use i2c-aspeed, and there is only one try 
(see [2]), and that means we have only one single shot. I'm not sure why 
i2c-aspeed chose to set retries=0 by default, but I guess there must be 
a reason behind it.

And yes, I agree, as per [7], these two parameters could be adjusted via 
ioctl() from userspace if the user wishes to change them. But, honestly, 
forcing users to change these parameters is not a good way, as I might 
have to say.

To avoid that, requeueing the packet in the MCTP layer was kind of way 
better choice, and it was confirmed via our case.

Thanks,
- Quan


[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/i2c-core-base.c#n2223
[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/busses/i2c-aspeed.c#n1030
[3] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/busses/i2c-cadence.c#n1322
[4] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/busses/i2c-designware-master.c#n1030
[5] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/busses/i2c-designware-slave.c#n258
[6] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/busses/i2c-emev2.c#n385
[7] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/i2c-dev.c#n478
