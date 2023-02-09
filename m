Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2288B68FC11
	for <lists+openbmc@lfdr.de>; Thu,  9 Feb 2023 01:40:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PByhm09dLz3bTc
	for <lists+openbmc@lfdr.de>; Thu,  9 Feb 2023 11:40:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=j5+3BSSx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::92d; helo=mail-ua1-x92d.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=j5+3BSSx;
	dkim-atps=neutral
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PByh61rGTz3bTc
	for <openbmc@lists.ozlabs.org>; Thu,  9 Feb 2023 11:40:19 +1100 (AEDT)
Received: by mail-ua1-x92d.google.com with SMTP id u3so109656uae.0
        for <openbmc@lists.ozlabs.org>; Wed, 08 Feb 2023 16:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I6yX8VtZkx7dl2y0upkcZEBUIVD0yPRaz/YpeYEK5qc=;
        b=j5+3BSSxWzyMTSFYyKcdbAA2UxfpbXtQxjNUEe+bp7oXS18i3QAgONLadfd0QEGhke
         bYg+Tbd+5cTwWHGRLC59kAssApBoADqijkZhEe2dckxKqHTe5JAYcqnu/ohqgeQg2/Az
         JBN0uIFc+k72nZeghGw5s+1FCFE0Yvm7STeYDTpNBXaWASFBUN/Z+TnZPr9GBWyOIcOu
         KWVMmw9vErTVOG09FIJ+fzbrdnMJp+XV/r7WWSG56cpyw58teLH9sIigeFE01XSgC/sX
         ZXbwhlUBwChzcrdEZtQk8rB6nvh1p7WY+fT3NB5hwsZplbdiow1gbHMry7ukoZ4K7/G6
         CEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6yX8VtZkx7dl2y0upkcZEBUIVD0yPRaz/YpeYEK5qc=;
        b=jlejxQ9wkOm2sgCBaOHDIdTVPc+bJIB14bB0LBQJNXARhd5RW9UczBO3z2JyBxF/v7
         wZQ4OI1ZDjuvdSbfkJuOUUNDNfeC4LDJDiMpAV3gVS+z5/QoLg6THHaPYGyRPXNfIz2i
         uP36OlJum6OotlAl30IUYkLlPrOkdQcS+6CdJv7g7HKAs4vOMGCeeXpap8Wdnpij3lWJ
         XGBMKofZxJDDvXwy12+81dljpaq5lGg6wKbvzrVybGSHvloxHqMFWkY/zs+bvq8e+hxd
         lOZOUcXDWm+yy3CdeJh0gUn3qQhrbS1gHeWJ46wnWVNbEPXdyNdmArQBjHZ27fzAl/px
         EzEw==
X-Gm-Message-State: AO0yUKUtUj9k+/UMMT9U4zadJoqeihDn4qFst7XBtJ6jdmDDqdxJsCm3
	olIWSouGMVhJPY+63CvG6W6DH6wmDnu0zcwGM9s=
X-Google-Smtp-Source: AK7set/RoWCG5oItzj0ni8FCUva014iFjlEjxRCH3uSFsS91QvQd0FLVKEHMk8zyLIiGaCtobYMVj6vx9xmZFFsN9Zc=
X-Received: by 2002:ab0:3345:0:b0:655:1afe:37a8 with SMTP id
 h5-20020ab03345000000b006551afe37a8mr2430233uap.27.1675903214887; Wed, 08 Feb
 2023 16:40:14 -0800 (PST)
MIME-Version: 1.0
References: <20230207091902.2512905-1-milkfafa@gmail.com> <20230207091902.2512905-4-milkfafa@gmail.com>
 <867ec517-ef29-e8ac-8e0c-6f7ca440cf3d@linaro.org>
In-Reply-To: <867ec517-ef29-e8ac-8e0c-6f7ca440cf3d@linaro.org>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Thu, 9 Feb 2023 08:40:03 +0800
Message-ID: <CADnNmFpf8kMeHYrUcab5Mg3P0zZ=kUi3o8bLCz-EdyAHVKoLNw@mail.gmail.com>
Subject: Re: [PATCH v11 3/7] dt-bindings: arm: nuvoton: Add NPCM GFXI
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

Thank you for the review.

> >  .../bindings/arm/npcm/nuvoton,gfxi.yaml       | 39 +++++++++++++++++++
>
> This is still wrong location. arm is only for top-level pieces. You
> wanted to put it in soc.

I'll move it to Documentation/devicetree/bindings/soc/npcm/nuvoton,gfxi.yaml.

Regards,
Marvin
