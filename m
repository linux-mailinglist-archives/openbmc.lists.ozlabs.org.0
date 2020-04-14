Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 536AA1A85BB
	for <lists+openbmc@lfdr.de>; Tue, 14 Apr 2020 18:52:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491s3S0rfjzDqwD
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 02:52:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=OvWKACL9; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=uGHhG8c/; 
 dkim-atps=neutral
X-Greylist: delayed 134 seconds by postgrey-1.36 at bilbo;
 Wed, 15 Apr 2020 01:50:24 AEST
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491qh02gXtzDqnp
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 01:50:23 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 14B165C02D4;
 Tue, 14 Apr 2020 11:50:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 14 Apr 2020 11:50:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ZB8+MJDD39RH6znU9KAaHD2AmYo
 AhxoYiJQbsgnbFAo=; b=OvWKACL9HGuPdGOLKaKffGyLd/+Y2zBepU6TkFJdPwW
 NyDhFHutncRFHYd5IeTzki+6Q6P6eH9t+Sgq1bwhdwYnBtFahzcRZv6c2z2ZdlOV
 IGMr8qUQXx8oKByGl+XRQ89DsN2G0E2q53h4L/HBIoV7vuolY/hPC8cgnV6Mfztb
 wgcXB4op9xRRQ9ogB34uFvymY9v9U40EhcuIegi3KHawG09+s8Y1reGbxA/B4tuq
 Ek7jw7KO9kekIp3tOpy2ttrwbdP4shF5Tqrd3Wz9HtSVS0SYTFrX6EHUyQyicUbU
 tcFFl8cT6hpB0fwdaQMLMa1xWQH4dO0uGP5dQagCt+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ZB8+MJ
 DD39RH6znU9KAaHD2AmYoAhxoYiJQbsgnbFAo=; b=uGHhG8c/gfLGMJAVpNarBI
 GDJdi2TJczOAaURnaUiaFrtSZ5Af9clTTu6+HDKIwoUtgMz/wUApWT1CuSO5/l/O
 g1xcGkLZUtUhDhXzMXKAezSBDGLAraQpgqGV/V1JJRMkE8jUBdIOnvjcd6YpqbYP
 PIqXEzQ6VYgX5vHB5SYh3xDLcWGU/zLasE4oXwJKQqpjC/Y0ZmR8BNrODXiNvDui
 nuFrOKSfscgAK8OoK/ryggn7sEECw8ksKt5RU2M37zIcnvufLEozQzDvxYYeBVTP
 Nc1r1NK7pSII/6IE+05Bqn6NYZAn1jjtIDmi/M0y3OnrOa5sxOhnDWKQeTc3GGuw
 ==
X-ME-Sender: <xms:vNuVXhdgBCJ76HZFs4fIhuf_lGsuIlySjmNMs_uR0gMUhWechiP-Yw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfedugdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghr
 ufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftg
 igrdighiii
X-ME-Proxy: <xmx:vNuVXmqLN6P-n743G0SHC5g5NSi6mhnIe92csZ7frhzP6JkS8UrwSQ>
 <xmx:vNuVXn6gHQztulJNUmLvfwDLr3RKNruM6gaKn0gdO5K8AoIrBW-lWw>
 <xmx:vNuVXkoNwedxmNGWcNSxcIeDwi2zwFIXBvP0P9AjY_H1R8vsW_UaeA>
 <xmx:vduVXpkHpGJuwmZpm4khAKFHocgdKHJnahCMjIG0VJcrz72tx23mtg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 453B93280066;
 Tue, 14 Apr 2020 11:50:20 -0400 (EDT)
Date: Tue, 14 Apr 2020 10:50:19 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: Re: ipmi password storage
Message-ID: <20200414155019.GB443018@heinlein.lan.stwcx.xyz>
References: <20200413230015.GB9295@mauery.jf.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="H+4ONPRPur6+Ovig"
Content-Disposition: inline
In-Reply-To: <20200413230015.GB9295@mauery.jf.intel.com>
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
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--H+4ONPRPur6+Ovig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2020 at 04:00:15PM -0700, Vernon Mauery wrote:

Vernon,

Is there some background pointers on why IPMI needs to store passwords
in a reverable way?  I never understood that.

