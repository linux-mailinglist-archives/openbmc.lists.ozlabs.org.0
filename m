Return-Path: <openbmc+bounces-260-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7381AE0352
	for <lists+openbmc@lfdr.de>; Thu, 19 Jun 2025 13:20:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNJ7Q19jKz2yPS;
	Thu, 19 Jun 2025 21:20:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b2b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750332033;
	cv=none; b=m0Rh5K8TPCDzJUPzEUZgIQX5O6k5KIvsLGu6NFtme0DtXDd7xPH5k75AO7rk6yuaCHkyXaGe+hPduHYsZr7yneC1dIxwY5pKwSU/uI5gJPIyOuBQV+hpYTWpmKEAEt1X7FbCpCZpZdBcectCjRRGLhTbDBo2B83matFidhrongN69LtoW5DQw1W60LUXIlskxuWTrqwYislC4GdQMB8Gk/FMZlX54b/aelMZJYZYyi9emNW5zjIeQ7vW0Gkj7Z7qQ9/3GLPB/7pMJXA5LerOztYonolQ4n2LHQCg1K8+R5ZLhcGmZzEnGMbuwmHZjnvVIi11RVJ6yHvndh/QrUoc3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750332033; c=relaxed/relaxed;
	bh=PBUsi0YBNMAsSBVKTalCtjkPCy5c9CLBxMjhKRUhDZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MnXC4iGGiYOQ6K/+W1fQSbZe43sK3G7mZUr0E3JP5Y/w554a3JM/oMkTW7CiXjIgQm2JmS/S/RF0tugFFTt5Lbr0VRlrptD0JDcXoArth+gMGm7Unx7q5tUSsLA6/1Bp5YCF3xZcaEjPkCcBIz0szL+LpJBqAZyCQk370hESeAdZqZYxwr081qx6jF1GFUzJKMDFNFPKz5M49HIRUWbgxN3owd+FM0X9R4ToGnzKW8VbpXO7pZNXuqLG0DHIROczkWU+wUt2IT4y3BN9ydq2mfEBdKpeJjQ1q9XY3A/RpA8lgBqLrnT9XkzSaLD9QgA4UNXhvPeoL8vXfzzFVPE8OQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=y5WkYUtb; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=y5WkYUtb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNJ7N39PMz2yKq
	for <openbmc@lists.ozlabs.org>; Thu, 19 Jun 2025 21:20:31 +1000 (AEST)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e819aa98e7aso620763276.2
        for <openbmc@lists.ozlabs.org>; Thu, 19 Jun 2025 04:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750332029; x=1750936829; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PBUsi0YBNMAsSBVKTalCtjkPCy5c9CLBxMjhKRUhDZY=;
        b=y5WkYUtb31T3JMoeZbLvKkXeJnVoqbgZssYAfVMjU2od/bOvFusLkVhjLt2m7se6oG
         JDF567Xdcg3jMbn74HpXuat+oADIdnpAOTummuTTS8gQipxuCVqCXG1lMNBu6dau9j6/
         MfEmRjaky2Ax+LFOb7Y70fAy+M55pLNBnvFxfn7AbzyYIl9sToJkDJS6kJQ5TjAH8nKg
         EvBN1sGtCnfqZ0t0PKTxLTqPBSyNdx2wfFryJigeef6+A53sgioRtEWCtNj38cuVo7FK
         lCsaAgdSOTF5Nep5lhfj87QFF8o3pQPG5lSsLa40yzMfzaUrM9RsMVGZYqre5eyVC0oJ
         OHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750332029; x=1750936829;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBUsi0YBNMAsSBVKTalCtjkPCy5c9CLBxMjhKRUhDZY=;
        b=d4dTPMGF8YS6MG8hbx4Hgzz4RPuW+qxNWc9ZfF0JUxh55wgElLNrxQTT0MBsL9TAGO
         hS3Tje9K4kyyUqbPkKbVBNC1rF2kytM+ckwWcPOz2TQG8yYKvzj2N6D/yvvRbm+QObkv
         5KEzE9VUQ8DY/2Xy9Lno0mi9ErPQ69veBy4XWqWPABUhgOzKlZsq/FT/IRZhM/2v8Vkw
         df1oe2/k4dwxf2nTft0vga/p2gnvJFeU1wCvWbea7hqMWYOSA0W37HLtp+kw5KHrOq/G
         1RVQm6XO307S3mASeFJmpbIBqITUF2J8mWSowVETlxUPEUQHCYf6icki6gXl8MkMTcc8
         rIJA==
