Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D78A9388E18
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 14:31:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlXKX684wz2ykM
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 22:31:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mS6dszP8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::333;
 helo=mail-ot1-x333.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mS6dszP8; dkim-atps=neutral
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlXK81gXlz2yQy;
 Wed, 19 May 2021 22:30:49 +1000 (AEST)
Received: by mail-ot1-x333.google.com with SMTP id
 i14-20020a9d624e0000b029033683c71999so407746otk.5; 
 Wed, 19 May 2021 05:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=aKHr+1V+CDnfzSzbLj1hWsDUAY0cmFm/k2Vt/tEA6F8=;
 b=mS6dszP8bCc2Bg+C3HNJ90znzhnOLWLPWwIiOluenf/xCXlIEpAtt+46phu38p/Fwd
 6eEb0hNH6g4T4MKxxgIqyzCgBs5WHfUPY9TSeC4WbfBgHoGSFDc/UDmAK9E9CA0wX7O6
 z1J375Xmxq3LEb8QdLdZq8p5gFtUJS37C6E5P/+LYy2eqqNXQ0wlx8i0x1QmkWMizQ9x
 lqIxiiVb+5xD0JXUb9HkN4lQ81/NM71gwLE8cldY/aXtY4jpVAVhiLNUSgZvpuEV5QCc
 YUsCH/Dm9kwzqk48pzrWSDZzVvK5crEW+Np/tcOrpSIMQqgc/KxFD/NlKXezFylBmXYh
 poow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=aKHr+1V+CDnfzSzbLj1hWsDUAY0cmFm/k2Vt/tEA6F8=;
 b=ZetJ2cSMISdKjS0ThJT6owAk+fGdSHmb2YYEY6I9Mon26k9N4iNt6gO/b744yoCyPL
 bI1N4P/2BkDvlp5rwrL0SD1+6BH/H6ln+4YxsG8EMNX2G0e9iRSeFIz2twuNWMjtTORN
 LA+Za0ZpGoOsT7fEil0qMbwJ4bUU2HTeR6UrkfB/aSZFRfFJpvqdsTL3cZvVmoO7dqQG
 B9cOMH6fDve50LDqIKh0o1t4TvVJoWAzXoTKDKue//FAhhIDV+kR0FIOVCZxMTh7RDe2
 6yXaLk5HVlinKl9F9UPX6C+iMVP79eydeYZqLDI+4zDPZA1Y9GyFLC86JvvozzB8Lr5/
 TUrA==
X-Gm-Message-State: AOAM5308T4bq4WCpDwiliKNn3xGsS+PD1Q1dmZ10RfN3allMwE/JPwVW
 sROL5tHGlxrqj+pO2bdYRA==
X-Google-Smtp-Source: ABdhPJxOhBgHwUIx0RCQQWzAVbOph3yRvDgdajDuJH9n960Otk/URTgPiiYCbnqV6/LOlbQctg972Q==
X-Received: by 2002:a05:6830:18fb:: with SMTP id
 d27mr8529362otf.235.1621427445589; 
 Wed, 19 May 2021 05:30:45 -0700 (PDT)
Received: from serve.minyard.net ([47.184.156.158])
 by smtp.gmail.com with ESMTPSA id r2sm4471424otq.28.2021.05.19.05.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 05:30:44 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:9144:ba66:ea13:f260])
 by serve.minyard.net (Postfix) with ESMTPSA id 6AFE818000C;
 Wed, 19 May 2021 12:30:43 +0000 (UTC)
Date: Wed, 19 May 2021 07:30:42 -0500
From: Corey Minyard <minyard@acm.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v3 2/7] ipmi: ssif_bmc: Add SSIF BMC driver
Message-ID: <20210519123042.GF2921206@minyard.net>
References: <20210519074934.20712-1-quan@os.amperecomputing.com>
 <20210519074934.20712-3-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210519074934.20712-3-quan@os.amperecomputing.com>
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
 Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org,
 Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net,
 Open Source Submission <patches@amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, May 19, 2021 at 02:49:29PM +0700, Quan Nguyen wrote:
