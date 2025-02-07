Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4161EA2BF34
	for <lists+openbmc@lfdr.de>; Fri,  7 Feb 2025 10:25:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yq7qf2KCWz3bjL
	for <lists+openbmc@lfdr.de>; Fri,  7 Feb 2025 20:25:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738920331;
	cv=none; b=kNlNyBCPHO96w+tCPfYMNMGd0uG/O+7t6keCYXeN7f79jnwNjUQ0M3wp382UBQE6vdDklwZ18RrQ5gN1hUTTeA441AI0uoiXuHOsZjbFZaofFcxzIN/O2Z37EZIdsixaDQUJiJawK26dXgaWdWfXMcuSJ86ZO6PpOEToOPoOHNb2VOmDzZ3GYJzNirExs4RsY4w3YXx0+NO60wJeVInN5lOgDuf2s5tFHDxnzY9Jwffz1bPrCNlD2u9rqkwlFVB/jV+y6JKB5Wv7NfGY7PgeUZmtI+st4GcRcfivSjXnvlSMOSjpi+9RBTW3MwpIAhLgHoV9aTQ8o99rBu9m4lKxyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738920331; c=relaxed/relaxed;
	bh=uhK0WSdvHMp787ndCJSk4Ea1XSz2JS//VsKMpAoKLlA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=HXkbdRvCuBBDxhAg3+jnkyu3/7DHEoMNUzQFF1+THpANSWH7hA8ynzxU3bbUbLRQw/jPESTQWkcfz92cAK6OcqMFajYMCgZFsbqiF+YsnXApWkcVSQbrNlk8zpsv4PZCrGXC0Sa/vGzZ7oZsSPwAFnZ0b+7S3Um2yI30zYMgB/zlU+0a4j8hrhTE3AeyRrO4FaJfWvRjFg6JJzcOrqkrXUhko5KwsnTCAoyRXyA63h1p2iYQtbbRuoIwlsNtntva2nEolX0g1Y+QAC2ZIGHly5zcKX6E7TfTFfdhhdfcRF5cKDb0Jvupi+Vgd7PAYjDxFNy8yfItya3YJEb6ORrSgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FoDA4+SM; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FoDA4+SM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yq7qZ2j5Rz2y66;
	Fri,  7 Feb 2025 20:25:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AB71BA4271C;
	Fri,  7 Feb 2025 09:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFF92C4CED1;
	Fri,  7 Feb 2025 09:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738920327;
	bh=kF7bqOfEPUr/1NjhgrCLEjkTuw9hFLco2ae4W2t7H38=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FoDA4+SMwU8LqI5xPUcyA5YFPx2OWZI08q3Zegddu0PgzHiWdxO7CWWhvxNWYlxfO
	 dxkAoFvD3RWtPpsGuE01QUligb3BkydtmaoZ9r1m5GRHlXSAJnM1aGUM14/0YtftKv
	 YJFXuGPrXlqL1jF+R4A2SGhThekSSY8+H3DM6AGpVU1h45nmQBol/xtwKLYmpy3MMa
	 2rkC6jrFEvTH+QIqLb0TYStvohRDuUiYMwg+IrXXdCfeK5ehqdwQvzUndv4t1wpGwO
	 ocRFK/Zdt2lU4sEVLCsY7bAd8mMJc7XDY973225MKpI4xz01Cpu/vxcuqwWCuwqdCp
	 jl/ifOtnDArsQ==
Date: Fri, 07 Feb 2025 03:25:25 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <20250207082351.1298990-1-jammy_huang@aspeedtech.com>
References: <20250207082351.1298990-1-jammy_huang@aspeedtech.com>
Message-Id: <173892032595.3714424.13095199531321692299.robh@kernel.org>
Subject: Re: [PATCH v3] media: dt-bindings: aspeed,video-engine: Convert to
 json schema
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, eajames@linux.ibm.com, linux-kernel@vger.kernel.org, joel@jms.id.au, krzk+dt@kernel.org, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Fri, 07 Feb 2025 16:23:51 +0800, Jammy Huang wrote:
> Convert aspeed-video.txt to yaml format.
> Update aspeed-video.txt to aspeed,video-engine.yaml in MAINTAINER file.
> 
> Additional changes:
> - Two phandle properties, 'aspeed,scu' and 'aspeed,gfx', are added for
>   video engine to capture video from sources other than VGA.
> - Update examples and include appropriate file directives to resolve
>   errors identified by `dt_binding_check` and `dtbs_check`.
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  v3:
>   - Add Additional changes into comments.
>   - Remove | after phandle description
> 
>  v2:
>   - Update patch subject
>   - Add NOTE for false positive warning
> ---
>  .../bindings/media/aspeed,video-engine.yaml   | 84 +++++++++++++++++++
>  .../bindings/media/aspeed-video.txt           | 33 --------
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 85 insertions(+), 34 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/aspeed,video-engine.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/aspeed-video.txt
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/aspeed,video-engine.yaml:44:55: [error] syntax error: mapping values are not allowed here (syntax)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/aspeed,video-engine.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/media/aspeed,video-engine.yaml:44:55: mapping values are not allowed in this context
make[2]: *** Deleting file 'Documentation/devicetree/bindings/media/aspeed,video-engine.example.dts'
Documentation/devicetree/bindings/media/aspeed,video-engine.yaml:44:55: mapping values are not allowed in this context
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/media/aspeed,video-engine.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250207082351.1298990-1-jammy_huang@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

