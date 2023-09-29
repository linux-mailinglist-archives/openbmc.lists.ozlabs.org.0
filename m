Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B71F57B3165
	for <lists+openbmc@lfdr.de>; Fri, 29 Sep 2023 13:29:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rxp6G4rnCz3cGC
	for <lists+openbmc@lfdr.de>; Fri, 29 Sep 2023 21:29:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1194 seconds by postgrey-1.37 at boromir; Fri, 29 Sep 2023 21:28:41 AEST
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rxp5525Nyz3cf0;
	Fri, 29 Sep 2023 21:28:40 +1000 (AEST)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Rxnb44sLPz6HJP5;
	Fri, 29 Sep 2023 19:06:08 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 29 Sep
 2023 12:08:36 +0100
Date: Fri, 29 Sep 2023 12:08:35 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Konstantin Aladyshev <aladyshev22@gmail.com>
Subject: Re: [PATCH 3/3] mctp: Add MCTP-over-KCS transport binding
Message-ID: <20230929120835.0000108e@Huawei.com>
In-Reply-To: <20230928123009.2913-4-aladyshev22@gmail.com>
References: <20230928123009.2913-1-aladyshev22@gmail.com>
	<20230928123009.2913-4-aladyshev22@gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
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
Cc: tmaimon77@gmail.com, minyard@acm.org, andrew@aj.id.au, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, avifishman70@gmail.com, edumazet@google.com, netdev@vger.kernel.org, linux-aspeed@lists.ozlabs.org, joel@jms.id.au, kuba@kernel.org, jk@codeconstruct.com.au, matt@codeconstruct.com.au, pabeni@redhat.com, openipmi-developer@lists.sourceforge.net, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 28 Sep 2023 15:30:09 +0300
Konstantin Aladyshev <aladyshev22@gmail.com> wrote:

> This change adds a MCTP KCS transport binding, as defined by the DMTF
> specificiation DSP0254 - "MCTP KCS Transport Binding".
> A MCTP protocol network device is created for each KCS channel found in
> the system.
> The interrupt code for the KCS state machine is based on the current
> IPMI KCS driver.
> 
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>

Drive by review as I was curious and might as well comment whilst reading.
Some comments seem to equally apply to other kcs drivers so maybe I'm
missing something...

Jonathan


> ---
>  drivers/net/mctp/Kconfig    |   8 +
>  drivers/net/mctp/Makefile   |   1 +
>  drivers/net/mctp/mctp-kcs.c | 624 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 633 insertions(+)
>  create mode 100644 drivers/net/mctp/mctp-kcs.c
> 
> diff --git a/drivers/net/mctp/Kconfig b/drivers/net/mctp/Kconfig
> index dc71657d9184..a37f7ba947c0 100644
> --- a/drivers/net/mctp/Kconfig
> +++ b/drivers/net/mctp/Kconfig
> @@ -33,6 +33,14 @@ config MCTP_TRANSPORT_I2C
>  	  from DMTF specification DSP0237. A MCTP protocol network device is
>  	  created for each I2C bus that has been assigned a mctp-i2c device.
>  
> +config MCTP_TRANSPORT_KCS
> +	tristate "MCTP KCS transport"
> +	depends on IPMI_KCS_BMC
> +	help
> +	  Provides a driver to access MCTP devices over KCS transport, from
> +	  DMTF specification DSP0254. A MCTP protocol network device is
> +	  created for each KCS channel found in the system.
> +
>  endmenu
>  
>  endif
> diff --git a/drivers/net/mctp/Makefile b/drivers/net/mctp/Makefile
> index 1ca3e6028f77..885339a40f22 100644
> --- a/drivers/net/mctp/Makefile
> +++ b/drivers/net/mctp/Makefile
> @@ -1,2 +1,3 @@
>  obj-$(CONFIG_MCTP_SERIAL) += mctp-serial.o
>  obj-$(CONFIG_MCTP_TRANSPORT_I2C) += mctp-i2c.o
> +obj-$(CONFIG_MCTP_TRANSPORT_KCS) += mctp-kcs.o
> diff --git a/drivers/net/mctp/mctp-kcs.c b/drivers/net/mctp/mctp-kcs.c
> new file mode 100644
> index 000000000000..8d8b77ad709c
> --- /dev/null
> +++ b/drivers/net/mctp/mctp-kcs.c
> @@ -0,0 +1,624 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Management Component Transport Protocol (MCTP) KCS transport binding.
> + * This driver is an implementation of the DMTF specificiation
> + * "DSP0254 - Management Component Transport Protocol (MCTP) KCS Transport
> + * Binding", available at:
> + *
> + * https://www.dmtf.org/sites/default/files/standards/documents/DSP0254_1.0.0.pdf
> + *
> + * This driver provides DSP0254-type MCTP-over-KCS transport using a Linux
> + * KCS client subsystem.
> + *
> + * Copyright (c) 2023 Konstantin Aladyshev <aladyshev22@gmail.com>
> + */
> +
> +#include <linux/if_arp.h>
> +#include <linux/ipmi_kcs.h>
> +#include <linux/kcs_bmc_client.h>
> +#include <linux/mctp.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
Check these.  There aren't any mutex's in here that I noticed...

