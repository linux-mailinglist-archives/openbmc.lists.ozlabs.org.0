Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD53048F02D
	for <lists+openbmc@lfdr.de>; Fri, 14 Jan 2022 19:53:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jb9Rj4lK4z30MF
	for <lists+openbmc@lfdr.de>; Sat, 15 Jan 2022 05:53:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=TNrQ10OS;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=i7WrATob;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=TNrQ10OS; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=i7WrATob; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jb9RJ5LNGz307j
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jan 2022 05:53:00 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 709585C0098;
 Fri, 14 Jan 2022 13:52:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 14 Jan 2022 13:52:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=7GhdTaG+vwds5L+CcHw+jigA/jS
 /b3k5PuZ761oXEMY=; b=TNrQ10OShqBOGJ0LhOPtOqc/OVyf7XR6oYJL8d+yl3K
 ecoh5aS4NSuQgkB5W9YxSz/vCkV/6J9cTBdzPMx39XttSH1EpOXkoneI+H66ECA1
 Me3mthbwaVN0oc3udGhLcuo7OoXxu+QH9B+ZxpXZirSrHLCc1GrDiAva5gaYr6i3
 BZ1Phjs9L1S11wRacDAp75vwKfE4CMUErmZSQnnom7rFWqFH98uPGfJmnd2wnRrK
 yYbpJzvEangd4dJGpTXXDkNd4Mp/8iwnHArTyp2Ri1q15CMywQKT+tqjLIe4WlhT
 RZwzvy2hXZGIa8KiRV17gGL2YdZrHw4/S+8ociNpYjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7GhdTa
 G+vwds5L+CcHw+jigA/jS/b3k5PuZ761oXEMY=; b=i7WrATobIV9tnVa38ve+eH
 xkzMcNAJxtijO97Q/D0LFo/ohPTQIWIkuDHBk+18JXunmTEbZe7FKtpUjNj+ydnR
 845CqBVXSXy5K43Yr/iKGtFqtFYvEyXEGnX0OxAuASDTqx9YeVZZRLOlvvRRE48R
 QDY+3fGNKGws6UEktALEZZQBby5/zwyWZKu83hDGcFvZ5fwJISrr9eLxF0NFapp2
 x2SFaZVufzvgkKIMU3OtkbNs1X7Q+hgi79GPxAxs0fA40eSP2wsrYiMbcpTbvPLe
 BSaQx1sh4ZjkRe0MbPXK0f+YRl5LznY2uLCZDJZ21W9QTSuWoFoVOXDS7qvAjSYg
 ==
X-ME-Sender: <xms:icbhYeIjGJIJ7EMK7gpU_i485L0Wa8ThcUZsZm8Wt2CxXBmQmXiMkg>
 <xme:icbhYWJv0jyLxS-qXDXYeTVWkwRgFPqwOwwATgh4ugSPmbleyLfLG2wV4Ps19qA9i
 f31B7vtuvIrSCjc-wA>
X-ME-Received: <xmr:icbhYevQY5fYKH9yA4UcU-Cz6fCTKEM_1lD0sH0A8dEGvj0TgR0YPpIRvTXyNSjlVcuQGlxbZ1y55eviXXXGP6Bnhel2dJZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgdduudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkfhggtggujgesghdtroertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepveehkeeigedvgeevhfdvjeeviedv
 gfegvefhvdektdejhedugeduhfetleehveetnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:isbhYTaCusoS1Cg602jM_BeRm_hIgJs8K6KScQziBAQtc_2h7H6CSA>
 <xmx:isbhYVa5cfz8RNokcjMKzlJ3Cr5CO7fhAIUn1Tmoqps36SzJVwxcjw>
 <xmx:isbhYfDJHZk3WOgpYYNRon0Jdg3eYSs-mUs4YgDHF3I6KqP93-904w>
 <xmx:isbhYUVcRAcZWGBcbHY9wnsmaDRWIU3RmNNVnmT01M5OEUjlC4JRjQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jan 2022 13:52:57 -0500 (EST)
