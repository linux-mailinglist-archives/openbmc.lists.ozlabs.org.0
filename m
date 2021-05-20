Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 374F3389AD4
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 03:20:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlsNq0c6pz306c
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 11:20:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=eU7zw9r8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::731;
 helo=mail-qk1-x731.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eU7zw9r8; dkim-atps=neutral
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlsNN14gkz2xvK;
 Thu, 20 May 2021 11:19:46 +1000 (AEST)
Received: by mail-qk1-x731.google.com with SMTP id o27so14679233qkj.9;
 Wed, 19 May 2021 18:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1D3O+JRxyNjN7AfoZ/LrzEWFZxa2jRcbF0cobpLTwBI=;
 b=eU7zw9r8Zd+1y+GyrlwfK44OtLvUENYjnu3QHCykZLnrIK1EN7Jd8yURoCh4abpebN
 nXffVmA/P4XqKMZfZrpr7T1+Mmuk8i8PSzF4Cb83TFFmSc5OHyzLSo5Ss9zMgIXCFJIS
 M4OMkrTj3I76GCuMk7ahIAtCJDLiY307C2iQihHpsIUhm7tYX+55tYEtD7P+Ezw9TNLh
 TyounvSXxOTukIGHmFD9aU0uAXRo0LdKXYLUf6o5P1PO/wG2Li/5dFsHXjRf4TcdKziN
 T3KUgTFP8G0AJmwUfsb1SCqALHzb1Da224QzqT7nGd2WB2UTOWV3leq8x6jdmO3evhnd
 zo1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1D3O+JRxyNjN7AfoZ/LrzEWFZxa2jRcbF0cobpLTwBI=;
 b=Lp61GyjEZY9Ubl7k5uZcIzOGj1JpW3KGKeAyU2sBsapiDipSSEMlQV0Ics861aJqWj
 U1wvPj0mD5bI3WGlfB1eSc92WDWpmgC5ssGjfHDVGOVYzFPXJ5paU17GLttxihVMDClD
 MX9vtns1gOoLdO6pn6grNX0zI4Za3506DWzLbuUNHAtEzMIPyvLQw8FwCQO74H7JStjS
 wE3WV4PvGd8NBCqhx0QC8gpIdzlqLem5uTUCjk+9ZwwO1DNyZ9uWNCv25STv7E8+y0ah
 Mo84MrR8iPr8mPf7Zgry9Mv0hWRQ+6Vt09zhNuKTdIyWZ654TMCiajhWAqxyIYcA4bMB
 eYPA==
X-Gm-Message-State: AOAM531a7HO02zc2lZA8+HFR9D0PROZ2LSHaQ+1/jCvl/T/rWQ+p6AaM
 joXj1vSEuPxQ/evteEqpK74A33VakHU=
X-Google-Smtp-Source: ABdhPJyFOg1bxkiIgR5UtafC5GzENVkl+n00XgA3bXG4idwEtbP07zX0Un68QH28aZ9fnkkoC860yg==
X-Received: by 2002:ae9:e706:: with SMTP id m6mr2534629qka.74.1621473581138;
 Wed, 19 May 2021 18:19:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 u126sm1075725qkd.80.2021.05.19.18.19.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 18:19:40 -0700 (PDT)
To: Joel Stanley <joel@jms.id.au>, Quan Nguyen <quan@os.amperecomputing.com>
References: <20210519074934.20712-1-quan@os.amperecomputing.com>
 <20210519074934.20712-5-quan@os.amperecomputing.com>
 <CACPK8XdyQT=cuSr9KBqC0PBkOLgBUBpyz3kZEA3JuOuZsQN_Rw@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 4/7] i2c: aspeed: Acknowledge Tx done w/wo ACK irq late
Message-ID: <414a51e8-0973-0007-9ffc-2949f3c7b0f8@roeck-us.net>
Date: Wed, 19 May 2021 18:19:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CACPK8XdyQT=cuSr9KBqC0PBkOLgBUBpyz3kZEA3JuOuZsQN_Rw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Corey Minyard <minyard@acm.org>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net,
 Open Source Submission <patches@amperecomputing.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/19/21 4:43 PM, Joel Stanley wrote:
