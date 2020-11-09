Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 726432AC8B3
	for <lists+openbmc@lfdr.de>; Mon,  9 Nov 2020 23:37:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CVQpp4WjQzDqhT
	for <lists+openbmc@lfdr.de>; Tue, 10 Nov 2020 09:37:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f35;
 helo=mail-qv1-xf35.google.com; envelope-from=tbnguyen1985@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Vm+2lUZU; dkim-atps=neutral
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVQnj6H63zDqTK
 for <openbmc@lists.ozlabs.org>; Tue, 10 Nov 2020 09:36:09 +1100 (AEDT)
Received: by mail-qv1-xf35.google.com with SMTP id ed14so4938917qvb.4
 for <openbmc@lists.ozlabs.org>; Mon, 09 Nov 2020 14:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OsuRlb2Smq88bUrrwZGlyZ4Vhy61DyW+ebG76ZS/vCQ=;
 b=Vm+2lUZUi6flHPCK/vjr8U4odBs4qfxkH7ZIdCXjt3KsgzoQMt7Kdbr3Z3hCXZMd4V
 M8V41YeYw36xwHWD39Yk9ifclIPRObpGjFiPmGVkLPuuVUaMNmj7KRIxUM9J31wpv+xc
 nupOu/L7ZtwN8Tv3vY9yvPY9HnD2ub6hDpQ0ueUfiwyr3/jC8zstW4GHSGlRR5utJLIc
 OtIzOLDxN+PXZP248a5gCanKk5s8BJZRoqry5R5APWb2v+S7vfhBaTSchM+Kan3Pejtn
 Rea6aJF27KA5ehGaG3FXVgINagGgX4QPOBw1soRH4nQiXa/K/PcArJVSpCq103ZCMgtc
 HZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OsuRlb2Smq88bUrrwZGlyZ4Vhy61DyW+ebG76ZS/vCQ=;
 b=jvIFdKb0JhgGWOioo+PyZrLWan0A9AMtapkySsdckL2dWkB0hHD4kg9oy8woS0PTee
 vT41nESEFV+/sBYi6lmH3UA9qw3cZO9h1/r44ttV0TZCMOwxFmMhYIKKH1pHEgv78w/5
 G8hM0YpeYMyGWW2u1fqKAetWpyZirBna9R08OhPhrPyTMDOTgHbVtsbVImT5ne6HOiIz
 NUBiZnaRHGXjJSG6Yk0HRQ2aZ/oaBOxK1yE9cvF204rIy/OUMAS8LV/GawrN0jH+HJ7G
 /EllJgL5qplVFIm2EHrn9rz3chnMY0Y2n86JYaIpcHfZaxJkXXlf7h+xOfKRRxnr46qw
 5eiw==
X-Gm-Message-State: AOAM530nDLNVN1bFYxDEHtvutBeevpVD0SmUN4ycEX64V2r/i/NHpk8P
 z0IXye3HDUol0SnZzDBoTpH8qinTipH+6AlAO5M=
X-Google-Smtp-Source: ABdhPJyFoEpPi6/CDjf9yQAR4lrEDDCxNAAhK7RqEGcyVEQrkseYLQVA+M/HlOkog4Q3V7GcKwLqUtX565ARElLU76I=
X-Received: by 2002:ad4:4e84:: with SMTP id dy4mr16899623qvb.47.1604961364992; 
 Mon, 09 Nov 2020 14:36:04 -0800 (PST)
MIME-Version: 1.0
References: <CALioo35rFrsCcK+j8GW8DCAHqw_y_r8e9cMg-SmNLQ5ydMajNg@mail.gmail.com>
 <CALioo35DvdU8KsTJbB9RQiLQ+Md6gTW3TYeNy8qitVZLQzHK=A@mail.gmail.com>
 <OF8D57E4C0.929A4052-ON0025861B.00159DF0-0025861B.00165862@notes.na.collabserv.com>
