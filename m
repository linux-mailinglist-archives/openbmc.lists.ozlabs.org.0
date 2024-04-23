Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1538AF4D7
	for <lists+openbmc@lfdr.de>; Tue, 23 Apr 2024 19:03:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h6m4qEEq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VP7jZ381fz3vgP
	for <lists+openbmc@lfdr.de>; Wed, 24 Apr 2024 03:03:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h6m4qEEq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VP7j22dzCz3cR9
	for <openbmc@lists.ozlabs.org>; Wed, 24 Apr 2024 03:02:46 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 75BCC6162D;
	Tue, 23 Apr 2024 17:02:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F930C116B1;
	Tue, 23 Apr 2024 17:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713891761;
	bh=3e+Oj/N7j5lf0nP5FFbb3ciOk4jsyZzjl3g5y2z0Hek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h6m4qEEqE17QxuRHZjVCTlj4HlSy5e3e5EEsBTRGcATa5y/miy/xl3ZeE9YlbEQZb
	 A8g95rRvV3FLNbh2jfcVTOrCjj6OAFm1l+ibf9jpNhVvNhPDrsCDpCUuO4XwGQKFvw
	 18cxtWpLzpTB6bufICFP7ZB1M2F63ljfkRHpAcUoOKdFec84vn8UquWTS2btIlhsLY
	 27i2cPDBqQOVHFcvA4LazWNR5wYzKaWXNFu6NNPCMvx0My3P0XXW1RfSTAWy9qHKNl
	 I7XVWEzZeEWn7Ihm+98dx4mhry/x/bMB8uK/XOdqppNaq0m/DaV5UJaP03FrxKLFNy
	 ImmOr7rOYVMpQ==
Date: Tue, 23 Apr 2024 18:02:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: hwmon: max31790: Add
 maxim,pwmout-pin-as-tach-input property
Message-ID: <20240423-gallantly-slurp-24adbfbd6f09@spud>
References: <20240414042246.8681-1-chanh@os.amperecomputing.com>
 <20240414042246.8681-4-chanh@os.amperecomputing.com>
 <13b195e6-cbbd-4f74-a6fa-d874cb4aaa45@linaro.org>
 <065243cc-09cf-4087-8842-bd4394fb324f@amperemail.onmicrosoft.com>
 <d549cf2b-a7fa-4644-8fcb-3c420503ee01@amperemail.onmicrosoft.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/X6819dsJjBjzCn0"
Content-Disposition: inline
In-Reply-To: <d549cf2b-a7fa-4644-8fcb-3c420503ee01@amperemail.onmicrosoft.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, Quan Nguyen <quan@os.amperecomputing.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Open Source Submission <patches@amperecomputing.com>, Justin Ledford <justinledford@google.com>, Guenter Roeck <linux@roeck-us.net>, Chanh Nguyen <chanh@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--/X6819dsJjBjzCn0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 03:45:12PM +0700, Chanh Nguyen wrote:
>=20
>=20
> On 16/04/2024 11:52, Chanh Nguyen wrote:
> >=20
> >=20
> > On 14/04/2024 13:07, Krzysztof Kozlowski wrote:
> > > On 14/04/2024 06:22, Chanh Nguyen wrote:
> > > > The max31790 supports six pins, which are dedicated PWM outputs.
> > > > Any of the
> > > > six PWM outputs can also be configured to serve as tachometer input=
s,
> > > > allowing for up to 12 tachometer fans to be monitored.
> > > >=20
> > > > Add a new vendor-specific property, 'maxim,pwmout-pin-as-tach-input=
',
> > > > to allow PWMOUT to become a TACH input.
> > > >=20
> > > > An array of six integers responds to six PWM channels for configuri=
ng
> > > > the PWM to TACH mode. When set to 0, the associated PWMOUT produces
> > > > a PWM waveform for control of fan speed. When set to 1, PWMOUT beco=
mes
> > > > a TACH input.
> > > >=20
> > > > Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> > > > ---
> > > > Changes in v2:
> > > > =A0 - Update the vendor property name to
> > > > "maxim,pwmout-pin-as-tach-input"=A0=A0 [Rob]
> > > > =A0 - Update commit
> > > > message=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0
> > > > [Krzysztof]
> > >=20
> > > Please put binding before its user.
> > >=20
> >=20
> > Hi Krzysztof, I'll drop this [Path 3/3] in the patch series v3.
> >=20
> > My patch series will only be two patches. They are "dt-bindings: hwmon:
> > Add maxim max31790" and "hwmon: (max31790): Support config PWM output
> > becomes TACH"
> >=20
> > > > ---
> > > > =A0 .../devicetree/bindings/hwmon/maxim,max31790.yaml=A0=A0=A0=A0 |=
 11 +++++++++++
> > > > =A0 1 file changed, 11 insertions(+)
> > > >=20
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
> > > > b/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
> > > > index a561e5a3e9e4..2d4f50bc7c41 100644
> > > > --- a/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
> > > > +++ b/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
> > > > @@ -30,6 +30,16 @@ properties:
> > > > =A0=A0=A0 resets:
> > > > =A0=A0=A0=A0=A0 maxItems: 1
> > > > +=A0 maxim,pwmout-pin-as-tach-input:
> > > > +=A0=A0=A0 description: |
> > > > +=A0=A0=A0=A0=A0 An array of six integers responds to six PWM chann=
els for
> > > > +=A0=A0=A0=A0=A0 configuring the pwm to tach mode.
> > > > +=A0=A0=A0=A0=A0 When set to 0, the associated PWMOUT produces a PW=
M waveform for
> > > > +=A0=A0=A0=A0=A0 control of fan speed. When set to 1, PWMOUT become=
s a TACH input
> > > > +=A0=A0=A0 $ref: /schemas/types.yaml#/definitions/uint8-array
> > > > +=A0=A0=A0 maxItems: 6
> > > > +=A0=A0=A0 minItems: 6
> > >=20
> > > tach-ch solves your case. You define which inputs should be used for
> > > tach.
> > >=20
> >=20
> > Agree Krzysztof. I'll use the tach-ch property from the fan-common.yaml
> > to solve my case. So I will not need to define a new vendor property as
> > "maxim,pwmout-pin-as-tach-input". I'll drop this [Path 3/3] in the patch
> > series v3.
> >=20
> >=20
> > > Best regards,
> > > Krzysztof
> > >=20
>=20
>=20
> Hi Krzysztof,
>=20
> I checked in the
> Documentation/devicetree/bindings/hwmon/fan-common.yaml. I found the
> tach-ch property, but it seems define the tach channel used for fan.
>=20
>      tach-ch:
>      	description:
>        		The tach channel used for the fan.
>      	$ref: /schemas/types.yaml#/definitions/uint8-array
>=20
>=20
> In my purpose, I would like to configure the pwm output pins to become
> tachometer input pins by setting bit[0] in the Configuration Register.
>=20
>=20
> I think a vendor property is suitable for this purpose. It is only availa=
ble
> on specific MAX31790 fan controllers and not on other fan controller
> devices. So I think we can't use the "tach-ch" in fan-common.yaml.

Can you explain why you think that only MAX31790 fan controllers are
capable of an arbitrary mapping of PWM outputs to TACH inputs?

--/X6819dsJjBjzCn0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZifprAAKCRB4tDGHoIJi
0sBsAP4szpOAruzurA0AMuVIKmpMLtB6uiqkYMNtcr5cxnmZ+gEAk+pBGnO4u4kP
E83o5F7DEoyuPVHRNnYw6JiBMvOwaAw=
=cfs7
-----END PGP SIGNATURE-----

--/X6819dsJjBjzCn0--
