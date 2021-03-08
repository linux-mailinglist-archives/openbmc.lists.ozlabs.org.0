Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30691331A51
	for <lists+openbmc@lfdr.de>; Mon,  8 Mar 2021 23:42:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvYHp0r0sz3cRF
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 09:42:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=XDqNyYdQ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=aiqt4A7b;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=XDqNyYdQ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=aiqt4A7b; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvYHV30jQz2ysx
 for <openbmc@lists.ozlabs.org>; Tue,  9 Mar 2021 09:41:57 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 95B065C0103;
 Mon,  8 Mar 2021 17:41:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 17:41:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=P5rIS/1AuLGFmSR4fbFDERxUSSw
 Lum6atkYz596iBbM=; b=XDqNyYdQolKCyft/TbV5Orjy8qR1lwzQc2aXI62yf6y
 xpC8lw9YZgJU6j5W3A0JNHJuzF3wYPi/f1K9NM1tyNKadC/xeOgPMrEeVz3DoOPg
 D6zAh+bulyZlMeBnAZFQd4crkx6cqcgHDUu7ZAKhjfhDGwa+a65mtc/ZgG4gl9bV
 zu+wS9yU/AoOfd4j2EuknbTA5C057p5uSgEDD4AHdnjWYIb3blwyhprVPrgGpbxB
 K48FvXpsHeWbC3ILSI2e7hYw9J0G9ealHv7uYUaEw7bLUtU8hpR8RJo7UF43vRem
 CzXPG98R5tRNCu4C9fg+L0E0GaJwaHAZaAwvHjQmubw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=P5rIS/
 1AuLGFmSR4fbFDERxUSSwLum6atkYz596iBbM=; b=aiqt4A7by5y5NWVx+LssMr
 1InIep0MebB7UR6mY45tgVxC/rrm189+ngrJiNKtaRrXqR7LUyh+A/KtkhglV7b0
 5gZ2BaBK7hkXhBPwZ4aoEncNyfV+yIUvLcXYHIZsVrU2IMunt4/W52NNwjkLUN1S
 1QtNvWQmTkm5DA/sYc9VGmsqSmZ/36kFH8qy8jRc8xDwApXOWFCcTSfqWKxgh7j5
 UuO2BJ6QT/2hNcsTq7+lzn0ytpAY6rJog31hXCA9kIfJe5JWQcisoGyM65dxPJwl
 5ak7UNLkh0HlHEcjsUqzdMsPOlmikGEy28Gyqd2y8TZTa/uKsDkYsGl9NdxXalbQ
 ==
X-ME-Sender: <xms:J6hGYCkzPCfx9cqlZMbTMZW7JsHaTaVLbGzoPYZVi46l3nRLktDkxQ>
 <xme:J6hGYJ26WsooCFI64vgiBYUq8ocsHiTFGw6-WjlvaTppGJslFM1GzwhfSwghB3FJS
 7EwMo7rhz3-keYYdl0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduhedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 udenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheptdefjeetuedtfeelfeeiieevveek
 geeuvedtveefiedvhfeiueeugffhkeelvdfhnecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:J6hGYArbZtIM499HHHgsdGamKRgq8vOPBlUMqV2lHzVQcuCLFjWwBg>
 <xmx:J6hGYGmrsdy3JJUjbrPZ0eZBE8_2wdfEbIYS-jvhETcPMwjIQOwxVQ>
 <xmx:J6hGYA0WtuZ4SXpQQZ87g2JdBDY5LhEV3c2nuwMHF-r7pumDpKRXCg>
 <xmx:KahGYBjEDlsZ9fj8DOctBwyuWVLdIB474V0MawcwoStAG6S3hknu5g>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7F3A1240057;
 Mon,  8 Mar 2021 17:41:43 -0500 (EST)
Date: Mon, 8 Mar 2021 16:41:40 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Request new repo for IBM-specific code - pam_2fa discussion
Message-ID: <YEaoJH+TP0A79tfM@heinlein>
References: <b8af3438-f85a-cb82-c88c-9c4e120399e9@linux.ibm.com>
 <YEKDY6+zfW5Uuqkl@heinlein>
 <dc7eb87e-c13f-dcb7-7b98-dbeb382d7caa@linux.ibm.com>
 <YEZwz6C5uGk8Vobs@heinlein>
 <15f3a43c-d876-38e0-8397-9db8a3896d38@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wZy9NCa6qb3TjtRb"
