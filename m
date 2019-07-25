Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 220A1758E8
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 22:35:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vkVb2k0NzDqHV
	for <lists+openbmc@lfdr.de>; Fri, 26 Jul 2019 06:35:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xvy6Wbrm"; 
 dkim-atps=neutral
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vkSK3ssLzDqQ1
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jul 2019 06:33:21 +1000 (AEST)
Received: by mail-ot1-x32f.google.com with SMTP id j19so14573273otq.2
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2019 13:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CeUnnzUh4v5TFGNVzv0m3LiFb1CrJL1tvIbvnRrHqWs=;
 b=Xvy6WbrmiJhRolH1RTZH7XNmGN24xyzf74zgLuk/scR8nf0quqtKng2ppndRen8q64
 YaDFweEm61UFIjeNRBl8fsMUWjAuRli90GyppnpII2goV3aol7U5GHfS8dgnqnJn7lLZ
 +16l7FtciDZgjgb0PVacmdi9UGFwidm5R1wK22bnQ30Ca9pdSjUS96ZScK2OnH60+OM9
 HqFHwIpcINPy/inUEOe6NnlEpW0pSnAxatqc0VTAfONi07KVHhHfHIRmJzINyPu7wLc3
 M87ilj2LenCEVSPoRCPZ+gaPrLkgKJqGbZ7oV2eUv8kbcOsG9Rv/LxlL+ExWQy/a2Fs7
 q5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CeUnnzUh4v5TFGNVzv0m3LiFb1CrJL1tvIbvnRrHqWs=;
 b=q+1s1zYgu8fWPhhaxOnzhs7U5ynbkpe3TkG2Fr3QDIVlIWO/xmVNHE80yDPYgDQQLo
 zb4zWmV+HSqmMhCFITXnV1Zj+fW8gUvycqggqs2lVwH378xddCLK1IM2GpUHekETvuud
 c6CZsgq9Kj/bnctLhkmoN9L6+gMuAbGmfqD0DrOTl3nDG02mi/f7sIoxd3GYi5ydLSBf
 dW8/pfDPZnJUq1dUN4h+4kDI6GQ5hDpzmmkJcXi75zoUNDTYCMxji46X2jKJ+U/YsE1q
 J2wzBoORpMIfpuc8UlIH9ks7mUsg6ra0Qhd4n8bBmFY8LGTRb9hizECYWwa0mqRRv4OU
 lWSg==
X-Gm-Message-State: APjAAAVGJbH8XGBvFJ2VImowI4+ABnIBfb+8Wmk59xsWgkIVs8eu1dtL
 URxmGOYwXDwBTtHtK+TSCSVfqHYx3tggNZscOns=
X-Google-Smtp-Source: APXvYqxYSIVWSrMQo4k/D89UarYdzB4qhiHJBfS9lqz44szNmHm0l+o/Vje+jkQ+rrB+g9rgNmnPGRjlItdbl9D463k=
X-Received: by 2002:a05:6830:1316:: with SMTP id
 p22mr25438318otq.329.1564086797590; 
 Thu, 25 Jul 2019 13:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <904952B3-C01C-489C-BDD6-AB96F6734201@fb.com>
 <dd457a99-5202-415c-abb6-b4fad030e9ee@www.fastmail.com>
 <20190725022922.dqwkb2g4djsnobnw@thinkpad.dyn.fuzziesquirrel.com>
 <51140097-5a0b-4f5a-a198-c2c76b1013b9@www.fastmail.com>
 <7AF31809-55BF-4F0A-B2C4-A56A21BE1F5F@fb.com>
In-Reply-To: <7AF31809-55BF-4F0A-B2C4-A56A21BE1F5F@fb.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 25 Jul 2019 15:33:01 -0500
Message-ID: <CALLMt=oR-0C4PGgJxJ_Q06qqbuAwyQ0Yx_Yu1OXhiOmK0Qceiw@mail.gmail.com>
Subject: Re: CLI Tools
To: Wilfred Smith <wilfredsmith@fb.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jul 25, 2019 at 2:20 PM Wilfred Smith <wilfredsmith@fb.com> wrote:
>
> All,
>
> I=E2=80=99m not sure what OpenBMC=E2=80=99s or Facebook=E2=80=99s officia=
l stance on CLI is, so consider this comment to be a =E2=80=9Cshot from the=
 hip=E2=80=9D of someone who means well.
>
> It seems to me that at least three buzzwords require invocation: consiste=
ncy, discoverability and automation. Obviously any developer who cares enou=
gh to plumb the bowels of a vendor=E2=80=99s D-bus implementation can write=
 his own utilities and has many means of accomplishing his objectives. But =
those areas are critical for the devop who just needs to get a task done an=
d cares little about a particular vendor=E2=80=99s implementation.
>
> 1. It would be good to agree on a set of common, simplified commands for =
key operations that do not impose a steep learning curve. (Committing =E2=
=80=9Cdisable auto-reboot=E2=80=9D to memory is reasonable; committing =E2=
=80=9Cbusctl =E2=80=A6long hierarchical path=E2=80=A615 parameters=E2=80=9D=
 is not)
