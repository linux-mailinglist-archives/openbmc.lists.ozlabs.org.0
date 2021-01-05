Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C91F2EB183
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 18:39:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9KVq3PxXzDqjJ
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 04:39:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::335;
 helo=mail-wm1-x335.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=IVytjBiG; dkim-atps=neutral
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9KV019ShzDqbF
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2021 04:38:28 +1100 (AEDT)
Received: by mail-wm1-x335.google.com with SMTP id r4so295490wmh.5
 for <openbmc@lists.ozlabs.org>; Tue, 05 Jan 2021 09:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=32aWSOox4ARUWzcoCqpubvOtq4Wft9HyfLQFnXuNQHw=;
 b=IVytjBiGufxAAKHWF8rt7keGdA9+xvt+rD1LtCwJEIRLvQ92m3dDSjazMp20ZbCUpo
 TN7C/7oTlZMwleGxBRx8NQLpJJomREQulcjG7PEcctI/CyCPzoO6n3o8mbWtdKTEMV4b
 3F3oV2nKyNGW/IM2vj85WTF6gjat+w9gU8gkW9BdovISSBz+2bRhJ8be4Rp66ah6umNc
 aFpo2pjrT48KMKAgEpUmt3AjO1KS+rw+gDm7smng5UDXEZtw7xd30dRAezJSeJfBWvT3
 40T3XPhCf0APAXw2EueB2AdDdQCqtkHoHAsH1eDQCvsSWlorozO6/OPHtMK3tzo9Vog2
 +clA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=32aWSOox4ARUWzcoCqpubvOtq4Wft9HyfLQFnXuNQHw=;
 b=IKYdsacx2g6NdxImU0IVXTZjkZuxj5Slb9h2Nr9Mh8KcAQl1lVaElMzPPsNuM1QZaz
 WxviNdubcZZOW1spN4qEZNycPPgwTyaFSTF8KQFXimJ882J7q1tuX0+y91+hdw8J7ygG
 GRothQ/0O4iWZ9lVZQpvTXYWXtdXAwbtrVyRKcbmrnqkZYGy/fiGudDRXXWNLyQbmZ5L
 RdTtozbWYhoA6vc8nubEDvzi1NJdeF7YOVf/qNTKjEeK1g82IbTkTgiEr2lpfNOUqQbF
 5heqmUYNcZszFx/CNkLHTNPaKGgUTOGixgyGHbayOXG1/d73cO9XR/KlFjHdQkZyiNYK
 i9ug==
X-Gm-Message-State: AOAM5334j1xgHlnzwdD6pvHmoQTUevADPOCxlvgQkI1nqW0xlMHRT8ST
 9C4y4G9uLbfYNgOMbCewuOR6eh5XR0PVHSdsYVce0w==
X-Google-Smtp-Source: ABdhPJyuIbdx9WNicKMPC9+kAJc89tX15aA0004RUyOUqjHQNsgapXfhsOpkt+RCEgXE1WhwbgROM3pfiQK5HdMoSKw=
X-Received: by 2002:a1c:7213:: with SMTP id n19mr257171wmc.14.1609868302797;
 Tue, 05 Jan 2021 09:38:22 -0800 (PST)
MIME-Version: 1.0
References: <7be00c72-db17-c751-470e-eb92f18f8bb3@linux.ibm.com>
 <CAJTGxZG36whmooeOvMcwkhj5aQtvr=s8QFCGXYNSX6Up6WMJhg@mail.gmail.com>
 <c4ced4dd-0b20-9c22-6dfe-99b22e51d0ab@linux.ibm.com>
 <X/R3XZNHmYpz74mu@heinlein>
 <ce14a5fa-eaeb-8c16-3ab2-7ef231b6c326@linux.ibm.com>
