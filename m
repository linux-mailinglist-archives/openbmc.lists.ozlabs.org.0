Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3327910951D
	for <lists+openbmc@lfdr.de>; Mon, 25 Nov 2019 22:26:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MKpk4NyFzDqTm
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 08:26:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::244;
 helo=mail-oi1-x244.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qWjxY9L2"; 
 dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MKp46wlBzDqG8
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 08:25:48 +1100 (AEDT)
Received: by mail-oi1-x244.google.com with SMTP id n14so14524742oie.13
 for <openbmc@lists.ozlabs.org>; Mon, 25 Nov 2019 13:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UNRXsHmQLZTmp2+DWz0lgTpJ7WpzLairZFZWiqscPs8=;
 b=qWjxY9L2aEPnuQTNW0/NcPXYPiynArqGXeCTp+ZqcAwUNUWIw3QWG6iURghOHkr4Be
 i19A2ck2X8cOYKimatDX1GuM3Ve5iGQZr2YvX2XBMQH9slWg8yI/dOvOekIGahTbOVDT
 wR+HIpQDHRZVWGcwv7FCa/gKPDxIX8PsxQUHWA3yoDGIrv75DoN+pS7+5Hslj1Cg+i4x
 Y15YpaftDBQ/8olIC7gMlERPIS37cwJT58jzCaFu7f0P9jOIgI9jnMrP0IXxhcnDsI0X
 7N5M60bJ33D9sBIh0X2olM4i2tae28egjukV8o9fg6uNWZnrLzW5Zg0l+oE6cQZdgUCw
 GUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UNRXsHmQLZTmp2+DWz0lgTpJ7WpzLairZFZWiqscPs8=;
 b=ACorBY5K0GBWOdpxhXVAetQ26BEs+C8gPIZo8vmQDfmeZF4dO8bE/+v2Zh5nqlA6p4
 5b0fpieBZPcgmEWi4SOgnZkKnOMRufR73Di87x1diDqxqzI0dnIndSh1cH6blkCAmzSX
 Laf/vWWoOyZiSffa8rwZthQ2IVnFbJUaFa2HN2HdpV+e9DfGleiVbh3bTBaL1vURBJRg
 F+/GkUhUEx3+kUdx8rSSET5lO95wIuDTloy5I7pWyW5DnDMzuE146dy4hmmRsOAg63fi
 DnWUUgZf0IEujB+9BJRdGsvD5zas9ryGhArBxQcOm1lcI7ux8VEsSWM3sRwMTl9euvfj
 1VVw==
X-Gm-Message-State: APjAAAXOPB+9TASmeRX51Dov+i4iQrCCj3k/VSs6Gai0wxxWUjs705PA
 AcRBJd03VP/sa/t5hVv6FGrQ9DPSqhx2goqpMWU=
X-Google-Smtp-Source: APXvYqxFiw6pqypOndY5Q8Ql54/zAYNdUSGFrqtdaZRXgEbZC/ofgr2fB7vYKfieGktycd9YrSD7TWQcqApwRGPfud0=
X-Received: by 2002:aca:c1c2:: with SMTP id r185mr772289oif.125.1574717144901; 
 Mon, 25 Nov 2019 13:25:44 -0800 (PST)
MIME-Version: 1.0
References: <CAHkHK08UNBHTbqHAC71f-hVBuLJNNFiGoX0eGmV27YaoP1+mgw@mail.gmail.com>
In-Reply-To: <CAHkHK08UNBHTbqHAC71f-hVBuLJNNFiGoX0eGmV27YaoP1+mgw@mail.gmail.com>
From: Brandon Wyman <bjwyman@gmail.com>
Date: Mon, 25 Nov 2019 15:25:09 -0600
Message-ID: <CAK_vbW0hcA5phZiCfKipBUCZF7KzEHKLAyMeRs8MWu17RYiN8w@mail.gmail.com>
Subject: Re: How to configure i2c to high speed mode
To: John Wang <wangzhiqiang8906@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Nov 10, 2019 at 9:22 PM John Wang <wangzhiqiang8906@gmail.com> wrote:
>
> Hi,all
>
> I did a test and found that if the firmware image is transmitted via i2c,
> it's too slow.
>
> The test I did:
>
> *slave side:
>
> use i2c-slave-mqueue[1] to receive and queue messages from the remote
> i2c master device.  the driveri's message size is 120 bytes,queue size
> is 32.
>
> *master side:
>
> test.sh:
> #!/bin/sh
>
> for i in {1..30}
> do
> i2ctransfer -y 3 w100@0x10 0xff-        # send 100 bytes
> done
>
> $time test.sh
> real 0m0.789s
> user 0m0.076s
> sys 0m0.328s
>
> Then 30*100/0.789 = 3.8k bytes/s, it will take 2.4 hours to send a 32M image
>
> Could we config the i2c to high speed mode? if so, how to configure it?

Is that just the bus-frequency property? It looks like the default
chosen in the dtsi files is 100000, but I do see instances of others
apparently overriding that in dts files.

https://github.com/openbmc/linux/blob/d41fa1fda16b4b0f9a2d098c1de8f259a00cc9bc/arch/arm/boot/dts/aspeed-g6.dtsi#L662

$ grep "bus-frequency" arch/arm/boot/dts/aspeed-bmc-*.dts
arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts:     bus-frequency
= <400000>;
arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts:       bus-frequency = <90000>;
$

>
> Thanks.
>
> [1] https://patchwork.ozlabs.org/patch/894425/
