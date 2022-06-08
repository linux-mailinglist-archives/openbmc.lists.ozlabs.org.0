Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99955543D25
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 21:54:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJHxb3HmLz3bph
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 05:54:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=BYvXUppb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=edtanous@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=BYvXUppb;
	dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJHxB583Tz3bd4
	for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2022 05:54:21 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id l2-20020a05600c1d0200b0039c35ef94c4so9685326wms.4
        for <openbmc@lists.ozlabs.org>; Wed, 08 Jun 2022 12:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TrR134YMhz93w/BMV392xqnX8sbZBhVkwbLwkGjUZkY=;
        b=BYvXUppbmOhIld4bYp+kxBZZac2ed6AltGlVrmvruFSRwQlg/n4fhqM0ysjhsNelQd
         BcKrbZpPdxs+3HKag5IGtnfYCvOLSYdj31WhJuC9fNXT0hwQ9/9qaT0c9IdAEoLYJLoI
         ePJM8XZSJ4Sy7GdFEDgFvbMEk4NByRWG0a0lOnbp299ebsaL9z0NxMvQ2KBitog9fyht
         6eT6gx950qRFp5174B6rM8RNm3vP2RNiVwVj2y0+4ENtLnQ0lGqqNM1xwz9jIodaqAvF
         KyhCgirwo786Zf0oCJW3mlgArOBx9XyyyjeL4W4yLbwexWOfSP5mQtJw+LTWhn4alRkg
         QnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TrR134YMhz93w/BMV392xqnX8sbZBhVkwbLwkGjUZkY=;
        b=rPyIqZbrhyYVLY/leWdA78V/x+w9oHvz2eFW9wzMCqD3Y2GBJxvGfHJGTT1YCw5UQ/
         tpmBHFqWjkRk2MAX6f2SuTmqGWmHlnFJKtxBMKNl/vRzJPMOjtQ23fuFqyCbD1gYZiSs
         ls6klQ0mhNCGgkTj/jMXSlTL3fg+uQR6K580iEbmtlHvbp9Bn/L9KKTO1D2ebzl2Wd8H
         FPh6auh+KlLuYcS2RSdWMHFeUa296jwnCMIF8s/3l5yIil0jEC7qDVFCp+lXcjkjLasM
         PZb7zYreF69i5H7kP+qWNT4TSzWqt/IpWzjA4GayMu40dh9Xqv6HQRNv5gLMmxSk2SLP
         RMSA==
X-Gm-Message-State: AOAM531ZxM3pv/Gne3UR05WcrthvvO1H1ILVTzf5uWk5ow+vPu+SP9BC
	hWtFGxCHKOlRfjYgqVWkVTbEhzTT71DK9hWYLHrhHA==
X-Google-Smtp-Source: ABdhPJzWJLKu5yl4PdUxO9ZDFgerMNF4ZPrVOxKWPLJs643F4gGZlczVEHmO2nr+UrMu6wWCNb9VBpTeuUPn4JoTMl8=
X-Received: by 2002:a7b:cd83:0:b0:39c:46d2:6ebb with SMTP id
 y3-20020a7bcd83000000b0039c46d26ebbmr831022wmj.187.1654718053390; Wed, 08 Jun
 2022 12:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <49220e5b-bc49-2cef-fff2-234e24015fc0@linux.ibm.com> <13bef4e2-e8ad-b158-d2fc-bbf55bec6850@linux.ibm.com>
