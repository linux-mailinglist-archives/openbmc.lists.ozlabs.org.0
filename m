Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5350E40C6CC
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 15:55:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8hYv1zDYz2yQy
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 23:55:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ORN70U8Y;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=ORN70U8Y; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8hYV4pm0z2xg6
 for <openbmc@lists.ozlabs.org>; Wed, 15 Sep 2021 23:55:08 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id t10so659050lfd.8
 for <openbmc@lists.ozlabs.org>; Wed, 15 Sep 2021 06:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9DffDoV6ze1SdqQU0z1GeMEHP6J8NIZdOdgdfB8ankI=;
 b=ORN70U8YUPUnxvJ55GDnb665PZnEwDRM3+F+k4nMHbbCsXosW0lN+xQcByRO5v71j9
 a01PwFfW7gP1WmSynxnt7Uae4di5Uv8G14Byxh3sESUH4QnZoNCejw2zgaTdlH2Uo2Wq
 mRqgsfsb/nKxKCbrERkQV3crYYEkQplYAIULQYeqgg+tusMwKBZTEd9m/3r9LsUVAM1a
 jxmQP0tYYyHWc8Y7mp8012h/cY/glcSNIXar34hohA9n51qodu5Fs/WKTjGqWztcrt89
 UuxvtBz0Cdu/thaMTsAn07WE15VQ4V/rEh58Hci8ZmU2JGZPmqx30FMg33nWV2pwUTC/
 4wjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9DffDoV6ze1SdqQU0z1GeMEHP6J8NIZdOdgdfB8ankI=;
 b=LbXLUYal/5yA23kK4a20U8WgiZ7UWIqGh2EXTizspzBK1EklAbuvRX/EFUnZqdwqet
 pAzNIVC+C9+Xdpz+SvWX5bDG/RHnYNIpCwkuBfmQi0ZLtMUTChf40p6VsYjqh5HtDVzj
 ihd3Iq3DqmD4Pbtq+4HguL5pdJRY8neVP6i6pija6pPdys5WUdShkDxabw2RW1ZTyLoD
 X8XoGcAjST1he+YftbXWDf5KeJzMridRplMCOIMIQ48HVcVwqe9KRLiBWJ3bIMJ0BTgQ
 8KWkGyAvLYNZFvYgc80IQ8m61DA6rR7ZxyA1UZDmTYXE8Ce1RbyZdg8mo8oPBhuRCuz7
 qidQ==
X-Gm-Message-State: AOAM531WMWBD8jKvQzJonbYiD8P3n6YbpnZ7/l0dIBrt0Sf+pyc+hbLx
 rdG9JwfDfIAtlAusRTIhGB8abD7zQPJ1+FlRuORzXA==
X-Google-Smtp-Source: ABdhPJyzg+7h/7B1DlpmLX0H3NJSOYzSV3MirpSWE8sJt1DzzqxGMRXaRcwUB/LR3otLs2DsEhwJxPlLeETAhyZLBKo=
X-Received: by 2002:a05:6512:1194:: with SMTP id
 g20mr43083lfr.206.1631714103545; 
 Wed, 15 Sep 2021 06:55:03 -0700 (PDT)
MIME-Version: 1.0
References: <3a702375-de87-985d-d096-7f187d293459@linux.alibaba.com>
 <2416388c-73fe-f4fd-8c1c-c98f9c93230c@intel.com>
 <1405025a-fbd8-f350-ae12-5bf94671ff87@linux.alibaba.com>
In-Reply-To: <1405025a-fbd8-f350-ae12-5bf94671ff87@linux.alibaba.com>
From: Oskar Senft <osk@google.com>
Date: Wed, 15 Sep 2021 09:54:47 -0400
Message-ID: <CABoTLcTznKtVLT1LdXKiGRO0Gnov=kSJfTDTe2bfeVGHCRdPHw@mail.gmail.com>
Subject: Re: [Question] How can we use underscore "_" in sensor name?
To: Heyi Guo <guoheyi@linux.alibaba.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
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
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 Tom Joseph <rushtotom@gmail.com>, "Puli,
 Apparao" <apparao.puli@linux.intel.com>,
 Johnathan Mantey <johnathanx.mantey@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

+1 to using something more explicit, like %20 instead of "_" for
replacing " " for D-bus names.

We're facing the same problem where "_" in sensor names from D-bus get
unconditionally replaced with " " in dbus-sensors. This is currently
preventing us from "converting" an older platform to Entity Manager.

Oskar.

On Wed, Sep 15, 2021 at 12:58 AM Heyi Guo <guoheyi@linux.alibaba.com> wrote=
:
>
> Hi Johnathan,
>
> The code in dbus-sensors will translate sensor name by replacing space "
> " to "_", e.g. ADCSensor.cpp:
>
> 53     Sensor(boost::replace_all_copy(sensorName, " ", "_"),
>
> Then in phosphor-ipmi-host dbus-sdr/sensorcommands.cpp, it will try to
> revert "_" back to " ":
>
>   419     std::replace(name.begin(), name.end(), '_', ' ');
>
> The first conversion does nothing for our case, but the 2nd conversion
> will unconditionally convert "_" to space " ".
>
> If we don't really forbid to use "_" in sensor names, I think we'd
> better replace space " " with %20 in dbus-sensors, and convert %20 back
> to " " in ipmi-host.
>
> Thanks,
>
> Heyi
>
> On 2021/9/13 =E4=B8=8B=E5=8D=8810:57, Johnathan Mantey wrote:
> > Heyi,
> >
> > On 9/13/21 3:49 AM, Heyi Guo wrote:
> >> Hi all,
> >>
> >> Can we use underscore "_" in IPMI sensor names? Now we see that "_"
> >> in sensor names will be replaced with space in the code, even if we
> >> really use "_" for sensor names in json configuration files.
> >>
> >
> > Which layer is translating the "_" char?
> > Are you referring to D-Bus?
> > IPMITool?
> > Some other locatioN?
> >
> > It would be helpful to know.
> > As an example, D-Bus translates "-" to "%2D" and back because D-Bus,
> > or one of the D-Bus consumers can't accept the hyphen character.
> >
> > It is likely that the underscore character has some similar naming
> > convention issue.
> >
> > You may want to investigate using the same scheme to translate between
> > "_" and a "%5F" combination.
> >
> >> The background is that we used underscore "_" in sensor names in
> >> legacy BMC, and all the OOB software uses such names to get sensor
> >> data. Therefore we want to make it compatible for switching to OpenBMC=
.
> >>
> >> Is there any way to achieve this?
> >>
> >> Thanks,
> >>
> >> Heyi
> >>
> >
