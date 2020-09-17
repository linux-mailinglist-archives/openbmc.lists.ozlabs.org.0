Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7CF26D32B
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 07:38:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsQk03xQ8zDqT1
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 15:38:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::529;
 helo=mail-ed1-x529.google.com; envelope-from=krellan@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=eHUZBGzk; dkim-atps=neutral
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsQj64tr2zDqSK
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 15:37:45 +1000 (AEST)
Received: by mail-ed1-x529.google.com with SMTP id e22so1120534edq.6
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 22:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tSqaK5rzCU6hhbVCH6id6Qya4Hn5CC3XCAsbCyIMj1w=;
 b=eHUZBGzkJvBRTFJQAJDqwM3LxHJ8K8VogDnGWWG/d+z4t6myi96MKEp19ETq76am5f
 66wXFZssUBKaNiCPR2cv1ZgqzHbEv18ZvfcPNAokYi0SJ1hVtDMCPhMN4uvlALptVZy+
 kBVAOGl8rWbja6/vH/D3wtkdz0rH+floykaOlX07jCA4/DX+9UWUtpaLjfTSOvYhYAKr
 /W1QBZVkaO+kr1HEEXFskJEz9+x/A5sIrlaCCsFMP75ssbwpQ0BGHwIevcT2xc1vEZPN
 6+ZSFjaSek/rJAUggpGypKyjXKAi8JmBUBdOqrIgYuakTYYn4TPfNtJ060mN+Fy35H8b
 gizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tSqaK5rzCU6hhbVCH6id6Qya4Hn5CC3XCAsbCyIMj1w=;
 b=VLfCeVYmKZ9fd7BwFbZNWC7o6vx2lYYgovNgbLt/R8ffWOsX5kgkRX42Fylh2ygGfp
 C4OSY6Cw6xRssdDrSGVLRSAPT4Lsb19tPb8kAxc5ElaC5RnbqZxFBNTafhe+JlPLb4jb
 HJ0H3Ue8C8+dJ8IhqHwgqsSvXhQP0AlTja2mNDcZyTlkii9Hp8B1AH0YnK7bQ6ovs+MH
 lGRVHbF5nGqQzSg/KDP+NeTnCZ5cMRS72izBVOvS4P7Nt4zTMlxID0g3EMN2ZtAdB8xH
 Wv5k87Be0YbA3HkyNbEqv6iY24y/UHXG/VQRXA9xhGMeQ0lGmpxMQQm7k/G5SjDAwY7P
 VLgA==
X-Gm-Message-State: AOAM5334bT6GjUPsGMit+NlvWu/7l7DRVBpFV7gX1wuab7Qf/d/NZWEa
 AgkwEnNlkZhGEP+Vs8Pk6XyaKp8Bs/ugYePb/SuS9Q==
X-Google-Smtp-Source: ABdhPJxPTRdNDZO2IyVwCzlKTXgsmGyyrm17+WLBo2XVSqfukZg7seDFCQ4I3e0SMoKXFQ82NlXaKFZ9wuVcg6mN628=
X-Received: by 2002:a05:6402:3c8:: with SMTP id
 t8mr30244346edw.266.1600321060254; 
 Wed, 16 Sep 2020 22:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <a3919f2a61844f9f89f8e1f8dc0d5972@quantatw.com>
 <CADKL2t5YWsjREnFZ36ZA0ZR4ObOqY-noazEc-+wwVePF9bo8vA@mail.gmail.com>
In-Reply-To: <CADKL2t5YWsjREnFZ36ZA0ZR4ObOqY-noazEc-+wwVePF9bo8vA@mail.gmail.com>
From: Josh Lehan <krellan@google.com>
Date: Wed, 16 Sep 2020 22:37:14 -0700
Message-ID: <CANPkJS_p9iTJJCue_cSePsgsJ71ztv06XEvEpqe1Y294ne5UYQ@mail.gmail.com>
Subject: Re: Quanta requests to create a repo in OpenBMC github
To: Benjamin Fair <benjaminfair@google.com>
Content-Type: multipart/alternative; boundary="000000000000536af105af7bc877"
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000536af105af7bc877
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yay, this is great to see. I have some bug fixes to read-margin-temp and
was just wondering how to contribute them. I'm really hoping this makes it
into OpenBMC. It's the perfect preprocessor for phosphor-pid-control, I
have found.

Josh

Josh Lehan | Software Engineer | krellan@google.com | +1 650-733-8941



On Wed, Sep 16, 2020 at 7:15 PM Benjamin Fair <benjaminfair@google.com>
wrote:

