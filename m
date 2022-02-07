Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB3A4AB7FF
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 10:58:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JshRL0TPrz30RQ
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 20:58:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=OMlFafxp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::835;
 helo=mail-qt1-x835.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=OMlFafxp; dkim-atps=neutral
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JshQy18tPz2xXs
 for <openbmc@lists.ozlabs.org>; Mon,  7 Feb 2022 20:58:02 +1100 (AEDT)
Received: by mail-qt1-x835.google.com with SMTP id j12so11405365qtr.2
 for <openbmc@lists.ozlabs.org>; Mon, 07 Feb 2022 01:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NKVqEQtXVmG6FvU399l1Y3yIMwpfqL4hFZMiVeXFJJk=;
 b=OMlFafxp5Yd9Ve4TUP3W2F1Rr99YQHcKSuvSBTY774VH1SzmXGSK9oS7YVgdDhQe6R
 3s71Ky2EE0deRqMKutdBP1w7TteFlTMOsh5euTvdC6emozy9ClsklwqTD6g893+kmRsv
 FIJtlvbzyr0B8FmC9UrOebyR2Bk6YLcJSdvQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NKVqEQtXVmG6FvU399l1Y3yIMwpfqL4hFZMiVeXFJJk=;
 b=JPhpW1eEcnKoMJ9xt9L5ua8lGxZxoxcC2EtMvxtppwWRLb3EX/624gzRSFToMxvbl9
 wXI2/LVo8ea6+oniprrTj5Rc+tBvJ/6mNiSiAufuocJV3aqshEu2Rptqx1WYaIALljge
 KbfetBkltrDGNx/I++soyP9a7FfBsje99UT2Dr5tU7WNylmd8275X/aewzreBSCWY1HT
 iE3JWPhgYKPBGQSKOrApaPrhkzmiJc6S3LWscOVv0T8y9OaZ3LSGQ6P41TH+FcLY6Grz
 AEmi365CkuyUCXXAX1nFSxCjBVrnAsOzss/bjf6FkKN8wowoZozqR/zOqxa9+25KGwDB
 HzfQ==
X-Gm-Message-State: AOAM533nsqp6eGeu5RvGGxQ+z+ILBUht4ejwB5It1cvmWx19kYxRlUle
 4VZA/HfVuhT0Ntc83IEEDyM7aqVGWAw2Yd2EHE22jaMw
X-Google-Smtp-Source: ABdhPJwpaL2XZWvQc/T3QamYqXvW5rAYdUsOIlzFPc7/8OQh0l2WCbszonK3P30/uFpryoF81xK6H5LYt5kDF17Tj6s=
X-Received: by 2002:ac8:608:: with SMTP id d8mr7201918qth.494.1644227879454;
 Mon, 07 Feb 2022 01:57:59 -0800 (PST)
MIME-Version: 1.0
References: <20220125161107.77962-1-eajames@linux.ibm.com>
 <CACPK8XevA9_DNpGkfDe8=2zy7VPZcTa1ehzoJRHLVtrWapf42Q@mail.gmail.com>
 <bfb4ed15-3082-8495-a4e1-d027263c77ab@linux.ibm.com>
In-Reply-To: <bfb4ed15-3082-8495-a4e1-d027263c77ab@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 7 Feb 2022 09:57:47 +0000
Message-ID: <CACPK8Xc6nCrQcpuah7stkj_0oaH5qe+2L0nBGFQ-fr2LLNZ5wg@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.15] fsi: Add trace events in initialization
 path
To: Eddie James <eajames@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 31 Jan 2022 at 15:08, Eddie James <eajames@linux.ibm.com> wrote:
>
>
> On 1/30/22 23:59, Joel Stanley wrote:
> > On Tue, 25 Jan 2022 at 16:11, Eddie James <eajames@linux.ibm.com> wrote:
> >> Add definitions for trace events to show the scanning flow in order
> >> to debug recent scanning problems.
> > Do you intend this to be merged upstream?
>
>
> Was planning to send it up, yes.
>
>
> >
> > Some of the traces look like they might be useful in a general sense,
> > but others (trace_fsi_minor) look like they might be just debugging?
>
>
> Yea its purely for debugging. I could drop that one.

Can you send a v2 on the upstream list so we can get this merged?

Cheers,

Joel

