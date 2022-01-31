Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C304E4A49E0
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 16:09:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnWgP4Jsmz3bXn
	for <lists+openbmc@lfdr.de>; Tue,  1 Feb 2022 02:09:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cu8E891P;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cu8E891P; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnWfs6fkTz2ywb
 for <openbmc@lists.ozlabs.org>; Tue,  1 Feb 2022 02:08:53 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20VEcfxJ018150; 
 Mon, 31 Jan 2022 15:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=DGyzJzHZrDsTrpg2rQWbrFBuxt3vyhNVewjm8WIrSk8=;
 b=cu8E891Ps7zz5C4UfZg66FR/Fdcc+nr9VMwgFqSPeyTnAMKP7dD65sRBIsCVq28Ylm1Z
 7/T/g9u5Dh2+VXTiE2RJcA+r4CegtItnCzwkd+Sd+54SPl6PNXoFw0+ABIkBkA2G34Vq
 OKPZoiQWruJYmB711iHVggLX3w71kEeLM+FRp0fJbMCAZ4L20+mBUVfUn6v9wyNE28fi
 X9k/PcwhrFVmHEJocm6sFCj7T4Mt8prUtCKvVtnvH99W10NkCgp0LXhqHM62xofmZ+7b
 qN9lwMhJ2HS7YvDL9YWOoPDK1uh5bWwIRtDxHAbN9aDMH4HvL4F8nQmWo7ZWwjH8Srdj iw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dx5a6wngv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 15:08:48 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20VEqFJc013971;
 Mon, 31 Jan 2022 15:08:47 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03wdc.us.ibm.com with ESMTP id 3dvw79wb86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 15:08:47 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20VF8k9d11534826
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 15:08:46 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D5C3BE05A;
 Mon, 31 Jan 2022 15:08:46 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07141BE056;
 Mon, 31 Jan 2022 15:08:46 +0000 (GMT)
Received: from [9.211.52.1] (unknown [9.211.52.1])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 31 Jan 2022 15:08:45 +0000 (GMT)
Message-ID: <bfb4ed15-3082-8495-a4e1-d027263c77ab@linux.ibm.com>
Date: Mon, 31 Jan 2022 09:08:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH linux dev-5.15] fsi: Add trace events in initialization
 path
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20220125161107.77962-1-eajames@linux.ibm.com>
 <CACPK8XevA9_DNpGkfDe8=2zy7VPZcTa1ehzoJRHLVtrWapf42Q@mail.gmail.com>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <CACPK8XevA9_DNpGkfDe8=2zy7VPZcTa1ehzoJRHLVtrWapf42Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qG_qjGzUsl3MDDNXDMl9reSCp0lWX_Va
X-Proofpoint-GUID: qG_qjGzUsl3MDDNXDMl9reSCp0lWX_Va
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_06,2022-01-31_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201310099
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


On 1/30/22 23:59, Joel Stanley wrote:
> On Tue, 25 Jan 2022 at 16:11, Eddie James <eajames@linux.ibm.com> wrote:
>> Add definitions for trace events to show the scanning flow in order
>> to debug recent scanning problems.
> Do you intend this to be merged upstream?


Was planning to send it up, yes.


>
> Some of the traces look like they might be useful in a general sense,
> but others (trace_fsi_minor) look like they might be just debugging?


Yea its purely for debugging. I could drop that one.


>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   drivers/fsi/fsi-core.c                   |  13 ++-
>>   drivers/fsi/fsi-master-aspeed.c          |   2 +
>>   include/trace/events/fsi.h               | 109 +++++++++++++++++++++++
>>   include/trace/events/fsi_master_aspeed.h |  12 +++
>>   4 files changed, 133 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
>> index 59ddc9fd5bca..78710087aa05 100644
>> --- a/drivers/fsi/fsi-core.c
>> +++ b/drivers/fsi/fsi-core.c
>> @@ -24,9 +24,6 @@
>>
>>   #include "fsi-master.h"
>>
>> -#define CREATE_TRACE_POINTS
>> -#include <trace/events/fsi.h>
>> -
>>   #define FSI_SLAVE_CONF_NEXT_MASK       GENMASK(31, 31)
>>   #define FSI_SLAVE_CONF_SLOTS_MASK      GENMASK(23, 16)
>>   #define FSI_SLAVE_CONF_SLOTS_SHIFT     16
>> @@ -95,6 +92,9 @@ struct fsi_slave {
>>          u8                      t_echo_delay;
>>   };
>>
>> +#define CREATE_TRACE_POINTS
>> +#include <trace/events/fsi.h>
> Did this move for a reason?


