Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AFA3A8F05
	for <lists+openbmc@lfdr.de>; Wed, 16 Jun 2021 04:50:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4V6L31yzz3087
	for <lists+openbmc@lfdr.de>; Wed, 16 Jun 2021 12:50:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=rddGjYVe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::231;
 helo=mail-lj1-x231.google.com; envelope-from=wangzhiqiang.bj@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=rddGjYVe; dkim-atps=neutral
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4V5w5KhCz2yXb
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jun 2021 12:49:54 +1000 (AEST)
Received: by mail-lj1-x231.google.com with SMTP id r16so1543686ljk.9
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jun 2021 19:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mW5VuAegEAvRIFuFv4opbLdpRyB9W8DWvBFRNj4fxZo=;
 b=rddGjYVeDP6ejhBwr4GAyQ8CM4LODwlMqLt2vI4oAkerxzUgVv6+wAyKIpEztboXP/
 zJvL0ifBjrhvDows6o9MdmFiD8/qkBG6LcR0k0VZnhcLpUav8TOTPzIOhb2gIGwXII0d
 cHqKxvBSItVSVPEeqZGi5zdyGwl5mu7I5pEzmGU52CpQnvyJ6+aCnBlgC6+P6L3fdb0g
 BHEQT57AoYUkWTN289yfgo0Z0m42KyHANriC3sz05DXaq7hU05Sft0S2wTgyNtD9nxME
 PBhVxJR+RykoU3LhQAjJrgPIbtcT6LHrMPn2FUQ3GJMxX/8ufUil9D3i6h//NqoV+rYY
 xYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mW5VuAegEAvRIFuFv4opbLdpRyB9W8DWvBFRNj4fxZo=;
 b=qwSlIsTSztbV82wtDn/pJO0wvskoOxXSNIMyhPfD3VO1sDt/NNg5RcqItRl77Tn3zP
 Tz+aJcJb0KVCBWfUWCPaE982zPicehgIulpdwzJxnw64lWWMETtemIrFzidGNdU/LsFg
 4EjFBXMLJOevIJL8cKaZa0dgydtHZA8Arxic5ZQH6viyj4z3zMWiUkoFhhHQCSFAR945
 EDiwxAeI3yHBqvIEPsRLm6ztH7cSZrt3bxeYdpMFjibkF2nE0TGK2CBNhRRhd3BV3l8s
 8TiaHsk6kcENTi4INZP2nGvYYu/X6iwqg1ImZd0F/kIXuLllQQGn8yN9Mh4if+FeoW4d
 tq/A==
X-Gm-Message-State: AOAM5302HOZUw+MCubjsHxV5E8Vrc6bECh8E65mxSFBQ8ebCZPIGGimi
 l+agXKQxsyj8TvR+wopsZRPusLfOKUxJQRihC/r9Kw==
X-Google-Smtp-Source: ABdhPJyQOLfoadwBxS7H7AjaDp1cQJTjsANaXyP45XwYHEg6tUz0D2lWfwpKly9Kkj8QK0vvQ211P3bN/WINbFWc5eg=
X-Received: by 2002:a2e:888c:: with SMTP id k12mr2322925lji.185.1623811787665; 
 Tue, 15 Jun 2021 19:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <f8e08249-d0e4-d632-c76b-495b8ce968d2@linux.alibaba.com>
 <3c72ee05-ec56-96ca-55da-6517307cd6a7@linux.alibaba.com>
 <71dfdfc0-1eff-efb6-094c-de71f6f8cc87@linux.alibaba.com>
In-Reply-To: <71dfdfc0-1eff-efb6-094c-de71f6f8cc87@linux.alibaba.com>
From: John Wang <wangzhiqiang.bj@bytedance.com>
Date: Wed, 16 Jun 2021 10:49:36 +0800
Message-ID: <CAH0XSJupSg54T_6qpPPHHBjHcR5OFZ3+VcaGEaP+PR+6F5ny1g@mail.gmail.com>
Subject: Re: [Phishing Risk] [External] Re: Does it make sense to create a
 centralized fan control module?
To: Heyi Guo <guoheyi@linux.alibaba.com>
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
Cc: Zhikui Ren <zhikui.ren@intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 Josh Lehan <krellan@google.com>, Ed Tanous <edtanous@google.com>,
 Patrick Venture <venture@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jun 16, 2021 at 10:02 AM Heyi Guo <guoheyi@linux.alibaba.com> wrote=
:
>
> Hi All,
>
> Any comments for my questions at the top of this thread?
>
> Thanks,
>
> Heyi
>
>
> On 2021/6/11 =E4=B8=8A=E5=8D=889:23, Heyi Guo wrote:
> > Please ignore my early emails; only this one is the final version. I
> > must have misused some shortcut key to send the unfinished versions
> > while I wanted to save it locally...
> >
> > Sorry for the noise.
> >
> > Heyi
> >
> > On 2021/6/11 =E4=B8=8A=E5=8D=889:14, Heyi Guo wrote:
> >> Hi All,
> >>
> >> Right now fan related data like tacho and PWM is fetched in
> >> dbus-sensors, and published to d-bus as sensor data, while fan
> >> control is made in another module like pid-control, which can fetch
> >> data and set value via d-bus.
> >>
> >> In some common sense, we may think about putting all fan related work
> >> into one single module (which may be based on pid-control), i.e. it
> >> can read tacho and PWM from hardware directly, calculate the required

As I understand it, if you just want to bypass dbus and read pwm/tach
directly you can refer to this.
https://github.com/openbmc/openbmc/blob/master/meta-quanta/meta-gsj/recipes=
-phosphor/fans/phosphor-pid-control/config-2ssd.json#L6-L7

> >> PWM by some algorithm like PID, and then write to PWM hardware
> >> directly; the data will also be published to d-bus for other modules
> >> to consume, like fansensor from dbus-sensors.
> >>
> >> Does it make sense to do that? Or is there any reason for the current
> >> design?

I don't know why it's designed this way, but are you experiencing any probl=
ems?
According to our past experience, pid-control reads/writes pwm/tach
quite smoothly,
but pid-control has some trouble reading the temperature of some
sensors via dbus.(eg psusensors).
That's another topic...

> >>
> >> I'm new to OpenBMC and some of my understanding may be totally wrong.
> >>
> >> Looking forward to your expert advice.
> >>
> >> Thanks,
> >>
> >> Heyi
