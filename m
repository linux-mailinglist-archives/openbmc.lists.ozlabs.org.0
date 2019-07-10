Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E4964B54
	for <lists+openbmc@lfdr.de>; Wed, 10 Jul 2019 19:17:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kQqZ5gbFzDqqW
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2019 03:17:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=derick.montague@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pamm9TQk"; 
 dkim-atps=neutral
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kQq2182hzDqpJ
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jul 2019 03:17:16 +1000 (AEST)
Received: by mail-io1-xd2a.google.com with SMTP id z3so6452177iog.0
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jul 2019 10:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aboJj+Wlo940ltaG86ffQX7jEoh2mHJ2yuz9PhSABlA=;
 b=Pamm9TQk7ZT2HgO+QGaT5w1debiJWnAF450dErLSf/CSYXVo9VZqtxECqJVlcE/hr9
 vkh/EvkLmVlHE6nfgUxS8I4XDc9waNObe0owkUgfQOi/paylDohEd+OHAREYCBmlIfY6
 csWGtFbu1rvKPDxWYSMBYNrTC6plCkUjvfyEytSKTm2aSORZdJkiGqiOH6GLY93rZujh
 OCPkvTgiWQgUMIcFQg5oni1fuJeqlEkgHtMp1LjkAPIiG7Ga5s+1qeXRWwavCxQXZNJD
 TvuROcsGNmXIfMYUAQtojpKZd4ZUjIuM/bp54ynz6Esok4flByII+L5Vw4/McUAf/Liu
 nnSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aboJj+Wlo940ltaG86ffQX7jEoh2mHJ2yuz9PhSABlA=;
 b=qcaX+wXt2apC0BouP/f1yaT/QKtamb0kRvLkEkNcGL+4xPDHuFSEI6nxqAdiG3CNVr
 eprvu5d7BagSvLVHsB+HhN68H4/egNCaWZH9STKFUv6YBobOM2+9gXYi42OwQaRYqUtZ
 ageGykAFtrYQDcWsTbn7Z41bVLFLzEBjMGBTc0Yf/TpTrkUbg3RwfnI4Qv3KqPZoXcKC
 xoe9BqwCvfsnSGJaqqTbxJxWVTyfT8J/x1bWOX2giqoZQCU2whXfNSxeVuV5otVeIBGn
 VNKEs/+Hg9GvqAtXnYgSKobxXz4hm4/YXc19jBhu7iR2KcET/to4kiCjQmb0CVRH4RCZ
 G3ag==
X-Gm-Message-State: APjAAAX+uTlVQOCTEH2B4wdjQpDO0rwrDcXYthu+3LcqVvBLGLiq012S
 UzHeb2mrRD9jXMt81o6cqJzkf+oiXfUDdJnIlVw=
X-Google-Smtp-Source: APXvYqwK421ikk19GLCHMKctm8wsK27jKoHYtvXxHL4E/xjBy/omFyR0WsbzvQEH/V5Bn1AMN7v7d6hZ3Yf5dyhxB2Y=
X-Received: by 2002:a5d:960e:: with SMTP id w14mr8942793iol.189.1562779032823; 
 Wed, 10 Jul 2019 10:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAOUmYFRfVQha0NCZd2aLTc-EC2GNF8wuXqnAyWNMCpzcecQUKw@mail.gmail.com>
 <6f963ba0-467f-14fe-ac0b-7c09b547d109@intel.com>
 <CAOUmYFRHh3bQSwmFMEcvokd6_yFxPE7-X+UmBTcFxMegHdX0eA@mail.gmail.com>
 <26aeae20-6815-d160-584f-c9252ec6a568@intel.com>
 <CAOUmYFTj37WtKAs+RdjXPabEjVKj859=j2e5v0NWBc5n81VcUA@mail.gmail.com>
In-Reply-To: <CAOUmYFTj37WtKAs+RdjXPabEjVKj859=j2e5v0NWBc5n81VcUA@mail.gmail.com>
From: Derick <derick.montague@gmail.com>
Date: Wed, 10 Jul 2019 12:17:01 -0500
Message-ID: <CAOUmYFSPoDhDrTqhNv+ehtJmj3E6qw2cyUKSQGp26nyFH_VAaA@mail.gmail.com>
Subject: Re: Proposal to replace Clang Format with ESLint and Prettier in
 phosphor-webui
To: Ed Tanous <ed.tanous@intel.com>
Content-Type: multipart/alternative; boundary="0000000000001d2c62058d56d9c7"
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

--0000000000001d2c62058d56d9c7
Content-Type: text/plain; charset="UTF-8"

Thanks Ed for the reviews and support on the GUI tools work! I ran into a
roadblock with the format-code.sh call. I am not finding Prettier as an
Ubuntu
package and won't be able to make the call during the build process.
However,
I am able to use a Git hook to test the code prior to commit and/or push.

I added the npm scripts that can be called for testing and fixing (if
auto-fixable)
so that they can be run from the command line for anyone that doesn't
Prettier
integrated with their code editor (it even has VIM support).

 I have these changes in the Gerrit review
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-webui/+/22366
and am hoping that this is an acceptable solution.

--0000000000001d2c62058d56d9c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Ed for the reviews and support on the GUI tool=
s work! I ran into a</div><div>roadblock with the format-code.sh call. I am=
 not finding Prettier as an Ubuntu</div><div>package and won&#39;t be able =
to make the call during the build process. However,</div><div>I am able to =
use a Git hook to test the code prior to commit and/or push.</div><div></di=
v><div><br></div><div>I added the npm scripts that can be called for testin=
g and fixing (if auto-fixable)</div><div>so that they can be run from the c=
ommand line for anyone that doesn&#39;t Prettier</div><div>integrated with =
their code editor (it even has VIM support).=C2=A0</div><div><br></div><div=
><div>=C2=A0I have these changes in the Gerrit review=C2=A0<a href=3D"https=
://gerrit.openbmc-project.xyz/c/openbmc/phosphor-webui/+/22366">https://ger=
rit.openbmc-project.xyz/c/openbmc/phosphor-webui/+/22366</a></div><div>and =
am hoping that this is an acceptable solution.=C2=A0</div></div></div>

--0000000000001d2c62058d56d9c7--
