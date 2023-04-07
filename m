Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2BF6DB1EA
	for <lists+openbmc@lfdr.de>; Fri,  7 Apr 2023 19:40:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PtQdJ6Yy2z3fVQ
	for <lists+openbmc@lfdr.de>; Sat,  8 Apr 2023 03:40:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Cv8nQJCW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com; envelope-from=jianghao@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Cv8nQJCW;
	dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PtQcj0P50z3fSf
	for <openbmc@lists.ozlabs.org>; Sat,  8 Apr 2023 03:40:19 +1000 (AEST)
Received: by mail-qt1-x82e.google.com with SMTP id a5so41219078qto.6
        for <openbmc@lists.ozlabs.org>; Fri, 07 Apr 2023 10:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680889216; x=1683481216;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=drVBEvtoZWxaeGeLMby0d9/3fk94/usYdozgfgJWxOI=;
        b=Cv8nQJCW1RBznBARGOklJph+f2oZ3OgDnYcmvIW1hOKlcdqmvwrbULcvzMFcXIVWu8
         jbvqYH/xR8pB48IlK8syw/8U8niK98HhjjtShdyF1cq79OHpUZ/qRQEDAfJNobwmtqNp
         lTQIRVDEbr7vjRcJuLwpVc/FMZ0PAFDGUMUNxEcpYN1kttPBbeNJ+p6pH/QftfG+anrz
         LCJLZt/wx570NnUpQmkMnMWSEATlxq2aoH/tHuNWRpoXfBQKXISOYGMpmM+jBeD3h1sn
         POHX3EGQTmnmG9B0K47Y0BD4lucyKVCSnBeHajWKb/LNnzm2SnbZQV7A1yWJh93LB0BY
         VEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680889216; x=1683481216;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=drVBEvtoZWxaeGeLMby0d9/3fk94/usYdozgfgJWxOI=;
        b=DspHLorLhqtFh93hxPmmC4uQz3WwiIox5pLggsACEhTNKkqU9FCzSGxOy6WXf0cMgc
         9yUWOBRK6SGCcK56TymEPH5qOwodsgO49YeaH5QBWsrzoil8qFr1Sy2exMpqJFqoYIGW
         A1FHrVFg0AzPBJGybP1o5bu741gAPVzakRImRx+IM/zyhMhym9e4TtwYaUCvqvGor2Eg
         UlzyJgmgMc8NG8sDHR89g+Zv9vQL54tHFUWzWORvNBoduJ5x9HJL18p+3X6vU3w2wTO8
         KvSYA+sVPa2u33/9EhtpUe6MSoZLOJrYuCy0U7WhIaEu1cSa/nE0iSwfQOl1CrhbzAaz
         5VWA==
X-Gm-Message-State: AAQBX9fePmVM+yP3mahHrnjUsSZYkB3/bhZ+eXQlEMm3HZ6Cq2xOi8A6
	BFhBYwV10hvGQqFdKnopBgVPl64xbLKmD6Fgszq0ew==
X-Google-Smtp-Source: AKy350Yy/OlpkkKV+eugEg+cxw+VJPw0kiGelc5eggd/svIPOgAS7OdJ/FbKmGuokxnGGp2B/mTui3DEiwjB9RKd+o4=
X-Received: by 2002:a05:622a:d1:b0:3e3:8ed5:a47a with SMTP id
 p17-20020a05622a00d100b003e38ed5a47amr1025286qtw.9.1680889216042; Fri, 07 Apr
 2023 10:40:16 -0700 (PDT)
MIME-Version: 1.0
References: <PR3P195MB055546905D984A24BEB9D474C3969@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
 <c9adff03-16f4-40d4-8334-6cdbbdea2407@betaapp.fastmail.com> <PR3P195MB0555D8C52C5F2EBE2FA1E299C3969@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
In-Reply-To: <PR3P195MB0555D8C52C5F2EBE2FA1E299C3969@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
From: Hao Jiang <jianghao@google.com>
Date: Fri, 7 Apr 2023 10:40:04 -0700
Message-ID: <CAB38=p21yk1O8eQvq9Rtq4TuKpoJeU7Zy189KJRmGCcQ0NqyQw@mail.gmail.com>
Subject: Re: OpenBMC - Support NVMe drive health monitoring
To: Lior Weintraub <liorw@pliops.com>
Content-Type: multipart/alternative; boundary="000000000000a1730e05f8c284af"
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
Cc: Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>, "rashmica@linux.ibm.com" <rashmica@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000a1730e05f8c284af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lior and Andrew,

