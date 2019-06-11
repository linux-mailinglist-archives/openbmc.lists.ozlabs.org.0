Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 236D53D575
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2019 20:26:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Ndjw6LkMzDqxF
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 04:26:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="k4spt/n0"; 
 dkim-atps=neutral
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NdhZ1VHyzDqr5
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jun 2019 04:25:01 +1000 (AEST)
Received: by mail-io1-xd33.google.com with SMTP id e3so10717933ioc.12
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 11:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=izjfTuTVsziU1NEmWGmJmrbCMNp24/c8s7gOhxQEKSI=;
 b=k4spt/n0ezCQZl6L3/g+I3nqfwlv1/FO32k1D+VmEHbfudUzCiLrUgdKVzjgS0R9I3
 j3o65Us518WTVrNu5dG4M9Pxm7sJhN/0G/d6sVBaG5850Vt1LDammnJL3x/Jt1Dm5c/N
 uF4ltdWGZr5RV/jR80d4SuPEJYrAT2aYSfrQF0bThJAOSHTu7ddtLwxFIocd/jaUgkU3
 RNRWfjV3w11Z45TR6xMyQJV7+fbxLRsimjAilIczlHdtpPKorolpX/OCsjhk/pXzFUxn
 DySsxsNlSrglRV34yyRZ5/8oxnFvQnqWKXzYvZQsDRxPwgi2Kd9zuxgsCQeP3MybMBPT
 /KNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=izjfTuTVsziU1NEmWGmJmrbCMNp24/c8s7gOhxQEKSI=;
 b=jhIcTNfmXWrJb47WByWkQZlp3iSenD9mJzQzPDIvVPKiS2hsoobXDKVh8gvcumjxU5
 vkqhMe/DrloXZaM9P7ctZ8djX9xptaWBJWxw8hEvtVdG48ZTBtOdT5jZqfTkiggIEsSn
 hU1c2gP7CPyuzh04Txwyj+hYAwzZi8ueQhMNZRJ6zlkDXBkmIsoJDHQrxTGY/a5Bq3QV
 bFW4UoYL3dh6D2QeOVD8kRrXkSozTk1MKfC58f8e520TZ9Io+MQV/GWAin6aqr77hKDd
 miua5LiBb6l9h871Mz4bEFarsG4zULcWoOHulOEiQ/ySr0O3Kb2AF8oloTzitaxZj/UR
 2D8w==
X-Gm-Message-State: APjAAAWWpA7lABgdKs4xZMgxwiz4cBCcSnRT+0F0yDNsPQdQERazBoj9
 4cNdRD+ikBB7dfpqevOHCpCIkkus7BAQKCx+XT9gzB9Ym34=
X-Google-Smtp-Source: APXvYqyivCFtKywuzXeQKirE4gbscEeAGkTKf3bRK5y/ele9oWP58a6Y9h6RMxW+ZNdkjOXXPlt00tewk7GBKCTgNgc=
X-Received: by 2002:a5d:9456:: with SMTP id x22mr22484000ior.71.1560277497231; 
 Tue, 11 Jun 2019 11:24:57 -0700 (PDT)
MIME-Version: 1.0
References: <BL0PR2101MB0932AE0C63ADC3CBDAE0CF16C8060@BL0PR2101MB0932.namprd21.prod.outlook.com>
 <4d082cf8-c99c-22ac-9a60-85f70abb8bd6@linux.vnet.ibm.com>
 <CAGMNF6W+W1VPnqa3J1Y_wqc=BcnkBCi4-h9rG4tjUUrCk3zR8g@mail.gmail.com>
 <CALXe31mBvxQTaUkuFJsMozBYLiVTur18pMsTUfHY2t02Xp34wg@mail.gmail.com>
 <CAGMNF6XSD2U-qAe5ibotCkYW-U21vV+tL5-rJwvjPUvWwHA1hw@mail.gmail.com>
 <20190605124935.ywwwoj26fk46e6qu@thinkpad.dyn.fuzziesquirrel.com>
 <ab42831d-e2a9-c13d-9061-fd39b807ace2@yadro.com>
In-Reply-To: <ab42831d-e2a9-c13d-9061-fd39b807ace2@yadro.com>
From: Kun Yi <kunyi@google.com>
Date: Tue, 11 Jun 2019 11:24:28 -0700
Message-ID: <CAGMNF6UpQ9WpHhZa8_NxRvraYG2mz=YgVjf+jYySigLXBzQTog@mail.gmail.com>
Subject: Re: Platform telemetry and health monitoring
To: Alexander Amelkin <a.amelkin@yadro.com>
Content-Type: multipart/alternative; boundary="000000000000f9aaa4058b10690f"
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

--000000000000f9aaa4058b10690f
Content-Type: text/plain; charset="UTF-8"

Neeraj mentioned he will send out the meeting minutes. He will also look
into setting up a wiki page holding the contents as well as minutes.

