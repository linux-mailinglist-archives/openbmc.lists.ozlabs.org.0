Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C1725BBF5
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 09:51:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhtKP4srzzDr4m
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 17:51:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a;
 helo=mail-ej1-x62a.google.com; envelope-from=asmithakarun@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fMbFA2k4; dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhtJQ3Kh6zDr0p
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 17:50:11 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id nw23so2484953ejb.4
 for <openbmc@lists.ozlabs.org>; Thu, 03 Sep 2020 00:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ESSBIU6c0MJOSSBHCSITvabQZkpMeKwq0s0oYD/lZoI=;
 b=fMbFA2k4WvQZ1N//F1AZIaSoFajop566dCe1YG5/AvYgpBbnUQYcnT5VN/QDxsuwuH
 yvAM47BlEsmivS5R5fZ1Lov7RN6uRw/Ibd1kkgHW/cRdVDk/1sRcsYrt0IxW2+UsbODC
 u5KhwUArrY6+ihu2Ts+RTjdse7X3WtGCH6LStw8RBPGpi3GZBrRlVYcIk6VgxPUctkT/
 P9YLhR1irI9C0JKkqfKGfDEWQktm33KT45mnVGvDmuMeMmq/Z+Qhf8q81wP13fb+/5MA
 IZIAG+ulYYoCRjQ8wYh6fk2yild7Hb981dpsGzKBVmVDE1n3IaF0+dCecC8qtGJIKpYv
 pl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ESSBIU6c0MJOSSBHCSITvabQZkpMeKwq0s0oYD/lZoI=;
 b=N1tcUlU9W/PuZzkpnFgdQSWXziIh/I8RA87TxtyBhQSJwL5cjOO8RgvQmxtCqrkbEl
 pVkEgVLswRj0ZdJaZGx0AretSjMdCKk7Fg7v6dbeNVxJMGBC1/iSo3LuOP0cHPZvZUOF
 aN8/qgQ9pp8rlKHDbo9ixqat1qHk/vmH+YvFNY7TVmQjWak434h9SKek5K7LyAYtE15f
 nGXGgARfCmCmBFGaeVPc8fG6ww5vK0GW9yJD5Wica0JU1Kfn/py3d8oLRNJlGRCthmsw
 mHhXqCcmGVri0seNYGpfEnFtYryOhJX4Es0PzXLnlGH4bjMqd5LjL1+eTCKcupViOVQ9
 4HBQ==
X-Gm-Message-State: AOAM531gBDq4SVrqhVaqvkCIJQ+8exAyQP52ObGqaZ0AA+GAxrqOe3iu
 fAD/9dWdifZvGftzy7MUhB5L3UaDVnOAFlVLCWinmePrJqk=
X-Google-Smtp-Source: ABdhPJyyJ/lMaqfuBs6WBrIySmSC46rElKcTPuDT+iAnFkjAuKbGisBctITUQqA6mVvjSLm1JqUX1/9jVhg/jWpxYGw=
X-Received: by 2002:a17:906:9718:: with SMTP id
 k24mr743301ejx.365.1599119406520; 
 Thu, 03 Sep 2020 00:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <CANGK-S5k=Dy+nf9cDPwNxcU_DELyaAkbmXjsotgpunQscaQ9Bw@mail.gmail.com>
 <20200902155801.GX3532@heinlein>
In-Reply-To: <20200902155801.GX3532@heinlein>
From: Asmitha Karunanithi <asmithakarun@gmail.com>
Date: Thu, 3 Sep 2020 13:19:29 +0530
Message-ID: <CANGK-S4gjNiLqnpZcT3bkKTycGEi7u1C-dNW70gMcXb02fS4zA@mail.gmail.com>
Subject: Re: Resolving service name conflicts
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="0000000000002dde4405ae6400fa"
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

--0000000000002dde4405ae6400fa
Content-Type: text/plain; charset="UTF-8"

Hi Patrick,

Yup, it would be like "ssh-hostname" because there would be service name
conflicts, say if there are 100 systems in the network publishing the
service with the same name, there would be name conflicts for 100 times and
finally, the service would be published as "ssh#101" to the network.

To avoid this, if we append the service name with the hostname which will
be unique, we make sure that the service name would also be unique thus
resolving the service name conflicts.

Example would be:

    <name>ssh-(hostname)</name>
    <service>
        ....
    </service>

Else, one other solution would be to push a patch for avahi, to stop
looking for service name conflicts (unique service name).
Your thoughts on the same, Patrick?

