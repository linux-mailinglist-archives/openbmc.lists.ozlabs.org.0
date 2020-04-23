Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0609C1B613C
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 18:46:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497NVw17CkzDr5N
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 02:46:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::32e;
 helo=mail-ot1-x32e.google.com; envelope-from=ztai@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ovqvscHF; dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497NHW0XTnzDqfy
 for <openbmc@lists.ozlabs.org>; Fri, 24 Apr 2020 02:36:54 +1000 (AEST)
Received: by mail-ot1-x32e.google.com with SMTP id e20so7108592otk.12
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 09:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eOxAaefuvbCFQALvc/ahGwJnH1wNNxhh0wsFE0GDIkw=;
 b=ovqvscHFoE38anKilTK+OSL6LthBaKMhB+TaejPPsCwjX8xHEMu2WI2NGu9dO69QhB
 solKEM88ejPD791kckP01oKgD40iZeXTxPCDrnqs0FfDfLgrKIvNP114wMxx4UbE9fkj
 y++8oJjZ5mbJzsiDxRngiBj/bGIFom7u0JXvYm+e3Gtb8gefKFcUvz+6Tu5DJptQyXXt
 fFc74aWUK0xC8MfgdMGQJFA3wRiZPKCy4YMPBA4itXsIU+BuPGsLA9HOmA1x5eJeCrXU
 x+LVIUr+kApWt7jdEDxRESJYHoOCzjMn3BF7HtxaGaRj4aQGABIXbdbLrV7IufddkyIw
 Ll5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eOxAaefuvbCFQALvc/ahGwJnH1wNNxhh0wsFE0GDIkw=;
 b=QPY0L/broyIXwp1dgFwGUYkq9dCFAOtRnU3djFbUj6ASyvSsvXjuFDBuuK4rKpiy4g
 4CWKn0p8iczih7tcM0k70WwFwchbJ5ZlB4v0gZDvX2jUPyZ/8fnc0fNgqSZQs+9ii3yc
 rGC1nwFrC6koonaSsmFGanLgbNdySomT1SyIjdRcoMX5NvsWG+n3hT70424mGGeMZFIb
 V6475hA8I3AFoqrHhRfiyURQXd2BgDHzASz2odCheqIH/OAAYWnY1AGU8gI2zs6aQKA1
 jZ33eXGt808uJfwAjtfrFvIanik4Li/5hKy8LWwQjwuGjDVGMISCYfCUUNMkUtp8GeAI
 EzIA==
X-Gm-Message-State: AGi0PuYEfb8APSwM07ojAqqGDkP9uQ7Ibph/TCfCuFv6avfR3YyK5K7y
 n13RlywXlRR+KS3wNNZPiCByyW0hX2cGHX5Na9uDUzTQ
X-Google-Smtp-Source: APiQypKpDsOB/69Gd8Y7tKUlHJef/P7Zu51+Jw7eJpauzPWGiTsLxV9ZsQdQaiSC+2IcRzV/yFOiDe50YnoOujQB62U=
X-Received: by 2002:a9d:a0d:: with SMTP id 13mr4136537otg.222.1587659810286;
 Thu, 23 Apr 2020 09:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.1237.1587601186.5884.openbmc@lists.ozlabs.org>
 <1DF7E55B-29E9-43A2-9981-F67521B2B3E2@quantatw.com>
 <c34fc105-657d-1e33-e3fc-90cb5afba75a@linux.ibm.com>
In-Reply-To: <c34fc105-657d-1e33-e3fc-90cb5afba75a@linux.ibm.com>
From: Zhenfei Tai <ztai@google.com>
Date: Thu, 23 Apr 2020 09:36:39 -0700
Message-ID: <CAMXw96NDQ7CrY_pTZH+NugOD_6Z0HiKw1dO4vKkpaiRauFgVyQ@mail.gmail.com>
Subject: Re: mTLS on bmcweb
To: Joseph Reynolds <jrey@linux.ibm.com>
Content-Type: multipart/alternative; boundary="00000000000004a46705a3f7db77"
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
 =?UTF-8?B?UC4gSy4gTGVlICjmnY7mn4/lr6wp?= <P.K.Lee@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000004a46705a3f7db77
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I guess part of my question is how to configure the mTLS certs to make it
work properly.

So far only https works (server side TLS).

Thanks,
Zhenfei

On Thu, Apr 23, 2020 at 8:50 AM Joseph Reynolds <jrey@linux.ibm.com> wrote:

