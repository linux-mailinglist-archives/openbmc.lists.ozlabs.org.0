Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C505A2703D4
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 20:17:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtMWP2yFfzDqvD
	for <lists+openbmc@lfdr.de>; Sat, 19 Sep 2020 04:17:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::332;
 helo=mail-ot1-x332.google.com; envelope-from=benjaminfair@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=gIi/Sumw; dkim-atps=neutral
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtMVK40n9zDqjh
 for <openbmc@lists.ozlabs.org>; Sat, 19 Sep 2020 04:16:35 +1000 (AEST)
Received: by mail-ot1-x332.google.com with SMTP id o6so6254393ota.2
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 11:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sYvDs80r5/PLtAKXuyQDtwxsGntT7Gu50rAljEtNQ/A=;
 b=gIi/Sumw8PiqV4S+ZboNRhorc0Z8O7s2vnO8CIqmVzLvRuA6rgFrWUdc98DkNKuGRk
 7GiNqgtHHs4fLJp4Smlcz48q4/tx6zI0yQ4L9jxsHM0ZkkEf4wfj1HATXRPloIzF3PtU
 hTd/BRD8wCDot7hhvEXnnRamC2aZi5YX847uE1mvaVKdmQubXLwiSjd2jbE98QQLz+LL
 6M1bij7XJKpFTpQUMcrvbgN+BfQFuW5BI7ZSqZX2BKsAoAx6UkvuMfpThyfLhheIePiA
 yg/1HOWDYaLVgcULOayKMKEyftlvrsO4BCcy73BdR1YjwwMNiMUBr0k8VZ7JFU9VIjsQ
 IPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sYvDs80r5/PLtAKXuyQDtwxsGntT7Gu50rAljEtNQ/A=;
 b=HaH+nqPBr7yuvZPWKjqCjormxXrEC5xi59FFKzM7CMxUq6JOmBZ0fYdO/Kgx9wHKAf
 meigx70SL5jYTS1qRYUqW2qDzVYx+Sj2BeubA08acFC+Zna0CRnzhTDsc/yMDelmPj0z
 GTS2Jh84A6NaE6qBTfPtEDAiz7O6nR140iOZy8IzaLbOIy57A669QP3IHYaZx/pl6+nQ
 y2QJEAZJDpfxBTmhfyIi0T11pwF1TKymgwvBTuQLbwfF8zyy9/IQtvSGyjBk76U7A9E9
 UluloQievIbm5fnjXmet/ZnFiFCSHzChgrDbxSXFqQMXqB+gNsoYlBt+DHo6Xvh2t4yH
 T9YQ==
X-Gm-Message-State: AOAM530/8wXQ7odD5q58w4UxEqUlth4cCED5Yy5tLeVhR+O6ix3kWCeL
 RFpdpQ7pB27EOXKZqz0bIB0LBGjwjcE0Y3sJZvdRkQ==
X-Google-Smtp-Source: ABdhPJznbUG+6lNVawoLPsqnxYT229m4oGEpLS8C/yckqFDeAg5k2/Kv0cWgKZzdouJXSmtKMW4pkl04JArrN+5/omQ=
X-Received: by 2002:a05:6830:453:: with SMTP id
 d19mr11043613otc.130.1600452992129; 
 Fri, 18 Sep 2020 11:16:32 -0700 (PDT)
MIME-Version: 1.0
References: <a3919f2a61844f9f89f8e1f8dc0d5972@quantatw.com>
 <CADKL2t5YWsjREnFZ36ZA0ZR4ObOqY-noazEc-+wwVePF9bo8vA@mail.gmail.com>
 <CANPkJS_p9iTJJCue_cSePsgsJ71ztv06XEvEpqe1Y294ne5UYQ@mail.gmail.com>
 <20200917152912.GG6152@heinlein>
 <CADKL2t5npwwBs6ecKAqscJ8=BoakpwDNMjuSiZOSXTkCNcLryA@mail.gmail.com>
 <c2760962bf75625e06c5a85663faff9ef64cecd2.camel@yadro.com>
 <CAO=noty_XW8LmRJ3kc7pzjO5n73=70NDhmFk=25zvvJBfmir8Q@mail.gmail.com>
In-Reply-To: <CAO=noty_XW8LmRJ3kc7pzjO5n73=70NDhmFk=25zvvJBfmir8Q@mail.gmail.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Fri, 18 Sep 2020 11:15:55 -0700
Message-ID: <CADKL2t59XXpo5WoQEpqb3EMk_cE9TSK34-LA0LNrt+_831mVSQ@mail.gmail.com>
Subject: Re: Quanta requests to create a repo in OpenBMC github
To: Patrick Venture <venture@google.com>
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
 Andrei Kartashev <a.kartashev@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 18 Sep 2020 at 08:50, Patrick Venture <venture@google.com> wrote:
>
> On Fri, Sep 18, 2020 at 1:06 AM Andrei Kartashev <a.kartashev@yadro.com> wrote:
> >
> >
> > > This daemon is intended to be used in combination with
> > > phosphor-pid-control. You define a configuration file with two
> > > sections: sensors and zones.
> > >
> > > Sensors have a D-Bus path to read from along with a target
> > > temperature
> > > and some other parameters. The daemon subtracks the current
> > > temperature from the target temperature to get the "margin". A
> > > smaller
> > > margin means the temperature is closer to the limit.
> > >
> > > Zones group sensors together and look for the worst (lowest) margin
> > > value within that group. This value is then exported for use in
> > > phosphor-pid-control.
> >
> >
> > I wonder, isn't phosphor-pid-control do the same by its own? How does
> > it works inside pid-control daemon, when you set several thermal
> > sensors for one Zone an set setpoint for each of them?
>
> Not sure what your question is, but yes, the pid-control daemon can
> host its own margin sensor values that are populated externally,
> however this is only supported via the json configuration at present.

It also doesn't support mixing margin sensors and absolute sensors.

Doing this margin calculation seems separate enough from the core
functions of phosphor-pid-control that I think splitting it out is the
best approach, but I do also see the argument for merging the
functionality into phosphor-pid-control.

>
> >
> >
> > --
> > Best regards,
> > Andrei Kartashev
> >
> >