Date: Fri, 14 Jan 2022 12:52:56 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Subject: Re: New repository request for platform specific Bridge IC code
Message-ID: <YeHGiLCArvqNCodq@heinlein>
References: <CAA7TbctqbhbfV5e-QH-QcuwgfHPVLj3z6wFAXKMo6cd-=A1ZYg@mail.gmail.com>
 <CACWQX80YTyuMYozJgpLx36X_7sbwdp2O+BGCdxJQXyMPA+VjxQ@mail.gmail.com>
 <CAA7TbcspNFo4UyfL-3iG9KWEHep4jfBhP=1U0KCegaNbvcWfmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="n9pb9nHXBNoVxIdM"
Content-Disposition: inline
In-Reply-To: <CAA7TbcspNFo4UyfL-3iG9KWEHep4jfBhP=1U0KCegaNbvcWfmw@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 velumanit@hcl.com, patrickw3@fb.com, Amithash Prasad <amithash@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--n9pb9nHXBNoVxIdM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 05, 2022 at 07:53:18PM +0530, Kumar Thangavel wrote:
> On Wed, Jan 5, 2022 at 1:20 AM Ed Tanous <ed@tanous.net> wrote:
>=20
> > On Mon, Jan 3, 2022 at 11:55 PM Kumar Thangavel
> > <kumarthangavel.hcl@gmail.com> wrote:
<<clipped>>

We are initially supporting the non-open BIC implementation that we had on
Yosemite v1,2, and 3, but we have recently started a fully open source
implementation of the BIC side of this:

    https://github.com/facebook/OpenBIC

We'd certainly be interested in collaborating if anyone else is interested =
in
designing a system using a uC like this.  Basically the BIC acts as an IO
expander for the BMC so that we can manage multiple hosts and/or accelerator
cards.

At a high-level this is similar to the PLDM subsystem.  We have some IPMB e=
vents
that the BIC push to the BMC and we already have those handled in the IPMI
handlers, but there are other parts of the design where the BMC initiates
activity.

We could certainly spread the implementation out into various repositories,
like dbus-sensors and phosphor-bmc-code-mgmt, but I suspect there are going=
 to
be challenges in a bug-free implementation in that regard.  There are cases
where asking the BIC to do one activity, such as update itself, takes offli=
ne
some other pieces of functionality, like sensors, and so there does need to=
 be
some state-awareness.  It seems less error prone to put all the various DBus
objects related to the BIC into one daemon/repository in the same manner as
PLDM is doing.


Kumar, in order to get closure on this, I think you should open an issue to
technical-oversight-forum requesting a repository.  Repository oversight is
one of the primary functions of the TOF.

--=20
Patrick Williams

--n9pb9nHXBNoVxIdM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmHhxogACgkQqwNHzC0A
wRmJDQ/9HiVd8QBylP1NR7nk1lyyhRBFk8U9m0lJ9sq348OFBdyOUO3b1UfcH3Og
WBFXW0UfR7rTxK0HWPQOxhifJFIH0Ma8oZikJllwIEopdQm3h8d6WTexYeG8wJ7n
+dkYANxGXJh2M8wO1NdY86y1mE+LK6tUkOfoZa5HvCjQNo3b7oIy0RevxPq/PbIf
MlR3HiG2yhbBHbTlMAk2GkA9+D3vo0H8pze9wrArG0MA3H8sug5fJHs/27dNgeBO
Bb2RYviEmFXmsf/BRlIJKctC/gAG8meK2mQucIpuCIGhtZoL3lCADdWC3KdW/kP/
rnHEkH/xgNI8kLi+0OtgtNbGkh+bIVCVc9dfe6Rnpy4gVP/HADlC67A8C/9r+kFM
bFhkT2unUXg20pUoAfwlFjuoak3YG597Di3pxsv9sWzSuxLnsGQ0OMcF8Q7Z+Ny9
EJTFBuqLDTNVm3WjCfRBXhvmQnJnds0AjTcEkV/r60Z+7iYfWEtH4nQ6cYJxLLkX
9DK2qP8cg9lBSoOde28DWdJwcInBZDLghdPb99Qq9nPBHtE6GoLp28mSsMUUVxr2
gEh2cKJxoNivL1GGUYwyZE81QE0WVk4fWk405Cw5+eBSlQaGUM7jqQGHG9/0p760
M0GVP8Gih82GGaMIDgZi98a/3CJTLMtsDG6BJp9W3xXxU+122qE=
=4/5I
-----END PGP SIGNATURE-----

--n9pb9nHXBNoVxIdM--
