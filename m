Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9843C4A359E
	for <lists+openbmc@lfdr.de>; Sun, 30 Jan 2022 11:13:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jmn833z8Fz3bY0
	for <lists+openbmc@lfdr.de>; Sun, 30 Jan 2022 21:13:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=C6kw3R2J;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.15; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=C6kw3R2J; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jmn7c19tdz30Mn
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jan 2022 21:12:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643537548;
 bh=SgtETV3pmtkRyAIs7r+Qn+jWrpPpCwX59UiK37U4GL0=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=C6kw3R2Jlje1tsUpZ6yAJYu9CAjFfFBN2ilcdWRH335IeYHzP+9M4os2F03BntwNl
 bx2LTarKShpP7DOxWD4FxYUaRMA5X0lXWKbjdL3IqcgjbeomKSvtCaUUlhHaHA5YW/
 4tF6ugtko5mVSF5N958uvu4HiXCAUO5YSfU5Q9Xo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mg6Zw-1mbECw2pG2-00hdmK; Sun, 30
 Jan 2022 11:12:28 +0100
Date: Sun, 30 Jan 2022 11:12:26 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 0/9] Nuvoton WPCM450 pinctrl and GPIO driver
Message-ID: <YfZkis8M81Ejpagq@latitude>
References: <20220129115228.2257310-1-j.neuschaefer@gmx.net>
 <CACRpkdYEigGHkoGfBg15tFXadgpXUAjDOnw7ePXhmvHJqPEJXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9tf0nr/Ix68M68t8"
Content-Disposition: inline
In-Reply-To: <CACRpkdYEigGHkoGfBg15tFXadgpXUAjDOnw7ePXhmvHJqPEJXw@mail.gmail.com>
X-Provags-ID: V03:K1:iyp26pep5akVPgkkRAuLOIJKj6qresdBew0FhiMgO53ykHBRXCj
 ZUS/yZ5ZMaODKymNpSMy7CwW0jwzsvIrbtxnFSXJIPiCJuQiHfsV7QX8oW2qe4fa+aaARWh
 idmnGoAOn9/7mux6flNazuAWMtzU7pQV8qEUpK6BBbSd0sK9XrEwsbxNJs9+Bry8yUcDhc2
 1awIOR24QYNFrLXhoK7kQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/msJRPAl0fo=:acJASe3vTTJl+wJlquGII2
 K0GKv3bPw0VowCPxLJ/1SjnyIGGrgcTpFWppmFXBz5GfVdn25Hq7ASEs56vhXEweIxYU/EE7T
 3nHOp/pBHeSXfq9ca+Rjdy3WT1PlGKKd7fppare3knu/IVh192RLK7IRpUXWyQS/jV+N/J8MP
 RPS7h4RQukGvfC2bSffK+BW+iIEYfXFw9m2gDBNrDkVrMO8x5x/8klnbMs8+GqQcCCv8hDfI8
 4Ik9q9quhZoAnXrr2St3bBI+/hIz3lI+7GO7dD9QqDN8NzdSEhSuB+mXin96HnJT4tqxdDYXG
 oh59wNKPE2b/g0RUfL+a2BGoBr3X5hqtQHMQ0BtRe3dpO5sx7p2TwGUdhstW714Vsu5hNN6Xw
 Nf9rH5UrBCZDiovJ4D3eeugHKjdZI6Tocw3xBoo/zMJO4FTb/c1l+PwM0W07wrnYGZEKmVAcz
 0unDq9ub1EfQeiC/hhPAK7GOZuXaCn86YJJgr2QwIx/dE2wiV18wuT2MRYifdWH6dqQ5mz8jR
 XIkq7kLP3Zhx/c/vfgDJsHuNySgSk+jz+9BWAcOjAfKyoCWXAOcu+/XapTjUYOAJRpYMVfmF+
 1E2/ILEJAxS4kOeoFSaKVUEgyP2I4gUSlte9ygHHviD6Cku2KVTQGJWRIxc547bwdH57OEanR
 vpaeZZhYRLaWREbCVCskv6gfOiePo5+EBFja0n2wNEisGDbCXQRYmyBMqFI6B99JltgygcaUr
 NwqN9Dq9yN7mEOabDDbYasi+GnQQprcVcEGiuJR2pwi8YdCYT10QRn1Hz829fzLwefEss/UNF
 DbH75AzkCaakGIh/eurItrfoOFy/hoIKutMMOcFhp0C6l3tAb9T8eClsRUeeS8wQnoW4M4Ebq
 Jg2+t48tgsl2CYhdzCs1qI06j8ygOMECYPUpXAvqXPomHhCvQv0Fplb3Ljc3kykxYDuxgLY6q
 BRrCA68WmQYrSUSv4MKxbGJZsIMOouLJjYgeGztq9r0qYz6V3eCIHDEU+RNuALndvMJdrTeZW
 vAoAuI0rS4s+PHzQqYAXNUFVoiVH0a2AN3DiTs3+5P+nOK6qTEeM9ma8N4knmmoneZCMaxsuI
 Wx7+mgNNnrL5bQ=
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 openbmc@lists.ozlabs.org,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--9tf0nr/Ix68M68t8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 30, 2022 at 02:50:25AM +0100, Linus Walleij wrote:
> On Sat, Jan 29, 2022 at 12:57 PM Jonathan Neusch=C3=A4fer
> <j.neuschaefer@gmx.net> wrote:
>=20
> > This is version 5 of the WPCM450 pinctrl/GPIO driver patchset.
>=20
> I haven't had time to look in detail but the kernel robot is complaining
> about patch 5...