The goal of enhancing nvmesensor with nvme-mi is to fulfill the full stack
management of NVMe devices, including health monitoring but beyond. An
example could be SSD firmware update and security protocol transportation.

The MCTP support has improved compared to two years ago. The MCTP I2C
binding has been upstreamed to linux kernel and there is an mctp daemon for
openbmc for the MCTP management.



On Fri, Apr 7, 2023 at 5:35=E2=80=AFAM Lior Weintraub <liorw@pliops.com> wr=
ote:

> Thanks Andrew,
>
>
>
> I wish I had the experience to help with the review process =F0=9F=98=8A
>
> I have more than 2 decades experience with bare metal embedded systems bu=
t
> no experience with Embedded Linux\Yocto nor OpenBMC (nor Gerrit).
>
> It's all new to me and came to realize that many guides \ documentations =
I
> find on the web are old and doesn't work anymore on OpenBMC (e.g. using t=
he
> oe-init-build-env vs setup script).
>
>
>
> I am happy to assist and contribute but I need some guidance.
>
> I have only 2 weeks experience with OpenBMC.
>
> I have succeeded to build few platforms and run them (e.g. qemuarm and
> RaspberryPi4).
>
> I watched many youtube videos on OpenBMC which gave me a good overall
> understanding but when it comes to start coding or adding new stuff I am
> lost.
>
>
>
> If we start our development with NVMe-MI basic management command as a
> starting point, what steps would you recommend we need to take?
>
> Can we use the PaspberryPi4 for this initial implementation?
>
> We have a basic OpenBMC image on this RaspPi and we have it's I2C
> connected to our PCIe card (which is using a Desktop as the host PC).
>
> (BTW, the i2c-dev module is not loaded automatically and we still haven't
> figured out why. As a workaround, we load the module manually with modpro=
be
> i2c-dev on the OpenBMC UART terminal)
>
>
>
> Thanks,
>
> Lior.
>
>
>
> -----Original Message-----
> From: Andrew Jeffery <andrew@aj.id.au>
> Sent: Friday, April 7, 2023 2:46 PM
> To: Lior Weintraub <liorw@pliops.com>
> Cc: Ed Tanous <ed@tanous.net>; openbmc@lists.ozlabs.org;
> rashmica@linux.ibm.com; jianghao@google.com
> Subject: Re: OpenBMC - Support NVMe drive health monitoring
>
>
>
> CAUTION: External Sender
>
>
>
> On Fri, 7 Apr 2023, at 19:50, Lior Weintraub wrote:
>
> > Hi Jet,
>
> >
>
> > My name is Lior Weintraub and I face exactly the same task that you
>
> > handled 2 years ago =F0=9F=98=8A
>
> > I found this mailing list thread on OpenBmc:
>
> > https://lists.ozlabs.org/pipermail/openbmc/2020-November/024012.html
>
> >
>
> > Can you please advice about the current status of this issue?
>
> > I need to add OOB support to our NVMe device (supporting NVMe MI ->
>
> > MCTP with SMBus binding).
>
> > For this task we plan to buy the AST2600 development
>
> > kit<https://portwell.com/solutions/openBMC.php> and use the OpenBMC
>
> > for our development and testing.
>
>
>
> Currently OpenBMC only supports NVMe-MI via the basic management command.
> See phosphor-nvme or nvmesensor from dbus-sensors. We're working on
> migrating the OpenBMC MCTP stack to the AF_MCTP sockets that are now
> provided by Linux.
>
>
>
> Please help review and test Rashmica's work in Gerrit to speed that
> process along:
>
>
>
> https://gerrit.openbmc.org/q/topic:AF_MCTP
>
>
>
> Along with Hao Jiang's work to exploit libnvme-mi in nvmesensor:
>
>
>
> https://gerrit.openbmc.org/q/topic:nvme-mi
>
>
>
> Andrew
>


--=20
Hao

--000000000000a1730e05f8c284af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Lior and Andrew,=C2=A0<br><br>The goal of enhancing nvm=
esensor=C2=A0with nvme-mi is to fulfill the full stack management of NVMe d=
evices, including health monitoring but beyond. An example could be SSD fir=
mware update and security=C2=A0protocol transportation.=C2=A0<br><br>The MC=
TP support has improved compared to two years ago. The MCTP I2C binding has=
 been upstreamed to linux kernel and there is an mctp daemon for openbmc fo=
