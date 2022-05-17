Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8068852A21C
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 14:53:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2bf12zSXz3c99
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 22:53:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AwPZC/c3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2c;
 helo=mail-vk1-xa2c.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=AwPZC/c3; dkim-atps=neutral
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com
 [IPv6:2607:f8b0:4864:20::a2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2QgP50rzz2yLJ
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 16:09:20 +1000 (AEST)
Received: by mail-vk1-xa2c.google.com with SMTP id j14so8545648vkp.4
 for <openbmc@lists.ozlabs.org>; Mon, 16 May 2022 23:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=X3p/bJpggzYIlRPwptvT4yV9Dv1X4oCHyy6l5VIG8EM=;
 b=AwPZC/c3Z9TSGTZRgivdf8rrE7Z+UwN+w8JlZlCF+Xg1e0bCfvOvyTnpSE5ve3+Wl8
 rMYGCZD5m6z2jwvW3Bn1HV1nDLYwWX6/h/0o+GgOvOzQASOebkBEWjUuDyuw9XeWlCjH
 ehRDXSuDNo0JXNRQ/82tPQ8OBb348SWgJA57PxQST/OE5Sw/ewF+1ld0mZ7gsMRancXy
 i0SP3xItR4NOphFHCnAv6+7wzZ3rs1P+RVfjmDPCdlfSDmOXp2ylRsfcZ6zOutcWb0ic
 0j5AMtl/1TgssVjgY22To693SgD3ldeGVx0iPtq4hFt6aq9HuM7qTwebpCaeCXiaMZJw
 16pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=X3p/bJpggzYIlRPwptvT4yV9Dv1X4oCHyy6l5VIG8EM=;
 b=ZmFdadhC8XpF3Nf4EC2CTLGob6x3rSl0RqRPxo0adMf0hyN9c9DKaiv50ZPA2/BIq8
 DJomQMCq3zKiBRSs9ShVt4EyAuFtC/RybNnGhE9d6nQU1EK7uYNZaJ/V/5/8Fh6A37kA
 1eRAdt5ozRCs13ptPdD9n10E3y9y7/n2v1eA+Jd3evfVu/LloLiarHRs+eT6CQaL99iY
 5sS9crjuYbP3bwrfauaSq4sAznhpGd+sxFXSqcFc+sLLuwbA7wRR2AZ8aIK8ol/hIM/l
 2JKAZ444kF71Edeki8BHhTy0BgBkFcn0b5ikwIcU056JqWna8ZUDLtJ+lYwfu7jejY3x
 2ijw==
X-Gm-Message-State: AOAM533cgS1/paP5ccwP0kPs4Ul78aUBOUN4uXHGqsrDQcLi7LD4ZbGP
 vUpgb4JYoMGPtVVPmkK80E6ZUi23qjFjQTjI3g==
X-Google-Smtp-Source: ABdhPJx31C9WjnaA9Ui9cwwZ1/uZK5DCWJXNtlPrRxpk2SIkz1TMVt6x3UUJ2oy3erDGaLz95TXTNxD5ZEF34kG90kQ=
X-Received: by 2002:a1f:3254:0:b0:34e:b02d:bdd7 with SMTP id
 y81-20020a1f3254000000b0034eb02dbdd7mr7928465vky.11.1652767757269; Mon, 16
 May 2022 23:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220510091654.8498-1-warp5tw@gmail.com>
 <20220510091654.8498-3-warp5tw@gmail.com> <YoKqdfLSeJ69WFhi@kunai>
 <CACD3sJa3koHGsC3PBbfZuBhTfVHhjF=3g3YysxZ0+TvQ1qwfyA@mail.gmail.com>
 <YoM63XoYZbFGJ8s7@kunai>
In-Reply-To: <YoM63XoYZbFGJ8s7@kunai>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Tue, 17 May 2022 14:09:05 +0800
Message-ID: <CACD3sJaJbmoR-txb2V3Q=YkKpMD76S4zvF5_5SyVmUkPh9tvMQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] i2c: npcm: Change the way of getting GCR regmap
To: Wolfram Sang <wsa@kernel.org>, Tyrone Ting <warp5tw@gmail.com>,
 avifishman70@gmail.com, 
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, 
 yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, andriy.shevchenko@linux.intel.com, 
 jarkko.nikula@linux.intel.com, semen.protsenko@linaro.org, sven@svenpeter.dev, 
 jsd@semihalf.com, lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de, 
 tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, 
 KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
 openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 krzysztof.kozlowski@canonical.com, jie.deng@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 17 May 2022 22:52:11 +1000
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

Got it and thank you for your help.

I'll come up with the new patch set with the corrected SoBs.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B45=E6=9C=8817=E6=97=A5 =
=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:04=E5=AF=AB=E9=81=93=EF=BC=9A
>
>
> > After reviewing these two links, we decided to keep only the author's
> > SoB for each commit.
> >
> > https://lore.kernel.org/lkml/YiCZlhJoXPLpQ6%2FD@smile.fi.intel.com/
> > https://lore.kernel.org/lkml/YiCb7LNY9tmMCZx7@smile.fi.intel.com/
>
> When Andy said "chain is wrong", he meant the order. You must add your
> SoB, otherwise I can't take the patches. But yours should be last. The
> SoBs need to be in the order people worked on it.
>
> Does that make sense to you?
>

Best Regards,
Tyrone