These are warnings about the pinctrl-npcm7xx driver that became (more
easily) visible under CONFIG_COMPILE_TEST through my patch.

>=20
> > I was originally just going to rebase the patchset on top of v5.17-rc1,
> > but while testing, I found that the IRQ handling code violated locking
> > rules, specifically that it used spin locks (which can sleep on RT kern=
els)
> > in IRQ contexts. So I made a few changes to fix that, mainly switching
> > to raw spin locks.
>=20
> Which patches do you expect to be applied to the pin control tree?

These two:

[PATCH v5 4/9] dt-bindings: pinctrl: Add Nuvoton WPCM450
[PATCH v5 5/9] pinctrl: nuvoton: Add driver for WPCM450

and the rest can go through Joel Stanley's BMC tree, I think.


Thanks,
Jonathan

--9tf0nr/Ix68M68t8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmH2ZGcACgkQCDBEmo7z
X9tKThAAkxBAOkurvxwqssGXBIiKgfhR5IhR5guWRy/IpQvWJDOLHP5thgxHFAHC
w228HDmeyx1LfCeUlmxTy7R3i9lOaLkKfuTSW/K08DdqLg1HBmYTGxg+q9kYQAhX
VCujcFu8l6orsSJvtG/v9Y7bZSCK0rz9jvULMdZv+TaBNsMszsS8UuCfNs15tiIm
9ZxxAB6GsrOSSTlBcZlzAelj+f3+ipcRw0+PCotO1G+fwC0wNqD6/bbc2YTsLFtd
wj+B4g9DPdzO27KT46LTydrowkzX8V3m5EzJly4FnLRdNWXA5m7gBw9PjZXcgbF7
fbKboRslghYE1bkm3L8l2K+bWxeHxJ9hWJGZZxqGA5d1i4JznuyIAuXJpYttuTlg
rtZarxAmWhX8UsxbqAidvFcJu8XFioMhZgmVTSgbB9qj9bzW8iTHru4O981D3YoE
FKVp3KcOCk4otZ0M+C21lMwdAyLhD9OqzNjhe9jkMpfD+AnZLlCNxzRptjD+8d5n
1mRtaXNl2zIQG7HxIUKLqPWNPylHJcOhWE8NZsFJHvardu44ifYh9/3Yb4F0prR/
HgsKHp1l8dMk0ZErKCDZkKgEHuL0gN5aJ4bihqF3x+Purb1PG3rjpuNhY/qTVKyx
Zv6rk33ASllBwz89Ai41fTm5eiXbFApwqF6If3gHlvFaaebZ0PI=
=sqaZ
-----END PGP SIGNATURE-----

--9tf0nr/Ix68M68t8--
