Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 047A2ADCF7
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 18:21:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Rth26m5hzDqH4
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 02:21:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46RtgL5HmPzDqCs
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 02:20:29 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Sep 2019 09:20:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,486,1559545200"; d="scan'208";a="189071056"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga006.jf.intel.com with ESMTP; 09 Sep 2019 09:20:26 -0700
Subject: Re: GPIO state in qemu
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CACPK8XdHwwQwc8-5uf319tX7v3Uh7CcG1rLRmTEK9oKQPYS0hw@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <6c036cfc-22d4-fd73-da83-60121e6433c2@linux.intel.com>
Date: Mon, 9 Sep 2019 09:20:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CACPK8XdHwwQwc8-5uf319tX7v3Uh7CcG1rLRmTEK9oKQPYS0hw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Rashmica Gupta <rashmica.g@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/6/19 11:05 AM, Joel Stanley wrote:
> At the osfc hackathon today James and I were talking about Qemu's new 
> support for modelling GPIOs. Here's some documentation on how it can be 
> used.
> 
> To set a pin's state in the monitor:
> 
> qom-set gpio gpioA0 true
> 
> To do the equivalent in code:
> 
> object_property_set_bool(OBJECT(&s->gpio), true, "gpioA0", &error_abort);

I'm trying to use object_property_set_bool in hw/arm/aspeed.c in an 
i2c_init block and I'm noticing by the time uboot is reached that the 
registers are reset back to the default. If I use qom-set it seems to 
work correctly. Where is the correct place to put the 
object_property_set_bool so that it doesn't get reset by the time it's 
ready to be read? Does AspeedBoardConfig need a gpio_init as well as an 
i2c_init?

Thanks,

-James



> 
> Thanks Rashmica for writing the model and Cedric for the tips.
> 
> Cheers,
> 
> Joel
> 
> 
