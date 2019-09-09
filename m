Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1E8ADEBD
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 20:20:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46RxKj5fdWzDqQy
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 04:20:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=178.33.45.107; helo=5.mo1.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 4628 seconds by postgrey-1.36 at bilbo;
 Tue, 10 Sep 2019 04:19:53 AEST
Received: from 5.mo1.mail-out.ovh.net (5.mo1.mail-out.ovh.net [178.33.45.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46RxK56JB5zDqM5
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 04:19:49 +1000 (AEST)
Received: from player798.ha.ovh.net (unknown [10.109.146.1])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id EC64F18E474
 for <openbmc@lists.ozlabs.org>; Mon,  9 Sep 2019 19:02:35 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player798.ha.ovh.net (Postfix) with ESMTPSA id B72A39B23CAC;
 Mon,  9 Sep 2019 17:02:31 +0000 (UTC)
Subject: Re: GPIO state in qemu
To: James Feist <james.feist@linux.intel.com>, Joel Stanley <joel@jms.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CACPK8XdHwwQwc8-5uf319tX7v3Uh7CcG1rLRmTEK9oKQPYS0hw@mail.gmail.com>
 <6c036cfc-22d4-fd73-da83-60121e6433c2@linux.intel.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <60430dd8-e3c5-e020-2ff7-cb4c536e20a0@kaod.org>
Date: Mon, 9 Sep 2019 19:02:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6c036cfc-22d4-fd73-da83-60121e6433c2@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 9631792231429475092
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudekiedguddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Cc: Rashmica Gupta <rashmica.g@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 09/09/2019 18:20, James Feist wrote:
> On 9/6/19 11:05 AM, Joel Stanley wrote:
>> At the osfc hackathon today James and I were talking about Qemu's new support for modelling GPIOs. Here's some documentation on how it can be used.
>>
>> To set a pin's state in the monitor:
>>
>> qom-set gpio gpioA0 true
>>
>> To do the equivalent in code:
>>
>> object_property_set_bool(OBJECT(&s->gpio), true, "gpioA0", &error_abort);
> 
> I'm trying to use object_property_set_bool in hw/arm/aspeed.c in an i2c_init block and I'm noticing by the time uboot is reached that the registers are reset back to the default. 

These routines are called before the machine and devices are reseted.

> If I use qom-set it seems to work correctly. 

The machine has been reseted.

> Where is the correct place to put the object_property_set_bool so that it doesn't get reset by the time it's ready to be read? Does AspeedBoardConfig need a gpio_init as well as an i2c_init?
 
we would need to change the default reset value in the reset handler
of the GPIO device model : aspeed_gpio_reset(). We don't have a way 
to set default values yet, all 0s for now.

Rashmica,

Would it be complex to add a set of default values with which we 
could memset the ->sets array in the reset handler() like we do 
for SCU ? 

Having a different set of default values per machine would require 
a second set of properties under AspeedGPIOState and some slight 
rework of aspeed_gpio_get/set_pin.

Didn't you have a patch for reset tolerant values some time ago ? 
 
Thanks,

C.
