Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEEA91E7C4
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2024 20:38:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XW40Af/E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCZYR4bngz3g85
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2024 04:38:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XW40Af/E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCZMk3d53z3dWn;
	Tue,  2 Jul 2024 04:29:54 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4B12ACE1320;
	Mon,  1 Jul 2024 18:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B540C32781;
	Mon,  1 Jul 2024 18:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719858590;
	bh=kOKJXfn77YBdoorcP1QIopGNCIW+CsRKC6yRszSVKaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XW40Af/E2Y8kFNrAXnM6dME9FeksSFduyq0fOpscUGFtiIKvCYOMiP9r4BX46bYmE
	 DWNvJ5Zl9mBj0waTRF4YWt3Mh6Kpx0k6j/ubHvRBrFT6UbM9Gfc6A5CIqKDf/GAiKX
	 6Ans25SXIHbSDLfmdxCM7Q/sTxAzOCnNkte/eUnTz4HGejQlYbVw+u+x94IRUifX0h
	 VcvoiGRNxc4nuomin8RLfBOf/cY2bwxcDT8SXOjD1jkBNv6Rb+H22HdTmgSVf2JrK2
	 swL71e4Cn7ilA1bkfNgRD0NxWN4LwBcJI5GWOxJEbDbG8A9atv3TnYacrQ6FyjyDYy
	 mbAEx/CFZaI3Q==
Date: Mon, 1 Jul 2024 12:29:49 -0600
From: Rob Herring <robh@kernel.org>
To: George Liu <liuxiwei1013@gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: vendor-prefixes: Add prefix for
 ieisystems
Message-ID: <20240701182949.GA341683-robh@kernel.org>
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

ieisystems or IEIT SYSTEMS
> 
> Signed-off-by: George Liu <liuxiwei@ieisystem.com>

Or ieisystem?

Using the domain name (minus .com, etc.) is common practice.

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
