Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 416722FA3E4
	for <lists+openbmc@lfdr.de>; Mon, 18 Jan 2021 16:01:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DKFNC4vvWzDqjM
	for <lists+openbmc@lfdr.de>; Tue, 19 Jan 2021 02:00:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62f;
 helo=mail-ej1-x62f.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=WimftGn8; dkim-atps=neutral
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DKFLf5411zDqgw
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jan 2021 01:59:34 +1100 (AEDT)
Received: by mail-ej1-x62f.google.com with SMTP id by1so17690911ejc.0
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jan 2021 06:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iSBE4jHyV0yiGAPlv7yUlmbeiPPVBYbZTBnxyeVqKhc=;
 b=WimftGn8DrHzzSkaIaeyHp4Rf5wrkFzQejolh5k7FrvTM1X4tQJfL6BPb0pntGz5jU
 rtis3d7qLkXwTnZ5Tx904Tmlx9JxRGOiLxQfHo9Xwf3G6ebDePuOuAbmEudqlWIgpKH3
 wAaDjsOriul24e2cFyWZJa1xIFzJ5Tu2vWnjXgx8gqcU3GlCpQ3CwbO6ka7jUCCoTj9S
 naNB+8tAa2C/krD+3BFO+Ri5/sPlH+nxGyXWmMo9A1D6Sj8LFoMEmXyp76OSZkPloVe8
 ZVRWa+2RG6siOwJdiU3Qh9JpKK2Mx30aqtBYekBA70fIzUkvnuudh6Vdtw5WNHXS8Nxv
 ETJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iSBE4jHyV0yiGAPlv7yUlmbeiPPVBYbZTBnxyeVqKhc=;
 b=L1FA1lmv+8q4cO6aDCtWmvMduDZpctpaI6K6tR1AQ7m2UF+iZp8Vj9OV0tr8KG44yQ
 bkfw1+7t4HnZNv5Lwn8S+G7UMQvvqGdAHDuvN3AEgRmOS6YtjehohgNt1sZNA9ahhMKY
 IW3pmPpm5MIMU7EADr8w4jbYTRYCisTHWZRh/S4sg+cCWf0CWjtyf3b63bIlpAk0mgKL
 cXteQj5hr8omnSLVaHlTScWcXJGwxYY1juy3XEPCh4i/Ng4R4Y54FbBvSSjcvbLVd9xn
 +oBoQ5ke7noQOnK2YoCK0c9Xt6EvcXONja2MYajID7WgBa86xP749gMQ1L5uUTit1ose
 eMHw==
X-Gm-Message-State: AOAM5329FNhH1EgggPZ1Dgs04BuIPDYADhvL+C+xLVdoPXvC2eH18zqO
 3zQhGEugOt8uPtX2xqmLXb1XwquawUyCJJQDdcxQYQ==
X-Google-Smtp-Source: ABdhPJwI73VNVTnVNFqoeKDEdVqoH328eZPX4L/8TfI3OnSMbLTmqOtJyvigmGCGUUyH0NQs8m/gMD5eGsq/Db7OWWY=
X-Received: by 2002:a17:906:388b:: with SMTP id
 q11mr46695ejd.421.1610981968099; 
 Mon, 18 Jan 2021 06:59:28 -0800 (PST)
MIME-Version: 1.0
References: <20210114131622.8951-1-chiawei_wang@aspeedtech.com>
 <20210114131622.8951-5-chiawei_wang@aspeedtech.com>
In-Reply-To: <20210114131622.8951-5-chiawei_wang@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Jan 2021 15:59:16 +0100
Message-ID: <CACRpkdbqJuKHH+sR3LfWV72kM7TEhimFVi1viuQGkP8DWOODow@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] pinctrl: aspeed-g5: Adapt to new LPC device tree
 layout
To: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, haiyue.wang@linux.intel.com,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Corey Minyard <minyard@acm.org>,
 BMC-SW@aspeedtech.com, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 cyrilbur@gmail.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jan 14, 2021 at 2:17 PM Chia-Wei, Wang
<chiawei_wang@aspeedtech.com> wrote:

> Add check against LPC device v2 compatible string to
> ensure that the fixed device tree layout is adopted.
> The LPC register offsets are also fixed accordingly.
>
> Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I suppose the patches need to go in together. Tell me if you
need me to apply this one patch to the pinctrl tree.

Yours,
Linus Walleij
