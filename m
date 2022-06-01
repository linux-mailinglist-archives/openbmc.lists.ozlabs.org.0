Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E96F5539F57
	for <lists+openbmc@lfdr.de>; Wed,  1 Jun 2022 10:24:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LChxx5ZkMz3bmt
	for <lists+openbmc@lfdr.de>; Wed,  1 Jun 2022 18:24:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=EMF01IqX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eab::730; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=EMF01IqX;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20730.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::730])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LChxW2JhKz3bk8;
	Wed,  1 Jun 2022 18:23:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGLwLYuB32d+BAALlEm82yEtykFWaNDaBgBVlE/s5dXtYsT+lTfDzbKxrLF6nFgsFoMVmW2ZBhwiAAQZlx7o4f8inW2gApy4AykMfOdja0rpyo5ioC6SCMRdyKqKlOHAjdVZ/lFCN+C40BIC6eStlRRv0GDX6+++xbpaxh1q8q5vaiy0w48nWf3X6mb7fhGYI0Y9QjyXwj8G9v3+AtdoViCVUflZkmK0bVxI/jDYiXemIRB2Yvmz94ZVObbDdM7qaR9gcRPZo+RD9E+4OrteeMZXSITYtzhpXu0iHxeKjTekdTyANMFeaqRjQbyUKDEEZqOLULl1OdQAReUkX0Cm7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rlVF0iMPrrmniy5l9kEFBl3woILxDoJb8sczYLSsWso=;
 b=Db5EBuccpkRyszpKjtM6b0k11mQOMdusUWxaQjMmHv722XAZ2Vl2ibrCdh4tQphi1JdYW6Yju4WSR/J4z3kQ/m0YksVubpzSiCiOqiwqaQfrAwrrxiP3nY//hy4ieIDm/i/pB1VbaDJfRjoNGrnsSwKUewuCG6xxadd9L2958hWZtlaEB1FyPWwrr9bBniQfHO7vWBszQIkVkY3oUgZmTdRK8BwtiZQoqoaEAJG5EMKK1ll7R9UxJ00l05Ae4IYsBPsCg24Va9e8zUBg7rFNr/gpbC//Zr6J0wl/s1VloK+Bxi5MH2iGpbAUIEJa0N+JYBQVZ+hsiTe1HvyNtGXC+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlVF0iMPrrmniy5l9kEFBl3woILxDoJb8sczYLSsWso=;
 b=EMF01IqXgZkJVqdxdc9cwUYMzhThDdZsp1gASF6NZjGd8wJEmH2Q9lb7JI2t2qBfGxkQ7MliCsYZyKzr2t2+cQ3OjlH8MrpYzTKqn6D6ziNR69SGOi8xEkJK2ABbckZJqRO+o7TSeXTuXp2NuuzvvoU9pW+Sjq6yXgJ/6s3um1o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 DM6PR01MB4922.prod.exchangelabs.com (2603:10b6:5:9::29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.18; Wed, 1 Jun 2022 08:23:23 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::5514:7923:ceef:cb2e]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::5514:7923:ceef:cb2e%3]) with mapi id 15.20.5293.019; Wed, 1 Jun 2022
 08:23:23 +0000
Message-ID: <ba084735-0781-7ca2-4d04-a70a4115729a@os.amperecomputing.com>
Date: Wed, 1 Jun 2022 15:23:11 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
From: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [Openipmi-developer] [PATCH v7 1/3] ipmi: ssif_bmc: Add SSIF BMC
 driver
To: minyard@acm.org
References: <20220422040803.2524940-1-quan@os.amperecomputing.com>
 <20220422040803.2524940-2-quan@os.amperecomputing.com>
 <20220423015119.GE426325@minyard.net>
 <ec7b86ec-827f-da64-8fd2-eae09f802694@os.amperecomputing.com>
 <20220504120631.GE3767252@minyard.net>
