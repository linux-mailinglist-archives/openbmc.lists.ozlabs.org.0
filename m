Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EED70A97
	for <lists+openbmc@lfdr.de>; Mon, 22 Jul 2019 22:23:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45stNm5LQ9zDqWv
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 06:23:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lixom.net
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lixom-net.20150623.gappssmtp.com
 header.i=@lixom-net.20150623.gappssmtp.com header.b="A3UBj/Oy"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45stN7355pzDqW2
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 06:23:18 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id m24so76922664ioo.2
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jul 2019 13:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xh7VZmkbjwrBgayZ7b6xtD8WVEMS58rBjXLVPr4+QKE=;
 b=A3UBj/OyBJI/LYvN4Fbj2VbsI0NL07wC8qJGMNrKr9ob9nG3Ra36iFQwW3TU33Blux
 j3uAhD/lAp75l/WK7ILT8TM/o8BVuSH0w98G86pJT77QPCE1syd2o4Kg3zfHdlLIaHAZ
 /TN/V7KnoWIerNT6AaF+4n7LQHjxnsfpwnn8AGC6hiMLvgqwpVfornpWuvQwZ11zTriN
 CVR5fBmmoVyydoVA0SSSmzR2iANHprSMQnwwX4S+7wgUyT/FDAZRLLSWoIPMufTCmpza
 12n6HyAQUN27O8cHaWfYxK0KZS/5KrbT9p9cjTTF2IGxSL/Sj6bf4PHgDekr8i8Y0krI
 aQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xh7VZmkbjwrBgayZ7b6xtD8WVEMS58rBjXLVPr4+QKE=;
 b=Rw3aZv+WeAEmbm7HgUoHnlCnLq21QTVxE3wjs4cFkGiR5+C9QPt3eVqUbijwxl/4KG
 ZC7qy//H7PjBS+fW42k0SGmcyQ5AGMAx+AWx9EHTI3LBkWJFYSvkoYMldSbg0m+mESuO
 RxLKIXpk3CyNizAEkO1+wld2O+7hW7/XFHcfl0AZGznRsGi+URc7KThxN5SvV0OieVEU
 1irkSOgkbeOO5aAgknozASxQdhNgf8z6RhemImOryg5ut0MBO6Ig/V7yF8GetRpNCeiz
 z70AWOx4F2PKNLLnXVzHScL2AnBjUuQEQkknQOXWJNZkos3Fw0MpndMyh9Vd3LVv3Hx4
 t2nQ==
X-Gm-Message-State: APjAAAX756qj/zj8BbVLGjXkugWVXopcyFDRnt0YF1Lbnd9EQNKy1dp6
 elIKVqowvTWqCFs0JPsnXyGvpDHdOxmEkrzVFqo=
X-Google-Smtp-Source: APXvYqxJpepQ9VQoAAc07ujRiGJYpdX3gf8KpVTLJVLZzcSeVsr0TxUgUDnv1zP688nUQIe9u44KNb4m+xHpj3P0O5k=
X-Received: by 2002:a6b:ee15:: with SMTP id i21mr33273959ioh.281.1563826995537; 
 Mon, 22 Jul 2019 13:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190719203037.11795-1-mspinler@linux.ibm.com>
In-Reply-To: <20190719203037.11795-1-mspinler@linux.ibm.com>
From: Olof Johansson <olof@lixom.net>
Date: Mon, 22 Jul 2019 13:23:04 -0700
Message-ID: <CAOesGMhf984ic0O4zhNGo=SfrqDX2wDkYxyfga81JDXkUyciqw@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.2] ARM: dts: aspeed: swift: Fix FSI GPIOs
To: Matt Spinler <mspinler@linux.ibm.com>
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
Cc: Matt Spinler <spinler@us.ibm.com>, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jul 19, 2019 at 1:31 PM Matt Spinler <mspinler@linux.ibm.com> wrote:
>
> From: Matt Spinler <spinler@us.ibm.com>
>
> Change the FSI clock and data GPIOs to match what the hardware turned
> out to use.
>
> Signed-off-by: Matt Spinler <spinler@us.ibm.com>

Hi,

This is not a comment on this patch specifically, just an overall
request for people to adjust how they post patches:

When running get_maintainer.pl on
arch/arm/boot/dts/aspeed-bmc-opp-swift.dts, I get the following:

[...]
linux-arm-kernel@lists.infradead.org (moderated list:ARM/ASPEED MACHINE SUPPORT)
linux-aspeed@lists.ozlabs.org (moderated list:ARM/ASPEED MACHINE SUPPORT)
[...]

Please include both of them on patches. Lots of people aren't
subscribed to the aspeed-only mailing list, so coming back later to
reply to a patch is hard when it hasn't made it into your mailboxes.


Thanks!

-Olof
