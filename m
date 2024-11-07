Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D16CF9C1200
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2024 23:51:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xky3f0mWCz3fSH
	for <lists+openbmc@lfdr.de>; Fri,  8 Nov 2024 09:51:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730941228;
	cv=none; b=JEH2bm5GVoBY51fnTKPGOxXy2s6g26/zh4fpKtP5FPiQaf8X5qWrPI+7vo4F+d4rBDgewSRw9aLXCmFUdgoDeh5u56HHzK6+POMyhZzUjMR8eaf3ImmfOq5r9xUENjrmB9rZzCsyWiK9iGryCIrPQ88pwSj8C8df0yhgfwJYilLt8czs4Q2y4JqdTOf0DEgoMiHJ2RjgfwstnHWtoEKhPbsoAcDGzWTzIRZSv2jjFOrc9kQkJzvMnUUXI5LTA91k0wArD/2TKTv9o0EyvO9iaorPmcCsQ/1gpHeZ+o2wFRSK25wtJWBIIh+TG7OPp2H3bFmEv0QbalEEXobrBcIDtA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730941228; c=relaxed/relaxed;
	bh=7Bscw2a5Di4J9nIUSX2reCBftf3EfivmNobXBBNgjok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BgBt7q72362Fk2zM1E0FywQWZEDlkn+d17lXb/f6vpDG/99ZvYh+AuOyQgl676okdm0t03OK8NMozKBivbanu6iLB30Ymuc7mS/OdEoKvDc8B5mTkRSU2ZADgJe7iMhaK4u1g5gePqhoFDjj1PnH12aRSsyR3Nl49gkk02xYU2EoYF4zyUrfhiXcjnmsedAQbvBDRiu0QFZ4XC+dH/q0Z89kTfWyu1U0QR0ZT8yfH33hMlMsFiATUmjH0VB35yR8LQK3yGfGrEGqhjklcRIPeZopYLeFAL1ISMIUttaUBExs1rabPGOAXN7eMPFAIW+4aGLtyYXqN+rn0u8nlbNt9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mEvJdCcD; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mEvJdCcD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkNzG6Kz0z2yDT
	for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2024 12:00:25 +1100 (AEDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a9ed7d8d4e0so42276266b.1
        for <openbmc@lists.ozlabs.org>; Wed, 06 Nov 2024 17:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730941221; x=1731546021; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Bscw2a5Di4J9nIUSX2reCBftf3EfivmNobXBBNgjok=;
        b=mEvJdCcDUDO4HgP6k7DHNDbQMSStDqItyOjv7G/0Se25ZWZVE0y+aO9u2uz1GWSzil
         NdmaJbsXrFZ+gT5emykPK10qzX/W7ZN+HM6hz+MCWa2edIPqaH+oDYgPpOvKLvK47Vwb
         MXeEXt5WB+FpS/D0WF0mDD6L1kXYM3HCilxZKIAzDk6PIOSwITUigQ5QBiBelzaJmelh
         EbpfmIt4EDMBnw0fgv687yeUJMIE6QEPyTY9R5DmPCJ1k7l+f+Zm/kqHWaByY+gtkKwy
         zwotgoTRpuDQ+EoSfDbJwauN7zdvetMNRODdal0Eq8AsL/czGct2XpRimYJNF+8rNdAD
         Oixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730941221; x=1731546021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Bscw2a5Di4J9nIUSX2reCBftf3EfivmNobXBBNgjok=;
        b=jZhA1S91QoeKAh5zHL7GJIkOIwXxrIE/Oz27eX+xiir5hd8UZyDsU+bzxCa4YI4Y7u
         s8XvdkLcYn/lqiauXvIQsT7D3Hzl4qtQbI11fUtZEPkWHB+Ij1ebIFw1rDCvXVqaDcX0
         YA5ar99JlKvsZ5mLdUjIOI8XOLpo/nSN0igjO9453AicIN4JGJE5gGRqXkjMbTKLajt6
         6JaPcXp8Y40i5ciVgTObxt700xLMa4MS3L1sDXDnpdm5ALrcZuPMccuZixjSTb5S1stz
         JdyjDZI/YivlRLKn3dkDHqn2WLyR5iMyjVOm4NKm++ju//oP+u/4KtsGNbQw3eZSdn23
         nosQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdIuSpSodBICgVvGFa7/Ckjtac60peYm6LnRLPNBtsKHwtjZGotqto341MOdeQ7t+uVaoNKhYN@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy5cxDk5VyIhleBfNi/gjVlBK6ong4tIvWhBbJ4OAgsYY1OqnLW
	PCkswJ5GddN4kKL3LyyWog9eA8lD2wMEzZiL3ekFj57jFNPB2iaBTfIdEsK9hI+GFlwDkiI2Vht
	gBjm7UI1iL/olFS/ZGl1s060X9IM=
X-Google-Smtp-Source: AGHT+IHSIeQT9vubg7ty3SAYjKWXRCTIIes7pGvCiElDqr0P60O1t2IH6UmM7NTCRBTOe/LJ4VStqbhbpKJlDEUdzCU=
X-Received: by 2002:a17:906:6a1e:b0:a77:c95e:9b1c with SMTP id
 a640c23a62f3a-a9e654f89b5mr2052327166b.27.1730941221116; Wed, 06 Nov 2024
 17:00:21 -0800 (PST)
MIME-Version: 1.0
References: <20241106023916.440767-1-j2anfernee@gmail.com> <20241106023916.440767-2-j2anfernee@gmail.com>
 <6c20875c-4145-4c91-b3b5-8f70ecb126f0@amperemail.onmicrosoft.com> <20241106-humid-unwired-1d3fa1f50469@spud>
In-Reply-To: <20241106-humid-unwired-1d3fa1f50469@spud>
From: Yu-Hsian Yang <j2anfernee@gmail.com>
Date: Thu, 7 Nov 2024 08:59:44 +0800
Message-ID: <CA+4VgcJ9TgDAK6Q0RqBWhiT115nPGHNesYGKKpQyBCgC=rx+BQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: iio: adc: Add binding for Nuvoton
 NCT720x ADCs
To: Conor Dooley <conor@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Fri, 08 Nov 2024 09:50:58 +1100
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, marius.cristea@microchip.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, olivier.moysan@foss.st.com, dlechner@baylibre.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, mike.looijmans@topic.nl, Chanh Nguyen <chanh@amperemail.onmicrosoft.com>, joao.goncalves@toradex.com, nuno.sa@analog.com, matteomartelli3@gmail.com, chanh@os.amperecomputing.com, andy@kernel.org, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, krzk+dt@kernel.org, jic23@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Conor Dooley,

Thank you for your response.

NCT7201 supports 8 voltage monitor inputs while NCT7202 supports 12
voltage monitor inputs.
NCT7201 and NCT7202 provide SMBus to access the internal register, and
support SMBus byte write and byte/word read protocols.

Conor Dooley <conor@kernel.org> =E6=96=BC 2024=E5=B9=B411=E6=9C=887=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8812:13=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, Nov 06, 2024 at 11:58:06AM +0700, Chanh Nguyen wrote:
> >
> >
> > On 06/11/2024 09:39, Eason Yang wrote:
> > > This adds a binding specification for the Nuvoton NCT7201/NCT7202
> > > family of ADCs.
> > >
> > > Signed-off-by: Eason Yang <j2anfernee@gmail.com>
> > > ---
> > >   .../bindings/iio/adc/nuvoton,nct720x.yaml     | 47 ++++++++++++++++=
+++
> > >   MAINTAINERS                                   |  1 +
> > >   2 files changed, 48 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoto=
n,nct720x.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720=
x.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
> > > new file mode 100644
> > > index 000000000000..3052039af10e
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
> > > @@ -0,0 +1,47 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/iio/adc/nuvoton,nct720x.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Nuvoton nct7202 and similar ADCs
> > > +
> > > +maintainers:
> > > +  - Eason Yang <yhyang2@nuvoton.com>
> > > +
> > > +description: |
> > > +   Family of ADCs with i2c interface.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - nuvoton,nct7201
> > > +      - nuvoton,nct7202
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  read-vin-data-size:
> >
> > Is it generic property or vendor property? I tried to find in the
> > https://github.com/torvalds/linux/tree/master/Documentation/devicetree/=
bindings
> > , but it seems this property hasn't been used on other devices.
> >
> > If it is vendor property, then I think it should include a vendor prefi=
x.
> > For examples:
> >
> > https://github.com/torvalds/linux/blob/master/Documentation/devicetree/=
bindings/iio/adc/adi%2Cad7780.yaml#L50
> > https://github.com/torvalds/linux/blob/master/Documentation/devicetree/=
bindings/iio/adc/fsl%2Cvf610-adc.yaml#L42
> > https://github.com/torvalds/linux/blob/master/Documentation/devicetree/=
bindings/iio/adc/st%2Cstmpe-adc.yaml#L22
>
> An explanation of why it cannot be determined from the compatible would
> also be good. Two compatibles and two values makes me a little
> suspicious!