X-Forwarded-Encrypted: i=1; AJvYcCVDPqC2z2zrFikVEi9xiwQBFyrNkngkwa7xY6w0mPKkOqBJ40n0SgsWdE6NSXa/POOBlcJ7OJor@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwyUloLG2e0Mmn3E05vYYhTkElUR8zETiRNMIGb0c9C7Oy1ipMa
	d4rhcIKiVagVZDkN29f51cJ7IEmt3UvcbaGpyofZZABr1toFY0PewVH0mPbkrUJE469J8Q/3+8R
	RTLGcp4ngOucf0W/RJ84YMqxhiXd7oiqEkS4Cuxv5Qw==
X-Gm-Gg: ASbGnctXeo8YJufiiMgGLuS3hJMnjZnV2bH3pb9zsuXOqgDx0/yhaj+mG20NiNXsA33
	ZurlV9tAsENzO9tghnKUeNtzQ7XtHBrpJkBNqor2j1TvF9RuLlpU3bUOeO7b8rW3GRgKCYPkilJ
	4Fg0nGHxbt1HCF26Xqu/rI/0uMUAbayujWU/jQTFraHOzx
X-Google-Smtp-Source: AGHT+IHX9ksGPdiWQPczJro/bAe1IGvypwqoP8WCOZDCwwHcVTV4TvNUdtBj0nob0BRaQUU78E2vrWhUpGn208sRiuY=
X-Received: by 2002:a05:6902:1b04:b0:e82:13f4:6156 with SMTP id
 3f1490d57ef6-e822acc6b88mr30435408276.13.1750332028965; Thu, 19 Jun 2025
 04:20:28 -0700 (PDT)
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
References: <cover.1749127796.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1749127796.git.zhoubinbin@loongson.cn>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 Jun 2025 13:19:50 +0200
X-Gm-Features: AX0GCFvvZQe_9Nix73DE7Q-G_-P34yyA4RJkioiqjIQNcE5PdVnCw3Am06hW7zc
Message-ID: <CAPDyKFqbCcHPN8yf9Rzo0b0Gr2uBwXUCJDQNkSnnBesESN+kQA@mail.gmail.com>
Subject: Re: [PATCH v3 00/35] mmc: Cleanup sdhci_pltfm_free()/sdhci_free_host()
 usage
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Adrian Hunter <adrian.hunter@intel.com>, Huacai Chen <chenhuacai@kernel.org>, 
	linux-mmc@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Ben Dooks <ben-linux@fluff.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Kamal Dasu <kamal.dasu@broadcom.com>, 
	Al Cooper <alcooperx@gmail.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, 
	Michal Simek <michal.simek@amd.com>, Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org, 
	Aubin Constans <aubin.constans@microchip.com>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Yixun Lan <dlan@gentoo.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-tegra@vger.kernel.org, Hu Ziji <huziji@marvell.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, 7 Jun 2025 at 09:32, Binbin Zhou <zhoubinbin@loongson.cn> wrote:
