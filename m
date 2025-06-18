Return-Path: <openbmc+bounces-235-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76423ADE11E
	for <lists+openbmc@lfdr.de>; Wed, 18 Jun 2025 04:32:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMSSv0YDNz30Sy;
	Wed, 18 Jun 2025 12:32:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750213967;
	cv=none; b=ogs+KNpB5qUk13NXdpqBNSJGZFJpvXBc6GTv6DY1zCVhiiYTQZj0rqdmLHA4TuxYPH9svqjHQ1T/UlJJbC9TWJu0eWSJR0RlADCFtMB7oDc5da1f00ChhWfLCMIgYfsldiOKf49H817EBqCrAqm1IB+oZh0BmSkBEHjlvmJCz7zHaLWEFtkKWs0srf/DaeybyhUx4UPWyv23IRYZ40TMKXkFpBDgY2BXH7YA87dmTCOi5N2YJhjEdqHEBnTiiKGT9hh4P3kOmg5V98nTFR7HpCB6KDdSXyu07pgLkxfdB0GW1zG8yu2Ek3JFUJP/ASUaJtCWKT6l1mP7C7y0DpmDiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750213967; c=relaxed/relaxed;
	bh=AR29u6dqmK6ehegRcbbijgUNzEMQNsv2oGLo6lBr3lU=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MKXESRC/cFw3n5fMN9bPoduRh1d6sYtbqJ04hEZC3KDpamjFyZaU2xsZbfVE1w3xFFR9FXJxlOUHtskjktDwGOGDGTlbXHKwQanqPmg5t2YxR1kAN84M6rC1pDaKYPb04vP5ZbiNQe+1J/ntupvNSlAyMdQwR9C0G0czA4cI6HqzXUUTNYGn+nsACNNV82ZCBargCysyTqWcrrzhV7VD+abFFB4fa1m9OI5nCGWWjZfOdh20SxVJAg5GlI/IwLKlocOSEsCT0jJkuwNSWlAy9HrPyJNgP0eM0f0PmRyLEpNDAXciWPeErzXPZbw1jGuifqaKMr6UDtrQNWjWOO7zTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=c8yy43Lx; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=c8yy43Lx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMSSt4Qrkz309v;
	Wed, 18 Jun 2025 12:32:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750213966;
	bh=AR29u6dqmK6ehegRcbbijgUNzEMQNsv2oGLo6lBr3lU=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=c8yy43LxWxntWCAOlzFtJQAOwl4vSyG4RXS1nvNxQc2BzJW8ypHz9yJ/Q90//MlXV
	 Oma6DS17CsIYdYRhl7qtRMRRNMGkjbmYg9nghh3dwVcaQRzZfuxE02c1a5bZjdhAo3
	 Ly4x5rwRK9gQVoI+Z4+3xall0uLUpOT/BSZd5gP0dZJizBU8SYGXQ/1fxPTjpxg8ps
	 aP63LasTIY3Wz2orNMECmD7DHxpPJhxCYsqKSZyoTA/wP9rpX3VgIZyn+mkCuw9Cj2
	 AXoxBORWQHcrQ0M29SNwhxuMI3DwYyC1A5RRqoEODdIkV0n5ewfG0ESnqm4NN0a37C
	 i2LWYha0Dx0Fw==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 60A1D640A0;
	Wed, 18 Jun 2025 10:32:45 +0800 (AWST)
Message-ID: <100bed083e9a98432888c0b1db8cbc445f96cd64.camel@codeconstruct.com.au>
Subject: Re: [PATCH 3/8] mmc: sdhci-of-aspeed: Patch HOST_CONTROL2 register
 missing after top reset
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Cool Lee <cool_lee@aspeedtech.com>, adrian.hunter@intel.com, 
	ulf.hansson@linaro.org, joel@jms.id.au, p.zabel@pengutronix.de, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 18 Jun 2025 12:02:44 +0930
In-Reply-To: <20250615035803.3752235-4-cool_lee@aspeedtech.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
	 <20250615035803.3752235-4-cool_lee@aspeedtech.com>
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

On Sun, 2025-06-15 at 11:57 +0800, Cool Lee wrote:
> HOST_CONTROL2 register will be cleared after top reset,
> it needs to be saved/resotred while reset.
>=20
> Signed-off-by: Cool Lee <cool_lee@aspeedtech.com>

Please squash this into the first patch.

Andrew


