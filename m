Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A08E160767F
	for <lists+openbmc@lfdr.de>; Fri, 21 Oct 2022 13:52:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mv2rN5gPsz3dsm
	for <lists+openbmc@lfdr.de>; Fri, 21 Oct 2022 22:52:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=216.24.177.18; helo=formenos.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=<UNKNOWN>)
X-Greylist: delayed 991 seconds by postgrey-1.36 at boromir; Fri, 21 Oct 2022 22:51:46 AEDT
Received: from formenos.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mv2r22sYyz3cdy
	for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2022 22:51:46 +1100 (AEDT)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1olqHz-004dob-2Z; Fri, 21 Oct 2022 19:34:48 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 21 Oct 2022 19:34:47 +0800
Date: Fri, 21 Oct 2022 19:34:47 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v2 0/2] rng: npcm: add Arbel NPCM8XX support
Message-ID: <Y1KD1zlz5WRVzN9k@gondor.apana.org.au>
References: <20220929133111.73897-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929133111.73897-1-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, olivia@selenic.com, linux-crypto@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Sep 29, 2022 at 04:31:09PM +0300, Tomer Maimon wrote:
> This patch set adds Arbel NPCM8XX Random Number Generator(RNG) support 
> to RNG NPCM driver.
> 
> The NPCM8XX RNG uses different prescalar clock value.
> 
> The NPCM RNG driver was tested on the NPCM845 evaluation board.
> 
> Addressed comments from:
>  - Krzysztof Kozlowski: https://www.spinics.net/lists/kernel/msg4523771.html
> 			https://www.spinics.net/lists/kernel/msg4523585.html
> 
> Changes since version 1:
>  - Fix dt-binding document warning.
>  - Use driver data to handle architecture specific clock prescaler.
> 
> Tomer Maimon (2):
>   dt-bindings: rng: nuvoton,npcm-rng: Add npcm845 compatible string
>   hwrng: npcm: Add NPCM8XX support
> 
>  .../devicetree/bindings/rng/nuvoton,npcm-rng.yaml  |  4 +++-
>  drivers/char/hw_random/npcm-rng.c                  | 14 ++++++++++----
>  2 files changed, 13 insertions(+), 5 deletions(-)
> 
> -- 
> 2.33.0

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
