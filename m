Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2147D9A3097
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2024 00:23:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XV2R132Pjz3cSJ
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2024 09:23:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729203786;
	cv=none; b=OjAetvCIMfMmW258UmQvmbQG9eYHSzOyGdIlcKE8/dlOoR9gbKGTMA41Gsr81anLmQRF1dz0/Rf28dn+kCMe17SejI2f//hLTw2SOU3SiEaq2JEai9nOZQaZ3MZmmnqGs+liP+JfY/9qKp+ipoOZ7rxsslrxg+hsJIhMqMVV8KxFom/d2Uvih65ZLgH78QWgU7YJSOvFecWl4mAYeE6wOAs1ujAxI+iso5FHI9Jp3mPEsKvXeM3PFYrSa1Mv67JpEsvYnOpJYBMrxz3deog90Q26S7rlHV+JMBujGzAPBm34tLST8zu4W5KUN7XYcSEWactCuwSqQHyFBYJlg7+jQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729203786; c=relaxed/relaxed;
	bh=+3MEtwbMVg+pwHIOeCpCnFSyC1XGVPop3/Krqu4bssQ=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=YKTCG4oDva1zZRSmK+2FTd26EP8HAhNAdxWC/XXBsLnnw3/B+M8lHqBi5W3Trfkza+JDTtIlS5vcdeHPTGrhsQ5qjzH3k4Iu0om/JxH8Brc/oqTExcFMVTU2JELKT3PSENMYVIxuWWATqRXbLMzv+5kMbuBKZxOEQ281vkjcho1rTeydvQ+Lnyx/d/nkTnBZD/grHvdGAZsW4+SwmnZPS9Q4F9g86ZpVsQeHDeJQxrc4cNc0lErXxM0GRuL1s+nxvoovFqzHDnMXGqCYq8XKnypnZ70gDZeGyvykGbRk8xmLWUeOJvyqAWGJ5/Ntpg6AZ4q7MAel26FaN4n7my32PQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ttsCIhsD; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ttsCIhsD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XV2Qx3v9zz2yV8
	for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2024 09:23:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 781C7A441A3;
	Thu, 17 Oct 2024 22:22:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FDBAC4CEC7;
	Thu, 17 Oct 2024 22:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729203783;
	bh=+3MEtwbMVg+pwHIOeCpCnFSyC1XGVPop3/Krqu4bssQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ttsCIhsDOxpnh4ZxU3GKaWXCvvBSUdXqX6jTUljO5LLzwOHtsf6r4OqsN1iH/Ch5+
	 PJqgb189ELh3Ie7EpHW6vdOZJl+JfnLofOGVXgz3fXamudWuFK4tBvuQ4ShNH1Zf0d
	 bTscJprk8amaKk5GdD7Jj/FnmdypN9iM8ZJf9WmFy+7TgML1it4CA0SDuDdlOsdDVu
	 WMHixm16XLvyW+ZNfSy9Vc9NrJ3FjyOnM0BcTbWcfvbJLMoLMzG8R03Z9fbspgNjr0
	 bT90uIuLSzGVtfcy4oi9DDLpXX7HX2E8n7TPAmdkzKXEaPd1Q44VkpV2hGcaoOxT7W
	 sgP3CL8NtiP+w==
Message-ID: <f85d4a18a18859e15989732caff2144f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240912191038.981105-3-tmaimon77@gmail.com>
References: <20240912191038.981105-1-tmaimon77@gmail.com> <20240912191038.981105-3-tmaimon77@gmail.com>
Subject: Re: [PATCH v28 2/3] reset: npcm: register npcm8xx clock auxiliary bus device
From: Stephen Boyd <sboyd@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>, benjaminfair@google.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, p.zabel@pengutronix.de, robh+dt@kernel.org, tali.perry1@gmail.com, venture@google.com, yuenn@google.com
Date: Thu, 17 Oct 2024 15:23:01 -0700
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

Quoting Tomer Maimon (2024-09-12 12:10:37)
> Add NPCM8xx clock controller auxiliary bus device registration.
>=20
> The NPCM8xx clock controller is registered as an aux device because the
> reset and the clock controller share the same register region.
>=20
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Tested-by: Benjamin Fair <benjaminfair@google.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---

Applied to clk-next