On Wed, Sep 2, 2020 at 9:28 PM Patrick Williams <patrick@stwcx.xyz> wrote:

> On Wed, Sep 02, 2020 at 10:38:55AM +0530, Asmitha Karunanithi wrote:
> > Hi All,
> >
> > Hope all are doing good.
> >
> > When I was trying to do 'avahi-browse', I was able to see service name
> > conflicts (since the service with the same name would be published by
> > various clients in the network and I could see <servicename>#100, after
> > trying for 99 times).
> >
> > To resolve this, the idea is to append the hostname of the client with
> the
> > service name (whenever the service is being published), given that the
> > hostname will always be unique in my case.
> >
> > So, the service file would look like: (example.service)
> >
> > <service-group>
> >
> >        <name>example-hostname</name>
> >
> >        <service>
> >
> >                <type>...</type>
> >
> >                <port>...</port>
> >
> >        </service>
> >
> > </service-group>
>
> Can you give an example of what a service name would be in this context?
> Is it like 'ssh'?  I don't think you should be advertising services as
> 'ssh-hostname' in that case.
>
> --
> Patrick Williams
>


-- 
Thanks & Regards,
Asmitha Karunanithi

--0000000000002dde4405ae6400fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"auto"><div dir=3D"ltr">Hi Pat=
rick,<div><br></div><div>Yup, it would be like &quot;ssh-hostname&quot; bec=
ause there would be service name conflicts, say if there are 100 systems in=
 the network publishing the service with the same name, there would be name=
 conflicts for 100 times and finally, the service would be published as &qu=
ot;ssh#101&quot; to the network.</div><div><br></div><div>To avoid this, if=
 we append the service name with the hostname which will be unique, we make=
 sure that the service name would also be unique thus resolving the service=
 name conflicts.</div><div><br></div><div>Example would be:</div><div><br><=
/div><div dir=3D"auto">=C2=A0 =C2=A0 &lt;name&gt;ssh-(hostname)&lt;/name&gt=
;</div><div dir=3D"auto">=C2=A0 =C2=A0=C2=A0<span style=3D"font-family:sans=
-serif">&lt;service&gt;</span></div><div dir=3D"auto"><span style=3D"font-f=
amily:sans-serif">=C2=A0 =C2=A0 =C2=A0 =C2=A0 ....</span></div><div dir=3D"=
auto"><span style=3D"font-family:sans-serif">=C2=A0 =C2=A0 &lt;/service&gt;=
</span><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Else, one ot=
her solution would be to push a patch for avahi, to stop looking for servic=
e name conflicts (unique service name).</div><div>Your thoughts on the same=
, Patrick?</div></div></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Sep 2, 2020 at 9:28 PM Patrick Willia=
ms &lt;<a href=3D"mailto:patrick@stwcx.xyz" rel=3D"noreferrer" target=3D"_b=
lank">patrick@stwcx.xyz</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Wed, Sep 02, 2020 at 10:38:55AM +0530, Asmitha Ka=
runanithi wrote:<br>
&gt; Hi All,<br>
&gt; <br>
&gt; Hope all are doing good.<br>
&gt; <br>
&gt; When I was trying to do &#39;avahi-browse&#39;, I was able to see serv=
ice name<br>
&gt; conflicts (since the service with the same name would be published by<=
br>
&gt; various clients in the network and I could see &lt;servicename&gt;#100=
, after<br>
&gt; trying for 99 times).<br>
&gt; <br>
&gt; To resolve this, the idea is to append the hostname of the client with=
 the<br>
&gt; service name (whenever the service is being published), given that the=
<br>
&gt; hostname will always be unique in my case.<br>
&gt; <br>
&gt; So, the service file would look like: (example.service)<br>
&gt; <br>
&gt; &lt;service-group&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;name&gt;example-hostname&lt;/name&gt;<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;service&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;type&gt;...=
&lt;/type&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;port&gt;...=
&lt;/port&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/service&gt;<br>
&gt; <br>
&gt; &lt;/service-group&gt;<br>
<br>
Can you give an example of what a service name would be in this context?<br=
>
Is it like &#39;ssh&#39;?=C2=A0 I don&#39;t think you should be advertising=
 services as<br>
&#39;ssh-hostname&#39; in that case.<br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div><div dir=3D"ltr">Thanks &amp; Regards,<div>Asmitha K=
arunanithi</div></div></div></div></div>
</div>

--0000000000002dde4405ae6400fa--