In-Reply-To: <ce14a5fa-eaeb-8c16-3ab2-7ef231b6c326@linux.ibm.com>
From: Ed Tanous <edtanous@google.com>
Date: Tue, 5 Jan 2021 09:38:12 -0800
Message-ID: <CAH2-KxDECT96ZHfKadwLYUkbx2_MAqUBugteud-27XZVYELWPA@mail.gmail.com>
Subject: Re: hardcoded median function in phosphor-virtual-sensor
To: Matt Spinler <mspinler@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vijay Khemka <vijaykhemkalinux@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jan 5, 2021 at 7:59 AM Matt Spinler <mspinler@linux.ibm.com> wrote:
>
>
>
> On 1/5/2021 8:27 AM, Patrick Williams wrote:
> > On Mon, Jan 04, 2021 at 04:57:51PM -0600, Matt Spinler wrote:
> >> On 1/4/2021 2:54 PM, Vijay Khemka wrote:
> >>> On Mon, Jan 4, 2021 at 9:49 AM Matt Spinler <mspinler@linux.ibm.com
> >>> <mailto:mspinler@linux.ibm.com>> wrote:
> >>>
> >>>      I need a median of some sensor values, where this median sensor has
> >>>      threshold interfaces
> >>>      whose values must be defined in entity-manager.  Since exprtk
> >>>      expressions are not allowed in
> >>>      entity-manager, I cannot just port the PVS's JSON config into an
> >>>      entity-manager config.
> >>>
> >>> I missed this discussion but why can't we simply use virtual sensor as
> >>> expertk provides median function and we have threshold support for
> >>> each virtual sensor. Please help, if I am missing anything.
> >> If you're asking why can't we just have PVS get its exprtk expression to
> >> use from entity-manager, and encode the median there, it's because Ed
> >> doesn't want exprtk in entity-manager config files (I'll defer to him on
> >> the reasons).
> > As part of offline discussions on this I said that having a one-off EM
> > config for median to allow you to make progress is reasonable, but I
> > don't think having a bunch of one-offs is a viable long-term solution
> > for phosphor-virtual-sensors.  Basically we're kicking the can down the
> > road until we have a better understanding of what kinds of EM/PVS
> > configs we're going to need.
> >
> >> If you're asking now that the median function is hardcoded, why write it in
> >> C++ instead of exprtk, it's because the exprtk code would be so similar to
> >> C++ code (skip the bad values, put the sensors in a vector,  call
> >> nth_element)
> >> that writing it in exprtk doesn't really buy us anything, and using C++ lets
> >> me skip making the symbol table.
> > I would certainly prefer we use the exprtk code here.  You should be
> > able to generate (at runtime) a exprtk expression from the EM config you
> > specified below.
> >
> > My rationale is:
> >      * Ed suggested that a long-term answer might be a few lookup tables
> >        / transformations from the EM configs to the PVS expressions.  I'm
> >        not fully bought into this yet but it seems like a reasonable
> >        direction to explore.
> >
> >      * You wrote "because the exprtk code would be so similar to the C++
> >        code", which is why you *should* do it in exprtk.  The rest of the
> >        PVS code is already this way so why something different and
> >        require dual maintanence?  If the exprtk-based support code is
> >        missing some of these features, lets add them because others will
> >        likely need them as well.
>
> See below.
>
> >>>      Instead, I will make a new entity-manager config that will have the
> >>>      component sensors
> >>>      along  with the thresholds to use, with a subtype of median, vaguely
> >>>      something like:
> >>>
> >>>      {
> >>>      Type: "VirtualSensor"
> >>>      Name: "MySensorName"
> >>>      Subtype: "Median"
> >>>      Sensors: [ "Sensor1", "Sensor2", .... ]
> >>>      ThresholdsWithHysteresis [ ]
> >>>      minInput: 0
> >>>      maxInput: 100
> >>>      }
> >>>
> > I would expect the 'exprtk' expression from your EM config to be
> > something like "median(Sensor1, Sensor2...)".  You should be able to
> > feed this into the existing virtual-sensor constructors and not have to
> > make the symbol table yourself.
>
> Every variable used by exprtk needs to be added to the symbol table
> first by the C++.
>
> Also, we need a slightly tweaked median of our 3 ambient temp sensors:
> 1) throw out values outside of minInput/maxInput
> 2) if there is an even number, because we threw out one, choose the
> higher value, and
>      don't do the average of the 2  that I believe an actual median
> would use.
> 3) if we threw out all 3 (very unlikely), use NaN as the sensor value.
>

These kinds of corner cases are exactly why IMO C++ is easier in the
long run.  Those 3 conditions are trivial to add to a C++ based
daemon, but would require a lot of complex expertk code to define if
the corner cases were found later.  In C++ they just end up as an
extra branch.

> This is easy to do in C++ using std::nth_element, and basically looks
> the same in
> exprtk which is why I suggested just using C++ though I don't really
> care that much either way,
> but I don't see how we could upstream this as a true median().  In fact,
> since
> the underlying code would just use  nth_element anyway, I'm not even
> sure it would
> be accepted and is probably why there isn't already a median().
>
> Since I guess it could be argued this isn't a true median, maybe we
> shouldn't call it
> a median, which is fine, but we still need it.

Maybe we could call it "AirIntakeTempAggregator" or something of that sort?

>
> > Exprtk doesn't currently support a 'median' operator but it does support
> > 'avg'.  We should contribute this upstream and add as a patch in the
> > meantime.
> >
>
