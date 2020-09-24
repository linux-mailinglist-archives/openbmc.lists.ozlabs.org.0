Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A65AA277833
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 20:03:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4By2wV0Xd5zDqk9
	for <lists+openbmc@lfdr.de>; Fri, 25 Sep 2020 04:03:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=209.87.249.19; helo=tuna.sandelman.ca;
 envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sandelman.ca
Received: from tuna.sandelman.ca (tuna.sandelman.ca [209.87.249.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4By2vb4KCkzDqV8
 for <openbmc@lists.ozlabs.org>; Fri, 25 Sep 2020 04:02:45 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by tuna.sandelman.ca (Postfix) with ESMTP id C03C3389A6;
 Thu, 24 Sep 2020 13:41:13 -0400 (EDT)
Received: from tuna.sandelman.ca ([127.0.0.1])
 by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id xhXsoELyGKf6; Thu, 24 Sep 2020 13:41:06 -0400 (EDT)
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
 by tuna.sandelman.ca (Postfix) with ESMTP id 13335389A4;
 Thu, 24 Sep 2020 13:41:06 -0400 (EDT)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id E04124DB;
 Thu, 24 Sep 2020 14:02:29 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>
Subject: Re: u-boot branches
In-Reply-To: <CACPK8XeB3r+-6MaAO30xsj4iWpS55d7K8weUDVDAH1rw0FjOBQ@mail.gmail.com>
References: <CACPK8XeB3r+-6MaAO30xsj4iWpS55d7K8weUDVDAH1rw0FjOBQ@mail.gmail.com>
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 26.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="==-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 24 Sep 2020 14:02:29 -0400
Message-ID: <22496.1600970549@localhost>
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

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain


Joel Stanley <joel@jms.id.au> wrote:
    > I've chosen to rebase the openbmc changes on top of their branch. The
    > old branch is still accessible at archive/v2019.04-aspeed-openbmc-1.
    > The bitbake recipe will continue to work as it uses the nobranch=1
    > flag, and specifies the version based on the SHA.

    > The new branch contains their aspeed-master-v2019.04 tree as of today,
    > with the OpenBMC changes applied on top.

Is this any closer to upstream u-boot?
Or is it diverging further?


--=-=-=
Content-Type: text/plain
Content-Disposition: inline
Content-Description: Signature

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [


--=-=-=--

--==-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAl9s3zUACgkQgItw+93Q
3WUP7QgAnKB3GejicJqtcOeISHszDGbLPtmGTapQHT7sifgsjHvg7HeNsjnoI3o9
nnoqA4aXzXr9M7W75Y4NYesCKSLtYv4xBTeeBJzyWD70IXsvHVpbK5m6Z4n7w3Ut
N2rrhGF8+IrWS3YRVI0r8fba0vVVpEBlOGauDu802sywIO4BCvxWdgsoSaqU988w
XcfuwRcO5oly4bnNqMcnSAeH7CKUSWU+9Zom1IeGZwoYV+XgOCtGkCspZdzVz8ze
WyXOWzOuEF8r9eLFrhR8kgOqdthbpQkNrLHmYDTZxwI1oa+hrY95E/e0k1/roOe/
hwLantqKGAGqlPP8HOrbznUN7IrRTg==
=H500
-----END PGP SIGNATURE-----
--==-=-=--
