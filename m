Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F2DE3B58
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 20:52:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zbwG73YszDqTG
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 05:52:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2d;
 helo=mail-io1-xd2d.google.com; envelope-from=kunyi@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="OlxUj0/y"; 
 dkim-atps=neutral
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zZ344PknzDqWr
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 04:28:32 +1100 (AEDT)
Received: by mail-io1-xd2d.google.com with SMTP id c25so30419791iot.12
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 10:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XH4nucNNM/sqhnYvwOj5e++yAaAUuqqSTsWCqNoMVbs=;
 b=OlxUj0/ysn2+4R9NSZl+1v+59zJtklWcn5PniHnTXphzZ9KYJT2qEJDdWHlyItgHqS
 9uhzLHknhox7xRwFKwshr8aJTuhIyv+8SSGRw1cLpL9h+c7Hr6gJuWMQRpLRz+HZEggV
 MTLun3DC2SpbE73ZwqkJLDM3eniub66Mx5F8W8rgCCUSMRZ6OZy89UDj7g8Zkf560S8v
 uRznSVyqHU+V+NgEYkS0Z1Uchrld3L4uIGLjoARzld9fkNxSC7QavuJ1WFLs69WDjfyi
 DJBDYrrDOvVMgQqUjqJ9Y0j3mUSs/iWGF8W6h0jQYsOJSRS0advWAUBzUBlW+6GKDiXd
 8tkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XH4nucNNM/sqhnYvwOj5e++yAaAUuqqSTsWCqNoMVbs=;
 b=hUOsbiN1XuG2l2KEouYBeQNKUPE7J2fvoWxltLIcOzCl10qpb7qE/ZxnLsekSuBBr7
 CIYTwO/JoSUM2K7kCJcxhmZy26z00rqiOJkUjfp14SWvb6Go5M3MbH2HiCD4FKiU6vp5
 oUH7h1TjxqAxz3HcKCwDqOhUAcdj3h5zmlhl74G8fRkYZh/Hbzqul8rB/W7lOgDPhwjP
 ++bvxJNxC1CAgi+V8rH51URur1qZI98SrM497k/bj5gmxhyKTNteO/K/0bndrewEeWg9
 VsuGc5btMbTlqo9nI3xXxO39uS1ykVTCqK3pJJjyzulq06sKr5sbrZZQOZ9jPh07DMDs
 dj8g==
X-Gm-Message-State: APjAAAUrKmCcJ65gXN6LvjMZAXrtH4j7+ONDAXnc2UjTHy+4MkAAN3FF
 s3IP8/T0ldf6f1y81NDDIxIAaSzdyTXUzBMABklu2A==
X-Google-Smtp-Source: APXvYqxgKsB1kmy7HvWsxf0orGtYRnXzUQ/rlLdDISZZzlxeGHpY3Bixx+gdORbI1VXHIbYQ4ibrXQst1mevePJWZrg=
X-Received: by 2002:a02:2204:: with SMTP id o4mr10860980jao.108.1571938109199; 
 Thu, 24 Oct 2019 10:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <27c9e9df-6d1f-5fce-ed88-57d9cbfa71f9@intel.com>
 <a3cff63f-2001-7b81-6fec-5c7c8962b1b5@linux.vnet.ibm.com>
In-Reply-To: <a3cff63f-2001-7b81-6fec-5c7c8962b1b5@linux.vnet.ibm.com>
From: Kun Yi <kunyi@google.com>
Date: Thu, 24 Oct 2019 10:28:02 -0700
Message-ID: <CAGMNF6WOaKrVYTHH2=Ky2Py+1jwXLpiz1MfkN4DP134eq20RQQ@mail.gmail.com>
Subject: Re: It's been fun
To: Shawn McCarney <shawnmm@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000009c20300595ab5c99"
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

--0000000000009c20300595ab5c99
Content-Type: text/plain; charset="UTF-8"

Ed, it has been great working with you. Wish you the best of luck!

On Thu, Oct 24, 2019 at 9:17 AM Shawn McCarney <shawnmm@linux.vnet.ibm.com>
wrote:

> It's been great working with you Ed.  Will miss your wisdom around here.
>
> Shawn
>
> On 10/21/2019 3:34 PM, Ed Tanous wrote:
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
> >
> > Until we meet again,
> >
> > -Ed
>


-- 
Regards,
Kun

--0000000000009c20300595ab5c99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ed, it has been great working=C2=A0with you. Wish you the =
best=C2=A0of luck!</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Thu, Oct 24, 2019 at 9:17 AM Shawn McCarney &lt;<a hre=
f=3D"mailto:shawnmm@linux.vnet.ibm.com">shawnmm@linux.vnet.ibm.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">It&#39;s =
been great working with you Ed.=C2=A0 Will miss your wisdom around here.<br=
>
<br>
Shawn<br>
<br>
On 10/21/2019 3:34 PM, Ed Tanous wrote:<br>
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
&gt;<br>
&gt; Until we meet again,<br>
&gt;<br>
&gt; -Ed<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Regards,<div>Kun</div></div></d=
iv>

--0000000000009c20300595ab5c99--
