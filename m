Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E4A4DD8A6
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 12:01:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKgzg40vcz3bT4
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 22:01:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Uh/VuSbe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Uh/VuSbe; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKgzH4y2yz2yb5
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 22:00:43 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 479C2CE26B1;
 Fri, 18 Mar 2022 11:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0747EC340E8;
 Fri, 18 Mar 2022 11:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647601238;
 bh=3mi/n5McmbEsHpxK2c8PlaiFTLtjU6PteuZdaFFYR/0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Uh/VuSbeR4IrEW1j4rNBPJ2exbSEZZOA9uL9uMZnbRxXNtwxKoVuBS7NmaNM76aXE
 hDwmc+MvGca/qL8laaaszVCsWowQj1LItOGax7QQ9YKak5mRgrTizxJVBAtNNQ1+qe
 45kDiZwebc6MVFiC3ah7bbJFVNmFc7xiY9jGFOlvfngSLZ+rm4BtcJWcWmzKPINFpM
 WnDpVWw+CICyxlNg1F3TPKxwTPLkk6rTvoNdhWUzgoxC2YwawhNhX5CIhmofAQgGeB
 1KWZWhOoBWdF+57VywdVtBYI7YCtpbUDJ5TOkyvbeuv1tJdm18aDDNIL4+T+oKB1XD
 wQsyC3udsY1Mg==
Date: Fri, 18 Mar 2022 12:00:34 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH v2 0/2] ic2: mux: pca9541: add delayed-release support
Message-ID: <YjRmUokDFPezGI5B@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Zev Weiss <zev@bewilderbeest.net>, Peter Rosin <peda@axentia.se>,
 linux-i2c@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220201001810.19516-1-zev@bewilderbeest.net>
 <ae14fd3c-2f50-b982-c61c-9db3bb28c809@axentia.se>
 <Yh1O6w56zsNtNRbb@hatter.bewilderbeest.net>
 <f3c56f5a-6a6b-039c-9fdf-a994d054645d@axentia.se>
 <YiAPKGSDJrO+MxLR@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Hah0JhUylLqwqRmo"
Content-Disposition: inline
In-Reply-To: <YiAPKGSDJrO+MxLR@hatter.bewilderbeest.net>
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
 linux-i2c@vger.kernel.org, Peter Rosin <peda@axentia.se>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Hah0JhUylLqwqRmo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Can someone give me a summary What is the status of this series?


--Hah0JhUylLqwqRmo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmI0ZlIACgkQFA3kzBSg
Kbakig/+M0zq0PwNLJzYw7Eh1eBJH5P441BTGTBs/b+eSb2l9Px4RsFpbzKUss3f
OPuHiKtNcbCC5WnzrhR0YlRVzk93QERPdchLvUDYyMK0RfAIRNTDMzEy3rphVvxl
Ab/WQ193r+fxUrtJPmgIs6HZl/WFvh7ll0W3eYpUbSBN0fzMu0OiTdIi7aNwJqPF
xwktlpv6fsnLN3MKf+l0UW6wTXzRHCndSUWpEdXiG2rurDSFnHksKq/+ac0Plvn1
W6vhCayfaohwCiJMFMk83ytP2WUAnGX8Kil0X1BBaFxVq2GvYB1cpkQ9Oxhsmm2/
TD7XCVMUWCupTFsAp7OFhpfSgbs8jAFH9hIRYfjfLfZEyrOpSEMJGFTN8/n38nqM
mZewiE/OKRRx68sy2YVUWIjOB8q9yGuvYFalSxzALYcxVIw075CH0dAjq0zWPl9x
91YIXM3eVFSyyB5Mg8QK5kGgnqSHb83xhBNlVNyRSnS9+mzoHZw867dW/bpBTn5/
3sJLmzgyALXe2E7CQEZuqOHO7Zt9cpdVBxPyzu7WBPOwD2IAMah9ymOjLrs81B59
rUotjc6vqrcNLr0imN7GUMvuecr1U604eCyUWhD3lZJcY0PZ69fP2SZxL8NZLnHp
+0G8vt5yrjH3T3n2zc8cpQ1CndtPL5kuZwOR8wDF7ro0jvTTpOs=
=sb+n
-----END PGP SIGNATURE-----

--Hah0JhUylLqwqRmo--
