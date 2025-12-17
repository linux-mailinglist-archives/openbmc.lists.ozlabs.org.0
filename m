Return-Path: <openbmc+bounces-1046-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8332CC6BFF
	for <lists+openbmc@lfdr.de>; Wed, 17 Dec 2025 10:14:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWSmt2wk2z2ynf;
	Wed, 17 Dec 2025 20:14:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765962894;
	cv=none; b=MT3tvJ0296SNPNibqX5QWBga5xtVZnGttCBXXfbzom9AqKvrkh7xkStMrmObaYHmSgwRIPANC/y+ZD8iZr/6qgTW4IIyHnSQ+8jdJo4b5arD1t8G2mw703mmCJnLNApjn8ZWGkkokaJDY8p19OV8OYEQip/r+aCX1mKxYO51d1QpnUp8r/cHFWnbaZtAgsgqSxld9ckctdCLn9T76yU8c0JDiGDc2XUzRJSj0H3v5YuVDR4jFZGvlRt8nAz1yWh3SVb+Yc60BwdvPuZQv4XmykGRQ21oEpk6bjzCephi2j+kCtMZXmopUjyrJhXraNQllXLBmYEAzDAIQlJpmklXOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765962894; c=relaxed/relaxed;
	bh=Zu3xiqt8XeGi+o0Fn7/wG3sbIHwKMH3kMLpPih7LPWM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XQOFdUrjNkhwwsgA7ajnDFRm0iPmZ04XtmU4Au8xeeoUzzHfepe8TFh4HIVmFwCfu5WHUKGmN1AS6+pUqUaaCUwed2a4VR4a976Fl8rUqDo5FGLkAeNJAoWP2xcxYVJmBV83chJsyCWDF2Q4uwoI6GbT6CEshKbKON/LctaPwWHpZvO/kxkjMXSE6rwJQF+5D7UggO8noFB6RlBvlu24bt6FGdA0MeRiDl5VnLeAceMhHWev63oit6/dNgDHSIenudbS2Dy2xeHujs+6LhB4Il62xqK07j13BCphW8q99OPE6GIS9Cv6xczFrBHI3/Z4ET9N1W4iUlr4Hv553mCcgQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ry+QAcQD; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ry+QAcQD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWSms5PbBz2ynH
	for <openbmc@lists.ozlabs.org>; Wed, 17 Dec 2025 20:14:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CF98F601A2;
	Wed, 17 Dec 2025 09:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00D3EC4CEF5;
	Wed, 17 Dec 2025 09:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765962860;
	bh=/7SLiaIZZd96i9+L5hF9k2Q8Gkh3M6Xu20IXncyQWyE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Ry+QAcQDzdbTO9ui1IjzczaxqrMNQYAB7HadZFm+kO65EgEFytBDUkZ8m/12VCflS
	 3XAJz8Oa3PcXrC5gSxK4nIIu0vuyTcjEhIxLLDsBw6NSD6GTV7MKUHKgD1oQacsN4o
	 3Ky2wPQZtkz00+8Y1Ym4i3WjcIXskkQWl9pCxrXMdAeOJHmnL2QZTj88TvsQSniPRm
	 0RNJuuScL4RgQZQWKrSL//ctvXKZrS+67/sFsvKbZ3aTcUiL7Q87eHt+Rbc7BlVQan
	 0dWTzgq4TJOGPrKsklyL5+R+RuAHIkfy+YBQInMs1KWo5nfdfz8ody5BL8qjiVXzEy
	 GMEHR2IrkvftA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20250819131725.86770-3-krzysztof.kozlowski@linaro.org>
References: <20250819131725.86770-3-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 1/2] ARM: dts: nuvoton: Minor whitespace
 cleanup
Message-Id: <176596285769.23017.10677165882858222439.b4-ty@kernel.org>
Date: Wed, 17 Dec 2025 10:14:17 +0100
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Tue, 19 Aug 2025 15:17:26 +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '='
> character.
> 
> 

Applied, thanks!

[1/2] ARM: dts: nuvoton: Minor whitespace cleanup
      https://git.kernel.org/krzk/linux-dt/c/0fa50c575c1f33be0ab353d0d3820e20357e83fe

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


