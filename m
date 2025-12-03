Return-Path: <openbmc+bounces-967-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD46CA0485
	for <lists+openbmc@lfdr.de>; Wed, 03 Dec 2025 18:12:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dM42f2NnWz2yvK;
	Thu, 04 Dec 2025 04:12:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764781962;
	cv=none; b=OkkkLs4vbS5gWJW63wAhLEt+jZOfrfXKj69PURu5ZL+qBCSgNNHU8yKNgQxK41xbcz0Z+/8QyKRa4/+g2ufEJSrkDamwX9+km36enssvRe/DIBiH2PRc6ghHgmhRBBm0twmDJmEGeds572g4ZVoDB7goPUGd0WKAMndKq0eSm+Ns2c5LSkV7o4c7cZeGafHyDTKnub33RVv78gccoc0PSwVvUWbRgbGsZh6crK7DjpQfSeSojNuYvWn1btv5jQOYiuq1MEqbHjSgsPD9WV/zWRT3m00omBE4CTskuk2Yf0QU7KBd/B5hOAg300O0WeeZLTLc9DefeDtkmpI4b+VgjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764781962; c=relaxed/relaxed;
	bh=HA7ylgNFIEy16WFs5j/yTAMDjomCdtB+SmTNYR/Luug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jxyx/QWJBsA/2wOxjqJPobEqWaERZjCG9glhJGJ2U4YVDzL3bT43GV98z8S+4rAsVY6Z1rtq4gSn+SqSaUDNOAk38JrYBQ1NalOHwtKK7mXHcRVwV1rQIMSPxJd9BJp/lKtF9Z2Cvo831KoqBdv/TgcZG17KGfSyEd64CwYmudZr28hCm9DNBGqKmyyUZmS03FkdI22FrA3IbzdWsEu+BJdSCHjDqf2zPBHxkoX0sVRnR7LC7Th4Uy/m9XtvnOK4BJ9GrGm25M3oS5WoKnwGKyFi+IzlWuyBAeTHatz8FEEV20jW7DQdYvZRNdjsEwfeUWZjPccMOT9vo4JsIamkUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j65iO891; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j65iO891;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dM42d42z9z2yvB
	for <openbmc@lists.ozlabs.org>; Thu, 04 Dec 2025 04:12:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B1E1601D7;
	Wed,  3 Dec 2025 17:12:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2141C4CEF5;
	Wed,  3 Dec 2025 17:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764781959;
	bh=U6O5GrCENsITqcgbPG2gx2Q7e/IEqWBVsxFY6Vrx+F4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j65iO891XsWDqIu2Cb2Zvw9Uvmuk2j7AXiJ/LLKH4QfrWHiZEmc9TGcW/C9o14VU+
	 6fDYerFBUO2fPI7Vnw8ie9degGlusHEa/K12ovTLDbDefA0oDImyMB68J/AN7ERWdh
	 2PBJ1tCch5HUYHHnQ1FZ5W8naesMcX0SQcWQVXUMx8jya7jRi05ePkpr5yaQ3FS9Qz
	 RhnVtw6t043J/hbkvn/2OIKYhwWwoaDmUH60+m/WU57Dpa8RJFt7Ne4ROo1tsnld8x
	 77vcZy4TJrudc5uJFWhcd8U20T/foAyspgRHQDXDwjcM05ugR5wwci3W5ihNmFJ2wF
	 kdR0sVe+v4kJA==
Date: Wed, 3 Dec 2025 18:12:35 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Eddie James <eajames@linux.ibm.com>, 
	Ninad Palsule <ninad@linux.ibm.com>, linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 11/12] i2c: fsi: Convert to fsi bus probe mechanism
Message-ID: <llnycqotkizcertwwgxzvt6pkesb3dca55mcbk24hconepbk7q@qknqcqsf4da4>
References: <cover.1764434226.git.ukleinek@kernel.org>
 <1311bce0d8617c7821cfe0769e97f13dc466d749.1764434226.git.ukleinek@kernel.org>
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
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1311bce0d8617c7821cfe0769e97f13dc466d749.1764434226.git.ukleinek@kernel.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Uwe,

On Sat, Nov 29, 2025 at 05:57:47PM +0100, Uwe Kleine-König wrote:
> The fsi bus got a dedicated probe function. Make use of that. This fixes
> a runtime warning about the driver needing to be converted to the bus
> probe method.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

looks all right:

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi

