Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C84A2132DC4
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 18:58:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sg9X0k4RzDqNd
	for <lists+openbmc@lfdr.de>; Wed,  8 Jan 2020 04:58:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sg8Z1sDkzDqJ2;
 Wed,  8 Jan 2020 04:58:04 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jan 2020 09:58:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,406,1571727600"; d="scan'208";a="395465240"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.147])
 ([10.7.153.147])
 by orsmga005.jf.intel.com with ESMTP; 07 Jan 2020 09:58:02 -0800
Subject: Re: [PATCH 3/3] media: aspeed: add AST2600 support
To: Joel Stanley <joel@jms.id.au>
References: <20200107011503.17435-1-jae.hyun.yoo@linux.intel.com>
 <20200107011503.17435-4-jae.hyun.yoo@linux.intel.com>
 <CACPK8XejA6emrboLzfwEpmn=dn1JcyHKJVud_cBXVNRiZixgTA@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <86f3dc92-07b0-c993-6c3e-39db6c58214e@linux.intel.com>
Date: Tue, 7 Jan 2020 09:58:02 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XejA6emrboLzfwEpmn=dn1JcyHKJVud_cBXVNRiZixgTA@mail.gmail.com>
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>, Rob Herring <robh+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 1/6/2020 7:15 PM, Joel Stanley wrote:
> On Tue, 7 Jan 2020 at 01:14, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> Video engine in AST2600 has the exactly same register set with
>> AST2500 except VR084 register which provides more precise JPEG
>> size read back. This commit adds support for the difference and
>> adds 'aspeed,ast2600-video-engine' compatible OF string.
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> ---
>>   drivers/media/platform/aspeed-video.c | 15 +++++++++++----
>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
>> index d8593cb2ae84..0dbe72672338 100644
>> --- a/drivers/media/platform/aspeed-video.c
>> +++ b/drivers/media/platform/aspeed-video.c
>> @@ -72,10 +72,10 @@
>>   #define  VE_SEQ_CTRL_CAP_BUSY          BIT(16)
>>   #define  VE_SEQ_CTRL_COMP_BUSY         BIT(18)
>>
>> -#ifdef CONFIG_MACH_ASPEED_G5
>> -#define  VE_SEQ_CTRL_JPEG_MODE         BIT(13) /* AST2500 */
>> -#else
>> +#ifdef CONFIG_MACH_ASPEED_G4
>>   #define  VE_SEQ_CTRL_JPEG_MODE         BIT(8)  /* AST2400 */
>> +#else
>> +#define  VE_SEQ_CTRL_JPEG_MODE         BIT(13) /* AST2500/2600 */
>>   #endif /* CONFIG_MACH_ASPEED_G5 */
> 
> Yeah, nah. This should have never been done this way. I will send some
> patches to fix it up, and you can add ast2600 support on top of them,
> if that works for you.

Yeah, the runtime configuration in your patch set is right way for it.
I'll rebase this patch set on top of your patch.

Thanks,

Jae

> Cheers,
> 
> Joel
> 
>>
>>   #define VE_CTRL                                0x008
>> @@ -135,6 +135,12 @@
>>
>>   #define VE_OFFSET_COMP_STREAM          0x078
>>
>> +#ifdef CONFIG_MACH_ASPEED_G6
>> +#define VE_JPEG_COMP_SIZE_READ_BACK    0x084   /* AST2600 */
>> +#else
>> +#define VE_JPEG_COMP_SIZE_READ_BACK    VE_OFFSET_COMP_STREAM
>> +#endif
>> +
>>   #define VE_SRC_LR_EDGE_DET             0x090
>>   #define  VE_SRC_LR_EDGE_DET_LEFT       GENMASK(11, 0)
>>   #define  VE_SRC_LR_EDGE_DET_NO_V       BIT(12)
>> @@ -572,7 +578,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>>          if (sts & VE_INTERRUPT_COMP_COMPLETE) {
>>                  struct aspeed_video_buffer *buf;
>>                  u32 frame_size = aspeed_video_read(video,
>> -                                                  VE_OFFSET_COMP_STREAM);
>> +                                                  VE_JPEG_COMP_SIZE_READ_BACK);
>>
>>                  spin_lock(&video->lock);
>>                  clear_bit(VIDEO_FRAME_INPRG, &video->flags);
>> @@ -1719,6 +1725,7 @@ static int aspeed_video_remove(struct platform_device *pdev)
>>   static const struct of_device_id aspeed_video_of_match[] = {
>>          { .compatible = "aspeed,ast2400-video-engine" },
>>          { .compatible = "aspeed,ast2500-video-engine" },
>> +       { .compatible = "aspeed,ast2600-video-engine" },
>>          {}
>>   };
>>   MODULE_DEVICE_TABLE(of, aspeed_video_of_match);
>> --
>> 2.17.1
>>
