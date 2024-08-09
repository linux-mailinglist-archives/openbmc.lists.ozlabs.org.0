Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A242D94E3DA
	for <lists+openbmc@lfdr.de>; Mon, 12 Aug 2024 01:31:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s+qvF8sC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Whv7G3hWDz2xdn
	for <lists+openbmc@lfdr.de>; Mon, 12 Aug 2024 09:31:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s+qvF8sC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WgQhL5kVYz2ygB;
	Sat, 10 Aug 2024 00:06:58 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 71C6E616FA;
	Fri,  9 Aug 2024 14:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0FC8C4AF15;
	Fri,  9 Aug 2024 14:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723212414;
	bh=evwGZM4eri1U2eONrdZCQoX8mPAcQhXgLT4ZmuyFzRc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=s+qvF8sCtTwyHF56WPQ3eeP2cl8zaXyGa9z49t8SyXv/r7gWKxYShMecPk6ykQVnZ
	 n4kXCa2PTcoMeq17unwFqmzXgPR7MMu/5lFWXv5TXVXCvgne8conJzRw+WgtCDqSFt
	 75MSJbIMMSsLhlOUf8VzdsVtTD7ZHCffuRMDXZF8GqHtWOyIEGM37x0ZYrMqvzPWzV
	 GrdDai06QRpYTPF+2EDN60xa2yY6LakkeFlhW+p1X4ce420yzSZuej2hKmjX3c1dQt
	 YP6bD7GqRN2fGNGcnQGGFQBzK28lY0exqwq1+aVhvdTDCxi/VbsBU2TgGSOtF9Xbf4
	 +haFnWpWIs1Uw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52f024f468bso2412857e87.1;
        Fri, 09 Aug 2024 07:06:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVNn6ZAUXKgTDGdZYTzwwAVPSH8HF8d8nKTeGjVpGqirqe7l3uezlpzfnZVB54jc3jyn0DH2FdjxKFXbYb8XWrqxuTzF7KUkce4F14gZN07oBxm7xF/njXMYRNnxj09S33ErNf0Wy/D
X-Gm-Message-State: AOJu0YzpqwJCyn8Bzz5mbJM4GYsCpf7rEFKLp9UfvlyqRlE1Z28xZs0f
	P1NDUUf5h+dC+9WZC66RQlWyUleLoco4m/sFo5+4x2rZG5wYXOn/IE4KGsmiuklXHBX+uq7TCp1
	j5TmG6ZPen/YaARElTyf+OVGdIA==
X-Google-Smtp-Source: AGHT+IFQIYRhSbBm0KnlMj4fnTjoQ3tTreJgwt28LbqvrHl4ZHzIAIYZ/MVmHdZ+lof70cxLYPm635tiKaTvUDOAZSg=
X-Received: by 2002:a05:6512:3c98:b0:530:e228:77ae with SMTP id
 2adb3069b0e04-530eea14613mr1284391e87.40.1723212412160; Fri, 09 Aug 2024
 07:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240808164941.1407327-1-robh@kernel.org> <22384730.EfDdHjke4D@steina-w>
In-Reply-To: <22384730.EfDdHjke4D@steina-w>
From: Rob Herring <robh@kernel.org>
Date: Fri, 9 Aug 2024 08:06:37 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+tyKxaDsM2ThXctHhXLXUjCAbDH+90gqDrmMV_-z5PvQ@mail.gmail.com>
Message-ID: <CAL_Jsq+tyKxaDsM2ThXctHhXLXUjCAbDH+90gqDrmMV_-z5PvQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: Fix undocumented LM75 compatible nodes
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 12 Aug 2024 09:30:17 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>, linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev, Tony Lindgren <tony@atomide.com>, Tali Perry <tali.perry1@gmail.com>, Fabio Estevam <festevam@gmail.com>, Benjamin Fair <benjaminfair@google.com>, Gregory Clement <gregory.clement@bootlin.com>, Joel Stanley <joel@jms.id.au>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Mark Jackson <mpfj@newflow.co.uk>, Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>, soc@kernel.org, linux-omap@vger.kernel.org, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Aug 9, 2024 at 1:51=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Am Donnerstag, 8. August 2024, 18:49:38 CEST schrieb Rob Herring (Arm):
> > "lm75" without any vendor is undocumented. It works with the Linux
> > kernel since the I2C subsystem will do matches of the compatible string
> > without a vendor prefix to the i2c_device_id and/or driver name.
> >
> > Mostly replace "lm75" with "national,lm75" as that's the original part
> > vendor and the compatible which matches what "lm75" matched with. In a
> > couple of cases the node name or compatible gives a clue to the actual
> > part and vendor and a more specific compatible can be used. In these
> > cases, it does change the variant the kernel picks.
> >
> > "nct75" is an OnSemi part which is compatible with TI TMP75C based on
> > a comparison of the OnSemi NCT75 datasheet and configuration the Linux
> > driver uses. Adding an OnSemi compatible would be an ABI change.
> >
> > "nxp,lm75" is most likely an NXP part. NXP makes a LM75A and LM75B.
> > Both are 11-bit resolution and 100ms sample time, so "national,lm75b" i=
s
> > the closest match.
> >
> > While we're here, fix the node names to use the generic name
> > "temperature-sensor".
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > SoC maintainers, Please take this directly.
> > ---
> >  .../aspeed/aspeed-bmc-facebook-greatlakes.dts |  2 +-
> >  .../socfpga/socfpga_cyclone5_vining_fpga.dts  |  4 +--
> >  .../dts/marvell/armada-385-clearfog-gtr.dtsi  |  8 ++---
> >  .../boot/dts/nuvoton/nuvoton-npcm730-kudo.dts | 32 +++++++++----------
> >  .../boot/dts/nuvoton/nuvoton-npcm750-evb.dts  |  6 ++--
> >  arch/arm/boot/dts/nxp/imx/imx53-mba53.dts     |  4 +--
> >  arch/arm/boot/dts/nxp/imx/imx53-tqma53.dtsi   |  4 +--
> >  .../dts/nxp/lpc/lpc4357-ea4357-devkit.dts     |  4 +--
> >  .../boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts  |  2 +-
> >  arch/arm/boot/dts/ti/omap/am335x-nano.dts     |  2 +-
> >  .../boot/dts/xilinx/zynq-zturn-common.dtsi    |  4 +--
> >  11 files changed, 36 insertions(+), 36 deletions(-)
> >
> < [snip]
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts b/arch/arm/boot/=
dts/nxp/imx/imx53-mba53.dts
> > index 2117de872703..d155b3ec22ef 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts
> > +++ b/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts
> > @@ -175,8 +175,8 @@ expander: pca9554@20 {
> >               gpio-controller;
> >       };
> >
> > -     sensor2: lm75@49 {
> > -             compatible =3D "lm75";
> > +     sensor2: temperature-sensor@49 {
> > +             compatible =3D "national,lm75";
>
> I checked the old schematics. This is an NXP LM75A, so 'national,lm75a'
> would be the correct compatible.

Thanks for checking. That doesn't change the configuration in the
driver. lm75 and lm75a are treated the same as both are 9-bit
resolution. The NXP LM75A is 11-bit resolution and 10Hz which
corresponds to lm75b in the driver. Though it looks to me like the
original lm75b was also 9-bit resolution.

Rob
