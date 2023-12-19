Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C05818451
	for <lists+openbmc@lfdr.de>; Tue, 19 Dec 2023 10:23:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VzAlkfu9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SvWSq0qNqz3bbt
	for <lists+openbmc@lfdr.de>; Tue, 19 Dec 2023 20:23:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VzAlkfu9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SvWSD541Dz2ykw
	for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2023 20:22:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CA6BB6123C;
	Tue, 19 Dec 2023 09:22:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A3B5C433C7;
	Tue, 19 Dec 2023 09:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702977752;
	bh=Ku+8/L6tx5nfCW103rlyrYwhlGGJdpQu9+X71/KZcZg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VzAlkfu9Z3REtUNRksAUp5mq8Kx+eq8xN/cAgwUrhypFCcUL+uBOGSk7BtW1M8V3j
	 rDqotlZGdWHGjCU1+Yk19hAyCJQTKMhFUVaV3kJQcuwvE7YKQJ6Ncqk769H4eF1kPd
	 xp8n00F2QY2uR2DHIb38GCqlVa1tcBqifkuNjAChGh2T6RmdR7eVEGX65V+LgPaLXY
	 oFlyqCjxQX5GGZNhTeMStBBzabNr8RK7s0xbk9GrMZh6o6bSvrZy8oghbIsQG3Qfim
	 oKpmeaY5uEXOcD40NnROG8gn6IZG70q8Qq6NOvx++xC9/x1Rrixkz22H4QCM+iXx+t
	 wnkp8qRObiZ4g==
Received: (nullmailer pid 1297834 invoked by uid 1000);
	Tue, 19 Dec 2023 09:22:29 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: baneric926@gmail.com
In-Reply-To: <20231219080021.2048889-2-kcfeng0@nuvoton.com>
References: <20231219080021.2048889-1-kcfeng0@nuvoton.com>
 <20231219080021.2048889-2-kcfeng0@nuvoton.com>
Message-Id: <170297774900.1297817.5593278746406765111.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add NCT7363Y documentation
Date: Tue, 19 Dec 2023 03:22:29 -0600
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, kwliu@nuvoton.com, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, kcfeng0@nuvoton.com, DELPHINE_CHIU@wiwynn.com, krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net, linux@roeck-us.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Tue, 19 Dec 2023 16:00:20 +0800, baneric926@gmail.com wrote:
> From: Ban Feng <kcfeng0@nuvoton.com>
> 
> Adding bindings for the Nuvoton NCT7363Y Fan Controller
> 
> Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
> ---
>  .../bindings/hwmon/nuvoton,nct7363.yaml       | 62 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml:
Error in referenced schema matching $id: http://devicetree.org/schemas/hwmon/fan-common.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.example.dtb: hwmon@22: fan-0: False schema does not allow {'pwms': [[1, 0, 50000]], 'tach-ch': ['']}
	from schema $id: http://devicetree.org/schemas/hwmon/nuvoton,nct7363.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.example.dtb: hwmon@22: fan-1: False schema does not allow {'pwms': [[1, 1, 50000]], 'tach-ch': b'\x01'}
	from schema $id: http://devicetree.org/schemas/hwmon/nuvoton,nct7363.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.example.dtb: fan-1: tach-ch: b'\x01' is not of type 'object', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#

doc reference errors (make refcheckdocs):
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/nuvoton,nct736x.yaml
MAINTAINERS: Documentation/devicetree/bindings/hwmon/nuvoton,nct736x.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231219080021.2048889-2-kcfeng0@nuvoton.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

