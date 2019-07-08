Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E60162B26
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2019 23:38:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jJj5000YzDqQD
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2019 07:38:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="mEyE9wtd"; 
 dkim-atps=neutral
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jJhb1pM1zDqMw
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jul 2019 07:37:49 +1000 (AEST)
Received: by mail-io1-xd35.google.com with SMTP id s7so38635689iob.11
 for <openbmc@lists.ozlabs.org>; Mon, 08 Jul 2019 14:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZtVgLZ722UlAZpGzytER+AhBpJj6VuAHvgjtoQcszHc=;
 b=mEyE9wtd7a++i0LP77jVHxRx5eEcAzAJIcOrGzfjGnSxyqFdDJU72eGSIUDTSsjjf9
 puSR3oPAHRF2rfcmNQz350CucE5wQMvgNrrgHUMqDvWbtWtXUN5SZIBCR4a6V8HfEsNK
 F/xqtnEVf362iSKurk9JtWa4DWDK7hOHzuSSWN/0Nxs2CQJ1pUz979MQIoljczjFAI2U
 k8ZtdLgzwNgO8XBMSVQ94pJX1dy2B/LKx0AU8TU6qjPqTHqWiazyjahuVw345tLMxKzm
 J0rh92tGZKcTV6mKDV1z42yQPiaR8RTj10wQrF3YB8KxIJ2TAUYb5NCE1JbLeTRh3FpO
 I78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZtVgLZ722UlAZpGzytER+AhBpJj6VuAHvgjtoQcszHc=;
 b=HAHPx6IYzYBwWQmknyNXzzXNiy2PWbHl87h01BjQV4V02YPs9XkKin1GkA1LQuzUfW
 W3+rU7zaZGFS5PjfSomKhIX6Ex0Drx1nnX9QTS5BPCdot9QjDWUtCY0ips6XtruZ7wno
 003AOiyw5wfQVL9UjtpVc57ruU5O4Q5wJrlEJSOTmQfAbbD1l8IAZ5yT0eaAqlgwnI4W
 YxTyhJ81/RxM0Zmkx3b1DA23Mjhh59l8kcjJ2ZI7zghsbhtYj4BhMPnnTZ4jesNiVME5
 rQpqjLuiloVIKijS90uQJYE5Gp1U+bQVTajbLKKzDfyNA+ZoMOD1q2Y8qq88ztB77d/3
 bDbw==
X-Gm-Message-State: APjAAAUKfEUnFtjY9fB6f3ep/ZZ1TVH7913/nEHKo2ffcfoHV7n5CPK0
 UQk6JFUFHliJdJndlYySGwtly7+ZcCAc9bO9nvjMMWD9CQU=
X-Google-Smtp-Source: APXvYqzzIdlGtK3XisDw/WssxGqp0TtedNs7LuHhfU00Iq+fkA0Tp6Hwfgfl0YIGiCBke2leJbgjDC3kdhpZowDRrZQ=
X-Received: by 2002:a02:bb08:: with SMTP id y8mr23712115jan.51.1562621866099; 
 Mon, 08 Jul 2019 14:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <CADfYTpEZ7KZ5gUk0VPQ9xJxtNg0ZY6npPE-y=Qfhhrjf1Nd3Nw@mail.gmail.com>
 <4d82f790-d1f3-5251-e573-fc4d8d9701b3@linux.vnet.ibm.com>
In-Reply-To: <4d82f790-d1f3-5251-e573-fc4d8d9701b3@linux.vnet.ibm.com>
From: Nancy Yuen <yuenn@google.com>
Date: Mon, 8 Jul 2019 14:37:08 -0700
Message-ID: <CADfYTpEBCOA5GueC8y_QMZvHODdHRxWfYRHZ8Av_xLDSkTk-FQ@mail.gmail.com>
Subject: Re: Deadline for OSFC OpenBMC Hackathon talks submission
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000003fa765058d3241f7"
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

--0000000000003fa765058d3241f7
Content-Type: text/plain; charset="UTF-8"

The organizers are being strict keeping the day 1 and 2 presentations
scheduled ahead of time.  We'll see how we're doing for time on our track
once the submitted talks are reviewed.

----------
Nancy


On Wed, Jul 3, 2019 at 11:30 PM Deepak Kodihalli <
dkodihal@linux.vnet.ibm.com> wrote:

> On 29/06/19 5:04 AM, Nancy Yuen wrote:
> > Gentle ping.  OSFC OpenBMC call for presentations deadline is June 30!
> >
> > Please consider submitting a presentation for the first two days of the
> > OFSC OpenBMC track.  There are submissions for days 3 and 4 but there's
> > room for presenters on days 1 and 2.
>
> Can we move the day 3 and 4 presentations to the first two days if we
> don't have enough presenters in the OpenBMC track for the first two
> days? That way we can have more time for hacking on the last 2 days. I
> have submitted a paper on PLDM for the last 2 days as well (I thought
> the content was short so it suited a lightning talk more).
>
> Regards,
> Deepak
>
>
>

--0000000000003fa765058d3241f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The organizers are being strict keeping the day 1 and 2 pr=
esentations scheduled ahead of time.=C2=A0 We&#39;ll see how we&#39;re doin=
g for time on our track once the submitted talks are reviewed.<div><br clea=
r=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D=
"gmail_signature">----------<br>Nancy</div></div><br></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 3, 2=
019 at 11:30 PM Deepak Kodihalli &lt;<a href=3D"mailto:dkodihal@linux.vnet.=
ibm.com">dkodihal@linux.vnet.ibm.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On 29/06/19 5:04 AM, Nancy Yuen wrote:<=
br>
&gt; Gentle ping.=C2=A0 OSFC OpenBMC call for presentations deadline is Jun=
e 30!<br>
&gt; <br>
&gt; Please consider submitting a presentation for the first two days of th=
e <br>
&gt; OFSC OpenBMC track.=C2=A0 There are submissions for days 3 and 4 but t=
here&#39;s <br>
&gt; room for presenters on days 1 and 2.<br>
<br>
Can we move the day 3 and 4 presentations to the first two days if we <br>
don&#39;t have enough presenters in the OpenBMC track for the first two <br=
>
days? That way we can have more time for hacking on the last 2 days. I <br>
have submitted a paper on PLDM for the last 2 days as well (I thought <br>
the content was short so it suited a lightning talk more).<br>
<br>
Regards,<br>
Deepak<br>
<br>
<br>
</blockquote></div>

--0000000000003fa765058d3241f7--
