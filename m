Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6B7124211
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 09:44:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47d7pP43kHzDqfk
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 19:43:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47d6s31mXhzDqVk
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 19:01:08 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 00:01:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,328,1571727600"; d="scan'208";a="390104437"
Received: from qiantong-mobl.amr.corp.intel.com (HELO [10.251.0.98])
 ([10.251.0.98])
 by orsmga005.jf.intel.com with ESMTP; 18 Dec 2019 00:01:04 -0800
Subject: Re: [PATCH dev-5.4 00/14] PECI device driver introduction
To: Joel Stanley <joel@jms.id.au>
References: <20191218012808.6482-1-jae.hyun.yoo@linux.intel.com>
 <CACPK8Xd1fEh-o_5XR=QFppfR=HiQVbz60KjUFvjX7Lh7b9Le2g@mail.gmail.com>
 <CACPK8XezVTqvKRvJfxua=76H2aSdgEQrSaryZ0sqpM_ejV=6zQ@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <b4d13042-2ac9-f276-a5a1-fbb022248711@linux.intel.com>
Date: Wed, 18 Dec 2019 00:01:03 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XezVTqvKRvJfxua=76H2aSdgEQrSaryZ0sqpM_ejV=6zQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

On 12/17/2019 8:17 PM, Joel Stanley wrote:
> On Wed, 18 Dec 2019 at 03:08, Joel Stanley <joel@jms.id.au> wrote:
>>
>> On Wed, 18 Dec 2019 at 01:28, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>>
>>> I'm still trying to upstream it but it would take more time so I'm sending
>>> it to OpenBMC list to get cherry picked in the meantime.
>>>
>>> I rebased it on dev-5.4 branch and it includes fixes for addressing
>>> upstream review comments I've got so far.
>>>
>>> Below change should be removed from the OpenBMC linux tree before applying
>>> it to avoid conflicts:
>>>
>>> c31349b9039281107b948bf94ed5e53c235c8081 (ARM: dts: aspeed: peci: Add PECI node)
>>>
>>
>> Thanks. I have applied this to dev-5.4. Please test.
> 
> When CONFIG_OF_DYNAMIC=y we get this build failure:
> 
> ../drivers/peci/peci-core.c:1717:52: error: passing argument 4 of
> ‘bus_find_device’ from incompatible pointer type
> [-Werror=incompatible-pointer-types]
>   1717 |  dev = bus_find_device(&peci_bus_type, NULL, node, peci_of_match_node);
>        |                                                    ^~~~~~~~~~~~~~~~~~
>        |                                                    |
>        |                                                    int
> (*)(struct device *, void *)
> In file included from ../include/linux/node.h:18,
>                   from ../include/linux/cpu.h:17,
>                   from ../include/linux/of_device.h:5,
>                   from ../drivers/peci/peci-core.c:8:
> ../include/linux/device.h:176:16: note: expected ‘int (*)(struct
> device *, const void *)’ but argument is of type ‘int (*)(struct
> device *, void *)’
>    176 | struct device *bus_find_device(struct bus_type *bus, struct
> device *start,
>        |                ^~~~~~~~~~~~~~~
> ../drivers/peci/peci-core.c: In function ‘peci_of_find_adapter’:
> ../drivers/peci/peci-core.c:1734:52: error: passing argument 4 of
> ‘bus_find_device’ from incompatible pointer type
> [-Werror=incompatible-pointer-types]
>   1734 |  dev = bus_find_device(&peci_bus_type, NULL, node, peci_of_match_node);
>        |                                                    ^~~~~~~~~~~~~~~~~~
>        |                                                    |
>        |                                                    int
> (*)(struct device *, void *)
> In file included from ../include/linux/node.h:18,
>                   from ../include/linux/cpu.h:17,
>                   from ../include/linux/of_device.h:5,
>                   from ../drivers/peci/peci-core.c:8:
> ../include/linux/device.h:176:16: note: expected ‘int (*)(struct
> device *, const void *)’ but argument is of type ‘int (*)(struct
> device *, void *)’
>    176 | struct device *bus_find_device(struct bus_type *bus, struct
> device *start,
>        |                ^~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors

I checked that bus_find_device() definition was changed in June
so building it using -Werror will treat this warning as an error.

I made a fix and checked that the warning can be resolved.
Please apply below fix to patch 03/14 in this series or let me know
if you need v2 patch.

Thanks,

Jae

diff --git a/drivers/peci/peci-core.c b/drivers/peci/peci-core.c
index 61a2a59a9fe4..9aedb74710e6 100644
--- a/drivers/peci/peci-core.c
+++ b/drivers/peci/peci-core.c
@@ -1703,7 +1703,7 @@ static void peci_of_register_devices(struct 
peci_adapter *adapter) { }
  #endif /* CONFIG_OF */

  #if IS_ENABLED(CONFIG_OF_DYNAMIC)
-static int peci_of_match_node(struct device *dev, void *data)
+static int peci_of_match_node(struct device *dev, const void *data)
  {
         return dev->of_node == data;
  }

> Additioanlly, the nuvoton device trees in dev-5.4 did not compile. I
> will send a patch for that.
> 
> Cheers,
> 
> Joel
> 
