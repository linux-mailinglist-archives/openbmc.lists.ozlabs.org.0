Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24232361940
	for <lists+openbmc@lfdr.de>; Fri, 16 Apr 2021 07:26:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM4SQ0ns1z3bSj
	for <lists+openbmc@lfdr.de>; Fri, 16 Apr 2021 15:26:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=DnlRC0zZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::635;
 helo=mail-ej1-x635.google.com; envelope-from=ratankgupta31@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DnlRC0zZ; dkim-atps=neutral
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM4Rt2Mdzz3bqC
 for <openbmc@lists.ozlabs.org>; Fri, 16 Apr 2021 15:25:43 +1000 (AEST)
Received: by mail-ej1-x635.google.com with SMTP id r12so40298029ejr.5
 for <openbmc@lists.ozlabs.org>; Thu, 15 Apr 2021 22:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ecIAmmlznh9RDNVltwPl96rkM+8pQLpwnlPQ7NGcOyU=;
 b=DnlRC0zZU0/9KwnXPCs67Q8YFUGQY/m9UJVTYvqb5FF94AmuKIbci/bMCtozZOgq02
 Cq5yn50wEqM3ocJuzfRy2tQBY6kbsixqcSWRMxHbtZiaDRGxVS5TnmyKVaZX4spuN+Ov
 zaey0FFwj05nDkV9crB6eH0wje/XQ2I440tOvyBwN+cfCjVATOYSbCWXI0JB6xT1OM5Q
 UJo6NT5V9WEXoPOKzs7DNPn2oHguBDjqVyFKSNKnTgSrGSq4UuC7QceokSQqPRM7/EHC
 pwBqXxZXHblj3fVltTb4kFMoZ7J264rHxBhF/xGVrCLDpoTtYDaMPC6tm1HvoL3ySMbs
 wJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ecIAmmlznh9RDNVltwPl96rkM+8pQLpwnlPQ7NGcOyU=;
 b=RRBZK3XRaAodFggvMmXpTgb2OapmaoAnuQYOAaGhPY097ovNGfucDChZDJtE7JeMy+
 TEvylCkCGoHr0QDkkKgk+YD5CiVS74UVzFkcO/4y4/70ZzyhAbM5tnPpEvWMKAhjvZV2
 DRSC9dF0iyx7YY/gEObnyh/LjEMFcZb48N3z4Qbcj3HGOAkR54SHAgBRIdriYkcdgbVv
 7P8tbP7imKludXufxHeMdLRc4itQIRQ5PMpKax/JlG375YlXKmgsnpsf0TNs/z8yqvgF
 INXw3DsXztKmIH/UmHtBZA7I2J3klLkNZ857Sy0qFHW3I2zLoeuoShOE6PI9uIXYJf+9
 Fb6Q==
X-Gm-Message-State: AOAM532jsSN5Sra7ZouiMWKhSRtkh76pkrdblftAFHOMtkO/pU+ILvWi
 8uY4SAO046Ch9i2UnRuAehF8m5NuB3YmBzaFJRzk0dfh6kw=
X-Google-Smtp-Source: ABdhPJwn3THFvMKHyItOH3D7Qip0lVOa4+D9AtD1ZkEUPwq9LGzCy8qKLNQOF/GMR1+CgFR9gGDv0JhBT6tFz+ZcTCo=
X-Received: by 2002:a17:906:4004:: with SMTP id
 v4mr6875647ejj.208.1618550736527; 
 Thu, 15 Apr 2021 22:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <PS2PR02MB3541074F5D783E9A3CD72CB6904D9@PS2PR02MB3541.apcprd02.prod.outlook.com>
