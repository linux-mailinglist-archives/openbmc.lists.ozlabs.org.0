Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B44A032D8
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 23:43:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRq2s0t0Kz3dKJ
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2025 09:43:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736148222;
	cv=none; b=gcjHd3V/DLwV0UI88VQqDog9YRkEvaC9l29QlWXixuvDuLV8g8tbvQHGJaId3R0iCmF29o7gi1q6/aWK+4jlaMR+ND3HA+W2xx1NKPCIY4Kr9Gb37ytT2Uyjq8d6y95khwP1dRPdaE7f9MhWwTYfVY7SvQ75hh7Y0pqPMXC6p0RtZGiDv2iN3smROG6GwmsbnlFIecA4pcB8pj8LPULmc5xr5wp/R231WzgGTF0dbYb5V25SqiwdJHZwJIscckp5SDJFPCCxdRz6gJhV5naeTJo7i9dEPq4jyjGFXlgNmr0Mzmu3SQzWQoKEtYB29lnkAzcq3AOX8/UqFUi6t8O5YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736148222; c=relaxed/relaxed;
	bh=oUBrFahDDtLxpUl8e1hAAHHnLLP81rttueCp4XvEwcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NWxX263fOUj0Eg4AjUdbCGmgzmmRdhijNyd1/zYr696+UB3OEscwHQu8yjhTMuj2XbPpoQ+SHOLxbTU/cPuAjpuoxu5myrQiCbE0XraSSqU/OGfKlMy4p9ba3nwwwiGZvR0AitgKW9ewQd2/eWY1CmzOmbePTP0q86RQYbpkVub3nvBBnYbm7GrPcWAUveCp99IBaHCNaeWWCBGk3QlyJggKB3AMrjzpMYbCMV1OfvdAG25jdJ0+Or/GbsJXx4y58bu1BwavfZcA74Z9dBkgA6nbKuxjZmzvmCFlCsEaw8cf6Ow93MpiF15gblo51uzlGfNoUhMSSKRo7E4gq+89kw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mwogdSsV; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mwogdSsV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRQdm2N75z2xjQ
	for <openbmc@lists.ozlabs.org>; Mon,  6 Jan 2025 18:23:39 +1100 (AEDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-aa67ac42819so2019317766b.0
        for <openbmc@lists.ozlabs.org>; Sun, 05 Jan 2025 23:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736148211; x=1736753011; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUBrFahDDtLxpUl8e1hAAHHnLLP81rttueCp4XvEwcA=;
        b=mwogdSsVaGrAzAc3QfbddlTh39EnaIN1lilNckU/H2/o0HPivnmx2SGn9FoeUCzVv2
         a4FxmIws51MTP1McvQcutoOR3RIsRBu8w+fNF7tydXIzny93CNsDTlZjij2jVvQmGYlZ
         wi29QIsC+FKu3BVpT62/kCBGhINvVslWsOBDuXgSy5Hl3G9i6CqZXh+OMBCRs8HRLXkp
         rvL6gHn2IdxbE52fUZkkBljd97GCOf5f4ZhdAqlile2jiSma+8NyHfW+SZgsomAvlTwB
         Z4xKjJNuviJeB80SdBtQFcARelrDBJYTiH1iP6aAnRhF+wAdGxG3H9QpF6gOPcnTDTKp
         +ujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736148211; x=1736753011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oUBrFahDDtLxpUl8e1hAAHHnLLP81rttueCp4XvEwcA=;
        b=Os0WExhT0ZGJWJ4RCnigIYdRc5Z19Xa8n2fRvKS8+hwL/crJ9Xcc427aVab3Bc/dwe
         qj68UcW206m8R7ebKB9lMOT6Au0wlcSpWkwa2h8tmT8bIbxIm3P/5mdegQdO2q4PyVPB
         qtxo9mhVTS+LMiRVIqiRy8EJCYX8mXJVXmUekL1ZjKF42lBVlF5iHLfYKSKbz3YxRr+R
         bx8NJKbqIc5JPILp2bwakLQ532bslk4uNzcYN0MN6yqOBy2PF0TpaOzwf8G6Wh/tJ3rk
         w1aQJZ5RLE1y12sDaLYJCDL8UZek+wz6FSh7kMtH/tG4kr132dT0YvUvrA/NUhPMxK/N
         lu8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6FvihjAyMM5EqOZMYCSEZiUvnFMG8vrSWLi+Li12LEQGoyxxATn1cTKzYwFgYZCvbKFSTW2+A@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywe/stIeBTlRX+lY1RCxYbFh4tZNVBPq71MdyqV+NTToqYWGkpx
	lMTfRdmKswHfM02ZYXGlxiR780SNeyZjfHiuPWsJgQw7dCTc+iToL6S/BRp6zIvDLc6i4CRkFbv
	u0+p0uzSpmaQ1d7J9LNmR2SrV+hk=
X-Gm-Gg: ASbGncsmfWM19f2YKhkNPuKsysecuq1dFDFUUirCVz3ZfGfVIKvXF9m8Ykx5hjsJDEU
	UnhwV+rW/vd4k0+D2qeYpyyO6zqepPG9V9bImDQ==
X-Google-Smtp-Source: AGHT+IF/O4a2DxY72awTlyBOBHzOP/Q9qJqdDB4BtBgc/Mr6bjjnNFpEVb5oAVJarwl+pT6rzbfygouRCm69jRrsPV0=
X-Received: by 2002:a17:907:9405:b0:aa6:93c4:c685 with SMTP id
 a640c23a62f3a-aac2b946474mr4497373466b.23.1736148210495; Sun, 05 Jan 2025
 23:23:30 -0800 (PST)
MIME-Version: 1.0
References: <20241226055313.2841977-1-j2anfernee@gmail.com>
 <20241226055313.2841977-2-j2anfernee@gmail.com> <lfthwnvwodqogsk446r5nzpmjunfnpdv33xmaookedwjgpdu4n@llvla6siyl5f>
In-Reply-To: <lfthwnvwodqogsk446r5nzpmjunfnpdv33xmaookedwjgpdu4n@llvla6siyl5f>
From: Yu-Hsian Yang <j2anfernee@gmail.com>
Date: Mon, 6 Jan 2025 15:22:53 +0800
Message-ID: <CA+4VgcK_9_YD0d7LUKbxU6yd3Qo9RT4yNbi90mMN=kK0LHXwow@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: adc: Add binding for Nuvoton
 NCT720x ADCs
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 07 Jan 2025 09:43:11 +1100
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
Cc: tgamblin@baylibre.com, herve.codina@bootlin.com, tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, matteomartelli3@gmail.com, olivier.moysan@foss.st.com, thomas.bonnefille@bootlin.com, dlechner@baylibre.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, andriy.shevchenko@linux.intel.com, krzk+dt@kernel.org, chanh@os.amperecomputing.com, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, nuno.sa@analog.com, gstols@baylibre.com, jic23@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Krzysztof,

Thanks for your comments.

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2024=E5=B9=B412=E6=9C=8827=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:17=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Thu, Dec 26, 2024 at 01:53:12PM +0800, Eason Yang wrote:
> > Adds a binding specification for the Nuvoton NCT7201/NCT7202
>
>
> I gave you link to exact line with exact text to use. Read it again and
> use it, instead inventing your own wording. The documentation does not
> say "Adds" but explicitly asks you to say "Add". Why using different?
>
> Subject: nothing improved.
>
> >
> > Signed-off-by: Eason Yang <j2anfernee@gmail.com>
> > ---
> >  .../bindings/iio/adc/nuvoton,nct7201.yaml     | 49 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  2 files changed, 50 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,n=
ct7201.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.=
yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml
> > new file mode 100644
> > index 000000000000..08b52258e4af
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct7201.yaml
> > @@ -0,0 +1,49 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/iio/adc/nuvoton,nct7201.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Nuvoton nct7201 and similar ADCs
> > +
> > +maintainers:
> > +  - Eason Yang <j2anfernee@gmail.com>
> > +
> > +description: |
> > +   Family of ADCs with i2c interface.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nuvoton,nct7201
> > +      - nuvoton,nct7202
>
> Devices aren't compatible? Explain in the commit msg why they aren't or
> use proper compatibility (oneOf, see numerous other bindings or example-s=
chema).
>
>

+  compatible:
-    enum:
-      - nuvoton,nct7201
-      - nuvoton,nct7202
+    oneOf:
+      - const: nuvoton,nct7201
+      - const: nuvoton,nct7202

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    description:
> > +      Reset pin for the device.
>
> Drop description, obvious.
>
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        adc@1d {
> > +            compatible =3D "nuvoton,nct7202";
> > +            reg =3D <0x1d>;
>
>
> Make the example complete: add interrupts and reset-gpios.
>

Add interrupts and reset-gpios example,
+ #include <dt-bindings/gpio/gpio.h>

    i2c {
        #address-cells =3D <1>;
        #size-cells =3D <0>;
       adc@1d {
            compatible =3D "nuvoton,nct7202";
            reg =3D <0x1d>;
+            interrupt-parent =3D <&gpio3>;
+            interrupts =3D <30 IRQ_TYPE_LEVEL_LOW>;
+            reset-gpios =3D <&gpio3 28 GPIO_ACTIVE_LOW>;
        };

> Best regards,
> Krzysztof
>
