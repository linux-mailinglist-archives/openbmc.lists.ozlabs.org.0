Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96381799118
	for <lists+openbmc@lfdr.de>; Fri,  8 Sep 2023 22:39:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=12n5S/ef;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rj7Hz6CLMz3cGK
	for <lists+openbmc@lfdr.de>; Sat,  9 Sep 2023 06:39:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=12n5S/ef;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=wak@google.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rj7HM4JQ0z3c24
	for <openbmc@lists.ozlabs.org>; Sat,  9 Sep 2023 06:38:38 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-502a7e1bdc7so284559e87.0
        for <openbmc@lists.ozlabs.org>; Fri, 08 Sep 2023 13:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1694205510; x=1694810310; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4mgIqTnIDfMTvjD9aOwhDbVRewBZtSG/zGxT5zKF+iI=;
        b=12n5S/efNNoHJx6ifkKuCA82X8OkARNzrUeBBehlBMjTxiaNg911WHN2hbqZsUjvi7
         6uUXzsVZjINPojUhiCf+fS6JYqWH3XtbjPai+jHeFblFjvnxOXeVjwR+V7By+oTlorKd
         cDVYslB5ZhGnPXSN6FoKrAI1wlvT9ac+VTHerBUzcrJld/iczTtPYEm6mP7QQFiLwuNM
         AxYQowOms/3EYUTZQ/CYGQCjZK7p/YvT9ULZQZ7uMSmGy3MHfVOvkkdzwN2iD0enA7Hs
         FoXVmR3HVWO5xF0rVZVLC2pW6tG8J++lQJ3pchSQJh71oxN336E1EHCt5PpUxJENZxK/
         ejFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694205510; x=1694810310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mgIqTnIDfMTvjD9aOwhDbVRewBZtSG/zGxT5zKF+iI=;
        b=otIK+YBdODU1TbGmuOW4wMOaIARwaT5CX15CWez/wI9RirevZ2+LklNd/UT+KfmUyk
         YfaW9/YIH0k8ktWhBMgN4w4P6mL4ITDbKXFrkgxNGXywau1il8pIXE4G/1W5i5iFZj3s
         4kfykN0uRC4Ivg09QA1F53KkVaurd0rQYv1fIMAZqOfPXAClJuAS32se+9uQ/Pi6pLIB
         Byzj/bLV6/tfc1owxmiEKrDDzljSuFsIXV8auC383Ja/yQttzJPSOY78lFbYsdtlmn/L
         NnvT/kEYDFu/+QGOgyGuBxpV2Xo51MihH6i719e/Qt4DcO4CvfJySAMcwu+zb3EUo5rf
         6CdQ==
X-Gm-Message-State: AOJu0YwO+K1BkE/8IyJ59iYnyK4EvnxhC0aEXM7ox98u1+NVbC1HeUoq
	6yuxsE6hI/z3NQ9TP2qJVer4NhbdPJtDBEESO9xv0SEa6HbJIPvRhk7o5A==
X-Google-Smtp-Source: AGHT+IEWmKPF2YQZ8mw4SWv0G14kagLCQkSOoZnbG9TrTS8JFtIxG5gogQUp2OOc5G9qffeU99f1dCH/M5IbR/gRrT4=
X-Received: by 2002:ac2:5a45:0:b0:500:dc8d:c344 with SMTP id
 r5-20020ac25a45000000b00500dc8dc344mr2452675lfn.48.1694205509983; Fri, 08 Sep
 2023 13:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR19MB4107DD5C47856396755CD0FC91EEA@DM6PR19MB4107.namprd19.prod.outlook.com>
 <CAPnigKnigkAFn6RgE59xv488Wdw-T_0G-6i+tAk2_uLjBms+pA@mail.gmail.com>
 <DM6PR19MB4107E37A673818B071DA99DA91EEA@DM6PR19MB4107.namprd19.prod.outlook.com>
 <CAPnigK=YHGX33zZoCxYNmWPYovcQF_mG8OAo4m4LzBheqiNYYA@mail.gmail.com> <DM6PR19MB4107F212B9FBF355A184927191EDA@DM6PR19MB4107.namprd19.prod.outlook.com>
