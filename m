Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D15939843
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2024 04:26:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Wh/bDAUR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSgyP0yV1z3cJl
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2024 12:26:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Wh/bDAUR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSgxr4CDDz2y8t
	for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2024 12:26:24 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B64D460347;
	Tue, 23 Jul 2024 02:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD84C116B1;
	Tue, 23 Jul 2024 02:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721701581;
	bh=CvBnaUn52mQsjo7putJFlBA0OHXKCUh77DIwGSeIFDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wh/bDAURixcRQrQfIZOFV3X51sOAGG2pvqnFa+mFpzftqL7H/ayRXkAo1Lyq0mJJm
	 rw6YVjtgIVMqxlmRF1/FfpZIB/NlBuMC5RnQNnJQ37yyRLZYym3Ut+Kc/HgI9oZ28F
	 NSJciyiq3YGap+rRLnsxAQFVAU9+UxoqlV1gdOJz3LYXulTyblad0CmhB7lW8VHaXr
	 QppfnlqJURWCkMleaOFJzqRrC0Ed5k2FYQ2U03qv57EGD2uRiYmyCqSurHaeSVSU8x
	 cKYl7K2O0Aa10H/7rGBlbCqzy6zPIVpPQ+BJnfaKtovQdir5RTqOLzoxsRYOM+QS9x
	 aSfGAid1vxRhg==
Date: Mon, 22 Jul 2024 20:26:19 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: pinctrl: npcm8xx: remove
 non-existent groups and functions
Message-ID: <172170157801.126503.9265506561761708567.robh@kernel.org>
References: <20240716194008.3502068-1-tmaimon77@gmail.com>
 <20240716194008.3502068-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716194008.3502068-2-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, benjaminfair@google.com, linux-gpio@vger.kernel.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, joel@jms.id.au, krzk+dt@kernel.org, linus.walleij@linaro.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Tue, 16 Jul 2024 22:40:02 +0300, Tomer Maimon wrote:
> Remove non-existent smb4den and lpcclk groups and functions from Nuvoton
> NPCM8XX Pin controller binding documentation.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../pinctrl/nuvoton,npcm845-pinctrl.yaml      | 70 +++++++++----------
>  1 file changed, 34 insertions(+), 36 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