>
> Hi all:
>
> After the first part of the cleanup[1], there are sdhci related
> drivers that need further cleanup.
>
> This patchset is the second part of the cleanup series, and since sdhci has
> sdhci_alloc_host() as the general interface, our main job is to clean up
> sdhci_pltfm_free() and sdhci_free_host().
>
> [1]: https://lore.kernel.org/all/cover.1748933789.git.zhoubinbin@loongson.cn/
>
> Thanks.
>
> -----
> V3:
> - Collect Reviewed-by and Acked-by tags.
> Patch-19:
>   - Use dev_err_probe() to cleanup the code.
> Patch-32:
>   - Fix build warning by lkp:
>         https://lore.kernel.org/all/202505300815.tjQRQD6z-lkp@intel.com/
>
> Link to V2:
> https://lore.kernel.org/all/cover.1748515612.git.zhoubinbin@loongson.cn/
>
> V2:
> - Collect Reviewed-by and Acked-by tags.
>
> Patch-01:
>  - Set sdhci_free_host() to empty, rather than dropping it.
> Patch-07:
>  - Set sdhci_pltfm_free() to empty, rather than dropping it.
> Patch-22:
>  - As requested by Yixun, retain the goto scheme.
> Patch-35:
>  - New patch;
>  - Since all calls have been cleaned up, sdhci_pltfm_free()/sdhci_free_host()
>    are now dropped directly;
>
> Link to V1:
> https://lore.kernel.org/all/cover.1747792905.git.zhoubinbin@loongson.cn/
>
> Binbin Zhou (35):
>   mmc: sdhci: Use devm_mmc_alloc_host() helper
>   mmc: sdhci-acpi: Drop the use of sdhci_free_host()
>   mmc: sdhci-milbeaut: Drop the use of sdhci_free_host()
>   mmc: sdhci-pci: Drop the use of sdhci_free_host()
>   mmc: sdhci-s3c: Drop the use of sdhci_free_host()
>   mmc: sdhci-spear: Drop the use of sdhci_free_host()
>   mmc: sdhci-pltfm: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-bcm-kona: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-brcmstb: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-cadence: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-dove: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-esdhc-imx: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-esdhc-mcf: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-iproc: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-msm: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-npcm: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-of-arasan: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-of-aspeed: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-of-at91: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-of-dwcmshc: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-of-esdhc: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-of-k1: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-of-ma35d1: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-of-sparx5: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-omap: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-pic32: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-pxav2: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-pxav3: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-sprd: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-st: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-tegra: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci-xenon: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci_am654: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci_f_sdh30: Drop the use of sdhci_pltfm_free()
>   mmc: sdhci: Drop sdhci_free_host()/sdhci_pltfm_free() interface
>
>  drivers/mmc/host/sdhci-acpi.c       |  3 ---
>  drivers/mmc/host/sdhci-bcm-kona.c   |  2 --
>  drivers/mmc/host/sdhci-brcmstb.c    |  1 -
>  drivers/mmc/host/sdhci-cadence.c    | 21 ++++++------------
>  drivers/mmc/host/sdhci-dove.c       | 12 ++---------
>  drivers/mmc/host/sdhci-esdhc-imx.c  |  3 ---
>  drivers/mmc/host/sdhci-esdhc-mcf.c  | 25 ++++++----------------
>  drivers/mmc/host/sdhci-iproc.c      | 18 ++++------------
>  drivers/mmc/host/sdhci-milbeaut.c   | 19 ++++++-----------
>  drivers/mmc/host/sdhci-msm.c        | 11 ++++------
>  drivers/mmc/host/sdhci-npcm.c       | 15 +++----------
>  drivers/mmc/host/sdhci-of-arasan.c  | 26 +++++++----------------
>  drivers/mmc/host/sdhci-of-aspeed.c  | 10 ++-------
>  drivers/mmc/host/sdhci-of-at91.c    | 30 ++++++++++----------------
>  drivers/mmc/host/sdhci-of-dwcmshc.c | 14 +++++-------
>  drivers/mmc/host/sdhci-of-esdhc.c   | 11 ++--------
>  drivers/mmc/host/sdhci-of-k1.c      |  1 -
>  drivers/mmc/host/sdhci-of-ma35d1.c  | 23 +++++++-------------
>  drivers/mmc/host/sdhci-of-sparx5.c  | 24 +++++++--------------
>  drivers/mmc/host/sdhci-omap.c       | 21 ++++++------------
>  drivers/mmc/host/sdhci-pci-core.c   |  9 ++------
>  drivers/mmc/host/sdhci-pic32.c      |  9 +++-----
>  drivers/mmc/host/sdhci-pltfm.c      | 16 +-------------
>  drivers/mmc/host/sdhci-pltfm.h      |  1 -
>  drivers/mmc/host/sdhci-pxav2.c      | 26 ++++++-----------------
>  drivers/mmc/host/sdhci-pxav3.c      |  7 +-----
>  drivers/mmc/host/sdhci-s3c.c        | 16 ++++----------
>  drivers/mmc/host/sdhci-spear.c      | 11 ++++------
>  drivers/mmc/host/sdhci-sprd.c       | 33 +++++++++--------------------
>  drivers/mmc/host/sdhci-st.c         |  6 ++----
>  drivers/mmc/host/sdhci-tegra.c      |  9 +++-----
>  drivers/mmc/host/sdhci-xenon.c      | 15 +++++--------
>  drivers/mmc/host/sdhci.c            |  9 +-------
>  drivers/mmc/host/sdhci.h            |  1 -
>  drivers/mmc/host/sdhci_am654.c      | 20 ++++++-----------
>  drivers/mmc/host/sdhci_f_sdh30.c    | 13 ++++--------
>  36 files changed, 135 insertions(+), 356 deletions(-)
>
>

The series applied for next, thanks!

Kind regards
Uffe

