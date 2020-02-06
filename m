Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AF01545EB
	for <lists+openbmc@lfdr.de>; Thu,  6 Feb 2020 15:17:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48D0r80LgBzDqbm
	for <lists+openbmc@lfdr.de>; Fri,  7 Feb 2020 01:17:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=sandelman.ca (client-ip=2a01:7e00::3d:b000;
 helo=relay.sandelman.ca; envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sandelman.ca
Received: from relay.sandelman.ca (minerva.sandelman.ca
 [IPv6:2a01:7e00::3d:b000])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48D0qH1zlnzDqGv
 for <openbmc@lists.ozlabs.org>; Fri,  7 Feb 2020 01:16:41 +1100 (AEDT)
Received: from dooku.sandelman.ca (unknown
 [IPv6:2a02:8109:b6c0:52b8:1993:81d7:2ab0:b9b6])
 by relay.sandelman.ca (Postfix) with ESMTPS id 6F6F21F45A;
 Thu,  6 Feb 2020 14:16:28 +0000 (UTC)
Received: by dooku.sandelman.ca (Postfix, from userid 179)
 id A2EBB1A0928; Thu,  6 Feb 2020 15:16:27 +0100 (CET)
To: Samuel Herts <sdherts@gmail.com>, openbmc@lists.ozlabs.org
Subject: Re: OpenBMC Starting Point
In-reply-to: <CA+k9xxZXUjn=n1SCnHb28_iTN3cEG0yv_QB+Qh7DgcUNdXD4LA@mail.gmail.com>
References: <CA+k9xxY2wfrzE=kQOM24wc5pgs+poqNEKyHooQNfxNfZrSsGFA@mail.gmail.com>
 <5937.1579503424@localhost>
 <CA+k9xxZfreCU8L=G=vUJBODdyjPU_p8+d7_LycNi_ShAZzwMjQ@mail.gmail.com>
 <37BC22AA-C168-4A36-98D8-DD31E78BDE03@gmail.com>
 <CA+k9xxZXUjn=n1SCnHb28_iTN3cEG0yv_QB+Qh7DgcUNdXD4LA@mail.gmail.com>
Comments: In-reply-to Samuel Herts <sdherts@gmail.com>
 message dated "Fri, 31 Jan 2020 12:15:19 -0500."
X-Mailer: MH-E 8.6; nmh 1.7.1-RC3; GNU Emacs 25.2.1
From: Michael Richardson <mcr@sandelman.ca>
X-Attribution: mcr
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 06 Feb 2020 15:16:27 +0100
Message-ID: <7094.1580998587@dooku>
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


Samuel Herts <sdherts@gmail.com> wrote:
    > We got the Hello World to work perfectly, thank you for the assistance!
    > How would we now go about doing the exact same thing, but hardware
    > implemented?  By that, I mean actually running the phosphor state
    > manager modified module on the physical BMC chip? How do we install the
    > OpenBMC sdk? Also, is there a method to read from the computer's BIOS
    > chip from this modified state manager?

I'm aware of only one hardware platform that explicitely supports openbmc,
and it was rather expensive.  Apparently it can run on quite a few other
boards, and I'd like to try to get a list of things I might be able to get =
on ebay... I don't need something new to experiment with... old and well
documented seems better to me.

I don't think you'd ever install the *SDK* on the target system.
You compile it with the build system on an ubuntu server or equivalent
container, and then install the resulting image as the BMC image.=20
That might require a JTAG load for some systems, and then OTA afterwards.


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEERK+9HEcJHTJ9UqTMlUzhVv38QpAFAl48H7sACgkQlUzhVv38
QpCkzggAk5J0pGeiOjMIWc0c/uTUoRA947RKv9xC8LXa2x2xYXI+T2URYWxYjaK+
kLJl4HOMXWuxwaE9guDDoPgYCuAQ4/L1VlqS77meKkFBeh6v6YOmiCpP1PhGBMdX
wlJMjKS57dn15kiFmdwfxYsMYTtMwM5dbgjomwbKj2zwCGK1QT4/UCEFRohSOvWF
Mb5shWsDlLOiw7mSY1nscHM1b+E8Ymwr2OJ6AupDq6zDCnk4VzRfhPgtTbOpEkoz
HjrhPo8s+FrhWzTyxef4EQCN0DaD8YI83gKyulkusQLMUKgw6llP4PzjiQ8ZrfzI
IygDMnFDYcj4fjfPFwAqM5QyVoBRXQ==
=vqyd
-----END PGP SIGNATURE-----
--=-=-=--
