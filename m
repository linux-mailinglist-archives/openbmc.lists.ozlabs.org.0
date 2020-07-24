Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F57B22C964
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 17:44:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCtmr50J0zDqDr
	for <lists+openbmc@lfdr.de>; Sat, 25 Jul 2020 01:44:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::236;
 helo=mail-oi1-x236.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jSfPQ0OM; dkim-atps=neutral
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCr2866nRzF0mF
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 23:41:00 +1000 (AEST)
Received: by mail-oi1-x236.google.com with SMTP id y22so8006520oie.8
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 06:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=3w/Ut9ya+rsKK2CWTsB4wAAgTSg/OHkAbzmzPcr/pbE=;
 b=jSfPQ0OMkweFkLt4wtGUGAisB75NIAAL6Jepp3eSSkL4KaGk16fdoXefo9okA8bRMN
 GdDP8YCiaT685E4CbqcmFjXdLk8Q1zAkQnrMXBYfUF0Wmk8rve1bjasxDSAdqhw/jfVe
 3wpYWtxGkP7UYO+UE5fyCAXHg2o9WI9MLYlZaGJrhDETOenvYPriH+9TFBfR5NY96ktw
 a+UehkYpzz28zFVF3kcO00zThmrAAUzdHSOBn9qvGVuD5K3I013OhvtMthMFSKbVW4LQ
 bMecNcXcY/BoUFWlH9tiXORgbfGysBvNb/d96rjg+8GRtLmujrG7YiYPgbCP/JvIesjz
 dMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=3w/Ut9ya+rsKK2CWTsB4wAAgTSg/OHkAbzmzPcr/pbE=;
 b=Y9MOgTvDJl0tWmpA1CvWtfNSxtsbUTxznveomxHtciUGJ1e9FFk7yeMMGYEFv7p+aS
 HbNeu2g3xs3HkaHS0nq98VdeoSHfBp50Sf3H35j3/aTPufdDCedLJynvaPru8Ktn7FSc
 LC3XtVpPHTBPlRMU73D074wCHKbnAwRoLzmq9WUtQVT5JibpC0Bdyxu10FwQdJACo7dt
 kIPiE3nUZlXYLjHRDX99cEpSRlYT8w0J5Uvw+5c26qnKuT0aRAR8GA/ImpWoYe6oqq+X
 mxX5mUFnQhXcQzLo5kVVrV8XzQIR/eV0w0n/useXbu/R9Z+7iHqoHUY5Z7itTHt3WPqR
 uVFg==
X-Gm-Message-State: AOAM533vnJzgGXKjsD/+GQbqF4fvXYfCffW9nePZ/QHJPSuRE+9vLbAg
 G1R1ISfffmRk/BJhQBhrdVM=
X-Google-Smtp-Source: ABdhPJxpIqcI1EbdX7YZbfzuWpIGyEpJa2QnspnJcEDMpYDk6jeqZRXFeAQceWwYYt2iTt+ZfUUlRw==
X-Received: by 2002:aca:5842:: with SMTP id m63mr8216411oib.5.1595598057228;
 Fri, 24 Jul 2020 06:40:57 -0700 (PDT)
Received: from ?IPv6:2600:100e:b056:6066:d65:6de:d899:6281?
 ([2600:100e:b056:6066:d65:6de:d899:6281])
 by smtp.gmail.com with ESMTPSA id o84sm138709oif.55.2020.07.24.06.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jul 2020 06:40:56 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-D127B3BC-F6D4-4E28-B22F-E8E8EE4686EB
Content-Transfer-Encoding: 7bit
From: Mike <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Query regarding using the Redfish in OpenBMC
Date: Fri, 24 Jul 2020 07:40:55 -0600
Message-Id: <7FA6C0BB-1883-40DE-9FD1-9288658C09AA@gmail.com>
References: <CAD+gp9D5RRCy=onUg-PdzD91eCom--4y9QvPjjFiFLRSvTf0jw@mail.gmail.com>
In-Reply-To: <CAD+gp9D5RRCy=onUg-PdzD91eCom--4y9QvPjjFiFLRSvTf0jw@mail.gmail.com>
To: khader basha shaik <shaikkhaderbasha601@gmail.com>
X-Mailer: iPhone Mail (17F80)
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
 "openbmcbump-github@yahoo.com" <openbmcbump-github@yahoo.com>,
 Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail-D127B3BC-F6D4-4E28-B22F-E8E8EE4686EB
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

