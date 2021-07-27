Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B703D6EE9
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 08:13:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYmgg1ZgNz3081
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 16:13:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=L6eShN9+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62e;
 helo=mail-ej1-x62e.google.com; envelope-from=ratankgupta31@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=L6eShN9+; dkim-atps=neutral
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYmgN0zMFz3bWh
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jul 2021 16:13:04 +1000 (AEST)
Received: by mail-ej1-x62e.google.com with SMTP id gn26so14215355ejc.3
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jul 2021 23:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ZzFZfKQqznFlR7S7G+S5PLNiDaX9X3sbdTplQ+KhRmM=;
 b=L6eShN9+4tK3hf8Y7S+XSH2qKMmSfuiRmiwA1mmQA8QE3F5eZ+HGMYSv2H36B2Q9YX
 VCX3baF6daTjfg96dzDNToYETOFRnQ8CkiCSpNya4PrR3jVNLqz6fL4RosXIQYCiPrP7
 MZTEi5gbkFFTpeRlmxkHQRB7ovptQ6jIsnA6sYKQ/IGn8aaxfSElxSaT6z6mOjJYxf4a
 856EGfXNaHgOh8/f6VLiORP3po1QFYaltZVw0R/RjFOWx8ZsnJ9Mr8v49rVig615O6Sh
 uHRqt5tdo8c1pUZIHptG9vuSGoZKeIyAvKsAuPaQ+stfmOIGywXkpjyU1rUYNKq8p7i8
 w4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ZzFZfKQqznFlR7S7G+S5PLNiDaX9X3sbdTplQ+KhRmM=;
 b=OfqVJ/Zkxbl0/CRPqbRtmdG3KsKd58Cg0gPlx4pYEWuxlgZ3q/pn5H8OYajGD76rbL
 lDoNLSe81ch+F4/oBS5xt+ECk2MlZot/9TzihHkTyZic/b3xTFWcG94wWTXSXA5CFM5c
 KWmngtR+qKRjvZT7fPwhikkRHPtxxUZg6iLBWHvWWVsGxmXL+ojhfYMSzp63ylcygAfb
 ym3Ctwb36bxO/DLHBDQEtAs3hkOtLbqJqP7KQAa8wVC2xQ0zP06Kl8o9aSZx8I9q5AXH
 vhEqGDPZSMGHsEq7u9N0GfVjXm+gZE30X7s4fHjsWirWh4l7xF9KKeRkEnVZH2inAsU6
 NgVA==
X-Gm-Message-State: AOAM533h4v+WOV2xH7A8v/ikZoGmuoDQMpAYuQzY0QHrJQcoAWooZcxc
 lAwZPqQBGsX2PzsrFaRDC6ENUduSRJgbHqQebf0=
X-Google-Smtp-Source: ABdhPJzysk8c/5x5CgRLdv8gI8HQwtAd9gmwiG49A09CZlH22H2syF/I2rRqeOxq9p1GswVsxcqnsb5ghgdWjn7PwYY=
X-Received: by 2002:a17:906:24d8:: with SMTP id
 f24mr7008272ejb.2.1627366380038; 
 Mon, 26 Jul 2021 23:13:00 -0700 (PDT)
MIME-Version: 1.0
From: Ratan Gupta <ratankgupta31@gmail.com>
Date: Tue, 27 Jul 2021 11:42:49 +0530
Message-ID: <CAMhqiMrcS2Yr6B3TBTAyB4BE_FPbU_waoJScQmYCBMnCpv5ZAw@mail.gmail.com>
Subject: apparmor support
To: joel@jms.id.au, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000006f0205c814c3f7"
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

--000000000000006f0205c814c3f7
Content-Type: text/plain; charset="UTF-8"

Hi All,

I was trying to pull apparmor in openbmc, all the user space application
got pulled however I was unable to build the kernel with apparmor support.

