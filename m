Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B292344618
	for <lists+openbmc@lfdr.de>; Mon, 22 Mar 2021 14:44:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3whs1XLpz304L
	for <lists+openbmc@lfdr.de>; Tue, 23 Mar 2021 00:44:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Dgr3E2UC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2a;
 helo=mail-io1-xd2a.google.com; envelope-from=manojkiran.eda@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Dgr3E2UC; dkim-atps=neutral
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3whd6G61z2y0N
 for <openbmc@lists.ozlabs.org>; Tue, 23 Mar 2021 00:44:16 +1100 (AEDT)
Received: by mail-io1-xd2a.google.com with SMTP id z136so13960569iof.10
 for <openbmc@lists.ozlabs.org>; Mon, 22 Mar 2021 06:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=blmjp27tHMXfYUQGNoHo2kF6INKKhEij5X01I+SrwW0=;
 b=Dgr3E2UC5r1pQi4TfiLnwWvbzPkysL6o4DGvikil4vwcewWyBZq4Fmp+TfN4U3At2E
 3Zj5hth4YLYHY6FcqCp0WcxJttHRondgX+ohWzJWJF/mRPjmtZBxJUzRpOj7SDGzSKhi
 OXZxh76KowLWWljJsE4H/KdLdek6gCzQKzUzw5DbDOiqBpPCbFLD9t2GILiCgMrAG8Bq
 j6tJN8OoT7dLfFt5eguAbOAUobo+3ZhzbPZ831TBfKwYDJdROxGicl21CFLuNBWke2Nv
 mSx5W0xuGj6I/+ioxKtYuci6eJRe0bWaiZypWYm2oitWZOI+rIR/RFVnc7HfGb9JC/BG
 Xakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=blmjp27tHMXfYUQGNoHo2kF6INKKhEij5X01I+SrwW0=;
 b=RXEArNsD+LcyK1QKNaYtk5jJRZIfPki0F37E2zmIgGxr0/gCEoXk/6NFIVkpnJ85wF
 TT8vsBatY4hZs/L7RVfAS3McVuOPg8r+IkXDG3mpLlYWKqhVZdNifqcXQzjHmy5VUWKm
 599DiKtIrextctpmhf/3Ukx472f3fVyYSFTiTJoR3BdaBIkqOHTaaNSVQurMO/04XzWt
 eFF7HRMUhZLFjBIVx92tDi+HVkdW0Y1ll3niNvE8EJvsAJ/ehiXQtw/Qveh/syopvPt1
 vhAZKtU1HBKri7Oi5pQtd3pwbuk7EqAOA5C726MeylwFQrSwXC/Y9fqKzdLTtM+HLYLq
 NcCQ==
X-Gm-Message-State: AOAM531EuslB6p8OI/H3jnQFKxE+4q689/iM1J1mN6t23WjGktbpF0o6
 0KV+Yss8RMlflw8s1/khafIRRuXxEP/X63hm3hXdccD3ZmhQ4w==
X-Google-Smtp-Source: ABdhPJzavfTWXFv2D/wg60WFSbB2WL8UQNOzjU9yfod5HP6/friQ30cuLv+U2dG2UBqDPXSlpvSM5cgN2M0siw/g7Cg=
X-Received: by 2002:a02:a303:: with SMTP id q3mr11332434jai.32.1616420653017; 
 Mon, 22 Mar 2021 06:44:13 -0700 (PDT)
MIME-Version: 1.0
From: manoj kiran <manojkiran.eda@gmail.com>
Date: Mon, 22 Mar 2021 19:14:01 +0530
Message-ID: <CAFe7vzSvFt7bpAGz9u+vH42RQd9vPEQ_1pvi-1UNDJXMdOAPrQ@mail.gmail.com>
Subject: Spell check in OpenBMC CI
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000d4adc605be204251"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000d4adc605be204251
Content-Type: text/plain; charset="UTF-8"

Apologies for sending this email again - for some reason it fails to
publish this on to mailing list.

Hi All,

OpenBMC coders are all atrocious spellers. In my opinion, spell-checks are
never given the highest priority as we always were more obsessed with code.
Correcting spelling mistakes is not as easy as it sounds, it cannot be
automated as many reasonable-sounding corrections could change the meaning
of the comment.

I have been recently working on enabling the spell check on commits in
OpenBMC CI so that the CI can score a -1 when it sees a potential
incorrect/misspelled word(s) in the commit as per its knowledge acquired
from the dictionary.
While checking the existing implementations in various opensource projects,
I was impressed with the way the Linux project[1] addressed this issue, It
seems to use a python library called codespell [2] for improving their
upstream patches. It seemed pretty simple & doable even in OpenBMC.

