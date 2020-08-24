Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C27BD25066E
	for <lists+openbmc@lfdr.de>; Mon, 24 Aug 2020 19:33:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BZzk240bWzDqRK
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 03:33:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2d;
 helo=mail-io1-xd2d.google.com; envelope-from=benjaminfair@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=jxn7QwTT; dkim-atps=neutral
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BZzhn6W5JzDqNb
 for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2020 03:32:24 +1000 (AEST)
Received: by mail-io1-xd2d.google.com with SMTP id s1so9526962iot.10
 for <openbmc@lists.ozlabs.org>; Mon, 24 Aug 2020 10:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X2d+YYnhv1lyZhvA/3LvGSthaIHH11abo1FIqIotrc0=;
 b=jxn7QwTToSnWZQLsHbEWOswE2fBRNCFi7BrWOUwcmIp6/FfiyLEpYMfCuJy1XtMb6p
 vwU4R2nGWClIOiYNoDPwP+NyHf3TnD9okOsN3CwGgvTW44893hArB4ib3lqwME23v88o
 OqV4EO9YqcRGpHAuGYPP+/CN8AyURrM9kgexOuxzib9DVQ6OGVNgaXQ11f7mWQADMYwm
 an7Demf2hbR51SJhZX2w2o0PvuEVrXV4oWwhJyBXiRbu+0dJzpbvevoy3GUAC52RQsw+
 ZsI+pP5TjLXN5jETPvF7sUUXOLJdGoJcHASjMp/moV3ln+0AD3EtWGiMhSujFFBQLsMU
 farw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X2d+YYnhv1lyZhvA/3LvGSthaIHH11abo1FIqIotrc0=;
 b=T9U2UKvXMVlFEhjSvKwqLJZUv5eK69nFtN7Z/0mhty0XFo3iLquy9dSM50R3hGfomc
 QLWKefQ1QjQ4XQqbPsLe743xwsMREfBAygx+2+J18Uz++7+8Xs2z/X8PAS/uRs1lRUPO
 G19X+Qxs/URpnmMxyfnW5gLnjZSqSnlrrhXqurpiLfE6E7GVS7iDGVtnWGvXD1luhGGP
 NZpYYO0hVj/nemfzfXzHdltqrv0j1hCV9g6KttKcYUhRU1zxND1b2sacylI44pyL7Z3X
 wtlelbiKAG0684sutbxPlEaYyhgaEKB/533jJJAIrhdj5DfJ98PBwGX3hxE7/UXi/uM6
 6ZVw==
X-Gm-Message-State: AOAM533TbGYdnJI7H4x6u+3DLJU9nguWFCAlAOVz/CZ1uQCDJ5R1CuVB
 qduER3XQgJjJL+aRaC559LTWABy7gQ3ZPnZlv5DqTg==
X-Google-Smtp-Source: ABdhPJwq1pglYhNor09DALuwvIpQrKj79I8bEyPhwiHSqZVAWfj5Ca1NHVRQBU/9TveDMRaJNMuhj3AEIFrhBWGhaN0=
X-Received: by 2002:a02:9247:: with SMTP id y7mr6374004jag.140.1598290340241; 
 Mon, 24 Aug 2020 10:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <ff39e855-d5b6-a789-bcbb-3b87bf786bd1@linux.vnet.ibm.com>
 <20200814231020.GA16853@mauery.jf.intel.com>
 <4cde2763-88b0-447b-1aba-5bb884fae251@linux.vnet.ibm.com>
In-Reply-To: <4cde2763-88b0-447b-1aba-5bb884fae251@linux.vnet.ibm.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Mon, 24 Aug 2020 10:31:42 -0700
Message-ID: <CADKL2t5=gPYVOD+m-swrgW2r2Cw51gtRYfPPWsLup8e9ax3Bcg@mail.gmail.com>
Subject: Re: IPMI implementation of Get Device ID command
To: TOM JOSEPH <tomjose@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, anoo@us.ibm.com,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, "Mauery,
 Vernon" <vernon.mauery@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 24 Aug 2020 at 04:58, TOM JOSEPH <tomjose@linux.vnet.ibm.com> wrote:
>
> Hello,
>
> Thanks for the response on this. Every company seems to have a different
> version scheme and the parsing might not fit into upstream
> implementation of the Get Device ID command.
>
> My proposal is to add major and minor version to the dev_id.json and
> this can be populated in the meta-xxx layer (something like this
> https://github.com/openbmc/openbmc/blob/master/meta-ibm/recipes-phosphor/ipmi/phosphor-ipmi-config.bbappend).
> If the format of the VERSION_ID does not match the master tag format,
> then major and minor version will be picked from the dev_id.json. With
> this approach every company can share the upstream implementation of the
> command. Thoughts?

That approach sounds good to me.

>
> Regards,
> Tom
>
> On 15-08-2020 04:41, Mauery, Vernon wrote:
> > On 14-Aug-2020 11:04 PM, TOM JOSEPH wrote:
> >> Hello,
> >>
> >> We have an implementation of this command
> >> https://github.com/openbmc/phosphor-host-ipmid/blob/master/apphandler.cpp#L571
> >> . The current version of the code derives the major and minor
> >> firmware revision from the VERSION_ID field, and the auxiliary
> >> firmware revision is picked from dev_id.json. The auxiliary firmware
> >> revision is populated at build time
> >> https://github.com/openbmc/openbmc/blob/master/meta-ibm/recipes-phosphor/ipmi/phosphor-ipmi-config.bbappend.
> >>
> >> The implementation of the code is obsolete, as it was based on an
> >> earlier format. The current format of VERSION_ID for example is,
> >> 2.9.0-dev-609-g56f86d23c. There is already a WIP patch to fix this
> >> for the master tag format
> >> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/33893.
> >> <https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/33893>
> >>
> >>
> >> IBM tagging format is different from the tag format of master builds.
> >> One choice is to have the major and minor version added to the
> >> dev_id.json and if the format of VERSION_ID does not match the master
> >> tag format,  pick from the json.
> >>
> >> How are other companies converting their arbitrary tag formats to
> >> IPMI firmware revision fields? Does every company maintain their own
> >> downstream implementation of this command?
> >>
> > We have a two-hash version scheme (one for openbmc, the other for the
> > downstream meta-intel layer) that looks something like
> > wht-0.2-3-gab3500-38384ac. We override the Get Device ID command
> > https://github.com/openbmc/intel-ipmi-oem/blob/master/src/appcommands.cpp#L200
> >
> > to expose part of both of those hashes in the aux bytes. But to get
> > the full version string, we use redfish.
> >
> >> Is a common code possible for converting arbitrary tag formats to
> >> IPMI firmware revision fields?
> >
> > Not that I am aware of. I think this leads to lots of string parsing.
> >
> > --Vernon
