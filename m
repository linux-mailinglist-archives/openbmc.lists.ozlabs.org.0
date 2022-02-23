Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA314C0B39
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 05:41:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3Nf266Xkz3bZ2
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 15:41:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ak+w4ldj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a32;
 helo=mail-vk1-xa32.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ak+w4ldj; dkim-atps=neutral
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com
 [IPv6:2607:f8b0:4864:20::a32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3MKp374bz2xBP
 for <openbmc@lists.ozlabs.org>; Wed, 23 Feb 2022 14:42:06 +1100 (AEDT)
Received: by mail-vk1-xa32.google.com with SMTP id k128so11565502vkk.10
 for <openbmc@lists.ozlabs.org>; Tue, 22 Feb 2022 19:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OqWoqSkj2pZq4XW3/OjAW4W3K2FZ5HzyuMQBgaaFWjQ=;
 b=ak+w4ldjGF9jIQB4I06Xh2miBcGoHM1wkGJR6KN9Bw5HhzaOBVaLpvtYS8UxAmYeDf
 DzCTY/lUOsnQAxJ/H2bcZolvw0m6k08oh6xeS7JhJZo26xlsBbzAk0alEOeovANt8nMi
 4337ygGwF+9Sb6qGjffrxXJqByOnOMhziBdwga2F7JEy7T1nMTb4YCn/shzdF3scN0Y0
 P0zT6v773LQf9YgzUQFQsSkdMqJvZ9zKbLD2flbeEGm9/quiPbPI2dH+EvFnRLRlzUH0
 Qnm7NjaDPvu131EbaGiMjzS5GUPEcJsD7lmLR7B0pEsI7Xy8pXchEjl81VhRGR7m/gag
 ElhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OqWoqSkj2pZq4XW3/OjAW4W3K2FZ5HzyuMQBgaaFWjQ=;
 b=eybL/wY0O8XBnnV5ukmqYSeDd06NI1loYRI5LR8qzrxG6RktKqqVT9lhloAG6f+TKc
 3Jn/9IdEXySNgGZoNcAj5+Dyvdi1rtxxhxMW20EvN3/0rBGE5+9I3FOy22KmAS//vaEM
 QuTgfeipCfZfUnTQIkuTfWus+8CUCjLdaKbXWfhuYQAlDkuoPxXRRmnDwH4aDVrh0aMi
 V+STbPqgQjnFb2RCwSXcVCObKDM1tC6GnCmWik87cq8L15yTsG4La4Zbfw8zXkcpLyOi
 qxCU8u01U96RcwyvCFcJOuluOD5Yr+e+h/IeUWSXMKHrt9IxY+QWfE5o7oTGdGipGql6
 qz0w==
X-Gm-Message-State: AOAM533G/0cSGJJB4ORjGZWdCTNc3oJVQQlx5K/2zMLem2v3ksjckAu8
 XOgLHCR/mmGJL0ibP/RC2ekF1hRAHdxzeNr3VQ==
X-Google-Smtp-Source: ABdhPJyvh/72b/1Os/zmPvR6IUg6qz3wiks0x71QCYLQFhOUwWN2mEXlb45uXlPQftu9wGfF+zrwGDRF6/QeQ486dSM=
X-Received: by 2002:a05:6122:180b:b0:330:ee39:966e with SMTP id
 ay11-20020a056122180b00b00330ee39966emr11364658vkb.5.1645587723401; Tue, 22
 Feb 2022 19:42:03 -0800 (PST)
MIME-Version: 1.0
References: <20220220035321.3870-1-warp5tw@gmail.com>
 <20220220035321.3870-3-warp5tw@gmail.com>
 <YhUj3uRQinOVF4eM@robh.at.kernel.org>
In-Reply-To: <YhUj3uRQinOVF4eM@robh.at.kernel.org>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Wed, 23 Feb 2022 11:41:51 +0800
Message-ID: <CACD3sJZo4GvGxira9nM1g_58OkN9UNhUV_f=JKyKiok6_=uoSQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] dt-bindings: i2c: npcm: support NPCM845
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 23 Feb 2022 15:39:19 +1100
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, tali.perry1@gmail.com,
 linux-i2c@vger.kernel.org, digetx@gmail.com, benjaminfair@google.com,
 krzysztof.kozlowski@canonical.com, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, christophe.leroy@csgroup.eu, lukas.bulwahn@gmail.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, bence98@sch.bme.hu, arnd@arndb.de,
 sven@svenpeter.dev, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com,
 semen.protsenko@linaro.org, jie.deng@intel.com, avifishman70@gmail.com,
 venture@google.com, yangyicong@hisilicon.com, linux-kernel@vger.kernel.org,
 wsa@kernel.org, kfting@nuvoton.com, tali.perry@nuvoton.com, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob:

Thank you for your comment and it'll be addressed.

Rob Herring <robh@kernel.org> =E6=96=BC 2022=E5=B9=B42=E6=9C=8823=E6=97=A5 =
=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=881:56=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Sun, Feb 20, 2022 at 11:53:12AM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Add compatible and nuvoton,sys-mgr description for NPCM i2c module.
> >
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > ---
> >  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml       | 17 ++++++++++++-----
> >  1 file changed, 12 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.=
yaml b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> > index 128444942aec..809c51ac32fe 100644
> > --- a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> > @@ -7,17 +7,18 @@ $schema: http://devicetree.org/meta-schemas/core.yaml=
#
> >  title: nuvoton NPCM7XX I2C Controller Device Tree Bindings
> >
> >  description: |
> > -  The NPCM750x includes sixteen I2C bus controllers. All Controllers s=
upport
> > -  both master and slave mode. Each controller can switch between maste=
r and slave
> > -  at run time (i.e. IPMB mode). Each controller has two 16 byte HW FIF=
O for TX and
> > -  RX.
> > +  I2C bus controllers of the NPCM series support both master and
> > +  slave mode. Each controller can switch between master and slave at r=
un time
> > +  (i.e. IPMB mode). HW FIFO for TX and RX are supported.
> >
> >  maintainers:
> >    - Tali Perry <tali.perry1@gmail.com>
> >
> >  properties:
> >    compatible:
> > -    const: nuvoton,npcm750-i2c
> > +     enum:
> > +      - nuvoton,npcm750-i2c
> > +      - nuvoton,npcm845-i2c
> >
> >    reg:
> >      maxItems: 1
> > @@ -36,11 +37,16 @@ properties:
> >      default: 100000
> >      enum: [100000, 400000, 1000000]
> >
> > +  nuvoton,sys-mgr:
> > +    $ref: "/schemas/types.yaml#/definitions/phandle"
> > +    description: The phandle of system manager register node.
> > +
> >  required:
> >    - compatible
> >    - reg
> >    - interrupts
> >    - clocks
> > +  - nuvoton,sys-mgr
>
> You can't make nuvoton,sys-mgr required for existing users. You can add
> an if/then schema for nuvoton,npcm845-i2c if you want to make it
> required in that case.
>
> Rob

Best regards,
Tyrone