As an initial work, tried to bring the same package in OpenBMC & my intent
is to start with just checking the commit message first [3], and then
improve the infrastructure to check the comments in the code as well. The
only real concern is that we should have a dictionary that should be simple
& easily editable.

My initial patch-set addresses this issue by having two dictionaries:
One generic dictionary that comes along with the code spell library [4], so
that we can update this dictionary with the mistakes done at a global level.

Another OpenBMC specific dictionary[5] that sits in the
openbmc-build-scripts repository, allows users of OpenBMC to add words into
them. ( I copied the dictionary currently being used in the Linux project
as an initial version)

Dictionary format :
Each line corresponds to a single word and they follow the "mistake->
correction" format.

I'd love community feedback on this . Please feel free to stop by [3] and
give your suggestions/review comments.

Thanks,
Manoj

[1] https://github.com/torvalds/linux/blob/master/scripts/checkpatch.pl#L62
[2] https://github.com/codespell-project/codespell
[3]
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+/41454
[4]
https://github.com/codespell-project/codespell/blob/master/codespell_lib/data/dictionary.txt
[5]
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+/41454/1/dictionary/openbmc-spelling.txt

--000000000000d4adc605be204251
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"font-family:monospace,monospace" class=3D"gm=
ail_default">Apologies for sending this email again - for some reason it fa=
ils to publish this on to mailing list.<br></div><div style=3D"font-family:=
monospace,monospace" class=3D"gmail_default"><br></div><div style=3D"font-f=
amily:monospace,monospace" class=3D"gmail_default">Hi All,<br><br>OpenBMC c=
oders are all atrocious spellers. In my opinion, spell-checks are never giv=
en the highest priority as we always were more obsessed with code. Correcti=
ng spelling mistakes is not as easy as it sounds, it cannot be automated as=
 many reasonable-sounding corrections could change the meaning of the comme=
nt.<br><br>I have been recently working on enabling the spell check on comm=
its in OpenBMC CI so that the CI can score a -1 when it sees a potential in=
correct/misspelled word(s) in the commit as per its knowledge acquired from=
 the dictionary.<br>While checking the existing implementations in various =
opensource projects, I was impressed with the way the Linux project[1] addr=
essed this issue, It seems to use a python library called codespell [2] for=
 improving their upstream patches. It seemed pretty simple &amp; doable eve=
n in OpenBMC.<br><br>As an initial work, tried to bring the same package in=
 OpenBMC &amp; my intent is to start with just checking the commit message =
first [3], and then improve the infrastructure to check the comments in the=
 code as well. The only real concern is that we should have a dictionary th=
at should be simple &amp; easily editable.<br><br>My initial patch-set addr=
esses this issue by having two dictionaries:<br>One generic dictionary that=
 comes along with the code spell library [4], so that we can update this di=
ctionary with the mistakes done at a global level.<br><br>Another OpenBMC s=
pecific dictionary[5] that sits in the openbmc-build-scripts repository, al=
lows users of OpenBMC to add words into them. ( I copied the dictionary cur=
rently being used in the Linux project as an initial version)<br><br>Dictio=
nary format :<br>Each line corresponds to a single word and they follow the=
 &quot;mistake-&gt; correction&quot; format.<br><br>I&#39;d love community =
feedback on this . Please feel free to stop by [3] and give your suggestion=
s/review comments.</div><div style=3D"font-family:monospace,monospace" clas=
s=3D"gmail_default"><br></div><div style=3D"font-family:monospace,monospace=
" class=3D"gmail_default">Thanks,<br>Manoj<br><br>[1] <a href=3D"https://gi=
thub.com/torvalds/linux/blob/master/scripts/checkpatch.pl#L62">https://gith=
ub.com/torvalds/linux/blob/master/scripts/checkpatch.pl#L62</a><br>[2] <a h=
ref=3D"https://github.com/codespell-project/codespell">https://github.com/c=
odespell-project/codespell</a><br>[3] <a href=3D"https://gerrit.openbmc-pro=
ject.xyz/c/openbmc/openbmc-build-scripts/+/41454">https://gerrit.openbmc-pr=
oject.xyz/c/openbmc/openbmc-build-scripts/+/41454</a><br>[4] <a href=3D"htt=
ps://github.com/codespell-project/codespell/blob/master/codespell_lib/data/=
dictionary.txt">https://github.com/codespell-project/codespell/blob/master/=
codespell_lib/data/dictionary.txt</a><br>[5] <a href=3D"https://gerrit.open=
bmc-project.xyz/c/openbmc/openbmc-build-scripts/+/41454/1/dictionary/openbm=
c-spelling.txt">https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-=
scripts/+/41454/1/dictionary/openbmc-spelling.txt</a></div><div class=3D"gm=
ail_default" style=3D"font-family:monospace,monospace"><br></div></div>

--000000000000d4adc605be204251--
