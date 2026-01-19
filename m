Return-Path: <openbmc+bounces-1236-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6FED39B9E
	for <lists+openbmc@lfdr.de>; Mon, 19 Jan 2026 01:18:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvWJc5zbCz2xnj;
	Mon, 19 Jan 2026 11:18:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768781555;
	cv=none; b=hGGGNq9waWzIVKnAUZnD82icWKXe+FE94UDzn8hGLMr+WYGmxrFq/GhotDY5vpg/AJ0MaeUu6o1TwbBk+g9isMXh5dznWZBujTxOEJX8Wx0SiaYZ2zvLB3GwEQWjD1cXQIA26594BdvR4pYcksL+TWQVcKnXAG/AShEn4+XjSvdEiRjfeMM/zC+LBq63+XCcashzBaZU3wIBmSl5C7Q01m5w2cXy8vSXwCmRNulAy3CbHWXX1DK6GqAIPAzpfy1gMqInVsCqZHPE0uCfBZNQFcTBWwYMvvDrnw4jB34d2vV78co9cGSWdMAKZ5L+9vM2swsi2UR+NFRNaNeKZicq4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768781555; c=relaxed/relaxed;
	bh=77e96+tn9mecLGBrZtPY9Ll7+CLmgZeo5o+F4wCK57E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nXZoZMb30Jyssmipn1dnk3yEkA2xzPrWe4FNnOgywkd7k37BPmyvWIY59dDlwM4UKJHkIC0/F0z/v4Vv9gOAM3qFH41drV2+I8fFgiAg8iPzJtl8G3K0Z1yLutEETGX/Dvsqn4fGvtRDL8YU/IVh7IW2PDtOQwk92jBOQp/v5NcD5RgDTFpg4SdqcFEjE19rCWMDSBRJ4DHZEPJEBRvkQyusBN91pJDstmJRCIFGURb/pelu77PRKtJiVUNE6bbCxJ3vUsbCUPrlOs86Eo17WHsXjHfPP7WBLjJCYE0/Dr8hsb0tmHfgw6ik9G7nsROjbA1PaEs8hqgWi+ZeX+uoyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nW7h+1My; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nW7h+1My;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvW9t3g8dz2xnj
	for <openbmc@lists.ozlabs.org>; Mon, 19 Jan 2026 11:12:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 98C276012B
	for <openbmc@lists.ozlabs.org>; Mon, 19 Jan 2026 00:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D5DC2BCC4
	for <openbmc@lists.ozlabs.org>; Mon, 19 Jan 2026 00:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768781551;
	bh=GM6hjWxnbx0Rs5/7Y45dHtccDdEstdeBQZhCBY29WCk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nW7h+1MyHv+XY/D+QMgQoPSEsvqC4xZS08EgMm5QgWJWAQqCzRkqWlAFfEeFeKwzk
	 uoviDMATdhhTN9GYHHY9iRFzkaxxUD9pLBAMVOYbGJeVRuCnSJApuxVhY8BCvxlQ5E
	 dgoArPak6gRs4bBLk5jVHbVkVkg4zsSs+2pVVD3EOiqYMmh34OZJEd/rJul6jkgQJ+
	 e9oaDFyyAJoQ1Qp1DeErXTf+NherfvJ7rOJgwo457Bfp0Mm6oQ9fii3A6VAYrU5mb5
	 JbGTWaIr7+xmJpWRxkx0Zf99/arNagUn4ATg1W9VXanBKldhTQJ3Mec8vROa2lsBl2
	 3o8700Mmbeq+g==
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64471fcdef0so2917143d50.1
        for <openbmc@lists.ozlabs.org>; Sun, 18 Jan 2026 16:12:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXFZZpptLGinK9kxNUmFg7HGQ08QkMeCpB1s/IZU1P453wWmi9Dj4oNGheblFCztE1EtuBwQ0Fw@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwZ+4c3Uf12cXSBVglOgzP7fJL2XkxMD1RH69c9qXcFFlIv8CAG
	pdNNL8+YGgYwKqjsJx9KZXmqB6s5diMGjslp54r8DPyy7LI3L56yBjpNgvl9sMILyzEM7Ru+Obd
	wp/o1nMn4c+khbXmVPDLMxahtkiA9x7E=
X-Received: by 2002:a05:690c:f96:b0:788:989:fdae with SMTP id
 00721157ae682-793c52a3abdmr187836947b3.28.1768781550470; Sun, 18 Jan 2026
 16:12:30 -0800 (PST)
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
References: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
In-Reply-To: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 19 Jan 2026 01:12:19 +0100
X-Gmail-Original-Message-ID: <CAD++jL=+MP0UZsPRAh=+1TL+7ow+rZ_VqNW=XZN1Ht82Lw88FQ@mail.gmail.com>
X-Gm-Features: AZwV_QgFwFIzeGhMFaeDXLwmJd24DRy_tYYmpsNkgD6HAMBqdqwm-YSi6s6fPfs
Message-ID: <CAD++jL=+MP0UZsPRAh=+1TL+7ow+rZ_VqNW=XZN1Ht82Lw88FQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] pinctrl: Some code cleanup including guards
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
	Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Heiko Stuebner <heiko@sntech.de>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Jan 18, 2026 at 7:10=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Changes in v2:
> - Patch #9 (pinctrl: tegra-xusb) - Drop stale mutex_unlock (Jon)
> - Add tags
> - Link to v1: https://patch.msgid.link/20260114-pinctrl-cleanup-guard-v1-=
0-a14572685cd3@oss.qualcomm.com
>
> Few cleanups - from unused headers - or code simplifyings, including
> usage of guards when beneficial.  I did not conver cases where guards
> would be mixed with gotos, because this is discouraged practice.

v2 looks good so patches applied!

Yours,
Linus Walleij

