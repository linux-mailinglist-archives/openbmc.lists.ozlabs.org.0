Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AABE449DA80
	for <lists+openbmc@lfdr.de>; Thu, 27 Jan 2022 07:18:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jkr4j4TNSz30jV
	for <lists+openbmc@lfdr.de>; Thu, 27 Jan 2022 17:18:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=kwRkDMa7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f33;
 helo=mail-qv1-xf33.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=kwRkDMa7; dkim-atps=neutral
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jkr4J5pnvz2yMt
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jan 2022 17:18:07 +1100 (AEDT)
Received: by mail-qv1-xf33.google.com with SMTP id d8so1998215qvv.2
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jan 2022 22:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gLKN947sfn8FJ1UvrWJJRgjbZ2fmrOZJO6tYis51NK0=;
 b=kwRkDMa7m6L55/vJ2F5F1Z4MgfeIkUI44fPPPHXBxwGQuqYs+tLcSDJSYBqsKP773r
 +JrdbiVudm2rVdcWbDJRk9aK3BTpIK2hrGfnqFfpEb4ZYCoxMmNbyuYCJ240I+ew1all
 XyMUZ5L8rcFwzJPeuJcy8f+Y1H5xQyoFWYGfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gLKN947sfn8FJ1UvrWJJRgjbZ2fmrOZJO6tYis51NK0=;
 b=Ur5K/Rpqj9MOC8I9FlA9nV/WyYKUYkq6u+cHbVPWzTyZrpB8/c6p9Oz2J4eF385kHL
 MMvUpe+ZUyD/BQ0mnfkpDFiIGroRisQ+JEp0a/gL+GJn9Bs6x9cWAuOuUmxDqJTBodng
 794BmX3AER7mOGR74jkHdS6GwQxa3otuCPwyACBt1nNw/3cSHH+qlgpwyMeYZXTItzh4
 +P/EjobVQMTJ+tQCwQfT7d84NfLA3RA/T3yhG01ZR4FSGrUx0vclweae4MdVELVmgAvH
 1huqnXeR39YujInqxMXDgab825D/h3IomNIUD1EpyHutX9byTv1///vKJ/lxH0jBitxq
 sDMg==
X-Gm-Message-State: AOAM533q0EeqGTHGGD0aj5otHJ2oyWlRhyUOogAAYF4rBT6bEADoH7iA
 Ij8dzVNjs/FhYf3s4CICVrj6cXLqhPa20ft6xFQ=
X-Google-Smtp-Source: ABdhPJyXgLE777Pcq09aIB1MHPIOrgCI+VmHTfcIXhTEKMj9xIgTqRlzjk+XyYNuaaHdX21F5XW9zEHqIt6MLGmuWBU=
X-Received: by 2002:ad4:5ca5:: with SMTP id q5mr1454600qvh.107.1643264279542; 
 Wed, 26 Jan 2022 22:17:59 -0800 (PST)
MIME-Version: 1.0
References: <20220114032708.2532-1-Lulu_Su@wistron.com>
 <CACPK8Xf817U7_6ww9m7Jxa6W9OGpTLGfPpzioW1mzv=PmSMuWA@mail.gmail.com>
 <83259c613f2c4329acfa8de770c43876@wistron.com>
In-Reply-To: <83259c613f2c4329acfa8de770c43876@wistron.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Jan 2022 06:17:45 +0000
Message-ID: <CACPK8XeDQ+oYn6WR6aO+R5rUZw3MsQ4GvTwANjamn270pZHHiw@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.4 v1] hwmon: (pmbus) Add a PMBUS_NO_CAPABILITY
 platform data flag
To: Lulu Su <Lulu_Su@wistron.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 17 Jan 2022 at 07:08, <Lulu_Su@wistron.com> wrote:
>
> Hello,
>
> Thanks for the suggestion, but this branch has been used for our platform=
 for a while.

Are you merging and testing stable updates into this branch?

If so, it would be good if you could contribute your changes to the
community maintained repository.

If not, then I suggest you look into this.

>
> Andrew Jeffery suggested that we backport this commit.
> (https://github.com/ibm-openbmc/openbmc/pull/204#:~:text=3DThere%27s%20pr=
oper%20support%20for%20avoiding%20the%20CAPABILITY%20register%20upstream.%2=
0Please%20backport%20https%3A//git.kernel.org/pub/scm/linux/kernel/git/torv=
alds/linux.git/commit/drivers/hwmon/pmbus/pmbus_core.c%3Fh%3Dv5.16%2Drc4%26=
id%3De5befc024cb45%20and%20implement%20the%20patch%20in%20terms%20of%20that=
.)
>
> Could you agree to backport this commit? Thanks.

I have backported this commit and pushed it to dev-5.4.

Be warned that no one is maintaining this old branch, so if you are
shipping firmware based off it, I would recommend finding someone to
step forward to help maintain it.

Cheers,

Joel

>
> >Hello,
> >
> >I note that you're targeting v5.4 for this patch. I don't know anyone wo=
rking on maintaining this kernel tree in the openbmc project.
> >
> >I suggest you move your platform to the latest LTS, v5.15. This patch is=
 already present in that tree.
>
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-----------
> This email contains confidential or legally privileged information and is=
 for the sole use of its intended recipient.
> Any unauthorized review, use, copying or distribution of this email or th=
e content of this email is strictly prohibited.
> If you are not the intended recipient, you may reply to the sender and sh=
ould delete this e-mail immediately.
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-----------
>
