Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BFDDC9B0
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 17:50:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vr8s4GS0zF0ky
	for <lists+openbmc@lfdr.de>; Sat, 19 Oct 2019 02:50:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Nvs2qfMT"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vr5S3wcMzDsTR
 for <openbmc@lists.ozlabs.org>; Sat, 19 Oct 2019 02:47:40 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id 23so3601177pgk.3
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 08:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BIxnudUwMs3+viS17V1o4g9tAOG7En1vAJQs+pKP/ng=;
 b=Nvs2qfMTF14J5NiH8AEfMewC+TGM7VfeWYCzmbmxvNB+uRVobWqdQL+u8j6rykKzpE
 teadPlvs6+ao1PusDmNke93JyNiAfu1PuqgUrQdsBGFk1+QVNNLlxAoFjXNPTXBn6mvQ
 dqTP2nzN/Z7LfEQzrriE6ELk+71/1UCAEbTeXboPugOd5tRvDI1HecaKA2kYFizVK4JM
 neMZ2kcgzzPg5T2EV+zZ49ggxpTjMfLBMx6ap07ikSU7eGp5ie3QCvd8kxi183sffSKP
 UeV8Aycgi2R6bvOp2xKXAYR4MlSmtCwZ/zWQesJbtfiHkZluC+RaMFqL/6uiTL6YL2XC
 H1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BIxnudUwMs3+viS17V1o4g9tAOG7En1vAJQs+pKP/ng=;
 b=YDeIzwsmXzXV3KIfVMmwidNpm/ViJd2RCg/b/9X4Hs8vMY48tTEFnok7xQ3IPT3Yx7
 tDGZMqS43lmk6hJCBouktfbA8Y6AIbUiUze4bdBSOmygASFjoMINPp09Go50bCYyw/6A
 Ku3W2k5C0t8RmOu92jLLIW74TyGTFZPDCPEhAq/FfQFzX7p387e/yYOXsikbB5UH9uwm
 47f1oD2a0Q+5j2KyJenryn+385TXp10SKzEJ5z/KALexQ2oRsqhE3L4wovxLx/AyinRN
 NO+T+XIz1177H+gMqiLHLv1jDt0EPjlgVyI+AIFXaaMHPDSZO09ulZ7x+l4mvghO4z7I
 OJKQ==
X-Gm-Message-State: APjAAAXyJN30kgxVbXYxpyVYNi3yKf2+kILbEoh6ba6rT6lmoHLJCi+K
 Kkaxxy3BuGj2+3m3LrRs20zUnK2L5Nw7+JAZeOQUVg==
X-Google-Smtp-Source: APXvYqyff0q2q/BRcCM9PGGupgywlerjwbSC9sEe/ZmiDSMFbtbpGwq6hdbULlnHmUlNDw4oauMQj/XbHVlP4GIl+A4=
X-Received: by 2002:a63:3303:: with SMTP id z3mr10689922pgz.353.1571413655833; 
 Fri, 18 Oct 2019 08:47:35 -0700 (PDT)
MIME-Version: 1.0
References: <170FEA13-6C0D-4D08-9118-1831E85DD5A8@fuzziesquirrel.com>
In-Reply-To: <170FEA13-6C0D-4D08-9118-1831E85DD5A8@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 18 Oct 2019 08:47:24 -0700
Message-ID: <CAO=notyaSE=P0XQrtYh1r=5A18jmHKYbkQcy3AOkc_oSsgrnwQ@mail.gmail.com>
Subject: Re: phosphor-hwmon refactoring proposal
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, jolie.ku@ibm.com,
 Matt Spinler <mspinler@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 17, 2019 at 6:16 AM Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
>
> Hi everyone
>
> I have a quick phosphor-hwmon change proposal I=E2=80=99d like to get fee=
dback on.
>
> One issue with phosphor-hwmon that has been brought up a couple times now
> is that it gets its configuration settings from a file with a path in the
> filesystem that mirrors the path to the hwmon device in the device tree.
> This is problematic because the device tree path is not required to be
> stable, so whenever things move around there, the config files all have t=
o
> be moved.
>
> Unfortunately there are > 200 config files like this scattered throughout
> the openbmc source tree.  So my proposal addresses the limitation in a wa=
y
> that allows users to move over to the new config file locations on their
> own schedule.
>
> Presently phosphor-hwmon gets its configuration from the environment,
> provided by systemd=E2=80=99s EnvironmentFile option:
>
> EnvironmentFile=3D/etc/default/obmc/hwmon/%I.conf
> ExecStart=3D/usr/bin/phosphor-hwmon-readd -o %I
>
> The proposal is simply to quit passing the configuration via the
> environment and instead look for a config file, the location specified vi=
a
> logic in the application, with a path like:
>
> /usr/share/phosphor-hwmon/i2c/2-004c.conf
>
> This is the path to the hwmon parent device relative to /sys/bus e.g.
> /sys/bus/i2c/devices/2-004c/.  All the logic to do this would be added to
> the application itself, the sole input being the /sys/devices/... path
> provided by udev.  libsystemd has an sd-device subsystem that could be us=
ed
> to do the /sys/devices/=E2=80=A6 -> /sys/bus/=E2=80=A6 traversal if that =
makes things any
> easier.
>
> The new config file could keep the same format as today, or we could move
> it to json and parse it with nlohmann?  If json we could preserve the
> current flat configuration or have dictionaries?
>
> While we are poking around in here, I=E2=80=99d also recommend swapping o=
ut the
> current helper script with a SYSTEMD_WANTS as systemd has been updated to
> handle templates in udev rules since this was all originally implemented.
>
> Finally, to enabled a staged migration, the new unit file and udev rules
> would be installed with a new feature flag (e.g. meson option) in place o=
f
> the old.
>
> Please poke holes.  thanks!

I'll let others focus on the hole poking.  I just want to say that
testing this userspace code will be easier if we transition away from
environment-based configuration.  So I'm all for that.

>
> -brad
