Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4679637B0CB
	for <lists+openbmc@lfdr.de>; Tue, 11 May 2021 23:30:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ffrgm1tL4z2yYW
	for <lists+openbmc@lfdr.de>; Wed, 12 May 2021 07:30:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jU3Ep4a/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d33;
 helo=mail-io1-xd33.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jU3Ep4a/; dkim-atps=neutral
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfrgV3xX9z2y6B
 for <openbmc@lists.ozlabs.org>; Wed, 12 May 2021 07:30:29 +1000 (AEST)
Received: by mail-io1-xd33.google.com with SMTP id z24so19633509ioj.7
 for <openbmc@lists.ozlabs.org>; Tue, 11 May 2021 14:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:mime-version:subject:message-id:date:to;
 bh=pmDfAqkAgBdnuPH/9ry1oQoRkViUqjb5gsGIXPekroo=;
 b=jU3Ep4a/kmIKmqxtq28LUfxUB3QWpocEOxsFJjQLFxBeALM7fT/bjG3SFti1o8Ezcy
 56D0goU7f35g2z/+oa1xRawks47wKfPs0PUpOWPmrCwa12FzURH9MhV8gCT/BoV8fE7+
 ot6ug11clMcPd79/ZvST9IhC2yCyK3HxRfn+L+7Z/oUOp/gwx4igtvhDzDHOl9gRzxGs
 CL1fwXcHuoVClBcDUM759mNVVqrOPJvyaFIYbsV15r9maxfbgTtcSsJydDzDcBLPOch9
 ag1hjRUC6+rKlU8yQk/hhAAn0BBp7lMgB0M4KipwIWerlwrpo/k0fEiexINmCRoD4sea
 PwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:message-id:date:to;
 bh=pmDfAqkAgBdnuPH/9ry1oQoRkViUqjb5gsGIXPekroo=;
 b=hR+h2irTEIKryDn+EZzC5/QXTLeEUc4PuNYRcWXbKdFAg0bM5Cc3VuPVq7WIwPjx2p
 +1F55RwM9ZQkmC7+7O/SxjnOVVp2Q+j3gmk7zOZEVFx/fOFPtQH3j9M49Ne7APslEZqu
 H3TDyZPzxFJoMAsJLAHwI35wGQKvUB6ttFaHQJsIoZTdIyw4SRehkc/B4kHr0axiPLHg
 TuqXxD7wF/Ta2hCcmYWDEj8j/FvPXyeIF6z6DgNvsLQWBRdFyoCtStDsX83y7QVhbs3O
 gY84UcclgzmL9+EOoVYhX5gFwfkrA4mORSIHFJv3KuXpggLjLZnbC6QCj4SXX4GGHEvo
 dBiQ==
X-Gm-Message-State: AOAM530eap23en3t8B6d+p34TxlfDzkuFYvy229OzrNDWjB1dzTpK21A
 b/cjRiaH2+x9oKAlK1qsnQVlhN7Iaew=
X-Google-Smtp-Source: ABdhPJxAjucv4zgmP+uCoKfCNnGmyb4Hq8N9YwoKRqGuB4Xn9FTmPcLZJZoOsPbi8/iH/uHukoMvbA==
X-Received: by 2002:a02:ca4e:: with SMTP id i14mr28261783jal.101.1620768625739; 
 Tue, 11 May 2021 14:30:25 -0700 (PDT)
Received: from smtpclient.apple ([2601:281:c001:2359:147a:5457:683a:10cf])
 by smtp.gmail.com with ESMTPSA id f20sm911246iob.46.2021.05.11.14.30.25
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 May 2021 14:30:25 -0700 (PDT)
From: Mike Jones <proclivis@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_62CE48B7-CB9E-44D7-B050-B89E417E0154"
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: mtools bitbake failure
Message-Id: <CC4AD3DB-396E-4D9D-93D6-26EBF70FD356@gmail.com>
Date: Tue, 11 May 2021 15:30:24 -0600
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
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


--Apple-Mail=_62CE48B7-CB9E-44D7-B050-B89E417E0154
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