In-Reply-To: <OF8D57E4C0.929A4052-ON0025861B.00159DF0-0025861B.00165862@notes.na.collabserv.com>
From: Thu Ba Nguyen <tbnguyen1985@gmail.com>
Date: Tue, 10 Nov 2020 05:35:51 +0700
Message-ID: <CALioo37f6Katzcag-hgA=u_spHOdeQw5WbvSapAs=qMyiwOxYg@mail.gmail.com>
Subject: Re: phosphor-logging: entry() failed parse message.
To: Ramesh I I1 <rameshi1@in.ibm.com>
Content-Type: multipart/alternative; boundary="00000000000009e6af05b3b43051"
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

--00000000000009e6af05b3b43051
Content-Type: text/plain; charset="UTF-8"

Thanks Ramesh,

But your commands are applied for some messages.
And don't answer my questions.
"Do I need to add any option when building?" to make phosphor-logging print
message in entry().

Regards.
Thu Nguyen.




On Mon, Nov 9, 2020 at 11:04 AM Ramesh I I1 <rameshi1@in.ibm.com> wrote:

> Hi Thu Nguyen,
>
> Below link may help you to get more detailed log which you are referring.
> https://github.com/openbmc/openbmc/wiki/Debugging-OpenBMC#journalctl
>
> For example:
> journalctl -o json-pretty MESSAGE="watchdog: Timed out"
>
> Regards,
> Ramesh
>
> ----- Original message -----
> From: Thu Ba Nguyen <tbnguyen1985@gmail.com>
> Sent by: "openbmc" <openbmc-bounces+rameshi1=in.ibm.com@lists.ozlabs.org>
> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Cc:
> Subject: [EXTERNAL] Re: phosphor-logging: entry() failed parse message.
> Date: Sat, Nov 7, 2020 6:11 PM
>
> The output in BMC console will be:
> phosphor-watchdog[534]: watchdog: Timed out
>
> Regards.
> Thu Nguyen
>
> On Sat, Nov 7, 2020 at 7:38 PM Thu Ba Nguyen <tbnguyen1985@gmail.com>
> wrote:
>
> Hi,
>
> In openBmc, We are using phosphor-logging.
> When I log:
> log<level::INFO>(
> "watchdog: Timed out",
> entry("ACTION=%s", convertForMessage(action).c_str()),
> entry("TIMER_USE=%s", convertForMessage(expiredTimerUse()).c_str()),
> entry("TARGET=%s", target->second.c_str()));
> The message in entry() is losted.
> Do I need to add any option when building?
>
> Thanks.
> Thu Nguyen.
>
>
>
>

--00000000000009e6af05b3b43051
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Thanks Ramesh,<div><br></div><div>But you=
r commands are applied for some messages.</div><div>And don&#39;t answer my=
 questions.</div><div>&quot;Do I need to add any option when building?&quot=
; to make phosphor-logging print message in entry().</div><div><br></div><d=
iv>Regards.</div><div>Thu Nguyen.</div><div><br></div><div><div><br></div><=
div><br></div></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Mon, Nov 9, 2020 at 11:04 AM Ramesh I I1 &lt;<=
a href=3D"mailto:rameshi1@in.ibm.com">rameshi1@in.ibm.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr" style=3D"font-family:Arial,Helveti=
ca,sans-serif;font-size:10pt"><div dir=3D"ltr">Hi=C2=A0Thu Nguyen,</div>
<div dir=3D"ltr">=C2=A0</div>
<div dir=3D"ltr">Below link=C2=A0may help you=C2=A0to get more detailed log=
 which you are referring.</div>
