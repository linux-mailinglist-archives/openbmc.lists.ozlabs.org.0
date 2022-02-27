Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BAD4C6216
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 05:17:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6Rt00r3yz2yfm
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 15:17:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=natalenko.name header.i=@natalenko.name header.a=rsa-sha256 header.s=dkim-20170712 header.b=DDQ+6xSh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=natalenko.name (client-ip=104.207.131.136;
 helo=vulcan.natalenko.name; envelope-from=oleksandr@natalenko.name;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=natalenko.name header.i=@natalenko.name
 header.a=rsa-sha256 header.s=dkim-20170712 header.b=DDQ+6xSh; 
 dkim-atps=neutral
Received: from vulcan.natalenko.name (vulcan.natalenko.name [104.207.131.136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6H26442gz2yPv
 for <openbmc@lists.ozlabs.org>; Mon, 28 Feb 2022 08:38:37 +1100 (AEDT)
Received: from spock.localnet (unknown [83.148.33.151])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vulcan.natalenko.name (Postfix) with ESMTPSA id 1EF44DF7491;
 Sun, 27 Feb 2022 22:38:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
 s=dkim-20170712; t=1645997913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=auuyEhFvI9O6E7K0eY+/3pvXha2pZMkC/DntTyWHWHY=;
 b=DDQ+6xSh7odwZlp+syE+bHr9FuZmMlX3tbJ1AZvewGDaiDeGgV8ouwsBt9ykPM5e/XyqsR
 Z2UVkHJd3PFAtTuycKSjfXpU1SFBSnCWPItkTWvGf8PkFWPU+u3yU1O09OEN8vti4/8axe
 zZ4KQy3G2OEbXqnU/yDPiN13ORLeA2E=
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH 0/5] hwmon: (nct6775) Add i2c support
Date: Sun, 27 Feb 2022 22:38:31 +0100
Message-ID: <4719747.31r3eYUQgx@natalenko.name>
In-Reply-To: <YhrFizhgOpZbi3dE@hatter.bewilderbeest.net>
References: <20220226133047.6226-1-zev@bewilderbeest.net>
 <2620147.mvXUDI8C0e@natalenko.name>
 <YhrFizhgOpZbi3dE@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Renze Nicolai <renze@rnplus.nl>,
 Rob Herring <robh+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello.

On ned=C4=9Ble 27. =C3=BAnora 2022 1:27:55 CET Zev Weiss wrote:
> On Sat, Feb 26, 2022 at 04:14:12PM PST, Oleksandr Natalenko wrote:
> >Hello.
> >
> >On sobota 26. =C3=BAnora 2022 14:30:42 CET Zev Weiss wrote:
> >> Hello,
> >>
> >> This patch series augments the existing nct6775 driver with support
> >> for the hardware's i2c interface.
> >
> >Is it something I can test on my ASUS Pro WS X570-ACE board as an ordina=
ry user, and if so, how?
> >
>=20
> You could certainly test that the nct6775-platform driver still works as=
=20
> it did previously, which would be good to confirm -- you'll need to=20
> enable CONFIG_SENSORS_NCT6775_PLATFORM now to build it.

Ack.

>  From what I've been able to find about that board though it looks like=20
> it doesn't have a BMC, so testing the i2c driver on it probably isn't=20
> going to be possible.  (Even if it does in fact have a BMC, it would=20
> require at least a partial port of OpenBMC or similar, and re-flashing=20
> your BMC firmware with that, and is hence a non-trivial undertaking.)

It should have, the BMC is based on RTL8117, although I have no idea if it =
is something that can be called true IPMI as I've never enabled/used it.

Thanks.

>=20
>=20
> Zev
>=20
>=20


=2D-=20
Oleksandr Natalenko (post-factum)


