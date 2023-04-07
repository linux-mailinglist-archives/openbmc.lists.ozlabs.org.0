Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD17B6DD0FB
	for <lists+openbmc@lfdr.de>; Tue, 11 Apr 2023 06:35:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PwY0x02XDz3cTk
	for <lists+openbmc@lfdr.de>; Tue, 11 Apr 2023 14:35:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sandelman.ca header.i=@sandelman.ca header.a=rsa-sha256 header.s=mail header.b=ub9wxZzI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sandelman.ca (client-ip=209.87.249.19; helo=tuna.sandelman.ca; envelope-from=mcr+ietf@sandelman.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=sandelman.ca header.i=@sandelman.ca header.a=rsa-sha1 header.s=mail header.b=ub9wxZzI;
	dkim-atps=neutral
X-Greylist: delayed 81148 seconds by postgrey-1.36 at boromir; Sat, 08 Apr 2023 03:33:02 AEST
Received: from tuna.sandelman.ca (tuna.sandelman.ca [209.87.249.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PtQSG4qWNz3fDd
	for <openbmc@lists.ozlabs.org>; Sat,  8 Apr 2023 03:33:01 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by tuna.sandelman.ca (Postfix) with ESMTP id 7872738996;
	Fri,  7 Apr 2023 13:49:42 -0400 (EDT)
Received: from tuna.sandelman.ca ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 94njF3z32O0M; Fri,  7 Apr 2023 13:49:41 -0400 (EDT)
Received: from sandelman.ca (unknown [IPv6:2607:f0b0:f:2:1c14:eaff:fec3:b3c7])
	by tuna.sandelman.ca (Postfix) with ESMTP id AC42338990;
	Fri,  7 Apr 2023 13:49:41 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sandelman.ca;
	s=mail; t=1680889781;
	bh=WD714MOt2096GO3EBASYadcwguvCLxN6PHs0EF2dLFE=;
	h=From:To:cc:Subject:In-Reply-To:References:Date:From;
	b=ub9wxZzIj58dBc1/u8doBclwN8jfXfGv4LufBpVIaP/vH5HVppCB5Jw9EjovnrR+o
	 v/uvS9N3ivcWG4PJndwBq7Q7Yqv4lPLXC7IGPO1zkTcs+Q0nkzW39/2fBYhfO8HMM7
	 wyo0gaZFqnLnxrnr51J9HVm1sy4ry0JBhkCiDGa8VKB3BCnYMm6uJO3OtzzMZD00wW
	 Jr3ZfbnpSR7BmowlVW3C7MPR81AfCHnKfjWXysrbQksptgYK5tpOxuaHCr+MQ+RcNF
	 2vvGS8skUKjENGYdSeJ3EA8jjoTR9iUcD6cj8Y9gCPeBDyHdXR8HkbE0AoftNeCpNx
	 KrpeW7ZhVBHfQ==
Received: from localhost (localhost [IPv6:::1])
	by sandelman.ca (Postfix) with ESMTP id 2B57340A;
	Fri,  7 Apr 2023 13:32:57 -0400 (EDT)
From: Michael Richardson <mcr+ietf@sandelman.ca>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Design to isolate BMC service access
In-Reply-To: <53fade52-2afc-f375-40b1-f6781bf5d117@linux.ibm.com>
References: <552186c1-50c4-198c-57bb-98ab3ac29d58@linux.ibm.com> <6411.1680807620@localhost> <53fade52-2afc-f375-40b1-f6781bf5d117@linux.ibm.com>
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 27.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;<'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 07 Apr 2023 13:32:57 -0400
Message-ID: <26362.1680888777@localhost>
X-Mailman-Approved-At: Tue, 11 Apr 2023 14:34:44 +1000
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Ed Tanous <edtanous@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Joseph Reynolds <jrey@linux.ibm.com> wrote:
    > On 4/6/23 2:00 PM, Michael Richardson wrote:
    >> Joseph Reynolds <jrey@linux.ibm.com> wrote: > A "service access toke=
n"
    >> is proposed.=C2=A0 Details are below but for now, a > service access=
 token:
    >>=20
    >> > * Is a small file (kilobytes), a digitally-signed request to access
    >> a > specific BMC function on a specific BMC for a limited time windo=
w.
    >> > This token may have additional information about its origin, etc. =
 *
    >> Is > created by an authorized service agent.=C2=A0 Only service agen=
ts can
    >> > digitally sign the tokens so they can be verified by the BMC.  * Is
    >> > uploaded to the BMC by an admin user to perform a specific service=
 >
    >> function.  * Has nothing that is secret to the BMC admin user.=C2=A0=
 If the
    >> > token encodes a password, it is stored in the form of a secure has=
h.
    >>=20
    >> So it's a bearer token (?) that is encrypted by the BMC to itself?  =
Or
    >> it's created by an external entity?

    > Michael,=C2=A0 +cc: Ed Tanous Thanks for your input!

    > This token is digitally signed by the service organization behind the=
ir
    > firewall.=C2=A0 When it is uploaded to the BMC the signature is verif=
ied by
    > the BMC.=C2=A0 I didn't describe the infrastructure needed for this, =
but it
    > includes the following pieces: 1. The BMC functions described in this
    > design sketch.  2. The service organization creates a key pair for the
    > service access token: 2A. The private key is held by the service
    > organization to digitally sign the token.  2B. The public keys gets
    > built into the BMC firmware image to validate the token's signature.

2B seems like a kicker to me.
I have been working on (too slowly, without enough resources), an RFC8995
client (pledge) for OpenBMC, which would allow for that token validation
public key/trust-anchor to be delivered to the BMC at boot time/installatio=
n.

RFC7030 (EST) seems like a very good way to do this, and even without RFC89=
95
to automate it, entering a URL into the BMC web interface and having it
transfer the trust-anchor seems like a good thing.  That also gets it access
to CRLs and to refreshing the trust-anchor.

I think that there should also be a self-signed option where the BMC creates
the token itself.  In that case, having it be a bearer token has pluses and
minuses.  linking it to a TLS Client certificate would be good in some use
cases.

I think that there are two deployment environments:
1) the facebook/etc. scale places where they just need automation and can p=
ay
   for it.
=20=20=20
2) the SMEs where they have a few dozen systems, installed by a variety of
   people with a variety of skills, probably at least one of them have left.
   They are chronically under-resourced, and being able to recover easily is
   important.

(The really SMALL places with four systems can probably just poke a button =
to reset
the BMC to factory defaults.  I had to do that to a 2010 era server on
Wednesday after the ice storm killed power, and the UPS went with it... Gosh
I wish that system was running something modern)

    >> Very much exactly OAUTH2-like: JWT, CWT. In fact... I suggest not
    >> re-inventing the wheel here.

    > Thanks for that!=C2=A0 I think that would work.=C2=A0 The service org=
anization
    > would build an OAuth2 JSON Web Token (JWT) which is uploaded to the
    > BMC.=C2=A0 I will study up and try to redo this design sketch in those
    > terms.

Yes.  That way, you can leverage not just the crypto primitives, but also t=
he
operational experience around that.

    >> Do you intend to sometimes bind the token to the specific user
    >> (service team, I think).

    > Yes, the basic premise is: the token is (a) created by the service
    > agent (person) to (b) do something specific on the BMC while using the
    > BMC's service account.

Good.


=2D-=20
Michael Richardson <mcr+IETF@sandelman.ca>   . o O ( IPv6 I=C3=B8T consulti=
ng )
           Sandelman Software Works Inc, Ottawa and Worldwide





--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFKBAEBCgA0FiEEbsyLEzg/qUTA43uogItw+93Q3WUFAmQwU8gWHG1jcitpZXRm
QHNhbmRlbG1hbi5jYQAKCRCAi3D73dDdZW/xCACWDPUc4/4fE77tmeOcZ+z4ClX7
nIbCTtVlLWa1yunaaRQx0jLX4ne0ny27e72LcdsJQDsljgZZNWruHwZouxGaoaNH
jiNm+n2C1wkZ7mrGJa8yx17yrATR+aSzVlMPa16x7aPi7RZGVmaLsEfGv6X2rDhL
HZwoPdIA/xjadlzXONK0YA4bDwJPoAjkSp+TTxyV6es9In85rUx2xlQowgn2JP1E
NDJEAerTviEMKXpYoG9Rif43M+MbSKAkPObTSJDcU/edmd35kW5tb8SQGFVRrVBj
uW2BJY8Pfvxmru0k2cdOd8/r1PmFrKhJaADpIGMdGJn/zXr+9t9JnVWJt3mZ
=yiog
-----END PGP SIGNATURE-----
--=-=-=--
