Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D04F8B25C8
	for <lists+openbmc@lfdr.de>; Thu, 25 Apr 2024 17:57:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DNxIOtmq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQL8Z3wr8z3dPs
	for <lists+openbmc@lfdr.de>; Fri, 26 Apr 2024 01:57:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DNxIOtmq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQL8212Q3z3dKd
	for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2024 01:56:50 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 28398CE1A15;
	Thu, 25 Apr 2024 15:56:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A5E7C113CE;
	Thu, 25 Apr 2024 15:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714060605;
	bh=WuAKIKma+/FB2Ips3osw/A9+g1o7pziDj656fCihlRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DNxIOtmq7emZWHtH/3JlkQsF3at92iGgkNSoYSrPm8wOobwWO4i1EtMni59snnjUI
	 +q1xeBYAYqez7sk3EUQfkiUu5rGcNkJs2oZTUXowxfnDU1zZ21qFNhfD+cGkybmnsK
	 0A/ewFfjnACiOV1MH7JuVhF2VkIj96GTdcd8EEE5VsmEIgC5zEdhxl9uHQ0aGyUJyQ
	 vmzEGxaAWU287XjfIVSl7sRe4vwiX9m4kP51+CSI9Be6/LCdVj7ncCMW+aJHbwpt/C
	 Yy5KhGqVwrZwUhNtL6NDa7wordwOccl46qLaMB721f5HnZvfyENhgM9fDv5Va5Pte5
	 a46e3g2BalYOQ==
Date: Thu, 25 Apr 2024 16:56:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: hwmon: max31790: Add
 maxim,pwmout-pin-as-tach-input property
Message-ID: <20240425-enigmatic-portly-c2282fc1709a@spud>
References: <20240414042246.8681-1-chanh@os.amperecomputing.com>
 <20240414042246.8681-4-chanh@os.amperecomputing.com>
 <13b195e6-cbbd-4f74-a6fa-d874cb4aaa45@linaro.org>
 <065243cc-09cf-4087-8842-bd4394fb324f@amperemail.onmicrosoft.com>
 <d549cf2b-a7fa-4644-8fcb-3c420503ee01@amperemail.onmicrosoft.com>
 <20240423-gallantly-slurp-24adbfbd6f09@spud>
 <ab5cfd8c-0e88-4194-a77e-5ffbb6890319@amperemail.onmicrosoft.com>
 <396b47f5-9604-44ab-881f-94d0664bcab8@roeck-us.net>
 <b79b5323-196f-41bc-b47a-d350c49d769a@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nEP+ljWS/1R7JDAt"
Content-Disposition: inline
In-Reply-To: <b79b5323-196f-41bc-b47a-d350c49d769a@linaro.org>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Chanh Nguyen <chanh@amperemail.onmicrosoft.com>, linux-kernel@vger.kernel.org, Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>, Quan Nguyen <quan@os.amperecomputing.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Open Source Submission <patches@amperecomputing.com>, Justin Ledford <justinledford@google.com>, Guenter Roeck <linux@roeck-us.net>, Chanh Nguyen <chanh@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--nEP+ljWS/1R7JDAt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2024 at 05:46:02PM +0200, Krzysztof Kozlowski wrote:
> On 25/04/2024 16:05, Guenter Roeck wrote:
> > On 4/25/24 03:33, Chanh Nguyen wrote:
> >>
> >>
> >> On 24/04/2024 00:02, Conor Dooley wrote:
> >>> [EXTERNAL EMAIL NOTICE: This email originated from an external sender=
=2E Please be mindful of safe email handling and proprietary information pr=
otection practices.]
> >>>
> >>
> >=20
> > The quote doesn't make much sense.

The reply is to me questioning part of their earlier reply:
	> I think a vendor property is suitable for this purpose. It is only avail=
able
	> on specific MAX31790 fan controllers and not on other fan controller
	> devices. So I think we can't use the "tach-ch" in fan-common.yaml.

	Can you explain why you think that only MAX31790 fan controllers are
	capable of an arbitrary mapping of PWM outputs to TACH inputs?

> >=20
> >> Sorry Conor, there may be confusion here. I mean the mapping of the PW=
M output to the TACH input, which is on the MAX31790, and it is not sure a =
common feature on all fan controllers.
> >>
> >=20
> > I think the term "mapping" is a bit confusing here.
> >=20
> > tach-ch, as I understand it, is supposed to associate a tachometer input
> > with a pwm output, meaning the fan speed measured with the tachometer i=
nput
> > is expected to change if the pwm output changes.
> >=20
> > On MAX31790, it is possible to configure a pwm output pin as tachometer=
 input pin.
> > That is something completely different. Also, the association is fixed.
> > If the first pwm channel is used as tachometer channel, it would show u=
p as 7th
> > tachometer channel. If the 6th pwm channel is configured to be used as =
tachometer
> > input, it would show up as 12th tachometer channel.
> >=20
> > Overall, the total number of channels on MAX31790 is always 12. 6 of th=
em
> > are always tachometer inputs, the others can be configured to either be=
 a
> > pwm output or a tachometer input.
> >

> > pwm outputs on MAX31790 are always tied to the matching tachometer inpu=
ts
> > (pwm1 <--> tach1 etc) and can not be reconfigured, meaning tach-ch for
> > channel X would always be X.

Are they? Granted, I probably didn't read this as well as you did, but
figure 3, 4 5 & 6 seem to show mappings that are not 1:1, with PWMOUT1
controlling several fans, each of which report back via a different tach
channel. I think the fan controller binding accounts for this though:
the child nodes would reference the same PWM provider but have different
tach-ch values.

> >=20
> >> I would like to open a discussion about whether we should use the tach=
-ch property on the fan-common.yaml
> >>
> >> I'm looking forward to hearing comments from everyone. For me, both ta=
ch-ch and vendor property are good.
> >>
> >=20
> > I am not even sure how to define tach-ch to mean "use the pwm output pin
> > associated with this tachometer input channel not as pwm output
> > but as tachometer input". That would be a boolean, not a number.
>=20
> Thanks for explanation. So this is basically pin controller function
> choice - kind of output or input, although not in terms of GPIO.
>=20

> Shouldn't we have then fan children which will be consumers of PWMs?

In this case, the max31790 has the PWM hardware, so it would be the
provider...

> Having a consumer makes pin PWM output. Then tach-ch says which pins are
> tachometer for given fan? Just like aspeed,g6-pwm-tach.yaml has?

=2E..and it seems to me like there should be several fan child nodes as in
the aspeed binding you mention here that are the consumers. The binding
as written seems to only support a single fan.

--nEP+ljWS/1R7JDAt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZip9NwAKCRB4tDGHoIJi
0vP1AP4j4+fuNIvolurSpFQaXNehLyhR+uSnou0/9LHPJ1mr9AEA/znEjxTUZQ7d
vWL7Gzplb2kPTy1lhPVh5m0EXqhERws=
=1b3W
-----END PGP SIGNATURE-----

--nEP+ljWS/1R7JDAt--
