Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B67032F5B2
	for <lists+openbmc@lfdr.de>; Fri,  5 Mar 2021 23:06:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DshdM0XXPz3d6B
	for <lists+openbmc@lfdr.de>; Sat,  6 Mar 2021 09:05:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=iR6b8E+u;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=PIpxhtly;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=iR6b8E+u; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=PIpxhtly; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dshd42fslz3dC3
 for <openbmc@lists.ozlabs.org>; Sat,  6 Mar 2021 09:05:42 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3A308183B;
 Fri,  5 Mar 2021 17:05:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 05 Mar 2021 17:05:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=o1dwVeGPIrGmM5tKVqzTF+A3ar3
 PZ76pD1tNrgmDUEE=; b=iR6b8E+u9R+S4pO689HdI3wGYteb6b2vZ8cHVzbte/3
 vEnzCbAmP5sYpaMiwYuLXQti/K84EDzcC6vW+7+8kdkMXEz2Q1SGf9HbaGNfHdqh
 E+m3DALH2MRMsWCXmb5Ua7qrn0molN3YL2Cz99DCtGvI2QfNvsXkDs31s5JV+tg1
 Zg9HdlW6lA+7ouYKS71JfT4kkk9RR3DY6RCIHI6XamQFctgcZFkh1D5ooLBtUSKX
 ttzNnEtu0YT8xy0HPaP9J1MwhlsuvJbA7UQGbN74AXuqVkkEXm6/c19d8SfLQn0l
 sUl/X/MFfrZbxuC5EY3tKW3cOp/vhjFMg6hXZwbFz+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=o1dwVe
 GPIrGmM5tKVqzTF+A3ar3PZ76pD1tNrgmDUEE=; b=PIpxhtlydmKCRJTPJmWHtd
 DPDciUOLwd7RQ8xP62MCYMT7Dj1GFRKJliTFbnioe9U4+KE/6/FqG26mk1mSyQ18
 xpPxU0NUpSWc9paP1+IeU7ZQDL7A7kASoumy814NQf59dedoTepZl+ZALjJtySUp
 /rk/GOdj9Pf9oT3azrJOYIAEKaVyk9tHCsFewFkuTUaVR4nbogtfy4ra1SHyqdw5
 /zW9kvIyY0QAyUv6A90BgfZB3t06ynpbAO37RVSjAVUfjeyxDvKeUninx0O9N4wh
 o9ThqVTeWCefvvYAqjQs+7W6hNgsnNd1Tlbdnb5EXGZyAnWdIYlUlPtUePv4tgLQ
 ==
X-ME-Sender: <xms:MqtCYA5Li_awxw-dLNcK8V5_0cJrF21eWvlWrGmNx27xIU28uX5dAQ>
 <xme:MqtCYB6lm7uqSV5mer30NzfBMFfdlFjwOq4MVoSC5z7qMNZuTtmxNKM6wJReIvX15
 Oh4zpagJeyAECLka_8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtiedgudeghecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtdorredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeefieekvdejjeehteeggeegfeeg
 ffetuefggedtvddugefguefgfeejvdeuvdevveenucfkphepjeeirddvhedtrdekgedrvd
 efieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:MqtCYPeZpuqjb4_qtHa8mV6WRpXKPZe7tOLTPKfOQ8-0_KfAWBvxtQ>
 <xmx:MqtCYFLk2v0F0kMqiNRsk3AnXLcEaKUcF9k3NUWpWkDu5hKkBbTteg>
 <xmx:MqtCYEKnMJNdIlBvb5-NYuEkBCZMVKZZw0rRVesaWTuJnkFnHbfSkw>
 <xmx:MqtCYLkduMnIUIBbVpmluP1_JKSSgvD3VgSsJoOkb7Vey0qVEzw5cQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id ECE7C240057;
 Fri,  5 Mar 2021 17:05:37 -0500 (EST)
