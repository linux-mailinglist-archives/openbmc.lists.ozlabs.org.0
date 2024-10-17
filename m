Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 902369A309D
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2024 00:23:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XV2RL1JVSz3cT7
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2024 09:23:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729203803;
	cv=none; b=ULiOSfJ/YF1JtJGp8I684tNCHOEYEgBCoXNKHtiU3ekpbwM3w1uNb4ToyuIEXeT7UCJDY7lc54Fy8TzLb9Lx8FgxvxijIlorq37YjPULd9mwTFqH7RFtY69SYqcsaLXqaxEXoUbw5KBZeRgerUB9zFO5/PqHJgWXBkUyWSKH3wXqbRyQ1y/76rwUjILJs2XzxUBBtaniqAZNNv20DCRenw6FbhT6qY0hYYzPXPCyee+gknZZC9nqs5TZgAHeOhmO3xxgwcvtevpjiMsDYTdMLXdfVtnFQkhhonsx/hEvURI1LgUAZEI4tXl95VWF9fXO9gl8Y77XtdfmbSNso5v14Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729203803; c=relaxed/relaxed;
	bh=KwT/aJPiK5xkDRNj9pug3grDAGO4P5xSfLj+FmVfLyw=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=Q1cFl8tILauAnAblEWfsduUnvDBCi3cW+J465n5CI0ATuvq5E7Er3jO+Mr35k9XVI4uBu+FDFmTnblXu/pNFe/+5PLKXMNg2QF81SJmmUleXLUu9ULwZJBzGFxcq5LvOconnRzElTueQUCjgZ67PAEDGNbbwerh0ZW6gEVcJiLEF8To1oY3+3G3Vsz6UuwdibLpi7PLPuGwl+hSziSxUw7/eikcDgX7fw2eT4vh9bSd3+yFxz5rXAIdLTpRbYJQqldGSkOQEoyR99rbhXYCSsL5zAkbBk9mu9QGVcXJZMhgN86hM7YxB44pTHGgywLtLZdGPkBv3fwIBGUOb2I/AZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m35UKRgW; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m35UKRgW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XV2RG50bgz3bjL
	for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2024 09:23:22 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A0851A441A3;
	Thu, 17 Oct 2024 22:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C67C4CEC3;
	Thu, 17 Oct 2024 22:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729203800;
	bh=KwT/aJPiK5xkDRNj9pug3grDAGO4P5xSfLj+FmVfLyw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=m35UKRgWmadvUcB4X61Ask++YicqU09fqrTf4VnB0Vsv2xgJZUviSmxYPDrxG0TXE
	 qTV2ulmJySWIpWTMtvlZFTld6ReLwIDyXsoJ3v1gLZDAIXGz+2KxArh8XM8F/GYiE/
	 0i4w+QZ+TjC1uyCxTOM9mXcYfiNsFeK9UszNGIdvV6abueMHTMb3zsfc9P5SxngUxx
	 7B5UWU1kZkY25oP+VwP1SPFdt2Uy25OROQFtvlBxV9nzFVsVsevvlUKd9ppjkZhbCp
	 ZiafBn0gB+B2gVHTGRb1iqOZ92KoZpdu/YXvQgmulxPq+HMsbJbKqV2Fx7RKn3S1IT
	 j68GAAQVxbfLQ==
Message-ID: <94fe46018da3f565b065cf914733531d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240912191038.981105-4-tmaimon77@gmail.com>
References: <20240912191038.981105-1-tmaimon77@gmail.com> <20240912191038.981105-4-tmaimon77@gmail.com>
Subject: Re: [PATCH v28 3/3] clk: npcm8xx: add clock controller
From: Stephen Boyd <sboyd@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>, benjaminfair@google.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, p.zabel@pengutronix.de, robh+dt@kernel.org, tali.perry1@gmail.com, venture@google.com, yuenn@google.com
Date: Thu, 17 Oct 2024 15:23:18 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Quoting Tomer Maimon (2024-09-12 12:10:38)
> Add auxiliary driver to support Nuvoton Arbel BMC NPCM8XX contains an
> integrated clock controller which generates and supplies clocks to all
> modules within the BMC.
>=20
> The NPCM8xx clock controller is created using the auxiliary device
> framework and set up in the npcm reset driver since the NPCM8xx clock is
> using the same register region.
>=20
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Tested-by: Benjamin Fair <benjaminfair@google.com>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to clk-next
