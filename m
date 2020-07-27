Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF5022FC9C
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 01:07:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFwSV751JzDqnW
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 09:07:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::335;
 helo=mail-ot1-x335.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Yf1CdVVc; dkim-atps=neutral
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFwR6528vzDr3f
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2020 09:06:26 +1000 (AEST)
Received: by mail-ot1-x335.google.com with SMTP id l27so6419994oti.3
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jul 2020 16:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=Ef7PeSak4RjbxgXlWZgE/NAieG2ts2xx4hLnqKSBKnE=;
 b=Yf1CdVVcxIk8PKdUw9gZcIi5C2uVbDc1NWONxLYR5KzwXhutJXqc1hOwzttlS82vfS
 eHwFvIzbm2HsPOsynFSOKxdc9AmvKHzURQx3I1hiNAxfl+mFh6whpxOtLmGxDUpgC0ud
 eDH4tcEPOPx6hlOHfNG33z9bltpPod4ApcZ/3OYKwJF1HEvasYQ8/x7VSm0TBMa8puqB
 vU075wS6/qp4YSN6+OjD7Eikk6oaWli8FgC8I3j+gy9zqTdXicEyAq0iTSzonm3l1HmW
 DlUHHuihMyB9fmGnY16FyA9lq219UhRd6MX7pvR3vwSyPWvPI4PgIVq9hIBrCWZ2LHzR
 R3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=Ef7PeSak4RjbxgXlWZgE/NAieG2ts2xx4hLnqKSBKnE=;
 b=hrbI799fT1qyibSx6KV+CCNXqahkCfWV8tjaaeaDz/9D6p2nZZgleg/CqxJptqbNXH
 WmKLdGO+JgmR64QE8lW+ssG05CdLx5QBS/KjEskN2/1F2xV8Vflu7zzp3v8QNggUwLbh
 yEgMHyuv6iA8QAW6vDs5QpsvCQY9LiICR0ySlnf1oMcgNo8j7LKgvhw2YfjxbzbfL+dC
 fb0xXZwTE3lkECrDRRCN2DyX4EPbv/e5ekDoRz5O8Msv3LyjqHL+9CczZP7Ud1MgVd0y
 LO+nxHZeRfctyO7xrqsc/EoO5ukB89UY2s9+afnJnTZGHRu19gqzVtX/SkMptZKHXiK5
 8bMA==
X-Gm-Message-State: AOAM531agmvmezHQmtaD/ZtUbZY6V9mlHSfRLSm+vy19RbcKBS7ZcViN
 tq2Rm8h5zrz0puX95LZhnluzZIhgt94=
X-Google-Smtp-Source: ABdhPJwjtmljdvbDg8TS23mQpsExm+3mrIqd/ArKnYDywQVazv16gTPA7G1ND8OIn03GtvJor/ZMzA==
X-Received: by 2002:a9d:66c5:: with SMTP id t5mr4655619otm.209.1595891182222; 
 Mon, 27 Jul 2020 16:06:22 -0700 (PDT)
Received: from ?IPv6:2601:281:c001:2359:cc50:b41f:e560:cea8?
 ([2601:281:c001:2359:cc50:b41f:e560:cea8])
 by smtp.gmail.com with ESMTPSA id y67sm2340853oig.46.2020.07.27.16.06.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2020 16:06:21 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mike <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Infinite redirect.
Date: Mon, 27 Jul 2020 17:06:20 -0600
Message-Id: <1C79F0BF-0B03-4BED-92B2-56CB1C9B75DD@gmail.com>
References: <CACWQX81_jq5asAMmiU-WCN1xsUDUpGL9DQtw5MuKSiq2q5GEPQ@mail.gmail.com>
In-Reply-To: <CACWQX81_jq5asAMmiU-WCN1xsUDUpGL9DQtw5MuKSiq2q5GEPQ@mail.gmail.com>
To: Ed Tanous <ed@tanous.net>
X-Mailer: iPhone Mail (17F80)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Ed,

That fixed it.

Committed to the repo below.

Still fails to start the service without /var/log/redfish

Adding -DBMCWEB_ENABLE_REDFISH_DBUS_LOG=3DON will fix it. Otherwise someone m=
ight consider modifying event_service_manager.hpp to create the file when mi=
ssing.

 I still can=E2=80=99t l ssh to port 2200, but my goal is to add pmbus senso=
rs and the webui will do for that.

Anyone that wants to get raspberrypi4 running can use the repo below and it=E2=
=80=99s Readme. It will get it compiled and the webui up. Mainly is just wor=
king config files and a readme with every command I used including making th=
e image.

Sent from my iPhone

> On Jul 27, 2020, at 1:09 PM, Ed Tanous <ed@tanous.net> wrote:
>=20
> =EF=BB=BFOn Mon, Jul 27, 2020 at 12:03 PM Mike Jones <proclivis@gmail.com>=
 wrote:
>>=20
>> I need help debugging an infinite redirect.
>=20
> Without reading the rest of your email, there is a 95% chance that
> this means you didn't include phosphor-webui component in your build.
> It is a known "bug" that has bit several people, and I've been meaning
> to fix it so it at least gives you some better error and/or at least
> doesn't redirect, but architecturally it breaks some weird boundaries
> a little bit (the login routes have to be aware of which other routes
> have been registered, which imposes an unintended ordering on the
> route handler) , and I've just never had the chance.
>=20
>>=20
>> Using tag 2.8.0
>>=20
>> I built meta-phosphor with raspberrypi4. See https://github.com/Proclivis=
/conf-meta-rasberrypi-evb.git
>>=20
>> I setup a host entry on my ubuntu laptop in /etc/hosts
>>=20
>> 10.0.1.72 bmc
>>=20
>> Then with firefox use url
>>=20
>> https://bmc:18080
>>=20
>> I get a redirect to
>>=20
>> https://bmc:18080/#/login?next=3D%2F
>>=20
>> Which also redirects again.
>>=20
>> bmcweb is not sending a cookie on the first request.
>=20
> Nor should it.  You're not logged in yet, nor have you given valid
> login credentials.  The redirect is trying to move you to the webui,
> which can then present a pretty login screen.  Unfortunately the webui
> doesn't exist, so you hit another redirect.
>=20
>>=20
>> On the target, token_authorization_middleware.hpp:187 is failing the cook=
ie authorization, probably because Firefox is not sending back the cookie it=
 never received.
>>=20
>> There are two failed services not running:
>>=20
>> obmc-phosphor-sysd.service
>> start-ipkvm-.service
>=20
> Those should be irrelevant to this issue.
>=20
>>=20
>> I assume these would not interfere with something as basic as cookies.
>>=20
>> Is there something I need to configure on the target?
>=20
> See above.
