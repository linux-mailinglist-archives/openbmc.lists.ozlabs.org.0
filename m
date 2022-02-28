Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D414C7268
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 18:20:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6nFk0nGWz3bZf
	for <lists+openbmc@lfdr.de>; Tue,  1 Mar 2022 04:20:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aEHA3YO7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aEHA3YO7; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6nFN39lYz30L7
 for <openbmc@lists.ozlabs.org>; Tue,  1 Mar 2022 04:20:08 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 54FF2B81370;
 Mon, 28 Feb 2022 17:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426B3C340E7;
 Mon, 28 Feb 2022 17:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646068803;
 bh=QeFrGCNc89SJdYUWHflD+YlxmOKGYrXkXFoTkBy4vjc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aEHA3YO7T7ppz8EA4Eg7vscmAqI4yRmd/InzGzmCabLUpkbUMrs9pdWaapb0rKi/F
 fSrD7fZtKSIkvlHjTSGIdcBu1MJU/TPER80troBGK/eS0GPARCA34461tSbpvPyu6r
 pvmvvqCpfiJ55nRUyJnfmqRqdb6vV8GTQ+Uhm8/NAm5cZBn+dO637KZHoo8WoVErFz
 nTChyG+BVqwJlsTSZqXn5NngNw/8N6eqhCGiUqo3smXkvZEf0kgxSI219EJWkpyGG3
 w0qKO2itn47FK3RDebOcWD73VRMjV8DHLUDRyuZGb//oCW5IetaNp0gDtTCYLF6PcH
 A3c/A+99NSsew==
Date: Mon, 28 Feb 2022 18:19:57 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>, Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v2 0/2] ic2: mux: pca9541: add delayed-release support
Message-ID: <Yh0EPY/DXtBdScB+@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Zev Weiss <zev@bewilderbeest.net>, Peter Rosin <peda@axentia.se>,
 Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220201001810.19516-1-zev@bewilderbeest.net>
 <YhyLIRFbs226KTwA@hatter.bewilderbeest.net>
 <fbb305e3-73b3-7a2d-99cf-a7205b7344ff@roeck-us.net>
 <Yh0CUzBzGJc4zyTR@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="PcOsCAVfvNqPfZDu"
Content-Disposition: inline
In-Reply-To: <Yh0CUzBzGJc4zyTR@hatter.bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-i2c@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--PcOsCAVfvNqPfZDu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Ack, thanks.  In that case, what's the path forward on getting changes to
> this driver merged?  I see sign-offs from Wolfram and Peter on the last few
> commits that touched it -- any input from the i2c/i2c-mux maintainers?

For the i2c mux subsystem, I usually wait for Peter's review.


--PcOsCAVfvNqPfZDu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIdBD0ACgkQFA3kzBSg
KbZqPBAAirMQ2+kLUEJHshiQxx+oqoXe3l4b+oevdW4j7PQZyoM71DBl0dkG9FDn
vBYWm74HGKKbS0iB2IM8Z24YU1tO0bKphsc9rzZmsS9r49GYWeLTtoM07X0a2NsA
hPRfxU8RJdzJL62T1NuxZcT8nrZPDXyYy7JFO9sR7O6ZE4tm3Yl4U4ywZwO0ukZ6
lalIt7EQPSBTWR0gOOvOtikN7cZnTGAaFvKFN+UW/BgV7E00xrwddtC8rN71kPGw
o/uljkVFZNy8DQYwSlbG6DAvk2TocSocKuWsUT8dpxsICA+9T7avF59AWf091axI
DBtqJBwqxaLEAzTJTw9ZotuLN0GRPBIcIW5NQNa+PS1ii8PhuUY8vqQNLXBtHjsw
KcLdCM1GrhnoUtyoshu6TiSirZ5Bdqk2tC7nXZ1XIvlzaGzml7uYg+DFExRdQ6wB
6F2Ze1Gj35tNHxCwYnOxkkh3ZJ1vl8gsSxwVLBnCiODcR/jPFiJ44dp90VdH/Ud3
gw1/gz0/rlsRo6n7ZIkRPtOWXtc+s8RCvpsG83qLN/LRDTLLPcDV6HiuYAik3rj+
+Xugrks9xFw/a8RPrSZM/5kQnD9RJxYKP8V3mR98CMbhmbx3F6FI738eFZf1hKxf
sRvnXYOOZZsgbzIPojr+OSja1/z+Xj+c2+MFZZXb+2Rx/Pliknw=
=AoPe
-----END PGP SIGNATURE-----

--PcOsCAVfvNqPfZDu--
