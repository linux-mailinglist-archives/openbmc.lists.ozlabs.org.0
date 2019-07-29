Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 356F17833B
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2019 04:03:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xjds5gHfzDqSk
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2019 12:03:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xjdF4BcvzDqQb;
 Mon, 29 Jul 2019 12:02:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="sZcfwkaY"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45xjdD6RVKz9s7T;
 Mon, 29 Jul 2019 12:02:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1564365777; bh=dpZmzNioMMex7RcI3z1cf9X8awSQQyB//gG7MK7LaDo=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=sZcfwkaYkiOSDty3FTymDB4VS7eDnSDYhicNslEuGpoN4DbWtFzyeRbunqemEsCiu
 pRFIJ0JxSqnHHZqr5d/DCBCFDMMGTbZNO1A3WTAWaxuPCYmPSmm+YNlqptRU5GKSFv
 ixKfyPoHP6EYSYEEwMNINFFLqxgPYdqdxkmxzTfwiXLMq5A8LR63Q1KRpei0p9cZtb
 YLhCcsJS2sYQCMNW+J64vA/yKxkg2krMGWQmoVVySLJx/qQiM5j1EIS3LGk7XgBAvY
 dSuP+HQkOa99/iRa+8e2cprT8ixPtjPGH5FeLwCR0q430d1K6IgGvYrCb7ucXukfjx
 pSlFbPS99mg7g==
Message-ID: <9855284dfa4c4d4a52441553691c7b4b08a9cc34.camel@ozlabs.org>
Subject: Re: [PATCH] drivers/tty/serial/8250: Make Aspeed VUART SIRQ
 polarity configurable
From: Jeremy Kerr <jk@ozlabs.org>
To: Oskar Senft <osk@google.com>
Date: Mon, 29 Jul 2019 10:02:56 +0800
In-Reply-To: <CABoTLcQF4_He15F5oO0Pxjdm6f7pLCxBF77cz7wR=jjWaednYQ@mail.gmail.com>
References: <20190727134242.49847-1-osk@google.com>
 <9fb8c99449cebd68fb5975890dedaa06ce7808ae.camel@kernel.crashing.org>
 <CABoTLcRPXffZuKy-DTFUVKJQRydSzMDynYRgBbZ_470iVN1KnA@mail.gmail.com>
 <CABoTLcTSFvQruPRnoRPgiWjOXNDOCSnAXVesG7f1WAuLLLVSSg@mail.gmail.com>
 <6b31627a8c5a2616c83783550517961b7ed8f3cb.camel@ozlabs.org>
 <CABoTLcQF4_He15F5oO0Pxjdm6f7pLCxBF77cz7wR=jjWaednYQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Oskar,

> In my understanding the SIRQ polarity should be the same for all UARTs
> on the particular bus, i.e. both UARTs controlled by the SuperI/O and
> the VUART or PUART (pass-through). However, the host controls the
> UARTs on the SuperI/O itself.

Somewhat offtopic, but are you sure you want to enable the SuperIO
device?

>  The VUART is covered by this code and we don't have a PUART driver
> yet.
> 
> It might make sense to have this as a global setting which each driver
> could read. But wouldn't this be an exercise for the future where we
> actually have a second device? I don't think the Aspeed currently has
> any other devices that could generate a SIRQ (except for the PUART for
> which there's no driver).

We have a bunch of SIRQ sources that we use (on OpenPOWER platforms) -
the BT interface, the KCS interface, the UARTs, and the mbox hardware.
It's not just the VUART/PUART :)

> Having said that, ideally I'd like the SIRQ polarity to be auto-
> configured from the LPC/eSPI HW pin strap anyway. I have the code for
> that almost done. Maybe we shouldn't even have the sysfs interface for
> it and I should strip that out?

Yeah, I think I agree with that. The only downside is that the 
individual drivers will now need to poke at the SCU to query the
LPC/eSPI configuration. If you can find a nice way to do that, then that
sounds like the best approach. Can you query it through the parent bus
perhaps?

Cheers,


Jeremy