Content-Language: en-US
In-Reply-To: <20220504120631.GE3767252@minyard.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:3:18::17) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7854af90-98dc-412d-67a4-08da43a7fe31
X-MS-TrafficTypeDiagnostic: DM6PR01MB4922:EE_
X-Microsoft-Antispam-PRVS: 	<DM6PR01MB49229B1EEFEBA0D8628F430FF2DF9@DM6PR01MB4922.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	uacUwK51QeJ+UbJd7eUlsGwYo23UznvWPzmKR2lTpXMwQFhPU8lRFUwQiKSf1hXwdo4QsChl1DieM+cmC/AWf8duAoeRPA92gTzsG+/FAPOKsQRTTnywWLkp8977+TeziYzYr9D205QvnJAwKuHvfrsqnRIn54B88zW+NzJ3GfeuaKHwRHhu3ywUj8xryjhAUhAgZRwfQ1gj7nVtbpEAmzFO7V+DWXaXsDyQiuyxJIJnFoGVyKrmAUx+9d6bQfbO7oSOJaY7h7HbSXvMg4keqx8Sx4uHWIaWhTBPs5VE2CNRjj51wUTao3cTKemk9ozXh7H3AAQU16kIFYAFGOC8nRxDH7NV6DqT3CMeEF5rZ7OC8qq3iybSWphF2jzRcc2uYWCWwZPACbwLUFNmgCX4LoVO7xy8Rqm7QfwCyuz+hT1JXDlsLWkcsPzYSa7MB+KhX//YwbHs7IpEZDvS4Bl+5yaDYpNA8c4IX6LqzvnZC4llcsEdV7YpAQxgLVkSa/TpazFrPsZpR/V415FJS6r0DQ+tqRGVgDFZw7d89ReXQsfUr+QBRYEIiqNYRWEz7etnZex5pfm2fLkKWv/LC0PDDN3heBJ4LmVj/gUczRuBWFqXH/WYDa19tndpzTvTpHb9GmCpADZM+VLZeaF7XX6uCYXFOptt/KgmWEpUQse9+6IBxaAxxb/KdwouL2Y10g/r6L6hQi5e8oIYvV6S8VssABWGlw3w+T9YRU2oYif/6WnTvuUjdbAj3S2+1Jblix4Y
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(2906002)(83380400001)(6486002)(54906003)(508600001)(31686004)(8676002)(316002)(66556008)(6666004)(66476007)(4326008)(66946007)(53546011)(6916009)(186003)(52116002)(7416002)(5660300002)(6506007)(2616005)(38100700002)(38350700002)(31696002)(8936002)(26005)(6512007)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?bFRDMWsxdXo1TzRsa1JHZUw0WFNzMWx4d3NnWVJFZ2NLblloZ0Y0cGFnc2RH?=
 =?utf-8?B?Q1dQYXBqMFlsYWZOYzJ0aThPTTFmR1QzVkdRZ1hKditGRXV6dFcwR2llQ0t5?=
 =?utf-8?B?QURxQjY4T1pXd3Z3MFFiV3hOeWJjRngranFPdHJGcWJTZDVRdHdGN2V5Smht?=
 =?utf-8?B?UERGVGVjbG1WdlNBb2o2Y1hJTTRIc2RoakdlSXNCN3V4dmR1Nk5HMXRSbENi?=
 =?utf-8?B?M0ZwbWdFUi9GbFJQWWtsdEVRV0Faa0xmUVU5ZHlJOElBcVZTMTRyVStjcDkv?=
 =?utf-8?B?Q0lCWHBzNGN1aEVyRnkxNEJsY2o5dStJZ3dVYkJ0T1NoQVhuWWs5MU0vbjls?=
 =?utf-8?B?Ty8ra1B2VU43Uk5xcklIWFVsQVRlb0FOTk9NNzdPL0pVT003cUtPMXVqejdv?=
 =?utf-8?B?TnI5Z01jeUtJSEVQMmRKNHhtNFk5dEVkWENsZHlmK1hBWnBmbVB3anl0MStS?=
 =?utf-8?B?cis5eWV0YkxwMVVqWDlWTW5CS2MwbU9LVFhMeFJaYjhVVmg4bjJPZldxMTJZ?=
 =?utf-8?B?eXB6eDFEcURyWVJuMGRISVpKdC9sL2o0K1JURVFmanlJKzcyU3phU1FxOUFQ?=
 =?utf-8?B?ZnB6dWFGQ0ZzZG5PMVgxZkFqMTV2TEJ1WjlUcmJ0N0RJSS9HKzlXdEJlMGh6?=
 =?utf-8?B?SjNHdkpCbzZLUmVTUUFObEdRREl1YlpVcXFqUDYwVTNDQjJpWlJhN09Qcm9G?=
 =?utf-8?B?MUw3UHgyb0I5QmFMOWJJczl2cVJnT0dYRVhsQm9WUWRFL2hhVU5HSUt3TkQw?=
 =?utf-8?B?S08yWHc5TVlHcTl0Yk5hRE5YOE11TWg1aUp6RmEzMXJUcHNqK3lyTzRRMGVo?=
 =?utf-8?B?VkVMSGNyTU4vSzdlZ2hkOE9ucVAvZjhFckNYUkFpVStCNTh5dFJEYTN1TXZh?=
 =?utf-8?B?MExtK1hPUytadzUzYWNKZEFxTXpRVGZDM2dGTGczT1hhYmluWVZqYzlhV0kw?=
 =?utf-8?B?ZzlrYTdBS1JJUS9teUxwYTBOSUluV2Y3eG5nM2pRQ2hobG9ySjBHc1ZpVjNC?=
 =?utf-8?B?QkJ4cm1UUmRNMjF2UzR1ZFoydzFVcGF3OG4rMTQzVXVEbUNUUnBaS3pnVU9s?=
 =?utf-8?B?eFlQNmNoTGdyT1RKYmM5T3c0eUZ1Tm9wT2prYm5rem0wYkNoMWlwbkJ3RFRT?=
 =?utf-8?B?QStuMUc2VzdkTGRjM1hZSURiNW5xS3ZHRkVodlQxRFR4SnlYWXBFNlRJOHdz?=
 =?utf-8?B?d0hXTUVVMnF5eUxTN210a2VtenhqNUVWKzA2cGFOZGw3cDhVWTdUM2U2WmtH?=
 =?utf-8?B?aERTc1Bia21HcmIya3FIVnc0VDdoWExFWjdGczJLZjZvYVdZcVMwZFVzeEUw?=
 =?utf-8?B?QktaQWNPVitJWmR0Q2piUjN1TzlsUkRFbHVVSWJMa0kzQmo4Y29mVmZQZjB2?=
 =?utf-8?B?dUtmZVRrSnRDZ0Eycnpsck91dXJzRFVkN3N4dzNXMmhYQlFyZTl3aDl3ZGd0?=
 =?utf-8?B?TDlFaHRGUkI1SW9NZUpxRFg5a1VGenVTQStpRFAxUVNtbHdvRERtV2hibHc3?=
 =?utf-8?B?Yk0wSm5hTC8wOGViWWExenV2NVREbTQrMm95OG4vUnN4N3BCTTZacXhsKzBn?=
 =?utf-8?B?bmNJb2ZhS0dPV1g3dE9TN2JRcSsrQS9weEJFVndiTk1zSjBFQ3U5cDJqQVd4?=
 =?utf-8?B?azR1d2pPb1E5cHlSZkt0TGMvcnN1OWpIRjNHMkxHR0tYQVZrNEZMbTJPczJW?=
 =?utf-8?B?U25MdmpzWm5Xa1ZyQWYySnVRYzU0dUhNZUx6N1FtY2FKYStkQWJOS2EwSU9o?=
 =?utf-8?B?TnhnWGZDbFFlTlhHVFIrSXROSExPUXRMRlNVeEpHUyt3T2RhUmZqYzVlR2o5?=
 =?utf-8?B?Y0FsWTllSFBhNTZaby9FS3YzQlluTjY2Wm9IOHQ2eUFWZlJueXl5VENid05B?=
 =?utf-8?B?RjNML2NQUTFPbm9VRVlTSUxoaE5nMUJwOTR0QnlMbVFKMnBFUERrTDdyZzIw?=
 =?utf-8?B?a0pJT21jNHY5TG1BdXVTbkNkNlBoSzY2SHVKNjFIZy9MZGEreFFWNjhtNVBV?=
 =?utf-8?B?OTF1U2dQYnV2L20xQTFTRXVURC9IUlhGOVBndmEydGtTK2g2QlJ3WGtBZ0xl?=
 =?utf-8?B?TVdPUFByL2l3UEs0ZEUvcFBoTGsyK2Z2bVNiNTBvb2YzVnFhRTBmcUtZYUhh?=
 =?utf-8?B?ZndhanFDQ3dxai9mZis1Yk1Rd0ZvSEk2VVlkUURlRnJESjIrV21MZGJ1dktF?=
 =?utf-8?B?cDFKR3lJMk95Ym5RMzQwdDhkQ3huYk5aTXdpbmVrYlZTVXE5OVJsS015WllS?=
 =?utf-8?B?dGxjakU5bEVQWjg1eFF5dDR2QTNiNS9lNEFnSVJxekcwNzc3bDNZTUVEd0kx?=
 =?utf-8?B?TS9EZWkrU1dHbGRybGtWSFRVVEZ4dnNqWkpzckhHVVdjMG1RbDZMdVBFQ2FB?=
 =?utf-8?Q?285XYJw5DO4/YRvSTHRdLmznqyhv0hY8FAYna?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7854af90-98dc-412d-67a4-08da43a7fe31
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 08:23:23.4126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y78wvx6kbADT9p59H+Swm91Kp3hfhw2JvenNKLZiRbV8uFoSDSVYsaEUk07nZf2128xYua52JjSxuuezmJ9ND7q6mDtFq4SK8JAnyAT9KIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4922
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org, openipmi-developer@lists.sourceforge.net, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 04/05/2022 19:06, Corey Minyard wrote:
> On Wed, May 04, 2022 at 01:45:03PM +0700, Quan Nguyen via Openipmi-developer wrote:
>>>
>>> I seem to remember mentioning this before, but there is no reason to
>>> pack the structures below.
>>>
>>
>> The packed structure is because we want to pick the len directly from user
>> space without worry about the padding byte.
>>
>> As we plan not to use the .h file in next version, I still would like to use
>> packed structure internally inside ssif_bmc.c file.
> 
> Packed doesn't matter for the userspace API.  If you look at other
> structures in the userspace API, they are not packed, either.  The
> compiler will do the right thing on both ends.
> 
>>
>>> And second, the following is a userspace API structures, so it needs to
>>> be in its own file in include/uapi/linux, along with any supporting
>>> things that users will need to use.  And your userspace code should be
>>> using that file.
>>>
>>
>> Meantime, I'd like not to use .h as I see there is no demand for sharing the
>> data structure between kernel and user space yet. But we may do it in the
>> future.
> 
> If you have a userspace API, it needs to be in include/uapi/linux.
> You may not be the only user of this code.  In fact, you probably won't
> be.  You need to have a .h with the structures in it, you don't want the
> same structure in two places if you can help it.
> 

Dear Corey,

Is it OK to push the structure definition into the 
include/uapi/linux/ipmi_bmc.h ?

Or should it need to be in separate new header file in uapi/linux ?

Thank you,
- Quan