> Internally, an issue was raised that basically says that the mechanism=20
> by which we are storing the IPMI passwords on the BMC is insufficiently=
=20
> obfuscated. I have come up with a patch set that resolves this at the=20
> expense of no downgrading the BMC without the side-effect of losing all=
=20
> IPMI passwords. I would like to know what the community thinks about=20
> usability vs. security in this scenario.
>=20
> Current Implementation
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 1) If the user is part of the ipmi group (/etc/group) then when the user=
=20
> changes their password, pam-ipmisave.so intercepts the password as a one=
=20
> of the PAM layers and saves it, encrypted, to /etc/ipmi_pass.
> 2) Encryption (obfuscation, because we don't really have a secure=20
> mechanism of storing secret keys), is done like this:
>    a) read 8 bytes (S) from /etc/key_file (currently pre-loaded with "OPE=
NBMC=3D")
>    b) create a random value H (read from /dev/urandom)
>    c) create the AES-CBC secret key K=3DHMAC-SHA256(S, H)
>    d) encrypt the list of username:password data using K
>    e) store H along with the encrypted data in /etc/ipmi_pass
> 3) reading the password (for establishing IPMI RMCP+ sessions)
>    a) read 8 bytes (S) from /etc/key_file
>    b) read H from /etc/ipmi_pass
>    c) compute the AES-CBC secret key K=3DHMAC-SHA256(S, H)
>    d) decrypt and verify the contents of /etc/key_file
>=20
>=20
> There are many issues with this mechanism, but we cannot fix all of them=
=20
> without some secure mechanism for storing secret keys. That is why=20
> really, at best, this is obfuscation, not encryption. The data is not in=
=20
> plain text, it takes some work to get to it. More than xor or rot13, but=
=20
> not so much that a person could do it with a bash script.
> 1) the default /etc/key_file is the same for every BMC built with the=20
> default settings (changing this requires a bbappend for pam-ipmi). This=
=20
> means the /etc/key_file could basically not exist; all you need is the=20
> algorithm and /etc/ipmi_pass.
> 2) the size of the /etc/key_file is also not really great. Even if it=20
> was different on every machine, computing only 2^64 possibilities is not=
=20
> so hard.
>=20
>=20
> Possible Solution
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Migrate to a solution that uses a key that is longer that does not=20
> get written directly to the flash
> 1) S is now computed instead of hard-coded. S=3DHMAC(MachineId, AppID)
> 2) S is longer (32 bytes instead of 8)
> 3) S is not written to flash, because it can be computed
> 4) S is different for every machine because it is a derivative of=20
> /etc/machine-id
>=20
> The migration from the old mechanism to the new could be done simply by=
=20
> using the new key on the next write to the /etc/ipmi_pass file. After a=
=20
> firmware update to this new code, a password change would trigger a=20
> decrypt of the /etc/ipmi_pass file, a modification of the plain text,=20
> and a re-encryption of the data. If it reads the 'legacy' key in and=20
> writes out the data using the new key mechanism and deletes the legacy=20
> key, it would use the new key mechanism from that point onward. However,=
=20
> this would cause any downgrades to prior versions to fail to decrypt the=
=20
> /etc/ipmi_pass file, thereby losing all the ipmi passwords. This is not=
=20
> ideal, but could possibly be mitigating by truncating the new machine-id=
=20
> derivative password to 8 bytes and storing it in the /etc/key_file=20
> instead of just deleting it. This might improve security only slightly=20
> at for the price of a better user experience.
>=20
> I know that some companies using OpenBMC have products with users out in=
=20
> the field, so it is not great to make changes like this. Also, it is not=
=20
> great to have low-grade security. So here I am, writing to ask for=20
> opinions and options.
>=20
> --Vernon

--=20
Patrick Williams

--H+4ONPRPur6+Ovig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6V27sACgkQqwNHzC0A
wRkOZw/+Ko/HAc6fpZo6j8iigLsb5tJmfm7Gjo+617nJaRl5RwnxZIwt108m8un5
WalsK4wjqCcEMeIReaxpzXbNxAmktk8wMlos8fSuDg4XKTeNcnqzca84fQPtTwyU
SuVgecBrlts/1GO6JkZDrZrcxMKdNzgrw60ac5Ip+MCYkvVyZ73Umds965IjtxY3
W5vn4r69WBttLsZ13K0F2uWY1c5Mgv9MfEhtSC4hR+Viy+VkH8gzD1M6iYAW4X20
BfwFphsNajG24cUCdX4zbtqid4azIOMhfQUKkhlYOtbWla+yfp03Wyw9AHqqxpg1
veotGQrQCjDxDktVZUy7DDI+WmUECqCx3HoBeIRxGD9DshSftgJhbIPDINmhgnog
YmZ7In/gtOtGJUTiOl80Ii1TwXlJUm9kgW631FiCjQJ2noSfiZAuGRj7+vqh3jCk
zB9paqmp9HVZS/xtndFOpQR5v9FdwNKqXNRoGlIMdd3ttar8fK21OCHZg3LsVHkh
JTHG1/P9oN9W67sZPFuZiX7X1fb81QsKuIpbtsfYtn3YRB/55ck0QzywPTHM+lUS
giTBYrpnk1j+4ljxZ2bPd/5iZCjdJL9KhM9svMk1psm25X6UD1Z9EdsHlIECvPJ0
h1vS8qR1y4KrfhISxdvRK7pduYkbEwTpqCulIi+8mqCunQl/7ww=
=reIS
-----END PGP SIGNATURE-----

--H+4ONPRPur6+Ovig--
