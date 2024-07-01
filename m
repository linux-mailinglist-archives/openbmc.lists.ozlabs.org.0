Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C6B91E7D4
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2024 20:39:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GounTX21;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCZbK0Qfkz3gGC
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2024 04:39:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GounTX21;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCZP823zWz3fTV;
	Tue,  2 Jul 2024 04:31:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 18118CE1320;
	Mon,  1 Jul 2024 18:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F3BC116B1;
	Mon,  1 Jul 2024 18:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719858666;
	bh=HNfZAebjEnqDnc7ilU0siKxQwoyzXZA4QICmfvi7yeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GounTX21nb+IvqwNGXVMlmoXS9D4ihFXBwHaRbLOSJ+FdW1+OD5s2tBllWCJeNgp/
	 9TNVnccno32Fc4M5puP8feOtmJEFAvaqBrGoSxum+O+7fsTClPoV520bsGGcxuaNir
	 VeDMJlrM7QTxVP/LsylM++2oSdb6C9BMDMgLt6GYUBsjba4IwuNu62iLI5qqCMlTnt
	 y+WwID6Cl6Qw3DLUMwOcGkVQqYoPw88efFfLP+J+o/UmvyR8NtdZsOi127Rg0MeTBP
	 G4R0y0Rmg4gbbf2XY4qxxvQlTSary5YaQLgPgnDeTTO9Fbu/08MWfmJg+6ytDs9dk0
	 7igXvj9kCQzhQ==
Date: Mon, 1 Jul 2024 12:31:05 -0600
From: Rob Herring <robh@kernel.org>
To: George Liu <liuxiwei1013@gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: vendor-prefixes: Add prefix for
 ieisystems
Message-ID: <20240701183105.GA345878-robh@kernel.org>
References: <20240701105259.972135-1-liuxiwei@ieisystem.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240701105259.972135-1-liuxiwei@ieisystem.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jul 01, 2024 at 06:52:57PM +0800, George Liu wrote:
> Add a vendor prefix entry for ieisystems
> 
> Signed-off-by: George Liu <liuxiwei@ieisystem.com>

Also note that checkpatch.pl reports an author/Sob email mismatch.

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 573578db9509..0ffa8d06aea9 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -609,6 +609,8 @@ patternProperties:
>      description: IC Plus Corp.
>    "^idt,.*":
>      description: Integrated Device Technologies, Inc.
> +  "^ieit,.*":
> +    description: IEIT SYSTEMS Co.，Ltd.
>    "^ifi,.*":
>      description: Ingenieurburo Fur Ic-Technologie (I/F/I)
>    "^ilitek,.*":
> -- 
> 2.34.1
> 
