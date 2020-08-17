Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 475132478CF
	for <lists+openbmc@lfdr.de>; Mon, 17 Aug 2020 23:26:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVnDM5sVMzDqVx
	for <lists+openbmc@lfdr.de>; Tue, 18 Aug 2020 07:26:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d;
 helo=mail-qk1-x72d.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qhK2vril; dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVnBv0zHGzDqVx
 for <openbmc@lists.ozlabs.org>; Tue, 18 Aug 2020 07:25:26 +1000 (AEST)
Received: by mail-qk1-x72d.google.com with SMTP id b79so16375024qkg.9
 for <openbmc@lists.ozlabs.org>; Mon, 17 Aug 2020 14:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=sUF66sVd76u955MBCGBeGjShaHDBu0NCdrlmb1sNBVw=;
 b=qhK2vrilC42BVQ1qSMuipzeYRduTjyNA4iu1w3HmNYHtvAULwmcEZvOPYfxDvW4Y3E
 QIzAXDMc+unYwpt6R++ZwDCSnMALZqHJ72mYRFSycjtecAs/YkDi1q2qwxCrhfpc196p
 iTeMxrYDFGqklm9q7YIy5aCrrOpC9F0pb/LRVn1pp03RjGvVDSqsoLm1RjsSj6MOs7WH
 Vhu6hesj9RWA8xA4fuGQ6Yvay0/gHBzqCRleL5faIxsBWKHI5ugXTb6hRG4DvoD0ms3u
 JADCuGJ96N93VXCjfmkO0c54uCfAGt9EWz65iCHkLIssmIcetHMdtLH41Xkz/44TiYSI
 haSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=sUF66sVd76u955MBCGBeGjShaHDBu0NCdrlmb1sNBVw=;
 b=gZOi1LW8rFbGmqJozZo4FFJINJJqrKT/VAHS51xL/oyKmZbI/PyWnRP+3P0cRsM4Jg
 ultMmwAuPdrMsFt/2faHcwErM+yauwwVQ9W1f0JXVJ/LnPB6RuR1eRgiuQLYZ/rduO1E
 zxVMXcS3fvKPt01w1YsXbE0pGWESIq5IKDhNOvGhJ1FmiI41bWgjQ9JNwZbXwl6FqysA
 NZyiykDxSWwlrKokS8BJk5mWw7BCMqTXdWAvNf1+lAgy1tOYDlEl5h1YNvE3kla3mE63
 p/b+ecNYz5bz+wpXhiaBBtg8TOXgF4MD3Fl9s+jvoOqS1psWuwQZ64Ko7dKSlt0eqn8P
 Ya8Q==
X-Gm-Message-State: AOAM531AuUdlKJgOIIvlFTgR0OTpIfZR/5fvg64AITzuNd5P5z0nTCOq
 2x9OYih051BLuNVQvGxvNMA=
X-Google-Smtp-Source: ABdhPJxZ5h9uw+WGNFAXGHMbHSI31xzPG2k5JJPImkdQYFcEzDGxRqlYZ6k+CXjgEWLNg/K4cn0New==
X-Received: by 2002:a37:bd8:: with SMTP id 207mr14557368qkl.211.1597699522720; 
 Mon, 17 Aug 2020 14:25:22 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:358c:8a8e:547f:be22])
 by smtp.gmail.com with ESMTPSA id x7sm17808487qkn.53.2020.08.17.14.25.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Aug 2020 14:25:21 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: experts recipe from openembedded
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <5C98E525-D950-4347-87BD-C5EF1DCE3B49@fb.com>
Date: Mon, 17 Aug 2020 16:25:21 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <067D9F94-649D-48F1-852F-7F28B512160E@gmail.com>
References: <5C98E525-D950-4347-87BD-C5EF1DCE3B49@fb.com>
To: Vijay Khemka <vijaykhemka@fb.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Aug 17, 2020, at 2:57 PM, Vijay Khemka <vijaykhemka@fb.com> wrote:
>=20
> Hi Andrew,
> Can you please pull following patch for meta-openembedded from =
master-next branch. I need this library for my module.
> =
https://github.com/openembedded/meta-openembedded/commit/dd0fafdc53834c948=
7dc292ea7a2d870c9654e55

Hey Vijay, nice job sending it upstream first!

My normal process is to pull down our repos like this every other =
Friday. Upstream rebases usually clog up our CI due to changes in base =
packages like gcc and python so it=E2=80=99s nice to let it work its way =
through over the weekends. =20

So, if all goes according to plan we=E2=80=99d have this change in =
openbmc/openbmc next Monday.

Sounds like you need it sooner so I just cherry-picked into =
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/35698=20

Andrew

> =20
> Regards
> -Vijay

