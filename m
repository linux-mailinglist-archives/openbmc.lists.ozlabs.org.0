Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E0C78C624
	for <lists+openbmc@lfdr.de>; Tue, 29 Aug 2023 15:36:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=WGqZ0C1c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZpNq4wLtz3bhk
	for <lists+openbmc@lfdr.de>; Tue, 29 Aug 2023 23:36:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=WGqZ0C1c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com; envelope-from=mimi05633@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZpNB09YJz2yD4
	for <openbmc@lists.ozlabs.org>; Tue, 29 Aug 2023 23:35:52 +1000 (AEST)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-d7b91422da8so111752276.2
        for <openbmc@lists.ozlabs.org>; Tue, 29 Aug 2023 06:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693316147; x=1693920947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FySCLtmssZxHCg9EUepM4PCzbY3XuGLa1DBQc9bILa0=;
        b=WGqZ0C1cSspklaa2AHFXZmyBdkGEjleiRQ5es33rUljIfdsnkrYDOF5PFytgI4F5b5
         pyky/oDKzYcoFZ91ZhgqoW1RQeo0Ojzbsg5AObKGVbr5znJ61VTHAO1rnANjujb78Jz1
         aNdTLgvqm684RRkHbskV+Un6UwndbFcEwGFVK5yAemRQQ6WVRITATFkDRWizNi0GClVN
         Dy/mfybWrfChFAXWEkAOF/6UaejxTZD/MC4sQ/BGGrKV8xwl10QY9f9p7VUyVtqOJDgL
         9mX0yr7G9iUqTh0MSSbNSaM5YZjYYv6dQh3TXLd4k7kDytUVTprJ6NXscw4xkpLZcm2q
         cdig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693316147; x=1693920947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FySCLtmssZxHCg9EUepM4PCzbY3XuGLa1DBQc9bILa0=;
        b=PaRS9HV9pU4RJkt5V+ua5KL8E7X5ZRgLfZmgaPJla+Nf21ADHT6r04E/rGbE/v1NeA
         DpDztU1uicCl1YU41q9bi5MXk2dKdaiqSbv8yD7soSr/KDZTXN6nyUsfz54qiftN7vW1
         hCaVyTp721DeR9vAA5h/k1bV/ppvbmD7pHY9somPhHUDqjERymIsFCcS9W4oT5B6p7xg
         H80Nkj0h/bxqw7kNbyYRvP2EDFSenkFRd2zwKuFFUZBj8ftJEMjmZajT6ruKC80jPakt
         OADGU2/aZyUfGWP7nZTg8Orq38AKDL3dMus6EHq6MP4MMVu4YqiJSDkWZPWhVXwlm4HY
         swZg==
X-Gm-Message-State: AOJu0YwBUO9/5CKNIWlCtOYWNUOcDTIYcGeqh+rZ+X/VjvAXkfKlaseG
	sAlt4HkQvEl06V9Zu+ZBTdbif4/wvdgjAoPoLoU=
X-Google-Smtp-Source: AGHT+IGbt4WVop9TYpHxvXOa//aHUSI/dQiJUyCSLyHZEBQaIl5ZT/0y1HZNHApCj6ixUhyJalEHAjARp97SIUXYRzY=
X-Received: by 2002:a25:aad3:0:b0:d7a:f041:15a4 with SMTP id
 t77-20020a25aad3000000b00d7af04115a4mr7781442ybi.0.1693316147482; Tue, 29 Aug
 2023 06:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230816012540.18464-1-mimi05633@gmail.com> <20230816012540.18464-2-mimi05633@gmail.com>
 <2023082322124382cfd168@mail.local>
In-Reply-To: <2023082322124382cfd168@mail.local>
From: Minying Lin <mimi05633@gmail.com>
Date: Tue, 29 Aug 2023 21:35:36 +0800
Message-ID: <CAL3ZnpxEuOQtpaqA7KLBr285JvTDJrcT+ZGYyjy7Bi-sVs5yVA@mail.gmail.com>
Subject: [PATCH v4 1/1] rtc: nuvoton: Compatible with NCT3015Y-R and NCT3018Y-R
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: multipart/alternative; boundary="0000000000007693ea06040fe37f"
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
Cc: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "mylin1@nuvoton.com" <mylin1@nuvoton.com>, "benjaminfair@google.com" <benjaminfair@google.com>, "KWLIU@nuvoton.com" <KWLIU@nuvoton.com>, "avifishman70@gmail.com" <avifishman70@gmail.com>, "venture@google.com" <venture@google.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "JJLIU0@nuvoton.com" <JJLIU0@nuvoton.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tali.perry1@gmail.com" <tali.perry1@gmail.com>, "KFLIN@nuvoton.com" <KFLIN@nuvoton.com>, "tmaimon77@gmail.com" <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000007693ea06040fe37f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Alexandre,

