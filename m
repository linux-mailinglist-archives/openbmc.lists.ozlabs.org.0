Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B044871ECA
	for <lists+openbmc@lfdr.de>; Tue,  5 Mar 2024 13:15:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mvlvl0P+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tpvfb0QTgz3dxN
	for <lists+openbmc@lfdr.de>; Tue,  5 Mar 2024 23:15:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mvlvl0P+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tpvdy6q51z3cPm
	for <openbmc@lists.ozlabs.org>; Tue,  5 Mar 2024 23:15:18 +1100 (AEDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-dc23bf7e5aaso614908276.0
        for <openbmc@lists.ozlabs.org>; Tue, 05 Mar 2024 04:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709640914; x=1710245714; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D6ktVqDmV7ss5l9SPN0xrD5/Tg3eFMGNcebSziUH+H4=;
        b=mvlvl0P+eu5vyugteNaiOK8kEzbz1ZnCArG5Ljb0pgJ02boej3Mmwep+J8TW2Aa2pA
         I84Xnl/MFu9MJYYu546x51dCfaXOCmDxx5BO3TOXTA/fnvXL0US8A08G5A1haLePggW0
         KhECeW/z71Y3PE1E5gpm4vtRhh1Zq6Mp2oCJX7tZVxztdeRvwIIWFwzV67AIN6tlcjbE
         dtcDaTqhjMMf13ORPw/WxL14GeKzWch4t1EEAu8hfJ36bs+DCm5kNEbYyvOp/fs3WEo1
         2SM2/ruIJ6rLBkHiuiF+a1YQiVtP0twXKgF9TBM6eAuKL1CLJ6AY78du2SLxH8jK+yKe
         CvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709640914; x=1710245714;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D6ktVqDmV7ss5l9SPN0xrD5/Tg3eFMGNcebSziUH+H4=;
        b=NYyUHPEaA57HKCCzR8VSA0n+YIobB5AefK+Ep98eiChD0FoczN7sTC/iKqcj8EazOf
         B2OCRw6XdVAK2oWvtx5yQbv23bHnrLQPW+80gLR80BvmNp35td1/h92EMEbsx81UaPXr
         2zBeIWOcn0Nj97vkMRbAt72yWbvaABaM1FncGkHaWLeNKJN6aRKtN+erW/Z5DmjTJ4uJ
         ww3TF9ucv4PuTHoKMmdyVwuaBswcRJXahIEWeufUXsy9T3uUUA4Y6YPCkzk8pOeVAgdV
         Oj3qAjBEdlh2vxYpuz4SJtHA8rsro6hESC9/CRM/MfiqSn9KpaUZ83rFQY+OuIJXZk33
         ACIA==
X-Forwarded-Encrypted: i=1; AJvYcCWUnvU1UgPwSkUOopzX5xcMMBFYs7HLHAqUyG09wPd6SQ6BURHAfIzPHxwBVvuyCwUvimk9+ucdOKvaIIVOGXUOFtw9+LbwWro=
X-Gm-Message-State: AOJu0YxZKDLOv+Os4l9JdoTCowGrXefVedtIjTnXWwLohtnJXAVHwpl3
	/QPEu4HyyNt+Ge6zIk3v1Inibb1Zpzt7gQIIQo8L61fYevdklfMNvqjEsR45eUocCOcrQXgHVhA
	3L6mAwxdKCIKPIjOZilQsP6RBVTpxyMfb6NtOww==
X-Google-Smtp-Source: AGHT+IHJmE+6b6Odnde6C3f/sbKVeXzyy1wl+EKNqVOXCbMbm3t6RelV+5/PPHkUcAMaI42bBn2Jf21OcLZDfzyvrZM=
X-Received: by 2002:a25:d883:0:b0:dcc:e9d:4a22 with SMTP id
 p125-20020a25d883000000b00dcc0e9d4a22mr8993815ybg.12.1709640913987; Tue, 05
 Mar 2024 04:15:13 -0800 (PST)
MIME-Version: 1.0
References: <20240229-b4-mmc-hi3798mv200-v7-0-10c03f316285@outlook.com>
In-Reply-To: <20240229-b4-mmc-hi3798mv200-v7-0-10c03f316285@outlook.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 5 Mar 2024 13:14:38 +0100
Message-ID: <CAPDyKFrKiJBONLhOj2KDWZug_BSZngUUxtrEnF+H+imfEctETg@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] mmc: add hi3798mv200 specific extensions of DWMMC
To: forbidden405@outlook.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, Paul Menzel <pmenzel@molgen.mpg.de>, linux-mmc@vger.kernel.org, openbmc@lists.ozlabs.org, Igor Opaniuk <igor.opaniuk@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org, Jaehoon Chung <jh80.chung@samsung.com>, tianshuliang <tianshuliang@hisilicon.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, David Yang <mmyangfl@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 29 Feb 2024 at 02:36, Yang Xiwen via B4 Relay
<devnull+forbidden405.outlook.com@kernel.org> wrote:
>
> it's modified from hi3798cv200 driver, but quite a lot of code gets
> rewritten because of the hardware differences. Actually cv200 DWMMC core
> is called HIMCIV200 while mv200 DWMMC core is called HIMCIV300 in
> downstream.
>
> Signed-off-by: Yang Xiwen <forbidden405@outlook.com>

