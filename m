Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2BA91B12E
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 23:08:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aDDo9rTY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9B4D48fRz3cZx
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 07:08:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aDDo9rTY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9B3j4X4Pz3cPS
	for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2024 07:07:45 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 30043CE0B62;
	Thu, 27 Jun 2024 21:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D1DC2BBFC;
	Thu, 27 Jun 2024 21:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719522459;
	bh=LQWyrY4Sbgn6mPEsHhvn5smDwk3zH3B0uAIOU5fwQOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aDDo9rTY/Mz4M5OCzNNkAwpcF5vuh/i9bPkYiOTClrGgfoidJv+noEulJsS8F/oq+
	 sABto+l7W+W6bFgYeD1j+MauWFUkyaUner2iF0S3e2xeIsLIs4ktndwfhUIwg2KV9T
	 WJV3qd4ZcrUCkHxox+MN1ahgIwJ0RelWPeGWIGgQ/uOzjoBCzSi+AD8ylO7gwhJpQm
	 3fPSX6Opp6kpTjpxwdNhEgbqg3RxYJ+JRFBSuSCsIUmTlMk2Kmnub8y4NNlC67uZZf
	 4SciUgBazmTPtLpjeFzATEBxNKVC81vC9/AW4gHJw9tHoKvsh4xa66NMiitCsMSrVI
	 KaZbKZ8JB0Brg==
Date: Thu, 27 Jun 2024 15:07:38 -0600
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v25 1/3] dt-bindings: reset: npcm: add clock properties
Message-ID: <20240627210738.GB501440-robh@kernel.org>
References: <20240618185819.2155595-1-tmaimon77@gmail.com>
 <20240618185819.2155595-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618185819.2155595-2-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, p.zabel@pengutronix.de, sboyd@kernel.org, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jun 18, 2024 at 09:58:17PM +0300, Tomer Maimon wrote:
> This commit adds a 25MHz reference clock and clock-cell properties to
> the NPCM reset document. The addition is necessitated by the integration
> of the NPCM8xx clock auxiliary bus device into the NPCM reset driver.
> 
> The inclusion of the NPCM8xx clock properties in the reset document is
> crucial as the reset block also serves as a clock provider for the
> NPCM8xx clock. This enhancement is intended to facilitate the use of the
> NPCM8xx clock driver.

Still not really much of an explanation of why an ABI break is okay. 
Reasons are generally no one has the h/w yet, or the platform support is 
incomplete and really doesn't work without DT updates.

> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../bindings/reset/nuvoton,npcm750-reset.yaml  | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

It's ultimately the platform's maintainers problem to care, so:

Reviewed-by: Rob Herring <robh@kernel.org>