A few quick notes from top of my head from the kick-off meeting:
- did a round table, all the orgs have similar requirements
- need to look into how existing infra fit into the needs and what falls
short
- will have workstreams for:
    - what to collect
    - how to collect
    - how to store
    - how to export
- collectd sounds interesting and promising for collecting metrics
- IPMI SELs have limitations as an event reporting mechanism, possibly need
to have a new events or error log reporting mechanism to aggregate fault
logs from different components
- will need to look into Redish and expand the specs as necessary to fit
our needs

On Tue, Jun 11, 2019 at 2:02 AM Alexander Amelkin <a.amelkin@yadro.com>
wrote:

> I second the idea of reusing collectd. It's pretty standard and popular.
>
> With best regards,
> Alexander Amelkin,
> Leading BMC Software Engineer, YADRO
> https://yadro.com
>
> 05.06.2019 15:49, Brad Bishop wrote:
> > On Tue, Jun 04, 2019 at 12:35:05PM -0700, Kun Yi wrote:
> >> FYI: Srinivas, Neeraj, and I are finalizing a time slot for the kick off
> >> meeting. We are thinking about a bi-weekly discussion.
> >>
> >> Also, I'm drafting a version of BMC metrics collection daemon. The first
> >> draft is up on
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/22257,
> >> which we probably will go over during the meeting.
> >
> > I just wanted to point out the collectd project:  https://collectd.org/
> >
> > I'm not sure if it is suitable or not but it seems like a pretty close
> match to what you are trying to do and it would be a lot of code you don't
> have to write.
> >
> > Just something to consider.
> >
> > thx - brad
>
>

-- 
Regards,
Kun

--000000000000f9aaa4058b10690f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Neeraj mentioned he will send out the meeting minutes. He =
will also look into setting up a wiki page holding the contents as well as =
minutes.<div><br></div><div>A few quick notes from top of my head from the =
kick-off meeting:</div><div>- did a round table, all the orgs have similar =
requirements</div><div>- need to look into how existing infra fit into the =
needs and what falls short</div><div>- will have workstreams for:</div><div=
>=C2=A0 =C2=A0 - what to collect</div><div>=C2=A0 =C2=A0 - how to collect</=
div><div>=C2=A0 =C2=A0 - how to store</div><div>=C2=A0 =C2=A0 - how to expo=
rt</div><div>- collectd sounds interesting and promising for collecting met=
rics</div><div>- IPMI SELs have limitations as an event reporting mechanism=
, possibly need to have a new events=C2=A0or error log reporting mechanism =
to aggregate fault logs from different components</div><div>- will need to =
look into Redish and expand the specs as necessary to fit our needs</div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Tue, Jun 11, 2019 at 2:02 AM Alexander Amelkin &lt;<a href=3D"mailto:a.ame=
lkin@yadro.com" target=3D"_blank">a.amelkin@yadro.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">I second the idea of r=
eusing collectd. It&#39;s pretty standard and popular.<br>
<br>
With best regards,<br>
Alexander Amelkin,<br>
Leading BMC Software Engineer, YADRO<br>
<a href=3D"https://yadro.com" rel=3D"noreferrer" target=3D"_blank">https://=
yadro.com</a><br>
<br>
05.06.2019 15:49, Brad Bishop wrote:<br>
&gt; On Tue, Jun 04, 2019 at 12:35:05PM -0700, Kun Yi wrote:<br>
&gt;&gt; FYI: Srinivas, Neeraj, and I are finalizing a time slot for the ki=
ck off<br>
&gt;&gt; meeting. We are thinking about a bi-weekly discussion.<br>
&gt;&gt;<br>
&gt;&gt; Also, I&#39;m drafting a version of BMC metrics collection daemon.=
 The first<br>
&gt;&gt; draft is up on <a href=3D"https://gerrit.openbmc-project.xyz/c/ope=
nbmc/docs/+/22257" rel=3D"noreferrer" target=3D"_blank">https://gerrit.open=
bmc-project.xyz/c/openbmc/docs/+/22257</a>,<br>
&gt;&gt; which we probably will go over during the meeting.<br>
&gt;<br>
&gt; I just wanted to point out the collectd project:=C2=A0 <a href=3D"http=
s://collectd.org/" rel=3D"noreferrer" target=3D"_blank">https://collectd.or=
g/</a><br>
&gt;<br>
&gt; I&#39;m not sure if it is suitable or not but it seems like a pretty c=
lose match to what you are trying to do and it would be a lot of code you d=
on&#39;t have to write.<br>
&gt;<br>
&gt; Just something to consider.<br>
&gt;<br>
&gt; thx - brad<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail-m_1470817055518636277gmail-m_3213770402820737116gmail_signa=
ture"><div dir=3D"ltr">Regards,<div>Kun</div></div></div>

--000000000000f9aaa4058b10690f--
