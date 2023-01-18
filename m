Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F40B2671BFA
	for <lists+openbmc@lfdr.de>; Wed, 18 Jan 2023 13:24:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxlLh5gqyz3cFB
	for <lists+openbmc@lfdr.de>; Wed, 18 Jan 2023 23:24:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=GKSWJeDH;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=IgEs8GwL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=GKSWJeDH;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=IgEs8GwL;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxlL7226lz3bbc
	for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2023 23:23:59 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 3C6945C00DB;
	Wed, 18 Jan 2023 07:23:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 18 Jan 2023 07:23:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1674044637; x=1674131037; bh=x/9MlxVjri
	PenmaT6qUd0nSolqOnAS0sQ4f+0McbQ5c=; b=GKSWJeDHwmMWhtWPvsjV9kZcAr
	TrihEiAW2xy9vImHMZlEpussZKU1tWhPqJN9VdNj31YG9/F+r0HGkIhSUGEgSGXl
	ch7ixUlT2mngdcQoCvlUYGvDSHlPi6NuWPdRuk4mCs3m0S5O4lAnA83YLcNuXykq
	VXQlDoiACmST05NgCLbsUPZBI3I2s+1zJjblSpAKF6jpyHf6ey7QbQa//Hm3APMj
	4VjGtFMAxCYR6Eb7WZTbHaXp1VaMy/92x+mCkuZny/aYtqfirYTJHkV1CL/FE2Lt
	A20PReVk5PiDLN+Os0+HoLrlTCEJ5WA5OhBMZjWYa6lfyVgP2fNXnou9uXvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674044637; x=1674131037; bh=x/9MlxVjriPenmaT6qUd0nSolqOn
	AS0sQ4f+0McbQ5c=; b=IgEs8GwLuWW+XPNPTPIvw7eaDdH76HAoC3qAXwiYI8eQ
	YWFTuNCSovR8iQukQUFrs062XpuU8Y0jhZKOFJJ6TsFuOzld/XwasEDYStrqpi5J
	WZoyDZ5qw3Qynj9PpKXm3Uky3O6qophh3XdkNA0tgRNggHhn6xkCgTO9vUDS0pZ3
	xFORncFhU/T1Yn9dBuHZwe7SxkkuKbAUI1GPccCJ1UIOoIWcTiWdZt3+eVrUR4Qa
	vckRuRj2HrQ+Ydd2qrwMEekdi6NvyXiyGNnb+i6Pn1NvWuqrHTYV9ciQzYQaOV7p
	buj6pwUWJ4bh95ZFpf5Xn/0+Roq3SGurdBlb1/vSIA==
X-ME-Sender: <xms:3OTHY6Xxkovtxgk0JxAlrYp_NQUlHkr2pVqCeIGq-1dmTIWHtOymOw>
    <xme:3OTHY2k9vZQt--ee3I53DtLMj6NKz7BY0hJ1dD0t9TqXxhySSnIogIejGb3tbcnb1
    -9h-aB0hB-Y5dPOHpk>
X-ME-Received: <xmr:3OTHY-bT6_u47Jg2gBognJPBD2zv54DBQWY2NP6aH9_r7i6FNN-d9LhJYWxN1jYBgONexeWNM5AAolQk9O5UK4XDeoEC3ufsPSU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtkedggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddunecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehudefgfffiefhgffhfeekieet
    ffetgfevfeefgeehvdehgeelhfdtuedukeeugeenucffohhmrghinhepfhhrvggvuggvsh
    hkthhophdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:3OTHYxVJtTShOE-Iq3llZPD5BMR99A-w3dn5kxS3wGTi6iKEaIXaPA>
    <xmx:3OTHY0nAeCJGeGfnxjGzaM8srlNF_0KeFsPoFcKx3tkAWTEHCPvhFg>
    <xmx:3OTHY2cRXjyEPa9MUn9APFGVrx5Iq9oYAlNp-ezEOln7wNQ3h7yhdw>
    <xmx:3eTHY7tHjZQQpjZMzBnXvnjVwfkSbYjkvmH7XAG-pBtw2hPk9-A-0w>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jan 2023 07:23:56 -0500 (EST)
Date: Wed, 18 Jan 2023 06:23:55 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Gleb Semenov <g.semenov@yadro.com>
Subject: Re: Add UDP transport for rsyslog
Message-ID: <Y8fk224rJX2lqKhp@heinlein.taila677.ts.net>
References: <4fcca645-ebc3-792f-aff2-e26df9660d72@yadro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RTUg0RzjFOOE7Okj"
Content-Disposition: inline
In-Reply-To: <4fcca645-ebc3-792f-aff2-e26df9660d72@yadro.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--RTUg0RzjFOOE7Okj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 18, 2023 at 02:36:15PM +0300, Gleb Semenov wrote:

>  1. Modification of the
>     xyz/openbmc_project/Network/Client.interface.yaml interface to add
>     the protocol attribute.

You may want either a separate interface or a separate path to identify
TCP vs UDP (Network.Transport?).  There are enough users of Network.Client =
that
you probably don't also want to modify all of them to have "TCP".  Maybe we
could set TCP as the default on a new property, but I think most protocols =
only
have only a single implied protocol, so you're now forcing error paths
onto all of them if "Transport !=3D TCP".

Make sure this is done as an enumeration.

>  2. Handling for the =A0interface changes in the code of the dbusplus lib=
rary.

Not sure what you mean by this.  The phosphor-dbus-interfaces is where
the YAML is and the result is generated.  I don't think there should be
any changes to the sdbusplus repository for this proposal.

>  3. Corresponding changes to the phosphor-rsyslog-config service.

(This is phosphor-logging)

>  4. Proper changes to the REST/redfish API.

Do you have a Redfish schema already to handle this?

>  5. Modification of the web interface and command line tools.

Which CLIs?  I'm not aware of any that are relevant here.

> Also, current DBUS interface to the object implies two independent=20
> messages to change network parameters, one to set the IP-address, and=20
> the other to set the port number. They are not atomic and configuring=20
> just one parameter yields in undesirable state transitions of the=20
> service to configure. It is good to send all the parameters in one=20
> "atomic" message. But, I'm understand that this may require to persist=20
> current network parameters on both sides of transmission (or, at least,=
=20
> to have all of them on sending side upfront).
>=20
> So, it needs to add=A0 DBUS getters/setters for just protocol type, and=
=20
> all parameters at once.

The "getters/setters" are defined by the dbus specification.  We should
not add new methods that set the properties.  See
org.freedesktop.DBus.Properties.Set[1].

If you need to be able to atomically construct a new configuration, you
should look to the 'Create' pattern found in the rest of the
phosphor-dbus-interface repository.

```
$ find -name Create.interface.yaml
=2E/yaml/com/ibm/Dump/Create.interface.yaml
=2E/yaml/xyz/openbmc_project/Certs/CSR/Create.interface.yaml
=2E/yaml/xyz/openbmc_project/Dump/Create.interface.yaml
=2E/yaml/xyz/openbmc_project/HardwareIsolation/Create.interface.yaml
=2E/yaml/xyz/openbmc_project/Logging/Syslog/Destination/Mail/Create.interfa=
ce.yaml
=2E/yaml/xyz/openbmc_project/Logging/Create.interface.yaml
=2E/yaml/xyz/openbmc_project/Network/Client/Create.interface.yaml
=2E/yaml/xyz/openbmc_project/User/Ldap/Create.interface.yaml
```

You'll note that Network.Client.Create already exists, which is probably
what you're looking for.

> Regards!
>=20
> Gleb

1. https://dbus.freedesktop.org/doc/dbus-specification.html#standard-interf=
aces-properties

--=20
Patrick Williams

--RTUg0RzjFOOE7Okj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmPH5NkACgkQqwNHzC0A
wRkO7RAAguXHrOvCc3CcbzATFGdaTkN733qNmEsI75ippTv74UJ0pgZkr2cHuk4p
WE5L+OUwL33UyzSgI4R/BR4zM8k2trxy8J1svZkl1BIGZs5g9JD5mkPqbu4lRb96
D3adADQapynlGGckyYwUFrrkoV4WrYDyxQdnMw9MGgu4QmJbTMgnV11ltKEE4I9f
YRK354KzOsA4d9S4jcDxOxbaOC6d8p/h/ErN963cYlo/Jzuv4BJJGZHzsvr4UM5m
UwG2a1iawBaXyEKwIri6+BilL87GVp1J+aOt8xTDSz09P1fRETeTh5LzCUW/kcbm
KyTBz0XVWki5CoFZiTV3zAq/5Oqixw3yp/zdZp43V1LAL/xkBXH/9orDG9Z6Bb0D
P1sI9QldVU7vLIn9sQhxlZPwpB70NYLgkQgj8Iuy8m1lx7In9MzI1JIQjXBwgsS5
XkLDJIjb9TCHNCOSbEDYzcc6NYSoLMKPz6sJwb9a75aMuot2tCSzmZr9jCwzB3gP
BhnwCWbSzw4+EssbWGOU2XIPQZ3Vt9UGip5kTnQR9cBVyTsgnUq2Uh9y49NEw35f
tLJsca9hxQ+Q1rks3nLkMlUec6DDwLnbiGy+bpdodujl3/f2ihiDdnn28oN5QOw4
M2axRqfGawt3vHVAF/ZsbRarpIUD85Lw7OlssxLjLhpuxlfQlvY=
=QB2/
-----END PGP SIGNATURE-----

--RTUg0RzjFOOE7Okj--
