Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C30867B2562
	for <lists+openbmc@lfdr.de>; Thu, 28 Sep 2023 20:36:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jpHtj408;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxMcd5BlZz3ckj
	for <lists+openbmc@lfdr.de>; Fri, 29 Sep 2023 04:36:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jpHtj408;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=srs0=w7ai=fm=robh_at_kernel.org=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxMc16FQqz3cjn
	for <openbmc@lists.ozlabs.org>; Fri, 29 Sep 2023 04:35:29 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 41B4AB81CC0;
	Thu, 28 Sep 2023 18:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D123C433C7;
	Thu, 28 Sep 2023 18:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695926125;
	bh=kRFAwJeerof4Xj/Rqpb/7KVVGbGiS82bsy23rOFcCBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jpHtj4087rKeHQLPj+FQ8XNBIAQHRNj9h2vBN0A+kuPX6ON0t7JWcysR3NLYGpZpv
	 IBSLmR3gfLm7qEyFGPKJBNJvzD5UGjGQfjlg4Gnt84ilSfD5eUn+EDHRBQdMCAlHsA
	 GXHd4DRtERaQTIcE67G43tJ2Y3Uieob25sVWjssfuzkTiveSg1PzwJXTLuUg6Phqgb
	 TbkAtOFuJirbyLjpjtp4MqqkDFnPaPt+CGscmTFGdjY49s8IgQbjleHs14m8dnW+sv
	 LCHJ+ALNL+ClD2l795B95g0WFkvcF8PXlSxvN2I9NQUB+JQGdiryvEsUqHdErq5V26
	 lpeBOSQN7WZtg==
Received: (nullmailer pid 1034755 invoked by uid 1000);
	Thu, 28 Sep 2023 18:35:22 -0000
Date: Thu, 28 Sep 2023 13:35:22 -0500
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: hwmon: npcm: Add npcm845 compatible
 string
Message-ID: <169592612186.1034699.3436968254453890969.robh@kernel.org>
References: <20230927173850.103435-1-tmaimon77@gmail.com>
 <20230927173850.103435-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927173850.103435-2-tmaimon77@gmail.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com, benjaminfair@google.com, krzysztof.kozlowski+dt@linaro.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, j.neuschaefer@gmx.net, linux@roeck-us.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Wed, 27 Sep 2023 20:38:49 +0300, Tomer Maimon wrote:
> Add a compatible string for Nuvoton BMC NPCM845 Pulse Width Modulation (PWM)
> and Fan tach controller.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

