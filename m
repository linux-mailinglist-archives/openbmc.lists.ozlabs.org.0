Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1B625B448
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 21:11:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhYSk0QRtzDqxd
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 05:11:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=q4y+nK9B; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=HKH8g92e; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhYRm2WjBzDqvT
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 05:10:26 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 83666FE6;
 Wed,  2 Sep 2020 15:10:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 02 Sep 2020 15:10:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=4DUe1Iv1cnzSW3S87D1hz9vmIvU
 HZyE0GRWncOuuG1Q=; b=q4y+nK9B7f0wlT/Q5SZgH07MvctA3uOzb+5XBw3hsZr
 uwYPKJz+LnwjzyiBHvePzeyTGtJCULNlSrhDhoY2+sJ2mMk1jAQQ3Rap5NPnNLBT
 +l5Rhtf1u5g3thC0lm8P76l05fbSwYsXsv+JgjNF4nlkPikMlCzlizu6O2O317ue
 pSfcbyNMkMgwbtdrH+eT+kFilBPRaRiUFaFqaMhyzbUQAie7thRLKhDmlAYkLXJi
 cOERt4H9soWIQBjUy8ZcE6P6xMn9Slig91cTyRLmQ7y1fbLunxzuze4KGPF2jMB3
 yYaGDQIuqijy4f5I1P4HP9fB5jZ98ucXJp4H0RhUBww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=4DUe1I
 v1cnzSW3S87D1hz9vmIvUHZyE0GRWncOuuG1Q=; b=HKH8g92eQt5t0bdDlGvR/h
 EQsn1Qg0m/wIHkJ8+yDdRRy8dMFiMXCqdvogU5LXo7TOj4RZ3/YcCI+PBKhSxmqz
 eVwcKskF9VFAGB/yoeDyVmY5RmMo51DlQHsDbEhOu53NLC0KaaS/tj0AL7J/cQvm
 8QZ8EX2XW3kkUGqKfyJMjexHbxAQK5A8UZJmUwZrs+Nz7WIYRmWWA+IMQEuO7ofJ
 EyMxwEhMXeBl8HEJ+Df+uh8FJHnYhaNpvDDO0GEkHUYiinHTND/yCbVb8S+qSNp+
 evi3IYlJ4kNpn1aDiyPmrEgrgLZGqqkBoTITxkPBS10BUN8EyJoJ4Mgk22p5l1rw
 ==
X-ME-Sender: <xms:HO5PX8ki4-sU44hrmrJNv8ZPd1jkhF2JXN53wIeDtgQ8EQ4UKUuQiw>
 <xme:HO5PX72BOCiIutd5lgjin-Q-wT5jkMM3RrgfQxpB-PM24_jjzkCkX3esaSF86gQf7
 CZak-HOQ6qL-to-3D4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefledgudefgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfdu
 hfegfefgtdehhfektdelffevkefgueffhedtieenucfkphepuddtjedrledvrdehledrud
 ejheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:HO5PX6pjO1zTCQhtP-QaPzaw5xZWbMdJFunw7OblhehbKoRzQodikw>
 <xmx:HO5PX4mXbzLtde5dnRnsipGxdTXbmqIpcDxRp7CUmLb6ivqzD1haLw>
 <xmx:HO5PX61fOHj8Vg7mUQkTRom6SPbtouwJ3MY7uirdFNxfrU_XG2Yt3Q>
 <xmx:He5PX_-qpOjMFcEXBrX35YAraFziPyK3kDX9lzepe_s694oU0HJVqQ>
