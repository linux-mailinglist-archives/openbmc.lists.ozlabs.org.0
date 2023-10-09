Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9307BF15A
	for <lists+openbmc@lfdr.de>; Tue, 10 Oct 2023 05:23:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bUfBYNqu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4Lnb2pt0z3cR9
	for <lists+openbmc@lfdr.de>; Tue, 10 Oct 2023 14:22:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bUfBYNqu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S3zPM1Qptz3c2t;
	Mon,  9 Oct 2023 23:49:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 37B3BB81112;
	Mon,  9 Oct 2023 12:49:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3FB2C433C8;
	Mon,  9 Oct 2023 12:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696855745;
	bh=PiW/4e+YMaSk0D8DipHG9tZqPo12GUrmPNRbRCbzOLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bUfBYNquI0sUPjHdmSI4tq0RHmYnq87KAGms3P6zFvUFkeEHgcd0d1BWLUfBYbNbd
	 2h/449HyIK79pzsHhpCCR5OL0RWySkLIqWGMFy+tgWP9uigYTrGo3mmBwiB4IEP2/m
	 tmsTq5/a/ZwlL73wIASGeaGjqsp3mH8rxxY0G8x9FKxBV9HPXE9SZHKOCI6JIV5ozH
	 vpJ2UoG7IoomHZPlzGpkAvfRTg+gCKJWue045y6KZ7fQmYm2d5DlW0lowzOIWPj1+0
	 8bDXO3qdJMjlygSvWGzPJoSMsufss1el5eaPHIskx25yYpkTDsE6M/tS0LPsUqeJ0C
	 0L3A6X7qPkgMQ==
Date: Mon, 9 Oct 2023 14:48:58 +0200
From: Simon Horman <horms@kernel.org>
To: Konstantin Aladyshev <aladyshev22@gmail.com>
Subject: Re: [PATCH v4 3/3] mctp: Add MCTP-over-KCS transport binding
Message-ID: <ZSP2ug4V0MGGGGFq@kernel.org>
References: <20231006100214.396-1-aladyshev22@gmail.com>
 <20231006100214.396-4-aladyshev22@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006100214.396-4-aladyshev22@gmail.com>
X-Mailman-Approved-At: Tue, 10 Oct 2023 14:15:18 +1100
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

On Fri, Oct 06, 2023 at 01:02:14PM +0300, Konstantin Aladyshev wrote:
> This change adds a MCTP KCS transport binding, as defined by the DMTF
> specificiation DSP0254 - "MCTP KCS Transport Binding".

nit: specification

     checkpatch.pl --codespell is helpful here

> A MCTP protocol network device is created for each KCS channel found in
> the system.
> The interrupt code for the KCS state machine is based on the current
> IPMI KCS driver.
> 
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
> ---
>  drivers/net/mctp/Kconfig    |   8 +
>  drivers/net/mctp/Makefile   |   1 +
>  drivers/net/mctp/mctp-kcs.c | 594 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 603 insertions(+)
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

