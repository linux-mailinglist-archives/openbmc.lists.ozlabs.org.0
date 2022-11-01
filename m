Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C64614B0D
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 13:46:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1qXM6nNCz3cKj
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 23:46:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gw0aZkRW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gw0aZkRW;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1qVq3VlRz3bb0
	for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2022 23:45:23 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 59EE260F7B;
	Tue,  1 Nov 2022 12:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B217C43470;
	Tue,  1 Nov 2022 12:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667306720;
	bh=pB6J1z4n/eqy93yhnvL7eDVaMSLRXXGitapDfJcOOyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gw0aZkRWhB1C2HhDgK3atKN/2j31j7NpjyvhbxElBXIA+anT9eTN+Dj3E6T0qOGKW
	 V0Jbcb/UdRdxoudrb0i4bVNGg1aQV1827h55DrMhVQz9CVHOfF5YKQgjuM75ZhTJmu
	 dHiz9wvXQ/+Udci6NFxrVzEWVfJmhDpJE/fu7055soKnDEtZdLqW/thVHik3dhMiUU
	 ppMbF8SS4/PgP9h+E48yqi89E4anPBnSTPe0u8B9pamD6kWnm/YHli443BDcOBRCSf
	 wXInrINxondGetTLxCbVFJ/TrjU/aJK69D+co9Qoj9/OmTY0GfOrMPmjP3lJV6vire
	 aFRvfWs/5WBpA==
Date: Tue, 1 Nov 2022 13:45:17 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH 2/2] i2c: npcm7xx: Annotate register field definitions
 with longer names
Message-ID: <Y2EU3aLbwfq8wXUv@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	linux-kernel@vger.kernel.org
References: <20221008125924.1220203-1-j.neuschaefer@gmx.net>
 <20221008125924.1220203-2-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aC1YO4lQe2I8bgSA"
Content-Disposition: inline
In-Reply-To: <20221008125924.1220203-2-j.neuschaefer@gmx.net>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, linux-i2c@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--aC1YO4lQe2I8bgSA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 08, 2022 at 02:59:24PM +0200, Jonathan Neusch=C3=A4fer wrote:
> To make the code easier to understand, add longer names to the
> definitions of register fields. These longer names are based on source
> code published by DELL/AESS for WPCM450, but should apply just as well
> to NPCM7xx and NPCM8xx.
>=20
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Applied to for-next, thanks!


--aC1YO4lQe2I8bgSA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNhFN0ACgkQFA3kzBSg
KbYdwxAAhzCz7aYqdzx9y2ld3o6Y/J4cYOFdv5+vTSsCtXyA6iin7uYH6il9PbPW
YXLk3Mk+QBs+VJ9LUTKgpkz04j0FNC13f1kzUJqN4Tgw3Ao8NPFFTKynE2dmZOoh
5yJv8FQtJcXno2tU7CM38Wc9Ns9jA/UtyLXTN3rAvIUBF4enLGDncy0dfkQUc8WR
YdPbMsKzQbmAv6XT+ZBrs+xkIUgVoxM28xY9idRfpcBBVNERF1jTM07ThhAzWmgg
30gFHQ5i3NHYxcmx+YFiifV9d6CHLVnQh4TcqPiboshRlmpLApIt9Kz2dCLENu5+
zMhLkTTeGk9qP7/XIgVk5XhReNLqguEa/oiRtA8PctpHsOXAyR5wl/XqTzCiTC8C
pPq6PAgu9xahbSe0Cp3sBZnbfoL5PU5nKreS9S/ztFpvdTfgTztp/UYF1CEhnqlb
JEDs6CXIE6SvW8ZLo7fu0MJFGfzfaviOnpWilIYdfc95nmqrzhJ0EzoUOB99hHfb
sA8BbVysxo0vKLUnaMOMCSLPnUGOahthsw2oXLBVRW2iIkfpREqPEb1HX0nqRdGG
ynMt0cR04o7ykGuEpuolaZabUm1SHX+IvJG6Ekgzsx17mZvkAJcNRJoflKBHqygV
nG3JSakxMEJNO6FuZ+ZFOA7WG1bzdlx3JZzOyJGWMuQcotYtGnU=
=BQ8Z
-----END PGP SIGNATURE-----

--aC1YO4lQe2I8bgSA--
