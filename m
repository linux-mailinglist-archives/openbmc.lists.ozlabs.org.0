Return-Path: <openbmc+bounces-412-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A92B16A52
	for <lists+openbmc@lfdr.de>; Thu, 31 Jul 2025 04:11:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bssyN5HqWz2yF1;
	Thu, 31 Jul 2025 12:11:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753927884;
	cv=none; b=RLOVSz2H6f+nHRUTQsPs2BRv393fHacscO44ipNuMnr2cEGjrJHRnew4FFtvfM+Dl1NAnw8KYpAx3GMNNmOwlnWska0bCAthRcTXRonrrpyrH41HT+gsHtRrNEOMoxEews6tNgUYTTb3DLnAS30PC+US6+cQhJHxJNnvaf5TfEwL+iXXzfQLq2HUGKAoiZheEeyUUNCe297vkdqS26nKjhawGLnM3uhrSGa7vv8h947gmVWqCfVXn8IUtoDis5DmqF5yT+ngLCZhda9mhneVz6JKpOoECNmslQhNld67NoRI6kmhfjusKYocqPBlV/eDBJ5pgI12fHZeDZzz4vQJvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753927884; c=relaxed/relaxed;
	bh=/+TfOEWR0Nli29bN6WrEzJLsG9aHc0r+gNTRjB2A+GM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MOC5ATRzNNHBCLxWtGmM0S384U1IOmjrGuAIqxiY9SfR940JeHYAX+9Zmg71o0W2fldH75SjEMCGwIbgE/8ou9ogZVQ2DIQzw1o0lFvswrsS+vcThsIl55IGF1zl5wJE4330tcVUORtA5fJFXBRfps/av+L6MKanj9QubTbnXr/Isq9/1UorOFfe32hHcqLrS1w1jcM1obQVJgNWI+ZhDPyvQ9Grij3l38yGsrqUCOFPv3tKHU7nP7oBuBNmOyWk/4f6Se6t8K5HZhQBIt/VUQKLWIRABPDkjsixdyciz+n0nE8PjzHG9cVLRVnftk8oIxSPtu5Cguu7K9uu1LU1Ng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZT1Knmkf; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZT1Knmkf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bssyM44xCz2yD5;
	Thu, 31 Jul 2025 12:11:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1753927882;
	bh=/+TfOEWR0Nli29bN6WrEzJLsG9aHc0r+gNTRjB2A+GM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZT1KnmkfhOaJuo/p5h6IVFRznALO76XlJ+P7ddQ5Flf3pmvBxi2pO8e3vOFv6Vkvi
	 aAeCv8ORPyqaUSuNoJl5JZXACdozJcdnThpGcjeX5Vob97c2cR7gNP+/DhIX2Hm9J/
	 MucMr7u76yYSOrLlZ1al+FxuhjMQSP3Xez2lv0/84y0cxXffF+icO7Rv+V7SmWzx3T
	 6IMAX3CjnOpj3oKhk7px0mFuLwD3Qxt4bNymA+mzz1DO/fa4j/mlQwoOluBPvV3mt3
	 dojq2p5DGHhCRH8mh3w9XT87GBJgtrjWCiW/MzNVNNYeNvzmUe4sUhcK8LXOaXbETJ
	 ZbJVaPUlNdBSA==
Received: from [192.168.68.112] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7D5B569374;
	Thu, 31 Jul 2025 10:11:20 +0800 (AWST)
Message-ID: <2de9da0e95d3e1284a29170c99f7b69baadb9518.camel@codeconstruct.com.au>
Subject: Re: [PATCH v7 0/2] Adding device tree and binding for NVIDIA
 GB200-UT3.0b
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Donald Shannon <donalds@nvidia.com>
Cc: conor+dt@kernel.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	krzk+dt@kernel.org, joel@jms.id.au, linux-aspeed@lists.ozlabs.org, 
	devicetree@vger.kernel.org
Date: Thu, 31 Jul 2025 11:41:19 +0930
In-Reply-To: <CAL_JsqJwgbWa0sPVgdxMchPfa1hR8o-=wRh4UgoK3QfDdW+S+g@mail.gmail.com>
References: <20250723222350.200094-1-donalds@nvidia.com>
	 <175341328135.3754696.5873094296930738476.robh@kernel.org>
	 <CAL_JsqJwgbWa0sPVgdxMchPfa1hR8o-=wRh4UgoK3QfDdW+S+g@mail.gmail.com>
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

On Thu, 2025-07-24 at 22:25 -0500, Rob Herring wrote:
>=20
> All of the below warnings you are introducing...
>=20
> And yeah, all the ones above are existing, but I don't see a lot of
> progress fixing them. It seems no one adding their board cares about
> the SoC warnings given the lack of progress on aspeed stuff. Maybe new
> boards need to be rejected without some improvements...
>=20

I had an old branch with a series that reduces the warnings. I'll
rebase it and tidy it up a bit wrt more recent binding submissions.
Once it's mostly sensible I'll consider pointing people to it as
suggestions for fixing existing issues on the path to getting their own
devicetrees merged.

Andrew

