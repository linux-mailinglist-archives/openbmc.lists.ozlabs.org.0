Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 344573895A1
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 20:40:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlhWZ1bGgz306G
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 04:40:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Thu, 20 May 2021 04:40:13 AEST
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlhWK3tXwz2ym5;
 Thu, 20 May 2021 04:40:13 +1000 (AEST)
IronPort-SDR: sno1lwmzOue8IPTkpDyY+fMGKDmrMPEfcS/7ccMpxIJHbHsJ93daaOcHNx1lRANofhgHeeYSD4
 UtJN6HSPrJXQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="286578697"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="286578697"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 11:39:04 -0700
IronPort-SDR: t/9/HAVArgbrnyjKwuPgZERcVTNLSueVk1Kxc3RizXi+tRfHvPz3k96RBdxBowKGSkIhIzR58q
 mS9lpGjMMD2w==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="394530847"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.212.229.30])
 ([10.212.229.30])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 11:39:03 -0700
Subject: Re: [PATCH v4 4/4] i2c: aspeed: add DMA mode transfer support
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Brendan Higgins <brendanhiggins@google.com>
References: <20210224191720.7724-1-jae.hyun.yoo@linux.intel.com>
 <20210224191720.7724-5-jae.hyun.yoo@linux.intel.com>
 <CAFd5g46eAcnSVFuUrXTuJmP-s_hsXDJ9x4QSQUM5JqfxFNwJVw@mail.gmail.com>
 <685d21f9-2f9d-c0ae-ee77-10eb4441870c@linux.intel.com>
Message-ID: <6ab00810-d99e-fcd8-091c-0961ae82f0ed@linux.intel.com>
Date: Wed, 19 May 2021 11:38:56 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <685d21f9-2f9d-c0ae-ee77-10eb4441870c@linux.intel.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Wolfram Sang <wsa@the-dreams.de>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Tao Ren <taoren@fb.com>, Cedric Le Goater <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Brendan,

On 4/14/2021 8:08 AM, Jae Hyun Yoo wrote:

[....]

