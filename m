Return-Path: <openbmc+bounces-795-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFE6C051AA
	for <lists+openbmc@lfdr.de>; Fri, 24 Oct 2025 10:41:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctGbk5XnHz3bjb;
	Fri, 24 Oct 2025 19:41:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761295314;
	cv=none; b=m5jMQnvexmcdQ6TY/veI7IshQbHxce28Lb2ty7uSeIjlTfYjmnwjK1Px/WguBzB4Lzm/BbwHdMUbxW14T/WQ2Elo/fQOIcx0sLcM9jXGnIGsb8GijVcFrHyjgHu8CcFT8waXa86lRTLYxxgQfWZjISrZKDPxbrdqougxHX4xFvnzefPRzF1thlA4EbKFdaoRoNTpC9bq5NOC5vI2hcAqUYtKYmbpumDqvLQ6GVwS+ZqL8yz8RM8eEUjUk4yXFsV0Y0rSwuI/VA0UKImTBcCQREVpGlL6zf4VkJCqZQ2qKP7X7UODTzH6LerHGlMIh7dOsemkM0s72IwgV6NwQWCYgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761295314; c=relaxed/relaxed;
	bh=xZfVFPPVci4GUAmOUXfZfQZBdluA6oZlONV9IUe8Pos=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YUgYdHJc1Cz9PbsD5fOlDY4VnYSlMII3jb9589YHCMW8NIikzrXXDHRS+2mPSrSlQCTnxYmuIodiVGh93FdelsEazMMEduOrdaXGOVoILHEiv35VOlBAbYUj+ahY8bCwWdjkreQwF2KHuZ4FBh6qowueli4CeZ9cCyRNFg6z36Cu/JAt+PdzCue76T45WnUupo41m+2OlEjnJQRselccz3eP1S+nThpSLf+aYa5O85JC6OumFY9xmCvUiZbYKwHXJiFoUAqg3xv07Wj1B6eVJrfFMxSJSN7XptfE0IQKAuFwHyAw5ghwlucFwOKB+rYYAeDN9P6wf2da3ROpenHuGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=QdSsnlyO; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=QdSsnlyO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctGbk2Hj8z2yl2;
	Fri, 24 Oct 2025 19:41:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1761295313;
	bh=xZfVFPPVci4GUAmOUXfZfQZBdluA6oZlONV9IUe8Pos=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QdSsnlyOf0QUVeogjKCGYkZww/gZfXB4OgrMZ1sqUAMhfbzOHiy4r9c1xnXsRXoKi
	 GYIHmk+q49Z4uKdasQ7kKFbCOJyKGJdN4BlMEXYPltF6UXs9xyeFqPFuzCZ7Xb+Tnt
	 Ml2JBDe1pZERGcJ+wbfpP9cXVZA6m7SR7aJSegGeMM4/IEk2l41hsbGzgjxReVjtWD
	 VSZvBLp/pdYMDZ+Iyiiu+fWujwYDVCN+rZWhHXqWoXwk7P+oH/b01nOqnRWcafwrWD
	 bIoiTjByPrVq0IE88W7XeP3cNeh6wFzCYNj9BzGZld15rFKMJVEgFZ0WlJxJxerlK+
	 19XYnV6k5PaKg==
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BC02072F33;
	Fri, 24 Oct 2025 16:41:53 +0800 (AWST)
Message-ID: <76a0b578efb62a6e6bd7dafd477fa15b1062a09c.camel@codeconstruct.com.au>
Subject: Re: [PATCH v20 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Ryan Chen
 <ryan_chen@aspeedtech.com>
Cc: benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 andrew@codeconstruct.com.au, p.zabel@pengutronix.de, 
 andriy.shevchenko@linux.intel.com, naresh.solanki@9elements.com, 
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org
Date: Fri, 24 Oct 2025 16:41:53 +0800
In-Reply-To: <c20e0b8a-ec59-4359-ba5e-1a616fde9894@kernel.org>
References: <20251021013548.2375190-1-ryan_chen@aspeedtech.com>
	 <20251021013548.2375190-2-ryan_chen@aspeedtech.com>
	 <20251024-dark-ringtail-of-defiance-1daabd@kuoka>
	 <2939cae6-2e8a-4528-8e27-8c932e2f82de@kernel.org>
	 <bf3d6690b9124ecf74df6c0f9f1c0f72ae1db9f7.camel@codeconstruct.com.au>
	 <8341a903-639b-471a-8425-a98c473f5ab0@kernel.org>
	 <c20e0b8a-ec59-4359-ba5e-1a616fde9894@kernel.org>
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

Hi Kyzysztof,

> > Not much different than every other soc. All of them are separate
> > IPs.
> > Look at any Samsung, NXP or Qualcomm binding. Separate IPs.
>=20
>=20
> So let the move happen, but please explain in the commit msg that
> devices are completely different - nothing in common - and thus the
> binding will be different. We indeed do not keep completely different
> devices in one binding, but based on commit msg I had impression this
> was just major block upgrade.

OK, makes sense.

Ryan, let me know if you need a hand with the commit message changes.

Cheers,


Jeremy

