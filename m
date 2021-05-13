Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B66837FE08
	for <lists+openbmc@lfdr.de>; Thu, 13 May 2021 21:26:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fh1px0L12z302p
	for <lists+openbmc@lfdr.de>; Fri, 14 May 2021 05:26:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=X+/8f3XP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=X+/8f3XP; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fh1pZ5QGCz2yZ2;
 Fri, 14 May 2021 05:25:41 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id D83633E8;
 Thu, 13 May 2021 12:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1620933935;
 bh=3xQm+9LMy8PS8L08QfP0aJgsWgjlYVW/AhLSsoPmF+g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X+/8f3XPl1MQ5nQMw8qPZnMaUJqFty0feSXspBZolV9TeFRlqoYfvtYa5IKATp38X
 4TFaKvGcf6yM41p+AZ8gYwMbpBcXiNL8FkbkH+VZxz94d/8/Egi9pZ6IgQZjzL2yDY
 glVjqPZqP/oMRupIjQ/bZVwR6Ty0+DctvMp925dU=
Date: Thu, 13 May 2021 14:25:32 -0500
From: Zev Weiss <zev@bewilderbeest.net>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH 2/3] serial: 8250_aspeed_vuart: initialize vuart->port in
 aspeed_vuart_probe()
Message-ID: <YJ19LMLV1HXk6BMf@hatter.bewilderbeest.net>
References: <20210510014231.647-1-zev@bewilderbeest.net>
 <20210510014231.647-3-zev@bewilderbeest.net>
 <6d4338e2-d9be-411a-aeb7-7d46121b73d4@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <6d4338e2-d9be-411a-aeb7-7d46121b73d4@www.fastmail.com>
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
Cc: linux-aspeed@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, May 12, 2021 at 08:34:06PM CDT, Andrew Jeffery wrote:
>
>
>On Mon, 10 May 2021, at 11:12, Zev Weiss wrote:
>> Previously this had only been initialized if we hit the throttling path
>> in aspeed_vuart_handle_irq(); moving it to the probe function is a
>> slight consistency improvement and avoids redundant reinitialization in
>> the interrupt handler.  It also serves as preparation for converting the
>> driver's I/O accesses to use port->port.membase instead of its own
>> vuart->regs.
>>
>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>> ---
>>  drivers/tty/serial/8250/8250_aspeed_vuart.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c
>> b/drivers/tty/serial/8250/8250_aspeed_vuart.c
>> index 9e8b2e8e32b6..249164dc397b 100644
>> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
>> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
>> @@ -349,11 +349,9 @@ static int aspeed_vuart_handle_irq(struct
>> uart_port *port)
>>  			struct aspeed_vuart *vuart = port->private_data;
>>  			__aspeed_vuart_set_throttle(up, true);
>>
>> -			if (!timer_pending(&vuart->unthrottle_timer)) {
>> -				vuart->port = up;
>> +			if (!timer_pending(&vuart->unthrottle_timer))
>>  				mod_timer(&vuart->unthrottle_timer,
>>  					  jiffies + unthrottle_timeout);
>> -			}
>>
>>  		} else {
>>  			count = min(space, 256);
>> @@ -511,6 +509,7 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
>>  		goto err_clk_disable;
>>
>>  	vuart->line = rc;
>> +	vuart->port = serial8250_get_port(vuart->line);
>
>The documentation of serial8250_get_port() is somewhat concerning wrt
>the use:
>
>https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/serial/8250/8250_core.c?h=v5.13-rc1#n399

Hmm, good point -- though despite that comment it looks like there is 
some existing code using it outside of suspend/resume callbacks (in 
8250_pci.c and 8250_pnp.c).  I'm not certain if those would necessarily 
be considered good precedent to follow for this, but I don't see any 
obvious better way of getting hold of the corresponding uart_8250_port 
(or its port.membase).

I did receive a notification that Greg had added this series to his 
tty-testing branch; not sure if that means he thinks it's OK or if it 
just kind of slipped by unnoticed though.

>
>However, given the existing behaviour it shouldn't be problematic?
>

"existing behaviour" referring to what here?


Thanks,
Zev

