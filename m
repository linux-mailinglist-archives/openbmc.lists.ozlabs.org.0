Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 267744D6B4A
	for <lists+openbmc@lfdr.de>; Sat, 12 Mar 2022 01:09:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFjpG528Sz308B
	for <lists+openbmc@lfdr.de>; Sat, 12 Mar 2022 11:09:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.42; helo=mail-oo1-f42.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFjny4tcTz2yYJ
 for <openbmc@lists.ozlabs.org>; Sat, 12 Mar 2022 11:08:52 +1100 (AEDT)
Received: by mail-oo1-f42.google.com with SMTP id
 x26-20020a4a621a000000b00320d7d4af22so12413594ooc.4
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 16:08:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=O+ZowuaGpChH9k7dXrO+pQwCk5UuyOxTNI7OLQVdPlw=;
 b=w9txbssIKwBMS15vb7oKp1Vcjq2iakaJ91Rdq5MaiAx2JLOXt7hMk10CTAe9ENUGkG
 sOqgalMC1AEocbtLNHCEJrOJ0kTj9Jjd2vN2hzQK6KlkLog/Ss23S0MrOi81rhdwlVP3
 fEdKYV4w7sRzNjy8ggjxfgo6QbPAJzYmdzvS5UlV/4DSqiVI4MH8WZZjEJDMfEzkw6fl
 lf/pywgOx0yOwnru1vl/mUUFroONlKIW1AhrU0a+yOzE/0ivMWE5ONUOxPnIzJrronbs
 FvSfBD4mISbTBFvFDvEB6yoTDqnPyVrVLTK/pesWI+QNuXlHboCq71aubPjMgSQKpSlp
 hohg==
X-Gm-Message-State: AOAM532XrnC6lBQc/Hg+r9eDeHlkXVySYc29gU2SBPZ9sNlZpPinASPj
 I9dhSLbxPvQWnHByf87n7g==
X-Google-Smtp-Source: ABdhPJxKJfen2kigP0gnh/8VFptrw0maG5VWC2hBhKLIhJu+QNoF9eXdi5I/avYm4FAyN1IQGZsxTg==
X-Received: by 2002:a05:6871:890:b0:da:6895:1b41 with SMTP id
 r16-20020a056871089000b000da68951b41mr12065172oaq.74.1647043729574; 
 Fri, 11 Mar 2022 16:08:49 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 p21-20020a4a2f15000000b00320fca09b74sm4282072oop.1.2022.03.11.16.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 16:08:48 -0800 (PST)
Received: (nullmailer pid 445165 invoked by uid 1000);
 Sat, 12 Mar 2022 00:08:47 -0000
Date: Fri, 11 Mar 2022 18:08:47 -0600
From: Rob Herring <robh@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add power-efuse binding
Message-ID: <YivkjyFhpW61VmJ2@robh.at.kernel.org>
References: <20220308011811.10353-1-zev@bewilderbeest.net>
 <20220308011811.10353-2-zev@bewilderbeest.net>
 <YitpuR+SlDiKh4eq@robh.at.kernel.org>
 <YivDpkajrJk3KfBM@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YivDpkajrJk3KfBM@hatter.bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Mar 11, 2022 at 01:48:22PM -0800, Zev Weiss wrote:
> On Fri, Mar 11, 2022 at 07:24:41AM PST, Rob Herring wrote:
> > On Mon, Mar 07, 2022 at 05:18:09PM -0800, Zev Weiss wrote:
> > > This can be used to describe a power output supplied by a regulator
> > > device that the system controls.
> > > 
> > > Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> > > ---
> > >  .../devicetree/bindings/misc/power-efuse.yaml | 49 +++++++++++++++++++
> > >  1 file changed, 49 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/misc/power-efuse.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/misc/power-efuse.yaml b/Documentation/devicetree/bindings/misc/power-efuse.yaml
> > > new file mode 100644
> > > index 000000000000..5f8f0b21af0e
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/misc/power-efuse.yaml
> > > @@ -0,0 +1,49 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/misc/power-efuse.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Generic power efuse device
> > > +
> > > +maintainers:
> > > +  - Zev Weiss <zev@bewilderbeest.net>
> > > +
> > > +description: |
> > > +  This binding describes a physical power output supplied by a
> > > +  regulator providing efuse functionality (manual on/off control, and
> > > +  auto-shutoff if current, voltage, or thermal limits are exceeded).
> > > +
> > > +  These may be found on systems such as "smart" network PDUs, and
> > > +  typically supply power to devices entirely separate from the system
> > > +  described by the device-tree by way of an external connector such as
> > > +  an Open19 power cable:
> > > +
> > > +  https://www.open19.org/marketplace/coolpower-cable-assembly-8ru/
> > 
> > Not really a helpful link...
> > 
> > I still don't understand what the h/w looks like here. At least I now
> > understand we're talking a fuse on power rail, not efuses in an SoC
> > used as OTP bits or feature disables.
> > 
> 
> The systems this would actually be used for would be things like these:
>  - https://www.open19.org/marketplace/delta-16kw-power-shelf/
>  - https://www.open19.org/marketplace/inspur-open19-power-shelf-ob19200l1/

Those still don't help show me what the h/w looks like. High level 
schematics is what I'm looking for.


> The rightmost pictures on those pages show the four black connectors where
> the cable assembly linked in the patch plugs in, each of which provides the
> outputs from 12 such efuses, on 12 pairs of ground and +12VDC pins.  (There
> are also two more single outputs off to the side.)
> 
> It essentially just amounts to an external power output supplied by a
> regulator, with the regulator providing an on/off switch, overcurrent
> protection, etc.
> 
> And yes, the ambiguity of the "efuse" terminology is unfortunate (the
> "power-" prefix was an attempt to clarify it slightly).  That's the term
> used in the documentation for the hardware and hence is what I've called it
> here, but I'd be open to using a different name if that would help.
> 
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: power-efuse
> > > +
> > > +  vout-supply:
> > > +    description:
> > > +      phandle to the regulator providing power for the efuse
> > 
> > Vout is a supply to the efuse and not the rail being fused?
> 
> Yeah, that was a fairly muddled description -- it's really the latter.
> Perhaps:
> 
>   phandle to the regulator providing power for the output rail
>   controlled by the efuse
> 
> ?
> 
> > 
> > Sorry, I know nothing about how an efuse is implemented so you are going
> > to have to explain or draw it.
> > 
> > > +
> > > +  error-flags-cache-ttl-ms:
> > > +    description:
> > > +      The number of milliseconds the vout-supply regulator's error
> > > +      flags should be cached before re-fetching them.
> > 
> > How does one fetch/read? the error flags?
> > 
> 
> In the specific case I'm dealing with, via PMBus STATUS_* commands, though I
> was aiming to keep this more generic so it could potentially be used to
> describe non-PMBus arrangements (in the Linux case, via whatever mechanism
> the implementation of the regulator's .get_error_flags() function uses).

PMBus is I2C (subset). What device(s) is on the PMBus?

Here's what I've got for connections so far:

Vout(regulator)-->|efuse|-->12V

Host-->PMbus--->????

Rob