The series, applied for next, thanks!

Note that, I took the liberty of updating/clarifying the commit
message of patch1, please let me know if there is anything you don't
like with that.

Kind regards
Uffe


> ---
> Changes in v7:
> - driver: simplify tuning logic (Ulf Hansson)
> - bindings: fix patch order (Ulf Hansson)
> - Link to v6: https://lore.kernel.org/r/20240221-b4-mmc-hi3798mv200-v6-0-bc41bf6a9769@outlook.com
>
> Changes in v6:
> - apply the comments to the first patch, add their trailers
> - Link to v5: https://lore.kernel.org/r/20240220-b4-mmc-hi3798mv200-v5-0-f506c55f8e43@outlook.com
>
> Changes in v5:
> - pick the dependant patch: https://lore.kernel.org/all/20240215-mmc_phase-v1-1-f27644ee13e4@outlook.com/
>   to fix the bot build error.
> - edit the semantic meaning of hisilicon,sap-dll-reg property (Rob Herring)
>   The suggestion is from the CRG driver side:
>   https://lore.kernel.org/all/20240218205741.GA1561527-robh@kernel.org/
> - Link to v4: https://lore.kernel.org/r/20240217-b4-mmc-hi3798mv200-v4-0-0fdd9bd48532@outlook.com
>
> Changes in v4:
> - rename dw_mmc-hi3798 back to hi3798cv200 - Suggested by Krzysztof Kozlowski.
> - add r-bs to patch 1 and 2 - Reviewed by Krzysztof Kozlowski.
> - Link to v3: https://lore.kernel.org/r/20240217-b4-mmc-hi3798mv200-v3-0-f15464176947@outlook.com
>
> Changes in v3:
> - dw_mmc-hi3798: fix bot error (Rob Herring)
> - Link to v2: https://lore.kernel.org/r/20240216-b4-mmc-hi3798mv200-v2-0-010d63e6a1d5@outlook.com
>
> Changes in v2:
> - dw_mmc-hi3798mv200: use dev_err_probe() helper - Suggested by Krzysztof Kozlowski.
> - dw_mmc-hi3798mv200: add missing err=0;
> - dw_mmc-hi3798c(m)v200: remove unused MODULE_ALIAS() - Suggested by Krzysztof Kozlowski.
> - binding: rename the binding, a lot of tweaks suggested by Krzysztof Kozlowski.
> - Link to v1: https://lore.kernel.org/r/20240216-b4-mmc-hi3798mv200-v1-0-7d46db845ae6@outlook.com
>
> ---
> Yang Xiwen (5):
>       mmc: host: mmc_of_parse_clk_phase(): Pass struct device * instead of mmc_host *
>       mmc: dw_mmc-hi3798cv200: remove MODULE_ALIAS()
>       dt-bindings: mmc: dw-mshc-hi3798cv200: convert to YAML
>       dt-bindings: mmc: hisilicon,hi3798cv200-dw-mshc: add Hi3798MV200 binding
>       mmc: dw_mmc: add support for hi3798mv200
>
>  .../bindings/mmc/hi3798cv200-dw-mshc.txt           |  40 ----
>  .../mmc/hisilicon,hi3798cv200-dw-mshc.yaml         |  97 ++++++++
>  drivers/mmc/core/host.c                            |   4 +-
>  drivers/mmc/host/Kconfig                           |   9 +
>  drivers/mmc/host/Makefile                          |   1 +
>  drivers/mmc/host/dw_mmc-hi3798cv200.c              |   1 -
>  drivers/mmc/host/dw_mmc-hi3798mv200.c              | 251 +++++++++++++++++++++
>  drivers/mmc/host/sdhci-of-aspeed.c                 |   2 +-
>  include/linux/mmc/host.h                           |   2 +-
>  9 files changed, 361 insertions(+), 46 deletions(-)
> ---
> base-commit: d206a76d7d2726f3b096037f2079ce0bd3ba329b
> change-id: 20240121-b4-mmc-hi3798mv200-a5730edf122c
>
> Best regards,
> --
> Yang Xiwen <forbidden405@outlook.com>
>
