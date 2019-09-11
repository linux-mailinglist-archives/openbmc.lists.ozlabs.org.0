Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EDDAFA2F
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2019 12:19:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SyYp5npCzF2Z8
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2019 20:19:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="foYgbf3s"; 
 dkim-atps=neutral
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SyYB0BPDzF2Wf
 for <openbmc@lists.ozlabs.org>; Wed, 11 Sep 2019 20:18:53 +1000 (AEST)
Received: by mail-ot1-x336.google.com with SMTP id y39so22030593ota.7
 for <openbmc@lists.ozlabs.org>; Wed, 11 Sep 2019 03:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QcYwcqdp1UOE4tMNAxpFj+6MtwMClWtgkz9BF3ndwqw=;
 b=foYgbf3sLS/s3O2L4fp96jWCgNUDSCqHR30dgKubrSW/1Qpr7VGOxnAZA6wzGDkxmv
 w+cSVgaz3dlBKfpabXJFsrluor1yHs86q+9gJIyIj5gTtS3PuG4ZzXFv3xa/CpgOxgXJ
 C2Nj3jC4yiFv31zAp6ebPRE1mdRYN/L8zCOiIGQBG/wDS2FFlP8N7FEo5MRg9lE5qLEK
 lzYEZe0Z05KeKicALZsXVro2O5eWLNnwb4xyTpjeQ2vMrcrmJq9kiSesn2WgeFRva4CU
 mXb4BD75Mdl5TbzqztiGaF8eBAzDfpj86tsTegTUSHFJRZJgE2+Y6AMrNuPOnHRmeUyT
 75YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QcYwcqdp1UOE4tMNAxpFj+6MtwMClWtgkz9BF3ndwqw=;
 b=kVhghiWV6+YBIH3Pq06mvdCCaD6A/zSPCo66fQWctbEB6CWsy4w3ctpMqDhpTAOeAI
 oxKW+Cv6hugrFICjLR9CgILrFPhoSxGKN2vWMVwZ4IIpqVAhg6bSeC0KEV7KqTfV5Sc9
 fL3bCKayfYFX2IjdJW7G60j5/CeFQRdgI9GpqVQYM2imsIQlfrK1GPvrcILG6eqpI3Ck
 5xSmXamu+IKXX/T+kELraBe11dKwGSiAPpSdK3cPINcxTTxvwuiSvX7ph5fpkTTnzYj2
 y7KNkHdxk3farvYpyOHAIMfHc8N+xMlxre4UEDQdOENW4t0kF5qmUoPMnO4O7UH3QQ/j
 1q4A==
X-Gm-Message-State: APjAAAUUIAgMyel1D2x5xLep8IZoY2FU7hYqMlgJuCkW/J/f/5NuvsOl
 gObGlXsPUuc+Ud+spz88DDqhNAvxGoOXaAmXcAM=
X-Google-Smtp-Source: APXvYqyMqywK5e7x/EZksuQ62fSDGZfwALzq1TSShsp3ODZZBz6CYbbHxqwiw+cMRrTJ0rm/Xlsc1sghaMxlljFCEQA=
X-Received: by 2002:a05:6830:c1:: with SMTP id
 x1mr9839838oto.272.1568197130258; 
 Wed, 11 Sep 2019 03:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAE33tLEzV8+n+cFVtnr0vYynsqn42+5APTtojHqWGb8A5GyG2g@mail.gmail.com>
 <000001d56168$6da06960$48e13c20$@linux.intel.com>
In-Reply-To: <000001d56168$6da06960$48e13c20$@linux.intel.com>
From: AKASH G J <akashgj91@gmail.com>
Date: Wed, 11 Sep 2019 15:46:57 +0530
Message-ID: <CAE33tLGNc3waqv7nqHVnNmXkkfk7WFYGCN986B3=0F=TUj=wMw@mail.gmail.com>
Subject: Re: Cannot connect to console server in s2600wf
To: Yong Li <yong.b.li@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000e30c5c0592445864"
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
Cc: "Yang, Cheng C" <cheng.c.yang@intel.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000e30c5c0592445864
Content-Type: text/plain; charset="UTF-8"

Sorry for the delay for reply.

We want to get the host CPU console over the BMC console.

I build OpenBMC firmware using the following steps.

