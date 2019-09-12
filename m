Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B61B080C
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 06:29:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TQlG5mGFzF427
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 14:29:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bLKoPR+e"; 
 dkim-atps=neutral
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TQkg4l9NzF41X
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 14:28:43 +1000 (AEST)
Received: by mail-ot1-x32d.google.com with SMTP id n7so24794853otk.6
 for <openbmc@lists.ozlabs.org>; Wed, 11 Sep 2019 21:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pqdMSh8vmDk9NcVox/ik3mESuiG8aanc6iF1l52KMc4=;
 b=bLKoPR+esNCy7Rl5iyyQ0NXquZU8b2z5l/lAKiqEcWThaxidryGwHhjeruTXJxORYW
 pME3Hx5zBS0PW0Wjyo+LWbzNQmi3T06viH8Y8RgjzzEw1g5T/Sbjl9Hq3pcc8ZYNIH0W
 bYq/2iY6pzHRxfiH1OalgDIle0a/CoZDz93LTK7G8yio0P52d8tYzAmRIWEuma5ptzkx
 /qrxj1aL0eFL8RzdivTUBXNRE7L9re7Umlg3VgzSDkyQZtVvpwveENQkxOPhR8P96KfI
 Gy2K6RySefq6826TAdbGBhhm7VqOOJeXWGpBx6+A0Qop5TYaOuJ+B8OhOVHS148Jd7X2
 nxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pqdMSh8vmDk9NcVox/ik3mESuiG8aanc6iF1l52KMc4=;
 b=D8C4dk89eQ9CFptHbYBfecmEPoSF6qhRz31AokWRJayQM6jyMRcxwB2XrXIltZoOGV
 lGVC2to+KI6EaSPR/4MopGoRzmHgXKG0kN8uPdnz1Js7CCsj1Z9aiJsF2dwEBmVT8yfB
 Hgdd5aGUIFfQdm7bfwDinlWb7mRGYwP16AOvScoomvgAr5rCwan8NEMgRE08AplcNlTR
 m3l6B4DUchDKSnvp7A45tQkHS+LzldF0Yv3mlgv26Bv0KbpIvfPAR4bmQGiyDCJYL0fj
 3be8RcJqjl+5HaWUEhYCtrq/GbEWiCQqL1jO8O7lW2KqIITyYzRTOAEWIEg7gzwilfjM
 TWww==
X-Gm-Message-State: APjAAAWG/XCG2KmPIrTVCl26wpTA7RKEykbDQBP3SnCzzxoLqmg9mX7X
 stQVQD3fvXlsmxd/9rJPtUw4nd4SbIU2eKXvjto=
X-Google-Smtp-Source: APXvYqy644Qq3WFsT27OQHkRgq90/a/hdTP6BRFxH8yl+U3m8Qh2IG9203eACzUyT17nOyLuXbjMGT9RV31/91ygaN8=
X-Received: by 2002:a9d:6209:: with SMTP id g9mr35646980otj.308.1568262519331; 
 Wed, 11 Sep 2019 21:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAE33tLEzV8+n+cFVtnr0vYynsqn42+5APTtojHqWGb8A5GyG2g@mail.gmail.com>
 <000001d56168$6da06960$48e13c20$@linux.intel.com>
 <CAE33tLGNc3waqv7nqHVnNmXkkfk7WFYGCN986B3=0F=TUj=wMw@mail.gmail.com>
 <CAE33tLHLxjOzwVpKoivafoRo3KntZg2qP2AVkcDDkyzfP4=gBA@mail.gmail.com>
In-Reply-To: <CAE33tLHLxjOzwVpKoivafoRo3KntZg2qP2AVkcDDkyzfP4=gBA@mail.gmail.com>
From: AKASH G J <akashgj91@gmail.com>
Date: Thu, 12 Sep 2019 09:56:45 +0530
Message-ID: <CAE33tLGmQDUbWN56k4CK+hY-T35PDqwrftwQ9Yeypq0eqzHrrw@mail.gmail.com>
Subject: Re: Cannot connect to console server in s2600wf
To: Yong Li <yong.b.li@linux.intel.com>
Content-Type: multipart/alternative; boundary="0000000000006120340592539233"
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

--0000000000006120340592539233
Content-Type: text/plain; charset="UTF-8"

Phosphor IPMI KCS DBus Bridge is working now. Just I enabled kcs_chan-3 in
device tree.

On Wed, Sep 11, 2019 at 5:40 PM AKASH G J <akashgj91@gmail.com> wrote:

> This problem is solved by enabling vuart device in device tree. Now
> obmc-console-server starts running.
>
> But *Phosphor IPMI KCS DBus Bridge service* is not running.
>
> *kcsbridged* binary is there in /usr/bin.
>
> On Wed, Sep 11, 2019 at 3:46 PM AKASH G J <akashgj91@gmail.com> wrote:
>
>> Sorry for the delay for reply.
>>
>> We want to get the host CPU console over the BMC console.
>>
>> I build OpenBMC firmware using the following steps.
>>
>> 1. export TEMPLATECONF=meta-intel/meta-s2600wf/conf/
>> 2. . openbmc-env
>> 3. bitbake obmc-phosphor-image
>>
>> */lib/systemd/system/obmc-console@.service* is available with content
>>
>> [Unit]
>> Description=Phosphor Console Muxer listening on device /dev/%I
>> BindsTo=dev-%i.device
>> After=dev-%i.device
>>
>> [Service]
>> ExecStart=/usr/bin/env obmc-console-server --config
>> /etc/obmc-console.conf %i
>> SyslogIdentifier=obmc-console-server
>> Restart=always
>>
>> [Install]
>> WantedBy=multi-user.target
>>
>> File*
>> /etc/systemd/system/multi-user.target.wants/obmc-console@ttyVUART0.service*
>> found.
>>
>> root@s2600wf:~# *ls -l /dev/ttyS**
>> crw-rw----    1 root     dialout     4,  64 Aug 30 04:42 /dev/ttyS0
>> crw-rw----    1 root     dialout     4,  65 Aug 30 04:42 /dev/ttyS1
>> crw-rw----    1 root     dialout     4,  66 Aug 30 04:42 /dev/ttyS2
>> crw-rw----    1 root     dialout     4,  67 Aug 30 04:42 /dev/ttyS3
>> crw-------    1 root     tty         4,  68 Aug 30 04:45 /dev/ttyS4
>> crw-rw----    1 root     dialout     4,  69 Aug 30 04:42 /dev/ttyS5
>>
>>
>> Moreover */etc/obmc-console.conf* file not found.
>>
>> On Mon, Sep 2, 2019 at 1:58 PM Yong Li <yong.b.li@linux.intel.com> wrote:
>>
>>> Could you share more information:
>>>
>>> Do you want to use the SOL feature?
>>>
>>> How did you build the OpenBMC?
>>>
>>> There should be a systemd service:
>>> /lib/systemd/system/obmc-console@.service. And check the file
>>> /etc/systemd/system/multi-user.target.wants/obmc-console@*, is it
>>> ttyS2?
>>>
>>> ls -l /dev/ttyS*, can you find these ttyS items?
>>>
>>>
>>>
>>> Thanks,
>>>
>>> Yong
>>>
>>>
>>>
>>> *From:* openbmc <openbmc-bounces+yong.b.li=
>>> linux.intel.com@lists.ozlabs.org> *On Behalf Of *AKASH G J
>>> *Sent:* Friday, August 30, 2019 8:27 PM
>>> *To:* openbmc@lists.ozlabs.org
>>> *Subject:* Cannot connect to console server in s2600wf
>>>
>>>
>>>
>>> Hi all,
>>>
>>>
>>>
>>> I am using OpenBMC Linux with s2600wf configuration.
>>>
>>>
>>>
>>> When I tried to execute 0bmc-console-client the following error came.
>>>
>>>
>>>
>>> root@s2600wf:~# obmc-console-client
>>>
>>> obmc-console-client: Can't connect to console server: Connection refused
>>>
>>>
>>>
>>> in *ps* command output also obmc-console-server not found.
>>>
>>>
>>>
>>>
>>>
>>> Thanks,
>>>
>>>
>>>
>>> Akash
>>>
>>

--0000000000006120340592539233
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Phosphor IPMI KCS DBus Bridge is working now. Just I enabl=
ed kcs_chan-3 in device tree.<b><br></b></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 11, 2019 at 5:40 PM AKA=
SH G J &lt;<a href=3D"mailto:akashgj91@gmail.com">akashgj91@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr"><div>This problem is solved by enabling vuart device in device t=
ree. Now obmc-console-server starts running.</div><div><br></div><div>But <=
b>Phosphor IPMI KCS DBus Bridge service</b> is not running.</div><div><br><=
/div><div><b>kcsbridged</b> binary is there in /usr/bin.<br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, S=
ep 11, 2019 at 3:46 PM AKASH G J &lt;<a href=3D"mailto:akashgj91@gmail.com"=
 target=3D"_blank">akashgj91@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Sorry for the delay =
for reply.<br><br>We want to get the host CPU console over the BMC console.=
<br><br>I build OpenBMC firmware using the following steps.<br><br>	1. expo=
rt TEMPLATECONF=3Dmeta-intel/meta-s2600wf/conf/<br>	2. . openbmc-env<br>	3.=
 bitbake obmc-phosphor-image<br><br><b>/lib/systemd/system/obmc-console@.se=
rvice</b> is available with content<br><br>[Unit]<br>Description=3DPhosphor=
 Console Muxer listening on device /dev/%I<br>BindsTo=3Ddev-%i.device<br>Af=
