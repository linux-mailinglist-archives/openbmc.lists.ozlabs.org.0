Return-Path: <openbmc+bounces-500-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F46B301BD
	for <lists+openbmc@lfdr.de>; Thu, 21 Aug 2025 20:10:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7BF05tFNz3bb2;
	Fri, 22 Aug 2025 04:10:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755799812;
	cv=none; b=j4nhThH6mIVhGhChete4TgXE1uc/EGx8lX551/i6uzbn4Aa7ZxtT/rXNMDoRmdEEiazkZ4NxvUC2gt1rSTHq37s/WrG3OwIdSj+POegM1L21UDUClnB6fUnt2MVqHYFGcydbkQmqdJRdl/0CIB/Yc2KEc1qNRteLTPe/VXrftICPiEju1qyDkPH33XtJ6+smAdOp4uzXZ+3B2FXKk7bfUEPmFTNLQY+Sj33yqYyiQ61LZI5rhdCflRRNwb1yvBRm4Gq8MYDNqms5cBqpDD5oceNlmkpV8G/5uM/A88Tp7DDgx8x8eZmFC3TLSGiLYH58U27M3IV6egMhEADh2xNc3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755799812; c=relaxed/relaxed;
	bh=apD5JO1he70Tjrq7BLkA+rkkDaWLTCsaarVnSINXcLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=acHAAn5FB5UzYhKoY+x5OjbFN2E3DxqkmCTmSk4TLHMyn7uxtjkxLwul8O+6q6qUfeSE3ZKMp4bFDR/+NG+3JH2On9To4qPm60VtyfiJjY0zO6PjbXZw2ltIUSmhcUWS2pfpGqszLUwY2xMMe3zhuoQfN20S4ieJrCXp+mTjI2+Rp03JZ4lx3WNWFxL1RAaWpeJi4T/q6GOl9CYuvcNHtfGQwZPM6gnbGpkyLs3VhwOPNM0vhIfLIbSFwJ0/3WzAX1+++ZQKyNBplcYqatOjxE6MYkwO1ttLxX75RJrSKowRmx/1yyOqT5dNhUty1Etr+0BiAV4ye6snjUQDOR8r8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E9tu73wU; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E9tu73wU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7BF01rCpz30T9;
	Fri, 22 Aug 2025 04:10:12 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3229B5C655D;
	Thu, 21 Aug 2025 18:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 829ADC4CEEB;
	Thu, 21 Aug 2025 18:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755799809;
	bh=apD5JO1he70Tjrq7BLkA+rkkDaWLTCsaarVnSINXcLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E9tu73wUuT45h/YwbSsQfEo6m3QDREQEqdymXs8JpkNQJl+TjzyywxnuFvijnkhpE
	 znRCGJtaLpdautPlRkBeYo5CXZjcaJ6Y0YCnykYGflxyQJfvAEaMMBQCv/hnX082n6
	 8s3wHbhtz8eSCZ4sbb7ODm/oHor9Rgztu0/hTDylUui6BifGbsRxgSkNKytTDbUzbj
	 Ej5W6J4ikpFVxEKnQQyVjrfyzbeP1naQ6ng2QujDiWD/WGrYaW9erprEdO8o1q9bnD
	 ghSvrjLgFqYHjNbwI7EOLniiwmk2vhYde2B8eFjZQSwgWDilYA0vmDIi3Yf9E/wOBQ
	 QjAjPruUetCBg==
Date: Thu, 21 Aug 2025 19:10:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Donald Shannon <donalds@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, etanous@nvidia.com
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: Add NVIDIA VR144NVL board
Message-ID: <20250821-contrite-anguished-3098e847bf8f@spud>
References: <20250821051047.3638978-1-donalds@nvidia.com>
 <20250821051047.3638978-2-donalds@nvidia.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ToW9FfKiv1Hf3JrK"
Content-Disposition: inline
In-Reply-To: <20250821051047.3638978-2-donalds@nvidia.com>
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--ToW9FfKiv1Hf3JrK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ToW9FfKiv1Hf3JrK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKdg/QAKCRB4tDGHoIJi
0r5eAP0Zi7H3YyCLpeMdEYZeG7CkWWKjGuR+jfMcNRK7sqar0gD/YwgsQHN+pFuo
nzTHksLll+pOzH3rDLm4lkwrCvithg4=
=ApFm
-----END PGP SIGNATURE-----

--ToW9FfKiv1Hf3JrK--

