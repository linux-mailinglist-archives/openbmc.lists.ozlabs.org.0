Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC878290A01
	for <lists+openbmc@lfdr.de>; Fri, 16 Oct 2020 18:51:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCXHS1qXgzDqrn
	for <lists+openbmc@lfdr.de>; Sat, 17 Oct 2020 03:51:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=k/RNwi7W; dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCXGV54D5zDql8
 for <openbmc@lists.ozlabs.org>; Sat, 17 Oct 2020 03:50:53 +1100 (AEDT)
Received: by mail-yb1-xb29.google.com with SMTP id x20so2437405ybs.8
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2020 09:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HdV+GNNOZtVT/UxVpfj3e6i+PSviUW3xKRFF4Y0sOhM=;
 b=k/RNwi7WKzACAO7/ZJj6+d470Tj/ac/K9VK2EQcV+U3GDvfbgzO7/XknW9fpzliRt/
 40GaAg4oztzzQKQrqmbqu/Ni30SydM8vPibE4USeZM5zKGcF9sF5LyT03VE5LbKeqOxf
 i447Yumz66Fem/7eoDtgJMlDSr4sxx+aJ2ryne4LvEQAdwzd7PMmqmpVRMBrpI8cjnbR
 1tV6FFjF8gWl3HP5eV7GvG1VKjmfJvtbb8eyEwllZWof6IdwN2Y+FY68yNZ/fFWLcBxD
 bbB1KJziRfOJU2DdsTy8GtS9P38bK7LS3Nb7dsGN9nQmmygRaRkhg8fq12/2eOCWVOSg
 XCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HdV+GNNOZtVT/UxVpfj3e6i+PSviUW3xKRFF4Y0sOhM=;
 b=FXISoZ0ZqubEYzuXhu0RISe+vmR87g0Ut//ev6+1lcvz/EC/uk9cPEVa0Zyi52HZcz
 n7MmWnfwLQqEK8PF1VjU8dDoou/tuP8lf9qwIwLOM/9tpYQ6Y3GobbUKc1zDe48scBOn
 Md+Sz3NCa+IC2tivD9xa1AXBSCutnzORnw7YAlnRUuGSKqmPM9IgUowq3laJQdcfcNRQ
 al35JRuODrb70a74v/WG0HQ40EK3Ibzb/0ljRbeFR6z6mEcaRiRojwTcNlik9+//SZYd
 /MFh6eAHGLcgJV37BnqRxtQcZ3AVhu4T9539vPbUZ3KqHUx9mEBweYfjsfgB8EQVvYfv
 xuZw==
X-Gm-Message-State: AOAM5301iK7Ehpc1xGBF4ttMucXDKO+RUQVtB8GgnmdplYvUt11RgkyV
 PIaeJYSdVPrzEmLZLMhAK0YFrp6I1wdewy8MGeix1Q==
X-Google-Smtp-Source: ABdhPJySHKsSxRdBxS6AuDxrS3C6IltOcIWdogWo+noM5wkC7UIrwZTDTVYHeLPSBtBDxwHOJeEnpi0H+YZW5VjCASw=
X-Received: by 2002:a25:c094:: with SMTP id c142mr5780961ybf.170.1602867050048; 
 Fri, 16 Oct 2020 09:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <CADVsX8_eYXAtGMgoe9LEKRtaf0ufdn0BJA+Fn8J9xpAKnTDStQ@mail.gmail.com>
In-Reply-To: <CADVsX8_eYXAtGMgoe9LEKRtaf0ufdn0BJA+Fn8J9xpAKnTDStQ@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Fri, 16 Oct 2020 09:50:39 -0700
Message-ID: <CACWQX80Bm1W0Y8JT+n3rf3qmWLeDi1pGTLSmr_piQQtuJMOdpw@mail.gmail.com>
Subject: Re: /etc/migration.d
To: Anton Kachalov <rnouse@google.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 14, 2020 at 11:49 AM Anton Kachalov <rnouse@google.com> wrote:
>
> With moving from root-only environment to unprivileged users' space, we n=
eed to ensure a smooth transition. To achieve that we need a mechanism for =
one-shot per-package scripts that would take care of migration. That's not =
only about groups & owners, but a general approach.

Are there other use cases that necessitate a general approach?  I'm
not against it, but owners and groups seems unique in the regard that
the migration has to run as root.  Most (all?) other migrations don't
seem to, or haven't in the past, and therefore can be run as a
pre-init, or as part of the service itself.  If the service itself
does the migration, the startup dependencies are a lot easier to track
as a maintainer, and running your migrations in a compiled language
likely has a positive effect on boot time, which has been a problem in
the past (still is depending on who you ask).

It should be noted, several apps have done simple migrations of config
file formats in the past, so there's some precedent for it, just not
in a generalist solution.

>  It's similar to firstboot, but has a different purpose.
>
> I'm going to prototype a robust / naive solution to start a service befor=
e everything else in the system with a condition (non-empty /etc/migration.=
d) and iterate through all files. Each script has to run at list with "set =
-e" to bail out on failures. If the script succeeded -- it will be removed.

The script itself will be removed?  Presumably that means you're
executing the script out of non-volatile?  That seems like a security
gap in that an attacker could inject migration scripts that did
anything, and have the system run them for them.  Maybe just keeping
some kind of external log of "these scripts have completed" or,
preferably, enforcing that migration scripts are idempotent would be
better, and would reduce the possibility of a bad actor getting
permanent execution privileges if they somehow overwrote the scripts?

>
> The tricky part is: what if the script fails? Keep it, ignore the failure=
 and proceed with others and then boot the system? Or proceed other scripts=
 as well and then enter some "failure state"?

Assuming you can have migrations that are interlinked, have to be run
in order, and sometimes can fail, maybe the "best" thing to do is to
simply stop on the failing one, and try to boot the system as well as
it's able to in the degraded state.  This would mean that flakey
scripts would be rerun on the next boot, and hopefully succeed, and
consistently failing scripts could be replaced on a subsequent
firmware update with more robust versions, and rerun.
