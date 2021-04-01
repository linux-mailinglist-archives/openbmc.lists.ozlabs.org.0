Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B96CC350E60
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 07:19:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9s1D5cbVz30Gj
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 16:19:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=ILgz/PYe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=ILgz/PYe; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9s0w6YpYz301k;
 Thu,  1 Apr 2021 16:18:56 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id EFF316F;
 Wed, 31 Mar 2021 22:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1617254333;
 bh=fzknu6DQH+qziW2FyNdVu9seQuTeZSZKGJbOYsjJd1Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ILgz/PYefVLlO5ToxdjPA90uL4x7NGH8HYCX4cbRw9WuUzfxcwsk/us21w/YGCTcc
 qTbDTzihV8oxLE/XzKydxbiMEFLcH3EBHawzjx1ih63tMdolMjxe7bPGKTwBWHp3G7
 d9Rp2wyzm8b6rTyOf2APU3/e8by/XqMimHs9w350=
Date: Thu, 1 Apr 2021 00:18:51 -0500
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 2/3] drivers/tty/serial/8250: add DT property for
 aspeed vuart sirq polarity
Message-ID: <YGVXuyqOyxc8kcQz@hatter.bewilderbeest.net>
References: <YGOuhjD19SmjmQou@hatter.bewilderbeest.net>
 <20210401005702.28271-1-zev@bewilderbeest.net>
 <20210401005702.28271-3-zev@bewilderbeest.net>
 <CACPK8XdPVf1WMmo8C8RJtd-1cH5qV9odEDhDUHWRiMOk=dQNtg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACPK8XdPVf1WMmo8C8RJtd-1cH5qV9odEDhDUHWRiMOk=dQNtg@mail.gmail.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Mar 31, 2021 at 11:15:44PM CDT, Joel Stanley wrote:
>On Thu, 1 Apr 2021 at 00:57, Zev Weiss <zev@bewilderbeest.net> wrote:
>>
>> This provides a simple boolean to use instead of the deprecated
>> aspeed,sirq-polarity-sense property.
>>
>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>> ---
>>  drivers/tty/serial/8250/8250_aspeed_vuart.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
>> index c33e02cbde93..e5ef9f957f9a 100644
>> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
>> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
>> @@ -482,6 +482,9 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
>>                 of_node_put(sirq_polarity_sense_args.np);
>>         }
>>
>> +       if (of_property_read_bool(np, "aspeed,sirq-active-high"))
>> +               aspeed_vuart_set_sirq_polarity(vuart, 1);
>
>This assumes the default is always low, so we don't need a property to
>set it to that state?
>
>Would it make more sense to have the property describe if it's high or
>low? (I'm happy for the answer to be "no", as we've gotten by for the
>past few years without it).
>

Yeah, that sounds like better way to approach it -- I think I'll 
rearrange as Andrew suggested in 
https://lore.kernel.org/openbmc/d66753ee-7db2-41e5-9fe5-762b1ab678bc@www.fastmail.com/

>This brings up another point. We already have the sysfs file for
>setting the lpc address, from userspace. In OpenBMC land this can be
>set with obmc-console-client (/etc/obmc-console.conf). Should we add
>support to that application for setting the irq polarity too, and do
>away with device tree descriptions?
>

I guess I might lean slightly toward keeping the DT description so that 
if for whatever reason obmc-console-server flakes out and doesn't start 
you're better positioned to try banging on /dev/ttyS* manually if you're 
desperate.  Though I suppose that in turn might imply that I'm arguing 
for adding DT properties for lpc_address and sirq too, and if you're 
really that desperate you can just fiddle with sysfs anyway, so...shrug?  
I could be convinced either way fairly easily.


Zev

