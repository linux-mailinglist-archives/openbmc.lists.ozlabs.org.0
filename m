Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BA83B13FA
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 08:32:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8tjT5kvjz3073
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 16:32:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=aATIkR9i;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::631;
 helo=mail-ej1-x631.google.com; envelope-from=ratankgupta31@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aATIkR9i; dkim-atps=neutral
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8tjD1btnz2yXW
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jun 2021 16:32:13 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id nd37so2260113ejc.3
 for <openbmc@lists.ozlabs.org>; Tue, 22 Jun 2021 23:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=LIWiKlrEp/sh2abESUDZberN6GGhD3s9rlYMfsnLOGU=;
 b=aATIkR9i9kqgQwNqdTY7MbPkoZUXamlUarpGM0fFxvaXjotdTnNuQufeV5sh4qUuh3
 k2M+4mATTTTCf1nY3s7FyW28g8hRSxzfzbNBhosblvvhVGafHNFrjUo0v+Pvyw0vzh9D
 u8ocBRPQFlb8AQMYzPfKdRgY36yZkXWUeIwM8QFcDtzAdHhh+4zzfA3iylLXgs09H3zf
 CwLnKtzsLFhErYY2QSoQSbGVDvzPjCF1I31hz9y2aUdEN/+y7/joM37GiAwa9BTUIC7f
 LOCYiYRtqv7x6+hc2+2pbVcdcrbzbzhAtPLHdd3PtPZ8Nw4H6kTYmhNrXWyvLUhMLixc
 +gWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=LIWiKlrEp/sh2abESUDZberN6GGhD3s9rlYMfsnLOGU=;
 b=uOAq4zlLXmzGy1zBx8HhSv7U+Tg3qP41PzfBlrPcR2OfGkmtG29AqPCLu10HWlXhtv
 pcwEvWA6rtVGhEAIRI7nyw4Jwlv3mbNr34XtfXS+YHWT3uH3dMYZ0sId3CfWEjxTOIax
 /CXVxuU33AFGu3Ag8zeMiMqrmhRnWJVR+6yIyaRskacB+PtSoW85VEiqRlXYyrKtfsPa
 bkDoCKRqu4qUd8xEv4PfQ8wlZCzlTK1ck0D5fcLK/4nxsk3lc2LpWNVa7FGTdAdWIEcB
 pONLZMQfWCK5cI06QgLix9iQb1KpV/xHCilW31XYGkJumIEAjPRuZv2N6eizhGCQndHb
 f83Q==
X-Gm-Message-State: AOAM531mwFy9liZdrmyzLHLWY2yrEQCh10uuJ9UYOI/73enMbtcW6Fxt
 5+sMfOIIJkDFXwZSbko9BnGVFWQ7IKcOi0tmA4dz67SCsfU=
X-Google-Smtp-Source: ABdhPJyBCszhhlIW9zCfPpUsGHIwW5eV2OrkYNON4uMafhWNNCffW26093G7XjEMMuk4hpjyF5PEpmWI2XdI7bIrwtI=
X-Received: by 2002:a17:906:b0cb:: with SMTP id
 bk11mr8447442ejb.310.1624429927196; 
 Tue, 22 Jun 2021 23:32:07 -0700 (PDT)
MIME-Version: 1.0
From: Ratan Gupta <ratankgupta31@gmail.com>
Date: Wed, 23 Jun 2021 12:01:56 +0530
Message-ID: <CAMhqiMpbgutVgmQXBuDBRe2NUCg0280H34cwJcbcOcUMDNUsKA@mail.gmail.com>
Subject: SELinux support
To: openbmc@lists.ozlabs.org, rnouse@google.com, rli11@lenovo.com
Content-Type: multipart/alternative; boundary="000000000000c5ed2105c5691078"
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

--000000000000c5ed2105c5691078
Content-Type: text/plain; charset="UTF-8"

Hi Team,

