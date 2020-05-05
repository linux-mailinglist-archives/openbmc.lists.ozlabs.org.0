Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 888751C5F5E
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 19:53:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GnQQ02B3zDqP3
	for <lists+openbmc@lfdr.de>; Wed,  6 May 2020 03:53:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::233;
 helo=mail-oi1-x233.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EzldBh66; dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Gn4w2dQlzDqg6
 for <openbmc@lists.ozlabs.org>; Wed,  6 May 2020 03:38:23 +1000 (AEST)
Received: by mail-oi1-x233.google.com with SMTP id b18so410516oic.6
 for <openbmc@lists.ozlabs.org>; Tue, 05 May 2020 10:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:date:references
 :to:in-reply-to:message-id;
 bh=2sxqqz5T9tjreS0L3SmhMzpHPWMN//zvWgsN5WBPlqM=;
 b=EzldBh66DgcWcxu5pBmXie2AzFe/n1uccO7T26ezqpvMRxo1+lAZ0q3H0uI6xGcG/u
 J1trFaJPCvLFzdH5RC5q9AOlYaMNANV6lFTQIHyiBj3UgiMy/XNgv4Z6b8L9AICth9Y9
 hJMDgqH4nsHSl3Gykp8h5JmSBcwnexYyuyutbudtcyU91GaRHxA5HjujdIQ2Ncy7eSLv
 58mGIEgRaxLgfg02v/7Qqu8ZkMSvObgKvcW2KJ6BqroBs82qrogGBwXa7OW1gF0q4dMJ
 T+jKXRbIwRc9syewMmwyeybvu06EZ39OuUhFy1SiKy2UbbYXMC/Qk50EG6ujIxuamhTj
 bw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:date:references:to:in-reply-to:message-id;
 bh=2sxqqz5T9tjreS0L3SmhMzpHPWMN//zvWgsN5WBPlqM=;
 b=dVZ7NB7W4gCN1i+eKPo57m5mvggaHWa8SphqDo1JGFSZyToR1Pb1rLMMwuc/APQ4nn
 9XFrhsNl2pnTLUCZNYAunstVK2YPu9nCSFQGUA5Cx2rY70a/XdTzhkn1bumMNEg87YEc
 cYUSs1GZivKeczPJKOjojXjPdWyzIVpkBesgrGMhE3a+oWpFmwOHlOfjtsr2LTzWlPqG
 Goy3P58AtjhHHkgs93DekiMxisTKeSjnZY7DIo/UbzUiwD3TEZOW9uChgB2z1uW4Efh4
 430OmNJcQTolUm111vwed2w1I/HmCaFs8ULI5ZF95j3ZDLqZiY4tROjOS6cFhIC/pqQi
 4VJA==
X-Gm-Message-State: AGi0PuYlX22RKrEtFBBaomkMM1K7oEC4vlbbSB1ghEr01+1eLS7qlrbH
 kpfYnbWmXDqkPdJImDAKceXlJhl7k5k=
X-Google-Smtp-Source: APiQypJrpWzyeyHkQJJEApA7PPaHbhSWNbDVAF2bSc8YtmheXXJJmupFPKKVO0N+UsKV7VZB8pm+QQ==
X-Received: by 2002:aca:c3c1:: with SMTP id t184mr3159776oif.171.1588700299565; 
 Tue, 05 May 2020 10:38:19 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:c97d:b72e:d6b7:8e2e])
 by smtp.gmail.com with ESMTPSA id z75sm730383oia.22.2020.05.05.10.38.18
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 May 2020 10:38:18 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Dunfell Update Status
Date: Tue, 5 May 2020 12:38:18 -0500
References: <41CB9FEC-1892-489A-8CD8-A50F5E744C4D@gmail.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
In-Reply-To: <41CB9FEC-1892-489A-8CD8-A50F5E744C4D@gmail.com>
Message-Id: <16620BAA-69AD-491E-A2C3-265C53DC91F9@gmail.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

An update on the email below. Upstream yocto (including the new Dunfell =
release)
went into openbmc master this morning with the following commit:

=
https://github.com/openbmc/openbmc/commit/82c905dc58a36aeae40b1b273a12f63f=
b1973cf4

Our hardware CI and CT buckets looked good with it.

It does seem to bring some new restrictions on the minimum gcc you can
have installed natively on your system so some updates may be required.

Let me know if anyone runs into issues.

Now that we=E2=80=99re past the python3 migration issue, we=E2=80=99ll =
be doing rebases
on upstream yocto once a week again (which should prevent needing
big painful updates like this).

Andrew

> On Apr 28, 2020, at 2:05 PM, Andrew Geissler <geissonator@gmail.com> =
wrote:
>=20
> A fairly quick update on where we are with getting back onto upstream =
yocto.
>=20
> For those that don=E2=80=99t know, dunfell is the name of the next =
yocto release. As
> Brad pointed out in a previous email, if you want your meta layers to
> keep working, you=E2=80=99ll need to update your layer.conf with it.
>=20
> The move from python2 to python3 is mostly behind us, thanks everyone,
> especially Patrick (stwcx) for all the help there.
>=20
> All of the CI system layers have been updated to now support dunfell.
>=20
> We ran into a phosphor-webui issue that Gunnar has a fix for:
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-webui/+/31736
>=20
> IBM systems pull in an external tool, cronus, which needs python3 =
updates:
> https://github.com/open-power/eCMD/issues/350
>=20
> The two unknown issues I'm currently stuck on are these:
> https://github.com/openbmc/u-boot/issues/24 (u-boot compile fail)
> https://github.com/openbmc/openbmc/issues/3657 (weird sed issue)
>=20
> The u-boot one I just don't understand and am hoping to get things in =
a state
> where others can recreate and take a look.
>=20
> The sed issue isn't related to dunfell, I've been seeing it without =
the upstream
> bumps. I think the upstream bumps just make us recompile gcc which =
seems to
> aggravate the issue.
>=20
> Here are the yocto bumps for anyone interested in pulling them down:
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/31715
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/31716
>=20
> It would be great to get over this hump and back on upstream yocto/OE =
so any
> help or ideas appreciated with the remaining issues.
>=20
> Some other issues that we ran into but are now fixed in upstream:
> https://patchwork.openembedded.org/patch/172082/ (boost)
> https://github.com/openembedded/meta-openembedded/pull/213 (new =
recipe)
> =
https://github.com/openembedded/openembedded-core/commit/7bae99cd6c82fff6f=
a56bbddeb936e27b28e79ff
>=20
> Thanks,
> Andrew