1. export TEMPLATECONF=meta-intel/meta-s2600wf/conf/
2. . openbmc-env
3. bitbake obmc-phosphor-image

*/lib/systemd/system/obmc-console@.service* is available with content

[Unit]
Description=Phosphor Console Muxer listening on device /dev/%I
BindsTo=dev-%i.device
After=dev-%i.device

[Service]
ExecStart=/usr/bin/env obmc-console-server --config /etc/obmc-console.conf
%i
SyslogIdentifier=obmc-console-server
Restart=always

[Install]
WantedBy=multi-user.target

File*
/etc/systemd/system/multi-user.target.wants/obmc-console@ttyVUART0.service*
found.

root@s2600wf:~# *ls -l /dev/ttyS**
crw-rw----    1 root     dialout     4,  64 Aug 30 04:42 /dev/ttyS0
crw-rw----    1 root     dialout     4,  65 Aug 30 04:42 /dev/ttyS1
crw-rw----    1 root     dialout     4,  66 Aug 30 04:42 /dev/ttyS2
crw-rw----    1 root     dialout     4,  67 Aug 30 04:42 /dev/ttyS3
crw-------    1 root     tty         4,  68 Aug 30 04:45 /dev/ttyS4
crw-rw----    1 root     dialout     4,  69 Aug 30 04:42 /dev/ttyS5


Moreover */etc/obmc-console.conf* file not found.

On Mon, Sep 2, 2019 at 1:58 PM Yong Li <yong.b.li@linux.intel.com> wrote:

> Could you share more information:
>
> Do you want to use the SOL feature?
>
> How did you build the OpenBMC?
>
> There should be a systemd service:
> /lib/systemd/system/obmc-console@.service. And check the file
> /etc/systemd/system/multi-user.target.wants/obmc-console@*, is it ttyS2?
>
> ls -l /dev/ttyS*, can you find these ttyS items?
>
>
>
> Thanks,
>
> Yong
>
>
>
> *From:* openbmc <openbmc-bounces+yong.b.li=
> linux.intel.com@lists.ozlabs.org> *On Behalf Of *AKASH G J
> *Sent:* Friday, August 30, 2019 8:27 PM
> *To:* openbmc@lists.ozlabs.org
> *Subject:* Cannot connect to console server in s2600wf
>
>
>
> Hi all,
>
>
>
> I am using OpenBMC Linux with s2600wf configuration.
>
>
>
> When I tried to execute 0bmc-console-client the following error came.
>
>
>
> root@s2600wf:~# obmc-console-client
>
> obmc-console-client: Can't connect to console server: Connection refused
>
>
>
> in *ps* command output also obmc-console-server not found.
>
>
>
>
>
> Thanks,
>
>
>
> Akash
>

--000000000000e30c5c0592445864
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry for the delay for reply.<br><br>We want to get the h=
ost CPU console over the BMC console.<br><br>I build OpenBMC firmware using=
 the following steps.<br><br>	1. export TEMPLATECONF=3Dmeta-intel/meta-s260=
0wf/conf/<br>	2. . openbmc-env<br>	3. bitbake obmc-phosphor-image<br><br><b=
>/lib/systemd/system/obmc-console@.service</b> is available with content<br=
><br>[Unit]<br>Description=3DPhosphor Console Muxer listening on device /de=
v/%I<br>BindsTo=3Ddev-%i.device<br>After=3Ddev-%i.device<br><br>[Service]<b=
r>ExecStart=3D/usr/bin/env obmc-console-server --config /etc/obmc-console.c=
onf %i<br>SyslogIdentifier=3Dobmc-console-server<br>Restart=3Dalways<br><br=
>[Install]<br>WantedBy=3Dmulti-user.target<br><br>File<b> /etc/systemd/syst=
em/multi-user.target.wants/obmc-console@ttyVUART0.service</b> found.<br><br=
>root@s2600wf:~# <b>ls -l /dev/ttyS*</b><br>crw-rw---- =C2=A0 =C2=A01 root =
=C2=A0 =C2=A0 dialout =C2=A0 =C2=A0 4, =C2=A064 Aug 30 04:42 /dev/ttyS0<br>=
crw-rw---- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 dialout =C2=A0 =C2=A0 4, =C2=
=A065 Aug 30 04:42 /dev/ttyS1<br>crw-rw---- =C2=A0 =C2=A01 root =C2=A0 =C2=
=A0 dialout =C2=A0 =C2=A0 4, =C2=A066 Aug 30 04:42 /dev/ttyS2<br>crw-rw----=
 =C2=A0 =C2=A01 root =C2=A0 =C2=A0 dialout =C2=A0 =C2=A0 4, =C2=A067 Aug 30=
 04:42 /dev/ttyS3<br>crw------- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 tty =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 4, =C2=A068 Aug 30 04:45 /dev/ttyS4<br>crw-rw---- =
