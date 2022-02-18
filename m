Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A904BD4F1
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 06:11:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K29Pw6p6Dz3bZg
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 16:11:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=BgKxH2bL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1131;
 helo=mail-yw1-x1131.google.com; envelope-from=gauravgandhi@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=BgKxH2bL; dkim-atps=neutral
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0pVr1r5Wz3Wtt
 for <openbmc@lists.ozlabs.org>; Sat, 19 Feb 2022 10:56:01 +1100 (AEDT)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2d641c31776so82605167b3.12
 for <openbmc@lists.ozlabs.org>; Fri, 18 Feb 2022 15:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=CkVOQCvDoCUfHGuUBl433hZT6KHa5BvCo97zPR5CdTM=;
 b=BgKxH2bLWIeTRwXwe0fN1yD089ytgxt0FsbfDiUrqSbnhyP+nPRxU46OxlVzBc9uNH
 K2ZjOWYgLDCSAX0g7IPLTVyiTJDQqeRS0OlHoF7nCZBwVVkpOJSDq4dytE6BhUkMsorz
 gXB5S0tbp/kgDvPi2Y+LhGQ/eIwBdhJzP2iGJpMFrIxad2wBZzn3Ye5mHVkos26fmkVq
 zlWX+2W88Tsb7P75ZZFAARr4ES1XqP6+e4vq0FUSROL8x1nigZ4HId8koTgyA0Dp8mvr
 lhYgKg1S0o6QA0gmC9A9ytSebekCJJ+v5HRz4inQAjIFRXnk8e6ROIgBd6Xyjq+P8/5B
 IzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=CkVOQCvDoCUfHGuUBl433hZT6KHa5BvCo97zPR5CdTM=;
 b=xMG927D4MoeC7Izn3oH70EtJ7tbo/VnFc8tClxRCwmqDnZWwHhFeEtQ0159PRj4ZH4
 5BzMJlWWwTRjlLx0N7koCnvTE2a9pTRM65LDIvuQCxHQYgXJ+ECiNiBY1Uopg9mFigvU
 282N5lB3TjukwuHcVEdO5RLQoVCzlY+czSek2Hk7kXel9c0/w83WfgeiAbmjI1K2ZC0T
 itTVqTvV7PfA/SrcijLxVXgQqf0lXjO8apl2scalDH4Xbn2Pbk9cdTG78w2B/zD6pbRN
 uc+tR+8bo9TlGbPYh1eo0gkGtOhx4hEahKw82BFVO7KOiy3qxdihFW5kWKvJVbu/bKLH
 NZbg==
X-Gm-Message-State: AOAM532tRPNdZtF28doiEQdsjeMzJ0417qt52hzWnva4b1izhxqGEH3m
 xfThGHxkpvWqVyKEm7c9f2NHJTX0vy67IVb7ndQhcSaf9ZmGQQ==
X-Google-Smtp-Source: ABdhPJzoBQl/vvG3V3VN4Hj2DgAWvqbnhWW4QbXLW33Hxrm0JwtiR+vmiAp93hTEGpxT+CrcjD8HmocLdh5cM+W0El8=
X-Received: by 2002:a81:9157:0:b0:2d1:3460:a359 with SMTP id
 i84-20020a819157000000b002d13460a359mr9921845ywg.20.1645228556824; Fri, 18
 Feb 2022 15:55:56 -0800 (PST)
MIME-Version: 1.0
From: Gaurav Gandhi <gauravgandhi@google.com>
Date: Fri, 18 Feb 2022 15:55:46 -0800
Message-ID: <CACxmPJM0b_rxoRfx5qBXSsjOXL2tZtLJSZ8+64ekwXEs9q01DQ@mail.gmail.com>
Subject: Supporting removing interfaces from settings daemon
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000b4945505d8539f88"
X-Mailman-Approved-At: Mon, 21 Feb 2022 16:10:35 +1100
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
Cc: anoo@us.ibm.com, deepak.kodihalli.83@gmail.com,
 Ed Tanous <edtanous@google.com>, geissonator@yahoo.com,
 Jason Ling <jasonling@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000b4945505d8539f88
