Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E031836C9CB
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 18:55:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FV7DV6RHXz301t
	for <lists+openbmc@lfdr.de>; Wed, 28 Apr 2021 02:55:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=AMyd60ET;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::433;
 helo=mail-wr1-x433.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=AMyd60ET; dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FV7DF3KPXz2xMw
 for <openbmc@lists.ozlabs.org>; Wed, 28 Apr 2021 02:55:06 +1000 (AEST)
Received: by mail-wr1-x433.google.com with SMTP id n2so7034359wrm.0
 for <openbmc@lists.ozlabs.org>; Tue, 27 Apr 2021 09:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KVBv7N3hWS7ublm3YPXYm8G8vk04NjTkPkuEITM0t1Y=;
 b=AMyd60ETq7QbqGFeLw4bX11ab4GgzRT5HsHLQwMhV6FgGScRUfuHTwrCAHglo3KiFm
 QzWjrbFmV1McKm4k4qN/IC9C6UW2d2FhY6/EuhOMRby44Txj9LzFjQYkfurLSp2XYBGI
 0hCccPW4tmJ3R9KjDU4XRhT8LQwCIhulv06kaxJX4g16qyUxKVy+eI9e4NwLDQRmMqUV
 HDlkt2jNStFRCLnP3un+rdY+DTlV/Wk4YtpA59D9nafndF8NdAPuEYSHUHDh9xxJ2ugG
 UOzMFOCrzAydrCLnjNVxl7CWXjAV57qq04LXBzKS+O0+C/0tCL9v1qdu4Un/x3ZScGrX
 mpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KVBv7N3hWS7ublm3YPXYm8G8vk04NjTkPkuEITM0t1Y=;
 b=p6CNojWPi3hFc4rNt2YlJI+UFcSLidQcAUVlouoVXvYtOQz4QYI9MRqmut7eYbs3nW
 3FoFaKvyIJtuFYvtAsvF/R7rwiDUk+QdoX5tXXzvO7uUA1TqMIVSwuX2XGvCtUOMooX5
 gZqPBbvp82EVjBRyh+QN/5f4YS8K/5T98Fi4KigUuipo283g2KQXGIPxTvPB9phPZPQb
 /aFZAd3L6aXZDCx+F9kLL+ADqGNfNr5thfTcJbWcz41QPv7d3sHcjZzxZnXxtXkUku5/
 uaROWr+PIjetZp47lZB60odl+Jo3D8RJTktbWbp7b8OPfYuRYIt/ciFy76ZjpcZ6pY3u
 JCug==
X-Gm-Message-State: AOAM530TjFp2D8KxYZu2vrB+Y3C/iM39c8RWdAmEy2qETKXsFFq20IP/
 djBElclkueX6Xrc7oheaeSIMz4nIPa9UOXHsJszByA==
X-Google-Smtp-Source: ABdhPJwm53BkPWnGXCeqQUxU3kv06nM31C8/z/vmZA2mUYyK15hchjMC5PmvoM1BceOfF2cwscWJxXBv+7YMDGSQ8MU=
X-Received: by 2002:adf:cf09:: with SMTP id o9mr30552164wrj.366.1619542500568; 
 Tue, 27 Apr 2021 09:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <SG2PR04MB30936A198A555EEBC1DBF78AE1429@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <35577f35-feff-c87f-9948-ccdb6986b6db@intel.com>
 <CAGm54UG=qMjxSSPtPMEmnAWADjcsroa5L4sCj5FGopso3ViKOA@mail.gmail.com>
In-Reply-To: <CAGm54UG=qMjxSSPtPMEmnAWADjcsroa5L4sCj5FGopso3ViKOA@mail.gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Tue, 27 Apr 2021 09:54:48 -0700
Message-ID: <CAH2-KxAdB0bPwoqf_tJB+hMzgSoJ34iJfy1-cwKumUPk=KkvkA@mail.gmail.com>
Subject: Re: Entity Manager error in tiogapass
To: Lei Yu <yulei.sh@bytedance.com>
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
 Jayashree D <jayashree-d@hcl.com>,
 Johnathan Mantey <johnathanx.mantey@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Apr 26, 2021 at 7:23 PM Lei Yu <yulei.sh@bytedance.com> wrote:
