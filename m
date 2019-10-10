Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2256AD306E
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 20:33:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46q0876dlHzDqRd
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2019 05:33:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=rhanley@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="gUqtc4Lx"; 
 dkim-atps=neutral
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46q07R1CsxzDq96
 for <openbmc@lists.ozlabs.org>; Fri, 11 Oct 2019 05:32:26 +1100 (AEDT)
Received: by mail-lj1-x232.google.com with SMTP id v24so7252689ljj.3
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 11:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8tlnI3cdJ38o07piP0FmAimGcbekSuyBide0w+Reo8U=;
 b=gUqtc4Lx2Y4Nc/StvQiTjYotAPgSrCFA8RmpBVq8E4usSS+Hz0lm900ib2a7GS7BzV
 tKaQ9OUb7Sm8EhHm+sY+3M4ZqDKxuZJcZ6TcvCyM0kMJuQPyfkd5i0XY0VfervINingV
 p2MzHtsTWOLTTenacus3uvWWt6pTq1Cjq9Gy6LutTpXa0W41NEn1n8TW/2YeLplrbZQA
 MzAamTBl4ATP5cE0x3h77hBDd072PjOcJMznORBS1QCYJlHxz8+NrfWXpKvNRl4O01Iu
 Yj3dajxhOEI1Oiar7iX2orkzy19lVA/fQ0mefU7EAhx1CILFd7OKjDTuTOJQpJbBvQpI
 iD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8tlnI3cdJ38o07piP0FmAimGcbekSuyBide0w+Reo8U=;
 b=UTgYQKaTVH77otN+M6kGqnM7WIMPRtc88CnjckyQCtA0Zd/bjReULLyvws/HiN+wSd
 kEEdEGMcSY2kgrUBbWk/XqUbBsU0kb+uDSxnSTWzALATSYvruWXX6ypcwXY3KN/D4KkM
 YKSlyCfmobMZfb+4kjrAPlzgnwQpzwcNQgprM1ZJiiNU5lh9vQgfoKQF2tCEPII8Sje2
 mqlm/vHsd9g/vdjHKB4waxoG+gDZ1pDdszJCj6WKFWtpcMTEjvkOP56Mto9gUIYOt++X
 h+KjTqMoa5GsiJ+R9Q1QLKOV9fvzEsXOCsptHNyAt/1KdG7pAypmxKmXp4gFJkri0gir
 AOpA==
X-Gm-Message-State: APjAAAUoGI40RJB4nDPefkM9zPJnCvUrZzbZimElZYjcKmq+eu21Hww0
 OzqnL0sI6TT4p4z1evfShXq+BrLbK67wxnQtTW7N8g==
X-Google-Smtp-Source: APXvYqwrsqYGAlnkCBCcd4/3opwUcSIdI+0Fv31Pnc7QSqEHjmyaULqW1RxcWEDXYrEthTP4lpIAEDGQ8KO3oFGGBrA=
X-Received: by 2002:a2e:81cf:: with SMTP id s15mr6232023ljg.99.1570732341782; 
 Thu, 10 Oct 2019 11:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <CADfYTpG_Sy4_jNGqZTJKx1Tyivsu+SpBpWy=vNSH7L=Z0PXAEQ@mail.gmail.com>
 <2F98B4CC-2C61-4AF7-B41A-897C9BA4E32F@fuzziesquirrel.com>
 <CADfYTpEut49XPWs+Ahz5dsRgayLkHToRh-6btHeqbaSR3wnK2A@mail.gmail.com>
 <0b5a46e8-748b-faa0-59fd-c548810c9b12@intel.com>
In-Reply-To: <0b5a46e8-748b-faa0-59fd-c548810c9b12@intel.com>
From: Richard Hanley <rhanley@google.com>
Date: Thu, 10 Oct 2019 11:32:10 -0700
Message-ID: <CAH1kD+Z5qJ=tDV76MtAE6bgF8yCq-RYSz8y9jgnOV_SSUTF79g@mail.gmail.com>
Subject: Re: Redfish Aggregator
To: Ed Tanous <ed.tanous@intel.com>
Content-Type: multipart/alternative; boundary="00000000000045364e0594929fc8"
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

--00000000000045364e0594929fc8
Content-Type: text/plain; charset="UTF-8"

Thank you Ed.  I will take a look a look at that fork.

On Thu, Oct 10, 2019 at 11:09 AM Ed Tanous <ed.tanous@intel.com> wrote:

> On 10/10/19 10:09 AM, Nancy Yuen wrote:
> > Thanks Brad!  We are envisioning aggregating the separate Redfish stacks
> > to present a single unified system view.  There is another slide deck of
> > Redfish Aggregator requirement uploaded to DMTF a few days ago with a
> > slightly different idea of aggregation (it sounds more like batching,
> > the aggregator will send a reboot or a fw update, to a bunch of redfish
> > stacks on multiple systems).
> >
>
> You might want to look at this bmcweb fork that Inspur built for exactly
> this.
> https://github.com/inspur-bmc/rmcweb
>
>
> It wasn't built the way I would've recommend it be built, and a lot of
> it is relying on fake data, but it's a reasonable example of wiping out
> all the bmcweb Redfish endpoints and replacing them with aggregator
> ones, without having to modify the core.
>

--00000000000045364e0594929fc8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you Ed.=C2=A0 I will take a look a look at that fork=
.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Thu, Oct 10, 2019 at 11:09 AM Ed Tanous &lt;<a href=3D"mailto:ed.tanous=
@intel.com">ed.tanous@intel.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On 10/10/19 10:09 AM, Nancy Yuen wrote:<br=
>
&gt; Thanks Brad!=C2=A0 We are envisioning aggregating the separate Redfish=
 stacks<br>
&gt; to present a single unified system view.=C2=A0 There is another slide =
deck of<br>
&gt; Redfish Aggregator requirement uploaded to DMTF a few days ago with a<=
br>
&gt; slightly different idea of aggregation (it sounds more like batching,<=
br>
&gt; the aggregator will send a reboot or a fw update, to a bunch of redfis=
h<br>
&gt; stacks on multiple systems).<br>
&gt; <br>
<br>
You might want to look at this bmcweb fork that Inspur built for exactly<br=
>
this.<br>
<a href=3D"https://github.com/inspur-bmc/rmcweb" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/inspur-bmc/rmcweb</a><br>
<br>
<br>
It wasn&#39;t built the way I would&#39;ve recommend it be built, and a lot=
 of<br>
it is relying on fake data, but it&#39;s a reasonable example of wiping out=
<br>
all the bmcweb Redfish endpoints and replacing them with aggregator<br>
ones, without having to modify the core.<br>
</blockquote></div>

--00000000000045364e0594929fc8--
