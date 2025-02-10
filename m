Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B38A2E96A
	for <lists+openbmc@lfdr.de>; Mon, 10 Feb 2025 11:29:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ys16C4YRBz3cBZ
	for <lists+openbmc@lfdr.de>; Mon, 10 Feb 2025 21:29:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739183377;
	cv=none; b=IjhMQoe7ff9NcJ5K5jm1p3p5Hi31bn0XRUU6lLnWSLf/VXt+sz4GQXTopra+8ZjeNRFNr5C7nGPD+Cu+i/IVpt4xTlsg757lZf1KHK9OaQQnj5CBZwqvRwRR0G8YPueOhhB+jFnyFbOkG8XwAYHfgyolBNiEmIrPVdb9lOX/7L2mXW4fG1rcN8cjjw1N89yURpIMAdPKvGFkHSbfrKEKNW/hUcTDdmV+/KHf0AWrRuju63AJ0WS+RudTTlepPdsF3byZyHgkZpcjRyRJwqB/rbEQwm+NeVjUgrcFcubvq8Xj2eJdxXc7PFigxvUAhD4tkm1c63IQbSc3Thasy2SthQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739183377; c=relaxed/relaxed;
	bh=01lUzP8wdVQFGy/4bYY7OHZm7ouGxZ5M7LAy0u1RmF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Whh4p0xfFET+gRIhz7KFo5sGwz20SOdW0o76FuzyLWkrw1WgaovH0yQn9Gt1hs/3hZG8GuMio7eFU1RH/d76B8NYYSQTDjjuiEwS/kGxQXcjXAqFbMEyMzzY+09xj8JBDIcpVeOvC0PP7dBH0s/IH6377Zljdl2dI/rqkHodWD/FzApttC/ugH06ekL9SGc7+v/qAqlCCVOnYZTmt9P6h+2Gi+o/GzLYeYAqi5UYl5JdPcOqbF2EN4g03uE0e3rZupuV2y5O1tw3kGdbdfAzl93a8YZMwN1tYzJtt90nJxwoIa9cSNLord6tZ5hyl2ar/2wTik+k1B52b7LnLzyiag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JPjhb7as; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JPjhb7as;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ys1686G7Gz2yXY;
	Mon, 10 Feb 2025 21:29:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BA9FBA40F31;
	Mon, 10 Feb 2025 10:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E2CC4CED1;
	Mon, 10 Feb 2025 10:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739183373;
	bh=33TmnyQ62etwSFwnvL/fzHi+qX4T+4T29KP7HM0RYP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JPjhb7asSJnPsUiNzzeMLsh4W0FOdcbrjA2v90FR9nMGG6nTkaHRZuAiGK7YjEjJe
	 I6iUGB6Yo0PtwD1LqSd8aDL2J0j+8j7Tn3PFoCwWvkFXa4Z+vo6GhwbwzqeKNcDaZA
	 I/ReN7ESzLG6sF5Cls6YhjZ7wU9kZRolrxhULHFT5mXmdPMXbncAV/0LEygsJEQ5tQ
	 pqQ0lU/fH9a3UMFbKMxudZyjjZGweRkuAHNJghBZEkcvHBS7WZMLfbnEQTQQXhHCfE
	 3sg2jE7tgeU4aNU+Xw0J9ZX9+ZRxjgsGFoJ3JvYDEQ8HGUGbO2/0v0OR0jlTxNgtil
	 GaIOdG+5MfU0A==
Date: Mon, 10 Feb 2025 11:29:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Subject: Re: [PATCH v4] media: dt-bindings: aspeed,video-engine: Convert to
 json schema
Message-ID: <20250210-crow-of-famous-drizzle-a4bb03@krzk-bin>
References: <20250207101458.3757723-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250207101458.3757723-1-jammy_huang@aspeedtech.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, eajames@linux.ibm.com, linux-kernel@vger.kernel.org, joel@jms.id.au, krzk+dt@kernel.org, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Feb 07, 2025 at 06:14:58PM +0800, Jammy Huang wrote:
> Convert aspeed-video.txt to yaml format.
> Update aspeed-video.txt to aspeed,video-engine.yaml in MAINTAINER file.
> 
> Additional changes:
> - Two phandle properties, 'aspeed,scu' and 'aspeed,gfx', are added for
>   video engine to capture video from sources other than VGA.

Where is the justification I asked for? I made it even with bold font so
you will notice that this justification is required. Are you adding
these properties because you want new features? If so, that's separate
commit. If not, then what is the real reason of adding them?

> - Update examples and include appropriate file directives to resolve
>   errors identified by `dt_binding_check` and `dtbs_check`.

Examples are not binding, so that's not really needed to mention.

Best regards,
Krzysztof

