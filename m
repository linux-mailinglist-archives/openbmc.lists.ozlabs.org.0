Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B7A26D28E
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 06:25:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsP5c5qjJzDqTk
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 14:25:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b41; helo=mail-yb1-xb41.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=whHRsg6e; dkim-atps=neutral
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsP4l4pFszDqQ6
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 14:24:35 +1000 (AEST)
Received: by mail-yb1-xb41.google.com with SMTP id e11so721193ybk.1
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 21:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p1M1ifs+nzV8UWqY/nZZ8L0SHZogWTL62sEdFMMJllw=;
 b=whHRsg6eyiystoylQS2NCaiw/I3xZePJO5j7yKnuIdj2bfrN+tdPQZ8AnGz0uOC4qc
 PX00WpoEMyjRuH5i4pyEo9OCh+X716VrYqJO4l/s7vjOcd1DPS54LfNCglEt2DjANqGk
 HSBEpzuMCQnNOeDMSltdwJawGtRWcKgAG6aVuNK9h4v3Pw1kQRQB5etMqyyRkWgQZxRr
 QWbY6msvprZDR051y2YO/P1jkCP8JnqS8h00SgN2pfqO1rgjzqhs7E1wF3Ufxn7YfhQh
 fDrABSLIXsuT57qq5rxJLohmb3Gx/1MeTCWauJ1s+8Qz3Cq2ywIHuPgfsdLSuJx0LzHP
 fk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p1M1ifs+nzV8UWqY/nZZ8L0SHZogWTL62sEdFMMJllw=;
 b=Xa/ViWEb7sJ/pCnTcgBrf1HCMaAqcIUXXnC2YTeiKvLfVKGC5RAxWxyKntBI8K6N37
 jb5mNRTyff1bjYsB8P2byBpCR8SFcFLSPxRq4+keKKmIVgo6TYmVlXY6PWZsqkqp6eOv
 pelmBwiIIJi3M5mmIq8pw4DH+5IqxdnxVfuoEZevBm3QdGnigGJIlJMEiC/u9qP56qp+
 4w9a/o5wTz6uUlAGfpojJQmwljWLeq5BghUR9eWOJ2/8U1ebWRNzyCuPbDXYOfRPitEI
 Qr6Sj4bwNPighQlyvs1s1+iziHz5SXvIQv+TNLkoizZf0ScYeSOuxtZJnenJiMaqZAaj
 tuxg==
X-Gm-Message-State: AOAM533uPQsfPR80WHTs8TPaZ1nqBcHt8GUHXBHpqqDB0pFnner0OzdJ
 c5sSAfLByg+6ycDM9ypF6uCatNzGdoab28caJApLmCf8E6KeVvyO
X-Google-Smtp-Source: ABdhPJxNzRdRmLixV1TAV6695AauP5TF1V0FuT26WRTOBOo00qO7+qsig8/EeVebx/IBRsSYTZ4p9t7fAcvKQ3jiwT4=
X-Received: by 2002:a25:b8cb:: with SMTP id g11mr6141915ybm.203.1600316671523; 
 Wed, 16 Sep 2020 21:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <4456d953b1ea5debbc65a282fd62faf4f42d6a20.camel@yadro.com>
 <a824162a-3c7e-810b-5c9a-e41332a0cd22@linux.intel.com>
 <CACWQX82wHxHz9VLAjeSv_s+J1Ovh985o31ekB0oPdr8A8UBavw@mail.gmail.com>
 <224f51bd-8c63-07fb-9728-40a35e86dfc3@yadro.com>
In-Reply-To: <224f51bd-8c63-07fb-9728-40a35e86dfc3@yadro.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 16 Sep 2020 21:24:20 -0700
Message-ID: <CACWQX83pk_U=L7Z672B9zetd8654m5+S7RwWLzNAPJgKmxvG8Q@mail.gmail.com>
Subject: Re: dbus-sensors: Unit property for xyz.openbmc_project.Sensor.Value
 interface
To: Ed Tanous <ed@tanous.net>, James Feist <james.feist@linux.intel.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Andrei Kartashev <a.kartashev@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 16, 2020 at 6:31 PM i.kononenko <i.kononenko@yadro.com> wrote:
>
>
>
> On 16.09.2020 19:24, Ed Tanous wrote:
> > On Wed, Sep 16, 2020 at 8:23 AM James Feist <james.feist@linux.intel.com> wrote:
> >>
> >> On 9/16/2020 6:28 AM, Andrei Kartashev wrote:
> >>> Hi,
> >>>
> >>> We noticed that dbus-sensors doesn't fully implement
> >>> xyz.openbmc_project.Sensor.Value interface: there is no Unit property
> >>> for all the sensors, defined by dbus-sensors.
> >>> I believe it was intentionally, but I still wondering what was the
> >>> reason?
> >>
> >> It was originally as the information seemed redundant. If the
> >> information is needed I'm fine with someone adding it, it just hasn't
> >> seemed to be a high priority.
>
> I have a number of patches which adds the "Unit" dbus-property to each of
> dbus-sensors (adcsensor, pwmsensor, etc.),

Do you have a link?  I don't see them on gerrit.

> Also this changes append dependency from phosphor-dbus-interfaces to dbus-sensors recipe.
> Does the dbus-sensors package intentionally lack the phosphor-dbus-interfaces?
> Or can I safely add this dependency?

I'd rather not not, seeing as how we've made it this far without the
dependency, and we're not consistently using it, it seems odd to add
it just to support the Units property.  If asio were adjusted to use
it consistently, and we ported all the code over, and it made it
simpler, I'd be in more support.

>
> >
> > Considering we've gone this long with no impact (considering the path
> > can be used to lookup the unit) I wonder if we should consider
> > removing unit from the sensor Value API?  It doesn't seem used.
> >
>
> Ed, I'm sure that each sensor's unit may be obtained by analyzing a dbus-path in each service,
> but is it really any better than using well-conforming dbus-interface's?

In the sense that most of the dependent daemons support using path for
Units, yes, it would be easier to change.  In terms of assuming we're
going to push patches to all the dependent daemons, Units would
probably be better than using path.

> Setting the Unit once at the single centralized place (I'd suggest it should be dbus-sensors,
> which defenetly knows better about units) we'll prevent any further code duplication and
> re-implementing of this feature in the future.

Yep, I think we agree.  If you put up patchsets to do this, I'd be in
support.  Are you planning on making this change?

>
> >>
> >>> I noticed that in intel-ipmi-oem units are determined based on object
> >>> paths, but that looks ugly since there is well-defined natural
> >>> interface for units in dbus.
> >>> Lack of the "Unit" property in the interface breaks some existing
> >>> logic.
> >>>
> >
> > Technically the way the interfaces define it, both are valid to use to
> > determine the Units, and both would need to be lookup tables.  Is
> > using the path any more ugly than using the property?
> >
>
> --
> best,
>
> Igor Kononenko