r the MCTP management.=C2=A0<br><br><br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 7, 2023 at 5:35=E2=80=
=AFAM Lior Weintraub &lt;<a href=3D"mailto:liorw@pliops.com">liorw@pliops.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div class=3D"msg6552336304203016699">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_6552336304203016699WordSection1">
<p class=3D"m_6552336304203016699MsoPlainText">Thanks Andrew,<u></u><u></u>=
</p>
<p class=3D"m_6552336304203016699MsoPlainText"><u></u>=C2=A0<u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText">I wish I had the experience =
to help with the review process
<span style=3D"font-family:&quot;Segoe UI Emoji&quot;,sans-serif">=F0=9F=98=
=8A</span><u></u><u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText">I have more than 2 decades e=
xperience with bare metal embedded systems but no experience with Embedded =
Linux\Yocto nor OpenBMC (nor Gerrit).<u></u><u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText">It&#39;s all new to me and c=
ame to realize that many guides \ documentations I find on the web are old =
and doesn&#39;t work anymore on OpenBMC (e.g. using the oe-init-build-env v=
s setup script).<u></u><u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText"><u></u>=C2=A0<u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText">I am happy to assist and con=
tribute but I need some guidance.<u></u><u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText">I have only 2 weeks experien=
ce with OpenBMC.<u></u><u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText">I have succeeded to build fe=
w platforms and run them (e.g. qemuarm and RaspberryPi4).<u></u><u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText">I watched many youtube video=
s on OpenBMC which gave me a good overall understanding but when it comes t=
o start coding or adding new stuff I am lost.<u></u><u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText"><u></u>=C2=A0<u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText">If we start our development =
with NVMe-MI basic management command as a starting point, what steps would=
 you recommend we need to take?<u></u><u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText">Can we use the PaspberryPi4 =
for this initial implementation?<u></u><u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText">We have a basic OpenBMC imag=
e on this RaspPi and we have it&#39;s I2C connected to our PCIe card (which=
 is using a Desktop as the host PC).<u></u><u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText">(BTW, the i2c-dev module is =
not loaded automatically and we still haven&#39;t figured out why. As a wor=
karound, we load the module manually with modprobe i2c-dev on the OpenBMC U=
ART terminal)<u></u><u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText"><u></u>=C2=A0<u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText">Thanks,<u></u><u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText">Lior.<u></u><u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText"><u></u>=C2=A0<u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText">-----Original Message-----<b=
r>
From: Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.id.au" target=3D"_blan=
k">andrew@aj.id.au</a>&gt; <br>
Sent: Friday, April 7, 2023 2:46 PM<br>
To: Lior Weintraub &lt;<a href=3D"mailto:liorw@pliops.com" target=3D"_blank=
">liorw@pliops.com</a>&gt;<br>
Cc: Ed Tanous &lt;<a href=3D"mailto:ed@tanous.net" target=3D"_blank">ed@tan=
ous.net</a>&gt;; <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_bla=
nk">openbmc@lists.ozlabs.org</a>; <a href=3D"mailto:rashmica@linux.ibm.com"=
 target=3D"_blank">rashmica@linux.ibm.com</a>; <a href=3D"mailto:jianghao@g=
