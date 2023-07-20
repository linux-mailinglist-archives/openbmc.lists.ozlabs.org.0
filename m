Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABF675B196
	for <lists+openbmc@lfdr.de>; Thu, 20 Jul 2023 16:49:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6Fv84sVRz3bl6
	for <lists+openbmc@lfdr.de>; Fri, 21 Jul 2023 00:49:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6Ftp2605z2yDQ
	for <openbmc@lists.ozlabs.org>; Fri, 21 Jul 2023 00:48:47 +1000 (AEST)
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 631C661E5FE01;
	Thu, 20 Jul 2023 16:47:49 +0200 (CEST)
Message-ID: <2f9858b0-88e2-736a-f16a-f4fbe549e389@molgen.mpg.de>
Date: Thu, 20 Jul 2023 16:47:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/4] peci: Add peci-npcm controller driver
Content-Language: en-US
To: Iwona Winiarska <iwona.winiarska@intel.com>
References: <20230719220853.1029316-1-iwona.winiarska@intel.com>
 <20230719220853.1029316-3-iwona.winiarska@intel.com>
 <dfda43af-e9b4-85bf-e165-02127e02fbf0@molgen.mpg.de>
 <9a6eb22ef6b7a6a686250ed83894e8d37de30baa.camel@intel.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <9a6eb22ef6b7a6a686250ed83894e8d37de30baa.camel@intel.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, Benjamin Fair <benjaminfair@google.com>, krzysztof.kozlowski+dt@linaro.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, robh+dt@kernel.org, warp5tw@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Iwona,


Thank you for the quick reply.

Am 20.07.23 um 10:38 schrieb Winiarska, Iwona:
> On Thu, 2023-07-20 at 08:20 +0200, Paul Menzel wrote:

>> Am 20.07.23 um 00:08 schrieb Iwona Winiarska:
>>> From: Tomer Maimon <tmaimon77@gmail.com>
>>>
>>> Add support for Nuvoton NPCM BMC hardware to the Platform Environment
>>> Control Interface (PECI) subsystem.
>>
>> Please elaborate on the implementation, and document the used datasheets.
> 
> As far as I know, there is no publicly available documentation.

Too bad. Documenting the datasheet name and version is still important, 
so developers could request it, and it can be mapped, once they are made 
public.

>> Additionally, please document how you tested this.
> 
> Are you asking to include this information in the commit message?

Yes.

> That would be unusual.
> But in general - it's a controller driver, it allows PECI subsystem to detect
> devices behind it and for PECI drivers to bind to those devices.

Having a test line in the commit message is not unusual at. So people 
with systems where it doesn’t work, could replicate the test setup to at 
least verify that it works in that configuration.

