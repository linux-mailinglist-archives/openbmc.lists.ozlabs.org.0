Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F65F7C96
	for <lists+openbmc@lfdr.de>; Mon, 11 Nov 2019 19:47:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Bfy96g1HzF42D
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2019 05:47:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12b;
 helo=mail-lf1-x12b.google.com; envelope-from=kunyi@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RNKRudMy"; 
 dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Bfwb0phgzF4HB
 for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2019 05:46:22 +1100 (AEDT)
Received: by mail-lf1-x12b.google.com with SMTP id q5so4659866lfo.10
 for <openbmc@lists.ozlabs.org>; Mon, 11 Nov 2019 10:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=J7W2nYMPsj9F9aOvJ+2nrIgWua+XpQJuP5QR80bgLiE=;
 b=RNKRudMyJkW0AE11oP6uptucyvoD8D0gJaYveZ3aqLrHQbAExqCXRynZepUJV2aUJg
 vev1YdKpfg8sZGRhNj2NUClfX2a1ShzNtIsdTPB8vZNX6vhfGdXRSZvw6aAqzPoC89mr
 P9nHp9lKCtJSbCUO+NVPt2nakg7/DwUbL4j1GyFb13bcJMgJ3zOOYubfTIjC/EHXxkVv
 LCwyYq+Y3CoMB1K3ocoIx2hGJof/JnKPmaJghjzReD8mchMr+YmhJH0qU7oBwPaoJyRY
 h7BRLC4JqIwL1/B02TVcd0VlMiALvKTVBKGdec9WxDRWAP6dTZvqEBANX8LGZXEzqCdE
 yNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=J7W2nYMPsj9F9aOvJ+2nrIgWua+XpQJuP5QR80bgLiE=;
 b=pYLQHRHtHgeQrnpld3UfndWXEt/Xr8t4iDem7+TLnPg4xMwABlavd2z78MseHx1+Hh
 +oXED076HM1y1NbV537i0nca36EXAfQ3IRQh4O6MOOscFLFKSLcrxowLpa3smA9r8kSD
 sXJMkBTUBzEBGO/nP20j0s3v8PNnteve1gDwYNmz0FHNVpIKGF7THpPpne7qtI8aTJW2
 DAZEob6C91Gd1ePn1f3YmVbM9MQcfkMHOohbPz80P+Nr4aEKW3qBwypYpCB1nZ4Doey8
 52u1mi3qI3kM79/8PYeOh7xZ/RXu9waJk/TbsQIPfygMUuwfOqPtGwQ6n3CoMNq2qWxb
 eN1A==
X-Gm-Message-State: APjAAAVt474HkiaFm7DPoV6CP0hWcBoDwBBVG2cJ85FRe43FEXEOm8IB
 j42VNRlMWGED3FtNimOnHh6K4ADr2plZZ6tEnW3rp1tXxb0=
X-Google-Smtp-Source: APXvYqxwc5123LlDmRdbcp8RqQnTlBKScEygUfkXUb5oSEgmXlV2IH2YeA7WkVboinuw7rhv033ra+r3Vbk+s2FrYpo=
X-Received: by 2002:a19:7617:: with SMTP id c23mr5889309lff.175.1573497976826; 
 Mon, 11 Nov 2019 10:46:16 -0800 (PST)
MIME-Version: 1.0
From: Kun Yi <kunyi@google.com>
Date: Mon, 11 Nov 2019 10:45:49 -0800
Message-ID: <CAGMNF6U81+d9wz4h_TiPBA0EoxC6bhiUZ67mozWWwwT4GTVMCg@mail.gmail.com>
Subject: Yocto/bitbake recipe 'diff test'?
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000f70b610597168b65"
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

--000000000000f70b610597168b65
Content-Type: text/plain; charset="UTF-8"

Hello there,

After being hit by several regressions due to overrides in Yocto recipes, I
realized that we need a test for these configuration pieces. For changes
like https://gerrit.openbmc-project.xyz/c/openbmc/meta-ibm/+/23668, I would
want the Gerrit presubmit to provide me a diff on which machines this
change would take effect, and which variables are being changed.

Fortunately, I think it is relatively easy to generate such a diff using
bitbake '-e' capability, which produces all the variables after expansion,
so what requires is a little parsing before and after applying the patch.

What's tricky would be what machines to generate the bitbake log with, and
which variables to diff with. Any ideas? Does it make sense to do something
like:

1. Find all the override machine/platform types from within openbmc/openbmc
2. For all the bitbake recipe changes to be landed in openbmc/openbmc,
generate the environment variable diffs for all these overrides
3. Post the diff results to Gerrit as presubmit output

Regards,
Kun

--000000000000f70b610597168b65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello there,<br clear=3D"all"><div><br></div><div>After be=
ing hit by several regressions due to overrides in Yocto recipes, I realize=
d that we need a test for these configuration pieces. For changes like=C2=
=A0<a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/meta-ibm/+/23668=
">https://gerrit.openbmc-project.xyz/c/openbmc/meta-ibm/+/23668</a>, I woul=
d want the Gerrit presubmit to provide me a diff on which machines this cha=
nge would take effect, and which variables are being changed.</div><div><br=
></div><div>Fortunately, I think it is relatively easy to generate such a d=
iff using bitbake &#39;-e&#39; capability, which produces all the variables=
 after expansion, so what requires is a little parsing before and after app=
lying the patch.</div><div><br></div><div>What&#39;s tricky would be what m=
achines to generate the bitbake log with, and which variables to diff with.=
 Any ideas? Does it make sense to do something like:</div><div><br></div><d=
iv>1. Find all the override machine/platform types from within openbmc/open=
bmc</div><div>2. For all the bitbake recipe changes to be landed in openbmc=
/openbmc, generate the environment variable diffs for all these overrides</=
div><div>3. Post the diff results to Gerrit as presubmit output</div><br><d=
iv dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"=
><div dir=3D"ltr">Regards,<div>Kun</div></div></div></div>

--000000000000f70b610597168b65--
