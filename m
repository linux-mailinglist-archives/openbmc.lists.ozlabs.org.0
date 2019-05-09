Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF0A18C41
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 16:48:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450GRr5pmzzDqDx
	for <lists+openbmc@lfdr.de>; Fri, 10 May 2019 00:48:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="JeJq4bL/"; 
 dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450GL01s7xzDqQl
 for <openbmc@lists.ozlabs.org>; Fri, 10 May 2019 00:43:19 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id j26so1333623pgl.5
 for <openbmc@lists.ozlabs.org>; Thu, 09 May 2019 07:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vSSU+VFQaeXzLclh+o5CB2EGoMrSj0IG8poKZQRN5Fk=;
 b=JeJq4bL//azbcVpPYZBhrr2LZzK/7/zZWsz4H62uP9dsWyF6a79tWSfJ4F2TOXwHvv
 JLcfwuIcFCI8+tjOOyTxuW5xnYeNEak0+pdMf4TgOO6HZ+HfkjeijV95wCtrNAE9Cx2e
 gpmXVFmtmyoo7kKo99ksH4Nmu43/oq+O8KkT6P00hFN+Zllb6256wqAE1lVlLTrKoNNa
 Ll9j7cZFfu3MBL+ddKez9A1UsThcUJJFg0m2P8ygE+GYa1v+5YpfufZmSfvfkciFzgmW
 b4CrbKoRbY9xpLO5Qqcq52ezLqNxNAVv+WBJjYmMXD6KR+RKAQUvWtVCWpAM9jsM3cdx
 I7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vSSU+VFQaeXzLclh+o5CB2EGoMrSj0IG8poKZQRN5Fk=;
 b=tcVg81tWx6ykTzflp2cmhZ8dgnVVHTm27wqz14R/sW09YEcWmG4s25WVjbkAbl2fSn
 yFex6LNxJK5fyVfaa6wxO/0gtorfEoW3tlE4R0y3ptChZsOnZj0V1UvTVwJNj/vtCV17
 bo9b1l7Tf5WmvYyQeRH9XLDDUKVfoL4L27DFxvE/W0vPod1LeZDuNTddOxthr9lHIsY9
 xb+cCQu50qZOIl1UPthoP4PKhjy1Z0tcevKS8f9htl5jD2QNC94syP9BUfy/Gtaaj6de
 E1Mk5zEhU+aYcgrul5x52jhhrAyHRnpRE6kyjjrDsbtsmrwQiaSmDqZa2ByuF0/U0xuM
 AbvA==
X-Gm-Message-State: APjAAAWK24BtVJJJdDcC2zSVqTaFEE/+7BzV7oOZgczaRvoGMUk3fck/
 3sp8pzJR5kYT0CUjXOIfLeIQuhGSES/o+++bI8gv0ffpoS0=
X-Google-Smtp-Source: APXvYqx8q1SbmFVgVR3s+vpf26erRGhTJmTU7OvY4RUlbzmSDRlIaQ+hR6b0HN50VqydLrc9gKz+r+dD3qJATo5pj6c=
X-Received: by 2002:a62:5487:: with SMTP id i129mr5741482pfb.68.1557412995554; 
 Thu, 09 May 2019 07:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <28581f1979a946fdb2f53013bab4661c@quantatw.com>
 <CAO=notyeTBr3BSKrhxDP3uW3s0kma6cek-Dz-33tczKU0pL-Mg@mail.gmail.com>
 <aa5dec4830f349429f440dda2aee7bf2@quantatw.com>
In-Reply-To: <aa5dec4830f349429f440dda2aee7bf2@quantatw.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 9 May 2019 07:43:04 -0700
Message-ID: <CAO=notzHKYjCd++=A+rEzV8bdLc782caeDA=aHg2bC4-6JTp=g@mail.gmail.com>
Subject: Re: about phosphor pid control package
To: =?UTF-8?B?V2lsbCBMaWFuZyAo5qKB5rC46YmJKQ==?= <Will.Liang@quantatw.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, May 8, 2019 at 11:33 PM Will Liang (=E6=A2=81=E6=B0=B8=E9=89=89)
<Will.Liang@quantatw.com> wrote:
>
> Hi,
>
> > -----Original Message-----
> > From: Patrick Venture [mailto:venture@google.com]
> > Sent: Thursday, May 9, 2019 12:36 AM
> > To: Will Liang (=E6=A2=81=E6=B0=B8=E9=89=89) <Will.Liang@quantatw.com>
> > Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> > Subject: Re: about phosphor pid control package
> >
> > On Wed, May 8, 2019 at 6:46 AM Will Liang (=E6=A2=81=E6=B0=B8=E9=89=89)
> > <Will.Liang@quantatw.com> wrote:
> > >
> > > Hi,
> > >
> > > I have a question about getFailSafeMode().
> > >
> > > Currently, only sensors that are defined as "temp" types can be check=
ed for
> > failure.
> > > I did not find any "fan" type sensors to check if the fan has failed.
> > > Our project need to check the fan fail so  I want to add another "fan=
" sensor
> > type to check.
> >
> >
> >
> > >
> > > Can I add one more "for loop" to check the fan sensor in updateSensor=
s()
> > function in zone.cpp??
> > >
> > > for (const auto& t : _thermalInputs)
> > > {
> > >     ........
> > > }
> > > for (const auto& t : _fanInputs)
> > > {
> > >     ........
> > > }
> >
> > updateSensors is deliberately not talking to the fans because they're n=
ot
> > considered inputs into the thermal config, they're controlled outputs -=
- the
> > question I have is, what would you like to do if a fan isn't responding=
?
> > failsafemode drives the fans to a specific pre-defined speed to keep it=
 from
> > thermal issues.  If a fan is failing to respond, one can't drive it -- =
perhaps one
> > can drive the others to some failsafe?
>
> If a fan fails, we need to enter the fail safe mode to increase the other=
 fan duty.
>
> > If so, one needs to update the failsafe for a zone outside of the therm=
al sensors,
> > but rather where the fans are checked (void
> > PIDZone::updateFanTelemetry(void))
>
> I add following code into the PIDZone::updateFanTelemetry(void) function =
to check the fan fail.
> If the fan fails, it will enter fail safe mode.
>   if (sensor->getFailed())
>   {
>         failSafeSensors.insert(f);
>   }
>   else
>   {
>         // Check if it's in there: remove it.
>     auto kt =3D _failSafeSensors.find(f);
>     if (kt !=3D _failSafeSensors.end())
>   {
>         failSafeSensors.erase(kt);
>   }
>
> But one more question I have is that the above code can only check if a s=
ingle fan has failed.

> Our project needs to check for dual-fan failures. Do you have any suggest=
ions for checking the failure of the dual-fan?

I'm not entirely certain what you mean.  You're saying a dual-fan is a
fan that has two outputs but one input?

>
> Will
> > >
> > > BRs,
> > > Will
