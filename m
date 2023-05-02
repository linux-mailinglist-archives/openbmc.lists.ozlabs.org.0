Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC906F4C61
	for <lists+openbmc@lfdr.de>; Tue,  2 May 2023 23:51:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q9v0d4q9qz3cFw
	for <lists+openbmc@lfdr.de>; Wed,  3 May 2023 07:51:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=sandelman.ca header.i=@sandelman.ca header.a=rsa-sha1 header.s=mail header.b=UC88cP29;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sandelman.ca (client-ip=2607:f0b0:f:3:216:3eff:fe7c:d1f3; helo=tuna.sandelman.ca; envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=sandelman.ca header.i=@sandelman.ca header.a=rsa-sha1 header.s=mail header.b=UC88cP29;
	dkim-atps=neutral
Received: from tuna.sandelman.ca (tuna.sandelman.ca [IPv6:2607:f0b0:f:3:216:3eff:fe7c:d1f3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9v022chcz3bdm
	for <openbmc@lists.ozlabs.org>; Wed,  3 May 2023 07:50:39 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by tuna.sandelman.ca (Postfix) with ESMTP id 998AB38990;
	Tue,  2 May 2023 18:08:51 -0400 (EDT)
Received: from tuna.sandelman.ca ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1TXnwivVleMB; Tue,  2 May 2023 18:08:50 -0400 (EDT)
Received: from sandelman.ca (unknown [IPv6:2607:f0b0:f:2:40a:34ff:fe10:f571])
	by tuna.sandelman.ca (Postfix) with ESMTP id 56F123898F;
	Tue,  2 May 2023 18:08:50 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sandelman.ca;
	s=mail; t=1683065330;
	bh=rJXSJF5UudKCSRmmoEcoQvWrcXO7TuOIV1rzzWLU4Bg=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=UC88cP29Xw0cyS8E9cQdMgQ87iomexsmfTV1HULXLh7afNjTbtPer3CgF4I8Vc5gH
	 A0fRonPF64TddfyEn0n2+4dwaTLW6TSx3wbVIjMVXpvMvkuC8xY0OwJBhlNHZ71pB5
	 LdH6DeVFMG2XErgjzFAkcncv50ESXxVESNIKN9l0+uSiJr45fAxdxWrRNH0+FoxM3H
	 rQofLWDytRod76Ui2OLBU4B5BXZVxvKjckNttqO85zU6ybwy1AM6JYNiC+6/jGKFOB
	 W3sykt70lDLeudlvm7KefXivUD5wblUWOynS2XqkfgA7OchGx2vqYuUcr6PjlBq80z
	 82tPQKOGhNmwA==
Received: from localhost (localhost [IPv6:::1])
	by sandelman.ca (Postfix) with ESMTP id 3BBA96D;
	Tue,  2 May 2023 17:50:32 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: Andrew Geissler <geissonator@gmail.com>,
    OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: Preventing a system power on before BMC Ready
In-Reply-To: <0992ABFC-7CD8-4E4E-8731-167E59C8A9F7@gmail.com>
References: <0992ABFC-7CD8-4E4E-8731-167E59C8A9F7@gmail.com>
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 27.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;<'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 02 May 2023 17:50:32 -0400
Message-ID: <21047.1683064232@localhost>
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


Andrew Geissler <geissonator@gmail.com> wrote:
    > That got us brainstorming about some possible solutions: - Write some
    > code in bmcweb to send a =E2=80=9Cbmc state change event=E2=80=9D any=
time bmcweb comes
    > up to ensure listening clients know =E2=80=9Csomething=E2=80=9D has h=
appened

useful, but not foolproof.

    > Queue up the power on request and execute it once we
    > reach BMC Ready (not sure what type of response that would be to
    > Redfish clients or what error path looks like if we never reach Ready=
?)

this seems like the best plan.

    > Push bmcweb further in the startup to BMC
    > Ready, ensuring clients can't talk to the BMC until it's near Ready
    > state

The problem  with this is that if you can't talk to the BMC, then you can't
find out why it was never Ready.



--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCgAvFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAmRRhagRHG1jckBzYW5k
ZWxtYW4uY2EACgkQgItw+93Q3WUqUQf+My6grVW5einsHkhFS1GbtVfThmWdWLp3
2TRRonIBnfigvSnD74rHCKEwaIJzOHRMiJDpb7DYS2w/sKc/9GRMDiissdO/CIGT
HkbBY841fMorb/PJ8zC6kPasqK3jq8GZ2K5aN6E5CsSqqt6f7Bz7LEzH8Q0wJZ3n
YQZX18OrIJIOM/uvGoGQ/OFDtPhCPbOFdr0U+0b/QgDe3dvriyL+nLOc9z2dJYWe
4DFPNmGbHHCzkV9Vn9n8YinHepMo5L49ffK3fIuqz2g//EZl+AU12zk0cnaLi55D
RZZFQCiur2SpOFnwex86kFuy3pb9mOuVNaYW8g72z2AODFlL1ObPCA==
=n8a0
-----END PGP SIGNATURE-----
--=-=-=--
