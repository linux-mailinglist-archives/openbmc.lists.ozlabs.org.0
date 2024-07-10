Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB9692D36E
	for <lists+openbmc@lfdr.de>; Wed, 10 Jul 2024 15:53:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJzpY13qtz3dRD
	for <lists+openbmc@lfdr.de>; Wed, 10 Jul 2024 23:53:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJzpD25Jmz3cXy
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jul 2024 23:53:04 +1000 (AEST)
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 8C0CA61E64862;
	Wed, 10 Jul 2024 15:52:44 +0200 (CEST)
Message-ID: <00f9c8d1-4572-40bc-925e-17161cbec0fb@molgen.mpg.de>
Date: Wed, 10 Jul 2024 15:52:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux dev-6.6 v1] usb: chipidea: udc: enforce write to the
 memory.
To: Tomer Maimon <tmaimon77@gmail.com>
References: <20240710124157.2106609-1-tmaimon77@gmail.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20240710124157.2106609-1-tmaimon77@gmail.com>
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
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Tomer,


Thank you for your patch.

Am 10.07.24 um 14:41 schrieb Tomer Maimon:
> In the prime endpoint function, we need to read from qh.ptr->td.token
> to ensure that the previous write to it has indeed been committed
> to memory.

Please document the datasheet name, revision and section. If this 
actually caused user visible problems, please also document the test case.

> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>   drivers/usb/chipidea/udc.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 0b7bd3c643c3..0b14a1d54d59 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -190,12 +190,21 @@ static int hw_ep_get_halt(struct ci_hdrc *ci, int num, int dir)
>    *
>    * This function returns an error code
>    */
> -static int hw_ep_prime(struct ci_hdrc *ci, int num, int dir, int is_ctrl)
> +static int hw_ep_prime(struct ci_hdrc *ci, struct ci_hw_ep *hwep, int num,
> +		       int dir, int is_ctrl)
>   {
>   	int n = hw_ep_bit(num, dir);
>   
>   	/* Synchronize before ep prime */
>   	wmb();
> +	
> +	/*
> +	 * We add the read from qh.ptr->td.token to make sure the previous
> +	 * write to it indeed got into the mamory so when we prime the DMA

m*e*mory

> +	 * will read the updated data
> +	 */
> +	if (hwep->qh.ptr->td.token & 0x80000000)
> +		pr_info("%s(): hwep->qh.ptr->td.token=%08x\n", __func__, hwep->qh.ptr->td.token);
>   
>   	if (is_ctrl && dir == RX && hw_read(ci, OP_ENDPTSETUPSTAT, BIT(num)))
>   		return -EAGAIN;
> @@ -632,7 +641,7 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
>   		hwep->qh.ptr->cap |= cpu_to_le32(mul << __ffs(QH_MULT));
>   	}
>   
> -	ret = hw_ep_prime(ci, hwep->num, hwep->dir,
> +	ret = hw_ep_prime(ci, hwep, hwep->num, hwep->dir,
>   			   hwep->type == USB_ENDPOINT_XFER_CONTROL);
>   done:
>   	return ret;
> @@ -658,7 +667,7 @@ static int reprime_dtd(struct ci_hdrc *ci, struct ci_hw_ep *hwep,
>   	hwep->qh.ptr->td.token &=
>   		cpu_to_le32(~(TD_STATUS_HALTED | TD_STATUS_ACTIVE));
>   
> -	return hw_ep_prime(ci, hwep->num, hwep->dir,
> +	return hw_ep_prime(ci, hwep, hwep->num, hwep->dir,
>   				hwep->type == USB_ENDPOINT_XFER_CONTROL);
>   }
>   


Kind regards,

Paul
