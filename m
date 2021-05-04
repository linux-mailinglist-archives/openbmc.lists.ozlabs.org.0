Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DFA372BE9
	for <lists+openbmc@lfdr.de>; Tue,  4 May 2021 16:22:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZMVf5xsXz2yyP
	for <lists+openbmc@lfdr.de>; Wed,  5 May 2021 00:22:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=akBu879C;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::333;
 helo=mail-ot1-x333.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=akBu879C; dkim-atps=neutral
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZMVK5n7yz2y88
 for <openbmc@lists.ozlabs.org>; Wed,  5 May 2021 00:21:59 +1000 (AEST)
Received: by mail-ot1-x333.google.com with SMTP id
 g7-20020a9d5f870000b02902a5831ad705so8310890oti.10
 for <openbmc@lists.ozlabs.org>; Tue, 04 May 2021 07:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=jLmMEYpFg9aw4/jDxRkTtWzrRLBxQoSa/SnltvXrOQQ=;
 b=akBu879CSGJeTkcwHuucL8Vq308DcWM+Lry4axOQQFPeFW5Set6vbOtyaYwJgsgB0/
 2BSaHtW2DDrc9oD+9PKQ22uwfqtmZP2OtAyNM/lS0Kjaz1KbBQ10Bukcdizkee6+jdpi
 Bo+Q/SNjQJeR4DNJZNMsYun5C6lX9mwEvdWcofxIx7rDhvjWFmJL641XEI7xAt8KKzZE
 iYuiMuzrFEygmr+ofW0qFYpBxcwvwSe8Dz36xZfq1pjzJUnrBnx0VaTkH9IZJmWf9QtR
 6cYUpPG6iedo5eILYVWPopAwP1RqqVZvDA5n146Rf09Mo6n/VBz+iCr/Nr5oqK0AGvQ+
 xUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=jLmMEYpFg9aw4/jDxRkTtWzrRLBxQoSa/SnltvXrOQQ=;
 b=VgnruO18RF5wlcnuccfTIjcBqIvDSHHeEUHMBTrA9X4aMMnuXSZt/YB1GwqGDsPMY3
 i/KXy0C3ZgGQWMcD02r7oZxLC/4SchKdpXO5WyeqQ8Ag3dL6FECGXjZqkLQnR0bh8doE
 0Mt2bNCgJOSk8rv/WF4IaRppmvq6530mtwFn12/GrQ/Z4SQQndlLPxk+d3bsL1wE9LaW
 p6B/I4OvGbD9AtTQSxsfrMyPiuO9fzrTgZsZegOnyFqC8B2h+KIqqszwaqRTcfeXKS5c
 SFkiZU5CHdOsXr2ghDhzXDEchiW0AOrzdCAFrhKQVZrKo0N6zE378NNy32zbUYDgz/Fv
 tRPA==
X-Gm-Message-State: AOAM532Al+Da3stpkRPD/vuW6XhXmaIJAykDYQ61f5uJA3TChO2glOQQ
 HChkD3x45MT37lyOnFwKLW5bMq1jTlg=
X-Google-Smtp-Source: ABdhPJysFPqG880+JPzNAQvuNlxigx0fkJlafGRERt+JZMfEg8SFzQt8HiEex1w5hLpEXz487+BCsQ==
X-Received: by 2002:a9d:6a18:: with SMTP id g24mr8909503otn.368.1620138115644; 
 Tue, 04 May 2021 07:21:55 -0700 (PDT)
Received: from ?IPv6:2600:100e:b016:7049:e050:bbd7:281:5c49?
 ([2600:100e:b016:7049:e050:bbd7:281:5c49])
 by smtp.gmail.com with ESMTPSA id o25sm685329oie.45.2021.05.04.07.21.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 07:21:55 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-9BF183D6-1404-42AD-9B6F-1B2420E624D6
Content-Transfer-Encoding: 7bit
From: Mike Jones <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: D-bus model proposal for pay for access features
Date: Tue, 4 May 2021 08:21:53 -0600
Message-Id: <0DCE831E-0526-4B92-91DF-EEA42CDB34AB@gmail.com>
References: <CAMhqiMrgpVyQwXXWmyzpvHhgRCG17=5qgs-Qr--9+=U6RLQU1Q@mail.gmail.com>
In-Reply-To: <CAMhqiMrgpVyQwXXWmyzpvHhgRCG17=5qgs-Qr--9+=U6RLQU1Q@mail.gmail.com>
To: Ratan Gupta <ratankgupta31@gmail.com>
X-Mailer: iPad Mail (18D70)
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


--Apple-Mail-9BF183D6-1404-42AD-9B6F-1B2420E624D6
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Ratan,

I am not qualified to comment on =E2=80=9Chow=E2=80=9D, but I see value in a=
 BMC that can license features. However, it should cover both hardware and f=
irmware. I can imagine licensed algorithms implemented as firmware.=20

