Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B73282A388
	for <lists+openbmc@lfdr.de>; Wed, 10 Jan 2024 22:46:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EhR0vvYK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T9LwY1j95z3cTM
	for <lists+openbmc@lfdr.de>; Thu, 11 Jan 2024 08:46:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EhR0vvYK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T9Lvy25scz2xWR
	for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2024 08:46:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A89E1B81EA3;
	Wed, 10 Jan 2024 21:46:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E11E0C433F1;
	Wed, 10 Jan 2024 21:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704923162;
	bh=hbT21zaEKH9BJDarRM6/a+kiLWB9ebn7plUYWqUhisQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=EhR0vvYKUylc/ffJRTLhiUMz4eN/s/9vb5ME9IPglzsrEhg/rZknl1Q4Io8EH846r
	 FYxqjVYhg/AhaHO3xk6mFAmGKXpzSqLGEKLqaYfcbN50SRm2Q7urgg+VF2h+xZNny7
	 7UJ4g7lTYiz2aoxnKzYeNvUtucnvRJbzB9PffTbm07MCWE8bS0648WBgTRcrHXK3A8
	 0lNCdqCaiMkGVfg4+jNPSmL+8OLrj6V27ng9mPNQbyXNbjrRaXlLFP6Mb5ZG8DbAv4
	 +bMqG4j48/inmnAcm3ammI/JcCIo3jmWiUv3h82R0KyG/mVXCDGB/6inWjJkb09UCC
	 N8wblpu7kQkpg==
Message-ID: <78875535469138a0fd0659d7e621a4f2.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <dc739435-d955-44f7-b5ee-9de4d5336725@linaro.org>
References: <20240108135421.684263-1-tmaimon77@gmail.com> <20240108135421.684263-2-tmaimon77@gmail.com> <20240109170830.GA2772086-robh@kernel.org> <CAP6Zq1jCHVrFfRa6c3DZ4t2aaJTkWukeEkia0AqhzppC0mjbfg@mail.gmail.com> <dc739435-d955-44f7-b5ee-9de4d5336725@linaro.org>
Subject: Re: [PATCH v22 1/8] dt-bindings: clock: npcm845: Add reference 25m clock property
From: Stephen Boyd <sboyd@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh@kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 10 Jan 2024 13:45:59 -0800
User-Agent: alot/0.10
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
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Quoting Krzysztof Kozlowski (2024-01-10 12:54:14)
> On 10/01/2024 14:47, Tomer Maimon wrote:
> >>> +
> >>> +  clock-names:
> >>> +    items:
> >>> +      - const: refclk
> >>> +
> >>>    '#clock-cells':
> >>>      const: 1
> >>>      description:
> >>> @@ -30,12 +38,20 @@ properties:
> >>>  required:
> >>>    - compatible
> >>>    - reg
> >>> +  - clocks
> >>> +  - clock-names
> >>
> >> New required properties are an ABI break. That's fine if you explain w=
hy
> >> that's okay in the commit msg.
> > What do you mean?
>=20
> I think it was clear. Which part is not clear?
>=20
> > Could I add the new required properties to the required list?
>=20
> You just did, didn't you? And received feedback that you are breaking
> the ABI.
>=20

It's fine to break the ABI as long as the commit message explains that
the driver isn't merged yet.