In-Reply-To: <13bef4e2-e8ad-b158-d2fc-bbf55bec6850@linux.ibm.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 8 Jun 2022 12:54:01 -0700
Message-ID: <CAH2-KxAuCf5JtuvTHongA74NGcFh+j71yyVo5qbJ9OxxY9cwMA@mail.gmail.com>
Subject: Re: Security Working Group meeting - Wednesday June 8 - BMCWeb
 authority checks
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
Cc: Krzysztof Grobelny <krzysztof.grobelny@intel.com>, openbmc <openbmc@lists.ozlabs.org>, Gunnar Mills <gmills@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jun 8, 2022 at 12:18 PM Joseph Reynolds <jrey@linux.ibm.com> wrote:
>
> BMCWeb maintainers,
>
> FYI, the security working group reviewed BMCWeb's basic authority
> checking mechanisms, and I have summarized that discussion in the
> meeting notes.  We are struggling to find ways to improve or tighten the
> D-Bus API layer.
>
> This email is for information only.  No action is needed.
>
> Joseph
>
>
> -------- Forwarded Message --------
> Subject:        Re: Security Working Group meeting - Wednesday June 8 - r=
esults
> Date:   Wed, 8 Jun 2022 14:06:37 -0500
> From:   Joseph Reynolds <jrey@linux.ibm.com>
> To:     openbmc <openbmc@lists.ozlabs.org>
>
>
>
> On 6/7/22 11:12 PM, Joseph Reynolds wrote:
> > This is a reminder of the OpenBMC Security Working Group meeting
> > scheduled for this Wednesday June 8 at 10:00am PDT.
> >
> > We'll discuss the following items on the agenda
> > <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLx=
xsDUWmAOI>,
> > and anything else that comes up:
> >
>
> Attended: Joseph Reynolds, Yutaka, Ruud Haring, Dick from Phoenix,
> Krishnan Sugavanam, Mark McCawley, Russel Wilson
>
>
> The meeting went about 20 minutes over time (80 minutes total).
>
>
> 1 Progress on SELinux gerrit review
> https://gerrit.openbmc.org/c/openbmc/docs/+/53205
> <https://gerrit.openbmc.org/c/openbmc/docs/+/53205>
>
> Note the design is intended for BMC which have a larger flash image
> size.  For example the OpenBMC witherspoon reference platform has a 64Mb
> flash divided into 2 sides, with space for a 20Mb readonly filesystem,
> so it is too small.  SELinux is intended for BMC with 256Mb SPI flash,
> where SELinux adds  about  20Mb (initial guess).
>
>
> Ruud is continuing to work on the design.  Discovering what config
> changes are needed by enabling SElinux.  For example, SELinux adds a
> `-Z` flag to many commands to show SELinux attributes. SELinux-enabled
> busybox (-Z flag) exists.  Attempting to build from Yocto recipe.
>
> Attempting to follow meta-selinux docs.  Debugging.  Reach out with
> questions to the yocto community (perhaps via email list in
> https://wiki.yoctoproject.org/wiki/Security).
>
>
> We did a deep dive on BMCWeb authority checking by following a Redfish
> API call:
>
> *
>
> After a Redfish session is created, that session has a role and a
> set of privileges.
>
> *
>
> When that session is used to invoke an HTTP operation, that
> operation=E2=80=99s  privileges are checked against the session=E2=80=99s=
 privileges.
>
> *
>
> The Redfish spec described this in DSP0266 > Security details >
> Authorization.  We peeked at this spec.
>
> *
>
> We looked at the Redfish =E2=80=9Cdelete user=E2=80=9D API as implemented=
 by BMCWeb.
> https://github.com/openbmc/bmcweb/blob/002d39b4a7a5ed7166e2acad84e0943c3d=
ef9492/redfish-core/lib/account_service.hpp#L1941
> <https://github.com/openbmc/bmcweb/blob/002d39b4a7a5ed7166e2acad84e0943c3=
def9492/redfish-core/lib/account_service.hpp#L1941>
>
> This defines:
>
> o
>
> the HTTP operation (DELETE
> /redfish/v1/AccountService/Accounts/<str> where <str> is a
> username).
>
> o
>
> along with the privileges required to perform that operation:
> namely redfish::privileges::deleteManagerAccount, which only
> Administrator users have.
>
> o
>
> The C++ code to implement the operation (which basically invoke
> the phosphor-user-manager API via D-Bus system bus with parameters
>
> +
>
> Bus: xyz.openbmc_project.User.Manager
>
> +
>
> Object path: (as C++ variable userPath)
>
> +
>
> Interface: xyz.openbmc_project.Object.Delete
>
> +
>
> Method: Delete
>
> *
>
> We talked about, but did not look at BMCWeb=E2=80=99s router function, wh=
ich
> routes operations to their implementation (such as =E2=80=9Cdelete user=
=E2=80=9D
> above), and we talked about but did not look at the authority check
> it performs.  That code is in the =E2=80=9Chandle=E2=80=9D method, here:
> https://github.com/openbmc/bmcweb/blob/002d39b4a7a5ed7166e2acad84e0943c3d=
ef9492/http/routing.hpp#L1236
> <https://github.com/openbmc/bmcweb/blob/002d39b4a7a5ed7166e2acad84e0943c3=
def9492/http/routing.hpp#L1236>
>
> *
>
> We looked at BMCWeb=E2=80=99s implementation of the Redfish privilege
> registry.  Specifically, the generated header file here
> https://github.com/openbmc/bmcweb/blob/master/redfish-core/include/regist=
ries/privilege_registry.hpp
> <https://github.com/openbmc/bmcweb/blob/master/redfish-core/include/regis=
tries/privilege_registry.hpp>is
> a translation of the redfish spec=E2=80=99s privilege registry.  The BMCW=
eb
> contributors maintain this file (runs as needed and checked in to
> the repo), and the definitions are used within the operations
> handlers (such as =E2=80=9Cdelete user=E2=80=9D).
>
>
> A basic understanding is that OpenBMC=E2=80=99s authority checking (which=
 asks:
> =E2=80=9Cam I allowed to perform this operation?=E2=80=9D) is handled by =
BMCWeb, and
> there is no authority checking at the D-Bus layer. (Currently anyone who
> needs to use a D-Bus API must have root authority). This is a security
> problem we are trying to solve. (TODO: articulate why this is a problem.)
>
> Two approaches were briefly discussed (not necessarily as complete
> solutions):
>
> *
>
> BMCWeb drops to the logged-in user (switch user command (su) or the
> setuid kernel call).
>
> *
>
> SELinux labeling model.
>
>
> For example, if desired, we can use SELinux to ensure the =E2=80=9Cdelete=
 user=E2=80=9D
> dbus api can only be used by bmcweb and that it cannot be used by any
> other service (like IPMI or by SSH/bash).  Then we can ensure only the
> phosphor-user-manager service is allowed to modify the /etc/passwd &
> shadow files.  Doing so will lock down who is allowed to perform BMC
> user management.
>
>
> Revisit some initial use cases for selinux (examples):
>
> 1.
>
> Limit what files bmcweb process can reach.  In my opinion (Joseph)
> this would be an easy initial use case for SELinux because BMCWeb
> only touches a small set of files,and has no reason to touch other
> files.  Also phosphor-user-manager only touches a small set of files
> (including /etc/shadow), and has no reason to touch other files or
> to reach out to the network.
>
> 2.
>
> Control which D-Bus apis bmcweb is allowed to use. (All of them?)
>
>
> Here is an attempt to state a security problem more clearly: How do we
> limit specific dbus calls to specific users or to specific processes?
> Alternatively: How do we push down the BMCWeb=E2=80=99s authority model i=
nto the
> D-Bus APIs?  And what additional security would this give us?
>
>
>
> Joseph
>
> >
> >
> >
> >
> > Access, agenda and notes are in the wiki:
> > https://github.com/openbmc/openbmc/wiki/Security-working-group
> > <https://github.com/openbmc/openbmc/wiki/Security-working-group>
> >
> > - Joseph
>

ACK.  Considering how many people in the security working group seem
to care about this stuff, it would help a lot if they could
participate in reviews.  Even some of the files mentioned above
(privilege registry specifically) have changed recently to try to
improve this situation, but received very little feedback input on
Gerrit, which is unfortunate given the amount of discussion I see
going on above.

I support (at least in part) most of the experiments suggested above,
and can't wait to see what the patchsets and designs look like so we
can talk in the next level of detail.

-Ed
