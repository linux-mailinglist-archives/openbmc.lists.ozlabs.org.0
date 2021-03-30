Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FD534E64C
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 13:23:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8nBM4Sytz3bsv
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 22:23:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OTRSOu3E;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OTRSOu3E; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8nB751D0z2ysp
 for <openbmc@lists.ozlabs.org>; Tue, 30 Mar 2021 22:23:11 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9247461987;
 Tue, 30 Mar 2021 11:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617103386;
 bh=P9SExgjbYY0iz0ly5S6s+o+0gtVraFaw+byED+bjTq0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OTRSOu3E1AA9QKGSiNcA/soQKSYqQrUNY3aHrzHim1hTUaL8wE4tpz6NfVU9XN7Ag
 fO44Catmfp/wYb553FXcayPQmyom1e/+tvCZebn8wszTsFej0Z+ai4dk1/h8BfhTW9
 X7efrmD5tZZO6iKEmkGxoKN6W4INm6H7vIvi8twA5UxyXp9jYfkPEl03tJCITRH2/C
 e0K72lDLC/RXq1i3P0QTZdOi7mvKNtG1WL/oGlcUrLMetsZheUf6JjQaB/hw+c5nRp
 pge2OaT6b/gqSXrN9l/Lu/9mWeefBLl+vDwWAXD9xhn8tPZqZpoxA/YzZBsnc1ZImD
 5VlWSVRbbtcDg==
Date: Tue, 30 Mar 2021 12:22:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: Enabling pmbus power control
Message-ID: <20210330112254.GB4976@sirena.org.uk>
References: <YGLepYLvtlO6Ikzs@hatter.bewilderbeest.net>
 <5105ada1-643a-8e58-a52d-d3c8dbef86b9@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="CUfgB8w4ZwR/yMy5"
Content-Disposition: inline
In-Reply-To: <5105ada1-643a-8e58-a52d-d3c8dbef86b9@roeck-us.net>
X-Cookie: Memory fault - where am I?
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Zev Weiss <zev@bewilderbeest.net>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--CUfgB8w4ZwR/yMy5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 30, 2021 at 03:34:16AM -0700, Guenter Roeck wrote:

> (and I don't know if the userspace consumer code is appropriate - you
> might want to check with the regulator maintainer on that).

It's not, you should never see this in a production system.

> > first attempt at this ran into problems with all the
> > reg-userspace-consumer instances getting attached to the first
> > regulator device, I think due to all of the regulators ending up under
> > the same name in the global namespace of regulator_map_list.=A0 I worked
> > around that by adding an ID counter to produce a unique name for each,
> > though that changes device names in userspace-visible ways that I'm
> > not sure would be considered OK for backwards compatibility.=A0 (I'm not
> > familiar enough with the regulator code to know if there's a better
> > way of fixing that problem.)=A0 The #if-ing to keep it behind a Kconfig

> Maybe ask that question on the regulator mailing list.

I can't really tell what the issue is here without more context, the
global name list should not be relevant for much in a system that's well
configured so it sounds like it's user error.

--CUfgB8w4ZwR/yMy5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBjCg0ACgkQJNaLcl1U
h9CrkAf/TSRg35eq8WabWWLzcTIUo/QdwVEdbLrcBq8sB22zW+lZicAOvpWCY+pa
cit9c0IqFkH7TFZ7vTPgta4lKflluYv8TLmWlN5/9QZJHo8gWC1x4os/MnUwONzy
vo9ZuPe7q12A+15s/yC6RZ5K2aV57fLUdsIaMd48nBO3oieK/NjK2bbJ+eixv1AL
MG8hhAn+Z5J6OIklwFZJ/Lo4weOUUVS+opsnd1JSlU9lTzygdJOOcmbMvm92DlCH
A/c1JxRmj8Tfdb6nNaISxh/s6DfUzf73Qbz5tWtbVjMOSqEPuwyY6vJtMYXu5ebD
YVcpBXMdgNu4l/7aNSBFo+/lqI55ew==
=co8z
-----END PGP SIGNATURE-----

--CUfgB8w4ZwR/yMy5--
