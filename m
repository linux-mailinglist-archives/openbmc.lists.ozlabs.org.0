Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2783752F92A
	for <lists+openbmc@lfdr.de>; Sat, 21 May 2022 08:04:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4tMW0HjVz2yxF
	for <lists+openbmc@lfdr.de>; Sat, 21 May 2022 16:04:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O6XjGXnH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=O6XjGXnH; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4tLn6K3Vz300K
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2022 16:03:29 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 64824B82ECD;
 Sat, 21 May 2022 06:03:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2554FC385A5;
 Sat, 21 May 2022 06:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653113006;
 bh=Jr0mndLpciSgpNuD1q2Hbj4m3KgZFsGNqnqW3Q3qQYE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O6XjGXnHd58vQsEcjojwg4j+c2SIcvvsDpspEhzX1+cGuUq7LA7vjMv0H+UAK09ad
 NOPrjn1cSA8/69MuGWxqWIEI+LPt/PlF4oDJ0l5MeUPkfda8c5oZ2Ii6/c+1SDu1xD
 7q/4Fw3YmwdXlfXxzfdzStTEuSQaUmiwLmIKMz8QoWkYszhy7uaHRrBL/Qd7z9Jsu4
 N1O5qG4gXAhsldC2fHaQfO9QTnc1iKj5wU3+utrIYezyxvtR8kWiF1UO4KRNtuGu2N
 sGFcz4MDIOg1Dy67Y3DtPtMmCx6VG08+MmdemjgzWwOWmGp/KZPHZBiX39Xc5bPoQv
 nBi9+GfaYZzPg==
Date: Sat, 21 May 2022 08:03:22 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v5 01/10] dt-bindings: i2c: npcm: support NPCM845
Message-ID: <YoiAqhZBILoxFLih@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org,
 andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
 semen.protsenko@linaro.org, rafal@milecki.pl, sven@svenpeter.dev,
 jsd@semihalf.com, jie.deng@intel.com, lukas.bulwahn@gmail.com,
 arnd@arndb.de, olof@lixom.net, tali.perry@nuvoton.com,
 Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
 openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220517101142.28421-1-warp5tw@gmail.com>
 <20220517101142.28421-2-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ik2fnGryMtvN0IPc"
Content-Disposition: inline
In-Reply-To: <20220517101142.28421-2-warp5tw@gmail.com>
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, tali.perry1@gmail.com,
 jsd@semihalf.com, krzysztof.kozlowski+dt@linaro.org, rafal@milecki.pl,
 benjaminfair@google.com, openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com,
 lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com,
 arnd@arndb.de, sven@svenpeter.dev, robh+dt@kernel.org, Avi.Fishman@nuvoton.com,
 andriy.shevchenko@linux.intel.com, semen.protsenko@linaro.org,
 jie.deng@intel.com, avifishman70@gmail.com, venture@google.com,
 linux-kernel@vger.kernel.org, kfting@nuvoton.com, tali.perry@nuvoton.com,
 jarkko.nikula@linux.intel.com, olof@lixom.net, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ik2fnGryMtvN0IPc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2022 at 06:11:33PM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
>=20
> Add compatible and nuvoton,sys-mgr description for NPCM i2c module.
>=20
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Needs to wait until comments to patches 8+9 are addressed.


--ik2fnGryMtvN0IPc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIgKoACgkQFA3kzBSg
KbYInw/+NJI+MgHsS8pu8S1ZhhCqigiS67hipxsM/AETBx+8O1wZmGjdc11F4mOX
LrmCqzcGZzKiqIpJqe5vXMqegEKrXfM7dXWgmzntqtduuWXiaKAv1eRRGgms2eBo
rNgJsdFQZIAY0mzvReEZuRgFuuwTNzmuIjzkMNzIDFpf9JXOfz2mBEM6Wjca35ZI
5OBl72A1QyBE3PhCUSkBLhgqphQvWfKSLxxURSDCSUPHRiZXvzAjOKSaogIh7P+k
/3qWSwHIXO6Ubxxz/enoez/0MODNCnaXJjCD9i99FW8DXRTeRkA9B3yFRtkdC98M
5EDQFa8nOPOPhCzR6UKOWhOzIVlUqfGMwjhwRTXMxp+HS8Y5+6rSvlBdfcUcCSI5
heEyH/V5S6gvVRa2bylaChEEbEfWFOh1mPapuQhUPSYZHcvmOtYPJKaFb6Az082n
z7ULIW4aJz+3ECVs6m5XuTSUmilZ/cjJ6vk+QHE9ysnsAUXtH/kG7VSGvFbx2DNz
lfLaf3csJqFlW+HnGlywHO3pYU6dEi1egJcw9OWVMfFbLgk2Dd/M0NtNM3yB6Rye
M95znOVouWemcJor3A5XWy+RE+ymvpkdct6PNHmnhwSJWX2XhU+PGLuYYfM/oP/f
Yg61uj74FUrNOUEFZ7ThugTmbj5UF93AF/VvDVRD9jxNBINvQZk=
=DipO
-----END PGP SIGNATURE-----

--ik2fnGryMtvN0IPc--