<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/openbmc/wiki/Debuggi=
ng-OpenBMC#journalctl" target=3D"_blank">https://github.com/openbmc/openbmc=
/wiki/Debugging-OpenBMC#journalctl</a></div>
<div dir=3D"ltr">=C2=A0</div>
<div dir=3D"ltr">For example:</div>
<div dir=3D"ltr">journalctl -o json-pretty MESSAGE=3D&quot;watchdog: Timed =
out&quot;</div>
<div dir=3D"ltr">=C2=A0</div>
<div dir=3D"ltr">Regards,</div>
<div dir=3D"ltr">Ramesh</div>
<blockquote dir=3D"ltr" style=3D"border-left-width:2px;border-left-style:so=
lid;border-left-color:rgb(170,170,170);margin-left:5px;padding-left:5px;dir=
ection:ltr;margin-right:0px">----- Original message -----<br>From: Thu Ba N=
guyen &lt;<a href=3D"mailto:tbnguyen1985@gmail.com" target=3D"_blank">tbngu=
yen1985@gmail.com</a>&gt;<br>Sent by: &quot;openbmc&quot; &lt;openbmc-bounc=
es+rameshi1=3D<a href=3D"mailto:in.ibm.com@lists.ozlabs.org" target=3D"_bla=
nk">in.ibm.com@lists.ozlabs.org</a>&gt;<br>To: OpenBMC Maillist &lt;<a href=
=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs=
.org</a>&gt;<br>Cc:<br>Subject: [EXTERNAL] Re: phosphor-logging: entry() fa=
iled parse message.<br>Date: Sat, Nov 7, 2020 6:11 PM<br>=C2=A0<br>     =20

=20

<div dir=3D"ltr"><div dir=3D"ltr">The output in BMC console will be:
<div>phosphor-watchdog[534]: watchdog: Timed out</div>
<div>=C2=A0</div>
<div>Regards.</div>
<div>Thu Nguyen</div></div></div>=C2=A0

<div><div dir=3D"ltr">On Sat, Nov 7, 2020 at 7:38 PM Thu Ba Nguyen &lt;<a h=
ref=3D"mailto:tbnguyen1985@gmail.com" target=3D"_blank">tbnguyen1985@gmail.=
com</a>&gt; wrote:</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-=
left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr"><div dir=3D"ltr">Hi,
<div>=C2=A0</div>
<div>In openBmc, We are using phosphor-logging.</div>
<div>When I log:</div>
<div><div style=3D"color:rgb(212,212,212);background-color:rgb(30,30,30);fo=
nt-family:Menlo,Monaco,&quot;Courier New&quot;,monospace;font-size:18px;lin=
e-height:27px;white-space:pre-wrap"><div><span style=3D"color:rgb(220,220,1=
70)">log</span>&lt;<span style=3D"color:rgb(78,201,176)">level</span>::<spa=
n style=3D"color:rgb(78,201,176)">INFO</span>&gt;(</div>
<div><span style=3D"color:rgb(206,145,120)">&quot;watchdog: Timed out&quot;=
</span>,</div>
<div><span style=3D"color:rgb(220,220,170)">entry</span>(<span style=3D"col=
or:rgb(206,145,120)">&quot;ACTION=3D%s&quot;</span>, <span style=3D"color:r=
gb(220,220,170)">convertForMessage</span>(<span style=3D"color:rgb(156,220,=
254)">action</span>).<span style=3D"color:rgb(220,220,170)">c_str</span>())=
,</div>
<div><span style=3D"color:rgb(220,220,170)">entry</span>(<span style=3D"col=
or:rgb(206,145,120)">&quot;TIMER_USE=3D%s&quot;</span>, <span style=3D"colo=
r:rgb(220,220,170)">convertForMessage</span>(<span style=3D"color:rgb(220,2=
20,170)">expiredTimerUse</span>()).<span style=3D"color:rgb(220,220,170)">c=
_str</span>()),</div>
<div><span style=3D"color:rgb(220,220,170)">entry</span>(<span style=3D"col=
or:rgb(206,145,120)">&quot;TARGET=3D%s&quot;</span>, <span style=3D"color:r=
gb(156,220,254)">target</span>-&gt;<span style=3D"color:rgb(156,220,254)">s=
econd</span>.<span style=3D"color:rgb(220,220,170)">c_str</span>()));</div>=
</div></div>
<div>The message in entry() is losted.</div>
<div>Do I need to add any option when building?</div>
<div>=C2=A0</div>
<div>Thanks.</div>
<div>Thu Nguyen.</div></div></div></blockquote></div></blockquote>
<div dir=3D"ltr">=C2=A0</div></div><br>

</blockquote></div>

--00000000000009e6af05b3b43051--
