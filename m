Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6B91DDA8D
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 00:50:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SlG60gMtzDqx2
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 08:50:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=176.58.120.209; helo=relay.sandelman.ca;
 envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sandelman.ca
X-Greylist: delayed 541 seconds by postgrey-1.36 at bilbo;
 Fri, 22 May 2020 08:49:02 AEST
Received: from relay.sandelman.ca (relay.cooperix.net [176.58.120.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SlCy4dBczDqdw
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 08:48:59 +1000 (AEST)
Received: from dooku.sandelman.ca (unknown [209.87.249.16])
 by relay.sandelman.ca (Postfix) with ESMTPS id DAE951F449;
 Thu, 21 May 2020 22:39:47 +0000 (UTC)
Received: by dooku.sandelman.ca (Postfix, from userid 179)
 id CB08A1A329C; Thu, 21 May 2020 18:39:46 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: Sui Chen <suichen6@gmail.com>
Subject: Re: An IPMI Request Visualization Tool
In-reply-to: <CAFaEeaGs0GSiPp9mGVrSMB1brG19ttroPcK-x-p+BN3SnHrU4g@mail.gmail.com>
References: <CAFaEeaFTP9v1xZefxzoU9E6h7SpjfbxVrnnSRCmJfJ3QjWRqhA@mail.gmail.com>
 <20200514135723.GE1166713@heinlein>
 <3d6db63b-f670-4e01-94c3-425f93d89708@www.fastmail.com>
 <CAFaEeaGs0GSiPp9mGVrSMB1brG19ttroPcK-x-p+BN3SnHrU4g@mail.gmail.com>
Comments: In-reply-to Sui Chen <suichen6@gmail.com>
 message dated "Thu, 21 May 2020 09:44:05 -0700."
X-Mailer: MH-E 8.6; nmh 1.7+dev; GNU Emacs 25.2.1
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 21 May 2020 18:39:46 -0400
Message-ID: <2775.1590100786@dooku>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--=-=-=
Content-Type: text/plain


Sui Chen <suichen6@gmail.com> wrote:
    > Thanks for your interest! I'm also using dbus-pcap to track certain
    > issues on the BMC recently, and would like to add support for all DBus
    > messages to the visualization tool, making it somewhat resemble a GUI
    > version of dbus-pcap.  The goal would be to be able to use this tool to
    > investigate both DBus and IPMI. The way I plan to use it would be more
    > similar to how I use GPUView (full-system timeline rather than
    > inspecting individual packets)

Interestingly, I was not that clearly aware of dbus-pcap :-)
I ought to know more, as the lead libpcap maintainer.
Is this visualization tool part of openbmc, or is it a generic dbus
visualization tool?

We recently brought rpcapd into the mix; it can be invoked via ssh.
I wonder if that might help you as a debug tool?

    > If you ask how this user interface might differ from the already
    > existing dbus visualizers such as bustle, my answer would be: it will
    > present information in a way that's more relevant to the BMC, putting a
    > bit more focus on BMC-specific DBus messages, such as HWMon and RedFish
    > DBus messages, to present information in a high signal-noise ratio way.

Would this need to run on the BMC itself?

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        | network architect  [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEERK+9HEcJHTJ9UqTMlUzhVv38QpAFAl7HAzIACgkQlUzhVv38
QpBaOAf+Pf6JMg07LS72Ol4ehZgcVrCoxtJjcn9qUeu4vUQgnslxvehuPI7IN7o3
QZhF+Sj1xMkzveLZOVPS0b9VzGzG6bmWKALGb07/Nxr0Or1Mrvl0uhygLv8esu2b
UzDAbfooT7xS3oL7PI++m4Lh3Lxx4gMzEZ0ZTHkf0q8A5Hrv2GZNf7ppV+XG5oBo
z9aAZ2TlVL0sgz67goEYT6nhtfktbo+FZ4+uJY7VgDGH1V42lPieVlkeri2QaV6E
iF4KoAnNgeaRYJ7Uilkx9zwx0z387z/VET/PVvLXG6KpUVIlI8XkPAx8zKTbjTJ7
yOyxsxfraIRNPOZwWrvTanAuCoKY3w==
=2/fb
-----END PGP SIGNATURE-----
--=-=-=--
