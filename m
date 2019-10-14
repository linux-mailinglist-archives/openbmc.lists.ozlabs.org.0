Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF56D6994
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2019 20:39:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sS5h1ZmxzDqj1
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 05:39:36 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sS4k3GsmzDqgC
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 05:38:45 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9EIcR6O076215; Mon, 14 Oct 2019 14:38:36 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vmu30ysnm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2019 14:38:36 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9EIa6x9006322;
 Mon, 14 Oct 2019 18:38:35 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma05wdc.us.ibm.com with ESMTP id 2vk6f6vksm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2019 18:38:35 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9EIcYb661014344
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Oct 2019 18:38:34 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD9D9C605A;
 Mon, 14 Oct 2019 18:38:34 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 820F9C6057;
 Mon, 14 Oct 2019 18:38:34 +0000 (GMT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 14 Oct 2019 18:38:34 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.3 2/2] fsi: aspeed: Add trace when error occurs
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20191014132140.7618-1-joel@jms.id.au>
 <20191014132140.7618-3-joel@jms.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Message-ID: <50fba3fd-c2e1-cfdc-cff7-89510374bfb6@linux.vnet.ibm.com>
Date: Mon, 14 Oct 2019 13:38:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191014132140.7618-3-joel@jms.id.au>
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
> This prints out three registers in the FSI master when an error occurs.


Reviewed-by: Eddie James <eajames@linux.ibm.com>

Tested-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   drivers/fsi/fsi-master-aspeed.c          |  7 +++++++
>   include/trace/events/fsi_master_aspeed.h | 18 ++++++++++++++++++
>   2 files changed, 25 insertions(+)
>
> diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
> index d796c4012875..66657b7848de 100644
> --- a/drivers/fsi/fsi-master-aspeed.c
> +++ b/drivers/fsi/fsi-master-aspeed.c
> @@ -251,6 +251,13 @@ static int opb_read(void __iomem *base, uint32_t addr, size_t size, u32 *out)
>   static int check_errors(struct fsi_master_aspeed *aspeed, int err)
>   {
>   	int ret;
> +	u32 mresp0, mstap0, mesrb0;
> +
> +	opb_read(aspeed->base, ctrl_base + FSI_MRESP0, 4, &mresp0);
> +	opb_read(aspeed->base, ctrl_base + FSI_MSTAP0, 4, &mstap0);
> +	opb_read(aspeed->base, ctrl_base + FSI_MESRB0, 4, &mesrb0);
> +
> +	trace_fsi_master_aspeed_opb_error(mresp0, mstap0, mesrb0);
>   
>   	if (err == -EIO) {
>   		/* Check MAEB (0x70) ? */
> diff --git a/include/trace/events/fsi_master_aspeed.h b/include/trace/events/fsi_master_aspeed.h
> index 63b9ce7f0de6..8e47637c5fb7 100644
> --- a/include/trace/events/fsi_master_aspeed.h
> +++ b/include/trace/events/fsi_master_aspeed.h
> @@ -54,6 +54,24 @@ TRACE_EVENT(fsi_master_aspeed_opb_write,
>   		)
>   	);
>   
> +TRACE_EVENT(fsi_master_aspeed_opb_error,
> +	TP_PROTO(uint32_t mresp0, uint32_t mstap0, uint32_t mesrb0),
> +	TP_ARGS(mresp0, mstap0, mesrb0),
> +	TP_STRUCT__entry(
> +		__field(uint32_t,  mresp0)
> +		__field(uint32_t,  mstap0)
> +		__field(uint32_t,  mesrb0)
> +		),
> +	TP_fast_assign(
> +		__entry->mresp0 = mresp0;
> +		__entry->mstap0 = mstap0;
> +		__entry->mesrb0 = mesrb0;
> +		),
> +	TP_printk("mresp0 %08x mstap0 %08x mesrb0 %08x",
> +		__entry->mresp0, __entry->mstap0, __entry->mesrb0
> +		)
> +	);
> +
>   #endif
>   
>   #include <trace/define_trace.h>