>
> On Tue, Apr 27, 2021 at 12:35 AM Johnathan Mantey
> <johnathanx.mantey@intel.com> wrote:
> >
> > Jayashree,
> >
> > On 4/26/21 9:00 AM, Jayashree D wrote:
> > >
> > > Classification: *Confidential*
> > >
> > > Hi Team,
> > >
> > > In the latest build, I am facing the below issue in Entity Manager fo=
r
> > > tiogapass.
> > >
> > > Already issue has been created in Entity Manager Repo - entity-manage=
r
> > > terminated by 'std::filesystem::__cxx11::filesystem_error' =C2=B7 Iss=
ue #8
> > > =C2=B7 openbmc/entity-manager (github.com)
> > > <https://github.com/openbmc/entity-manager/issues/8>
> > >
> > > root@tiogapass:~# systemctl status
> > > xyz.openbmc_project.EntityManager.service -l
> > >
> > > =E2=97=8F xyz.openbmc_project.EntityManager.service - Entity Manager
> > >
> > >      Loaded: loaded
> > > (]8;;file://tiogapass/lib/systemd/system/xyz.openbmc_project.EntityMa=
nager.service/lib/systemd/system/xyz.openbmc_project.EntityManager.service]=
8;;;
> > > enabled; vendor preset: enabled)
> > >
> > >      Active: active (running) since Thu 1970-01-01 00:04:10 UTC; 25s =
ago
> > >
> > >     Process: 851 ExecStartPre=3D/bin/mkdir -p /var/configuration
> > > (code=3Dexited, status=3D0/SUCCESS)
> > >
> > >     Process: 852 ExecStartPre=3D/bin/mkdir -p /tmp/overlays
> > > (code=3Dexited, status=3D0/SUCCESS)
> > >
> > >    Main PID: 853 (entity-manager)
> > >
> > >      CGroup: /system.slice/xyz.openbmc_project.EntityManager.service
> > >
> > >              =E2=94=94=E2=94=80853 /usr/bin/entity-manager
> > >
> > > Jan 01 00:04:09 tiogapass systemd[1]: Starting Entity Manager...
> > >
> > > Jan 01 00:04:10 tiogapass systemd[1]: Started Entity Manager.
> > >
> > > Jan 01 00:04:27 tiogapass entity-manager[853]: Inventory Added
> > >
> > > Jan 01 00:04:27 tiogapass entity-manager[853]: terminate called after
> > > throwing an instance of 'std::filesystem::__cxx11::filesystem_error'
> > >
> > > Jan 01 00:04:27 tiogapass entity-manager[853]:   what():  filesystem
> > > error: recursive directory iterator cannot open directory: No such
> > > file or directory [/sys/bus/i2c/devices/i2c-16]
> > >
> >
> > Check this portion of src/Overlay.cpp
> > static bool deviceIsCreated(const std::string& devicePath,
> >                              std::shared_ptr<uint64_t> bus,
> >                              std::shared_ptr<uint64_t> address,
> >                              const bool retrying)
> >
> > I placed a comment describing the intent of the directory iterator. I
> > have not seen the issue described on our systems, nor in QEMU (reported
> > by another dev), so I'm not able to identify the issue.
>
> The issue is reported at
> https://github.com/openbmc/entity-manager/issues/8, and the commit
> that introduces the issue is
> https://github.com/openbmc/entity-manager/commit/9b86787adea3f8f29fac2acb=
b9fa0f48fbcf244a
>
> Could you kindly investigate the exception and see how to make it not cra=
sh?

It sounds like Jonathan isn't able to reproduce.  Do you think you
could capture the full stack trace from the exception?  Do you have
anything odd on your systems that would cause the differing behavior?

>
> --
> BRs,
> Lei YU
