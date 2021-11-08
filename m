Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E929447C55
	for <lists+openbmc@lfdr.de>; Mon,  8 Nov 2021 09:55:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HnlLZ3KWyz2yw1
	for <lists+openbmc@lfdr.de>; Mon,  8 Nov 2021 19:55:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=s2 header.b=Z3Ti1AOv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=xs4all.nl (client-ip=2001:888:0:108::2a;
 helo=lb2-smtp-cloud7.xs4all.net; envelope-from=hverkuil@xs4all.nl;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=s2
 header.b=Z3Ti1AOv; dkim-atps=neutral
X-Greylist: delayed 66 seconds by postgrey-1.36 at boromir;
 Mon, 08 Nov 2021 19:54:51 AEDT
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net
 [IPv6:2001:888:0:108::2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HnlL35mRrz2xDH;
 Mon,  8 Nov 2021 19:54:51 +1100 (AEDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud7.xs4all.net with ESMTPA
 id k0P5meVbwFZvck0P8muGwC; Mon, 08 Nov 2021 09:53:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1636361611; bh=N5WnZDwk03ecG+KFBZDfNUaUy6ujNUFngbnpFjjX2b4=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=Z3Ti1AOvyr7eR+h5UazH/dgbYgPioWEp7h55Ur8T/xnOKFHVKiWcHOC0nRsOzagIL
 WHVdvfzz9Wa8KXwJGU6siHN9zDJW1x5Lvd8eY5Ok/DpgwDLdoJLa0324Lvs/wmkKtb
 OjELReeICe5grkZxspXCJs//pqDyNz+BhBoRzqViqGfYEgad+ieD2WKs7VbaVHPOb1
 jtpyllSb0HKF8EjRQ02Oc2F7N+u4xfC0D/V1+gk48TVkIfSvF1I2sEdbDKbyJUP+9J
 lsDVXw6CF3aHPOVlm/d+6ftTUC5D/2lRHDBwLjSM0T1Xc2lWBFUN7/hVTNYt4pQjNC
 N3qbi9C+OemnQ==
Subject: Re: [PATCH] media: aspeed: use reset to replace clk off/on
To: Jammy Huang <jammy_huang@aspeedtech.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 "eajames@linux.ibm.com" <eajames@linux.ibm.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>, "joel@jms.id.au"
 <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20211103054316.25272-1-jammy_huang@aspeedtech.com>
 <883dd517-7996-8c44-8cea-1c8838b367b6@linux.intel.com>
 <HK0PR06MB272258A4BA760E70CF609888F18E9@HK0PR06MB2722.apcprd06.prod.outlook.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <398d37a5-509f-b78b-360b-990d256bde63@xs4all.nl>
Date: Mon, 8 Nov 2021 09:53:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <HK0PR06MB272258A4BA760E70CF609888F18E9@HK0PR06MB2722.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfLgVZbzFUJQsFyvjN31c9nEsxsiILzODdS83Qkkx/mx+TyVnfKOOOxaUgiuQHgdsX9wdvFuPCS7ycc+NXp83vEzkC3WOxLNaWaUC4OKjqYekv4zHO4MB
 qQQzdnvHulF54s9YtL8NdADr6vuekXN1BGAo5DNTlsnPHbt+5GEi8tOatPbXaROoVOQcq3wy4BpAwtN2yMT6nnMBm1GIPB9O8wbQf+pYhfY/+ce9L7pBU3qY
 56d+24AzKLlnGPEIiB4QjsSpQKPMzFSNTb1+b/Ro5uOob+JrJM1OknYGj7sKAd13GvB8PIKWqd7ROUTHkgeYdUmszohAJgngXDmlhp+pM5ohTlRCd+P8wMFV
 VSnhxDeTiIr0mQflZxcj3eQ176i8td6oObDvqAsMnpljRlD4QC9OGfO+TDoAZbvyhj1mJHZK0DNfeHLZeeWYgypHxVmqPxfh/h/RDtC2RoJf1wUL2rYqvx1l
 hrH4wCXeUmV1kjjWPc6aq4zPx7bQuXIo2VcXPMcDUzT2OT16JzGscjPJiHkpXeizRdw38Er1gS8pAjXhwH79pphTObHLwhhouBNbTQ==
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

Hi Jammy,

On 05/11/2021 02:27, Jammy Huang wrote:
> Hi Jae,
> 
> OK, I found it.
> Thanks for your help.

So just so I understand this correctly: this patch can be dropped, right?

Regards,

	Hans

> 
> Regards,
> Jammy Huang
> 
> Tel: 886-3-575-1185  ext.8630
> 
> ************* Email Confidentiality Notice ********************
> DISCLAIMER:
> This message (and any attachments) may contain legally privileged and/or other confidential information. If you have received it in error, please notify the sender by reply e-mail and immediately delete the e-mail and any attachments without copying or disclosing the contents. Thank you.
> 
> -----Original Message-----
> From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> 
> Sent: Thursday, November 4, 2021 11:54 PM
> To: Jammy Huang <jammy_huang@aspeedtech.com>; eajames@linux.ibm.com; mchehab@kernel.org; joel@jms.id.au; andrew@aj.id.au; linux-media@vger.kernel.org; openbmc@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org; linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] media: aspeed: use reset to replace clk off/on
> 
> Hi Jammy,
> 
> On 11/2/2021 10:43 PM, Jammy Huang wrote:
>> reset should be more proper than clk off/on to bring HW back to good 
>> state.
>>
>> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>> ---
>>   drivers/media/platform/aspeed-video.c | 22 +++++++++++++++++++---
>>   1 file changed, 19 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/aspeed-video.c 
>> b/drivers/media/platform/aspeed-video.c
>> index fea5e4d0927e..10d182139809 100644
>> --- a/drivers/media/platform/aspeed-video.c
>> +++ b/drivers/media/platform/aspeed-video.c
>> @@ -23,6 +23,7 @@
>>   #include <linux/workqueue.h>
>>   #include <linux/debugfs.h>
>>   #include <linux/ktime.h>
>> +#include <linux/reset.h>
>>   #include <media/v4l2-ctrls.h>
>>   #include <media/v4l2-dev.h>
>>   #include <media/v4l2-device.h>
>> @@ -220,6 +221,7 @@ struct aspeed_video {
>>   	void __iomem *base;
>>   	struct clk *eclk;
>>   	struct clk *vclk;
>> +	struct reset_control *reset;
>>   
>>   	struct device *dev;
>>   	struct v4l2_ctrl_handler ctrl_handler; @@ -554,6 +556,13 @@ static 
>> void aspeed_video_on(struct aspeed_video *video)
>>   	set_bit(VIDEO_CLOCKS_ON, &video->flags);
>>   }
>>   
>> +static void aspeed_video_reset(struct aspeed_video *v) {
>> +	reset_control_assert(v->reset);
>> +	udelay(100);
>> +	reset_control_deassert(v->reset);
>> +}
>> +
>>   static void aspeed_video_bufs_done(struct aspeed_video *video,
>>   				   enum vb2_buffer_state state)
>>   {
>> @@ -574,7 +583,9 @@ static void aspeed_video_irq_res_change(struct aspeed_video *video, ulong delay)
>>   	set_bit(VIDEO_RES_CHANGE, &video->flags);
>>   	clear_bit(VIDEO_FRAME_INPRG, &video->flags);
>>   
>> -	aspeed_video_off(video);
>> +	aspeed_video_write(video, VE_INTERRUPT_CTRL, 0);
>> +	aspeed_video_write(video, VE_INTERRUPT_STATUS, 0xffffffff);
>> +	aspeed_video_reset(video);
>>   	aspeed_video_bufs_done(video, VB2_BUF_STATE_ERROR);
>>   
>>   	schedule_delayed_work(&video->res_work, delay); @@ -1507,8 +1518,7 
>> @@ static void aspeed_video_stop_streaming(struct vb2_queue *q)
>>   		 * Need to force stop any DMA and try and get HW into a good
>>   		 * state for future calls to start streaming again.
>>   		 */
>> -		aspeed_video_off(video);
>> -		aspeed_video_on(video);
>> +		aspeed_video_reset(video);
> 
> You can find the ECLK configuration in 'clk-aspeed.c' or in 'clk-ast2600.c' that it's coupled with the video engine reset (SCU04[6] for AST2500 / SCU040[6] for AST2600). It means that if we call
> clk_disable() and clk_enable() through aspeed_video_off() and aspeed_video_on(), the video engine reset will be implicitly asserted and de-asserted by the clock driver so the reset mechanism is already in the existing code.
> 
> Thanks,
> Jae
> 
>>   		aspeed_video_init_regs(video);
>>   
>> @@ -1715,6 +1725,12 @@ static int aspeed_video_init(struct aspeed_video *video)
>>   		return rc;
>>   	}
>>   
>> +	video->reset = devm_reset_control_get(dev, NULL);
>> +	if (IS_ERR(video->reset)) {
>> +		dev_err(dev, "Unable to get reset\n");
>> +		return PTR_ERR(video->reset);
>> +	}
>> +
>>   	video->eclk = devm_clk_get(dev, "eclk");
>>   	if (IS_ERR(video->eclk)) {
>>   		dev_err(dev, "Unable to get ECLK\n");
>>

