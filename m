Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A8A44A5EF
	for <lists+openbmc@lfdr.de>; Tue,  9 Nov 2021 05:52:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpFwM6YqMz2yZC
	for <lists+openbmc@lfdr.de>; Tue,  9 Nov 2021 15:52:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YQj7Lj4x;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::231;
 helo=mail-oi1-x231.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YQj7Lj4x; dkim-atps=neutral
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpFvy3zS4z2yZC
 for <openbmc@lists.ozlabs.org>; Tue,  9 Nov 2021 15:52:28 +1100 (AEDT)
Received: by mail-oi1-x231.google.com with SMTP id u2so31555033oiu.12
 for <openbmc@lists.ozlabs.org>; Mon, 08 Nov 2021 20:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fIi/8rMsntaI+OsdfCjYQbsx+2Ak2wriMzRfxygR1FA=;
 b=YQj7Lj4xuXVPjaiPI91CCtrxG/QPQj2KuOiKL+6EOLjbFP+68Vxjn6VP2zgEb2WPng
 gttNnAewxd5Q/UnXavsCgAkGKGIEbb33rE4NhkJJwqkxwFRhuPZCRsRcTBkyg1ci6l+p
 44XDT98JjjfF2Fxepkrnx37rkhjKXElHvjzb/Gqhkszf6RfXX4y/0ob89EC2VrnNdSc/
 1nm23L7eBmUcFVVMMs/v7wWh4CWub/fbwqoWPo2N+7amnOteVZmuDAnDE9qWXU/pgWKI
 vyF86ekPDv40KLWl074BU5pae8QhuZ+dmVAIJewsWnmy1sT0cZ0QQfCqG1tw9GMURM91
 aDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fIi/8rMsntaI+OsdfCjYQbsx+2Ak2wriMzRfxygR1FA=;
 b=IFw/ta3StjrHh8EpWNdyqDKobEI0Jbndkmjdha+OjPbp8jRRh6rMK5iK2DKYnPEKD+
 569AYUpKgS8ux4f9IA1afAFXzW2A9AIldhcRxPdfpe4BlXetrsM77Px0RhPpdqD3yUWn
 kpOj/D0gmqGPo4T9f0j/jvuYbLPIuhtucZosQUP+Bmws1DxwTmvgNIXUEbFDAjKwLKEK
 5j5cbNqZnR358ZKq/HWIOtAv9pqt8ESAbQtYCBJIhdAC47afBka3jjGcBCMYx+K/Jq4b
 T1yxqYcV9Ph15Lvzw6fOexxaPHiJybxhwxOKjzWXNiwfVSUmkxGOEik/YLaoVTnhbG7L
 rJAA==
X-Gm-Message-State: AOAM533g6vBH5gHomzSVhnYBOOLCLfk5dcO17BVPot0ZrSBFzK9/rBxl
 l26519A0hB8UfGfUclIuXogT9/kQ2r+oVVKObnTuQw==
X-Google-Smtp-Source: ABdhPJw/PXJeyQlLBQdKl4Na77Zir0MpynV5/VfDEG0JbF81ciPHPaSAILPbfcUgMwRqhqiiszKinPesveK3xnr+A3A=
X-Received: by 2002:aca:120f:: with SMTP id 15mr3151848ois.132.1636433544821; 
 Mon, 08 Nov 2021 20:52:24 -0800 (PST)
MIME-Version: 1.0
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
 <20211028141938.3530-14-lukas.bulwahn@gmail.com>
In-Reply-To: <20211028141938.3530-14-lukas.bulwahn@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 9 Nov 2021 05:52:13 +0100
Message-ID: <CACRpkdYm2Da3W63T4KTnFzESNBrgvZGZsVZYqFN_16NGfpWm2w@mail.gmail.com>
Subject: Re: [PATCH 13/13] arm: pgtable: refer to intended CONFIG_ARM_LPAE in
 comment
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, kernel-janitors@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Sekhar Nori <nsekhar@ti.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Krzysztof Halasa <khalasa@piap.pl>, linux-arm-kernel@lists.infradead.org,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Imre Kaloz <kaloz@openwrt.org>, Shawn Guo <shawnguo@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 28, 2021 at 4:20 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit 5615f69bc209 ("ARM: 9016/2: Initialize the mapping of KASan shadow
> memory") adds some nested ifdef's in ./arch/arm/mm/pgd.c, and follows the
> good practice to annotate the endif's with a comment to indicate the
> corresponding ifdef condition.
>
> One comment annotation refers to CONFIG_LPAE, whereas the config is
> actually called CONFIG_ARM_LPAE. That imprecision in a comment is probably
> tolerable for all human readers.
>
> However, the script ./scripts/checkkconfigsymbols.py, which checks the
> kernel tree for references to non-existing Kconfig symbols, identifies and
> reports that the reference to CONFIG_LPAE is invalid.
>
> The script ./scripts/checkkconfigsymbols.py has been quite useful to
> identify a number of bugs with Kconfig symbols and deserves to be executed
> and checked regularly.
>
> So, repair the comment to reduce the reports from this script and simplify
> to use this script, as new issues are easier to spot when the list of
> reports is shorter.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please put this patch into Russell's patch tracker!

Yours,
Linus Walleij