> On 4/23/20 5:47 AM, P. K. Lee (=E6=9D=8E=E6=9F=8F=E5=AF=AC) wrote:
> > Hi,
> >
> > I encountered the same issue when using Redfish to replace the
> certificate.
> > Regardless of whether the parameters include --cert --key --cacert or
> only --cacert, the authentication can still succeed.
> >
> > Best,
> > P.K.
> >
> >> Date: Wed, 22 Apr 2020 14:58:06 -0700
> >> From: Zhenfei Tai <ztai@google.com>
> >> To: openbmc@lists.ozlabs.org
> >> Subject: mTLS on bmcweb
> >> Message-ID:
> >>      <CAMXw96Pp511sUO=3Dq1XLz2uJzh4S6D7tUwmkvpbnq_yU-iJfiKg@mail.g
> >> mail.com>
> >> Content-Type: text/plain; charset=3D"utf-8"
> >>
> >> Hi,
> >>
> >> I'm trying out bmcweb mTLS which should be enabled by default by
> >> https://github.com/openbmc/bmcweb/blob/master/CMakeLists.txt#L89
> >>
> >> In my test, I created a self signed key and certificate pair, stacked
> them
> >> up into server.pem in /etc/ssl/certs/https that bmcweb uses.
> >>
> >> However when I tried to curl bmcweb service, I was able to get respons=
e
> by
> >> only supplying the cert.
> >>
> >> curl --cacert cert.pem  https://${bmc}/redfish/v1
> >>
> >> With the mTLS enabled, I expected it should error out since no client
> >> certificate is provided.
> >>
> >> Could someone with relevant knowledge help with my question?
>
> I'm not sure what you are asking.  Are you asking how to install mTLS
> certs into the BMC and then use them to connect?  I am still waiting for
> documentation that describes how to configure and use the mTLS feature.
>
> I've added an entry to the security working group as a reminder to do
> this.  (I don't have the skill to document this feature.)
>
> - Joseph
>
> >>
> >> Thanks,
> >> Zhenfei
>
>

--00000000000004a46705a3f7db77
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I guess part of my question is how to configure the mTLS c=
erts to make it work properly.<div><br></div><div>So far only https works (=
server side TLS).</div><div><br></div><div>Thanks,</div><div>Zhenfei</div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Thu, Apr 23, 2020 at 8:50 AM Joseph Reynolds &lt;<a href=3D"mailto:jrey@l=
inux.ibm.com">jrey@linux.ibm.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On 4/23/20 5:47 AM, P. K. Lee (=E6=9D=8E=
=E6=9F=8F=E5=AF=AC) wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; I encountered the same issue when using Redfish to replace the certifi=
cate.<br>
&gt; Regardless of whether the parameters include --cert --key --cacert or =
only --cacert, the authentication can still succeed.<br>
&gt;<br>
&gt; Best,<br>
&gt; P.K.<br>
&gt;<br>
&gt;&gt; Date: Wed, 22 Apr 2020 14:58:06 -0700<br>
&gt;&gt; From: Zhenfei Tai &lt;<a href=3D"mailto:ztai@google.com" target=3D=
"_blank">ztai@google.com</a>&gt;<br>
&gt;&gt; To: <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">=
openbmc@lists.ozlabs.org</a><br>
&gt;&gt; Subject: mTLS on bmcweb<br>
&gt;&gt; Message-ID:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &lt;CAMXw96Pp511sUO=3Dq1XLz2uJzh4S6D7tUwmkvpbn=
q_yU-iJfiKg@mail.g<br>
&gt;&gt; <a href=3D"http://mail.com" rel=3D"noreferrer" target=3D"_blank">m=
ail.com</a>&gt;<br>
&gt;&gt; Content-Type: text/plain; charset=3D&quot;utf-8&quot;<br>
&gt;&gt;<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m trying out bmcweb mTLS which should be enabled by default =
by<br>
&gt;&gt; <a href=3D"https://github.com/openbmc/bmcweb/blob/master/CMakeList=
s.txt#L89" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/=
bmcweb/blob/master/CMakeLists.txt#L89</a><br>
&gt;&gt;<br>
&gt;&gt; In my test, I created a self signed key and certificate pair, stac=
ked them<br>
&gt;&gt; up into server.pem in /etc/ssl/certs/https that bmcweb uses.<br>
&gt;&gt;<br>
&gt;&gt; However when I tried to curl bmcweb service, I was able to get res=
ponse by<br>
&gt;&gt; only supplying the cert.<br>
&gt;&gt;<br>
&gt;&gt; curl --cacert cert.pem=C2=A0 https://${bmc}/redfish/v1<br>
&gt;&gt;<br>
&gt;&gt; With the mTLS enabled, I expected it should error out since no cli=
ent<br>
&gt;&gt; certificate is provided.<br>
&gt;&gt;<br>
&gt;&gt; Could someone with relevant knowledge help with my question?<br>
<br>
I&#39;m not sure what you are asking.=C2=A0 Are you asking how to install m=
TLS <br>
certs into the BMC and then use them to connect?=C2=A0 I am still waiting f=
or <br>
documentation that describes how to configure and use the mTLS feature.<br>
<br>
I&#39;ve added an entry to the security working group as a reminder to do <=
br>
this.=C2=A0 (I don&#39;t have the skill to document this feature.)<br>
<br>
- Joseph<br>
<br>
&gt;&gt;<br>
&gt;&gt; Thanks,<br>
&gt;&gt; Zhenfei<br>
<br>
</blockquote></div>

--00000000000004a46705a3f7db77--
