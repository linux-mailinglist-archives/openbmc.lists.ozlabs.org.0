Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E95D513B12C
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 18:42:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xySy6XKlzDqRZ
	for <lists+openbmc@lfdr.de>; Wed, 15 Jan 2020 04:42:10 +1100 (AEDT)
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
 header.s=zoho header.b=jvV4355Q; dkim-atps=neutral
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xySB2p5wzDqRN
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jan 2020 04:41:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1579023684; 
 s=zoho; d=stwcx.xyz; i=patrick@stwcx.xyz;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 bh=Jk8uatyPGPgYzzOMBQNrwOS/Q63b3V6B4AgOQPkfy/I=;
 b=jvV4355QTH1oWe2AmHUmScA4rEv3DzvAWhQulyURxpMQE1SqBBPhV3yAXtbyGm0C
 Kb/azDGoiUuL8LLMagkGmZv2cfKMqKmNIcWvsfmhA0Qn/UpWBrhEmoe5aS/q/2xP28Z
 KnKrWQQm0A1CRnUIDM0v+A6lU4JdmF/JH1h7BUKA=
Received: from localhost (163.114.130.128 [163.114.130.128]) by mx.zohomail.com
 with SMTPS id 1579023680170352.9773660360453;
 Tue, 14 Jan 2020 09:41:20 -0800 (PST)
Date: Tue, 14 Jan 2020 11:41:17 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Matt Spinler <mspinler@linux.ibm.com>
Subject: Re: Using a struct[enum] as an sdbusplus D-Bus method arg?
Message-ID: <20200114174117.GA3512@patrickw3-mbp.dhcp.thefacebook.com>
References: <ad2ea491-9eb0-375b-1832-c2a50e63b3c7@linux.ibm.com>
 <20200109162238.GD1233@patrickw3-mbp.dhcp.thefacebook.com>
 <0de28bd0-95a7-11f6-f2bd-9806508ec5cd@linux.ibm.com>
 <20200109190343.GF1233@patrickw3-mbp.dhcp.thefacebook.com>
 <b018b37e-10e8-55bf-b48e-fd2c71c47160@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline
In-Reply-To: <b018b37e-10e8-55bf-b48e-fd2c71c47160@linux.ibm.com>
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


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 12:59:26PM -0600, Matt Spinler wrote:
> To go from enums to strings, there is a convertForMessage() function, but=
 to
> go from
> strings back to the enums, which is what we need, the function has the en=
um
> name in it:
> =A0=A0=A0=A0 convert<enum name>FromString(const std::string& s);
>=20
> I don't think it's possible for message::read() to know that?

This needs a pretty simple refactoring to rename the
convert<enum>FromString function to a template function.

    // in a header somewhere to forward declare.
    template <typename T> T convertFromString() =3D delete;

    // in the generated code for each enum.
    template <> enum_type convertFromString<enum_type>() { ... }

The message::read will be able map message::read<enum_type> to
convertFromString<enum_type>.  There is probably some SFINAE needed
using is_enum[1] so that we don't need to generate each
message::<enum_type> specialization but can use a generic one for all
enums.

[1] https://en.cppreference.com/w/cpp/types/is_enum
--=20
Patrick Williams

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl4d/ToACgkQqwNHzC0A
wRk1aw//Tev6+q/e++ty7a16SsYDi4EwTW1L6ceS+mwH8BN1xHIE7Fg/07wKtnGz
Gcr8fSdoGcpr8ox+rCktyezNclYV8vqFtBBqLmzZmTqzGm6MXOW3oAevIPyyeX3y
ZqgwU93KT2Rb0ovIGgPnx9cWkGPCRwE5+Us8cuHtymKqtBXF8lKuAULh1WqfW+5B
U6jyhsbMGMlJSLArU1U1Da86KgYwcpqzzYPIPtN8mpQ+f4ZIBBnTDVdTwa2R6P3f
T/hR+QvZN4S/JA3SiTKhR6W1jjRA4QYHD9aYZ5a41AdINDdfSQdbBFT/rIj4740m
+LzcmW7qRsF81Jl4/WWPGMZfZv2FrlMgmWOSFvFAxvCCNINQZJ/QDx8NR8MxzagA
qc4vyToioJ4aPnnnxkWoyGf016y7BjLkW5l2RiEzPlTJ0CgUwY9Xd/hi0uM4kWNn
xX9lcfJ/4i1WiuPKJAA0sCUUnOH+GTDA26PevuDE+m7Qiy/oshRzMsTGjdIUaBW9
Qe2pH8eOoZJ8YPzic1zrI10eRAzw93guckQD4EOiG72Gx5QuBcn59YN2xHKQTLXv
3rJNqvradfjb7kLEhO/nnN6tafeBhI5XBhxIp2qTJd3KAsB5TUs6YG4BCxh5Lzxj
KEEGc0DhAIE9JT78N3WCL5Q3KtLFO1h5GWYOm6H9VwApx3UlRh8=
=PuiO
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--