Thanks for your comments.
The replies are as follow.

Thanks.
Best regard,
Mia

Alexandre Belloni <alexandre.belloni@bootlin.com> =E6=96=BC 2023=E5=B9=B48=
=E6=9C=8824=E6=97=A5 =E6=98=9F=E6=9C=9F=E5=9B=9B=E5=AF=AB=E9=81=93=EF=BC=9A

> Hello,
>
> On 16/08/2023 09:25:40+0800, Mia Lin wrote:
> > -     dev_dbg(&client->dev, "%s:alarm_enable:%x alarm_flag:%x\n",
> > -             __func__, *alarm_enable, *alarm_flag);
> > +     if (alarm_enable && alarm_flag)
>
> I don't really see the point of conditionally displaying this debug
> message.
>
[Mia] I will remove it.

>
> > +             dev_dbg(&client->dev, "%s: alarm_enable=3D%x,
> alarm_flag=3D%x.\n",
> > +                     __func__, *alarm_enable, *alarm_flag);
> >
> >       return 0;
> >  }
> > @@ -123,17 +124,17 @@ static irqreturn_t nct3018y_irq(int irq, void
> *dev_id)
> >       unsigned char alarm_flag;
> >       unsigned char alarm_enable;
> >
> > -     dev_dbg(&client->dev, "%s:irq:%d\n", __func__, irq);
> > +     dev_dbg(&client->dev, "%s: irq=3D%d.\n", __func__, irq);
>
> You have many of those changes where you only add a space, I feel like
> this is a matter of taste and this makes it more difficult than
> necessary to read your patch.
>
 [Mia] Sorry for the ambiguity. I will remove those unnecessary changes.

