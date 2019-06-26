Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAB0571F9
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 21:47:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Ytpp32rNzDqV4
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2019 05:47:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FL1pOMKB"; 
 dkim-atps=neutral
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YtpC11dqzDqVx
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2019 05:46:58 +1000 (AEST)
Received: by mail-yb1-xb32.google.com with SMTP id w9so23600ybe.9
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2019 12:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=YoLP/Usy/1ZYV2wItH7x0nLEoHl99ZAL17oKCLcd70M=;
 b=FL1pOMKBFfPL2/vWsrMO84gWmr82EJPdeExDKakqAN0q4FJQwee0uhYSISFx+2Nr0w
 /s5XihZU0YGZVhfHf9c79KuW7x0bqgguYOyJI6t4wb/TolOb/W8uiW+8wgsuC2RKMIOV
 MsDjBOcmjR0UKkUqR+fFE9Zksc7d5tIwPsnwQBr7/qr0Bh+ogrvnK9N+GClzd7tJm6r4
 Tzb+PNb2Q282zmgi4xCnWddbuQHQl5RaRsBPtFhVuXWuo3hX/Eck84EYWVCHBOBFbUIp
 3EGCSPSn8GPBBU36EWZxWe7OqJrSiDgepFgsIByF4V1sHS3ZF6V0nWTww3IX2X+YvHKf
 mcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=YoLP/Usy/1ZYV2wItH7x0nLEoHl99ZAL17oKCLcd70M=;
 b=oR7PRFPH2RKt1ZzyEexVl6aIQ5fTWeC/R315O/ISTcFJLpgTMcsQE8Q6df/s1xC8iy
 yIXWjEXR5nhct33Qdx5yx1qVBhOI54FOco17tY6Qquf5n7xCpJp18G2CmakKYuo4ayjo
 K4uspsqSyEUWQ0UoQEIuwDlTMPOU4LbJ/GcFTpJIWeVPle9GWzq7dTR5uBQtG11vpXrW
 VGmOmDt6zG84F6tHLAgivwVO1AguYPB7/t0WICFTV250JlD2a+sR9JfSZidilXA42S/m
 nSOpXKxB4CNL1H8aMF22wD87yPT36woGDJV5Oa6Zoal+IjCr4FqfU284k8EnGFtCEmB6
 u/Iw==
X-Gm-Message-State: APjAAAUrpsvFNWc/+jk3DJRujShnbWXpAuENegn3+dgTOz2LUtgoSS1y
 4C/5aBbzR/y8uMwIam3VFv2j+cSEUZ81t4X8+ck=
X-Google-Smtp-Source: APXvYqxaUtHscNcVeYORqpZHxb4o/dUiXOTMGB9J5niHfzkV/P5t29gN6gGhTwx57+mnD4u0JRcQT5UjjfMlf3Dvg14=
X-Received: by 2002:a5b:986:: with SMTP id c6mr85779ybq.130.1561578414079;
 Wed, 26 Jun 2019 12:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAMTupoRQ6fQ6--L4DW80KMv5CpULXJsdwcJ4Vse5L8wf8gQ7sA@mail.gmail.com>
 <tencent_7F24C9492867DD672731D79A@qq.com>
In-Reply-To: <tencent_7F24C9492867DD672731D79A@qq.com>
From: Jandra A <jandraara@gmail.com>
Date: Wed, 26 Jun 2019 14:46:43 -0500
Message-ID: <CAMTupoQ8nKDFXRNy+prOLinxqrGLKYuPY94Rqq_eiqmfDwCPVA@mail.gmail.com>
Subject: Re: Meeting - Network Settings
To: xiuzhi <1450335857@qq.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Derick <derick.montague@gmail.com>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000a90520058c3f4ee1"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000a90520058c3f4ee1
Content-Type: text/plain; charset="UTF-8"

Xiuzhi -- Thanks for joining today. Ratan is the backend developer leading
the work for Network Settings.

Ratan -- I'm helping create the design mockup for including IPV6 in the
Network settings panel so that Lenovo can do the front-end implementation.
Do you know if the work your team was doing for this will be merged to the
master soon?

