Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6617CED2B
	for <lists+openbmc@lfdr.de>; Thu, 19 Oct 2023 03:07:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H3xlOcCm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9qLT54sjz3cBd
	for <lists+openbmc@lfdr.de>; Thu, 19 Oct 2023 12:06:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H3xlOcCm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9qKt5QyNz2yDM
	for <openbmc@lists.ozlabs.org>; Thu, 19 Oct 2023 12:06:26 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EB0D661A00;
	Thu, 19 Oct 2023 01:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FFB4C433C7;
	Thu, 19 Oct 2023 01:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697677580;
	bh=64x4DMR9WJmGdd362zblo6FJofeDBwyFBwAvoTeE+tM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=H3xlOcCmbdfrlbStbX7qyC2+1tccKl62m4RuhR3aw0fTjilSG2GVcd0X525VfIZmE
	 +xT5CC+IDOJnZgVyNv0SL3dvY6/AS85SchslrFjKl4xE+52nrmneSe0sKr9AUxcmHJ
	 eDArIfn6EjfAKc2cfBVPe4F1iXZMzEVMI+Rz5mQXFOz5BPg/WYPEafdQom8gHDEgDr
	 Sghg/CZnnEkVwFzXnB+0+9mirKKR+2eUoLUb+xbWwOcH2imPxClCkK1mSwCTyK9cxX
	 kW8ZEzVkjTBUk9vmkCUsS4coo7tmQhD01QxDXO3odcq4XT8UIXzkdPY7pg7J6qEiAo
	 kAl1oCjttcG6g==
Message-ID: <0da1eb8c9b8ef294309c1027896c409b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230923133127.1815621-1-j.neuschaefer@gmx.net>
References: <20230923133127.1815621-1-j.neuschaefer@gmx.net>
Subject: Re: [PATCH] clk: npcm7xx: Fix incorrect kfree
From: Stephen Boyd <sboyd@kernel.org>
To: Jonathan =?utf-8?q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-clk@vger.kernel.org
Date: Wed, 18 Oct 2023 18:06:16 -0700
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Michael Turquette <mturquette@baylibre.com>, Jonathan =?utf-8?q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Tali Perry <tali.perry1@gmail.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Quoting Jonathan Neusch=C3=A4fer (2023-09-23 06:31:27)
> The corresponding allocation is:
>=20
> > npcm7xx_clk_data =3D kzalloc(struct_size(npcm7xx_clk_data, hws,
> >                            NPCM7XX_NUM_CLOCKS), GFP_KERNEL);
>=20
> ... so, kfree should be applied to npcm7xx_clk_data, not
> npcm7xx_clk_data->hws.
>=20
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> ---

Applied to clk-next
