Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B111135E25
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 17:23:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tryQ5VPzzDqZP
	for <lists+openbmc@lfdr.de>; Fri, 10 Jan 2020 03:23:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=stwcx.xyz
 (client-ip=136.143.188.51; helo=sender4-of-o51.zoho.com;
 envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=stwcx.xyz header.i=patrick@stwcx.xyz header.a=rsa-sha256
 header.s=zoho header.b=c9qRHSzV; dkim-atps=neutral
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47trxl4LMNzDqZP
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jan 2020 03:22:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1578586965; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Ro80BGFLVKyeaGToU2TTTI9FoMgNAKDMLjUI49ih1yJkH8xuyDeRk8LfqAuGCVMHu+3D7BNvWK030J8IyGOaznv3FRrDElxwlSA2GPhgSv3VQCEo3rSCGzj7TrnRHIUH6ewsfsaIedc7VYz9T03zKH1n8WOYdJwqUh7wtZdSKXU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1578586965;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=zcIudKPSUNeU36V7E8uoerxkRhls6pFNrmwZXi2hHVw=; 
 b=j2WHdJPmpUdXFuum2ZKjHepgdbrn92lKdHwUdOtIuVgj/W2ZRWDqjPEgltIKjbNSNqV6SPQZx/ZTqgpnjpLA10DtRXnIku+LkVEYgoPf2Yv6wWy6z+I20FGTbYjNgIfM64soBd/KBHVXM+QYh5sEQzhCEjjVqEg4Wt3bK5M5Z2c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=stwcx.xyz;
 spf=pass  smtp.mailfrom=patrick@stwcx.xyz;
 dmarc=pass header.from=<patrick@stwcx.xyz> header.from=<patrick@stwcx.xyz>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1578586965; 
 s=zoho; d=stwcx.xyz; i=patrick@stwcx.xyz;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 bh=zcIudKPSUNeU36V7E8uoerxkRhls6pFNrmwZXi2hHVw=;
 b=c9qRHSzVXGuCbrDK1qnDAcAX+XsPYsrRdAoYEZaD57dIbMojgjAp/73EON16Bnlc
 F2CB28A4oQnzVjIC2wpeTdB/8ZJWDA2xj6DFW/RgcBaHlci+5wjHOruJvJlo7lwQs1m
 xT4kGpf3g73eAS+1hUYR3aOg+vpAbNUev6vN+DKc=
Received: from localhost (163.114.130.128 [163.114.130.128]) by mx.zohomail.com
 with SMTPS id 1578586961220893.0315014424348;
 Thu, 9 Jan 2020 08:22:41 -0800 (PST)
Date: Thu, 9 Jan 2020 10:22:38 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Matt Spinler <mspinler@linux.ibm.com>
Subject: Re: Using a struct[enum] as an sdbusplus D-Bus method arg?
Message-ID: <20200109162238.GD1233@patrickw3-mbp.dhcp.thefacebook.com>
References: <ad2ea491-9eb0-375b-1832-c2a50e63b3c7@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1sNVjLsmu1MXqwQ/"
Content-Disposition: inline
In-Reply-To: <ad2ea491-9eb0-375b-1832-c2a50e63b3c7@linux.ibm.com>
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--1sNVjLsmu1MXqwQ/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 08, 2020 at 01:32:49PM -0600, Matt Spinler wrote:

Hi Matt,

> I'm designing a phosphor-dbus-interfaces D-Bus method where I think the
> ideal interface has YAML like:
>=20
> - name : CreateStuff
> =A0 parameters:
> =A0=A0=A0 - name: Data
> =A0=A0=A0=A0=A0 type: array[struct[enum[self.Types], uint32]]
>=20
> But that doesn't compile using an enum in the struct, and fails because
> sdbus++ creates code like:
>=20
> server.cpp:
>=20
> =A0=A0=A0 // Uses enum<self.Types>
> =A0=A0=A0 std::vector<std::tuple<enum<self.Types>, uint8_t>> data{};
> =A0=A0=A0 m.read(data);
> =A0=A0=A0 auto o =3D static_cast<Create*>(context);
> =A0=A0=A0 o->createStuff(data);
>=20
> What I'm trying to do is a valid D-Bus definition, correct? Or should I j=
ust
> use a string instead
> of an enum?

Enums are not actually a DBus concept, but something we added to
sdbusplus specifically.  What happens is that at the DBus level we send
them between processes as fully-qualified strings[1].  In the sdbusplus
generated code we know that this was defined in the YAML as an enum and
so we look the string up in a map<string, enum> to get you the enum
value (and throw an exception if an invalid enum was given).

I wouldn't recommend using a string instead because you are just
bypassing this enum-string checking code.

> It doesn't seem very straightforward to fix, as the vector that gets pass=
ed
> to o->createStuff()
> is a std::vector<std::tuple<Types, uint32_t>>, but the vector passed to
> m.read() is a
> std::vector<std::tuple<std::string, uint32_t>>.

This is a bug / missing feature in the header generator.  I'd have to
look into the code but it seems like it is not re-cursing inside the
tuple correctly.  We handle this case fine for raw enums.  The
definition of data's type looks like a start of the problem
(enum<self.Types> doesn't seem correct to me).  It's possible though
that the m.read generated function is wrong in that it is missing the
conversion from self.Types <-> std::string.

[1] A fully-qualified string is something like
    xyz.openbmc-project.InterfaceClass.EnumType.EnumValue.
--=20
Patrick Williams

--1sNVjLsmu1MXqwQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl4XU0wACgkQqwNHzC0A
wRnb7RAAgVY85fJFjkX3C5eFIJ/RlXjp5WGiW6aSYZaBZrljxW+CzDqNH/X9XSpR
U0vIBY4+5q/49tzkDR8AYd1x5DLrzmyzxDN5TitkwrQU8EpeYxSW93CaoNPa9bdA
GTC8adoDnbGbgln76jWUFa2QUEog++cqMnYItoQwowMq4lTcDlPBeQ5WScq+ZHwR
rCi26oA0BLfiT744w2JNssf2NEVvhN9vnTJgSq/F9C0zZVIf2t1F0JVDzEdgRz5U
0FRh7IT34WlsOo1WdQvTZNA4dS2hQfe1LrT1VkItKjfVvNy/I3Plq9W+Hr0rGLHi
KLJMbQNTC+jE/ur9RGWIHqyLPXDdf7xY+I5dLhjb6u4M2bdo18te6NMBS9D+d2E8
HvNuRDAeUxtU9jON0ZZ2y0AYmS+G2j0gFyLsbopAUfrTAs3pjA/HA8mwG7iW3gXC
uc++35uS9Lg4WuToubVjPvosq/Fc8Q6ifQn0zPrWfNshItUjyF5ytyLWIM+hCr4n
3heI3nJBxrUqjNdTBch/4x4LwcLZTk8ef0DJuk46pot2dE1xIycefBjNCTckZYav
frNQfcS1o+TgWGj/WyMTt3pV9y+KALb0P/XBhuDVDKTN0f8tvjxE744TE9zGlWA3
0kwgQjvRDJjzc6g6tHdN0uHKj+x4xM5KO6H8hysgetOxPsOsxew=
=0ljU
-----END PGP SIGNATURE-----

--1sNVjLsmu1MXqwQ/--

