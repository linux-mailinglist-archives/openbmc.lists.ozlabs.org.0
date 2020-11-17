Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 228152B6DA0
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 19:44:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbFGt5z13zDqNZ
	for <lists+openbmc@lfdr.de>; Wed, 18 Nov 2020 05:44:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2a;
 helo=mail-io1-xd2a.google.com; envelope-from=suichen6@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QYi66cQg; dkim-atps=neutral
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbFG52bjjzDqN3
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2020 05:43:52 +1100 (AEDT)
Received: by mail-io1-xd2a.google.com with SMTP id s24so22214967ioj.13
 for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2020 10:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kaYqccmC01fPSICXtkgwyMI91KiA4JZVbROXYAK+kCo=;
 b=QYi66cQg/j2NvDLBkC5XikUXoY1kcrH20vL0mPoUJvZgXy0z8x0Dmlct4CfYei6Z3o
 kyp1JzKVzAzFkDEn5D/SrG577m6z5YIZrMjQMcpLNaqvR/e7v1UbCWxRMc3OmzH5hQRU
 ytvXwqE4FUnCHV5+BYHCoVk18SwOLd09sTKFvLliLK0AqKMLC4N44nbz62RJRjXz8dqM
 T5sBwYJnzPE7GQezk7rXW4sFJTr4PXK7LKFoJp++q4/Yl/CANxsdHuLXZNX2/RACWOs7
 RZKmf+CD2EpJPADZRMu10vSkgQXLo3QsNWyscbqq7OlDbZbPbzE0wIYZDNMVFRS4Cw8Q
 0ELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kaYqccmC01fPSICXtkgwyMI91KiA4JZVbROXYAK+kCo=;
 b=tN4sjDIX9vJkIFbGxlW4pPLkSMaPBVgg8QBlV1toZx0rHfFpApN0e/VUv9m4hRyH0/
 oqn5gmvhomX0poaWbr8rMD2Xic8D1G3Ap5kaB9oJfNMjc0XINuMbSgHUUD/l84NFVRr0
 Wmf5LimoMGBhfaoxC5AqoUSBY2dy6j+I/DsnBEC4W3lTnZWzGmY4QGv07xW/+ZYl/fCe
 7DtXh3//k1cCdWbUvkRHg5PBGFpGJLK/W0AKv3fXGIEb2heiCI8X0PGLlnmiR1rf8RsH
 KEf5WmXL6XUeUNH0+1QeSZ01Pm+R/P4y6EUYKwtSvprkuInhrU+vRhwXhA65NeivGWqv
 cHzg==
X-Gm-Message-State: AOAM5329R/drXCykpXb2C3FepR+wNb9c69rGEnXqLSXV+ckYv14zJue/
 6c5+ys/fgNFnnx8PDwJBG31mnQyd9LFtq3eVXBA=
X-Google-Smtp-Source: ABdhPJygg5QnRb46qWRIw9n4GfKWU1UO5t7+IFOo7ITuUb71ef7OgAs4sbAg2N4Gfl0dDSUlUPt4uDyrVxAMJZUoBh4=
X-Received: by 2002:a05:6602:5de:: with SMTP id
 w30mr12372723iox.64.1605638628737; 
 Tue, 17 Nov 2020 10:43:48 -0800 (PST)
MIME-Version: 1.0
References: <8da567c0-b5a4-47c0-90d6-d2de96ae99e5.moyan.yyb@alibaba-inc.com>
 <0647d5b3912534e4cb81d7e4953a26799851e857.camel@fuzziesquirrel.com>
 <cc0cc576-62d0-4c63-93d2-11d585b557a6.moyan.yyb@alibaba-inc.com>
 <F137C3AA-8FA4-4404-831F-C8BDA5B1465F@fuzziesquirrel.com>
 <196c13b1-92cd-48eb-83a3-8accdee838f6.moyan.yyb@alibaba-inc.com>
 <20201117131613.GE4495@heinlein>
In-Reply-To: <20201117131613.GE4495@heinlein>
From: Sui Chen <suichen6@gmail.com>
Date: Tue, 17 Nov 2020 10:43:37 -0800
Message-ID: <CAFaEeaEbHTVhN1LHzV2LZ140hRvYzDpGnb36f1H+BqPw+Czqvg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=E5=9B=9E=E5=A4=8D=EF=BC=9AI_just_want_to_join_the_openbmc_develop?=
 =?UTF-8?Q?er_community?=
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
Cc: =?UTF-8?B?5p2o5YuH5YW1KOacq+WyqSk=?= <moyan.yyb@alibaba-inc.com>,
 =?UTF-8?B?5p2O5b+X5YW1KOi+ueiNkik=?= <zhibing.lzb@alibaba-inc.com>,
 openbmc <openbmc@lists.ozlabs.org>, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 =?UTF-8?B?5bi455CzKOeJueedvyk=?= <terui.cl@alibaba-inc.com>,
 =?UTF-8?B?5p2O576/KOS5ieWkqSk=?= <yitian.ly@alibaba-inc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Moyan,

If I understand correctly what you can do is to commit to the review
branch, and as described you need to complete all the setup steps
described in the link (
https://github.com/openbmc/docs/blob/master/development/gerrit-setup.md
)

After you complete the setup steps you should able to run the command
to commit a change to review:
"git push gerrit HEAD:refs/for/master"
Note that it's not just "git push" as is shown in your screenshot.

If the command is successful, you will be given an URL like the following:
https://gerrit.openbmc-project.xyz/c/openbmc/meta-alibaba/+/XXXXX
In this URL, "XXXXX" is the change number.

One example successful output is as follows (I'm using a different
repo but it should be similar for meta-alibaba):

suichen@suichen:~/Downloads/openbmc-tools/suichen/hwmon-bmk$ git push
gerrit HEAD:refs/for/master
Enumerating objects: 7, done.
Counting objects: 100% (7/7), done.
Delta compression using up to 12 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (6/6), 10.69 KiB | 10.69 MiB/s, done.
Total 6 (delta 1), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (1/1)
remote: Processing changes: refs: 1, updated: 1, done
remote: commit 94600f6: warning: subject >50 characters; use shorter
first paragraph
remote:
remote: SUCCESS
remote:
remote: Updated Changes:
remote:   https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-tools/+/3538=
7
hwmon-bmk: microbenchmark for file-based sensor-reading
remote:
To ssh://openbmc.gerrit/openbmc/openbmc-tools
 * [new reference]   HEAD -> refs/for/master
suichen@suichen:~/Downloads/openbmc-tools/suichen/hwmon-bmk$


Hope this might be useful.

Thanks!
suichen


On Tue, Nov 17, 2020 at 5:22 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Mon, Nov 16, 2020 at 03:46:09PM +0800, =E6=9D=A8=E5=8B=87=E5=85=B5(=E6=
=9C=AB=E5=B2=A9) wrote:
> > Hi Brad,
> >     I see the meta-alibaba has been create, that's greats, thank you. B=
ut while i send the file to the Repository,it has some question as below. I=
f am i have no Authority=EF=BC=9F
> > Thank.
>
> Hello.
>
> Your issue is that you're trying to push directly to the branch and
> bypassing review rather than pushing to a gerrit review branch.
>
> Please see this document and especially the "push code change to Gerrit"
> section:
>
>     https://github.com/openbmc/docs/blob/master/development/gerrit-setup.=
md#push-code-change-to-gerrit
>
>
> --
> Patrick Williams
