Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB369535288
	for <lists+openbmc@lfdr.de>; Thu, 26 May 2022 19:30:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8FM84yPSz3bkw
	for <lists+openbmc@lfdr.de>; Fri, 27 May 2022 03:30:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Cz21w4r9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com; envelope-from=prashantsbemail@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Cz21w4r9;
	dkim-atps=neutral
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8FLj04Y9z304F
	for <openbmc@lists.ozlabs.org>; Fri, 27 May 2022 03:30:03 +1000 (AEST)
Received: by mail-il1-x129.google.com with SMTP id 2so1488876ilg.13
        for <openbmc@lists.ozlabs.org>; Thu, 26 May 2022 10:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N1SjbHslZ86XGmNwLVALLM4MX4sT906OCaciQixF/qs=;
        b=Cz21w4r9NBmFcnFq84uDh5MMuYGD0vwudV103ESsmHvBF1rESrxEH41eNejxzK6i0M
         wwHIIt9MtrO4sJ8Z4QN3JNULaRT3zitFn9NYfKQPf3NApVTpLZ/VDtRAlixKPJlzoVaw
         IPVcNel9MB2fPAvKCG7n78mW13JyC+ZLD23flBmBPLiRofYWzRVszI8IvplvAnUC1SIS
         uAz4Yl8bTKn3rTE4oHkeM8enr08XTS/0fuGYqigRlb/tOxoueksoL6PwXW686kE037vP
         0eHzmuJJjDuL/yvoH7BmkVYKIV2ZdI4bybZXX6PgNXF2iy64XlWrKUPld07ceecG11jJ
         YGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N1SjbHslZ86XGmNwLVALLM4MX4sT906OCaciQixF/qs=;
        b=JblqBhcRqzNkvpDbtpxL/31XyIaSzkYiN+hWN0kmCXEs7lYpereNbmuTM4MANMed2X
         QjOGSeuADk9oo6eJoRokV+VLi6nUX5boww0qodsDRLsXX4nALZk4fl0ge7f/bJfRjJ5F
         QNT82zGK+hSu371W5mZrE+Zka0zWlJ3W9/XVcz8UjNstN58n5+LTIWQ+JsIHi2oQ1Gp4
         WSSvWhsEEJdysl7m0m3fIrrRO1wQPKCRpyP1MrD0QGJzM/LrXvXNNEt5cPTI8MmD87VA
         fwgt3qg2WU1Li+tnBX+1Xpja2YTOQr0fVeA0nkpgO4wZEYHSgU4KVWS5Xta4/a+2a/Me
         qRXg==
X-Gm-Message-State: AOAM530zmYkDQSbvnuT308+3KQUR6i9LUkiyAKolpsvPCWsg5kU5rAUB
	qNq2e1TR+jlRERvw06rpoaFJb0q/04p3GmPFyCcfVNIzrvEpKA==
X-Google-Smtp-Source: ABdhPJwseBTB9mgcmzggvp6VfC9fxoZcVTNrOu2hmdSloTDc9MZ0iZ9WtkU1SPp5GQi3pVxWyu2yuVJVWALklPHqIgc=
X-Received: by 2002:a05:6e02:1d01:b0:2d1:5bd4:c021 with SMTP id
 i1-20020a056e021d0100b002d15bd4c021mr19755258ila.61.1653586199173; Thu, 26
 May 2022 10:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAD5wtF146Axtj5XCDMFY=EEXpDUE3sGRD_76kVyBq8jJ9RQOpQ@mail.gmail.com>
 <Yo4q2fyEkOp8ywDY@heinlein.stwcx.org.github.beta.tailscale.net>
In-Reply-To: <Yo4q2fyEkOp8ywDY@heinlein.stwcx.org.github.beta.tailscale.net>
From: Prashant Badsheshi <prashantsbemail@gmail.com>
Date: Thu, 26 May 2022 22:59:48 +0530
Message-ID: <CAD5wtF1uz5jNnQP+gAMWZyTLiMG6KThs+Pn+pW1WdA26aDQzWw@mail.gmail.com>
Subject: Re: Need help in creating Namespace Journal logging
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="00000000000001e22a05dfed8a88"
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000001e22a05dfed8a88
Content-Type: text/plain; charset="UTF-8"

Hi Patrick Williams,
Yes, I am talking of the same namespace journal, link shared by you.

Probably my next question was if we can use phosphor-logging API
with namespace journal, as per you mentioned below as of now it does not
have that feature with phosphor-logging.

But for now I am trying to add a namespace journal for debug purposes using
sd_journal_send API's. I am finding some issues in doing the same. Can you
please share if you have the steps or any implementation examples to create
namespace journal logs.

Thanks,
Prashant



On Wed, 25 May 2022, 18:41 Patrick Williams, <patrick@stwcx.xyz> wrote:

> On Tue, May 24, 2022 at 11:43:45AM +0530, Prashant Badsheshi wrote:
> > I am working on a yocto based openbmc project, I am trying to add
> namespace
> > journal logging.
>
> Can you elaborate on what "namespace journal logging" is?
>
> If this is what you're talking about, I don't think we've leveraged this
> feature:
>
>
> https://www.freedesktop.org/software/systemd/man/systemd-journald.service.html#Journal%20Namespaces
>
> You'd probably need to propose a design and add support to
> phosphor-logging.
>
> --
> Patrick Williams
>

--00000000000001e22a05dfed8a88
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto"><div>Hi Patrick Williams,</div><div>Yes,=
 I am talking of the same namespace journal, link shared by you.</div><div>=
<br></div><div>Probably my next question was if we can use phosphor-logging=
 API with=C2=A0namespace=C2=A0journal, as per you mentioned below as of now=
 it does not have that feature with phosphor-logging.<br></div><div><br></d=
iv><div>But for now I am trying=C2=A0to add a namespace journal for debug p=
urposes using sd_journal_send API&#39;s. I am finding some issues in doing =
the same. Can you please share if you have the steps or any implementation =
examples to create namespace journal logs.</div><div><br></div><div>Thanks,=
</div><div>Prashant</div><div><br></div><div>=C2=A0<br><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 25 May 2022, 18:41=
 Patrick Williams, &lt;<a href=3D"mailto:patrick@stwcx.xyz" target=3D"_blan=
k">patrick@stwcx.xyz</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>On Tue, May 24, 2022 at 11:43:45AM +0530, Prashant Badsheshi wrote:<br>
&gt; I am working on a yocto based openbmc project, I am trying to add name=
space<br>
&gt; journal logging.<br>
<br>
Can you elaborate on what &quot;namespace journal logging&quot; is?<br>
<br>
If this is what you&#39;re talking about, I don&#39;t think we&#39;ve lever=
aged this<br>
feature:<br>
<br>
=C2=A0 =C2=A0 <a href=3D"https://www.freedesktop.org/software/systemd/man/s=
ystemd-journald.service.html#Journal%20Namespaces" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">https://www.freedesktop.org/software/systemd/man/sy=
stemd-journald.service.html#Journal%20Namespaces</a><br>
<br>
You&#39;d probably need to propose a design and add support to<br>
phosphor-logging.<br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div></div></div>
</div>

--00000000000001e22a05dfed8a88--