nit: specification

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
> index 000000000000..2ea2ab00c188
> --- /dev/null
> +++ b/drivers/net/mctp/mctp-kcs.c
> @@ -0,0 +1,594 @@
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
> +#include <linux/i2c.h>
> +#include <linux/if_arp.h>
> +#include <linux/ipmi_kcs.h>
> +#include <linux/kcs_bmc_client.h>
> +#include <linux/mctp.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/netdevice.h>
> +#include <net/mctp.h>
> +#include <net/mctpdevice.h>
> +#include <net/pkt_sched.h>
> +
> +#define MCTP_KCS_MTU 64
> +#define KCS_MSG_BUFSIZ 1000
> +
> +struct mctp_kcs {
> +	struct list_head entry;
> +
> +	/* protects rx & tx state machines */
> +	spinlock_t lock;
> +
> +	struct kcs_bmc_client client;
> +	struct net_device *netdev;
> +
> +	enum kcs_ipmi_phases phase;
> +	enum kcs_ipmi_errors error;
> +
> +	int data_in_idx;

Perhaps data_in_idx could be unsigned, unless it can hold negative values.

> +	u8 *data_in;
> +
> +	int data_out_idx;
> +	int data_out_len;

Likewise for data_out_idx and data_out_len.

> +	u8 *data_out;
> +
> +	struct work_struct rx_work;
> +};
> +
> +struct mctp_kcs_header {
> +	u8 netfn_lun;
> +	u8 defining_body;
> +	u8 len;
> +} __packed;
> +
> +struct mctp_kcs_trailer {
> +	u8 pec;
> +} __packed;
> +
> +#define MCTP_KCS_NETFN_LUN 0xb0
> +#define DEFINING_BODY_DMTF_PRE_OS_WORKING_GROUP 0x01
> +
> +static int mctp_kcs_validate_data(struct mctp_kcs *mkcs,
> +				  struct mctp_kcs_header *hdr, int len)
> +{
> +	struct net_device *ndev = mkcs->netdev;
> +	struct mctp_kcs_trailer *tlr;
> +	u8 pec;
> +
> +	if (hdr->netfn_lun != MCTP_KCS_NETFN_LUN) {
> +		dev_err(mkcs->client.dev->dev,
> +			"%s: KCS binding header error! netfn_lun = 0x%02x, but should be 0x%02x",
> +			__func__, hdr->netfn_lun, MCTP_KCS_NETFN_LUN);
> +		ndev->stats.rx_dropped++;
> +		return -EINVAL;
> +	}
> +	if (hdr->defining_body != DEFINING_BODY_DMTF_PRE_OS_WORKING_GROUP) {
> +		dev_err(mkcs->client.dev->dev,
> +			"%s: KCS binding header error! defining_body = 0x%02x, but should be 0x%02x",
> +			__func__, hdr->defining_body,
> +			DEFINING_BODY_DMTF_PRE_OS_WORKING_GROUP);
> +		ndev->stats.rx_dropped++;
> +		return -EINVAL;
> +	}
> +	if (hdr->len != (u8)(len - sizeof(struct mctp_kcs_header) -
> +			     sizeof(struct mctp_kcs_trailer))) {

It's not clear what stops this, and the similar logic in mctp_kcs_rx_work()
from underflowing in the presence of bad input.

> +		dev_err(mkcs->client.dev->dev,
> +			"%s: KCS binding header error! len = 0x%02x, but should be 0x%02x",
> +			__func__, hdr->len,
> +			(u8)(len - sizeof(struct mctp_kcs_header) -
> +			     sizeof(struct mctp_kcs_trailer)));
> +		ndev->stats.rx_length_errors++;
> +		return -EINVAL;
> +	}
> +
> +	pec = i2c_smbus_pec(0, (u8 *)(hdr + 1), hdr->len);
> +	tlr = (struct mctp_kcs_trailer *)((u8 *)(hdr + 1) + hdr->len);
> +	if (pec != tlr->pec) {
> +		dev_err(mkcs->client.dev->dev,
> +			"%s: PEC error! Packet value=0x%02x, calculated value=0x%02x",
> +			__func__, tlr->pec, pec);
> +		ndev->stats.rx_crc_errors++;
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
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

nit: please arrange local variables in Networking code in reverse xmas tree
     order - longest line to shortest.

     This can be helpful: https://github.com/ecree-solarflare/xmastree

> +
> +	spin_lock_irqsave(&mkcs->lock, flags);
> +	for (i = 0; i < (mkcs->data_in_idx); i++)
> +		dev_dbg(mkcs->client.dev->dev, "%s: data_in[%d]=0x%02x",
> +			__func__, i, mkcs->data_in[i]);

I'm unsure if it went out of fashion for some reason,
but perhaps print_hex_dump_bytes() or similar is useful here.

> +
> +	data_len = mkcs->data_in_idx - sizeof(struct mctp_kcs_header) -
> +		   sizeof(struct mctp_kcs_trailer);

Perhaps it makes sense to move the check below so that is is
above the calculation above, thus groping handling of data_in_idx together.

Also could data_len be calculated in and returned by
mctp_kcs_validate_data() ?

> +	if (mkcs->phase != KCS_PHASE_WRITE_DONE) {
> +		dev_err(mkcs->client.dev->dev,
> +			"%s: error! Wrong KCS stage at the end of data read (phase=%d)",
> +			__func__, mkcs->phase);
> +		mkcs->netdev->stats.rx_dropped++;
> +		goto unlock_irq;
> +	}
> +
> +	mkcs->phase = KCS_PHASE_WAIT_READ;
> +	data_in_idx = mkcs->data_in_idx;
> +	mkcs->data_in_idx = 0;
> +
> +	skb = netdev_alloc_skb(mkcs->netdev, data_len);
> +	if (!skb) {
> +		mkcs->netdev->stats.rx_dropped++;
> +		goto unlock_irq;
> +	}

Would it make sense to allocate the skb after calling
mctp_kcs_validate_data() ?

> +
> +	kcs_header = (struct mctp_kcs_header *)mkcs->data_in;


Similar to my comment above on underflow.
It's unclear to me what ensures that the header is present
in data_in.

Also, as kcs_header is only passed to mctp_kcs_validate_data,
which also has access to mkcs, perhaps it could be
extracted in mctp_kcs_validate_data().

> +	rc = mctp_kcs_validate_data(mkcs, kcs_header, data_in_idx);
> +	if (rc) {
> +		dev_err(mkcs->client.dev->dev,
> +			"%s: error! Binding validation failed", __func__);
> +		dev_kfree_skb(skb);
> +		goto unlock_irq;
> +	}
> +
> +	skb->protocol = htons(ETH_P_MCTP);
> +	skb_put_data(skb, mkcs->data_in + sizeof(struct mctp_kcs_header),
> +		     data_len);
> +	skb_reset_network_header(skb);
> +
> +	cb = __mctp_cb(skb);
> +	cb->halen = 0;
> +
> +	netif_rx(skb);
> +	mkcs->netdev->stats.rx_packets++;
> +	mkcs->netdev->stats.rx_bytes += data_len;
> +
> +unlock_irq:
> +	spin_unlock_irqrestore(&mkcs->lock, flags);
> +}
> +
> +static netdev_tx_t mctp_kcs_start_xmit(struct sk_buff *skb,
> +				       struct net_device *ndev)
> +{
> +	struct mctp_kcs_header *kcs_header;
> +	unsigned long flags;
> +	int i;
> +	struct mctp_kcs *mkcs = netdev_priv(ndev);
> +
> +	if (skb->len > MCTP_KCS_MTU) {
> +		dev_err(&ndev->dev, "%s: error! skb len is bigger than MTU",
> +			__func__);
> +		ndev->stats.tx_dropped++;
> +		goto out;
> +	}
> +
> +	spin_lock_irqsave(&mkcs->lock, flags);
> +	if (mkcs->phase != KCS_PHASE_WAIT_READ) {
> +		dev_err(&ndev->dev,
> +			"%s: error! Wrong KCS stage at the start of data write (phase=%d)",
> +			__func__, mkcs->phase);
> +		dev_kfree_skb(skb);
> +		spin_unlock_irqrestore(&mkcs->lock, flags);
> +		return NETDEV_TX_BUSY;
> +	}
> +
> +	netif_stop_queue(ndev);
> +	mkcs->phase = KCS_PHASE_READ;
> +	kcs_header = (struct mctp_kcs_header *)mkcs->data_out;
> +	kcs_header->netfn_lun = MCTP_KCS_NETFN_LUN;
> +	kcs_header->defining_body = DEFINING_BODY_DMTF_PRE_OS_WORKING_GROUP;
> +	kcs_header->len = skb->len;
> +	skb_copy_bits(skb, 0, kcs_header + 1, skb->len);
> +	mkcs->data_out[sizeof(struct mctp_kcs_header) + skb->len] =
> +		i2c_smbus_pec(0, (u8 *)(kcs_header + 1), skb->len);
> +	mkcs->data_out_idx = 1;
> +	mkcs->data_out_len = skb->len + sizeof(struct mctp_kcs_header) +
> +			     sizeof(struct mctp_kcs_trailer);
> +
> +	for (i = 0; i < (mkcs->data_out_len); i++)
> +		dev_dbg(&ndev->dev, "%s: data_out[%d]=0x%02x", __func__, i,
> +			mkcs->data_out[i]);
> +
> +	// Write first data byte to initialize transmission
> +	kcs_bmc_write_data(mkcs->client.dev, mkcs->data_out[0]);
> +
> +	spin_unlock_irqrestore(&mkcs->lock, flags);
> +out:
> +	dev_kfree_skb(skb);
> +	return NETDEV_TX_OK;
> +}
> +
> +static void set_state(struct mctp_kcs *mkcs, u8 state)
> +{
> +	dev_dbg(mkcs->client.dev->dev, "%s: state=0x%02x", __func__, state);
> +	kcs_bmc_update_status(mkcs->client.dev, KCS_STATUS_STATE_MASK,
> +			      KCS_STATUS_STATE(state));
> +}
> +
> +static int mctp_kcs_ndo_open(struct net_device *ndev)
> +{
> +	struct mctp_kcs *mkcs;
> +
> +	mkcs = netdev_priv(ndev);
> +	dev_info(&ndev->dev, "Open MCTP over KCS channel %d",
> +		 mkcs->client.dev->channel);
> +	return kcs_bmc_enable_device(mkcs->client.dev, &mkcs->client);
> +}
> +
> +static int mctp_kcs_ndo_stop(struct net_device *ndev)
> +{
> +	struct mctp_kcs *mkcs;
> +
> +	mkcs = netdev_priv(ndev);
> +	dev_info(&ndev->dev, "Stop MCTP over KCS channel %d",
> +		 mkcs->client.dev->channel);
> +	mkcs->data_in_idx = 0;
> +	mkcs->data_out_idx = 0;
> +	mkcs->data_out_len = 0;
> +	mkcs->phase = KCS_PHASE_IDLE;
> +	set_state(mkcs, IDLE_STATE);
> +	kcs_bmc_disable_device(mkcs->client.dev, &mkcs->client);
> +	return 0;
> +}
> +
> +static const struct net_device_ops mctp_kcs_netdev_ops = {
> +	.ndo_start_xmit = mctp_kcs_start_xmit,
> +	.ndo_open = mctp_kcs_ndo_open,
> +	.ndo_stop = mctp_kcs_ndo_stop,
> +};
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
> +	u8 data;
> +	struct kcs_bmc_device *kcs_bmc = mkcs->client.dev;
> +
> +	switch (mkcs->phase) {
> +	case KCS_PHASE_WRITE_START:
> +		dev_dbg(kcs_bmc->dev, "%s: KCS_PHASE_WRITE_START", __func__);
> +		mkcs->phase = KCS_PHASE_WRITE_DATA;
> +		fallthrough;
> +
> +	case KCS_PHASE_WRITE_DATA:
> +		dev_dbg(kcs_bmc->dev, "%s: KCS_PHASE_WRITE_DATA", __func__);
> +		if (mkcs->data_in_idx < KCS_MSG_BUFSIZ) {
> +			set_state(mkcs, WRITE_STATE);
> +			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
> +			mkcs->data_in[mkcs->data_in_idx++] =
> +				kcs_bmc_read_data(kcs_bmc);
> +			dev_dbg(kcs_bmc->dev,
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
> +		dev_dbg(kcs_bmc->dev, "%s: KCS_PHASE_WRITE_END_CMD", __func__);
> +		if (mkcs->data_in_idx < KCS_MSG_BUFSIZ) {
> +			set_state(mkcs, READ_STATE);
> +			mkcs->data_in[mkcs->data_in_idx++] =
> +				kcs_bmc_read_data(kcs_bmc);
> +			dev_dbg(kcs_bmc->dev,
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
> +		dev_dbg(kcs_bmc->dev,
> +			"%s: KCS_PHASE_READ, data_out_idx=%d, data_out_len=%d",
> +			__func__, mkcs->data_out_idx, mkcs->data_out_len);
> +		if (mkcs->data_out_idx == mkcs->data_out_len)
> +			set_state(mkcs, IDLE_STATE);
> +
> +		data = kcs_bmc_read_data(kcs_bmc);
> +		if (data != KCS_CMD_READ_BYTE) {
> +			dev_dbg(kcs_bmc->dev,
> +				"%s: error! data is not equal to KCS_CMD_READ_BYTE",
> +				__func__);
> +			set_state(mkcs, ERROR_STATE);
> +			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
> +			break;
> +		}
> +
> +		if (mkcs->data_out_idx == mkcs->data_out_len) {
> +			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
> +			mkcs->netdev->stats.tx_bytes += mkcs->data_out_len;
> +			mkcs->netdev->stats.tx_packets++;
> +			mkcs->phase = KCS_PHASE_IDLE;
> +			if (netif_queue_stopped(mkcs->netdev))
> +				netif_start_queue(mkcs->netdev);
> +			break;
> +		}
> +
> +		dev_dbg(kcs_bmc->dev, "%s: KCS_PHASE_READ: data_out[%d]=0x%02x",
> +			__func__, mkcs->data_out_idx,
> +			mkcs->data_out[mkcs->data_out_idx]);
> +		kcs_bmc_write_data(kcs_bmc,
> +				   mkcs->data_out[mkcs->data_out_idx++]);
> +		break;
> +
> +	case KCS_PHASE_ABORT_ERROR1:
> +		dev_dbg(kcs_bmc->dev, "%s: KCS_PHASE_ABORT_ERROR1", __func__);
> +		set_state(mkcs, READ_STATE);
> +		kcs_bmc_read_data(kcs_bmc);
> +		kcs_bmc_write_data(kcs_bmc, mkcs->error);
> +		mkcs->phase = KCS_PHASE_ABORT_ERROR2;
> +		break;
> +
> +	case KCS_PHASE_ABORT_ERROR2:
> +		dev_dbg(kcs_bmc->dev, "%s: KCS_PHASE_ABORT_ERROR2", __func__);
> +		set_state(mkcs, IDLE_STATE);
> +		kcs_bmc_read_data(kcs_bmc);
> +		kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
> +		mkcs->phase = KCS_PHASE_IDLE;
> +		break;
> +
> +	default:
> +		dev_dbg(kcs_bmc->dev, "%s: unknown KCS phase", __func__);
> +		kcs_bmc_ipmi_force_abort(mkcs);
> +		break;
> +	}
> +}
> +
> +static void kcs_bmc_ipmi_handle_cmd(struct mctp_kcs *mkcs)
> +{
> +	struct kcs_bmc_device *kcs_bmc = mkcs->client.dev;
> +
> +	set_state(mkcs, WRITE_STATE);
> +	kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
> +
> +	switch (kcs_bmc_read_data(kcs_bmc)) {
> +	case KCS_CMD_WRITE_START:
> +		dev_dbg(kcs_bmc->dev, "%s: KCS_CMD_WRITE_START", __func__);
> +		mkcs->phase = KCS_PHASE_WRITE_START;
> +		mkcs->error = KCS_NO_ERROR;
> +		mkcs->data_in_idx = 0;
> +		break;
> +
> +	case KCS_CMD_WRITE_END:
> +		dev_dbg(kcs_bmc->dev, "%s: KCS_CMD_WRITE_END", __func__);
> +		if (mkcs->phase != KCS_PHASE_WRITE_DATA) {
> +			kcs_bmc_ipmi_force_abort(mkcs);
> +			break;
> +		}
> +		mkcs->phase = KCS_PHASE_WRITE_END_CMD;
> +		break;
> +
> +	case KCS_CMD_GET_STATUS_ABORT:
> +		dev_dbg(kcs_bmc->dev, "%s: KCS_CMD_GET_STATUS_ABORT", __func__);
> +		if (mkcs->error == KCS_NO_ERROR)
> +			mkcs->error = KCS_ABORTED_BY_COMMAND;
> +
> +		mkcs->phase = KCS_PHASE_ABORT_ERROR1;
> +		mkcs->data_in_idx = 0;
> +		break;
> +
> +	default:
> +		dev_dbg(kcs_bmc->dev, "%s: unknown KCS command", __func__);
> +		kcs_bmc_ipmi_force_abort(mkcs);
> +		mkcs->error = KCS_ILLEGAL_CONTROL_CODE;
> +		break;
> +	}
> +}
> +
> +static struct mctp_kcs *client_to_mctp_kcs(struct kcs_bmc_client *client)
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
> +	if (!ndev) {
> +		dev_err_probe(kcs_bmc->dev, -ENOMEM,
> +			      "alloc_netdev failed for KCS channel %d\n",
> +			      kcs_bmc->channel);
> +		return -ENOMEM;
> +	}
> +
> +	mkcs = netdev_priv(ndev);
> +	mkcs->netdev = ndev;
> +	mkcs->client.dev = kcs_bmc;
> +	mkcs->client.ops = &kcs_bmc_mctp_client_ops;
> +	mkcs->data_in = devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
> +	if (!mkcs->data_in) {
> +		dev_err_probe(
> +			kcs_bmc->dev, -ENOMEM,
> +			"failed to allocate data_in buffer for KCS channel %d\n",
> +			kcs_bmc->channel);
> +		rc = -ENOMEM;
> +		goto free_netdev;
> +	}
> +	mkcs->data_out = devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
> +	if (!mkcs->data_out) {
> +		dev_err_probe(
> +			kcs_bmc->dev, -ENOMEM,
> +			"failed to allocate data_out buffer for KCS channel %d\n",
> +			kcs_bmc->channel);
> +		rc = -ENOMEM;
> +		goto free_netdev;
> +	}
> +
> +	INIT_WORK(&mkcs->rx_work, mctp_kcs_rx_work);
> +
> +	rc = register_netdev(ndev);
> +	if (rc)
> +		goto free_netdev;
> +
> +	spin_lock_irq(&kcs_bmc_mctp_instances_lock);
> +	list_add(&mkcs->entry, &kcs_bmc_mctp_instances);
> +	spin_unlock_irq(&kcs_bmc_mctp_instances_lock);
> +
> +	dev_info(kcs_bmc->dev, "Add MCTP client for the KCS channel %d",
> +		 kcs_bmc->channel);
> +	return 0;
> +
> +free_netdev:
> +	free_netdev(ndev);
> +
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
> +		}
> +	}
> +	spin_unlock_irq(&kcs_bmc_mctp_instances_lock);
> +
> +	if (!mkcs)
> +		return -ENODEV;
> +
> +	unregister_netdev(mkcs->netdev);
> +	free_netdev(mkcs->netdev);
> +	kcs_bmc_disable_device(kcs_bmc, &mkcs->client);
> +	devm_kfree(kcs_bmc->dev, mkcs->data_out);
> +	devm_kfree(kcs_bmc->dev, mkcs->data_in);
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
> +
> +module_init(mctp_kcs_init);
> +module_exit(mctp_kcs_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Konstantin Aladyshev <aladyshev22@gmail.com>");
> +MODULE_DESCRIPTION("MCTP KCS transport");
> -- 
> 2.25.1
> 
> 
