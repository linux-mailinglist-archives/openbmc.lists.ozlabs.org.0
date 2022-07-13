Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 289DD5735BA
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 13:44:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjbPr03nzz3by8
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 21:44:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=Z9Ev+Xof;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=trmG3IY4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=Z9Ev+Xof;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=trmG3IY4;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LjbPQ3zs9z2ypV
	for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 21:44:10 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 7B8A15C0074;
	Wed, 13 Jul 2022 07:44:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 13 Jul 2022 07:44:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1657712648; x=1657799048; bh=q6gHvzwKLV
	dP2UcVmkbVGgAceAihMDcrz2Tx1JH6uuk=; b=Z9Ev+XofmRI65ZShKguZ3RJc2w
	z/o6M15QGMxILVJP0zSG6oGacp0yfyqI+wvk5mRMu7Tjimf7B8PI6ojjpYaUoRAE
	kZims2xQqbVzfFxAL2tcpRTjc2Dga1/NxV0ikvkt7uwWUvtYPTqjZZiog+lvwPPk
	m3yl1CMyA/a6S9TqtKZpk+cQ7fyhL1HQ+t9MWvNhQxNc5za7W6r9dBFEuo0uvv8I
	8/hq2t9S8evtWTTpK6/cK1O4Y8UHTtTVK6cfCOP3k7JNS3ItZXVg4oUcyYCGOBI5
	v7br7RZurkH9vbcVUIn9LW/sZFjCnePND2JQZ/pOpliss1sJhKDvGY7gd8qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1657712648; x=1657799048; bh=q6gHvzwKLVdP2UcVmkbVGgAceAih
	MDcrz2Tx1JH6uuk=; b=trmG3IY4e8X5OkURmoUGu2fCS5stY9k49l8toMnIPvrz
	6+7keHr0HqJDKekwkaKRNvqfe+emKfEqwQPNzaTs3TQSz7vOsXPSMdCQ4dd7bUZ9
	4zVXZ16PQxLWgy0gP5bUzycelspzG2bzjprPMPEtLBYU6XllzQZK1rP9kba4GaZU
	BEkAfoIB7bYskMI25PsvhwNDtuFgJEaYbYWSlsSdx+yNUzqbPYbpHYsGolu/6Ynr
	cVYqeJGcyMwE1vl3PCG/meN03dn0nCekWz67o1PRCbdSalzMZZYdfbyKy2/A8Twu
	ONzFZ6/DdGodV5jaCs0LRtGa7yCyiGEDW6t7Ow2iOA==
X-ME-Sender: <xms:CLDOYnM_k9Hf0qCjmXHvm07siZuVXwm2XgvHmJHbQKTKl-VQNbIrSA>
    <xme:CLDOYh9yrQbcADpRv0JfnYpVejDQxBDjvcyDP3vm6ZzRBXAG_LvfJfYlNg43P7PvO
    y_geOs80zccGLzcCJ4>
X-ME-Received: <xmr:CLDOYmTJVbqHjsMYXYFMQDYwz3duJXbO1jTM5rX4gFEOGA_OWyk2MgRRypf2m6fAVNiT36NWTFHKzmenrwvldR0BtqU3HWuh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejjedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegieevuedufedvgeetleekkefh
    jefgieeilefhtdegvdehkeffkeduvdfhfffhheenucffohhmrghinhepohhpvghnsghmtg
    drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:CLDOYrsDig7LMmfacMvtIYCa-4gcmNtIVs2wt-R4t5b5Zh8fjhxZkg>
    <xmx:CLDOYvdcxQbCJgqOARkpbyJwR7DjrMWhUdImW3iymQWZ6Lu_fLNo4Q>
    <xmx:CLDOYn0bKZqWhAlOKgjkTJ8sWgZK1dfvrSV-0_YkhJxTXAlOqFjLyw>
    <xmx:CLDOYgpyrAnF7hXX2U_XSB14VsjGYbfTtJW4CRgwiR1dXBzDUd6Rcw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Jul 2022 07:44:08 -0400 (EDT)
