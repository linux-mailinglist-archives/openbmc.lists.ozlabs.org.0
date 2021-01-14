Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7022F6D76
	for <lists+openbmc@lfdr.de>; Thu, 14 Jan 2021 22:48:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGybp586xzDqDX
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 08:48:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=wltu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Up4reFnt; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGyZv3s2CzDqDP
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2021 08:47:15 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id h10so4162667pfo.9
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2021 13:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RTgoKg0qMO3EWA28lu2n4RnRWI2PLdQOjIwqMIOF0JU=;
 b=Up4reFnt9nNaE65uFencsXiysF+6e5423vRG7d8qUVn5mDHFB5IC+gIw9/OJkmDXM0
 loviRtMMDh3IidpBcscYGEnatFD3PW8Wtqof6DnaHIGLn6qb/i+6yO8O5cY4BKaSFCbT
 BrawehfDrwlUNVK/PWTcyVxqSSLSnUtr/pclzDydVttBzKWpsIwAqbCGOJXgxCBbRx+2
 Gpf1UWBWmXOwctSYcQQQIFsNvOVqUbx8ajpnzqaf723NUOROk28nodcU/Vu5UQ47zxi6
 cQYQXPxD9aP+MTJzLBnVLKw53+NLCF7XCIGuW3N2SejQVK8Uga/cWHEcZYWOCg1JfAsE
 SDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RTgoKg0qMO3EWA28lu2n4RnRWI2PLdQOjIwqMIOF0JU=;
 b=BgNvujzEZR8IgTJUhCMX5BcSvVMPNIZik/0wXL8BQ+SX5+uUZtMUn3e0jp5KgVYJo5
 6PF07c14w1skFO8YGbfn35AzudzXLz4V1iEdMiz5FDlvZ245VlDkClgSdUqPHuNWiadr
 8EB4abUqsNrEZ7lyCW8x1ur3zlQNueediJNNHCByakJqsYrbkNWo3cr5B5R/U2jEXA4G
 eNn7RJ6FiF13x8tjbTg7U40KBA1K59rwhge2U/sVImSK6x3gk//hxZbKS19S9p1Jhgk6
 WgrNIUgkqrfUZzJsyK7XO3joTFOlzHoJguYwOdayEiHnBsV2z1caHnxT6nHGLqHqLJ/e
 +k0Q==
X-Gm-Message-State: AOAM530IiOAtXlMgVIq8Jikv9MOs0jhJ2vWnziMTuDYWEJAhGCKxYItl
 7L0Rpupvlpwz7la1KqXiip+TL4irh9xgutnOo923jA==
X-Google-Smtp-Source: ABdhPJxkV3fsagAgTJCuYIyBAipLEa7K0pY3f5TqQu6wpKkdoe0S1WjnEfAYHaQEjCvbT9HK9e5jAxwHivnbWvBgYQc=
X-Received: by 2002:a63:2c93:: with SMTP id s141mr9541369pgs.150.1610660831002; 
 Thu, 14 Jan 2021 13:47:11 -0800 (PST)
MIME-Version: 1.0
References: <CAHwn2XkNiz7rZzn9RbpZCaUM8HD0HO+mJTD9D2ENc_p+SsmXHg@mail.gmail.com>
 <20210114143909.jf3vbk7zhxp3iguv@thinkpad.fuzziesquirrel.com>
 <CAH2-KxBgmEmfeQxsbTa1RPVO_nm5=G+ayZ9aDM+1hf7oRtoDGA@mail.gmail.com>
 <20210114173805.GB45289@mauery.jf.intel.com>
 <20210114194026.ejf2fa3zhuqfdom4@thinkpad.fuzziesquirrel.com>
 <CAH2-KxDQwSn3Dnfo95LKGVtb_hhF-O1NEXz0bVL+YyxTZHsm9w@mail.gmail.com>
In-Reply-To: <CAH2-KxDQwSn3Dnfo95LKGVtb_hhF-O1NEXz0bVL+YyxTZHsm9w@mail.gmail.com>
From: Willy Tu <wltu@google.com>
Date: Thu, 14 Jan 2021 13:46:59 -0800
Message-ID: <CAHwn2Xn9zOPRySgC9uc67MFemBHp3NL66Yqrqhw5fkGS+7CFbA@mail.gmail.com>
Subject: Re: Intel-ipmi-oem repo
To: Ed Tanous <edtanous@google.com>
Content-Type: multipart/alternative; boundary="000000000000afe3a905b8e33274"
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, chunhui.jia@linux.intel.com,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, apparao.puli@linux.intel.com,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000afe3a905b8e33274
Content-Type: text/plain; charset="UTF-8"

