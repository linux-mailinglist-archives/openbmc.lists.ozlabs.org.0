Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E839A544D15
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 15:06:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJkrc5Nfcz3bpY
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 23:06:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hlVgN2RN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com; envelope-from=warp5tw@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hlVgN2RN;
	dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJkqz3lj3z3brH
	for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2022 23:06:22 +1000 (AEST)
Received: by mail-yb1-xb2d.google.com with SMTP id r1so13084621ybd.4
        for <openbmc@lists.ozlabs.org>; Thu, 09 Jun 2022 06:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Pg1uSbt+5F+q0T+5YfntGf3p8VXaWjfEA9ANle3En2U=;
        b=hlVgN2RNaysjXtI72nuyLVRODGVEdRbSDDhzDhzWbB+I+NsvGhLzFG1friAVKrCtgI
         XRgwc02AKbV7G5ciKkqhmS+iGAsO2qr4VpX7AKZdlTFlhCUcPRE6ub+8IOV7kt2iOj2D
         AD4a4PEq4t1yP74sAKfzZCqFYKYLrozI1+Nf9bRIK6zd+CtCE+7/NpOkTCXk/BJMH6u7
         huOJRxoBjDLg4IUCDFIOI7ehSB8ZiduB0TV/qXmDvPqtcLMZ9K43qexeZIDPKQ369GZb
         e9HIxt+fra9MgCkOXCOUEXQRh28k8giOxw0EMeG0aDA4Dq/GC7jZLjUsPv865zb41wZD
         xy7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=Pg1uSbt+5F+q0T+5YfntGf3p8VXaWjfEA9ANle3En2U=;
        b=buugT7BH7l8BtYWxdHRfSU+PSmKnMnUozlsSRGCEyoOVFEg8G20WLxqBNkPOWyllR4
         ByInejhI9Shzc1vyYtFjcn5sl4lIHajnTb4eDX0C45A1VdI8WJmqwVCBjdpdT4Vdrt5T
         pFauyiKP38xce3lDaxYh03U6JVVHz6EyyunmNt+tLmq80Ay9ZkvZTbBQOfojPnWVC2WH
         QNBUjnlZNkX4asIWm8V+BNcFruYsFhXTSPhSEA0DSxcqohg5p0GEYcZLYSM3SnbHsaJO
         vSvJUYodp/OG9tD+Qo6dTENYslEQxTw7oZUabtg4v3CADHVXS6vuXO3VJDPpXDpP/37J
         a6rA==
X-Gm-Message-State: AOAM531gNSjje55IpCWq7eRj+y52h7OsgvwTT70i+W2k/1UzIpPjc9by
	ABjfYVhpR9TMkFnaPpTtkfSxZKAKR5Ks+4WJkQ==
X-Google-Smtp-Source: ABdhPJw8dPUiN7w74XOgE90ezMUwmVLRGc4h7RO8Lc6z8d/C3yKPl3uNHR9hTeYnbSZJl/XuNhUdEctCmpK6S+ArZCo=
X-Received: by 2002:a25:8809:0:b0:663:e8fc:7974 with SMTP id
 c9-20020a258809000000b00663e8fc7974mr11576057ybl.45.1654779979194; Thu, 09
 Jun 2022 06:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220525032341.3182-1-warp5tw@gmail.com> <20220525032341.3182-5-warp5tw@gmail.com>
 <YqEApWattWwRIS2H@kunai>
In-Reply-To: <YqEApWattWwRIS2H@kunai>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Thu, 9 Jun 2022 21:06:08 +0800
Message-ID: <CACD3sJZ0mXttAyoFZqKzgNpGS+UW7fEvfYrnSAMgNOUFx=XVBw@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] i2c: npcm: Support NPCM845
To: Wolfram Sang <wsa@kernel.org>, Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com, 
	tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, 
	yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, andriy.shevchenko@linux.intel.com, 
	jarkko.nikula@linux.intel.com, semen.protsenko@linaro.org, jsd@semihalf.com, 
	sven@svenpeter.dev, lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de, 
	tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, 
	KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Wolfram:

Thank you for your review and comments.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B46=E6=9C=889=E6=97=A5 =
=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=884:03=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, May 25, 2022 at 11:23:40AM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Add NPCM8XX I2C support.
> > The NPCM8XX uses a similar i2c module as NPCM7XX.
> > The internal HW FIFO is larger in NPCM8XX.
> >
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Acked-by: Tomer Maimon <tmaimon77@gmail.com>
>
> Applied to for-next, thanks!
>

Best Regards,
Tyrone
