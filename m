Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB89C36BD3F
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 04:23:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FTltd5m9zz2yyK
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 12:23:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=Rk+x8e8I;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::336;
 helo=mail-ot1-x336.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Rk+x8e8I; dkim-atps=neutral
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FTltN3YKlz2xYp
 for <openbmc@lists.ozlabs.org>; Tue, 27 Apr 2021 12:23:23 +1000 (AEST)
Received: by mail-ot1-x336.google.com with SMTP id
 z20-20020a0568301294b02902a52ecbaf18so1675465otp.8
 for <openbmc@lists.ozlabs.org>; Mon, 26 Apr 2021 19:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yOLSbzNiBnesilsxW/tAqdmFJfYgs1VW2Ej6f0dMIXw=;
 b=Rk+x8e8IJNMPm4DwKnbC5HX46T/iX+jZfsayu5YmW3LAedSzrq3pnZTP+eEeUpjq3G
 o7F2BlxwrN+3WD4j27hCCYtXggbWIWmyRoQfp9sLSMcf16FEscr9bG8Rp54sAFxMJnPe
 /06G86No+1jJEX2PRunsU8OKhDUnDkK1XzB5e0y2W78YfG6Eif4t3BogfId0g4GIIj8f
 jbp62KPE0QJlox+1lKCeEf0XwDOMSsNuTAsHvl0+j4DuKSEmO+jSYT40NldE+Es9MVUv
 lUDN69j2yRdHoHb9Z3uvydpHwycFAFSGlH9PY5YGEycdZWyzr2YKRtJ+9wcee2KtQtS9
 PVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yOLSbzNiBnesilsxW/tAqdmFJfYgs1VW2Ej6f0dMIXw=;
 b=X11bpd/DMW8G72tklZws9QVkrzPON3UZ3h6fdArpN6WYL3wc9KBKt8lmOErN2P6Oy7
 3bJ+7cGjTBCpkLfY1FRRQQ9hX2JVEknohU+U12pcCggR234Il0B25g6qsEa33XX8Z3bn
 C1SB+8ljdopqoMZys0LKxrWSb3LSIuJcM/Tf+rptt8ezHAepHJ/fakcPmlfatRbkq0n4
 6oWX3yL25/XOKRkn0QWH5B+Ainwkqa64IFXcoY6YbRajSXBy5Tt0vuoLF1iVq4co5xXN
 ws/ZLSYN+/K+cTGZnRuTPx0TiAIcHl9hb9KYUADK0tqBvdbStLOGLyjlsLQx5LP5RdOd
 lrsA==
X-Gm-Message-State: AOAM533LvoGLUx/yvoDym0vfP2pJtftm5f9ZrG8XECoSMuNKqTfiYPMB
 7Z73pmAFd8pUxN++/VrVOwGzF2uavENVtEWXNFDy5Q==
X-Google-Smtp-Source: ABdhPJySEvnyTS6MbfLBmI4d/NuFzzfddq86bNIWtYb/bk4jfsmrDwKuPCUC7ZzsCAf9+6uzp+31hIGwM4IscD/iBSg=
X-Received: by 2002:a9d:4f03:: with SMTP id d3mr7272369otl.361.1619490198142; 
 Mon, 26 Apr 2021 19:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <SG2PR04MB30936A198A555EEBC1DBF78AE1429@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <35577f35-feff-c87f-9948-ccdb6986b6db@intel.com>
In-Reply-To: <35577f35-feff-c87f-9948-ccdb6986b6db@intel.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Tue, 27 Apr 2021 10:23:07 +0800
Message-ID: <CAGm54UG=qMjxSSPtPMEmnAWADjcsroa5L4sCj5FGopso3ViKOA@mail.gmail.com>
Subject: Re: Entity Manager error in tiogapass
To: Johnathan Mantey <johnathanx.mantey@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Jayashree D <jayashree-d@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Apr 27, 2021 at 12:35 AM Johnathan Mantey
<johnathanx.mantey@intel.com> wrote:
>
> Jayashree,
>
> On 4/26/21 9:00 AM, Jayashree D wrote:
> >
> > Classification: *Confidential*
> >
> > Hi Team,
> >
> > In the latest build, I am facing the below issue in Entity Manager for
> > tiogapass.
> >
> > Already issue has been created in Entity Manager Repo - entity-manager
> > terminated by 'std::filesystem::__cxx11::filesystem_error' =C2=B7 Issue=
 #8
> > =C2=B7 openbmc/entity-manager (github.com)
> > <https://github.com/openbmc/entity-manager/issues/8>
> >
> > root@tiogapass:~# systemctl status
> > xyz.openbmc_project.EntityManager.service -l
> >
> > =E2=97=8F xyz.openbmc_project.EntityManager.service - Entity Manager
> >
> >      Loaded: loaded
> > (]8;;file://tiogapass/lib/systemd/system/xyz.openbmc_project.EntityMana=
ger.service/lib/systemd/system/xyz.openbmc_project.EntityManager.service]8;=
;;
> > enabled; vendor preset: enabled)
> >
> >      Active: active (running) since Thu 1970-01-01 00:04:10 UTC; 25s ag=
o
> >
> >     Process: 851 ExecStartPre=3D/bin/mkdir -p /var/configuration
> > (code=3Dexited, status=3D0/SUCCESS)
> >
> >     Process: 852 ExecStartPre=3D/bin/mkdir -p /tmp/overlays
> > (code=3Dexited, status=3D0/SUCCESS)
> >
> >    Main PID: 853 (entity-manager)
> >
> >      CGroup: /system.slice/xyz.openbmc_project.EntityManager.service
> >
> >              =E2=94=94=E2=94=80853 /usr/bin/entity-manager
> >
> > Jan 01 00:04:09 tiogapass systemd[1]: Starting Entity Manager...
> >
> > Jan 01 00:04:10 tiogapass systemd[1]: Started Entity Manager.
> >
> > Jan 01 00:04:27 tiogapass entity-manager[853]: Inventory Added
> >
> > Jan 01 00:04:27 tiogapass entity-manager[853]: terminate called after
> > throwing an instance of 'std::filesystem::__cxx11::filesystem_error'
> >
> > Jan 01 00:04:27 tiogapass entity-manager[853]:   what():  filesystem
> > error: recursive directory iterator cannot open directory: No such
> > file or directory [/sys/bus/i2c/devices/i2c-16]
> >
>
> Check this portion of src/Overlay.cpp
> static bool deviceIsCreated(const std::string& devicePath,
>                              std::shared_ptr<uint64_t> bus,
>                              std::shared_ptr<uint64_t> address,
>                              const bool retrying)
>
> I placed a comment describing the intent of the directory iterator. I
> have not seen the issue described on our systems, nor in QEMU (reported
> by another dev), so I'm not able to identify the issue.

The issue is reported at
https://github.com/openbmc/entity-manager/issues/8, and the commit
that introduces the issue is
https://github.com/openbmc/entity-manager/commit/9b86787adea3f8f29fac2acbb9=
fa0f48fbcf244a

Could you kindly investigate the exception and see how to make it not crash=
?

--=20
BRs,
Lei YU
