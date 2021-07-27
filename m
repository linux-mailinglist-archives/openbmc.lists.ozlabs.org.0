Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAF23D6EDD
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 08:11:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYmdt2RPzz3bWQ
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 16:11:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=TOanCZ+6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::633;
 helo=mail-ej1-x633.google.com; envelope-from=ratankgupta31@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TOanCZ+6; dkim-atps=neutral
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYmdK5bSKz30QG
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jul 2021 16:11:16 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id o5so20386624ejy.2
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jul 2021 23:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=z2geAxQQZjHNdjg8Xf9U/+2X5AQAbrWjLVQKQEJQT0s=;
 b=TOanCZ+6Z/A3WFRauLzwvNmg2gVKnb3oVYd7g+uOpwpoyw37Ih99GwGR5zBdVbXFSd
 2adSYnJzQOaeH+OJ/6LNhjG0IKRPaa4oeJ+IobR9rvuuHbDv3S42WgAtg00nBFKmTa20
 lTrhBoJ7+nYNKWd360FgRTQxa/MBn8NOBOMi1QBc7IskCtWg2CbToYc8mFz0a/0fa24c
 7hvK3XDXlFQACjk2OrSAL2vowotjHlBNgfdRcOxFKPi1uPBJy4uqddJDny99qRCe1V/x
 dLHBW/OFP2vx0esrJ93b4zJLHGL2h/wpa+V8/IqJfcuG9LaoP9NXXFZ6iqX6+KGkQfnc
 EQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=z2geAxQQZjHNdjg8Xf9U/+2X5AQAbrWjLVQKQEJQT0s=;
 b=guHabMd7jASaDFmhmtwqTR32JF51UCe1xMDReTMzT/DPCLsdA0N2ViHQXbudlFOhjo
 K/N01avBhEPftjA1ZDPvkuko27CRxq9FTpZUoGZlT1vWi4Yt2W1kR6KDjcxQ8D3B4m4v
 fG4IoOff3neGQWqIsSehUWogLVPZkCv8ulAAbqSBaFxUNqlV8+1NOnm4zLSOwfEOROMl
 Zzu/LXxlZbHv7GW8ANU5lN5kuZnul6Xp/M7385OkwgGn7wCjfJfyZgepcFsFt4u4cOlk
 ywoHwjdDS17pbc1Nt7mpQQBD+MeAgQJdfvodrOlHMqdjWro+EZpY38I4KtLQOeZUMDDu
 Kncw==
X-Gm-Message-State: AOAM5315+gLR6wXm0tdBTiVFb5xmMbxVXBqLcis5sJi6zGtXKDP4Tbu/
 1kbRJBSjkd+tS3lTktjphJ7KY2XqvN727BDBd+fE4PWsr9Q=
X-Google-Smtp-Source: ABdhPJxGPZg9AJv1syLss3/M/PbYEOuwX3dwQ3MSzVEC8rpEhHV69CuW1EdwQOO036R27b/MCvvZnQaJdLBYhuNAzCI=
X-Received: by 2002:a17:906:eb99:: with SMTP id
 mh25mr20624881ejb.330.1627366272522; 
 Mon, 26 Jul 2021 23:11:12 -0700 (PDT)
MIME-Version: 1.0
From: Ratan Gupta <ratankgupta31@gmail.com>
Date: Tue, 27 Jul 2021 11:41:01 +0530
Message-ID: <CAMhqiMqOrSTe2Na4GNPAn7UMV0XifOs9J7S8iJB=+fhuPgL1Qw@mail.gmail.com>
Subject: apparmor support
To: joel@jms.id.au, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000097de8c05c814bca8"
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

--00000000000097de8c05c814bca8
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


*CONFIG_SECURITY_APPARMOR=yCONFIG_DEFAULT_SECURITY="apparmor"CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=1*
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

--00000000000097de8c05c814bca8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All, <br><br>I was trying to pull apparmor in openbmc, =
all the user space application got pulled however I was unable to build the=
 kernel with apparmor support.<div><br>I made the following kernel configur=
ation to include the apparmor( <a href=3D"https://github.com/openbmc/linux/=
blob/dev-5.10/Documentation/admin-guide/LSM/apparmor.rst">https://github.co=
m/openbmc/linux/blob/dev-5.10/Documentation/admin-guide/LSM/apparmor.rst</a=
>)</div><div><br>CONFIG_SECURITYFS=3Dy<br>CONFIG_SECURITY_NETWORK=3Dy<br>CO=
NFIG_SECURITY_PATH=3Dy<br><b>CONFIG_SECURITY_APPARMOR=3Dy<br>CONFIG_DEFAULT=
_SECURITY=3D&quot;apparmor&quot;<br>CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALU=
E=3D1</b><br>CONFIG_AUDIT=3Dy<br><div><br></div><div><br></div><div>In the =
build tree, kernel is not picking the above config parameters and I was get=
ting the following logs in the config_build_log which suggest that kernel d=
oesn&#39;t like these config.</div><div><br></div><div>tmp/work-shared/hgx/=
kernel-source/.kernel-meta/cfg/merge_config_build.log<br></div><div><br></d=
iv>Value requested for CONFIG_SECURITY_PATH not in final .config<br>Request=
ed value: =C2=A0CONFIG_SECURITY_PATH=3Dy<br>CONFIG_SECURITY_PATH=3Dy<br>Act=
ual value:<br><br>Value requested for CONFIG_SECURITY_APPARMOR not in final=
 .config<br>Requested value: =C2=A0CONFIG_SECURITY_APPARMOR=3Dy<br>CONFIG_S=
ECURITY_APPARMOR=3Dy<br>Actual value:<br><br>Value requested for CONFIG_DEF=
AULT_SECURITY not in final .config<br>Requested value: =C2=A0CONFIG_DEFAULT=
_SECURITY=3D&quot;apparmor&quot;<br>CONFIG_DEFAULT_SECURITY=3D&quot;apparmo=
r&quot;<br>Actual value:<br><br>Value requested for CONFIG_SECURITY_APPARMO=
R_BOOTPARAM_VALUE not in final .config<br>Requested value: =C2=A0CONFIG_SEC=
URITY_APPARMOR_BOOTPARAM_VALUE=3D1<br>CONFIG_SECURITY_APPARMOR_BOOTPARAM_VA=
LUE=3D1<br>Actual value:<br><div><div><br></div></div></div><div>Can somebo=
dy suggest me what I am missing here?</div><div><br></div><div>Ratan Gupta<=
/div></div>

--00000000000097de8c05c814bca8--
