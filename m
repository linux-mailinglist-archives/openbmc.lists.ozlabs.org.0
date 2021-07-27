Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A344A3D70B1
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 09:57:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYq063ZmMz30HW
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 17:57:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=sKqU9uNX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52c;
 helo=mail-ed1-x52c.google.com; envelope-from=ratankgupta31@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sKqU9uNX; dkim-atps=neutral
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYpzn225Jz301P
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jul 2021 17:57:24 +1000 (AEST)
Received: by mail-ed1-x52c.google.com with SMTP id u12so14191785eds.2
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jul 2021 00:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=AJyCv/y6NRNOV68MT5UR+QQyJfFUzBv0H4wgG1qGRbM=;
 b=sKqU9uNXr9GCjR3CRuq+xzjK2fTOhvEMR1mE8GZIpcYdB0v5ACw/BCgndSpRqazfhN
 Uc92IV60B5lSfp0qtW7vuxwvh8f/pJmdnsfcVTWmVW9nynmnMjj7S128ibdpnF4mHZH2
 mrb+J6s/DUYYJTlnYypda99VogMJHsWBc1rQ8W6bbgvO8OcxF6PSzNCPtQQVE4EA2Nqu
 TU+TQH7q7iNwqrXQRGTsuLvX1neBgmkzFzfWMGbkZzTIc+Pe0tyF64pql8xQGsdBliF0
 fYtZK8WjI3TqEg+xdjt6H9WIqXYW4xhTbI0ZMT2sdAOhpX7GJg3iUmQw3KgufpgDPGZa
 s0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=AJyCv/y6NRNOV68MT5UR+QQyJfFUzBv0H4wgG1qGRbM=;
 b=RCJKw0OR+G49QM9B6IXUOZrElFf+RrQkZrGYzT6i5BWAJIP53ZmjqBJoyaG+P4gr6o
 CHBwPmr1YXm7CHgAWmr5BkbS2T+acY9B6wSF7K5WgqZyiAY+mEfT847EK0J8dfW+fmqC
 W/CYsPWhQzJhtDiKQR60pUj3EKd3SX+XSwEfQb3ZizY9//fuMcqQdQTIwRYaKVEdsmIf
 GmejeZpQIWAjxJANUheSXLvufqgiX0pdjkxQnVs7h4ubnSxEhid9tTChVyP169uJKX92
 MHXcmn81ipUSao4+OFfK1pq1izC4ckOeAuTGo6fhjwp7Fb3ZN3aDBhs5pJIhEqIg07PF
 u2nQ==
X-Gm-Message-State: AOAM531z1MF5fWAJLdQzxvpji7BZhKZQNz0gf6sGmVfT3e4VPsgn83WN
 FrsT/5e65G4BHSQiohBl7SMQPL7AFRkPjQWA2Ybb7hYFZvw=
X-Google-Smtp-Source: ABdhPJwXTbP4qZhA929sA7TpNW7ZxVbwXfmXyjmn/Cmglbcs9vSt8hXA9rQ+dooiIysLqHWFAQrWja5xfHl1k1izo+M=
X-Received: by 2002:a05:6402:2935:: with SMTP id
 ee53mr26933783edb.140.1627372635197; 
 Tue, 27 Jul 2021 00:57:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAMhqiMrcS2Yr6B3TBTAyB4BE_FPbU_waoJScQmYCBMnCpv5ZAw@mail.gmail.com>
In-Reply-To: <CAMhqiMrcS2Yr6B3TBTAyB4BE_FPbU_waoJScQmYCBMnCpv5ZAw@mail.gmail.com>
From: Ratan Gupta <ratankgupta31@gmail.com>
Date: Tue, 27 Jul 2021 13:27:04 +0530
Message-ID: <CAMhqiMofyc2mGBYYJUXftj2kbQzmZt=q0pwyk2KPoSVxrHVKBQ@mail.gmail.com>
Subject: Re: apparmor support
To: joel@jms.id.au, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000d6913f05c816375a"
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

--000000000000d6913f05c816375a
Content-Type: text/plain; charset="UTF-8"

Ignore my previous email, I got the issue that CONFIG_SECURITY should have
been enabled also(That is a dependency)
https://github.com/openbmc/linux/blob/1519240139a91e3dbc97d8f79de29a22a3328257/security/apparmor/Kconfig#L4

On Tue, Jul 27, 2021 at 11:42 AM Ratan Gupta <ratankgupta31@gmail.com>
wrote:

