Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6544B1ADA
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 02:00:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvwKF3BSWz3c9v
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 12:00:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oPc/VtDb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b35;
 helo=mail-yb1-xb35.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=oPc/VtDb; dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvwJt4ZmZz3bSv
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 12:00:29 +1100 (AEDT)
Received: by mail-yb1-xb35.google.com with SMTP id v186so20561492ybg.1
 for <openbmc@lists.ozlabs.org>; Thu, 10 Feb 2022 17:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WIDkP+UZjRsiSQWkVvyjS0bhDfj4yHGdnjb56uFKkqc=;
 b=oPc/VtDbvJ5xdR+F5EjLqss73GzSSMZ83MK/qQ94DQ2ewUdsC9GJj7idJxQJAMQEP1
 Y9ehthayIHFX8IgQGbsxrOvnf6vfWaXBkCE7InAxIy1Y5bUDLe6WKkGjevb0/aj5joLI
 tQOr5giDHTQOEyl4sOrAWWCrPGBPktgX6/65bEUUtn80HJiXktW3MeDGv4rNvQaa2953
 c4FZdoUj+IaQOUq+ET3LUjpJgQ1u8qRN2K/knfW/W2MSEUPhfqWTYSd9xFrNdD3GMRRm
 5Da5tCcCvTxirpusRKEjN6utN50DbddWPWVYtHHgLEicSloM67vZtlqIZM24l2zGRtvV
 vMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WIDkP+UZjRsiSQWkVvyjS0bhDfj4yHGdnjb56uFKkqc=;
 b=3A/yWeGCtIr0OROILfemFS9q2Cj7P51y5WdEPved5hQBsghAMy9Kcy14shxqswVQoa
 hz7mHD/i7n2P0OwvdIIuwhrM27bhnWQ/G8UMyScyAWbJxR5yn9oZLVCpwvZlxNEEhtzf
 07UA0YFJjkAK4/gl3I/+DlL4jbIZU2mmnh8qjZXPbd4yOPpLEX+CKuUyMtsWBR8lzFkS
 lzGTgRjVsaBFyCUIfisJ9TpEerQcYtTZdRx5RvypY6yjsEB+L7YHQPdx8/2OOYVrFt01
 Y4SCEDTfd0CMd59YRfRqAfbuP4iZzwm0dCwmfEn/CrBWk82U9dgo5OaVZi/NBLE2slwQ
 NMvA==
X-Gm-Message-State: AOAM5327v1IEcLhKEEN9+hOnJZ9yGC4Em7Lts9d/ujYpWRS9C31mk4rd
 zgFNjbHTCA9sqdDFrouUGNUyLS2aRA778AnXvv6jvw==
X-Google-Smtp-Source: ABdhPJygE7mUe4mxNoMa5wIo3MDF9IoyoY8qTZnJ3OJ5MpKCksp/AMCTD9rcOVERCgZDpgx0maGUdtrhblBp5EdMEQg=
X-Received: by 2002:a05:6902:247:: with SMTP id
 k7mr9466845ybs.322.1644541225166; 
 Thu, 10 Feb 2022 17:00:25 -0800 (PST)
MIME-Version: 1.0
References: <20220202125438.19345-1-j.neuschaefer@gmx.net>
 <20220202125438.19345-2-j.neuschaefer@gmx.net>
In-Reply-To: <20220202125438.19345-2-j.neuschaefer@gmx.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Feb 2022 02:00:14 +0100
Message-ID: <CACRpkdYZBF2Gy-7cUBDv11WomjZFXLoUmcUcWKtUq8Dz58i9jw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: nuvoton: npcm7xx: Use %zd printk format for
 ARRAY_SIZE()
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
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
Cc: Benjamin Fair <benjaminfair@google.com>, kernel test robot <lkp@intel.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, linux-gpio@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Feb 2, 2022 at 1:54 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> When compile-testing on 64-bit architectures, GCC complains about the
> mismatch of types between the %d format specifier and value returned by
> ARRAY_LENGTH(). Use %zd, which is correct everywhere.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

These two patches applied!

Yours,
Linus Walleij
