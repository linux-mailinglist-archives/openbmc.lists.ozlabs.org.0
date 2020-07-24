Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC45922C4A0
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 14:00:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCnp01MVTzF0c5
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 22:00:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=shaikkhaderbasha601@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=f9phYXZ6; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCnn84VgkzF0Ys
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 21:59:40 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id mn17so5107805pjb.4
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 04:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yVRJ64FMioiaI0Mohp3AQnVoVwFvdw36rrZu5t7dmvI=;
 b=f9phYXZ69tA+ScGnzE6xcFR97F7DT37BXrnhRFZlymX4QcgaZdQjXojm6BotYchw4g
 4E8waxwFEFLzF9Y7G5J3DhnaoxOt1zDRdwTJ/kU2ILy8o96Cs0k+QjvPW/mZ2TcfBAr+
 KHyvFMWeAsJ6h84RfCCW1T2ggGjfMc2+IK6WGBF32ef8DI/mZpEc65Dk24evV6qIBIaG
 4prFnCJfnWWFp6pW7mAM0/DDNiOz4aBwQQS8lHb9gwWrntyR1uojt+daQVUM2VoVSNzf
 ivwsIsrMzwCKG/OAhBcpYD+qjzfBKWzGRw1h0NqLsIGuwDjGH0+SCevqYaTnK4pNJ55N
 ZCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yVRJ64FMioiaI0Mohp3AQnVoVwFvdw36rrZu5t7dmvI=;
 b=E1cPXxZQwlxRrBxgCD7XFxx6TfzIzdX6MUoEp/DNc+N9p6GVBkxDszls9UAlDlSVgP
 JKJokpHl+z/XAByQUK6QTId7iWRMYhpO/+KoM92PBJaQTpPcnuKqH7mV9Rt8BCZwKD8K
 Nn0MU84YJc1Lg4FT9A5O1YmZfZUPBiL0nJQ8hczBFQX1NIH40H9HLN375fnSLvrW2ibE
 L2l0mm+cAyZw66K3qj0j3e2nawbin6HGr09sORaXusjZ1PaWeCNy0g4aRwSqR1Q80i+4
 SZRSBzncyiFAN81zi8+N1t+UBzzQ9i8wSu3mrP0QOAiWHjJ4ta2hzf0AjXMO4XSnAsMR
 NOXQ==
X-Gm-Message-State: AOAM531It4iYyes/JZggwsX4I8lBKm6E4j4+kie7ahruppLFlLIccSnj
 1nftLyjSUDq4Myu3hOBWrzcfoneUcxmRyDgKlno=
X-Google-Smtp-Source: ABdhPJy0h6U0JKBWRGr3oz5WQSKQXiImAQWLEQdgzt0MnehDc4NZCaYbEfqz6z6CL+DmfhIAHhuPBxep84lu6zYISX8=
X-Received: by 2002:a17:90a:110:: with SMTP id
 b16mr4944473pjb.235.1595591976711; 
 Fri, 24 Jul 2020 04:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAD+gp9A-mBeKrFTZdVuQ6uz3snDAv2zF-db_=edR=4pOtFcUuQ@mail.gmail.com>
 <CAD+gp9CSsZyhrzG+B+EqB+koBvUSpwB4s56RqrtRD3UHmQfu3w@mail.gmail.com>
 <fb32bf4e-d6d8-15a2-14d8-3d3be3be3276@linux.ibm.com>
In-Reply-To: <fb32bf4e-d6d8-15a2-14d8-3d3be3be3276@linux.ibm.com>
From: khader basha shaik <shaikkhaderbasha601@gmail.com>
Date: Fri, 24 Jul 2020 17:29:26 +0530
Message-ID: <CAD+gp9D5RRCy=onUg-PdzD91eCom--4y9QvPjjFiFLRSvTf0jw@mail.gmail.com>
Subject: Re: Query regarding using the Redfish in OpenBMC
To: Joseph Reynolds <jrey@linux.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000fa7b8505ab2eb4a4"
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
 "openbmcbump-github@yahoo.com" <openbmcbump-github@yahoo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000fa7b8505ab2eb4a4
Content-Type: text/plain; charset="UTF-8"

Hi Joseph,

Thanks for your response.

I will be using Raspberrypi3 system.

