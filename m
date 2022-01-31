Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC3F4A4944
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 15:25:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnVjB2JJ7z3bSk
	for <lists+openbmc@lfdr.de>; Tue,  1 Feb 2022 01:25:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=f2nlwxzM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.15; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=f2nlwxzM; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnVhl344Pz2yZt
 for <openbmc@lists.ozlabs.org>; Tue,  1 Feb 2022 01:25:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643639113;
 bh=ehSjDK/Iae1v2IccId5qAltsF3KOLcwapIX39KqVTCY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=f2nlwxzMyT4UvPl2ucXe3p4zKEAgQpat1eqJajqh7JNep3Ir1kZgEDwfJFVT6K+2e
 b4hGBd57jiZhA0N7xe71YrxROIeB9cWYAd/s+M3h+XFUdp4Ypp1mVZRh+8/ZSNWQRZ
 ao/WNM9QAdQwSmLyXJx3q2gBtNOMJyul1LstFBA4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8QWA-1nA7lx2Eeu-004SB1; Mon, 31
 Jan 2022 15:25:13 +0100
Date: Mon, 31 Jan 2022 15:25:12 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] ARM: dts: wpcm450: Enable watchdog by default
Message-ID: <YffxSG5DnSlqcExz@latitude>
References: <20220128221054.2002911-1-j.neuschaefer@gmx.net>
 <CACPK8XfMm7jJ9QYOBr1HiR_22xPEzx9MZXO_CX7MpQt2QAVSUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="w4V948X9R1/Z8oOO"
Content-Disposition: inline
In-Reply-To: <CACPK8XfMm7jJ9QYOBr1HiR_22xPEzx9MZXO_CX7MpQt2QAVSUg@mail.gmail.com>
X-Provags-ID: V03:K1:XTUAjSTdTaeMdJB8cJ6hq3TWxlKJx0T5ZE597sEMtbUHI/T+Wqm
 rtGsQCftyp2e9VIkmdyKNSCMyNnNWTnHdO1QX2KKvxeC5vyzluk2rLF2rMYH6NULJe6x+N4
 rK62fTEYumDcBswXh0Min4gubiq5KSu4FpLhSp2BoWXZpEjEpLfxlPwfQFsa7vUTJqldJni
 VenLVdm3JCKUeDBP3uI/A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HCHlTGcWjZM=:KAUBrVP9gV6eaPxbMX6HHk
 84w2czrQzw6kHH0OszKlc0nIM24rHbWicbyjoq6044PTBZKbX6ShoI5SGJm69E8ahdE7Zrgp0
 kP7uyqronMwOctJCQ54sc41JLAvcXBlAL2yw6JN8Ar8UgszSPJv45ppanCAVakT0vH1EH5tbB
 w9LQ+78SFKVKGzA6qitmpwm4LDwAI7aCvI3SDxVDeeE+rdc4Lm8zPrpTRpEhdVIh3itzexTu5
 yulsHpSpVFEeuwRGrb4QUG3/7HpzVgpky5HC6oFzdyXND18GxTdx5DwlT3sMdWAatqftmFmHw
 Fk3LwrjB9aCYpg52OFGZFHqtAOZWR+Ue5s7LedGGbKjhFr4vQiapzdGyTWlMgMD3YhbyyFcy5
 n+VQU4VYPs6i1eH3h0YYXE7H/mJu8NVEhRNsFr2XysEy7zv+23+HJhANxb951hKGnuxdJCbV/
 sojHLo4zs+8Q0ZJyhmlWdU83ofdZxiS4uRC05EZ1hsjDIX3G4rEsMyvo3WssC/x9C8QlZRcRI
 /Kb/NH/txQN2yCevbahw67mlCHNOnvyuw8aMbTyED33OtUrUHbrQvYBZ9A2qyyDArK1gLwXK6
 7CWGBnvs0d+VWU5VlL5nbnMLYpku9dLh8tW6GvkEwbBKEkQY9M5UPfyygap66YyhP/HSD7znh
 7cbdD+S6I9ji5BHwI/eswO0nPUpGa/ChyC709RoEVdb8qe8t+uQnpAoPLM3L1PAqRf7Gpjmcz
 VgSr5zAZxbgCQnrZ1ffLxhJFEvBAPTcBoWEsjegClnAlHAlkHUpyBIK6qlf4yoPJKbHYPlr6V
 J5HtmHHN5qInSfgoha1wDOMAxnJgiPeo8ql4YguTsLUVqq7dvxdV5nvI9mUJ2RhmQQ+L76lA5
 dudZs9BzyFbTocfmye7phgCSTu0Wt/9JhPwRGMlAryLlqfFzqKsD3fYpjFOw3OvixXnJE+hzE
 qmfxwE0laG94mocZaQr3AMw82Wbr8f8Ke3lemZqdUC4eVhnqeT71QagICvhe9oiF/Typ0h+8L
 SCJDM5NQe3ZajB28PkTmf2ponz41DYvTkcI0h/+Qe9pilhwI82Y9n6J9dQ+ksV+PTQk8TI8+q
 sCAHLRmrl2uCLQ=
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
Cc: devicetree <devicetree@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--w4V948X9R1/Z8oOO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 31, 2022 at 06:37:51AM +0000, Joel Stanley wrote:
> On Fri, 28 Jan 2022 at 22:11, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx=
=2Enet> wrote:
> >
> > The watchdog timer is always usable, regardless of board design, so
> > there is no point in marking the watchdog device as disabled-by-default
> > in nuvoton-wpcm450.dtsi.
> >
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
>=20
> I assume this makes it always available for rebooting the system too?

Yes, that should be the case.

> Reviewed-by: Joel Stanley <joel@jms.id.au>


Thanks,
Jonathan

--w4V948X9R1/Z8oOO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmH38ScACgkQCDBEmo7z
X9tFYw/3bxM4Wd2fFljFXp8dKC2PZhF7cFvy58oTsrE1/vNSpIUNWscWFmE5lR8i
nUFUDPCjt+7s0eesw85tpZ/xZELXJ9HOImTMa65itII/c6bKOivWy/4cV0XUE3pI
d+4T5rGN972krFdkMWK0gXxjzEfUXxmwskuyVmdZIiDBrEg872YL3uJw8DeDn8tW
QNYhF6bx+z5RDeTVvRYk8TzvEiw+klqGdIvNo+HNUPSSAyJwcX1tDtXvCYOgxJIU
Lw+8e5ErQm9XFYykDpOPtbqeJB11p2i7I+buoBR+33nQ06JWXPw7DkHdgEzNMYMb
rsuui5i1hpDpCMmdGJSZEWsmOYPFgOJld04wjsMuWsn98KaQZkjU7zNWXt1ckI9h
3UOEPktkRw+vVzlgH+hdbdjmf1eA9P/ue9CiX5bAi86wrT4Ivhdl3OarhkYIaKuZ
P8S7IsVxrZtBo6JrxLrkVV5Al60831Wc73qDrHWGRcz7olnQJfv4Eq4LtRIFllKQ
YH+8e5lIJdEHGxJSWBGBz8XcIjF9DHJ9++SauOoFOJ8QkRr2HtiWz4HxFaZrXgxX
2h29zyo04HHAvzVCWwT4WAShNhaLIFFCtt6BlJl52T9XRbbTevDkYkbs8lQ50FyC
5fdJkwITCEtrolWiSEM/dHnFUUtj8wgdz72HnBq/iNZjA582sA==
=GM37
-----END PGP SIGNATURE-----

--w4V948X9R1/Z8oOO--
