Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BE41CDE06
	for <lists+openbmc@lfdr.de>; Mon, 11 May 2020 17:01:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LPKc6RPVzDr6L
	for <lists+openbmc@lfdr.de>; Tue, 12 May 2020 01:01:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=EKOaTGDu; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=bNvDCbPt; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LLmj1qXszDqML
 for <openbmc@lists.ozlabs.org>; Mon, 11 May 2020 23:06:45 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id ABF7B4BE;
 Mon, 11 May 2020 09:06:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 11 May 2020 09:06:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=TTa5rNmKzJMHDp289qUff347roZ
 P10VG2BaBriY2rjM=; b=EKOaTGDu5QHKto/qtixwyUPUN615oHghc0GG2Yif4OU
 i3JkTni1SLC3IK1gzZbvGa1J+Ft5fMm+mZ2EGYEg9sqJKNci9l/JmiGl0l0/i32F
 a0lrIb1MByZFxMkzkxwJriBbE1flp9GagyI8UPBUN7WkDH/IviOfCTSuIm+3qq2Z
 CG2vg5h0eCWgejC3+Vif5qXXCYntAlNUwFAa19vxVimXFjgnX+mOnkFTWbS8EMle
 6rhKoYMRsDT7ldh89kTITbfw2S9qgAS0y9Dd+kfseJDZcg0yG9rV4yoMNsZyqR7Q
 uMwfcMTDdB1P3v7IdDP+bgF+EI44iJGcFGBGia1aCbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=TTa5rN
 mKzJMHDp289qUff347roZP10VG2BaBriY2rjM=; b=bNvDCbPtyPSpxmOXaCE2SM
 8qvvnhUm7mpSDM71VDm2oIBYsUhOVSrwYW3I00O6im9uCMhQ2jEO5OAgt3Cit7f+
 BhJOsHn21iqgY0J6ePRtfdba0IIjsaQNc09qX2Lii0jLubA7GRGb8aG6gjdgKCWS
 vvWXULdF0ep+yBvdr/g7lBOzh9uNh2KVFaIXEn8EYn9LDoYHZs/NSmeIRP6YjwvM
 +Gn2ALS+uiZLhbJDnNMIcqW+gFI5PEZPGqLYutPfz+TkIDwQ9NYadehkXAjQS7K8
 CCKXKj/ioP1sUFi8r0O4PgHXTZ/aVLh0PSakGUaOp3Qs2eS0yd46E8nkLteemxdg
 ==
X-ME-Sender: <xms:4k25XoGoxgXG63WqVQPK_108WBgUeNBshugBcoEaQjksGmDz6Ra3Fw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrledtgdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeduudefleeuhefhleehjeejgfeujeeh
 hfdtledufeehkeduudevkeeiuddugfegkeenucffohhmrghinhepohhpvghnsghmtgdqph
 hrohhjvggtthdrgiihiienucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsth
 iftgigrdighiii
X-ME-Proxy: <xmx:4k25XsTDFbU9OSWwHeepAUk2JRe7voxGgewNszviSPi0Z-JzgHDDuw>
 <xmx:4k25XhLp3iY1kc8Gf3Ge0g9PIEv1QR75MgJO7XLE3LGR5oQtabXNxg>
 <xmx:4k25XvZstUk3j6pZoI4Y2Bbsjr3jf0ruzPTzJLt-z40DbAo_OHsjSw>
 <xmx:4k25XtMNdy19AC0_y6jfPPcE14E9tsiLTAHbXHjRdGL6H9s2P9iqiQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id D3E5C3066286;
 Mon, 11 May 2020 09:06:41 -0400 (EDT)
Date: Mon, 11 May 2020 08:06:40 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: phosphor-health-monitor repo
Message-ID: <20200511130640.GE10214@heinlein>
References: <13E6D0A2-69B1-4F89-92FA-F0A234682B28@fb.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ILuaRSyQpoVaJ1HG"
Content-Disposition: inline
In-Reply-To: <13E6D0A2-69B1-4F89-92FA-F0A234682B28@fb.com>
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ILuaRSyQpoVaJ1HG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 07, 2020 at 01:23:54AM +0000, Vijay Khemka wrote:
> Hi Brad,
> Can you please create a new repo for phosphor-health-monitor.
>=20
> Regards
> -Vijay

For clarification, this repository seems to be an implementation of this
proposed design [1], correct?

1. https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/31957=20

--=20
Patrick Williams

--ILuaRSyQpoVaJ1HG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl65TeAACgkQqwNHzC0A
wRkWXQ//VCia9ID/qeeRfyt7kS7xBfoj9RBTCdIVKRSQKsfKj4iHf+4pnr5XS2zA
xoyFDKj/UQ09CkRLzkvkO8Me+74AQLxYAVN85JkRaljLfQlynGZGwCZmYVsXK9J1
V56BSf+OPbNfQy2hFfkfonE/eRgAsX1UHB6Q341QT+sZXsiSxU/4S2ibidB1dTzO
pp3QEpryXLImUu0a8mYRl7cBwRzcYQFoBLfiTHOXhRvUb6Y+tCfTI3bBYJ9EnRJA
jOSe1hjDNLnGWHk2xst7B8FJcdGQAyjHJh/uMfzFbA2jBVE8B5D82nwSbFtLfEP3
fIJFyO2+IEh3ezwUkP6ess5XM4c7GWk2zznrr59p1/Y8RzzTGCNebVtYI/6c3+nF
lMwrol5jjiook9XfXy9H+N4D72HhWw1UcGjc0wkGUbGmAoqu23Qn7KG1wAg+rR+A
9ZD9H7JSkfCrwC9ZL9bTlHUEfzzUv1BruIy+Dh8HYdqjbZZKkQvR5oMz8y8OYLfT
TCaH0rQHHkF/FCcOIt2GK32OISlp04oRGr1wX/01ka+dBVE58gLKVqqXXoS5LcVc
QRhjNbG2/dP22BI1zgVwUKJmTYOMFdafyOH0za+7F7dREhO7q8Nq6cbhBGjNenq8
Jpev34hYQw6GphNee+8i51j9wPrMy9QamMKBbC0uCFsgN6oqZII=
=RJs0
-----END PGP SIGNATURE-----

--ILuaRSyQpoVaJ1HG--
