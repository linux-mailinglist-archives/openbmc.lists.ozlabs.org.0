Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFB754C19F
	for <lists+openbmc@lfdr.de>; Wed, 15 Jun 2022 08:16:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNFSS12Zqz3bxf
	for <lists+openbmc@lfdr.de>; Wed, 15 Jun 2022 16:16:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=188.165.42.229; helo=4.mo548.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 933 seconds by postgrey-1.36 at boromir; Wed, 15 Jun 2022 16:16:21 AEST
Received: from 4.mo548.mail-out.ovh.net (4.mo548.mail-out.ovh.net [188.165.42.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNFS537n5z3bp8
	for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2022 16:16:18 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.36])
	by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 596341FEBC;
	Wed, 15 Jun 2022 06:00:40 +0000 (UTC)
Received: from kaod.org (37.59.142.108) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 15 Jun
 2022 08:00:40 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-108S00273a6d292-69f3-40fe-9a97-3a908f058310,
                    3604600A7A17CF82FBB88DE7BC2BB74EF19CEDFF) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <54d6cbaa-33f2-e9a0-f7c4-0f99681e7d59@kaod.org>
Date: Wed, 15 Jun 2022 08:00:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 4/4] config: aspeed: Enable
 NCSI support
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20220610080059.2333501-1-joel@jms.id.au>
 <20220610080059.2333501-5-joel@jms.id.au>
 <6c3afc64-f046-6708-1248-980202cedff1@kaod.org>
 <CACPK8Xfpcn7p55ygtszEwbOzGRxMjX3cOzQgwJhgout5gd3pGA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8Xfpcn7p55ygtszEwbOzGRxMjX3cOzQgwJhgout5gd3pGA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.108]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: dab95597-daa7-4b13-a379-315e77fcfeb4
X-Ovh-Tracer-Id: 8469019099382582237
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddvtddgleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopeeuofevqdfuhgesrghsphgvvgguthgvtghhrdgtohhmpdfovfetjfhoshhtpehmohehgeek
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/15/22 07:58, Joel Stanley wrote:
> On Fri, 10 Jun 2022 at 09:31, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> On 6/10/22 10:00, Joel Stanley wrote:
>>> Now that NCSI can be enabled without breaking non-NCSI systems, enable
>>> it in all defconfigs.
>>>
>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>
>> You should add :
>>
>> CONFIG_CMD_NCSI=y
> 
> Was this required, or just something that helps for testing?

It helped for 'ping' if I remember well. Without it, it didn't
work (on QEMU).

Thanks,

C.
