Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CCD274A0B
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 22:21:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bwt4D2wCKzDqWx
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 06:21:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=0LlDUt/q; dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bwt3Q5n86zDqNb
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 06:20:31 +1000 (AEST)
Received: by mail-yb1-xb2e.google.com with SMTP id k2so13753244ybp.7
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 13:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=M8gva64w3L5lpkJnHAmUBP99NgwRkGKT4hig382twsI=;
 b=0LlDUt/qpaRCNnp+LbKWIpWeQKgwQVXfBEHRceFvHyB1z2ukhp6fCorTpi/+RIQigm
 DJjWVXupr6CCzabYG2OvxNT281uBzwqI4/f8dEOnNByTA/dPILxMQfguJ5E4fkSzBsqH
 dmju8kwlrysaVM2n/Zf1u5YO1ph+SJWmwGQwS4ebYZqsh9Rthx4zXfDBhWQPzYF86UbS
 CrvToJfbyIZnx6BvhrPL4G3YMAF6difN/TJuyQbH2knYEHnyZg364FGHu/0qp4sDUhMj
 O+0HcCOA2yqxkiLQEEaE3QFjoNN87O9eaS+YogBGCDc0snyAvddnORNKU+fRWPMBZq5R
 TbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=M8gva64w3L5lpkJnHAmUBP99NgwRkGKT4hig382twsI=;
 b=g0yfnhnrurM4izN5BDR53c/FR2tber1bHryqypn+jbvL+yVm00kAotRDtmWDldGF2I
 outcYQ8F1xgCxz5vsfGDwAAiOgq+pKCz1TZgNYqJs6E8rRoHMqa/8Hpyq2tL+MwNfBBS
 MQQ4AQWfRscULDx41MD/l0eWfnZ+ntJUq5K/0vauQRGoutSMvKbahFcu52x8Yp8kWTsd
 dLpo0i5kPgxjb8UmUBY+NTALshiFJrg8rzkRB4k8G5R4wl39slzA3CW5krMsMCnBFsMB
 WboUef0nBlOIHEmgo+2zAqkt9CeofpfYcZ0EzzSILz+j8NcDvmuwrH9gdA3i/9osmgi9
 zcgA==
X-Gm-Message-State: AOAM530ReGYiTXf2zBz0lY2fJYUT059A45zf/I0rnpmCDKr0F307uikN
 HYxXg36Jtw5DFaEAhITeTJ+Cl36VYfnrtJ42sYG5vl3N36xO6HPw
X-Google-Smtp-Source: ABdhPJw4zO59z37EdI4v8JU+j3eaEM43XfYNR8pZ09UDRAhiQMP8DePSaxKE3GNNp6fdcgB5zELd/tzyYWEDrmdINrE=
X-Received: by 2002:a25:aaf4:: with SMTP id t107mr8407199ybi.209.1600806028990; 
 Tue, 22 Sep 2020 13:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR04MB2964FFC6D5EF008F106FFC13FD230@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <CACWQX80fpcLGEjuvUnj4JpinY=SS6eXbHR0i6wdEtjNpMsAHMg@mail.gmail.com>
 <3D149923-0A95-4CE6-82EF-8338677EF831@fb.com>
 <HK0PR04MB29649824A0F904C61F35152AFD3A0@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <3858C398-1F6C-40AC-AD7D-B266646BE3EF@fb.com>
In-Reply-To: <3858C398-1F6C-40AC-AD7D-B266646BE3EF@fb.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 22 Sep 2020 13:20:18 -0700
Message-ID: <CACWQX83XmOJ7a7O_R8pLec-NdrYiP18VVoyAEWacS6wM5Xfd3g@mail.gmail.com>
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

On Tue, Sep 22, 2020 at 12:57 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
>
>
> =EF=BB=BFOn 9/21/20, 9:45 AM, "Kumar Thangavel" <thangavel.k@hcl.com> wro=
te:
>
>     Classification: HCL Internal
>
>     Hi All,
>
>                 Thanks for your comments and suggestions.
>
>                 As suggested, we are planning to implement a new process/=
service like  xyz.openbmc_project.IPMB.FruDevice in entity manager module t=
o support Host FRU through ipmb rather than using dbus-sensors/ipmbsensors =
file.
>
>                 Following are the advantages, if host FRU handling in ent=
ity manager repo.
>
>                 1. All the FRU information is handling in the same repo.
>                 2. Entity manager Probe can work.
>                 3. All the FRU Functions are in the same repo. We can try=
 to reuse most of the functions.
>                 4. Adding Fru object to dbus handling are done.
>                 5. All FRU validations are done here like Format fru, upd=
ate fru property, validate header, Fru AreaLen and checksum. We can try to =
reuse those validations.
>
> What will happen if user is not using fru-device from entity manager, rat=
her choose to use phosphor-ipmi-fru. Here you are restricting user to use f=
ru-device only.

phosphor-ipmi-fru is not compatible with IPMB Frus, as the
specification requires them to be dynamically scanned based on the
SDR.  I guess you could hardcode them, but you'd still have to have
some auxiliary "does my device exist" scanning that starts to look a
lot like entity manager/fru device.  Is the use case you present a
real one, or hypothetical?

>
>                 For scanning the /dev/ipmi-* nodes, we are thinking to us=
e ipmb-channels.json cofig entries in entity manager repo since this config=
 file has valid slave path and bus address.

Please don't.  Entity-manager is dynamic, and the config should be
based on a detected entity.  Mixing the dynamic and static use cases
in this way would mean that we get to rewrite all of this when we have
to support IPMB add-in-cards, which are 99% the same, but need to be
detected instead of hardcoded.
If you want this to be relatively static, attach an exposes record to
your baseboard config that has the information you need (if your IPMB
devices are on the baseboard).

>
>                 Please share your comments if any.
>
>     Thanks,
>     Kumar.
>
>
