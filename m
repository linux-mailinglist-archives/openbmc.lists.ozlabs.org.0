Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8666827668C
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 04:37:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxfN604xBzDqLj
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 12:37:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::330;
 helo=mail-ot1-x330.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=2G15UwS2; dkim-atps=neutral
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxfMD5YC1zDqM5
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 12:36:55 +1000 (AEST)
Received: by mail-ot1-x330.google.com with SMTP id e23so1758635otk.7
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 19:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pUaIzy5SozFYX6QJv/oU9JVrZDUOcnKo2MJeJoyinjU=;
 b=2G15UwS2tc4XQRuJ8xIf9pHoL8LBv8U4yjBrywNkFlxQik6ZzhWhZUHbtPXmCBZsPk
 mB4HVq5ulH/FqRlSOxfoNKquXxurLhrZ+hj6KZkxbR0OpulJ28PvSQDBgC2VHZbC55nJ
 v4aXgBlYXW0oTPHGXii1Ghz6IW3bO+3e8jsXvlyck/QyPqY4NTjUztrFqq8sZxAuKolT
 +vfijvDp40nRxQqCxCUcAYghK77Q9Ke2fq3QR+G/DGrSSi8YuK6MHoJl6GhYrpDi9mFs
 /xEIpRrqZDlmu9hiYiHdLergNU3SmXFTTud+VziyM9fks/CplNkvHhCDl0Hy9/7ILSZb
 sPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pUaIzy5SozFYX6QJv/oU9JVrZDUOcnKo2MJeJoyinjU=;
 b=slpcpDJ9KdqHJRVLxoMc5tdhthIdFCYE0aZmU3iMeorJOtqlkx62OOiK7UhBVDYRdX
 Nx0vmJEjkOWzA4Jnhv7JukUKwka5YimTXmt+f1ALaOIYLJOtVL/ksqa6c9nLho8xgPjB
 hgfBrgUEbK9LiuR04QKpXg3Ee3Pei2nsDuqfkAzGDge3EM3eMhi/76mBBKunTrylGl/P
 kRE4sORkf6XqIS0ujgLdDMmRvTli4KR9NNIEA+dJvmtztYfmW+IeHVhKN+rREPWih8GI
 sHpzJPoKKeXtMrdzY3M2pN0XL+kO18tFhVaIgx4S7aoL+ufZDWvpG9buJw2LQUWsrdDM
 lfHA==
X-Gm-Message-State: AOAM531/dJYLh7Ig1carQIYMlNaAZR4CkEDivP7slk4OW7H0n2TOrDQH
 forMzMcO4/2GFPhLmlkstVrS4S87LoU2BnZA5smkPx+z7VU=
X-Google-Smtp-Source: ABdhPJzZ9qVQlwRxGJe7h91y2rmVG/6mVbp7WqcpWASTTXryGJU0XlaUdqRZCuAJGCo9L315F7DcN1S/pK52M9BVVE4=
X-Received: by 2002:a9d:d2f:: with SMTP id 44mr1624234oti.343.1600915011192;
 Wed, 23 Sep 2020 19:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <SG2PR04MB3093CAA5913439BB892C16E5E13A0@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <20200921152337.GJ6152@heinlein>
 <SG2PR04MB3093A25A217B7E1FFD65D8A8E13B0@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <20200923153510.GP6152@heinlein>
 <974e9c2abdf54c96038585730403d5b9@linux.vnet.ibm.com>
 <5FEF272B-706E-4C48-978D-1C3CEB137CFD@fb.com>
In-Reply-To: <5FEF272B-706E-4C48-978D-1C3CEB137CFD@fb.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Thu, 24 Sep 2020 10:36:40 +0800
Message-ID: <CAGm54UHW=ZdCOAVskjt8PiAn7FRcpAM7dL3J4UvB8g0bP+Qbaw@mail.gmail.com>
Subject: Re: Read Firmware Versions
To: Vijay Khemka <vijaykhemka@fb.com>
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
 openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Sep 24, 2020 at 9:40 AM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
>
>
> =EF=BB=BFOn 9/23/20, 1:19 PM, "openbmc on behalf of Adriana Kobylak" <ope=
nbmc-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org on behalf of anoo@linux.=
ibm.com> wrote:
>
>     On 2020-09-23 10:35, Patrick Williams wrote:
>     > On Tue, Sep 22, 2020 at 01:34:50PM +0000, Jayashree D wrote:
>     >> Classification: HCL Internal
>     >>
>     >> Thanks Patrick for your response.
>     >>
>     >> In phosphor-bmc-code-mgmt, I am seeing the software image is upgra=
ded
>     >> and based on the image update, version is updated.
>     >> But in my platform, I have to read firmware versions using oem
>     >> commands and that version should be displayed under dbus objects.
>     >> Whether phosphor-bmc-code-mgmt repo will be suitable to display th=
e
>     >> firmware version using dbus objects?
>     >
>     > Vijay recently added a simple BIOS flash management to
>     > phosphor-bmc-code-mgmt, but there is also a openpower-pnor-code-mgm=
t
>     > for
>     > the equivalent of BIOS management on openpower systems.  Since your
>     > code
>     > update scheme is likely to be specific to your IPMB commands, I don=
't
>     > know if that would be best in a separate repository or an extension
>     > onto
>     > phosphor-bmc-code-mgmt.
>     >
>     > Adriana, any opinions?
>
>     It could fit in phosphor-bmc-code-mgmt, some thoughts:
>
>     The d-bus objects get created at 2 different times:
>
>     1. One scenario is when an image is uploaded to be updated, this is t=
he
>     support that Vijay added which allows a custom script to be run to
>     update the BIOS image. If you're interested in this method for updati=
ng
>     your BIOS, you could potentially add your IPMB commands in that servi=
ce
>     and use the Activation interfaces to drive the update.
>
>     2. The second scenario is when the BMC reboots and it recreates the
>     d-bus objects. For this scenario, there's no currently support for BI=
OS,
>     so for example the support that Vijay added does not create a d-bus
>     interface if the BMC reboots, which is ok if you only want to use the
>     Activation interface to trigger the update. But sounds like you want =
to
>     always have the version information as a d-bus object, so support for
>     BIOS could be added. For example, to get the BMC levels, the code loo=
ks
>     for version information in the BMC in the media directory. If you get
>     your app to get the version information via the oem commands you
>     mentioned and create a file in the bmc in the media directory we coul=
d
>     extend the logic to create the Version d-bus objects for each BIOS
>     version when the BMC reboots. We'd just need to work out the details =
for
>     the format for the files that would host the version information, and
>     how to identify they're BIOS versions vs BMC.
>
> I already create a file after reading bios version via oem commands, Is t=
here
> a pattern where should we keep this file and what is the name of file. Al=
so
> I thought there is a dbus interface for bios management already created b=
y
> some daemon newly added which can keep bios version.
>

We plan to do something like this:
1. The BIOS version is stored in an eeprom;
2. On BMC boot, phosphor-bmc-code-mgmt creates the bios object, and
fill the version read from the eeprom;
3. When the host is started, BIOS sends its version via OEM ipmi command;
4. BMC will update and write the version to the eeprom if the version
is different.

--=20
BRs,
Lei YU
