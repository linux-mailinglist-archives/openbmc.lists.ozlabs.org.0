Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17311797E8E
	for <lists+openbmc@lfdr.de>; Fri,  8 Sep 2023 00:08:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=rKRdy27t;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhYK96TH5z3c5k
	for <lists+openbmc@lfdr.de>; Fri,  8 Sep 2023 08:08:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=rKRdy27t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=wak@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhYJX6wYNz2yVG
	for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2023 08:07:39 +1000 (AEST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-402e7968042so14599185e9.2
        for <openbmc@lists.ozlabs.org>; Thu, 07 Sep 2023 15:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1694124454; x=1694729254; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mnfv3L1Uwg95j8jYVdG4AqNb7NvqYlTtwfXtoeWpC+4=;
        b=rKRdy27tG38+AhZChozUmCIVkYKL73LNvoz+/uEXJ3vW0QIHK13MW/ozzrpdKnza4J
         0iUfDhLLw0Eck3guXJSxuatze4wbDjJ73z3yD2fDzNTq0GNG636jvNfl37bNPKW70ySk
         7AW4VKh4DwV0fjJvo0F4kxmDeuUeqgbVZVMjV3w+JfnMpdljDfcJLZlehJ6VW39Ax6Ft
         ypfcgC0vFuOols9JDDry00koeZPG/EGCZK64gefwUQ671EJbIhoQnttmisqIhKkenPiX
         NIxM2qr5bopCDubuecUH6nQOdhD27To5tmm+ELhrF3SEtOPKWgxywhkZUe3uERu07LGN
         9Cww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694124454; x=1694729254;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mnfv3L1Uwg95j8jYVdG4AqNb7NvqYlTtwfXtoeWpC+4=;
        b=ucQ1y9c3nVj4xBDOG++QYvBmZAQi5XJxQJJxyHhE5Ovf2XDBwXfWzJTPjz1oBRMIae
         KFoD9SOZo1XceBwNnxOj69AIaiq6yuqXH8fuCl+yZu9DoxPrGnbPSvVzLScy3ZAc1CeW
         wveGnLXbDHjzDPFlpuL4ZHUUadjXeQoYycEVFv3ra/wgmCgQAne4oRLCj6tPS143dh32
         tx4hZZxukEXgNZvuruu9GvbIZCGwtf5pBMlwlkkhuz0pz2JkOMPUTqzsqWEEzlSlGnqN
         4X4GV8kj8yjOmrO6Jja7YMXVeOZamMx9X+GDVo6MZVEvpN48CBffzrJfi15JfxraZkO1
         FALw==
X-Gm-Message-State: AOJu0YxIaK8DHXjSC50nkho+UJNScT7XMHBBTiSlN1w5fu4kU5rpoOg2
	2ZO6lGgBCWnx6cSBLdewAIFNh1ovqtNe+qTZXsPKfQ==
X-Google-Smtp-Source: AGHT+IHcTObdFrdwuM+nnj4gzI5Mu/z/GtHAy31v0KhJk1bw9oaP/60QuwVD2rxdDZQhcwzOvhjBzJLKI+wvWMZyEuc=
X-Received: by 2002:a5d:4003:0:b0:31a:ed75:75e9 with SMTP id
 n3-20020a5d4003000000b0031aed7575e9mr415176wrp.13.1694124454115; Thu, 07 Sep
 2023 15:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR19MB4107DD5C47856396755CD0FC91EEA@DM6PR19MB4107.namprd19.prod.outlook.com>
 <CAPnigKnigkAFn6RgE59xv488Wdw-T_0G-6i+tAk2_uLjBms+pA@mail.gmail.com> <DM6PR19MB4107E37A673818B071DA99DA91EEA@DM6PR19MB4107.namprd19.prod.outlook.com>
In-Reply-To: <DM6PR19MB4107E37A673818B071DA99DA91EEA@DM6PR19MB4107.namprd19.prod.outlook.com>
From: William Kennington <wak@google.com>
Date: Thu, 7 Sep 2023 15:07:22 -0700
Message-ID: <CAPnigK=YHGX33zZoCxYNmWPYovcQF_mG8OAo4m4LzBheqiNYYA@mail.gmail.com>
Subject: Re: phosphor-network terminated due to SIGBUS
To: "Chhabra, DipinderSingh" <Dipinder.Chhabra@dell.com>
Content-Type: multipart/alternative; boundary="0000000000004baa0a0604cc16b5"
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

--0000000000004baa0a0604cc16b5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We are investigating the same issue on our side, I'm trying some other
tests to figure out why the references aren't working as expected.

On Thu, Sep 7, 2023 at 1:27=E2=80=AFPM Chhabra, DipinderSingh <
Dipinder.Chhabra@dell.com> wrote:

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

--0000000000004baa0a0604cc16b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We are investigating the same issue on our side, I&#39;m t=
rying some other tests to figure out why the references aren&#39;t working =
as expected.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Thu, Sep 7, 2023 at 1:27=E2=80=AFPM Chhabra, DipinderSingh &=
lt;<a href=3D"mailto:Dipinder.Chhabra@dell.com">Dipinder.Chhabra@dell.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv class=3D"msg-3000132491391917046">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_-3000132491391917046WordSection1">
<p class=3D"MsoNormal">Yes.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b>From:</b> William Kennington &lt;<a href=3D"mailt=
o:wak@google.com" target=3D"_blank">wak@google.com</a>&gt; <br>
<b>Sent:</b> Thursday, September 7, 2023 2:55 PM<br>
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
<p class=3D"MsoNormal">Do you happen to be using aarch64?<u></u><u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
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
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p style=3D"margin:0in"><span style=3D"font-size:7pt;color:rgb(115,115,115)=
">Internal Use - Confidential</span><u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"m_-3000132491391917046msipfooter90245289" style=3D"margin:0in">=
<span style=3D"font-size:7pt;color:rgb(115,115,115)">Internal Use - Confide=
ntial</span><u></u><u></u></p>
</div>
</div>
</div>
</blockquote>
</div>
</div>
</div>

</div></blockquote></div>

--0000000000004baa0a0604cc16b5--
