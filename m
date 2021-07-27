Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0C13D6B11
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 02:32:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYd605sQSz30LB
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 10:32:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=2607:f0b0:f:3:216:3eff:fe7c:d1f3;
 helo=tuna.sandelman.ca; envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
X-Greylist: delayed 353 seconds by postgrey-1.36 at boromir;
 Tue, 27 Jul 2021 10:31:55 AEST
Received: from tuna.sandelman.ca (tuna.sandelman.ca
 [IPv6:2607:f0b0:f:3:216:3eff:fe7c:d1f3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYd5l58Wnz3002
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jul 2021 10:31:54 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by tuna.sandelman.ca (Postfix) with ESMTP id B536E389B3
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jul 2021 20:29:37 -0400 (EDT)
Received: from tuna.sandelman.ca ([127.0.0.1])
 by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id mE74hbyhcT7t for <openbmc@lists.ozlabs.org>;
 Mon, 26 Jul 2021 20:29:34 -0400 (EDT)
Received: from sandelman.ca (obiwan.sandelman.ca [209.87.249.21])
 by tuna.sandelman.ca (Postfix) with ESMTP id 9F71738984
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jul 2021 20:29:34 -0400 (EDT)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id 1065E454
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jul 2021 20:25:51 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: openbmc@lists.ozlabs.org
Subject: do you have expertise on Universal Power Supplies standards ?
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 26.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 26 Jul 2021 20:25:51 -0400
Message-ID: <20989.1627345551@localhost>
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


I wondered if the BMC people might have experience interfacing with UPSes
(UPI?).

The RFC Independent Submissions Editor asks

From: "RFC ISE (Adrian Farrel)" <rfc-ise@rfc-editor.org>
Archived-At: <https://mailarchive.ietf.org/arch/msg/iot-directorate/S5HB9pr5wmwwXUwpFeYJnCAFj6E>
Subject: [Iot-directorate] ISE looking for someone who knows about UPS
Reply-To: rfc-ise@rfc-editor.org
Cc: Adrian Farrel <rfc-ise@rfc-editor.org>
Sender: "Iot-directorate" <iot-directorate-bounces@ietf.org>

Hi IoT Directorate,

I'm looking for someone has some clue about UPS systems to help me with a
review of
https://datatracker.ietf.org/doc/draft-rprice-ups-management-protocol/

I thought that you might have someone in your team or know of someone who
could help.

Thanks,
Adrian

PS. Not a request for an IoT review



--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAmD/Uo4ACgkQgItw+93Q
3WW9dwf/QhO1oXNyh+gv/fyqEb75dDi6gfsLuncBW2jX5LpIb+875XNOSawCYFsF
gPNv0Af/hcAPXp2hZzwSmqA9N3NerL22zqahD76/C1n6DRortOe7N19/Y7xtbFJc
CU17nIR8RDX+Tw6UH5FrnNZtZpqAfc6ljzhviirwRGou8Pki2E8jtEvOcizqXPfh
qdvr08EsRmOu0bvPwzwpMTGWKekyBa5s4gmP1pqxpWWTTitvsyvTDgOC9D2FXa8u
Ogty6mm3yHX7p5HI3Nebkmz+lZxknznx+cQfwhQn5ncgiy94HsrAmIclGHVzKqa0
jsfwvyLo82OpkFLZLToG8S9/DmX7uw==
=+r5z
-----END PGP SIGNATURE-----
--=-=-=--