> On Wed, 16 Sep 2020 at 06:31, Fran Hsu (=E5=BE=90=E8=AA=8C=E8=AC=99) <Fra=
n.Hsu@quantatw.com>
> wrote:
> >
> > Hi Brad,
> >         This is Fran from Quanta Computer.
> > Quanta OpenBMC team would like to share some useful tools to the OpenBM=
C
> community.
> > Such as the read-margin-temp daemon (
> https://github.com/quanta-bmc/read-margin-temp), we are using this daemon
> to fill sensor margin value to PID to do fan control.
>
> read-margin-temp seems useful and widely applicable enough that I
> think it's worth having a dedicated repo for it.
>
> The quanta-misc repo could possibly be used for smaller, more
> Quanta-specific things.
>
> >
> > We would like to have a repo named "quanta-misc" under the OpenBMC
> github.
> >
> > Here is the maintainer list:
> > M:  Benjamin Fair <benjaminfair@google.com> <benjaminfair!>
> > M:  Brandon Kim <brandonkim@google.com> <brandonk!>
> > M:  Fran Hsu <fran.hsu@quantatw.com> <franhsu!>
> > M:  George Hung <george.hung@quantatw.com> <ghung!>
> > M:  Buddy Huang <buddy.huang@quantatw.com> <buddyhunag!>
> >
> > Thank you.
> > Fran Hsu
> > E-Mail : Fran.Hsu@QuantaTW.com
> > Tel: +886-3-327-2345 Ext: 16935 <+886%203%20327%202345>
> >
> >
>

--000000000000536af105af7bc877
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yay, this is great to see. I have some bug fixes to read-m=
argin-temp and was just wondering how to contribute them. I&#39;m really ho=
ping this makes it into OpenBMC. It&#39;s the perfect preprocessor for phos=
phor-pid-control, I have found.<div><br></div><div>Josh</div><div><br clear=
=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"=
gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div style=3D"line-=
height:1.5em;padding-top:10px;margin-top:10px;color:rgb(85,85,85);font-fami=
ly:sans-serif"><span style=3D"border-width:2px 0px 0px;border-style:solid;b=
order-color:rgb(213,15,37);padding-top:2px;margin-top:2px">Josh Lehan=C2=A0=
|</span><span style=3D"border-width:2px 0px 0px;border-style:solid;border-c=
olor:rgb(51,105,232);padding-top:2px;margin-top:2px">=C2=A0Software Enginee=
r=C2=A0|</span><span style=3D"border-width:2px 0px 0px;border-style:solid;b=
order-color:rgb(0,153,57);padding-top:2px;margin-top:2px">=C2=A0<a href=3D"=
mailto:krellan@google.com" target=3D"_blank">krellan@google.com</a>=C2=A0|<=
/span><span style=3D"border-width:2px 0px 0px;border-style:solid;border-col=
or:rgb(238,178,17);padding-top:2px;margin-top:2px">=C2=A0+1 650-733-8941</s=
pan></div><br></div></div></div></div></div><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 16, 2020=
 at 7:15 PM Benjamin Fair &lt;<a href=3D"mailto:benjaminfair@google.com">be=
njaminfair@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Wed, 16 Sep 2020 at 06:31, Fran Hsu (=E5=BE=90=E8=
=AA=8C=E8=AC=99) &lt;<a href=3D"mailto:Fran.Hsu@quantatw.com" target=3D"_bl=
ank">Fran.Hsu@quantatw.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Brad,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is Fran from Quanta Computer.<br=
>
&gt; Quanta OpenBMC team would like to share some useful tools to the OpenB=
MC community.<br>
&gt; Such as the read-margin-temp daemon (<a href=3D"https://github.com/qua=
nta-bmc/read-margin-temp" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/quanta-bmc/read-margin-temp</a>), we are using this daemon to fill s=
ensor margin value to PID to do fan control.<br>
<br>
read-margin-temp seems useful and widely applicable enough that I<br>
think it&#39;s worth having a dedicated repo for it.<br>
<br>
The quanta-misc repo could possibly be used for smaller, more<br>
Quanta-specific things.<br>
<br>
&gt;<br>
&gt; We would like to have a repo named &quot;quanta-misc&quot; under the O=
penBMC github.<br>
&gt;<br>
&gt; Here is the maintainer list:<br>
&gt; M:=C2=A0 Benjamin Fair &lt;<a href=3D"mailto:benjaminfair@google.com" =
target=3D"_blank">benjaminfair@google.com</a>&gt; &lt;benjaminfair!&gt;<br>
&gt; M:=C2=A0 Brandon Kim &lt;<a href=3D"mailto:brandonkim@google.com" targ=
et=3D"_blank">brandonkim@google.com</a>&gt; &lt;brandonk!&gt;<br>
&gt; M:=C2=A0 Fran Hsu &lt;<a href=3D"mailto:fran.hsu@quantatw.com" target=
=3D"_blank">fran.hsu@quantatw.com</a>&gt; &lt;franhsu!&gt;<br>
&gt; M:=C2=A0 George Hung &lt;<a href=3D"mailto:george.hung@quantatw.com" t=
arget=3D"_blank">george.hung@quantatw.com</a>&gt; &lt;ghung!&gt;<br>
&gt; M:=C2=A0 Buddy Huang &lt;<a href=3D"mailto:buddy.huang@quantatw.com" t=
arget=3D"_blank">buddy.huang@quantatw.com</a>&gt; &lt;buddyhunag!&gt;<br>
&gt;<br>
&gt; Thank you.<br>
&gt; Fran Hsu<br>
&gt; E-Mail : Fran.Hsu@QuantaTW.com<br>
&gt; Tel: <a href=3D"tel:+886%203%20327%202345" value=3D"+88633272345" targ=
et=3D"_blank">+886-3-327-2345 Ext: 16935</a><br>
&gt;<br>
&gt;<br>
</blockquote></div>

--000000000000536af105af7bc877--