Can you please guide what further steps I should take in order to view the
/redfish/v1 content in the web(https://xxx.xxx.xxx:8000/redfish/v1).

Any pointer on this is really helpful.

I have gone through the documents the developer docs but could not find
anything that points to enabling the redfish stuff in the browser.
Please correct me if i am wrong

Thanks & Regards,
Khader B Shaik



On Thu, 23 Jul 2020 at 19:25, Joseph Reynolds <jrey@linux.ibm.com> wrote:

> On 7/23/20 5:48 AM, khader basha shaik wrote:
> > Hi Team,
> >
> > I am newbiee to  Openbmc.  I want to view  the redfish/v1
> > (https://10.xxx.xxx.xxx:8000/redfish/v1) contents in the browser
> > .Could you please guide me on what changes i need to so that i view
> > the /redfish/v1/ content in the browser .
> >
> > here are the steps i have followed:
> >
> >  1. Clone OpenBMC project : git clone
> >     https://github.com/openbmc/openbmc.git in the server machine .
> >  2. Compile using the following command:
> >     TEMPLATECONF=meta-phosphor/conf  . openbmc-env
> >  3. modify the following files:
> >
> >   *  #build vi conf/local.conf  (modify the  line "-MACHINE??=qemuarm"
> >     " to "-MACHINE??=raspberrypi3-64" "
> >   * #build vi conf/bblayer.conf (add the following line
> >     "/home/khader<username>/openbmc/meta-raspberrypi \"  to the line
> >     above /home/khader<username>/openbmc/metaphosphor \"
> >
> >        4. #build  bitbake obmc-phosphor-image
> >
> > The above steps I have used to build an Openbmc project.
> >
> >
> > Can you help me what further steps should i need to do so that i can
> > view the /redfish/v1/  content in the webbrowser.
>
> What BMC system will you use to upload, boot, and run the BMC firmware
> image?  A QEMU virtual system?
> Have you seen the developer docs here?
> https://github.com/openbmc/docs/tree/master/development
>
> Good luck,
> - Joseph
>
> >
> > Note:- I am compiling the openbmc code in the server machine.
> >
> > Any help /guidelines on this will really help me alot.
> > Appreciate all your help.
> >
> > Thanks & Regards,
> > khader B Shaik
>
>

--000000000000fa7b8505ab2eb4a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Joseph,</div><div><br></div>Thanks for your respon=
se.=C2=A0<br><div><br></div><div>I will be using Raspberrypi3 system.</div>=
<div><br></div><div>Can you please guide what further steps I should take i=
n order to view the /redfish/v1 content in the web(<a href=3D"https://xxx.x=
xx.xxx:8000/redfish/v1">https://xxx.xxx.xxx:8000/redfish/v1</a>).</div><div=
><br></div><div>Any pointer on this is really helpful.</div><div><br></div>=
<div>I have gone through the documents the developer docs but could not fin=
d anything that points to enabling the redfish stuff in the browser.</div><=
div>Please correct me if i am wrong</div><div><br></div><div>Thanks &amp; R=
egards,</div><div>Khader B Shaik</div><div><br></div><div><br></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu,=
 23 Jul 2020 at 19:25, Joseph Reynolds &lt;<a href=3D"mailto:jrey@linux.ibm=
.com">jrey@linux.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On 7/23/20 5:48 AM, khader basha shaik wrote:<br>
&gt; Hi Team,<br>
&gt;<br>
&gt; I am newbiee to=C2=A0 Openbmc.=C2=A0 I want to view=C2=A0 the redfish/=
v1 <br>
&gt; (<a href=3D"https://10.xxx.xxx.xxx:8000/redfish/v1" rel=3D"noreferrer"=
 target=3D"_blank">https://10.xxx.xxx.xxx:8000/redfish/v1</a>) contents in =
the browser <br>
&gt; .Could you please guide me on what changes i need to so that=C2=A0i=C2=
=A0view <br>
&gt; the /redfish/v1/ content in the browser .<br>
&gt;<br>
&gt; here are the steps i have followed:<br>
&gt;<br>
&gt;=C2=A0 1. Clone OpenBMC project : git clone<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/openbmc/openbmc.git" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/openbmc.git=
</a>=C2=A0in the server machine .<br>
&gt;=C2=A0 2. Compile using the following command:<br>
&gt;=C2=A0 =C2=A0 =C2=A0TEMPLATECONF=3Dmeta-phosphor/conf=C2=A0 . openbmc-e=
nv<br>
&gt;=C2=A0 3. modify the following files:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0* =C2=A0#build vi conf/local.conf =C2=A0(modify the=C2=A0 =
line &quot;-MACHINE??=3Dqemuarm&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot; to &quot;-MACHINE??=3Draspberrypi3-64&quot; =
&quot;<br>
&gt;=C2=A0 =C2=A0* #build vi conf/bblayer.conf=C2=A0(add the following line=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;/home/khader&lt;username&gt;/openbmc/meta-ras=
pberrypi \&quot;=C2=A0 to the line=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0above /home/khader&lt;username&gt;/openbmc/metaphos=
phor \&quot;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A04. #build=C2=A0 bitbake obmc-phosphor-image=
<br>
&gt;<br>
&gt; The above steps I have used to build an Openbmc project.<br>
&gt;<br>
&gt;<br>
&gt; Can you help me what further steps should i need to do so that i can <=
br>
&gt; view the /redfish/v1/=C2=A0 content in the webbrowser.<br>
<br>
What BMC system will you use to upload, boot, and run the BMC firmware <br>
image?=C2=A0 A QEMU virtual system?<br>
Have you seen the developer docs here? <br>
<a href=3D"https://github.com/openbmc/docs/tree/master/development" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/openbmc/docs/tree/master/d=
evelopment</a><br>
<br>
Good luck,<br>
- Joseph<br>
<br>
&gt;<br>
&gt; Note:- I am compiling the openbmc code in the server machine.<br>
&gt;<br>
&gt; Any help /guidelines on this will really help me alot.<br>
&gt; Appreciate all your help.<br>
&gt;<br>
&gt; Thanks &amp; Regards,<br>
&gt; khader B Shaik<br>
<br>
</blockquote></div>

--000000000000fa7b8505ab2eb4a4--
