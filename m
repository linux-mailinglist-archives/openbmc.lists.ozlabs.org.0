Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EB5285682
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 03:52:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5clK49LKzDqGM
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 12:51:57 +1100 (AEDT)
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
 header.s=fm3 header.b=qiPFrLOT; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=aUrekmkM; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5ckS4jHLzDqC7
 for <openbmc@lists.ozlabs.org>; Wed,  7 Oct 2020 12:51:12 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4D51D5C0095;
 Tue,  6 Oct 2020 21:51:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 06 Oct 2020 21:51:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=2BFFPIZBDEVQcRQ6h+DL2Zu7i/A
 wmDq1WfbGyIOtWV4=; b=qiPFrLOTI4VUFj13pKI26bQQwyeV8flH65nA8m6tcrk
 rhNTTvNJxbBf1sTO0bQ4hNGx+HaPqgh6LghDHNeHQlvLTvFKhYHjM6J9fyjJQw6w
 f50PadfHfIheqKh64FlI+rYUw0zRrhnK0zc/zuuxJqLKRl06YElhH+o9cWAMW6W9
 EBQbq8HBwZqDJ25/gpXaBCQrK9m8+9YLQVz1G9v4oPCg5TCoSyxpiLcksP44KOet
 pTVn/ySKTY+6JxoamBHrDPoxDFJJelxPnXRFunpYx/r1z2rxzGK2c32dz2TMMglB
 gRxnx4RiQkn29F6XDZAz8OD5w6ll4EGhZCASKdDGElQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=2BFFPI
 ZBDEVQcRQ6h+DL2Zu7i/AwmDq1WfbGyIOtWV4=; b=aUrekmkM2rhgPt9MB2vPSW
 63UgRlWOX6hGiIeHHtdu49kaO1URkVOFe0QNBmKQ+g6Re/mtoloGVnl9LzLrRIGQ
 Xdyd4xzZxR7sTmZ6k0iAFKJ0iYa3ng0nPoH9YW4+hm/A+EL8QsJKlZBsrfaZGFas
 TReAmMPqJIY3IzHzQRZp9JltJn/7g4l8hY9ty0EhnBXVdLbp39pG8tKY0bj97p5v
 YfxLUErQmyB2Hsl5cJsmusGTQTpze7v8D2MSdobQqtTSUS/nT6LIoRqbXtXSpkda
 RoU18eBOKX4CtJgLlOltK05zpWud16nYAPuTwOIMKIY5Ox5NerQF3SR4Bb0HWb7g
 ==
X-ME-Sender: <xms:CR99X3QYL8EXkHK2BZ-au1_sM9PDiPR4gia7x-OCZDLtcGixu7jbaw>
 <xme:CR99X4y96_v4GdzQp9VEtdYQ7HFuBgrgEOjMI5IpYNxcpO4Npw6XqW0akQm_bxwZ9
 ZtXtww1P1Jnt0qY06A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeehgdehtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfduhfeg
 fefgtdehhfektdelffevkefgueffhedtieenucfkphepjeeirddvhedtrdekgedrvdefie
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprght
 rhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:CR99X83UGywEdd2JYlkTc_hcXZoAHo6cq5ksc3Ntds3Np9e5mK6kxg>
 <xmx:CR99X3A16QAmgce6oY2zGgchGWUyal8IxmAtknFVgweaxSZrMVO9FA>
 <xmx:CR99Xwgl0ohhiEsQqCRRd81WWXqIa0ShIUFZZfu9m8WfVXqmAGtGXg>
 <xmx:DR99XzvLCTfoYx6wX3FPQH-ZC3z8V23RmaoFXeb3GZoldPITZOZANQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1633A3280065;
 Tue,  6 Oct 2020 21:51:04 -0400 (EDT)
Date: Tue, 6 Oct 2020 20:51:03 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "P. Priyatharshan" <PriyatharshanP@hcl.com>
Subject: Re: 12v slot AC Support  in x86-power-control
Message-ID: <20201007015103.GH6152@heinlein>
References: <TY2PR04MB3311FEF038529B122E1123DECA0D0@TY2PR04MB3311.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3LDjyuwMyYgFmzqN"
Content-Disposition: inline
In-Reply-To: <TY2PR04MB3311FEF038529B122E1123DECA0D0@TY2PR04MB3311.apcprd04.prod.outlook.com>
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
 "ed@tanous.net" <ed@tanous.net>, "Velumani T-ERS, HCLTech" <velumanit@hcl.com>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--3LDjyuwMyYgFmzqN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 06, 2020 at 04:43:27PM +0000, P. Priyatharshan wrote:
> Hi Vijay,
>=20
> I am working on a patch to support  12v slot AC cycle in x86-power-contro=
l.This can be enabled by configuring slotACPowerName in json config file.Si=
nce you are also working on similar kind of feature in x86-power-control, I=
 would like bring up this discussion on mailing list to understand how thes=
e two features, and the design you proposed for chassis reset are intended =
to work together.Kindly go through my design changes below and share your t=
houghts.

Can you expand on what a "12v slot AC cycle" means?  I can't decipher
it.

Vijay was working on a complete power cycle of the entire server, as if
it were unplugged and plugged back in.  This was done as a different
object (chassis_system0) from the object representing the host (chassis0).

The chassis0 typically models the power rails that drive the host
processor.  The power cycle of those is already the primary feature of
x86-power-control.  Can you expand on what the differences are with the
system you're working on?

--=20
Patrick Williams

--3LDjyuwMyYgFmzqN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl99HwcACgkQqwNHzC0A
wRnQFQ/7BK4Dfx1v4V4HnW89a1AEtdpSWlKpH4bFGEg9jU8UjguN7xq54MEzKJwA
LzgOt4qPNBmOQ0Beq89wIkroinB4jnl70ZN7VQd0osK0tzbnM6ylRnJ5C2CqMSst
v8xrMeE1Ty0cAEJ4nhH+Zs9SkcGjCWjjnHs5ZutF/BLbB7Y1V6EDqt71pHKnYl3j
BeqIbE6kA8U+r4wUXzqrGE8nL/V8jrN5kMLzkKQkarV+uklLF+Z8UEH+y8mbkN4d
2ooqyuepV/G5Ze3OI57/tDiwqKIQHK2CnQxjfa52POyo58NiVWqzduXvA6M05i8i
GhT9icUieqiYxUtAPuhr9WfNgvbmcwQYaVFhAF2EpIBOFkIRJ2UP0yO6yd3KgZRw
R+kdhwB0z1cZtr9gd6qfHua3dKsalxH9bxnRIAiuUA2sDksNJAOyVJS9BnRCZaLg
vYuUNX5wDj4q+iAv8kwWdDLRLzeRqemQIb5gNSWjfyGZLZM+yKspXBuxYoYWAmrq
hNwToA8IsZNModkX4OGg5s7shdLsvLHGo7/FDqDq12x/UELw7sUlBSELQ3zU1yIL
V72lipDliGU2+RrUBO1J6BZuKo/D7VYGJ8g9ETHCjz6C20Ejq37pw88X5/KXnycn
dcl5DRhwKnLo0X/UgA915xCwPnG58IdxYUaBLM4Va+VfFF4nPLU=
=vN4t
-----END PGP SIGNATURE-----

--3LDjyuwMyYgFmzqN--
