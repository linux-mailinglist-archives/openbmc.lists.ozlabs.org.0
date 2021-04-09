Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 165D33595FA
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 09:01:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGpvR6wnrz3bpB
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 17:01:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=CidT4DYv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=CidT4DYv; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGpv855Rwz2xYb;
 Fri,  9 Apr 2021 17:01:08 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 240CB86;
 Fri,  9 Apr 2021 00:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1617951666;
 bh=+JLpB4B4pZBi2h8DfTURJ08nGqgdO/pYNV0sF8isNXA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CidT4DYvw7ZKpQkK8gdGXnDdEJXCD9goWMGofn7kROmWmdqG5EWltzowMmaLMHNGU
 6M7G/SO7aMkIYPy7bEV3EaXiUUNr3sIQU3g/L8T8wnqwdiGHfBq5p8sFg0zAprzD90
 FGNpAD/S63WbHASqkhrS6RDPjVQU9ap1qxx8FeqA=
Date: Fri, 9 Apr 2021 02:01:04 -0500
From: Zev Weiss <zev@bewilderbeest.net>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v5 2/4] drivers/tty/serial/8250: refactor sirq and lpc
 address setting code
Message-ID: <YG/7sFv+2AlLKbZ5@hatter.bewilderbeest.net>
References: <20210408011637.5361-1-zev@bewilderbeest.net>
 <20210408011637.5361-3-zev@bewilderbeest.net>
 <db7271d8-8d13-4a8c-a7ba-564e4e769ea5@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <db7271d8-8d13-4a8c-a7ba-564e4e769ea5@www.fastmail.com>
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
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 09, 2021 at 12:06:16AM CDT, Andrew Jeffery wrote:
>
>
>On Thu, 8 Apr 2021, at 10:46, Zev Weiss wrote:
>> This splits dedicated aspeed_vuart_set_{sirq,lpc_address}() functions
>> out of the sysfs store functions in preparation for adding DT
>> properties that will be poking the same registers.  While we're at it,
>> these functions now provide some basic bounds-checking on their
>> arguments.
>>
>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>> ---
>>  drivers/tty/serial/8250/8250_aspeed_vuart.c | 51 ++++++++++++++-------
>>  1 file changed, 35 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c
>> b/drivers/tty/serial/8250/8250_aspeed_vuart.c
>> index c33e02cbde93..8433f8dbb186 100644
>> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
>> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
>> @@ -72,22 +72,31 @@ static ssize_t lpc_address_show(struct device *dev,
>>  	return snprintf(buf, PAGE_SIZE - 1, "0x%x\n", addr);
>>  }
>>
>> +static int aspeed_vuart_set_lpc_address(struct aspeed_vuart *vuart, u32 addr)
>> +{
>> +	if (addr > U16_MAX)
>> +		return -EINVAL;
>> +
>> +	writeb(addr >> 8, vuart->regs + ASPEED_VUART_ADDRH);
>> +	writeb(addr >> 0, vuart->regs + ASPEED_VUART_ADDRL);
>> +
>> +	return 0;
>> +}
>> +
>>  static ssize_t lpc_address_store(struct device *dev,
>>  				 struct device_attribute *attr,
>>  				 const char *buf, size_t count)
>>  {
>>  	struct aspeed_vuart *vuart = dev_get_drvdata(dev);
>> -	unsigned long val;
>> +	u32 val;
>>  	int err;
>>
>> -	err = kstrtoul(buf, 0, &val);
>> +	err = kstrtou32(buf, 0, &val);
>>  	if (err)
>>  		return err;
>>
>> -	writeb(val >> 8, vuart->regs + ASPEED_VUART_ADDRH);
>> -	writeb(val >> 0, vuart->regs + ASPEED_VUART_ADDRL);
>> -
>> -	return count;
>> +	err = aspeed_vuart_set_lpc_address(vuart, val);
>> +	return err ? : count;
>>  }
>>
>>  static DEVICE_ATTR_RW(lpc_address);
>> @@ -105,27 +114,37 @@ static ssize_t sirq_show(struct device *dev,
>>  	return snprintf(buf, PAGE_SIZE - 1, "%u\n", reg);
>>  }
>>
>> +static int aspeed_vuart_set_sirq(struct aspeed_vuart *vuart, u32 sirq)
>> +{
>> +	u8 reg;
>> +
>> +	if (sirq > (ASPEED_VUART_GCRB_HOST_SIRQ_MASK >> ASPEED_VUART_GCRB_HOST_SIRQ_SHIFT))
>> +		return -EINVAL;
>> +
>> +	sirq <<= ASPEED_VUART_GCRB_HOST_SIRQ_SHIFT;
>> +	sirq &= ASPEED_VUART_GCRB_HOST_SIRQ_MASK;
>
>This might be less verbose if we reordered things a little:
>
>```
>sirq <<= ASPEED_VUART_GCRB_HOST_SIRQ_SHIFT;
>if (sirq & ASPEED_VUART_GCRB_HOST_SIRQ_MASK)
>	return -EINVAL;
>sirq &= ASPEED_VUART_GCRB_HOST_SIRQ_MASK;
>```

Hmm, that (or something similar, perhaps with a '~' on the mask in the 
if condition?) does seem like it'd be a nice improvement, though I 
suppose it'd also mean we'd fail to reject some way-out-of-range sirq 
values (e.g. if it had its MSB set) -- so I think I'll leave it as is, 
just in the name of thoroughness/paranoia?

>
>But otherwise it looks okay, so
>
>Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>

Thanks.

