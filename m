Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F117A244FD6
	for <lists+openbmc@lfdr.de>; Sat, 15 Aug 2020 00:28:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSykp22V3zDqpH
	for <lists+openbmc@lfdr.de>; Sat, 15 Aug 2020 08:28:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::135;
 helo=mail-il1-x135.google.com; envelope-from=benjaminfair@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=RydmORhZ; dkim-atps=neutral
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSyk34Z7NzDqll
 for <openbmc@lists.ozlabs.org>; Sat, 15 Aug 2020 08:27:32 +1000 (AEST)
Received: by mail-il1-x135.google.com with SMTP id j9so9719408ilc.11
 for <openbmc@lists.ozlabs.org>; Fri, 14 Aug 2020 15:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hPgEYZDRi5Od9cwL7BzRnIPj2Ldg2BW86EEikbJGECo=;
 b=RydmORhZN9QGMAMKH0qLxyk7uyB9LmkGNwCyvZQfTbhBmvKxjYYM/B3zK2GPvt8Qno
 Lg3PcgEbxqOdkmRboLv/h2yxkIhD5Osqzxbhfpp48tUEmw49xGPt3lk3Jc4jWGWWx0KM
 f66OfiYx/pdIF0xLHtppP/lp+hAxSJ/la0Wu/xsR6CacLxPhmr92GZViFmHRJP8eNent
 LOWa7w49u8k/W0ouYnSixAktS9KwyMKkyQ84jKbp/6mkO5f1ajYEbHF/8T1F0HVLJY/g
 6O/gGbbsMyehRverh/4AoO2gs5z9IxddxGhkQZlFr2PyQWfNbPJcSxdMYSyh0SBLUZM1
 lZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hPgEYZDRi5Od9cwL7BzRnIPj2Ldg2BW86EEikbJGECo=;
 b=UbkrWUUsEY+kVW6R+0dEr7FI1KzBS6MoqMY/iUDE6lLIZw6gvJ8JOsoc7OaOz+Y/qR
 s5oghe0gQ3Ed6uOKogboAcl5yJszMFHTc1Hoid/qnUQhiSBG/4IKCqPDDPL6QCnTtz6b
 2oD/TKXfmoNeiW8UiYZezGvV3WptXsn9Yp7szXgM5qiJHL+gbt+ss3n8NO3lFxsDWz1t
 GIavkr3YXyhnStX+b0zadqTqV2eGIfTaSAArlEjEB4Biyr6cqkfcDmlu+IpOFuhV45Jm
 HeOzOlVccX6n1QgdruV+gZ8Q4DrQu+X4FV2xFHKNUFe7moDY0rd86WoBCnFT65xRBkoA
 3dRA==
X-Gm-Message-State: AOAM5339b69YW33rppjZPUjb/8asgVHvA3Q0NQi9m40Q1dLnLaiXAW9M
 3FONWP60IRlQZqJ0iHPXerhN2FYEO4jlAPiE/q/EXQ==
X-Google-Smtp-Source: ABdhPJybztz4KL1bCkbmhP4iGczfnzYvvc/nik0R0075f0XjSREjr0UuuMsGmR9c5FemPL8HF9+oTWTOCdyHkGFzjl4=
X-Received: by 2002:a05:6e02:e8c:: with SMTP id
 t12mr4126255ilj.34.1597444048574; 
 Fri, 14 Aug 2020 15:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <ff39e855-d5b6-a789-bcbb-3b87bf786bd1@linux.vnet.ibm.com>
In-Reply-To: <ff39e855-d5b6-a789-bcbb-3b87bf786bd1@linux.vnet.ibm.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Fri, 14 Aug 2020 15:26:51 -0700
Message-ID: <CADKL2t5805S1gd_FeRXVw8DS1ihkTv8t2ghXyh1vvB+SjKCdQw@mail.gmail.com>
Subject: Re: IPMI implementation of Get Device ID command
To: TOM JOSEPH <tomjose@linux.vnet.ibm.com>
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, anoo@us.ibm.com, "Mauery,
 Vernon" <vernon.mauery@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 14 Aug 2020 at 10:34, TOM JOSEPH <tomjose@linux.vnet.ibm.com> wrote=
:
>
> Hello,
>
> We have an implementation of this command https://github.com/openbmc/phos=
phor-host-ipmid/blob/master/apphandler.cpp#L571 . The current version of th=
e code derives the major and minor firmware revision from the VERSION_ID fi=
eld, and the auxiliary firmware revision is picked from dev_id.json. The au=
xiliary firmware revision is populated at build time https://github.com/ope=
nbmc/openbmc/blob/master/meta-ibm/recipes-phosphor/ipmi/phosphor-ipmi-confi=
g.bbappend.
>
> The implementation of the code is obsolete, as it was based on an earlier=
 format. The current format of VERSION_ID for example is, 2.9.0-dev-609-g56=
f86d23c. There is already a WIP patch to fix this for the master tag format=
 https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/33893.
>
> IBM tagging format is different from the tag format of master builds. One=
 choice is to have the major and minor version added to the dev_id.json and=
 if the format of VERSION_ID does not match the master tag format,  pick fr=
om the json.
>
> How are other companies converting their arbitrary tag formats to IPMI fi=
rmware revision fields? Does every company maintain their own downstream im=
plementation of this command?

Google currently maintains a downstream implementation of this command
based on parsing the DISTRO_VERSION in VERSION_ID directly from
/etc/os-release. We set this using an environment variable at build
time rather than with a git tag.

We also export 4 version points, with the last two being set in the
aux version info.

> Is a common code possible for converting arbitrary tag formats to IPMI fi=
rmware revision fields?

We'd definitely be interested in finding a common solution, or at
least one that's easier for us to customize downstream or in
meta-google.

>
> Regards,
> Tom
>
>
