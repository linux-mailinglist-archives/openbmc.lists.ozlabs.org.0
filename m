Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2147923B7E0
	for <lists+openbmc@lfdr.de>; Tue,  4 Aug 2020 11:38:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLV6Y2jxBzDqYb
	for <lists+openbmc@lfdr.de>; Tue,  4 Aug 2020 19:37:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::233;
 helo=mail-oi1-x233.google.com; envelope-from=ojayanth@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UcyS6J7L; dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLV5W26jHzDqXS
 for <openbmc@lists.ozlabs.org>; Tue,  4 Aug 2020 19:36:57 +1000 (AEST)
Received: by mail-oi1-x233.google.com with SMTP id j7so19405284oij.9
 for <openbmc@lists.ozlabs.org>; Tue, 04 Aug 2020 02:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vm1Pq1sth4Ua1h0E05WlKWimW7cijimmlumD2WzAx78=;
 b=UcyS6J7Ln3S5zBVpXX1hcIwaj6U9T2szmxKU47gZusn+80rfogf2wvHJUO67t+QvMg
 AScV1I631sZxYZX2KK6pCLkek77swd9DMwTvW4Yd607t8PXrKU2b2RUf1Qu8SKBnQnVk
 fcHwWaPpohgvhr1gAH5TwIefso6t+iTBRDQ8NjZDC7hCZxQpsMWv5TDPtuLvK9igp3Z6
 LfGH6drBGIO03sLFLjvUu1nWFVVqIQmIsFiJx+jRvgk2e3hPCzsauVgItT4N3UFDeJtn
 4lXqg56G9W8eYYA5clYBuVdzHr4X/BLb8Cs26NENsnhB1wMhxjpvM3YKbND1kFxLEORx
 moTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vm1Pq1sth4Ua1h0E05WlKWimW7cijimmlumD2WzAx78=;
 b=QBOrZezU7vpXN8TqQD6B1bplk6K6ZVedfd4SLRd/Y6A4htcVEyoIjveah1UJkehLRD
 NaamdjTGlYioT8lLZWFDLv3gg1aIbuYwMPYiDEC8VPzfzFWGZsClocP/OdvFhtbse8mS
 pN3548JvsIVWw3LcjAW1NJIZ81FRcIU9tjA2isWAcf8YYKAQvKm/PwTL5zJVk5r/+L0i
 id26LTi/l36uaYONYDYyX0pOxNTOXK2TLuV921EEESfCaTCjIuORo74Kq4UsRKZnNK3+
 VWwLG7FCGDemZ8lQgVzmQcwlDl1Zf0MlzA0SBIxOdWRmR2OB/LHje7dkhDfX2JXz2R8o
 1H+A==
X-Gm-Message-State: AOAM530s75osO+r4pmQver1VJ+3QcL4l0bf5O/5zDCLv4iqw3vbD5TNn
 +FykXi6S4/OJXd3VjryZxlQPu2ZnGfBfNFR4Vvbx0tGc
X-Google-Smtp-Source: ABdhPJx0VBYgi1aFe2hwAzyDczrMQT9ViLIYQ0pBzzG2UqU+O5rxWnUeBwDj9VX1RACaU7HYoxgmDzgytz3pIARStEE=
X-Received: by 2002:a05:6808:a0d:: with SMTP id
 n13mr2598318oij.179.1596533814393; 
 Tue, 04 Aug 2020 02:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <b8ec220b-56ca-45f7-99be-5ab197c4d881@linux.ibm.com>
 <b5f1c04f-eb6c-7dac-2945-cff9815a7ca6@linux.ibm.com>
 <CACWQX80aD212+JKwqGJoowyb4S7wLcnUCyVLwOMko8T_86yunA@mail.gmail.com>
In-Reply-To: <CACWQX80aD212+JKwqGJoowyb4S7wLcnUCyVLwOMko8T_86yunA@mail.gmail.com>
From: Jayanth Othayoth <ojayanth@gmail.com>
Date: Tue, 4 Aug 2020 15:06:43 +0530
Message-ID: <CACkAXSrFd_zs5OQnuwM=yLxTJxn7zTjXTvSmT-GpTmFZnAOqGw@mail.gmail.com>
Subject: Re: Security Working Group - Wednesday July 22 - results
To: Ed Tanous <ed@tanous.net>
Content-Type: multipart/alternative; boundary="000000000000e0fdc905ac09fed5"
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000e0fdc905ac09fed5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2020 at 8:46 PM Ed Tanous <ed@tanous.net> wrote:

