Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E09919A96
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 00:25:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=qh23YtXZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8bqH24c5z3cTj
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 08:24:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=qh23YtXZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=tanous.net (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=ed@tanous.net; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8bpj6Z4Jz2ytN
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 08:24:28 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2c7dbdc83bfso5508002a91.1
        for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 15:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tanous-net.20230601.gappssmtp.com; s=20230601; t=1719440664; x=1720045464; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cLxxV95o96d3Iaa7AgX+PaNdVXk36PRAeGMVQ6abJ8=;
        b=qh23YtXZyWA7/AJLpiEHBfSiMU6SJEi3baWdqiKvYgpm4PZwKXeruzx8sP5ktw2mQz
         1VYMi2Hrpe2onnfjj4krl9AxqiKgeDP4XZEOyRo4nbTyzr7u/Ii8J0c4WZjZoVd8W63n
         YnYKr69nMxaBxm5ZJjWLLOHuKqc0EFKvqYivOO4CJaR9abeUwi6qnpH1M4pSHx96G+79
         roP/Kf48LyhhAuLsEXoVMQHIGEzs7vVjTrJBa98u/GXRgIRTu3hKe196dkj/myWtDbVZ
         diK1A7YlL9h5YplM8G1VlAKYuszp9rPuefWS2aE4B10+RtqiqT2XjVbJDCw1r+hakPYi
         zxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719440664; x=1720045464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1cLxxV95o96d3Iaa7AgX+PaNdVXk36PRAeGMVQ6abJ8=;
        b=jTw69haNVF4Zm7V2INavWYR9uTZ91vi+uXZvNMKuxbOQwtBzeAqv1l4pPQuR+YPVIl
         DK0UTMhiUgD9OL4IgD7KpPM8xk1jLdBQnBk9VyIJPkZqxj0S6xprLiAR0UU8pj/xLgFj
         KRsPCu3zenOfWWpvdwaY1wdwVtG/JbwjLkFSsD5QDucE+SVovBU/JZCUK/4eockRhi/P
         B93tcLbtpVECYgz/r2u17Z72bhEKm1f0yBQ47/hO2tMlDAXaLdjCULZLmDw1QJV/Y/Ce
         7FRsQQ4UDVdoTWzIaFtNPybXwYlNKxDfyfPgu9e79C3IuAHWK8rFpqFItCoL17iOU844
         UY4w==
X-Forwarded-Encrypted: i=1; AJvYcCXYwZ5dpbETgPl6WesBABr2ZeVXAWI4QW+H4h+zefsTOdWec3TJ0rNTyRjrN77VJic+hdivcDBR9jLGMqlGXzaIq9aYk+zkyUY=
X-Gm-Message-State: AOJu0Yxu4LBSE/A4ainvZ07EU1V+eArci5raBbujYQw1Zl8ufD68JYTD
	RiuB3pa0CcxuckfDrRMW1VIR3WuzSiNQxla4WTrONg5uWHqZFC4pmTOqO3QNoEFnqJsKWOBCglx
	h8m5tVqJRtd4FtnryZflct4jj2gi+hZBPg68z2g==
X-Google-Smtp-Source: AGHT+IEU7Msw+0QOlCHPBXPXGId2mFZSaMkp/coStGbiTc9JsfofuT8wXbitIGPS4JdX9o/zvmiPmbo0fhfgtAJ+egk=
X-Received: by 2002:a17:90a:d196:b0:2c8:ea7b:8892 with SMTP id
 98e67ed59e1d1-2c8ea7b8a48mr1418631a91.44.1719440664533; Wed, 26 Jun 2024
 15:24:24 -0700 (PDT)
MIME-Version: 1.0
References: <1403524602.354586.1719434789488@privateemail.com>
 <ZnyKk8xOmIgqAbs0@heinlein.vulture-banana.ts.net> <CACWQX80A_TqXZ5QFyJcEqZZHhRf6ckAnLJJ74guz=SYV3+4gAA@mail.gmail.com>
 <ZnyR5Rw2Zx5I5elg@heinlein.vulture-banana.ts.net>
In-Reply-To: <ZnyR5Rw2Zx5I5elg@heinlein.vulture-banana.ts.net>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 26 Jun 2024 15:24:13 -0700
Message-ID: <CACWQX81ThWsrObQ1Ob5WV_BX0i3MwtrvAMe2ocrRuOiLmpHeqw@mail.gmail.com>
Subject: Re: Request for a new vue3 branch in webui-vue
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: "kirankumarb@ami.com" <kirankumarb@ami.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "a.nikhil@ibm.com" <a.nikhil@ibm.com>, Gunnar M <gunnar@gmills.xyz>, "Renuka.Sharanya.Pundla@ibm.com" <Renuka.Sharanya.Pundla@ibm.com>, "sivaprabug@ami.com" <sivaprabug@ami.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jun 26, 2024 at 3:10=E2=80=AFPM Patrick Williams <patrick@stwcx.xyz=
> wrote:
>
> On Wed, Jun 26, 2024 at 02:57:25PM -0700, Ed Tanous wrote:
> > On Wed, Jun 26, 2024 at 2:40=E2=80=AFPM Patrick Williams <patrick@stwcx=
.xyz> wrote:
> > >
> > > On Wed, Jun 26, 2024 at 02:46:29PM -0600, Gunnar M wrote:
> > > > Kiran and his team have volunteered to sync patches merged to maste=
r to this new 'vue3' branch bi-weekly. Thank you, Kiran! When the migration=
 to Vue 3 is complete, and all commits are synced over, this 'vue3' branch =
will become the 'master' branch.
> > >
> > > We need to be careful about how we do this.  You don't want it to app=
ear
> > > on github as a rewrite of the "master" branch and we absolutely need =
to
> > > at least keep the vue2 code in some branch so that it doesn't get pru=
ned
> > > from the github history.  If we don't do this, it will become impossi=
ble
> > > for people to build older OpenBMC releases.
> > >
> > > I would suggest either:
> > >
> > >     a. We do the opposite: create a 'vue2' branch and update the reci=
pe
> > >        to point at it.
> > >
> > >     b. We use this as an opportunity to migrate from 'master' to 'mai=
n'
> > >        and use 'main' as the vue3 branch.
> >
> >
> > My expectation was that this branch continues to rebase in patches,
> > and once ready to merge, we would just rebase the series on top of
> > master before pushing it so there's no discontinuity, no merge commit,
> > and autobump would just pick it up.
>
> We would have to give "Kiran and his team" permissions in Gerrit to
> force-push to the "vue3" branch in order to facilitate these rebases.

Sorry, I should've said "My expectation was that this branch continues
to cherry-pick in patches"

There'd only be one rebase and push (not force I think?), right at the
end, and I'm happy to do the final merge if that solves the
permissions problem.  I suspect even if we had to reopen a
sensibly-squashed gerrit series for re-review after we thought the
bugs were solved, that might be reasonable, although it's hard to know
based on what's in there.

> It also means potentially unreviewed content ends up in the branch due
> to this permission.
>
> I'm okay with going this route but wanted to make sure everyone is aware
> of the implications.
>
> --
> Patrick Williams
