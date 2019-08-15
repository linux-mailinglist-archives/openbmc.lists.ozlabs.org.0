Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA828F154
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 18:58:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468XhM2swKzDr8r
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 02:58:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="WutaPDEQ"; 
 dkim-atps=neutral
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468Xgg0kFXzDqpq
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 02:57:34 +1000 (AEST)
Received: by mail-io1-xd34.google.com with SMTP id z3so494100iog.0
 for <openbmc@lists.ozlabs.org>; Thu, 15 Aug 2019 09:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tXiWH0nizJ5QOquP+R9iYczfB2hbRRo4y7p1CZJyMQA=;
 b=WutaPDEQBi7gBNAz3lnk4IxWO6Y7Y2fWJhYPnxOggNmSWRBHVeutZDvhEWX5Ifa9Wu
 BcZDhukwwLAGv/9umX7y3iSnJ5Sglqn8FxPoyMX+ebOUB6ljiJK787BvD1PTueWDjRW8
 KL4j1XZCqvkGZ0uEQNmFP725+8enYKz7K6mqHK3DG09uAU2bjTMcD6eQ1vlQiU083O0D
 b7gUNF0MgbnJLnHY899G8MBb7fzwmXUrB6A0PR9JaxsFDwQvt1d1Hl42LGpYrn3egykj
 Flr8kSH/+KUEcUkPcGedCEjvABwf4/djxCy9n0oXA1zMY4JSfQ/y7RzuweAcspsoQ+NX
 k9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tXiWH0nizJ5QOquP+R9iYczfB2hbRRo4y7p1CZJyMQA=;
 b=KtyA1IZNk5gr7fFOYZPetJOpKkayBEqzwze1S1NMy/8L89QSGTUkYNZa2Jyyhbsoy9
 DoNE3OVDnNNHa4EslSGRIZltGfrZvEqLwlnAl1d3GnsEzbpGyCfoFq67jJSSD2tPCNrh
 Bls8BnN0SECyVh+dpNuIImM/ZXbIlY+HGyizwgfAIZMwmVla0Aa8HrOx1jtiWXI1Oc8G
 +uzy9dzHbXJh1YfEBrzIuR8GSQ/7dVHPvatABssomi0/EUV/bKL6amzaIdkUhBz6TwvB
 N9f1cZ976AaFYLZvsM8106pz06ZnMrfAd58Nq182XLjUBmTZA6swIrUSg1TSSoJTHiBq
 8sQg==
X-Gm-Message-State: APjAAAWcP+gepb9bz7DdA4s0D/F5evh6Tbp8dzk6EKd5qVsW+5rESCz2
 /MfA/QcGE45b/YGCWSMrNxASoOj5WyNS3/Kny3vEsw==
X-Google-Smtp-Source: APXvYqzKy1VHWXTsfBJxaO+eNQ1d3c1hc66sr52zuh7Y4lGSgxLSUxXcAwMy6chY9Y8W65LV3cCt+FWzR+pVW1OzweE=
X-Received: by 2002:a02:ce35:: with SMTP id v21mr5979486jar.108.1565888250364; 
 Thu, 15 Aug 2019 09:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <FB0EDEFC-F92E-4F6E-B6BC-B0C5E7AD6E73@fb.com>
 <CAJoAoZm9QpFgRdCsxoaNuCu1YONm_CFUp1fhdFj+h5uZhuCzAw@mail.gmail.com>
 <CF903FDC-3D9E-4FB9-8A3E-34ABB5BDD6B8@fb.com>
 <OF838F4B69.A8C14781-ON00258457.005B6C1A-00258457.005B781B@notes.na.collabserv.com>
In-Reply-To: <OF838F4B69.A8C14781-ON00258457.005B6C1A-00258457.005B781B@notes.na.collabserv.com>
From: Kun Yi <kunyi@google.com>
Date: Thu, 15 Aug 2019 09:57:04 -0700
Message-ID: <CAGMNF6XTn4ktTXj6zVkviS3J5OOKwSkNYUBDsrnfPrT2EH3WSQ@mail.gmail.com>
Subject: Re: Historical Sensor Information
To: Milton Miller II <miltonm@us.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000ec65db05902ac4df"
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
Cc: Emily Shaffer <emilyshaffer@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Wilfred Smith <wilfredsmith@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000ec65db05902ac4df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2019 at 9:41 AM Milton Miller II <miltonm@us.ibm.com> wrote=
:

> On August 15, 2019, Wilfred Smith wrote:
> >I=E2=80=99ll need to check with my compatriots here at Facebook for our
> >specific use cases.
> >
> >Can you point me to the discussion on metrics reporting?
> >
>
> Probably this thread here, there seems to be a working group with a
> meeting schedule:
>
> https://lists.ozlabs.org/pipermail/openbmc/2019-August/017412.html
>
> Platform telemetry and health monitoring - PST AM
>
>
> https://github.com/openbmc/openbmc/wiki/Platform-telemetry-and-health-mon=
itoring-Work-Group
>
> We are currently looking into using collectd to store metrics. You can
look into the design doc proposal here:
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/22257
The design still needs to be fleshed out in a few places, but we are
working towards implementing a prototype.

How far back and how often you need to collect sensor information is also
important. If you are interested in discussion, could you fill out this
form to specify your FR? thanks

 https://docs.google.com/spreadsheets/d/12gMMXB9r_WfWDf5wz-Z_zXsz6RNheC6p2L=
