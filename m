Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F633631E3
	for <lists+openbmc@lfdr.de>; Sat, 17 Apr 2021 20:56:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FN2Nw18JWz30BG
	for <lists+openbmc@lfdr.de>; Sun, 18 Apr 2021 04:56:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=209.87.249.19; helo=tuna.sandelman.ca;
 envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
X-Greylist: delayed 317 seconds by postgrey-1.36 at boromir;
 Sun, 18 Apr 2021 04:56:22 AEST
Received: from tuna.sandelman.ca (tuna.sandelman.ca [209.87.249.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FN2Nk3pB0z302W
 for <openbmc@lists.ozlabs.org>; Sun, 18 Apr 2021 04:56:21 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by tuna.sandelman.ca (Postfix) with ESMTP id 61F3938EEA;
 Sat, 17 Apr 2021 14:58:20 -0400 (EDT)
Received: from tuna.sandelman.ca ([127.0.0.1])
 by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id ww_kWS1uVscb; Sat, 17 Apr 2021 14:58:16 -0400 (EDT)
Received: from sandelman.ca (obiwan.sandelman.ca [209.87.249.21])
 by tuna.sandelman.ca (Postfix) with ESMTP id 6358538EE1;
 Sat, 17 Apr 2021 14:58:16 -0400 (EDT)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id 9ECCE114;
 Sat, 17 Apr 2021 14:50:48 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: Zhenfei Tai <ztai@google.com>
Subject: Re: bmcweb: Install encrypted certificate to BMC
In-Reply-To: <CAMXw96PmAoSb5LJj-CzYA-47D-nCy81gBa=T94N_u2fqWL54EQ@mail.gmail.com>
References: <CAMXw96PmAoSb5LJj-CzYA-47D-nCy81gBa=T94N_u2fqWL54EQ@mail.gmail.com>
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 26.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sat, 17 Apr 2021 14:50:48 -0400
Message-ID: <10871.1618685448@localhost>
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
Cc: gmills@us.ibm.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Justin Chen <juschen@google.com>, Ed Tanous <edtanous@google.com>,
 Richard Hanley <rhanley@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--=-=-=
Content-Type: text/plain


Zhenfei Tai <ztai@google.com> wrote:
    > For our use case it's a more restricted environment in which we don't want
    > to have plaintext certificates in the request. Instead we want to send a
    > pair of encrypted key and certificate from the host to the BMC and there
    > will be another daemon to decrypt them using an internal library.

certificates are public objects.
Perhaps you are transfering a private key?
Is this an IDevID-like installed by the manufacturer, or is this a cert/key
to be used on the production floor (DC).

If you have a daemon present that can decrypt things, then you already have a
private key (or symmetric key) present, and that key is subject to attack.
(Unless you add yet another layer of indirection via TPM chip....)

I strongly recommend that you do not invent new technology here.
EST (RFC7030) is considered the best technology here, with SCEP (RFC8894)
being a legacy choice.

    > My questions are:
    > 1. Is this a reasonable approach?
    > 2. Shall we define an OEM schema for our request?

Finally, I am working on a BRSKI (RFC8995, aka
draft-ietf-anima-bootstrapping-keyinfra, not quite published, still in middle
of AUTH48) module for OpenBMC.   You may prefer help with that instead of
inventing something that hasn't gone through the same level of review.

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [



--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAmB7LggACgkQgItw+93Q
3WXj9wgAhOsfa4MLjXYf5bLvAY6hSAq7fKI2VkyxEdGdZhhBv8rVAYWto/ORCTMK
AfdDvOZM/WooOtOG1Udcudys8otl0BxY5qyM06C89+Yqehda11AKF1JR8lSkkHDa
lsGdOw60ZDILIJH3mNBniV39TnLLnWMw7+Vfiymfe5smgwej7Nvu1ihEnuoOE0a9
nJYXfKP33cRe7oHY7WmV7bUP+zFpf3ZAvzwoRyfNayioG5iSkL0VI99DzadCluKk
HHV4xWKFBxXFK6HwBg+Lh1N6Bmb/H9WJdf+w6e7hpNqPGOSpVwUZH3Eym45lLQep
e5CyTW2jKsAdvGbDMjPkqrG7d+ap3w==
=/eS0
-----END PGP SIGNATURE-----
--=-=-=--