Date: Fri, 5 Mar 2021 16:05:36 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Request new repo for IBM-specific code
Message-ID: <YEKrMMxgcljwRNDt@heinlein>
References: <b8af3438-f85a-cb82-c88c-9c4e120399e9@linux.ibm.com>
 <YEKDY6+zfW5Uuqkl@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5idnB0G9arQ+2yy1"
Content-Disposition: inline
In-Reply-To: <YEKDY6+zfW5Uuqkl@heinlein>
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


--5idnB0G9arQ+2yy1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 05, 2021 at 01:15:47PM -0600, Patrick Williams wrote:
> On Thu, Mar 04, 2021 at 09:14:47PM -0600, Joseph Reynolds wrote:

> My first reading of what is there, I'm not sure why typical certificate
> based authentication couldn't solve your needs (but I'm just guessing
> what your needs are).  It seems like you have a root-authority (IBM), a
> a daily expiring certificate, and some fields in the certificate you
> want to confirm (ex. serial number).  I've seen other production-level
> systems doing similar for SSH/HTTPS without additional PAM modules.

For more concrete example of what I'm talking about, see 'sshd_config'
options AuthorizePrincipalsCommand and TrustedUserCAKeys.

- An IBM certificate would be the CA for TrustedUserCAKeys (and
  installed on only IBM Enterprise systems.
- AuthorizedPrincipalsCommand would be a small dbus lookup to get
  the system serial number.

Your login credentials would be a certificate signed by the IBM CA where
the system serial number is included in the Principals of the cert.  The
certificate can be set to expire in 24 hours.

I'm pretty sure SSH certificates can be standard X.509 certificates
which can be used for mTLS in a similar way.  bmcweb could be configured
to do similar operations as already built in to SSH.

I don't know if you would want to install the CA and configuration with
a bbappend in your own layer or via a local.conf override on your build
system.  You might want to look at
meta-phosphor/classes/phosphor-deploy-ssh-keys.bbclass as a method of
installing extensions, like SSH keys, in a build.

--=20
Patrick Williams

--5idnB0G9arQ+2yy1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmBCqy4ACgkQqwNHzC0A
wRl+LQ/8CriqgpcMrBdd1s89etjbfvdvzB/4v9ENWcPrUvtrmqmF/hOazUPPYh10
X3huQzIPKsJHxMV5gYpM+AZSTAdpUfTb5a2OewH1xLCXt1NgU5yq0MqXUyEzGrgi
H6PtEyh6UNfVEK37h5H5uoRVZ43+YTb5O/r+OSaOOfewl+RdSt8wFYYORq5V0/+j
XxCzSe6sUpY8BOAc2NDsJXhKQ3y9RjXFyCbb7MUfWmrMxSzhcV3JGgZBux37uAS+
30zTtJS6CRyHc6VH/aVfS7MTzri2Lq874Z3k9Z51KoxC7WSfibBHqgOUH+dB07dL
ln5W5VhXqVcuFHTKGAGoZ9q7OJkgqXRgiAdjBi9uWyj5nPwPXJTaxAkW81AWikPe
GkFka4lDrq9UuV1Xqc3aDyFCSC3mW9PIyZSu/Ow2BCSOje+cuvY26elCd7TLEtre
rG4VMW/00grVKOI+p82q9AAhJHsoM3M8wMGXVYZacEUu4tVKgYeTR5DucaBoiZOf
18M2YaheIMQoKAfxQoiBgHYM0NxqGxqSZH7yT4MY85S6VimtM50vbnpycqIYXDsa
p5dJy7Kuu0Y0wLdsvyWvhee8W1k4jDEBUEtrnXeWvezZr0saIsp2VFVhD0SXoiOg
PKGUe/F6TwkZ/MbX780ARm6vMj9blL6DfxsWKOClwbW/1Om4MwM=
=CqnI
-----END PGP SIGNATURE-----

--5idnB0G9arQ+2yy1--
