Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5C5AFC49
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2019 14:12:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T14k4kd6zF37P
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2019 22:12:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FnXBkeAM"; 
 dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T1412DrzzDrKq
 for <openbmc@lists.ozlabs.org>; Wed, 11 Sep 2019 22:12:16 +1000 (AEST)
Received: by mail-ot1-x32b.google.com with SMTP id g16so7117601otp.8
 for <openbmc@lists.ozlabs.org>; Wed, 11 Sep 2019 05:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H4VOtFikhmLq9IrTiYys1yx9V0Qwy3SahTCemXHZqCM=;
 b=FnXBkeAMjFp1ih+sTEZl/tHrT8kcV8lzQyN50D9ElA7oVQRWbVIk0+OVANxF05AiCk
 6Mp4iJlX/nz/8tnf/RagpBHeupUwvFyg2p8LUKjkqzbUIJV146qnCRbc91UvRO5+zA+0
 R79I/HbCFbapOSQ6OLwmygtIvQhVtiQjSoFa5QWwoatAkuRDm5dNbJgWHIYskuXMLgVy
 RpGPOumYayKrj5ltQYX1iC432mB0Q2S54Y5LJdeL6RaZmeV1xrZsDGhcC923+QuftBYN
 qgFITSkMGeZLCxXSlEAm5e5mkbkhSorYjwAzR2WjjO1XlEYrFKT1Pnji4ENk7QXHlNsM
 gdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H4VOtFikhmLq9IrTiYys1yx9V0Qwy3SahTCemXHZqCM=;
 b=eShOFXtQdFMR/UzvLQeN+jX2j4prbSBK86zQG3edYA1q3FC879yiV1975mex6wG/8D
 SUqSXTfoopuATolqJCzGIv93QWNdPT2mgozcIgCC8CcmQYlnLzk5en3h194gzuhd3roX
 5MMEMCw3/XWmk47k01x5ddaNUBjw3sQwCDDigdZB7Z+ZX4ihpoCriLfDTEkOi3DAv5JQ
 kunbtizi1NpVLhWyAAAVF56ItQIpcVYEgRtSy/H+pyvF0cX95Lf3cDTUV4g/sPDEzLpP
 KDaDtsE3bcw23sHsvfAydLEISlc+eNr69tvFaF/vZ52Uiy9Gwz+/NeY76iX1kjFP224v
 nW2w==
X-Gm-Message-State: APjAAAXkE84F8QlbM+amSJfxzxS69vy+KagDMBsGPv+9OD8NpU4tyXVz
 Ih1hIKlxg5Y80RJmI14aFxsa+ii5rid9NOJJCUI=
X-Google-Smtp-Source: APXvYqzKvkdx089Gf0au5g30/LI0dkblWig2TttD4g3Fo6vsCfNpS2s9C/Wg7+03J3xK/aHF1j7vu6tPgEM96cK0bYc=
X-Received: by 2002:a05:6830:c1:: with SMTP id
 x1mr10231042oto.272.1568203933557; 
 Wed, 11 Sep 2019 05:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAE33tLEzV8+n+cFVtnr0vYynsqn42+5APTtojHqWGb8A5GyG2g@mail.gmail.com>
 <000001d56168$6da06960$48e13c20$@linux.intel.com>
 <CAE33tLGNc3waqv7nqHVnNmXkkfk7WFYGCN986B3=0F=TUj=wMw@mail.gmail.com>
In-Reply-To: <CAE33tLGNc3waqv7nqHVnNmXkkfk7WFYGCN986B3=0F=TUj=wMw@mail.gmail.com>
From: AKASH G J <akashgj91@gmail.com>
Date: Wed, 11 Sep 2019 17:40:20 +0530
Message-ID: <CAE33tLHLxjOzwVpKoivafoRo3KntZg2qP2AVkcDDkyzfP4=gBA@mail.gmail.com>
Subject: Re: Cannot connect to console server in s2600wf
To: Yong Li <yong.b.li@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000652c45059245ee2a"
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

--000000000000652c45059245ee2a
Content-Type: text/plain; charset="UTF-8"

This problem is solved by enabling vuart device in device tree. Now
obmc-console-server starts running.

But *Phosphor IPMI KCS DBus Bridge service* is not running.

*kcsbridged* binary is there in /usr/bin.

On Wed, Sep 11, 2019 at 3:46 PM AKASH G J <akashgj91@gmail.com> wrote:

> Sorry for the delay for reply.
>
> We want to get the host CPU console over the BMC console.
>
> I build OpenBMC firmware using the following steps.
>
> 1. export TEMPLATECONF=meta-intel/meta-s2600wf/conf/
> 2. . openbmc-env
> 3. bitbake obmc-phosphor-image
>
> */lib/systemd/system/obmc-console@.service* is available with content
>
> [Unit]
> Description=Phosphor Console Muxer listening on device /dev/%I
> BindsTo=dev-%i.device
> After=dev-%i.device
>
> [Service]
> ExecStart=/usr/bin/env obmc-console-server --config /etc/obmc-console.conf
> %i
> SyslogIdentifier=obmc-console-server
> Restart=always
>
> [Install]
> WantedBy=multi-user.target
>
> File*
> /etc/systemd/system/multi-user.target.wants/obmc-console@ttyVUART0.service*
> found.
>
> root@s2600wf:~# *ls -l /dev/ttyS**
> crw-rw----    1 root     dialout     4,  64 Aug 30 04:42 /dev/ttyS0
> crw-rw----    1 root     dialout     4,  65 Aug 30 04:42 /dev/ttyS1
> crw-rw----    1 root     dialout     4,  66 Aug 30 04:42 /dev/ttyS2
> crw-rw----    1 root     dialout     4,  67 Aug 30 04:42 /dev/ttyS3
> crw-------    1 root     tty         4,  68 Aug 30 04:45 /dev/ttyS4
> crw-rw----    1 root     dialout     4,  69 Aug 30 04:42 /dev/ttyS5
>
>
> Moreover */etc/obmc-console.conf* file not found.
>
> On Mon, Sep 2, 2019 at 1:58 PM Yong Li <yong.b.li@linux.intel.com> wrote:
>
>> Could you share more information:
>>
>> Do you want to use the SOL feature?
>>
>> How did you build the OpenBMC?
>>
>> There should be a systemd service:
>> /lib/systemd/system/obmc-console@.service. And check the file
>> /etc/systemd/system/multi-user.target.wants/obmc-console@*, is it ttyS2?
>>
>> ls -l /dev/ttyS*, can you find these ttyS items?
>>
>>
>>
>> Thanks,
>>
>> Yong
>>
>>
>>
>> *From:* openbmc <openbmc-bounces+yong.b.li=
>> linux.intel.com@lists.ozlabs.org> *On Behalf Of *AKASH G J
>> *Sent:* Friday, August 30, 2019 8:27 PM
>> *To:* openbmc@lists.ozlabs.org
>> *Subject:* Cannot connect to console server in s2600wf
>>
>>
>>
>> Hi all,
>>
>>
>>
>> I am using OpenBMC Linux with s2600wf configuration.
>>
>>
>>
>> When I tried to execute 0bmc-console-client the following error came.
>>
>>
>>
>> root@s2600wf:~# obmc-console-client
>>
>> obmc-console-client: Can't connect to console server: Connection refused
>>
>>
>>
>> in *ps* command output also obmc-console-server not found.
>>
>>
>>
>>
>>
>> Thanks,
>>
>>
>>
>> Akash
>>
>

--000000000000652c45059245ee2a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This problem is solved by enabling vuart device in de=
vice tree. Now obmc-console-server starts running.</div><div><br></div><div=
>But <b>Phosphor IPMI KCS DBus Bridge service</b> is not running.</div><div=
><br></div><div><b>kcsbridged</b> binary is there in /usr/bin.<br></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Wed, Sep 11, 2019 at 3:46 PM AKASH G J &lt;<a href=3D"mailto:akashgj91@gmai=
l.com">akashgj91@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr">Sorry for the delay for reply.<b=
r><br>We want to get the host CPU console over the BMC console.<br><br>I bu=
ild OpenBMC firmware using the following steps.<br><br>	1. export TEMPLATEC=
ONF=3Dmeta-intel/meta-s2600wf/conf/<br>	2. . openbmc-env<br>	3. bitbake obm=
c-phosphor-image<br><br><b>/lib/systemd/system/obmc-console@.service</b> is=
 available with content<br><br>[Unit]<br>Description=3DPhosphor Console Mux=
