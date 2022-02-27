Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9BF4C6214
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 05:16:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6RsK4MZjz3bWM
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 15:16:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=natalenko.name header.i=@natalenko.name header.a=rsa-sha256 header.s=dkim-20170712 header.b=svSl54PH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=natalenko.name (client-ip=104.207.131.136;
 helo=vulcan.natalenko.name; envelope-from=oleksandr@natalenko.name;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=natalenko.name header.i=@natalenko.name
 header.a=rsa-sha256 header.s=dkim-20170712 header.b=svSl54PH; 
 dkim-atps=neutral
X-Greylist: delayed 347 seconds by postgrey-1.36 at boromir;
 Sun, 27 Feb 2022 11:20:07 AEDT
Received: from vulcan.natalenko.name (vulcan.natalenko.name [104.207.131.136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K5kfv1cbVz30Dt
 for <openbmc@lists.ozlabs.org>; Sun, 27 Feb 2022 11:20:07 +1100 (AEDT)
Received: from spock.localnet (unknown [83.148.33.151])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vulcan.natalenko.name (Postfix) with ESMTPSA id DBE04DF52C6;
 Sun, 27 Feb 2022 01:14:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
 s=dkim-20170712; t=1645920854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1RDwsYTP/cOFZe0ChxHHIHLvrBNSFu8pAYt3zlSOWM4=;
 b=svSl54PHvj50QdAyqGlfdl+aCzbze61C9Tncoi1K69/QKCXRz9u654oEqgMCnf5bo7Q2YW
 R2LSgP7C6PMZ+p+RZB52IOcqHSVdnH/pyF8HNUtbQk1I7qV4JBtFlNT+dTBgJj+T+cJCme
 Z3FO10llm6ouUca5vtl7AtpfF8rnGA0=
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Jean Delvare <jdelvare@suse.com>, Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH 0/5] hwmon: (nct6775) Add i2c support
Date: Sun, 27 Feb 2022 01:14:12 +0100
Message-ID: <2620147.mvXUDI8C0e@natalenko.name>
In-Reply-To: <20220226133047.6226-1-zev@bewilderbeest.net>
References: <20220226133047.6226-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Mailman-Approved-At: Mon, 28 Feb 2022 15:16:17 +1100
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Renze Nicolai <renze@rnplus.nl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello.

On sobota 26. =FAnora 2022 14:30:42 CET Zev Weiss wrote:
> Hello,
>=20
> This patch series augments the existing nct6775 driver with support
> for the hardware's i2c interface.

Is it something I can test on my ASUS Pro WS X570-ACE board as an ordinary =
user, and if so, how?

Thanks.

> Thus far the nct6775 driver has only supported the LPC interface,
> which is the main interface by which the Super-I/O chip is typically
> connected to the host (x86) processor.
>=20
> However, these chips also provide an i2c interface, which can provide
> a way for a BMC to also monitor sensor readings from them.  On some
> systems (such as the ASRock Rack ROMED8HM3 and X570-D4U) this may be
> the only way for the BMC to monitor host CPU temperatures (e.g. to
> indirectly access a TSI interface); this functionality is thus an
> important component of enabling OpenBMC to support such systems.
>=20
> In such an arrangement the Super-I/O chip is simultaneously controlled
> by two independent processors (the host and the BMC) which typically
> do not coordinate their accesses with each other.  In order to avoid
> conflicts between the two, the i2c driver avoids all writes to the
> device, since the BMC's needs with the hardware are merely that it be
> able to retrieve sensor readings.  This allows the host processor to
> remain ultimately in control of the chip and unaware of the BMC's use
> of it at all.
>=20
> The sole exception to the "no writes" rule for the i2c driver is for
> the bank-select register -- while I haven't been able to find any
> explicit statement in the Nuvoton datasheets guaranteeing this, all
> experiments I've done have indicated that, as one might hope, the i2c
> interface has its own bank-select register independent of the one used
> by the LPC interface.
>=20
> In terms of code structure, the approach taken in this series is to
> split the LPC-specific parts of the driver out into a separate module
> (called nct6775-platform), leaving the interface-independent parts in
> a generic driver (called nct6775-core).  The nct6775-i2c driver is
> then added as an additional consumer of the nct6775-core module's
> functionality.
>=20
> The first two patches make some relatively small infrastructural
> changes to the nct6775 driver; the bulk of the core/platform driver
> split is in the third patch.  The final two patches add DT bindings
> and the i2c driver itself.
>=20
> I've tested the nct6775-platform and nct6775-i2c drivers with the
> NCT6779D in an ASRock ROMED8HM3 system (the latter driver on its
> AST2500 BMC); both seem to work as expected.  Broader testing would of
> course be welcome though, as is review feedback.
>=20
>=20
> Thanks,
> Zev
>=20
>=20
> Zev Weiss (5):
>   hwmon: (nct6775) Rearrange attr-group initialization
>   hwmon: (nct6775) Add read-only mode
>   hwmon: (nct6775) Split core and platform driver
>   dt-bindings: hwmon: Add nuvoton,nct6775
>   hwmon: (nct6775) Add i2c driver
>=20
>  .../bindings/hwmon/nuvoton,nct6775.yaml       |   48 +
>  MAINTAINERS                                   |   12 +-
>  drivers/hwmon/Kconfig                         |   32 +-
>  drivers/hwmon/Makefile                        |    4 +-
>  drivers/hwmon/{nct6775.c =3D> nct6775-core.c}   | 1464 +----------------
>  drivers/hwmon/nct6775-i2c.c                   |  191 +++
>  drivers/hwmon/nct6775-platform.c              | 1185 +++++++++++++
>  drivers/hwmon/nct6775.h                       |  233 +++
>  8 files changed, 1763 insertions(+), 1406 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct67=
75.yaml
>  rename drivers/hwmon/{nct6775.c =3D> nct6775-core.c} (75%)
>  create mode 100644 drivers/hwmon/nct6775-i2c.c
>  create mode 100644 drivers/hwmon/nct6775-platform.c
>  create mode 100644 drivers/hwmon/nct6775.h
>=20
>=20


=2D-=20
Oleksandr Natalenko (post-factum)