> First off, if you are finding certificates are expiring in a
> production environment, you need to rethink your certificate
> replacement strategy.  The BMC cannot be the primary entity in charge
> of certificate replacement and revocation, and the fact that this is
> happening points to a greater organizational problem than the bmc can
> cover.
>
> One thing to note;  At one point, I had talked through how to
> prototype ACME protocol replacement of certificates automatically, so,
> given an ACME server on the network, the BMC could essentially
> automatically provision itself and keep its certs up to date.  If
> someone wanted to run with that, it might reduce some of the pain here
> (and be extremely cool).
>
> On Thu, Jul 23, 2020 at 7:24 AM Joseph Reynolds <jrey@linux.ibm.com>
> wrote:
> >
> >
> > 4 Question: If BMCWeb finds an unusable HTTPS site identity certificate=
,
> > it DELETES it and self-generates one.  This has caused problems for
> > certificates that are not valid until a future date. In general, what
> > certificate management support should we have for BMCWeb?  What is
> needed?
>
> This is not how bmcweb was intended to work, and I had explicitly
> tested that it doesn't have this behavior (prior to it being moved
> over to certificate manager).  The only time it previously would
> replace a certificate was if the cert file didn't exist, or was
> completely unreadable.  I suspect the right thing here is to bisect
> the commit that broke this behavior (I'll bet it's easy to find) and
> get a bug filed with the author so they can either fix it or revert
> the patch.
>
> This one smells awfully suspicious:
> 082f28fd2588fd9fcd9452ad38234ce875319163.
>

  Ed,
        https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/22938
 introduced to fix issue https://github.com/openbmc/bmcweb/issues/91.
     We should also add check to ignore =E2=80=9CX509_V_ERR_CERT_NOT_YET_VA=
LID=E2=80=9D to
allow user to upload =E2=80=9CNOT_YET_VALID=E2=80=9D certificate similar to=
 certificate
manager verification function.


