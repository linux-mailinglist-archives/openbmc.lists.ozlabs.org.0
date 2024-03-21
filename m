Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C29AC8858E3
	for <lists+openbmc@lfdr.de>; Thu, 21 Mar 2024 13:15:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=X8I/HFfZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0kv56MNcz3dTm
	for <lists+openbmc@lfdr.de>; Thu, 21 Mar 2024 23:15:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=X8I/HFfZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=konsulko.com (client-ip=2001:4860:4864:20::2a; helo=mail-oa1-x2a.google.com; envelope-from=trini@konsulko.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0ktZ1xBJz3d4L
	for <openbmc@lists.ozlabs.org>; Thu, 21 Mar 2024 23:15:16 +1100 (AEDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-222b6a05bb1so536821fac.3
        for <openbmc@lists.ozlabs.org>; Thu, 21 Mar 2024 05:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1711023308; x=1711628108; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0BQXrZO7zZnOyGj/lVz7+mUVef/svl89WQ7g+oHBl4=;
        b=X8I/HFfZPU2YTl9RA/ADphwoMCmqgx4JGL61Rg02KPHM5o2tR6LT+jREiMU1yb+WLe
         OKygIBdmuD3BGnXgLFRFVHinijoBXY8Dog9gNyvlDMwEdKtpboQ9PHVzOtFrnCyAVKsE
         Ju4HKmotGl5rpJHnFz+LMOAV/a4Nczh4K8NuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711023308; x=1711628108;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0BQXrZO7zZnOyGj/lVz7+mUVef/svl89WQ7g+oHBl4=;
        b=fGT9py2yhUDySEIR1t5ykT7/lA3FkPNBgHRZ9rXSTMIbwQmHa6J1hxnqYPFU17jcqB
         3rQ6dN13F0KZkNs3KGqECaeuieWazrNTko8mXzeejTHAwKpsyY6/qWQQ+22hPPJvS8oE
         RJxkwXIUWl3L8L2MZcn1EZtrBAnjdIMxfaX5RlxtvQxJs8FbNQaXC8tpYgJEBX/f0FTR
         sXitiNw8qmn6ihG2aIM19AvZmLhqiqMmDf5bkyeEMcdf8jNxdept9w6cVezcIqaj7GUf
         2cFzLO3Anf3AI5C5euaY1lmkCGVPUTwMaF28gdhgqZMoIP46hGmNmNb2SVNvSeUdJdOI
         4T0A==
X-Forwarded-Encrypted: i=1; AJvYcCXOwBoQqvt+zXE02LCqwS/27ONQLQe4Gm3iYY4RPTBSDSXFWR5FBO5ikwKwSPEGQNOrkebmPmqQwERWHovceaUseRbXa6Zqe0A=
X-Gm-Message-State: AOJu0YxNFSmOcaUpOBVICzddrYdyQ2xLDuhqS8GBzL3gbmYVLeI7Xg7w
	1TmLyC3flAmzzd6FxmahcyB/mpZJtxZUKsSKMjfSg3+BHrnpo9g5vS7Erc8kcws=
X-Google-Smtp-Source: AGHT+IGhIaTyT35SeQ4pGXEcW1iN19ZFzcuRG/5ajhhvCrP2x/RpdlfCTblN7D62WQmo0Khzh8wwFg==
X-Received: by 2002:a05:6870:a70f:b0:221:9442:4d58 with SMTP id g15-20020a056870a70f00b0022194424d58mr1967716oam.28.1711023308313;
        Thu, 21 Mar 2024 05:15:08 -0700 (PDT)
Received: from [127.0.1.1] (065-184-193-066.res.spectrum.com. [65.184.193.66])
        by smtp.gmail.com with ESMTPSA id kj25-20020a056214529900b00690df461ecbsm8990690qvb.10.2024.03.21.05.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 05:15:08 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: u-boot@lists.denx.de, Kelly Hung <ppighouse@gmail.com>
In-Reply-To: <20240313102725.2067651-1-Kelly_Hung@asus.com>
References: <20240313102725.2067651-1-Kelly_Hung@asus.com>
Subject: Re: [PATCH next v1 0/1] Add new bmc dts for ASUS X4TF server
Message-Id: <171102330708.1913497.6343179780001033974.b4-ty@konsulko.com>
Date: Thu, 21 Mar 2024 08:15:07 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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
Cc: marex@denx.de, neil.armstrong@linaro.org, hai.pham.ud@renesas.com, jonas@kwiboo.se, openbmc@lists.ozlabs.org, clamor95@gmail.com, christianshewitt@gmail.com, kever.yang@rock-chips.com, Allenyy_Hsu@asus.com, Kelly Hung <Kelly_Hung@asus.com>, naoki@radxa.com, cnsztl@gmail.com, patrick.delaunay@foss.st.com, michal.simek@amd.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 13 Mar 2024 18:27:24 +0800, Kelly Hung wrote:

> Add bmc dts to ASUS X4TF server, we also submitted dts to linux place.
> Please refer to here, https://lore.kernel.org/lkml/?q=x4tf.
> 
> Kelly Hung (1):
>   arm: dts: ast2600-x4tf: Add new dts for ASUS X4TF
> 
> arch/arm/dts/Makefile         |   4 +-
>  arch/arm/dts/ast2600-x4tf.dts | 161 ++++++++++++++++++++++++++++++++++
>  2 files changed, 164 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/dts/ast2600-x4tf.dts
> 
> [...]

Applied to u-boot/next, thanks!

-- 
Tom


