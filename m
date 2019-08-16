Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D5590911
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 21:57:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 469DcZ0nqXzDs09
	for <lists+openbmc@lfdr.de>; Sat, 17 Aug 2019 05:57:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hQiNFW9W"; 
 dkim-atps=neutral
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 469DYT25MkzDrvG
 for <openbmc@lists.ozlabs.org>; Sat, 17 Aug 2019 05:54:36 +1000 (AEST)
Received: by mail-ot1-x331.google.com with SMTP id r20so10691861ota.5
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 12:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=c4d/++OraHVkXid54e7jB+nKTyfxrydj1LqGjoXFpe4=;
 b=hQiNFW9WTM0YHt+QaWFKjQUklyPUX7adefHcE0KvY2fpEtkhIDkNGEw0CChC3B+heu
 ZP1N5xzs0se4CxojIeEj66umesSI3uRehMXJo92Up8zdSJXEqLWDS/mmeQo3WZ5Cy14z
 YaVprSFeVVoXEib/PDhmom8WXHgX4m8Vd2ZqWszMntZSWvRXNuLmrCZObrFGzgS34uVI
 q8Bhg3Uc6+qSCT5WzAI8ssNDdEND+sv39AAuXTfi4Do8e6H57KlRUFU1Jteo5v7Kdmu9
 eLp+8aQUkF5b0YP/cx1bXReKcqdin05kwHOrjM2tvnM9h/u35FPzchF0TsgK+jL/rkW3
 AFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=c4d/++OraHVkXid54e7jB+nKTyfxrydj1LqGjoXFpe4=;
 b=NDETAReQFQj4ZzprpmIduPQ0O6ONGPGJXOxkV3+7EDKHh5MuLjkD7dz4J5MBgPu9WE
 OjPN5st8wxQ01Ilcx6HTj3gw+uXhR/7fbX9u9CVJvgWEionxv1CNt0wT3okwxw8lpZN9
 jo905amcE+FtNp7S9iiOFEMc1Au7/Dzk70kQ0drPZJKfP0XVqALr45IYZ2zzyQqii+Z3
 8NEazm8cEf6UraKpCNMCqcwNl2hEo3GKTpXl0ZAOMzPnOXXurXr0GZrb1CBqMc4ia5ym
 3b0sNHlk2rlgfOLRW63hbPZ4+G7SPc4rcKfimsn3RYzXDUeaAjx477YBX9bsMas0ExG0
 OyDQ==
X-Gm-Message-State: APjAAAXB5Mh1Pj1xUvMoxN2ivSUd+0IZXorbxrr5WwwiRYPIKUyigyY4
 eYWOfW6Vw4x65guknejODEGMi1cueIoCVkBnEO0=
X-Google-Smtp-Source: APXvYqyHcGEmCQmVUtcE5a9yVvHcyqmLG56iLxoY5oDieaOAP7UQ1yTNX3kUI51ifi+QhiuIQt9rz6Bqq+gVFBpvhVc=
X-Received: by 2002:a9d:6a4a:: with SMTP id h10mr9182882otn.260.1565985272923; 
 Fri, 16 Aug 2019 12:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.545.1565898074.372.openbmc@lists.ozlabs.org>
 <A586CD10-BC88-4316-B900-E3F0874B0910@fb.com>
 <c20c680c-45af-7b5f-129a-00b053516ed5@linux.ibm.com>
In-Reply-To: <c20c680c-45af-7b5f-129a-00b053516ed5@linux.ibm.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 16 Aug 2019 14:54:16 -0500
Message-ID: <CALLMt=quLfszM2bu-tN2GaPaz9YZr3h2HOG0UTGgdV2Bb9xrTQ@mail.gmail.com>
Subject: Re: Policy on Tools Posting
To: Joseph Reynolds <jrey@linux.ibm.com>
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
 Wilfred Smith <wilfredsmith@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 15, 2019 at 6:03 PM Joseph Reynolds <jrey@linux.ibm.com> wrote:
>
>
> On 8/15/19 4:57 PM, Wilfred Smith wrote:
> > My manager (Sai) is asking whether there is precedence for having utili=
ties posted outside the OpenBMC repository. Do we want 100 OpenBMC tools re=
positories, each managed differently or 1 harmonized repository?
> >
> > Separately, is there any effort to create a =E2=80=9Ccommon core=E2=80=
=9D for OpenBMC such that an effort akin to POSIX or the Single UNIX Specif=
ication isn=E2=80=99t needed ten years from now? Without standard API (or a=
t least abstracted tools) for things like where FRU information is located =
or sending IPMB commands, isn=E2=80=99t the market for innovative software =
stifled (Android software market vs iOS, or even Linux vs Windows)?
>
> My view is to focus on enhancing the Redfish functions so that users of
> OpenBMC systems can do everything they need to without having use Secure
> Shell (ssh) or any of the command line utilities ssh can access (such as
> systemctl, busctl, or obmctool).  See some publicly-readable IBM
> discussion on this topic here: https://github.com/ibm-openbmc/dev/issues/=
612

Once a system has shipped to a customer, ensuring 99% of what they need
to use that server is available via Redfish definitely makes sense to me.

> Meanwhile, when us developers need to access the BMC via ssh, we are
> happy to use the existing command line utilities and don't see the need
> for any more.

