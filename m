Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A58B32347E
	for <lists+openbmc@lfdr.de>; Wed, 24 Feb 2021 01:35:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DlcQv2Rlqz3cHS
	for <lists+openbmc@lfdr.de>; Wed, 24 Feb 2021 11:35:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Wed, 24 Feb 2021 11:35:39 AEDT
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DlcQg603dz30Lj;
 Wed, 24 Feb 2021 11:35:39 +1100 (AEDT)
IronPort-SDR: faY5fuHyCnCq0TmxAqWW4SelJo814YYEoJp3zTXw5cfjBYvkaj2e4RFTfCa80lCFnayFYN0noI
 BCvJK8uHnzdA==
X-IronPort-AV: E=McAfee;i="6000,8403,9904"; a="204449564"
X-IronPort-AV: E=Sophos;i="5.81,201,1610438400"; d="scan'208";a="204449564"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2021 16:34:30 -0800
IronPort-SDR: VYskAicEFbpP58lUSZgBoPY9YA5oVTyV7rgg+qrfkyP2+E95SDJ8wmPUrZGJ//4X9X4WsegZbQ
 5v1BaFLgJJSg==
X-IronPort-AV: E=Sophos;i="5.81,201,1610438400"; d="scan'208";a="380713235"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.209.6.81])
 ([10.209.6.81])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2021 16:34:29 -0800
Subject: Re: [PATCH v3 3/4] i2c: aspeed: add buffer mode transfer support
To: Brendan Higgins <brendanhiggins@google.com>
References: <20210216182735.11639-1-jae.hyun.yoo@linux.intel.com>
 <20210216182735.11639-4-jae.hyun.yoo@linux.intel.com>
 <CAFd5g47MBQ67S3XzaH9rDPSieihNJ_WPhUgw=Pkg1Vk1PK3AvQ@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <fb60042c-e1c9-bf79-7769-a97c626b4f4b@linux.intel.com>
Date: Tue, 23 Feb 2021 16:34:24 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFd5g47MBQ67S3XzaH9rDPSieihNJ_WPhUgw=Pkg1Vk1PK3AvQ@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Wolfram Sang <wsa@the-dreams.de>,
 Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>,
 linux-i2c@vger.kernel.org, Cedric Le Goater <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Brendan,

On 2/23/2021 3:03 PM, Brendan Higgins wrote:
> On Tue, Feb 16, 2021 at 10:15 AM Jae Hyun Yoo
> <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> This driver uses byte mode that makes lots of interrupt calls
>> which isn't good for performance and it makes the driver very
>> timing sensitive. To improve performance of the driver, this commit
>> adds buffer mode transfer support which uses I2C SRAM buffer
>> instead of using a single byte buffer.
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> Tested-by: Tao Ren <taoren@fb.com>
> 
> Overall looks pretty good! There were just a couple bits of code which
> were not immediately obvious to me that I would like to see improved:
> 
>> ---
>> Changes since v2:
>> - Refined SoC family dependent xfer mode configuration functions.
>>
>> Changes since v1:
>> - Updated commit message.
>> - Refined using abstract functions.
>>
>>   drivers/i2c/busses/i2c-aspeed.c | 464 ++++++++++++++++++++++++++++----
>>   1 file changed, 412 insertions(+), 52 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
>> index 724bf30600d6..343e621ff133 100644
>> --- a/drivers/i2c/busses/i2c-aspeed.c
>> +++ b/drivers/i2c/busses/i2c-aspeed.c
> [...]
>> +static inline u32
>> +aspeed_i2c_prepare_tx_buf(struct aspeed_i2c_bus *bus, struct i2c_msg *msg)
>> +{
>> +       u8 slave_addr = i2c_8bit_addr_from_msg(msg);
>> +       u32 command = 0;
>> +       int len;
>> +
>> +       if (msg->len + 1 > bus->buf_size)
>> +               len = bus->buf_size;
>> +       else
>> +               len = msg->len + 1;
>> +
>> +       if (bus->buf_base) {
>> +               u8 wbuf[4];
>> +               int i;
>> +
>> +               command |= ASPEED_I2CD_TX_BUFF_ENABLE;
>> +
>> +               /*
>> +                * Yeah, it looks bad but byte writing on remapped I2C SRAM
>> +                * causes corruption so use this way to make dword writings.
>> +                */
> 
> Not surprised. It looks like you reuse this code in a couple of
> places, at the very least I think you should break this out into a
> helper function. Otherwise, please make a similar comment in the other
> locations.

There is one more place which has a similar code but loop count, tx
buffer and message buffer indexing are slightly different so better
leave them, IMO. Instead, I'll add this comment even for the other one.

> Also, why doesn't writesl()
> (https://elixir.bootlin.com/linux/v5.11/source/include/asm-generic/io.h#L413)
> work here?

This is caused by Aspeed I2C SRAM specific behavior so it can't be
covered by writesl().

Will submit v4 soon. Thanks for your review!

Best,
Jae

>> +               wbuf[0] = slave_addr;
>> +               for (i = 1; i < len; i++) {
>> +                       wbuf[i % 4] = msg->buf[i - 1];
>> +                       if (i % 4 == 3)
>> +                               writel(*(u32 *)wbuf, bus->buf_base + i - 3);
>> +               }
>> +               if (--i % 4 != 3)
>> +                       writel(*(u32 *)wbuf, bus->buf_base + i - (i % 4));
>> +
>> +               writel(FIELD_PREP(ASPEED_I2CD_BUF_TX_COUNT_MASK, len - 1) |
>> +                      FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK, bus->buf_offset),
>> +                      bus->base + ASPEED_I2C_BUF_CTRL_REG);
>> +       }
>> +
>> +       bus->buf_index = len - 1;
>> +
>> +       return command;
>> +}
>> +
> [...]
> 
