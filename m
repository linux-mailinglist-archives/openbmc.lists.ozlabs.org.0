Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1D349BC23
	for <lists+openbmc@lfdr.de>; Tue, 25 Jan 2022 20:31:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jjxn44JlNz3bWR
	for <lists+openbmc@lfdr.de>; Wed, 26 Jan 2022 06:31:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WA6F9yEp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WA6F9yEp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jjxmd3lDgz2yQK
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jan 2022 06:31:29 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20PIkXZq015512; 
 Tue, 25 Jan 2022 19:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Bt0xHr1q5ok4k/Ard2czpA6C2p2H5YW2urtWnUJ2Dxs=;
 b=WA6F9yEp/Ajt9u+oE6YzHDA3qnjRMiDiO2I+sTrMwXmbYUrGmbsS2y5GH7vKkQSvL7hi
 dpdpTjNYPFkBrDCDWkG5MuMRENOXkLbFcDEZd93kF/Nm9IT9zn+4GCqIZoTpDmbg1vY8
 msXst8yWsGuTBmbrI3RURuTWLYNHX5ZztqDyyJKmhe7VK3VHZ8tCLIVSH9+apYdo73HF
 uyVrR4RsZkC3aWcH05ghjKmokTqmvHRP9KuCeIF2iqO1x7/q3vTZQFazBt/W+5hqcdJV
 CB6Wf5FnEctuwSRUA3bdNz82i9s1PeIIwqkGmwXcv7cCqBBlrazzDJTsUs7npUOAW3XK Ow== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dtpsj0s2g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 19:31:25 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20PJRqp8031582;
 Tue, 25 Jan 2022 19:31:24 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03wdc.us.ibm.com with ESMTP id 3dr9jac6hm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 19:31:24 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20PJVNWG34603408
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jan 2022 19:31:23 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5002BE051;
 Tue, 25 Jan 2022 19:31:23 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E303BE053;
 Tue, 25 Jan 2022 19:31:23 +0000 (GMT)
Received: from [9.211.115.219] (unknown [9.211.115.219])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 25 Jan 2022 19:31:23 +0000 (GMT)
Message-ID: <67ea2a48-4908-43e6-6a13-3f33ed28dccb@linux.ibm.com>
Date: Tue, 25 Jan 2022 13:31:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH linux dev-5.15] fsi: Add trace events in initialization
 path
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>
References: <20220125161107.77962-1-eajames@linux.ibm.com>
 <7d0206b4-edb8-96a1-59d5-09ecec8f3d66@molgen.mpg.de>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <7d0206b4-edb8-96a1-59d5-09ecec8f3d66@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CLRMIaEnYc_igx6W1GL1bn-T35ZXQiAh
X-Proofpoint-ORIG-GUID: CLRMIaEnYc_igx6W1GL1bn-T35ZXQiAh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-25_04,2022-01-25_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 mlxscore=0 clxscore=1011 spamscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201250118
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


On 1/25/22 10:38, Paul Menzel wrote:
> Dear Eddie,
>
>
> Am 25.01.22 um 17:11 schrieb Eddie James:
>> Add definitions for trace events to show the scanning flow in order
>> to debug recent scanning problems.
>
> Maybe give an example how to trace one of the new trace events.


Hi, sure.


To enable:

echo fsi_slave_init >> /sys/kernel/debug/tracing/set_event


To look at the traces:

cat /sys/kernel/debug/tracing/trace


 From one of our systems:

  openpower-proc--588     [000] .n...    36.544026: fsi_slave_init: 
fsi0: idx:1 link:0/1 cid:0 cfam:c0020da6 00800000
  openpower-proc--588     [001] .n...    36.777409: fsi_slave_init: 
fsi1: idx:2 link:1/8 cid:1 cfam:c0020da6 00800000
  openpower-proc--588     [000] .n...    36.931405: fsi_slave_init: 
fsi1: idx:3 link:2/8 cid:2 cfam:c0020da6 00800000
  openpower-proc--588     [000] .n...    37.202587: fsi_slave_init: 
