Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 892DDD8504
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 02:45:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tD991nHwzDqxf
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 11:45:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="J6Q9I4l4"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tD8P00GwzDqSk
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 11:44:35 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id f14so8062115pgi.9
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 17:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JclJx+2oJucwV3w8icPIJiJS9/kNyxaxb0i45QazDcg=;
 b=J6Q9I4l4MLszPSMt/2rYkMf6fafTfFe8GKtM1vn5MylEICNON4zL0FU7bZ7VO9L0R5
 fWayBVHOaKH+ZXh4e6yo48bzo9XpOX4lDc0Xq+zgQV1c5aQrbw/UbX3yK2XN8K1ORSYV
 MzEsaKHL2nG0bDxcy5MbdZNFfisPOrQkgOYiR6osyYHN6/pSOoGc6CGq1BxxHurQa+g4
 h9B1l6OIlchQ/uNjjoX/urlTJlc3wmKsZBTqbbiTbW30RC6iCQ71Z9arpMh1XxxxD8W4
 huAXALXiI0eBRoht70uTOED4am50dFYRoDrEEIEaSvsNjEtXqxMFTzMCXO26wDTJ9dZw
 XepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JclJx+2oJucwV3w8icPIJiJS9/kNyxaxb0i45QazDcg=;
 b=poBdEuuKuBp8KGmwbmYzV1981DHgjqtCMm0S4mdl/7DnhjbkvNnckyAFj+xqCKGO7M
 uoIe9N2AZLg5BZOZHZkgAiUkRz+p5PsTVqE1qIMJSNWU6qJk+2TWGLuX3EY1+BucDJW5
 HqPvoeLh3UZssX7EGBtmLH2jOtG75ilFoCUDvbLEr5ABLRdC7H+691pmKWb1k80/i3dl
 YsNbaSMKcRhPDqSpa9M9oSKoCSsHjDCOpEnLHNfsMY3gjTvOMIYdWU6hkO4UIb/AGfly
 NwfyrETHqoWxzhqP2LJ+MOQrWrxnMqss17cs2CEsTlYjY2boZZ/Vv5eWXd26eW5Q3b6a
 AkBw==
X-Gm-Message-State: APjAAAXvFZDnBw4/RqyjcGJEahRvf5ep2vUeoGB5D6YbfNF5YbfWcNb1
 uri5sKm4ydzQJaiONxKw9s05NL3+4RUaEhznv2dkfg==
X-Google-Smtp-Source: APXvYqzJD8exBx37IbstnyVI6SaDrT74RoUUra4ydyE8E/L2Z+BBw+ehO/aj5KFKxM/6PPlqZ1F76paEgJyiIiSJ0Ck=
X-Received: by 2002:aa7:9885:: with SMTP id r5mr41665414pfl.136.1571186672944; 
 Tue, 15 Oct 2019 17:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <CALzeG+8HyS2xuBAoe4LN0XCC1+eW7D8uQnG9MKK=KGFN7jodZw@mail.gmail.com>
 <CAO=notynD0EtN77y+UDqETUCo1BGixKFhaJJ3KfnQjVsv2=wTA@mail.gmail.com>
 <818E67A7-4D22-4E13-AD37-99E846E7E17B@fuzziesquirrel.com>
In-Reply-To: <818E67A7-4D22-4E13-AD37-99E846E7E17B@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 15 Oct 2019 17:44:21 -0700
Message-ID: <CAO=notwwhSe-KKS5=ktJ11CP6ZkaF9fc-4KKpMac0ettqUpftw@mail.gmail.com>
Subject: Re: The type of sensor value in redfish should be double or int64?
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, gmills@linux.vnet.ibm.com,
 "Tanous, Ed" <ed.tanous@intel.com>, James Feist <james.feist@linux.intel.com>,
 Carol Wang <karo33bug@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Oct 15, 2019 at 12:04 PM Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
> at 11:17 AM, Patrick Venture <venture@google.com> wrote:
>
> > On Mon, Oct 14, 2019 at 7:57 PM Carol Wang <karo33bug@gmail.com> wrote:
> >> Hi,
> >>
> >> I tried to override sensor values with redfish Patch, referring to the
> >> Voltages example of
> >> https://github.com/openbmc/bmcweb/search?q=3D413961de&type=3DCommits, =
but
> >> met an error "Invalid argument". Comparing the code
> >> https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/sensors=
.hpp#L2192
> >> and the doc
> >> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/op=
enbmc_project/Sensor/Value.interface.yaml#L21,
> >> the current code uses double type, but the doc says the value type
> >> should be int64. It seems a scale difference. Why the code uses double
> >> here?
> >
> > The short answer is, code generally authored by Intel uses doubles for
> > the sensor values, whereas the original OpenBMC sensor models used
> > int64.
> >
> > A while back there was a bit of a debate about this, and it looks like
> > we never truly resolved it.  Brad, perhaps this is a good time to?
>
> Is it possible to get bmcweb supporting patch with double and int?  On th=
e
> surface this seems like the shortest path to enabling Carol.
>
> > The idea is, that with the int64 storage, we store the raw value and
> > we also store the scaling factor, so that one can scale the number if
> > they choose to.  Sort of keeping the values as they are -- instead of
> > operating on them before publishing them to dbus.  We do notably
> > however, modify values in phosphor-hwmon before publishing them as
> > often there are scaling factors and offsets, beyond the conversion
> > from mC to C.
> >
> > phosphor-host-ipmid's sensor YAML requires the type to be specified
> > for the sensor value interface already, and does validly support both
> > types: int64_t and double (I tested it when I briefly had a mixed
> > environment).
> > phosphor-hwmon reports values without applying the scaling factor, but
> > it is aware of the scaling factor, so it could.
> > phosphor-pid-control works with both types correctly.
> >
> > I'm not sure about the phosphor-fan stuff, but I imagine we'll find
> > some arithmetic we can drop where it ingests values.
> >
> > This change from int64 to double is big enough though that many
> > configuration files would need to be adjusted, which is non-trivial.
> > I argue however that having code that doesn't have a common interface
> > or interfaces for sensors is less than ideal.  Having multiple options
> > for talking to sensors is fine, but in my opinion this is only true if
> > they implement different interfaces, or the same interface.  In this
> > case, we have dbus-sensors and phosphor-hwmon which both implement the
> > same interface, but differently: int64 vs double.
>
> I agree.  This whole situation is=E2=80=A6unfortunate.  I wonder if there=
 is a
> lesson to be learned here?

There may very well be a lesson here.  In this case, The push to
double was pushed back, and then we ended up with software that
followed one version of the interface, and other bits that followed
another version.  Most of the software is compatible with both types
here, but having two types does feel like it's defeating the
well-defined dbus interfaces.

>
> > I think using doubles makes sense at the dbus level because generally
> > one wants that version of the value.  Therefore you end up with code
> > in each daemon that reads the sensor value and the scale so that it
> > can perform the same operation that another daemon is also going to
> > perform, etc.  Instead of just doing it once.
> >
> > I'll climb off my debate box now and climb onto my voting box and say,
> > I'd like to make phosphor-hwmon report the value as double
>
> Why?  Do you have a desire for this specifically or is it just to solve
> Carol=E2=80=99s issue?

I argue that maintaining the sensor value in its final form saves some
operations and I'd like to normalize to that.

>
> > and I'm
> > willing to review incoming patches that address other aspects of the
> > codebase to bring it all together -- since they'll need to be in a
> > locked step-forward.
> >
> >> Thanks!
>
