Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8DE52CB87
	for <lists+openbmc@lfdr.de>; Thu, 19 May 2022 07:39:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3dvy48pHz30Hf
	for <lists+openbmc@lfdr.de>; Thu, 19 May 2022 15:39:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pQyCywem;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62f;
 helo=mail-ej1-x62f.google.com; envelope-from=milkfafa@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pQyCywem; dkim-atps=neutral
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3dvZ5cHtz2yxx
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2022 15:39:05 +1000 (AEST)
Received: by mail-ej1-x62f.google.com with SMTP id i27so7735387ejd.9
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2022 22:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P9rIEKsSILY2Q59oY5ioABEPgKHA8CZ903o6eHfSe5c=;
 b=pQyCywemE0ZVZ/u0pYa2M2UxCCJs0mAjSDgBv20LeVfgYJR9cyDwaq0fpQDC5nXV0B
 LLtRB6IwrBAC8CTWIPvKRU5uIc4zfbmNOLCWb07Esc49VNTH1wwnQ1MJJr03H0Ek/l08
 lG7ATX3AQnqODimEkBldoQx+doTm3lpFCr0MSrVY5U3DmmlGTFxEZcUmJpFzpqZ1DUD4
 YasMpwUQYcZK6IdgVRmkpLMh8KowIeVKxeRGk3OOUdPbBsuPew34aPj0FoKu9b4Iqq37
 mvETCditHYNU9LGIfmoec00LUbh8Oab5Md2OogTXr5eQ11DtFWMVZFHYxnVrlshBsMdk
 0WjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P9rIEKsSILY2Q59oY5ioABEPgKHA8CZ903o6eHfSe5c=;
 b=jL0HYTs0jpXAU4dYrKF/oo9DDPqCRAbjgQgTpQjj4aBr/wfJRD5Df8W3faijybO6nr
 StMWBn5rcqhuMgUzmPczerx4fso4Z/6rquGR+ULCOL8zOHwJOYxhsWendt3VtIy7p6Tj
 MVJ5mwfON8Z8ClUq+ySXc7k4/UxNM01YpPEjIquJKjaK7cghP1/YHh95in7E6HMUV7ug
 dR8vBtYjuELsCsgey7mTYmGiuigPw7HF9s7eB2jp95hfD6izRjbb3U1508oIUmluELd4
 /sGDJSl+PKZt2fxl7AjYSlgJT76neKsVjhfYtxaGv9x4g1BwX2veRiVdOmqNcGvvic6r
 AfYQ==
X-Gm-Message-State: AOAM533ubrLSo4VKt+AgTu66oI49TxYlp5hgzESWuPV+gHlWddqWdPvn
 +nk9Y/2Ruswmr5HDxOvkC/3NsQq0OF7fdU9Kg8M=
X-Google-Smtp-Source: ABdhPJzQCjfijG3DwS8WZQOnjr+xn/kqkfB6v5casriPimAqTQoX7x/u4Oe9NXyu/RWHKRxbCQ040+B4SlB02C+KBUg=
X-Received: by 2002:a17:906:6a1b:b0:6f4:a9b8:e027 with SMTP id
 qw27-20020a1709066a1b00b006f4a9b8e027mr2689709ejc.222.1652938739964; Wed, 18
 May 2022 22:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220513033450.7038-1-kflin@nuvoton.com>
 <20220513033450.7038-6-kflin@nuvoton.com>
 <YoOje2L13q7d7KeI@latitude>
In-Reply-To: <YoOje2L13q7d7KeI@latitude>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Thu, 19 May 2022 13:39:01 +0800
Message-ID: <CADnNmFoa6=BWs74oQxEtP4TO-mL_vc0py4+4V1wjdtetW4Vy5w@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] drivers: media: platform: Add NPCM Video
 Capture/Encode Engine driver
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
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
Cc: CS20 KWLiu <kwliu@nuvoton.com>, tmaimon77@gmail.com, avifishman70@gmail.com,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com,
 mchehab@kernel.org, Marvin Lin <kflin@nuvoton.com>,
 linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jonathan,

Thanks for your comment.

> Similar to what I said in reply to the bindings patch, I would prefer to
> have the VCD code and the ECE code in two separate files, if possible,
> to make reuse of the VCD code alone (on WPCM450) easier.

This video driver is bassed on V4L2 framework to implement the
required interfaces,
and the V4L2 application in user-space (e.g., openbmc/obmc-ikvm) will
interact with
these interfaces to get compressed video data for supporting KVM
features. In this
architecture, for the case of WPCM450 (though it's in EOL for several
years), I'd prefer
to try to let ECE be an optional node instead of separating ECE code
from this V4L2
video driver. However, this patch series could be the base version and
keep reviewing,
and afterwards we could make another patch for optional ECE, is it OK for you?

Regards,
Marvin
