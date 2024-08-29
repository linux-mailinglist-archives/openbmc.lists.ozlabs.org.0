Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2816A963E7F
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2024 10:31:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvZHJ5sj5z30gs
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2024 18:30:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4601:e00::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724920249;
	cv=none; b=A2iGba0k5FNJAutw9Tj8VYT2wQdBJadU9AO1SkbT8NA+iqUyql/CYjclj6ruf5O3Q7sRdml43ZBCFzBFSigSQI3lhWjOC64XWQ6+HjdwDI3xZj52zFx/O24J3HbSE/YofX7a8Q1ChOp4xXqB+ug3rHWNHXIv2vtOYLbBWe2HuIanZZ5FJLLQqtaUIXSR3GPPPxoLwQLl/iNCzpnQhhA10uXOsf6rztaoLhf8+I8wo+XH+MSSpj2pM13g10Azu8oY6W8KrZKTrf2gKsZlxB75PKsQuRURCkZazikSuajAKx0j6ho8vI3mcs/5JBt7u3BdeCK4PUb3lahMIgNSlYLA4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724920249; c=relaxed/relaxed;
	bh=99cVmOk/+Jri0kFJbZroSwJmUMnZSsWLvoFot9saxLM=;
	h=X-Greylist:Received:Received:DKIM-Signature:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From:To:Cc:In-Reply-To:
	 References:Message-Id:Subject; b=XAKfucHH3nI+ljjdBgoO4d9+B+YOfIGSuA1LYM58j1Ob0WmHplrzQ/h9dR2F7HOW0NoVQLhy9Twd05vyNwYzt51CsQ8G/SNazYBuH67OGw8u4t9JrimqcNFMCJMAo/NOEpoMLzBlREzCTJf7N14AWymVL2vk0ZorIc9EBcgCS3gTah1LEcUREWZyCc3b+5MkM5zzwW7j6i7H7ErRBB0QtVRGAekwWgCwXQ+ygT7bpRc8d9NqMh6Y/BIDL7EpmDCaTaP7axNahy9RC0zBIwMkbifY+KuD+aBKtWYHC5BawZVcpllpVbgD+SANcQccWxwmrAbQQpvl7GYYZPWjT3oEhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LfxGg7nx; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LfxGg7nx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 421 seconds by postgrey-1.37 at boromir; Thu, 29 Aug 2024 18:30:48 AEST
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvZHD69s1z2ypD;
	Thu, 29 Aug 2024 18:30:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A756CAE4D9F;
	Thu, 29 Aug 2024 08:23:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 678AAC4CEC1;
	Thu, 29 Aug 2024 08:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724919823;
	bh=ZYaSGp+fnpZ/q2d742FCiD1B5Vwp233d4XIjEq3SxmI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=LfxGg7nxC/5pTw/pl4SPD3eMgN3WOG2lJTTMvpwQujpq7RUcrhezJRMpG6N/oVe11
	 oG44QXMWpDJ4pzQlAFFUn3uPYjMXTNErlElOrv2xbum2lE3syzFYUuQY92OZf4hMHe
	 kZUzsstPPpndi65VdFlfenzrkGUS2hhFH7B9kyUpkZNEUyLRTrYCfT55CDKfFnxKob
	 d0iaO3mzp/3DguWkbICbwsuR6GYGZcg3oixLlC+jA0QXCdf0oxtOqLYLJ2uvxA3P4y
	 74liAa0d+SclnZHStNHPjWN1/kjOh2dS3Gw4vm7qJLe0AECKs8kKo2Dmjjz35xleYf
	 INrXQOo4/NVXw==
Date: Thu, 29 Aug 2024 03:23:41 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <20240829064508.3706672-2-jammy_huang@aspeedtech.com>
References: <20240829064508.3706672-1-jammy_huang@aspeedtech.com>
 <20240829064508.3706672-2-jammy_huang@aspeedtech.com>
Message-Id: <172491982164.2766568.9027879446207472741.robh@kernel.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: media: convert aspeed-video.txt to
 dt-schema
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
Cc: pmenzel@molgen.mpg.de, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, eajames@linux.ibm.com, linux-kernel@vger.kernel.org, hverkuil@xs4all.nl, joel@jms.id.au, krzk+dt@kernel.org, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Thu, 29 Aug 2024 14:45:07 +0800, Jammy Huang wrote:
> Convert the ASPEED SoCs video txt bindings to dt-schema.
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  .../bindings/media/aspeed,video-engine.yaml   | 78 +++++++++++++++++++
>  .../bindings/media/aspeed-video.txt           | 33 --------
>  2 files changed, 78 insertions(+), 33 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/aspeed,video-engine.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/aspeed-video.txt
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/media/aspeed,video-engine.example.dts:27.29-30 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.lib:442: Documentation/devicetree/bindings/media/aspeed,video-engine.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1432: dt_binding_check] Error 2
make: *** [Makefile:224: __sub-make] Error 2

doc reference errors (make refcheckdocs):
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/aspeed-video.txt
MAINTAINERS: Documentation/devicetree/bindings/media/aspeed-video.txt

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240829064508.3706672-2-jammy_huang@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

