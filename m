Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B63D85D1
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 04:17:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tGCw2BkGzDqk5
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 13:17:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d44; helo=mail-io1-xd44.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ohagbwYS"; 
 dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tGCC60NlzDqSg
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 13:17:09 +1100 (AEDT)
Received: by mail-io1-xd44.google.com with SMTP id q1so51727656ion.1
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 19:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oo6qZMYf/l0Z8gsqpkMosyYoBGTMFMBcG7wRuSa4ic4=;
 b=ohagbwYSEV0/pk4Fb1Og4+T/SDXT1n3uvFJV028hMzh8+da71AZfQQ71RpCHS6yxzu
 okU7U2A+djo1TLOauypVaX0tXuyBaVJeFr8sTS2DuegT+87o04ZNPpnB9wU7CUQKPUrG
 BKphg3G3xV1ARcn9qN9vetHn9VF0OamV8Wn62aN2xX4qz7ZyMxwv+eEn/5/e9yh3JTBB
 d2/nnwUagilElUnxt46364IAMTM6uhu2vuKVOZxvvlH/1znE+sbic+5yQjtjnLapfy33
 lCUTd9WLEI5m9lZnR26E6TNrxLS52WuvwuzrUwAG3RKzZF9Y56147ltmo649T23K866k
 MbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oo6qZMYf/l0Z8gsqpkMosyYoBGTMFMBcG7wRuSa4ic4=;
 b=TmAV9W/+K6xRWHIznhxOLkmEeGLZKgvIYIE3JdxzcoVLijEwzqE4U/+5IUz+4ECUl9
 ENSySesZ/gF8DY+d84UWIC7a5h1oEBYExgFEwJBIOCSmuTlHFyr4tJdvPnpWvXQqbMxG
 l1cpYpw4dwbWzgI5AbzyYNxQHAKQvfXONk6hl8RlKpr3a6Y/dhxdTLVKe1kiJsUz3KDl
 9udRzYHGToTG8GXR1QPOWZR5vguizo9+jm8ptLrh04Fh/oRiiw0e7qf2C2DgiRmUkevM
 96+Q7ExVaeuBz/XDzvSMAWLK4Zii5g/g3JD+7XZv2C5sNHjiRveHq6rM90zn1CbiasYu
 r2Lw==
X-Gm-Message-State: APjAAAWNyfaI2mioQA0PiHXS98XvAXbamYKvuqN8M11G8jW+H86JAVX0
 XQF2n77sP8gAYlzhNhLSb02Zf5B3xa2uQYQCjiM=
X-Google-Smtp-Source: APXvYqzgbMN20lt3Yem/9n9k8YpxElgwt2SBf7Lw1GAHCitUR4KMeN68d1tGQTS2A8Ho0aPUgvbvfayhv3ASSyKjSw0=
X-Received: by 2002:a05:6638:60f:: with SMTP id
 g15mr11224819jar.21.1571192225949; 
 Tue, 15 Oct 2019 19:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <CALzeG+8HyS2xuBAoe4LN0XCC1+eW7D8uQnG9MKK=KGFN7jodZw@mail.gmail.com>
 <CAO=notynD0EtN77y+UDqETUCo1BGixKFhaJJ3KfnQjVsv2=wTA@mail.gmail.com>
 <818E67A7-4D22-4E13-AD37-99E846E7E17B@fuzziesquirrel.com>
 <CAO=notwwhSe-KKS5=ktJ11CP6ZkaF9fc-4KKpMac0ettqUpftw@mail.gmail.com>
In-Reply-To: <CAO=notwwhSe-KKS5=ktJ11CP6ZkaF9fc-4KKpMac0ettqUpftw@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 16 Oct 2019 10:16:54 +0800
Message-ID: <CAARXrtmW8xs=tfwRC1utiFZdCaQjs2HmT62=vq1mpa+52L=png@mail.gmail.com>
Subject: Re: The type of sensor value in redfish should be double or int64?
To: Patrick Venture <venture@google.com>
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
Cc: "Tanous, Ed" <ed.tanous@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Carol Wang <karo33bug@gmail.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 James Feist <james.feist@linux.intel.com>, gmills@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 16, 2019 at 8:45 AM Patrick Venture <venture@google.com> wrote:
> > >
> > > This change from int64 to double is big enough though that many
> > > configuration files would need to be adjusted, which is non-trivial.
> > > I argue however that having code that doesn't have a common interface
> > > or interfaces for sensors is less than ideal.  Having multiple option=
s
> > > for talking to sensors is fine, but in my opinion this is only true i=
f
> > > they implement different interfaces, or the same interface.  In this
> > > case, we have dbus-sensors and phosphor-hwmon which both implement th=
e
> > > same interface, but differently: int64 vs double.
> >
> > I agree.  This whole situation is=E2=80=A6unfortunate.  I wonder if the=
re is a
> > lesson to be learned here?
>
> There may very well be a lesson here.  In this case, The push to
> double was pushed back, and then we ended up with software that
> followed one version of the interface, and other bits that followed
> another version.  Most of the software is compatible with both types
> here, but having two types does feel like it's defeating the
> well-defined dbus interfaces.
>

The phosphor-dbus-interface xyz.openbmc_project.Sensor.Value interface
specifically defines the `Value` property as int64, so it looks like
dbus-sensors is not following this interface.

> >
> > > I think using doubles makes sense at the dbus level because generally
> > > one wants that version of the value.  Therefore you end up with code
> > > in each daemon that reads the sensor value and the scale so that it
> > > can perform the same operation that another daemon is also going to
> > > perform, etc.  Instead of just doing it once.
> > >
> > > I'll climb off my debate box now and climb onto my voting box and say=
,
> > > I'd like to make phosphor-hwmon report the value as double
> >
> > Why?  Do you have a desire for this specifically or is it just to solve
> > Carol=E2=80=99s issue?
>
> I argue that maintaining the sensor value in its final form saves some
> operations and I'd like to normalize to that.

The interface defines the Unit and Scale as well, so the application
code could provide a calculated value and unit to end-user, which is
easier to understand.

Going back to Carol's question, what she really needs to do is to
PATCH PowerCap, instead of PATCH a sensor value.
So we are OK that PATCH sensor does not work for phosphor-hwmon sensors.
Carol should be able to write some specific code in bmcweb to
introspect the PowerCap's DBus object  and handle both double and
int_64 case.
