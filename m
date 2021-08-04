Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 869E53DF9F9
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 05:23:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfcWZ3lVPz3cHB
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 13:23:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=ryNmzvXB;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=d112iogE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=ryNmzvXB; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=d112iogE; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfcWJ3qcqz30HW
 for <openbmc@lists.ozlabs.org>; Wed,  4 Aug 2021 13:22:52 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 2EAF25C0058;
 Tue,  3 Aug 2021 23:22:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 03 Aug 2021 23:22:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=rCDN6OnCQvtfrmXdE4eCYySLT7v
 OKoVblEdD1K7Pk2A=; b=ryNmzvXB21j5Q3VPzCdRgUGJnDWSA4d2R3PVuWVq2Kh
 Asef8VRgnddgGchzpLNZ373u+gHE2SQrHkdnHpMYivzEG8nGGVW4TPmcjF39lyd7
 e0JW9Zi/16MTiifFEfIhasCWg6B1c4Zg+kb3tHDZk+j1B0WOyygg2TP5iR+KuB3p
 ulnalenOuir+jsKZBoKde/g/ctBYIfc9upJG8+ljAbjEgAg+C/AVPgW1J19PQ4Kv
 f1X9YTHpz3r5BGtMaUJs7nFEnlHYbd3+Fb3b4k+Kw9NxFHSaie+w9koac5dBKyUH
 UFFjRx+PUHYpujSB+J1VxFa+WkZu5U5iwlhgdQLuSnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=rCDN6O
 nCQvtfrmXdE4eCYySLT7vOKoVblEdD1K7Pk2A=; b=d112iogEiQNrz2Y3fwK3yK
 Yn8aCeKOG2suDbZly42kgYitOWb8AueewiYkz9KQbA6KGb7lrgIpribCtcHg3dkC
 v1izfj4Y4ORwtCM0bA8aXe9DUo7KrZ5VmgRXYDtzoFRLq0d81Sa9G+Hb1dWeJ7eS
 7slW6fJ0Z1YCnpgfk5lCUXz/2GfKh7Hx1QOLlSFO9Uz0T8SLs90YIqP6bBNg4x2+
 JhMreGyQHAoZLgUmBx9RbqbH8jiHgwuwjIWlToVnIMrjEIYJ89xLJzw9cJyK6YnC
 fySw6QtdCtHCja624dKd3Oum6SjAQq4OUppONM46V83IqkIdVQSf6iK3G9ukVzNA
 ==
X-ME-Sender: <xms:CQgKYQggXIHPHlSbaYAT_a1blK8SFoHBRv30ZKMmAyZyPtRJSN5PYA>
 <xme:CQgKYZDvVphevKbw5RCP093OMtfS8bYmbYt0JhtnARwKs17wM6Cva_DqZIQljjLCz
 lbT7Ijk6GYtasNVsNs>
X-ME-Received: <xmr:CQgKYYG4X6gzyvaernryrAuk1ClHqASV5ZUy3EqH687CGqs0s1DIPKqKWW4RlWBdaxaYqQFR25dL48rDJ2ocQToGQx727428Klgjsh4sQqp5QQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieehgdeihecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
 fuuhhsphgvtghtffhomhgrihhnucdlgeelmdenfghrlhcuvffnffculdefhedmnecujfgu
 rhepfffhvffukfhfgggtuggjsehgtdorredttddvnecuhfhrohhmpefrrghtrhhitghkuc
 ghihhllhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrght
 thgvrhhnpeeggeevleevgffgueeltefgvdegtdfhjeffvdeuueeuvdfgleelkeffkeetje
 eiteenucffohhmrghinhepghhoohhglhgvrdgtohhmpdhophgvnhgsmhgtqdhprhhojhgv
 tghtrdighiiipdihuhgsihgtohdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:CQgKYRThVOpObZtWnE1oHbs9T22B7__Kdb9eOSADZGZSZtiGEhYc4A>
 <xmx:CQgKYdyRDxtHKMfGYQGXAT4wXmm-CzaAiCeSU2WFjOddFT9qw9h60g>
 <xmx:CQgKYf5eY0Ju6bgx_e-lVXRAQVJhZpC_SoPGL4TOMWbp4GkMtu65DQ>
 <xmx:CggKYbYE4RmrEz1G6fqv9PBecyNOZPsnLJ55xY2VxBQEG9kKrpkaTQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Aug 2021 23:22:49 -0400 (EDT)