In-Reply-To: <DM6PR19MB4107F212B9FBF355A184927191EDA@DM6PR19MB4107.namprd19.prod.outlook.com>
From: William Kennington <wak@google.com>
Date: Fri, 8 Sep 2023 13:38:17 -0700
Message-ID: <CAPnigKkKr5E-taGuEsJFXnQusk8w7ZmUuuV5nXuUjoyJU=NC3Q@mail.gmail.com>
Subject: Re: phosphor-network terminated due to SIGBUS
To: "Chhabra, DipinderSingh" <Dipinder.Chhabra@dell.com>
Content-Type: multipart/alternative; boundary="0000000000009a22430604def50d"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000009a22430604def50d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It should be fixed now :)
https://gerrit.openbmc.org/c/openbmc/phosphor-networkd/+/66533

On Thu, Sep 7, 2023 at 6:24=E2=80=AFPM Chhabra, DipinderSingh <
Dipinder.Chhabra@dell.com> wrote:

> Something to do with the callback in the timer context. As a temporary
> workaround, I have removed the inline implementation of reloadConfigs and
> moved the completed block of code inside reload.setCallback directly insi=
de
> reloadConfigs (including reloadPreHooks, actual dbus call and
> reloadPostHooks). This works pretty good and no more SIGBUS.
>
>
>
> Depending upon the scenario this will cause multiple Reload calls to
> systemd-networkd (unlike the timer case where it be always be a single
> call) but I guess it may be ok in the interim.
>
>
>
> Will continue investigating further from my end too.
>
>
>
> Thanks
>
> Dipinder
>
>
>
> *From:* William Kennington <wak@google.com>
> *Sent:* Thursday, September 7, 2023 5:07 PM
> *To:* Chhabra, DipinderSingh <Dipinder_Chhabra@Dell.com>
> *Cc:* openbmc@lists.ozlabs.org
> *Subject:* Re: phosphor-network terminated due to SIGBUS
>
>
>
> [EXTERNAL EMAIL]
>
> We are investigating the same issue on our side, I'm trying some other
> tests to figure out why the references aren't working as expected.
>
>
>
> On Thu, Sep 7, 2023 at 1:27=E2=80=AFPM Chhabra, DipinderSingh <
> Dipinder.Chhabra@dell.com> wrote:
>
> Yes.
>
>
>
> *From:* William Kennington <wak@google.com>
> *Sent:* Thursday, September 7, 2023 2:55 PM
> *To:* Chhabra, DipinderSingh <Dipinder_Chhabra@Dell.com>
> *Cc:* openbmc@lists.ozlabs.org
> *Subject:* Re: phosphor-network terminated due to SIGBUS
>
>
>
> [EXTERNAL EMAIL]
>
> Do you happen to be using aarch64?
>
>
>
> On Thu, Sep 7, 2023 at 12:52=E2=80=AFPM Chhabra, DipinderSingh <
> Dipinder.Chhabra@dell.com> wrote:
>
> Hi There
>
>
>
> Recently we updated our OpenBMC distro to tag 2.14.0 (phosphor-network
> SRCREV f78a415e154bac274e1d07ce8128c69e9d1cd710).
>
>
>
> Since then we are seeing that the phosphor-network service crashes after
> configuration change due to SIGBUS.
>
>
>
> Sep 07 09:51:45 bmc phosphor-network-manager[627]: Wrote networkd file: /=
etc/systemd/network/00-bmc-end1.network
>
> Sep 07 09:51:45 bmc phosphor-network-manager[627]: Wrote networkd file: /=
etc/systemd/network/00-bmc-end0.network
>
> Sep 07 09:51:49 bmc systemd[1]: xyz.openbmc_project.Network.service: Main=
 process exited, code=3Ddumped, status=3D7/BUS
