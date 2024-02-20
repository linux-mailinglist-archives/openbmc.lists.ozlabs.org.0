Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAB785C05B
	for <lists+openbmc@lfdr.de>; Tue, 20 Feb 2024 16:52:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfP7D30JMz3cgg
	for <lists+openbmc@lfdr.de>; Wed, 21 Feb 2024 02:52:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfP6v6RtNz3brl
	for <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2024 02:52:23 +1100 (AEDT)
Received: from [141.14.220.34] (g34.guest.molgen.mpg.de [141.14.220.34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 35D0E61E5FE01;
	Tue, 20 Feb 2024 16:51:23 +0100 (CET)
Message-ID: <a9169894-6972-49c0-a1d4-d80863f5b511@molgen.mpg.de>
Date: Tue, 20 Feb 2024 16:51:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ipmi: kcs: Update OBF poll timeout to reduce latency
Content-Language: en-US
To: Andrew Geissler <geissonator@gmail.com>
References: <20240220123615.963916-1-geissonator@gmail.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20240220123615.963916-1-geissonator@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: minyard@acm.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joel@jms.id.au, openipmi-developer@lists.sourceforge.net, Andrew Geissler <geissonator@yahoo.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Andrew,


Thank you for your patch. Some style suggestions.

Am 20.02.24 um 13:36 schrieb Andrew Geissler:
> From: Andrew Geissler <geissonator@yahoo.com>

(Oh no, Yahoo. (ignore))

You could be more specific in the git commit message by using *Double*:

 > ipmi: kcs: Double OBF poll timeout to reduce latency

 > ipmi: kcs: Double OBF poll timeout to 200 us to reduce latency

> Commit f90bc0f97f2b ("ipmi: kcs: Poll OBF briefly to reduce OBE
> latency") introduced an optimization to poll when the host has
> read the output data register (ODR). Testing has shown that the 100us
> timeout was not always enough. When we miss that 100us window, it
> results in 10x the time to get the next message from the BMC to the
> host. When you're sending 100's of messages between the BMC and Host,

I do not understand, how this poll timeout can result in such an 
increase, and why a quite big timeout hurts, but I do not know the 
implementation.

> this results in a server boot taking 50% longer for IBM P10 machines.
> 
> Started with 1000 and worked it down until the issue started to reoccur.
> 200 was the sweet spot in my testing. 150 showed the issue
> intermittently.

I’d add a blank line here.

> Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
> ---
>   drivers/char/ipmi/kcs_bmc_aspeed.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
> index 72640da55380..af1eae6153f6 100644
> --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
> +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
> @@ -422,7 +422,7 @@ static void aspeed_kcs_irq_mask_update(struct kcs_bmc_device *kcs_bmc, u8 mask,
>   			 * missed the event.
>   			 */
>   			rc = read_poll_timeout_atomic(aspeed_kcs_inb, str,
> -						      !(str & KCS_BMC_STR_OBF), 1, 100, false,
> +						      !(str & KCS_BMC_STR_OBF), 1, 200, false,
>   						      &priv->kcs_bmc, priv->kcs_bmc.ioreg.str);
>   			/* Time for the slow path? */
>   			if (rc == -ETIMEDOUT)


Kind regards,

Paul
