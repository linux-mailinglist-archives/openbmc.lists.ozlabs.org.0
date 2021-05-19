Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 895483887C7
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 08:44:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlNdp3H60z304D
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 16:44:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.53; helo=mail-wm1-f53.google.com;
 envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlNMQ6SqJz2yR7;
 Wed, 19 May 2021 16:32:18 +1000 (AEST)
Received: by mail-wm1-f53.google.com with SMTP id
 h3-20020a05600c3503b0290176f13c7715so2641173wmq.5; 
 Tue, 18 May 2021 23:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j/woY3wUI9Ol7gIpKTK/4dqj6Jzmp8dptTJTfnXhBXM=;
 b=uQitfxRkqLVrEkVQuHbAv1wS7Puy0zSReFjF4VsweM8786/c5yGWzTCG1UKOGwj5Gv
 pPaLEzNCN+dkm3tqOhaz0Ho5xUNF53b9c4xZj4J6pDWOURK07SospEWWhYyWtsqQWiSd
 BleWqE5gYmGHKT00y9vaiGT+WPteCQooYgiEkikP6cEn/tG18kHhsRbtSQHUqHDZUJ5G
 KPDrWH/vxhQlWHXv1i30dnEeiNgfKDvRuaoA7d656E0/mZ23c0qHcJnO5CsyxkTCIhrs
 R32TMt5GjDkyW3nTZ/ericNkxdFOLHz1WcjhGvAMbpPt5hAjkn5MDtEEkLxM2K/Jj+zQ
 9M3A==
X-Gm-Message-State: AOAM5325INjNsv3TxNgcXJ828pb2k33xs7kvmuqCHFYhVKXoYe65Px13
 vBLZeS1uJ5EOJPB1JY3wAJg=
X-Google-Smtp-Source: ABdhPJzqXzsWrot/yJuG9Dp9Wg69TTI5G9IYTHbq8MKYRdDD+NlPOP4/TQYQFmB0IgIwr+0Iq0Uq5A==
X-Received: by 2002:a1c:1f84:: with SMTP id f126mr9277306wmf.189.1621405935037; 
 Tue, 18 May 2021 23:32:15 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id g11sm23779444wri.59.2021.05.18.23.32.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 23:32:14 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] serial: 8250: Use BIT(x) for UART_{CAP,BUG}_*
To: Andrew Jeffery <andrew@aj.id.au>, linux-serial@vger.kernel.org
References: <20210519000704.3661773-1-andrew@aj.id.au>
 <20210519000704.3661773-3-andrew@aj.id.au>
 <56ec152a-560b-1eed-97e2-c12e4fed171a@kernel.org>
 <2bb7dfc4-a20e-4e3e-8fa5-74ff264c4e44@www.fastmail.com>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <a67f0c95-7708-569f-099b-db9e2ad9616d@kernel.org>
Date: Wed, 19 May 2021 08:32:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <2bb7dfc4-a20e-4e3e-8fa5-74ff264c4e44@www.fastmail.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 19 May 2021 16:44:03 +1000
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, linux-aspeed@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, jenmin_yuan@aspeedtech.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 19. 05. 21, 8:27, Andrew Jeffery wrote:
> 
> 
> On Wed, 19 May 2021, at 15:44, Jiri Slaby wrote:
>> On 19. 05. 21, 2:07, Andrew Jeffery wrote:
>>> BIT(x) improves readability and safety with respect to shifts.
>>>
>>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>>> ---
>>>    drivers/tty/serial/8250/8250.h | 33 +++++++++++++++++----------------
>>>    1 file changed, 17 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
>>> index 34aa2714f3c9..4fbf1088fad8 100644
>>> --- a/drivers/tty/serial/8250/8250.h
>>> +++ b/drivers/tty/serial/8250/8250.h
>>> @@ -7,6 +7,7 @@
>>>     *  Copyright (C) 2001 Russell King.
>>>     */
>>>    
>>> +#include <linux/bitops.h>
>>>    #include <linux/serial_8250.h>
>>>    #include <linux/serial_reg.h>
>>>    #include <linux/dmaengine.h>
>>> @@ -70,25 +71,25 @@ struct serial8250_config {
>>>    	unsigned int	flags;
>>>    };
>>>    
>>> -#define UART_CAP_FIFO	(1 << 8)	/* UART has FIFO */
>>> -#define UART_CAP_EFR	(1 << 9)	/* UART has EFR */
>>> -#define UART_CAP_SLEEP	(1 << 10)	/* UART has IER sleep */
>>> -#define UART_CAP_AFE	(1 << 11)	/* MCR-based hw flow control */
>>> -#define UART_CAP_UUE	(1 << 12)	/* UART needs IER bit 6 set (Xscale) */
>>> -#define UART_CAP_RTOIE	(1 << 13)	/* UART needs IER bit 4 set (Xscale, Tegra) */
>>> -#define UART_CAP_HFIFO	(1 << 14)	/* UART has a "hidden" FIFO */
>>> -#define UART_CAP_RPM	(1 << 15)	/* Runtime PM is active while idle */
>>> -#define UART_CAP_IRDA	(1 << 16)	/* UART supports IrDA line discipline */
>>> -#define UART_CAP_MINI	(1 << 17)	/* Mini UART on BCM283X family lacks:
>>> +#define UART_CAP_FIFO	BIT(8)	/* UART has FIFO */
>>> +#define UART_CAP_EFR	BIT(9)	/* UART has EFR */
>>> +#define UART_CAP_SLEEP	BIT(10)	/* UART has IER sleep */
>>
>>
>> Perfect, except the include: BIT is not defined in bitops.h, but in
>> bits.h (which includes vdso/bits.h). In fact, bitops.h includes bits.h
>> too, but it's superfluous to include all those bitops.
> 
> Maybe the recommendation in the checkpatch documentation should be
> fixed then?

+1 since:

commit 8bd9cb51daac89337295b6f037b0486911e1b408
Author: Will Deacon <will@kernel.org>
Date:   Tue Jun 19 13:53:08 2018 +0100

     locking/atomics, asm-generic: Move some macros from 
<linux/bitops.h> to a new <linux/bits.h> file

So care to fix checkpatch too :)?

thanks,
-- 
js
suse labs