I have some questions I am hoping you can help answer for this IPV6 design:
- What happens to zeroconf when both IPV4 and IPV6 are enabled? Does it try
to assign an IP address to both (in the case that DHCP doesn't give either)
or does it only assign either an IPV4 IP address or an IPV6 IP address?
- What is the format of IPV6 DNS servers? Is that also in the format of an
IPV6 IP address?

I have built the latest openbmc project image by adding the option "ipv6"
> in the term DISTRO_FEATURES_DEFAULT in the file
> /meta-phosphor/conf/distro/include/phosphor-base.inc. I can ping the
> openbmc  IPV6 IP successfully, but cannot login to it by openssh command.
> It seemed that there are some works on openbmc embedded OS to support IPV6.
> Another issue from Ruixia is the IPV6 Dbus Interfaces design, I found
> there are some IPV6 rest-Dbus or Redfish interfaces on yaml files
> available. I don' t know is it enough to the IPV6 webui.


Ratan, would you be able to help Xiuzhi with this?

Regards,
Jandra Aranguren



On Wed, Jun 26, 2019 at 8:30 AM xiuzhi <1450335857@qq.com> wrote:

> Hi Jandra,
>     Thank you for the meeting very much to let us know the details of IPV6
> webUI design.I am sorry to express clearly on the meeting because of the
> poor spoken English. Ruixia is able to start the webui implementation as
> soon as getting your webui designs.
>    What I concern is the schedule of openbmc server to support IPV6, eg
> bmcweb and network project.
> I have built the latest openbmc project image by adding the option "ipv6"
> in the term DISTRO_FEATURES_DEFAULT in the file
> /meta-phosphor/conf/distro/include/phosphor-base.inc.
>   I can ping the openbmc  IPV6 IP successfully, but cannot login to it by
> openssh command.
> It seemed that there are some works on openbmc embedded OS to support IPV6.
> As you mentioned, the community has do lots of work on IPV6 ,which hasn't
> merge to the main branch. I am looking for the IPV6 source code to do some
> test. That would be helpful to test the new network webui.
>    Another issue from Ruixia is the IPV6 Dbus Interfaces design, I found
> there are some IPV6 rest-Dbus or Redfish interfaces on yaml files
> available. I don' t know is it enough to the IPV6 webui.
>
>   Best,
> Xiuzhi
>
> ------------------ Original ------------------
> *From: * "Jandra A";<jandraara@gmail.com>;
> *Send time:* Wednesday, Jun 26, 2019 8:06 PM
> *To:* "xiuzhi"<1450335857@qq.com>; "rxsun"<rxsun@zd-tech.com.cn>;
> *Subject: * Meeting - Network Settings
>
> Hello Xiuzhi and Ruixia,
>
> I saw you tried to join the meeting 30 minutes ago, will you still be able
> to join now? (7:00 AM Central Time)?
>
>
>

--000000000000a90520058c3f4ee1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Xiuzhi -- Thanks for joining today. Ratan is the back=
end developer leading the work for Network Settings.=C2=A0</div><div><br></=
div><div>Ratan -- I&#39;m helping create the design mockup for including IP=
V6 in the Network settings panel so that Lenovo can do the front-end implem=
entation. Do you know if the work your team was doing for this will be merg=
ed to the master soon?</div><br>I have some questions I am hoping you can h=
elp answer for this IPV6 design:=C2=A0<div>- What happens to zeroconf when =
both IPV4 and IPV6 are enabled? Does it try to assign an IP address to both=
 (in the case that DHCP doesn&#39;t give either) or does it only assign eit=
her an IPV4 IP address or an IPV6 IP address?<div>- What is the format of I=
PV6 DNS servers? Is that also in the format of an IPV6 IP address?<br><br><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">I have built the latest op=
enbmc project image by adding the option &quot;ipv6&quot; in the term DISTR=
O_FEATURES_DEFAULT in the file /meta-phosphor/conf/distro/include/phosphor-=
base.inc. I can ping the openbmc=C2=A0 IPV6 IP successfully, but cannot log=
in to it by openssh command.<br>It seemed that there are some works on open=
bmc embedded OS to support IPV6.<br>Another issue from Ruixia is the IPV6 D=
bus Interfaces design, I found there are some IPV6 rest-Dbus or Redfish int=
erfaces on yaml files available. I don&#39; t know is it enough to the IPV6=
 webui.</blockquote><div><br></div>Ratan, would you be able to help Xiuzhi =
with this?</div><div><br></div><div>Regards,</div><div>Jandra Aranguren=C2=
=A0</div><div><br><div><br></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Wed, Jun 26, 2019 at 8:30 AM xiuzhi &lt;<a hr=
ef=3D"mailto:1450335857@qq.com">1450335857@qq.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div>Hi Jandra,</div><div>=
=C2=A0 =C2=A0 Thank you for the meeting very much to let us know the detail=
s of IPV6 webUI design.I am sorry to express clearly on the meeting because=
 of the poor spoken English. Ruixia is able to start the webui implementati=
on as soon as getting your webui designs.</div><div>=C2=A0 =C2=A0What I=C2=
=A0concern is the schedule of openbmc server to support IPV6, eg bmcweb and=
 network project.</div><div>I have built the latest openbmc project image b=
y adding the option &quot;ipv6&quot; in the term DISTRO_FEATURES_DEFAULT in=
 the file /meta-phosphor/conf/distro/include/phosphor-base.inc.</div><div>=
=C2=A0 I can ping the openbmc=C2=A0 IPV6 IP successfully, but cannot login =
to it by openssh command.</div><div>It seemed that there are some works on =
openbmc embedded OS to support IPV6.</div><div>As you mentioned, the commun=
ity has do lots of work on IPV6 ,which hasn&#39;t merge to the main branch.=
 I am looking for the IPV6 source code to do some test. That would be helpf=
ul to test the new network webui.</div><div>=C2=A0 =C2=A0Another issue from=
 Ruixia is the IPV6 Dbus Interfaces design, I found there are some IPV6 res=
t-Dbus or Redfish interfaces on yaml files available. I don&#39; t know is =
it enough to the IPV6 webui.</div><div>=C2=A0 =C2=A0</div><div>=C2=A0 Best,=
</div><div>Xiuzhi</div><div><span style=3D"font-family:&quot;Arial Narrow&q=
uot;;font-size:12px"><br></span></div><div><span style=3D"font-family:&quot=
;Arial Narrow&quot;;font-size:12px">------------------=C2=A0Original=C2=A0-=
-----------------=C2=A0</span></div><div><div style=3D"font-size:12px;backg=
round:rgb(239,239,239);padding:8px"><div><b>From: </b>=C2=A0&quot;Jandra A&=
quot;;&lt;<a href=3D"mailto:jandraara@gmail.com" target=3D"_blank">jandraar=
a@gmail.com</a>&gt;;</div><div><b>Send time:</b>=C2=A0Wednesday, Jun 26, 20=
19 8:06 PM</div><div><b>To:</b>=C2=A0&quot;xiuzhi&quot;&lt;<a href=3D"mailt=
o:1450335857@qq.com" target=3D"_blank">1450335857@qq.com</a>&gt;; &quot;rxs=
un&quot;&lt;<a href=3D"mailto:rxsun@zd-tech.com.cn" target=3D"_blank">rxsun=
@zd-tech.com.cn</a>&gt;; </div><div></div><div><b>Subject: </b>=C2=A0Meetin=
g - Network Settings</div></div><div><br></div><div dir=3D"ltr">Hello=C2=A0=
Xiuzhi and Ruixia,=C2=A0<div><br></div><div>I saw you tried to join the mee=
ting 30 minutes ago, will you still be able to join now? (7:00 AM Central T=
ime)?=C2=A0</div><div><br></div><div><br></div></div></div></blockquote></d=
iv></div></div></div>

--000000000000a90520058c3f4ee1--
