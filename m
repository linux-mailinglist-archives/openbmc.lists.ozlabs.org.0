Return-Path: <openbmc+bounces-239-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68468ADE163
	for <lists+openbmc@lfdr.de>; Wed, 18 Jun 2025 04:56:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMT0c38xXz30VM;
	Wed, 18 Jun 2025 12:56:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750215408;
	cv=none; b=Bp/F2wpc3kmM49xANt6hDzq7OBxQg4Gpf5GH//+sEzD4l9SeY/lT2YxVATAW8dlNhE/9wJchC0LrvBSrH7ISBojKzXTcw91N5VlzOzuH3i80h8+PWyv7c5OJq8m5GZwe/6NHhBZvJVqqAwUZA1wUd1/muLQy45igG6Q4aRuphj45bCBN0oSGgvan9mPsv22pjOm/i1ii3jXLY5dPw6j4gwKLdD4gm1Vp4JsbcIkEalHaK5m+Vcx4isR+3Kxnhqs9rgeDLswnhK6KjMo6oQo1Z9wZmH44LMtKf8Nizh0o32+aMdDFrzz+rdyY/ns4G06f+wK/UUQhnOrlkX8iLpVldQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750215408; c=relaxed/relaxed;
	bh=4pKigNPmZrFFJC/kPV5i7vSCvjFvbcP0l1T50tmE0zw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n4sqhgU9LT2rjA3kK0dBCO6WrCQcTHeIUN+1KyTc1ITd8SvYtnJPQtsuO3j4hlSk/zzhSoiUvQEFeMOiH+P4pZAIVaBHLOma7+bdxnC44LaaZqVJrqms0FOA6yrtlv+P3Hjm9zY9dEqvaK66FPy+EfOgIe9/ItSmVvl5zq5yKdNMxhtcTaoxrBhcSmb/AtZ0i4J7wZy9xZvgZCOI7tVjRqCWVmo1sM4QknlV7LiiCJjAwS/XyZku5PBWo8C5yXdFGJJIGIKl1vCo7tVsazK3PTlXFl9vGFZZvOieCq0k+fE33GXboJ0QNuAwxrgCfkgR499M5GOJCGxqaWc55XbEdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=MDag//uu; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=MDag//uu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMT0b3Yb0z30Sy;
	Wed, 18 Jun 2025 12:56:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750215406;
	bh=4pKigNPmZrFFJC/kPV5i7vSCvjFvbcP0l1T50tmE0zw=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=MDag//uujeHgEIW8EjiXtf2BXnS05nbJYgYjInjggZnP4NvHya2YAyfHshB529YMQ
	 GnNytvTl57xg/M0pZLHsAFClcKzo7i+WhMqY3yMN9f0NZrbiuRbMDiIXM64j3IzRwl
	 Fdg0SmXvmffbLAcTMcTRioMOEPx3PsFnEdVD+5k451s5ztDWyPHnPQOhoNRqHcrZHN
	 5YnvQuCAm9Eg9F4DfzrXtz5UER3pRbxAV5OtksZcvATKXB7fBZK7lEQ6NGL04Zite4
	 kl0xJKcUnFVaQCJghNvtu7EdT9Y68qT/rwbkz5GRqi5zIdSyYWayaLrsHiu/kJYKHp
	 20ch+tM1+XPig==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 404B5640A0;
	Wed, 18 Jun 2025 10:56:46 +0800 (AWST)
Message-ID: <9c85755a8aff6e6f8a5548f0b5e758dce7d6353e.camel@codeconstruct.com.au>
Subject: Re: [PATCH 7/8] mmc: sdhci-of-aspeed: Remove timing phase
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Cool Lee <cool_lee@aspeedtech.com>, adrian.hunter@intel.com, 
	ulf.hansson@linaro.org, joel@jms.id.au, p.zabel@pengutronix.de, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 18 Jun 2025 12:26:45 +0930
In-Reply-To: <20250615035803.3752235-8-cool_lee@aspeedtech.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
	 <20250615035803.3752235-8-cool_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, 2025-06-15 at 11:58 +0800, Cool Lee wrote:
> The timing phase is no more needed since the auto tuning is applied.
>=20

I feel this is unwise: we're now ignoring constraints set in the
devicetree. Auto-tuning is fine, but I think that should be a feature
that new platforms can exploit by default. Older platforms that do
specify the phase values via the devicetree can be converted at the
leisure of their maintainers (by removing the phase properties).

Support needs to remain in the driver until there are no (aspeed-based)
devicetrees specifying the phases.

Andrew

