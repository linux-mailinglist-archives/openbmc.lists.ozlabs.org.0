Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3B05BCCA5
	for <lists+openbmc@lfdr.de>; Mon, 19 Sep 2022 15:12:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWQ860xV0z3bl0
	for <lists+openbmc@lfdr.de>; Mon, 19 Sep 2022 23:12:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sandelman.ca (client-ip=2a01:7e00:e000:2bb::1; helo=relay.sandelman.ca; envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Received: from relay.sandelman.ca (relay.cooperix.net [IPv6:2a01:7e00:e000:2bb::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWQ7p4jptz2xJ8
	for <openbmc@lists.ozlabs.org>; Mon, 19 Sep 2022 23:12:20 +1000 (AEST)
Received: from dooku.sandelman.ca (dynamic-089-014-037-053.89.14.pool.telefonica.de [89.14.37.53])
	by relay.sandelman.ca (Postfix) with ESMTPS id 20C891F455
	for <openbmc@lists.ozlabs.org>; Mon, 19 Sep 2022 13:12:10 +0000 (UTC)
Received: by dooku.sandelman.ca (Postfix, from userid 179)
	id 7DD5D1A0FCB; Mon, 19 Sep 2022 15:12:09 +0200 (CEST)
From: Michael Richardson <mcr@sandelman.ca>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Whether to allow setting time in NTP mode
In-reply-to: <CAGm54UF4wa+LhMi0KXjp3cx8R0DUg-Zk=cipA3__Fm0xHFdyQw@mail.gmail.com>
References: <CANFuQ7DkAwQqLZoOMPmTURUWDdk=Kfx1xTFN2jE9VQQH-wmhSA@mail.gmail.com> <CAGm54UF4wa+LhMi0KXjp3cx8R0DUg-Zk=cipA3__Fm0xHFdyQw@mail.gmail.com>
Comments: In-reply-to Lei Yu <yulei.sh@bytedance.com>
   message dated "Mon, 19 Sep 2022 19:32:06 +0800."
X-Mailer: MH-E 8.6+git; nmh 1.7.1; GNU Emacs 27.1
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 19 Sep 2022 15:12:09 +0200
Message-ID: <633382.1663593129@dooku>
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
Content-Type: text/plain


Typically, when the time is very very far away from the synchronized NTP
time, NTP is unable to change the time.  So while NTP might be synchronized
with a NTP server, it is unable to force the time in a gradual way.
This is often the case where the system time is in the future.
An administrator usually has to force the discontinuous time jump.

So, it seems entirely reasonable that the time should be able to be set while
in NTP mode.


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEERK+9HEcJHTJ9UqTMlUzhVv38QpAFAmMoaqkACgkQlUzhVv38
QpBjvQgAnbsCYL+D6xj8VmkHyCWhxPUigku6WI+q2uNg94Wo6epOTp2dbmBTEJZ1
FxORQG8iTZ5QLqfxXpclfJj3vtFhY9be2SfsGznZkfukzhBeZuUmNEYyUtiGq4wJ
017jWVCXkNCcXpdpzVmTi6kk36OtfLr+9W1C9oURu5KXkxpJmX5yKdwx3K7Z4AJO
ORAdntNMIPkJIxrOR9QuJDgebkM6VQ6y+gJn/8AKC2Sc2CJJYm0Ox8kAX9T1AHai
pQRMxGWVMxvophBNuzWDRrdPP3D25J4sjmm6q//zz5Z+7mTU05hj8VThaCBuXgpW
bBPkkKPXd+I7pR+lllg210S9J6qcSQ==
=OFvR
-----END PGP SIGNATURE-----
--=-=-=--
