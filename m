Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD0A75BEE7
	for <lists+openbmc@lfdr.de>; Fri, 21 Jul 2023 08:32:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6fqJ3WBLz3c4b
	for <lists+openbmc@lfdr.de>; Fri, 21 Jul 2023 16:32:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6fpy0yyxz30gF
	for <openbmc@lists.ozlabs.org>; Fri, 21 Jul 2023 16:31:51 +1000 (AEST)
Received: from [192.168.0.185] (ip5f5aeeaf.dynamic.kabel-deutschland.de [95.90.238.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 2F75861E5FE03;
	Fri, 21 Jul 2023 08:30:52 +0200 (CEST)
Message-ID: <54fc5f74-d293-e467-709f-5077c03be80c@molgen.mpg.de>
Date: Fri, 21 Jul 2023 08:30:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/4] peci: Add peci-npcm controller driver
To: Iwona Winiarska <iwona.winiarska@intel.com>
References: <20230719220853.1029316-1-iwona.winiarska@intel.com>
 <20230719220853.1029316-3-iwona.winiarska@intel.com>
 <dfda43af-e9b4-85bf-e165-02127e02fbf0@molgen.mpg.de>
 <9a6eb22ef6b7a6a686250ed83894e8d37de30baa.camel@intel.com>
 <2f9858b0-88e2-736a-f16a-f4fbe549e389@molgen.mpg.de>
 <d6de8b0e5b54ca12d9f9930f01a85467b145b134.camel@intel.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <d6de8b0e5b54ca12d9f9930f01a85467b145b134.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, tmaimon77@gmail.com, krzysztof.kozlowski+dt@linaro.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, warp5tw@gmail.com, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Iwona,


Am 20.07.23 um 22:20 schrieb Winiarska, Iwona:
> On Thu, 2023-07-20 at 16:47 +0200, Paul Menzel wrote:

>> Am 20.07.23 um 10:38 schrieb Winiarska, Iwona:
>>> On Thu, 2023-07-20 at 08:20 +0200, Paul Menzel wrote:
>>
>>>> Am 20.07.23 um 00:08 schrieb Iwona Winiarska:
>>>>> From: Tomer Maimon <tmaimon77@gmail.com>
>>>>>
>>>>> Add support for Nuvoton NPCM BMC hardware to the Platform Environment
>>>>> Control Interface (PECI) subsystem.
>>>>
>>>> Please elaborate on the implementation, and document the used datasheets.
>>>
>>> As far as I know, there is no publicly available documentation.
>>
>> Too bad. Documenting the datasheet name and version is still important,
>> so developers could request it, and it can be mapped, once they are made
>> public.
> 
> Sorry, unfortunately I can't help with that, I don't have access to any Nuvoton
> docs. Perhaps Tomer can provide more information?

Hopefully. But I wonder, how can you develop and review the patch then?

>>>> Additionally, please document how you tested this.
>>>
>>> Are you asking to include this information in the commit message?
>>
>> Yes.
>>
>>> That would be unusual.
>>> But in general - it's a controller driver, it allows PECI subsystem to detect
>>> devices behind it and for PECI drivers to bind to those devices.
>>
>> Having a test line in the commit message is not unusual at. So people
>> with systems where it doesn’t work, could replicate the test setup to at
>> least verify that it works in that configuration.
> 
> It's unusual as almost none of the commits in Linux kernel contain "how to test
> it" description.

I saw some commits document on what hardware it was tested.

> The explanation body in the commit message should explain *why* the patch was
> created, not how to test it.

I disagree. It should of course the why, but sometimes also the how 
(implementation), the used datasheets, and all other details making it 
easy to review and give reviewers without the hardware confidence, that 
the patch is good.

> And when taken as a series - it's self documenting. There's a Kconfig which
> allows to enable/disable the driver, and there are bindings which show what
> platform contains the hardware that is compatible with it.

I just meant: Tested on server X with BMC Y using Nuvoton Z. Driver 
registered correctly, and devices A were discovered.

>>>>> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>>>>> Signed-off-by: Tyrone Ting <warp5tw@gmail.com>
>>>>> Co-developed-by: Iwona Winiarska <iwona.winiarska@intel.com>
>>>>> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
>>>>> ---
>>>>>     drivers/peci/controller/Kconfig     |  16 ++
>>>>>     drivers/peci/controller/Makefile    |   1 +
>>>>>     drivers/peci/controller/peci-npcm.c | 298 ++++++++++++++++++++++++++++
>>>>>     3 files changed, 315 insertions(+)
>>>>>     create mode 100644 drivers/peci/controller/peci-npcm.c
>>>>>
>>>>> diff --git a/drivers/peci/controller/Kconfig
>>>>> b/drivers/peci/controller/Kconfig
>>>>> index 2fc5e2abb74a..4f9c245ad042 100644
>>>>> --- a/drivers/peci/controller/Kconfig
>>>>> +++ b/drivers/peci/controller/Kconfig

[…]

>>>>> +#if IS_ENABLED(CONFIG_DYNAMIC_DEBUG)
>>>>> +       dev_dbg(priv->dev, "addr : %#02x, tx.len : %#02x, rx.len : %#02x\n",
>>>>> +               addr, req->tx.len, req->rx.len);
>>>>> +       print_hex_dump_bytes("TX : ", DUMP_PREFIX_NONE, req->tx.buf, req-tx.len);
>>>>> +#endif
>>>>
>>>> The preprocessor guards are not needed, as it’s taken care of in
>>>> `include/linux/printk.h`. Also in other parts of the patch.
>>>
>>> Since this is dumping the raw contents of PECI messages, it's going to be quite
>>> verbose. The idea behind preprocessor guard is that we don't ever want this to
>>> be converted to regular printk. If there's no dynamic debug available - this
>>> won't be printed unconditionally (even with -DDEBUG).
>>
>> How will it be converted to a regular printk?
>>
>>       #if defined(CONFIG_DYNAMIC_DEBUG) || \
>>           (defined(CONFIG_DYNAMIC_DEBUG_CORE) && defined(DYNAMIC_DEBUG_MODULE))
>>       #define print_hex_dump_debug(prefix_str, prefix_type, rowsize,      \
>>                                groupsize, buf, len, ascii)        \
>>           dynamic_hex_dump(prefix_str, prefix_type, rowsize,      \
>>                            groupsize, buf, len, ascii)
>>       #elif defined(DEBUG)
>>       #define print_hex_dump_debug(prefix_str, prefix_type, rowsize,      \
>>                                groupsize, buf, len, ascii)                \
>>           print_hex_dump(KERN_DEBUG, prefix_str, prefix_type, rowsize,    \
>>                          groupsize, buf, len, ascii)
>>       #else
>>       static inline void print_hex_dump_debug(const char *prefix_str, int prefix_type,
>>                                           int rowsize, int groupsize,
>>                                           const void *buf, size_t len, bool ascii)
>>       {
>>       }
>>       #endif
> 
> Let's consider 3 scenarios
> 1) Dynamic debug is available
> 2) Dynamic debug is not available, but we're built with -DDEBUG
> 3) Dynamic debug is not available, we're built without -DDEBUG
> 
> For 1), print_hex_dump_debug is dynamic - it can be controlled
> (enabled/disabled) using dynamic debug knobs (debugfs / dyndbg kernel arg).
> For 2), print_hex_dump_debug is using print_hex_dump, which is just using printk
> with KERN_DEBUG level under the hood.
> For 3), it's compiled out.
> 
> And it's scenario 2) that we would like to avoid, as hex-dumping all PECI
> communication into dmesg is likely going to make dmesg output unusable (can
> overflow, printing that to terminal is going to be slow, etc).
> 
> The dump can be useful, it's just that in order to be useful it needs the
> dynamic debug facilities :)

Thank you for the explanation. Currently, this is only used in the PECI 
subsystem:

     $ git grep 'if IS_ENABLED(CONFIG_DYNAMIC_DEBUG)'
     drivers/mtd/nand/raw/nand_base.c:#if 
IS_ENABLED(CONFIG_DYNAMIC_DEBUG) || defined(DEBUG)
     drivers/peci/controller/peci-aspeed.c:#if 
IS_ENABLED(CONFIG_DYNAMIC_DEBUG)
     drivers/peci/controller/peci-aspeed.c:#if 
IS_ENABLED(CONFIG_DYNAMIC_DEBUG)
     include/linux/mtd/rawnand.h:#if IS_ENABLED(CONFIG_DYNAMIC_DEBUG) || 
defined(DEBUG)

I think, it will only cause confusing for users, wondering why it does 
not show up with `-DDEBUG`. I assume the Linux kernel offers other ways 
to do what you are trying to achieve. Maybe using a dump_traffic knob or 
so in `/sys`.


Kind regards,

Paul
