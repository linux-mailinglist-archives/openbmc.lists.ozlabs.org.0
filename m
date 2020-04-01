Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DD619B805
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 23:59:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48t0TH39PGzDqsQ
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 08:58:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f44;
 helo=mail-qv1-xf44.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=hVY1jTOr; dkim-atps=neutral
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48t0ST0HTpzDqWQ
 for <openbmc@lists.ozlabs.org>; Thu,  2 Apr 2020 08:58:16 +1100 (AEDT)
Received: by mail-qv1-xf44.google.com with SMTP id p19so656040qve.0
 for <openbmc@lists.ozlabs.org>; Wed, 01 Apr 2020 14:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LjLr7w7CDNrzsHEQavqAFz/NEO11O8PDsRfm6xMLfIk=;
 b=hVY1jTOrzjqNbPKNdSg/UFcpteqlxjFtYuvH5+R4A08XZl8FBuH1OIzxM0wt45GXZX
 4vET2s/89efZECwiPkv3UQ3O1MjQ7Gg5aroJglqugFXEHb5IB7dlINmYAEheNwy4wTRD
 nNDfP0vYShFZT6wLabqaluK9j6zKZwR2P8/yQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LjLr7w7CDNrzsHEQavqAFz/NEO11O8PDsRfm6xMLfIk=;
 b=Q/oHkBQ05lHsTNGyZG67oD8rAN7Drzo1ruoGlrkKmM+UjOHeqghJtWnc1ic9YnWLOq
 +DRm4w4TYACYR4q+rHlyrCNeUwW5hNWVYmc6vzwMBXPnF5H5hqHQ+X+8zP7APxCYzgtY
 pvUjZLy0sVhGwY76raEPGEkxDUT2CH/+Z+w2iRzioRchoHX/OyuNl3wfrX9yDQxAZt1g
 P4njd544rDJ1Sqt3i1oGDkeIqIVmXDokqNTAjwjl7Hc1pPD8qQENEJXZKhNgC0c/8aX8
 GHnyAgr4VttuzaUNUQu7wLfE8tu08hac23WU0VJLAcq14GkX2klmWmYkjp0+YzTmuzdu
 ZP1w==
X-Gm-Message-State: AGi0PubYm5ZlZfBKjedXV5EvvMxpAokkOPYg/veTXN6a1CLq3Z1EwuqD
 FLYinXaYK+zasLXWRpElAf1WxDIEa0wraWJwhvI=
X-Google-Smtp-Source: APiQypL5E7puBd7rvjpdEqJnmupBJgZ1aRkknhwuV/3F0itsIVWy+SlhhXj46lzofQLi0E37q5RZWe/SXE2Xvr/TIDA=
X-Received: by 2002:a05:6214:174f:: with SMTP id
 dc15mr195731qvb.107.1585778293083; 
 Wed, 01 Apr 2020 14:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200401190606.20580-1-eajames@linux.ibm.com>
 <b3f29c9b-e3f6-ff7a-4168-6e36755e5526@linux.ibm.com>
In-Reply-To: <b3f29c9b-e3f6-ff7a-4168-6e36755e5526@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Apr 2020 21:58:01 +0000
Message-ID: <CACPK8XdnGPd7dG5RCqXj9RLet_wUEKn4gwsdNpfZsWDA7uT4QA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.4] ARM: dts: Aspeed: Tacoma: Remove bmp280 and
 add iio-hwmon for DPS310
To: Eddie James <eajames@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 1 Apr 2020 at 19:40, Eddie James <eajames@linux.ibm.com> wrote:
>
>
> On 4/1/20 2:06 PM, Eddie James wrote:
> > The BMP280 was replaced by the DPS310 on Witherspoon, which needs an
> > iio-hwmon node to connect to the hwmon subsystem.
> >
> > Signed-off-by: Eddie James <eajames@linux.ibm.com>
> > ---
> >   arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 11 +++++------
> >   1 file changed, 5 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> > index 044011bb8a04..846a8a2e1a78 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> > @@ -88,6 +88,11 @@
> >                       linux,code = <7>;
> >               };
> >       };
> > +
> > +     iio-hwmon-dps310 {
> > +             compatible = "iio-hwmon";
> > +             io-channels = <&dps 0>;
> > +     };
> >   };
> >
> >   &gpio0 {
> > @@ -442,12 +447,6 @@
> >   &i2c3 {
> >       status = "okay";
> >
> > -     bmp: bmp280@77 {
> > -             compatible = "bosch,bmp280";
> > -             reg = <0x77>;
> > -             #io-channel-cells = <1>;
> > -     };
>
>
> Nope, oops, the device is physically there so we should keep it in the dts.

Ok, I've dropped this one and applied the other.