> Hi All,
>
> I was trying to pull apparmor in openbmc, all the user space application
> got pulled however I was unable to build the kernel with apparmor support.
>
> I made the following kernel configuration to include the apparmor(
> https://github.com/openbmc/linux/blob/dev-5.10/Documentation/admin-guide/LSM/apparmor.rst
> )
>
> CONFIG_SECURITYFS=y
> CONFIG_SECURITY_NETWORK=y
> CONFIG_SECURITY_PATH=y
> CONFIG_SECURITY_APPARMOR=y
> CONFIG_DEFAULT_SECURITY="apparmor"
> CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=1
> CONFIG_AUDIT=y
>
>
> In the build tree, kernel is not picking the above config parameters and I
> was getting the following logs in the config_build_log which suggest that
> kernel doesn't like these config.
>
> tmp/work-shared/hgx/kernel-source/.kernel-meta/cfg/merge_config_build.log
>
> Value requested for CONFIG_SECURITY_PATH not in final .config
> Requested value:  CONFIG_SECURITY_PATH=y
> CONFIG_SECURITY_PATH=y
> Actual value:
>
> Value requested for CONFIG_SECURITY_APPARMOR not in final .config
> Requested value:  CONFIG_SECURITY_APPARMOR=y
> CONFIG_SECURITY_APPARMOR=y
> Actual value:
>
> Value requested for CONFIG_DEFAULT_SECURITY not in final .config
> Requested value:  CONFIG_DEFAULT_SECURITY="apparmor"
> CONFIG_DEFAULT_SECURITY="apparmor"
> Actual value:
>
> Value requested for CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE not in final
> .config
> Requested value:  CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=1
> CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=1
> Actual value:
>
> Can somebody suggest me what I am missing here?
>
> Ratan Gupta
>

--000000000000d6913f05c816375a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ignore my previous email, I got the issue that CONFIG_SECU=
RITY should=C2=A0have been enabled also(That is a dependency)<div><span sty=
le=3D"font-size:12pt;font-family:Calibri,sans-serif;color:rgb(0,32,96)"><a =
href=3D"https://github.com/openbmc/linux/blob/1519240139a91e3dbc97d8f79de29=
a22a3328257/security/apparmor/Kconfig#L4" style=3D"color:rgb(5,99,193)">htt=
ps://github.com/openbmc/linux/blob/1519240139a91e3dbc97d8f79de29a22a3328257=
/security/apparmor/Kconfig#L4</a></span></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 27, 2021 at 11:42=
 AM Ratan Gupta &lt;<a href=3D"mailto:ratankgupta31@gmail.com">ratankgupta3=
1@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr">Hi All,<br><br>I was trying to pull apparmor in=
 openbmc, all the user space application got pulled however I was unable to=
 build the kernel with apparmor support.<br><br>I made the following kernel=
 configuration to include the apparmor( <a href=3D"https://github.com/openb=
mc/linux/blob/dev-5.10/Documentation/admin-guide/LSM/apparmor.rst" target=
=3D"_blank">https://github.com/openbmc/linux/blob/dev-5.10/Documentation/ad=
min-guide/LSM/apparmor.rst</a>)<br><br>CONFIG_SECURITYFS=3Dy<br>CONFIG_SECU=
RITY_NETWORK=3Dy<br>CONFIG_SECURITY_PATH=3Dy<br>CONFIG_SECURITY_APPARMOR=3D=
y<br>CONFIG_DEFAULT_SECURITY=3D&quot;apparmor&quot;<br>CONFIG_SECURITY_APPA=
RMOR_BOOTPARAM_VALUE=3D1<br>CONFIG_AUDIT=3Dy<br><br><br>In the build tree, =
kernel is not picking the above config parameters and I was getting the fol=
lowing logs in the config_build_log which suggest that kernel doesn&#39;t l=
ike these config.<br><br>tmp/work-shared/hgx/kernel-source/.kernel-meta/cfg=
/merge_config_build.log<br><br>Value requested for CONFIG_SECURITY_PATH not=
 in final .config<br>Requested value: =C2=A0CONFIG_SECURITY_PATH=3Dy<br>CON=
FIG_SECURITY_PATH=3Dy<br>Actual value:<br><br>Value requested for CONFIG_SE=
CURITY_APPARMOR not in final .config<br>Requested value: =C2=A0CONFIG_SECUR=
ITY_APPARMOR=3Dy<br>CONFIG_SECURITY_APPARMOR=3Dy<br>Actual value:<br><br>Va=
lue requested for CONFIG_DEFAULT_SECURITY not in final .config<br>Requested=
 value: =C2=A0CONFIG_DEFAULT_SECURITY=3D&quot;apparmor&quot;<br>CONFIG_DEFA=
ULT_SECURITY=3D&quot;apparmor&quot;<br>Actual value:<br><br>Value requested=
 for CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE not in final .config<br>Reque=
sted value: =C2=A0CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=3D1<br>CONFIG_SE=
CURITY_APPARMOR_BOOTPARAM_VALUE=3D1<br>Actual value:<br><br>Can somebody su=
ggest me what I am missing here?<br><br>Ratan Gupta<br></div>
</blockquote></div>

--000000000000d6913f05c816375a--
