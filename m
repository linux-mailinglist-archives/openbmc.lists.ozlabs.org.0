Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C473077C1
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 15:17:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRMxv5ywgzDrdk
	for <lists+openbmc@lfdr.de>; Fri, 29 Jan 2021 01:17:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::131;
 helo=mail-lf1-x131.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=jgQbzDNB; dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRMwf6NwszDrTs
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2021 01:16:40 +1100 (AEDT)
Received: by mail-lf1-x131.google.com with SMTP id q8so7760172lfm.10
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 06:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mE0h3CQLYHz3Iqg8HJAIvVRxXEpiLNQqMUIL6Br57OU=;
 b=jgQbzDNB1R87TghlAQ89/rgD6yoS0RAHkPTZ0KHkgf0/jkYP7lD+5q9D9Vi3/RaXMo
 oqpghTgfhpffcQ2nByI+bf+JH6Ky2/5sPhHiKFYrgL9BfIhucR8SJTPEI95rHO+RX2rP
 WV0Kh1s+IhPtGrzMxZbLLiid7mfCitEg0KFas4pv8DfnZktiUtWNNsdIXS4sAbHXWUwA
 wP5NiMEiJvKR558rYqWgGD22OUQs1wFd2rfQwsjajD5oWg+MWluvOQL2Cq1mFGVF3Tok
 D2te0sQTlUuDD0WmhykjDCewE39DTdx3/SN3LPWwAa0cbb47QQIjQ7aS2bAwlLBnjO8C
 Z7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mE0h3CQLYHz3Iqg8HJAIvVRxXEpiLNQqMUIL6Br57OU=;
 b=M+EU2g2EEttP6aMzRTruNptDjAggSNUNHFKao2V0fOi0eK52ronKD8wQ7M+qiPXk3i
 D1CMwxJ6R0om0+kDuZgNsLa1COVHrRUtlbjRg49YUcmCq2LygVoIiiWMq31Y4M77Hp1y
 v7tlt6P6wAlglu6fP5y+CQJn3hSbSdSeYAK5n+5VF+5BpjsbiJaUUErkmeMx2NhkKIOr
 zMe+lK8u/bg/1ntL1iZDiyl1H2NOMgBVlYi6j3oyV8ab+EN0yAzdOKYyksuHC4YazZsa
 Kp7bSLQwjup4YmKBm6TWXWgDGCE2GWCviR8545wIdPTzdx832t8ZyBL6hPUEJ26FtRnD
 dfng==
X-Gm-Message-State: AOAM532PiPJDONCu8m212qZgCMYDYMa1/uvuVS/yT3ctSf+iGfv+gLuN
 6qPPwaPSRl3vQRPzV+Pp9eFx4r168+ujfsMrsHsMww==
X-Google-Smtp-Source: ABdhPJwWbx+V1rV0mW7tIqW2OUSBva7msvG0yYDn7vaRMTn9E99kCDGSJ/ki9oLtW5G3ajT2b6nD+WUXLYSTiaoyO6U=
X-Received: by 2002:a19:844e:: with SMTP id g75mr7641546lfd.629.1611843395316; 
 Thu, 28 Jan 2021 06:16:35 -0800 (PST)
MIME-Version: 1.0
References: <CADfYTpENhwh+o9fYhNbtDP7RZFP=C5A5gi100TZuO5NpXdK1Uw@mail.gmail.com>
 <20210128010650.pvafu52hayv5rfvw@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20210128010650.pvafu52hayv5rfvw@thinkpad.fuzziesquirrel.com>
From: Oskar Senft <osk@google.com>
Date: Thu, 28 Jan 2021 09:16:18 -0500
Message-ID: <CABoTLcQMu3LjNokrP+kaotM1TBJxUw8GN_CHV4i7-Fd-ShmmCA@mail.gmail.com>
Subject: Re: request repo meta-tyan
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/alternative; boundary="000000000000033ed305b9f689b4"
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

--000000000000033ed305b9f689b4
Content-Type: text/plain; charset="UTF-8"

Excellent, thank you!

I'm working on a v1 of meta-tyan right now:
https://github.com/osenft/openbmc/tree/tyan-dunfell

It's currently based on dunfell instead of head and still using kernel 5.2.

I'll send a PR when it's "ready" (i.e. HEAD and kernel 5.8).

Oskar.

On Wed, Jan 27, 2021 at 9:00 PM Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

> On Fri, Jan 22, 2021 at 04:02:02PM -0800, Nancy Yuen wrote:
> >We are bringing up some Tyan machines using OpenBMC request the creation
> of
> >a meta-tyan repo.
>
> Hi Nancy
>
> With the owners plugin fully deployed and operational you should be able
> to submit a new meta-tyan to openbmc/openbmc.  Let us know if there are
> any problems there.
>
> thx - brad
>

--000000000000033ed305b9f689b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Excellent, thank you!<div><br></div><div>I&#39;m working o=
n a v1 of meta-tyan right now:=C2=A0<a href=3D"https://github.com/osenft/op=
enbmc/tree/tyan-dunfell">https://github.com/osenft/openbmc/tree/tyan-dunfel=
l</a></div><div><br></div><div></div><div>It&#39;s currently based on=C2=A0=
dunfell instead of head and still using kernel 5.2.</div><div><br></div><di=
v>I&#39;ll send a PR when it&#39;s &quot;ready&quot; (i.e. HEAD and kernel =
5.8).<br></div><div><br></div><div>Oskar.</div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 27, 2021 at 9:00=
 PM Brad Bishop &lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.com">bradleyb=
@fuzziesquirrel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Fri, Jan 22, 2021 at 04:02:02PM -0800, Nancy Yuen wro=
te:<br>
&gt;We are bringing up some Tyan machines using OpenBMC request the creatio=
n of<br>
&gt;a meta-tyan repo.<br>
<br>
Hi Nancy<br>
<br>
With the owners plugin fully deployed and operational you should be able <b=
r>
to submit a new meta-tyan to openbmc/openbmc.=C2=A0 Let us know if there ar=
e <br>
any problems there.<br>
<br>
thx - brad<br>
</blockquote></div>

--000000000000033ed305b9f689b4--
