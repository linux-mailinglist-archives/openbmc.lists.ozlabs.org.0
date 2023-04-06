Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE8A6DA0B7
	for <lists+openbmc@lfdr.de>; Thu,  6 Apr 2023 21:11:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Psrgk0dS8z3fTR
	for <lists+openbmc@lfdr.de>; Fri,  7 Apr 2023 05:10:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sandelman.ca header.i=@sandelman.ca header.a=rsa-sha256 header.s=mail header.b=cZjweeis;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sandelman.ca (client-ip=2607:f0b0:f:3:216:3eff:fe7c:d1f3; helo=tuna.sandelman.ca; envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sandelman.ca header.i=@sandelman.ca header.a=rsa-sha256 header.s=mail header.b=cZjweeis;
	dkim-atps=neutral
X-Greylist: delayed 596 seconds by postgrey-1.36 at boromir; Fri, 07 Apr 2023 05:10:25 AEST
Received: from tuna.sandelman.ca (tuna.sandelman.ca [IPv6:2607:f0b0:f:3:216:3eff:fe7c:d1f3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Psrg51fW4z3fTB
	for <openbmc@lists.ozlabs.org>; Fri,  7 Apr 2023 05:10:24 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by tuna.sandelman.ca (Postfix) with ESMTP id 67B4B3898F;
	Thu,  6 Apr 2023 15:00:20 -0400 (EDT)
Received: from tuna.sandelman.ca ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Z2KBVcIexLO1; Thu,  6 Apr 2023 15:00:19 -0400 (EDT)
Received: from sandelman.ca (unknown [IPv6:2607:f0b0:f:2:1c14:eaff:fec3:b3c7])
	by tuna.sandelman.ca (Postfix) with ESMTP id 0C0783898E;
	Thu,  6 Apr 2023 15:00:19 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sandelman.ca;
	s=mail; t=1680807619;
	bh=5YpdjCzNugY5WF+vRCy0o/veOvWgxlZMHLgg/8RhfVQ=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=cZjweeist4VloAvr1NiiGOGQUgRVWY1gTRnLtdwDZqtFD/enupMBbe4PLHe7ng3Ne
	 8DS0qNAK1YcUwCo9/Rtl/fAmF/vKXO6huj4IFHNdio1N2VgYmU9fX28Le4md06j/tl
	 vUoovn8+R6ByCCYxA+wpNBgk51leOgo6TYIEDv7jiuiFqDoIt8ADExmUpGyum6OM51
	 6j5p7DCeU2RG9+c/2fUvXAxuX7IXvo3FGcayGOPun52L0G12RCMTR02WxmWk9ai1Lm
	 1RxJ2ts22EKAeBqgcdkpfaoeArnZ9WMTvPbOAfOKeiFboeGbVP/H+umjPxSPFML1az
	 ymIxbDfeoAEhg==
Received: from localhost (localhost [IPv6:::1])
	by sandelman.ca (Postfix) with ESMTP id 553B7C7;
	Thu,  6 Apr 2023 15:00:20 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: Joseph Reynolds <jrey@linux.ibm.com>,
    openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Design to isolate BMC service access
In-Reply-To: <552186c1-50c4-198c-57bb-98ab3ac29d58@linux.ibm.com>
References: <552186c1-50c4-198c-57bb-98ab3ac29d58@linux.ibm.com>
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 27.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;<'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 06 Apr 2023 15:00:20 -0400
Message-ID: <6411.1680807620@localhost>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Joseph Reynolds <jrey@linux.ibm.com> wrote:
    > A "service access token" is proposed.=C2=A0 Details are below but for=
 now, a
    > service access token:

    >  * Is a small file (kilobytes), a digitally-signed request to access a
    > specific BMC function on a specific BMC for a limited time window.=C2=
=A0
    > This token may have additional information about its origin, etc.  * =
Is
    > created by an authorized service agent.=C2=A0 Only service agents can
    > digitally sign the tokens so they can be verified by the BMC.  * Is
    > uploaded to the BMC by an admin user to perform a specific service
    > function.  * Has nothing that is secret to the BMC admin user.=C2=A0 =
If the
    > token encodes a password, it is stored in the form of a secure hash.

So it's a bearer token (?) that is encrypted by the BMC to itself?
Or it's created by an external entity?

Very much exactly OAUTH2-like: JWT, CWT. In fact... I suggest not
re-inventing the wheel here.

Do you intend to sometimes bind the token to the specific user (service tea=
m,
I think).

    > call.=C2=A0 The admin passes this data to the service agent along wit=
h their
    > request for service.

There are now some IETF protocols (TIGRESS WG) that enable this secure tran=
sfer.

    > indicated within the service access token.=C2=A0 Design question: Sho=
uld the
    > function be activated when it is uploaded, or via a separate activate
    > function?

When it is uploaded.
If you want it to take effect in the future, then the token should have a
notBefore entry.

    > 5. If the service function is to allow root login to the BMC
    > command shell, the service user can now login to the BMC, using a
    > unique password associated with the service access token, and known
    > only them.

No passwords.
If you are going to use SSH, then use SSH keys here.

    > 6. Other popular functions might be to recover the admin
    > account, disable various security features, or perform a service dump.
    > Example: Customers regularly call for service because they lost access
    > to their admin account.=C2=A0 Recovery means, for example: recreate t=
he
    > admin account or set it to a usable state, and set its password to a
    > known value, reset its password lockout, etc.

That seems like a chicken and egg situation, but maybe I don't understand i=
t.

    > 1. Is this design sketch clear?=C2=A0 What improvements are needed?

Relatively.

    > 4. Should the "service access
    > token" be an X.509 certificate?=C2=A0 Or is that inappropriate?

No.  It's just gonna confuse people.

    > should that be a separate step?=C2=A0 For example, a BMC admin might =
want
    > to: (A) upload a token, (B) inspect the token (using the BMC function)
    > to ensure it looks legitimate and perform the function they agreed to,
    > and then finally (C) activate the token, for example, to disable secu=
re
    > boot.

Maybe that's a reasonable work flow.

    > 8. Does it make sense to have a common implementation for the
    > functions as listed above (like to recover admin account access).

I don't know.



--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCgAvFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAmQvFsQRHG1jckBzYW5k
ZWxtYW4uY2EACgkQgItw+93Q3WWOHAgAicqHrqfX2LExwlIfCTIpoFoQTKLeEdqi
cqW+rbfn+Mxjd5UpVtl47EACl0BHZ5cATTM97eXbBRqb6uJwu0mMckboP0589vDO
aUEbueaVBVuBNMv1AMOREdlwXzGSvdsL0cVz2K4B38hYYaC6unZKEaJfgXKAps3K
4Id+K0fHh0xkwZKQwWRfwGukArgAetSOoTxfg9EXCD77IoCA3xk4YG02OpEpLPPa
gDUSklcDM3gxPt50Dvs5qwtG1oIM9trYbysS+ODhN/h7+V+sd6aio/6rtfhXUjQ5
A5BnrZAddA31KlbPQr/gMsPusdNPb/2HliGraqP1voHpWnLJlab/8A==
=oASZ
-----END PGP SIGNATURE-----
--=-=-=--
