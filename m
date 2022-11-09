Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24617622147
	for <lists+openbmc@lfdr.de>; Wed,  9 Nov 2022 02:17:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6Rsh4Qm2z3cLc
	for <lists+openbmc@lfdr.de>; Wed,  9 Nov 2022 12:17:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Vcd0RkQm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e33; helo=mail-vs1-xe33.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Vcd0RkQm;
	dkim-atps=neutral
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6Rs613FBz2xrL
	for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2022 12:17:12 +1100 (AEDT)
Received: by mail-vs1-xe33.google.com with SMTP id 128so15259607vsz.12
        for <openbmc@lists.ozlabs.org>; Tue, 08 Nov 2022 17:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MYcTTuwI7G46p7K3ucaiKME/7Z+rBfUYDVp4gpPf4Ac=;
        b=Vcd0RkQmc/NMRf9OtDQvHNa9UBq0feaRI/Rh376FTe7DgUXmxDDxj9wq5+tIM60IJ+
         cbeLAL10iy6VBXCP00djE6RoFsQRK32Xg0DAmi15mokOfnfhxmyQNJ8EtI5hX5Yx+5eP
         kTJok8wP6bKnfGmKkSDPlz3wWvceycUW2D+/uU1/Tf8QNyvogHV4u4NS1Ma6E71Pvm4b
         PxQfzKasJg1iegehqZy/DJCMlWOYWtkyJA9P0Z4iIKYGpOgTY7Gt/bl7CWkypFH5D950
         ebomLEYl+a6Hu1eUrInZvu+DLlwydorFjbaoMnmx1mb03sW+XlDS1UJ+8Wf3Mequ4T3L
         Urwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYcTTuwI7G46p7K3ucaiKME/7Z+rBfUYDVp4gpPf4Ac=;
        b=0z/vm6rR8+mw8iKXI+9I32l0D8/fgUMPs0hhEIRkSz/Ze1NoY19dbUjRUXRxbnBnpM
         pmpAvJsyl7pVcoQTWLnSDp7pILeN4wIjRljtKCNYJ+lp1fm6v4Eq6IKCByFoqZ22qIkD
         N/gDEeNEa9n5m5kXlZN92B3b9DTCDJkVYR5rlKtGbRBX5MvAIGJNxEyhkzZqbHPV57kQ
         eccssy54lx66uJDXBOSEAhoqRGwTiGEGu5ltAOTsA7RBpYDfUUoRtQO+TrqMOXeZ+1xJ
         W28pfGHX/2n9yL8vomPTeKc1hPvjzXq4p7O9S+r9gEulfnadRK/fc9oPnhvA16FxMcUQ
         fS5A==
X-Gm-Message-State: ANoB5pmnm4Bm4dtkLqNZO8V2roVa7YzA0sU6KN0+zFPwla7v7WLHTCSE
	5BA+NiDwRbx6Dp5hJLuENFtpDDNaOWzJ8QzpUVg=
X-Google-Smtp-Source: AA0mqf7Sc5Q+GlFsu+HUXcVUH8rWVMsE2xMY4ahp9uHHaJ+ye3ydGB3+4WuZsI6pb+6UYqOsaKOcp1ci90zFVx4Tkug=
X-Received: by 2002:a67:b809:0:b0:3ae:9298:114c with SMTP id
 i9-20020a67b809000000b003ae9298114cmr15583vsf.64.1667956627444; Tue, 08 Nov
 2022 17:17:07 -0800 (PST)
MIME-Version: 1.0
References: <20221104033810.1324686-1-milkfafa@gmail.com> <20221104033810.1324686-6-milkfafa@gmail.com>
 <357a3098-918b-895b-7305-0f1a63aacdb0@xs4all.nl> <CADnNmFp4r-3+pvHa+_HOxcXAkORadMzgg6fFKbLcgs66a_90gw@mail.gmail.com>
 <daab81c3-4592-5ef0-5a0e-5f89fe58a3e7@xs4all.nl>
In-Reply-To: <daab81c3-4592-5ef0-5a0e-5f89fe58a3e7@xs4all.nl>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Wed, 9 Nov 2022 09:16:56 +0800
Message-ID: <CADnNmForsJJD=PickWqfsnKdLoMp=0xx70=9foNAJn9hYyy9vw@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] drivers: media: platform: Add NPCM Video
 Capture/Encode Engine driver
To: Hans Verkuil <hverkuil@xs4all.nl>
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
Cc: kwliu@nuvoton.com, tmaimon77@gmail.com, avifishman70@gmail.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, mchehab@kernel.org, kflin@nuvoton.com, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Hans,

>
> This is very much a driver-specific control. So you have to make your
> own.
>
> This series is a good example on how to add a custom control:
>
> https://lore.kernel.org/linux-media/20221028023554.928-1-jammy_huang@aspeedtech.com/
>
> Driver-specific controls are fine, as long as they are properly documented.

Thanks for the advice, I'll add our own custom control.

Regards,
Marvin
