Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A82BA70ED0
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 03:51:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45t1fg26Z6zDqDF
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 11:51:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=tyler.sabdon@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="O2y7Z7N6"; 
 dkim-atps=neutral
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45t1f36LgJzDqD8
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 11:50:49 +1000 (AEST)
Received: by mail-io1-xd32.google.com with SMTP id m24so78426913ioo.2
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jul 2019 18:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f3gIBmgwfkjV4ONJQiNjLSc67pw5VTKn3sQf8vU4Ra8=;
 b=O2y7Z7N6ntOwWcs5P6h7eCgao3kh02vkCVcfSDzFcm5rLeg0ez+YtCVwQwslolhLOS
 ADClE2H2G3BbKrQszE7583rPWacR1e+Ok0Gs5Mqv5Rxc1T2sOpaVU3GbuHt8iaSSlIY1
 ghe7d8mDLg+ibyqjc726ti/mR2I/8eMfpkQ0EH6tka7dSTZ08k2ms1TXUmRbNH9SH7sS
 QrO9I38hm4pHlaKwB59BqRxELAk4+S+b96uqjrjYlbsbOZNnJECt17WCbYp798k4171b
 M+0Ko0g8GJE5Mgs1AaCX9ep9KAA2/+rcZO8KSH1H2tNT6GYHUxubFxDX+u5becX/2WTy
 73SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f3gIBmgwfkjV4ONJQiNjLSc67pw5VTKn3sQf8vU4Ra8=;
 b=GhmLa7HIPMHB/MA0UPOHY1U1g6b4XObMxMML8egCUMn1bMmBg6UnMTWfXSzeDcI/n8
 0fZ2IQO6F4FPrRg2+WB13+BDWoiSr5TcZKnD1h16kC1sEGotjbZz2hbqJF3jaDGLjlCL
 85NMMsO4ZJdCzqfqyvE/CiG9H/pomiJWbrTK6GMmwsGeOBZC6r2r4iIFLAoqF3+llCVn
 tseA0UsjYy0c2wECs9612l0rL4+hcAXfD9qBzmK9b7KxVhOi1D+RWaiwmkERHWfDpyeR
 fR8CyGUH+J2qX6pDWEPvW1B/54ckDpr8puAcINRYf3oz9z+2lOhQAdq/Vbj4kQ4trhFu
 zOdw==
X-Gm-Message-State: APjAAAWmtfrHZyIbT3oY9/v+mLY7k7wttW8hPQemc/qZgZ87fBrZH0Rq
 rm4O7RZSIcE1RmyOs2Izc8QG4yOjmy2YB4NJwMKb2+QW
X-Google-Smtp-Source: APXvYqxeypiShm5e6uBDPrEJc6n2BBmrmfj+ByabAYbE2Qz03OYPa1AUTkZ8GkfjGS3GlI6XUp6ka6gKACxYhL7uCWg=
X-Received: by 2002:a5e:d817:: with SMTP id l23mr20153493iok.282.1563846646186; 
 Mon, 22 Jul 2019 18:50:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAO9PYRL-VUFar6MRFfEHxvx+XqSdybU-WdNkWxon8nzcU3DiMw@mail.gmail.com>
 <98d4b6e9-d4a8-c7cf-014d-64de2e6c8a5d@linux.intel.com>
In-Reply-To: <98d4b6e9-d4a8-c7cf-014d-64de2e6c8a5d@linux.intel.com>
From: Deng Tyler <tyler.sabdon@gmail.com>
Date: Tue, 23 Jul 2019 09:50:32 +0800
Message-ID: <CAO9PYRJ6FBP7DGBc_UPbB9LtDUckUY6zqZMvqtTpeWxuVJVrBA@mail.gmail.com>
Subject: Re: Address type in entity-manager repo
To: James Feist <james.feist@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000d44bc9058e4f6bf5"
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

--000000000000d44bc9058e4f6bf5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi James:
    Thank for your kindly reply and that really helps. I have another
question about entity-manager. In entity-manager, it add an dbus interface
"xyz.openbmc_project.Inventory.Manager" to object
"/xyz/openbmc_project/inventory" in its service.
Why do that? I checked code and found there is no property or object will
be added under this interface. Meanwhile anther service
"xyz.openbmc_project.Inventory.Manager" has same interface and cause ipmid
get wrong service if receiving a fru ipmi command. Do you have any
suggestions? thanks. Regards

Tyler

