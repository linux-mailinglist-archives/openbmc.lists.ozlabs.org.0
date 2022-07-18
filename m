Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56225577F70
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 12:17:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmdFF2Jl6z3c1y
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 20:17:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sandelman.ca (client-ip=176.58.120.209; helo=relay.sandelman.ca; envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
X-Greylist: delayed 385 seconds by postgrey-1.36 at boromir; Mon, 18 Jul 2022 20:17:24 AEST
Received: from relay.sandelman.ca (relay.cooperix.net [176.58.120.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmdF01w3Bz2yn3
	for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 20:17:22 +1000 (AEST)
Received: from dooku.sandelman.ca (unknown [142.169.16.42])
	by relay.sandelman.ca (Postfix) with ESMTPS id 845E21F459
	for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 10:10:51 +0000 (UTC)
Received: by dooku.sandelman.ca (Postfix, from userid 179)
	id 90F361A0210; Mon, 18 Jul 2022 06:10:49 -0400 (EDT)
Received: from dooku (localhost [127.0.0.1])
	by dooku.sandelman.ca (Postfix) with ESMTP id 8F5501A002E
	for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 06:10:49 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: "openbmc\@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Extending phosphor-gpio-monitor to expose gpio objects on dbus
In-reply-to: <YtPrcDzaxXiM6vYJ@heinlein.stwcx.org.github.beta.tailscale.net>
References: <MN2PR21MB118426E5D86B645A1ADF887AC8889@MN2PR21MB1184.namprd21.prod.outlook.com> <YtPrcDzaxXiM6vYJ@heinlein.stwcx.org.github.beta.tailscale.net>
Comments: In-reply-to Patrick Williams <patrick@stwcx.xyz>
   message dated "Sun, 17 Jul 2022 05:58:56 -0500."
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 26.3
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 18 Jul 2022 06:10:49 -0400
Message-ID: <1234822.1658139049@dooku>
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


Patrick Williams <patrick@stwcx.xyz> wrote:
    > I'd say about every 6 months someone proposes a change to
    > phosphor-dbus-interface with the addition of a "Generic GPIO interface"
    > and it has always been rejected.  This has gotten to be so regular that
    > I should probably try to track them down in a list so the discussions
    > there can be easily referred to.

So, clearly some developers think that they need this :-)

I read:
   https://gerrit.openbmc.org/c/openbmc/docs/+/55422

and this is good, but is little too abstract to be useful I think.

I would like to suggest three things.
1) link to some situations where this has been proposed, and then a smarter
resolution via another method might be good.  Is there a link to the
host-power on code as a clear commit?

2) I wonder about situations where developers are trying to get access to
some kind of debug info into the field, and that's why they look this.  That
is, there isn't a way to wrap it up into something abstract, because the
point is to allow for deeper examination.

3) maybe link to situations where dbus has failed to be fast enough.


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEERK+9HEcJHTJ9UqTMlUzhVv38QpAFAmLVMakACgkQlUzhVv38
QpCNjgf+MywYarZ+yDk2NKCtx3nMl0WAoqyyHZN4PrXETL9TtYc1VNem2ZMhXXm8
/CwhE68QUHHu3gAAQGoNi1y3Xq07SFPdWswwMxRAxEryYYalqL//EnFT3Or390r+
QYuivVPOmrAfLB+kLZz9s+frvNfut+yGEl6EP9KALhoEWh8tOYUSsjnOKEbMP7zz
uW/wKICPCSoy2Sn0/oloTKiLoo0jVlFXOHSPgrW7pfm9ZKytW/ziO8turlk86xLQ
AfCcuPGAqNNW/nTR2NqAhRfHPLxJb1KNhDNxsUCWCWjNO0J64YaQhmI/7FyNxRYK
9ZyiUMuZ9XU32NkAUZVSq2MPKYyCBg==
=1ZaX
-----END PGP SIGNATURE-----
--=-=-=--