>
> Sep 07 09:51:49 bmc systemd[1]: xyz.openbmc_project.Network.service: Fail=
ed with result 'core-dump'.
>
> Sep 07 09:51:49 bmc systemd[1]: xyz.openbmc_project.Network.service: Cons=
umed 1.365s CPU time.
>
> Sep 07 09:51:50 bmc systemd[1]: xyz.openbmc_project.Network.service: Sche=
duled restart job, restart counter is at 1.
>
> Sep 07 09:51:50 bmc systemd[1]: Stopped Phosphor Network Manager.
>
> Sep 07 09:51:50 bmc systemd[1]: xyz.openbmc_project.Network.service: Cons=
umed 1.365s CPU time.
>
> Sep 07 09:51:50 bmc systemd[1]: Starting Phosphor Network Manager...
>
>
>
> Based on my debugging, I can confirm that the timer gets scheduled
> correctly after the config write and the registered call back does get
> invoked. The crash happens due to the below dbus call in
> network_manager.cpp.
>
>
>
>         try
>
>         {
>
>             bus.get()
>
>                 .new_method_call("org.freedesktop.network1",
>
>                                  "/org/freedesktop/network1",
>
>                                  "org.freedesktop.network1.Manager",
> "Reload")
>
>                 .call();
>
>             lg2::info("Reloaded systemd-networkd");
>
>         }
>
>
>
> I have looked into any fixes to this in the later commits but do not find
> any.
>
>
>
> I also tried to change it to call_noreply but that does not help and get
> the same BUS error.
>
>
>
>         try
>
>         {
>
>             lg2::info("Try systemd-networkd reload...");
>
>             auto method =3D bus.get().new_method_call(NETWORKD_BUSNAME, N=
ETWORKD_PATH,
>
>                                  NETWORKD_INTERFACE, "Reload");
>
>             bus.get().call_noreply(method);
>
>             lg2::info("Reloaded systemd-networkd");
>
>         }
>
>
>
> When I manually invoke this from the shell that seems to go fine.
>
>
>
> root@bmc:~# busctl call org.freedesktop.network1 /org/freedesktop/network=
1 org.freedesktop.network1.Manager Reload
>
> root@bmc:~# echo $?
>
> 0
>
>
>
> Anyone else seeing this issue with phosphor-network or any idea why this
> could be happening?
>
>
>
> Thanks
>
> Dip
>
>
>
> Internal Use - Confidential
>
>
>
> Internal Use - Confidential
>
>
>
> Internal Use - Confidential
>
>

--0000000000009a22430604def50d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It should be fixed now :)=C2=A0<a href=3D"https://gerrit.o=
penbmc.org/c/openbmc/phosphor-networkd/+/66533">https://gerrit.openbmc.org/=
c/openbmc/phosphor-networkd/+/66533</a></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 7, 2023 at 6:24=E2=80=AF=
PM Chhabra, DipinderSingh &lt;<a href=3D"mailto:Dipinder.Chhabra@dell.com">=
Dipinder.Chhabra@dell.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div class=3D"msg5398798417703686960">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_5398798417703686960WordSection1">
<p class=3D"MsoNormal">Something to do with the callback in the timer conte=
xt. As a temporary workaround, I have removed the inline implementation of =
reloadConfigs and moved the completed block of code inside reload.setCallba=
ck directly inside reloadConfigs (including
 reloadPreHooks, actual dbus call and reloadPostHooks). This works pretty g=
ood and no more SIGBUS.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Depending upon the scenario this will cause multiple=
 Reload calls to systemd-networkd (unlike the timer case where it be always=
 be a single call) but I guess it may be ok in the interim.<u></u><u></u></=
