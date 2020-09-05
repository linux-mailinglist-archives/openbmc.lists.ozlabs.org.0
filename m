Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A84225E5FE
	for <lists+openbmc@lfdr.de>; Sat,  5 Sep 2020 09:36:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bk5vc2dCszDqkg
	for <lists+openbmc@lfdr.de>; Sat,  5 Sep 2020 17:36:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::631;
 helo=mail-ej1-x631.google.com; envelope-from=asmithakarun@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NKaE1kKB; dkim-atps=neutral
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bk5tp4rwqzDqkf
 for <openbmc@lists.ozlabs.org>; Sat,  5 Sep 2020 17:35:44 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id a15so11400722ejf.11
 for <openbmc@lists.ozlabs.org>; Sat, 05 Sep 2020 00:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D1MXzo7t8UF95N8mpZ4u+3GvIu3NYZgPl01E0u1Qaw4=;
 b=NKaE1kKBWBTV8fIWWFDcSdtj3Li5jZc5L2cY+6oAPhIGKzKNEgeEujVUW4ssw3/pR/
 ywiBmCrMo99k5z7zDa9N7AHyLF6UTuV0AoPvNBrdlayXQPiwDzv7TKtfjr7wxWDqrDPV
 EWx2GQ5Tde+GLaPoNkW/lU7YCdR6scmypstvYZ4xgoUenJG9pMDziz1zIZ+eVs9/v+4s
 5SfqiouEKB1GaMVzSkvb4g/JrFFC8EYzwioaC/fV7Bgy+xXjaEVIQlsIxloozvS0oNKz
 qgTCeKXJJiaZFTihDfNP18V7VzzcWCkNP5p7XzVJOwhO7H2V+SA1c0YEsw3exVs+jbDj
 s5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D1MXzo7t8UF95N8mpZ4u+3GvIu3NYZgPl01E0u1Qaw4=;
 b=rzrKugUohN3nI58rp8j3zN5KDXhosBRy7tdQQbqRhBmxT45ehSHPzrM6Ds+9vjJ7yk
 P3s7O5T04VWd7fsBmEmSbQ0HJ9hJJulapyFXQYH7egYPyDGcmknjx+CcZar/cC4soTI8
 uLRr9G/GYFIs5qbOVgrHaYZhxL0seq/oXMQ2PaWezQuAKYMKRZBe9/4dgNlibjZEKcxx
 1UWVV2hmFjzKw3skQOV24kJ7sJAo+VLajfQvV3dK/+gmaPIfBIXr5KBFqvIR1aTGuWYz
 h1+4ytelzY9ZujUOwZ1IpuoHvLw+nqckRKK6uAheu3o3leh1mBtx8Ej4QfTbge0pNnop
 gwaQ==
X-Gm-Message-State: AOAM532LRcqosV+oYbqaoPgNxYT7v3g1mwpUzfGlothU77S6kH3VYuXM
 hi18YjshBENE9tvC6HXABafCP0QAgqSGirbp8D4=
X-Google-Smtp-Source: ABdhPJwEGAziuBvHzzZ5h82qK3wM+4i9phEfOAl7dHnMvlOl7Jnuvp8t7DJYmOVT7E7fCGEu5YygoDN1gQBYEks8nNM=
X-Received: by 2002:a17:906:a88a:: with SMTP id
 ha10mr12084965ejb.532.1599291340439; 
 Sat, 05 Sep 2020 00:35:40 -0700 (PDT)
MIME-Version: 1.0
References: <CANGK-S5k=Dy+nf9cDPwNxcU_DELyaAkbmXjsotgpunQscaQ9Bw@mail.gmail.com>
 <e2ff765d96571e247a812bbd8b039b5396eb5a98.camel@ozlabs.org>
 <20200904163742.GB3532@heinlein>
In-Reply-To: <20200904163742.GB3532@heinlein>
From: Asmitha Karunanithi <asmithakarun@gmail.com>
Date: Sat, 5 Sep 2020 13:05:03 +0530
Message-ID: <CANGK-S6ww83OQkvdSCmjs5VA4Ttk+UBUsnnkD6_8j35YU-Sdgw@mail.gmail.com>
Subject: Re: Resolving service name conflicts
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="0000000000003d41da05ae8c082d"
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

--0000000000003d41da05ae8c082d
Content-Type: text/plain; charset="UTF-8"

Hi Patrick, Jeremy, and Micheal,

Thanks for your response on this.


> There is a deconflict system is there for a purpose, and avahi handles it
> well, and being able to find all the *ssh* services is actually useful.

Agree.

Likely this is due to the hostname being

different on all of them.

Even in my case, the hostname will be unique.

I hope, the commit that Jeremy pushed would resolve this service name
conflict issue.


On Fri, Sep 4, 2020 at 10:07 PM Patrick Williams <patrick@stwcx.xyz> wrote:

> On Thu, Sep 03, 2020 at 06:15:50PM +0800, Jeremy Kerr wrote:
> > Hi Asmitha,
> >
> > > To resolve this, the idea is to append the hostname of the client
> > > with the service name (whenever the service is being published),
> > > given that the hostname will always be unique in my case.
> > >
> > > So, the service file would look like: (example.service)
> > > > > <service-group>
> > > > >        <name>example-hostname</name>
> > > > >        <service>
> > > > >                <type>...</type>
> > > > >                <port>...</port>
> > > > >        </service>
> > > > > </service-group>
> >
> > The typical way to do this is just with the hostname only - the service
> > type distinguishes different services. So, yes: for better usability,
> > you'll want to include the hostname in the <name> tag, rather than a
> > fixed string.
> >
> > The .service definitions support wildcards, which makes this super
> > easy. Something like this, from our current ssh config:
> >
> >    <service-group>
> >      <name replace-wildcards="yes">%h</name>
> >      <service>
> >        <type>_ssh._tcp</type>
> >        <port>22</port>
> >      </service>
> >    </service-group>
> >
> > Otherwise, as you've noticed, the tooling will just show multiple
> > (indistinguishable) entries for each BMC.
>
> Yep, I agree with this direction.  I have many systems on my home
> network that advertise "_ssh._tcp" and I don't have problems with Avahi
> adding the "#N" mentioned.  Likely this is due to the hostname being
> different on all of them.
>
> > Given that the meta-phosphor configuration is to use the service name
> > (resulting in those duplicates), I've proposed a change to use the
> > hostname as the default instead:
> >
> >  https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/36199
> >
> > Cheers,
> >
> >
> > Jeremy
> >
>
> --
> Patrick Williams
>


-- 
Thanks & Regards,
Asmitha Karunanithi

--0000000000003d41da05ae8c082d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Patrick, Jeremy, and Micheal,</div><div><br></div>=
<div>Thanks for your response on this.</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">There is a deconflict system is there f=
or a purpose, and avahi handles it<br>well, and being able to find all the =
*ssh* services is actually useful.</blockquote><div>Agree.</div><div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Likely this is due to=
 the hostname being</blockquote><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">different on all of them.</blockquote>Even in my case, the hostname =
will be unique.<div><br></div><div>I hope, the commit that Jeremy pushed wo=
uld resolve this service name conflict issue.</div><div><br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, S=
ep 4, 2020 at 10:07 PM Patrick Williams &lt;<a href=3D"mailto:patrick@stwcx=
.xyz">patrick@stwcx.xyz</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Thu, Sep 03, 2020 at 06:15:50PM +0800, Jeremy Ker=
r wrote:<br>
&gt; Hi Asmitha,<br>
&gt; <br>
&gt; &gt; To resolve this, the idea is to append the hostname of the client=
<br>
&gt; &gt; with the service name (whenever the service is being published),<=
br>
&gt; &gt; given that the hostname will always be unique in my case.<br>
&gt; &gt; <br>
&gt; &gt; So, the service file would look like: (example.service)<br>
&gt; &gt; &gt; &gt; &lt;service-group&gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;name&gt;example-hostname=
&lt;/name&gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;service&gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
&lt;type&gt;...&lt;/type&gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
&lt;port&gt;...&lt;/port&gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/service&gt;<br>
&gt; &gt; &gt; &gt; &lt;/service-group&gt;<br>
&gt; <br>
&gt; The typical way to do this is just with the hostname only - the servic=
e<br>
&gt; type distinguishes different services. So, yes: for better usability,<=
br>
&gt; you&#39;ll want to include the hostname in the &lt;name&gt; tag, rathe=
r than a<br>
&gt; fixed string.<br>
&gt; <br>
&gt; The .service definitions support wildcards, which makes this super<br>
&gt; easy. Something like this, from our current ssh config:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 &lt;service-group&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &lt;name replace-wildcards=3D&quot;yes&quot;&gt;%h=
&lt;/name&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &lt;service&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;type&gt;_ssh._tcp&lt;/type&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;port&gt;22&lt;/port&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &lt;/service&gt;<br>
&gt;=C2=A0 =C2=A0 &lt;/service-group&gt;<br>
&gt; <br>
&gt; Otherwise, as you&#39;ve noticed, the tooling will just show multiple<=
br>
&gt; (indistinguishable) entries for each BMC.<br>
<br>
Yep, I agree with this direction.=C2=A0 I have many systems on my home<br>
network that advertise &quot;_ssh._tcp&quot; and I don&#39;t have problems =
with Avahi<br>
adding the &quot;#N&quot; mentioned.=C2=A0 Likely this is due to the hostna=
me being<br>
different on all of them.<br>
<br>
&gt; Given that the meta-phosphor configuration is to use the service name<=
br>
&gt; (resulting in those duplicates), I&#39;ve proposed a change to use the=
<br>
&gt; hostname as the default instead:<br>
&gt; <br>
&gt;=C2=A0 <a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/meta-pho=
sphor/+/36199" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-=
project.xyz/c/openbmc/meta-phosphor/+/36199</a><br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; <br>
&gt; Jeremy<br>
&gt; <br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Thanks &a=
mp; Regards,<div>Asmitha Karunanithi</div></div></div></div></div>

--0000000000003d41da05ae8c082d--