Content-Disposition: inline
In-Reply-To: <15f3a43c-d876-38e0-8397-9db8a3896d38@linux.ibm.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--wZy9NCa6qb3TjtRb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 08, 2021 at 02:30:26PM -0600, Joseph Reynolds wrote:
> Patrick, thanks for that.=A0 I was unaware of the pam_2fa project.=A0 I=
=20
> agree this could a be a good way for BMCs to get 2FA.
>=20
> However, as I tried to state in this email thread, the IBM firmware=20
> service organization requires that all credentials be brought onto the=20
> work site because some sites have no way to communicate with an external=
=20
> server.=A0 That is, once you are on a customer site, you might not be abl=
e=20
> to call into IBM (or even have access to a phone).=A0 Although this is no=
t=20
> typical, I don't think it is unique to IBM.=A0 What is done other secure=
=20
> installations?

I might have poorly explained my thought process before.  I know
*normal* 2FA requires remote access to the 2FA server.  The PAM_2FA
allows configuration of the URL and there is no reason why the URL
cannot be a localhost implementation of the 2FA protocol.  All the
protocol does is POST to the URL and make a decision based on the HTTP
return code.

Proposal:
    * Use 'pam_2fa' using Yubikey protocol to point at a 'localhost' URL.
    * Implement Yubikey 2FA protocol (described in pam_2fa
      documentation) in a small daemon on the BMC, specific for ACF
      certificates.
        - 2FA request will get the ACF password.
        - ACF daemon hashes password, checks with installed certificate
          and returns 4xx/2xx codes as appropriate.
    * Set PAM config to use 'pam_2fa' (pointed at localhost) for IBM
      service users.

In summary, the service accounts can have a static primary password AND
an ACF-secured secondary password which is checked with the standard 2FA
protocol.

> The IBM ACF design in terms of 2FA is:
=2E..
> 2. The ACF has no secrets (other than the password hash stored within=20
> it) and can be installed onto the BMC by the admin or the service rep.

Doesn't the service user have access you're not expecting the 'admin' to
be able to have on your machines?  How do you ensure a compromised ACF
cannot be replayed onto another machine?  With admin-level access it is
fairly trivial to fake out the serial number.

I might be misunderstanding something with "... or ther service rep".
It seems like there is a gap in how the service rep would install
something when the ACF is what gives them permissions to do the install?

--=20
Patrick Williams

--wZy9NCa6qb3TjtRb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmBGqCIACgkQqwNHzC0A
wRkOBQ//df/whQsuITawtnE9IuIkViTIa1gWEKBt1TRgMsudqcflFEycn9zZ0UsW
yvElMqgNM7/d3K24fSGDx0s+kK1fwhmkUJyKklsYXhszXpWZcZu40LhPWhxO0Yxf
Hr7+bbUmISimFbHneLPQ9V48tFyxs6Hy9bdiwhrXKyfAEi4wQqTRW3hOGZ9Klb2S
q0UmKQNOMP4rjk2zSzOLgBCHlTsZQ+Xb4xKjeq+5uerusYgBvBawG+v0pW9RZKRW
d1l9JKzieC/0T3vUttq17wZVrchWaco1apo4BXEvW+G9kzpMfcINaB0OfSNsPnFO
oK1YKerCQbIF8oqfDgirZYzD2xygVCizpivlw1bNAkh709tDsXNHbfSSaOpo029i
HfqIFINen1AzesEkTNZ0nFulQVQdMUNrMgKsCCSWESocTGOIuRdJ0daRajK5lx1P
DQBw0mMZgXrxvxeYXCUyaTXfAXbDqvZXZNj2qIJZY7eYAjCQb90SPgFFbWoBcW7C
VYf5rSI7RMQX83CAGUHuQrf2b/NBeBiv2oAh+Etb339jmcJXYziUatEWhUOKWO3b
OJVd3tisKFlKJDyrNqxl9+Y8AuuV5p3Uhz7As4OPrpxTiENtqvf4oikdNkCCZ9P9
pF+nZZPf/PseERrW3px//ikX+0MWdTEpc+swl25aQPGJbQQGye0=
=51cl
-----END PGP SIGNATURE-----

--wZy9NCa6qb3TjtRb--