p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Will continue investigating further from my end too.=
<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thanks<u></u><u></u></p>
<p class=3D"MsoNormal">Dipinder<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b>From:</b> William Kennington &lt;<a href=3D"mailt=
o:wak@google.com" target=3D"_blank">wak@google.com</a>&gt; <br>
<b>Sent:</b> Thursday, September 7, 2023 5:07 PM<br>
<b>To:</b> Chhabra, DipinderSingh &lt;Dipinder_Chhabra@Dell.com&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">op=
enbmc@lists.ozlabs.org</a><br>
<b>Subject:</b> Re: phosphor-network terminated due to SIGBUS<u></u><u></u>=
</p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p><span style=3D"color:rgb(206,17,38)">[EXTERNAL EMAIL] <u></u><u></u></sp=
an></p>
</div>
<div>
<p class=3D"MsoNormal">We are investigating the same issue on our side, I&#=
39;m trying some other tests to figure out why the references aren&#39;t wo=
rking as expected.<u></u><u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Thu, Sep 7, 2023 at 1:27=E2=80=AFPM Chhabra, Dipi=
nderSingh &lt;<a href=3D"mailto:Dipinder.Chhabra@dell.com" target=3D"_blank=
">Dipinder.Chhabra@dell.com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin:5pt 0i=
n 5pt 4.8pt">
<div>
<div>
<div>
<p class=3D"MsoNormal">Yes.<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b>From:</b> William Kennington &lt;<a href=3D"mailt=
o:wak@google.com" target=3D"_blank">wak@google.com</a>&gt;
<br>
<b>Sent:</b> Thursday, September 7, 2023 2:55 PM<br>
<b>To:</b> Chhabra, DipinderSingh &lt;<a href=3D"mailto:Dipinder_Chhabra@De=
ll.com" target=3D"_blank">Dipinder_Chhabra@Dell.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">op=
enbmc@lists.ozlabs.org</a><br>
<b>Subject:</b> Re: phosphor-network terminated due to SIGBUS<u></u><u></u>=
</p>
</div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div>
<p><span style=3D"color:rgb(206,17,38)">[EXTERNAL EMAIL] </span><u></u><u><=
/u></p>
</div>
<div>
<p class=3D"MsoNormal">Do you happen to be using aarch64?<u></u><u></u></p>
</div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Thu, Sep 7, 2023 at 12:52=E2=80=AFPM Chhabra, Dip=
inderSingh &lt;<a href=3D"mailto:Dipinder.Chhabra@dell.com" target=3D"_blan=
k">Dipinder.Chhabra@dell.com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin:5pt 0i=
n 5pt 4.8pt">
<div>
<div>
<div>
<p class=3D"MsoNormal">Hi There<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">Recently we updated our OpenBMC distro to tag 2.14.0=
 (phosphor-network SRCREV f78a415e154bac274e1d07ce8128c69e9d1cd710).<u></u>=
<u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">Since then we are seeing that the phosphor-network s=
ervice crashes after configuration change due to SIGBUS.<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<pre><span style=3D"color:black">Sep 07 09:51:45 bmc phosphor-network-manag=
er[627]: Wrote networkd file: /etc/systemd/network/00-bmc-end1.network</spa=
n><u></u><u></u></pre>
<pre><span style=3D"color:black">Sep 07 09:51:45 bmc phosphor-network-manag=
er[627]: Wrote networkd file: /etc/systemd/network/00-bmc-end0.network</spa=
n><u></u><u></u></pre>
<pre><span style=3D"color:black">Sep 07 09:51:49 bmc systemd[1]: xyz.openbm=
c_project.Network.service: Main process exited, code=3Ddumped, status=3D7/B=
US</span><u></u><u></u></pre>
<pre><span style=3D"color:black">Sep 07 09:51:49 bmc systemd[1]: xyz.openbm=
c_project.Network.service: Failed with result &#39;core-dump&#39;.</span><u=
></u><u></u></pre>
<pre><span style=3D"color:black">Sep 07 09:51:49 bmc systemd[1]: xyz.openbm=
c_project.Network.service: Consumed 1.365s CPU time.</span><u></u><u></u></=
pre>
<pre><span style=3D"color:black">Sep 07 09:51:50 bmc systemd[1]: xyz.openbm=
c_project.Network.service: Scheduled restart job, restart counter is at 1.<=
/span><u></u><u></u></pre>
<pre><span style=3D"color:black">Sep 07 09:51:50 bmc systemd[1]: Stopped Ph=
osphor Network Manager.</span><u></u><u></u></pre>
<pre><span style=3D"color:black">Sep 07 09:51:50 bmc systemd[1]: xyz.openbm=
c_project.Network.service: Consumed 1.365s CPU time.</span><u></u><u></u></=
pre>
<pre><span style=3D"color:black">Sep 07 09:51:50 bmc systemd[1]: Starting P=
hosphor Network Manager...</span><u></u><u></u></pre>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">Based on my debugging, I can confirm that the timer =
gets scheduled correctly after the config write and the registered call bac=
k does get invoked. The crash happens due to the below
 dbus call in network_manager.cpp.<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Cour=
