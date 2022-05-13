Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CFF5262ED
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 15:19:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L08Pl6DRVz3cBt
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 23:19:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pzvoBx+3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::736;
 helo=mail-qk1-x736.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pzvoBx+3; dkim-atps=neutral
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L08PJ0kCWz2xrZ
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2022 23:19:15 +1000 (AEST)
Received: by mail-qk1-x736.google.com with SMTP id m1so6994303qkn.10
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2022 06:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=cB/SWGaqPb7fcgbEjqaLbbeGTvHdaM99nOXjzjSql34=;
 b=pzvoBx+3WYsGjw5RAwj9xNaasv8H6kUQKRDOKMfgHMHgPir/AvMXWOXvdmfmHMvoho
 dv6nlmMdbqXDQFkn+XguZyAHpob/Zej0crn7mO/kLTA4IrqmOwOyQhs5/MKGDKPvLYMJ
 8TON4Sl30IUceaiwH/6yXmrzaAQWD0zLOLz4FHtmxRHfsGmrUmH21e0VRuQAGr7D6sIh
 rExjrkph/H9XTIZ40M9bg0rIYU7/JDnRhyjfBlD6TPP5UDdoTWXmXq7SnDy2fUiU7tzd
 QFodrEnzw0K4nXqsUpxd7sHstAt2w3l+I/2cCrXTDBdcQTt3h9onx2oMjtprLzdSHwxG
 Ad/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=cB/SWGaqPb7fcgbEjqaLbbeGTvHdaM99nOXjzjSql34=;
 b=zHdzRgTKmPhPoozNXd/+j+IDJdxPRCjhpTWaShhVuh4lh7+hO9Q6Odk96D6pE0ypk+
 CcPLSi19FX111r4hWfHqklAwPxzfaPU7iQZcDEC2EKHl6Kqe7a84svvNvQ3urzm/jXTZ
 B9ZcQAcCZkzJJK4mrXQ5TLt3IyKCGHarLow+dtJmV2qJ50DB6T+6CYJrK7pVFAlR255o
 Pfj0fq66NhXuOUlvDshQC6uqO+bLEYQPYgHoPBBj/xCrR0ku+dDusfKvxmXyGB7UD89q
 SDPNrTupz08nBZLg1jzMCTaYZoyfR4bHhanGbmjAakotaH3n2xAf0br96wwWMFV1cddD
 mzug==
X-Gm-Message-State: AOAM5311uWiG0pTsY603MalYgecPKQ7vNsRQ7TBIXvuVgMIho2uhxRR3
 TUaT36DTzKcopR+qHdedBNA=
X-Google-Smtp-Source: ABdhPJz0YzAZ2IF2QqtfxSD8uOo1+BqZyljP39XiOtUxRVVgAOEE7m+yY2AqlIHNVpqrAQMAEJ1U8g==
X-Received: by 2002:a37:6843:0:b0:6a0:e50b:520 with SMTP id
 d64-20020a376843000000b006a0e50b0520mr3519374qkc.88.1652447950073; 
 Fri, 13 May 2022 06:19:10 -0700 (PDT)
Received: from smtpclient.apple (wsip-70-184-161-145.hr.hr.cox.net.
 [70.184.161.145]) by smtp.gmail.com with ESMTPSA id
 d81-20020a379b54000000b006a10aa7908dsm1180546qke.38.2022.05.13.06.19.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 May 2022 06:19:08 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: preventing chassis power-on until bmc Ready
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <CAPnigK=-OiqwEgoFtHazscEQzboSpseDNyvVJk41VxLJiKaUkw@mail.gmail.com>
Date: Fri, 13 May 2022 09:19:07 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <3603FF65-D8A7-46E3-8D8A-9C5B2DC97656@gmail.com>
References: <FE2B7C36-070C-4DCF-84C0-FB3A53EC0837@gmail.com>
 <CAPnigK=-OiqwEgoFtHazscEQzboSpseDNyvVJk41VxLJiKaUkw@mail.gmail.com>
To: William Kennington <wak@google.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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



> On Apr 19, 2022, at 5:30 PM, William Kennington <wak@google.com> =
wrote:
>=20
> I don't really like using multi-user.target to order host startup
> because we may have lots of optional or non-critical services that
> take a long time to become ready that just end up delaying the boot
> time of the server (which is a critical amount of time to reduce for
> our usecase).

Yep, I agree, if you only have a few critical services needed to boot,
waiting on multi-user.target is very inefficient.


> I can also see how different platforms probably have
> different definitions of "critical" components based on what the
> bootup firmware ends up querying the BMC for. But having some kind of
> unit we can opt-in to ordering services against may be useful as we
> have our own targets for this purpose on google BMCs.

Yeah, I like this. An optional opt-in unit that systems owners can put =
their
services against.=20

I took a first stab at a design up at:
  https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/53723=20

>=20
> On Tue, Apr 19, 2022 at 2:03 PM Andrew Geissler =
<geissonator@gmail.com> wrote:
>>=20
>> Greetings,
>>=20
>> We at IBM have been finding cases where we wrote our services in a =
way that they
>> assume the BMC has reached "Ready" state prior to a chassis power on =
and host
>> firmware boot being allowed to start. For example, to power on the =
chassis, you
>> need to have collected all of the vpd associated with the VRM's and =
power
>> supplies. This vpd collection occurs on the way to BMC Ready, and =
services
>> in the power on target assume it's all been collected. We have other =
scenarios
>> like this and we're wondering if we continue to whack-a-mole by =
fixing
>> these individually with explicit service dependencies or do something =
a bit
>> more global to ensure our systems aren't allowed to power on until =
the BMC
>> has reached the "Ready" state. This state ensures all inventory and =
other
>> system data has been collected and created on d-bus.
>>=20
>> The BMC reaches the "Ready" state once all services within the =
multi-user.target
>> have successfully started running.
>>=20
>> I know in the past I've heard of servers that allow both the BMC and =
Host
>> to boot in parallel (which sounds awesome) but we're not there yet. =
I'm
>> contemplating an optional package in phosphor-state-manager that =
could be
>> installed and put in the obmc-chassis-poweron@.target and prevent
>> any other services running until the BMC reached Ready.
>>=20
>> The obmc-chassis-poweron@.target does have a =
"After=3Dmulti-user.target" within
>> it but that doesn't control the services within the poweron target. =
It just
>> ensures systemd will not consider the obmc-chassis-poweron@.target =
complete
>> until multi-user.target has completed.
>>=20
>> Anyone else have a similar issue and/or thoughts on this problem?
>>=20
>> Thanks,
>> Andrew

