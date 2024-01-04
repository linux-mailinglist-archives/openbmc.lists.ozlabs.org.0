Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75977823981
	for <lists+openbmc@lfdr.de>; Thu,  4 Jan 2024 01:16:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h/OhUouo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T56Zf103Lz30g7
	for <lists+openbmc@lfdr.de>; Thu,  4 Jan 2024 11:16:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h/OhUouo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T56Z559N8z2xTm
	for <openbmc@lists.ozlabs.org>; Thu,  4 Jan 2024 11:15:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5E53DCE16ED;
	Thu,  4 Jan 2024 00:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD01C433C7;
	Thu,  4 Jan 2024 00:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704327354;
	bh=PQSQaWGIFy6CX+nXdrF2dhNFv4Stmlq/cXbCvLt/kS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h/OhUouodemCO7MsPxXjy50JIFcBMMH1YcKMwZlznv/nNyLDcE3oWzDSFjGRv4cUi
	 F0egIAh9maLR7HScfZipVxtc7xFow7YZA2DthHBHST0bFiWPPblLE15j5Gzlzh1eR9
	 oZLd2dybgKlrlzb4Zs1S8/nNyi2+6x3GkiQHXtswxUUeMl2Qp0Ocv8eKlwWCncp+FM
	 YCaa5IWeKk6/DLKo2IQ1vV0PuBD/2+uVhPJNbsz8gaI8yAyV6VV5CvY33ty0IVVsOQ
	 nO8IVla5Ui6kdIdRlRvLPfr5ZOt/Izyr662dpdTWAnyHhFVU4Zscx1CnGv8vmFkcZo
	 mb6o//1s3QuHA==
Received: (nullmailer pid 2128936 invoked by uid 1000);
	Thu, 04 Jan 2024 00:15:52 -0000
Date: Wed, 3 Jan 2024 17:15:52 -0700
From: Rob Herring <robh@kernel.org>
To: baneric926@gmail.com
Subject: Re: [PATCH v3 1/3] dt-bindings: hwmon: fan: Add fan binding to schema
Message-ID: <20240104001552.GA2096243-robh@kernel.org>
References: <20231222013352.3873689-1-kcfeng0@nuvoton.com>
 <20231222013352.3873689-2-kcfeng0@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231222013352.3873689-2-kcfeng0@nuvoton.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, naresh.solanki@9elements.com, billy_tsai@aspeedtech.com, kcfeng0@nuvoton.com, krzysztof.kozlowski+dt@linaro.org, kwliu@nuvoton.com, linux@roeck-us.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Dec 22, 2023 at 09:33:50AM +0800, baneric926@gmail.com wrote:
> From: Naresh Solanki <naresh.solanki@9elements.com>
> 
> Add common fan properties bindings to a schema.
> 
> Bindings for fan controllers can reference the common schema for the
> fan
> 
> child nodes:
> 
>   patternProperties:
>     "^fan@[0-2]":
>       type: object
>       $ref: fan-common.yaml#
>       unevaluatedProperties: false
> 
> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
> ---
>  .../devicetree/bindings/hwmon/fan-common.yaml | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/fan-common.yaml

Please implement my comments on v10.

Rob