>
> >       err =3D nct3018y_get_alarm_mode(nct3018y->client, &alarm_enable,
> &alarm_flag);
> >       if (err)
> >               return IRQ_NONE;
> >
> >       if (alarm_flag) {
> > -             dev_dbg(&client->dev, "%s:alarm flag:%x\n",
> > +             dev_dbg(&client->dev, "%s: alarm flag=3D%x.\n",
> >                       __func__, alarm_flag);
> >               rtc_update_irq(nct3018y->rtc, 1, RTC_IRQF | RTC_AF);
> >               nct3018y_set_alarm_mode(nct3018y->client, 0);
> > -             dev_dbg(&client->dev, "%s:IRQ_HANDLED\n", __func__);
> > +             dev_dbg(&client->dev, "%s: IRQ_HANDLED.\n", __func__);
> >               return IRQ_HANDLED;
> >       }
> >
> > @@ -155,7 +156,7 @@ static int nct3018y_rtc_read_time(struct device
> *dev, struct rtc_time *tm)
> >               return err;
> >
> >       if (!buf[0]) {
> > -             dev_dbg(&client->dev, " voltage <=3D1.7, date/time is not
> reliable.\n");
> > +             dev_dbg(&client->dev, "%s: voltage <=3D1.7, date/time is =
not
> reliable.\n", __func__);
> >               return -EINVAL;
> >       }
> >
> > @@ -178,26 +179,50 @@ static int nct3018y_rtc_set_time(struct device
> *dev, struct rtc_time *tm)
> >  {
> >       struct i2c_client *client =3D to_i2c_client(dev);
> >       unsigned char buf[4] =3D {0};
> > -     int err;
> > +     int err, part_num, flags;
> > +     int restore_flags =3D 0;
> > +
> > +     part_num =3D i2c_smbus_read_byte_data(client, NCT3018Y_REG_PART);
>
> Do you really have to check the part number every time you set the time?
> I don't expect it to change once read in probe.
>
[Mia] Due to the 3018Y's topology, we need to set the TWO bit first to
obtain the write time capability, but the 3015Y does not have this problem.
Therefore, we use part number & TWO bit to determine whether we need to set
the TWO bit first before set time.

>
> > +     if (part_num < 0) {
> > +             dev_dbg(&client->dev, "%s: Failed to read part info
> reg.\n", __func__);
> > +             return part_num;
> > +     }
> > +
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--0000000000007693ea06040fe37f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Dear Alexandre,<div><br></div><div>Thanks=
 for your comments.</div><div>The replies are as follow.</div><div><br></di=
v><div>Thanks.</div><div>Best regard,</div><div>Mia<br><br>Alexandre Bellon=
i &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com" target=3D"_blank">al=
exandre.belloni@bootlin.com</a>&gt; =E6=96=BC 2023=E5=B9=B48=E6=9C=8824=E6=
=97=A5 =E6=98=9F=E6=9C=9F=E5=9B=9B=E5=AF=AB=E9=81=93=EF=BC=9A<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
On 16/08/2023 09:25:40+0800, Mia Lin wrote:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;client-&gt;dev, &quot;%s:alarm_enabl=
e:%x alarm_flag:%x\n&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__func__, *alarm_enab=
le, *alarm_flag);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (alarm_enable &amp;&amp; alarm_flag)<br>
<br>
I don&#39;t really see the point of conditionally displaying this debug<br>
message.<br></blockquote><div>[Mia] I will remove it.=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;client-&=
gt;dev, &quot;%s: alarm_enable=3D%x, alarm_flag=3D%x.\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0__func__, *alarm_enable, *alarm_flag);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 }<br>
&gt; @@ -123,17 +124,17 @@ static irqreturn_t nct3018y_irq(int irq, void *d=
ev_id)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char alarm_flag;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char alarm_enable;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;client-&gt;dev, &quot;%s:irq:%d\n&qu=
ot;, __func__, irq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;client-&gt;dev, &quot;%s: irq=3D%d.\=
n&quot;, __func__, irq);<br>
<br>
You have many of those changes where you only add a space, I feel like<br>
this is a matter of taste and this makes it more difficult than<br>
necessary to read your patch.<br></blockquote><div>=C2=A0[Mia] Sorry for th=
e ambiguity. I will remove those unnecessary changes.</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D nct3018y_get_alarm_mode(nct3018y-&gt=
;client, &amp;alarm_enable, &amp;alarm_flag);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return IRQ_NONE;=
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (alarm_flag) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;client-&=
gt;dev, &quot;%s:alarm flag:%x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;client-&=
gt;dev, &quot;%s: alarm flag=3D%x.\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0__func__, alarm_flag);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rtc_update_irq(n=
ct3018y-&gt;rtc, 1, RTC_IRQF | RTC_AF);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nct3018y_set_ala=
rm_mode(nct3018y-&gt;client, 0);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;client-&=
gt;dev, &quot;%s:IRQ_HANDLED\n&quot;, __func__);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;client-&=
gt;dev, &quot;%s: IRQ_HANDLED.\n&quot;, __func__);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return IRQ_HANDL=
ED;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; @@ -155,7 +156,7 @@ static int nct3018y_rtc_read_time(struct device *d=
ev, struct rtc_time *tm)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!buf[0]) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;client-&=
gt;dev, &quot; voltage &lt;=3D1.7, date/time is not reliable.\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;client-&=
gt;dev, &quot;%s: voltage &lt;=3D1.7, date/time is not reliable.\n&quot;, _=
_func__);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; @@ -178,26 +179,50 @@ static int nct3018y_rtc_set_time(struct device *=
dev, struct rtc_time *tm)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct i2c_client *client =3D to_i2c_client(=
dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char buf[4] =3D {0};<br>
&gt; -=C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int err, part_num, flags;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int restore_flags =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0part_num =3D i2c_smbus_read_byte_data(client, NCT=
3018Y_REG_PART);<br>
<br>
Do you really have to check the part number every time you set the time?<br=
>
I don&#39;t expect it to change once read in probe.<br></blockquote>[Mia] D=
ue to the 3018Y&#39;s topology, we need to set the TWO bit first to obtain =
the write time capability, but the 3015Y does not have this problem.<br><di=
v>Therefore, we use part number &amp; TWO bit to determine whether we need =
to set the TWO bit first before set time.=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (part_num &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;client-&=
gt;dev, &quot;%s: Failed to read part info reg.\n&quot;, __func__);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return part_num;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" target=3D"_blank">https://bootlin.com</a><b=
r>
</blockquote></div>
</div></div>

--0000000000007693ea06040fe37f--