>>> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>>> Signed-off-by: Tyrone Ting <warp5tw@gmail.com>
>>> Co-developed-by: Iwona Winiarska <iwona.winiarska@intel.com>
>>> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
>>> ---
>>>    drivers/peci/controller/Kconfig     |  16 ++
>>>    drivers/peci/controller/Makefile    |   1 +
>>>    drivers/peci/controller/peci-npcm.c | 298 ++++++++++++++++++++++++++++
>>>    3 files changed, 315 insertions(+)
>>>    create mode 100644 drivers/peci/controller/peci-npcm.c
>>>
>>> diff --git a/drivers/peci/controller/Kconfig
>>> b/drivers/peci/controller/Kconfig
>>> index 2fc5e2abb74a..4f9c245ad042 100644
>>> --- a/drivers/peci/controller/Kconfig
>>> +++ b/drivers/peci/controller/Kconfig
>>> @@ -16,3 +16,19 @@ config PECI_ASPEED
>>>    
>>>            This driver can also be built as a module. If so, the module will
>>>            be called peci-aspeed.
>>> +
>>> +config PECI_NPCM
>>> +       tristate "Nuvoton NPCM PECI support"
>>> +       depends on ARCH_NPCM || COMPILE_TEST
>>> +       depends on OF
>>> +       select REGMAP_MMIO
>>> +       help
>>> +         This option enables PECI controller driver for Nuvoton NPCM7XX
>>> +         and NPCM8XX SoCs. It allows BMC to discover devices connected
>>> +         to it and communicate with them using PECI protocol.
>>> +
>>> +         Say Y here if you want support for the Platform Environment
>>> Control
>>> +         Interface (PECI) bus adapter driver on the Nuvoton NPCM SoCs.
>>> +
>>> +         This support is also available as a module. If so, the module
>>> +         will be called peci-npcm.
>>> diff --git a/drivers/peci/controller/Makefile
>>> b/drivers/peci/controller/Makefile
>>> index 022c28ef1bf0..e247449bb423 100644
>>> --- a/drivers/peci/controller/Makefile
>>> +++ b/drivers/peci/controller/Makefile
>>> @@ -1,3 +1,4 @@
>>>    # SPDX-License-Identifier: GPL-2.0-only
>>>    
>>>    obj-$(CONFIG_PECI_ASPEED)     += peci-aspeed.o
>>> +obj-$(CONFIG_PECI_NPCM)                += peci-npcm.o
>>> diff --git a/drivers/peci/controller/peci-npcm.c
>>> b/drivers/peci/controller/peci-npcm.c
>>> new file mode 100644
>>> index 000000000000..3647e3628a17
>>> --- /dev/null
>>> +++ b/drivers/peci/controller/peci-npcm.c
>>> @@ -0,0 +1,298 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +// Copyright (c) 2019 Nuvoton Technology corporation.
>>
>> No dot/period at the end.
>>
>> […]
>>
>>> +static int npcm_peci_xfer(struct peci_controller *controller, u8 addr, struct peci_request *req)
>>> +{
>>> +       struct npcm_peci *priv = dev_get_drvdata(controller->dev.parent);
>>> +       unsigned long timeout = msecs_to_jiffies(priv->cmd_timeout_ms);
>>> +       unsigned int msg_rd;
>>> +       u32 cmd_sts;
>>> +       int i, ret;
>>> +
>>> +       /* Check command sts and bus idle state */
>>> +       ret = regmap_read_poll_timeout(priv->regmap, NPCM_PECI_CTL_STS, cmd_sts,
>>> +                                      !(cmd_sts & NPCM_PECI_CTRL_START_BUSY),
>>> +                                      NPCM_PECI_IDLE_CHECK_INTERVAL_USEC,
>>> +                                      NPCM_PECI_IDLE_CHECK_TIMEOUT_USEC);
>>> +       if (ret)
>>> +               return ret; /* -ETIMEDOUT */
>>> +
>>> +       spin_lock_irq(&priv->lock);
>>> +       reinit_completion(&priv->xfer_complete);
>>> +
>>> +       regmap_write(priv->regmap, NPCM_PECI_ADDR, addr);
>>> +       regmap_write(priv->regmap, NPCM_PECI_RD_LENGTH, NPCM_PECI_WR_LEN_MASK & req->rx.len);
>>> +       regmap_write(priv->regmap, NPCM_PECI_WR_LENGTH, NPCM_PECI_WR_LEN_MASK & req->tx.len);
>>> +
>>> +       if (req->tx.len) {
>>> +               regmap_write(priv->regmap, NPCM_PECI_CMD, req->tx.buf[0]);
>>> +
>>> +               for (i = 0; i < (req->tx.len - 1); i++)
>>> +                       regmap_write(priv->regmap, NPCM_PECI_DAT_INOUT(i), req->tx.buf[i + 1]);
>>> +       }
>>> +
>>> +#if IS_ENABLED(CONFIG_DYNAMIC_DEBUG)
>>> +       dev_dbg(priv->dev, "addr : %#02x, tx.len : %#02x, rx.len : %#02x\n",
>>> +               addr, req->tx.len, req->rx.len);
>>> +       print_hex_dump_bytes("TX : ", DUMP_PREFIX_NONE, req->tx.buf, req-tx.len);
>>> +#endif
>>
>> The preprocessor guards are not needed, as it’s taken care of in
>> `include/linux/printk.h`. Also in other parts of the patch.
> 
> Since this is dumping the raw contents of PECI messages, it's going to be quite
> verbose. The idea behind preprocessor guard is that we don't ever want this to
> be converted to regular printk. If there's no dynamic debug available - this
> won't be printed unconditionally (even with -DDEBUG).

How will it be converted to a regular printk?

     #if defined(CONFIG_DYNAMIC_DEBUG) || \
         (defined(CONFIG_DYNAMIC_DEBUG_CORE) && 
defined(DYNAMIC_DEBUG_MODULE))
     #define print_hex_dump_debug(prefix_str, prefix_type, rowsize,      \
                              groupsize, buf, len, ascii)        \
         dynamic_hex_dump(prefix_str, prefix_type, rowsize,      \
                          groupsize, buf, len, ascii)
     #elif defined(DEBUG)
     #define print_hex_dump_debug(prefix_str, prefix_type, rowsize, 
         \
                              groupsize, buf, len, ascii)                \
         print_hex_dump(KERN_DEBUG, prefix_str, prefix_type, rowsize,    \
                        groupsize, buf, len, ascii)
     #else
     static inline void print_hex_dump_debug(const char *prefix_str, int 
prefix_type,
                                         int rowsize, int groupsize,
                                         const void *buf, size_t len, 
bool ascii)
     {
     }
     #endif

>> […]
>>
>>> +module_platform_driver(npcm_peci_driver);
>>> +
>>> +MODULE_AUTHOR("Tomer Maimon <tomer.maimon@nuvoton.com>");
>>> +MODULE_DESCRIPTION("NPCM PECI driver");
>>> +MODULE_LICENSE("GPL");
>>> +MODULE_IMPORT_NS(PECI);
>>
>> Also add an entry to `MAINTAINERS`, if Tomer is going to be the maintainer?
> 
> All of the newly added files should already be covered by either ARM/NUVOTON
> NPCM ARCHITECTURE or PECI SUBSYSTEM.

Good to know. Thank you.


Kind regards,

Paul
