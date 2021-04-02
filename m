Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D21352550
	for <lists+openbmc@lfdr.de>; Fri,  2 Apr 2021 04:00:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBNYh47Bsz3bxX
	for <lists+openbmc@lfdr.de>; Fri,  2 Apr 2021 13:00:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=QUDyr+Ed;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.237.127;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=QUDyr+Ed; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2127.outbound.protection.outlook.com [40.107.237.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBNYM1bJkz2xYf;
 Fri,  2 Apr 2021 13:00:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esm7jbPTN5+dUoGj7e9giAK8S4FlXHa1XBEvEfIo+Bpk/l70Y/jxErdkhZrCIn6xR8hUacSVZCPaD53EgS4TIQqsng/MgqeTqoAeKvjo2To8QOG90vCEb6DW+kxYS6WPSxSeLoa7mevLQ0GXA4J14gwn1J9d1k+rb7E0F4oSKbSMa6oLslT0p+NJ2w8J5f3dRWwMSZtQ1GgCRvHoB4LlhVhENjmtA041QPIeWS/IMxMM5wZeVqbDNa2XIQ3xHkZMJI2gI8Os1yd5Siw7wx7zYywU+w7oj+ONxAw+9hc4hx4r3BSM3hL5tuvlW0YlRwAyxWwDluyKeNzd7lGVCdn+OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkdy81hfJcSZtZrQEavKcj0JmezxiyNDIfikQhOzEVM=;
 b=Dy595ZtVfDtlTxNazJ5zyyeY15TyHY7Ef/zoUA8SublL2x0K5BLMbiE3YR8gok38+x69aF+7hQzbUBgStVr22HsapZAeCLHZDyW7o4T1K0/iWAgXzcx+s8/69/VXKoC6ZaZUGphvQJwBBdEMRFDJv+inAGo5/7UEFVdRnoURSoiLyFgqbCfCCi2dz4MRIlw3o69gvRKLQez7QhPtyRXZNLTuTosSdBP5ccyxkVZmctpUMhR62rMZSsV1560R/hn1vVGqcVEKMBHihys0LUwfruBPDh8TA95TJ/EHVuD2Uxjgq5qKIUBFF9vyNpTOPXb1hel69ppCUp0MkHeaKyrsFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkdy81hfJcSZtZrQEavKcj0JmezxiyNDIfikQhOzEVM=;
 b=QUDyr+EdFqacfapK9zcYbWyg0tbhFDgfxqqUrA+FDB/EMd3rYnMWd8BIOMLWnN3zN/dDplR09EzMKlUuuvfCtogt01xYAwbWBxrBgsrGw+tpfsxoiPs3J0gbB66VcAm49T6GvhL9Ml3xforKGhnU1wyOVGZcYoFEPhbdosESo6M=
Authentication-Results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none; os.amperecomputing.com;
 dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 CO2PR01MB2197.prod.exchangelabs.com (2603:10b6:102:8::22) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.28; Fri, 2 Apr 2021 02:00:10 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.3977.033; Fri, 2 Apr 2021
 02:00:10 +0000
Subject: Re: [PATCH v2 3/3] bindings: ipmi: Add binding for Aspeed SSIF BMC
 driver
To: Rob Herring <robh@kernel.org>
References: <20210330141029.20412-1-quan@os.amperecomputing.com>
 <20210330141029.20412-4-quan@os.amperecomputing.com>
 <20210401170933.GA622142@robh.at.kernel.org>
From: Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <62acc395-de5b-fd5c-c74f-d7d713b43377@os.amperecomputing.com>
Date: Fri, 2 Apr 2021 08:59:58 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
In-Reply-To: <20210401170933.GA622142@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK0PR03CA0100.apcprd03.prod.outlook.com
 (2603:1096:203:b0::16) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.100] (118.69.219.201) by
 HK0PR03CA0100.apcprd03.prod.outlook.com (2603:1096:203:b0::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.26 via Frontend Transport; Fri, 2 Apr 2021 02:00:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e82e0e80-3981-4066-a228-08d8f57b0b9f
X-MS-TrafficTypeDiagnostic: CO2PR01MB2197:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO2PR01MB2197F8B4D840F35B8066B880F27A9@CO2PR01MB2197.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qhbFWGCCRP/XkXDEpmbYuNdHvrSipz2Olr+KILkK2aU2XR4CTrB0BWx9zrTXsteNlXpZSMt2ISx0rq0T1JPse9bqvR+QNfuCydsoDl/aExH7YIbL3zIOHzfhW9MXHHt+QXRzoVHsyZoyk8tX1Ls+Nc95cBXXyT9FTYbaRPgpNPZhs+yFjxw2J/9bMh/tBtWFwiNR1mvYOKgJ002sgsS/rjsTngV0SMwq9/WzCjobNl9x+prgMEVBsq42Lb6JdVEJVnvajAR5UEuw0tYkBT1Y1xOLDJLPCDX1CDD0Sd+sBe+aTXuMyr8p2COt2Bdvm/abN8xUqJNusAnTs5ypfTIMc1FVyp6j5nfSZ2aMQi5P7RRSGj2a2ivegyg7Jz/WupC4x5ljpxGVMWUoSGntlUT2IdmHMKaDiDYjttVL/65VhXEVFq29XgbgASnbH26sjYQoqjL0GUaFHr/gw3HpPz44zYc2mgxp9/5Lo3pda7ZWDjcW6ociYzXdUija4gs/vI19d5MM9x1VlYcyqyxkmzPRSmOkQkjwxRvSQVZ7xWsG7l4DtZfEiuZhwV0dLWpqt5DSFG5Vfec3HUnpHQLZTSj29klaa0R1iejcZOIAMiN+B6e42qPE9KX8F93fvcGu0hT/gT7hQmj8wMWfA3IiHjHn22z+BIhzZr/nBoUxizxcH4Bbc+VRDQlFIY0PhDmr+1IEAvDDLd0DGSA5t4gu7o638/7Bll6985s8lZQLK2+q/GE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(39850400004)(346002)(376002)(86362001)(6916009)(478600001)(31696002)(2906002)(956004)(38100700001)(2616005)(6486002)(8676002)(8936002)(4744005)(83380400001)(16526019)(186003)(5660300002)(26005)(31686004)(16576012)(66556008)(7416002)(66476007)(66946007)(6666004)(4326008)(54906003)(52116002)(53546011)(316002)(107886003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V1VoTkc0RThWUjVHdjl4KzNtaWdoWDBjajh6eWk3Q1lKL0hPK2xKbDVwTzJy?=
 =?utf-8?B?bXU4L2lyY3RRTGhMVlArSFRuOGkxd2srYnczMXNodThmYWdWT09DZEVoUlZo?=
 =?utf-8?B?VUVWc3JqQnI5UXcrZm9JcC9TNW8vQ0pZTW9DbFNtTjQ4QXM2WFh3WTlUSFVO?=
 =?utf-8?B?Tk5kYWNOVFhoc2FlYTNrdUJlTWNibmNuZEVaZnBiYmZiU010T1FLK2NjRkpo?=
 =?utf-8?B?RWs4V3REVk1pYVZuTjVkbE0yc0dsUW5IUC95SXBNYU1UMU5DVk5jNU5FRFFC?=
 =?utf-8?B?ay9CL3VOWnV2ZmhoYTE1QzQxVFM0TzRjNXNBK2wvQ01odzZYVEtkQkFqZzMx?=
 =?utf-8?B?R2dpLzFLYk1yMXlXMitWa2lHK0J2UWc5dUdTdHdwcTltaGh0VEozRVZsRG1Y?=
 =?utf-8?B?NjZscVhhSGxoVkxqUFdPdzlFaTlnYWpFRC93dHR3dWloNURyMU1uSVVXZ2VI?=
 =?utf-8?B?Z2c1dTAvVHJUQmMyaVZaQmJTWlpYUUQrYkpwNkJlT1lsVTdUUnFqenZXVzRN?=
 =?utf-8?B?aWpZZXBiUTFJc1JoVC9vbisxUDMySUEzU1RDN0JDTHVhK0QvWENua1MzZllo?=
 =?utf-8?B?SElzR21ycUdDOUgwNDRKZlFpYnlycW8rNzRGalJ3Z09YUjNBbkh2WHhha09J?=
 =?utf-8?B?MDJRdnp5MnE2eUNZaHRZVEdMSVFrc1Q0eUhxcDN4WDZzeGVZT0grcWtBazZT?=
 =?utf-8?B?SGxORkR2MnhPaVpyZVdiV0Z2SVY3WG0zZCt1YlN1MHBnWWxjbXJVL1d0VWNW?=
 =?utf-8?B?THJGbHJwSkVJcFhRT0pwQUU1azQ3VmRUZFZVRWsxRUNHVDN1cTEyNHFURGV4?=
 =?utf-8?B?U3dZbU9GR2xUdEZCbGQzUHZranZ4WnlJNjhjRW83NDlZNUplTnRFM09ZQ0U5?=
 =?utf-8?B?Vmd6bXNzL2dVTGtKSlhRMWY5STlxd3UxZVJpaVBxeG5Ib2ZXSFFEZWpIM0hK?=
 =?utf-8?B?Q1E2SW5RM0JPQUNiOXZYby9hSER5YWlRQWlhTkNwYUhLdkpUeVhTbWVjN3hh?=
 =?utf-8?B?dkoyZUw1eFZWSnhZWWRSTCtSQ0pRTE5md0hCWHpSOGRmbEMwM3BYSnREb1pt?=
 =?utf-8?B?MWZoclh6UEd4Q29IMUFSRXNFcFBqSzlUWWk4dytNMWMrRTM5VGhsNmhpYXY1?=
 =?utf-8?B?VnFsTytYVnViMGdiYlgyYTIyUlhFM2VlZU83YjV0OHROeWc0VisvMVJpa1lT?=
 =?utf-8?B?NGFsa1lPcmlCVnNhSDQ4dFN4OXNnM0hJNHorZUI5QVhWeEN0STY4Uk5wVXdZ?=
 =?utf-8?B?RGhyMklnL2lhRTZtTVBuaFJqVlc3QWtObDhtUnIwR29FYy94bko3RnFSd3Yv?=
 =?utf-8?B?ejk0Snl0b0VSWUZzeGNvTzlNMkNiTHJ3ZHR2aDVFYU5LbEV4Nk4zUW5mS0p0?=
 =?utf-8?B?enI1RE5Od1FZV0tzK0pCcXpKNk1RTTIyZlUyd2E3UVh2RTk5a1BRNXcxWDRW?=
 =?utf-8?B?VE5uN0R0MnVDbUo4RDZta2hWcG1uaVhVWXVNOU03N09mQjdjRnBqeDVIZllQ?=
 =?utf-8?B?YnhOTTRpRHBSalVPbzRYWmVsVDRBL1pmR0hGRmgvMDlZU2FaMjFkRkZRaUdT?=
 =?utf-8?B?NUpLcHBxSlJ0UUpoSy9YdkZUYnlQaVRBOXlyUDNRMVNqb0VjaUNJNkNnYjJJ?=
 =?utf-8?B?VVlvblZ4TG9maXdFVTB1QkdOQ3BhZTN3aUdiZVdyNkhnLzNZMW14TW5YeFJR?=
 =?utf-8?B?d3NpTklwV0JRSVJwNG9UTGVsSGs5cmMybStBWGtpemRlK2ROSkVEQXJaODkv?=
 =?utf-8?Q?mdCEDCYMDZeV71LL2GM203Wkkwz5zjgRvJT+H0h?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e82e0e80-3981-4066-a228-08d8f57b0b9f
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2021 02:00:10.0487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n2CFn5yZ7zkfKv5zGtFP+yWqfGEHcCxKGSV51Qr/eyXrCm/Le9hAuaipr+eYfA9xr8ERUS2nbL8ntmITfxqDUSMjnkHqviWdz3kCEpO4938=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR01MB2197
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Corey Minyard <minyard@acm.org>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>,
 Wolfram Sang <wsa@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net,
 Open Source Submission <patches@amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 02/04/2021 00:09, Rob Herring wrote:
> On Tue, Mar 30, 2021 at 09:10:29PM +0700, Quan Nguyen wrote:
>> Add device tree binding document for the Aspeed SSIF BMC driver.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>>   .../bindings/ipmi/aspeed-ssif-bmc.txt          | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.txt
> 
> Same comment as you ignored on v1.
> 

Dear Rob,
I really did not mean to do that.

What happen is that there was a compilation error complaint by kernel 
robot test on my v1. So I tried to send my v2 to fix that issue asap. 
Unfortunately, your reply on my v1 arrived just right after I hit "git 
send-email" to send out my v2.

For this comment, I'll switch to use yaml file in next version.

- Quan
