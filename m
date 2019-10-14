Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6ACD69A0
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2019 20:40:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sS6y6Q75zDqv2
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 05:40:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sS5405hXzDqvl
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 05:39:03 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9EIcv6W052804; Mon, 14 Oct 2019 14:38:57 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vmupspdjs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2019 14:38:56 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9EIa6Ho002038;
 Mon, 14 Oct 2019 18:38:03 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 2vk6f71qdv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2019 18:38:03 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9EIc2Xi25887226
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Oct 2019 18:38:02 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 738EBC6057;
 Mon, 14 Oct 2019 18:38:02 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D211C605A;
 Mon, 14 Oct 2019 18:38:02 +0000 (GMT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 14 Oct 2019 18:38:01 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.3 1/2] fsi: aspeed: Remove base from trace
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20191014132140.7618-1-joel@jms.id.au>
 <20191014132140.7618-2-joel@jms.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Message-ID: <d89d1cf1-cda4-6850-7e9b-5a0c97775a06@linux.vnet.ibm.com>
Date: Mon, 14 Oct 2019 13:38:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191014132140.7618-2-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-14_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910140151
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 10/14/19 8:21 AM, Joel Stanley wrote:
> The base was showing the virtual address of the FSI master, which was
> not useful for most users of the tracepoint.


Reviewed-by: Eddie James <eajames@linux.ibm.com>

Tested-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   drivers/fsi/fsi-master-aspeed.c          |  5 ++---
>   include/trace/events/fsi_master_aspeed.h | 20 ++++++++------------
>   2 files changed, 10 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
> index 2048e38e7200..d796c4012875 100644
> --- a/drivers/fsi/fsi-master-aspeed.c
> +++ b/drivers/fsi/fsi-master-aspeed.c
> @@ -194,8 +194,7 @@ static u32 opb_write(void __iomem *base, uint32_t addr, uint32_t val,
>   
>   	status = readl(base + OPB0_STATUS);
>   
> -	trace_fsi_master_aspeed_opb_write(base, addr, val, size,
> -			status, reg);
> +	trace_fsi_master_aspeed_opb_write(addr, val, size, status, reg);
>   
>   	/* Return error when poll timed out */
>   	if (ret)
> @@ -231,7 +230,7 @@ static int opb_read(void __iomem *base, uint32_t addr, size_t size, u32 *out)
>   
>   	result = readl(base + OPB0_FSI_DATA_R);
>   
> -	trace_fsi_master_aspeed_opb_read(base, addr, size, result,
> +	trace_fsi_master_aspeed_opb_read(addr, size, result,
>   			readl(base + OPB0_STATUS),
>   			reg);
>   
> diff --git a/include/trace/events/fsi_master_aspeed.h b/include/trace/events/fsi_master_aspeed.h
> index 06ff6a14bf11..63b9ce7f0de6 100644
> --- a/include/trace/events/fsi_master_aspeed.h
> +++ b/include/trace/events/fsi_master_aspeed.h
> @@ -9,10 +9,9 @@
>   #include <linux/tracepoint.h>
>   
>   TRACE_EVENT(fsi_master_aspeed_opb_read,
> -	TP_PROTO(void __iomem *base, uint32_t addr, size_t size, uint32_t result, uint32_t status, uint32_t irq_status),
> -	TP_ARGS(base, addr, size, result, status, irq_status),
> +	TP_PROTO(uint32_t addr, size_t size, uint32_t result, uint32_t status, uint32_t irq_status),
> +	TP_ARGS(addr, size, result, status, irq_status),
>   	TP_STRUCT__entry(
> -		__field(void *,    base)
>   		__field(uint32_t,  addr)
>   		__field(size_t,    size)
>   		__field(uint32_t,  result)
> @@ -20,24 +19,22 @@ TRACE_EVENT(fsi_master_aspeed_opb_read,
>   		__field(uint32_t,  irq_status)
>   		),
>   	TP_fast_assign(
> -		__entry->base = base;
>   		__entry->addr = addr;
>   		__entry->size = size;
>   		__entry->result = result;
>   		__entry->status = status;
>   		__entry->irq_status = irq_status;
>   		),
> -	TP_printk("fsi: opb read: base %p addr %08x size %zu: result %08x status: %08x irq_status: %08x",
> -		__entry->base, __entry->addr, __entry->size, __entry->result,
> +	TP_printk("fsi: opb read: addr %08x size %zu: result %08x status: %08x irq_status: %08x",
> +		__entry->addr, __entry->size, __entry->result,
>   		__entry->status, __entry->irq_status
>   	   )
>   );
>   
>   TRACE_EVENT(fsi_master_aspeed_opb_write,
> -	TP_PROTO(void __iomem *base, uint32_t addr, uint32_t val, size_t size, uint32_t status, uint32_t irq_status),
> -	TP_ARGS(base, addr, val, size, status, irq_status),
> +	TP_PROTO(uint32_t addr, uint32_t val, size_t size, uint32_t status, uint32_t irq_status),
> +	TP_ARGS(addr, val, size, status, irq_status),
>   	TP_STRUCT__entry(
> -		__field(void *,    base)
>   		__field(uint32_t,    addr)
>   		__field(uint32_t,    val)
>   		__field(size_t,    size)
> @@ -45,15 +42,14 @@ TRACE_EVENT(fsi_master_aspeed_opb_write,
>   		__field(uint32_t,  irq_status)
>   		),
>   	TP_fast_assign(
> -		__entry->base = base;
>   		__entry->addr = addr;
>   		__entry->val = val;
>   		__entry->size = size;
>   		__entry->status = status;
>   		__entry->irq_status = irq_status;
>   		),
> -	TP_printk("fsi: opb write: base %p addr %08x val %08x size %zu status: %08x irq_status: %08x",
> -		__entry->base, __entry->addr, __entry->val, __entry->size,
> +	TP_printk("fsi: opb write: addr %08x val %08x size %zu status: %08x irq_status: %08x",
> +		__entry->addr, __entry->val, __entry->size,
>   		__entry->status, __entry->irq_status
>   		)
>   	);
