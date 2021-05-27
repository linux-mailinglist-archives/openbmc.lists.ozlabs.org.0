Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A870039284A
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 09:14:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrJw65KXrz3000
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 17:14:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=T5Fg8wAK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::331;
 helo=mail-ot1-x331.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=T5Fg8wAK; dkim-atps=neutral
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrJvq3G60z2xb1
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 17:13:58 +1000 (AEST)
Received: by mail-ot1-x331.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so3535847otg.2
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 00:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=GyFDB4p9XIkK0s7mbOkQoTMG7oKBTgp1b5iGgvd4Zpw=;
 b=T5Fg8wAK7IzkloVJJnB6PcmFaXa6KxtNwICoNYqxVyQVzAZVwqdl9ESlMQ5SELusFa
 4Ch3M3uKWM4XxS1uIiBr7PwkkaBOHyIBhg55yFn1dDjdBQ9jBxHWdIiR9veu76HPVvhN
 kbIl7Tm+tnejaz98+dWsDabK1Ip+lrqP0aPI3AuyDookPhrWsntPRvUeKDDnKsjxf6PB
 z06UgNiGC5Z6/PPPxVcxURPKuXH39Y38uoKPK9XXDAmNEtqAbhw5dgp3AIMCpF71mhdN
 +ateeMHxy2jkwzKZN7PIApavJ9xCXQo8qIxc9ys1/zD31Lb76ReNUcHjVWo5RbFfVZKA
 Mp4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=GyFDB4p9XIkK0s7mbOkQoTMG7oKBTgp1b5iGgvd4Zpw=;
 b=oCQgQRqE0i6bldrfcJrfYbsUq6Tf0S/7tAWLSaKBZA4b65CAMJ8PQEak63ANgiiRCI
 dH64ADbM6zwE4+acenDR0yWC9BZ9lEZWb/JNsQTbQxaF8vd3NkFZjmVyZnJWxFUKYiBR
 YigAu69T5XOycAajtHg/oK3QKem6OtmeZ1C4XYu2x+4lPCzlCiemiHtklazlnVzDMB8l
 rsWQqM72f/Sn2a3MncXE31uxWLf0LH9630lTnbIX0ucMDgSaIg72zJmYTcydh+0f/Ry3
 qo0LO+iuGdMwVxU3Kc2VbDK3ocnNFSbbLD849bIYimd6B50hrgi+vvz1lDuFvkeZLYo1
 LgEg==
X-Gm-Message-State: AOAM531BPI/XIJWmlub93RybknY31zWClzpW1zC+YEqmeQlcC1uYr9za
 h6OGxBy0BiIR4Z//vdArhdKM0I2A4XBqc1XQ85ETPnWlqqWRFjie
X-Google-Smtp-Source: ABdhPJzpDT4FDlMEDGXHBYqe+EwvydpiLbzFgzTur1sPJUwuSDkDR7vp1N/SivChRSs3ASAQRWxsKfvXMwIOqqyrAH8=
X-Received: by 2002:a05:6830:200b:: with SMTP id
 e11mr1736281otp.349.1622099634843; 
 Thu, 27 May 2021 00:13:54 -0700 (PDT)
MIME-Version: 1.0
From: Lei Yu <yulei.sh@bytedance.com>
Date: Thu, 27 May 2021 15:13:44 +0800
Message-ID: <CAGm54UGMSVkT=3WLVLrJwcW8OGcQJZOGYnhVvOrF1qVC7xtdvA@mail.gmail.com>
Subject: Unify the 64MiB flash layout
To: openbmc <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This email is to share some information about the OpenBMC 64MiB flash layout.

In current Linux kernel, there is openbmc-flash-layout-64.dtsi that is
being used on meta-bytedance/meta-g220a system, there is on-going
change[1] for aspeed-bmc-ampere-mtjade.dts to use the layout as well.

However, according to ast2600's change[2], the layout does not fit
ast2600's u-boot, so it updates the layout by changing the existing
one.

On g220a system, we have tested the new layout and verifies that it
works fine, with below changes
1. Pick the ast2600's change[2] in kernel;
2. Pick the `image_types_phosphor.bbclass` change[3];
3. Update the u-boot env to boot from the new location, or use the new
u-boot-aspeed-sdk_2019.04.bb[4]
   On g220a, we use the new u-boot.

With the above changes, g220a system works fine with the new u-boot
and the updated flash layout.

To make it consistent for both ast2500 and ast2600, it's better to use
the same flash layout (and u-boot).
So I would suggest merge the changes of [1] and [3], for now g220a and
meta-ampere/meta-jade could be impacted.

[1]: https://lore.kernel.org/openbmc/20210517040036.13667-4-quan@os.amperecomputing.com/
[2]: https://lore.kernel.org/linux-arm-kernel/20210316085932.2601-1-troy_lee@aspeedtech.com/
[3]: https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/39343
[4]: https://github.com/openbmc/openbmc/blob/master/meta-aspeed/recipes-bsp/u-boot/u-boot-aspeed-sdk_2019.04.bb

-- 
BRs,
Lei YU
