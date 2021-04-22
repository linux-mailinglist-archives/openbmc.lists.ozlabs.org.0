Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 566CC367F04
	for <lists+openbmc@lfdr.de>; Thu, 22 Apr 2021 12:50:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQvMf2pTMz301F
	for <lists+openbmc@lfdr.de>; Thu, 22 Apr 2021 20:50:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nuviainc-com.20150623.gappssmtp.com header.i=@nuviainc-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=qvOTcTVy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nuviainc.com (client-ip=2a00:1450:4864:20::434;
 helo=mail-wr1-x434.google.com; envelope-from=graeme@nuviainc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nuviainc-com.20150623.gappssmtp.com
 header.i=@nuviainc-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=qvOTcTVy; dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQvMM10zPz2yQm
 for <openbmc@lists.ozlabs.org>; Thu, 22 Apr 2021 20:50:05 +1000 (AEST)
Received: by mail-wr1-x434.google.com with SMTP id e5so15648583wrg.7
 for <openbmc@lists.ozlabs.org>; Thu, 22 Apr 2021 03:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ll6D7BmbJcbU6CduAeau4wB1M0bbtDXqERKKeEgMh6U=;
 b=qvOTcTVyYlflIk+Jb14S2f2tqpgUBhY30LBrMPd2EGD8cMH5aQ3wDD2CrnH86pGQlA
 zgQrUvShjT3qtiOTUJM9UY08kgKMi7erf0JfTRODPe7DK5T8KvpzSWuQ7ozbAcoizrEa
 amiLvOWmp38OX5Z/1Rd9c4qVHoLDlJRRcsVGgKUdNUN5LaSAIVAXZoxFQZ126L1R+2iG
 9/842WURmR39JyKqs3CoBhn/yasfCEVJaa9wyj3LnAOJ/19Jw+Nc2uN1QVpjjpdtNtk/
 WfBJOQWnOp3C6PbpxVhXSCkTsW6qVrAIKx/ZfpLsvHEfpiyxOtxxfbEmcn3ruMvlzSG9
 LcaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ll6D7BmbJcbU6CduAeau4wB1M0bbtDXqERKKeEgMh6U=;
 b=KsVg9djLpXZg3mi8B2r6e3W/wavPNjsgsLfk4XcA5W9zt5h9XbMGQezfz1ploGFJAj
 ZLE8v8iO1L5TIeQdmyHq2ca7BsoYaWgXJHdNO2z31KIqr0UCFgXX5TlJnos6PCzsl2R5
 3zU70RTieFZ14239Z9V8TyaSbeTIb/lu4xwHDuqjSlJceWaM38gMQTH+zjx2xubbZFma
 HvNXKnuWE8Jk3e7SJvNe+jNmAuWtD3pC1CxBiBjLHlBJY0klFWjHdhyMO7LgvpPhigaE
 yP4npoAVeoHzKxasRoWLTW6o1BK9iXXzQUDLWoG/OJbO7TtONVAr0mye4N9mJ5mQWVzl
 Aqug==
X-Gm-Message-State: AOAM531ETuWVgCZN1OXOW+97O2TRKyNziV2DdnQkH6bElPMzm6s+Kf9Z
 VPrWRK/BOQPtNeIi/cWRPCweHg==
X-Google-Smtp-Source: ABdhPJyOwo77PTIJ1nQExQ7gKG4p91c+E78LEttfRaxFs5aN9WTMM99HM8dv2PocD/ipvsGg1ZUeBg==
X-Received: by 2002:a05:6000:82:: with SMTP id
 m2mr3316986wrx.139.1619088597324; 
 Thu, 22 Apr 2021 03:49:57 -0700 (PDT)
Received: from ggregory-ubuntuvm ([62.3.69.143])
 by smtp.gmail.com with ESMTPSA id q5sm2917256wrv.17.2021.04.22.03.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 03:49:56 -0700 (PDT)
Date: Thu, 22 Apr 2021 11:49:54 +0100
From: Graeme Gregory <graeme@nuviainc.com>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v2 2/3] drivers: char: ipmi: Add Aspeed SSIF BMC driver
Message-ID: <20210422104954.GB13153@ggregory-ubuntuvm>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Corey Minyard <minyard@acm.org>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
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
> +
> +	ret = receive_ssif_bmc_request(ssif_bmc, file->f_flags & O_NONBLOCK);
> +	if (ret < 0)
> +		goto out;
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
> +}
> +
> +static unsigned int ssif_bmc_poll(struct file *file, poll_table *wait)
> +{
> +	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
> +	unsigned int mask = 0;
> +
> +	mutex_lock(&ssif_bmc->file_mutex);
> +	poll_wait(file, &ssif_bmc->wait_queue, wait);
> +
> +	/*
> +	 * The request message is now available so userspace application can
> +	 * get the request
> +	 */
> +	if (ssif_bmc->request_available)
> +		mask |= POLLIN;
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
> +			set_singlepart_response_buffer(ssif_bmc, val);
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

Trying to take this spinlock cannot succeed as its already taken by this
point.

The command sent over I2C to trigger this is

20 02 0C 2C 02 AE 00 00 00 00 00 00 00 00 00 46

CONFIG_SPINLOCK_DEBUG output below. Obviously this deadlocks the kernel.

root@nuviamachine1:~# [   38.790031] BUG: spinlock recursion on CPU#0,
swapper/0/0
[   38.796085]  lock: 0x8114c33c, .magic: dead4ead, .owner: swapper/0/0,
.owner_cpu: 0
[   38.804637] CPU: 0 PID: 0 Comm: swapper/0 Not tainted
5.10.30-51e4d5a-dirty-601c30e-00164-g463ecaa957f0 #7
[   38.815410] Hardware name: Generic DT based system
[   38.820756] Backtrace: 
[   38.823502] [<808e9408>] (dump_backtrace) from [<808e9664>]
(show_stack+0x20/0x24)
[   38.831955]  r7:855362a0 r6:600f0193 r5:00000000 r4:80ca3590
[   38.838277] [<808e9644>] (show_stack) from [<808f45b4>]
(dump_stack+0xa0/0xb4)
[   38.846342] [<808f4514>] (dump_stack) from [<808ea418>]
(spin_dump+0x90/0x98)
[   38.854307]  r7:855362a0 r6:8114c33c r5:80c10400 r4:8114c33c
[   38.860627] [<808ea388>] (spin_dump) from [<80171044>]
(do_raw_spin_lock+0x12c/0x130)
[   38.869365]  r5:ffffe000 r4:8114c33c
[   38.873360] [<80170f18>] (do_raw_spin_lock) from [<808fb628>]
(_raw_spin_lock_irqsave+0x20/0x28)
[   38.883165]  r5:00000001 r4:a00f0193
[   38.887162] [<808fb608>] (_raw_spin_lock_irqsave) from [<80513648>]
(aspeed_set_ssif_bmc_status+0x30/0xbc)
[   38.897937]  r5:00000001 r4:8114c040
[   38.901931] [<80513618>] (aspeed_set_ssif_bmc_status) from
[<80512b00>] (ssif_bmc_cb+0x1c4/0x698)
[   38.911835]  r7:855362a0 r6:8553606c r5:00000004 r4:85536040
[   38.918158] [<8051293c>] (ssif_bmc_cb) from [<8067e648>]
(aspeed_i2c_slave_irq+0xb8/0x264)
[   38.927386]  r10:80c00000 r9:80c0a514 r8:00000010 r7:85545000
r6:00000010 r5:00000010
[   38.936122]  r4:8114c040
[   38.938952] [<8067e590>] (aspeed_i2c_slave_irq) from [<8067ed68>]
(aspeed_i2c_bus_irq+0xd0/0x154)
[   38.948855]  r7:8114c33c r6:00000010 r5:811e106c r4:8114c040
[   38.955175] [<8067ec98>] (aspeed_i2c_bus_irq) from [<8017ae3c>]
(__handle_irq_event_percpu+0x68/0x204)
[   38.965568]  r10:80c00000 r9:80c0a514 r8:00000030 r7:80c01e20
r6:00000000 r5:811e106c
[   38.974305]  r4:855468c0 r3:8067ec98
[   38.978299] [<8017add4>] (__handle_irq_event_percpu) from
[<8017b018>] (handle_irq_event_percpu+0x40/0xa0)
[   38.989077]  r10:10c5387d r9:80c00000 r8:81042800 r7:00000000
r6:811e106c r5:811e106c
[   38.997814]  r4:811e1000
[   39.000644] [<8017afd8>] (handle_irq_event_percpu) from [<8017b0c0>]
(handle_irq_event+0x48/0x6c)
[   39.010546]  r5:811e106c r4:811e1000
[   39.014539] [<8017b078>] (handle_irq_event) from [<80180030>]
(handle_fasteoi_irq+0xc8/0x170)
[   39.024056]  r7:00000000 r6:80c0ac14 r5:811e106c r4:811e1000
[   39.030376] [<8017ff68>] (handle_fasteoi_irq) from [<8017a428>]
(generic_handle_irq+0x40/0x54)
[   39.039989]  r7:00000000 r6:00000001 r5:00000000 r4:80b6c80c
[   39.046312] [<8017a3e8>] (generic_handle_irq) from [<8017a4a8>]
(__handle_domain_irq+0x6c/0xc0)
[   39.056028] [<8017a43c>] (__handle_domain_irq) from [<8010134c>]
(gic_handle_irq+0x7c/0x90)
[   39.065353]  r9:80c00000 r8:bf80200c r7:80b6bdcc r6:bf802000
r5:80c01ee0 r4:80c0ac14
[   39.073998] [<801012d0>] (gic_handle_irq) from [<80100b0c>]
(__irq_svc+0x6c/0x90)
[   39.082340] Exception stack(0x80c01ee0 to 0x80c01f28)
[   39.087981] 1ee0: 00000000 00009a14 bd7dc484 8011a740 80c00000
00000000 80c0a514 80c0a550
[   39.097111] 1f00: 80ca7f5b 80a0ea58 10c5387d 80c01f3c 80c01f40
80c01f30 8010907c 80109080
[   39.106237] 1f20: 600f0013 ffffffff
[   39.110130]  r9:80c00000 r8:80ca7f5b r7:80c01f14 r6:ffffffff
r5:600f0013 r4:80109080
[   39.118773] [<80109038>] (arch_cpu_idle) from [<808fb4c8>]
(default_idle_call+0x38/0x108)
[   39.127907] [<808fb490>] (default_idle_call) from [<80156128>]
(do_idle+0xe4/0x150)
[   39.136457] [<80156044>] (do_idle) from [<80156478>]
(cpu_startup_entry+0x28/0x2c)
[   39.144908]  r9:8ffff564 r8:80b3ba6c r7:00000000 r6:80cc7000
r5:00000001 r4:000000d8
[   39.153545] [<80156450>] (cpu_startup_entry) from [<808f4f10>]
(rest_init+0xbc/0xc4)
[   39.162192] [<808f4e54>] (rest_init) from [<80b00c94>]
(arch_call_rest_init+0x18/0x1c)
[   39.171027]  r5:00000001 r4:80cc7040
[   39.175017] [<80b00c7c>] (arch_call_rest_init) from [<80b0124c>]
(start_kernel+0x53c/0x584)
[   39.184330] [<80b00d10>] (start_kernel) from [<00000000>] (0x0)


> +
> +	if (status & SSIF_BMC_BUSY) {
> +		/* Ignore RX_DONE and SLAVE_MATCH when slave busy processing */
> +		aspeed_i2c_disable_interrupt(bus, ASPEED_I2CD_INTR_RX_DONE);
> +		aspeed_i2c_disable_interrupt(bus, ASPEED_I2CD_INTR_SLAVE_MATCH);
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