> 2. It would be good to have a common means of discovering the available t=
ool(s), their most common usages and adaptations. =E2=80=A6possibly as simp=
le as having a good base =E2=80=9Cman=E2=80=9D page that vendors can adapt.=
 (it=E2=80=99s 3 AM, there=E2=80=99s a power grid failure and you need to r=
ecover from a cluster fault without doing a Google search=E2=80=A6can you f=
igure it out, even if you=E2=80=99ve never done it before?)
> 3. To enable automation in production, the commands should be scriptable =
and the means of catching and handling errors should be well-defined. (Than=
ks for the exit code 1, I know =E2=80=9Csomething=E2=80=9D is wrong=E2=80=
=A6let me determine =E2=80=9CYou can=E2=80=99t reconfigure the FCoE connect=
ion because the NIC is offline=E2=80=9D and allow a script to detect that, =
enable the NIC and carry on).
> 4. Further, I think obmcutil should be extensible in a manner compatible =
with Bitbake layers. This may avert the proliferation of vendor-specific, i=
ncompatible, functionally differing tools. It should be a framework that ma=
kes it easier to develop and extend compliant tools than to roll =E2=80=9CA=
ndy-dbg-nvme-cfg=E2=80=9D

I definitely agree on all fronts. I've gotten a lot of complaints as we've
changed D-bus API's and target names over the years. We created openbmcutil=
 as
our standard for out of band access[1] (similar complaints with our custom =
REST
api's). Moving to Redfish and our ability to use off the shelf tools like
Redfishtool should slowly deprecate most of openbmcutil.

As noted above, for internal, we've got obmcutil[2]. We recently moved obmc=
util
from a python based app to bash so that we could make python optional in ou=
r
phosphor layer.

I'd definitely be interested in ways to add bitbake-layer based options to =
this
tool, but hopefully without having to add python back.

The biggest issue I've seen with tools is that it becomes a new interface w=
hich
must continue to always be supported. It definitely comes with a cost so we
always want to be conscious of what we add to it.

High on my list is the ability to disable autoreboots and/or the host watch=
dog.
Listing, clearing, and displaying phosphor-logging events would be nice.

[1]: https://github.com/openbmc/openbmc-tools/blob/master/thalerj/openbmcto=
ol.py
[2]: https://github.com/openbmc/phosphor-state-manager/blob/master/obmcutil

>
> Wilfred
>
>
>
> > On Jul 24, 2019, at 7:58 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> >
> >
> > On Thu, 25 Jul 2019, at 11:58, Brad Bishop wrote:
> >> On Thu, Jul 25, 2019 at 11:06:13AM +0930, Andrew Jeffery wrote:
> >>> Hi Wilfred,
> >>>
> >>> On Wed, 24 Jul 2019, at 14:04, Wilfred Smith wrote:
> >>>> There was a discussion a while back (2 years ago? In
> >>>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.ozlabs.=
org_pipermail_openbmc_2016-2DNovember_005307.html&d=3DDwIFaQ&c=3D5VD0RTtNlT=
h3ycd41b3MUw&r=3D-ektT-tD9zf2rfUisE63RqiDagGyhGey2hbEGa-47kc&m=3Dz0EEIpo6k4=
yQxVtT14vhkqxHDpyyymwj4U8p5gpO140&s=3DKr2nAn2xlXfEc0WFaemmDme66nyV2FHI6kg9W=
Rrmdsc&e=3D )
> >>>> where the OP (Patrick Williams) expressed concern over the
> >>>> proliferation of command line tools. Patrick=E2=80=99s interest invo=
lved how to
> >>>> integrate iotools. Others chimed in questioning whether it=E2=80=99s=
 better to
> >>>> provide compact commands for common needs or encourage exploration b=
y
> >>>> requiring longhand. Patrick inquired about the target audience for t=
he
> >>>> tools.
> >>>
> >>> I'm all for helpers for common tasks. If we can integrate them into o=
bmcutil
> >>> that would be ideal. The alternative is that we require people write =
things like:
> >>>
> >>> # busctl set-property `mapper get-service /xyz/openbmc_project/contro=
l/host0/auto_reboot` /xyz/openbmc_project/control/host0/auto_reboot xyz.ope=
nbmc_project.Control.Boot.RebootPolicy AutoReboot b false
> >>>
> >>> to disable auto-reboot or
> >>>
> >>> # busctl set-property xyz.openbmc_project.Network /xyz/openbmc_projec=
t/network/eth0 xyz.openbmc_project.Network.EthernetInterface DHCPEnabled b =
1
> >>>
> >>> to switch DHCP on. Quite frankly that's a ridiculous requirement to f=
orce on
> >>> everyone.
> >>
> >> Years ago when Patrick wrote the referenced note, the belief was that
> >> the OpenBMC DBus API would be stable.  But that thinking has long sinc=
e
> >> been rejected - the OpenBMC DBus is not stable and as such it probably
> >> doesn't make sense to be sharing it (via busctl commands) with our
> >> users?
> >
> > Yeah, lifting an obmcutil interface to represent something users want t=
o
> > achieve (`obmcutil dhcp enable`) rather than exposing implementation
> > details would be a win.
> >
> >>
> >>>
> >>> Having said that some of these already have shortcuts, such as
> >>>
> >>> # systemctl stop host-failure-reboots@0
> >>
> >> It might already be too late, but we probably should not have presente=
d
> >> systemctl commands as stable interfaces for our users either, for the
> >> same reasons as I've mentioned above.
> >
> > Right.
> >
> > Andrew
>