Date: Wed, 13 Jul 2022 06:44:07 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Nan Zhou <nanzhou@google.com>
Subject: Re: DBus ObjectManager Interface usages within the project
Message-ID: <Ys6wB54/qPxokthK@heinlein.stwcx.org.github.beta.tailscale.net>
References: <CAH2-KxBmFwVmF4cr+_eTFrwdz9-he--PPfRvW=cN6oNGf4KA_A@mail.gmail.com>
 <CAOLfGj6DWfmhxzSQx9PaU1awppsExrgJodFu8JrSgkbQZbnStA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FkHvEWc89r/3zA9U"
Content-Disposition: inline
In-Reply-To: <CAOLfGj6DWfmhxzSQx9PaU1awppsExrgJodFu8JrSgkbQZbnStA@mail.gmail.com>
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
Cc: Ed Tanous <edtanous@google.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--FkHvEWc89r/3zA9U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 12, 2022 at 01:02:37PM -0700, Nan Zhou wrote:
> Ed brought up this issue that OM is optional as of today in inventories a=
nd
> sensors during the code review of
> https://gerrit.openbmc.org/c/openbmc/bmcweb/+/53824. The path of the OM is
> also inconsistent.

I don't think "OM is optional" is really a true statement.  It is
optional from a dbus perspective, true, but practically speaking all of
our daemons have it (just at an inconsistent location).  One of the
primary features of the object manager is to emit the signals for
managed objects, such as PropertiesChanged.  If you don't have an object
manager you don't get those signals.  We have to have that on Sensors,
at least, and I'm pretty sure everyone adds them for Inventory as well.

As you're seeing, there are typically two behaviors of implementation:

1. Anything using ASIO places OM at the root by default.
2. Anything using PDI-bindings places the OM at the lowest common part
   in their hierarchy.  (Something like /xyz/openbmc_project/sensors or
   /xyz/openbmc_project typically).

--=20
Patrick Williams

--FkHvEWc89r/3zA9U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmLOsAcACgkQqwNHzC0A
wRn9mg//ZNGBziDSNfwv3U8xko+vEJhWYLw/Ykp+wEuwudUm0fET0shptC2HZBVC
yeozDAQj+w2cqpq57iggTyLSwPn5xc/ID/pXXiHHbu1VKJJY5SDPDEVwFzqObu1G
fRvur4unNF54mKEf9j+6KLFFfafOXOSPK6R47aauBRWjiINPw7qw9i7miL4LbM+M
Yx8MvVJ7Tqszig68iUHfbdCiP3LVxKf3RDvoHE16JjosXC9w42zcr98Mb81W3hMR
7n8Ickklg4M6txCTQFCQvVFDLhtd7/CytzbUVT/7mz8F3K/+RF3CZDSrHxbFWCpu
r3moCOQmGA2bPjAnsXG4Z6nO1hxnsPC3EZvogRx84eO+JyhWxXVuU4n75dCpAnTV
EifbR46neGX26UnNGx2CFGg079J36mYoS5YYdqJpT6Tn9ssW1a3qmLhg7enht7o/
wq4TAsRcpC7XnEdDrAN8b+JFCQtUkXwxwdO0EKsW6ypzXDaSWWYVLs4jcSonT80N
ciELXCzSKBSqToliQCKppk/Otnsy+4uGE2dwFOG40HAj2zY0SnzmOeA3p2zUqkqr
tK3vYOVzpL0tiQKH89dNu4mtT//vlRqJchbUZ+5XeyaueCJGTSDaI4bOOWcxhoeN
/RcHzEhMlWoiE5//wDX6/LjG24YaQHH07dEkEKDRCLemvv5tvHE=
=lMKi
-----END PGP SIGNATURE-----

--FkHvEWc89r/3zA9U--
