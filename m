Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D61E83BEB22
	for <lists+openbmc@lfdr.de>; Wed,  7 Jul 2021 17:42:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GKkFH5nj8z30BX
	for <lists+openbmc@lfdr.de>; Thu,  8 Jul 2021 01:42:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=up1EwqxR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=up1EwqxR; dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GKkF03GBRz2yhl
 for <openbmc@lists.ozlabs.org>; Thu,  8 Jul 2021 01:41:54 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id p21so4754741lfj.13
 for <openbmc@lists.ozlabs.org>; Wed, 07 Jul 2021 08:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Aw7ZBhAIbqB5J4QvRhgJmRrvCixbwbU2FviXELH1fec=;
 b=up1EwqxRdEuz5oPJLlJICed4qHwyErUH2mtj6jTA4VAO7aiNkf0UNFOBnetYBcfy8n
 mUBlLFbhBEvc2Pt0F9GaC2WIu4huoovmGde+0XeldSUytVHPsdKeyDSvbiBRoAu07ShT
 fXoqVgmztTtrt1KiQnPZF1gMdwXrNbRwpDQ3EMA++aDpuheoGJordh/5sQN+V2/g6qlb
 F5yy8oxvzQj3Nv99XceFlNOlLXRGwJM2GdDKtX7B+GLw19JnYNKVvw736T3/zsogLi8V
 gC+R0ze0oa10CDDXkel1ytBCROrPz5NxvDB5ydUQUPHYZ26Sk6Q6GP+7savkS3ajaNet
 52LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Aw7ZBhAIbqB5J4QvRhgJmRrvCixbwbU2FviXELH1fec=;
 b=tgI2GFaKfZR7w4ilFGAyVkaDq44fTf2lOwl5Ze2aW6atD+tepGfdmEZaNbii7aSDZf
 K2j62bxbG79m/CtTFaRFqKflZX65m+y8rQunUJuE9oCB6DETKEkWKoCTHAkqqbBwRAyX
 Nt7RFXblY+Cn42K/YtaBWOvx97ayny5etho9uBUT9xHWrasmZPp4EmUSJ5nBT3caiwVq
 iOBoUbKG4YoF2Q9rnNH22AxWvxoKjVR63rYsLVjPPdflsHscJfqS8GRMintOVhF//8qJ
 Mo1xY4gCj35lJWH92RtkRgLk0l/usBwJl1yJQcwENzh/a8T352ihqvAV+RgS0/kBFe04
 8KEw==
X-Gm-Message-State: AOAM530k6+nzAEezh6HCHO+iNbHOkde4HYeNOvrnTjKyKp63+gtMbcd9
 M7hFFBpSGwpK8483aRdoFyPVIjJwCdrJ+6VJE7gdjQ==
X-Google-Smtp-Source: ABdhPJwHHFRWv+jMTjGs+f3Bcfxkrif2vnBKzr6hIHlGoiEFY3RCa2Wv7/5yyslPcir53MMr0IWGrluW6DqALgPv6sY=
X-Received: by 2002:ac2:4187:: with SMTP id z7mr18916620lfh.574.1625672509597; 
 Wed, 07 Jul 2021 08:41:49 -0700 (PDT)
MIME-Version: 1.0
References: <B6A810CD-9610-4AFE-8921-EF490734C17D@fb.com>
 <CACWQX82x5OPNu8SSbP1dK5=3rNRo0tqJYN2eW61qDurTOFFkgA@mail.gmail.com>
 <E80ED6F3-9FFE-4037-A417-5C890F86F69C@fb.com>
In-Reply-To: <E80ED6F3-9FFE-4037-A417-5C890F86F69C@fb.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 7 Jul 2021 08:41:38 -0700
Message-ID: <CACWQX82d9NqHatq4of=LrQoP6hfLvbMuZs948ydrThj1J1uhCg@mail.gmail.com>
Subject: Re: Bmcweb redfish multiple host support
To: Naveen Moses S <naveenmoses@fb.com>
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
 "gmills@linux.vnet.ibm.com" <gmills@linux.vnet.ibm.com>,
 "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jul 6, 2021 at 10:00 PM Naveen Moses S <naveenmoses@fb.com> wrote:
>
> Hi Ed,
>
> Thanks for your insights. we will work on it accordingly.
>
> If possible could you also clarify  the following :
>
> In redfish, /redfish/v1/Systems/system is used to store host/server relat=
ed information.
> For LogServices, journal based logs are stored under the below path.
> /redfish/v1/Systems/system/LogServices/EventLog/Entries
> But few logs like sensor & FRU logs are related to BMC, which is displayi=
ng under system path. Could you please clarify why these logs are stored un=
der this system path.

Because this path was analogous to the SEL log, and that part didn't
really matter at the time when there was only a single host;  It
likely could be improved, although maintaining backward compatibility
is going to be difficult.

> Whether can we take this under different path.

I'd need more details on what you're thinking here before I can render
an opinion.

>
> Thanks
>
> On 01-Jul-2021, at 9:58 PM, Ed Tanous <ed@tanous.net> wrote:
>
> On Thu, Jul 1, 2021 at 9:10 AM Naveen Moses S <naveenmoses@fb.com> wrote:
>
>
> Hello All,
>
> I need your suggestion on implementing support for  multiple computer sys=
tems or hosts under redfish implementation of BMCWEB.
>
> Redfish schema supports multiple computer systems under  redfish path "/r=
edfish/v1/Systems/"
>
> Currently in bmcweb redfish core Computer systems path are is configured =
for as singlehost
>
> The redfish path computer system is given below
> "/redfish/v1/Systems/system=E2=80=9D
>
> In case of multiple hosts can we use the following format.
>
> "/redfish/v1/Systems/system1=E2=80=9D
> "/redfish/v1/Systems/system2=E2=80=9D
> "/redfish/v1/Systems/system3=E2=80=9D
> "/redfish/v1/Systems/system4=E2=80=9D
>
> these paths should be populated based on the number of available hosts/co=
mputer systems
>
> Possible options to identify the host count are as given below:
> 1.pass the OBMC_HOST_INSTANCES as a macro definition to bmcweb
>
>
> Please don't do this.  In general we only use configure options for
> things that cannot be dynamically discovered on dbus or via the
> mapper, or where different implementations of things exist that meet
> the same API (like log service).  I don't think multi-host falls into
> either of those categories, as it can be seen on dbus.
>
> 2.Query dbus objects which has individual instance available for each hos=
t using object mapper.
>
>
> This would far and above be my preference, as it's similar to how the
> rest of the bmcweb URIs function.
>
>
> Is there any other alternate way available for identifying host instances=
 at runtime under bmcweb?
>
>
> if we use the above format then can we change the computer system for sin=
gle host
>
> as given below
>
> "/redfish/v1/Systems/system0=E2=80=9D
>
>
> I would much prefer these are just based on the dbus path names
> instead of trying to explicitly pick a name.  That keeps bmcweb
> consistent with other resources, and systems that only implement a
> single host can choose to keep the same odata.id (system) if they
> want.
>
>
> Code reference : https://github.com/openbmc/bmcweb/blob/master/redfish-co=
re/lib/systems.hpp
>
> method : requestRoutesSystemsCollection
>
>
>
> Thanks
>
>
> Looking forward to seeing the patches.  Thanks for looking into this.
>
> -Ed
>
>
