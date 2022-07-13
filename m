Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC58572DC2
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 07:55:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjRg306bzz3c29
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 15:55:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=tUqPB3zW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=edtanous@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=tUqPB3zW;
	dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LjRfY5btSz2ywc
	for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 15:55:00 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id s206so9544752pgs.3
        for <openbmc@lists.ozlabs.org>; Tue, 12 Jul 2022 22:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=i5bMEWR7FTYgyEmkwTgIZV7PAxW+Ipwzf4AOjg8Gfmk=;
        b=tUqPB3zWWn4Y1PVmxnFHBkyrGFgw7ksF3If1aBYBtmBuPRV6hldBfyewX7EWe2hL80
         3U+ZVdh+QWxpxERI91sUWmreAJ17HVPwKraOAfyXw2n9zx3RE5AoCBMzRsPCX96veBFr
         IJHtIWhdCwynTzl4NWl9MO7+yHDO6K6tkswJI2MUHHbn5FB9KtaqIe7xVX8hq910Loza
         Lvc4xNtUj77f4Uz9E7YPRx4NiRYzcPq6I/pmA8/Ud+jROvl60WFX3DtmhWGSmKcIOR2J
         8dzTU46eqAci7IJ3N+Y06ZHPVBrH93xom9vYmvZ9N6EQbxIt5i0e4UFnXLnPNCzeUuKl
         rkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=i5bMEWR7FTYgyEmkwTgIZV7PAxW+Ipwzf4AOjg8Gfmk=;
        b=aEZB3P/qqNkuy49Qp6yImHC0K0RvulquU/VaweyH+QHVZZ8eDYnlbwjzH/dL00oy00
         bMdWxcCqfR0662r6hKDC6zeQFUtE9bB7eeoPeE+0JIsMHaWzZBLC8s66eAY9kMbr3FRV
         evVLC2a33aF3pXcawj7mDzZ9SobkQ9+HCp846GsJHPxhMEeI1VHD9vT7QaukxTzwNCpc
         PdM1mxDd2yFZHJD6iJ5F35nGiwpDbgZaXTVHZp5iZ5vyMOhsQLNwDYqi5iRM8fe8KiWB
         iW5BXOsZTg0Jb9mB2LODaF0nktTxQbiAw1owZgBUNCDK5+cyPFVAk6hLv1THTHmWx65D
         EkuA==
X-Gm-Message-State: AJIora/lOk++Qbk5Hq5rBbiCVU/8mhNtof4OKd/zp/0anii7g1w4HWDv
	mL5pI/T7elYQIpaU01Zd9nUuIbc12zeFDcr+Wh5x+w==
X-Google-Smtp-Source: AGRyM1t4Hb5PC9x1pB4uu4bUCsf78oJ5qlI8mM5E9MUY+WDAfovyO6aMcnIR2OMIsSLN+kpeN+r4cF97K1vfbBOqsPU=
X-Received: by 2002:a63:6b84:0:b0:410:702f:88d8 with SMTP id
 g126-20020a636b84000000b00410702f88d8mr1660901pgc.534.1657691697620; Tue, 12
 Jul 2022 22:54:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxBmFwVmF4cr+_eTFrwdz9-he--PPfRvW=cN6oNGf4KA_A@mail.gmail.com>
 <CAGm54UEA+Z2JSe9iwAcW2=Vjhha6qvO3x+nJ-u_xw=M+5fBmHQ@mail.gmail.com>
In-Reply-To: <CAGm54UEA+Z2JSe9iwAcW2=Vjhha6qvO3x+nJ-u_xw=M+5fBmHQ@mail.gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Tue, 12 Jul 2022 22:54:45 -0700
Message-ID: <CAH2-KxA4QG5uADrEO-NNCzBgeW9tQXwg9FwWvAQ0EFpC6RS=Mw@mail.gmail.com>
Subject: Re: DBus ObjectManager Interface usages within the project
To: Lei Yu <yulei.sh@bytedance.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Brad Bishop <bradleyb@fuzziesquirrel.com>, Nan Zhou <nanzhou@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jul 12, 2022 at 8:07 PM Lei Yu <yulei.sh@bytedance.com> wrote:
>
> On Wed, Jul 13, 2022 at 2:49 AM Ed Tanous <edtanous@google.com> wrote:
> >
> > We've had a couple cases in the project where patches have needed to be=
 slowed down because of inconsistencies in our use of object manager, so IM=
O, the time has come to make our usage of ObjectManager consistent, documen=
ted, and drop support for the (not upstream) daemons that don't follow the =
rules.  As part of this, we will port forward all the upstream daemons to b=
e consistent, and do our best to avoid bugs, but this email is intended to =
inform those that have non-upstream daemons about the change so they can re=
solve their implementations.
> >
> > The basics:
> > ObjectManager DBus interface will now be required for any daemon implem=
enting a Sensor.Value interface or Inventory.Item interface.
> >
> > Daemons producing sensors will be required to place their ObjectManager=
 at /xyz/openbmc_project/sensors
> > Daemons producing inventory items will be required to place their Objec=
tManager at /xyz/openbmc_project/inventory.
> >
> > Both of these interfaces will be required to be published before claimi=
ng a well known name on dbus, to allow for the possibility of caching imple=
mentations at some point in future.
> >
> > Functionally, this gets a little complicated because the sdbusplus::asi=
o::object_manager bindings in their default invocation create an ObjectMana=
ger at the root object /, so we need to execute this in a few steps.
> >
> > 0. Send this email out, outlining the problem, and warn the community t=
hat if this is an assumption you make in your downstream daemons, those ass=
umptions will need to change.  Get consensus from maintainers.
> > 1. Update the phosphor-dbus-interfaces documentation for both Sensor.Va=
lue and Inventory.Item to call out the required-ness of ObjectManager, and =
the explicit dbus path where it's required to be placed.
> > 2. Identify all the asio daemons that need changes, and publish changes=
 that move the object_manager to the appropriate path.  This is mostly goin=
g to be a tree-wide grep for sdbusplus::asio::object_server, and look for d=
aemonst that don't make use of the add_manager() API.  Anyone directly call=
ing the Sensor or Invertory ObjectManager interfaces will need to port to t=
he new paths, but luckily, this isn't a very common operation, and I beleiv=
e bmcweb and phosphor-ipmid-host might be the only direct users.  In bmcweb=
, there is actually a convoluted piece of code that uses the mapper to sort=
 out the location that the ObjectManager exists at so Redfish sensors shoul=
d remain consistent, and we don't yet have code that relies on ObjectManage=
r for Inventory items.  I believe phosphor-ipmi-host has a similar piece of=
 code that should protect us in this case, but I defer to those maintainers=
.
>
> Is it better for the asio API to provide an extra constructor to take
> a object_path?
>
> E.g.
>  object_server(const std::shared_ptr<sdbusplus::asio::connection>&
> conn, const std::string& path)
>
> Then the users could initialize its object_server at expected path direct=
ly:
>
>  sdbusplus::asio::object_server objectServer(bus, "/my/path");
>
> instead of two lines of code like:
>
>  sdbusplus::asio::object_server objectServer(bus, true);
>  objectServer.add_manager("/my/path");

I like the thinking, but considering that ObjectPath is not required
in all cases, and there might be cases where they have multiple (if a
daemon supported sensors and inventory) I don't think we can have it
in the constructor, or at the very least we'd have to support the
non-path constructor as well, which basically amounts to the same as
we have (it would just call add_manager internally).  I don't think
the one line of code savings is worth it in that case.

>
> --
> BRs,
> Lei YU