I made the following kernel configuration to include the apparmor(
https://github.com/openbmc/linux/blob/dev-5.10/Documentation/admin-guide/LSM/apparmor.rst
)

CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
CONFIG_SECURITY_PATH=y
CONFIG_SECURITY_APPARMOR=y
CONFIG_DEFAULT_SECURITY="apparmor"
CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=1
CONFIG_AUDIT=y


In the build tree, kernel is not picking the above config parameters and I
was getting the following logs in the config_build_log which suggest that
kernel doesn't like these config.

tmp/work-shared/hgx/kernel-source/.kernel-meta/cfg/merge_config_build.log

Value requested for CONFIG_SECURITY_PATH not in final .config
Requested value:  CONFIG_SECURITY_PATH=y
CONFIG_SECURITY_PATH=y
Actual value:

Value requested for CONFIG_SECURITY_APPARMOR not in final .config
Requested value:  CONFIG_SECURITY_APPARMOR=y
CONFIG_SECURITY_APPARMOR=y
Actual value:

Value requested for CONFIG_DEFAULT_SECURITY not in final .config
Requested value:  CONFIG_DEFAULT_SECURITY="apparmor"
CONFIG_DEFAULT_SECURITY="apparmor"
Actual value:

Value requested for CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE not in final
.config
Requested value:  CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=1
CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=1
Actual value:

Can somebody suggest me what I am missing here?

Ratan Gupta

--000000000000006f0205c814c3f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<br><br>I was trying to pull apparmor in openbmc, a=
ll the user space application got pulled however I was unable to build the =
kernel with apparmor support.<br><br>I made the following kernel configurat=
ion to include the apparmor( <a href=3D"https://github.com/openbmc/linux/bl=
ob/dev-5.10/Documentation/admin-guide/LSM/apparmor.rst">https://github.com/=
openbmc/linux/blob/dev-5.10/Documentation/admin-guide/LSM/apparmor.rst</a>)=
<br><br>CONFIG_SECURITYFS=3Dy<br>CONFIG_SECURITY_NETWORK=3Dy<br>CONFIG_SECU=
RITY_PATH=3Dy<br>CONFIG_SECURITY_APPARMOR=3Dy<br>CONFIG_DEFAULT_SECURITY=3D=
&quot;apparmor&quot;<br>CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=3D1<br>CON=
FIG_AUDIT=3Dy<br><br><br>In the build tree, kernel is not picking the above=
 config parameters and I was getting the following logs in the config_build=
_log which suggest that kernel doesn&#39;t like these config.<br><br>tmp/wo=
rk-shared/hgx/kernel-source/.kernel-meta/cfg/merge_config_build.log<br><br>=
Value requested for CONFIG_SECURITY_PATH not in final .config<br>Requested =
value: =C2=A0CONFIG_SECURITY_PATH=3Dy<br>CONFIG_SECURITY_PATH=3Dy<br>Actual=
 value:<br><br>Value requested for CONFIG_SECURITY_APPARMOR not in final .c=
onfig<br>Requested value: =C2=A0CONFIG_SECURITY_APPARMOR=3Dy<br>CONFIG_SECU=
RITY_APPARMOR=3Dy<br>Actual value:<br><br>Value requested for CONFIG_DEFAUL=
T_SECURITY not in final .config<br>Requested value: =C2=A0CONFIG_DEFAULT_SE=
CURITY=3D&quot;apparmor&quot;<br>CONFIG_DEFAULT_SECURITY=3D&quot;apparmor&q=
uot;<br>Actual value:<br><br>Value requested for CONFIG_SECURITY_APPARMOR_B=
OOTPARAM_VALUE not in final .config<br>Requested value: =C2=A0CONFIG_SECURI=
TY_APPARMOR_BOOTPARAM_VALUE=3D1<br>CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=
=3D1<br>Actual value:<br><br>Can somebody suggest me what I am missing here=
?<br><br>Ratan Gupta<br></div>

--000000000000006f0205c814c3f7--
