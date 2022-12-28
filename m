Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9166574FB
	for <lists+openbmc@lfdr.de>; Wed, 28 Dec 2022 10:53:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nhmzd1Chyz3c66
	for <lists+openbmc@lfdr.de>; Wed, 28 Dec 2022 20:53:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=J6ajhNL7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::92b; helo=mail-ua1-x92b.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=J6ajhNL7;
	dkim-atps=neutral
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nhmz34VJyz3bVs
	for <openbmc@lists.ozlabs.org>; Wed, 28 Dec 2022 20:52:30 +1100 (AEDT)
Received: by mail-ua1-x92b.google.com with SMTP id c26so3443641uak.5
        for <openbmc@lists.ozlabs.org>; Wed, 28 Dec 2022 01:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMogUSlAiHPyH0AEAACLcteryhWYp3/F5J+NreDkLAU=;
        b=J6ajhNL7VsYQBb8HGZQx9rMSfGcYfcXxo5nNMIEyP3mH1FDUA/Fgmdu3R2neFGYpJD
         vLfWcEQD3TYRnUiVvXXD8DwcEsmt00sn6i48+NH3SgxzkMxq4iNUgzrJx5xTjzKCA+cI
         50gbjORdkq0P133OGt8b63T95d0PEF0nUNZaaHc3SQ3FquykcEv2YMatJmn+9f4yAPRS
         TOv+ubwGesuKZVPyWGdUpLL5o7kvncC8Q+u7HZomAs5GWnlikwGxpBDHsp2IRE7aa8qs
         rcnA3kbNkCi5YcpzcOMGBjRj3WSPgW/1CXYVMwiPQrMwVcWj+cdR9SQnEH2ri3TWjP1P
         6D3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZMogUSlAiHPyH0AEAACLcteryhWYp3/F5J+NreDkLAU=;
        b=pUfarNkeaTgn9XtLEuZVL85wCxxiG7/hdLQIWcYe/t44PV4wARszIyrCLd4PL2Yz6h
         9SVBN9Q/t6oG1VIigwCv+9HyfqjiMOk7S+mSfQEXMrRF2gCnRkaAEPD82VEQaNNwvEuA
         hSlK23mU23jpzSKhHdWc3C6qaALSudPJrowsZkHguJMRfpX30Mnj2D3/+5ld7WNUl0ka
         a7Ti96XJG9Pjd2Pdd68uYPPuqjrGTb4DBABC0NLHX32BqAfLlbNqzkp/iQKnWG5u6WS5
         hCwM8+1IepyZ02Q0zNXQq0hH7RD6YdNu2q+zD+MDRrKA9VHEOvzpWD26Rxqm2IrAVBXN
         YxJg==
X-Gm-Message-State: AFqh2kquI3UU7s1VYjn0BuEfW510kQUFzj295lxFfisCH05w1yEpPB4K
	+7/WIFCi5XMDiTY3TMFZlwQ2r9RpGhWsNzhswks=
X-Google-Smtp-Source: AMrXdXuw1nAiJmoWckgoP6fZNi9PwxDfSZLGl3H3I1DhOHYVkJ6HlpQtnKZbsmmHlkL76yYY8J6p6pGbeV5euq5ou1k=
X-Received: by 2002:ab0:1e86:0:b0:42f:555b:e4e0 with SMTP id
 o6-20020ab01e86000000b0042f555be4e0mr2176738uak.19.1672221147298; Wed, 28 Dec
 2022 01:52:27 -0800 (PST)
MIME-Version: 1.0
References: <20221227095123.2447948-1-milkfafa@gmail.com> <20221227095123.2447948-4-milkfafa@gmail.com>
 <1cc66b84-fcf3-2801-57ad-94430fa38055@linaro.org>
In-Reply-To: <1cc66b84-fcf3-2801-57ad-94430fa38055@linaro.org>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Wed, 28 Dec 2022 17:52:16 +0800
Message-ID: <CADnNmFqQWi4a2YeizmYZjtTXKiipGbZ-cgwqeaqn4dNOTDu9OA@mail.gmail.com>
Subject: Re: [PATCH v10 3/7] dt-bindings: arm: nuvoton: Add bindings for NPCM GFXI
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com, kwliu@nuvoton.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-media@vger.kernel.org, tali.perry1@gmail.com, andrzej.p@collabora.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, hverkuil-cisco@xs4all.nl, mchehab@kernel.org, kflin@nuvoton.com, linux-kernel@vger.kernel.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

Thanks for the remind.

> The comment about subject from v8 applies here as well. Once you receive
> a comment apply it everywhere, fix all the issues, not only one.

I'll drop redundant "bindings for" in commit subject. Sorry for my negligence.

Regards,
Marvin
