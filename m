Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ADA861C2B
	for <lists+openbmc@lfdr.de>; Fri, 23 Feb 2024 19:52:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ezUa7WaV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ThJz147C7z3vYM
	for <lists+openbmc@lfdr.de>; Sat, 24 Feb 2024 05:52:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ezUa7WaV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ThJyN21xFz3dW7;
	Sat, 24 Feb 2024 05:51:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1E8D3CE2E1B;
	Fri, 23 Feb 2024 18:51:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6557C433F1;
	Fri, 23 Feb 2024 18:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708714296;
	bh=FO7BdQ8U8hk1Y0sbXcP0MfCgm4tIizQxDb2XU/U2g4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ezUa7WaVWWaEBWN4K67za3YyrYXeUmASX5LyFjacCmS+ub+3SXmzngSPhhuh00jGj
	 GGf3WcSfOgXD2wQOHB+kKn+7uIv1+ByU5MLkk5jq0Udl71uNjtuqhMSEq+0Ny88rdy
	 vu7eYxQW6IsuqaBBjmyCx78eYD3aW8EbYiT+7uEGTpHSJQToEPl00iqq+3PEngvwbh
	 WcCC44Ls7rMZBGW3Za3U9aJsKbnyI9nPluVuAxIXCKPWhF11BUBVHXgQJiFOy0C3qv
	 1709HCmYwxmCfINroI8cXo3ZNlsgfYi9ayQkobUGG1jB+MIXd5h0f5vwcB06hFsFJZ
	 IBhyY4YIPGUBA==
Date: Fri, 23 Feb 2024 18:51:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Kelly =?utf-8?B?SHVuZyjmtKrlmInojokp?= <Kelly_Hung@asus.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: add ASUS X4TF board
Message-ID: <20240223-sprang-rework-4b0fb07ccc98@spud>
References: <20240222085914.1218037-1-Kelly_Hung@asus.com>
 <20240222-getting-nebulizer-8f75ba8063b1@spud>
 <TYZPR04MB6596ED7F905CB53191F48A289D552@TYZPR04MB6596.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ryaepkQT1Q7qbbw9"
Content-Disposition: inline
In-Reply-To: <TYZPR04MB6596ED7F905CB53191F48A289D552@TYZPR04MB6596.apcprd04.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, Kelly Hung <ppighouse@gmail.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, AllenYY =?utf-8?B?SHN1KOioseW5vOWysyk=?= <AllenYY_Hsu@asus.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ryaepkQT1Q7qbbw9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I have no idea what his email is meant to mean, it just looks like a
copy of your original patch. That said, you have a footer about the mail
contents of being confidential, so please fix that too.

Thanks,
Conor.

--ryaepkQT1Q7qbbw9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdjpMwAKCRB4tDGHoIJi
0qaFAQD5taRnu/02nJkNtw7fgfQfgtOsbXKXvPhgWUxdfZVWxAD+LF4RgECksW1C
QZifqbegVd+Ek4Jw/1lWJUwbT+vW+gM=
=dc6a
-----END PGP SIGNATURE-----

--ryaepkQT1Q7qbbw9--
