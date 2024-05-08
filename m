Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1363B8C0242
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2024 18:48:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cehDNeeg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZLgS4vcSz3cTh
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2024 02:48:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cehDNeeg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZLfs50XSz3cF4
	for <openbmc@lists.ozlabs.org>; Thu,  9 May 2024 02:47:49 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A18AFCE19C4;
	Wed,  8 May 2024 16:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DD03C113CC;
	Wed,  8 May 2024 16:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715186860;
	bh=G/+RUT2k7UJ/l1fi7XiRqiYTHntagvnq92yu5KTJVrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cehDNeeg9X/ZTdTbSBR2lwvZ51WhdQzmbG5tw2STpkKdvSRc0cJrhgHjXhP6Xu060
	 /E2t9dKjv2tBkWBjNtDsIUT+WjC7ykSUYl54ZQc3+AGVxBbIl5vzxqv9Dk9Z8Au1DI
	 oJY6j8P988d0B6O3L2gP12PLJL3CnJchiJAwI/fmNQS31azgiG4duHjizX/UJcB1Hk
	 w8IKewoDNEzDtJTDrjFekF6Q56SSetQ0MDubEkVXLGg0NugYL0T5b269EzZdWkHcHs
	 hb0X6bDn+F0SGTPHT2vPn1siHxsKToJruw+/9aX1vUdS2E0J44doEbIvRFUBDr/tKr
	 6i7UqI8IHNWGg==
Date: Wed, 8 May 2024 17:47:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: hwmon: max31790: Add
 maxim,pwmout-pin-as-tach-input property
Message-ID: <20240508-onward-sedation-621cc48fa83f@spud>
References: <20240414042246.8681-4-chanh@os.amperecomputing.com>
 <13b195e6-cbbd-4f74-a6fa-d874cb4aaa45@linaro.org>
 <065243cc-09cf-4087-8842-bd4394fb324f@amperemail.onmicrosoft.com>
 <d549cf2b-a7fa-4644-8fcb-3c420503ee01@amperemail.onmicrosoft.com>
 <20240423-gallantly-slurp-24adbfbd6f09@spud>
 <ab5cfd8c-0e88-4194-a77e-5ffbb6890319@amperemail.onmicrosoft.com>
 <396b47f5-9604-44ab-881f-94d0664bcab8@roeck-us.net>
 <0dcc8788-604a-49c1-8c6b-fdbfa9192039@amperemail.onmicrosoft.com>
 <da94fde6-3286-44eb-a543-c2ac4d11cd32@roeck-us.net>
 <8fb38eb3-bb94-49cc-b5bc-80989d7876b9@amperemail.onmicrosoft.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UUlXLBmKvVSmrjpp"
Content-Disposition: inline
In-Reply-To: <8fb38eb3-bb94-49cc-b5bc-80989d7876b9@amperemail.onmicrosoft.com>
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