Hmm, I don't think I agree with this. I think obmcutil has provided a
lot of useful
abstraction for developers and users of OpenBMC (like our lab team).
No one really wants to remember some of the long cumbersome commands
done by obmcutil, nor do they want to deal with situations where we change
the underlying D-bus API in a certain version of firmware. obmcutil provide=
s a
nice abstraction to that and I could see tools that provide abstractions fo=
r
looking at error logs or listing system inventory could also be useful. I d=
on't
think these tools should ever be things people purchasing OpenBMC based
products count on using (but they could still be there if they wanted).

>
> I would prefer to see our energy focused on enhancements to Redfish and
> on utilities which use the Redfish APIs (akin to redfishtool).
>
> - Joseph
>
> >
> > Wilfred
> >
> >> On Aug 15, 2019, at 12:41 PM, openbmc-request@lists.ozlabs.org wrote:
> >>
> >> Send openbmc mailing list submissions to
> >>      openbmc@lists.ozlabs.org
> >>
> >> To subscribe or unsubscribe via the World Wide Web, visit
> >>      https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.ozla=
bs.org_listinfo_openbmc&d=3DDwICAg&c=3D5VD0RTtNlTh3ycd41b3MUw&r=3D-ektT-tD9=
zf2rfUisE63RqiDagGyhGey2hbEGa-47kc&m=3DCsXIqDLC_9ZYrVSwNllcHo7GjqAG9mj2S6Ny=
mPQTblk&s=3D_RrYmmMf-6XU6r5LsXsWLj8G0K_qaWyo6K2yDU5JGu8&e=3D
> >> or, via email, send a message with subject or body 'help' to
> >>      openbmc-request@lists.ozlabs.org
> >>
> >> You can reach the person managing the list at
> >>      openbmc-owner@lists.ozlabs.org
> >>
> >> When replying, please edit your Subject line so it is more specific
> >> than "Re: Contents of openbmc digest..."
> >>
> >>
> >> Today's Topics:
> >>
> >>    1. Re: Policy on Tools Posting (Vijay Khemka)
> >>    2. [PATCH dev-5.2] fsi: scom: Don't abort operations for minor
> >>       errors (Eddie James)
> >>    3. Re: [PATCH] net/ncsi: Ensure 32-bit boundary for data cksum
> >>       (David Miller)
> >>    4. Re: [PATCH v4 2/2] hwmon: pmbus: Add Inspur Power System
> >>       power supply driver (Guenter Roeck)
> >>
> >>
> >> ----------------------------------------------------------------------
> >>
> >> Message: 1
> >> Date: Thu, 15 Aug 2019 19:07:26 +0000
> >> From: Vijay Khemka <vijaykhemka@fb.com>
> >> To: Andrew Geissler <geissonator@gmail.com>, Wilfred Smith
> >>      <wilfredsmith@fb.com>
> >> Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
> >> Subject: Re: Policy on Tools Posting
> >> Message-ID: <68929B76-8826-4DAD-A29E-DF7A119D00C5@fb.com>
> >> Content-Type: text/plain; charset=3D"utf-8"
> >>
> >>
> >>
> >> ?On 8/15/19, 5:59 AM, "openbmc on behalf of Andrew Geissler" <openbmc-=
bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org on behalf of geissonator@gmai=
l.com> wrote:
> >>
> >>     On Mon, Aug 12, 2019 at 7:58 PM Wilfred Smith <wilfredsmith@fb.com=
> wrote:
> >>>
> >>> 1. Are there guidelines/procedures specific to submitting command lin=
e tools and utilities? I have heard that there may be a repository and/or p=
ath dedicated to CLI tools.
> >>     The community has definitely tended to limit wrapper tools within
> >>     OpenBMC. We had a discussion a while back that we're open to some =
but
> >>     the API's to them really need to be thought out and reviewed becau=
se
> >>     command line tools become customer API's (i.e. people start writin=
g
> >>     scripts on top of these tools that then become key to the
> >>     manufacturing process or some other critical area).
> >>
> >>     Anything that goes into OpenBMC needs to support OpenBMC interface=
s.
> >>     For example, I'm not familiar with fruid-util's D-bus service
> >>     xyz.openbmc_project.FruDevice. A "busctl tree
> >>     xyz.openbmc_project.Inventory.Manager | cat" shows the inventory i=
tems
> >>     on OpenBMC.
> >>
> >>     One issue we have within OpenBMC is there may be different
> >>     implementations of the D-bus API's for a given area. For example,
> >>     Inventory has different implementations so I'm not sure which repo
> >>     would best fit your tool. That type of issue leads me to wonder if=
 we
> >>     should put the tools with the interface definitions in
> >>     openbmc/phosphor-dbus-interfaces? Or maybe a separate phosphor-too=
ls
> >>     repo would be more logical for these.
> >> Andrew, I like the idea of having phosphor-tools which can be a placeh=
older
> >> for any commandline tools and can grow as per requirement. Currently
> >> it can start with 3 proposed tools.
> >>
> >>     Either way, I think command line tools should each get their own
> >>     mini-design doc
> >>     (https://github.com/openbmc/docs/blob/master/designs/design-templa=
te.md)
> >> Wilfred, Can you please create a document as per this design template =
and submit for review.
> >>
> >>     with requirements and interfaces clearly defined for review by the
> >>     community. If we can find a generic tool that multiple people find
> >>     useful, we can then find a place to put it. Otherwise, you could h=
ost
> >>     your tools outside of openbmc/ github and just pull them into reci=
pes
> >>     from within your meta-facebook layer.
> >>
> >>> Thanks in advance,
> >>>
> >>> Wilfred
> >
> ...snip...
>
