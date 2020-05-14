Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B8E1D35C2
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 18:00:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NGSm2mXFzDqnM
	for <lists+openbmc@lfdr.de>; Fri, 15 May 2020 01:59:36 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NGRq0TCZzDqS3
 for <openbmc@lists.ozlabs.org>; Fri, 15 May 2020 01:58:42 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by tuna.sandelman.ca (Postfix) with ESMTP id 714A5389D8;
 Thu, 14 May 2020 11:56:30 -0400 (EDT)
Received: from tuna.sandelman.ca ([127.0.0.1])
 by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id mETB8rigcKxN; Thu, 14 May 2020 11:56:26 -0400 (EDT)
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
 by tuna.sandelman.ca (Postfix) with ESMTP id 54CC4389D5;
 Thu, 14 May 2020 11:56:26 -0400 (EDT)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id 3315F213;
 Thu, 14 May 2020 11:58:32 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Security workgroup meeting times
In-Reply-To: <80674629-3a0f-3bca-d5c6-5a0efba7323c@linux.ibm.com>
References: <66647c93-56c8-f64f-4e13-abe1c703f8f7@linux.ibm.com>
 <27d0f3fb-98b9-0a5b-f682-40f95142748c@linux.ibm.com>
 <3a5d85c078c64a0e9bd57a31b9096207@SCL-EXCHMB-13.phoenix.com>
 <80674629-3a0f-3bca-d5c6-5a0efba7323c@linux.ibm.com>
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 26.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 14 May 2020 11:58:32 -0400
Message-ID: <27892.1589471912@localhost>
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
Cc: Bruce Mitchell <Bruce_Mitchell@phoenix.com>,
 Manojkiran Eda <manojeda@in.ibm.com>, openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Joseph Reynolds <jrey@linux.ibm.com> wrote:
    > On 5/13/20 1:43 PM, Bruce Mitchell wrote:
    >> If you want to include Silicon Valley it seem like 22:00, 23:00,
    >> 00:00, 01:00, and 02:00 UTC/GMT are the only real options.

    > I think the current time (10:00am PDT) works for most Silicon Valley
    > folks.=C2=A0  I am looking for a second meeting time good for others =
not in
    > the Americas.=C2=A0  For example, we've has security collaborations f=
rom
    > folks in Switzerland Poland Russia India China and Australia, and I
    > want to find a time that work for those regions.

Perhaps the right thing is to therefore run a doodle poll which is exclusive
for those not in North America.  Then afterwards, the rest of us can opine/=
whine.

On days when it works, 10am PDT (1pm EDT for me) is indeed great, but last
few weeks, I'm booked into higher priority things.

=2D-
]               Never tell me the odds!                 | ipv6 mesh network=
s [
]   Michael Richardson, Sandelman Software Works        |    IoT architect =
  [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails  =
  [


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAl69aqcACgkQgItw+93Q
3WWxRAf+LyY7ovnjf+KxxUCc0yZdK2t8lPL1lVLJy/QREWkKB+NIgjho5QrL2nWP
5HJ5y1httMxsyseRIF6kA5Z55Hakaxe127Is+GxIgIe0u6X5mYBvxwTcs+rkHkIp
QXUlbm3Le5lLf5QLrSzOO2xs6rpSQxcrHuxZ+MRnIHgn8SOb2T0sYaJV9+GpQDU4
aJFdD9OjVm2cJDFTizwhDY/JGPrcxEBIED51TneAIP6a02CokksBjlJrV9yf4A3F
iolDo/uZ6m/1y0rC0lfrseGe48kVAlysaJQtvZUZj3qKy5sb25INqhvxWNemGNA/
qVNJykrLwRkuaruutbptUQXPjP57kw==
=tXBS
-----END PGP SIGNATURE-----
--=-=-=--