> +#include <linux/netdevice.h>
> +#include <net/mctp.h>
> +#include <net/mctpdevice.h>
> +#include <net/pkt_sched.h>

> +// According to SMBUS spec, the polynomial is:
> +// // C(x) = X^8 + X^2 + X^1 + 1, which is 0x107,
> +// // just ignore bit8 in definition.
I'm confused by this part. Is this calling out a specification issue, or
something that the relevant specs make clear?  If the second, add a reference.
If it's a specification issue that's fine, but are we sure it will get resolved
hwo you've done it here?
> +#define MCTP_KCS_PACKET_ERROR_CODE_POLY 0x07
> +//


> +
> +static void mctp_kcs_rx_work(struct work_struct *work)
> +{
> +	struct mctp_kcs *mkcs = container_of(work, struct mctp_kcs, rx_work);
> +	struct mctp_skb_cb *cb;
> +	struct sk_buff *skb;
> +	unsigned long flags;
> +	int rc;
> +	int i;
> +	struct mctp_kcs_header *kcs_header;
> +	int data_len;
> +	int data_in_idx;
> +
> +	spin_lock_irqsave(&mkcs->lock, flags);
> +	for (i = 0; i < (mkcs->data_in_idx); i++)
> +		dev_dbg(mkcs->client.dev->dev, "%s: data_in[%d]=0x%02x",
> +			__func__, i, mkcs->data_in[i]);
> +
> +	data_len = mkcs->data_in_idx - sizeof(struct mctp_kcs_header) -
> +		   sizeof(struct mctp_kcs_trailer);
> +	if (mkcs->phase != KCS_PHASE_WRITE_DONE) {
> +		dev_err(mkcs->client.dev->dev,
> +			"%s: error! Wrong KCS stage at the end of data read (phase=%d)",
> +			__func__, mkcs->phase);
> +		mkcs->netdev->stats.rx_dropped++;
> +		spin_unlock_irqrestore(&mkcs->lock, flags);
> +		return;
> +	}
> +
> +	mkcs->phase = KCS_PHASE_WAIT_READ;
> +	data_in_idx = mkcs->data_in_idx;
> +	mkcs->data_in_idx = 0;
> +
> +	skb = netdev_alloc_skb(mkcs->netdev, data_len);
> +	if (!skb) {
> +		mkcs->netdev->stats.rx_dropped++;
> +		spin_unlock_irqrestore(&mkcs->lock, flags);

I'd use a sequence of gotos and labels to deal with the different cleanup.

> +		return;
> +	}
> +
> +	kcs_header = (struct mctp_kcs_header *)mkcs->data_in;
> +	rc = mctp_kcs_validate_data(mkcs, kcs_header, data_in_idx);
> +	if (rc) {
> +		dev_err(mkcs->client.dev->dev,
> +			"%s: error! Binding validation failed", __func__);
> +		dev_kfree_skb(skb);
> +		spin_unlock_irqrestore(&mkcs->lock, flags);
> +		return;
> +	}
> +
> +	skb->protocol = htons(ETH_P_MCTP);
> +	skb_put_data(skb, mkcs->data_in + sizeof(struct mctp_kcs_header),
> +		     data_len);
> +	spin_unlock_irqrestore(&mkcs->lock, flags);
> +	skb_reset_network_header(skb);
> +
> +	cb = __mctp_cb(skb);
> +	cb->halen = 0;
> +
> +	netif_rx(skb);
> +	mkcs->netdev->stats.rx_packets++;
> +	mkcs->netdev->stats.rx_bytes += data_len;
> +}
> +

