Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C16852AA50E
	for <lists+openbmc@lfdr.de>; Sat,  7 Nov 2020 13:41:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSxhn6cCSzDrNh
	for <lists+openbmc@lfdr.de>; Sat,  7 Nov 2020 23:41:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d;
 helo=mail-qk1-x72d.google.com; envelope-from=tbnguyen1985@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nlEoUYCS; dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSxft6jrGzDrNb
 for <openbmc@lists.ozlabs.org>; Sat,  7 Nov 2020 23:40:06 +1100 (AEDT)
Received: by mail-qk1-x72d.google.com with SMTP id l2so3683382qkf.0
 for <openbmc@lists.ozlabs.org>; Sat, 07 Nov 2020 04:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=a6idzR88RqXGOIpLau9aySFr64Ox9AAEbWbV6ZDO9ww=;
 b=nlEoUYCSdwvF4O6rZ4ESFkmK1YXxYP3lwzi/l2UMQE+3AbGTyCuwrt5D3okSTjUIjU
 4ccsb9tkZd9jqZL8mWC0/zJpRgf9G3Coti8Ydph1CdFPAmmgjAXy7u+itHdA61zgnwvS
 RXptdZOk+yFLQeqcRm5Hm8a4Pp1aoiyDVtZLtKgukIsaQXbZop7b6pZGlnBgxCjEdOPG
 SOzBB3RBatwfo/EmkcP/2Yy4UsDsXRgGjd1hymmNVyKiQJ6Nfbf4RA6po/EfuXFh5L1x
 hP/4ejiiPEXSjVR7n3J4ZXJ/yhgdU51EE3BELFjzGM2TiHaP35+Qdir2VI+5HPlfkBva
 qrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=a6idzR88RqXGOIpLau9aySFr64Ox9AAEbWbV6ZDO9ww=;
 b=EWxglJHK9gu26BK9xFOMQfaxgMVzjLy49iVueop8dOGbmarTFuFG8mxsDqCvNsQSdc
 SWwq8PYahDrUkeg8e2AtzaPdU/xLdHKjtGdx0bauVXDv/PRDqOfRioFSX+I6WVaCMZlF
 VZDkFslt7lMHY8DEm3RAGCIeZaxumqnkmPDlMaZgIxS8Fg6lVMynaE8nQQL/z7nFxNXA
 KaCnXDLn+V69n10Zt6qnrnZsSpXXCnikHMJe4lXp6r2FmoJDNU+xRz/2K4f146XAIlPr
 e/zCYZXUpertQ/ZcFBSi0J6luUdfkSWz/6rZtRKVD6ZisWgdgnylHOVTUoMbTEDnnlAm
 7Q/g==
X-Gm-Message-State: AOAM533vihVFb1RRp7J3vLNHoVRNZrZlZuMZcuIenFgOPfQqfh1vr7+I
 lbt0j328gUMMQMYPhqt6uWY4Bhhsw++NhHJSzL8oz1bvPX8=
X-Google-Smtp-Source: ABdhPJwnz1YtfnLbKl7HoCD3tQocs/qoSKHWSRcMWbM0b2qNUyiY/OgvUrBgKaVs4YG1r3UX6VAxwMvMjH1OSfZkGf8=
X-Received: by 2002:a37:7f83:: with SMTP id a125mr5750808qkd.423.1604752802850; 
 Sat, 07 Nov 2020 04:40:02 -0800 (PST)
MIME-Version: 1.0
References: <CALioo35rFrsCcK+j8GW8DCAHqw_y_r8e9cMg-SmNLQ5ydMajNg@mail.gmail.com>
In-Reply-To: <CALioo35rFrsCcK+j8GW8DCAHqw_y_r8e9cMg-SmNLQ5ydMajNg@mail.gmail.com>
From: Thu Ba Nguyen <tbnguyen1985@gmail.com>
Date: Sat, 7 Nov 2020 19:39:51 +0700
Message-ID: <CALioo35DvdU8KsTJbB9RQiLQ+Md6gTW3TYeNy8qitVZLQzHK=A@mail.gmail.com>
Subject: Re: phosphor-logging: entry() failed parse message.
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000c42d0b05b383a0f9"
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

--000000000000c42d0b05b383a0f9
Content-Type: text/plain; charset="UTF-8"

The output in BMC console will be:
phosphor-watchdog[534]: watchdog: Timed out

Regards.
Thu Nguyen

On Sat, Nov 7, 2020 at 7:38 PM Thu Ba Nguyen <tbnguyen1985@gmail.com> wrote:

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

--000000000000c42d0b05b383a0f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">The output in BMC console will be:<div>ph=
osphor-watchdog[534]: watchdog: Timed out<br></div><div><br></div><div>Rega=
rds.</div><div>Thu Nguyen</div></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Sat, Nov 7, 2020 at 7:38 PM Thu Ba =
Nguyen &lt;<a href=3D"mailto:tbnguyen1985@gmail.com">tbnguyen1985@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left=
-color:rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"=
>Hi,<div><br></div><div>In openBmc, We are using phosphor-logging.</div><di=
v>When I log:</div><div><div style=3D"color:rgb(212,212,212);background-col=
or:rgb(30,30,30);font-family:Menlo,Monaco,&quot;Courier New&quot;,monospace=
;font-size:18px;line-height:27px;white-space:pre-wrap"><div><span style=3D"=
color:rgb(220,220,170)">log</span>&lt;<span style=3D"color:rgb(78,201,176)"=
>level</span>::<span style=3D"color:rgb(78,201,176)">INFO</span>&gt;(</div>=
<div>            <span style=3D"color:rgb(206,145,120)">&quot;watchdog: Tim=
ed out&quot;</span>,</div><div>            <span style=3D"color:rgb(220,220=
,170)">entry</span>(<span style=3D"color:rgb(206,145,120)">&quot;ACTION=3D%=
s&quot;</span>, <span style=3D"color:rgb(220,220,170)">convertForMessage</s=
pan>(<span style=3D"color:rgb(156,220,254)">action</span>).<span style=3D"c=
olor:rgb(220,220,170)">c_str</span>()),</div><div>            <span style=
=3D"color:rgb(220,220,170)">entry</span>(<span style=3D"color:rgb(206,145,1=
20)">&quot;TIMER_USE=3D%s&quot;</span>, <span style=3D"color:rgb(220,220,17=
0)">convertForMessage</span>(<span style=3D"color:rgb(220,220,170)">expired=
TimerUse</span>()).<span style=3D"color:rgb(220,220,170)">c_str</span>()),<=
/div><div>            <span style=3D"color:rgb(220,220,170)">entry</span>(<=
span style=3D"color:rgb(206,145,120)">&quot;TARGET=3D%s&quot;</span>, <span=
 style=3D"color:rgb(156,220,254)">target</span>-&gt;<span style=3D"color:rg=
b(156,220,254)">second</span>.<span style=3D"color:rgb(220,220,170)">c_str<=
/span>()));</div></div></div><div>The message in entry() is losted.</div><d=
iv>Do I need to add any option when building?</div><div><br></div><div>Than=
ks.</div><div>Thu Nguyen.</div></div></div>
</blockquote></div>

--000000000000c42d0b05b383a0f9--
