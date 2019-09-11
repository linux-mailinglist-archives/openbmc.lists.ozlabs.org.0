Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76915B02B4
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2019 19:29:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T85b01LMzF3qp
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 03:29:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=178.32.124.17; helo=20.mo6.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 4201 seconds by postgrey-1.36 at bilbo;
 Thu, 12 Sep 2019 03:28:32 AEST
Received: from 20.mo6.mail-out.ovh.net (20.mo6.mail-out.ovh.net
 [178.32.124.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T84w68VnzF3pj
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 03:28:28 +1000 (AEST)
Received: from player773.ha.ovh.net (unknown [10.109.160.12])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 1B6471E0A61
 for <openbmc@lists.ozlabs.org>; Wed, 11 Sep 2019 18:13:17 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player773.ha.ovh.net (Postfix) with ESMTPSA id 93E9B9B4FC64;
 Wed, 11 Sep 2019 16:13:13 +0000 (UTC)
Subject: Re: GPIO state in qemu
To: Rashmica Gupta <rashmica.g@gmail.com>,
 James Feist <james.feist@linux.intel.com>, Joel Stanley <joel@jms.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CACPK8XdHwwQwc8-5uf319tX7v3Uh7CcG1rLRmTEK9oKQPYS0hw@mail.gmail.com>
 <6c036cfc-22d4-fd73-da83-60121e6433c2@linux.intel.com>
 <60430dd8-e3c5-e020-2ff7-cb4c536e20a0@kaod.org>
 <a9c7851e4cd92bb2de0fb7ec8eccf2f25f652c1a.camel@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <793ed9ff-e78d-8177-3eee-0b51d4137489@kaod.org>
Date: Wed, 11 Sep 2019 18:13:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a9c7851e4cd92bb2de0fb7ec8eccf2f25f652c1a.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 2097833005464914690
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrtdefgdejvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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

On 11/09/2019 03:12, Rashmica Gupta wrote:
> On Mon, 2019-09-09 at 19:02 +0200, Cédric Le Goater wrote:
>> On 09/09/2019 18:20, James Feist wrote:
>>> On 9/6/19 11:05 AM, Joel Stanley wrote:
>>>> At the osfc hackathon today James and I were talking about Qemu's
>>>> new support for modelling GPIOs. Here's some documentation on how
>>>> it can be used.
>>>>
>>>> To set a pin's state in the monitor:
>>>>
>>>> qom-set gpio gpioA0 true
>>>>
>>>> To do the equivalent in code:
>>>>
>>>> object_property_set_bool(OBJECT(&s->gpio), true, "gpioA0",
>>>> &error_abort);
>>>
>>> I'm trying to use object_property_set_bool in hw/arm/aspeed.c in an
>>> i2c_init block and I'm noticing by the time uboot is reached that
>>> the registers are reset back to the default. 
>>
>> These routines are called before the machine and devices are reseted.
>>
>>> If I use qom-set it seems to work correctly. 
>>
>> The machine has been reseted.
>>
>>> Where is the correct place to put the object_property_set_bool so
>>> that it doesn't get reset by the time it's ready to be read? Does
>>> AspeedBoardConfig need a gpio_init as well as an i2c_init?
>>  
>> we would need to change the default reset value in the reset handler
>> of the GPIO device model : aspeed_gpio_reset(). We don't have a way 
>> to set default values yet, all 0s for now.
>>
>> Rashmica,
>>
>> Would it be complex to add a set of default values with which we 
>> could memset the ->sets array in the reset handler() like we do 
>> for SCU ? 
>>
> 
> I think it should be pretty straightforward. Do we want one statically
> defined set of default values per SoC version?

yes, to start with, like we do in SCU. 

But we would need a property for the specific needs of a board, which 
value would override the default SoC reset values. 

>> Having a different set of default values per machine would require 
>> a second set of properties under AspeedGPIOState and some slight 
>> rework of aspeed_gpio_get/set_pin.
> 
> Why would it require rework of get/set pin?

because we would only need the logic to set the value and the helper 
aspeed_gpio_update() does more. 

C.

