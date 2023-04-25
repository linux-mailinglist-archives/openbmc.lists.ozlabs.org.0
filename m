Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F536EDC90
	for <lists+openbmc@lfdr.de>; Tue, 25 Apr 2023 09:28:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5DBT3zBDz3cdK
	for <lists+openbmc@lfdr.de>; Tue, 25 Apr 2023 17:28:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.172; helo=mail-yw1-f172.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5DB30dmQz309V;
	Tue, 25 Apr 2023 17:28:10 +1000 (AEST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-54f8f459b34so63728977b3.0;
        Tue, 25 Apr 2023 00:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682407687; x=1684999687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGl5U27dIAVcoPRAhAw7M++MtUvlNkzHHP3i/+uz8BM=;
        b=L6+A0aGFUkmdMucOBT2zxFb2rZhh/0SlHwNsLgKFVEOT5cWIXPVqsxpee88ZWFLS8f
         isTTNNQwzSRaWrYGbxvgDpMstlwr1yG8VI19pJtihwk/8rPLNQ3CJX16qP7u0s6Wj6/h
         ipR1J58lDF18lcqTN8gy33oMWLEPZ1t6cM4Y7fK/zZ4qdiJa1g8x/RCKNhVKyGTtnu5W
         YQ3sowJ1g8zdQR9A7bL/vEKwUm9efD4eYa3iF6S3D9qUGTzzRnh/FxzVq3HtSaejCZje
         ZcdBQ4gOnU90IYPfaWOKVWF37QR0KVY5y21rdfRq1ob7RN6WVkm9S7Ra/PHBFm2C2NmZ
         d+vg==
X-Gm-Message-State: AAQBX9fYNoMsU8oGDq3i6UGH21HHxzb6uKwRyZUzk2T6KW2Hvlqb5W3l
	GmdVFESWvDdkSqWVgF44iddlNzgdl5x+KA==
X-Google-Smtp-Source: AKy350ZoED1RdwzLJSX9MWqoWUbriCRigu2fQtDLcg+TzMtN3nsTMRpDP6ixp+MnP30O76fx5J6XUg==
X-Received: by 2002:a0d:e28e:0:b0:541:8920:ce1c with SMTP id l136-20020a0de28e000000b005418920ce1cmr9776540ywe.5.1682407686603;
        Tue, 25 Apr 2023 00:28:06 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id a11-20020a0dd80b000000b0054fb975df99sm3418501ywe.18.2023.04.25.00.28.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 00:28:05 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-54f8f459b34so63728447b3.0;
        Tue, 25 Apr 2023 00:28:04 -0700 (PDT)
X-Received: by 2002:a81:4e4a:0:b0:54c:9c2:d1be with SMTP id
 c71-20020a814e4a000000b0054c09c2d1bemr10102189ywb.13.1682407684508; Tue, 25
 Apr 2023 00:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain> <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Apr 2023 09:27:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
Message-ID: <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
To: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org, linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ansuel Smith <ansuelsmth@gmail.com>, linux-renesas-soc@vger.kernel.org, kernel@dh-electronics.com, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-oxnas@groups.io
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob,

On Tue, Apr 25, 2023 at 12:16=E2=80=AFAM Rob Herring <robh+dt@kernel.org> w=
rote:
> I have a script[1] that does the conversion written the last time this
> came up. Just have to agree on directory names. I think the easiest
> would be for Arnd/Olof to run it at the end of a merge window before
> rc1.

"emev2" and "sh7" are missing for renesas.

Does your script also cater for .dts files not matching any pattern,
but including a .dtsi file that does match a pattern?

> I'm very much in favor of this happening especially before *any*
> overlays are added to add to the mess (it's probably already
> happened).

;-)

> [1] https://lore.kernel.org/all/20181204183649.GA5716@bogus/

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