> On Wed, 19 May 2021 at 07:50, Quan Nguyen <quan@os.amperecomputing.com> wrote:
>>
>> With Tx done w/wo ACK are ack'ed early at beginning of irq handler,
> 
> Is w/wo a typo? If not, please write the full words ("with and without")
> 
>> it is observed that, usually, the Tx done with Ack irq raises in the
>> READ REQUESTED state. This is unexpected and complaint as below appear:
>> "Unexpected Ack on read request"
>>
>> Assumed that Tx done should only be ack'ed once it was truly processed,
>> switch to late ack'ed this two irqs and seen this issue go away through
>> test with AST2500..
> 
> Please read Guneter's commit message
> 2be6b47211e17e6c90ead40d24d2a5cc815f2d5c to confirm that your changes
> do not invalidate the fix that they made.  Add them to CC for review.
>  

This might re-introduce a race condition if the code that is handling
Tx done sends another byte without acknowledging the original interrupt,
and another Tx done (or Tx nack) interrupt is received before the interrupt
handler returns. If that happens, the second Tx done interrupt would be
acknowledged but not be handled, and transmit would stall. That may well be
what I had observed at the time but it is too long ago to remember, sorry.

> Again, this is a fix that is independent of the ssif work. Please send
> it separately with a Fixes line.
> 
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>> v3:
>>    + First introduce in v3 [Quan]
>>
>>   drivers/i2c/busses/i2c-aspeed.c | 26 ++++++++++++++++++--------
>>   1 file changed, 18 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
>> index 3fb37c3f23d4..b2e9c8f0ddf7 100644
>> --- a/drivers/i2c/busses/i2c-aspeed.c
>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>> @@ -606,8 +606,12 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>>
>>          spin_lock(&bus->lock);
>>          irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>> -       /* Ack all interrupts except for Rx done */
>> -       writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
>> +       /*
>> +        * Ack all interrupts except for Rx done and
>> +        * Tx done with/without ACK
> 
> Nit: this comment can be on one line.
> 
> 
>> +        */
>> +       writel(irq_received &
>> +              ~(ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK | ASPEED_I2CD_INTR_TX_NAK),
>>                 bus->base + ASPEED_I2C_INTR_STS_REG);
>>          readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>>          irq_received &= ASPEED_I2CD_INTR_RECV_MASK;
>> @@ -652,12 +656,18 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>>                          "irq handled != irq. expected 0x%08x, but was 0x%08x\n",
>>                          irq_received, irq_handled);
>>
>> -       /* Ack Rx done */
>> -       if (irq_received & ASPEED_I2CD_INTR_RX_DONE) {
>> -               writel(ASPEED_I2CD_INTR_RX_DONE,
>> -                      bus->base + ASPEED_I2C_INTR_STS_REG);
>> -               readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>> -       }
>> +       /* Ack Rx done and Tx done with/without ACK */
>> +       /* Note: Re-use irq_handled variable */
> 
> I'm not sure what this note means.
> 
>> +       irq_handled = 0;
>> +       if (irq_received & ASPEED_I2CD_INTR_RX_DONE)
>> +               irq_handled |= ASPEED_I2CD_INTR_RX_DONE;
>> +       if (irq_received & ASPEED_I2CD_INTR_TX_ACK)
>> +               irq_handled |= ASPEED_I2CD_INTR_TX_ACK;
>> +       if (irq_received & ASPEED_I2CD_INTR_TX_NAK)
>> +               irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
>> +       writel(irq_handled, bus->base + ASPEED_I2C_INTR_STS_REG);
> 
> Are you intentionally only acking the bits that are set when we read
> from STS_REG at the start of the handler? If not, we could write this
> instead:
> 
> writel(ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK |
> ASPEED_I2CD_INTR_TX_NAK,
>          bus->base + ASPEED_I2C_INTR_STS_REG);
> 

This would clear those bits unconditionally even if they were not handled.

> If you only want to ack the bits that are set, then do this:
> 
>    writel(irq_received &
>              (ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK |
> ASPEED_I2CD_INTR_TX_NAK),
>           bus->base + ASPEED_I2C_INTR_STS_REG);
> 
> That way, you can avoid all of the tests.
> 
Or
	irq_handled = irq_received &
		(ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK | ASPEED_I2CD_INTR_TX_NAK);
	writel(irq_handled, bus->base + ASPEED_I2C_INTR_STS_REG);

if the idea was to avoid the long statement.

Guenter

>> +       readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> 
> When you move this, please add a comment that reminds us why we do a
> write-then-read (see commit c926c87b8e36dcc0ea5c2a0a0227ed4f32d0516a).
> 
>> +
>>          spin_unlock(&bus->lock);
>>          return irq_remaining ? IRQ_NONE : IRQ_HANDLED;
>>   }
>> --
>> 2.28.0
>>

