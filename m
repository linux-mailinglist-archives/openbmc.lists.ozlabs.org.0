Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ADE4686B4
	for <lists+openbmc@lfdr.de>; Sat,  4 Dec 2021 18:41:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J5xnQ0YKVz2yPs
	for <lists+openbmc@lfdr.de>; Sun,  5 Dec 2021 04:41:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=j2k/cIq9;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=KY0M2wwP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=j2k/cIq9; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=KY0M2wwP; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J5xmx5LYMz2yJv
 for <openbmc@lists.ozlabs.org>; Sun,  5 Dec 2021 04:40:48 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 661E73200B23;
 Sat,  4 Dec 2021 12:40:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sat, 04 Dec 2021 12:40:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=q5bc8X7qxvPClHyyCR5WeEeYNZq
 wQr4iIBu2icmGFiE=; b=j2k/cIq9uUUjrXwnBAXZe3DHNt2nr2Ga2ob/D21uCn1
 G6CVpvsWWJ3r+EI+t10Ks/yy8mc7plz3c/Uyqi0rOE64KBF0p24dEeImcFRwHYxN
 oo+oxKL3+WZ2miyFA8I5R3KMAHtRwJj5WUiEypKDEwphXESNmiL3ArBjt05p9t+p
 ptD+brqRFQh4OtYZNl8G9xShHr9hBzJ7PcRx3dp5E0ia7f3LVsMwu+WR577T7cXC
 82c6hRAfmgyPvONkgn0/TDo4cSdfT4gn9dZ1gfs0u5Pfx/T5DhzISNNXrvBMA8Rw
 fBgo43GLMiY7mJo+9aQKora45jW65qw6tnVE25zOr8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=q5bc8X
 7qxvPClHyyCR5WeEeYNZqwQr4iIBu2icmGFiE=; b=KY0M2wwPW0Qo+lHayqi5oP
 /vR/xA7GRrE0dZ57xYOHiTPH3t3ZXNWgQegmcrk4jho3OogHbr7EETlzJAr0bN+Y
 ryYAUhu7MtFtwuLiBtsnOLM3DmQrW/jGTJBS7bWhJIm/QBkqH1ISWMqz5okuIxD1
 ANJ0hpdVaBUx2z0k8qwjltiFgavtJoMG37Tw5TW0gIr+l5mtVzHIVGJ5YuE0lvQg
 rAKFJKQj7EuaKCnPnMz1Wr3nzOegDnQKFoeRXRqY9m2UQ5ou6xDCt8WUZIEew6c+
 /NQcRFpviIknjdM85nKLuDU/TvVoOZHuMa3ssubQ/EBXG37sgLnv9btz18laJgRQ
 ==
X-ME-Sender: <xms:HKirYcFm0DYs8EFl8RKoIEilgtQ5E-L5wTwIvh6Q5h5yCICzCRi_UQ>
 <xme:HKirYVVC7_L7c26hWkpZEnQLBf7OVhikOnzPZLhpo6v9Tr417tnNClJY0WYOoi3xW
 bduxVKgqs3kLwjV88g>
X-ME-Received: <xmr:HKirYWL0MzmSt_TI0897387lj-dhD5C6rlnil1GoIF4VZPuLBZUbo0C-kIpP46sljxFuvtIu2NDv0wUgUSjxEXEZV-ZF2QG3fvkZrd9F6hW7hA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieelgddutdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epgeehheefffegkeevhedthffgudfhgeefgfdthefhkedtleffveekgfeuffehtdeinecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrih
 gtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:HKirYeGF6pOd7p5ow5JQbPndHC-KjYPA3_Tiun7sDH95V6E7efg2zw>
 <xmx:HKirYSXr0nRf4h2ak25CYaeQS6DqxNKytj-mPL2Brs2RCDtZR93vtw>
 <xmx:HKirYRP5E5qffQ_eFdykTlW-W7Fnp7p9jSr_auPzENkWC9iR-laXcw>
 <xmx:HKirYbd78vz2xdJPZU37qjePbuOa3wfmJ9lByP4Gwa_AimijFPwb-w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 4 Dec 2021 12:40:44 -0500 (EST)
Date: Sat, 4 Dec 2021 11:40:43 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Kun Zhao <zkxz@hotmail.com>
Subject: Re: Any cmdline tools to modify DBus
Message-ID: <YauoG2/JyAeyqT1z@heinlein>
References: <SJ0PR14MB48051F038B0094EDF6662CCDDC6A9@SJ0PR14MB4805.namprd14.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NFHtkjF9P/zAqTh9"
Content-Disposition: inline
In-Reply-To: <SJ0PR14MB48051F038B0094EDF6662CCDDC6A9@SJ0PR14MB4805.namprd14.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--NFHtkjF9P/zAqTh9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 03, 2021 at 06:31:44PM +0000, Kun Zhao wrote:
> Is there any cmd to create/delete interface/property of existing DBus obj=
ects created by other services? Looking for an easier way to quickly do it =
for debugging in early development phase without coding.
> Please advise.

I don't know of anything at this time.

Once I add the client bindings in sdbusplus, I considered it would be fairly
easy to write a small CLI that allowed interrogation of the dbus objects in=
 a
friendlier way.  We could also allow that to use the server bindings to cre=
ate
simple test executables.

--=20
Patrick Williams

--NFHtkjF9P/zAqTh9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmGrqBgACgkQqwNHzC0A
wRlQpRAAl5SxwfFhzrCzthvfW4rHDh8tDlx2bEGhxmdiYBwCkhkdcMDK2LUL84ua
J1JmY1ZdhVqwAdemhrgSC0EbX57hHb4tfxIem1ZxETNr82/gGtgfdWmaH0Thj649
ejlPERzUGBLY7INPYaVvdfuko2bHkdRTLAwZhIcSMhAK4JTEedGoUFWYswCQanfJ
GqrKD099lBzHAQphgbQ7uoYfQnMCW4RoHkOZJIYqQSR4Ty8a33SHuT2ZcllajF/Z
sF8wHLxXw2cUusk35+xUsoMDzIjbXvO/ORB+o9fENhgBn+6nW++pIqZlu5Wpa8lS
p5DnPZ3xtruyKmdYNbAu86fYZAqhCTWYvl3xQEPwA2LUV00LPmFhMydOyJ2C1sAH
+giUtPy8HWlsqYb+mn7LDXKiZncbWa4guQ4Ye8nhxaKtkl3jkblWgvAUSkAAhNl7
04aRxNbkElE8kA/VFvfjjHmrrR+zLpPjSLA4BL0Y+ZY9xLtAp011TJcZ2sVk7g2w
xq8euCxiXPVmV01mmURi3GaNRukvrnAbS4AWbxJHHlhZFT3H+w9Dw3HM+/ue1FOq
dRo44oyMw7xWlxSt4foAZ23cjfLmql8xIg90oER20r0R5VgcKvoGtav3FrjffP8H
Byqe7z1RHQKfYiBn4ZgtnIcIbO4/uFozIfaKbkJOdNXL5cZS71M=
=Sh+D
-----END PGP SIGNATURE-----

--NFHtkjF9P/zAqTh9--