Date: Tue, 3 Aug 2021 22:22:47 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Security Working Group meeting - Wednesday August 4
Message-ID: <YQoIBwTVJZcqTEMU@heinlein>
References: <89b3524f-a1b3-513c-fc6a-1d888e479238@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gD+/D1+Sw8wbMOdl"
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


--gD+/D1+Sw8wbMOdl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 03, 2021 at 05:57:52PM -0500, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting=20
> scheduled for this Wednesday August 4 at 10:00am PDT.
>=20
> We'll discuss the following items on the agenda=20
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxs=
DUWmAOI/edit>,=20
> and anything else that comes up:
>=20
>  1. (Joseph): IBM ACF design (2FA authentication for the special IBM
>     service account) is in review -
>     https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/45201
>     <https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/45201>

I still feel like the "Alternatives considered" are pretty weak in this
document.  Rather than paint broad brushes ("Other were considered.  They w=
ere
not suitable.") I think you should enumerate _which_ alternatives were
considered and _why_ they don't fit the problem at hand.

```
- Takes four parameters: machine serial number, expiration date, password, =
and
  private key.
- Algorithm:
   - Hashes the password.
   - Creates the ACF from the hashed password, serial number, and expiratio=
n date.
   - Digitally signs the ACF using the private key.
   - Returns the ACF to the caller.
```

This sounds a lot like U2F.  The "4 parameters" are the challenge, IBM's key
signing server is the U2F device, and PAM is the "Relying Party".  There are
already PAM modules for some aspects of U2F and the token you need to excha=
nge
is reasonably short (my Yubikey output is 33 characters).

https://developers.yubico.com/U2F/Protocol_details/Overview.html

The nice aspect if you can reuse portions of the U2F protocol is that you g=
o a
long way towards enabling others to add more typical 2FA like Yubikeys.

--=20
Patrick Williams

--gD+/D1+Sw8wbMOdl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmEKCAUACgkQqwNHzC0A
wRm27g//SaHv02ZhO9xGOrIm8WBoRkT/2P5iKt2LE0wUF0+HS0UB7kUo8qJJWinB
2jEvqKWcAl0dmeMcPbDx7iH5wXOT4q8Kq8OPl/ICAqeWQqB+/qQ/84FeusqA9Zm0
EjiCUafGQ20kk1IqpWM8XbmzebtTckVHJ7ZE7m8odVRb/DmTJJyiJCKyOr4HeLgE
QUo6VeuXFLZPpaO8VKsGe7bmVMYJoY6L1HdOaMAh4baSleQeBtQnjvP0Y0UmDEPx
3oJZy+EeYGmfxHWxU88RMELn1yzhmwRykbc47o8RJomQxcpRBMGPvK7JEjejs9+H
HVaC7PPQ9nd+cpCjOrJrxr9RuOm0QK5/t0uhyWclZg9ewhLEs9IVEtwwNVD2Meti
xlyuePWYGY0iTy20g5VyACo/9NrxBEqdFOnh9eaaAOFhyKTU4pDGaD0tZsokhG5C
tFva3LtlOPwkNbCRI1YDWFVhGpP6eJF7ZZ2oOIPehOlwBKePTK8VdyeR+v8FNZQx
nyXmV3EGlcgTsO17Hkd8rfkACQ4KT9Hu9WC8hhoO0IwlRYi9TTt0M0VhbS6k31AU
0e7oWgUta6kMkG4YLPhaTm0oka+e5XF2E1NALrmDH/ulGjEeUbTpEC/R6gxYY4fH
XFtEm/3M99hIO7wEwfQhWCbHDzdqEsVhNHyGWev7sj+2z88KyAM=
=2Gy4
-----END PGP SIGNATURE-----

--gD+/D1+Sw8wbMOdl--