>
>
> >
> >> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> >> ---
> >>   drivers/fsi/fsi-core.c                   |  13 ++-
> >>   drivers/fsi/fsi-master-aspeed.c          |   2 +
> >>   include/trace/events/fsi.h               | 109 +++++++++++++++++++++++
> >>   include/trace/events/fsi_master_aspeed.h |  12 +++
> >>   4 files changed, 133 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
> >> index 59ddc9fd5bca..78710087aa05 100644
> >> --- a/drivers/fsi/fsi-core.c
> >> +++ b/drivers/fsi/fsi-core.c
> >> @@ -24,9 +24,6 @@
> >>
> >>   #include "fsi-master.h"
> >>
> >> -#define CREATE_TRACE_POINTS
> >> -#include <trace/events/fsi.h>
> >> -
> >>   #define FSI_SLAVE_CONF_NEXT_MASK       GENMASK(31, 31)
> >>   #define FSI_SLAVE_CONF_SLOTS_MASK      GENMASK(23, 16)
> >>   #define FSI_SLAVE_CONF_SLOTS_SHIFT     16
> >> @@ -95,6 +92,9 @@ struct fsi_slave {
> >>          u8                      t_echo_delay;
> >>   };
> >>
> >> +#define CREATE_TRACE_POINTS
> >> +#include <trace/events/fsi.h>
> > Did this move for a reason?
>
>
> Yes, I wanted to use the fsi_slave structure in the trace event, so I
> had to include the traces after the structure definition.
>
>
> Thanks,
>
> Eddie
>
>
> >
> >> +
> >>   #define to_fsi_master(d) container_of(d, struct fsi_master, dev)
> >>   #define to_fsi_slave(d) container_of(d, struct fsi_slave, dev)
> >>
> >> @@ -524,6 +524,8 @@ static int fsi_slave_scan(struct fsi_slave *slave)
> >>                          dev->addr = engine_addr;
> >>                          dev->size = slots * engine_page_size;
> >>
> >> +                       trace_fsi_dev_init(dev);
> >> +
> >>                          dev_dbg(&slave->dev,
> >>                          "engine[%i]: type %x, version %x, addr %x size %x\n",
> >>                                          dev->unit, dev->engine_type, version,
> >> @@ -953,6 +955,7 @@ static int __fsi_get_new_minor(struct fsi_slave *slave, enum fsi_dev_type type,
> >>                  if (id >= 0) {
> >>                          *out_index = fsi_adjust_index(cid);
> >>                          *out_dev = fsi_base_dev + id;
> >> +                       trace_fsi_minor(cid, type, true, cid);
> >>                          return 0;
> >>                  }
> >>                  /* Other failure */
> >> @@ -966,6 +969,7 @@ static int __fsi_get_new_minor(struct fsi_slave *slave, enum fsi_dev_type type,
> >>                  return id;
> >>          *out_index = fsi_adjust_index(id);
> >>          *out_dev = fsi_base_dev + id;
> >> +       trace_fsi_minor(cid, type, false, id);
> >>          return 0;
> >>   }
> >>
> >> @@ -1006,6 +1010,7 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
> >>
> >>          crc = crc4(0, cfam_id, 32);
> >>          if (crc) {
> >> +               trace_fsi_slave_invalid_cfam(master, link, cfam_id);
> >>                  dev_warn(&master->dev, "slave %02x:%02x invalid cfam id CRC!\n",
> >>                                  link, id);
> >>                  return -EIO;
> >> @@ -1080,6 +1085,8 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
> >>          if (rc)
> >>                  goto err_free;
> >>
> >> +       trace_fsi_slave_init(slave);
> >> +
> >>          /* Create chardev for userspace access */
> >>          cdev_init(&slave->cdev, &cfam_fops);
> >>          rc = cdev_device_add(&slave->cdev, &slave->dev);
> >> diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
> >> index 8606e55c1721..04fec1aab23c 100644
> >> --- a/drivers/fsi/fsi-master-aspeed.c
> >> +++ b/drivers/fsi/fsi-master-aspeed.c
> >> @@ -449,11 +449,13 @@ static ssize_t cfam_reset_store(struct device *dev, struct device_attribute *att
> >>   {
> >>          struct fsi_master_aspeed *aspeed = dev_get_drvdata(dev);
> >>
> >> +       trace_fsi_master_aspeed_cfam_reset(true);
> >>          mutex_lock(&aspeed->lock);
> >>          gpiod_set_value(aspeed->cfam_reset_gpio, 1);
> >>          usleep_range(900, 1000);
> >>          gpiod_set_value(aspeed->cfam_reset_gpio, 0);
> >>          mutex_unlock(&aspeed->lock);
> >> +       trace_fsi_master_aspeed_cfam_reset(false);
> >>
> >>          return count;
> >>   }
> >> diff --git a/include/trace/events/fsi.h b/include/trace/events/fsi.h
> >> index 9832cb8e0eb0..251bc57a8b7f 100644
> >> --- a/include/trace/events/fsi.h
> >> +++ b/include/trace/events/fsi.h
> >> @@ -122,6 +122,115 @@ TRACE_EVENT(fsi_master_break,
> >>          )
> >>   );
> >>
> >> +TRACE_EVENT(fsi_slave_init,
> >> +       TP_PROTO(const struct fsi_slave *slave),
> >> +       TP_ARGS(slave),
> >> +       TP_STRUCT__entry(
> >> +               __field(int,    master_idx)
> >> +               __field(int,    master_n_links)
> >> +               __field(int,    idx)
> >> +               __field(int,    link)
> >> +               __field(int,    chip_id)
> >> +               __field(__u32,  cfam_id)
> >> +               __field(__u32,  size)
> >> +       ),
> >> +       TP_fast_assign(
> >> +               __entry->master_idx = slave->master->idx;
> >> +               __entry->master_n_links = slave->master->n_links;
> >> +               __entry->idx = slave->cdev_idx;
> >> +               __entry->link = slave->link;
> >> +               __entry->chip_id = slave->chip_id;
> >> +               __entry->cfam_id = slave->cfam_id;
> >> +               __entry->size = slave->size;
> >> +       ),
> >> +       TP_printk("fsi%d: idx:%d link:%d/%d cid:%d cfam:%08x %08x",
> >> +               __entry->master_idx,
> >> +               __entry->idx,
> >> +               __entry->link,
> >> +               __entry->master_n_links,
> >> +               __entry->chip_id,
> >> +               __entry->cfam_id,
> >> +               __entry->size
> >> +       )
> >> +);
> >> +
> >> +TRACE_EVENT(fsi_slave_invalid_cfam,
> >> +       TP_PROTO(const struct fsi_master *master, int link, uint32_t cfam_id),
> >> +       TP_ARGS(master, link, cfam_id),
> >> +       TP_STRUCT__entry(
> >> +               __field(int,    master_idx)
> >> +               __field(int,    master_n_links)
> >> +               __field(int,    link)
> >> +               __field(__u32,  cfam_id)
> >> +       ),
> >> +       TP_fast_assign(
> >> +               __entry->master_idx = master->idx;
> >> +               __entry->master_n_links = master->n_links;
> >> +               __entry->link = link;
> >> +               __entry->cfam_id = cfam_id;
> >> +       ),
> >> +       TP_printk("fsi%d: cfam:%08x link:%d/%d",
> >> +               __entry->master_idx,
> >> +               __entry->cfam_id,
> >> +               __entry->link,
> >> +               __entry->master_n_links
> >> +       )
> >> +);
> >> +
> >> +TRACE_EVENT(fsi_minor,
> >> +       TP_PROTO(int cid, enum fsi_dev_type type, bool legacy, int result),
> >> +       TP_ARGS(cid, type, legacy, result),
> >> +       TP_STRUCT__entry(
> >> +               __field(int,    cid)
> >> +               __field(int,    type)
> >> +               __field(bool,   legacy)
> >> +               __field(int,    result)
> >> +       ),
> >> +       TP_fast_assign(
> >> +               __entry->cid = cid;
> >> +               __entry->type = type;
> >> +               __entry->legacy = legacy;
> >> +               __entry->result = result;
> >> +       ),
> >> +       TP_printk("%d: cid:%d type:%d%s",
> >> +               __entry->result,
> >> +               __entry->cid,
> >> +               __entry->type,
> >> +               __entry->legacy ? " legacy" : ""
> >> +       )
> >> +);
> >> +
> >> +TRACE_EVENT(fsi_dev_init,
> >> +       TP_PROTO(const struct fsi_device *dev),
> >> +       TP_ARGS(dev),
> >> +       TP_STRUCT__entry(
> >> +               __field(int,    master_idx)
> >> +               __field(int,    link)
> >> +               __field(int,    type)
> >> +               __field(int,    unit)
> >> +               __field(int,    version)
> >> +               __field(__u32,  addr)
> >> +               __field(__u32,  size)
> >> +       ),
> >> +       TP_fast_assign(
> >> +               __entry->master_idx = dev->slave->master->idx;
> >> +               __entry->link = dev->slave->link;
> >> +               __entry->type = dev->engine_type;
> >> +               __entry->unit = dev->unit;
> >> +               __entry->version = dev->version;
> >> +               __entry->addr = dev->addr;
> >> +               __entry->size = dev->size;
> >> +       ),
> >> +       TP_printk("fsi%d: slv%d: t:%02x u:%02x v:%02x %08x@%08x",
> >> +               __entry->master_idx,
> >> +               __entry->link,
> >> +               __entry->type,
> >> +               __entry->unit,
> >> +               __entry->version,
> >> +               __entry->size,
> >> +               __entry->addr
> >> +       )
> >> +);
> >>
> >>   #endif /* _TRACE_FSI_H */
> >>
> >> diff --git a/include/trace/events/fsi_master_aspeed.h b/include/trace/events/fsi_master_aspeed.h
> >> index a355ceacc33f..0fff873775f1 100644
> >> --- a/include/trace/events/fsi_master_aspeed.h
> >> +++ b/include/trace/events/fsi_master_aspeed.h
> >> @@ -72,6 +72,18 @@ TRACE_EVENT(fsi_master_aspeed_opb_error,
> >>                  )
> >>          );
> >>
> >> +TRACE_EVENT(fsi_master_aspeed_cfam_reset,
> >> +       TP_PROTO(bool start),
> >> +       TP_ARGS(start),
> >> +       TP_STRUCT__entry(
> >> +               __field(bool,   start)
> >> +       ),
> >> +       TP_fast_assign(
> >> +               __entry->start = start;
> >> +       ),
> >> +       TP_printk("%s", __entry->start ? "start" : "end")
> >> +);
> >> +
> >>   #endif
> >>
> >>   #include <trace/define_trace.h>
> >> --
> >> 2.27.0
> >>