=C2=A0 =C2=A01 root =C2=A0 =C2=A0 dialout =C2=A0 =C2=A0 4, =C2=A069 Aug 30 =
04:42 /dev/ttyS5<br><br><br>Moreover <b>/etc/obmc-console.conf</b> file not=
 found.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Sep 2, 2019 at 1:58 PM Yong Li &lt;<a href=3D"mailto:yong.b.=
li@linux.intel.com">yong.b.li@linux.intel.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div lang=3D"EN-US"><div class=
=3D"gmail-m_146702082709217010WordSection1"><p class=3D"MsoNormal">Could yo=
u share more information:<u></u><u></u></p><p class=3D"MsoNormal">Do you wa=
nt to use the SOL feature? <u></u><u></u></p><p class=3D"MsoNormal">How did=
 you build the OpenBMC?<u></u><u></u></p><p class=3D"MsoNormal">There shoul=
d be a systemd service: <a href=3D"mailto:/lib/systemd/system/obmc-console@=
.service" target=3D"_blank">/lib/systemd/system/obmc-console@.service</a>. =
And check the file /etc/systemd/system/multi-user.target.wants/obmc-console=
@*, is it ttyS2? <u></u><u></u></p><p class=3D"MsoNormal">ls -l /dev/ttyS*,=
 can you find these ttyS items?<u></u><u></u></p><p class=3D"MsoNormal"><u>=
</u>=C2=A0<u></u></p><p class=3D"MsoNormal">Thanks,<u></u><u></u></p><p cla=
ss=3D"MsoNormal">Yong<u></u><u></u></p><p class=3D"MsoNormal"><u></u>=C2=A0=
<u></u></p><p class=3D"MsoNormal"><b>From:</b> openbmc &lt;openbmc-bounces+=
<a href=3D"http://yong.b.li" target=3D"_blank">yong.b.li</a>=3D<a href=3D"m=
ailto:linux.intel.com@lists.ozlabs.org" target=3D"_blank">linux.intel.com@l=
ists.ozlabs.org</a>&gt; <b>On Behalf Of </b>AKASH G J<br><b>Sent:</b> Frida=
y, August 30, 2019 8:27 PM<br><b>To:</b> <a href=3D"mailto:openbmc@lists.oz=
labs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a><br><b>Subject:</b>=
 Cannot connect to console server in s2600wf<u></u><u></u></p><p class=3D"M=
soNormal"><u></u>=C2=A0<u></u></p><div><div><p class=3D"MsoNormal">Hi all,<=
u></u><u></u></p></div><div><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>=
</div><div><p class=3D"MsoNormal">I am using OpenBMC Linux with s2600wf con=
figuration.<u></u><u></u></p></div><div><p class=3D"MsoNormal"><u></u>=C2=
=A0<u></u></p></div><div><p class=3D"MsoNormal">When I tried to execute 0bm=
c-console-client the following error came.<u></u><u></u></p></div><div><p c=
lass=3D"MsoNormal"><u></u>=C2=A0<u></u></p></div><div><p class=3D"MsoNormal=
">root@s2600wf:~# obmc-console-client =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>obmc-console-client: Can&=
#39;t connect to console server: Connection refused<u></u><u></u></p></div>=
<div><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p></div><div><p class=3D"=
MsoNormal">in <i>ps</i> command output also obmc-console-server not found.<=
u></u><u></u></p></div><div><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>=
</div><div><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p></div><div><p cla=
ss=3D"MsoNormal">Thanks,<u></u><u></u></p></div><div><p class=3D"MsoNormal"=
><u></u>=C2=A0<u></u></p></div><div><p class=3D"MsoNormal">Akash<u></u><u><=
/u></p></div></div></div></div></blockquote></div>

--000000000000e30c5c0592445864--
