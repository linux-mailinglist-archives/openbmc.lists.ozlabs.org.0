Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DC015CC6E
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 21:35:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48JStY1wxhzDqX9
	for <lists+openbmc@lfdr.de>; Fri, 14 Feb 2020 07:35:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32d;
 helo=mail-ot1-x32d.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PnytGXTU; dkim-atps=neutral
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JSsk2DrzzDqVq
 for <openbmc@lists.ozlabs.org>; Fri, 14 Feb 2020 07:34:15 +1100 (AEDT)
Received: by mail-ot1-x32d.google.com with SMTP id 66so6911008otd.9
 for <openbmc@lists.ozlabs.org>; Thu, 13 Feb 2020 12:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=dv9SBucddZpwbhlCKVSweVdnHCwuxePDQ0j4j+SHxOE=;
 b=PnytGXTUa3tICotUfk+LR6+AKjsIP1kl3I4sbvhRmmvfuHQIQzqlpSDnqT+xrmRGGx
 a7RtAdgmpdQk6wXJqz3EQrb6UoJknEeo8LwbwLX8x6cW99jw/XqB37iICcVWfNEewji/
 ZkTKfxOiIeWUeSPoNWUmtZ8OGFFynEgr/9DnbGTA6BaQbGW05aulpdagih4FYjRn2Q3q
 n8dEK3yVK2WkxXz3DGONvvpj77gZz8yhUaoNRQxJqNqwdifQVC60jvZ5IPhGYIoGM+Ru
 SnByYmuZRnaac4xJXJ3aXtWD4naf+W+zeLT1ag+FkiAFxf4kbs0pee3OEPkMc7zkpDb2
 L/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=dv9SBucddZpwbhlCKVSweVdnHCwuxePDQ0j4j+SHxOE=;
 b=BDFaFfj3jhss0Ha6gTYG1LXhbeRM1pG6e1MLDB4FC15UheR9wmTgrEQTS4nG3xmxFn
 RdTkd1qqGsTwAP8vKXJpARYTK4ulV7V+AgHDVZLKd8OTvaotwr4qCpcIAYYOxAVegTHn
 zuQ4JxWPeoTiggzlBbdQnRhwgYv8GrjD6pzsEUpQ2U82z7oXpKj4bLFsaCYWM8SQqCVa
 l9Dx0B4PsZs5jiuCIinqbEEcubdI/RirOXNiC9utduBH/7QiPjZ0WqHISDibjRbfMXb9
 l0mwnfG/z042v7K4LigZ0BClazPoMjEeDPRVfK6uQRvDvH8lSSLzHAy3gUyTuzVrhde2
 4/0Q==
X-Gm-Message-State: APjAAAWgFliZ6e3Ot18LRshnNTjLHnam/xlkwd35sCQDcvVAHSa8VIi/
 VhgAFSsafH30W3AFiNlQvZBy/rppThY=
X-Google-Smtp-Source: APXvYqxjPo26i0k7AsUnD2xx2mSiQ7FDOZJz/YdZw0v8ARS5iGtxWaxw/oT5DDqFh0UKWhH/cOQidQ==
X-Received: by 2002:a05:6830:1049:: with SMTP id
 b9mr15552541otp.100.1581626052344; 
 Thu, 13 Feb 2020 12:34:12 -0800 (PST)
Received: from andrews-mbp-2.austin.ibm.com ([129.41.86.0])
 by smtp.gmail.com with ESMTPSA id m11sm1036384oie.20.2020.02.13.12.34.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Feb 2020 12:34:11 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: Enabling OpenBMC Debug
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <27a538db-96e4-f83f-6541-93e974f78ead@linux.ibm.com>
Date: Thu, 13 Feb 2020 14:34:10 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <8FCDAC3B-6254-440F-88F7-77E8AC4138B8@gmail.com>
References: <776B4FA1-4427-4FC1-802A-BC4192CA3D2E@gmail.com>
 <27a538db-96e4-f83f-6541-93e974f78ead@linux.ibm.com>
To: Joseph Reynolds <jrey@linux.ibm.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
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



> On Feb 11, 2020, at 11:58 AM, Joseph Reynolds <jrey@linux.ibm.com> =
wrote:
>=20
> On 2/11/20 9:51 AM, Andrew Geissler wrote:
>> I find myself running a lot of different commands to enable a variety =
of
>> debug data on OpenBMC when debugging different issues (usually BIOS
>> communication issues). I also end up giving these commands to a lot =
of people
>> when recreating issues for me. Stuff like this:
>>=20
>> # enable debug logs in journal
>> sed -i 's/info/debug/' =
/lib/systemd/journald.conf.d/journald-maxlevel-policy.conf
>> systemctl restart systemd-journald.service
>>=20
>> # Enable BIOS communication service debug
>> sed -i 's/mboxd/mboxd -vv/' /lib/systemd/system/mboxd.service
>> sed -i 's/btbridged/btbridged --vv/' =
/lib/systemd/system/org.openbmc.HostIpmi.service
>> sed -i 's/ipmid/ipmid -d 0xff/'  =
/lib/systemd/system/phosphor-ipmi-host.service
>> sed -i 's/0/1/' /etc/default/pldmd
>> systemctl daemon-reload
>> systemctl restart mboxd.service
>> systemctl restart org.openbmc.HostIpmi.service
>> systemctl restart phosphor-ipmi-host.service
>> systemctl restart pldmd.service
>>=20
>> I was contemplating wrapping the above stuff in a obmcutil command so =
instead
>> of telling people to do all of the above (and dealing with situations =
when
>> those commands change), I could say something like run "obmcutil =
debugon".
>>=20
>> Any thoughts out there? Would finer granularity of the debug be =
useful?
>> Are there other forms of debug people would like enabled?
>=20
> Thank you for the information.  I keep learning all the time.
>=20
> These settings factor into service scenarios and also deployment =
readiness.  For example:
> - I want to turn off debug.  For example, I want a debug-off command.
> - I would want a way to validate (or at least show) these settings =
when testing firmware image release candidates.  For example, another =
obmcutil command "debug-show" which uses "grep -H" instead of "sed".
> - I would want some documentation added the BMC administrator's guide =
to make them aware of OpenBMC debug support.  Draft: The obmcutil =
command can control debug settings for a variety of the components =
running on the BMC.  For more information, see =
https://github.com/openbmc/phosphor-state-manager/blob/master/obmcutil

This is interesting, I was not really thinking of these being used by =
our
external service type teams. I was mostly thinking of this as a =
development
only tool. Used early in bringup of new systems when lots of new bugs
and issues are being discovered.  Within our company, the rule is that
the default software you ship, must generate and collect enough
information to debug any failure. Asking a customer to turn on extra
debug is frowned upon (but at times still needed). I do wonder if we
could interest the DMTF in some sort of =E2=80=9CDebugLevel=E2=80=9D =
property on
the Manager interface? It does make me think though that if were
to formalize this behind an actual external interface, it would then
make sense to formalize across OpenBMC how we enable different
levels of debug. For example, a consistent =E2=80=94vebose/=E2=80=94debug =
option
that is passed to applications on startup. Or a more consistent use
of systemd-journald levels across applications.

>=20
> The obmcutil tool is a shell script, so folks can take just the pieces =
they need.  That is, don't be more granular at this time.
>=20
> In summary, it seems like a good idea.  It seems like we should ask =
our service architects to weight in.  I'll go ask mine....
>=20
> - Joseph
>=20
>>=20
>> Andrew