Kp7HePAEE/edit?usp=3Dsharing
<https://docs.google.com/spreadsheets/d/12gMMXB9r_WfWDf5wz-Z_zXsz6RNheC6p2L=
Kp7HePAEE/edit?usp=3Dsharing>

>
> >> On Aug 14, 2019, at 7:51 PM, Emily Shaffer
> ><emilyshaffer@google.com> wrote:
> >>
> >> On Wed, Aug 14, 2019 at 4:05 PM Wilfred Smith <wilfredsmith@fb.com>
> >wrote:
> >>>
> >>> I presume most vendors desire the ability to query historical
> >sensor information from the BMC.
> >>>        Has this feature been implemented already? If so, please
> >direct me.
> >>>        If not, has someone already begun development?
> >>>        Is there an existing specification or write-up?
> >>>        Any =E2=80=98druthers or preferences on how I might proceed su=
ch
> >that my effort benefits the wider community?
> >>>
> >>> Wilfred
> >>
> >> I think that the space constriction on many BMCs has left folks to
> >> instead query over IPMI/Redfish and compile historical information
> >> elsewhere. Can you tell a little more about the use case and
> >indicate
> >> why you would rather save history on the BMC than off the BMC?
> >>
> >> A related topic which - as I recall - was discussed and never
> >> implemented is the topic of metrics reporting. It's possible that
> >the
> >> community has moved further on these topics than I remember,
> >though,
> >> as I've been fairly out of the loop lately.
> >> - Emily
> >
> >
>
>

--=20
Regards,
Kun

--000000000000ec65db05902ac4df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 15, 2019 at 9:41 AM Milton Mi=
ller II &lt;<a href=3D"mailto:miltonm@us.ibm.com">miltonm@us.ibm.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Augu=
st 15, 2019, Wilfred Smith wrote:<br>
&gt;I=E2=80=99ll need to check with my compatriots here at Facebook for our=
<br>
&gt;specific use cases.<br>
&gt;<br>
&gt;Can you point me to the discussion on metrics reporting?<br>
&gt;<br>
<br>
Probably this thread here, there seems to be a working group with a meeting=
 schedule:<br>
<br>
<a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2019-August/017412.ht=
ml" rel=3D"noreferrer" target=3D"_blank">https://lists.ozlabs.org/pipermail=
/openbmc/2019-August/017412.html</a><br>
<br>
Platform telemetry and health monitoring - PST AM <br>
<br>
<a href=3D"https://github.com/openbmc/openbmc/wiki/Platform-telemetry-and-h=
ealth-monitoring-Work-Group" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/openbmc/openbmc/wiki/Platform-telemetry-and-health-monitoring-Wor=
k-Group</a><br>
<br></blockquote><div>We are currently looking into using collectd to store=
 metrics. You can look into the design doc proposal here:=C2=A0</div><div><=
a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/22257">https:=
//gerrit.openbmc-project.xyz/c/openbmc/docs/+/22257</a><br></div><div>The d=
esign still needs to be fleshed out in a few places, but we are working tow=
ards implementing a prototype.<br></div><div><br></div><div>How far back an=
d how often you need to collect sensor information is also important. If yo=
u are interested in discussion, could you fill out this form to specify you=
r FR? thanks</div><div><br></div><div></div><div><a href=3D"https://docs.go=
ogle.com/spreadsheets/d/12gMMXB9r_WfWDf5wz-Z_zXsz6RNheC6p2LKp7HePAEE/edit?u=
sp=3Dsharing">=C2=A0https://docs.google.com/spreadsheets/d/12gMMXB9r_WfWDf5=
wz-Z_zXsz6RNheC6p2LKp7HePAEE/edit?usp=3Dsharing</a></div><div><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt;&gt; On Aug 14, 2019, at 7:51 PM, Emily Shaffer<br>
&gt;&lt;<a href=3D"mailto:emilyshaffer@google.com" target=3D"_blank">emilys=
haffer@google.com</a>&gt; wrote:<br>
&gt;&gt; <br>
&gt;&gt; On Wed, Aug 14, 2019 at 4:05 PM Wilfred Smith &lt;<a href=3D"mailt=
o:wilfredsmith@fb.com" target=3D"_blank">wilfredsmith@fb.com</a>&gt;<br>
&gt;wrote:<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; I presume most vendors desire the ability to query historical<=
br>
&gt;sensor information from the BMC.<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Has this feature been implemented a=
lready? If so, please<br>
&gt;direct me.<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 If not, has someone already begun d=
evelopment?<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Is there an existing specification =
or write-up?<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Any =E2=80=98druthers or preference=
s on how I might proceed such<br>
&gt;that my effort benefits the wider community?<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; Wilfred<br>
&gt;&gt; <br>
&gt;&gt; I think that the space constriction on many BMCs has left folks to=
<br>
&gt;&gt; instead query over IPMI/Redfish and compile historical information=
<br>
&gt;&gt; elsewhere. Can you tell a little more about the use case and<br>
&gt;indicate<br>
&gt;&gt; why you would rather save history on the BMC than off the BMC?<br>
&gt;&gt; <br>
&gt;&gt; A related topic which - as I recall - was discussed and never<br>
&gt;&gt; implemented is the topic of metrics reporting. It&#39;s possible t=
hat<br>
&gt;the<br>
&gt;&gt; community has moved further on these topics than I remember,<br>
&gt;though,<br>
&gt;&gt; as I&#39;ve been fairly out of the loop lately.<br>
&gt;&gt; - Emily<br>
&gt;<br>
&gt;<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Regards,<div>Kun</div></div></d=
iv></div>

--000000000000ec65db05902ac4df--
