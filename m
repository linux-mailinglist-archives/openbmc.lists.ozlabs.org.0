Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C812E357102
	for <lists+openbmc@lfdr.de>; Wed,  7 Apr 2021 17:51:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFplh4m5Vz30HW
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 01:51:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Ib0VOqVA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32c;
 helo=mail-ot1-x32c.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ib0VOqVA; dkim-atps=neutral
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFplP0qCdz2xxj;
 Thu,  8 Apr 2021 01:50:55 +1000 (AEST)
Received: by mail-ot1-x32c.google.com with SMTP id
 s11-20020a056830124bb029021bb3524ebeso18573485otp.0; 
 Wed, 07 Apr 2021 08:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=ptYd3jX/R37ljV5aOZ/Dlk6Lc9RFKg7g8ehBAOVVl70=;
 b=Ib0VOqVAwPe3nxl28t5vGPZ7f6G3/KHzw6+B6puBiSAtL9o5zISkediRdawuxmVH1Q
 636hOk9fzLriEuFrzvI5L7P7M1OP8h5FO/D1kR+LY/KNSkPChuGpAU8CDrd5M7T2quCt
 Kss7KSR5NVDLZh3Iwga+rKlTMkN74kzvrTChXOwVUcdxgCJRSfYBQ7aOGBlQ7oBicDd8
 FcvmqChFg/zDyVljVTOn8y/bqTRAi1Ffzz6JvaQoap/56/Ctuk7Sk0zG0Gyqp5JKcgku
 qqv1iU8jaCC3ecWyhpuo0wgUsSwNmbJ87GQur/I6/K2S7DX6SOhvtGBe+gVtldEq/nyC
 IbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=ptYd3jX/R37ljV5aOZ/Dlk6Lc9RFKg7g8ehBAOVVl70=;
 b=Jc0YSUlQvUcTlWw78wHE1Grj9aPgDBYj1kg+v2hFTU4Q+CL6jzbmwYrd6meFcV8xjO
 EhULykvK2lih9DEEaMiaX0cVGmgTmxWA2/+yl9//rPMkmYQKrxtDWWVth3n/uoIgztPC
 +edqPUwmE5RfIJLCE6pGlk4TFgnDoLQ6lRGLCxutNr1jzqQgJssrSDfRftMmmzWt2uqM
 rxj2fKiGcfY4if7CVDpvp8JjCgnNg68A0pmH0v3jp/E48E5RufT3sEHK+2ifW6DtxIXC
 eOFNWs+1anjzHMrNgFeVWv+UXHk8CG7voyGCtRCZ/9PU34IUaT99EGVi7QzPW4CloyYI
 fQZw==
X-Gm-Message-State: AOAM533gM6xSf/4ri6ejVaCL9pHQP/8jSNOx4Vivq9OAM5zB1zh8Augs
 uX+LOcLPwSfLC+M1mMlOHw==
X-Google-Smtp-Source: ABdhPJz8JPY5CkEY7aN7XL3UgnQu70hde5KTSw8SFaKN1rvcABKSoyOdDs7eNSixYmZsHlMFECV5gw==
X-Received: by 2002:a05:6830:22dc:: with SMTP id
 q28mr3498890otc.336.1617810650540; 
 Wed, 07 Apr 2021 08:50:50 -0700 (PDT)
Received: from serve.minyard.net ([47.184.156.158])
 by smtp.gmail.com with ESMTPSA id g11sm5503281ots.34.2021.04.07.08.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 08:50:49 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:f036:ecd9:2bd0:ef09])
 by serve.minyard.net (Postfix) with ESMTPSA id ECFD1180570;
 Wed,  7 Apr 2021 15:50:47 +0000 (UTC)
Date: Wed, 7 Apr 2021 10:50:46 -0500
From: Corey Minyard <minyard@acm.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v2 2/3] drivers: char: ipmi: Add Aspeed SSIF BMC driver
Message-ID: <20210407155046.GF7166@minyard.net>
References: <20210330141029.20412-1-quan@os.amperecomputing.com>
 <20210330141029.20412-3-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210330141029.20412-3-quan@os.amperecomputing.com>
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
Reply-To: minyard@acm.org
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>,
 Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net,
 Open Source Submission <patches@amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 30, 2021 at 09:10:28PM +0700, Quan Nguyen wrote:
> The SMBus system interface (SSIF) IPMI BMC driver can be used to perform
> in-band IPMI communication with their host in management (BMC) side.
> 
> This commits adds support specifically for Aspeed AST2500 which commonly
> used as Board Management Controllers.

Two major comments:

This needs to be two patches: one with the generic SSIF slave code, and
one with the aspeed-specific code.  It's hard to tell that you are
adding generic code otherwise.

If you are going to add a generic interface like this, you need to add
documentation on how to use it, but from userland and from in the
kernel.

And some other comments:

Did you run this through checkpatch?

I think there is a high-level race condition in this code.  Consider the
following sequence:

  1) host writes a request to the BMC
  2) BMC reads the request
  3) host aborts the operation
  4) host write a new request to the BMC
  5) BMC sends the response to the first message

You probably need something to say that a response can only go out if
there is a request that has come in that has been read by the BMC.

Other comments inline.

> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
>  drivers/char/ipmi/Kconfig           |  22 +
>  drivers/char/ipmi/Makefile          |   2 +
>  drivers/char/ipmi/ssif_bmc.c        | 645 ++++++++++++++++++++++++++++
>  drivers/char/ipmi/ssif_bmc.h        |  92 ++++
>  drivers/char/ipmi/ssif_bmc_aspeed.c | 132 ++++++
>  5 files changed, 893 insertions(+)
>  create mode 100644 drivers/char/ipmi/ssif_bmc.c
>  create mode 100644 drivers/char/ipmi/ssif_bmc.h
>  create mode 100644 drivers/char/ipmi/ssif_bmc_aspeed.c
> 
> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
> index 07847d9a459a..45be57023577 100644
> --- a/drivers/char/ipmi/Kconfig
> +++ b/drivers/char/ipmi/Kconfig
> @@ -133,6 +133,28 @@ config ASPEED_BT_IPMI_BMC
>  	  found on Aspeed SOCs (AST2400 and AST2500). The driver
>  	  implements the BMC side of the BT interface.
>  
> +config SSIF_IPMI_BMC
> +	tristate "SSIF IPMI BMC driver"
> +	select I2C
> +	select I2C_SLAVE
> +	help
> +	  This enables the IPMI SMBus system interface (SSIF) at the
> +	  management (BMC) side.
> +
> +	  The driver implements the BMC side of the SMBus system
> +	  interface (SSIF).
> +
> +config ASPEED_SSIF_IPMI_BMC
> +	depends on ARCH_ASPEED || COMPILE_TEST
> +	select SSIF_IPMI_BMC
> +	tristate "Aspeed SSIF IPMI BMC driver"
> +	help
> +	  Provides a driver for the SSIF IPMI interface found on
> +	  Aspeed AST2500 SoC.
> +
> +	  The driver implements the BMC side of the SMBus system
> +	  interface (SSIF), specific for Aspeed AST2500 SoC.
> +
>  config IPMB_DEVICE_INTERFACE
>  	tristate 'IPMB Interface handler'
>  	depends on I2C
> diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
> index 0822adc2ec41..05b993f7335b 100644
> --- a/drivers/char/ipmi/Makefile
> +++ b/drivers/char/ipmi/Makefile
> @@ -27,3 +27,5 @@ obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
>  obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs_bmc_aspeed.o
>  obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) += kcs_bmc_npcm7xx.o
>  obj-$(CONFIG_IPMB_DEVICE_INTERFACE) += ipmb_dev_int.o
> +obj-$(CONFIG_SSIF_IPMI_BMC) += ssif_bmc.o
> +obj-$(CONFIG_ASPEED_SSIF_IPMI_BMC) += ssif_bmc_aspeed.o
> diff --git a/drivers/char/ipmi/ssif_bmc.c b/drivers/char/ipmi/ssif_bmc.c
> new file mode 100644
> index 000000000000..ae6e8750c795
> --- /dev/null
> +++ b/drivers/char/ipmi/ssif_bmc.c
> @@ -0,0 +1,645 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * The driver for BMC side of SSIF interface
> + *
> + * Copyright (c) 2021, Ampere Computing LLC
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 of
> + * the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <https://www.gnu.org/licenses/>.
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/miscdevice.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/poll.h>
> +#include <linux/sched.h>
> +#include <linux/mutex.h>
> +#include <linux/spinlock.h>
> +
> +#include "ssif_bmc.h"
> +
> +/*
> + * Call in WRITE context
> + */
> +static int send_ssif_bmc_response(struct ssif_bmc_ctx *ssif_bmc, bool non_blocking)
> +{
> +	unsigned long flags;
> +	int ret;
> +
> +	if (!non_blocking) {
> +retry:
> +		ret = wait_event_interruptible(ssif_bmc->wait_queue,
> +					       !ssif_bmc->response_in_progress);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	spin_lock_irqsave(&ssif_bmc->lock, flags);
> +	if (ssif_bmc->response_in_progress) {
> +		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> +		if (non_blocking)
> +			return -EAGAIN;
> +
> +		goto retry;
> +	}

This would be a lot more elegant, and work better, if it was:

	
	spin_lock_irqsave(&ssif_bmc->lock, flags);
	while (ssif_bmc->response_in_progress) {
		if (non_blocking) {
			ret = -EAGAIN;
			goto out_unlock;
		}
		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
		ret = wait_event_interruptible(ssif_bmc->wait_queue,
					       !ssif_bmc->response_in_progress);
		if (ret)
			return ret;
		spin_lock_irqsave(&ssif_bmc->lock, flags);
	}

Same with the receive function.  It avoids calling
wait_event_unnterruptible() unless required, and is easier to read.

> +
> +	/*
> +	 * Check the response data length from userspace to determine the type
> +	 * of the response message whether it is single-part or multi-part.
> +	 */
> +	ssif_bmc->is_singlepart_read =
> +		(ssif_msg_len(&ssif_bmc->response) <= (MAX_PAYLOAD_PER_TRANSACTION + 1)) ?
> +		true : false; /* 1: byte of length */
> +
> +	ssif_bmc->response_in_progress = true;
> +	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> +
> +	return 0;
> +}
> +
> +/*
> + * Call in READ context
> + */
> +static int receive_ssif_bmc_request(struct ssif_bmc_ctx *ssif_bmc, bool non_blocking)
> +{
> +	unsigned long flags;
> +	int ret;
> +
> +	if (!non_blocking) {
> +retry:
> +		ret = wait_event_interruptible(ssif_bmc->wait_queue,
> +					       ssif_bmc->request_available);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	spin_lock_irqsave(&ssif_bmc->lock, flags);
> +	if (!ssif_bmc->request_available) {
> +		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> +		if (non_blocking)
> +			return -EAGAIN;
> +		goto retry;
> +	}
> +	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> +
> +	return 0;
> +}
> +
> +/* Handle SSIF message that will be sent to user */
> +static ssize_t ssif_bmc_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
> +{
> +	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
> +	struct ssif_msg msg;
> +	unsigned long flags;
> +	ssize_t ret;
> +
> +	mutex_lock(&ssif_bmc->file_mutex);

If you are sitting on a blocking read here, there's no way to send a
message, do poll, etc because you use the same mutex.  That doesn't seem
like a good idea.

> +
> +	ret = receive_ssif_bmc_request(ssif_bmc, file->f_flags & O_NONBLOCK);
> +	if (ret < 0)
> +		goto out;

This design has some issues.  I'd recommend getting rid of file_mutex
and only using the spinlock.  Claim the spinlock before calling
receive_ssif_bmc_request(), release the spinlock in that function if you
need to block (and document heavily that you do this), and when it
returns you either have an error or there is a message waiting.

You can actually just get rid of receive_ssif_bmc_request() and inline
the code here, if you like.  That might be easier to read.

> +
> +	spin_lock_irqsave(&ssif_bmc->lock, flags);
> +	count = min_t(ssize_t, count, ssif_msg_len(&ssif_bmc->request));
> +	memcpy(&msg, &ssif_bmc->request, count);
> +	ssif_bmc->request_available = false;
> +	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> +
> +	ret = copy_to_user(buf, &msg, count);
> +out:
> +	mutex_unlock(&ssif_bmc->file_mutex);
> +
> +	return (ret < 0) ? ret : count;
> +}
> +
> +/* Handle SSIF message that is written by user */
> +static ssize_t ssif_bmc_write(struct file *file, const char __user *buf, size_t count,
> +			      loff_t *ppos)
> +{
> +	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
> +	struct ssif_msg msg;
> +	unsigned long flags;
> +	ssize_t ret;
> +
> +	if (count > sizeof(struct ssif_msg))
> +		return -EINVAL;
> +
> +	mutex_lock(&ssif_bmc->file_mutex);
> +
> +	ret = copy_from_user(&msg, buf, count);
> +	if (ret)
> +		goto out;

Same basic comments as the read side.  There is no need, BTW, to grab
the mutex before calling copy_from_user, since it's going into an
internal message buffer.

Speaking of that, ssif_msg is moderately big.  It's probably ok in this
case, but putting big things on the stack is generally frowned upon.

> +
> +	spin_lock_irqsave(&ssif_bmc->lock, flags);
> +	if (count >= ssif_msg_len(&ssif_bmc->response))
> +		memcpy(&ssif_bmc->response, &msg, count);
> +	else
> +		ret = -EINVAL;
> +	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> +
> +	if (ret)
> +		goto out;
> +
> +	ret = send_ssif_bmc_response(ssif_bmc, file->f_flags & O_NONBLOCK);
> +	if (!ret && ssif_bmc->set_ssif_bmc_status)
> +		ssif_bmc->set_ssif_bmc_status(ssif_bmc, SSIF_BMC_READY);
> +out:
> +	mutex_unlock(&ssif_bmc->file_mutex);
> +
> +	return (ret < 0) ? ret : count;
> +}
> +
> +static long ssif_bmc_ioctl(struct file *file, unsigned int cmd, unsigned long param)
> +{
> +	return 0;

I believe -EINVAL is the right return value here.  Or just remove the
function; it's not necessary if not implemented.

> +}
> +
> +static unsigned int ssif_bmc_poll(struct file *file, poll_table *wait)
> +{
> +	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
> +	unsigned int mask = 0;
> +
> +	mutex_lock(&ssif_bmc->file_mutex);

With this above comments, this will need to claim the spinlock.  Which
is what you want, anyway, because request_available is set under the
spinlock.

> +	poll_wait(file, &ssif_bmc->wait_queue, wait);
> +
> +	/*
> +	 * The request message is now available so userspace application can
> +	 * get the request
> +	 */
> +	if (ssif_bmc->request_available)
> +		mask |= POLLIN;

Is there a reason you don't implement the write side of this?  That
would seem useful.  Otherwise what's the write side supposed to do if it
gets an EAGAIN from the write()?  I guess, given how this driver works,
that's not really possible if it's used correctly.  But it would provide
a way to know when a response has finished send.

> +
> +	mutex_unlock(&ssif_bmc->file_mutex);
> +	return mask;
> +}
> +
> +/*
> + * System calls to device interface for user apps
> + */
> +static const struct file_operations ssif_bmc_fops = {
> +	.owner		= THIS_MODULE,
> +	.read		= ssif_bmc_read,
> +	.write		= ssif_bmc_write,
> +	.poll		= ssif_bmc_poll,
> +	.unlocked_ioctl	= ssif_bmc_ioctl,
> +};
> +
> +/* Called with ssif_bmc->lock held. */
> +static int handle_request(struct ssif_bmc_ctx *ssif_bmc)
> +{
> +	if (ssif_bmc->set_ssif_bmc_status)
> +		ssif_bmc->set_ssif_bmc_status(ssif_bmc, SSIF_BMC_BUSY);
> +
> +	/* Request message is available to process */
> +	ssif_bmc->request_available = true;
> +	/*
> +	 * This is the new READ request.
> +	 * Clear the response buffer of the previous transaction
> +	 */
> +	memset(&ssif_bmc->response, 0, sizeof(struct ssif_msg));

This memset doesn't seem necessary.  You don't need to clear the data, I
don't think.

> +	wake_up_all(&ssif_bmc->wait_queue);
> +	return 0;
> +}
> +
> +/* Called with ssif_bmc->lock held. */
> +static int complete_response(struct ssif_bmc_ctx *ssif_bmc)
> +{
> +	/* Invalidate response in buffer to denote it having been sent. */
> +	ssif_bmc->response.len = 0;
> +	ssif_bmc->response_in_progress = false;
> +	ssif_bmc->nbytes_processed = 0;
> +	ssif_bmc->remain_len = 0;
> +	memset(&ssif_bmc->response_buf, 0, MAX_PAYLOAD_PER_TRANSACTION);

This memset seems unnecessary.

> +	wake_up_all(&ssif_bmc->wait_queue);
> +	return 0;
> +}
> +
> +static void set_multipart_response_buffer(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> +{
> +	u8 response_len = 0;
> +	int idx = 0;
> +	u8 data_len;
> +
> +	data_len = ssif_bmc->response.len;
> +	switch (ssif_bmc->smbus_cmd) {
> +	case SSIF_IPMI_MULTIPART_READ_START:
> +		/*
> +		 * Read Start length is 32 bytes.
> +		 * Read Start transfer first 30 bytes of IPMI response
> +		 * and 2 special code 0x00, 0x01.
> +		 */
> +		*val = MAX_PAYLOAD_PER_TRANSACTION;
> +		ssif_bmc->remain_len = data_len - MAX_IPMI_DATA_PER_START_TRANSACTION;
> +		ssif_bmc->block_num = 0;
> +
> +		ssif_bmc->response_buf[idx++] = 0x00; /* Start Flag */
> +		ssif_bmc->response_buf[idx++] = 0x01; /* Start Flag */
> +		ssif_bmc->response_buf[idx++] = ssif_bmc->response.netfn_lun;
> +		ssif_bmc->response_buf[idx++] = ssif_bmc->response.cmd;
> +		ssif_bmc->response_buf[idx++] = ssif_bmc->response.payload[0];
> +
> +		response_len = MAX_PAYLOAD_PER_TRANSACTION - idx;
> +
> +		memcpy(&ssif_bmc->response_buf[idx], &ssif_bmc->response.payload[1],
> +		       response_len);
> +		break;
> +
> +	case SSIF_IPMI_MULTIPART_READ_MIDDLE:
> +		/*
> +		 * IPMI READ Middle or READ End messages can carry up to 31 bytes
> +		 * IPMI data plus block number byte.
> +		 */
> +		if (ssif_bmc->remain_len < MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION) {
> +			/*
> +			 * This is READ End message
> +			 *  Return length is the remaining response data length
> +			 *  plus block number
> +			 *  Block number 0xFF is to indicate this is last message
> +			 *
> +			 * Return length is: remain response plus block number
> +			 */
> +			*val = ssif_bmc->remain_len + 1;
> +			ssif_bmc->block_num = 0xFF;
> +			ssif_bmc->response_buf[idx++] = ssif_bmc->block_num;
> +			response_len = ssif_bmc->remain_len;
> +		} else {
> +			/*
> +			 * This is READ Middle message
> +			 *  Response length is the maximum SMBUS transfer length
> +			 *  Block number byte is incremented
> +			 * Return length is maximum SMBUS transfer length
> +			 */
> +			*val = MAX_PAYLOAD_PER_TRANSACTION;
> +			ssif_bmc->remain_len -= MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION;
> +			response_len = MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION;
> +			ssif_bmc->response_buf[idx++] = ssif_bmc->block_num;
> +			ssif_bmc->block_num++;
> +		}
> +
> +		memcpy(&ssif_bmc->response_buf[idx],
> +		       ssif_bmc->response.payload + 1 + ssif_bmc->nbytes_processed,
> +		       response_len);
> +		break;
> +
> +	default:
> +		/* Do not expect to go to this case */
> +		pr_err("Error: Unexpected SMBus command received 0x%x\n", ssif_bmc->smbus_cmd);
> +		break;
> +	}
> +
> +	ssif_bmc->nbytes_processed += response_len;
> +}
> +
> +static void set_singlepart_response_buffer(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> +{
> +	u8 *buf = (u8 *)&ssif_bmc->response;
> +
> +	/*
> +	 * Do not expect the IPMI response has data length 0.
> +	 * With some I2C SMBus controllers (Aspeed I2C), return 0 for
> +	 * the SMBus Read Request callback might cause bad state for
> +	 * the bus. So return 1 byte length so that master will
> +	 * resend the Read Request because the length of response is
> +	 * less than a normal IPMI response.
> +	 *
> +	 * Otherwise, return the length of IPMI response

Umm, shouldn't you reject zero length messages from the user, since that
is invalid?  Then this problem would go away.

> +	 */
> +	*val = (buf[ssif_bmc->msg_idx]) ? buf[ssif_bmc->msg_idx] : 0x1;
> +}
> +
> +/* Process the IPMI response that will be read by master */
> +static void handle_read_processed(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> +{
> +	u8 *buf;
> +	u8 pec_len, addr, len;
> +	u8 pec = 0;
> +
> +	pec_len = ssif_bmc->pec_support ? 1 : 0;
> +	/* PEC - Start Read Address */
> +	addr = GET_8BIT_ADDR(ssif_bmc->client->addr);
> +	pec = i2c_smbus_pec(pec, &addr, 1);
> +	/* PEC - SSIF Command */
> +	pec = i2c_smbus_pec(pec, &ssif_bmc->smbus_cmd, 1);
> +	/* PEC - Restart Write Address */
> +	addr = addr | 0x01;
> +	pec = i2c_smbus_pec(pec, &addr, 1);
> +
> +	if (ssif_bmc->is_singlepart_read) {
> +		/* Single-part Read processing */
> +		buf = (u8 *)&ssif_bmc->response;
> +
> +		if (ssif_bmc->response.len && ssif_bmc->msg_idx < ssif_bmc->response.len) {
> +			ssif_bmc->msg_idx++;
> +			*val = buf[ssif_bmc->msg_idx];
> +		} else if (ssif_bmc->response.len &&
> +			   (ssif_bmc->msg_idx == ssif_bmc->response.len)) {
> +			ssif_bmc->msg_idx++;
> +			*val = i2c_smbus_pec(pec, buf, ssif_msg_len(&ssif_bmc->response));
> +		} else {
> +			*val = 0;
> +		}
> +		/* Invalidate response buffer to denote it is sent */
> +		if (ssif_bmc->msg_idx + 1 >= (ssif_msg_len(&ssif_bmc->response) + pec_len))
> +			complete_response(ssif_bmc);
> +	} else {
> +		/* Multi-part Read processing */
> +		switch (ssif_bmc->smbus_cmd) {
> +		case SSIF_IPMI_MULTIPART_READ_START:
> +		case SSIF_IPMI_MULTIPART_READ_MIDDLE:
> +			buf = (u8 *)&ssif_bmc->response_buf;
> +			*val = buf[ssif_bmc->msg_idx];
> +			ssif_bmc->msg_idx++;
> +			break;
> +		default:
> +			/* Do not expect to go to this case */
> +			pr_err("Error: Unexpected SMBus command received 0x%x\n",
> +			       ssif_bmc->smbus_cmd);
> +			break;
> +		}
> +		len = (ssif_bmc->block_num == 0xFF) ?
> +		       ssif_bmc->remain_len + 1 : MAX_PAYLOAD_PER_TRANSACTION;
> +		if (ssif_bmc->msg_idx == (len + 1)) {
> +			pec = i2c_smbus_pec(pec, &len, 1);
> +			*val = i2c_smbus_pec(pec, ssif_bmc->response_buf, len);
> +		}
> +		/* Invalidate response buffer to denote last response is sent */
> +		if (ssif_bmc->block_num == 0xFF &&
> +		    ssif_bmc->msg_idx > (ssif_bmc->remain_len + pec_len)) {
> +			complete_response(ssif_bmc);
> +		}
> +	}
> +}
> +
> +static void handle_write_received(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> +{
> +	u8 *buf;
> +	u8 smbus_cmd;
> +
> +	buf = (u8 *)&ssif_bmc->request;
> +	if (ssif_bmc->msg_idx >= sizeof(struct ssif_msg))
> +		return;
> +
> +	smbus_cmd = ssif_bmc->smbus_cmd;
> +	switch (smbus_cmd) {
> +	case SSIF_IPMI_SINGLEPART_WRITE:
> +		/* Single-part write */
> +		buf[ssif_bmc->msg_idx - 1] = *val;
> +		ssif_bmc->msg_idx++;
> +
> +		break;
> +	case SSIF_IPMI_MULTIPART_WRITE_START:
> +		/* Reset length to zero */
> +		if (ssif_bmc->msg_idx == 1)
> +			ssif_bmc->request.len = 0;
> +
> +		fallthrough;
> +	case SSIF_IPMI_MULTIPART_WRITE_MIDDLE:
> +	case SSIF_IPMI_MULTIPART_WRITE_END:
> +		/* Multi-part write, 2nd byte received is length */
> +		if (ssif_bmc->msg_idx == 1) {
> +			ssif_bmc->request.len += *val;
> +			ssif_bmc->recv_len = *val;
> +		} else {
> +			buf[ssif_bmc->msg_idx - 1 +
> +			    ssif_bmc->request.len - ssif_bmc->recv_len]	= *val;
> +		}
> +
> +		ssif_bmc->msg_idx++;
> +
> +		break;
> +	default:
> +		/* Do not expect to go to this case */
> +		pr_err("Error: Unexpected SMBus command received 0x%x\n", ssif_bmc->smbus_cmd);
> +		break;
> +	}
> +}
> +
> +static bool validate_pec(struct ssif_bmc_ctx *ssif_bmc)
> +{
> +	u8 rpec = 0, cpec = 0;
> +	bool ret = true;
> +	u8 addr, index;
> +	u8 *buf;
> +
> +	buf = (u8 *)&ssif_bmc->request;
> +	switch (ssif_bmc->smbus_cmd) {
> +	case SSIF_IPMI_SINGLEPART_WRITE:
> +		if ((ssif_bmc->msg_idx - 1) == ssif_msg_len(&ssif_bmc->request)) {
> +			/* PEC is not included */
> +			ssif_bmc->pec_support = false;
> +			return true;
> +		}
> +
> +		if ((ssif_bmc->msg_idx - 1) != (ssif_msg_len(&ssif_bmc->request) + 1))
> +			goto error;
> +
> +		/* PEC is included */
> +		ssif_bmc->pec_support = true;
> +		rpec = buf[ssif_bmc->msg_idx - 2];
> +		addr = GET_8BIT_ADDR(ssif_bmc->client->addr);
> +		cpec = i2c_smbus_pec(cpec, &addr, 1);
> +		cpec = i2c_smbus_pec(cpec, &ssif_bmc->smbus_cmd, 1);
> +		cpec = i2c_smbus_pec(cpec, buf, ssif_msg_len(&ssif_bmc->request));
> +		if (rpec != cpec) {
> +			pr_err("Bad PEC 0x%02x vs. 0x%02x\n", rpec, cpec);
> +			ret = false;
> +		}
> +
> +		break;
> +	case SSIF_IPMI_MULTIPART_WRITE_START:
> +	case SSIF_IPMI_MULTIPART_WRITE_MIDDLE:
> +	case SSIF_IPMI_MULTIPART_WRITE_END:
> +		index = ssif_bmc->request.len - ssif_bmc->recv_len;
> +		if ((ssif_bmc->msg_idx - 1 + index) == ssif_msg_len(&ssif_bmc->request)) {
> +			/* PEC is not included */
> +			ssif_bmc->pec_support = false;
> +			return true;
> +		}
> +
> +		if ((ssif_bmc->msg_idx - 1 + index) != (ssif_msg_len(&ssif_bmc->request) + 1))
> +			goto error;
> +
> +		/* PEC is included */
> +		ssif_bmc->pec_support = true;
> +		rpec = buf[ssif_bmc->msg_idx - 2 + index];
> +		addr = GET_8BIT_ADDR(ssif_bmc->client->addr);
> +		cpec = i2c_smbus_pec(cpec, &addr, 1);
> +		cpec = i2c_smbus_pec(cpec, &ssif_bmc->smbus_cmd, 1);
> +		cpec = i2c_smbus_pec(cpec, &ssif_bmc->recv_len, 1);
> +		/* As SMBus specification does not allow the length
> +		 * (byte count) in the Write-Block protocol to be zero.
> +		 * Therefore, it is illegal to have the last Middle
> +		 * transaction in the sequence carry 32-bytes and have
> +		 * a length of ‘0’ in the End transaction.
> +		 * But some users may try to use this way and we should
> +		 * prevent ssif_bmc driver broken in this case.
> +		 */
> +		if (ssif_bmc->recv_len != 0)
> +			cpec = i2c_smbus_pec(cpec, buf + 1 + index, ssif_bmc->recv_len);
> +
> +		if (rpec != cpec) {
> +			pr_err("Bad PEC 0x%02x vs. 0x%02x\n", rpec, cpec);
> +			ret = false;
> +		}
> +
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return ret;
> +error:
> +	/* Do not expect to go to this case */
> +	pr_err("Error: Unexpected length received %d\n", ssif_msg_len(&ssif_bmc->request));
> +
> +	return false;
> +}
> +
> +static void complete_write_received(struct ssif_bmc_ctx *ssif_bmc)
> +{
> +	u8 cmd = ssif_bmc->smbus_cmd;
> +
> +	/* A BMC that receives an invalid PEC shall drop the data for the write
> +	 * transaction and any further transactions (read or write) until
> +	 * the next valid read or write Start transaction is received
> +	 */
> +	if (!validate_pec(ssif_bmc)) {
> +		pr_err("Received invalid PEC\n");
> +		return;
> +	}
> +
> +	if (cmd == SSIF_IPMI_SINGLEPART_WRITE || cmd == SSIF_IPMI_MULTIPART_WRITE_END)
> +		handle_request(ssif_bmc);
> +}
> +
> +/*
> + * Callback function to handle I2C slave events
> + */
> +static int ssif_bmc_cb(struct i2c_client *client, enum i2c_slave_event event, u8 *val)
> +{
> +	struct ssif_bmc_ctx *ssif_bmc = i2c_get_clientdata(client);
> +
> +	spin_lock(&ssif_bmc->lock);

You need the _irqsave version here.  You don't know if interrupts are
disabled or not.  Depends on the particular low-level driver.

> +
> +	/* I2C Event Handler:
> +	 *   I2C_SLAVE_READ_REQUESTED	0x0
> +	 *   I2C_SLAVE_WRITE_REQUESTED	0x1
> +	 *   I2C_SLAVE_READ_PROCESSED	0x2
> +	 *   I2C_SLAVE_WRITE_RECEIVED	0x3
> +	 *   I2C_SLAVE_STOP		0x4
> +	 */
> +	switch (event) {
> +	case I2C_SLAVE_READ_REQUESTED:

Shouldn't you NAK if you are expecting a read?

> +		ssif_bmc->msg_idx = 0;
> +		if (ssif_bmc->is_singlepart_read)
> +			set_singlepart_response_buffer(ssif_bmc, val);
> +		else
> +			set_multipart_response_buffer(ssif_bmc, val);
> +		break;
> +
> +	case I2C_SLAVE_WRITE_REQUESTED:

If this happens and you are sending a response, you need to clean up.
In fact, all of these commands need handling if they aren't expected.

> +		ssif_bmc->msg_idx = 0;
> +		break;
> +
> +	case I2C_SLAVE_READ_PROCESSED:
> +		handle_read_processed(ssif_bmc, val);
> +		break;
> +
> +	case I2C_SLAVE_WRITE_RECEIVED:
> +		/*
> +		 * First byte is SMBUS command, not a part of SSIF message.
> +		 * SSIF request buffer starts with msg_idx 1 for the first
> +		 *  buffer byte.
> +		 */
> +		if (ssif_bmc->msg_idx == 0) {
> +			/* SMBUS command can vary (single or multi-part) */
> +			ssif_bmc->smbus_cmd = *val;
> +			ssif_bmc->msg_idx++;
> +		} else {
> +			handle_write_received(ssif_bmc, val);
> +		}
> +
> +		break;
> +
> +	case I2C_SLAVE_STOP:
> +		/*
> +		 * PEC byte is appended at the end of each transaction.
> +		 * Detect PEC is support or not after receiving write request
> +		 * completely.
> +		 */
> +		if (ssif_bmc->last_event == I2C_SLAVE_WRITE_RECEIVED)
> +			complete_write_received(ssif_bmc);
> +		/* Reset message index */
> +		ssif_bmc->msg_idx = 0;
> +		break;
> +
> +	default:
> +		break;
> +	}
> +	ssif_bmc->last_event = event;
> +	spin_unlock(&ssif_bmc->lock);
> +
> +	return 0;
> +}
> +
> +struct ssif_bmc_ctx *ssif_bmc_alloc(struct i2c_client *client, int sizeof_priv)
> +{
> +	struct ssif_bmc_ctx *ssif_bmc;
> +	int ret;
> +
> +	ssif_bmc = devm_kzalloc(&client->dev, sizeof(*ssif_bmc) + sizeof_priv, GFP_KERNEL);
> +	if (!ssif_bmc)
> +		return ERR_PTR(-ENOMEM);
> +
> +	spin_lock_init(&ssif_bmc->lock);
> +
> +	init_waitqueue_head(&ssif_bmc->wait_queue);
> +	ssif_bmc->request_available = false;
> +	ssif_bmc->response_in_progress = false;
> +
> +	mutex_init(&ssif_bmc->file_mutex);
> +
> +	/* Register misc device interface */
> +	ssif_bmc->miscdev.minor = MISC_DYNAMIC_MINOR;
> +	ssif_bmc->miscdev.name = DEVICE_NAME;
> +	ssif_bmc->miscdev.fops = &ssif_bmc_fops;
> +	ssif_bmc->miscdev.parent = &client->dev;
> +	ret = misc_register(&ssif_bmc->miscdev);
> +	if (ret)
> +		goto out;
> +
> +	ssif_bmc->client = client;
> +	ssif_bmc->client->flags |= I2C_CLIENT_SLAVE;
> +
> +	/* Register I2C slave */
> +	i2c_set_clientdata(client, ssif_bmc);
> +	ret = i2c_slave_register(client, ssif_bmc_cb);
> +	if (ret) {
> +		misc_deregister(&ssif_bmc->miscdev);
> +		goto out;
> +	}
> +
> +	return ssif_bmc;
> +
> +out:
> +	devm_kfree(&client->dev, ssif_bmc);
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL(ssif_bmc_alloc);
> +
> +MODULE_AUTHOR("Chuong Tran <chuong@os.amperecomputing.com>");
> +MODULE_AUTHOR("Quan Nguyen <quan@os.amperecomputing.com>");
> +MODULE_DESCRIPTION("Linux device driver of the BMC IPMI SSIF interface.");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/char/ipmi/ssif_bmc.h b/drivers/char/ipmi/ssif_bmc.h
> new file mode 100644
> index 000000000000..a2ee090572db
> --- /dev/null
> +++ b/drivers/char/ipmi/ssif_bmc.h
> @@ -0,0 +1,92 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * The driver for BMC side of SSIF interface
> + *
> + * Copyright (c) 2021, Ampere Computing LLC
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 of
> + * the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <https://www.gnu.org/licenses/>.
> + */
> +#ifndef __SSIF_BMC_H__
> +#define __SSIF_BMC_H__
> +
> +#define DEVICE_NAME				"ipmi-ssif-host"
> +
> +#define GET_8BIT_ADDR(addr_7bit)		(((addr_7bit) << 1) & 0xff)
> +
> +#define MSG_PAYLOAD_LEN_MAX			252
> +
> +/* A standard SMBus Transaction is limited to 32 data bytes */
> +#define MAX_PAYLOAD_PER_TRANSACTION		32
> +
> +#define MAX_IPMI_DATA_PER_START_TRANSACTION	30
> +#define MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION	31
> +
> +#define SSIF_IPMI_SINGLEPART_WRITE		0x2
> +#define SSIF_IPMI_SINGLEPART_READ		0x3
> +#define SSIF_IPMI_MULTIPART_WRITE_START		0x6
> +#define SSIF_IPMI_MULTIPART_WRITE_MIDDLE	0x7
> +#define SSIF_IPMI_MULTIPART_WRITE_END		0x8
> +#define SSIF_IPMI_MULTIPART_READ_START		0x3
> +#define SSIF_IPMI_MULTIPART_READ_MIDDLE		0x9
> +
> +struct ssif_msg {
> +	u8 len;
> +	u8 netfn_lun;
> +	u8 cmd;
> +	u8 payload[MSG_PAYLOAD_LEN_MAX];
> +} __packed;
> +
> +static inline u32 ssif_msg_len(struct ssif_msg *ssif_msg)
> +{
> +	return ssif_msg->len + 1;
> +}
> +
> +#define SSIF_BMC_BUSY   0x01
> +#define SSIF_BMC_READY  0x02
> +
> +struct ssif_bmc_ctx {
> +	struct i2c_client	*client;
> +	struct miscdevice	miscdev;
> +	u8			smbus_cmd;
> +	struct ssif_msg		request;
> +	bool			request_available;
> +	struct ssif_msg		response;
> +	bool			response_in_progress;
> +	/* Response buffer for Multi-part Read Transaction */
> +	u8			response_buf[MAX_PAYLOAD_PER_TRANSACTION];
> +	/* Flag to identify a Multi-part Read Transaction */
> +	bool			is_singlepart_read;
> +	u8			nbytes_processed;
> +	u8			remain_len;
> +	u8			recv_len;
> +	/* Block Number of a Multi-part Read Transaction */
> +	u8			block_num;
> +	size_t			msg_idx;
> +	enum i2c_slave_event	last_event;
> +	bool			pec_support;
> +	spinlock_t		lock;
> +	wait_queue_head_t	wait_queue;
> +	struct mutex		file_mutex;
> +	void (*set_ssif_bmc_status)(struct ssif_bmc_ctx *ssif_bmc, unsigned int flags);
> +	void			*priv;
> +};
> +
> +static inline struct ssif_bmc_ctx *to_ssif_bmc(struct file *file)
> +{
> +	return container_of(file->private_data, struct ssif_bmc_ctx, miscdev);
> +}
> +
> +struct ssif_bmc_ctx *ssif_bmc_alloc(struct i2c_client *client, int sizeof_priv);
> +
> +#endif /* __SSIF_BMC_H__ */
> diff --git a/drivers/char/ipmi/ssif_bmc_aspeed.c b/drivers/char/ipmi/ssif_bmc_aspeed.c
> new file mode 100644
> index 000000000000..a563fcff5acc
> --- /dev/null
> +++ b/drivers/char/ipmi/ssif_bmc_aspeed.c
> @@ -0,0 +1,132 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * The driver for BMC side of Aspeed SSIF interface
> + *
> + * Copyright (c) 2021, Ampere Computing LLC
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 of
> + * the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <https://www.gnu.org/licenses/>.
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/miscdevice.h>
> +#include <linux/module.h>
> +#include <linux/poll.h>
> +#include <linux/iopoll.h>
> +
> +#include "ssif_bmc.h"
> +
> +struct aspeed_i2c_bus {
> +	struct i2c_adapter              adap;
> +	struct device                   *dev;
> +	void __iomem                    *base;
> +	struct reset_control            *rst;
> +	/* Synchronizes I/O mem access to base. */
> +	spinlock_t                      lock;
> +};
> +
> +#define ASPEED_I2C_INTR_CTRL_REG	0x0c
> +#define ASPEED_I2CD_INTR_SLAVE_MATCH	BIT(7)
> +#define ASPEED_I2CD_INTR_RX_DONE	BIT(2)
> +static void aspeed_i2c_enable_interrupt(struct aspeed_i2c_bus *bus, unsigned long mask)
> +{
> +	unsigned long current_mask;
> +
> +	current_mask = readl(bus->base + ASPEED_I2C_INTR_CTRL_REG);
> +	writel(current_mask | mask, bus->base + ASPEED_I2C_INTR_CTRL_REG);
> +}
> +
> +static void aspeed_i2c_disable_interrupt(struct aspeed_i2c_bus *bus, unsigned long mask)
> +{
> +	unsigned long current_mask;
> +
> +	current_mask = readl(bus->base + ASPEED_I2C_INTR_CTRL_REG);
> +	writel(current_mask & ~mask, bus->base + ASPEED_I2C_INTR_CTRL_REG);

If there's any other driver that using this register, you are racing
with it.

> +}
> +
> +static void aspeed_set_ssif_bmc_status(struct ssif_bmc_ctx *ssif_bmc, unsigned int status)
> +{
> +	struct aspeed_i2c_bus *bus;
> +	unsigned long flags;
> +
> +	bus = (struct aspeed_i2c_bus *)ssif_bmc->priv;
> +	if (!bus)
> +		return;
> +
> +	spin_lock_irqsave(&bus->lock, flags);

I don't really understand the whole use of this interrupt disable.  What
happens if the host has decided to abort an operation and starts a new
one?  I would think you would want to handle that gracefully.  As it is,
you will sit there waiting for the host to read the response, and it
never will, and you will never get the new transaction.

Plus these don't seem to be interrupts, they seem to be base I2C
disables, which you would really want handled in the I2C driver itself.

I would recommend getting rid of all this and handling a new request
if it comes in.  Then you can just create a generic SSIF BMC compatible
that will work for anything.  Really, if the host has sent a new
message, you need to handle it.

> +
> +	if (status & SSIF_BMC_BUSY) {
> +		/* Ignore RX_DONE and SLAVE_MATCH when slave busy processing */
> +		aspeed_i2c_disable_interrupt(bus, ASPEED_I2CD_INTR_RX_DONE);
> +		aspeed_i2c_disable_interrupt(bus, ASPEED_I2CD_INTR_SLAVE_MATCH);

Why wouldn't you combine these into one call and or the values together?

> +	} else if (status & SSIF_BMC_READY) {
> +		/* Enable RX_DONE and SLAVE_MATCH when slave ready */
> +		aspeed_i2c_enable_interrupt(bus, ASPEED_I2CD_INTR_RX_DONE);
> +		aspeed_i2c_enable_interrupt(bus, ASPEED_I2CD_INTR_SLAVE_MATCH);
> +	}
> +
> +	spin_unlock_irqrestore(&bus->lock, flags);
> +}
> +
> +static int ssif_bmc_probe(struct i2c_client *client, const struct i2c_device_id *id)
> +{
> +	struct ssif_bmc_ctx *ssif_bmc;
> +
> +	ssif_bmc = ssif_bmc_alloc(client, sizeof(struct aspeed_i2c_bus));
> +	if (IS_ERR(ssif_bmc))
> +		return PTR_ERR(ssif_bmc);
> +
> +	ssif_bmc->priv = i2c_get_adapdata(client->adapter);
> +	ssif_bmc->set_ssif_bmc_status = aspeed_set_ssif_bmc_status;
> +
> +	return 0;
> +}
> +
> +static int ssif_bmc_remove(struct i2c_client *client)
> +{
> +	struct ssif_bmc_ctx *ssif_bmc = i2c_get_clientdata(client);
> +
> +	i2c_slave_unregister(client);
> +	misc_deregister(&ssif_bmc->miscdev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ssif_bmc_match[] = {
> +	{ .compatible = "aspeed,ast2500-ssif-bmc" },
> +	{ },
> +};
> +
> +static const struct i2c_device_id ssif_bmc_id[] = {
> +	{ DEVICE_NAME, 0 },
> +	{ },
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, ssif_bmc_id);
> +
> +static struct i2c_driver ssif_bmc_driver = {
> +	.driver		= {
> +		.name		= DEVICE_NAME,
> +		.of_match_table = ssif_bmc_match,
> +	},
> +	.probe		= ssif_bmc_probe,
> +	.remove		= ssif_bmc_remove,
> +	.id_table	= ssif_bmc_id,
> +};
> +
> +module_i2c_driver(ssif_bmc_driver);
> +
> +MODULE_AUTHOR("Chuong Tran <chuong@os.amperecomputing.com>");
> +MODULE_AUTHOR("Quan Nguyen <quan@os.amperecomputing.com>");
> +MODULE_DESCRIPTION("Linux device driver of Aspeed BMC IPMI SSIF interface.");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.28.0
> 