> The SMBus system interface (SSIF) IPMI BMC driver can be used to perform
> in-band IPMI communication with their host in management (BMC) side.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> v3:
>   + Removed redundant license info [Joel]
>   + Switched to use traditional if-else [Joel]
>   + Removed unused ssif_bmc_ioctl() [Joel]
>   + Made handle_request()/complete_response() to return void [Joel]
>   + Refactored send_ssif_bmc_response()/receive_ssif_bmc_request() [Corey]
>   + Removed mutex [Corey]
>   + Use spin_lock/unlock_irqsave/restore in callback [Corey]
>   + Removed the unnecessary memset [Corey]
>   + Switch to use dev_err() [Corey]
> 
> v2:
>   + Fixed compiling error with COMPILE_TEST for arc
> 
>  drivers/char/ipmi/Kconfig    |  11 +
>  drivers/char/ipmi/Makefile   |   1 +
>  drivers/char/ipmi/ssif_bmc.c | 605 +++++++++++++++++++++++++++++++++++
>  drivers/char/ipmi/ssif_bmc.h |  93 ++++++
>  4 files changed, 710 insertions(+)
>  create mode 100644 drivers/char/ipmi/ssif_bmc.c
>  create mode 100644 drivers/char/ipmi/ssif_bmc.h
> 
> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
> index 07847d9a459a..ad5c5161bcd6 100644
> --- a/drivers/char/ipmi/Kconfig
> +++ b/drivers/char/ipmi/Kconfig
> @@ -133,6 +133,17 @@ config ASPEED_BT_IPMI_BMC
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
>  config IPMB_DEVICE_INTERFACE
>  	tristate 'IPMB Interface handler'
>  	depends on I2C
> diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
> index 0822adc2ec41..d04a214d74c4 100644
> --- a/drivers/char/ipmi/Makefile
> +++ b/drivers/char/ipmi/Makefile
> @@ -27,3 +27,4 @@ obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
>  obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs_bmc_aspeed.o
>  obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) += kcs_bmc_npcm7xx.o
>  obj-$(CONFIG_IPMB_DEVICE_INTERFACE) += ipmb_dev_int.o
> +obj-$(CONFIG_SSIF_IPMI_BMC) += ssif_bmc.o
> diff --git a/drivers/char/ipmi/ssif_bmc.c b/drivers/char/ipmi/ssif_bmc.c
> new file mode 100644
> index 000000000000..d0ea7059b1db
> --- /dev/null
> +++ b/drivers/char/ipmi/ssif_bmc.c
> @@ -0,0 +1,605 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * The driver for BMC side of SSIF interface
> + *
> + * Copyright (c) 2021, Ampere Computing LLC
> + *
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
> +/* Handle SSIF message that will be sent to user */
> +static ssize_t ssif_bmc_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
> +{
> +	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
> +	struct ssif_msg msg;
> +	unsigned long flags;
> +	ssize_t ret;
> +
> +	spin_lock_irqsave(&ssif_bmc->lock, flags);
> +	while (!ssif_bmc->request_available) {
> +		if (file->f_flags & O_NONBLOCK) {

There is no real need to check this under the lock.  It would simplify
the end of this function if you checked this outside the lock.

> +			ret = -EAGAIN;
> +			goto out_unlock;
> +		}
> +		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> +		ret = wait_event_interruptible(ssif_bmc->wait_queue,
> +					       ssif_bmc->request_available);
> +		if (ret)
> +			return ret;
> +		spin_lock_irqsave(&ssif_bmc->lock, flags);
> +	}
> +
> +	count = min_t(ssize_t, ssif_msg_len(&ssif_bmc->request),
> +		      min_t(ssize_t, sizeof(struct ssif_msg), count));

Just curious, what happens if userland supplies a buffer that is too
small?  Is data lost?  In that case, I would think returning an error
here would be the better thing, as opposed to silently truncating the
message.

> +	memcpy(&msg, &ssif_bmc->request, count);
> +	ssif_bmc->request_available = false;
> +	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> +
> +	ret = copy_to_user(buf, &msg, count);
> +	goto out;
> +
> +out_unlock:
> +	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> +out:
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
> +	ret = copy_from_user(&msg, buf, count);
> +	if (ret)
> +		return ret;
> +
> +	if (!msg.len || count < ssif_msg_len(&msg))
> +		return -EINVAL;
> +
> +	spin_lock_irqsave(&ssif_bmc->lock, flags);
> +	while (ssif_bmc->response_in_progress) {
> +		if (file->f_flags & O_NONBLOCK) {

Same comment as O_NONBLOCK before.

> +			ret = -EAGAIN;
> +			goto out_unlock;
> +		}
> +		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> +		ret = wait_event_interruptible(ssif_bmc->wait_queue,
> +					       !ssif_bmc->response_in_progress);
> +		if (ret)
> +			goto out;
> +		spin_lock_irqsave(&ssif_bmc->lock, flags);
> +	}
> +
> +	memcpy(&ssif_bmc->response, &msg, count);
> +	ssif_bmc->is_singlepart_read = (ssif_msg_len(&msg) <= MAX_PAYLOAD_PER_TRANSACTION + 1);
> +	ssif_bmc->response_in_progress = true;
> +	if (ssif_bmc->set_ssif_bmc_status)
> +		ssif_bmc->set_ssif_bmc_status(ssif_bmc, SSIF_BMC_READY);
> +
> +out_unlock:
> +	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> +
> +out:
> +	return (ret < 0) ? ret : count;
> +}
> +
> +static int ssif_bmc_open(struct inode *inode, struct file *file)
> +{
> +	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
> +	int ret = 0;
> +
> +	spin_lock_irq(&ssif_bmc->lock);
> +	if (!ssif_bmc->running)
> +		ssif_bmc->running = 1;
> +	else
> +		ret = -EBUSY;
> +	spin_unlock_irq(&ssif_bmc->lock);
> +
> +	return ret;
> +}
> +
> +static unsigned int ssif_bmc_poll(struct file *file, poll_table *wait)
> +{
> +	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
> +	unsigned int mask = 0;
> +
> +	poll_wait(file, &ssif_bmc->wait_queue, wait);
> +
> +	spin_lock_irq(&ssif_bmc->lock);
> +	/*
> +	 * The request message is now available so userspace application can
> +	 * get the request
> +	 */
> +	if (ssif_bmc->request_available)
> +		mask |= POLLIN;
> +
> +	spin_unlock_irq(&ssif_bmc->lock);
> +
> +	return mask;
> +}
> +
> +static int ssif_bmc_release(struct inode *inode, struct file *file)
> +{
> +	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
> +
> +	spin_lock_irq(&ssif_bmc->lock);
> +	ssif_bmc->running = 0;
> +	spin_unlock_irq(&ssif_bmc->lock);
> +
> +	return 0;
> +}
> +
> +/*
> + * System calls to device interface for user apps
> + */
> +static const struct file_operations ssif_bmc_fops = {
> +	.owner		= THIS_MODULE,
> +	.open		= ssif_bmc_open,
> +	.read		= ssif_bmc_read,
> +	.write		= ssif_bmc_write,
> +	.release	= ssif_bmc_release,
> +	.poll		= ssif_bmc_poll,
> +};
> +
> +/* Called with ssif_bmc->lock held. */
> +static void handle_request(struct ssif_bmc_ctx *ssif_bmc)
> +{
> +	if (ssif_bmc->set_ssif_bmc_status)
> +		ssif_bmc->set_ssif_bmc_status(ssif_bmc, SSIF_BMC_BUSY);
> +
> +	/* Request message is available to process */
> +	ssif_bmc->request_available = true;
> +	/*
> +	 * This is the new READ request.
> +	 */
> +	wake_up_all(&ssif_bmc->wait_queue);
> +}
> +
> +/* Called with ssif_bmc->lock held. */
> +static void complete_response(struct ssif_bmc_ctx *ssif_bmc)
> +{
> +	/* Invalidate response in buffer to denote it having been sent. */
> +	ssif_bmc->response.len = 0;
> +	ssif_bmc->response_in_progress = false;
> +	ssif_bmc->nbytes_processed = 0;
> +	ssif_bmc->remain_len = 0;
> +	wake_up_all(&ssif_bmc->wait_queue);
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
> +			 */
> +			*val = ssif_bmc->remain_len + 1;
> +			ssif_bmc->block_num = 0xFF;
> +			ssif_bmc->response_buf[idx++] = ssif_bmc->block_num;
> +			response_len = ssif_bmc->remain_len;
> +			/* Clean the buffer */
> +			memset(&ssif_bmc->response_buf[idx], 0, MAX_PAYLOAD_PER_TRANSACTION - idx);
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
> +		dev_err(&ssif_bmc->client->dev,
> +			"Error: Unexpected SMBus command received 0x%x\n", ssif_bmc->smbus_cmd);
> +		break;
> +	}
> +
> +	ssif_bmc->nbytes_processed += response_len;
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
> +		} else if (ssif_bmc->response.len && ssif_bmc->msg_idx == ssif_bmc->response.len) {
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
> +			dev_err(&ssif_bmc->client->dev,
> +				"Error: Unexpected SMBus command received 0x%x\n",
> +				ssif_bmc->smbus_cmd);
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

Shouldn't you abort the message if you get too much data?  Otherwise you
get silent truncation.

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

Generally you put the space after the break, not before.  You did this
right before, but didn't from here down in the file.

> +	case SSIF_IPMI_MULTIPART_WRITE_START:
> +		/* Reset length to zero */
> +		if (ssif_bmc->msg_idx == 1)
> +			ssif_bmc->request.len = 0;

What happens if you get this and you are in the middle of a message?

> +
> +		fallthrough;
> +	case SSIF_IPMI_MULTIPART_WRITE_MIDDLE:
> +	case SSIF_IPMI_MULTIPART_WRITE_END:

What happens if you get these and you are not in a message?

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
> +		dev_err(&ssif_bmc->client->dev,
> +			"Error: Unexpected SMBus command received 0x%x\n", ssif_bmc->smbus_cmd);
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
> +			dev_err(&ssif_bmc->client->dev, "Bad PEC 0x%02x vs. 0x%02x\n", rpec, cpec);
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
> +			dev_err(&ssif_bmc->client->dev, "Bad PEC 0x%02x vs. 0x%02x\n", rpec, cpec);
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
> +	dev_err(&ssif_bmc->client->dev,
> +		"Error: Unexpected length received %d\n", ssif_msg_len(&ssif_bmc->request));
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
> +		dev_err(&ssif_bmc->client->dev, "Received invalid PEC\n");
> +		return;
> +	}
> +
> +	if (cmd == SSIF_IPMI_SINGLEPART_WRITE || cmd == SSIF_IPMI_MULTIPART_WRITE_END)
> +		handle_request(ssif_bmc);
> +}
> +
> +static void initialize_transfer(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> +{
> +	/* SMBUS command can vary (single or multi-part) */
> +	ssif_bmc->smbus_cmd = *val;
> +	ssif_bmc->msg_idx++;
> +
> +	if (ssif_bmc->smbus_cmd == SSIF_IPMI_SINGLEPART_WRITE ||
> +	    ssif_bmc->smbus_cmd == SSIF_IPMI_MULTIPART_WRITE_START) {
> +		/*
> +		 * The response can be delayed in BMC causing host SSIF driver
> +		 * to timeout and send a new request once BMC slave is ready.
> +		 * In that case check for pending response and clear it
> +		 */
> +		if (ssif_bmc->response_in_progress) {
> +			dev_err(&ssif_bmc->client->dev,
> +				"Warn: SSIF new request with pending response");
> +			complete_response(ssif_bmc);
> +		}
> +	} else if (unlikely(ssif_bmc->smbus_cmd != SSIF_IPMI_SINGLEPART_READ &&
> +			    ssif_bmc->smbus_cmd != SSIF_IPMI_MULTIPART_WRITE_MIDDLE &&
> +			    ssif_bmc->smbus_cmd != SSIF_IPMI_MULTIPART_WRITE_END &&
> +			    ssif_bmc->smbus_cmd != SSIF_IPMI_MULTIPART_READ_START &&
> +			    ssif_bmc->smbus_cmd != SSIF_IPMI_MULTIPART_READ_MIDDLE)) {
> +		/* Unknown command, clear it */
> +		dev_err(&ssif_bmc->client->dev, "Warn: Unknown SMBus command");
> +		complete_response(ssif_bmc);
> +	}
> +}
> +
> +/*
> + * Callback function to handle I2C slave events
> + */
> +static int ssif_bmc_cb(struct i2c_client *client, enum i2c_slave_event event, u8 *val)
> +{
> +	unsigned long flags;
> +	struct ssif_bmc_ctx *ssif_bmc = i2c_get_clientdata(client);
> +
> +	spin_lock_irqsave(&ssif_bmc->lock, flags);
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
> +		ssif_bmc->msg_idx = 0;
> +		if (ssif_bmc->is_singlepart_read)
> +			*val = ssif_bmc->response.len;
> +		else
> +			set_multipart_response_buffer(ssif_bmc, val);
> +		break;
> +
> +	case I2C_SLAVE_WRITE_REQUESTED:
> +		ssif_bmc->msg_idx = 0;
> +		break;
> +
> +	case I2C_SLAVE_READ_PROCESSED:
> +		handle_read_processed(ssif_bmc, val);
> +		break;
> +
> +	case I2C_SLAVE_WRITE_RECEIVED:
> +		if (ssif_bmc->msg_idx)
> +			handle_write_received(ssif_bmc, val);
> +		else
> +			initialize_transfer(ssif_bmc, val);
> +
> +		break;
> +
> +	case I2C_SLAVE_STOP:
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
> +	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
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
> index 000000000000..eab540061f14
> --- /dev/null
> +++ b/drivers/char/ipmi/ssif_bmc.h
> @@ -0,0 +1,93 @@
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
> +	u8			running;
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
> +	/* spinlock */
> +	spinlock_t		lock;
> +	wait_queue_head_t	wait_queue;
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
> -- 
> 2.28.0
> 
