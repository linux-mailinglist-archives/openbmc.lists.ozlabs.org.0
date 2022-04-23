Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A793F50C63F
	for <lists+openbmc@lfdr.de>; Sat, 23 Apr 2022 03:52:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlZ5W3KnKz3bZf
	for <lists+openbmc@lfdr.de>; Sat, 23 Apr 2022 11:51:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nIXevhiB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730;
 helo=mail-qk1-x730.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=nIXevhiB; dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlZ4x3p3Cz2yb6;
 Sat, 23 Apr 2022 11:51:27 +1000 (AEST)
Received: by mail-qk1-x730.google.com with SMTP id a186so7055068qkc.10;
 Fri, 22 Apr 2022 18:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=6glhAmKCmSYOliib4xe1C1+hTCJRxNxzRLDemCLymqM=;
 b=nIXevhiBNJwZnthsBAWKDpHc8nATeym4l0D3U5WWWTB3MYG7Eo/EQevo48YuUsGC/5
 e23JT5khifd9iQH+KjcLj9+Muw6rI4zIL0zAp4SHObj4CDoWAhza40U84BJIZJQ0wcVs
 gT/LZ71rwlEz8b0nZAngyGbH2TOL4cph/U9ntH3uER4BofjxGsmZMAOi9DIXaQHpzGWo
 CO6qp8VeyzyN5i+uq5iIPucAIa9s+AWHTqH1EuMjyXJ73JqHqxLXlEvMqaYtzpu1cG8G
 nmvTrI1GqpWSlFzThP9HSyeL8LVbr9bqL8FxBXdX/PxQS1BAXALlPGlxINoHq0EiVgvu
 YFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=6glhAmKCmSYOliib4xe1C1+hTCJRxNxzRLDemCLymqM=;
 b=bX5K2ua1sqtNx8gp9fBqd0c+1DJcsaJQUI0cMxptHEjeY01zz3HDCrCQHPVARZpHTH
 8bdlsZvArT96OIlk+YiP6w2w5JCT9YpsRQE8nKEDeerv+nuqwIvtw9MkTfBgueQh0Er3
 jxYmeWP35mJ/H2+lNUcM6B4hex6m99Vvnf+qInzD3FuMxIFFRsTsVATWyalxeiS3PC6N
 5CQouzsZlWaIIlGh7tRfUCrsPZdH75bed+KkES3moEHGlUscGA4a5mljrLwt5E/BxXKx
 O7LQlBNLpLYtijnDXGcwplAg8p9LXalESSZ4kdX6GKoOWj9+MMVZXcGOIHua/BDbysfx
 07dA==
X-Gm-Message-State: AOAM5326pavDzg/HQwDRHZB+c1Fkj/N+Pgd1JXCQOGPZ9XQwwYiLaqvM
 krfCUphNd+lywJ6rtFgIxg==
X-Google-Smtp-Source: ABdhPJxtuJu9pm8+4IRVjNTPNPaGe+GKiYALw4J92AyKr3dNrkadGGF+3JZJ0C2ZNYJJYc+0GQBnVg==
X-Received: by 2002:a05:620a:2590:b0:680:f8c3:582 with SMTP id
 x16-20020a05620a259000b00680f8c30582mr4446171qko.723.1650678681808; 
 Fri, 22 Apr 2022 18:51:21 -0700 (PDT)
Received: from serve.minyard.net ([47.184.144.75])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a05620a123100b0069e871f949fsm1681237qkj.81.2022.04.22.18.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 18:51:21 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:956c:7e46:4093:444])
 by serve.minyard.net (Postfix) with ESMTPSA id 526C3180004;
 Sat, 23 Apr 2022 01:51:20 +0000 (UTC)
Date: Fri, 22 Apr 2022 20:51:19 -0500
From: Corey Minyard <minyard@acm.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v7 1/3] ipmi: ssif_bmc: Add SSIF BMC driver
Message-ID: <20220423015119.GE426325@minyard.net>
References: <20220422040803.2524940-1-quan@os.amperecomputing.com>
 <20220422040803.2524940-2-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220422040803.2524940-2-quan@os.amperecomputing.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org,
 Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 openipmi-developer@lists.sourceforge.net,
 Open Source Submission <patches@amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 22, 2022 at 11:08:01AM +0700, Quan Nguyen wrote:
> The SMBus system interface (SSIF) IPMI BMC driver can be used to perform
> in-band IPMI communication with their host in management (BMC) side.
> 
> Thanks Dan for the copy_from_user() fix in the link below.

This is much better, the handling of lengths and indexes is much easier
to understand.  I hope you agree.

I may be repeating myself on some things, it's been a while since the
last submit.  So please forgive me if I do.

Comments inline...

