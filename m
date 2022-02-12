Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C0B4B6220
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 05:34:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JySsn3mnlz3cM5
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 15:34:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TwmGdMbx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2c;
 helo=mail-vs1-xe2c.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TwmGdMbx; dkim-atps=neutral
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwbMN5fdtz3bW9
 for <openbmc@lists.ozlabs.org>; Sat, 12 Feb 2022 14:19:59 +1100 (AEDT)
Received: by mail-vs1-xe2c.google.com with SMTP id t184so12419026vst.13
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 19:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VsyfeuJ6g/2GunJL7YeMT1Xjct0dmD0TxFd0nF8PH8U=;
 b=TwmGdMbxLLHVUn9Ba5bpyMP6jFwDyBiTYLHgXVRkaZujZ8eyCU+aHfYjLY7KNVukYT
 3MlOT/3rrOb9bN11+ueZ5hiUJr1GTkpFMozsfpwnpk4YOMQcReN4NOHyQnMMy8v/5lp/
 WKY5aFvS9XzKFm0kP+e7GuhPXAU2+Bw3unDK3nY79MNQcyqbK5Xj3e94BV0fqSb84ok5
 VMIWd5OolmStlZVA20lMLsCHvW1WKPZPrIF2pk16Rfxnp0vGFDzVl9odAe4yzwqPFB+X
 xsLLI4I2PYOsfAJIDRMXtXMLrFPynOXoC+K8u6uoCo+flcSP0cMUxbZrH1UJ9cjKwCaG
 neJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VsyfeuJ6g/2GunJL7YeMT1Xjct0dmD0TxFd0nF8PH8U=;
 b=A+mUtQbpHeYMxgiuBmZITjADPdaJr2eXuXrxQhEomvjx0PGrWaavUWYJmZWbHFjgxv
 MAx9iPP2HeWDk8KuCH5SOcApP1pHTrzCOB1jNm8pI1+1bbc0ZDooMkGNUwP19mAPtoTY
 5dU+6IrVYN233DTw4hhjFhSeniN9+4juENlgqKA6HvuCH0PTkthLnuhZPVHSc+XGkOoR
 A/K0jQKjy8CDeolfF1whSpnN/zmW0F1DaI+2lsAvV3V6ud9XGiZAvlm8Fz4dpVKS7N/s
 EHIm0wOP2Smhs3CPsrT8Utm+BPaTZyrDwCAvKNp2lmXf9HGFMU9NzcSJt6Auy7uvKvNy
 1hIQ==
X-Gm-Message-State: AOAM532VtlcxzwppFMaHq0mLJtNnQLLRjraOHNaaO7g/luhB2fpXE13K
 Muos1iOQNpoleXk/lAAPU0gUMf3q2m/VdWq7mg==
X-Google-Smtp-Source: ABdhPJzhjID5O0hs9dVvNkisAW79JP9/wSPy4zZ+fykuuiQaviQ2GaxlsbRxg65F5PWz5IrOOGqZd0wwcwJKtqYWe8g=
X-Received: by 2002:a67:eed4:: with SMTP id o20mr1544446vsp.29.1644635995958; 
 Fri, 11 Feb 2022 19:19:55 -0800 (PST)
MIME-Version: 1.0
References: <20220207063338.6570-1-warp5tw@gmail.com>
 <20220207063338.6570-2-warp5tw@gmail.com>
 <YgaLZLuCwdpUgMea@robh.at.kernel.org>
In-Reply-To: <YgaLZLuCwdpUgMea@robh.at.kernel.org>
From: warp5tw <warp5tw@gmail.com>
Date: Sat, 12 Feb 2022 11:19:43 +0800
Message-ID: <CACD3sJYbS0_ak_BEJY0P9nYTP0NUZPmQ5re+-jL0qiWivZrL0g@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] dt-bindings: i2c: npcm: support NPCM845
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 15 Feb 2022 15:34:02 +1100
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
 linux-i2c@vger.kernel.org, benjaminfair@google.com,
 krzysztof.kozlowski@canonical.com, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, bence98@sch.bme.hu, arnd@arndb.de, sven@svenpeter.dev,
 Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com,
 semen.protsenko@linaro.org, jie.deng@intel.com, avifishman70@gmail.com,
 venture@google.com, yangyicong@hisilicon.com, linux-kernel@vger.kernel.org,
 wsa@kernel.org, kfting@nuvoton.com, tali.perry@nuvoton.com, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob:

Thank you for your comments and they will be addressed.

Regards,
Tyrone


Rob Herring <robh@kernel.org> =E6=96=BC 2022=E5=B9=B42=E6=9C=8812=E6=97=A5 =
=E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=8812:14=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, Feb 07, 2022 at 02:33:33PM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > This commit adds compatible and syscon description for NPCM845 i2c modu=
le.
> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller dri=
ver")
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > ---
> >  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 21 ++++++++++++++-----
> >  1 file changed, 16 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.=
yaml b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> > index 128444942aec..05e58f44b03a 100644
> > --- a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> > @@ -7,17 +7,22 @@ $schema: http://devicetree.org/meta-schemas/core.yaml=
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
> > +  The NPCM7XX includes sixteen I2C bus controllers and the NPCM8XX inc=
ludes
> > +  twenty-seven I2C bus controllers. NPCM8XX controllers 24-26 are conn=
ected on I2C
> > +  pins in parallel to controllers 8-10.
>
> How many instances is really outside the scope of this binding. And I
> don't want to be updating this for every new SoC. So rework it to cover
> both chips and the next one.
>
> > +  All controllers support both master and slave mode.
> > +  Each controller can switch between master and slave at run time (i.e=
. IPMB mode).
> > +  NPCM7XX I2C controller has two 16 byte HW FIFO for TX and RX and NPC=
M8XX I2C
> > +  controller has two 32 byte HW FIFO for TX and RX.
> >
> >  maintainers:
> >    - Tali Perry <tali.perry1@gmail.com>
> >
> >  properties:
> >    compatible:
> > -    const: nuvoton,npcm750-i2c
> > +    enum:
> > +      - nuvoton,npcm750-i2c
> > +      - nuvoton,npcm845-i2c
> >
> >    reg:
> >      maxItems: 1
> > @@ -36,11 +41,16 @@ properties:
> >      default: 100000
> >      enum: [100000, 400000, 1000000]
> >
> > +  syscon:
>
> nuvoton,sys-mgr or similar.
>
> > +    $ref: "/schemas/types.yaml#/definitions/phandle"
> > +    description: The phandle of system manager register node.
> > +
> >  required:
> >    - compatible
> >    - reg
> >    - interrupts
> >    - clocks
> > +  - syscon
> >
> >  allOf:
> >    - $ref: /schemas/i2c/i2c-controller.yaml#
> > @@ -57,6 +67,7 @@ examples:
> >          clock-frequency =3D <100000>;
> >          interrupts =3D <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> >          compatible =3D "nuvoton,npcm750-i2c";
> > +        syscon =3D <&gcr>;
> >      };
> >
> >  ...
> > --
> > 2.17.1
> >
> >
