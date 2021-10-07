Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E1F424CE0
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 07:44:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQ0dP2tLcz2xtP
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 16:44:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=GevjuFqw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=GevjuFqw; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQ0cw2g4Fz2xsW;
 Thu,  7 Oct 2021 16:44:15 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id B2C6D52;
 Wed,  6 Oct 2021 22:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1633585452;
 bh=4QxACvASTOlPgoFStcPKHGJdR1GwmH42sE4PD4SlwQg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GevjuFqwwjfb4HSagbqrFhW9XfpPGPJh/OSZTlApF9LSNteArJJ0SadJfXCYLuzZ4
 /k5A5wa0c/cqlO4JRyuAakgnA43Rr73V1zWen3qEvn40kcK9fqEDKeJ7tB9FwEL/U7
 UBmKRG3of6rc43xULnsAo81A01fxwa1IIvWMbVbo=
Date: Wed, 6 Oct 2021 22:44:03 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 0/9] Dynamic DT device nodes
Message-ID: <YV6JIxh9TPrYNToQ@hatter.bewilderbeest.net>
References: <20211007000954.30621-1-zev@bewilderbeest.net>
 <99b43bbf-b63e-d684-dd61-3087e9f22dc4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <99b43bbf-b63e-d684-dd61-3087e9f22dc4@gmail.com>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 linux-aspeed@lists.ozlabs.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Frank Rowand <frowand.list@gmail.com>, openbmc@lists.ozlabs.org,
 Andrey Konovalov <andreyknvl@gmail.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 devicetree@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Rob Herring <robh+dt@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Daniel Axtens <dja@axtens.net>, Andy Shevchenko <andy@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 06, 2021 at 07:46:08PM PDT, Florian Fainelli wrote:
>
>
>On 10/6/2021 5:09 PM, Zev Weiss wrote:
>>Hello,
>>
>>This patch series is in some ways kind of a v2 for the "Dynamic
>>aspeed-smc flash chips via 'reserved' DT status" series I posted
>>previously [0], but takes a fairly different approach suggested by Rob
>>Herring [1] and doesn't actually touch the aspeed-smc driver or
>>anything in the MTD subsystem, so I haven't marked it as such.
>>
>>To recap a bit of the context from that series, in OpenBMC there's a
>>need for certain devices (described by device-tree nodes) to be able
>>to be attached and detached at runtime (for example the SPI flash for
>>the host's firmware, which is shared between the BMC and the host but
>>can only be accessed by one or the other at a time).  To provide that
>>ability, this series adds support for a new common device-tree
>>property, a boolean "dynamic" that indicates that the device may come
>>and go at runtime.  When present on a node, the sysfs file for that
>>node's "status" property is made writable, allowing userspace to do
>>things like:
>>
>>   $ echo okay > /sys/firmware/devicetree/.../status
>>   $ echo reserved > /sys/firmware/devicetree/.../status
>>
>>to activate and deactivate a dynamic device.
>
>This is a completely drive by comment here, but cannot you already 
>achieve what you want today by making the SPI-NOR to be loaded as a 
>module, probe it when you need it from the BMC, and unbind or rmmod 
>the drive when you need it on the server/host attached to the BMC?
>
>Looking at [0] there appears to be enough signaling visible by the 
>BMC's user-space that it ought to be possible?
>
>Assuming that there may be multiple flash chips and you somehow need 
>to access one in order to complete the BMC device boot, but not the 
>other one(s), you could imagine unbinding the spi-nor driver from the 
>ones you don't want to drive and wait until you have appropriate 
>signaling made available to your or is there a risk of racing with the 
>host in doing so?

Hi Florian,

I sort of considered similar things at various points (in fact the 
bind/unbind technique is what I've been using as a stopgap so far), but 
I don't think it's ultimately a great solution.

In this particular case it happens that the driver for the host's BIOS 
flash (aspeed-smc) is the same driver used for the BMC's firmware flash 
and hence necessary for it to boot.  (OpenBMC also typically uses a 
non-modular kernel, for what it's worth.)

On BMC startup we don't know the state of the host, and while the mux 
that ultimately determines which processor has access to the BIOS flash 
defaults to connecting it to the host (so if we do attempt to attach it 
we'll simply fail clumsily and spew some errors to dmesg rather than 
causing catastrophic errors host-side), blindly starting to poke the 
BIOS flash without doing the proper coordination with the host first 
seems to me to be pretty squarely in the category of "things we 
shouldn't be doing" -- the desire to avoid that sort of clunkiness is a 
significant portion of what led me to pursue a better solution in the 
first place.

Additionally, while I don't know the details of the specific hardware 
involved, others in the OpenBMC community (or at least Andrew Jeffery) 
have indicated that pluggable DT devices would be useful for the systems 
they're working on as well, I suspect for things other than host 
firmware flashes.


Zev

