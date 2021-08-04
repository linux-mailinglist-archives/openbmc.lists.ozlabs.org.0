Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE123DF9E4
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 05:04:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gfc6S07xyz3cHv
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 13:04:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=hzfOXHxG;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=GxjLHuhY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=hzfOXHxG; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=GxjLHuhY; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gfc651Z7Nz30Br
 for <openbmc@lists.ozlabs.org>; Wed,  4 Aug 2021 13:04:28 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 2BBE35C0117;
 Tue,  3 Aug 2021 23:04:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 03 Aug 2021 23:04:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=GVudGM4iPUcwfa4eeJUHdddIIoX
 tsEWVo1an9cNICKU=; b=hzfOXHxGeZ8MP3m/Kbjmot8XVsK9HE4RMgt7EoqALNq
 kO3tZELhUOWmc8dVtFc1kpWCVerHkGpsSx6rBFyhMbxDIdU3gsAcQo0iXn0OKcrg
 TiGzSh0758UEqop8uWDUiPAwPdhbozkGZMO2Nm9/HZQy+cVrfXqUxO/IDPD7cXVG
 BkESKhriVxFWGgNIUcC589Vb+cukd+7FtOoKDwiOsWQOE21Kf4C4m8UAhJhIHcio
 M+3jPCx9qWZ5UQa9mkzGKUfUS9o3weymhwSLZAZATTWF3mnNv08c6cSxWdgCBB/W
 PWsvHemKA2ElF4tcM1QJ2S9Y1kKubnrO2iDhAMbb33g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=GVudGM
 4iPUcwfa4eeJUHdddIIoXtsEWVo1an9cNICKU=; b=GxjLHuhY2JtkO95V/AMEWo
 OkmLATkhitQu9mF/xrED4kfVsTo3I3Lc9FwWQu9L+bT2ikycPl3hvkjXCeLYcu4M
 6EtnTWvbXxC0BWCJ9xfDcqh4S3F2y3xTNBBaD8hh9pxy+qH33zqPzNm0dieSeUFo
 BN6VLecNpJYOVMpHMBGgcOk6dlO90W4QXOJtK4KlJ/bcH81qkQyA0GKVGSkRA3AI
 1/WKLJzeTymk9a4wUoSRPzPBotdY4gWwtWEHIUWTVSRGyjvFhyWM3cCvx76Omm3u
 WqKmLbrsCWz0sXwlqNvCBWyD1eA+Pfjs7w7LLZFSMjCmQD72bAMadx+9xf9U6UPA
 ==
X-ME-Sender: <xms:twMKYXTLWBO5Y3W39CZA9ZeVOMGMlQ5qxAlKyd-0PJA0SeLTvqXjcQ>
 <xme:twMKYYz0fnJACjxh8PgvHBwMraxN_WB579DmSLKik7W8eo1u9I38heJB_uBoQo5bB
 08Hcr2h4AWfVO8d_ww>
X-ME-Received: <xmr:twMKYc0_NKCiEbO05_hVr--_XoLg74DOz2mjTq4BsIb2Wx2Pme6MaC7eNORLzM7fgslRc9m6Pny_gAk-wNxPhifQDfdP_DgshG4xmWztVkRGQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieehgdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdduvddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttdej
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeetgffhueeuveekveekudduffekieeu
 keejueffgfdtkedtuedvffeuvdduiefhjeenucffohhmrghinhepnhhishhtrdhgohhvpd
 hofigrshhprdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpghhithhhuhgsrdgt
 ohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepph
 grthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:twMKYXDEcAOyTliz63K0O8SI_WNMRz0enUjqirs5yTrgeFIMaOeQlQ>
 <xmx:twMKYQgIBDss7svtMYlQjoO6IHxVbNyr2NHutgycjf_2etBecrFbYA>
 <xmx:twMKYbo3NZhy6WSOlDY6ehpSJpyIJx4l5CMbAcNCT_GJuj-kig3lJg>
 <xmx:uAMKYYKpSs7Eu7ZsxYUT__UAW500kA7NUOuJ39gERa9q0uQeikHylw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Aug 2021 23:04:23 -0400 (EDT)
Date: Tue, 3 Aug 2021 22:04:21 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Security Working Group meeting - Wednesday August 4
Message-ID: <YQoDtQh0xjsMBWps@heinlein>
References: <89b3524f-a1b3-513c-fc6a-1d888e479238@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RkA+RPwcch/GqHNU"
Content-Disposition: inline
In-Reply-To: <89b3524f-a1b3-513c-fc6a-1d888e479238@linux.ibm.com>
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


