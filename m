Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1546422BB1F
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 02:47:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCVss3lWDzDrgR
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 10:47:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::235;
 helo=mail-oi1-x235.google.com; envelope-from=ztai@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=C8exN+XE; dkim-atps=neutral
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCVrr1DyQzDrfv
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 10:46:44 +1000 (AEST)
Received: by mail-oi1-x235.google.com with SMTP id r8so6683706oij.5
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 17:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=+fb9KrZDajIvO/zppbJmeU2WSTvD/pxFJY0w63DE/EE=;
 b=C8exN+XEhlYMxSWjtdf3W2C/NHF+kXPJq/9WTQlyUA0Zhd4vCnXghcboKzpsTRncXg
 i6LmeZpcoiPKahlrLQBexxujD5MxImgkCJs7NhNg3wDvSAd7rWdWE8nV8vQnZihRTzDf
 l8TsUg3bsi6o1jAXACdNLHHsjRGkpUcXc5Kxyq+8sBJiFuNCsTQYt6tmbhXu5VWwRFW4
 /cbRc0AOA/aeEt8IEx1x0iIMqF68iGcOtooUPTytN8mbAHsOL8W8Vn849GO7IQvoORTp
 dRWr67t2GA6yeo7qUF0Z/OJ/3gIN038ivJeHoGDDnR2XqtcvM50SSBKTaZuBgC+qYTuC
 dDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=+fb9KrZDajIvO/zppbJmeU2WSTvD/pxFJY0w63DE/EE=;
 b=hPEAe/tXBsxzPiZPbUNZstuNYTUGlcIbYAh3JlBkISTutPI+l25kLCf+lchWEnhmLL
 Da38p0hVvT/dNvObBRnJRciOvz8sC5zQMThSurybsMzFJKn5It31WfBtx3SHmh36NKov
 9ECtPcCwhAAsnYVpfWF5/HQ8UsQtVblg9fuT2c+2fpVNMofEKlyIE/Viogqd29En7H/C
 tC79FQWGUE7czneTso+dMxtF3GfIjuvmqVQseowGbLl6LpM1BaNj+7vEb3E5/v/+QOkh
 oLfPEdAOShr5eqj/abzCXb+ZY+kbohhARCuaOdMRTz8ZpukQh0nww0Nc513OzcetTApg
 MMGg==
X-Gm-Message-State: AOAM531Fh+iC9uwd2CtgBz9L84ikRRuKuvnhdPXUo/m0xLgIukmRPkDB
 CaCI6aBCDbRntgRf6SLinI5wLJDsWWxgCz5yfYoQCItT
X-Google-Smtp-Source: ABdhPJyBDqMehc6hY/R21875KICgec1NF7hoqiWI22gP//e/maVJvzNr8lryrx1QN9w8zw6TrYj1M9THbXDLt3ZoJwM=
X-Received: by 2002:a05:6808:18c:: with SMTP id
 w12mr6133438oic.66.1595551599110; 
 Thu, 23 Jul 2020 17:46:39 -0700 (PDT)
MIME-Version: 1.0
From: Zhenfei Tai <ztai@google.com>
Date: Thu, 23 Jul 2020 17:46:28 -0700
Message-ID: <CAMXw96PkBaj2+AEPJdRURmdCr9kyQ1Q8F8U9rUjeN+pck+fS2w@mail.gmail.com>
Subject: bmcweb TLS certificates installation and management
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000049a05e05ab254e36"
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

--00000000000049a05e05ab254e36
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm recently looking into certificates installation and management for
bmcweb and hope to understand the best practice in this regard.

According to the TLS doc
<https://github.com/openbmc/docs/blob/master/security/TLS-configuration.md>,
bmcweb has APIs that allows root CA installation and https server
certificate replacement.

My questions are:

   - Should there be a separate workflow to manage certifications of BMCs?
   - Should the bmcweb APIs be used for the installation and management?


Thanks,
Zhenfei

--00000000000049a05e05ab254e36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I&#39;m recently looking into certi=
ficates installation and management for bmcweb and hope to understand the b=
est practice in this regard.</div><div><br></div><div>According to the <a h=
ref=3D"https://github.com/openbmc/docs/blob/master/security/TLS-configurati=
on.md">TLS doc</a>, bmcweb has APIs that allows root CA installation and ht=
tps server certificate replacement.=C2=A0</div><div><br></div><div>My quest=
ions are:</div><div><ul><li>Should there be a separate workflow to manage c=
ertifications of BMCs?</li><li>Should the bmcweb APIs be used for the insta=
llation and management?</li></ul></div><div><br></div><div>Thanks,</div><di=
v>Zhenfei</div><div><br></div></div>

--00000000000049a05e05ab254e36--
