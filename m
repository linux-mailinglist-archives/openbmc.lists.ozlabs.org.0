Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD38027015E
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 17:52:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtJHx2xNrzDqvl
	for <lists+openbmc@lfdr.de>; Sat, 19 Sep 2020 01:52:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::835;
 helo=mail-qt1-x835.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=bPEo5A1N; dkim-atps=neutral
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtJFQ4GHczDqXb
 for <openbmc@lists.ozlabs.org>; Sat, 19 Sep 2020 01:50:07 +1000 (AEST)
Received: by mail-qt1-x835.google.com with SMTP id y11so5364539qtn.9
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 08:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9P0zkB59PQ8JRQCEPmA0f8YDlJV5B9uKqcvMFOHCD9o=;
 b=bPEo5A1NPwR1o7Ki0GnzKJPZzQeh0IyjVn+NYxER3KAhl4eA82gwCUiaqjQy9TA+nR
 hTsCj2XMIQBd9TGsuQyejjhaKfPuPD0SCf/BW9ZRsEc/6+V0ZZM/50qancIBwYM9QCRq
 g2Rw9bpxJYL7JMAjrZrG5ZcM0EsLSGTFBp2FXVj2ACL5fJO4hpLhjWAglHYA+3zVl5Db
 ewNXfDYlASP1zxjjkWpXBvvh8int4MjQUJJANVzDj5OGq7npjOrBaBO2T9TuW4EAlG+s
 Mu2JAfxw1tf37dFhrf68vzv31QyQk5kSIMkA9DFolVfkvTNpJJ4pKraIIlB6CVFwhhrs
 UR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9P0zkB59PQ8JRQCEPmA0f8YDlJV5B9uKqcvMFOHCD9o=;
 b=mpl4XK/6YRkhgRikLd9/pf6hfhI1fYEXcsFmVAOy4ITDyQVk6Uo9FQrzPSKSFpm25H
 NuK1MyXBDdAWWzYKpRJjiCk1wsfucaBs+BlMLfl14lK2httpuED0ng6FFRauRXG4VUXT
 c1nCK6OeDz7hRy4HqFrnwq/PzWfxbOhmYW4gSlnVex/XCLDXTkFyPx9h++crsmVgZnon
 wwHmZEbFKGBEdFhTJHmiDVSRe3veeDKksY9O4oFPux1d7Zclp8wghfRjdHVsNaP7epvV
 V35K40cfUSttcvv4+De3XgSN0wjry/HvLrUB4kUrKzf1E0Ar4tA03MP/POs56Jd3AL/k
 zF9w==
X-Gm-Message-State: AOAM533mlOM3YL1PRFRqmjEBTkJqwqnLSAAMcnBixlKMCqh92YXhxlvK
 OCi+Qh63HvB82ERJdsWexHicB8NRQjiP/W/EzBTUhuIXRdM=
X-Google-Smtp-Source: ABdhPJwF8FfuVarmV/ej7IVzima4h64Bu/CZrvhzkjmZ3iaidoF7ofqcpRx46cXqP6OWkbUSPuzxl9+qmomEflfbWak=
X-Received: by 2002:ac8:4690:: with SMTP id g16mr3960614qto.146.1600444203170; 
 Fri, 18 Sep 2020 08:50:03 -0700 (PDT)
MIME-Version: 1.0
References: <a3919f2a61844f9f89f8e1f8dc0d5972@quantatw.com>
 <CADKL2t5YWsjREnFZ36ZA0ZR4ObOqY-noazEc-+wwVePF9bo8vA@mail.gmail.com>
 <CANPkJS_p9iTJJCue_cSePsgsJ71ztv06XEvEpqe1Y294ne5UYQ@mail.gmail.com>
 <20200917152912.GG6152@heinlein>
 <CADKL2t5npwwBs6ecKAqscJ8=BoakpwDNMjuSiZOSXTkCNcLryA@mail.gmail.com>
 <c2760962bf75625e06c5a85663faff9ef64cecd2.camel@yadro.com>
In-Reply-To: <c2760962bf75625e06c5a85663faff9ef64cecd2.camel@yadro.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 18 Sep 2020 08:49:52 -0700
Message-ID: <CAO=noty_XW8LmRJ3kc7pzjO5n73=70NDhmFk=25zvvJBfmir8Q@mail.gmail.com>
Subject: Re: Quanta requests to create a repo in OpenBMC github
To: Andrei Kartashev <a.kartashev@yadro.com>
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

On Fri, Sep 18, 2020 at 1:06 AM Andrei Kartashev <a.kartashev@yadro.com> wrote:
>
>
> > This daemon is intended to be used in combination with
> > phosphor-pid-control. You define a configuration file with two
> > sections: sensors and zones.
> >
> > Sensors have a D-Bus path to read from along with a target
> > temperature
> > and some other parameters. The daemon subtracks the current
> > temperature from the target temperature to get the "margin". A
> > smaller
> > margin means the temperature is closer to the limit.
> >
> > Zones group sensors together and look for the worst (lowest) margin
> > value within that group. This value is then exported for use in
> > phosphor-pid-control.
>
>
> I wonder, isn't phosphor-pid-control do the same by its own? How does
> it works inside pid-control daemon, when you set several thermal
> sensors for one Zone an set setpoint for each of them?

Not sure what your question is, but yes, the pid-control daemon can
host its own margin sensor values that are populated externally,
however this is only supported via the json configuration at present.

>
>
> --
> Best regards,
> Andrei Kartashev
>
>
