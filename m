Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 749EB572BBE
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 05:08:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjMy024VPz3c4S
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 13:08:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=gjST36wq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com; envelope-from=yulei.sh@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=gjST36wq;
	dkim-atps=neutral
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LjMxX4GZLz2xBF
	for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 13:07:41 +1000 (AEST)
Received: by mail-ot1-x335.google.com with SMTP id cb12-20020a056830618c00b00616b871cef3so7505574otb.5
        for <openbmc@lists.ozlabs.org>; Tue, 12 Jul 2022 20:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kDU03wXNExQI6qvA0ApevnEPj3E5Zy/BPG/GKpoCiL4=;
        b=gjST36wq3SC1bZYynlUBWZJZIFb8nDcJ2eaUxaMhf7ggNK2YRexjiP2OuO1vTSsyu9
         dgKUyOE2H/hrwxUdw3IKnQ69DA+rIXE1KG9wUG/qdWNFP8ycf+z65s4MHt/qXCFQsSZH
         H8ALb0BMwbYQPS7eeZQLCoTeH0FhKl3/mz1WtLVg2ofkC2qQoL7uSiwpPm9b2ryE2vLw
         NqSKX1/GBL0y5QBnSVLpM88OkIEfAg4BU4USVeidqqMx0CvI0rMXOGA2YwNPOzwYMzW5
         gMaht98N+rEQHmewwp+II6RP08LeYJoxbj0esNmVpNO7XmKEUjtWHSbGmfEiU5gKcqQW
         noxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kDU03wXNExQI6qvA0ApevnEPj3E5Zy/BPG/GKpoCiL4=;
        b=6SWlHclOwrHCjjXdYREErf99oBX3MvNQ50GDi3ronBdLOmmUGeiK5kkQP48XOQnOk3
         iLe+5kAHhVO/9ZhPrW19p7btoyxFwSRXnDPfmBYfWlQg6YTCQFpAdN2o4xE4a26C6eQw
         jxv7bWw3QqPJFtJGeJW8II87F9Yndxn10+w3lzDvAUh1+BgvuAgaZfIl52NFEkm+NEJb
         dep6a60oxDLJTui3noELL9Ju7jKontj+Ru8CZPMlo8hk424GYyIHMT0qjReQZ/I8KsOA
         5YE3Epi+phvW3m8ZrlBOmKyNbZFzD1t4FwgmtPvUdHhrmXs78bJrIoggn0VKYXc68Exp
         XQgA==
X-Gm-Message-State: AJIora98E8QCO2etFZbSGks83DE/vhNxkuh3DH2m12XOppXYNQ0GRfiz
	h1zNrZ8o27g4oGl1R15wiBv44t7kmgsIPPniQSG/MA==
X-Google-Smtp-Source: AGRyM1v70AqwnbC1Kyj5N4kUZeWnvM0lHNZMhA6jWDR98/vQf4OIzjn0AdwDSV8bAXAfuyzaIvRrcr/S9M5/EY3bJzw=
X-Received: by 2002:a9d:3646:0:b0:618:fe0f:8f68 with SMTP id
 w64-20020a9d3646000000b00618fe0f8f68mr484521otb.57.1657681656700; Tue, 12 Jul
 2022 20:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxBmFwVmF4cr+_eTFrwdz9-he--PPfRvW=cN6oNGf4KA_A@mail.gmail.com>
In-Reply-To: <CAH2-KxBmFwVmF4cr+_eTFrwdz9-he--PPfRvW=cN6oNGf4KA_A@mail.gmail.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 13 Jul 2022 11:07:27 +0800
Message-ID: <CAGm54UEA+Z2JSe9iwAcW2=Vjhha6qvO3x+nJ-u_xw=M+5fBmHQ@mail.gmail.com>
Subject: Re: DBus ObjectManager Interface usages within the project
To: Ed Tanous <edtanous@google.com>
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

On Wed, Jul 13, 2022 at 2:49 AM Ed Tanous <edtanous@google.com> wrote:
>
> We've had a couple cases in the project where patches have needed to be s=
lowed down because of inconsistencies in our use of object manager, so IMO,=
 the time has come to make our usage of ObjectManager consistent, documente=
d, and drop support for the (not upstream) daemons that don't follow the ru=
les.  As part of this, we will port forward all the upstream daemons to be =
consistent, and do our best to avoid bugs, but this email is intended to in=
form those that have non-upstream daemons about the change so they can reso=
lve their implementations.
>
> The basics:
> ObjectManager DBus interface will now be required for any daemon implemen=
ting a Sensor.Value interface or Inventory.Item interface.
>
> Daemons producing sensors will be required to place their ObjectManager a=
t /xyz/openbmc_project/sensors
> Daemons producing inventory items will be required to place their ObjectM=
anager at /xyz/openbmc_project/inventory.
>
> Both of these interfaces will be required to be published before claiming=
 a well known name on dbus, to allow for the possibility of caching impleme=
ntations at some point in future.
>
> Functionally, this gets a little complicated because the sdbusplus::asio:=
:object_manager bindings in their default invocation create an ObjectManage=
r at the root object /, so we need to execute this in a few steps.
>
> 0. Send this email out, outlining the problem, and warn the community tha=
t if this is an assumption you make in your downstream daemons, those assum=
ptions will need to change.  Get consensus from maintainers.
> 1. Update the phosphor-dbus-interfaces documentation for both Sensor.Valu=
e and Inventory.Item to call out the required-ness of ObjectManager, and th=
e explicit dbus path where it's required to be placed.
> 2. Identify all the asio daemons that need changes, and publish changes t=
hat move the object_manager to the appropriate path.  This is mostly going =
to be a tree-wide grep for sdbusplus::asio::object_server, and look for dae=
monst that don't make use of the add_manager() API.  Anyone directly callin=
g the Sensor or Invertory ObjectManager interfaces will need to port to the=
 new paths, but luckily, this isn't a very common operation, and I beleive =
bmcweb and phosphor-ipmid-host might be the only direct users.  In bmcweb, =
there is actually a convoluted piece of code that uses the mapper to sort o=
ut the location that the ObjectManager exists at so Redfish sensors should =
remain consistent, and we don't yet have code that relies on ObjectManager =
for Inventory items.  I believe phosphor-ipmi-host has a similar piece of c=
ode that should protect us in this case, but I defer to those maintainers.

Is it better for the asio API to provide an extra constructor to take
a object_path?

E.g.
 object_server(const std::shared_ptr<sdbusplus::asio::connection>&
conn, const std::string& path)

Then the users could initialize its object_server at expected path directly=
:

 sdbusplus::asio::object_server objectServer(bus, "/my/path");

instead of two lines of code like:

 sdbusplus::asio::object_server objectServer(bus, true);
 objectServer.add_manager("/my/path");

--=20
BRs,
Lei YU
