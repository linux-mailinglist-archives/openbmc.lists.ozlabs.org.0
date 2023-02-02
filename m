Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 532B76873E3
	for <lists+openbmc@lfdr.de>; Thu,  2 Feb 2023 04:35:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6kvp0tWbz3cdx
	for <lists+openbmc@lfdr.de>; Thu,  2 Feb 2023 14:35:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LQUc4BmX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2e; helo=mail-vs1-xe2e.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LQUc4BmX;
	dkim-atps=neutral
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6kv92sxfz2yw6
	for <openbmc@lists.ozlabs.org>; Thu,  2 Feb 2023 14:35:15 +1100 (AEDT)
Received: by mail-vs1-xe2e.google.com with SMTP id i185so502608vsc.6
        for <openbmc@lists.ozlabs.org>; Wed, 01 Feb 2023 19:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QiX3UcRTZwH0PLnaIsBgvLzcPBnC8tyuWq+Tqoi57VM=;
        b=LQUc4BmX3WhY4mCYLPKfRRvqUABK3NtdI6frXZWIw2784c3oIQ4Vos7Gfhs7jCn7FK
         ynUp9byn/0vh/mgPEfgfa2s6HUwC/x8103svoUAmaCr6lqe6qs+ynwJfzZgpGprvNqEa
         K/fIl+LWWDS910UYITK51n3aU2u9jfgox/mCClFrVHeiduGiwSkhWUMy+45sDj4wPY+l
         b5/3gDmJDha/kuSwQr68eyFDIoKXruksNowHFRr20PCvEL9wSAvc4tYoIVNHX6fLRDvW
         4xHfgSrKFDpE065ma9Lr8QwzS8MfsoWf64vPignS7vm5f1KXPQQY7q0Nd285c7QcfD65
         5v/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QiX3UcRTZwH0PLnaIsBgvLzcPBnC8tyuWq+Tqoi57VM=;
        b=Gx7bPevCFxNyYt14DmQ6xQdXvbou4jX11MfWTuruOLM0O2r5A5oeOtrFCUsQ1ZGxwL
         9ial4mN53sjgpXHoxEb77DjtEMI8FNkYKS1Aoxn2o///ngYmJwrx0uowUHInDRf2pE2A
         m7fSjkbc0igjRBWWm85N0r+0tT8o8Q7SCZSwKBPwS+XVcXaAHLoQKVeSXIFHe57goctX
         wDJ535Hc+Jh1+SdDM141L6B8QBp9rPTLHaYDaMJEk63SddXm6cb8MxShjrV9Ch7vPYt6
         13j4zoNPvrMY9zrKK4zY2HZZ5eAjxBcJztWXeP9OSTCc65zQ/jvax+p87h4a6vca9Wiv
         vgcw==
X-Gm-Message-State: AO0yUKUySXFB0azYhvMKnncSPUz0KDdw19kee6N4fpzxBne7hNtnoERx
	8bVdxqib/EWrNHDAGuWeCSVLRr35vQGxQTjO/rc=
X-Google-Smtp-Source: AK7set97jRS3svZhsG5T+qiZsHY/NEQaMcAWihNka2rtA4CCpDWrOkoxXYP4/3EZzRL1yy4Mm6pL6xwG6axK7PFRcMA=
X-Received: by 2002:a05:6102:1276:b0:3ee:4ef8:45d3 with SMTP id
 q22-20020a056102127600b003ee4ef845d3mr691400vsg.64.1675308911888; Wed, 01 Feb
 2023 19:35:11 -0800 (PST)
MIME-Version: 1.0
References: <20221227095123.2447948-1-milkfafa@gmail.com> <20221227095123.2447948-8-milkfafa@gmail.com>
 <b8f173c0-6d40-d6aa-543e-fa8b06557f4f@molgen.mpg.de> <CADnNmFr1naRfam=z0p-4hEugSDJy_HCK8XZyQJ0eFirnmwuH4A@mail.gmail.com>
 <4d64e3f9-57a3-c6be-2709-36e9a1617bf9@molgen.mpg.de> <CADnNmFqFMBUj07oAZze3eeXAR0hbep4p9za=XNu5YrLVqUex=w@mail.gmail.com>
In-Reply-To: <CADnNmFqFMBUj07oAZze3eeXAR0hbep4p9za=XNu5YrLVqUex=w@mail.gmail.com>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Thu, 2 Feb 2023 11:35:00 +0800
Message-ID: <CADnNmFqtUMnyCCnKfk3DUJ-VLgJdwC8X6fznVYCF6V5jeZ2bNw@mail.gmail.com>
Subject: Re: [PATCH v10 7/7] media: nuvoton: Add driver for NPCM video capture
 and encode engine
To: Paul Menzel <pmenzel@molgen.mpg.de>
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
Cc: kwliu@nuvoton.com, tmaimon77@gmail.com, devicetree@vger.kernel.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, andrzej.p@collabora.com, robh+dt@kernel.org, linux-media@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, hverkuil-cisco@xs4all.nl, mchehab@kernel.org, kflin@nuvoton.com, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Paul,

> > >>> +MODULE_LICENSE("GPL");
> > >>
> > >> Not GPL v2?

When using GPL v2, I got this warning from checkpatch.pl:

WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db
("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")
#2104: FILE: drivers/media/platform/nuvoton/npcm-video.c:1816:
+MODULE_LICENSE("GPL v2");

It looks better to keep GPL, do you have any suggestions?

Regards,
Marvin