>
> > ANSWER:
> > There were two discussion threads: The BMC=E2=80=99s notion of time of =
day
> > (TOD), and how BMCWeb should handle certificates.
> >
> > Does the BMC have a battery backed TOD clock?  Depends on BMC model.
> > Can it validate if it has access to its NTP server (when configured)?
> > Does the BMC know if its time was set correctly?
> >
> > How does the BMC know if the BMC has the correct time?  Have a BMC flag
> > that says, =E2=80=9CLook like the BMC TOD clock is not working.=E2=80=
=9D  Does the BMC
> > know if we got a good time from an  NTP server?  Can we read the GPS
> > signal?  What is the industry solution?
> > Should the BMC store its idea of what date it is?  So it can report if
> > the time changes significantly.  Or will this lead to a bigger problem?
> > Is it better/simpler to check for TOD =3D beginning-of-era-1/1/1970?  =
=E2=86=92
> > start an email thread
>
> The above is all asking the wrong question: "Can we determine if the
> certificate is valid?"  This is irrelevant, the question is: "Should
> we ever be replacing a user provided certificate with one generated on
> the BMC."  The answer previously has been no.  In almost all cases the
> user provided certificate, even an expired one, will still be better
> than one the BMC self signs.  Between having an invalid certificate
> chain, and an invalid date, I'll take the invalid date every time.
>
> It should be noted, most browsers (in my testing) seem to ignore the
> HTTP date header entirely, so the BMC doesn't even need the correct
> time to set up a proper encryption channel.
>
> >
> > BMCWeb configuration?  Configure option: delete cert and generate
> > self-signed -vs- use defective certificate.  What is the purpose of
> > deleting the unusable cert?
>
> This question needs answered.  I suspect this was unintentional, and
> someone simply used some bad openssl code to attempt to verify the
> cert against the (possibly non existent) chain without realizing this
> requirement.
>
> >  Should =E2=80=9Cout of date=E2=80=9D not be part of the
> > =E2=80=9Cunusable=E2=80=9D definition? =E2=87=92 Ideas: 1. If bmcweb fi=
nds a usable cert but is
> > out of date, that cert can still be used.  2. Leave the defective
> > certificate (do not delete it) and log an error.
>
> A lot of BMCs don't have a dedicated RTC, and rely on other systems
> (like the PCH or NTP) to get the correct time.  bmcweb needs to come
> up long before the PCH or NTP (both of which are also optional) so as
> a general rule, using these for valid time is a non-starter.  I could
> see logging an error _if_ you know time is valid, but I'm not sure how
> a bmc could know that.
>
> >
> > The group consensus was that BMCWeb should treat its HTTPS site identit=
y
> > certificate like this:
> > 1 certificate is perfectly good - Use the certificate
> > 2 certificate is good but expired or not yet valid - Use the certificat=
e
> > and log a warning
>
> Add "and we know time has been set appropriately".  Also, be careful
> with not yet valid.  I don't know how openssl chains handle clock skew
> between certificate generator and client.  If the BMC has a time
> that's 1 minute fast, is the certificate "not yet valid"?
>
> > 3 certificate is missing or bad format or algorithm too old - Use
> > another certificate or self-generate a certificate (and log that action=
)
>
> We shouldn't be replacing certificates unless it's completely missing
> (ie, we're on a first boot or a factory reset) and wouldn't be
> switching certificates on the fly.  If the algorithm is too old, the
> user is free to replace it with their own, which is the right
> procedure anyway.  We also have no idea if the user has added this
> public certificate to their local root store, so replacing it out of
> the blue might look like an attack.  Also, we have no idea if the
> users' client systems support the new crypto format.  We could be
> unintentionally DOSing them if, say, we turn on a new keytype or size
> and their clients don't support that key.
>
> > There are no cases where BMCWeb should delete any certificate.
>
> I think I know what you mean, but to be clear, we should delete the
> old certificates when they're replaced.  We should delete root trust
> store certificates when requested, ect.  I don't think we can say "no
> cases" here.
>

--000000000000e0fdc905ac09fed5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 23, 2020 at 8:46 PM Ed Ta=
nous &lt;<a href=3D"mailto:ed@tanous.net">ed@tanous.net</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">First off, if you ar=
e finding certificates are expiring in a<br>
production environment, you need to rethink your certificate<br>
replacement strategy.=C2=A0 The BMC cannot be the primary entity in charge<=
br>
of certificate replacement and revocation, and the fact that this is<br>
happening points to a greater organizational problem than the bmc can<br>
cover.<br>
<br>
One thing to note;=C2=A0 At one point, I had talked through how to<br>
prototype ACME protocol replacement of certificates automatically, so,<br>
given an ACME server on the network, the BMC could essentially<br>
automatically provision itself and keep its certs up to date.=C2=A0 If<br>
someone wanted to run with that, it might reduce some of the pain here<br>
(and be extremely cool).<br>
<br>
On Thu, Jul 23, 2020 at 7:24 AM Joseph Reynolds &lt;<a href=3D"mailto:jrey@=
linux.ibm.com" target=3D"_blank">jrey@linux.ibm.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; 4 Question: If BMCWeb finds an unusable HTTPS site identity certificat=
e,<br>
&gt; it DELETES it and self-generates one.=C2=A0 This has caused problems f=
or<br>
&gt; certificates that are not valid until a future date. In general, what<=
br>
&gt; certificate management support should we have for BMCWeb?=C2=A0 What i=
s needed?<br>
<br>
This is not how bmcweb was intended to work, and I had explicitly<br>
tested that it doesn&#39;t have this behavior (prior to it being moved<br>
over to certificate manager).=C2=A0 The only time it previously would<br>
replace a certificate was if the cert file didn&#39;t exist, or was<br>
completely unreadable.=C2=A0 I suspect the right thing here is to bisect<br=
>
the commit that broke this behavior (I&#39;ll bet it&#39;s easy to find) an=
d<br>
get a bug filed with the author so they can either fix it or revert<br>
the patch.<br>
<br>
This one smells awfully suspicious: 082f28fd2588fd9fcd9452ad38234ce87531916=
3.<br></blockquote><div><br></div><div>=C2=A0 Ed,</div><div>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a href=3D"https://gerrit.openbmc-project.xyz/c=
/openbmc/bmcweb/+/22938">https://gerrit.openbmc-project.xyz/c/openbmc/bmcwe=
b/+/22938</a> =C2=A0introduced to fix issue <a href=3D"https://github.com/o=
penbmc/bmcweb/issues/91">https://github.com/openbmc/bmcweb/issues/91</a>. <=
br></div><div>=C2=A0=C2=A0=C2=A0=C2=A0 We should also add check to ignore =
=E2=80=9CX509_V_ERR_CERT_NOT_YET_VALID=E2=80=9D to allow user to upload =E2=
=80=9CNOT_YET_VALID=E2=80=9D certificate similar to certificate manager ver=
ification function.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
&gt; ANSWER:<br>
&gt; There were two discussion threads: The BMC=E2=80=99s notion of time of=
 day<br>
&gt; (TOD), and how BMCWeb should handle certificates.<br>
&gt;<br>
&gt; Does the BMC have a battery backed TOD clock?=C2=A0 Depends on BMC mod=
el.<br>
&gt; Can it validate if it has access to its NTP server (when configured)?<=
br>
&gt; Does the BMC know if its time was set correctly?<br>
&gt;<br>
&gt; How does the BMC know if the BMC has the correct time?=C2=A0 Have a BM=
C flag<br>
&gt; that says, =E2=80=9CLook like the BMC TOD clock is not working.=E2=80=
=9D=C2=A0 Does the BMC<br>
&gt; know if we got a good time from an=C2=A0 NTP server?=C2=A0 Can we read=
 the GPS<br>
&gt; signal?=C2=A0 What is the industry solution?<br>
&gt; Should the BMC store its idea of what date it is?=C2=A0 So it can repo=
rt if<br>
&gt; the time changes significantly.=C2=A0 Or will this lead to a bigger pr=
oblem?<br>
&gt; Is it better/simpler to check for TOD =3D beginning-of-era-1/1/1970?=
=C2=A0 =E2=86=92<br>
&gt; start an email thread<br>
<br>
The above is all asking the wrong question: &quot;Can we determine if the<b=
r>
certificate is valid?&quot;=C2=A0 This is irrelevant, the question is: &quo=
t;Should<br>
we ever be replacing a user provided certificate with one generated on<br>
the BMC.&quot;=C2=A0 The answer previously has been no.=C2=A0 In almost all=
 cases the<br>
user provided certificate, even an expired one, will still be better<br>
than one the BMC self signs.=C2=A0 Between having an invalid certificate<br=
>
chain, and an invalid date, I&#39;ll take the invalid date every time.<br>
<br>
It should be noted, most browsers (in my testing) seem to ignore the<br>
HTTP date header entirely, so the BMC doesn&#39;t even need the correct<br>
time to set up a proper encryption channel.<br>
<br>
&gt;<br>
&gt; BMCWeb configuration?=C2=A0 Configure option: delete cert and generate=
<br>
&gt; self-signed -vs- use defective certificate.=C2=A0 What is the purpose =
of<br>
&gt; deleting the unusable cert?<br>
<br>
This question needs answered.=C2=A0 I suspect this was unintentional, and<b=
r>
someone simply used some bad openssl code to attempt to verify the<br>
cert against the (possibly non existent) chain without realizing this<br>
requirement.<br>
<br>
&gt;=C2=A0 Should =E2=80=9Cout of date=E2=80=9D not be part of the<br>
&gt; =E2=80=9Cunusable=E2=80=9D definition? =E2=87=92 Ideas: 1. If bmcweb f=
inds a usable cert but is<br>
&gt; out of date, that cert can still be used.=C2=A0 2. Leave the defective=
<br>
&gt; certificate (do not delete it) and log an error.<br>
<br>
A lot of BMCs don&#39;t have a dedicated RTC, and rely on other systems<br>
(like the PCH or NTP) to get the correct time.=C2=A0 bmcweb needs to come<b=
r>
up long before the PCH or NTP (both of which are also optional) so as<br>
a general rule, using these for valid time is a non-starter.=C2=A0 I could<=
br>
see logging an error _if_ you know time is valid, but I&#39;m not sure how<=
br>
a bmc could know that.<br>
<br>
&gt;<br>
&gt; The group consensus was that BMCWeb should treat its HTTPS site identi=
ty<br>
&gt; certificate like this:<br>
&gt; 1 certificate is perfectly good - Use the certificate<br>
&gt; 2 certificate is good but expired or not yet valid - Use the certifica=
te<br>
&gt; and log a warning<br>
<br>
Add &quot;and we know time has been set appropriately&quot;.=C2=A0 Also, be=
 careful<br>
with not yet valid.=C2=A0 I don&#39;t know how openssl chains handle clock =
skew<br>
between certificate generator and client.=C2=A0 If the BMC has a time<br>
that&#39;s 1 minute fast, is the certificate &quot;not yet valid&quot;?<br>
<br>
&gt; 3 certificate is missing or bad format or algorithm too old - Use<br>
&gt; another certificate or self-generate a certificate (and log that actio=
n)<br>
<br>
We shouldn&#39;t be replacing certificates unless it&#39;s completely missi=
ng<br>
(ie, we&#39;re on a first boot or a factory reset) and wouldn&#39;t be<br>
switching certificates on the fly.=C2=A0 If the algorithm is too old, the<b=
r>
user is free to replace it with their own, which is the right<br>
procedure anyway.=C2=A0 We also have no idea if the user has added this<br>
public certificate to their local root store, so replacing it out of<br>
the blue might look like an attack.=C2=A0 Also, we have no idea if the<br>
users&#39; client systems support the new crypto format.=C2=A0 We could be<=
br>
unintentionally DOSing them if, say, we turn on a new keytype or size<br>
and their clients don&#39;t support that key.<br>
<br>
&gt; There are no cases where BMCWeb should delete any certificate.<br>
<br>
I think I know what you mean, but to be clear, we should delete the<br>
old certificates when they&#39;re replaced.=C2=A0 We should delete root tru=
st<br>
store certificates when requested, ect.=C2=A0 I don&#39;t think we can say =
&quot;no<br>
cases&quot; here.<br>
</blockquote></div></div>

--000000000000e0fdc905ac09fed5--