I=E2=80=99m trying to do the same and struggling to get it up on a Rasp Pi 4=
.

My first approach was to add layers to meta-raspberrypi, and I got to the po=
int where the web was up, but I could not log in with root. I added a missin=
g layer that adds groups to the accounts and will test later today.

The second approach was to use the evb config files. But it can=E2=80=99t ma=
ke the image. It seems to be using meta-phosphor image layers instead of met=
a-raspberrypi layers. I used openbmc tag 2.9. I will try 2.8 later and see i=
f it compiles.

I will post more details later. I can provide config files etc. I am away fr=
om my computer for awhile.

How are you building? Are you using an evb config? What tag are you using?



Sent from my iPhone

> On Jul 24, 2020, at 6:01 AM, khader basha shaik <shaikkhaderbasha601@gmail=
.com> wrote:
>=20
> =EF=BB=BF
> Hi Joseph,
>=20
> Thanks for your response.=20
>=20
> I will be using Raspberrypi3 system.
>=20
> Can you please guide what further steps I should take in order to view the=
 /redfish/v1 content in the web(https://xxx.xxx.xxx:8000/redfish/v1).
>=20
> Any pointer on this is really helpful.
>=20
> I have gone through the documents the developer docs but could not find an=
ything that points to enabling the redfish stuff in the browser.
> Please correct me if i am wrong
>=20
> Thanks & Regards,
> Khader B Shaik
>=20
>=20
>=20
>> On Thu, 23 Jul 2020 at 19:25, Joseph Reynolds <jrey@linux.ibm.com> wrote:=

>> On 7/23/20 5:48 AM, khader basha shaik wrote:
>> > Hi Team,
>> >
>> > I am newbiee to  Openbmc.  I want to view  the redfish/v1=20
>> > (https://10.xxx.xxx.xxx:8000/redfish/v1) contents in the browser=20
>> > .Could you please guide me on what changes i need to so that i view=20
>> > the /redfish/v1/ content in the browser .
>> >
>> > here are the steps i have followed:
>> >
>> >  1. Clone OpenBMC project : git clone
>> >     https://github.com/openbmc/openbmc.git in the server machine .
>> >  2. Compile using the following command:
>> >     TEMPLATECONF=3Dmeta-phosphor/conf  . openbmc-env
>> >  3. modify the following files:
>> >
>> >   *  #build vi conf/local.conf  (modify the  line "-MACHINE??=3Dqemuarm=
"
>> >     " to "-MACHINE??=3Draspberrypi3-64" "
>> >   * #build vi conf/bblayer.conf (add the following line
>> >     "/home/khader<username>/openbmc/meta-raspberrypi \"  to the line=20=

>> >     above /home/khader<username>/openbmc/metaphosphor \"
>> >
>> >        4. #build  bitbake obmc-phosphor-image
>> >
>> > The above steps I have used to build an Openbmc project.
>> >
>> >
>> > Can you help me what further steps should i need to do so that i can=20=

>> > view the /redfish/v1/  content in the webbrowser.
>>=20
>> What BMC system will you use to upload, boot, and run the BMC firmware=20=

>> image?  A QEMU virtual system?
>> Have you seen the developer docs here?=20
>> https://github.com/openbmc/docs/tree/master/development
>>=20
>> Good luck,
>> - Joseph
>>=20
>> >
>> > Note:- I am compiling the openbmc code in the server machine.
>> >
>> > Any help /guidelines on this will really help me alot.
>> > Appreciate all your help.
>> >
>> > Thanks & Regards,
>> > khader B Shaik
>>=20

--Apple-Mail-D127B3BC-F6D4-4E28-B22F-E8E8EE4686EB
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">I=E2=80=99m trying to do the same and strug=
gling to get it up on a Rasp Pi 4.<div><br></div><div>My first approach was t=
o add layers to meta-raspberrypi, and I got to the point where the web was u=
p, but I could not log in with root. I added a missing layer that adds group=
s to the accounts and will test later today.</div><div><br></div><div>The se=
cond approach was to use the evb config files. But it can=E2=80=99t make the=
 image. It seems to be using meta-phosphor image layers instead of meta-rasp=
berrypi layers. I used openbmc tag 2.9. I will try 2.8 later and see if it c=
ompiles.</div><div><br></div><div>I will post more details later. I can prov=
ide config files etc. I am away from my computer for awhile.</div><div><br><=
/div><div>How are you building? Are you using an evb config? What tag are yo=
u using?</div><div><br></div><div><br><br><div dir=3D"ltr">Sent from my iPho=
ne</div><div dir=3D"ltr"><br><blockquote type=3D"cite">On Jul 24, 2020, at 6=
:01 AM, khader basha shaik &lt;shaikkhaderbasha601@gmail.com&gt; wrote:<br><=
br></blockquote></div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<d=
iv dir=3D"ltr"><div>Hi Joseph,</div><div><br></div>Thanks for your response.=
&nbsp;<br><div><br></div><div>I will be using Raspberrypi3 system.</div><div=
><br></div><div>Can you please guide what further steps I should take in ord=
er to view the /redfish/v1 content in the web(<a href=3D"https://xxx.xxx.xxx=
:8000/redfish/v1">https://xxx.xxx.xxx:8000/redfish/v1</a>).</div><div><br></=
div><div>Any pointer on this is really helpful.</div><div><br></div><div>I h=
ave gone through the documents the developer docs but could not find anythin=
g that points to enabling the redfish stuff in the browser.</div><div>Please=
 correct me if i am wrong</div><div><br></div><div>Thanks &amp; Regards,</di=
v><div>Khader B Shaik</div><div><br></div><div><br></div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 23 Jul 2020 a=
t 19:25, Joseph Reynolds &lt;<a href=3D"mailto:jrey@linux.ibm.com">jrey@linu=
x.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On 7/23/20 5:48 AM, khader basha shaik wrote:<br>
&gt; Hi Team,<br>
&gt;<br>
&gt; I am newbiee to&nbsp; Openbmc.&nbsp; I want to view&nbsp; the redfish/v=
1 <br>
&gt; (<a href=3D"https://10.xxx.xxx.xxx:8000/redfish/v1" rel=3D"noreferrer" t=
arget=3D"_blank">https://10.xxx.xxx.xxx:8000/redfish/v1</a>) contents in the=
 browser <br>
&gt; .Could you please guide me on what changes i need to so that&nbsp;i&nbs=
p;view <br>
&gt; the /redfish/v1/ content in the browser .<br>
&gt;<br>
&gt; here are the steps i have followed:<br>
&gt;<br>
&gt;&nbsp; 1. Clone OpenBMC project : git clone<br>
&gt;&nbsp; &nbsp; &nbsp;<a href=3D"https://github.com/openbmc/openbmc.git" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/openbmc.git</=
a>&nbsp;in the server machine .<br>
&gt;&nbsp; 2. Compile using the following command:<br>
&gt;&nbsp; &nbsp; &nbsp;TEMPLATECONF=3Dmeta-phosphor/conf&nbsp; . openbmc-en=
v<br>
&gt;&nbsp; 3. modify the following files:<br>
&gt;<br>
&gt;&nbsp; &nbsp;* &nbsp;#build vi conf/local.conf &nbsp;(modify the&nbsp; l=
ine "-MACHINE??=3Dqemuarm"<br>
&gt;&nbsp; &nbsp; &nbsp;" to "-MACHINE??=3Draspberrypi3-64" "<br>
&gt;&nbsp; &nbsp;* #build vi conf/bblayer.conf&nbsp;(add the following line<=
br>
&gt;&nbsp; &nbsp; &nbsp;"/home/khader&lt;username&gt;/openbmc/meta-raspberry=
pi \"&nbsp; to the line&nbsp;<br>
&gt;&nbsp; &nbsp; &nbsp;above /home/khader&lt;username&gt;/openbmc/metaphosp=
hor \"<br>
&gt;<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp;4. #build&nbsp; bitbake obmc-phosphor-image<=
br>
&gt;<br>
&gt; The above steps I have used to build an Openbmc project.<br>
&gt;<br>
&gt;<br>
&gt; Can you help me what further steps should i need to do so that i can <b=
r>
&gt; view the /redfish/v1/&nbsp; content in the webbrowser.<br>
<br>
What BMC system will you use to upload, boot, and run the BMC firmware <br>
image?&nbsp; A QEMU virtual system?<br>
Have you seen the developer docs here? <br>
<a href=3D"https://github.com/openbmc/docs/tree/master/development" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/openbmc/docs/tree/master/dev=
elopment</a><br>
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
</div></blockquote></div></body></html>=

--Apple-Mail-D127B3BC-F6D4-4E28-B22F-E8E8EE4686EB--