> 
> Link: https://lore.kernel.org/linux-arm-kernel/20220310114119.13736-4-quan@os.amperecomputing.com/
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> v7:
>   + Remove unneccessary del_timer() in response_timeout()        [Corey]
>   + Change compatible string from "ampere,ssif-bmc" to "ssif-bmc"  [Jae]
>   + Add MODULE_DEVICE_TABLE(of, ssif_bmc_match), fix blank line    [Jae]
>   + Dropped the use of ssif_msg_len() macro, use the len directly [Quan]
>   + Solve possible issue if both response timer and ssif_bmc_write()
>   occurred at the same time                                      [Corey]
>   + Fix wrong return type of ssif_bmc_poll()         [kernel robot test]
>   + Refactor and introduce ssif_part_buffer struct to replace the
>   response_buf to manage each send/receive part of ssif           [Quan]
>   + Change SSIF_BAD_SMBUS state to SSIF_ABORTING state           [Corey]
>   + Support abort feature to skip the current bad request/response and
>   wait until next new request                                    [Corey]
>   + Refactor the PEC calculation to avoid the re-calculate the PEC on
>   each I2C_SLAVE_WRITE_RECEIVED event                             [Quan]
>   + Fix the use of error-proned idx                              [Corey]
>   + Defer the test for valid SMBus command until the read/write part
>   is determined                                                   [Quan]
>   + Change/split unsupported_smbus_cmd() to
>   supported_[write|read]_cmd()                                   [Corey]
>   + Abort the request if somehow its size exceeded 255 bytes      [Quan]
> 
> v6:
>   + Drop the use of slave_enable()                             [Wolfram]
>   + Make i2c-aspeed to issue RxCmdLast command on all
>   I2C_SLAVE_WRITE_REQUESTED event to assert NAK when slave busy   [Quan]
>   + Make i2c slave to return -EBUSY when it's busy                [Quan]
>   + Drop the aborting feature as return Completion Code 0xFF may stop
>   host to retry and make ipmi_ssif.so fails to load               [Quan]
>   + Add timer to recover slave from busy state when no response   [Quan]
>   + Clean request/response buffer appropriately                   [Quan]
>   + Add some minor change on error and warning messages           [Quan]
> 
> v5:
>   + None
> 
> v4:
>   + Send response with Completion code 0xFF when aborting         [Quan]
>   + Added bounding check on SMBus writes and the whole request     [Dan]
>   + Moved buffer to end of struct ssif_bmc_ctx to avoid context
>     corruption if somehow buffer is written past the end           [Dan]
>   + Return -EINVAL if userspace buffer too small, dont
>     silence truncate                                       [Corey, Joel]
>   + Not necessary to check NONBLOCK in lock                      [Corey]
>   + Enforce one user at a time                                    [Joel]
>   + Reject write with invalid response length from userspace     [Corey]
>   + Add state machines for better ssif bmc state handling         [Quan]
>   + Drop ssif_bmc_aspeed.c and make ssif_bmc.c is generic
>     SSIF BMC driver                                               [Quan]
>   + Change compatible string "aspeed,ast2500-ssif-bmc" to
>     "ampere,ssif-bmc"                                             [Quan]
>   + Abort current request with invalid SMBus write or
>     invalid command                                               [Quan]
>   + Abort all request if there is pending response                [Quan]
>   + Changed validate_pec() to validate_request()                  [Quan]
>   + Add unsupported_smbus_cmd() to handle unknown SMBus command   [Quan]
>   + Print internal state string for ease investigating issue      [Quan]
>   + Move to READY state on SLAVE_STOP event                       [Quan]
>   + Change initilize_transfer() to process_smbus_cmd()            [Quan]
>   + Introduce functions for each slave event                      [Quan]
> 
> v3:
>   + Removed redundant license info                                [Joel]
>   + Switched to use traditional if-else                           [Joel]
>   + Removed unused ssif_bmc_ioctl()                               [Joel]
>   + Made handle_request()/complete_response() to return void      [Joel]
>   + Refactored send_ssif_bmc_response() and
>   receive_ssif_bmc_request()                                     [Corey]
>   + Removed mutex                                                [Corey]
>   + Use spin_lock/unlock_irqsave/restore in callback             [Corey]
>   + Removed the unnecessary memset                               [Corey]
>   + Switch to use dev_err()                                      [Corey]
> 
> v2:
>   + Fixed compiling error with COMPILE_TEST for arc
> 
>  drivers/char/ipmi/Kconfig    |  11 +
>  drivers/char/ipmi/Makefile   |   1 +
>  drivers/char/ipmi/ssif_bmc.c | 780 +++++++++++++++++++++++++++++++++++
>  drivers/char/ipmi/ssif_bmc.h | 107 +++++
>  4 files changed, 899 insertions(+)
>  create mode 100644 drivers/char/ipmi/ssif_bmc.c
>  create mode 100644 drivers/char/ipmi/ssif_bmc.h
> 
> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
> index b061e6b513ed..18a89093d64e 100644
> --- a/drivers/char/ipmi/Kconfig
> +++ b/drivers/char/ipmi/Kconfig
> @@ -169,6 +169,17 @@ config ASPEED_BT_IPMI_BMC
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
> index 7ce790efad92..cb6138b8ded9 100644
> --- a/drivers/char/ipmi/Makefile
> +++ b/drivers/char/ipmi/Makefile
> @@ -30,3 +30,4 @@ obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
>  obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs_bmc_aspeed.o
>  obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) += kcs_bmc_npcm7xx.o
>  obj-$(CONFIG_IPMB_DEVICE_INTERFACE) += ipmb_dev_int.o
> +obj-$(CONFIG_SSIF_IPMI_BMC) += ssif_bmc.o
> diff --git a/drivers/char/ipmi/ssif_bmc.c b/drivers/char/ipmi/ssif_bmc.c
> new file mode 100644
> index 000000000000..4cff5e1a075e
> --- /dev/null
> +++ b/drivers/char/ipmi/ssif_bmc.c
> @@ -0,0 +1,780 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * The driver for BMC side of SSIF interface
> + *
> + * Copyright (c) 2022, Ampere Computing LLC
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
> +#include <linux/timer.h>
> +#include <linux/jiffies.h>
> +
> +#include "ssif_bmc.h"
> +
> +static const char *state_to_string(enum ssif_state state)
> +{
> +	switch (state) {
> +	case SSIF_READY:
> +		return "SSIF_READY";
> +	case SSIF_START:
> +		return "SSIF_START";
> +	case SSIF_SMBUS_CMD:
> +		return "SSIF_SMBUS_CMD";
> +	case SSIF_REQ_RECVING:
> +		return "SSIF_REQ_RECVING";
> +	case SSIF_RES_SENDING:
> +		return "SSIF_RES_SENDING";
> +	case SSIF_ABORTING:
> +		return "SSIF_ABORTING";
> +	default:
> +		return "SSIF_STATE_UNKNOWN";
> +	}
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
> +	spin_lock_irqsave(&ssif_bmc->lock, flags);
> +	while (!ssif_bmc->request_available) {
> +		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> +		if (file->f_flags & O_NONBLOCK)
> +			return -EAGAIN;
> +		ret = wait_event_interruptible(ssif_bmc->wait_queue,
> +					       ssif_bmc->request_available);
> +		if (ret)
> +			return ret;
> +		spin_lock_irqsave(&ssif_bmc->lock, flags);
> +	}
> +
> +	if (count < min_t(ssize_t, ssif_bmc->request.len + 1, sizeof(struct ssif_msg))) {
> +		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> +		ret = -EINVAL;
> +	} else {
> +		count = min_t(ssize_t, ssif_bmc->request.len + 1, sizeof(struct ssif_msg));
> +		memcpy(&msg, &ssif_bmc->request, count);
> +		ssif_bmc->request_available = false;
> +		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> +
> +		ret = copy_to_user(buf, &msg, count);
> +	}
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
> +	if (copy_from_user(&msg, buf, count))
> +		return -EFAULT;
> +
> +	if (!msg.len || count < msg.len + 1)
> +		return -EINVAL;
> +
> +	spin_lock_irqsave(&ssif_bmc->lock, flags);
> +	while (ssif_bmc->response_in_progress) {
> +		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> +		if (file->f_flags & O_NONBLOCK)
> +			return -EAGAIN;
> +		ret = wait_event_interruptible(ssif_bmc->wait_queue,
> +					       !ssif_bmc->response_in_progress);
> +		if (ret)
> +			return ret;
> +		spin_lock_irqsave(&ssif_bmc->lock, flags);
> +	}
> +
> +	/*
> +	 * The write must complete before the response timeout fired, otherwise
> +	 * the response is aborted and wait for next request
> +	 * Return -EINVAL if the response is aborted
> +	 */
> +	ret = (ssif_bmc->response_timer_inited) ? 0 : -EINVAL;
> +	if (ret)
> +		goto exit;
> +
> +	del_timer(&ssif_bmc->response_timer);
> +	ssif_bmc->response_timer_inited = false;
> +
> +	memcpy(&ssif_bmc->response, &msg, count);
> +	ssif_bmc->is_singlepart_read = (msg.len <= MAX_PAYLOAD_PER_TRANSACTION);
> +
> +	ssif_bmc->response_in_progress = true;
> +
> +	/* ssif_bmc not busy */
> +	ssif_bmc->busy = false;
> +
> +	/* Clean old request buffer */
> +	memset(&ssif_bmc->request, 0, sizeof(struct ssif_msg));
> +exit:
> +	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> +
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
> +static __poll_t ssif_bmc_poll(struct file *file, poll_table *wait)
> +{
> +	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
> +	__poll_t mask = 0;
> +
> +	poll_wait(file, &ssif_bmc->wait_queue, wait);
> +
> +	spin_lock_irq(&ssif_bmc->lock);
> +	/* The request is available, userspace application can get the request */
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
> +static void complete_response(struct ssif_bmc_ctx *ssif_bmc)
> +{
> +	/* Invalidate response in buffer to denote it having been sent. */
> +	ssif_bmc->response.len = 0;
> +	ssif_bmc->response_in_progress = false;
> +	ssif_bmc->nbytes_processed = 0;
> +	ssif_bmc->remain_len = 0;
> +	ssif_bmc->busy = false;
> +	memset(&ssif_bmc->part_buf, 0, sizeof(struct ssif_part_buffer));
> +	wake_up_all(&ssif_bmc->wait_queue);
> +}
> +
> +static void response_timeout(struct timer_list *t)
> +{
> +	struct ssif_bmc_ctx *ssif_bmc = from_timer(ssif_bmc, t, response_timer);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ssif_bmc->lock, flags);
> +
> +	/* Do nothing if the response is in progress */
> +	if (!ssif_bmc->response_in_progress) {
> +		/* Recover ssif_bmc from busy */
> +		ssif_bmc->busy = false;
> +		ssif_bmc->response_timer_inited = false;
> +		/* Set aborting flag */
> +		ssif_bmc->aborting = true;
> +	}
> +
> +	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> +}
> +
> +/* Called with ssif_bmc->lock held. */
> +static void handle_request(struct ssif_bmc_ctx *ssif_bmc)
> +{
> +	/* set ssif_bmc to busy waiting for response */
> +	ssif_bmc->busy = true;
> +	/* Request message is available to process */
> +	ssif_bmc->request_available = true;
> +	/* Clean old response buffer */
> +	memset(&ssif_bmc->response, 0, sizeof(struct ssif_msg));
> +	/* This is the new READ request.*/
> +	wake_up_all(&ssif_bmc->wait_queue);
> +
> +	/* Armed timer to recover slave from busy state in case of no response */
> +	if (!ssif_bmc->response_timer_inited) {
> +		timer_setup(&ssif_bmc->response_timer, response_timeout, 0);
> +		ssif_bmc->response_timer_inited = true;
> +	}
> +	mod_timer(&ssif_bmc->response_timer, jiffies + msecs_to_jiffies(RESPONSE_TIMEOUT));
> +}
> +
> +static void calculate_response_part_pec(struct ssif_part_buffer *part)
> +{
> +	u8 addr = part->address;
> +
> +	/* PEC - Start Read Address */
> +	part->pec = i2c_smbus_pec(0, &addr, 1);
> +	/* PEC - SSIF Command */
> +	part->pec = i2c_smbus_pec(part->pec, &part->smbus_cmd, 1);
> +	/* PEC - Restart Write Address */
> +	addr = addr | 0x01;
> +	part->pec = i2c_smbus_pec(part->pec, &addr, 1);
> +	part->pec = i2c_smbus_pec(part->pec, &part->length, 1);
> +	if (part->length)
> +		part->pec = i2c_smbus_pec(part->pec, part->payload, part->length);
> +}
> +
> +static void set_singlepart_response_buffer(struct ssif_bmc_ctx *ssif_bmc)
> +{
> +	struct ssif_part_buffer *part = &ssif_bmc->part_buf;
> +
> +	part->address = GET_8BIT_ADDR(ssif_bmc->client->addr);
> +	part->length = ssif_bmc->response.len;
> +
> +	/* Clear the rest to 0 */
> +	memset(part->payload + part->length, 0, MAX_PAYLOAD_PER_TRANSACTION - part->length);
> +	memcpy(&part->payload[0], &ssif_bmc->response.payload[0], part->length);
> +}
> +
> +static void set_multipart_response_buffer(struct ssif_bmc_ctx *ssif_bmc)
> +{
> +	struct ssif_part_buffer *part = &ssif_bmc->part_buf;
> +	u8 part_len = 0;
> +
> +	part->address = GET_8BIT_ADDR(ssif_bmc->client->addr);
> +	switch (part->smbus_cmd) {
> +	case SSIF_IPMI_MULTIPART_READ_START:
> +		/*
> +		 * Read Start length is 32 bytes.
> +		 * Read Start transfer first 30 bytes of IPMI response
> +		 * and 2 special code 0x00, 0x01.
> +		 */
> +		ssif_bmc->nbytes_processed = 0;
> +		ssif_bmc->block_num = 0;
> +		part->length = MAX_PAYLOAD_PER_TRANSACTION;
> +		part_len = MAX_IPMI_DATA_PER_START_TRANSACTION;
> +		ssif_bmc->remain_len = ssif_bmc->response.len - part_len;
> +
> +		part->payload[0] = 0x00; /* Start Flag */
> +		part->payload[1] = 0x01; /* Start Flag */
> +
> +		memcpy(&part->payload[2], &ssif_bmc->response.payload[0], part_len);
> +		break;
> +
> +	case SSIF_IPMI_MULTIPART_READ_MIDDLE:
> +		/*
> +		 * IPMI READ Middle or READ End messages can carry up to 31 bytes
> +		 * IPMI data plus block number byte.
> +		 */
> +		if (ssif_bmc->remain_len < MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION) {

Shouldn't this be <=? If you were sending something that was exactly 94
bytes, for instance, you should have a 32-byte start, a 31-byte middle,
and a 31-byte end.  If you don't have <= here, you would have a start, two
31-byte middles, and a zero-length end, which is forbidden by the spec.

> +			/*
> +			 * This is READ End message
> +			 *  Return length is the remaining response data length
> +			 *  plus block number
> +			 *  Block number 0xFF is to indicate this is last message
> +			 *
> +			 */
> +			/* Clean the buffer */
> +			memset(&part->payload[0], 0, MAX_PAYLOAD_PER_TRANSACTION);
> +			part->length = ssif_bmc->remain_len + 1;
> +			part_len = ssif_bmc->remain_len;
> +			ssif_bmc->block_num = 0xFF;
> +			part->payload[0] = ssif_bmc->block_num;
> +		} else {
> +			/*
> +			 * This is READ Middle message
> +			 *  Response length is the maximum SMBUS transfer length
> +			 *  Block number byte is incremented
> +			 * Return length is maximum SMBUS transfer length
> +			 */
> +			part->length = MAX_PAYLOAD_PER_TRANSACTION;
> +			part_len = MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION;
> +			part->payload[0] = ssif_bmc->block_num;
> +			ssif_bmc->block_num++;
> +		}
> +
> +		ssif_bmc->remain_len -= part_len;
> +		memcpy(&part->payload[1], ssif_bmc->response.payload + ssif_bmc->nbytes_processed,
> +		       part_len);
> +		break;
> +
> +	default:
> +		/* Do not expect to go to this case */
> +		dev_err(&ssif_bmc->client->dev, "%s: Unexpected SMBus command 0x%x\n",
> +			__func__, part->smbus_cmd);
> +		break;
> +	}
> +
> +	ssif_bmc->nbytes_processed += part_len;
> +}
> +
> +static bool supported_read_cmd(u8 cmd)
> +{
> +	if (cmd == SSIF_IPMI_SINGLEPART_READ ||
> +	    cmd == SSIF_IPMI_MULTIPART_READ_START ||
> +	    cmd == SSIF_IPMI_MULTIPART_READ_MIDDLE)
> +		return true;
> +
> +	return false;
> +}
> +
> +static bool supported_write_cmd(u8 cmd)
> +{
> +	if (cmd == SSIF_IPMI_SINGLEPART_WRITE ||
> +	    cmd == SSIF_IPMI_MULTIPART_WRITE_START ||
> +	    cmd == SSIF_IPMI_MULTIPART_WRITE_MIDDLE ||
> +	    cmd == SSIF_IPMI_MULTIPART_WRITE_END)
> +		return true;
> +
> +	return false;
> +}
> +
> +/* Process the IPMI response that will be read by master */
> +static void handle_read_processed(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> +{
> +	struct ssif_part_buffer *part = &ssif_bmc->part_buf;
> +
> +	/* msg_idx start from 0 */
> +	if (part->index < part->length)
> +		*val = part->payload[part->index];
> +	else if (part->index == part->length && ssif_bmc->pec_support)
> +		*val = part->pec;
> +	else
> +		*val = 0;
> +
> +	part->index++;
> +}
> +
> +static void handle_write_received(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> +{
> +	/* msg_idx should not be 0 when reach here */
> +	if (!ssif_bmc->msg_idx || ssif_bmc->msg_idx > MAX_TRANSACTION)

Should be >= 0 here?  If not, (PEC maybe?) you should document why,
because it raises red flags.

> +		return;
> +
> +	if (ssif_bmc->msg_idx == 1) {
> +		ssif_bmc->part_buf.length = *val;
> +		ssif_bmc->part_buf.index = 0;
> +	} else {
> +		ssif_bmc->part_buf.payload[ssif_bmc->part_buf.index++] = *val;
> +	}
> +
> +	ssif_bmc->msg_idx++;
> +}
> +
> +static bool validate_request_part(struct ssif_bmc_ctx *ssif_bmc)
> +{
> +	struct ssif_part_buffer *part = &ssif_bmc->part_buf;
> +	bool ret = true;
> +	u8 cpec;
> +	u8 addr;
> +
> +	if (part->index == part->length) {
> +		/* PEC is not included */
> +		ssif_bmc->pec_support = false;
> +		ret = true;
> +		goto exit;
> +	}
> +
> +	if (part->index != part->length + 1) {
> +		ret = false;
> +		goto exit;
> +	}
> +
> +	/* PEC is included */
> +	ssif_bmc->pec_support = true;
> +	part->pec = part->payload[part->length];
> +	addr = GET_8BIT_ADDR(ssif_bmc->client->addr);
> +	cpec = i2c_smbus_pec(0, &addr, 1);
> +	cpec = i2c_smbus_pec(cpec, &part->smbus_cmd, 1);
> +	cpec = i2c_smbus_pec(cpec, &part->length, 1);
> +	/*
> +	 * As SMBus specification does not allow the length
> +	 * (byte count) in the Write-Block protocol to be zero.
> +	 * Therefore, it is illegal to have the last Middle
> +	 * transaction in the sequence carry 32-byte and have
> +	 * a length of ‘0’ in the End transaction.
> +	 * But some users may try to use this way and we should
> +	 * prevent ssif_bmc driver broken in this case.
> +	 */
> +	if (part->length)
> +		cpec = i2c_smbus_pec(cpec, part->payload, part->length);
> +
> +	if (cpec != part->pec)
> +		ret = false;
> +
> +exit:
> +	return ret;
> +}
> +
> +static void process_request_part(struct ssif_bmc_ctx *ssif_bmc)
> +{
> +	struct ssif_part_buffer *part = &ssif_bmc->part_buf;
> +
> +	switch (part->smbus_cmd) {
> +	case SSIF_IPMI_SINGLEPART_WRITE:
> +		/* save the whole part to request*/
> +		ssif_bmc->request.len = part->length;
> +		memcpy(ssif_bmc->request.payload, part->payload, part->length);
> +
> +		break;
> +	case SSIF_IPMI_MULTIPART_WRITE_START:
> +			ssif_bmc->request.len = 0;

Spacing issue here.  You need to run patches through checkpatch.pl
before submitting them.  Also, the empty lines here and above are
inconsistent with the rest of the file.

> +
> +		fallthrough;
> +	case SSIF_IPMI_MULTIPART_WRITE_MIDDLE:
> +	case SSIF_IPMI_MULTIPART_WRITE_END:
> +		/* Do the bound check here, not allow the request len exceed 254 bytes */
> +		if (ssif_bmc->request.len <= MSG_PAYLOAD_LEN_MAX - part->length) {

Again, the <= is not normal for this check.  If it's correct, it needs
to be documented.

> +			memcpy(ssif_bmc->request.payload + ssif_bmc->request.len,
> +			       part->payload, part->length);
> +			ssif_bmc->request.len += part->length;
> +		} else {
> +			dev_warn(&ssif_bmc->client->dev,
> +				 "Warn: Request exceeded 254 bytes, aborting");
> +			/* Request too long, aborting */
> +			ssif_bmc->aborting =  true;
> +		}
> +		break;
> +	default:
> +		/* Do not expect to go to this case */
> +		dev_err(&ssif_bmc->client->dev, "%s: Unexpected SMBus command 0x%x\n",
> +			__func__, part->smbus_cmd);
> +		break;
> +	}
> +}
> +
> +static void process_smbus_cmd(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> +{
> +	/* SMBUS command can vary (single or multi-part) */
> +	ssif_bmc->part_buf.smbus_cmd = *val;
> +	ssif_bmc->msg_idx = 1;
> +
> +	if (*val == SSIF_IPMI_SINGLEPART_WRITE || *val == SSIF_IPMI_MULTIPART_WRITE_START) {
> +		/*
> +		 * The response maybe not come in-time, causing host SSIF driver
> +		 * to timeout and resend a new request. In such case check for
> +		 * pending response and clear it
> +		 */
> +		if (ssif_bmc->response_in_progress)
> +			complete_response(ssif_bmc);
> +
> +		/* This is new request, flip aborting flag if set */
> +		if (ssif_bmc->aborting)
> +			ssif_bmc->aborting = false;
> +	}
> +}
> +
> +static void on_read_requested_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> +{
> +	if (ssif_bmc->state == SSIF_READY ||
> +	    ssif_bmc->state == SSIF_START ||
> +	    ssif_bmc->state == SSIF_REQ_RECVING ||
> +	    ssif_bmc->state == SSIF_RES_SENDING) {
> +		dev_warn(&ssif_bmc->client->dev,
> +			 "Warn: %s unexpected READ REQUESTED in state=%s\n",
> +			 __func__, state_to_string(ssif_bmc->state));
> +		ssif_bmc->state = SSIF_ABORTING;
> +		*val = 0;
> +		return;
> +
> +	} else if (ssif_bmc->state == SSIF_SMBUS_CMD) {
> +		if (!supported_read_cmd(ssif_bmc->part_buf.smbus_cmd)) {
> +			dev_warn(&ssif_bmc->client->dev, "Warn: Unknown SMBus read command=0x%x",
> +				 ssif_bmc->part_buf.smbus_cmd);
> +			ssif_bmc->aborting = true;
> +		}
> +
> +		if (ssif_bmc->aborting)
> +			ssif_bmc->state = SSIF_ABORTING;
> +		else
> +			ssif_bmc->state = SSIF_RES_SENDING;
> +	}
> +
> +	ssif_bmc->msg_idx = 0;
> +
> +	/* Send 0 if there is nothing to send */
> +	if (!ssif_bmc->response_in_progress || ssif_bmc->state == SSIF_ABORTING) {
> +		*val = 0;
> +		return;
> +	}
> +
> +	if (ssif_bmc->is_singlepart_read)
> +		set_singlepart_response_buffer(ssif_bmc);
> +	else
> +		set_multipart_response_buffer(ssif_bmc);
> +
> +	calculate_response_part_pec(&ssif_bmc->part_buf);
> +	ssif_bmc->part_buf.index = 0;
> +	*val = ssif_bmc->part_buf.length;
> +}
> +
> +static void on_read_processed_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> +{
> +	if (ssif_bmc->state == SSIF_READY ||
> +	    ssif_bmc->state == SSIF_START ||
> +	    ssif_bmc->state == SSIF_REQ_RECVING ||
> +	    ssif_bmc->state == SSIF_SMBUS_CMD) {
> +		dev_warn(&ssif_bmc->client->dev,
> +			 "Warn: %s unexpected READ PROCESSED in state=%s\n",
> +			 __func__, state_to_string(ssif_bmc->state));
> +		ssif_bmc->state = SSIF_ABORTING;
> +		*val = 0;
> +		return;
> +	}
> +
> +	/* Send 0 if there is nothing to send */
> +	if (!ssif_bmc->response_in_progress || ssif_bmc->state == SSIF_ABORTING) {
> +		*val = 0;
> +		return;
> +	}
> +
> +	handle_read_processed(ssif_bmc, val);
> +}
> +
> +static void on_write_requested_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> +{
> +	if (ssif_bmc->state == SSIF_READY || ssif_bmc->state == SSIF_SMBUS_CMD) {
> +		ssif_bmc->state = SSIF_START;
> +
> +	} else if (ssif_bmc->state == SSIF_START ||
> +		   ssif_bmc->state == SSIF_REQ_RECVING ||
> +		   ssif_bmc->state == SSIF_RES_SENDING) {
> +		dev_warn(&ssif_bmc->client->dev,
> +			 "Warn: %s unexpected WRITE REQUEST in state=%s\n",
> +			 __func__, state_to_string(ssif_bmc->state));
> +		ssif_bmc->state = SSIF_ABORTING;
> +		return;
> +	}
> +
> +	ssif_bmc->msg_idx = 0;
> +	ssif_bmc->part_buf.address = *val;
> +}
> +
> +static void on_write_received_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> +{
> +	if (ssif_bmc->state == SSIF_READY ||
> +	    ssif_bmc->state == SSIF_RES_SENDING) {
> +		dev_warn(&ssif_bmc->client->dev,
> +			 "Warn: %s unexpected WRITE RECEIVED in state=%s\n",
> +			 __func__, state_to_string(ssif_bmc->state));
> +		ssif_bmc->state = SSIF_ABORTING;
> +
> +	} else if (ssif_bmc->state == SSIF_START) {
> +		ssif_bmc->state = SSIF_SMBUS_CMD;
> +
> +	} else if (ssif_bmc->state == SSIF_SMBUS_CMD) {
> +		if (!supported_write_cmd(ssif_bmc->part_buf.smbus_cmd)) {
> +			dev_warn(&ssif_bmc->client->dev, "Warn: Unknown SMBus write command=0x%x",
> +				 ssif_bmc->part_buf.smbus_cmd);
> +			ssif_bmc->aborting = true;
> +		}
> +
> +		if (ssif_bmc->aborting)
> +			ssif_bmc->state = SSIF_ABORTING;
> +		else
> +			ssif_bmc->state = SSIF_REQ_RECVING;
> +	}
> +
> +	/* This is response sending state */
> +	if (ssif_bmc->state == SSIF_REQ_RECVING)
> +		handle_write_received(ssif_bmc, val);
> +	else if (ssif_bmc->state == SSIF_SMBUS_CMD)
> +		process_smbus_cmd(ssif_bmc, val);
> +}
> +
> +static void on_stop_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> +{
> +	if (ssif_bmc->state == SSIF_READY ||
> +	    ssif_bmc->state == SSIF_START ||
> +	    ssif_bmc->state == SSIF_SMBUS_CMD ||
> +	    ssif_bmc->state == SSIF_ABORTING) {
> +		dev_warn(&ssif_bmc->client->dev,
> +			 "Warn: %s unexpected SLAVE STOP in state=%s\n",
> +			 __func__, state_to_string(ssif_bmc->state));
> +		ssif_bmc->state = SSIF_READY;
> +
> +	} else if (ssif_bmc->state == SSIF_REQ_RECVING) {
> +		if (validate_request_part(ssif_bmc)) {
> +			process_request_part(ssif_bmc);
> +			if (ssif_bmc->part_buf.smbus_cmd == SSIF_IPMI_SINGLEPART_WRITE ||
> +			    ssif_bmc->part_buf.smbus_cmd == SSIF_IPMI_MULTIPART_WRITE_END)
> +				handle_request(ssif_bmc);
> +			ssif_bmc->state = SSIF_READY;
> +		} else {
> +			/*
> +			 * A BMC that receives an invalid request drop the data for the write
> +			 * transaction and any further transactions (read or write) until
> +			 * the next valid read or write Start transaction is received
> +			 */
> +			dev_err(&ssif_bmc->client->dev, "Error: invalid pec\n");
> +			ssif_bmc->aborting = true;
> +		}
> +	} else if (ssif_bmc->state == SSIF_RES_SENDING) {
> +		if (ssif_bmc->is_singlepart_read || ssif_bmc->block_num == 0xFF)
> +			/* Invalidate response buffer to denote it is sent */
> +			complete_response(ssif_bmc);
> +		ssif_bmc->state = SSIF_READY;
> +	}
> +
> +	/* Reset message index */
> +	ssif_bmc->msg_idx = 0;
> +}
> +
> +/*
> + * Callback function to handle I2C slave events
> + */
> +static int ssif_bmc_cb(struct i2c_client *client, enum i2c_slave_event event, u8 *val)
> +{
> +	unsigned long flags;
> +	struct ssif_bmc_ctx *ssif_bmc = i2c_get_clientdata(client);
> +	int ret = 0;
> +
> +	spin_lock_irqsave(&ssif_bmc->lock, flags);
> +
> +	switch (event) {
> +	case I2C_SLAVE_READ_REQUESTED:
> +		on_read_requested_event(ssif_bmc, val);
> +		break;
> +
> +	case I2C_SLAVE_WRITE_REQUESTED:
> +		on_write_requested_event(ssif_bmc, val);
> +		break;
> +
> +	case I2C_SLAVE_READ_PROCESSED:
> +		on_read_processed_event(ssif_bmc, val);
> +		break;
> +
> +	case I2C_SLAVE_WRITE_RECEIVED:
> +		on_write_received_event(ssif_bmc, val);
> +		break;
> +
> +	case I2C_SLAVE_STOP:
> +		on_stop_event(ssif_bmc, val);
> +		break;
> +
> +	default:
> +		dev_warn(&ssif_bmc->client->dev, "Warn: Unknown i2c slave event\n");
> +		break;
> +	}
> +
> +	if (!ssif_bmc->aborting && ssif_bmc->busy)
> +		ret = -EBUSY;
> +
> +	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> +
> +	return ret;
> +}
> +
> +static int ssif_bmc_probe(struct i2c_client *client, const struct i2c_device_id *id)
> +{
> +	struct ssif_bmc_ctx *ssif_bmc;
> +	int ret;
> +
> +	ssif_bmc = devm_kzalloc(&client->dev, sizeof(*ssif_bmc), GFP_KERNEL);
> +	if (!ssif_bmc)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&ssif_bmc->lock);
> +
> +	init_waitqueue_head(&ssif_bmc->wait_queue);
> +	ssif_bmc->request_available = false;
> +	ssif_bmc->response_in_progress = false;
> +	ssif_bmc->busy = false;
> +	ssif_bmc->response_timer_inited = false;
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
> +	return 0;
> +out:
> +	devm_kfree(&client->dev, ssif_bmc);
> +	return ret;
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
> +	{ .compatible = "ssif-bmc" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, ssif_bmc_match);
> +
> +static const struct i2c_device_id ssif_bmc_id[] = {
> +	{ DEVICE_NAME, 0 },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(i2c, ssif_bmc_id);
> +
> +static struct i2c_driver ssif_bmc_driver = {
> +	.driver         = {
> +		.name           = DEVICE_NAME,
> +		.of_match_table = ssif_bmc_match,
> +	},
> +	.probe          = ssif_bmc_probe,
> +	.remove         = ssif_bmc_remove,
> +	.id_table       = ssif_bmc_id,
> +};
> +
> +module_i2c_driver(ssif_bmc_driver);
> +
> +MODULE_AUTHOR("Quan Nguyen <quan@os.amperecomputing.com>");
> +MODULE_AUTHOR("Chuong Tran <chuong@os.amperecomputing.com>");
> +MODULE_DESCRIPTION("Linux device driver of the BMC IPMI SSIF interface.");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/char/ipmi/ssif_bmc.h b/drivers/char/ipmi/ssif_bmc.h
> new file mode 100644
> index 000000000000..2c3fc2a4698f
> --- /dev/null
> +++ b/drivers/char/ipmi/ssif_bmc.h
> @@ -0,0 +1,107 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * The driver for BMC side of SSIF interface
> + *
> + * Copyright (c) 2022, Ampere Computing LLC
> + *
> + */
> +#ifndef __SSIF_BMC_H__
> +#define __SSIF_BMC_H__
> +

Is there any value in having a separate .h file for this?  Unless you
want to share something with the IPMI host side, which might make sense
on some of the message numbers, but not a big deal, and even then you
could put the .h file with the .c files.

Except for the userspace API, which I will address later.

> +#define DEVICE_NAME				"ipmi-ssif-host"
> +
> +#define GET_8BIT_ADDR(addr_7bit)		(((addr_7bit) << 1) & 0xff)
> +
> +/* A standard SMBus Transaction is limited to 32 data bytes */
> +#define MAX_PAYLOAD_PER_TRANSACTION		32
> +/* Transaction includes the address, the command, the length and the PEC byte */
> +#define MAX_TRANSACTION				(MAX_PAYLOAD_PER_TRANSACTION + 4)
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
> +/* Include netfn and cmd field */
> +#define MSG_PAYLOAD_LEN_MAX			254
> +/*
> + * IPMI 2.0 Spec, section 12.7 SSIF Timing,
> + * Request-to-Response Time is T6max(250ms) - T1max(20ms) - 3ms = 227ms
> + * Recover ssif_bmc from busy state if it takes up to 500ms
> + */
> +#define RESPONSE_TIMEOUT			500 /* ms */
> +

I seem to remember mentioning this before, but there is no reason to
pack the structures below.

And second, the following is a userspace API structures, so it needs to
be in its own file in include/uapi/linux, along with any supporting
things that users will need to use.  And your userspace code should be
using that file.

> +struct ssif_msg {
> +	u8 len;

Just to be 100% safe, it might be better to use a u16 on this.  The spec
sort of limits this to 255 bytes, but it also sort of leaves it open to
be larger.

> +	u8 payload[MSG_PAYLOAD_LEN_MAX];
> +} __packed;
> +
> +struct ssif_part_buffer {
> +	u8 address;
> +	u8 smbus_cmd;
> +	u8 length;
> +	u8 payload[MAX_PAYLOAD_PER_TRANSACTION];
> +	u8 pec;
> +	u8 index;
> +} __packed;
> +
> +/*
> + * SSIF internal states:
> + *   SSIF_READY         0x00 : Ready state
> + *   SSIF_START         0x01 : Start smbus transaction
> + *   SSIF_SMBUS_CMD     0x02 : Received SMBus command
> + *   SSIF_REQ_RECVING   0x03 : Receiving request
> + *   SSIF_RES_SENDING   0x04 : Sending response
> + *   SSIF_BAD_SMBUS     0x05 : Bad SMbus transaction
> + */
> +enum ssif_state {
> +	SSIF_READY,
> +	SSIF_START,
> +	SSIF_SMBUS_CMD,
> +	SSIF_REQ_RECVING,
> +	SSIF_RES_SENDING,
> +	SSIF_ABORTING,
> +	SSIF_STATE_MAX
> +};
> +
> +struct ssif_bmc_ctx {
> +	struct i2c_client	*client;
> +	struct miscdevice	miscdev;
> +	int			msg_idx;
> +	bool			pec_support;
> +	/* ssif bmc spinlock */
> +	spinlock_t		lock;
> +	wait_queue_head_t	wait_queue;
> +	u8			running;
> +	enum ssif_state		state;
> +	/* Timeout waiting for response */
> +	struct timer_list	response_timer;
> +	bool                    response_timer_inited;
> +	/* Flag to identify a Multi-part Read Transaction */
> +	bool			is_singlepart_read;
> +	u8			nbytes_processed;
> +	u8			remain_len;
> +	u8			recv_len;
> +	/* Block Number of a Multi-part Read Transaction */
> +	u8			block_num;
> +	bool			request_available;
> +	bool			response_in_progress;
> +	bool			busy;
> +	bool			aborting;
> +	/* Buffer for SSIF Transaction part*/
> +	struct ssif_part_buffer	part_buf;
> +	struct ssif_msg		response;
> +	struct ssif_msg		request;
> +};
> +
> +static inline struct ssif_bmc_ctx *to_ssif_bmc(struct file *file)
> +{
> +	return container_of(file->private_data, struct ssif_bmc_ctx, miscdev);
> +}
> +#endif /* __SSIF_BMC_H__ */
> -- 
> 2.35.1
> 
> 
