Return-Path: <openbmc+bounces-1118-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D2AD06B64
	for <lists+openbmc@lfdr.de>; Fri, 09 Jan 2026 02:17:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnP5Z6rCJz2yFk;
	Fri, 09 Jan 2026 12:17:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767921458;
	cv=none; b=MffruRneOLELl6bXFR3OeHmI/AVLS09S02BchCgkNe6pBgPV4EMCTi1zJ+ELgdjcuFgbIZl3K7Xh2Vs+9FOCT1qGQ3ZjlZzXrPSNG9pp1cxXg1RaYlQrjoAKpMJRNH6V7RVMs0IxJpAEky2Ooiym+biAKclXJH/UwMaxZFpVb/XHYPSGJpSBFfNUKBoa8FJPnYKeT1/Na7gK1sIgeKrNT/ipOz19XRoKu5uj/gvjFbnBMr/cjF7sPgSRxoCZyG6gzwmON9R3R71dbVBEpr0FmltFm7l/Qi84Wrv6RsVzeQeiL78J+wcf12RAeAhtZQ1Cab7oBDDuCJpLdHeyTuIG8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767921458; c=relaxed/relaxed;
	bh=LwK/7HWLNZdkoZbc3509z1EnYSgWBHAg3nkDVt2PhWA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZPNhIsO9FRNvbdxcNMKhoYPgNhO8f4rG+h+Hg5lelF7jO8cqcWY007IlpnA8ADL9PqajFN+Z4+FSJgpGiN0WTqQ4iqX9wUc41z1XsuO0w9SGdTTR6qKPXvGzD5r6ziyyQYMOPfOy8rU9XOA4TB7E+ndKzizD13dP8wm8vEfrWhW9MKEOh6l5DdDf/S6z78R9iDIaL0fOgJrgip5SuXqR8gf2bqfIfRsj/PXtTpkLEwHzVxto2FMm6vb0FQq913vMPxxYLiNJUtk6syTGDB+0389UtDL0fLvd7Nw9AuOP8ZXdJ+0YF4ptZWrLFETE7SdjeBtktybLwLhMgNW1pu7bmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=FBjtDv7p; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=FBjtDv7p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnP5Z0Zfdz2xpl;
	Fri, 09 Jan 2026 12:17:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1767921457;
	bh=LwK/7HWLNZdkoZbc3509z1EnYSgWBHAg3nkDVt2PhWA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FBjtDv7pUlyQuW0vTX7EesZslU0r4uFRyOYi3Pd0Wk1zqc/bokiLlqYR2AXRqdXQk
	 un0pBO2N1yEdS8OFrG7NJALuJBb/q23oequJ5ojCDahrnrnxx/fmtvfgnfgpeq+2Pz
	 qEJlRwU+TSyYDQP5W9AiQXE1h71pfWaL/iiHY0PtblZi1OuGyc351stq1fSiAlWHKA
	 2IiJlURKUoesVvWjY+4dLPSRfNwBOhZBpsYR7kgqWUkClGJFtqpfpiPAJdFrhG2i99
	 uR4bvL5JVJU9D5mkJh8dRa22b3yH+faWEKPL+wFc9MPp8AndVUW0P+zAGOe/ukAKVp
	 gg1TEqZF5zEhw==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 081A87E142;
	Fri,  9 Jan 2026 09:17:36 +0800 (AWST)
Message-ID: <0b94a728bdee2483d0e963bdae69178539ed7721.camel@codeconstruct.com.au>
Subject: Re: [PATCH RFC 03/16] pinctrl: aspeed: g5: Allow use of LPC node
 instead of LPC host controller
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 linux-hwmon@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, 	openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-iio@vger.kernel.org
Date: Fri, 09 Jan 2026 11:47:36 +1030
In-Reply-To: <CAD++jL=TXQyGD5nSdg37KK=OrUJDwi=2pXQciLr+udC9hjCVkw@mail.gmail.com>
References: 
	<20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
	 <20251211-dev-dt-warnings-all-v1-3-21b18b9ada77@codeconstruct.com.au>
	 <CAD++jL=TXQyGD5nSdg37KK=OrUJDwi=2pXQciLr+udC9hjCVkw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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

On Wed, 2025-12-31 at 22:38 +0100, Linus Walleij wrote:
> On Thu, Dec 11, 2025 at 9:46=E2=80=AFAM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
>=20
> > There's currently a wart where the Aspeed LPC host controller has no
> > binding specified, but the pinctrl binding depends on referencing its
> > node.
> >=20
> > Allow specification of a phandle to the parent LPC controller instead.
> > Fall back to testing for a compatible parent node if the provided
> > phandle doesn't directly resolve to the LPC controller node.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>=20
> I guess when this is non-RFC I will just apply these two patches.

Yeah, no dramas. I intend to split what remains to be applied into
separate (non-RFC) follow-up series now that many of the changes have
been applied.

Andrew

