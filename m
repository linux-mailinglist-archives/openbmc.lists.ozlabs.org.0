Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C0C46597E
	for <lists+openbmc@lfdr.de>; Wed,  1 Dec 2021 23:50:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4DnM5LlVz3bW9
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 09:50:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=ekDX1+V0;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=L6uz/wGI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=ekDX1+V0; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=L6uz/wGI; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4Dn06x5wz2xWl
 for <openbmc@lists.ozlabs.org>; Thu,  2 Dec 2021 09:49:56 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 7D0653201DFB;
 Wed,  1 Dec 2021 17:49:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 01 Dec 2021 17:49:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=3LYwTNbUB7a0WKyRCkJbvuFNmVj
 KNLgXzj3C+fI0O28=; b=ekDX1+V0IBw/b/+DC/RWdHFXw4XzNHtU3jK08CLsBBF
 nDN5RjmVnxcEIvtykTbd3bTlfBgKnYERlvtAh1VrbHA9gRwFXRUPSBvvRLbp0HH0
 GeTIyRkSxHLDw75FBcb4Ag67nJHcjqq3KPFlPDzj5+nrVN31Iq29YGun550/A1M3
 cIZWIZ0rm4D9Udezz7yi/VnN2zI6H9baCJs2ZDGYOHpUmQc0l2k9lgHhdf6XmoSz
 V+06kaF0ZK9OWvRhw5s4bplDe+dEu+sGgct9b7GoxEEoWS/k7ubuvM5o4LTs6UX6
 9kKwosgOgjDIVFWjD2QCIDvz318KlE0ks1p/R2/JyHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=3LYwTN
 bUB7a0WKyRCkJbvuFNmVjKNLgXzj3C+fI0O28=; b=L6uz/wGIRfm9AeTZs6VL5u
 U3DhahL8J9zjUA+nsXuKTBci1T4SRA0OH6OPnopkx1vdZVCHuPnaToxUVTGvZtnG
 qrDcIRHthcnEJUW6oL+GeA39E176/58E/vqZn265aPotE6ickhEP8e2p0FPU70Be
 I/lestW1MiuISHbPCix29h2iuy9Abog/PfsMpJ66QMNndaQUC2ODgrAH/s3BhC9G
 bOR/HOAMOj9Rbocj1FMbf9dEPESS+C1ag3AIKw+fLxLwZAk8/S2ZDolt6H/qTtiK
 /K5BrHzLjSkVm06UqjZTwMW2OGQal9Wr/keMkoQsqxeWfd5qll3qqFa66EuzsOyw
 ==
X-ME-Sender: <xms:EfynYQECeDeEb8BJa5UxsC7TC4E-Zt2MTTzeoJtbNP7kZeiIjLw_Pg>
 <xme:EfynYZXcx24J4z-sWE4oQ9jAbNxQnU7OHZWgLy3Ci5OI3HGl9IRYFUwwkDHaatJR5
 OsU__kMnGwZPDltIDg>
X-ME-Received: <xmr:EfynYaIhA0LM_wfYkUSrhQurdVmaB2oBdjcny_fpUaPX5dN4to_Ym5-7nlxcXlP_FmzKyTmmAp2eGk9aJhf1fcjNA9l2hsu8M68zVg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieeggddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttdej
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeekudeutdefiefhheefheefvdejueej
 ieektdetheelvdfhleehkeegvdeiveekhfenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:EfynYSFKyK2u4XsraF7pKLYIpa-BzjNRu8BqUcHj11hlpk4A2fqZJg>
 <xmx:EfynYWX6kCGpSfYjd-xkc5VpZsM_UFYYYC3liHc0SaOnc2uFWNXVNA>
 <xmx:EfynYVP3s3ec1YDcnjLUFOwoVGtP8QGtSML0w82NUeCvJ_JOCUxcxA>
 <xmx:EfynYVTUdmbA71XZJ30MpfQ-eara8rMr0gft-z4HT4kqewxXv-spPw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Dec 2021 17:49:52 -0500 (EST)
Date: Wed, 1 Dec 2021 16:49:52 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Spencer Ku =?utf-8?B?KOWPpOS4lueRnCk=?= <Spencer.Ku@quantatw.com>
Subject: Re: Implement Ethernet Interface Properties
Message-ID: <Yaf8EOu4qSY10q87@heinlein>
References: <HK0PR04MB329947E4E37431B956A8D17AE4689@HK0PR04MB3299.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OD1T5TSEBN8ZuuhV"
Content-Disposition: inline
In-Reply-To: <HK0PR04MB329947E4E37431B956A8D17AE4689@HK0PR04MB3299.apcprd04.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Fran Hsu =?utf-8?B?KOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>,
 Litzung Chen =?utf-8?B?KOmZs+WIqeeQrik=?= <Litzung.Chen@quantatw.com>,
 Nan Zhou <nanzhou@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--OD1T5TSEBN8ZuuhV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 01, 2021 at 09:58:41AM +0000, Spencer Ku (=E5=8F=A4=E4=B8=96=E7=
=91=9C) wrote:

> For phosphor-network part, we propose to use existing tool like ipert to =
get the Ethernet BW/Drop package rate. Or the other method is that read TX/=
RX from ethernet driver (/sys/class/net/{Ethernet_Name}), then calculate th=
e BW/Drop package rate. After that, we will need to register the D-Bus inte=
rface and sync the property info to that D-Bus.

Is this something that systemd-networkd might be interested in exposing?  We
should ask this question upstream there to see if they would be interested =
in
the contribution.

I'd prefer using the sysfs interface direction rather than wrapping a tool =
in
`system()` calls. =20

Did you mean 'iperf'?  How do you get the drop rate from that?  Don't you n=
eed
another system to act as the other side of iperf?

--=20
Patrick Williams

--OD1T5TSEBN8ZuuhV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmGn/A8ACgkQqwNHzC0A
wRmPJQ/9Ho3bMrPJCnu4dKI4iwJe+lycNfGAfwMmtf8qYGYsSd4OP8ZjwexbhC3G
fg/pHsvxBjpOLMJg6fI8IvHZgFStgZOsX6TrDVjZvnnL+gYGal4Rdzzx09j/m5BC
xWreDoufC8UQTsqk4eMQqhhmJTLvXM8qjwJWzZEHmfi+iC8odmbwHHEtZqBU3l38
JY5Ba9quvtzmsXhk2u22B1ixm9PyifwBXnVEfLRrbTQhRk7ta84m+UltkwTUKf4h
P2WOG+FJJK4CPIpn38n4naxwfxJ/mYxMNXHpHRVD62wp0Ot5HlZD4AcH7m6Cc8sn
cHorasLoZjlYNA1qj7HaiWgpmTs8JhmKxr+Zl2k1GGzD1KjDsq/+kZLtw0I1ad06
/thpZtrhZ+Aj0KOe2Qgdeh9t57C3ecCAtuORvkK6snb0VQClk6NveqDN7y+wW6+H
OwF18rtjhHCp190KNDuHFXJZ4BBB9sk6Y2+M6iibFuPcYYnHCKvt7Ygr5s8632xd
r3GaszqY+BG7tUR2nPcSfJtwwS3eWGTVsDGuA3ST73KVZoLlIa6joBMQ0wH/tJGa
5CLaXGggxkxdxRdf5WoN+fT0J6JZuf8d1f2KG8FAzHuwYhWLkkcjEmEK2uLM89er
JPqIkb/qXqI6XwEeEEBzlaGwW57sSrUniM3n7uhVce/EE6WoFTw=
=UQ0k
-----END PGP SIGNATURE-----

--OD1T5TSEBN8ZuuhV--