I want to document a problem with mtools to see if this can be fixed or =
put on a bug list.

The failure occurs when:

- using meta-phosphor and meta-raspberrypi
- using the default scripts/install-buildtools

When "wic create=E2=80=9D is run mtools commands will fail with error =
=E2=80=9CError converting to codepage 850"

The cause is iconv does not support CP850.

A solution is to use a newer version of the build tools, say 3.2.3, like =
this:

scripts/install-buildtools --without-extended-buildtools \
          --base-url http://downloads.yoctoproject.org/releases/yocto =
<http://downloads.yoctoproject.org/releases/yocto> \
          --release yocto-3.2.3 \
          --installer-version 3.2.3

However, the install-buildtools script will fail for two reasons:

- It looks for file extension sha256 instead of sha256sum
- The regular expression looks for two spaces like this \s\s and the =
file only has one space

A quick look at poky 3.3 which is near in time to the iconv fixes, upon =
inspection, fix both of these problems.

So if openbmc moved to poky 3.3, it would solve this problem.

I also noticed that the regex uses \s+, so it should not break using =
older build tools based on md5sum.


--Apple-Mail=_62CE48B7-CB9E-44D7-B050-B89E417E0154
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">I =
want to document a problem with mtools to see if this can be fixed or =
put on a bug list.<div class=3D""><br class=3D""></div><div class=3D"">The=
 failure occurs when:</div><div class=3D""><br class=3D""></div><div =
class=3D"">- using meta-phosphor and meta-raspberrypi</div><div =
class=3D"">- using the default scripts/install-buildtools</div><div =
class=3D""><br class=3D""></div><div class=3D"">When "wic create=E2=80=9D =
is run mtools commands will fail with error =E2=80=9C<span =
style=3D"font-family: Calibri, sans-serif; font-size: =
14.666666984558105px;" class=3D"">Error converting to codepage =
850"</span></div><div class=3D""><br class=3D""></div><div class=3D"">The =
cause is iconv does not support CP850.</div><div class=3D""><br =
class=3D""></div><div class=3D"">A solution is to use a newer version of =
the build tools, say 3.2.3, like this:</div><div class=3D""><br =
class=3D""></div><div class=3D""><div style=3D"margin: 0in; font-size: =
11pt; font-family: Calibri, sans-serif;" =
class=3D"">scripts/install-buildtools --without-extended-buildtools =
\<o:p class=3D""></o:p></div><div style=3D"margin: 0in; font-size: 11pt; =
font-family: Calibri, sans-serif;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
--base-url&nbsp;<a =
href=3D"http://downloads.yoctoproject.org/releases/yocto" =
class=3D"">http://downloads.yoctoproject.org/releases/yocto</a>&nbsp;\<o:p=
 class=3D""></o:p></div><div style=3D"margin: 0in; font-size: 11pt; =
font-family: Calibri, sans-serif;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
--release yocto-3.2.3 \<o:p class=3D""></o:p></div><div style=3D"margin: =
0in; font-size: 11pt; font-family: Calibri, sans-serif;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
--installer-version 3.2.3</div></div><div class=3D""><br =
class=3D""></div><div class=3D"">However, the install-buildtools script =
will fail for two reasons:</div><div class=3D""><br class=3D""></div><div =
class=3D"">- It looks for file extension sha256 instead of =
sha256sum</div><div class=3D"">- The regular expression looks for two =
spaces like this \s\s and the file only has one space</div><div =
class=3D""><br class=3D""></div><div class=3D"">A quick look at poky 3.3 =
which is near in time to the iconv fixes, upon inspection, fix both of =
these problems.</div><div class=3D""><br class=3D""></div><div =
class=3D"">So if openbmc moved to poky 3.3, it would solve this =
problem.</div><div class=3D""><br class=3D""></div><div class=3D"">I =
also noticed that the regex uses \s+, so it should not break using older =
build tools based on md5sum.</div><div class=3D""><br =
class=3D""></div></body></html>=

--Apple-Mail=_62CE48B7-CB9E-44D7-B050-B89E417E0154--