--UUlXLBmKvVSmrjpp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 08, 2024 at 10:44:34AM +0700, Chanh Nguyen wrote:
> On 05/05/2024 22:40, Guenter Roeck wrote:
> > On 5/5/24 03:08, Chanh Nguyen wrote:
> > > On 25/04/2024 21:05, Guenter Roeck wrote:
> > > > On 4/25/24 03:33, Chanh Nguyen wrote:
> > > >=20
> > > > pwm outputs on MAX31790 are always tied to the matching
> > > > tachometer inputs
> > > > (pwm1 <--> tach1 etc) and can not be reconfigured, meaning tach-ch =
for
> > > > channel X would always be X.
> > > >=20
> > > > > I would like to open a discussion about whether we should
> > > > > use the tach-ch property on the fan-common.yaml
> > > > >=20
> > > > > I'm looking forward to hearing comments from everyone. For
> > > > > me, both tach-ch and vendor property are good.
> > > > >=20
> > > >=20
> > > > I am not even sure how to define tach-ch to mean "use the pwm outpu=
t pin
> > > > associated with this tachometer input channel not as pwm output
> > > > but as tachometer input". That would be a boolean, not a number.
> > > >=20
> > >=20
> > > Thank Guenter,
> > >=20
> > > I reviewed again the "tach-ch" property, which is used in the https:/=
/elixir.bootlin.com/linux/v6.9-rc6/source/Documentation/devicetree/bindings=
/hwmon/aspeed,g6-pwm-tach.yaml#L68
> > > and https://elixir.bootlin.com/linux/v6.9-rc6/source/drivers/hwmon/as=
peed-g6-pwm-tach.c#L434
> > >=20
> > > That is something completely different from my purpose.
> > >=20
> >=20
> > Based on its definition, tach-ch is associated with fans, and it looks
> > like the .yaml file groups multiple sets of fans into a single
> > fan node.
> >=20
> > In the simple case that would be
> >  =A0=A0=A0=A0tach-ch =3D <1>
> > ...
> >  =A0=A0=A0=A0tach-ch =3D <12>
> >=20
> > or, if all fans are controlled by a single pwm
> >  =A0=A0=A0=A0tach-ch =3D <1 2 3 4 5 6 8 9 10 11 12>
> >=20
> > The existence of tachometer channel 7..12 implies that pwm channel
> > (tachometer
> > channel - 6) is used as tachometer channel. That should be sufficient to
> > program
> > the chip for that channel. All you'd have to do is to ensure that pwm
> > channel
> > "X" is not listed as tachometer channel "X + 6", and program pwm channel
> > "X - 6"
> > for tachometer channels 7..12 as tachometer channels.
> >=20
>=20
> Hi Guenter,
>=20
> I applied the patch [2/3] in my patch series (https://lore.kernel.org/lkm=
l/20240414042246.8681-3-chanh@os.amperecomputing.com/)
>=20
> My device tree is configured as below, I would like to configure PWMOUT p=
ins
> 5 and 6 to become the tachometer input pins.
>=20
>        fan-controller@20 {
>          compatible =3D "maxim,max31790";
>          reg =3D <0x20>;
>          maxim,pwmout-pin-as-tach-input =3D /bits/ 8 <0 0 0 0 1 1>;
>        };

Why are you still operating off a binding that looks like this? I
thought that both I and Krzysztof told you to go and take a look at how
the aspeed,g6-pwm-tach.yaml binding looped and do something similar
here. You'd end up with something like:

        fan-controller@20 {
          compatible =3D "maxim,max31790";
          reg =3D <0x20>;

          fan-0 {
            pwms =3D <&pwm-provider ...>;
            tach-ch =3D 6;
        };

          fan-1 {
            pwms =3D <&pwm-provider ...>;
            tach-ch =3D 7;
        };
};

You can, as tach-ch or pwms do not need to be unique, set multiple
channels up as using the same tachs and/or pwms.
In the case of this particular fan controller, I think that the max31790
is actually the pwm provider so you'd modify it something like:

        pwm-provider: fan-controller@20 {
          compatible =3D "maxim,max31790";
          reg =3D <0x20>;
	  #pwm-cells =3D <N>;

          fan-0 {
            pwms =3D <&pwm-provider ...>;
            tach-ch =3D <6>;
        };

          fan-1 {
            pwms =3D <&pwm-provider ...>;
            tach-ch =3D <7>;
        };
};

I just wrote this in my mail client's editor, so it may not be not
valid, but it is how the fan bindings expect you to represent this kind
of scenario.

Cheers,
Conor.

>=20
> The sysfs is generated by the max31790 driver are shown below. We can see
> the PWM5 and PWM6 are not visible, and the fan11 and fan12 are visible. A=
nd
> all FAN devices are on my system, which worked as expected.
>=20
> root@my-platform:/sys/class/hwmon/hwmon14# ls
> device       fan12_input  fan1_target  fan2_target  fan3_target fan4_targ=
et
> fan6_enable  of_node      pwm2         pwm4
> fan11_fault  fan1_enable  fan2_enable  fan3_enable  fan4_enable fan5_enab=
le
> fan6_fault   power        pwm2_enable  pwm4_enable
> fan11_input  fan1_fault   fan2_fault   fan3_fault   fan4_fault fan5_fault
> fan6_input   pwm1         pwm3         subsystem
> fan12_fault  fan1_input   fan2_input   fan3_input   fan4_input fan5_input
> name         pwm1_enable  pwm3_enable  uevent
>=20
> Please share your comments!
>=20
> > Hope this helps,
> > Guenter
> >=20

--UUlXLBmKvVSmrjpp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjuspwAKCRB4tDGHoIJi
0tPqAP98wTeQweynaGBZg9YPawUPkDkuuI83sV+oyQj48YYoIwEA5FJvt12KWF00
iVizwm+RfmufPUV1B5XMz/CFaVou7wU=
=wzZY
-----END PGP SIGNATURE-----

--UUlXLBmKvVSmrjpp--
