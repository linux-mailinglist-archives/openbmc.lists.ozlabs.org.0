Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 799024E1AE3
	for <lists+openbmc@lfdr.de>; Sun, 20 Mar 2022 10:35:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KLszW3H3Xz30NV
	for <lists+openbmc@lfdr.de>; Sun, 20 Mar 2022 20:35:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=L5nbzkpv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2b;
 helo=mail-vs1-xe2b.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=L5nbzkpv; dkim-atps=neutral
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KLsz46mKFz2ynV
 for <openbmc@lists.ozlabs.org>; Sun, 20 Mar 2022 20:34:39 +1100 (AEDT)
Received: by mail-vs1-xe2b.google.com with SMTP id m184so467705vsm.12
 for <openbmc@lists.ozlabs.org>; Sun, 20 Mar 2022 02:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=k96JhXl3WCD4rA/nH5gA5Te+rz3QsUmRsaPBqcMVBro=;
 b=L5nbzkpvlCIIjhR5U72pm4Gf81AS26MXKr4gBtTeHv72wOkdrrqBi7uM58y4kWqE2L
 NaQTufKL8JYCwSb4AeDQ4RqSyNuuX2v/qfnVwIUi0KYhT+p0hdNzxYi/m4J+Xh83hhLz
 AY4oyZGSXslc4Xz2AkcKYSm/ovuDMGELJSCRXC4hU+Lwuk7QrBJfaWkF90Rfar98xHP8
 ZI7tD0cG+tmRHQuvhxHZxxWjx4/XrWJ1LHWRurhPjIkbOriLkGgjbfIArw6cP9IMLLEp
 00RTqk0BzNTdgi346D6z5BybWhzbapieP6zbFuXLJ4soZsSE9yOaCSPCaFK83VUn568C
 BZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=k96JhXl3WCD4rA/nH5gA5Te+rz3QsUmRsaPBqcMVBro=;
 b=OvclMIxU2WRiYL+Lf3dnbdI4cYCQwbnpCmn68+sS09dgomn/F3Bd2qBB+2moDum3es
 dAPXeBoD7jINIvov12ZDMZQVfyjrZr/UkQg5X8JNK3mqQpb0M/nsoz7p6hJUY/Zubruq
 Avka4O13NFqGfFEVnmD/XICWNL3hHAhqa0+2rvJsyt7y56saVmSjVEhjkr8b3qJvPBVU
 if6MqK0c1s6wUH0e2u0WyzqaB2IvgUuszV+0Pg6tup8yz5xVx8jWi7AeUpxWP5Jh+NmN
 QCOw1D9seosInoKQiz8Jtpy/LxVq20ocgxH+hWH0U5aEcXg15d2D6w77Ze8RTaIbyQs3
 0BZw==
X-Gm-Message-State: AOAM532Xk2wnzjma97wKxRAp5wQ9htGI+R8eG23y+1YjPFBGd/H2Q/qB
 RiY0vZA6haQhI4kMPLUluhUcLC5X2U6QpEj2YA==
X-Google-Smtp-Source: ABdhPJxz/+otTMk11U8KJ5mGaJRfVbBxkf9afGF7WtFFI5Z9nzL4Z6guq/Xh6KBFSKcN/wtr1W2v2eCd6vYHLnmNABY=
X-Received: by 2002:a67:f353:0:b0:324:fc5f:5261 with SMTP id
 p19-20020a67f353000000b00324fc5f5261mr1031275vsm.47.1647768874683; Sun, 20
 Mar 2022 02:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-2-warp5tw@gmail.com>
 <YjTrgia/VX6rBT1r@shikoro>
In-Reply-To: <YjTrgia/VX6rBT1r@shikoro>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Sun, 20 Mar 2022 17:34:24 +0800
Message-ID: <CACD3sJarf9jBny8ru0YihehT4C6k1pqw9Ln+5a+Rs6_F_o6=AQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] arm: dts: add new property for NPCM i2c module
To: Wolfram Sang <wsa@kernel.org>, Tyrone Ting <warp5tw@gmail.com>,
 avifishman70@gmail.com, 
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, 
 yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org, 
 krzysztof.kozlowski@canonical.com, yangyicong@hisilicon.com, 
 semen.protsenko@linaro.org, jie.deng@intel.com, sven@svenpeter.dev, 
 bence98@sch.bme.hu, lukas.bulwahn@gmail.com, arnd@arndb.de, olof@lixom.net, 
 andriy.shevchenko@linux.intel.com, tali.perry@nuvoton.com, 
 Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, 
 JJLIU0@nuvoton.com, kfting@nuvoton.com, openbmc@lists.ozlabs.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

Thank you for your reminder and suggestion.

There are still some discussions for the patch V4 and it might take
some time though.

Yes, the dts patch could be submitted via arm-soc.

I really appreciate your comments.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B43=E6=9C=8819=E6=97=A5 =
=E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=884:29=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, Mar 03, 2022 at 04:31:31PM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Add nuvoton,sys-mgr property for controlling NPCM gcr register.
> >
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
>
> There are some comments about this series, so I am expecting a v4
> somewhen. However, I already want to state that I usually don't take DTS
> patches. So, I guess the path forward is that Rob needs to ack the patch
> which is now patch 2. Once he does this and I apply it, you can take this
> DTS patch via arm-soc. Sounds good?
>

Regards,
Tyrone
