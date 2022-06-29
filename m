Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 376835608D8
	for <lists+openbmc@lfdr.de>; Wed, 29 Jun 2022 20:16:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LY8mb15wYz3cj4
	for <lists+openbmc@lfdr.de>; Thu, 30 Jun 2022 04:16:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=178.32.121.110; helo=1.mo548.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 1.mo548.mail-out.ovh.net (1.mo548.mail-out.ovh.net [178.32.121.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LY8mK4G9Gz3blW
	for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2022 04:16:17 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.177])
	by mo548.mail-out.ovh.net (Postfix) with ESMTPS id A8D0B20747;
	Wed, 29 Jun 2022 18:07:45 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 29 Jun
 2022 20:07:44 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-96R00198260963-dde8-461b-8c1a-012665a8672e,
                    DF7F9948BD89912A9BBE6A4903E17E70B6709CC1) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d272ce4b-c338-c3ea-3770-6c85ddf60ec5@kaod.org>
Date: Wed, 29 Jun 2022 20:07:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 2/2] spi: aspeed: Fix division by zero
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220622161617.3719096-1-clg@kaod.org>
 <20220622161617.3719096-3-clg@kaod.org> <YryHVsrqNlhdwKzq@sirena.org.uk>
 <59b82730-f09f-f7e5-0e2f-4ad1765f0f6e@kaod.org>
 <YryLj6iWVkqWowDg@sirena.org.uk>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YryLj6iWVkqWowDg@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3fc20af5-91b9-41c4-b2e6-732ae46bea70
X-Ovh-Tracer-Id: 10732359387039697912
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehifiholhhoshgthhesrghkrghmrghirdgtohhmpdfovfetjfhoshhtpehmohehgeek
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Ian Woloschin <iwolosch@akamai.com>, Ian Woloschin <ian.woloschin@akamai.com>, Pratyush Yadav <p.yadav@ti.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/29/22 19:27, Mark Brown wrote:
> On Wed, Jun 29, 2022 at 07:21:08PM +0200, Cédric Le Goater wrote:
>> On 6/29/22 19:09, Mark Brown wrote:
>>> On Wed, Jun 22, 2022 at 06:16:17PM +0200, Cédric Le Goater wrote:
>>>
>>>> Fixes: 54613fc6659b ("spi: aspeed: Add support for direct mapping")
>>>
>>> This commit isn't in mainline.
> 
>> drat. It's the OpenBMC kernel. I will resend. Sorry about that.
> 
> It's OK, I fixed it up locally.


Thanks,

C.
