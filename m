Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFEBE4151
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 03:58:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46znMg0XHWzDqc1
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 12:58:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d34;
 helo=mail-io1-xd34.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fTn/Ligd"; 
 dkim-atps=neutral
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46znLw4GB6zDqhR
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 12:58:00 +1100 (AEDT)
Received: by mail-io1-xd34.google.com with SMTP id c11so553294iom.10
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 18:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JPnDiDMae5+v9W/G8uE4lXWvs9LuHYXEF9Zpq2CnO8Q=;
 b=fTn/Ligd/08jWPOu85ANn2Ud1WHssr/VWzqGKTZ6mPxbMvesS8aX+3k13QaVbB5zTn
 fJk6M2Z7LnZ32Zwi/kp/D/JJRR/I+yzQxfsBehlbR2h1pWQH0+SAV2npfiEo68/x2DJc
 DfaPOEHtpZIk63fbBva4L5tDaFCtU6ymew/+/96xpFkdnjCQAbXSUwfd9HQS5Eac0t0F
 7S8ofmw/R9IFTKxc4Iv5GRiFqzD25Vyv3yE04nyJP6OGdpsDKxYNMP1avDPZccfLUCxu
 KZo+ew58pLYnlrCKdf7kF0SMrClobEFIt2082ut5HS7z1iN9M4kteXhbd7Jz3sLc6mXq
 ogEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JPnDiDMae5+v9W/G8uE4lXWvs9LuHYXEF9Zpq2CnO8Q=;
 b=nvnrHPe+UjmrYTU59qKol9NY2ncEKWsASt+U1gsqJAh/Fkdt+EoSSVmN77SUYhAMXz
 9XDeq52JQ9E6KWhHIxxozVIAwsLk0Jed/axJGf9gcJFP+NY75EJ4tWPw586SesmJ38U7
 ZK4Eae2hM5u5OA0YIReADYbNcDFKIqfh+IoRz8ev6vpcGidKEoxzTb0BYct6o/jkFkDs
 ot/JFQH3GP6aso0/2Ma/w/+i7R5MldWq/6vkz5BPFnNrH+MsfVgwIzoqh2bR4Q7yEMe4
 ezQWY8nwcO+AEysHb/+K13Nm3tyzVp1DrDGZmq3ApLpmX+dcr7RTLl/KBpDpwRhMXDTJ
 p4ow==
X-Gm-Message-State: APjAAAVkxGwDBgGJA1BPFnrWxhaDfZUBrB0ihBBwOASt78JUXTq9msL8
 ObzgXOoBpGE8S4DBuC93z1PalNsVztXXm7zBoMo=
X-Google-Smtp-Source: APXvYqweMsteJUJbqgAS9++I06RsIqShE50Rk/gR8mi7zV/fWgOKw8QO1QEU+VSN0FeTsJMBuvcAHJzKpAUkVeNjK6I=
X-Received: by 2002:a5e:9e07:: with SMTP id i7mr1337195ioq.42.1571968676913;
 Thu, 24 Oct 2019 18:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <1b633df0-8ce7-963c-cb6b-d79ee7d24a9c@intel.com>
 <907DC60D-00EE-403D-82D0-4EFADD245A9D@fuzziesquirrel.com>
 <31A30B99-1B20-4098-8137-7027147E0DE3@gmail.com>
In-Reply-To: <31A30B99-1B20-4098-8137-7027147E0DE3@gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 25 Oct 2019 09:57:45 +0800
Message-ID: <CAARXrtmm4moX=dsC+u+2gD-iUs8k1m9GUQ9yycjbctQ9iJiQEw@mail.gmail.com>
Subject: Re: Continuous Integration Build Failures
To: Andrew Geissler <geissonator@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Johnathan Mantey <johnathanx.mantey@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Oct 25, 2019 at 4:21 AM Andrew Geissler <geissonator@gmail.com> wro=
te:
>
>
>
> > On Oct 24, 2019, at 10:40 AM, Brad Bishop <bradleyb@fuzziesquirrel.com>=
 wrote:
> >
> >
> >
> >> On Oct 24, 2019, at 11:16 AM, Johnathan Mantey <johnathanx.mantey@inte=
l.com> wrote:
> >>
> >> I would like to propose a change to how the continuous integration sys=
tem works.
> >>
> >> I understand there are many builds, and there is a lot of data associa=
ted with the builds. Thus the current desire to remove the log file data in=
 a short amount of time is a requirement. This works alright when the build=
 succeeds. It's unhelpful when the build fails. Identifying where the build=
 fails is impossible after approximately an hour. As an ordinary contributo=
r I don't know how to make the CI system rebuild the source code so that th=
e log files are available again without pushing some new change that consis=
ts of a useless piece of whitespace (or some other pointless change).  It s=
houldn't be necessary for the contributor to make requests for a build rest=
art to the CI maintainers, they have their own agenda.
> >
> > Are you referring to the bitbake CI jobs or the repository CI jobs?
> >
> >>
> >> Are the maintainers of the CI system willing to make a change that aid=
s in debug?
> >>
> >> Suggestions:
> >>      =E2=80=A2 Don't delete the log on build fails.
>
> Other then some old unsupported jenkins plugins, I=E2=80=99m not seeing a=
ny obvious way
> to this one.

It's a valid point, I have seen people submitting changes to gerrit
and got a build failure, but could not find the detailed log why it
fails.
Currently, there is only console logs on Jenkins, but the build/test
logs are not accessible.
Is there a way to post the build logs and test logs to a place, e.g.
Dropbox/GoogleDrive/etc, so that it could be persistent for a longer
time?