Given that a licensed feature might impact availability of information via g=
ui or service, it must support queries for availability so services can beha=
ve properly when enabled and disabled.

Mike

Sent from my iPad

> On May 4, 2021, at 1:43 AM, Ratan Gupta <ratankgupta31@gmail.com> wrote:
>=20
> =EF=BB=BF
> Hi Team,
>=20
> Any comments on the below proposal?
>=20
> Ratan
>=20
>> On Fri, Apr 30, 2021 at 11:45 PM Ratan Gupta <ratankgupta31@gmail.com> wr=
ote:
>> Hi All,
>>=20
>> I would like to introduce a dbus model proposal around pay for access fea=
tures.
>> Normally IBM system ships with more hardware than was purchased, which ca=
n be unlocked later.
>>=20
>> Features could be=20
>> 1) AIX enabled/disabled =20
>> 2) How many processors are enabled
>> 3) How much memory is enabled
>>=20
>> Proposed Model:
>>=20
>> The model consists of following main entities:
>> 1 - licenses - these objects represents the features.  There will be a li=
cense represnting=20
>> feature(one is to one relation ship) and these objects have state - activ=
e, inactive, unknown, etc.
>> These objects could implement the Delete interface for when a client wish=
es to disable the license/feature.
>>=20
>> 2 - manager - the manager object (distinct from freedesktop object manage=
r) provides a method
>> interface to create new license objects.
>>=20
>> Alternate Dbus Model:
>>=20
>> 1 - Licenses: these objects represent an agreement.  These objects have a=
n
>> association to one or more features, and these objects have state - activ=
e,inactive, unknown, etc.
>> These objects could implement the Delete interface for when a client wish=
es to disable the license.
>>=20
>> 2 - Features: these objects describe the features available.
>> Feature objects would be static and implementation/platform defined.  A B=
MC or host firmware update=20
>> could potentially add or remove the available features exposed as dbus ob=
jects.  At the moment the=20
>> only feature attribute I can think of is a name and the feature status.
>>=20
>> 3 Manager - the manager object (distinct from freedesktop object manager)=

>> provides a method interface to create new license objects.
>>=20
>> The difference between two models are
>> In the alternate Dbus model we are keeping the feature Dbus object and th=
e License have an associated features
>> In the proposed model we are only keeping the license D-bus object which r=
epresent the feature.
>>=20
>> Flow would be as below with the proposed model -
>> 1/ Manager object would be having interface like upload (License activati=
on key)
>> 2/ On IBM systems we send this key to the host firmware which activates t=
he features
>> 3/ Host Firmware sends the activated feature list to the BMC
>> 4/ BMC creates the licenses for the activated features
>>=20
>> I suspect an implementation of the above flow is highly IBM specific,=20
>> but I hope some of you have some feedback that might enable some collabor=
ation. =20
>> If not - where should we put this application?
>> Ratan

--Apple-Mail-9BF183D6-1404-42AD-9B6F-1B2420E624D6
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Ratan,<div><br></div><div>I am not qualifie=
d to comment on =E2=80=9Chow=E2=80=9D, but I see value in a BMC that can lic=
ense features. However, it should cover both hardware and firmware. I can im=
agine licensed algorithms implemented as firmware.&nbsp;</div><div><br></div=
><div>Given that a licensed feature might impact availability of information=
 via gui or service, it must support queries for availability so services ca=
n behave properly when enabled and disabled.</div><div><br></div><div>Mike<b=
r><br><div dir=3D"ltr">Sent from my iPad</div><div dir=3D"ltr"><br><blockquo=
te type=3D"cite">On May 4, 2021, at 1:43 AM, Ratan Gupta &lt;ratankgupta31@g=
mail.com&gt; wrote:<br><br></blockquote></div><blockquote type=3D"cite"><div=
 dir=3D"ltr">=EF=BB=BF<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Team,</div><=
div><br></div><div>Any comments on the below proposal?</div><div><br></div><=
div>Ratan<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Fri, Apr 30, 2021 at 11:45 PM Ratan Gupta &lt;<a href=3D=
"mailto:ratankgupta31@gmail.com" target=3D"_blank">ratankgupta31@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><pre style=3D"box-sizing:inherit;margin:4px 0px;padding:8px;fon=
t-size:12px;line-height:1.50001;font-variant-ligatures:none;white-space:pre-=
wrap;word-break:normal;font-family:Monaco,Menlo,Consolas,&quot;Courier New&q=
uot;,monospace;border-radius:4px;color:rgb(29,28,29);font-style:normal;font-=
variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:left;te=
xt-indent:0px;text-transform:none;word-spacing:0px;text-decoration-style:ini=
tial;text-decoration-color:initial">Hi All,<br><br><span style=3D"box-sizing=
:inherit;display:block;height:unset"></span>I would like to introduce a dbus=
 model proposal around pay for access features.<span style=3D"box-sizing:inh=