oogle.com" target=3D"_blank">jianghao@google.com</a><br>
Subject: Re: OpenBMC - Support NVMe drive health monitoring</p>
<p class=3D"m_6552336304203016699MsoPlainText"><u></u>=C2=A0<u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText">CAUTION: External Sender<u><=
/u><u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText"><span lang=3D"HE" dir=3D"RTL=
" style=3D"font-size:10.5pt;font-family:&quot;Times New Roman&quot;,serif">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"m_6552336304203016699MsoPlainText">On Fri, 7 Apr 2023, at 19:50=
, Lior Weintraub wrote:<u></u><u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText">&gt; Hi Jet,<u></u><u></u></=
p>
<p class=3D"m_6552336304203016699MsoPlainText"><span dir=3D"RTL"></span><sp=
an dir=3D"RTL"></span><span lang=3D"HE" dir=3D"RTL" style=3D"font-size:10.5=
pt;font-family:&quot;Times New Roman&quot;,serif"><span dir=3D"RTL"></span>=
<span dir=3D"RTL"></span>&gt;<u></u>=C2=A0<u></u></span></p>
<p class=3D"m_6552336304203016699MsoPlainText"><span dir=3D"LTR"></span><sp=
an dir=3D"LTR"></span><span dir=3D"LTR"></span><span dir=3D"LTR"></span>&gt=
; My name is Lior Weintraub and I face exactly the same task that you
<u></u><u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText">&gt; handled 2 years ago <sp=
an style=3D"font-family:&quot;Segoe UI Emoji&quot;,sans-serif">
=F0=9F=98=8A</span><u></u><u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText">&gt; I found this mailing li=
st thread on OpenBmc:<u></u><u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText">&gt; <a href=3D"https://list=
s.ozlabs.org/pipermail/openbmc/2020-November/024012.html" target=3D"_blank"=
>
<span style=3D"color:windowtext;text-decoration:none">https://lists.ozlabs.=
org/pipermail/openbmc/2020-November/024012.html</span></a><u></u><u></u></p=
>
<p class=3D"m_6552336304203016699MsoPlainText"><span dir=3D"RTL"></span><sp=
an dir=3D"RTL"></span><span lang=3D"HE" dir=3D"RTL" style=3D"font-size:10.5=
pt;font-family:&quot;Times New Roman&quot;,serif"><span dir=3D"RTL"></span>=
<span dir=3D"RTL"></span>&gt;<u></u>=C2=A0<u></u></span></p>
<p class=3D"m_6552336304203016699MsoPlainText"><span dir=3D"LTR"></span><sp=
an dir=3D"LTR"></span><span dir=3D"LTR"></span><span dir=3D"LTR"></span>&gt=
; Can you please advice about the current status of this issue?<u></u><u></=
u></p>
<p class=3D"m_6552336304203016699MsoPlainText">&gt; I need to add OOB suppo=
rt to our NVMe device (supporting NVMe MI -&gt;
<u></u><u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText">&gt; MCTP with SMBus binding=
).<u></u><u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText">&gt; For this task we plan t=
o buy the AST2600 development <u></u>
<u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText">&gt; kit&lt;<a href=3D"https=
://portwell.com/solutions/openBMC.php" target=3D"_blank"><span style=3D"col=
or:windowtext;text-decoration:none">https://portwell.com/solutions/openBMC.=
php</span></a>&gt; and use the OpenBMC
<u></u><u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText">&gt; for our development and=
 testing.<u></u><u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText"><span lang=3D"HE" dir=3D"RTL=
" style=3D"font-size:10.5pt;font-family:&quot;Times New Roman&quot;,serif">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"m_6552336304203016699MsoPlainText">Currently OpenBMC only suppo=
rts NVMe-MI via the basic management command. See phosphor-nvme or nvmesens=
or from dbus-sensors. We&#39;re working on migrating the OpenBMC MCTP stack=
 to the AF_MCTP sockets that are now provided by Linux.<u></u><u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText"><span lang=3D"HE" dir=3D"RTL=
" style=3D"font-size:10.5pt;font-family:&quot;Times New Roman&quot;,serif">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"m_6552336304203016699MsoPlainText">Please help review and test =
Rashmica&#39;s work in Gerrit to speed that process along:<u></u><u></u></p=
>
<p class=3D"m_6552336304203016699MsoPlainText"><span lang=3D"HE" dir=3D"RTL=
" style=3D"font-size:10.5pt;font-family:&quot;Times New Roman&quot;,serif">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"m_6552336304203016699MsoPlainText"><a href=3D"https://gerrit.op=
enbmc.org/q/topic:AF_MCTP" target=3D"_blank"><span style=3D"color:windowtex=
t;text-decoration:none">https://gerrit.openbmc.org/q/topic:AF_MCTP</span></=
a><u></u><u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText"><span lang=3D"HE" dir=3D"RTL=
" style=3D"font-size:10.5pt;font-family:&quot;Times New Roman&quot;,serif">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"m_6552336304203016699MsoPlainText">Along with Hao Jiang&#39;s w=
ork to exploit libnvme-mi in nvmesensor:<u></u><u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText"><span lang=3D"HE" dir=3D"RTL=
" style=3D"font-size:10.5pt;font-family:&quot;Times New Roman&quot;,serif">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"m_6552336304203016699MsoPlainText"><a href=3D"https://gerrit.op=
enbmc.org/q/topic:nvme-mi" target=3D"_blank"><span style=3D"color:windowtex=
t;text-decoration:none">https://gerrit.openbmc.org/q/topic:nvme-mi</span></=
a><u></u><u></u></p>
<p class=3D"m_6552336304203016699MsoPlainText"><span lang=3D"HE" dir=3D"RTL=
" style=3D"font-size:10.5pt;font-family:&quot;Times New Roman&quot;,serif">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"m_6552336304203016699MsoPlainText">Andrew<u></u><u></u></p>
</div>
</div>

</div></blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gm=
ail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signatu=
re"><div dir=3D"ltr">Hao</div></div>

--000000000000a1730e05f8c284af--
