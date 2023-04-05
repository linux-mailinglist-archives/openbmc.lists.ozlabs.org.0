Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDEF6D81AC
	for <lists+openbmc@lfdr.de>; Wed,  5 Apr 2023 17:22:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ps7fM0BxTz3g2g
	for <lists+openbmc@lfdr.de>; Thu,  6 Apr 2023 01:22:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=46.105.45.231; helo=8.mo548.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 8.mo548.mail-out.ovh.net (8.mo548.mail-out.ovh.net [46.105.45.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ps7QD5Py2z3fCs
	for <openbmc@lists.ozlabs.org>; Thu,  6 Apr 2023 01:11:45 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.192])
	by mo548.mail-out.ovh.net (Postfix) with ESMTPS id BD1312299A;
	Wed,  5 Apr 2023 13:54:41 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 5 Apr
 2023 15:54:40 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-97G00257018c7f-3098-4e04-8a1c-f02264ee18b7,
                    F6E870C7B0430B4CB656BDE4FE4461F5E7FE1016) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <8e23c99e-0e62-3866-ce61-c75a14453a37@kaod.org>
Date: Wed, 5 Apr 2023 15:54:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: Integrating swtpm(as a software TPM) with OpenBMC on Qemu
Content-Language: en-US
To: Sandeep Kumar <sandeep.pkumar@tcs.com>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, Ninad Palsule <ninad@linux.ibm.com>, Joel Stanley
	<jms@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <MA1PR01MB412922EF629403C84674A6AD87909@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <MA1PR01MB412922EF629403C84674A6AD87909@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: c97d1155-1931-4aac-9cff-fff956e50f74
X-Ovh-Tracer-Id: 9052516727384214435
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejuddgjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgeffvdejleejvdevffdtuedvgeegtdelgfehfefggfekteffieeulefhgeelieehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdeljedpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepshgrnhguvggvphdrphhkuhhmrghrsehttghsrdgtohhmpdhophgvnhgsmhgtsehlihhsthhsrdhoiihlrggsshdrohhrghdpnhhinhgrugeslhhinhhugidrihgsmhdrtghomhdpjhhmshesjhhmshdrihgurdgruhdprghnughrvgifsegrjhdrihgurdgruhdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
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

Hello,

On 4/5/23 14:48, Sandeep Kumar wrote:
> TCS Confidential
> 
> 
> Hi,
> 
> Trying to see how to get swtpm working as a virtual TPM and connect to openBMC on QEMU. How do we achieve this? Main idea is to get this working and make secure boot through the virtual TPM(swtpm).

Ninad did a nice how to :

   https://lore.kernel.org/qemu-devel/20230331161319.2250334-4-ninadpalsule@us.ibm.com/

If you want to try, the patches are on this branch :

   https://github.com/legoater/qemu/commits/aspeed-8.0

and they should reach the QEMU OpenBMC repo at some point in time.


Joel also provided a simple test case :

   https://lore.kernel.org/qemu-devel/20230328120844.190914-1-joel@jms.id.au/

using the ast2600-evb machine.

Cheers,

C.