In-Reply-To: <PS2PR02MB3541074F5D783E9A3CD72CB6904D9@PS2PR02MB3541.apcprd02.prod.outlook.com>
From: Ratan Gupta <ratankgupta31@gmail.com>
Date: Fri, 16 Apr 2021 10:55:25 +0530
Message-ID: <CAMhqiMpCMUCLyDpWVQoYdwPgZUi3Zg7PaU4cT17gvgxLM0skOw@mail.gmail.com>
Subject: Re: Question regarding snmp trap
To: "Mohammed.Habeeb ISV" <mohammed.habeeb@inventec.com>
Content-Type: multipart/alternative; boundary="000000000000b3a6a905c01035ce"
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

--000000000000b3a6a905c01035ce
Content-Type: text/plain; charset="UTF-8"

Hi Mohammed,

There are two steps:
1)
You need to create D-bus monitor rules in phosphor-Dbus-monitor.
Eg:
https://github.com/openbmc/phosphor-dbus-monitor/blob/master/src/example/example.yaml
For IBM systems we defined the YAML like as below where for each critical
event (creation of error log), SNMP trap is being sent.
https://github.com/openbmc/openbmc/blob/master/meta-ibm/recipes-phosphor/dbus/events-policy/config.yaml#L129

2) Once you have configured the D-bus-monitor rules then You need to create
the subscription-like below.
busctl call  xyz.openbmc_project.Network.SNMP
/xyz/openbmc_project/network/snmp/manager
xyz.openbmc_project.Network.Client.Create Client sqs "<snmp trap reciever
IP>" <snmp trap listener port >
"xyz.openbmc_project.Network.Client.IPProtocol.IPv4"

Ratan


On Fri, Apr 16, 2021 at 1:05 AM Mohammed.Habeeb ISV <
mohammed.habeeb@inventec.com> wrote:

> Hi
>
> Is there any logging to enable to check if snmp trap is generated? How to
> trigger snmp traps?
> Adding phosphor-snmp recipe is enough for snmp trap to function or needed
> any other configs?
>
> Thanks for your help.
>
> Regards
> Habeeb
>
>

--000000000000b3a6a905c01035ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Mohammed,</div><div><br></div><di=
v>There are two steps:<br>1) <br></div><div>You need to create D-bus monito=
r rules in phosphor-Dbus-monitor. <br>Eg: <a href=3D"https://github.com/ope=
nbmc/phosphor-dbus-monitor/blob/master/src/example/example.yaml">https://gi=
thub.com/openbmc/phosphor-dbus-monitor/blob/master/src/example/example.yaml=
</a><br></div><div>For IBM systems we defined the YAML like as below where =
for each critical event (creation of error log), SNMP trap is being sent.</=
div><div><a href=3D"https://github.com/openbmc/openbmc/blob/master/meta-ibm=
/recipes-phosphor/dbus/events-policy/config.yaml#L129">https://github.com/o=
penbmc/openbmc/blob/master/meta-ibm/recipes-phosphor/dbus/events-policy/con=
fig.yaml#L129</a><br><br></div><div>2) Once you have configured the D-bus-m=
onitor rules then You need to create the subscription-like below.<br>busctl=
 call =C2=A0xyz.openbmc_project.Network.SNMP /xyz/openbmc_project/network/s=
nmp/manager xyz.openbmc_project.Network.Client.Create Client sqs &quot;&lt;=
snmp trap reciever IP&gt;&quot; &lt;snmp trap listener port &gt;=C2=A0 &quo=
t;xyz.openbmc_project.Network.Client.IPProtocol.IPv4&quot; <br></div><div><=
br></div><div>Ratan<br></div><div><br></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 16, 2021 at 1:05 AM=
 Mohammed.Habeeb ISV &lt;<a href=3D"mailto:mohammed.habeeb@inventec.com">mo=
hammed.habeeb@inventec.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Hi <br>
<br>
Is there any logging to enable to check if snmp trap is generated? How to t=
rigger snmp traps?<br>
Adding phosphor-snmp recipe is enough for snmp trap to function or needed a=
ny other configs?<br>
<br>
Thanks for your help.<br>
<br>
Regards<br>
Habeeb<br>
<br>
</blockquote></div></div>

--000000000000b3a6a905c01035ce--
