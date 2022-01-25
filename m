Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D2849B8F1
	for <lists+openbmc@lfdr.de>; Tue, 25 Jan 2022 17:44:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jjt4B5l5vz3bZP
	for <lists+openbmc@lfdr.de>; Wed, 26 Jan 2022 03:44:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
X-Greylist: delayed 339 seconds by postgrey-1.36 at boromir;
 Wed, 26 Jan 2022 03:44:25 AEDT
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jjt3s2JjLz2xCp
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jan 2022 03:44:24 +1100 (AEDT)
Received: from [192.168.0.2] (ip5f5aeaa2.dynamic.kabel-deutschland.de
 [95.90.234.162])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 4DDEF61E6478B;
 Tue, 25 Jan 2022 17:38:40 +0100 (CET)
Message-ID: <7d0206b4-edb8-96a1-59d5-09ecec8f3d66@molgen.mpg.de>
Date: Tue, 25 Jan 2022 17:38:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH linux dev-5.15] fsi: Add trace events in initialization
 path
Content-Language: en-US
To: Eddie James <eajames@linux.ibm.com>
References: <20220125161107.77962-1-eajames@linux.ibm.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220125161107.77962-1-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Eddie,


Am 25.01.22 um 17:11 schrieb Eddie James:
> Add definitions for trace events to show the scanning flow in order
> to debug recent scanning problems.

Maybe give an example how to trace one of the new trace events.


Kind regards,

Paul


> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>   drivers/fsi/fsi-core.c                   |  13 ++-
>   drivers/fsi/fsi-master-aspeed.c          |   2 +
>   include/trace/events/fsi.h               | 109 +++++++++++++++++++++++
>   include/trace/events/fsi_master_aspeed.h |  12 +++
>   4 files changed, 133 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
> index 59ddc9fd5bca..78710087aa05 100644
> --- a/drivers/fsi/fsi-core.c
> +++ b/drivers/fsi/fsi-core.c
> @@ -24,9 +24,6 @@
>   
>   #include "fsi-master.h"
>   
> -#define CREATE_TRACE_POINTS
> -#include <trace/events/fsi.h>
> -
>   #define FSI_SLAVE_CONF_NEXT_MASK	GENMASK(31, 31)
>   #define FSI_SLAVE_CONF_SLOTS_MASK	GENMASK(23, 16)
>   #define FSI_SLAVE_CONF_SLOTS_SHIFT	16
> @@ -95,6 +92,9 @@ struct fsi_slave {
>   	u8			t_echo_delay;
>   };
>   
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/fsi.h>
> +
>   #define to_fsi_master(d) container_of(d, struct fsi_master, dev)
>   #define to_fsi_slave(d) container_of(d, struct fsi_slave, dev)
>   
> @@ -524,6 +524,8 @@ static int fsi_slave_scan(struct fsi_slave *slave)
>   			dev->addr = engine_addr;
>   			dev->size = slots * engine_page_size;
>   
> +			trace_fsi_dev_init(dev);
> +
>   			dev_dbg(&slave->dev,
>   			"engine[%i]: type %x, version %x, addr %x size %x\n",
>   					dev->unit, dev->engine_type, version,
> @@ -953,6 +955,7 @@ static int __fsi_get_new_minor(struct fsi_slave *slave, enum fsi_dev_type type,
>   		if (id >= 0) {
>   			*out_index = fsi_adjust_index(cid);
>   			*out_dev = fsi_base_dev + id;
> +			trace_fsi_minor(cid, type, true, cid);
>   			return 0;
>   		}
>   		/* Other failure */
> @@ -966,6 +969,7 @@ static int __fsi_get_new_minor(struct fsi_slave *slave, enum fsi_dev_type type,
>   		return id;
>   	*out_index = fsi_adjust_index(id);
>   	*out_dev = fsi_base_dev + id;
> +	trace_fsi_minor(cid, type, false, id);
>   	return 0;
>   }
>   
> @@ -1006,6 +1010,7 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
>   
>   	crc = crc4(0, cfam_id, 32);
>   	if (crc) {
> +		trace_fsi_slave_invalid_cfam(master, link, cfam_id);
>   		dev_warn(&master->dev, "slave %02x:%02x invalid cfam id CRC!\n",
>   				link, id);
>   		return -EIO;
> @@ -1080,6 +1085,8 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
>   	if (rc)
>   		goto err_free;
>   
> +	trace_fsi_slave_init(slave);
> +
>   	/* Create chardev for userspace access */
>   	cdev_init(&slave->cdev, &cfam_fops);
>   	rc = cdev_device_add(&slave->cdev, &slave->dev);
> diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
> index 8606e55c1721..04fec1aab23c 100644
> --- a/drivers/fsi/fsi-master-aspeed.c
> +++ b/drivers/fsi/fsi-master-aspeed.c
> @@ -449,11 +449,13 @@ static ssize_t cfam_reset_store(struct device *dev, struct device_attribute *att
>   {
>   	struct fsi_master_aspeed *aspeed = dev_get_drvdata(dev);
>   
> +	trace_fsi_master_aspeed_cfam_reset(true);
>   	mutex_lock(&aspeed->lock);
>   	gpiod_set_value(aspeed->cfam_reset_gpio, 1);
>   	usleep_range(900, 1000);
>   	gpiod_set_value(aspeed->cfam_reset_gpio, 0);
>   	mutex_unlock(&aspeed->lock);
> +	trace_fsi_master_aspeed_cfam_reset(false);
>   
>   	return count;
>   }
> diff --git a/include/trace/events/fsi.h b/include/trace/events/fsi.h
> index 9832cb8e0eb0..251bc57a8b7f 100644
> --- a/include/trace/events/fsi.h
> +++ b/include/trace/events/fsi.h
> @@ -122,6 +122,115 @@ TRACE_EVENT(fsi_master_break,
>   	)
>   );
>   
> +TRACE_EVENT(fsi_slave_init,
> +	TP_PROTO(const struct fsi_slave *slave),
> +	TP_ARGS(slave),
> +	TP_STRUCT__entry(
> +		__field(int,	master_idx)
> +		__field(int,	master_n_links)
> +		__field(int,	idx)
> +		__field(int,	link)
> +		__field(int,	chip_id)
> +		__field(__u32,	cfam_id)
> +		__field(__u32,	size)
> +	),
> +	TP_fast_assign(
> +		__entry->master_idx = slave->master->idx;
> +		__entry->master_n_links = slave->master->n_links;
> +		__entry->idx = slave->cdev_idx;
> +		__entry->link = slave->link;
> +		__entry->chip_id = slave->chip_id;
> +		__entry->cfam_id = slave->cfam_id;
> +		__entry->size = slave->size;
> +	),
> +	TP_printk("fsi%d: idx:%d link:%d/%d cid:%d cfam:%08x %08x",
> +		__entry->master_idx,
> +		__entry->idx,
> +		__entry->link,
> +		__entry->master_n_links,
> +		__entry->chip_id,
> +		__entry->cfam_id,
> +		__entry->size
> +	)
> +);
> +
> +TRACE_EVENT(fsi_slave_invalid_cfam,
> +	TP_PROTO(const struct fsi_master *master, int link, uint32_t cfam_id),
> +	TP_ARGS(master, link, cfam_id),
> +	TP_STRUCT__entry(
> +		__field(int,	master_idx)
> +		__field(int,	master_n_links)
> +		__field(int,	link)
> +		__field(__u32,	cfam_id)
> +	),
> +	TP_fast_assign(
> +		__entry->master_idx = master->idx;
> +		__entry->master_n_links = master->n_links;
> +		__entry->link = link;
> +		__entry->cfam_id = cfam_id;
> +	),
> +	TP_printk("fsi%d: cfam:%08x link:%d/%d",
> +		__entry->master_idx,
> +		__entry->cfam_id,
> +		__entry->link,
> +		__entry->master_n_links
> +	)
> +);
> +
> +TRACE_EVENT(fsi_minor,
> +	TP_PROTO(int cid, enum fsi_dev_type type, bool legacy, int result),
> +	TP_ARGS(cid, type, legacy, result),
> +	TP_STRUCT__entry(
> +		__field(int,	cid)
> +		__field(int,	type)
> +		__field(bool,	legacy)
> +		__field(int,	result)
> +	),
> +	TP_fast_assign(
> +		__entry->cid = cid;
> +		__entry->type = type;
> +		__entry->legacy = legacy;
> +		__entry->result = result;
> +	),
> +	TP_printk("%d: cid:%d type:%d%s",
> +		__entry->result,
> +		__entry->cid,
> +		__entry->type,
> +		__entry->legacy ? " legacy" : ""
> +	)
> +);
> +
> +TRACE_EVENT(fsi_dev_init,
> +	TP_PROTO(const struct fsi_device *dev),
> +	TP_ARGS(dev),
> +	TP_STRUCT__entry(
> +		__field(int,	master_idx)
> +		__field(int,	link)
> +		__field(int,	type)
> +		__field(int,	unit)
> +		__field(int,	version)
> +		__field(__u32,	addr)
> +		__field(__u32,	size)
> +	),
> +	TP_fast_assign(
> +		__entry->master_idx = dev->slave->master->idx;
> +		__entry->link = dev->slave->link;
> +		__entry->type = dev->engine_type;
> +		__entry->unit = dev->unit;
> +		__entry->version = dev->version;
> +		__entry->addr = dev->addr;
> +		__entry->size = dev->size;
> +	),
> +	TP_printk("fsi%d: slv%d: t:%02x u:%02x v:%02x %08x@%08x",
> +		__entry->master_idx,
> +		__entry->link,
> +		__entry->type,
> +		__entry->unit,
> +		__entry->version,
> +		__entry->size,
> +		__entry->addr
> +	)
> +);
>   
>   #endif /* _TRACE_FSI_H */
>   
> diff --git a/include/trace/events/fsi_master_aspeed.h b/include/trace/events/fsi_master_aspeed.h
> index a355ceacc33f..0fff873775f1 100644
> --- a/include/trace/events/fsi_master_aspeed.h
> +++ b/include/trace/events/fsi_master_aspeed.h
> @@ -72,6 +72,18 @@ TRACE_EVENT(fsi_master_aspeed_opb_error,
>   		)
>   	);
>   
> +TRACE_EVENT(fsi_master_aspeed_cfam_reset,
> +	TP_PROTO(bool start),
> +	TP_ARGS(start),
> +	TP_STRUCT__entry(
> +		__field(bool,	start)
> +	),
> +	TP_fast_assign(
> +		__entry->start = start;
> +	),
> +	TP_printk("%s", __entry->start ? "start" : "end")
> +);
> +
>   #endif
>   
>   #include <trace/define_trace.h>
