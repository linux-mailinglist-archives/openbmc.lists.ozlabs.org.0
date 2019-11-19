Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B21BA1029DF
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2019 17:55:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HX4y2CHZzDqXN
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 03:55:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=stwcx.xyz
 (client-ip=136.143.188.54; helo=sender4-of-o54.zoho.com;
 envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=stwcx.xyz header.i=patrick@stwcx.xyz header.b="f9TM4Zjt";
 dkim-atps=neutral
Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com
 [136.143.188.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HX4C0k4NzDqXD
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 03:54:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1574182483; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FQZx2BGluVwT/x6JProkal+pjIu4xKlixMEtQLZoPBxcMc51B/ZXhaE3wWxAmMwN2SmVpp3wFXZLT7pVtd8sa6guZQYDyNX/Kz7FxXvCuFt3bZlV0jxPXcY8NumLx8hVS7X+7pV3mPwB0+woXXLB77nuOapBjMSAMYl7GwXVGlM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1574182483;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=JIzcytZ49gxWcVgwxHETpCISLx7Z5xj7sP6CfQRukdA=; 
 b=YIKpA+9H2Gjz5Jz0X6zS6IZXC1on7Jx6rsuIIUq+r/CUMQzxTcrruXZSnsXlGmFHBzUTHb0fuka7a3UjzBwLlMn9A1ybnIFG860UqLBVGK9oBbpiRrU41Eqpro6pOLnWKzb9bnrsWzAp3q8k6ZFzD02azmJ7aNMRqlbhd+IrZGU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=stwcx.xyz;
 spf=pass  smtp.mailfrom=patrick@stwcx.xyz;
 dmarc=pass header.from=<patrick@stwcx.xyz> header.from=<patrick@stwcx.xyz>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574182483; 
 s=zoho; d=stwcx.xyz; i=patrick@stwcx.xyz;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 l=2730; bh=JIzcytZ49gxWcVgwxHETpCISLx7Z5xj7sP6CfQRukdA=;
 b=f9TM4Zjt8t+eUcfLyxxBfM/azcLqsKxdFahx75TlVTPT4c0zSRgzqYf/1RXTmD4y
 n02Dp1Uhbe4KsmxpPOUIjJTv4/zyDpOuIaJIox6JtKZqKLg3cRPkGaJp2/TfAhLJsSm
 WZ63dNFkMwxJ+F+/tZ1TtIPWMZ5NH3KYgb0smv8A=
Received: from localhost (163.114.130.128 [163.114.130.128]) by mx.zohomail.com
 with SMTPS id 1574182482328267.1497376940413;
 Tue, 19 Nov 2019 08:54:42 -0800 (PST)
Date: Tue, 19 Nov 2019 10:54:40 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Geissler <geissonator@gmail.com>
Subject: Re: 2 patch dependency
Message-ID: <20191119165440.GB93344@patrickw3-mbp>
References: <EACBC95B-0761-4667-A622-E1C0EA6EF1ED@fb.com>
 <E782C583-DBB7-4589-BFE6-EC69E2343424@fuzziesquirrel.com>
 <20191119003509.GA80304@patrickw3-mbp.dhcp.thefacebook.com>
 <2231F8C7-719B-468B-BABB-92AF197F92C8@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bCsyhTFzCvuiizWE"
Content-Disposition: inline
In-Reply-To: <2231F8C7-719B-468B-BABB-92AF197F92C8@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--bCsyhTFzCvuiizWE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2019 at 09:45:34AM -0600, Andrew Geissler wrote:
>=20
> I know in general we really try to encourage people to not cause
> co-req issues across repositories. Making this easier for people
> may cause more of it to happen.

I understand and agree.  I don't know how often this kind of breaking
behavior has happened, like these IPMI related changes, it was just
coincidentally at the top of my email queue as I've started digging
through.

> Also, I believe we=E2=80=99re going back to just having everything in
> openbmc/openbmc so that should alleviate a lot of our meta-*
> co-req issues since they can all go in together again. Brad was
> working on getting the gerrit plugin running that allows people
> to maintain sub-directories in a repository. This will allow multiple
> maintainers of openbmc/openbmc for their specific areas.

Ooh.  Was this talked about on the mailing list somewhere?  I've gone
back through at least August and haven't come across it.  Was there
an exploration of moving to `repo` instead?

> So to answer your question, I=E2=80=99m not sure. I think it could still
> be useful to have between code repos and openbmc/openbmc
> at times but I=E2=80=99d rather people just do the extra work to avoid
> dependencies all together.

Another "first step" might be to get a Jenkins job for code repositories
that builds the full openbmc/openbmc stack with the code change, so that
we can identify breaking changes like this before they are merged.
AFAIK, the code repo Jenkins jobs are still independent from the Yocto
recipes, correct?

--=20
Patrick Williams

--bCsyhTFzCvuiizWE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl3UHlAACgkQqwNHzC0A
wRkggw/+No+10k3jFkoFv/U/0XVR06d7X/TOoz+JGjG9J87jPJIIzxckMncv5gSK
wnFQvRv+vAvQfTVmy/RcU1CBymmyJVa0UaHbVQeqMQ+CkIemWyEeFVpM6vmq1CxB
Yq9xSvlGTciEyWDZvVmgPVW/OkCx0dYIbX4ZdiyHdiA7EyZX7UbdLOFhRQsIZq1E
VFJrD/IDvKBYLdoBJZC3xnl8UM7X27rje6IBX8eRY+pmi+Uc5shr7SCWITfoGYr8
FEO5HerIzzLAmMdmf/cK1jY+yi0E4NiRy6YxUrqteWO3rfTWuZt543Bpw9UBAiNa
XpRy69ehf9w93E3fb0SyuhXXguutx5yDhphNKpvXVBvNiBajwG4mtK2n67jgu+6s
TIiOd5I53iz7xEed1F8g4uY5AC1s6pFbzt5LLwG/m0EItaSPRF4A+MS+UATD2EpY
udGGPBLSUK9qvcpqIhaCUk4TPd3VqC3Rj8lea4tHaoqblLAVW22r7m1gUYi9MIEl
kWBh50JA535PIi02i1ZrjPcRwqAxyibEnwxbU3oJWcxtxaoMtFzNGABv/fKOuO9d
a1sWT7dy18uSxhGfZONWJzoVBYf1efOLrFXamZSWr8mUzfx0tNisoJ2MZRpokidq
z1dmxQqWqY3ZKbgBk2Sz7n0EuPj0YtW4vBMcDxg47vtpnjbPqSQ=
=klUB
-----END PGP SIGNATURE-----

--bCsyhTFzCvuiizWE--