>>> @@ -581,42 +660,55 @@ aspeed_i2c_master_handle_tx_first(struct 
>>> aspeed_i2c_bus *bus,
>>>   {
>>>          u32 command = 0;
>>>
>>> -       if (bus->buf_base) {
>>> -               u8 wbuf[4];
>>> +       if (bus->dma_buf || bus->buf_base) {
>>>                  int len;
>>> -               int i;
>>>
>>>                  if (msg->len - bus->buf_index > bus->buf_size)
>>>                          len = bus->buf_size;
>>>                  else
>>>                          len = msg->len - bus->buf_index;
>>>
>>> -               command |= ASPEED_I2CD_TX_BUFF_ENABLE;
>>> +               if (bus->dma_buf) {
>>> +                       command |= ASPEED_I2CD_TX_DMA_ENABLE;
>>>
>>> -               if (msg->len - bus->buf_index > bus->buf_size)
>>> -                       len = bus->buf_size;
>>> -               else
>>> -                       len = msg->len - bus->buf_index;
>>> +                       memcpy(bus->dma_buf, msg->buf + 
>>> bus->buf_index, len);
>>>
>>> -               /*
>>> -                * Looks bad here again but use dword writings to 
>>> avoid data
>>> -                * corruption of byte writing on remapped I2C SRAM.
>>> -                */
>>> -               for (i = 0; i < len; i++) {
>>> -                       wbuf[i % 4] = msg->buf[bus->buf_index + i];
>>> -                       if (i % 4 == 3)
>>> +                       writel(bus->dma_handle & 
>>> ASPEED_I2CD_DMA_ADDR_MASK,
>>> +                              bus->base + ASPEED_I2C_DMA_ADDR_REG);
>>> +                       writel(FIELD_PREP(ASPEED_I2CD_DMA_LEN_MASK, 
>>> len),
>>> +                              bus->base + ASPEED_I2C_DMA_LEN_REG);
>>> +                       bus->dma_len = len;
>>> +               } else {
>>> +                       u8 wbuf[4];
>>> +                       int i;
>>> +
>>> +                       command |= ASPEED_I2CD_TX_BUFF_ENABLE;
>>> +
>>> +                       if (msg->len - bus->buf_index > bus->buf_size)
>>> +                               len = bus->buf_size;
>>> +                       else
>>> +                               len = msg->len - bus->buf_index;
>>> +
>>> +                       /*
>>> +                        * Looks bad here again but use dword 
>>> writings to avoid
>>> +                        * data corruption of byte writing on 
>>> remapped I2C SRAM.
>>> +                        */
>>> +                       for (i = 0; i < len; i++) {
>>> +                               wbuf[i % 4] = msg->buf[bus->buf_index 
>>> + i];
>>> +                               if (i % 4 == 3)
>>> +                                       writel(*(u32 *)wbuf,
>>> +                                              bus->buf_base + i - 3);
>>> +                       }
>>> +                       if (--i % 4 != 3)
>>>                                  writel(*(u32 *)wbuf,
>>> -                                      bus->buf_base + i - 3);
>>> -               }
>>> -               if (--i % 4 != 3)
>>> -                       writel(*(u32 *)wbuf,
>>> -                              bus->buf_base + i - (i % 4));
>>> +                                      bus->buf_base + i - (i % 4));
>>>
>>> -               writel(FIELD_PREP(ASPEED_I2CD_BUF_TX_COUNT_MASK,
>>> -                                 len - 1) |
>>> -                      FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK,
>>> -                                 bus->buf_offset),
>>> -                      bus->base + ASPEED_I2C_BUF_CTRL_REG);
>>> +                       writel(FIELD_PREP(ASPEED_I2CD_BUF_TX_COUNT_MASK,
>>> +                                         len - 1) |
>>> +                              FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK,
>>> +                                         bus->buf_offset),
>>> +                              bus->base + ASPEED_I2C_BUF_CTRL_REG);
>>> +               }
>>>
>>>                  bus->buf_index += len;
>>>          } else {
>>
>> Some of these functions are getting really complex and most of the
>> logic for the different modes is in different if-else blocks. Could
>> you look into splitting this into separate functions based on which
>> mode is being used?
>>
>> Otherwise, this patch looks good.
> 
> I already splitted some big chunk of mode dependant logics to address
> your comment on v1. Could you please check again the patched result of
> this function? It's not much complex and it'd be better keep as is for
> consistency in other changes in this patch. I think, splitting it again
> would be not good for readability of the code flow.
> 
> Thanks,
> Jae
> 

This is the patched result of this function:

static inline u32
aspeed_i2c_master_handle_tx_first(struct aspeed_i2c_bus *bus,
				  struct i2c_msg *msg)
{
	u32 command = 0;

	if (bus->dma_buf || bus->buf_base) {
		int len;

		if (msg->len - bus->buf_index > bus->buf_size)
			len = bus->buf_size;
		else
			len = msg->len - bus->buf_index;

		if (bus->dma_buf) {
			command |= ASPEED_I2CD_TX_DMA_ENABLE;

			memcpy(bus->dma_buf, msg->buf + bus->buf_index, len);


			writel(bus->dma_handle & ASPEED_I2CD_DMA_ADDR_MASK,
			       bus->base + ASPEED_I2C_DMA_ADDR_REG);
			writel(FIELD_PREP(ASPEED_I2CD_DMA_LEN_MASK, len),
			       bus->base + ASPEED_I2C_DMA_LEN_REG);
			bus->dma_len = len;
		} else {
			u8 wbuf[4];
			int i;

			command |= ASPEED_I2CD_TX_BUFF_ENABLE;

			if (msg->len - bus->buf_index > bus->buf_size)
				len = bus->buf_size;
			else
				len = msg->len - bus->buf_index;

			for (i = 0; i < len; i++) {
				wbuf[i % 4] = msg->buf[bus->buf_index + i];
				if (i % 4 == 3)
					writel(*(u32 *)wbuf,
					       bus->buf_base + i - 3);
			}
			if (--i % 4 != 3)
				writel(*(u32 *)wbuf,
				       bus->buf_base + i - (i % 4));

			writel(FIELD_PREP(ASPEED_I2CD_BUF_TX_COUNT_MASK,
					  len - 1) |
			       FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK,
					  bus->buf_offset),
			       bus->base + ASPEED_I2C_BUF_CTRL_REG);
		}

		bus->buf_index += len;
	} else {
		writel(msg->buf[bus->buf_index++],
		       bus->base + ASPEED_I2C_BYTE_BUF_REG);
	}

	return command;
}

Do you still think that it should be split into separate functions per
each transfer mode?

Thanks,
Jae

[....]
