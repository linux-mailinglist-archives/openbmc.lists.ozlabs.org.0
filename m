Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 928FA6DFA1B
	for <lists+openbmc@lfdr.de>; Wed, 12 Apr 2023 17:30:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxRVX35Sdz3f4k
	for <lists+openbmc@lfdr.de>; Thu, 13 Apr 2023 01:30:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=46.105.54.81; helo=smtpout3.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 1012 seconds by postgrey-1.36 at boromir; Thu, 13 Apr 2023 01:30:10 AEST
Received: from smtpout3.mo529.mail-out.ovh.net (smtpout3.mo529.mail-out.ovh.net [46.105.54.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxRVB0YNpz3cBX
	for <openbmc@lists.ozlabs.org>; Thu, 13 Apr 2023 01:30:07 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.2])
	by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 35B7E20C0C;
	Wed, 12 Apr 2023 15:13:09 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 12 Apr
 2023 17:13:09 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-101G004462b771d-17db-464e-b48f-f15e35446f40,
                    5163A029651DE878447B53959E60E0FA73EB9D10) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <2231ac88-3005-0fb4-6aad-e7652ffd3467@kaod.org>
Date: Wed, 12 Apr 2023 17:13:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: Integrating swtpm(as a software TPM) with OpenBMC on Qemu
Content-Language: en-US
To: Sandeep Kumar <sandeep.pkumar@tcs.com>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, Ninad Palsule <ninad@linux.ibm.com>, Joel Stanley
	<jms@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <MA1PR01MB412922EF629403C84674A6AD87909@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <8e23c99e-0e62-3866-ce61-c75a14453a37@kaod.org>
 <MA1PR01MB4129EB6FA57EA28AA9002E9C879B9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <MA1PR01MB4129EB6FA57EA28AA9002E9C879B9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 85b0d75d-4194-4f57-baa3-fca62ad83c75
X-Ovh-Tracer-Id: 14593070167808773027
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekiedgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepvdfhteetudduudelvddtfedugedtueefudeggfejgeevudejhfejteekudelieeknecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutddupdekvddrieeirdejjedrudduheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepshgrnhguvggvphdrphhkuhhmrghrsehttghsrdgtohhmpdhophgvnhgsmhgtsehlihhsthhsrdhoiihlrggsshdrohhrghdpnhhinhgrugeslhhinhhugidrihgsmhdrtghomhdpjhhmshesjhhmshdrihgurdgruhdprghnughrvgifsegrjhdrihgurdgruhdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
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

On 4/12/23 07:12, Sandeep Kumar wrote:
>   TCS Confidential
> 
> Hi C,
> 
> Thanks for sharing the info.  We have started working on it. Could you please point to the exact patches that needs to be applied on openBMC Qemu ? There are too many patches to choose from.

Just use my branch for now. OpenBMC QEMU is outdated.
We'll resync when 8.0 is out

Thanks,

C.

> 
> Thanks,
> Sandeep.
> 
> -----Original Message-----
> From: Cédric Le Goater <clg@kaod.org>
> Sent: Wednesday, April 5, 2023 7:25 PM
> To: Sandeep Kumar <sandeep.pkumar@tcs.com>; openbmc@lists.ozlabs.org; Ninad Palsule <ninad@linux.ibm.com>; Joel Stanley <jms@jms.id.au>; Andrew Jeffery <andrew@aj.id.au>
> Subject: Re: Integrating swtpm(as a software TPM) with OpenBMC on Qemu
> 
> "External email. Open with Caution"
> 
> Hello,
> 
> On 4/5/23 14:48, Sandeep Kumar wrote:
>> TCS Confidential
>>
>>
>> Hi,
>>
>> Trying to see how to get swtpm working as a virtual TPM and connect to openBMC on QEMU. How do we achieve this? Main idea is to get this working and make secure boot through the virtual TPM(swtpm).
> 
> Ninad did a nice how to :
> 
>     https://lore.kernel.org/qemu-devel/20230331161319.2250334-4-ninadpalsule@us.ibm.com/
> 
> If you want to try, the patches are on this branch :
> 
>     https://github.com/legoater/qemu/commits/aspeed-8.0
> 
> and they should reach the QEMU OpenBMC repo at some point in time.
> 
> 
> Joel also provided a simple test case :
> 
>     https://lore.kernel.org/qemu-devel/20230328120844.190914-1-joel@jms.id.au/
> 
> using the ast2600-evb machine.
> 
> Cheers,
> 
> C.
> 
>   TCS Confidential
> =====-----=====-----=====
> Notice: The information contained in this e-mail
> message and/or attachments to it may contain
> confidential or privileged information. If you are
> not the intended recipient, any dissemination, use,
> review, distribution, printing or copying of the
> information contained in this e-mail message
> and/or attachments to it are strictly prohibited. If
> you have received this communication in error,
> please notify us by reply e-mail or telephone and
> immediately and permanently delete the message
> and any attachments. Thank you
> 
> 

