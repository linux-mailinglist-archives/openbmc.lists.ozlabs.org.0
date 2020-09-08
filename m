Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 817EC260B0A
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 08:37:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlwRk0f9bzDqPl
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 16:37:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=the-dreams.de (client-ip=88.99.104.3; helo=pokefinder.org;
 envelope-from=wsa@the-dreams.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
X-Greylist: delayed 556 seconds by postgrey-1.36 at bilbo;
 Tue, 08 Sep 2020 16:36:17 AEST
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BlwQn68DhzDqGb
 for <openbmc@lists.ozlabs.org>; Tue,  8 Sep 2020 16:36:17 +1000 (AEST)
Received: from localhost (p5486cc72.dip0.t-ipconnect.de [84.134.204.114])
 by pokefinder.org (Postfix) with ESMTPSA id 2D4CF2C0356;
 Tue,  8 Sep 2020 08:26:54 +0200 (CEST)
Date: Tue, 8 Sep 2020 08:26:51 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH v3] i2c: npcm7xx: Fix timeout calculation
Message-ID: <20200908062651.GA1019@ninjato>
References: <20200830213121.239533-1-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline
In-Reply-To: <20200830213121.239533-1-tali.perry1@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: xqiu@google.com, benjaminfair@google.com, avifishman70@gmail.com,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2020 at 12:31:21AM +0300, Tali Perry wrote:
> timeout_usec value calculation was wrong, the calculated value
> was in msec instead of usec.
>=20
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Reviewed-by: Avi Fishman <avifishman70@gmail.com>

Applied to for-current, thanks! And thanks for the Fixes-tag, Joel.


--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9XJCcACgkQFA3kzBSg
KbZzcg//RR/qIunHGIrcDr5aZXfWTjr8u0f3ccyaBELUPk6kSzUqBufOcKoeRk19
dN74rzsCQr5egfumVCZCl1JP+269Hjtf7ISd4jBU5pJ5R/QovlN6zofK0EZsZJDs
6RA/wNM4KdzvqDi7IS9FhSL50pQ3M0Bl0o/R42m54qDc75JDXDO3qIRaABAU25Xd
V6nX2eUK6WLSsz63cM1ndM0VHxrupzj6w90EFTfSNqwx4ft1+tTDG7Z3kdGMcFd4
F5S0VtPCHMT1Uh+9HR/sk3wUKJHcv6VeU7f/bzus5pGksvX7sRzRq/nXsIVeCZuA
iAzHBOGSdlv/6UR6WKjPzOW8IDOqxctR7MqjiqzuFXUYo8RHK0WXMs+g4bAXZph1
i29CJm+il2t+KnUMje9w/S7bPDTPpU949vvYA5tPbTLYjrEhfLL+oAr7szDDbPvT
tsepc8J5K+rP8GkBGRCfvj4angCuJ6RSihQofwBRHgNh93MVZjQVH9o32Kzn8X9+
nwYl3DNvmC1Nzhnf01Bfa7dyWzeeLlU8ZBYXLx/yqGIRd7W/61KDVDN7Zcz+yGQ6
EkBy1Uxabx7JSDsbCC7lqR4JhPyEbaCwWiUs1amEubZc8VDibrtp1EN2QeHSopbz
BD3pfGjkLmr8rFKfea/ea+wmmI/gW8fQGfcVZfl4kpZReRRsYDE=
=ahmh
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
