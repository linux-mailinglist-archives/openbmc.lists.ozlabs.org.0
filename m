Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A535661E9FF
	for <lists+openbmc@lfdr.de>; Mon,  7 Nov 2022 05:01:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5Hb037xZz3cND
	for <lists+openbmc@lfdr.de>; Mon,  7 Nov 2022 15:01:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eDWyjimt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2a; helo=mail-vk1-xa2a.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eDWyjimt;
	dkim-atps=neutral
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5HZP6GJTz2yQl
	for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2022 15:00:27 +1100 (AEDT)
Received: by mail-vk1-xa2a.google.com with SMTP id m18so5835280vka.10
        for <openbmc@lists.ozlabs.org>; Sun, 06 Nov 2022 20:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OYmRm7oG51RbUpQkbwP4pUo2C/0pgsAKRA0ejIgXRzc=;
        b=eDWyjimtWuPJKWH1qX2FEfWNE6ve/pF1mSsox+rNfpMI3iIvGdDKpTdQ827vKYOrGC
         UGPkYwQY8QB9UdR+4RoDRYK7QivxJtUJULxId0KC6KtqUKhnfYZqiAuTEWQvgZZ8kvip
         D00EVUwxKDcVJDoYXLQwZ4S8Z6NiuLWG1w6TObgtp+20nneX0YPLICxkjPg5zNPhh9ye
         3RXLnIPzZPKEGV/qbDIo7hzNKGZhYYNqwk1VIYxFW+d6XtsW3GeD2SXKdeSwWImaN6sb
         /+8GZ1rF+IzLa8Vm1bPc+EnN2ZuG4yxZn3nTtnlAwZ0Ehtr0R+ZqJVhC63xELqEtFTcb
         20lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYmRm7oG51RbUpQkbwP4pUo2C/0pgsAKRA0ejIgXRzc=;
        b=BgTSAnPFtA9cXhxAvNzsjXh0cbifcm/KCgf62tDFc8uQ/A+DH/V3mcMKmRtvsoCG7B
         6sVae+HwJiZykscoZJKLbcLAVG6UxYTxuezXZMPMplftkTqR5HbBfP1Z/UJ7GIIK+KYs
         AUpuskSfxh/C/16q1eWXr3Gq+gy50ke9vYGk9SjdXlNgd/FLTp5gEUANLDlSC3VmWRQZ
         iMdWOPnVGdqmCcdLnkVV5VeEPvMIXglR8Rd3kzTBZgF533f+4Hj1+7nD7zzezAAfdW7g
         2xrR9tD7RZUpDMePJjnvB/3vt6IxucPNaXz6U4R/nI6NLb8CROxZBNZL4MNCAV0lI4WT
         BKgg==
X-Gm-Message-State: ACrzQf0UM/N338+zOaE5+GKEFyuUpNffzKXQIuhHOcMFjytq8l5oVbkl
	2XtG26g6QmJE0nZ3c+7coJ4wI6uHv/Ap8DkwOys=
X-Google-Smtp-Source: AMsMyM7IiGVA9SCS1uAK1ObapKXvMnZtoaCcBznY2DwQxVgjrVhnQv72JWmX9y71CgTz0bgMuYyXKS+LMF7BFdM9Vlo=
X-Received: by 2002:a1f:2356:0:b0:3ab:820:316f with SMTP id
 j83-20020a1f2356000000b003ab0820316fmr7671445vkj.15.1667793622488; Sun, 06
 Nov 2022 20:00:22 -0800 (PST)
MIME-Version: 1.0
References: <20221104033810.1324686-1-milkfafa@gmail.com> <1d770c8e-1ac5-34b5-7c09-f55b8325c9cb@xs4all.nl>
In-Reply-To: <1d770c8e-1ac5-34b5-7c09-f55b8325c9cb@xs4all.nl>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Mon, 7 Nov 2022 12:00:11 +0800
Message-ID: <CADnNmFqnmEfqzO0QvOXw6FcaMURMKu2JmYz6TBYxH9Dz5s78Lw@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] Support Nuvoton NPCM Video Capture/Encode Engine
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

> FYI: you need to CC this series to devicetree@vger.kernel.org so they can review
> the bindings.

Thanks for the reminder. I'll CC devicetree group in next version.

Regards,
Marvin
