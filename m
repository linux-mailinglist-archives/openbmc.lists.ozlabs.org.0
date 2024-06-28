Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C736C91B442
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 02:46:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=MZ+BZQD2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9GwW1qgYz3fqn
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 10:46:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=MZ+BZQD2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9Gvy6f0Hz3fqf
	for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2024 10:46:22 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-79-194.adl-adc-lon-bras32.tpg.internode.on.net [118.210.79.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B0FE22013B;
	Fri, 28 Jun 2024 08:46:18 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1719535581;
	bh=WQi05lByYUdnxK8cc2Q7dLrzU4bGLs4MQM1esIKs9wM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MZ+BZQD2idApM7W/2G7cNUGZyZnZxc0jT9E6t7Th98/pf9CWXSmbc+Pla3lZGM/Tr
	 x3uIRFHn/eUlSTQiORpsNNt9WL31AmLHc0I5cAi5wKUduaBzgrPoe0UOwnpdBYEDmT
	 kou/uKf/1OZBZw12HD2NtAyQ0wAEMMwNqbGeW7/xthIH4wD82CvRIlgnKqHiTuoRSZ
	 6CU6N9VSF46nH0hZyGO6mINDJspwPPIepNppaShJvpTbJLQd5UkMVDzjSm1PsyVYQS
	 DGMEefMbJuYpXTPPvVWaCqsO9Ad1D/c0lhW/iPBIk7c8YU/Zw1C9JdEMZwwJ6DpDam
	 Mfrnf3PJ5Z03g==
Message-ID: <61b07c50ee1299c69f6d781cc9cc42d0a7ea7dcc.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.6 00/17] Revise Facebook Minerva BMC DTS
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Yang Chen <yangchen.openbmc@gmail.com>, openbmc@lists.ozlabs.org, 
	patrick@stwcx.xyz, joel@jms.id.au
Date: Fri, 28 Jun 2024 10:16:18 +0930
In-Reply-To: <CALFa7M_W-iFpoCWDUHGzzPa3bAyz_YKBegdOsQLx7ihCsjX4hg@mail.gmail.com>
References: <20240627062951.936256-1-yangchen.openbmc@gmail.com>
	 <CALFa7M_W-iFpoCWDUHGzzPa3bAyz_YKBegdOsQLx7ihCsjX4hg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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
Cc: Jerry.Lin@quantatw.com, yang.chen@quantatw.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2024-06-27 at 21:34 +0800, Yang Chen wrote:
> Hi Andrew,
>=20
> On Thu, Jun 27, 2024 at 2:31=E2=80=AFPM Yang Chen <yangchen.openbmc@gmail=
.com> wrote:
> >=20
> > Revise the Linux device tree entry related to Facebook platform Minerva
> > specific device connected to the Aspeed AST2600 BMC.
> >=20
> > LORE Link: https://lore.kernel.org/all/20240626130332.929534-1-yangchen=
.openbmc@gmail.com/
> >=20
> > Yang Chen (17):
> >   ARM: dts: aspeed: minerva: change the address of tmp75
> >   ARM: dts: aspeed: minerva: change aliases for uart
> >   ARM: dts: aspeed: minerva: add eeprom on i2c bus
> >   ARM: dts: aspeed: minerva: change RTC reference
> >   ARM: dts: aspeed: minerva: enable mdio3
> >   ARM: dts: aspeed: minerva: remove unused bus and device
> >   ARM: dts: aspeed: minerva: Define the LEDs node name
> >   ARM: dts: aspeed: minerva: Add adc sensors for fan board
> >   ARM: dts: aspeed: minerva: add linename of two pins
> >   ARM: dts: aspeed: minerva: enable ehci0 for USB
> >   ARM: dts: aspeed: minerva: add tmp75 sensor
> >   ARM: dts: aspeed: minerva: add power monitor xdp710
> >   ARM: dts: aspeed: minerva: revise sgpio line name
> >   ARM: dts: aspeed: minerva: Switch the i2c bus number
> >   ARM: dts: aspeed: minerva: remove unused power device
> >   ARM: dts: aspeed: minerva: add ltc4287 device
> >   ARM: dts: aspeed: minerva: Add spi-gpio
> >=20
> >  .../aspeed/aspeed-bmc-facebook-minerva.dts    | 516 +++++++++++++-----
> >  1 file changed, 373 insertions(+), 143 deletions(-)
> >=20
> > --
> > 2.34.1
> >=20
>=20
> I saw you already submitted this patch series into the Linux of
> OpenBMC (https://github.com/openbmc/openbmc/commit/68b26e3f87e305575a6ed2=
202f516ab882358139).
> Please ignore this patch series for requesting.
> Very appreciate your help :)

No problems. Generally I backport patches to OpenBMC as I apply them
for upstream. I try to tag people on the bump patches in OpenBMC's
Gerrit instance when possible, but you don't appear to be registered as
a user.

Andrew