erit;display:block;height:unset"></span>Normally IBM system ships with more h=
ardware than was purchased, which can be unlocked later.<br><br style=3D"box=
-sizing:inherit">Features could be <span style=3D"box-sizing:inherit;display=
:block;height:unset"></span>1) AIX enabled/disabled  <br style=3D"box-sizing=
:inherit">2) How many processors are enabled<br style=3D"box-sizing:inherit"=
>3) How much memory is enabled<br><br><span style=3D"box-sizing:inherit;disp=
lay:block;height:unset"></span><b>Proposed Model:</b><br><br><span style=3D"=
box-sizing:inherit;display:block;height:unset"></span>The model consists of f=
ollowing main entities:<span style=3D"box-sizing:inherit;display:block;heigh=
t:unset"></span>1 - licenses - these objects represents the features.  There=
 will be a license represnting <br>feature(one is to one relation ship) and t=
hese objects have state - active, inactive, unknown, etc.<br style=3D"box-si=
zing:inherit">These objects could implement the Delete interface for when a c=
lient wishes to disable the license/feature.<br><br><span style=3D"box-sizin=
g:inherit;display:block;height:unset"></span><span style=3D"box-sizing:inher=
it;display:block;height:unset"></span>2 - manager - the manager object (dist=
inct from freedesktop object manager) provides a method<br>interface to crea=
te new license objects.<br><br><span style=3D"box-sizing:inherit;display:blo=
ck;height:unset"></span><b>Alternate Dbus Model:</b><br><br><span style=3D"b=
ox-sizing:inherit;display:block;height:unset"></span>1 - Licenses: these obj=
ects represent an agreement.  These objects have an<br style=3D"box-sizing:i=
nherit">association to one or more features, and these objects have state - a=
ctive,inactive, unknown, etc.<br>These objects could implement the Delete in=
terface for when a client wishes to disable the license.<br><br><span style=3D=
"box-sizing:inherit;display:block;height:unset"></span>2 - Features: these o=
bjects describe the features available.<br style=3D"box-sizing:inherit">Feat=
ure objects would be static and implementation/platform defined.  A BMC or h=
ost firmware update <br>could potentially add or remove the available featur=
es exposed as dbus objects.  At the moment the <br>only feature attribute I c=
an think of is a name and the feature status.<br><br><span style=3D"box-sizi=
ng:inherit;display:block;height:unset"></span>3 Manager - the manager object=
 (distinct from freedesktop object manager)<br style=3D"box-sizing:inherit">=
provides a method interface to create new license objects.<br><br><span styl=
e=3D"box-sizing:inherit;display:block;height:unset"></span><span style=3D"bo=
x-sizing:inherit;display:block;height:unset"></span>The difference between t=
wo models are<span style=3D"box-sizing:inherit;display:block;height:unset"><=
/span>In the alternate Dbus model we are keeping the feature Dbus object and=
 the License have an associated features<br style=3D"box-sizing:inherit">In t=
he proposed model we are only keeping the license D-bus object which represe=
nt the feature.<br><br><span style=3D"box-sizing:inherit;display:block;heigh=
t:unset"></span><span style=3D"box-sizing:inherit;display:block;height:unset=
"></span>Flow would be as below with the proposed model -<span style=3D"box-=
sizing:inherit;display:block;height:unset"></span>1/ Manager object would be=
 having interface like upload (License activation key)<br style=3D"box-sizin=
g:inherit">2/ On IBM systems we send this key to the host firmware which act=
ivates the features<br style=3D"box-sizing:inherit">3/ Host Firmware sends t=
he activated feature list to the BMC<br style=3D"box-sizing:inherit">4/ BMC c=
reates the licenses for the activated features<br><br><span style=3D"box-siz=
ing:inherit;display:block;height:unset"></span><span style=3D"box-sizing:inh=
erit;display:block;height:unset"></span>I suspect an implementation of the a=
bove flow is highly IBM specific, <br style=3D"box-sizing:inherit">but I hop=
e some of you have some feedback that might enable some collaboration.  <br s=
tyle=3D"box-sizing:inherit">If not - where should we put this application?<b=
r></pre><pre style=3D"box-sizing:inherit;margin:4px 0px;padding:8px;font-siz=
e:12px;line-height:1.50001;font-variant-ligatures:none;white-space:pre-wrap;=
word-break:normal;font-family:Monaco,Menlo,Consolas,&quot;Courier New&quot;,=
monospace;border-radius:4px;color:rgb(29,28,29);font-style:normal;font-varia=
nt-caps:normal;font-weight:400;letter-spacing:normal;text-align:left;text-in=
dent:0px;text-transform:none;word-spacing:0px;text-decoration-style:initial;=
text-decoration-color:initial">Ratan<br></pre></div>
</blockquote></div>
</div>
</div></blockquote></div></body></html>=

--Apple-Mail-9BF183D6-1404-42AD-9B6F-1B2420E624D6--
