Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F27CCD11EC
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 17:00:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pHTf4VQqzDqTV
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 02:00:54 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pHSW3nfdzDqSn;
 Thu, 10 Oct 2019 01:59:54 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x99Ew8Fe140298; Wed, 9 Oct 2019 10:59:39 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vhekx80vb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Oct 2019 10:59:39 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x99Et8vR012341;
 Wed, 9 Oct 2019 14:59:38 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 2vejt7k694-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Oct 2019 14:59:38 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x99ExbKJ42533202
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Oct 2019 14:59:37 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A11D6A047;
 Wed,  9 Oct 2019 14:59:37 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D40166A04F;
 Wed,  9 Oct 2019 14:59:36 +0000 (GMT)
Received: from [9.41.103.158] (unknown [9.41.103.158])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  9 Oct 2019 14:59:36 +0000 (GMT)
Subject: Re: [PATCH] media: aspeed: clear garbage interrupts
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Eddie James <eajames@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20190926222743.18546-1-jae.hyun.yoo@linux.intel.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Message-ID: <90573930-c53b-9954-99e4-9b37e0661025@linux.vnet.ibm.com>
Date: Wed, 9 Oct 2019 09:59:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190926222743.18546-1-jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-09_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=898 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910090142
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
Cc: openbmc@lists.ozlabs.org, Jae Hyun Yoo <jae.hyun.yoo@intel.com>,
 linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 9/26/19 5:27 PM, Jae Hyun Yoo wrote:
> From: Jae Hyun Yoo <jae.hyun.yoo@intel.com>
>
> CAPTURE_COMPLETE and FRAME_COMPLETE interrupts come even when these
> are disabled in the VE_INTERRUPT_CTRL register and eventually this
> behavior causes disabling irq itself like below:


Thanks!

Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> [10055.108784] irq 23: nobody cared (try booting with the "irqpoll" option)
> [10055.115525] CPU: 0 PID: 331 Comm: swampd Tainted: G        W         5.3.0-4fde000-dirty-d683e2e #1
> [10055.124565] Hardware name: Generic DT based system
> [10055.129355] Backtrace:
> [10055.131854] [<80107d7c>] (dump_backtrace) from [<80107fb0>] (show_stack+0x20/0x24)
> [10055.139431]  r7:00000017 r6:00000001 r5:00000000 r4:9d51dc00
> [10055.145120] [<80107f90>] (show_stack) from [<8074bf50>] (dump_stack+0x20/0x28)
> [10055.152361] [<8074bf30>] (dump_stack) from [<80150ffc>] (__report_bad_irq+0x40/0xc0)
> [10055.160109] [<80150fbc>] (__report_bad_irq) from [<80150f2c>] (note_interrupt+0x23c/0x294)
> [10055.168374]  r9:015b6e60 r8:00000000 r7:00000017 r6:00000001 r5:00000000 r4:9d51dc00
> [10055.176136] [<80150cf0>] (note_interrupt) from [<8014df1c>] (handle_irq_event_percpu+0x88/0x98)
> [10055.184835]  r10:7eff7910 r9:015b6e60 r8:00000000 r7:9d417600 r6:00000001 r5:00000002
> [10055.192657]  r4:9d51dc00 r3:00000000
> [10055.196248] [<8014de94>] (handle_irq_event_percpu) from [<8014df64>] (handle_irq_event+0x38/0x4c)
> [10055.205113]  r5:80b56d50 r4:9d51dc00
> [10055.208697] [<8014df2c>] (handle_irq_event) from [<80151f1c>] (handle_level_irq+0xbc/0x12c)
> [10055.217037]  r5:80b56d50 r4:9d51dc00
> [10055.220623] [<80151e60>] (handle_level_irq) from [<8014d4b8>] (generic_handle_irq+0x30/0x44)
> [10055.229052]  r5:80b56d50 r4:00000017
> [10055.232648] [<8014d488>] (generic_handle_irq) from [<8014d524>] (__handle_domain_irq+0x58/0xb4)
> [10055.241356] [<8014d4cc>] (__handle_domain_irq) from [<801021e4>] (avic_handle_irq+0x68/0x70)
> [10055.249797]  r9:015b6e60 r8:00c5387d r7:00c5387d r6:ffffffff r5:9dd33fb0 r4:9d402380
> [10055.257539] [<8010217c>] (avic_handle_irq) from [<80101e34>] (__irq_usr+0x54/0x80)
> [10055.265105] Exception stack(0x9dd33fb0 to 0x9dd33ff8)
> [10055.270152] 3fa0:                                     015d0530 00000000 00000000 015d0538
> [10055.278328] 3fc0: 015d0530 015b6e60 00000000 00000000 0052c5d0 015b6e60 7eff7910 7eff7918
> [10055.286496] 3fe0: 76ce5614 7eff7908 0050e2f4 76a3a08c 20000010 ffffffff
> [10055.293104]  r5:20000010 r4:76a3a08c
> [10055.296673] handlers:
> [10055.298967] [<79f218a5>] irq_default_primary_handler threaded [<1de88514>] aspeed_video_irq
> [10055.307344] Disabling IRQ #23
>
> To fix this issue, this commit makes the interrupt handler clear
> these garbage interrupts. This driver enables and uses only
> COMP_COMPLETE interrupt instead for frame handling.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@intel.com>
> ---
>   drivers/media/platform/aspeed-video.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index eb12f3793062..e842f99d20a9 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -606,6 +606,16 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>   			aspeed_video_start_frame(video);
>   	}
>   
> +	/*
> +	 * CAPTURE_COMPLETE and FRAME_COMPLETE interrupts come even when these
> +	 * are disabled in the VE_INTERRUPT_CTRL register so clear them to
> +	 * prevent unnecessary interrupt calls.
> +	 */
> +	if (sts & VE_INTERRUPT_CAPTURE_COMPLETE)
> +		sts &= ~VE_INTERRUPT_CAPTURE_COMPLETE;
> +	if (sts & VE_INTERRUPT_FRAME_COMPLETE)
> +		sts &= ~VE_INTERRUPT_FRAME_COMPLETE;
> +
>   	return sts ? IRQ_NONE : IRQ_HANDLED;
>   }
>   
