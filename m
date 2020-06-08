Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3325E1F119F
	for <lists+openbmc@lfdr.de>; Mon,  8 Jun 2020 05:08:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gJ982MwSzDqW5
	for <lists+openbmc@lfdr.de>; Mon,  8 Jun 2020 13:08:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=2607:f0b0:f:3:216:3eff:fe7c:d1f3;
 helo=tuna.sandelman.ca; envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sandelman.ca
Received: from tuna.sandelman.ca (tuna.sandelman.ca
 [IPv6:2607:f0b0:f:3:216:3eff:fe7c:d1f3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gJ8K0M6SzDqVN
 for <openbmc@lists.ozlabs.org>; Mon,  8 Jun 2020 13:07:26 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by tuna.sandelman.ca (Postfix) with ESMTP id E29BB389FA;
 Sun,  7 Jun 2020 23:04:51 -0400 (EDT)
Received: from tuna.sandelman.ca ([127.0.0.1])
 by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id HSftr2k9uoG9; Sun,  7 Jun 2020 23:04:50 -0400 (EDT)
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
 by tuna.sandelman.ca (Postfix) with ESMTP id 772D7389EB;
 Sun,  7 Jun 2020 23:04:50 -0400 (EDT)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id 54ECD454;
 Sun,  7 Jun 2020 23:07:17 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: "Andrew Jeffery" <andrew@aj.id.au>
Subject: Re: An IPMI Request Visualization Tool
In-Reply-To: <36873484-3078-4ec5-981e-88e59e619926@www.fastmail.com>
References: <CAFaEeaFTP9v1xZefxzoU9E6h7SpjfbxVrnnSRCmJfJ3QjWRqhA@mail.gmail.com>
 <20200514135723.GE1166713@heinlein>
 <3d6db63b-f670-4e01-94c3-425f93d89708@www.fastmail.com>
 <CAFaEeaGs0GSiPp9mGVrSMB1brG19ttroPcK-x-p+BN3SnHrU4g@mail.gmail.com>
 <2775.1590100786@dooku>
 <36873484-3078-4ec5-981e-88e59e619926@www.fastmail.com>
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 26.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sun, 07 Jun 2020 23:07:17 -0400
Message-ID: <19628.1591585637@localhost>
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
Cc: Sui Chen <suichen6@gmail.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--=-=-=
Content-Type: text/plain


Andrew Jeffery <andrew@aj.id.au> wrote:
    >> Interestingly, I was not that clearly aware of dbus-pcap :-) I ought
    >> to know more, as the lead libpcap maintainer.  Is this visualization
    >> tool part of openbmc, or is it a generic dbus visualization tool?

    > It's not really a visualisation tool so much as a script that will
    > interpret the D-Bus-specifics of a D-Bus pcap. It's a commandline
    > script that provides filtering based on D-Bus match specifications. You
    > can capture all traffic on the system bus in any systemd-based system
    > with `busctl capture > /tmp/my.pcap` and then run `dbus-pcap my.pcap`
    > to dump the packet contents.

Is this something that you'd like to be able to invoke remotely in order to
get diagnostics/debugging info?

    >> We recently brought rpcapd into the mix; it can be invoked via ssh.  I
    >> wonder if that might help you as a debug tool?

    > I'm not sure, I'm not familiar with rpcapd. I'll have a google.

https://www.ca.tcpdump.org/manpages/rpcapd.8.html

    >> > If you ask how this user interface might differ from the already >
    >> existing dbus visualizers such as bustle, my answer would be: it will
    >> > present information in a way that's more relevant to the BMC,
    >> putting a > bit more focus on BMC-specific DBus messages, such as
    >> HWMon and RedFish > DBus messages, to present information in a high
    >> signal-noise ratio way.
    >>
    >> Would this need to run on the BMC itself?

    > Hopefully not given `busctl capture` ?

Understood.

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [



--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAl7dq2UACgkQgItw+93Q
3WXpqQf+PGNTiNmsj3iqWdgiFBbr6bgQSoOLE7H4+SOOW90wRPgDg2zCE6N3rYMV
lVF3kt4GKY38JoZspaaLNJ9VCATLu9AJq5XzfGZR68AAe/n+fDi8DgtQ6EpHcWeM
RsyGfa1ZD011AOX9zXSo/zQYjqiyAY8iTh9T3FcRQKDF9FTR3ub+aNhJ+/4YMRTs
AED3IPCWfMBfo7t9c5BW+V87CX8/84cYOBRZl3pCMwZitkpyHzwJ5Btbf7qPEnFm
mEf25MHJOzcPulsO2DYb3PuFH3Wi9zqX+oiVOzRmtTKLt6jPWJbUyXsbopzqAEqz
Ldb3Rssn2MDofz4iA5A1GbEbqowHLg==
=hQwz
-----END PGP SIGNATURE-----
--=-=-=--
