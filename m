Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDB2797D06
	for <lists+openbmc@lfdr.de>; Thu,  7 Sep 2023 21:55:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=mMtoDpgc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhVN711Bpz3c5K
	for <lists+openbmc@lfdr.de>; Fri,  8 Sep 2023 05:55:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=mMtoDpgc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=wak@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhVMX3cbXz2xbC
	for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2023 05:55:04 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-401d2e11dacso16626285e9.0
        for <openbmc@lists.ozlabs.org>; Thu, 07 Sep 2023 12:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1694116501; x=1694721301; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jHSU/6s33gWn99g+yvQ7roETPEpQgWMK9GvLVGzJjuM=;
        b=mMtoDpgcvJg4q6eKPQOeLJEjS7OysKI4kD25iNSTUqbAmNh1wAbHNrEJZqNBExtEeu
         NElmgSWWF/qtiuB1M+mU0N/viUJRo+y4nUxNJR20QcVHsYlOG2TJDqiGaMMawgf9bcJk
         XrjC6C13rlZztL0e6ENwPeVNppdksaqKLbjxRec12tEyQq0BrlL9XHwgbAMCDkPTcNkt
         FKpr0IAwAKtA3zfB8GjhfnD2bkUtI4L62r/FpEJtxodK9Js1kf2LderEdlrmNb1aTOUZ
         uZLk/g9yt0dh7epF9GsWhnX2jGYQi8Ahkao8UYCpGGNeq7rlx8K/3oLlXMA2RxUL9OqB
         ghzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694116501; x=1694721301;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jHSU/6s33gWn99g+yvQ7roETPEpQgWMK9GvLVGzJjuM=;
        b=sDZnhCI0N8uGqZvzVXBc6aK3hZZUHrOrwMsZbagS3eq1su7bz+nTCXQJ+wIF7yVIhh
         LnBqK5y0g8Q55+21wGpNjQrFgEOk3udyqpS65na/d5A0xWwhZZkwkQM3XDEsHnnCR68L
         ILTLQMxtkZkz1xyrRSwxHos+OLNkfipC2D0V+F5Vz4/tS1fosJDVPzihoMo3BUPrOlC0
         oK4D88jrjjVq6LIskhGAoZJE1aUL96SgeEEO/9bdZgsLClhquSKO/4NogGz7u0ym7SN6
         csvmUH5t8L6qyJCAP+854EnoOnmX1xMxdTJ7bwyainvKIRSovdvvZRh+CMR4LbaQHzbb
         54RA==
X-Gm-Message-State: AOJu0YzqimDdJWt1Tne12N5B+00YgrmpdOb4Ks+6Xicok69VLdrVj4TV
	koPituG6tJ2IXAfEjC62txZRa/sB4OITeJisFUymXzPpKCMv9kxaFLU=
X-Google-Smtp-Source: AGHT+IGQQJiB5d12Gy70IvPFM/rwGIIWdinqxigfiCtm7lX1S4Y/HDIgQRUyBNGFQs4ezUFyTYA6MvjmFSnciqzDiVA=
X-Received: by 2002:a5d:540e:0:b0:319:55f9:d50d with SMTP id
 g14-20020a5d540e000000b0031955f9d50dmr250084wrv.33.1694116500756; Thu, 07 Sep
 2023 12:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR19MB4107DD5C47856396755CD0FC91EEA@DM6PR19MB4107.namprd19.prod.outlook.com>
In-Reply-To: <DM6PR19MB4107DD5C47856396755CD0FC91EEA@DM6PR19MB4107.namprd19.prod.outlook.com>
From: William Kennington <wak@google.com>
Date: Thu, 7 Sep 2023 12:54:47 -0700
Message-ID: <CAPnigKnigkAFn6RgE59xv488Wdw-T_0G-6i+tAk2_uLjBms+pA@mail.gmail.com>
Subject: Re: phosphor-network terminated due to SIGBUS
To: "Chhabra, DipinderSingh" <Dipinder.Chhabra@dell.com>
Content-Type: multipart/alternative; boundary="0000000000003d43ea0604ca3c44"
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

--0000000000003d43ea0604ca3c44
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Do you happen to be using aarch64?

On Thu, Sep 7, 2023 at 12:52=E2=80=AFPM Chhabra, DipinderSingh <
Dipinder.Chhabra@dell.com> wrote:

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
> Internal Use - Confidential
>

--0000000000003d43ea0604ca3c44
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Do you happen to be using aarch64?</div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 7, 2023 at 1=
2:52=E2=80=AFPM Chhabra, DipinderSingh &lt;<a href=3D"mailto:Dipinder.Chhab=
ra@dell.com">Dipinder.Chhabra@dell.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div class=3D"msg7272394838860437669"=
>





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_7272394838860437669WordSection1">
<p class=3D"MsoNormal">Hi There<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Recently we updated our OpenBMC distro to tag 2.14.0=
 (phosphor-network SRCREV f78a415e154bac274e1d07ce8128c69e9d1cd710).<u></u>=
