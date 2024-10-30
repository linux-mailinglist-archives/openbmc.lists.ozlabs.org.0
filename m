Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8EE9B6C4E
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2024 19:49:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xdx4f5cscz3c0n
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2024 05:49:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.159
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730314175;
	cv=none; b=QoJhad3HI4XN53NL+dK4ZOuwIOSjR0iQOPfjFkknJCHJc7fT6BWJgnwYzvrRR3lWoiYSiQSTvflSvr4LvNPQLpIg2C9ek9iJrWnNzwpUa5w1TBWEKMRTf/jQifTjrTshyx9EuB4qtznMjN9RCt0D1JtuL3Xph2Sbt/BUC7PvjxslRKCNyrcwX4Mmo4objUMj4Wpfiw3hZ25QhAnJeBtIU7fbf3H6Kdkc7i7BM8r1bsq+RgQLnAVl2bdSXv8OYpwyK87ACjgQqxtVLucq+odz5p3tD86XccLcmrTtbHuH6+O9Q5v/KP2Ze0cYwKe6Z5fbMRqTQ870jHKV2moQhmySig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730314175; c=relaxed/relaxed;
	bh=0ybMhg++CqkYlkbr7TS7eu3+iIdsDlzOQ5AhPSIInFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ihfaf5GJdFvuGDLFXCDBu/oN+72dYiK3wM9sCJZqpjxYgX4PtFuP5Q173eMccHqq1n0Cw0puSdz3lNWy8zBkstboDoLE1/uHd+SSn0q4+e4568jdVBKPaKLIzhhqUlFMP7t00Fgd34t2zRyHGHB8EiCkykpAv/rwyE1Up1KC7N1twwbHbEGKVQPboXif5IweoUgGe5a0SsG49wLQKKAeBN1+oIu0it+Zt3gKF8gbLc7zIm2U3II3/UdgFWj1KUymfNMnzVFF+v/Dn466B15J7A1XU2xG1+HZLeGWIfaNfLiBgmF4GdIqOmynZcqA4BFeglj7VO27FL70n8T/6+3kww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=VG2OFvSY; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Nw4lR4WX; dkim-atps=neutral; spf=pass (client-ip=103.168.172.159; helo=fhigh-a8-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=VG2OFvSY;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Nw4lR4WX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.159; helo=fhigh-a8-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xdx4V3PdQz2xWZ
	for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2024 05:49:28 +1100 (AEDT)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 9D86911401CB;
	Wed, 30 Oct 2024 14:49:25 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Wed, 30 Oct 2024 14:49:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1730314165; x=1730400565; bh=0ybMhg++Cq
	kYlkbr7TS7eu3+iIdsDlzOQ5AhPSIInFE=; b=VG2OFvSYbEcSk7nPJWkqLzqBBR
	YM4XAbytPj2IeBeruOPB5JG3aAzOuIqrHVSUlzgDHQaBKm9ujE6Ex3yT45KxIa0k
	eJqKbW3yrgn7D57xLBW+zen75ZZjJgOamPJI4J/lstZViP1PLjC3dwFMJSLJ7FB3
	363p0IUpAqeG21Ql/EzmBrf5Xsx/3zJVf2JG1LpDMmsqPHYaU6Hk0Q7Wn57fTVX4
	KhnjzZvSKXhWS8dcAc8MsVR199psLv16OFm0sGc53IE5IwfIwjOMkiKoTAX4rrkM
	BE/6x4/dGd5+w1rrdZSo9U+Hiai9wiVBizwDXyfPC51sx8MTdNk5CKCgq8qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1730314165; x=1730400565; bh=0ybMhg++CqkYlkbr7TS7eu3+iIdsDlzOQ5A
	hPSIInFE=; b=Nw4lR4WXVcBpfUHbEmtTPnHvzZnBRoNIrpYFeVExd3MeNyiz6c4
	5KkLag7h1oxqKiz8b5zghQNmHu8EuT3k3w/CJe+kB7TF1sI0i/8ZftXU5uErvwqu
	GDrhX9jTUxMy3GSX6zYww+B6ZTaUMqHYarKg7JwuOFZxTMKe9AL33iX+HkSgSxP2
	tYSlSn5s0Jx0WZhTOkcHlk9MAWmHMeuhlfB+dPRDTm41HmW3KbUgAwzfUstPdVSW
	w6gx/QKCwuUA9DyHomF5rEJZxFz1ZPzCr0CEAPR2Q+ov0DzPIASCmL0MjrQlgOsK
	lfMp0IPWFtbKYzd1K31mKNHvlbui25yRYhA==
X-ME-Sender: <xms:tH8iZ3iCaod2vbdovl3kpMecetCA3GWgnbPl2VL_UGDS44a9-BsSjQ>
    <xme:tH8iZ0B5J_gRaQxfPs4mCzyPHmTRywyK6Zi95TKX94x-WcQ_Q2VNnF5xnRkQKmK8J
    LJioDsLzICrm0SrdGU>
X-ME-Received: <xmr:tH8iZ3F4Hl433TPwhHwZFtNBJhOsAj6bET9MrQeO7EgpjnfNdefQBT_1p7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekfedgudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculd
    dvfedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhep
    rfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihii
    eqnecuggftrfgrthhtvghrnhephfejffevteejgfdtkeffffettdegffdtgefftdelkeeh
    leehgeekffdtfefgvefhnecuffhomhgrihhnpehophgvnhgsmhgtpghprhhojhgvtghtrd
    hsohhfthifrghrvgdpohhpvghnsghmtgdrohhrghenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiiipd
    hnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeihuhhl
    vghirdhshhessgihthgvuggrnhgtvgdrtghomhdprhgtphhtthhopehophgvnhgsmhgtse
    hlihhsthhsrdhoiihlrggsshdrohhrgh
X-ME-Proxy: <xmx:tH8iZ0Q6Pr4Nb0jvWoY9P_VUKznRNP7CDwzCT0UF52kPEJjOVQVXgw>
    <xmx:tH8iZ0yry9O9wmEYvt09DPbISfEpcvpkaD4QFnXzLVvM65MlS0hLLQ>
    <xmx:tH8iZ67TlHzubg-moJc1SkmFEtDzXHHg-EipNLEgALCl2N3yE2JLnQ>
    <xmx:tH8iZ5wGkjw3CeZZoj6j1H6qCJAz7ecmw-OlgqKp5z1Syapt-psFtQ>
    <xmx:tX8iZ_9VbH-rXNiUWMrqHt7pY5nxnJF3ZPI3x0B115OSrrlY8mTFflt8>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Oct 2024 14:49:24 -0400 (EDT)
Date: Wed, 30 Oct 2024 14:49:23 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: Lei Yu <yulei.sh@bytedance.com>
Subject: Re: mapper: should it add "default interfaces" and is it valid to
 implement no interfaces on an object?
Message-ID: <ZyJ_s_neyNkWAC2m@heinlein.vulture-banana.ts.net>
References: <CAGm54UE4SXfY30oUrr9vVa+=j_Ra971A7ZcBMyMN2TgTaXN8+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nxYrMhgv6GdtKF0j"
Content-Disposition: inline
In-Reply-To: <CAGm54UE4SXfY30oUrr9vVa+=j_Ra971A7ZcBMyMN2TgTaXN8+w@mail.gmail.com>
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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


--nxYrMhgv6GdtKF0j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 03:00:01PM +0800, Lei Yu wrote:
> ```
> # busctl -j call xyz.openbmc_project.ObjectMapper
> /xyz/openbmc_project/object_mapper xyz.openbmc_project.ObjectMapper
> GetObject sas /xyz/openbmc_project/software/c172a378 0
> {
>         "type" : "a{sas}",
>         "data" : [
>                 {
>                         "xyz.openbmc_project.ObjectMapper" : [
>                                 "org.freedesktop.DBus.Introspectable",
>                                 "org.freedesktop.DBus.Peer",
>                                 "org.freedesktop.DBus.Properties"
>                         ],
>                         "xyz.openbmc_project.Software.BMC.Updater" : [
>                                 "org.freedesktop.DBus.Introspectable",
>                                 "org.freedesktop.DBus.Peer",
>                                 "org.freedesktop.DBus.Properties",
>                                 "xyz.openbmc_project.Association.Definiti=
ons",
>                                 ...
>                         ]
>                 }
>         ]
> }
> ```
>=20
> If we introduce the change in
> https://gerrit.openbmc.org/c/openbmc/phosphor-objmgr/+/74832, the
> above command will get this result:
> ```
> # busctl -j call xyz.openbmc_project.ObjectMapper
> /xyz/openbmc_project/object_mapper xyz.openbmc_project.ObjectMapper
> GetObject sas /xyz/openbmc_project/software/c172a378 0
> {
>         "type" : "a{sas}",
>         "data" : [
>                 {
>                         "xyz.openbmc_project.ObjectMapper" : [],
>                         "xyz.openbmc_project.Software.BMC.Updater" : [
>                                 "org.freedesktop.DBus.Introspectable",
>                                 "org.freedesktop.DBus.Peer",
>                                 "org.freedesktop.DBus.Properties",
>                                 "xyz.openbmc_project.Association.Definiti=
ons",
>                                 ...
>                         ]
>                 }
>         ]
> }
> ```
>=20
> Note that it indicates that `xyz.openbmc_project.ObjectMapper` service
> implements **NO** interface on the object.

This is very strange.  I don't know why mapper would be creating
these interfaces on objects that don't exist.  It would be reasonable to
create these on the association objects, since those are actually being
created by mapper.

Why is mapper creating interfaces anywhere except where the association
itself lives?  I don't think deleting the "DefaultInterfaces" is
necessarily appropriate because those interfaces _should_ be created on
the association leaf, but elsewhere in the hierarchy they don't belong.

On my system if I introspect the `/xyz/openbmc_project/software/XXXX` in
mapper, I see only the 3 `org.freedesktop.DBus` interfaces.  If I
introspect the `/xyz/openbmc_project/software/XXXX/software_version` I
see those 3 plus an `xyz.openbmc_project.Assocation` interface.  Only
the `.../software_version` one should have the `org.freedesktop.DBus`
interfaces.

What I don't know is if this code you've changed is where those
interfaces are created (probably not).  So your change might not be
appropriate for solving the underlying issue, which is that we have
interfaces that don't belong being created on dbus independent from the
mapper response.

--=20
Patrick Williams

--nxYrMhgv6GdtKF0j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmcif7EACgkQqwNHzC0A
wRnItg//cnQ4NyCMGbh00KlPqv0Z10fYz9gt9LCFdCfl7eeWXJPnlMXwl5VPWhYb
S8DmKzh8pugmWAORCWHGk5NeQiAYhjFXwmHLFUcv3EruxKYvCPnXeTr+clD+arjR
UEbjFSBh2h7fWcbbxvJ5tOLQEVVyit1FXJj3t2+mAK0rKR19kKFTad22M9aPU8Uq
u+3npe53QLoJmhjxgLDo5Sh8/16XDpRSWBpc7SvUq5VxJ6Fz6Ta8BcjvLacQsFG7
4YtHL8QC0tG1eQOUPPL8eFppTrEnocKcK7RZmRSa2g1kENUkRFRtD+4lgBPDOwfs
keewHESxSxuJgM4lStbkgMh2VBoBvgx2HoPP9rMuYR3cj1Z+qCF2sC3CBKTZeMi/
wLS4VD9H0qUPLSjnZOdRcxtkE4hdAk/7gh+O7s2aTDM7G4Bvaady50Uu8dqTOUGg
+dPpe0QXirm9kJ48G0OCl+0J7Zt7zgbPS4ig4oDXxNaeqU57RZVf+ss0URO+GuiB
Ll18tmYSgG4A3b72CyyPMwBtK0l0eOsgBUy2T7xqzVQQDLWX4B/M2HlIYi1m+q7N
OaJn74kdGsmw4gtxu0phYe87YEqkUfByWbNeWdTtbeePbKtFy5LNzwh0urx7pFE2
okvfxT4izQfq5GjoRj0g9x3OvRy7GZUwgV9H/ZmbNE9fIZbFV7Q=
=febS
-----END PGP SIGNATURE-----

--nxYrMhgv6GdtKF0j--
