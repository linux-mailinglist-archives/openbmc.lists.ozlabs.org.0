Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B408C44A6
	for <lists+openbmc@lfdr.de>; Mon, 13 May 2024 17:54:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ieDlxfXp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VdPDX1SG1z3cTh
	for <lists+openbmc@lfdr.de>; Tue, 14 May 2024 01:54:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ieDlxfXp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VdPD11Q0pz2yvs
	for <openbmc@lists.ozlabs.org>; Tue, 14 May 2024 01:53:37 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EB68ACE0F80;
	Mon, 13 May 2024 15:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25109C32782;
	Mon, 13 May 2024 15:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715615611;
	bh=QSJ9adYiyENvXrlQE+wO4TcEhBc9/Ph17/BE6YNfe6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ieDlxfXpA9mxINnKrBrM2GCwrkLA9HNJPKbLm9C/lqpQFq0LO17JxHQ5uZA+KL6rT
	 fJyNrr4u65gmS8FFm3lb5931uxXg2yS9xUTJoCWACUw6M/nAKyrIP8HaZmVGIvIaQ+
	 bfOQZ2bKhDtjDd5XX23odoR30gx6gTCdsLQ3ZWzdH1SSBSKBM/fR7wTnddJ42JOgC+
	 baHJi9lP2OF4w6InqIIQnayFq9bNTna2TackQajsyBnp0ql54m+U08BEocIAcTCzIX
	 3c9N+3FvSE8SxUcuaUm0v3ONTToHAGatMO9OikwYDDGZhIaDGKNSwVOP+ZUQs1UGik
	 E6oy83RDLePNg==
Date: Mon, 13 May 2024 10:53:30 -0500
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v24 4/4] dt-binding: clock: remove nuvoton npcm845-clk
 bindings
Message-ID: <20240513155330.GA2676859-robh@kernel.org>
References: <20240509192411.2432066-1-tmaimon77@gmail.com>
 <20240509192411.2432066-5-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240509192411.2432066-5-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, p.zabel@pengutronix.de, sboyd@kernel.org, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 09, 2024 at 10:24:11PM +0300, Tomer Maimon wrote:
> Remove nuvoton,npcm845-clk binding since the NPCM8xx clock driver
> using the auxiliary device framework and not the device tree framework.

Again, this is an ABI break. Changing driver architecture for 1 OS is 
not a reason to change DT.

Rob
