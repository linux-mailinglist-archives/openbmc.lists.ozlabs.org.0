Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2622F2D83BD
	for <lists+openbmc@lfdr.de>; Sat, 12 Dec 2020 02:17:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ct8rn0d90zDqjy
	for <lists+openbmc@lfdr.de>; Sat, 12 Dec 2020 12:17:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=kunyi@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=RSFvsIm2; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ct8qm3K3jzDqjg
 for <openbmc@lists.ozlabs.org>; Sat, 12 Dec 2020 12:16:16 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id b64so6387770qkc.12
 for <openbmc@lists.ozlabs.org>; Fri, 11 Dec 2020 17:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F5z8mvBAx6elWQI5gnf6juSwCe7Q6khLHeqQo51k7QA=;
 b=RSFvsIm2zT03xssBCGEy4GXK/F1DrSWXiR+JudZ25DcmMM/3MmWFKLbel8ufV4CO26
 3zAhTGLQvHa+RBWH0023T1ew4xzI/ZgTgDqR9iksa7irOrkdHhqe6AQ9eeGO0SYVjN1S
 kevPj2qix/pC23gGJlY9xlHiU9es0iiSxnNKCwSiEry3LacZ3PdfZKMtaAtQFdDxJL5X
 sDW7MDrUYLuKqdSvICFybS2VGOIoZzxRjWODoEcLXaU65psxiaG+e2F98Jm0Ssq1ATnB
 0Ox41pQl+eahmpgIkWiOqErhIPE4w7wWnyEeCtfobscd6FaU/innwYiv4HGR4o70ZDD1
 3gAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F5z8mvBAx6elWQI5gnf6juSwCe7Q6khLHeqQo51k7QA=;
 b=DL6OnqZOdi7/3cfk04iElXqpPktdNBsVG+oXTy6cpTRx3/WWGMHx94OyQT3mQUy794
 QNm40Cxios/wEox67updQWKSGU32VCQbighgSJ3rPCCwtqRPPXgKTSCPH6kxAncI0Gu1
 ijxV/3CRIVneLWu5IRawWCIzHZVEPZ4SYECPuinaWj9aKXyw5aFCS2mDJRKaIPOZ5mjc
 FSZOVFTO93ewcQ7kEo5m3R4NrmFBHJerN+NKlMBeSr+mtz9WiyxBdrh3jLsFpkdlFqR9
 1MCa8oLOfLF3bydIduSfR//vDtLEcyZvqfHpUZBXEDFGYIyJvbM+N4AQud5GqKBc/YiR
 A41Q==
X-Gm-Message-State: AOAM5318YMZG/Mu9ba7lytA+WoOYYOAYchSAm9OYvrlBlOQFYypFVSC6
 I7OkGGCwEgPHCt+6bVYoY8tD2gcRInBuhjr2q9kjdA==
X-Google-Smtp-Source: ABdhPJyBX8VZzIGct7rN4I1OFl0hIIZOGg06Cx5/owhyNKbpS2JJB272GG0JoEhHQXKnGyEEyIfiZjk17F9DWAf6kAE=
X-Received: by 2002:a37:b982:: with SMTP id j124mr20389158qkf.1.1607735770821; 
 Fri, 11 Dec 2020 17:16:10 -0800 (PST)
MIME-Version: 1.0
References: <20201211215427.3281681-1-kunyi@google.com>
 <20201211215427.3281681-4-kunyi@google.com>
 <116ca29a-8270-9b03-520e-bc3ffcf43552@roeck-us.net>
In-Reply-To: <116ca29a-8270-9b03-520e-bc3ffcf43552@roeck-us.net>
From: Kun Yi <kunyi@google.com>
Date: Fri, 11 Dec 2020 17:15:44 -0800
Message-ID: <CAGMNF6V_4B5QrW8+oEvivvTBSM4_LRo24AVirXfMvmJY9zw-rA@mail.gmail.com>
Subject: Re: [PATCH linux hwmon-next v5 3/3] dt-bindings: (hwmon/sbtsi_tmep)
 Add SB-TSI hwmon driver bindings
To: Guenter Roeck <linux@roeck-us.net>
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
Cc: mark.rutland@arm.com, linux-hwmon@vger.kernel.org, jdelvare@suse.com,
 devicetree@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, "Venkatesh,
 Supreeth" <supreeth.venkatesh@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Dec 11, 2020 at 3:51 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 12/11/20 1:54 PM, Kun Yi wrote:
> > Document device tree bindings for AMD SB-TSI emulated temperature
> > sensor.
> >
> > Signed-off-by: Kun Yi <kunyi@google.com>
>
> Any reason for dropping Rob's Reviewed-by: tag ?
>
> Guenter

Sorry that was unintentional.

>
> > ---
> >  .../devicetree/bindings/hwmon/amd,sbtsi.yaml  | 54 +++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/amd,sbtsi.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/amd,sbtsi.yaml b/Documentation/devicetree/bindings/hwmon/amd,sbtsi.yaml
> > new file mode 100644
> > index 000000000000..446b09f1ce94
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/amd,sbtsi.yaml
> > @@ -0,0 +1,54 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwmon/amd,sbtsi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: >
> > +  Sideband interface Temperature Sensor Interface (SB-TSI) compliant
> > +  AMD SoC temperature device
> > +
> > +maintainers:
> > +  - Kun Yi <kunyi@google.com>
> > +  - Supreeth Venkatesh <supreeth.venkatesh@amd.com>
> > +
> > +description: |
> > +  SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible
> > +  interface that reports AMD SoC's Ttcl (normalized temperature),
> > +  and resembles a typical 8-pin remote temperature sensor's I2C interface
> > +  to BMC. The emulated thermal sensor can report temperatures in increments
> > +  of 0.125 degrees, ranging from 0 to 255.875.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - amd,sbtsi
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: |
> > +      I2C bus address of the device as specified in Section 6.3.1 of the
> > +      SoC register reference. The SB-TSI address is normally 98h for socket
> > +      0 and 90h for socket 1, but it could vary based on hardware address
> > +      select pins.
> > +      \[open source SoC register reference\]
> > +        https://www.amd.com/system/files/TechDocs/56255_OSRR.pdf
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c0 {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        sbtsi@4c {
> > +                compatible = "amd,sbtsi";
> > +                reg = <0x4c>;
> > +        };
> > +    };
> > +...
> >
>


-- 
Regards,
Kun
