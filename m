Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2661AC9236
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 21:22:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46k5ck4bYmzDqTZ
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2019 05:22:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=sandelman.ca
 (client-ip=209.87.249.19; helo=tuna.sandelman.ca;
 envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sandelman.ca
X-Greylist: delayed 360 seconds by postgrey-1.36 at bilbo;
 Thu, 03 Oct 2019 05:21:29 AEST
Received: from tuna.sandelman.ca (tuna.sandelman.ca [209.87.249.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46k5bY4NWdzDqVR
 for <openbmc@lists.ozlabs.org>; Thu,  3 Oct 2019 05:21:26 +1000 (AEST)
Received: from sandelman.ca (obiwan.sandelman.ca [209.87.249.21])
 by tuna.sandelman.ca (Postfix) with ESMTP id C456B3897A
 for <openbmc@lists.ozlabs.org>; Wed,  2 Oct 2019 15:13:08 -0400 (EDT)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id 808764F4
 for <openbmc@lists.ozlabs.org>; Wed,  2 Oct 2019 15:15:11 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: security WG meetings
X-Mailer: MH-E 8.6; nmh 1.7+dev; GNU Emacs 24.5.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Wed, 02 Oct 2019 15:15:11 -0400
Message-ID: <17116.1570043711@localhost>
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


Just to mention that 10am PDT is not 19:00 UTC.
It's 16:00 UTC.  Sadly I missed the meeting, as I scheduled it with UTC,
thinking it the most reliable.
I edited the wiki to change things.

(Also, it would be great if the ibm webex could have the webrtc mechanism
enabled for the meeting)

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAl2U9z4ACgkQgItw+93Q
3WVUNAgAh8nNwDt2I55t+Xj8vt8+DvFNPhmP2u5DzZ/grprCbc8B3VwO3cu80hFd
xTu72bASPCMZgxyHjKNl36u15+b7dgWeB9RnjtfYJgWrG1DaYVvbmWCZ2Z+tpQEL
wcugwrgtip3K4eZ7nUVV99XSFs+zNNEHIOU86/Asmre02fu0yGiFG4+O5FOD6hn0
9bLOVQTrwGysxfNzDz+zGwraAqkP0RjJ+CCQ6rzgyDw+gZHFt2MhRPxrJjKs19zP
/H4bWmJY6+ZBeRn8fyyftdU94L01xZ9/OXnWcJqfs7CgVMSat7cDeocGKR53UPIe
8sa+ZqhajTyj2ii3fetT7TnsfbusWQ==
=5iAM
-----END PGP SIGNATURE-----
--=-=-=--