<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Since then we are seeing that the phosphor-network s=
ervice crashes after configuration change due to SIGBUS.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<pre><span style=3D"color:black">Sep 07 09:51:45 bmc phosphor-network-manag=
er[627]: Wrote networkd file: /etc/systemd/network/00-bmc-end1.network<u></=
u><u></u></span></pre>
<pre><span style=3D"color:black">Sep 07 09:51:45 bmc phosphor-network-manag=
er[627]: Wrote networkd file: /etc/systemd/network/00-bmc-end0.network<u></=
u><u></u></span></pre>
<pre><span style=3D"color:black">Sep 07 09:51:49 bmc systemd[1]: xyz.openbm=
c_project.Network.service: Main process exited, code=3Ddumped, status=3D7/B=
US<u></u><u></u></span></pre>
<pre><span style=3D"color:black">Sep 07 09:51:49 bmc systemd[1]: xyz.openbm=
c_project.Network.service: Failed with result &#39;core-dump&#39;.<u></u><u=
></u></span></pre>
<pre><span style=3D"color:black">Sep 07 09:51:49 bmc systemd[1]: xyz.openbm=
c_project.Network.service: Consumed 1.365s CPU time.<u></u><u></u></span></=
pre>
<pre><span style=3D"color:black">Sep 07 09:51:50 bmc systemd[1]: xyz.openbm=
c_project.Network.service: Scheduled restart job, restart counter is at 1.<=
u></u><u></u></span></pre>
<pre><span style=3D"color:black">Sep 07 09:51:50 bmc systemd[1]: Stopped Ph=
osphor Network Manager.<u></u><u></u></span></pre>
<pre><span style=3D"color:black">Sep 07 09:51:50 bmc systemd[1]: xyz.openbm=
c_project.Network.service: Consumed 1.365s CPU time.<u></u><u></u></span></=
pre>
<pre><span style=3D"color:black">Sep 07 09:51:50 bmc systemd[1]: Starting P=
hosphor Network Manager...<u></u><u></u></span></pre>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Based on my debugging, I can confirm that the timer =
gets scheduled correctly after the config write and the registered call bac=
k does get invoked. The crash happens due to the below dbus call in network=
_manager.cpp.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Cour=
ier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Cour=
ier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {<u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Cour=
ier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 bus.get()<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Cour=
ier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .new_method_call(&quot;org.freedesktop.netwo=
rk1&quot;,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Cour=
ier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;/org/freede=
sktop/network1&quot;,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Cour=
ier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;org.freedes=
ktop.network1.Manager&quot;, &quot;Reload&quot;)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Cour=
ier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
<span style=3D"background:yellow">.call();</span><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Cour=
ier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 lg2::info(&quot;Reloaded systemd-networkd&quot;);<u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Cour=
ier New&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I have looked into any fixes to this in the later co=
mmits but do not find any.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I also tried to change it to call_noreply but that d=
oes not help and get the same BUS error.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 try<u></u><u></u></span></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 {<u></u><u></u></span></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 lg2::info(&quot;Try systemd-networkd reload...&quo=
t;);<u></u><u></u></span></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 auto method =3D bus.get().new_method_call(NETWORKD=
_BUSNAME, NETWORKD_PATH,<u></u><u></u></span></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 NETWORKD_INTERFACE, &quot;Reload&quot;);<u></u><u></u></span></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 bus.get().call_noreply(method);<u></u><u></u></spa=
n></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 lg2::info(&quot;Reloaded systemd-networkd&quot;);<=
u></u><u></u></span></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 }<u></u><u></u></span></pre>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">When I manually invoke this from the shell that seem=
s to go fine.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<pre><span style=3D"color:black">root@bmc:~# busctl call org.freedesktop.ne=
twork1 /org/freedesktop/network1 org.freedesktop.network1.Manager Reload=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <u></u><u></u></span></pre>
<pre><span style=3D"color:black">root@bmc:~# echo $?<u></u><u></u></span></=
pre>
<pre><span style=3D"color:black">0<u></u><u></u></span></pre>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Anyone else seeing this issue with phosphor-network =
or any idea why this could be happening?<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thanks<u></u><u></u></p>
<p class=3D"MsoNormal">Dip<u></u><u></u></p>
<br>
<p align=3D"Left" style=3D"margin:0px"><span style=3D"font-size:7pt;font-fa=
mily:Calibri;color:rgb(115,115,115)">Internal Use - Confidential</span></p>
</div>
</div>

</div></blockquote></div>

--0000000000003d43ea0604ca3c44--
