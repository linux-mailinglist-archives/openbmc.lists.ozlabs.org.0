Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 666E63F92A1
	for <lists+openbmc@lfdr.de>; Fri, 27 Aug 2021 05:09:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gwl6c1nXVz3035
	for <lists+openbmc@lfdr.de>; Fri, 27 Aug 2021 13:08:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158;
 helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au;
 receiver=<UNKNOWN>)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gwl6G5lNMz2xnd;
 Fri, 27 Aug 2021 13:08:38 +1000 (AEST)
Received: from pecola.lan (unknown [159.196.93.152])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BC8942012C;
 Fri, 27 Aug 2021 11:08:33 +0800 (AWST)
Message-ID: <b20caf97be2a35fa30d08e7b258187e1ef9e2e57.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 3/4] soc: aspeed: Add eSPI driver
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>, joel@jms.id.au, 
 robh+dt@kernel.org, andrew@aj.id.au, linux-aspeed@lists.ozlabs.org, 
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 27 Aug 2021 11:08:31 +0800
In-Reply-To: <20210826061623.6352-4-chiawei_wang@aspeedtech.com>
References: <20210826061623.6352-1-chiawei_wang@aspeedtech.com>
 <20210826061623.6352-4-chiawei_wang@aspeedtech.com>
Content-Type: multipart/alternative; boundary="=-TZ3lhG3ptk97Vn50SDMo"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--=-TZ3lhG3ptk97Vn50SDMo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Chia-Wei,

> The Aspeed eSPI controller is slave device to communicate with
> the master through the Enhanced Serial Peripheral Interface (eSPI).
> All of the four eSPI channels, namely peripheral, virtual wire,
> out-of-band, and flash are supported.

Great to have this added submitted upstream! A few comments though:

> ---
>  drivers/soc/aspeed/Kconfig             |  11 +
>  drivers/soc/aspeed/Makefile            |   1 +
>  drivers/soc/aspeed/aspeed-espi-ctrl.c  | 205 +++++++++
>  drivers/soc/aspeed/aspeed-espi-ctrl.h  | 304 ++++++++++++
>  drivers/soc/aspeed/aspeed-espi-flash.h | 380 +++++++++++++++
>  drivers/soc/aspeed/aspeed-espi-ioc.h   | 153 +++++++
>  drivers/soc/aspeed/aspeed-espi-oob.h   | 611 +++++++++++++++++++++++++
>  drivers/soc/aspeed/aspeed-espi-perif.h | 539 ++++++++++++++++++++++
>  drivers/soc/aspeed/aspeed-espi-vw.h    | 142 ++++++

This structure is a bit odd - you have the one -crtl.c file, which
defines the actual driver, but then a bunch of headers that contain more
code than header-type definitions.

Is there any reason that -flash, -ioc, -oob, -perif and -vw components
can't be standard .c files?

Then, for the userspace ABI: it looks like you're exposing everything
through new device-specific ioctls. Would it not make more sense to use
existing interfaces? For example, the virtual wire bits could be regular
GPIOs; the flash interface could be a mtd or block device.

I understand that we'll likely still need some level of custom device
control, but the more we can use generic interfaces for, the less custom
code (and interfaces) we'll need on the userspace side.

Cheers,


Jeremy

--=-TZ3lhG3ptk97Vn50SDMo
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode:=
 space; line-break: after-white-space;"><pre>Hi Chia-Wei,</pre><pre><br></p=
re><pre>&gt; The Aspeed eSPI controller is slave device to communicate with=
</pre><pre>&gt; the master through the Enhanced Serial Peripheral Interface=
 (eSPI).</pre><pre>&gt; All of the four eSPI channels, namely peripheral, v=
irtual wire,</pre><pre>&gt; out-of-band, and flash are supported.</pre><pre=
><br></pre><pre>Great to have this added submitted upstream! A few comments=
 though:</pre><pre><br></pre><pre>&gt; ---</pre><pre>&gt; &nbsp;drivers/soc=
/aspeed/Kconfig&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; |&nbsp; 11 +</pre><pre>&gt; &nbsp;drivers/soc/aspeed/Makefile&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&n=
bsp; 1 +</pre><pre>&gt; &nbsp;drivers/soc/aspeed/aspeed-espi-ctrl.c&nbsp; |=
 205 +++++++++</pre><pre>&gt; &nbsp;drivers/soc/aspeed/aspeed-espi-ctrl.h&n=
bsp; | 304 ++++++++++++</pre><pre>&gt; &nbsp;drivers/soc/aspeed/aspeed-espi=
-flash.h | 380 +++++++++++++++</pre><pre>&gt; &nbsp;drivers/soc/aspeed/aspe=
ed-espi-ioc.h&nbsp;&nbsp; | 153 +++++++</pre><pre>&gt; &nbsp;drivers/soc/as=
peed/aspeed-espi-oob.h&nbsp;&nbsp; | 611 +++++++++++++++++++++++++</pre><pr=
e>&gt; &nbsp;drivers/soc/aspeed/aspeed-espi-perif.h | 539 +++++++++++++++++=
+++++</pre><pre>&gt; &nbsp;drivers/soc/aspeed/aspeed-espi-vw.h&nbsp;&nbsp;&=
nbsp; | 142 ++++++</pre><pre><br></pre><pre>This structure is a bit odd - y=
ou have the one -crtl.c file, which</pre><pre>defines the actual driver, bu=
t then a bunch of headers that contain more</pre><pre>code than header-type=
 definitions.</pre><pre><br></pre><pre>Is there any reason that -flash, -io=
c, -oob, -perif and -vw components</pre><pre>can't be standard .c files?</p=
re><pre><br></pre><pre>Then, for the userspace ABI: it looks like you're ex=
posing everything</pre><pre>through new device-specific ioctls. Would it no=
t make more sense to use</pre><pre>existing interfaces? For example, the vi=
rtual wire bits could be regular</pre><pre>GPIOs; the flash interface could=
 be a mtd or block device.</pre><pre><br></pre><pre>I understand that we'll=
 likely still need some level of custom device</pre><pre>control, but the m=
ore we can use generic interfaces for, the less custom</pre><pre>code (and =
interfaces) we'll need on the userspace side.</pre><pre><br></pre><pre>Chee=
rs,</pre><pre><br></pre><pre><br></pre><pre>Jeremy</pre></body></html>

--=-TZ3lhG3ptk97Vn50SDMo--