fsi1: idx:4 link:3/8 cid:3 cfam:c0020da6 00800000
  openpower-proc--588     [000] .n...    37.874995: fsi_slave_init: 
fsi1: idx:2 link:1/8 cid:1 cfam:c0020da6 00800000
  openpower-proc--588     [000] .n...    38.062801: fsi_slave_init: 
fsi1: idx:3 link:2/8 cid:2 cfam:c0020da6 00800000
  openpower-proc--588     [000] .n...    38.335173: fsi_slave_init: 
fsi1: idx:4 link:3/8 cid:3 cfam:c0020da6 00800000
  openpower-proc--679     [000] .n...    39.607437: fsi_slave_init: 
fsi0: idx:1 link:0/1 cid:0 cfam:c0020da6 00800000
  openpower-proc--679     [000] .n...    39.908873: fsi_slave_init: 
fsi1: idx:2 link:1/8 cid:1 cfam:c0020da6 00800000
  openpower-proc--679     [000] .n...    40.275172: fsi_slave_init: 
fsi1: idx:3 link:2/8 cid:2 cfam:c0020da6 00800000
  openpower-proc--679     [000] .n...    40.772409: fsi_slave_init: 
fsi1: idx:4 link:3/8 cid:3 cfam:c0020da6 00800000
  openpower-proc--679     [000] .n...    41.474989: fsi_slave_init: 
fsi1: idx:2 link:1/8 cid:1 cfam:c0020da6 00800000
  openpower-proc--679     [000] .n...    41.749825: fsi_slave_init: 
fsi1: idx:3 link:2/8 cid:2 cfam:c0020da6 00800000
  openpower-proc--679     [001] .n...    42.111040: fsi_slave_init: 
fsi1: idx:4 link:3/8 cid:3 cfam:c0020da6 00800000

Thanks,

Eddie


