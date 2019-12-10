Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DA7117F6D
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 06:09:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47X7Qb6KVgzDqWc
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 16:09:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=tyler.sabdon@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jEV0LSWq"; 
 dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47X7Pq0ZZbzDqTp
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 16:08:46 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id b1so8268650pgq.10
 for <openbmc@lists.ozlabs.org>; Mon, 09 Dec 2019 21:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZuoLnogIvyY+usYrkPSlyZftTqhkx11bK+m8tW05rB4=;
 b=jEV0LSWqvWYghiiexy7AkGGPRpNVWOi4yYT/7PPPsT+b7ZDV/aG1rtYc9+p33hfexH
 EplwRS0B3+zOCDCZIzhqqdrnRtQVixsP9o2dcBOKCJW2g9zUly1NtI73uBWG3qMphf5V
 VzuQLkO1zkb4m5wihnIR/gMQMWBvPPDa6CjlW09rJtyQNV2yh5cCYStFEc9QTi5krUIO
 x5iqereBbYDoXjorppUzA1Upl300uW1uxocq8Z+7WEsHxM/BIZRCS8R4OBIas0ITwFaE
 +E0CUdnBrmFXTwLQCe3TwKhvCPJUukPYwPm2nGM74adV6LnGUnrTkGo+nclJIyfS8sn8
 Aoag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZuoLnogIvyY+usYrkPSlyZftTqhkx11bK+m8tW05rB4=;
 b=UkRF3BXpxeCJjHOBMnA0Q5SgjDNIHQXFvks8Cn2ACRs2IqkEI4YBLrnFnXWML18mPi
 BMACL9QvR15cBveSSaUCsvAmLM5BJoE7cY6loBsJIhsEvynsNI1WXl6ZM/2JqZlZH/9t
 8fxyTdGkqWpKXCC1dKo9Gks6kcaMi6+91PDKmoivapkXPl4yfbeKGfmQOOaSUWT1iaAx
 8Z/8oLMmwtG5FE8OT45ks4eowuuE174GpWGBOKU1Eqrxz2p4EW6M/EHzoc632vClyA4b
 mt/oN/xdmSoIZ031zkPX+YLz/6cL0H+ukL3E/4rxxVtfrq6zZRtUVA+j4kH5uyFaLlju
 qQRw==
X-Gm-Message-State: APjAAAUHbVICu1xqH61tH3Cgyt9qi9fYNLltXjUgKXlRMCFHW/bLd6aw
 uzdhJAFUeR38rWcROsa3uA0TtQyDpTW9znPcyE8TuA==
X-Google-Smtp-Source: APXvYqxojZyOYKUTQMlqmuUTk+CtpXT39GDP/liEU28WacgL4dOrsQoOPbLBDPYN4LJKBrZWl2ft7oFoRKJ5fZbbiSw=
X-Received: by 2002:a62:750e:: with SMTP id q14mr33302298pfc.155.1575954523266; 
 Mon, 09 Dec 2019 21:08:43 -0800 (PST)
MIME-Version: 1.0
References: <CAO9PYRLd5KJHiuvDxzGcw7E5CVapk3Fonm_mPDaov1zaVHZm2g@mail.gmail.com>
 <4ffc887c-9160-a5a6-2bf9-0a86c872cd60@linux.ibm.com>
In-Reply-To: <4ffc887c-9160-a5a6-2bf9-0a86c872cd60@linux.ibm.com>
From: Deng Tyler <tyler.sabdon@gmail.com>
Date: Tue, 10 Dec 2019 13:08:19 +0800
Message-ID: <CAO9PYRL=OHexpzjazShywXxg1w5FeUA4=dkupNXCY-85+CckJQ@mail.gmail.com>
Subject: Re: pinctrl in phosphor-hwmon
To: Matt Spinler <mspinler@linux.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000008aa5810599528195"
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

--0000000000008aa5810599528195
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt:
    Thank for your response that's really helpful. I check the link and it
seems allow a gpio set to high before/after reading a correspond sensor. Is
it possible change 2 gpio to high/low for reading a correspond sensor?

Regards,
Tyler

Matt Spinler <mspinler@linux.ibm.com> =E6=96=BC 2019=E5=B9=B412=E6=9C=889=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8810:58=E5=AF=AB=E9=81=93=EF=
=BC=9A

>
>
> On 12/9/2019 6:15 AM, Deng Tyler wrote:
> > Hi all:
> >     Does phosphor-hwmon support changing gpio pin before read
> > /sys/class/hwmon/hwmon0/fan*_input while monitoring fan sensor? In my
> > platform, fans gpio are connect to pin-mux and I need control gpio
> > before get fan tach rpm.
>
> It does have the ability to modify a GPIO before/after a reading:
> https://github.com/openbmc/phosphor-hwmon/blob/master/mainloop.cpp#L447
>
> configured by some lines in the conf file, like:
>
> https://github.com/openbmc/meta-ibm/blob/master/meta-romulus/recipes-phos=
phor/sensors/phosphor-hwmon/obmc/hwmon/iio-hwmon-battery.conf#L4
>
> >
> > Regards,
> > Tyler
>
>

--0000000000008aa5810599528195
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Matt:<div>=C2=A0 =C2=A0 Thank for your response that&#3=
9;s really helpful. I check the link and it seems allow a gpio set to high =
before/after reading a correspond=C2=A0sensor. Is it possible change 2 gpio=
 to high/low for reading a correspond sensor?</div><div><br></div><div>Rega=
rds,</div><div>Tyler</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">Matt Spinler &lt;<a href=3D"mailto:mspinler@linux=
.ibm.com">mspinler@linux.ibm.com</a>&gt; =E6=96=BC 2019=E5=B9=B412=E6=9C=88=
9=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8810:58=E5=AF=AB=E9=81=93=EF=
=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 12/9/2019 6:15 AM, Deng Tyler wrote:<br>
&gt; Hi all:<br>
&gt; =C2=A0 =C2=A0 Does phosphor-hwmon support=C2=A0changing gpio pin befor=
e read <br>
&gt; /sys/class/hwmon/hwmon0/fan*_input while=C2=A0monitoring=C2=A0fan sens=
or? In my <br>
&gt; platform, fans gpio are connect to pin-mux and I need control gpio <br=
>
&gt; before get fan tach rpm.<br>
<br>
It does have the ability to modify a GPIO before/after a reading:<br>
<a href=3D"https://github.com/openbmc/phosphor-hwmon/blob/master/mainloop.c=
pp#L447" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/ph=
osphor-hwmon/blob/master/mainloop.cpp#L447</a><br>
<br>
configured by some lines in the conf file, like:<br>
<a href=3D"https://github.com/openbmc/meta-ibm/blob/master/meta-romulus/rec=
ipes-phosphor/sensors/phosphor-hwmon/obmc/hwmon/iio-hwmon-battery.conf#L4" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/meta-ibm/bl=
ob/master/meta-romulus/recipes-phosphor/sensors/phosphor-hwmon/obmc/hwmon/i=
io-hwmon-battery.conf#L4</a><br>
<br>
&gt;<br>
&gt; Regards,<br>
&gt; Tyler<br>
<br>
</blockquote></div>

--0000000000008aa5810599528195--