ter=3Ddev-%i.device<br><br>[Service]<br>ExecStart=3D/usr/bin/env obmc-conso=
le-server --config /etc/obmc-console.conf %i<br>SyslogIdentifier=3Dobmc-con=
sole-server<br>Restart=3Dalways<br><br>[Install]<br>WantedBy=3Dmulti-user.t=
arget<br><br>File<b> /etc/systemd/system/multi-user.target.wants/obmc-conso=
le@ttyVUART0.service</b> found.<br><br>root@s2600wf:~# <b>ls -l /dev/ttyS*<=
/b><br>crw-rw---- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 dialout =C2=A0 =C2=A0 4=
, =C2=A064 Aug 30 04:42 /dev/ttyS0<br>crw-rw---- =C2=A0 =C2=A01 root =C2=A0=
 =C2=A0 dialout =C2=A0 =C2=A0 4, =C2=A065 Aug 30 04:42 /dev/ttyS1<br>crw-rw=
---- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 dialout =C2=A0 =C2=A0 4, =C2=A066 Au=
g 30 04:42 /dev/ttyS2<br>crw-rw---- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 dialo=
ut =C2=A0 =C2=A0 4, =C2=A067 Aug 30 04:42 /dev/ttyS3<br>crw------- =C2=A0 =
=C2=A01 root =C2=A0 =C2=A0 tty =C2=A0 =C2=A0 =C2=A0 =C2=A0 4, =C2=A068 Aug =
30 04:45 /dev/ttyS4<br>crw-rw---- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 dialout=
 =C2=A0 =C2=A0 4, =C2=A069 Aug 30 04:42 /dev/ttyS5<br><br><br>Moreover <b>/=
etc/obmc-console.conf</b> file not found.</div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 2, 2019 at 1:58 PM Yon=
g Li &lt;<a href=3D"mailto:yong.b.li@linux.intel.com" target=3D"_blank">yon=
g.b.li@linux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div lang=3D"EN-US"><div class=3D"gmail-m_-1078848493=
095238769gmail-m_-4316240639763160658gmail-m_146702082709217010WordSection1=
"><p class=3D"MsoNormal">Could you share more information:<u></u><u></u></p=
><p class=3D"MsoNormal">Do you want to use the SOL feature? <u></u><u></u><=
/p><p class=3D"MsoNormal">How did you build the OpenBMC?<u></u><u></u></p><=
p class=3D"MsoNormal">There should be a systemd service: <a href=3D"mailto:=
/lib/systemd/system/obmc-console@.service" target=3D"_blank">/lib/systemd/s=
ystem/obmc-console@.service</a>. And check the file /etc/systemd/system/mul=
ti-user.target.wants/obmc-console@*, is it ttyS2? <u></u><u></u></p><p clas=
s=3D"MsoNormal">ls -l /dev/ttyS*, can you find these ttyS items?<u></u><u><=
/u></p><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p><p class=3D"MsoNormal=
">Thanks,<u></u><u></u></p><p class=3D"MsoNormal">Yong<u></u><u></u></p><p =
class=3D"MsoNormal"><u></u>=C2=A0<u></u></p><p class=3D"MsoNormal"><b>From:=
</b> openbmc &lt;openbmc-bounces+<a href=3D"http://yong.b.li" target=3D"_bl=
ank">yong.b.li</a>=3D<a href=3D"mailto:linux.intel.com@lists.ozlabs.org" ta=
rget=3D"_blank">linux.intel.com@lists.ozlabs.org</a>&gt; <b>On Behalf Of </=
b>AKASH G J<br><b>Sent:</b> Friday, August 30, 2019 8:27 PM<br><b>To:</b> <=
a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.=
ozlabs.org</a><br><b>Subject:</b> Cannot connect to console server in s2600=
wf<u></u><u></u></p><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p><div><di=
v><p class=3D"MsoNormal">Hi all,<u></u><u></u></p></div><div><p class=3D"Ms=
oNormal"><u></u>=C2=A0<u></u></p></div><div><p class=3D"MsoNormal">I am usi=
ng OpenBMC Linux with s2600wf configuration.<u></u><u></u></p></div><div><p=
 class=3D"MsoNormal"><u></u>=C2=A0<u></u></p></div><div><p class=3D"MsoNorm=
al">When I tried to execute 0bmc-console-client the following error came.<u=
></u><u></u></p></div><div><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p><=
/div><div><p class=3D"MsoNormal">root@s2600wf:~# obmc-console-client =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <=
br>obmc-console-client: Can&#39;t connect to console server: Connection ref=
used<u></u><u></u></p></div><div><p class=3D"MsoNormal"><u></u>=C2=A0<u></u=
></p></div><div><p class=3D"MsoNormal">in <i>ps</i> command output also obm=
c-console-server not found.<u></u><u></u></p></div><div><p class=3D"MsoNorm=
al"><u></u>=C2=A0<u></u></p></div><div><p class=3D"MsoNormal"><u></u>=C2=A0=
<u></u></p></div><div><p class=3D"MsoNormal">Thanks,<u></u><u></u></p></div=
><div><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p></div><div><p class=3D=
"MsoNormal">Akash<u></u><u></u></p></div></div></div></div></blockquote></d=
iv>
</blockquote></div>
</blockquote></div>

--0000000000006120340592539233--