Ok, sounds good.

I'll look into moving to the IPMID repo with a package config instead.

Maybe we'll get more suggestions in this thread, but  I'll start work in
that direction.

Willy Tu

On Thu, Jan 14, 2021 at 12:06 PM Ed Tanous <edtanous@google.com> wrote:

> On Thu, Jan 14, 2021 at 11:40 AM Brad Bishop
> <bradleyb@fuzziesquirrel.com> wrote:
> >
> > On Thu, Jan 14, 2021 at 09:38:05AM -0800, Vernon Mauery wrote:
> > >On 14-Jan-2021 08:38 AM, Ed Tanous wrote:
> >
> > >>Would people prefer it to be a package config on IPMID to select
> between
> > >>the two implementations?
> > >
> > >I don't have a problem with a package config to select sensor
> > >implementations.
> >
> > This seems fine to me too.  I looked and there are non-POWER users of
> > the fixed sensor id implementation too so openpower-ipmi-oem probably
> > doesn't make good sense.
> >
> > >I would say that if IBM is the only company using the sensor
> > >implementation that is currently in ipmid, it would be best to move it
> > >to the IBM OEM layer. But it is difficult in a project this size who
> > >is using what.
> >
> > 'grep yaml-config' of the openbmc tree gives a pretty decent indicator
> > of who is using the fixed sensor ID implementation.
> >
> > -brad
>
> It's been on my list for a while to write a script to go build at
> least rudimentary ported entity-manager configs for the existing
> hardware in the tree.  I'd asked James to write this a few times in
> the past, but as we know, we all get busy.  This is just to say, it's
> on my radar to try to try to make this better.
>
> -Ed
>

--000000000000afe3a905b8e33274
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Ok, sounds good.</div><div><br></div><div>I&#39;ll lo=
ok into moving to the IPMID repo  with a package config instead.=C2=A0</div=
><div><br></div><div>Maybe we&#39;ll get more suggestions in this thread, b=
ut=C2=A0 I&#39;ll start work in that direction.</div><div><br></div><div>Wi=
lly Tu</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Thu, Jan 14, 2021 at 12:06 PM Ed Tanous &lt;<a href=3D"mailt=
o:edtanous@google.com" target=3D"_blank">edtanous@google.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Jan 14,=
 2021 at 11:40 AM Brad Bishop<br>
&lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.com" target=3D"_blank">bradle=
yb@fuzziesquirrel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, Jan 14, 2021 at 09:38:05AM -0800, Vernon Mauery wrote:<br>
&gt; &gt;On 14-Jan-2021 08:38 AM, Ed Tanous wrote:<br>
&gt;<br>
&gt; &gt;&gt;Would people prefer it to be a package config on IPMID to sele=
ct between<br>
&gt; &gt;&gt;the two implementations?<br>
&gt; &gt;<br>
&gt; &gt;I don&#39;t have a problem with a package config to select sensor<=
br>
&gt; &gt;implementations.<br>
&gt;<br>
&gt; This seems fine to me too.=C2=A0 I looked and there are non-POWER user=
s of<br>
&gt; the fixed sensor id implementation too so openpower-ipmi-oem probably<=
br>
&gt; doesn&#39;t make good sense.<br>
&gt;<br>
&gt; &gt;I would say that if IBM is the only company using the sensor<br>
&gt; &gt;implementation that is currently in ipmid, it would be best to mov=
e it<br>
&gt; &gt;to the IBM OEM layer. But it is difficult in a project this size w=
ho<br>
&gt; &gt;is using what.<br>
&gt;<br>
&gt; &#39;grep yaml-config&#39; of the openbmc tree gives a pretty decent i=
ndicator<br>
&gt; of who is using the fixed sensor ID implementation.<br>
&gt;<br>
&gt; -brad<br>
<br>
It&#39;s been on my list for a while to write a script to go build at<br>
least rudimentary ported entity-manager configs for the existing<br>
hardware in the tree.=C2=A0 I&#39;d asked James to write this a few times i=
n<br>
the past, but as we know, we all get busy.=C2=A0 This is just to say, it&#3=
9;s<br>
on my radar to try to try to make this better.<br>
<br>
-Ed<br>
</blockquote></div>

--000000000000afe3a905b8e33274--