> +static void mctp_kcs_setup(struct net_device *ndev)
> +{
> +	ndev->type = ARPHRD_MCTP;
> +
> +	/* we limit at the fixed MTU, which is also the MCTP-standard
> +	 * baseline MTU, so is also our minimum
> +	 */
> +	ndev->mtu = MCTP_KCS_MTU;
> +	ndev->max_mtu = MCTP_KCS_MTU;
> +	ndev->min_mtu = MCTP_KCS_MTU;
> +
> +	ndev->hard_header_len = 0;
> +	ndev->addr_len = 0;
> +	ndev->tx_queue_len = DEFAULT_TX_QUEUE_LEN;
> +	ndev->flags = IFF_NOARP;
> +	ndev->netdev_ops = &mctp_kcs_netdev_ops;
> +	ndev->needs_free_netdev = true;
> +}
> +
> +static void kcs_bmc_ipmi_force_abort(struct mctp_kcs *mkcs)
> +{
> +	dev_err(mkcs->client.dev->dev,
> +		"Error! Force abort on KCS communication");
> +	set_state(mkcs, ERROR_STATE);
> +	kcs_bmc_read_data(mkcs->client.dev);
> +	kcs_bmc_write_data(mkcs->client.dev, KCS_ZERO_DATA);
> +	mkcs->phase = KCS_PHASE_ERROR;
> +	mkcs->data_in_idx = 0;
> +}
> +
> +static void kcs_bmc_ipmi_handle_data(struct mctp_kcs *mkcs)
> +{
> +	struct kcs_bmc_device *dev;
> +	u8 data;
> +
> +	dev = mkcs->client.dev;
As below, I'd put this on the line defining the local variable and rename it.

> +
> +	switch (mkcs->phase) {
> +	case KCS_PHASE_WRITE_START:
> +		dev_dbg(dev->dev, "%s: KCS_PHASE_WRITE_START", __func__);
> +		mkcs->phase = KCS_PHASE_WRITE_DATA;
> +		fallthrough;
> +
> +	case KCS_PHASE_WRITE_DATA:
> +		dev_dbg(dev->dev, "%s: KCS_PHASE_WRITE_DATA", __func__);
> +		if (mkcs->data_in_idx < KCS_MSG_BUFSIZ) {
> +			set_state(mkcs, WRITE_STATE);
> +			kcs_bmc_write_data(dev, KCS_ZERO_DATA);
> +			mkcs->data_in[mkcs->data_in_idx++] =
> +				kcs_bmc_read_data(dev);
> +			dev_dbg(dev->dev,
> +				"%s: KCS_PHASE_WRITE_DATA: data_in[%d]=0x%02x",
> +				__func__, mkcs->data_in_idx - 1,
> +				mkcs->data_in[mkcs->data_in_idx - 1]);
> +		} else {
> +			kcs_bmc_ipmi_force_abort(mkcs);
> +			mkcs->error = KCS_LENGTH_ERROR;
> +		}
> +		break;
> +
> +	case KCS_PHASE_WRITE_END_CMD:
> +		dev_dbg(dev->dev, "%s: KCS_PHASE_WRITE_END_CMD", __func__);
> +		if (mkcs->data_in_idx < KCS_MSG_BUFSIZ) {
> +			set_state(mkcs, READ_STATE);
> +			mkcs->data_in[mkcs->data_in_idx++] =
> +				kcs_bmc_read_data(dev);
> +			dev_dbg(dev->dev,
> +				"%s: KCS_PHASE_WRITE_END_CMD: data_in[%d]=0x%02x",
> +				__func__, mkcs->data_in_idx - 1,
> +				mkcs->data_in[mkcs->data_in_idx - 1]);
> +			mkcs->phase = KCS_PHASE_WRITE_DONE;
> +			schedule_work(&mkcs->rx_work);
> +		} else {
> +			kcs_bmc_ipmi_force_abort(mkcs);
> +			mkcs->error = KCS_LENGTH_ERROR;
> +		}
> +		break;
> +
> +	case KCS_PHASE_READ:
> +		dev_dbg(dev->dev,
> +			"%s: KCS_PHASE_READ, data_out_idx=%d, data_out_len=%d",
> +			__func__, mkcs->data_out_idx, mkcs->data_out_len);
> +		if (mkcs->data_out_idx == mkcs->data_out_len)
> +			set_state(mkcs, IDLE_STATE);
> +
> +		data = kcs_bmc_read_data(dev);
> +		if (data != KCS_CMD_READ_BYTE) {
> +			dev_dbg(dev->dev,
> +				"%s: error! data is not equal to KCS_CMD_READ_BYTE",
> +				__func__);
> +			set_state(mkcs, ERROR_STATE);
> +			kcs_bmc_write_data(dev, KCS_ZERO_DATA);
> +			break;
> +		}
> +
> +		if (mkcs->data_out_idx == mkcs->data_out_len) {
> +			kcs_bmc_write_data(dev, KCS_ZERO_DATA);
> +			mkcs->netdev->stats.tx_bytes += mkcs->data_out_len;
> +			mkcs->netdev->stats.tx_packets++;
> +			mkcs->phase = KCS_PHASE_IDLE;
> +			if (netif_queue_stopped(mkcs->netdev))
> +				netif_start_queue(mkcs->netdev);
> +			break;
> +		}
> +
> +		dev_dbg(dev->dev, "%s: KCS_PHASE_READ: data_out[%d]=0x%02x",
> +			__func__, mkcs->data_out_idx,
> +			mkcs->data_out[mkcs->data_out_idx]);
> +		kcs_bmc_write_data(dev, mkcs->data_out[mkcs->data_out_idx++]);
> +		break;
> +
> +	case KCS_PHASE_ABORT_ERROR1:
> +		dev_dbg(dev->dev, "%s: KCS_PHASE_ABORT_ERROR1", __func__);
> +		set_state(mkcs, READ_STATE);
> +		kcs_bmc_read_data(dev);
> +		kcs_bmc_write_data(dev, mkcs->error);
> +		mkcs->phase = KCS_PHASE_ABORT_ERROR2;
> +		break;
> +
> +	case KCS_PHASE_ABORT_ERROR2:
> +		dev_dbg(dev->dev, "%s: KCS_PHASE_ABORT_ERROR2", __func__);
> +		set_state(mkcs, IDLE_STATE);
> +		kcs_bmc_read_data(dev);
> +		kcs_bmc_write_data(dev, KCS_ZERO_DATA);
> +		mkcs->phase = KCS_PHASE_IDLE;
> +		break;
> +
> +	default:
> +		dev_dbg(dev->dev, "%s: unknown KCS phase", __func__);
> +		kcs_bmc_ipmi_force_abort(mkcs);
> +		break;
> +	}
> +}
> +
> +static void kcs_bmc_ipmi_handle_cmd(struct mctp_kcs *mkcs)
> +{
> +	struct kcs_bmc_device *dev;
> +	u8 cmd;
> +
> +	dev = mkcs->client.dev;
Might as well save a few lines as it doesn't hurt readability.

	struct kcs_bmc_device *dev = mkcs->client.dev;

> +
> +	set_state(mkcs, WRITE_STATE);
> +	kcs_bmc_write_data(mkcs->client.dev, KCS_ZERO_DATA);
> +
> +	cmd = kcs_bmc_read_data(mkcs->client.dev);
> +	switch (cmd) {
Local variable doesn't add anything really and you should use your handy
'dev'.  Maybe rename dev, as most readers will assume it's a struct device
and get confused (briefly) at the dev->dev bits in here.


	switch (kcs_bmc_read_data(dev)) {

> +	case KCS_CMD_WRITE_START:
> +		dev_dbg(dev->dev, "%s: KCS_CMD_WRITE_START", __func__);
> +		mkcs->phase = KCS_PHASE_WRITE_START;
> +		mkcs->error = KCS_NO_ERROR;
> +		mkcs->data_in_idx = 0;
> +		break;
> +
> +	case KCS_CMD_WRITE_END:
> +		dev_dbg(dev->dev, "%s: KCS_CMD_WRITE_END", __func__);
> +		if (mkcs->phase != KCS_PHASE_WRITE_DATA) {
> +			kcs_bmc_ipmi_force_abort(mkcs);
> +			break;
> +		}
> +		mkcs->phase = KCS_PHASE_WRITE_END_CMD;
> +		break;
> +
> +	case KCS_CMD_GET_STATUS_ABORT:
> +		dev_dbg(dev->dev, "%s: KCS_CMD_GET_STATUS_ABORT", __func__);
> +		if (mkcs->error == KCS_NO_ERROR)
> +			mkcs->error = KCS_ABORTED_BY_COMMAND;
> +
> +		mkcs->phase = KCS_PHASE_ABORT_ERROR1;
> +		mkcs->data_in_idx = 0;
> +		break;
> +
> +	default:
> +		dev_dbg(dev->dev, "%s: unknown KCS command", __func__);
> +		kcs_bmc_ipmi_force_abort(mkcs);
> +		mkcs->error = KCS_ILLEGAL_CONTROL_CODE;
> +		break;
> +	}
> +}
> +
> +static inline struct mctp_kcs *client_to_mctp_kcs(struct kcs_bmc_client *client)
> +{
> +	return container_of(client, struct mctp_kcs, client);
> +}
> +
> +static irqreturn_t kcs_bmc_mctp_event(struct kcs_bmc_client *client)
> +{
> +	struct mctp_kcs *mkcs;
> +	u8 status;
> +	int ret;
> +
> +	mkcs = client_to_mctp_kcs(client);
> +	if (!mkcs) {
> +		dev_err(client->dev->dev,
> +			"%s: error! can't find mctp_kcs from KCS client",
> +			__func__);
> +		return IRQ_NONE;
> +	}
> +
> +	spin_lock(&mkcs->lock);
> +
> +	status = kcs_bmc_read_status(client->dev);
> +	if (status & KCS_STATUS_IBF) {
> +		if (status & KCS_STATUS_CMD_DAT)
> +			kcs_bmc_ipmi_handle_cmd(mkcs);
> +		else
> +			kcs_bmc_ipmi_handle_data(mkcs);
> +
> +		ret = IRQ_HANDLED;
> +	} else {
> +		ret = IRQ_NONE;
> +	}
> +
> +	spin_unlock(&mkcs->lock);
> +
> +	return ret;
> +}
> +
> +static const struct kcs_bmc_client_ops kcs_bmc_mctp_client_ops = {
> +	.event = kcs_bmc_mctp_event,
> +};
> +
> +static DEFINE_SPINLOCK(kcs_bmc_mctp_instances_lock);
> +static LIST_HEAD(kcs_bmc_mctp_instances);
As mentioned below, this seems to be only used to find some data again
in remove. Lots of cleaner ways to do that than a list in the driver.
I'd explore the alternatives.

> +
> +static int kcs_bmc_mctp_add_device(struct kcs_bmc_device *kcs_bmc)
> +{
> +	struct mctp_kcs *mkcs;
> +	struct net_device *ndev;
> +	char name[32];
> +	int rc;
> +
> +	snprintf(name, sizeof(name), "mctpkcs%d", kcs_bmc->channel);
> +
> +	ndev = alloc_netdev(sizeof(*mkcs), name, NET_NAME_ENUM, mctp_kcs_setup);
Interesting that there is an explicit devm_register_netdev() but not one for
this simple allocation case (there is one for the ethernet specific version).
Never mind, we have devm_add_action_or_reset() for that.  Just create a
small wrapper for free_netdev() (which will look like devm_free_netdev()
in net/devres.c but that's local to that file) and add

	rc = devm_add_action_or_reset(&kcs_bmc->dev,
				      wrapper_for_free_netdev(), ndev);
	if (rc)
		return rc;
 
> +	if (!ndev) {
> +		dev_err(kcs_bmc->dev,
> +			"alloc_netdev failed for KCS channel %d\n",
> +			kcs_bmc->channel);
No idea if the kcs subsystem handles deferred probing right, but in general
anything called just in 'probe' routines can use dev_err_probe() to pretty
print errors and also register any deferred cases with the logging stuff that
lets you find out why they were deferred.

> +		rc = -ENOMEM;
> +		goto err;
In general I find it easier to follow code that only uses a goto if there
is shared cleanup to do.
		return -ENOMEM; and for this path I don't need to read further.
> +	}
> +
> +	mkcs = netdev_priv(ndev);
> +	mkcs->netdev = ndev;
> +	mkcs->client.dev = kcs_bmc;
> +	mkcs->client.ops = &kcs_bmc_mctp_client_ops;
> +	mkcs->data_in = devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
> +	mkcs->data_out = devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERNEL);

You should not be mixing device manged cleanup and manual cleanup.  Rule of thumb
is don't call any devm_ functions in a 'probe / add' type routine after you pass
the first element that requires manual cleanup. Otherwise you get horrible
race conditions or if not that, just code that is hard to check for them.

> +	if (!mkcs->data_in || !mkcs->data_out) {
Check these independently.  It costs a few extra lines but give more explicit
messages and keeps ordering etc simpler.

> +		dev_err(kcs_bmc->dev,
> +			"failed to allocate data buffers for KCS channel %d\n",
> +			kcs_bmc->channel);
> +		rc = -ENOMEM;
> +		goto free_netdev;
> +	}
> +
> +	INIT_WORK(&mkcs->rx_work, mctp_kcs_rx_work);
> +
> +	rc = register_netdev(ndev);

after change above, devm_register_netdev()

> +	if (rc)
> +		goto free_netdev;
> +
> +	spin_lock_irq(&kcs_bmc_mctp_instances_lock);
> +	list_add(&mkcs->entry, &kcs_bmc_mctp_instances);

Add a callback and devm_add_action_or_reset() to unwind this as well.

> +	spin_unlock_irq(&kcs_bmc_mctp_instances_lock);
> +
> +	dev_info(kcs_bmc->dev, "Add MCTP client for the KCS channel %d",
> +		 kcs_bmc->channel);
> +	return 0;
> +
> +free_netdev:
> +	if (ndev)

How do you get here with ndev not set?  If there is a path, that's probably
a bug.

> +		free_netdev(ndev);
> +
> +err:
> +	return rc;
> +}
> +
> +static int kcs_bmc_mctp_remove_device(struct kcs_bmc_device *kcs_bmc)
> +{
> +	struct mctp_kcs *mkcs = NULL, *pos;
> +
> +	dev_info(kcs_bmc->dev, "Remove MCTP client for the KCS channel %d",
> +		 kcs_bmc->channel);
> +	spin_lock_irq(&kcs_bmc_mctp_instances_lock);
> +	list_for_each_entry(pos, &kcs_bmc_mctp_instances, entry) {
> +		if (pos->client.dev == kcs_bmc) {
> +			mkcs = pos;
> +			list_del(&pos->entry);
> +			break;
I don't know the kcs stuff at all but these seems 'unusual'.
Can't you stash  device_set_drvdata(kcs_bmc->dev) or does it
just match the structure containing the client pointed to
by kcs_bmc_device? If so use something like
container_of(kcs_bmc->client, struct mctp_kcs, client);
Ah. You already have a function for that.  Why not use that here?

There isn't normally a reason for a driver to maintain an
additional list like this.

> +		}
> +	}
> +	spin_unlock_irq(&kcs_bmc_mctp_instances_lock);
> +
> +	if (!mkcs)
> +		return -ENODEV;
> +
> +	unregister_netdev(mkcs->netdev);
> +	free_netdev(mkcs->netdev);

This stuff should be opposite order of add above, or leave it to devm to clean up.

> +	kcs_bmc_disable_device(mkcs->client.dev, &mkcs->client);

This doesn't match with stuff in add - so I'd like a comment to explain
why it is here.  Also needs a comment on the ordering.  Perhaps this
is why you can't use devm for all the above, in which case I'd use it
nowhere in this driver.
I'm also confused on relationship between mks->client.dev and kcs_bmc
(I'm fairly sure they are the same, so just use kcs_bmc here).



> +	devm_kfree(kcs_bmc->dev, mkcs->data_in);
> +	devm_kfree(kcs_bmc->dev, mkcs->data_out);

Alarm bells occur whenever an explicit devm_kfree turns up in
except in complex corner cases. Please look at how devm based
resource management works. These should not be here.

Also, remove_device should either do things in the opposite order
to add_device, or it should have comments saying why not!


> +	return 0;
> +}
> +
> +static const struct kcs_bmc_driver_ops kcs_bmc_mctp_driver_ops = {
> +	.add_device = kcs_bmc_mctp_add_device,
> +	.remove_device = kcs_bmc_mctp_remove_device,
> +};
> +
> +static struct kcs_bmc_driver kcs_bmc_mctp_driver = {
> +	.ops = &kcs_bmc_mctp_driver_ops,
> +};
> +
> +static int __init mctp_kcs_init(void)
> +{
> +	kcs_bmc_register_driver(&kcs_bmc_mctp_driver);
> +	return 0;
> +}
> +
> +static void __exit mctp_kcs_exit(void)
> +{
> +	kcs_bmc_unregister_driver(&kcs_bmc_mctp_driver);
> +}

Hmm. So kcs is a very small subsystem hence no one has done the usual
module_kcs_driver() wrapper (see something like module_i2c_driver)
for an example.  You can just use the underlying macro directly
though to get rid of most of this boilerplate.


module_driver(kcs_bmc_mctp_driver, kcs_bmc_register_driver,
	      kcs_bmc_uregister_driver);

> +
> +module_init(mctp_kcs_init);
> +module_exit(mctp_kcs_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Konstantin Aladyshev <aladyshev22@gmail.com>");
> +MODULE_DESCRIPTION("MCTP KCS transport");