ier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try</span><u></u>=
<u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Cour=
ier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {</span><u></u><u=
></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Cour=
ier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 bus.get()</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Cour=
ier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .new_method_call(&quot;org.freedesktop.netwo=
rk1&quot;,</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Cour=
ier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;/org/freede=
sktop/network1&quot;,</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Cour=
ier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;org.freedes=
ktop.network1.Manager&quot;, &quot;Reload&quot;)</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Cour=
ier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
<span style=3D"color:black;background:yellow">.call();</span></span><u></u>=
<u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Cour=
ier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 lg2::info(&quot;Reloaded systemd-networkd&quot;);</span><u></u><u></=
u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Cour=
ier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }</span><u></u><u=
></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">I have looked into any fixes to this in the later co=
mmits but do not find any.<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">I also tried to change it to call_noreply but that d=
oes not help and get the same BUS error.<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 try</span><u></u><u></u></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 {</span><u></u><u></u></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 lg2::info(&quot;Try systemd-networkd reload...&quo=
t;);</span><u></u><u></u></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 auto method =3D bus.get().new_method_call(NETWORKD=
_BUSNAME, NETWORKD_PATH,</span><u></u><u></u></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 NETWORKD_INTERFACE, &quot;Reload&quot;);</span><u></u><u></u></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 bus.get().call_noreply(method);</span><u></u><u></=
u></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 lg2::info(&quot;Reloaded systemd-networkd&quot;);<=
/span><u></u><u></u></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 }</span><u></u><u></u></pre>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">When I manually invoke this from the shell that seem=
s to go fine.<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<pre><span style=3D"color:black">root@bmc:~# busctl call org.freedesktop.ne=
twork1 /org/freedesktop/network1 org.freedesktop.network1.Manager Reload=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span><u></u><u></u></pre>
<pre><span style=3D"color:black">root@bmc:~# echo $?</span><u></u><u></u></=
pre>
<pre><span style=3D"color:black">0</span><u></u><u></u></pre>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">Anyone else seeing this issue with phosphor-network =
or any idea why this could be happening?<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">Thanks<u></u><u></u></p>
<p class=3D"MsoNormal">Dip<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p style=3D"margin:0in"><span style=3D"font-size:7pt;color:rgb(115,115,115)=
">Internal Use - Confidential</span><u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"m_5398798417703686960m-3000132491391917046msipfooter90245289" s=
tyle=3D"margin:0in"><span style=3D"font-size:7pt;color:rgb(115,115,115)">In=
ternal Use - Confidential</span><u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"m_5398798417703686960msipfooter90245289" style=3D"margin:0in"><=
span style=3D"font-size:7pt;color:rgb(115,115,115)">Internal Use - Confiden=
tial</span><u></u><u></u></p>
</div>
</div>
</div>
</blockquote>
</div>
</div>
</div>
</div>
</blockquote>
</div>
</div>
</div>

</div></blockquote></div>

--0000000000009a22430604def50d--
