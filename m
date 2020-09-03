Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4C525C68C
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 18:18:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bj5bD6gtLzDrCH
	for <lists+openbmc@lfdr.de>; Fri,  4 Sep 2020 02:18:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Miu3QHLF; dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bj4pW66dczDqQB
 for <openbmc@lists.ozlabs.org>; Fri,  4 Sep 2020 01:43:30 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id c17so2527702ybe.0
 for <openbmc@lists.ozlabs.org>; Thu, 03 Sep 2020 08:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E8wu/yowV0gj0pm+Iw7IjUKMFbsFCpoHyNesRSGhPHM=;
 b=Miu3QHLFnZeRP4Wb4yojr71eQC+yKjDh6n74VwjgXe+YVYQ9k3nboZBTqryFvT4FWv
 vbZSoYWaHEzUbcCZAzvht5NyLpLSOtR7Sp/2RDc6dMmcoDOwlmxKGXtYOhaVxptLTSOx
 7MqR4G+un6dbNe3e0WLBcIip9jtgcPYaiRAhX6w98KsU9hZml9XzajifudjvUdxSNqHe
 lYmRu73K28cZoxcAp0Gbd0QRTvdVcWNm2ytLiErZojUdMY4I2QjhrDVP4+siFed3UKhW
 azI0VZ2qVuJj+pgbISFv69q09vA/hnuRz4m/M/pPrqYHN5oSZ7fnTZxUyDObanWdfFgB
 ZJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E8wu/yowV0gj0pm+Iw7IjUKMFbsFCpoHyNesRSGhPHM=;
 b=gbme/G5jRChe3Iv+ViF0Vh1Un7EmkRf/0CA5nATILdSZlG+2XUZfVm+vgY+WTXVM0N
 HyYyMCx61xWoCDuwjesgHfHpLH2t6mJEh5Xt0JLgIQ8D91r3dcZBvlpqxWjys4XMfwFm
 QAoiy6XSvY/cPcC4YkMhfDb8iYCmiA2FQyCbZWsj9DGupSPoEOlMtW72x+ITxr/biIdb
 XHK96jrnc7VZDXVRmkEf/SsK+E96zT1VdlD+3yRHjHXkQpnPNDHSQGszYorNcx4thvLQ
 ZQfD0FoQutJhL3GJdzGiJ4yAzJoBhRZKNK+56em0Isz5JMWavW4somJGFmFdtERddIWn
 24dA==
X-Gm-Message-State: AOAM531TS0iFKmjRwzC/KYgqbM+iJAeMGFpHRnuUM7wawVO6dd+GZIja
 sZOaj3J06UVO2Aq9vGH3dIqZgWh+VbQYtHlZFwyDDA==
X-Google-Smtp-Source: ABdhPJxB4pVvdewpRlez9wJbqGU1WBF/akWBcPXsRzjFXIOURQIm/ISFT6T5ucze1VD9s2nhikIy81Xy/qWiQE+9/Ck=
X-Received: by 2002:a25:afce:: with SMTP id d14mr3359372ybj.170.1599147808297; 
 Thu, 03 Sep 2020 08:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xLk5JhUjEkiWka6LSXJ1gD-BcH0PqgENqroisDKEUyztA@mail.gmail.com>
 <CAA_a9xJ54rpnKm0y+hrEG2YjuFzzhqKBEJbStsu4Q126APgbVg@mail.gmail.com>
 <9129e6cf-76a8-deea-7e8c-1ac17cf45b4b@linux.intel.com>
 <CAA_a9x+A+OkbdTW_M4KT=6eV982Lg_0PoWaYvW47c0Aoh676-w@mail.gmail.com>
 <9679c401-28ce-3197-f871-2cccd2940885@linux.intel.com>
 <CAA_a9xLXDPP-4SodzEnnASupm7GTtB_My+6GbPrtR9A0S23KLg@mail.gmail.com>
 <CAA_a9x+dyj+K7Zr-3nPUoOp35WjVRjHDo7L0AJ2BSp6sV9M_bA@mail.gmail.com>
 <e9f84dab-54c2-d254-6767-14cfc2197318@linux.intel.com>
 <20200903153819.GC57949@patrickw3-mbp.lan.stwcx.xyz>
In-Reply-To: <20200903153819.GC57949@patrickw3-mbp.lan.stwcx.xyz>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 3 Sep 2020 08:43:16 -0700
Message-ID: <CACWQX80oTWLjZapkE5Q+4nM1T2B4a6rbM3N4oK2WV3t0L=sPgg@mail.gmail.com>
Subject: Re: Dealing with a sensor which doesn't have valid reading until host
 is powered up
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: Peter Lundgren <peterlundgren@google.com>, Alex Qiu <xqiu@google.com>,
 Guenter Roeck <groeck@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Josh Lehan <krellan@google.com>, James Feist <james.feist@linux.intel.com>,
 Jason Ling <jasonling@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Sep 3, 2020 at 8:38 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Wed, Sep 02, 2020 at 10:59:12AM -0700, James Feist wrote:
> > On 8/31/2020 3:08 PM, Alex Qiu wrote:
> > > Hi James,
> > >
> > > I just came through this doc (https://www.boost.org/doc/libs/1_74_0/doc/html/boost_asio/overview/posix/stream_descriptor.html).
> > > Looks like that it's a terrible idea for hwmon driver to return EAGAIN
> > > for dbus-sensors. With that, I think the proper fix is also to use other
> > > errno instead in our driver, and this caveat should be probably
> > > documented somewhere.
> > >
> >
> > Hi Alex,
> >
> > I hit something similar with peci where timeouts was causing the scan loop
> > to hang. I remembered that back when we were developing ipmbbridge we hit
> > something similar with i2c, and the work around was to use the tcp socket
> > instead https://www.boost.org/doc/libs/1_74_0/doc/html/boost_asio/reference/ip__tcp/socket.html
> > as it could correctly handle the errors. This worked for me for the
> > CpuSensor and is a easy to implement change that might be worth trying for
> > other sensors
> > https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/36181.
> >
> > Thanks
> >
> > James
>
> I might have missed this but what are we going to do about the
> Sensor.Value in the case when the data isn't yet available?  Is the
> sensor only going to exist when the data is available?  Do we need to
> define a specific value to indicate that a Sensor.Value isn't available?
> Now that we've moved to a `double` for Sensor.Value it seems like we
> could use NaN.

CPUSensor code that does exactly what you describe :)

https://github.com/openbmc/dbus-sensors/blob/105a19754f003956def5934612b1de86225a4bc1/src/CPUSensor.cpp#L180

dbus-sensors has done exactly this basically since its creation.  I
wonder how we'd get that more formalized in phosphor-dbus-interfaces.

>
> --
> Patrick Williams
