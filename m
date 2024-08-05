Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1CA94740A
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2024 05:59:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=jKpbVW81;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WcjPX57Sxz3cbF
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2024 13:59:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=jKpbVW81;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WcjNx2rs4z3bVG;
	Mon,  5 Aug 2024 13:59:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1722830352;
	bh=d7cqJ0kpF2PLR8wzbhUuvv4itxL+jcNpSGFs0wo8FIA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jKpbVW81a98xwODMB958yRYYc2dBMtGxp65ewCsq9fmeq0KgtqovpBqP4KfaMKAdv
	 1BwEGbS21AWmCKgGCMSze9Cu4pmaEHm0aVBYZEqKQSd1wfGo/2XQPPgnjK5By74MiK
	 xHD2kKHxDGxvGBxKkxx4+NgWk3DxSK0f50AhuDfjCluwiIsW7djpEL/71lTjLPyLIH
	 nPDZK1o362Jao7aqT515HrPpSsn2hKOcBpMyZ2lnSNPA0fathsmQTC//ZdRlGhC2FU
	 +5uu9Ff81V2w+8CFvEN9MEPldfc8bfgL0WSXBvM1jiWr2dbLjbFF2NEXigC8Xh39Ey
	 Ml5qVM+lUXbNQ==
Received: from [192.168.68.112] (ppp14-2-105-65.adl-apt-pir-bras32.tpg.internode.on.net [14.2.105.65])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BCAD465665;
	Mon,  5 Aug 2024 11:59:10 +0800 (AWST)
Message-ID: <6171be101ee10aa2a11e021caafe877eb428412a.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/6] Update the device tree for Ampere's BMC platform
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>, "Rob Herring (Arm)"
	 <robh@kernel.org>, Chanh Nguyen <chanh@os.amperecomputing.com>
Date: Mon, 05 Aug 2024 13:29:09 +0930
In-Reply-To: <1c2dca43-444d-44a7-b304-5fbd59b788a8@amperemail.onmicrosoft.com>
References: <20240801091217.1408809-1-chanh@os.amperecomputing.com>
	 <172252600912.120761.16384387883905749466.robh@kernel.org>
	 <1c2dca43-444d-44a7-b304-5fbd59b788a8@amperemail.onmicrosoft.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, 2024-08-03 at 10:49 +0700, Chanh Nguyen wrote:
>=20
> On 01/08/2024 22:29, Rob Herring (Arm) wrote:
> >=20
> > On Thu, 01 Aug 2024 09:12:10 +0000, Chanh Nguyen wrote:
> > > Updates the device tree to support some features on Ampere's
> > > Mt.Mitchell BMC and Ampere's Mt.Jade BMC.
> > >=20
> > > Chanh Nguyen (6):
> > >    ARM: dts: aspeed: mtjade, mtmitchell: Add OCP temperature sensors
> > >    ARM: dts: aspeed: mtmitchell: Add I2C temperature sensor alias por=
ts
> > >    ARM: dts: aspeed: mtmitchell: Add I2C Riser card alias ports
> > >    ARM: dts: aspeed: mtmitchell: Enable i2c10 and i2c15
> > >    ARM: dts: aspeed: mtmitchell: Add LEDs
> > >    ARM: dts: aspeed: mtmitchell: Add I2C FAN controllers
> > >=20
> > >   .../dts/aspeed/aspeed-bmc-ampere-mtjade.dts   |  16 ++
> > >   .../aspeed/aspeed-bmc-ampere-mtmitchell.dts   | 152 +++++++++++++++=
+++
> > >   2 files changed, 168 insertions(+)
> > >=20
> > > --
> > > 2.43.0
> > >=20
> > >=20
> > >=20
> >=20
> >=20
> > My bot found new DTB warnings on the .dts files added or changed in thi=
s
> > series.
> >=20
> > Some warnings may be from an existing SoC .dtsi. Or perhaps the warning=
s
> > are fixed by another series. Ultimately, it is up to the platform
> > maintainer whether these warnings are acceptable or not. No need to rep=
ly
> > unless the platform maintainer has comments.
> >=20
> > If you already ran DT checks and didn't see these error(s), then
> > make sure dt-schema is up to date:
> >=20
> >    pip3 install dtschema --upgrade
> >=20
> >=20
> > New warnings running 'make CHECK_DTBS=3Dy aspeed/aspeed-bmc-ampere-mtja=
de.dtb aspeed/aspeed-bmc-ampere-mtmitchell.dtb' for 20240801091217.1408809-=
1-chanh@os.amperecomputing.com:
> >=20
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/bus=
@1e78a000/i2c@480/fan-controller0@20: failed to match any schema with compa=
tible: ['maxim,max31790']
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/bus=
@1e78a000/i2c@480/fan-controller1@2f: failed to match any schema with compa=
tible: ['maxim,max31790']
> >=20
> >=20
>=20
> Thank Rob for your review!
>=20
> I am aware of the new warnings you mentioned. For more information, the=
=20
> schema binding of "maxim,max31790" is being progressed by other series=C2=
=A0=20
> https://lore.kernel.org/lkml/20240414042246.8681-2-chanh@os.amperecomputi=
ng.com/=20
>=20

For now can you please remove the `maxim,max31790` nodes from your
devicetree and re-send? As it stands you've been asked to rework what
you proposed in the thread that you linked, and a quick look at the
hwmon trees suggests support for the max31790 hasn't been merged.

You can send a follow-up patch adding the nodes to your devicetree once
the binding has been merged.

Andrew
