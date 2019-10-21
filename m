Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41061DF703
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2019 22:50:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xpgH27mSzDqKb
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 07:50:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::92c;
 helo=mail-ua1-x92c.google.com; envelope-from=yuenn@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="qPqOM9SR"; 
 dkim-atps=neutral
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xpfZ4dhSzDqF3
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 07:49:41 +1100 (AEDT)
Received: by mail-ua1-x92c.google.com with SMTP id m21so4224421ual.13
 for <openbmc@lists.ozlabs.org>; Mon, 21 Oct 2019 13:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F1e2BlyDf+hPgELU3c5g8k1riiWii7+I5De0rrbIChg=;
 b=qPqOM9SRSaEXncbYhw3e0ms7Iyo4MZhYkEFUEyhtpHYsp5g3Mc+jJzTFBA/7yPvGog
 6l08dXKf8FrpAdbEidkfb90kRt/6ZBCgPz5GGXK9VZd8tZ6TEjhuiJa0FIynnbwv72b2
 vuaCFhSccSpy+cDHqlLlMcNtO+AfoEHqtJtiLcCo3QMMqlAzJd0aiyond3UgfgnCPSUB
 qe7KYrAk4H+YFvoNsIheau89+hZECKbNitIfqy650414dn1BqOfN5Je85JWL5PlETKuA
 Gl8VWsCTa6pt8FE5evf104gCWe17DvTkbCN5UuXG4jLolOsKYrOnDohkeFy4NRvgvuSY
 egrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F1e2BlyDf+hPgELU3c5g8k1riiWii7+I5De0rrbIChg=;
 b=BL1cTGZFDeRqsziUSf6GIeCcR5QFcvjvDQKqcGQ0WcWLD/iUjASfeAQ6d1uO7a+dDr
 sA/1Vba9uElfxlzoOcS6I+r3Xb3he5/LSWPwqmmb62gIqDGzSbDnW7C6iLc/hQwLeypR
 8spe7THvetnwcJEvEqzM7bmrOxyoV5/c/Zvf2iRCicmrm1+Dk0kDKNDE1+H0VlvUYz7g
 PB8WeNJtEjKEyv6bM53TQ64tiLFx7KxUnn6mTgH9EsCTyJZ0qdqAiiBmZ0RZrxPGtp/4
 tEFyojm8gO2vC4XA0Y6G0opCq5bVcCl12lfi3REdgsKKfOD+iMBtptmn4D+8bH5SAHg9
 WvNQ==
X-Gm-Message-State: APjAAAX2K8WVAU0h87jwq2nUMuPDc2pHlAx0rG/8LE5R3HbXfBhFnFQf
 iJNoJEDX2GhamcQtNWDRme1fmOTv4bYwDcKWAUpbtg==
X-Google-Smtp-Source: APXvYqzHqX/bWz++ootsbltBXgVo5H3WZxGUEUIjycGe8N3NZ1xHZxiBLUJ5Z7CO/mMMpoUxZgnEhjpLXIqnvhwGzkw=
X-Received: by 2002:ab0:7304:: with SMTP id v4mr96335uao.0.1571690977944; Mon,
 21 Oct 2019 13:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <27c9e9df-6d1f-5fce-ed88-57d9cbfa71f9@intel.com>
 <CAO=notz3bML97-cS42Y9J2t-7eFdXpeMj0kBoCUeRBt8--wS1A@mail.gmail.com>
In-Reply-To: <CAO=notz3bML97-cS42Y9J2t-7eFdXpeMj0kBoCUeRBt8--wS1A@mail.gmail.com>
From: Nancy Yuen <yuenn@google.com>
Date: Mon, 21 Oct 2019 13:49:01 -0700
Message-ID: <CADfYTpFti3aGjnWY4C7AYp64tWmMT_TSY3SGJgxJyhCjC-4KGw@mail.gmail.com>
Subject: Re: It's been fun
To: Patrick Venture <venture@google.com>
Content-Type: multipart/alternative; boundary="000000000000704bab059571d24e"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed.tanous@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000704bab059571d24e
Content-Type: text/plain; charset="UTF-8"

Good luck Ed!
----------
Nancy


On Mon, Oct 21, 2019 at 1:41 PM Patrick Venture <venture@google.com> wrote:

> On Mon, Oct 21, 2019 at 1:34 PM Ed Tanous <ed.tanous@intel.com> wrote:
> >
> > All,
> >
> > This week will be my last week at Intel.  I'll be moving onto something
> > else non-OpenBMC related for a bit;  While I may check in on the project
> > from time to time, it's going to stop being my day job.
> >
> > You'll still be able to reach me at my other email, ed@tanous.net, and
> > several key people across the project including the TSC have my cell
> > number if there's some unknown OpenBMC "emergency", but I doubt that's
> > going to be needed.  Functionally, I've made sure that every repo I
> > maintain has backup maintainers, so as of the 25th, it will fall to
> > those individuals to do new reviews for those individual repos.  I'll be
> > pushing updates to the MAINTAINERS files shortly to that effect.
> >
> > Thanks you for all the patches, ideas, reviews, and merges that others
> > have done for me over the last couple years.
>
> It's been swell, good luck!
>
> >
> > Until we meet again,
> >
> > -Ed
>

--000000000000704bab059571d24e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Good luck Ed!<br clear=3D"all"><div><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">----------<br>Nancy=
</div></div><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Oct 21, 2019 at 1:41 PM Patrick Venture &lt;<a href=
=3D"mailto:venture@google.com">venture@google.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Oct 21, 2019 at 1:=
34 PM Ed Tanous &lt;<a href=3D"mailto:ed.tanous@intel.com" target=3D"_blank=
">ed.tanous@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; All,<br>
&gt;<br>
&gt; This week will be my last week at Intel.=C2=A0 I&#39;ll be moving onto=
 something<br>
&gt; else non-OpenBMC related for a bit;=C2=A0 While I may check in on the =
project<br>
&gt; from time to time, it&#39;s going to stop being my day job.<br>
&gt;<br>
&gt; You&#39;ll still be able to reach me at my other email, <a href=3D"mai=
lto:ed@tanous.net" target=3D"_blank">ed@tanous.net</a>, and<br>
&gt; several key people across the project including the TSC have my cell<b=
r>
&gt; number if there&#39;s some unknown OpenBMC &quot;emergency&quot;, but =
I doubt that&#39;s<br>
&gt; going to be needed.=C2=A0 Functionally, I&#39;ve made sure that every =
repo I<br>
&gt; maintain has backup maintainers, so as of the 25th, it will fall to<br=
>
&gt; those individuals to do new reviews for those individual repos.=C2=A0 =
I&#39;ll be<br>
&gt; pushing updates to the MAINTAINERS files shortly to that effect.<br>
&gt;<br>
&gt; Thanks you for all the patches, ideas, reviews, and merges that others=
<br>
&gt; have done for me over the last couple years.<br>
<br>
It&#39;s been swell, good luck!<br>
<br>
&gt;<br>
&gt; Until we meet again,<br>
&gt;<br>
&gt; -Ed<br>
</blockquote></div>

--000000000000704bab059571d24e--