I was working on supporting selinux on openbmc stack, I was able to create
the image with selinux.
root@test:~# sestatus
SELinux status:                 enabled
SELinuxfs mount:                /sys/fs/selinux
SELinux root directory:         /etc/selinux
Loaded policy name:             mls (also tried targeted and minimum)
Current mode:                   permissive
Mode from config file:          permissive
Policy MLS status:              enabled
Policy deny_unknown status:     allowed
Memory protection checking:     actual (secure)
Max kernel policy version:      33

While I am creating the selinux user, I am getting the following error from
the libsemanage.
root@abc:~# useradd -G wheel -Z sysadm_u test_se

[libsemanage]: Error while renaming /var/lib/selinux/minimum/active to
/var/lib/selinux/minimum/previous.
Cannot commit SELinux transaction
useradd: warning: the user name test_se to sysadm_u SELinux user mapping
failed.

During building of the selinux :  I have used the refpolicy as minimum and
added the selinux package (selinux-minimal) in the openbmc image
(
http://git.yoctoproject.org/cgit/cgit.cgi/meta-selinux/tree/recipes-security/refpolicy/refpolicy-minimum_git.bb
)
(
http://git.yoctoproject.org/cgit/cgit.cgi/meta-selinux/tree/recipes-security/packagegroups/packagegroup-selinux-minimal.bb
)

Did anybody try creating the selinux user?
I have seen that Anton and Ivan were working on that, Did you also face
this issue? If not, Can you suggest what I am missing?

Regards
Ratan Gupta

--000000000000c5ed2105c5691078
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Team,<br><br>I was working on supporting selinux on ope=
nbmc stack, I was able to create the image with selinux.<br>root@test:~# se=
status<br>SELinux status: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 enabled<br>SELinuxfs mount: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/sys/fs/selinux<br>SELinux root directory: =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /etc/selinux<br>Loaded policy name: =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 mls (also tried targeted and minimum)<br>Current mode: =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 permissive<b=
r>Mode from config file: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0permissive<br>Po=
licy MLS status: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enabled<br=
>Policy deny_unknown status: =C2=A0 =C2=A0 allowed<br>Memory protection che=
cking: =C2=A0 =C2=A0 actual (secure)<br>Max kernel policy version: =C2=A0 =
=C2=A0 =C2=A033<br><br>While I am creating the selinux user, I am getting t=
he following error from the libsemanage.<br>root@abc:~# useradd -G wheel -Z=
 sysadm_u test_se =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br><br>[libsemanage]: Error while=
 renaming /var/lib/selinux/minimum/active to /var/lib/selinux/minimum/previ=
ous.<br>Cannot commit SELinux transaction<br>useradd: warning: the user nam=
e test_se to sysadm_u SELinux user mapping failed.<br><br>During building o=
f the selinux : =C2=A0I have used the refpolicy as minimum and added the se=
linux package (selinux-minimal) in the openbmc image<br>(<a href=3D"http://=
git.yoctoproject.org/cgit/cgit.cgi/meta-selinux/tree/recipes-security/refpo=
licy/refpolicy-minimum_git.bb">http://git.yoctoproject.org/cgit/cgit.cgi/me=
ta-selinux/tree/recipes-security/refpolicy/refpolicy-minimum_git.bb</a>)<br=
>(<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-selinux/tree/re=
cipes-security/packagegroups/packagegroup-selinux-minimal.bb">http://git.yo=
ctoproject.org/cgit/cgit.cgi/meta-selinux/tree/recipes-security/packagegrou=
ps/packagegroup-selinux-minimal.bb</a>)<br><br>Did anybody try creating the=
 selinux user?<br>I have seen that Anton and Ivan were working on that, Did=
 you also face this issue? If not, Can you suggest what I am missing?<br><b=
r>Regards<br>Ratan Gupta</div>

--000000000000c5ed2105c5691078--