er listening on device /dev/%I<br>BindsTo=3Ddev-%i.device<br>After=3Ddev-%i=
.device<br><br>[Service]<br>ExecStart=3D/usr/bin/env obmc-console-server --=
config /etc/obmc-console.conf %i<br>SyslogIdentifier=3Dobmc-console-server<=
br>Restart=3Dalways<br><br>[Install]<br>WantedBy=3Dmulti-user.target<br><br=
>File<b> /etc/systemd/system/multi-user.target.wants/obmc-console@ttyVUART0=
.service</b> found.<br><br>root@s2600wf:~# <b>ls -l /dev/ttyS*</b><br>crw-r=
w---- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 dialout =C2=A0 =C2=A0 4, =C2=A064 A=
ug 30 04:42 /dev/ttyS0<br>crw-rw---- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 dial=
out =C2=A0 =C2=A0 4, =C2=A065 Aug 30 04:42 /dev/ttyS1<br>crw-rw---- =C2=A0 =
=C2=A01 root =C2=A0 =C2=A0 dialout =C2=A0 =C2=A0 4, =C2=A066 Aug 30 04:42 /=
dev/ttyS2<br>crw-rw---- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 dialout =C2=A0 =
=C2=A0 4, =C2=A067 Aug 30 04:42 /dev/ttyS3<br>crw------- =C2=A0 =C2=A01 roo=
t =C2=A0 =C2=A0 tty =C2=A0 =C2=A0 =C2=A0 =C2=A0 4, =C2=A068 Aug 30 04:45 /d=
ev/ttyS4<br>crw-rw---- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 dialout =C2=A0 =C2=
=A0 4, =C2=A069 Aug 30 04:42 /dev/ttyS5<br><br><br>Moreover <b>/etc/obmc-co=
nsole.conf</b> file not found.</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Sep 2, 2019 at 1:58 PM Yong Li &lt;<a=
 href=3D"mailto:yong.b.li@linux.intel.com" target=3D"_blank">yong.b.li@linu=
x.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div lang=3D"EN-US"><div class=3D"gmail-m_-4316240639763160658gm=
ail-m_146702082709217010WordSection1"><p class=3D"MsoNormal">Could you shar=
e more information:<u></u><u></u></p><p class=3D"MsoNormal">Do you want to =
use the SOL feature? <u></u><u></u></p><p class=3D"MsoNormal">How did you b=
uild the OpenBMC?<u></u><u></u></p><p class=3D"MsoNormal">There should be a=
 systemd service: <a href=3D"mailto:/lib/systemd/system/obmc-console@.servi=
ce" target=3D"_blank">/lib/systemd/system/obmc-console@.service</a>. And ch=
eck the file /etc/systemd/system/multi-user.target.wants/obmc-console@*, is=
 it ttyS2? <u></u><u></u></p><p class=3D"MsoNormal">ls -l /dev/ttyS*, can y=
ou find these ttyS items?<u></u><u></u></p><p class=3D"MsoNormal"><u></u>=
=C2=A0<u></u></p><p class=3D"MsoNormal">Thanks,<u></u><u></u></p><p class=
=3D"MsoNormal">Yong<u></u><u></u></p><p class=3D"MsoNormal"><u></u>=C2=A0<u=
></u></p><p class=3D"MsoNormal"><b>From:</b> openbmc &lt;openbmc-bounces+<a=
 href=3D"http://yong.b.li" target=3D"_blank">yong.b.li</a>=3D<a href=3D"mai=
lto:linux.intel.com@lists.ozlabs.org" target=3D"_blank">linux.intel.com@lis=
ts.ozlabs.org</a>&gt; <b>On Behalf Of </b>AKASH G J<br><b>Sent:</b> Friday,=
 August 30, 2019 8:27 PM<br><b>To:</b> <a href=3D"mailto:openbmc@lists.ozla=
bs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a><br><b>Subject:</b> C=
annot connect to console server in s2600wf<u></u><u></u></p><p class=3D"Mso=
Normal"><u></u>=C2=A0<u></u></p><div><div><p class=3D"MsoNormal">Hi all,<u>=
</u><u></u></p></div><div><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p></=
div><div><p class=3D"MsoNormal">I am using OpenBMC Linux with s2600wf confi=
guration.<u></u><u></u></p></div><div><p class=3D"MsoNormal"><u></u>=C2=A0<=
u></u></p></div><div><p class=3D"MsoNormal">When I tried to execute 0bmc-co=
nsole-client the following error came.<u></u><u></u></p></div><div><p class=
=3D"MsoNormal"><u></u>=C2=A0<u></u></p></div><div><p class=3D"MsoNormal">ro=
ot@s2600wf:~# obmc-console-client =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>obmc-console-client: Can&#39;t c=
onnect to console server: Connection refused<u></u><u></u></p></div><div><p=
 class=3D"MsoNormal"><u></u>=C2=A0<u></u></p></div><div><p class=3D"MsoNorm=
al">in <i>ps</i> command output also obmc-console-server not found.<u></u><=
u></u></p></div><div><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p></div><=
div><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p></div><div><p class=3D"M=
soNormal">Thanks,<u></u><u></u></p></div><div><p class=3D"MsoNormal"><u></u=
>=C2=A0<u></u></p></div><div><p class=3D"MsoNormal">Akash<u></u><u></u></p>=
</div></div></div></div></blockquote></div>
</blockquote></div>

--000000000000652c45059245ee2a--