Received: from localhost (mobile-107-92-59-175.mycingular.net [107.92.59.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1F40030600B4;
 Wed,  2 Sep 2020 15:10:20 -0400 (EDT)
Date: Wed, 2 Sep 2020 14:10:19 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Patrick Voelker <Patrick_Voelker@phoenix.com>
Subject: Re: When building OpenBMC . . . ?
Message-ID: <20200902191019.GY3532@heinlein>
References: <c9737b1c67174a4fa9666b1d8afde380@SCL-EXCHMB-13.phoenix.com>
 <20200901122409.GQ3532@heinlein>
 <CACWQX83AjdYMXYzsjed0p6GgEMBb18CtC9qb-9OPcU8HbzK7Bw@mail.gmail.com>
 <2249bb47512947dab406345cfee1206d@SCL-EXCHMB-13.phoenix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="npbjE3dh3wBH6WIP"
Content-Disposition: inline
In-Reply-To: <2249bb47512947dab406345cfee1206d@SCL-EXCHMB-13.phoenix.com>
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
Cc: Bruce Mitchell <Bruce_Mitchell@phoenix.com>, Ed Tanous <ed@tanous.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--npbjE3dh3wBH6WIP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2020 at 06:50:01PM +0000, Patrick Voelker wrote:
> I'm giving the first option below a try.  I've defined an alternative var=
iant and have included the meta-facebook/meta-tiogapass layer in my build.
>=20
> One problem I'm running into is that meta-tiogapass includes a rsyslog*.b=
bappend and one of the other layers I'm using also has a similar rsyslog*.b=
bappend.
>=20
> Each do an append to do_install() and each one tries to remove ${D}${sysc=
onfdir}/rsyslog.d/imjournal.conf.  Of course that file can only be removed =
once so the build fails.
>=20
> My question now, is what's the best way to work around this?  I don't nee=
d rsyslog from meta-tiogapass, just the machine specifics.

If this is a common pattern, we should try to contribute it upstream to
Yocto as a PACKAGECONFIG option.  Then we can add to the PACKAGECONFIG
in the bbappend (you can do that as many times as you want).

If we don't think Yocto would accept it, or they reject it, but it is
still something we're seeing often in our systems we can similarly add
it as a common bbappend in meta-phosphor (ideally triggered by a
PACKAGECONFIG).

--=20
Patrick Williams

--npbjE3dh3wBH6WIP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9P7hkACgkQqwNHzC0A
wRmvRhAAij1BOFjpSnI6aUYWDGM836xA9F1ebFlhlNvXm7m9ChELfREiV5mB3fXf
C0cUl/96XK+TyCBp7laRRMA6Oso4tb/7XxMzKT2yb3Ln43yFrjZzxBS+gmFGB2iD
Ya2wQsRfKHDjc0qPBt5N18XzUPcxnWL0EWNOSwwSnfbpOCxPCjKER3GddT1MOv4V
4xGLwAlC/CBv1/Up9AWGEw3LgWQgYGf65jNoCmh4o3G/ZozbgKYCHRCTkYcnvBgX
iNGF7gc5p1hcCkWJ7piQ2NECGRY0C1UQq/hkm7s4YdrnwHrRBfqCdKvF2VQMOsK3
/kgfstrek8Q8wYw7ciclMAprsXxw5BUcsewjSe5DfXZ8QZzHww5KDa2pBK52N9LM
sZVQRmWnUMjWczthMUWoqUjld3rE+KUtZe1YeK1lYMjmCig7IpOBF5IRJlRD+7sV
x1fUQFfXqlLXTHF1YWEb4nHxrq3MfWQGa6QFyqLBU3/i7IHpBpJFpQEV0SNDqxwQ
u4BxmRIkW4rOPjNuoy5HtBdPRJH8C7ia1vznTJ0Yf8OjDykw8FrqNwLaZovIVSMb
uV7XStRWhKtd0vnMEv0YmzBjN/4geVx7PEveV64dEVblUc+qzNwgQNKTmQ4kgJfc
41jNLxxdD1a5HSZAH/LMURPoJdicYyLwt512LbFoMXP8oLG/M3A=
=xn5O
-----END PGP SIGNATURE-----

--npbjE3dh3wBH6WIP--