Content-Type: text/plain; charset="UTF-8"

Hi All,

Currently DcmiHandler
<https://github.com/openbmc/phosphor-host-ipmid/blob/05d17c036facc0e9125959abe3c816aa631333e1/dcmihandler.cpp#L25>
in
phoshor-host-ipmid only supports the power_cap interface exported by
Settings <https://github.com/openbmc/phosphor-settingsd> daemon. To make it
generic we can use objectmapper here
<https://github.com/openbmc/phosphor-host-ipmid/blob/05d17c036facc0e9125959abe3c816aa631333e1/dcmihandler.cpp#L116>
to get all objects implementing power_cap interface.
But it poses a problem: which object to call when setting/getting the power
cap if multiple services are exporting objects implementing the power_cap
interface.
Also I think dcmi commands are supposed to set the power of the system and
it's not safe to set the system power using multiple services.
To avoid this we can make sure only 1 service exports this power_cap path
<https://github.com/openbmc/phosphor-host-ipmid/blob/05d17c036facc0e9125959abe3c816aa631333e1/dcmihandler.cpp#L25>
used by dcmi handler. But the settings daemon
<https://github.com/openbmc/phosphor-settingsd> always exports the power
cap interface by default. Currently there is provision to override default
settings using .override files. But I am not aware about any way to remove
a certain interface from settings daemon.
I am planning to add support for .remove.yml files in merge_settings
<https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phosphor/settings/phosphor-settings/merge_settings.py>
script
to remove interfaces along with overriding them.

Please share your thoughts on this. I have created this review
<https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/51394> for reference
-
Thanks,
Gaurav

--000000000000b4945505d8539f88
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>Hi All,</div><div><br></div><div>Curre=
ntly <a href=3D"https://github.com/openbmc/phosphor-host-ipmid/blob/05d17c0=
36facc0e9125959abe3c816aa631333e1/dcmihandler.cpp#L25">DcmiHandler</a>=C2=
=A0in phoshor-host-ipmid only supports the power_cap interface exported by =
<a href=3D"https://github.com/openbmc/phosphor-settingsd">Settings</a> daem=
on. To make it generic we can use objectmapper <a href=3D"https://github.co=
m/openbmc/phosphor-host-ipmid/blob/05d17c036facc0e9125959abe3c816aa631333e1=
/dcmihandler.cpp#L116">here</a> to get all objects implementing=C2=A0power_=
cap interface.=C2=A0</div><div>But it poses a problem: which object to call=
 when setting/getting the power cap if multiple services are exporting obje=
cts implementing the power_cap interface. <br>Also I think dcmi commands ar=
e supposed to set the power of the system and it&#39;s not safe to set the =
system power using multiple services.=C2=A0<br></div><div>To avoid this we =
can make sure only 1 service exports this power_cap <a href=3D"https://gith=
ub.com/openbmc/phosphor-host-ipmid/blob/05d17c036facc0e9125959abe3c816aa631=
333e1/dcmihandler.cpp#L25">path</a> used by dcmi handler. But the settings =
<a href=3D"https://github.com/openbmc/phosphor-settingsd">daemon</a> always=
 exports the power cap interface by default. Currently there is provision t=
o override default settings using .override files. But I am=C2=A0not aware =
about any way to remove a certain interface from=C2=A0settings daemon.</div=
>I am planning to add support for .remove.yml files in <a href=3D"https://g=
ithub.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phosphor/settin=
gs/phosphor-settings/merge_settings.py">merge_settings</a>=C2=A0script to r=
emove interfaces along with overriding them.<div><br>Please share your thou=
ghts on this. I have created this <a href=3D"https://gerrit.openbmc-project=
.xyz/c/openbmc/openbmc/+/51394">review</a> for reference<br><div>-<br></div=
><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_si=
gnature"><div dir=3D"ltr"><div>Thanks,<div>Gaurav</div></div></div></div></=
div></div></div>

--000000000000b4945505d8539f88--
