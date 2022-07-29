Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E54584DBD
	for <lists+openbmc@lfdr.de>; Fri, 29 Jul 2022 10:57:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvLxN6X93z3bk4
	for <lists+openbmc@lfdr.de>; Fri, 29 Jul 2022 18:57:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=188.165.58.48; helo=6.mo548.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 2391 seconds by postgrey-1.36 at boromir; Fri, 29 Jul 2022 18:56:57 AEST
Received: from 6.mo548.mail-out.ovh.net (6.mo548.mail-out.ovh.net [188.165.58.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvLx54ccGz2xH9
	for <openbmc@lists.ozlabs.org>; Fri, 29 Jul 2022 18:56:54 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.183])
	by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 69E68227C8;
	Fri, 29 Jul 2022 07:39:23 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 29 Jul
 2022 09:39:21 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-102R0041218b063-a24c-41c6-87ed-1d34e970e8a6,
                    FAFF5065920E43DA0D2CF6C40E58A39B80E28978) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.72.120
Message-ID: <32c4045d-7fce-5954-9710-4f6b0c6b0d2a@kaod.org>
Date: Fri, 29 Jul 2022 09:39:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH linux dev-5.15] soc: aspeed: abr: Add sysfs attrs for
 flash toggle
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, Jian Zhang
	<zhangjian.3032@bytedance.com>, <openbmc@lists.ozlabs.org>, Joel Stanley
	<joel@jms.id.au>
References: <20220501105644.355062-1-zhangjian.3032@bytedance.com>
 <62143648-8a90-4ff4-bfe1-f311b40cd50c@www.fastmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <62143648-8a90-4ff4-bfe1-f311b40cd50c@www.fastmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: a6453bd3-2138-4703-b325-6e2aced1d2b3
X-Ovh-Tracer-Id: 10280310576058174386
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduiedgieegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgrshhpvggvugeslhhishhtshdrohiilhgrsghsrdhorhhgpdfovfetjfhoshhtpehmohehgeek
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
Cc: zhangjian_linux@163.com, "moderated list:ARM/ASPEED MACHINE
 SUPPORT" <linux-aspeed@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

On 7/29/22 04:37, Andrew Jeffery wrote:
> Hi Jian Zhang,
> 
> On Sun, 1 May 2022, at 20:26, Jian Zhang wrote:
>> Implement the flash toggle function in soc ast2600.
>> Add two sysfs attrs named "access_primary" and "access_backup"
> 
> If you're proposing this patch for upstream then it needs to be based on
> an upstream kernel tree, not the OpenBMC kernel tree. You also should
> not use e.g. `linux dev-5.15` in the patch subject prefix, as that would
> be inappropriate for an upstream patch.
> 
> As you're adding sysfs attributes you'll also need to add the
> corresponding ABI documentation.

Yes. I think we need to discuss the ABI/sysfs files a bit. I am not
sure we should toggle the sysfs files depending on the boot mode :
primary vs. alternate. We could have the same files always and return
EIO if some conditions are not met. Something like :

* boot mode : primary/alternate. Write changes the next boot.
* watchdog management

Also, there is no need to introduce a new include file with large
inline functions.

Thanks,

C.
