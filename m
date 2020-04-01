Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDED19B249
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 18:43:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ssTD2YbgzDqC4
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 03:43:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.36.172; helo=3.mo177.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 3596 seconds by postgrey-1.36 at bilbo;
 Thu, 02 Apr 2020 03:41:17 AEDT
Received: from 3.mo177.mail-out.ovh.net (3.mo177.mail-out.ovh.net
 [46.105.36.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ssQj2CVTzDqZp
 for <openbmc@lists.ozlabs.org>; Thu,  2 Apr 2020 03:41:16 +1100 (AEDT)
Received: from player761.ha.ovh.net (unknown [10.110.171.212])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 3881312B1FB
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 17:22:18 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player761.ha.ovh.net (Postfix) with ESMTPSA id E9B4311051013;
 Wed,  1 Apr 2020 15:22:13 +0000 (UTC)
Subject: Re: Any idea of when qemu-system-arm will be supported for
 https://github.com/Intel-BMC/openbmc ?
To: Bruce Mitchell <Bruce_Mitchell@phoenix.com>,
 "Alexander A. Filippov" <a.filippov@yadro.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <1d854d104f3a48dd8f2c3929fc93a68b@SCL-EXCHMB-13.phoenix.com>
 <20200330090018.GA20872@bbwork.lan>
 <de86f16351804487b251000e03e28fe5@SCL-EXCHMB-13.phoenix.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <58d1847e-fab0-0702-04a2-2b0021af76f8@kaod.org>
Date: Wed, 1 Apr 2020 17:22:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <de86f16351804487b251000e03e28fe5@SCL-EXCHMB-13.phoenix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 12801763418385910530
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrtddvgdekjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpqhgvmhhurdhorhhgnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeiuddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehophgvnhgsmhgtsehlihhsthhsrdhoiihlrggsshdrohhrgh
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

On 3/30/20 4:35 PM, Bruce Mitchell wrote:
> I was looking for something like a -M wolfpass-bmc command line option like Romulus has -M romulus-bmc
> (see here: https://github.com/openbmc/docs/blob/master/development/dev-environment.md )
> 
> Yet I find no wolfpass, S2600WF, nor Intel in the -machine help list. (see below)

We would need a machine definition such as the ones in hw/arm/aspeed.c.

See :

https://git.qemu.org/?p=qemu.git;a=blob;f=hw/arm/aspeed.c;h=a6a2102a93cbe2199c28e58deee480518076476e;hb=HEAD#l472

in the limited scope of what QEMU supports. I2C models are not too
complex to write if someone is interested.

Regards,

C. 
