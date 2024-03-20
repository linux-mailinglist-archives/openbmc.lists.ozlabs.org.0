Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB9E8814C8
	for <lists+openbmc@lfdr.de>; Wed, 20 Mar 2024 16:41:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jY37uWiq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0CVv3yCyz3dVx
	for <lists+openbmc@lfdr.de>; Thu, 21 Mar 2024 02:41:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jY37uWiq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0CVG0HM9z3cTT;
	Thu, 21 Mar 2024 02:40:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 456F36100C;
	Wed, 20 Mar 2024 15:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF305C433F1;
	Wed, 20 Mar 2024 15:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710949251;
	bh=KlXhLA7jIC561PndfhSf5vnkReqlBqG0xxTFqREv5dg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jY37uWiqccKwyj18FIwjJkrXWW35vH2u+7rWTyhP/OGKf7P6TEtT+696WF989/cmj
	 kbVLQ9v1N+g0OpW6EwZ4bD7ytJwkhuMXJ0MNfk+INVj/8KkzA8y0T6wSvenVT/UGn6
	 t//2ht6oFHVqHZufIv1ORUPpSqnMQsj+zztLBjkhbtVs4BFHWzOiHnz80RNUhOMMUL
	 odmRPmh5tSCWi35gd/3tNJdU+fxqUbLobDIppOAKWNYmrYEHLOsZiw/HpNNCvCzJo4
	 QqIhR3Qkuim8RBkGl7WcjqDv9ynfdfP4elOhpl0cslA00gTGdMZzFknKndW4vu3BHb
	 Z8Za8tp1lnVJA==
Date: Wed, 20 Mar 2024 10:40:48 -0500
From: Rob Herring <robh@kernel.org>
To: Manojkiran Eda <manojkiran.eda@gmail.com>
Subject: Re: [PATCH v2 4/4] dt-bindings: aspeed: Add eSPI controller
Message-ID: <20240320154048.GA1777957-robh@kernel.org>
References: <20240319093405.39833-1-manojkiran.eda@gmail.com>
 <20240319093405.39833-5-manojkiran.eda@gmail.com>
 <bad5df79-e040-4868-9db6-701110894ea3@linaro.org>
 <a9faa9b4-9bf6-49b6-b7eb-f642e2d261c3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9faa9b4-9bf6-49b6-b7eb-f642e2d261c3@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, ryan_chen@aspeedtech.com, vigneshr@ti.com, linux-aspeed@lists.ozlabs.org, richard@nod.at, chiawei_wang@aspeedtech.com, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-mtd@lists.infradead.org, patrick.rudolph@9elements.com, krzysztof.kozlowski+dt@linaro.org, miquel.raynal@bootlin.com, jk@codeconstruct.com.au, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Mar 20, 2024 at 03:29:15PM +0530, Manojkiran Eda wrote:
>    On 19/03/24 3:26 pm, Krzysztof Kozlowski wrote:
> 
> On 19/03/2024 10:34, Manojkiran Eda wrote:
> 
> This commit adds the device tree bindings for aspeed eSPI
> controller.
> 
> Although aspeed eSPI hardware supports 4 different channels,
> this commit only adds the support for flash channel, the
> bindings for other channels could be upstreamed when the driver
> support for those are added.
> 
> Signed-off-by: Manojkiran Eda [1]<manojkiran.eda@gmail.com>
> ---
>  .../bindings/soc/aspeed/aspeed,espi.yaml      | 94 +++++++++++++++++++
>  1 file changed, 94 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yam
> l
> 
> diff --git a/Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml b/Doc
> umentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml
> new file mode 100644
> index 000000000000..3d3ad528e3b3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml
> 
> Why Rob's comments got ignored?
> 
> This is not a soc component.
> 
>    I did not mean to ignore, i have few reasons listed below that provides
>    information on why i felt this belongs into soc.

Fix you email program to not send multi-part (txt plus html) emails. 
Plain text only on maillists.

Rob
