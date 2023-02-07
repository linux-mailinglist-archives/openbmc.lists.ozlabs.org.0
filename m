Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C8168D996
	for <lists+openbmc@lfdr.de>; Tue,  7 Feb 2023 14:42:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PB47J49zzz3cNR
	for <lists+openbmc@lfdr.de>; Wed,  8 Feb 2023 00:42:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LwkDzri3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LwkDzri3;
	dkim-atps=neutral
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PB46h5J84z30CT
	for <openbmc@lists.ozlabs.org>; Wed,  8 Feb 2023 00:41:48 +1100 (AEDT)
Received: by mail-lj1-x231.google.com with SMTP id h4so15605874lja.2
        for <openbmc@lists.ozlabs.org>; Tue, 07 Feb 2023 05:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c7+RWQXS2i6MLsgUfhI963MCZBFCpmZmLbiUeZ0o3TY=;
        b=LwkDzri3JWQyEeaDwBs9FxVzDga/gfctGSAYRfrWD7a6UpDfky7XhCtUoYZ3/ROdza
         3B3qniC9qxvs/ZtNZ4NLb4UEdfE7PgUktCfd1Ned7ZfPAWQ2kihJxR57iJN7c6xipgqk
         BD+XMv7xZwbna+4Ekuh+Kc6sjB7sU0vgL7azKbKQ7aLdqnDYsEDaEwMAcvpZ1sR5+xMm
         Y5TsXS73h9mLhYYMLhaxtNEzxDELc25mturS6jXRFA9mD9v6xwNruvfyvzr9qTo6L5eS
         9EwVrQXqueuccMPmWVmX7hYJeZx8vNdY7B3ZFjMFS3JRodqHL3ejgxYF3cHIoYf0GDIE
         eSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7+RWQXS2i6MLsgUfhI963MCZBFCpmZmLbiUeZ0o3TY=;
        b=tTNmixt2QTqrIIUH5NrxCwoEO8DtggjvpAHfvqosHA+NMitKLPfHgOeQw0maGbUwQk
         c0EiliSRc6/uxlUO6f6ASOPGIUUV7vgG+oGmOac7SpUV19gUL/9f40X4tmMK6aCWIOns
         EVST41zlblGwh4+MOtp+ZxRVX5tUvo60tJArLrdXj/JQTaptUyWkqoNRC1nHUdbTmuCi
         QDKV30XzBD0hoYzn5NKGLjmQBDsTKvNPox6eZYJiO3MUn4t2wljpccv5L1HK0zWqqFlN
         VJX+N2QvaSA7N/A2D9yGNQiciaeoJdjb9X5M1KPb3zFdI3p834LsS/LXdM/VRkubRCCs
         MyZQ==
X-Gm-Message-State: AO0yUKX2mUuy/ryZC8Cza7nszocWtukzmWFG7AFUC2nEniildGJg6c6v
	fylg+JEgyHyhdYp33IC1YQiTsUXUVKRhyriT3rd7bpHaTZQ=
X-Google-Smtp-Source: AK7set84jqqnRfOnJtFCSUspshzHrChfg2CtSoD52sjpEnbLT4gHM1as1pfg/d+dF6Kp7K2gONypgMahWyMFPmrj11k=
X-Received: by 2002:a2e:2c08:0:b0:28b:642d:4401 with SMTP id
 s8-20020a2e2c08000000b0028b642d4401mr484107ljs.174.1675777303898; Tue, 07 Feb
 2023 05:41:43 -0800 (PST)
MIME-Version: 1.0
References: <20221221175520.263549-1-tmaimon77@gmail.com>
In-Reply-To: <20221221175520.263549-1-tmaimon77@gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 7 Feb 2023 15:41:32 +0200
Message-ID: <CAP6Zq1hCeWVgcG5_PJOMUzxYKZ9TCCA=MG5WZ31gwa3vEr5tnw@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.0 v1 0/2] MMC: add NPCM SDHCI driver support
To: openbmc@lists.ozlabs.org
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
Cc: Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

Kind reminder regards NPCM eMMC driver.

Thanks,

Tomer

On Wed, 21 Dec 2022 at 19:55, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> This patch set adds SDHCI support for the Nuvoton NPCM Baseboard
> Management Controller (BMC).
>
> The NPCM SDHCI driver tested on NPCM750 and NPCM845 EVB.
>
> Tomer Maimon (2):
>   dt-bindings: mmc: npcm,sdhci: Document NPCM SDHCI controller
>   mmc: sdhci-npcm: Add NPCM SDHCI driver
>
>  .../devicetree/bindings/mmc/npcm,sdhci.yaml   | 45 ++++++++++
>  drivers/mmc/host/Kconfig                      |  8 ++
>  drivers/mmc/host/Makefile                     |  1 +
>  drivers/mmc/host/sdhci-npcm.c                 | 84 +++++++++++++++++++
>  4 files changed, 138 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mmc/npcm,sdhci.yaml
>  create mode 100644 drivers/mmc/host/sdhci-npcm.c
>
> --
> 2.33.0
>
