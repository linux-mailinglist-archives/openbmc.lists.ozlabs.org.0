Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F67991B17C
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 23:22:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qYpgZwwA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9BN84WvMz3cYL
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 07:22:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qYpgZwwA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9BMc57fFz2yvf
	for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2024 07:21:32 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 410F8CE2F4E;
	Thu, 27 Jun 2024 21:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F48C2BBFC;
	Thu, 27 Jun 2024 21:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719523291;
	bh=vjCxW+3sLYIPoraSwWhaL02w9qFE3SaiJZk225TJQ8U=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=qYpgZwwAbHvgIxiUnxDm16AFiLLRPt03v2ys+GoM+vL6y23TqRk1WOS6x/dxupzlr
	 iLLj1cAG1uorjFA+Qmq5l28OkS/+03bTO0WMG70FjZn2NnPqK+3gsEYq30fURbQ4eb
	 dlfwoZGQmjeE80xelFaHCZheY8sM+YcpjhPOYDer9n9R+Ek1I5+QPwmiSokGNLhGU+
	 wW3pdr4brHjx+U061QQOdCy254rALJthqfF9ljFUxnc5UV95nCxVIBImBGFXpUnuAA
	 ypuOiBf+npYs+ON8wJ3ml8qEMAwTTSxCV5zKX8EYm/YoMbB1XgHj9AhybV3+lhXdw7
	 0Q52Mgzjn3bwQ==
Date: Thu, 27 Jun 2024 15:21:29 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
In-Reply-To: <20240627182312.86382-1-tmaimon77@gmail.com>
References: <20240627182312.86382-1-tmaimon77@gmail.com>
Message-Id: <171952328964.589118.6080040699735912834.robh@kernel.org>
Subject: Re: [PATCH v1] dt-bindings: pinctrl: npcm8xx: add missing pin
 group and mux function
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
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, openbmc@lists.ozlabs.org, venture@google.com, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Thu, 27 Jun 2024 21:23:12 +0300, Tomer Maimon wrote:
> Add the following missing pin group and mux function:
> smb6b, smb6c, smb6d, smb7b, smb7c, smb7d, bu4, bu4b, bu5, bu5b, bu6,
> gpo187.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../pinctrl/nuvoton,npcm845-pinctrl.yaml      | 22 ++++++++++---------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml:90:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240627182312.86382-1-tmaimon77@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