Yes, I wanted to use the fsi_slave structure in the trace event, so I 
had to include the traces after the structure definition.


Thanks,

Eddie


>
>> +
>>   #define to_fsi_master(d) container_of(d, struct fsi_master, dev)
>>   #define to_fsi_slave(d) container_of(d, struct fsi_slave, dev)
>>
>> @@ -524,6 +524,8 @@ static int fsi_slave_scan(struct fsi_slave *slave)
>>                          dev->addr = engine_addr;
>>                          dev->size = slots * engine_page_size;
>>
>> +                       trace_fsi_dev_init(dev);
>> +
>>                          dev_dbg(&slave->dev,
>>                          "engine[%i]: type %x, version %x, addr %x size %x\n",
>>                                          dev->unit, dev->engine_type, version,
>> @@ -953,6 +955,7 @@ static int __fsi_get_new_minor(struct fsi_slave *slave, enum fsi_dev_type type,
>>                  if (id >= 0) {
>>                          *out_index = fsi_adjust_index(cid);
>>                          *out_dev = fsi_base_dev + id;
>> +                       trace_fsi_minor(cid, type, true, cid);
>>                          return 0;
>>                  }
>>                  /* Other failure */
>> @@ -966,6 +969,7 @@ static int __fsi_get_new_minor(struct fsi_slave *slave, enum fsi_dev_type type,
>>                  return id;
>>          *out_index = fsi_adjust_index(id);
>>          *out_dev = fsi_base_dev + id;
>> +       trace_fsi_minor(cid, type, false, id);
>>          return 0;
>>   }
>>
>> @@ -1006,6 +1010,7 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
>>
>>          crc = crc4(0, cfam_id, 32);
>>          if (crc) {
>> +               trace_fsi_slave_invalid_cfam(master, link, cfam_id);
>>                  dev_warn(&master->dev, "slave %02x:%02x invalid cfam id CRC!\n",
>>                                  link, id);
>>                  return -EIO;
>> @@ -1080,6 +1085,8 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
>>          if (rc)
>>                  goto err_free;
>>
>> +       trace_fsi_slave_init(slave);
>> +
>>          /* Create chardev for userspace access */
>>          cdev_init(&slave->cdev, &cfam_fops);
>>          rc = cdev_device_add(&slave->cdev, &slave->dev);
>> diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
>> index 8606e55c1721..04fec1aab23c 100644
>> --- a/drivers/fsi/fsi-master-aspeed.c
>> +++ b/drivers/fsi/fsi-master-aspeed.c
>> @@ -449,11 +449,13 @@ static ssize_t cfam_reset_store(struct device *dev, struct device_attribute *att
>>   {
>>          struct fsi_master_aspeed *aspeed = dev_get_drvdata(dev);
>>
>> +       trace_fsi_master_aspeed_cfam_reset(true);
>>          mutex_lock(&aspeed->lock);
>>          gpiod_set_value(aspeed->cfam_reset_gpio, 1);
>>          usleep_range(900, 1000);
>>          gpiod_set_value(aspeed->cfam_reset_gpio, 0);
>>          mutex_unlock(&aspeed->lock);
>> +       trace_fsi_master_aspeed_cfam_reset(false);
>>
>>          return count;
>>   }
>> diff --git a/include/trace/events/fsi.h b/include/trace/events/fsi.h
>> index 9832cb8e0eb0..251bc57a8b7f 100644
>> --- a/include/trace/events/fsi.h
>> +++ b/include/trace/events/fsi.h
>> @@ -122,6 +122,115 @@ TRACE_EVENT(fsi_master_break,
>>          )
>>   );
>>
>> +TRACE_EVENT(fsi_slave_init,
>> +       TP_PROTO(const struct fsi_slave *slave),
>> +       TP_ARGS(slave),
>> +       TP_STRUCT__entry(
>> +               __field(int,    master_idx)
>> +               __field(int,    master_n_links)
>> +               __field(int,    idx)
>> +               __field(int,    link)
>> +               __field(int,    chip_id)
>> +               __field(__u32,  cfam_id)
>> +               __field(__u32,  size)
>> +       ),
>> +       TP_fast_assign(
>> +               __entry->master_idx = slave->master->idx;
>> +               __entry->master_n_links = slave->master->n_links;
>> +               __entry->idx = slave->cdev_idx;
>> +               __entry->link = slave->link;
>> +               __entry->chip_id = slave->chip_id;
>> +               __entry->cfam_id = slave->cfam_id;
>> +               __entry->size = slave->size;
>> +       ),
>> +       TP_printk("fsi%d: idx:%d link:%d/%d cid:%d cfam:%08x %08x",
>> +               __entry->master_idx,
>> +               __entry->idx,
>> +               __entry->link,
>> +               __entry->master_n_links,
>> +               __entry->chip_id,
>> +               __entry->cfam_id,
>> +               __entry->size
>> +       )
>> +);
>> +
>> +TRACE_EVENT(fsi_slave_invalid_cfam,
>> +       TP_PROTO(const struct fsi_master *master, int link, uint32_t cfam_id),
>> +       TP_ARGS(master, link, cfam_id),
>> +       TP_STRUCT__entry(
>> +               __field(int,    master_idx)
>> +               __field(int,    master_n_links)
>> +               __field(int,    link)
>> +               __field(__u32,  cfam_id)
>> +       ),
>> +       TP_fast_assign(
>> +               __entry->master_idx = master->idx;
>> +               __entry->master_n_links = master->n_links;
>> +               __entry->link = link;
>> +               __entry->cfam_id = cfam_id;
>> +       ),
>> +       TP_printk("fsi%d: cfam:%08x link:%d/%d",
>> +               __entry->master_idx,
>> +               __entry->cfam_id,
>> +               __entry->link,
>> +               __entry->master_n_links
>> +       )
>> +);
>> +
>> +TRACE_EVENT(fsi_minor,
>> +       TP_PROTO(int cid, enum fsi_dev_type type, bool legacy, int result),
>> +       TP_ARGS(cid, type, legacy, result),
>> +       TP_STRUCT__entry(
>> +               __field(int,    cid)
>> +               __field(int,    type)
>> +               __field(bool,   legacy)
>> +               __field(int,    result)
>> +       ),
>> +       TP_fast_assign(
>> +               __entry->cid = cid;
>> +               __entry->type = type;
>> +               __entry->legacy = legacy;
>> +               __entry->result = result;
>> +       ),
>> +       TP_printk("%d: cid:%d type:%d%s",
>> +               __entry->result,
>> +               __entry->cid,
>> +               __entry->type,
>> +               __entry->legacy ? " legacy" : ""
>> +       )
>> +);
>> +
>> +TRACE_EVENT(fsi_dev_init,
>> +       TP_PROTO(const struct fsi_device *dev),
>> +       TP_ARGS(dev),
>> +       TP_STRUCT__entry(
>> +               __field(int,    master_idx)
>> +               __field(int,    link)
>> +               __field(int,    type)
>> +               __field(int,    unit)
>> +               __field(int,    version)
>> +               __field(__u32,  addr)
>> +               __field(__u32,  size)
>> +       ),
>> +       TP_fast_assign(
>> +               __entry->master_idx = dev->slave->master->idx;
>> +               __entry->link = dev->slave->link;
>> +               __entry->type = dev->engine_type;
>> +               __entry->unit = dev->unit;
>> +               __entry->version = dev->version;
>> +               __entry->addr = dev->addr;
>> +               __entry->size = dev->size;
>> +       ),
>> +       TP_printk("fsi%d: slv%d: t:%02x u:%02x v:%02x %08x@%08x",
>> +               __entry->master_idx,
>> +               __entry->link,
>> +               __entry->type,
>> +               __entry->unit,
>> +               __entry->version,
>> +               __entry->size,
>> +               __entry->addr
>> +       )
>> +);
>>
>>   #endif /* _TRACE_FSI_H */
>>
>> diff --git a/include/trace/events/fsi_master_aspeed.h b/include/trace/events/fsi_master_aspeed.h
>> index a355ceacc33f..0fff873775f1 100644
>> --- a/include/trace/events/fsi_master_aspeed.h
>> +++ b/include/trace/events/fsi_master_aspeed.h
>> @@ -72,6 +72,18 @@ TRACE_EVENT(fsi_master_aspeed_opb_error,
>>                  )
>>          );
>>
>> +TRACE_EVENT(fsi_master_aspeed_cfam_reset,
>> +       TP_PROTO(bool start),
>> +       TP_ARGS(start),
>> +       TP_STRUCT__entry(
>> +               __field(bool,   start)
>> +       ),
>> +       TP_fast_assign(
>> +               __entry->start = start;
>> +       ),
>> +       TP_printk("%s", __entry->start ? "start" : "end")
>> +);
>> +
>>   #endif
>>
>>   #include <trace/define_trace.h>
>> --
>> 2.27.0
>>
