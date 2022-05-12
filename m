Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A377524219
	for <lists+openbmc@lfdr.de>; Thu, 12 May 2022 03:31:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzDlL3Pjbz3c5C
	for <lists+openbmc@lfdr.de>; Thu, 12 May 2022 11:31:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=b+gkm0bY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::933;
 helo=mail-ua1-x933.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=b+gkm0bY; dkim-atps=neutral
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzDkx0Rbxz3bdj
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 11:31:20 +1000 (AEST)
Received: by mail-ua1-x933.google.com with SMTP id v3so1457287uau.4
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2022 18:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=izi87e4xdMz6LmYhPRp48LrcOnBQxKpRxLhyMwRFH0c=;
 b=b+gkm0bYZ8uNyQdSPV8PZRfQzGQtBxCjNaHXwmxEEL0encPEDceqhmcqMKWc0J86VO
 bWKJZ22mU/irATvyq2v+pvad+frrSJonoOeNZY5ZnPxTX5xPMT5N9L98udGOy65AJNdN
 KVgw5ZZtbxRJx/PRPeauWz4VDF0F/c9pKfyzKqQuMChX5EV0FMx68sjGjEJZMkE9d8Ka
 XRNTbhCDa/cw+Nh7u4WXo6TS+4uQUbXXkllNcdQIl1uNAR7s5AZxD/e+Y4vjJUKjOGVF
 yy5/JYsMs3tgryVPM+OadJcWrcGKENrirKQuIaQhOB81t1Z8/sik9haw7XbLw+psYzGt
 uuxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=izi87e4xdMz6LmYhPRp48LrcOnBQxKpRxLhyMwRFH0c=;
 b=DTgm55wwqlDCtxwDB2ZhjBgLp6p0v4BGm1rkC7+ijPg32NmwET9EKOaLVzxLviEM/9
 j7PR/epc/GYUxjjG0qzw39rvFO0P1NQTDthHDxYSjfDc6raJj3bqH9a9Xyo0Ltb8genV
 P/MkaT/NiewvanpQIOkEYwP9nvZO1YOn99lxcoFx+gEH1On7Gq7HvaUGKTkbQHqC89S1
 K2gD8YIM9GXqEWouZKlc0SzCWhnFrhZ3Uu/ijprvb4Re1Leo81SVBkoOPwkRwkdSicz4
 fDMGnzbKHDSevXunzuuHYPFsarMG/rj/3RGMUYcSe1r+GFAENn3n5xHDacDe23tXTJP4
 9uQA==
X-Gm-Message-State: AOAM532RtgSPtDIgS/Bko3J4VxzlZ7vOZylNkT5biCoIQtQSItJvbjpF
 9lttlQgoM1QS9Vgd+nqWHCAo2Ly6Uu6zK21v2w==
X-Google-Smtp-Source: ABdhPJxFpJ2a8wB4d9oBe1bLcmgo7DLtuCR49Ty/ZdQW74K93TPNyttHA0PwWQOkkjHrO4v0bEo0GynEtX+sVQJYVkk=
X-Received: by 2002:ab0:6f95:0:b0:362:8cb3:36f3 with SMTP id
 f21-20020ab06f95000000b003628cb336f3mr15208878uav.46.1652319076461; Wed, 11
 May 2022 18:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220510091654.8498-1-warp5tw@gmail.com>
 <20220510091654.8498-2-warp5tw@gmail.com>
 <20220511152422.GA339769-robh@kernel.org>
In-Reply-To: <20220511152422.GA339769-robh@kernel.org>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Thu, 12 May 2022 09:31:05 +0800
Message-ID: <CACD3sJbiPYcckyLncXcVR-TFBo_-3XwSDYbmid4qwnoHX-JtUw@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] dt-bindings: i2c: npcm: support NPCM845
To: Rob Herring <robh@kernel.org>
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
Cc: tmaimon77@gmail.com, KWLIU@nuvoton.com, tali.perry1@gmail.com,
 jsd@semihalf.com, krzysztof.kozlowski+dt@linaro.org, benjaminfair@google.com,
 openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, lukas.bulwahn@gmail.com,
 tomer.maimon@nuvoton.com, devicetree@vger.kernel.org, arnd@arndb.de,
 sven@svenpeter.dev, robh+dt@kernel.org, Avi.Fishman@nuvoton.com,
 andriy.shevchenko@linux.intel.com, semen.protsenko@linaro.org,
 avifishman70@gmail.com, venture@google.com, linux-kernel@vger.kernel.org,
 wsa@kernel.org, kfting@nuvoton.com, tali.perry@nuvoton.com,
 jarkko.nikula@linux.intel.com, olof@lixom.net, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob:

Thank you for your review. I would like to apply Krzysztof's comment
from the link https://www.spinics.net/lists/linux-i2c/msg56795.html
and remove the
quotes of the statement "$ref: "/schemas/types.yaml#/definitions/phandle"".

If it's okay with you, I'll come up with a new patch with
"Reviewed-by" from you and Krzysztof.

Thank you.

Rob Herring <robh@kernel.org> =E6=96=BC 2022=E5=B9=B45=E6=9C=8811=E6=97=A5 =
=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8811:24=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, 10 May 2022 17:16:46 +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Add compatible and nuvoton,sys-mgr description for NPCM i2c module.
> >
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > ---
> >  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 25 +++++++++++++++----
> >  1 file changed, 20 insertions(+), 5 deletions(-)
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Best Regards,
Tyrone