James Feist <james.feist@linux.intel.com> =E6=96=BC 2019=E5=B9=B47=E6=9C=88=
18=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=887:01=E5=AF=AB=E9=81=93=EF=
=BC=9A

> On 7/16/19 12:15 AM, Deng Tyler wrote:
> > Hi All:
> >      I am investigated entity-manager with dbus-sensors. In
> > entity-manager, the schema define Address type is string as below
> > ---------------------------------------------------
> >              "type": "object",
> >              "properties": {
> >                  "Exposes": {
> >                      "type": "array",
> >                      "items": {
> >                          "type": "object",
> >                          "properties": {
> >                              "Address": {
> >                                  "type": "string"      <=3D=3D here
> >                              },
> >                              "Name": {
> >                                  "type": "string"
> >                              },
> > --------------------------------------------------------
> > In dbus-sensor application, cpusensor get CPU configuration from DBUS.
> > But the type is mismatch and cause cpusensor terminated.
> > *journalctl:*
> > cpusensor[296]: terminate called after throwing an instance of
> > 'std::invalid_argument'
> > cpusensor[296]:   what():  Cannot translate type to unsigned int
> >
> > I found code in cpusensor to get "Address" and type shall be integer
> > from dbus as below
> > image.png
> > But in dbus the Address property is string
> > image.png
> >
> > Is this code error? or I miss something? thanks.
>
> I would suggest updating EntityManager, looks like you are using an old
> version, SkylakeCPU change to XeonCpu a long time ago.
>
> Thanks,
>
> James
>
>
>
> >
> > Tyler
>

--000000000000d44bc9058e4f6bf5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi James:<div>=C2=A0 =C2=A0 Thank for your kindly reply an=
d that really helps. I have another question about entity-manager. In entit=
y-manager, it add an dbus interface &quot;xyz.openbmc_project.Inventory.Man=
ager&quot; to object &quot;/xyz/openbmc_project/inventory&quot; in its serv=
ice.</div><div>Why do that? I checked code and found there is no property o=
r object will be added under this interface. Meanwhile anther service &quot=
;xyz.openbmc_project.Inventory.Manager&quot; has same interface and cause i=
pmid get wrong service if receiving a fru ipmi command. Do you have any sug=
gestions? thanks. Regards</div><div><br></div><div>Tyler</div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">James Feist &=
lt;<a href=3D"mailto:james.feist@linux.intel.com">james.feist@linux.intel.c=
om</a>&gt; =E6=96=BC 2019=E5=B9=B47=E6=9C=8818=E6=97=A5 =E9=80=B1=E5=9B=9B =
=E4=B8=8A=E5=8D=887:01=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On 7/16/19 12:15 AM, Deng Tyler wrote:<br=
>
&gt; Hi All:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 I am investigated entity-manager with dbus-sensors=
. In <br>
&gt; entity-manager, the schema define Address type is string as below<br>
&gt; ---------------------------------------------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quo=
t;object&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;properties&quot;=
: {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Ex=
poses&quot;: {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;type&quot;: &quot;array&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;items&quot;: {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;object&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;properties&quot;: {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Address&quot;: {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;st=
ring&quot;=C2=A0 =C2=A0 =C2=A0 &lt;=3D=3D here<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Name&quot;: {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;st=
ring&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt; --------------------------------------------------------<br>
&gt; In dbus-sensor application, cpusensor get CPU configuration from DBUS.=
 <br>
&gt; But the type is mismatch and cause cpusensor terminated.<br>
&gt; *journalctl:*<br>
&gt; cpusensor[296]: terminate called after throwing an instance of <br>
&gt; &#39;std::invalid_argument&#39;<br>
&gt; cpusensor[296]: =C2=A0 what(): =C2=A0Cannot translate type to unsigned=
 int<br>
&gt; <br>
&gt; I found code in cpusensor to get &quot;Address&quot; and type shall be=
 integer <br>
&gt; from dbus as below<br>
&gt; image.png<br>
&gt; But in dbus the Address property is string<br>
&gt; image.png<br>
&gt; <br>
&gt; Is this code error? or I miss something? thanks.<br>
<br>
I would suggest updating EntityManager, looks like you are using an old <br=
>
version, SkylakeCPU change to XeonCpu a long time ago.<br>
<br>
Thanks,<br>
<br>
James<br>
<br>
<br>
<br>
&gt; <br>
&gt; Tyler<br>
</blockquote></div>

--000000000000d44bc9058e4f6bf5--
