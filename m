Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7860D274A75
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 22:57:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bwtsv6VbMzDqV6
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 06:57:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Xk4VSbu/; dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bwts757PNzDqTy
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 06:56:41 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id c17so13864264ybe.0
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 13:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8nb9xPpOJ+DKPh8Vu+Ch+x2GuhGwM47cbUOMkO1JESs=;
 b=Xk4VSbu/juHfu6s4QUArMhbTkfwpBlyjnU7PV+MgCkRB2cEyRO9C9xDqH/nApbKXja
 gqU0wqN7kGx0kYqgnRXIfB3YMnbL2BvYCoYypMg9V9fdfH+vsmoEAjh5Z8HzyCHEa7fZ
 T/2HCjygUGTqY5V1c0uTyu2EHaY0P6cYTgl+uB6b+3llNTjCVIPdLFCOoxr/b0tRTMAj
 sAJtnVxvMjWi1B336PyPm5FxX+EqMygu0klOJRysvqW+h8tKhxGQgnTYnQeOKLwKj5ue
 7b4qQhBBwNEbUTSQ/bKD9qCdKCEU5MjYLdl9GMRZiq9srrq4D7U7N+kiG6JDHdsKW8KF
 eI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8nb9xPpOJ+DKPh8Vu+Ch+x2GuhGwM47cbUOMkO1JESs=;
 b=T3HmFTFA+B7yjBtInbQy2bgpSJ6IFBXMHXNCSpb4aBAsXc5RSmcc7/UPLIgzRsDfXV
 Y5AwhQWQBZuNcZR78wkPTE6a9mH3rxNN/a7mP0koMmLacEtaTnHn7AtO7J5lcqGkjtm7
 haeILyW0MIMBb74j7labJrf3fL1ZXTc97fJdd6c0EH1W+G4InCy7Q9P/vGh7do/qiPZc
 KlvWQeS1PKl6hCb4/YcgCSFOYOpuxdfT5M+0RRQpm0PjLXyteHpFDCO8VDwPQKhqCcl6
 EXRcRxU0w/9Xz+O0ifiB/F1Xxh1DgOyF2gW5QQuqPILY8Hlhgpve50gt63/FwyKp4m/s
 M3eA==
X-Gm-Message-State: AOAM530UviC0QgccSTROsUHsVICJjKk9eGJNs9WchTdxVYGNrh04joA6
 nO0atS0UtIRCRlw/iCGHJrk/6Z+sbmJZuoQkdPRArw==
X-Google-Smtp-Source: ABdhPJw7Sr5cfkBRJTyRs8GerQ4U9X5ra2/VSsbOUHNlrgCTjFxJ5yIVbnHd8pidfuSlmmxhIZZ1dYMnNVNL+dImzm4=
X-Received: by 2002:a25:1581:: with SMTP id 123mr8761163ybv.480.1600808195122; 
 Tue, 22 Sep 2020 13:56:35 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR04MB2964FFC6D5EF008F106FFC13FD230@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <CACWQX80fpcLGEjuvUnj4JpinY=SS6eXbHR0i6wdEtjNpMsAHMg@mail.gmail.com>
 <3D149923-0A95-4CE6-82EF-8338677EF831@fb.com>
 <HK0PR04MB29649824A0F904C61F35152AFD3A0@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <3858C398-1F6C-40AC-AD7D-B266646BE3EF@fb.com>
 <CACWQX83XmOJ7a7O_R8pLec-NdrYiP18VVoyAEWacS6wM5Xfd3g@mail.gmail.com>
 <2F15FFE5-4A4A-4652-B3BF-6B8CD5B17CCF@fb.com>
In-Reply-To: <2F15FFE5-4A4A-4652-B3BF-6B8CD5B17CCF@fb.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 22 Sep 2020 13:56:24 -0700
Message-ID: <CACWQX81uOYUbgzSKaLGgTP6-NT+h7CLykdcDDe19+CJvdw2nxw@mail.gmail.com>
Subject: Re: Read FRU of host through ipmi in Entity manager.
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Kumar Thangavel <thangavel.k@hcl.com>,
 James Feist <james.feist@linux.intel.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>, Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Sep 22, 2020 at 1:26 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
>
>
> =EF=BB=BFOn 9/22/20, 1:20 PM, "Ed Tanous" <ed@tanous.net> wrote:
>
>     On Tue, Sep 22, 2020 at 12:57 PM Vijay Khemka <vijaykhemka@fb.com> wr=
ote:
>     >
>     >
>     >
>     > On 9/21/20, 9:45 AM, "Kumar Thangavel" <thangavel.k@hcl.com> wrote:
>     >
>     >     Classification: HCL Internal
>     >
>     >     Hi All,
>     >
>     >                 Thanks for your comments and suggestions.
>     >
>     >                 As suggested, we are planning to implement a new pr=
ocess/service like  xyz.openbmc_project.IPMB.FruDevice in entity manager mo=
dule to support Host FRU through ipmb rather than using dbus-sensors/ipmbse=
nsors file.
>     >
>     >                 Following are the advantages, if host FRU handling =
in entity manager repo.
>     >
>     >                 1. All the FRU information is handling in the same =
repo.
>     >                 2. Entity manager Probe can work.
>     >                 3. All the FRU Functions are in the same repo. We c=
an try to reuse most of the functions.
>     >                 4. Adding Fru object to dbus handling are done.
>     >                 5. All FRU validations are done here like Format fr=
u, update fru property, validate header, Fru AreaLen and checksum. We can t=
ry to reuse those validations.
>     >
>     > What will happen if user is not using fru-device from entity manage=
r, rather choose to use phosphor-ipmi-fru. Here you are restricting user to=
 use fru-device only.
>
>     phosphor-ipmi-fru is not compatible with IPMB Frus, as the
>     specification requires them to be dynamically scanned based on the
>     SDR.  I guess you could hardcode them, but you'd still have to have
>     some auxiliary "does my device exist" scanning that starts to look a
>     lot like entity manager/fru device.  Is the use case you present a
>     real one, or hypothetical?
>
>     >
>     >                 For scanning the /dev/ipmi-* nodes, we are thinking=
 to use ipmb-channels.json cofig entries in entity manager repo since this =
config file has valid slave path and bus address.
>
>     Please don't.  Entity-manager is dynamic, and the config should be
>     based on a detected entity.  Mixing the dynamic and static use cases
>     in this way would mean that we get to rewrite all of this when we hav=
e
>     to support IPMB add-in-cards, which are 99% the same, but need to be
>     detected instead of hardcoded.
>     If you want this to be relatively static, attach an exposes record to
>     your baseboard config that has the information you need (if your IPMB
>     devices are on the baseboard).
>
> Rather than having hardcoded config, can we can scan all available ipmb
> devices under /dev/ipmb-* and send proper ipmb command to get fru
> data.

When an IPMB card is installed, who is in charge of creating the
/dev/ipmb-* node?

>
>     >
>     >                 Please share your comments if any.
>     >
>     >     Thanks,
>     >     Kumar.
>     >
>     >
>
