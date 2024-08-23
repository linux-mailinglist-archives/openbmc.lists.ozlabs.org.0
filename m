Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 802DC95C3D8
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2024 05:48:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqmJQ2ZqKz30WM
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2024 13:48:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724384911;
	cv=none; b=Aki3W8t1jdJ0zzdKKfCiGqjfPbXkxE1lVLze1rhaBz1vFuUTRZphaFGS7hWtOnlcLVpzoRZS7BCshayTw5RdmbKIMYbQgAk51EicKS8MTFDcjqrMo7hT59K11dCFYx/jDCWrCRV6ft6ypqmNLnY07bj5HNNFXWxgmuAvEaZ6ADwaOAgUgFheK6CV5qfgt5ImP2e+KxhbeA6rtRNgH8lzi1BUtfWvSO6o6H7oG5qQbxKi8WwNcfTLkUVa8nRdT+rgS44lkeusR2OqRtiEsil6RYrS8dEp+AqWfk+nnZQ5zXVC7mlvZEU+Tsd7q2rBzdFNUXuaaznDL6Idg8H/8W9onA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724384911; c=relaxed/relaxed;
	bh=FgeSrOHv+6Rg2NrAXC8HchICekN4thq7/uEj3KORuwA=;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version; b=WrT+K/m460lWm9PQEbXxDEUhL4Q9VhFBFnhiinpxyka2eoA2NjSbtW1zCjWKON/nbrFgRjSaatfMYGkIY/SZvcUHaVI3ikulilgaWKibJbuQ1fAbAgGppFZMtUyQXyGdsmguOs7iwc62txPPJJJWIfqLP2WFnNcGLL+4TdnmNvDZk91vkeZF9S1PcPKoLD3Wfeb3jxidfrzrdmF8YYKjcq/zvuLXXpPSzb2vYQTjjkIrseOsll9DzYg3UrM1RMYLQzZ2D7eiBADQfgeIHyz6jEN6/E3NBUEgizeO9p3ShXv4b73g21KUrA7tvOr4ajgWY8ugQDJWpqt/ciP3JXBBoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Yudc/LsS; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Yudc/LsS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqmJH5cJMz2yHL;
	Fri, 23 Aug 2024 13:48:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1724384911;
	bh=FgeSrOHv+6Rg2NrAXC8HchICekN4thq7/uEj3KORuwA=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=Yudc/LsSAh/NAZaSmQ1cwwN5piR03p1AgXpyYkmHbMVL3t1hxemDYV93fa3yP077+
	 HLZlEHBgNYJLs7CpY2JbPKKJhmLrO2gedIqPUoPU/U073AkLXd7B2hXKALfBGzQh3Y
	 1nDiRmTmNKCF41Ubfr1UPcsLT9IWvBZD7HQNoEauahsxIVRyMHzt4zpCIJ5RoBDBJo
	 fAsKG+VuslKwSXtBVxQKBi4JWhIn1JbzYukO+C0jsQsfFSxXENV0Iy5fsWrBHb91ew
	 ORjx/6Z1aTP4UdpyNVy9ZHXZT0XHXG32OGAx7TxqEQd5kx495St/SEQmzUcTywwIo5
	 rxr2Oyz1UdgyA==
Received: from [192.168.68.112] (ppp118-210-185-99.adl-adc-lon-bras34.tpg.internode.on.net [118.210.185.99])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 46CE564FDE;
	Fri, 23 Aug 2024 11:48:27 +0800 (AWST)
Message-ID: <ce983ad163263ad32e4291f3a7f9361e395fd70e.camel@codeconstruct.com.au>
Subject: Re: [PATCH] dt-bindings: i2c: aspeed: drop redundant multi-master
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Brendan Higgins
 <brendan.higgins@linux.dev>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>,  Joel Stanley <joel@jms.id.au>, Andi Shyti
 <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Rayn
 Chen <rayn_chen@aspeedtech.com>, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org,  devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Date: Fri, 23 Aug 2024 13:18:26 +0930
In-Reply-To: <20240822132708.51884-1-krzysztof.kozlowski@linaro.org>
References: <20240822132708.51884-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2024-08-22 at 15:27 +0200, Krzysztof Kozlowski wrote:
> 'multi-master' property is defined by core i2c-controller schema in
> dtschema package, so binding which references it and has
> unevaluatedProperties:false, does not need to mention it.  It is
> completely redundant here.
>=20
> Suggested-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20

Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>
