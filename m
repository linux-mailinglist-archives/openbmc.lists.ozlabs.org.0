Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE97823996
	for <lists+openbmc@lfdr.de>; Thu,  4 Jan 2024 01:21:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BfyobkcQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T56hh1NwYz3cRP
	for <lists+openbmc@lfdr.de>; Thu,  4 Jan 2024 11:21:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BfyobkcQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T56h71PpTz2xQC
	for <openbmc@lists.ozlabs.org>; Thu,  4 Jan 2024 11:21:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 9F65EB815D4;
	Thu,  4 Jan 2024 00:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B222AC433C7;
	Thu,  4 Jan 2024 00:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704327666;
	bh=s7/tvKYtmRpQ4RGIkj3jplCs9SRygwYMY7woM5z1S2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BfyobkcQk5LjTWm9KJaE0omEY1pm2n3wQPSSwQOd/xr8E6dqkT9+u3lXET6/7irZf
	 I0813MoZr/FGZ9q2sD0yyuhsIdBxxIJR5Rph4EfRQSJ2tiyR3oAdMtMLAkznQG2+Yi
	 Ft/F7C6FiCbSBi6aVke+IdWu8FrvEhLVwkdRdqG7gVQ5eDRcDlgW5huIlMO6HyRjnI
	 AF5MO3O0aRSsRDR8igy1DJglmFVAjXS0jZEwrLMd5bZLOuuOsIm1vfUxueIwuPYvUS
	 67wRNA8AeojLBsFW2L1Wb9B1/lJjPqTc/NltRTFZNSP7b6m/PLgLxD1osTV8zhnieo
	 Gip9FH4wCIdAQ==
Received: (nullmailer pid 2195519 invoked by uid 1000);
	Thu, 04 Jan 2024 00:21:03 -0000
Date: Wed, 3 Jan 2024 17:21:03 -0700
From: Rob Herring <robh@kernel.org>
To: baneric926@gmail.com
Subject: Re: [PATCH v3 2/3] dt-bindings: hwmon: Add NCT7363Y documentation
Message-ID: <170432766278.2195265.1869197055341324861.robh@kernel.org>
References: <20231222013352.3873689-1-kcfeng0@nuvoton.com>
 <20231222013352.3873689-3-kcfeng0@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231222013352.3873689-3-kcfeng0@nuvoton.com>
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
Cc: linux-hwmon@vger.kernel.org, kwliu@nuvoton.com, conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, naresh.solanki@9elements.com, billy_tsai@aspeedtech.com, kcfeng0@nuvoton.com, devicetree@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org, linux@roeck-us.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Fri, 22 Dec 2023 09:33:51 +0800, baneric926@gmail.com wrote:
> From: Ban Feng <kcfeng0@nuvoton.com>
> 
> Adding bindings for the Nuvoton NCT7363Y Fan Controller
> 
> Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
> ---
>  .../bindings/hwmon/nuvoton,nct7363.yaml       | 63 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