--RkA+RPwcch/GqHNU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 03, 2021 at 05:57:52PM -0500, Joseph Reynolds wrote:

>  3. (Joseph): Change the SSH server per-session idle timeout to an hour
>     (was unlimited)?=C2=A0 (Sent idea to upstream project
>     yocto-security@yoctoproject.org
>     <mailto:yocto-security@yoctoproject.org>.)=C2=A0 Alternatively, update
>     both SSH and BMCWeb to 30 minutes.

Facebook has had this implemented in our BMC for a long time.  We use to
have to patch SSH but that stopped working and we ended up using the TMOUT
variable.  Relevant commits are [1,2].

>      1. Guidelines:
>          1. NIST SP800-63B requires a timeout of 30 minutes for
>             "assurance level 2" (high confidence that the authentication
>             is still valid), or 15 minutes for "assurance level 2" (very
>             high confidence).
>             https://pages.nist.gov/800-63-3/sp800-63b.html
>             <https://pages.nist.gov/800-63-3/sp800-63b.html>
>          2. OWASP suggests idle timeouts of 15-30 minutes.
>             https://cheatsheetseries.owasp.org/cheatsheets/Session_Manage=
ment_Cheat_Sheet.html#session-expiration
>             <https://cheatsheetseries.owasp.org/cheatsheets/Session_Manag=
ement_Cheat_Sheet.html#session-expiration>

15 minutes seems more than enough to me.  We have ours set to 5 minutes on =
the
console and 30 minutes on the SSH, but I think those are relatively arbitra=
ry.
Ideally whatever you implement can be configured with a Yocto variable so if
someone feels your choice is "wrong" they can easily override it in their o=
wn
machine.

>      2. Alternatively, use the bash shell=E2=80=99s TMOUT variable?

Whatever you do, I think you need to take into account the serial console as
well.  Not just SSH.

>      3. See Yocto discussion (representative archived email):
>         https://lists.yoctoproject.org/g/yocto-security/message/381
>         <https://lists.yoctoproject.org/g/yocto-security/message/381>

I agree with Richard even in the context of OpenBMC itself:

   > There is never going to be one "right" solution for everyone but=20
   > making it easy/clear for users to do it would be ideal (which includes
   > making it easy for OpenBMC to configure what they need).

Whatever you pick someone is going to argue it is wrong.

1. https://github.com/facebook/openbmc/commit/8171ad7183269e3050f7f37b9b395=
6ce54b0ee87
2. https://github.com/facebook/openbmc/commit/59d7b23a9c2aa08efde19f913df44=
6a82e1f6804

--=20
Patrick Williams

--RkA+RPwcch/GqHNU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmEKA7MACgkQqwNHzC0A
wRnNYA//UNmOEWiOyAXWmMB/5OkUb6fO6KJakqzcfJJkB9Da8hJRxAD5I91dQdNr
gYITHCRCcpYXFLzcWr6vpspnL7683kyORI6SoMpHskbPJSQs8+iYspj5x0JX43fg
Ezo4ou9/EpltYf4qNQHCmVOMJ+TXd9V8/yhmn7s4pXLopHGNR0mtq59xBivZNC1W
QZi5OuGcRQZkxxqfZYuVsxbdpKQzn7cW881nlqsBwLI9izywPEzKkox6+7yoaO4+
wgg1zdeQ+G56FzQfIBH0EU0ICCnlBBlIdBRd5WCcucoKdfHleuRiHOtS5tmgv938
ZnQvGutAwQqEbx5g+K5QTDWB+HShvtqUZ67TqqEt5oJSpzvDwDwNQPsTXxM1jxv2
daXDPqYvCAJymm58F9sjIzr6sngdZGc9UjSO0hLECOQApTlVUnaYP7FS19nGlFoV
Oghy1C3yDoNEluGpjDRIN9qSIF2Nqza06J0K39StSG6Tg7loi3q8w6a65hDExl+8
s0+ZDlafxyoyxON7jMXopPhUQW+U9s77oCTaWMds7HWPcW+PwUZX/FIaTPbv9pN/
NWuj94ruI5JXrEKEhfewaMld1x+hyvVZj2+hY8St0ubz0934JCmhujGwUkDI/JY/
ZYBkbegEWfJ4IKZ0V47q78DH0eV1TKFZ4MvEHO7wj40/GwPNW4I=
=4dNX
-----END PGP SIGNATURE-----

--RkA+RPwcch/GqHNU--