>
>
> Kind regards,
>
> Paul
>
>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   drivers/fsi/fsi-core.c                   |  13 ++-
>>   drivers/fsi/fsi-master-aspeed.c          |   2 +
>>   include/trace/events/fsi.h               | 109 +++++++++++++++++++++++
>>   include/trace/events/fsi_master_aspeed.h |  12 +++
>>   4 files changed, 133 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
>> index 59ddc9fd5bca..78710087aa05 100644
>> --- a/drivers/fsi/fsi-core.c
>> +++ b/drivers/fsi/fsi-core.c
>> @@ -24,9 +24,6 @@
>>     #include "fsi-master.h"
>>   -#define CREATE_TRACE_POINTS
>> -#include <trace/events/fsi.h>
>> -
>>   #define FSI_SLAVE_CONF_NEXT_MASK    GENMASK(31, 31)
>>   #define FSI_SLAVE_CONF_SLOTS_MASK    GENMASK(23, 16)
>>   #define FSI_SLAVE_CONF_SLOTS_SHIFT    16
>> @@ -95,6 +92,9 @@ struct fsi_slave {
>>       u8            t_echo_delay;
>>   };
>>   +#define CREATE_TRACE_POINTS
>> +#include <trace/events/fsi.h>
>> +
>>   #define to_fsi_master(d) container_of(d, struct fsi_master, dev)
>>   #define to_fsi_slave(d) container_of(d, struct fsi_slave, dev)
>>   @@ -524,6 +524,8 @@ static int fsi_slave_scan(struct fsi_slave *slave)
>>               dev->addr = engine_addr;
>>               dev->size = slots * engine_page_size;
>>   +            trace_fsi_dev_init(dev);
>> +
>>               dev_dbg(&slave->dev,
>>               "engine[%i]: type %x, version %x, addr %x size %x\n",
>>                       dev->unit, dev->engine_type, version,
>> @@ -953,6 +955,7 @@ static int __fsi_get_new_minor(struct fsi_slave 
>> *slave, enum fsi_dev_type type,
>>           if (id >= 0) {
>>               *out_index = fsi_adjust_index(cid);
>>               *out_dev = fsi_base_dev + id;
>> +            trace_fsi_minor(cid, type, true, cid);
>>               return 0;
>>           }
>>           /* Other failure */
>> @@ -966,6 +969,7 @@ static int __fsi_get_new_minor(struct fsi_slave 
>> *slave, enum fsi_dev_type type,
>>           return id;
>>       *out_index = fsi_adjust_index(id);
>>       *out_dev = fsi_base_dev + id;
>> +    trace_fsi_minor(cid, type, false, id);
>>       return 0;
>>   }
>>   @@ -1006,6 +1010,7 @@ static int fsi_slave_init(struct fsi_master 
>> *master, int link, uint8_t id)
>>         crc = crc4(0, cfam_id, 32);
>>       if (crc) {
>> +        trace_fsi_slave_invalid_cfam(master, link, cfam_id);
>>           dev_warn(&master->dev, "slave %02x:%02x invalid cfam id 
>> CRC!\n",
>>                   link, id);
>>           return -EIO;
>> @@ -1080,6 +1085,8 @@ static int fsi_slave_init(struct fsi_master 
>> *master, int link, uint8_t id)
>>       if (rc)
>>           goto err_free;
>>   +    trace_fsi_slave_init(slave);
>> +
>>       /* Create chardev for userspace access */
>>       cdev_init(&slave->cdev, &cfam_fops);
>>       rc = cdev_device_add(&slave->cdev, &slave->dev);
>> diff --git a/drivers/fsi/fsi-master-aspeed.c 
>> b/drivers/fsi/fsi-master-aspeed.c
>> index 8606e55c1721..04fec1aab23c 100644
>> --- a/drivers/fsi/fsi-master-aspeed.c
>> +++ b/drivers/fsi/fsi-master-aspeed.c
>> @@ -449,11 +449,13 @@ static ssize_t cfam_reset_store(struct device 
>> *dev, struct device_attribute *att
>>   {
>>       struct fsi_master_aspeed *aspeed = dev_get_drvdata(dev);
>>   +    trace_fsi_master_aspeed_cfam_reset(true);
>>       mutex_lock(&aspeed->lock);
>>       gpiod_set_value(aspeed->cfam_reset_gpio, 1);
>>       usleep_range(900, 1000);
>>       gpiod_set_value(aspeed->cfam_reset_gpio, 0);
>>       mutex_unlock(&aspeed->lock);
>> +    trace_fsi_master_aspeed_cfam_reset(false);
>>         return count;
>>   }
>> diff --git a/include/trace/events/fsi.h b/include/trace/events/fsi.h
>> index 9832cb8e0eb0..251bc57a8b7f 100644
>> --- a/include/trace/events/fsi.h
>> +++ b/include/trace/events/fsi.h
>> @@ -122,6 +122,115 @@ TRACE_EVENT(fsi_master_break,
>>       )
>>   );
>>   +TRACE_EVENT(fsi_slave_init,
>> +    TP_PROTO(const struct fsi_slave *slave),
>> +    TP_ARGS(slave),
>> +    TP_STRUCT__entry(
>> +        __field(int,    master_idx)
>> +        __field(int,    master_n_links)
>> +        __field(int,    idx)
>> +        __field(int,    link)
>> +        __field(int,    chip_id)
>> +        __field(__u32,    cfam_id)
>> +        __field(__u32,    size)
>> +    ),
>> +    TP_fast_assign(
>> +        __entry->master_idx = slave->master->idx;
>> +        __entry->master_n_links = slave->master->n_links;
>> +        __entry->idx = slave->cdev_idx;
>> +        __entry->link = slave->link;
>> +        __entry->chip_id = slave->chip_id;
>> +        __entry->cfam_id = slave->cfam_id;
>> +        __entry->size = slave->size;
>> +    ),
>> +    TP_printk("fsi%d: idx:%d link:%d/%d cid:%d cfam:%08x %08x",
>> +        __entry->master_idx,
>> +        __entry->idx,
>> +        __entry->link,
>> +        __entry->master_n_links,
>> +        __entry->chip_id,
>> +        __entry->cfam_id,
>> +        __entry->size
>> +    )
>> +);
>> +
>> +TRACE_EVENT(fsi_slave_invalid_cfam,
>> +    TP_PROTO(const struct fsi_master *master, int link, uint32_t 
>> cfam_id),
>> +    TP_ARGS(master, link, cfam_id),
>> +    TP_STRUCT__entry(
>> +        __field(int,    master_idx)
>> +        __field(int,    master_n_links)
>> +        __field(int,    link)
>> +        __field(__u32,    cfam_id)
>> +    ),
>> +    TP_fast_assign(
>> +        __entry->master_idx = master->idx;
>> +        __entry->master_n_links = master->n_links;
>> +        __entry->link = link;
>> +        __entry->cfam_id = cfam_id;
>> +    ),
>> +    TP_printk("fsi%d: cfam:%08x link:%d/%d",
>> +        __entry->master_idx,
>> +        __entry->cfam_id,
>> +        __entry->link,
>> +        __entry->master_n_links
>> +    )
>> +);
>> +
>> +TRACE_EVENT(fsi_minor,
>> +    TP_PROTO(int cid, enum fsi_dev_type type, bool legacy, int result),
>> +    TP_ARGS(cid, type, legacy, result),
>> +    TP_STRUCT__entry(
>> +        __field(int,    cid)
>> +        __field(int,    type)
>> +        __field(bool,    legacy)
>> +        __field(int,    result)
>> +    ),
>> +    TP_fast_assign(
>> +        __entry->cid = cid;
>> +        __entry->type = type;
>> +        __entry->legacy = legacy;
>> +        __entry->result = result;
>> +    ),
>> +    TP_printk("%d: cid:%d type:%d%s",
>> +        __entry->result,
>> +        __entry->cid,
>> +        __entry->type,
>> +        __entry->legacy ? " legacy" : ""
>> +    )
>> +);
>> +
>> +TRACE_EVENT(fsi_dev_init,
>> +    TP_PROTO(const struct fsi_device *dev),
>> +    TP_ARGS(dev),
>> +    TP_STRUCT__entry(
>> +        __field(int,    master_idx)
>> +        __field(int,    link)
>> +        __field(int,    type)
>> +        __field(int,    unit)
>> +        __field(int,    version)
>> +        __field(__u32,    addr)
>> +        __field(__u32,    size)
>> +    ),
>> +    TP_fast_assign(
>> +        __entry->master_idx = dev->slave->master->idx;
>> +        __entry->link = dev->slave->link;
>> +        __entry->type = dev->engine_type;
>> +        __entry->unit = dev->unit;
>> +        __entry->version = dev->version;
>> +        __entry->addr = dev->addr;
>> +        __entry->size = dev->size;
>> +    ),
>> +    TP_printk("fsi%d: slv%d: t:%02x u:%02x v:%02x %08x@%08x",
>> +        __entry->master_idx,
>> +        __entry->link,
>> +        __entry->type,
>> +        __entry->unit,
>> +        __entry->version,
>> +        __entry->size,
>> +        __entry->addr
>> +    )
>> +);
>>     #endif /* _TRACE_FSI_H */
>>   diff --git a/include/trace/events/fsi_master_aspeed.h 
>> b/include/trace/events/fsi_master_aspeed.h
>> index a355ceacc33f..0fff873775f1 100644
>> --- a/include/trace/events/fsi_master_aspeed.h
>> +++ b/include/trace/events/fsi_master_aspeed.h
>> @@ -72,6 +72,18 @@ TRACE_EVENT(fsi_master_aspeed_opb_error,
>>           )
>>       );
>>   +TRACE_EVENT(fsi_master_aspeed_cfam_reset,
>> +    TP_PROTO(bool start),
>> +    TP_ARGS(start),
>> +    TP_STRUCT__entry(
>> +        __field(bool,    start)
>> +    ),
>> +    TP_fast_assign(
>> +        __entry->start = start;
>> +    ),
>> +    TP_printk("%s", __entry->start ? "start" : "end")
>> +);
>> +
>>   #endif
>>     #include <trace/define_trace.h>
