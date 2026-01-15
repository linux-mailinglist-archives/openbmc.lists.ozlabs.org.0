Return-Path: <openbmc+bounces-1211-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D132D25A7B
	for <lists+openbmc@lfdr.de>; Thu, 15 Jan 2026 17:15:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsSkZ2pX4z2yFm;
	Fri, 16 Jan 2026 03:15:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768493718;
	cv=none; b=TFdUVMYONpv9HUis1FF3UmIz75ztEks+pI/+gKPPZB4nyb9dV3tjIjX9FVYuAD9aq5dBGXXk0uDUoC4xDJ1GNHDo6Qs4VbKIIPsBmsPVr2yGDgeanprKXenLV5e6QDK2ssLorJC8/ugoz0q6YRqcet+frSa1UMQE3NAnIGKqc/A9miRw+I/WeMdecKeb1jhgvum88j9htkwWZUSF9s8qD7monXeQ4V5FCuVRHemhHgLZkM078/iXdLtcDPYI839eRacPl5fIeDGfYvBy0lRkJMYVKDIweCd+PCQdcfGJFZTd4SLghiVqslX1i2w81K/1QLQyRvaionnLiyc64poYdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768493718; c=relaxed/relaxed;
	bh=zjAI4sw5fZWleNcy5E+bpQXvW8kKtlqPBKTICHmyuec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KYLiEIhRvwpKwoDGqsVnrDa/xFzn113eViM4FwS+1GScYuqHISC7CkOE/2JhV5qfAhpVF+UIieuU/ZaZdEicl65eLFzETLiOfujz+6updC7ljVxAkr7QWaDddfTudXivlHvKpvllZYg5VaG8nXngkYLRc3aKrujsHV38l28Cy+xTH9/3o0hGVbgVcrR4CEEpXCKw2vpmd5mI1cosoTWKT+5RB8LjZmbVlzd/T2dlxVYxkqS/a5ksImw+g9SW/paErdplzYFvx7DRL2gjl1RvWPwPSjN5ggVqgrD7GyJowkpf84ubkbai7cfy7A8LOxG3EDylueeQUx7/vXS5rGH5JQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sntech.de; dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=SgdIcZUf; dkim-atps=neutral; spf=pass (client-ip=185.11.138.130; helo=gloria.sntech.de; envelope-from=heiko@sntech.de; receiver=lists.ozlabs.org) smtp.mailfrom=sntech.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=SgdIcZUf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sntech.de (client-ip=185.11.138.130; helo=gloria.sntech.de; envelope-from=heiko@sntech.de; receiver=lists.ozlabs.org)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsSkW45mmz2xNg;
	Fri, 16 Jan 2026 03:15:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=zjAI4sw5fZWleNcy5E+bpQXvW8kKtlqPBKTICHmyuec=; b=SgdIcZUflo3NqJzUtZoYf3GC3K
	JoftSOW3X/lY1Pi0hsKuGnEAdP4Xkf5RvordXf9jqy/NXsqZI+Z3rm0864ea3sOV7wd/8n9x7TvtR
	ARiOH/6XDRwyxFUUZHmrpZt0rTw3cKAEfr/8D2rBa/g7KXdHd4XnhJA71SnSWDqVtE46lIRk+gy1J
	Q0WOnuPWm0qZF9cm/OdeCNOkNotf4XE+ZUvm31xeAo65yyG78TGmmnh9t5FRX88lrDB46GzObUFAh
	+/gpCNBZZk3YysdtvJL0VWcu3kTeeVsfbo57gmVuXzvKtkhX3JI40zs0p7BTnQcxIo1BAyB3m1W7H
	bUiVO0eg==;
Received: from i53875b85.versanet.de ([83.135.91.133] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vgPzV-002UXc-0C; Thu, 15 Jan 2026 17:14:33 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>,
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject:
 Re: [PATCH 10/11] pinctrl: rockchip: Simplify locking with scoped_guard()
Date: Thu, 15 Jan 2026 17:14:32 +0100
Message-ID: <2415619.22IY78Rhhi@diego>
In-Reply-To:
 <20260114-pinctrl-cleanup-guard-v1-10-a14572685cd3@oss.qualcomm.com>
References:
 <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
 <20260114-pinctrl-cleanup-guard-v1-10-a14572685cd3@oss.qualcomm.com>
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_PASS,T_SPF_HELO_TEMPERROR
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Am Mittwoch, 14. Januar 2026, 16:30:11 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Krzysztof Kozlowski:
> Simplify error handling by removing two mutex_unlock() calls with
> scoped_guard().
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



