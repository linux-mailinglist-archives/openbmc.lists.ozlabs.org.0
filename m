Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 666BF2F421C
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 03:55:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFsWZ6PCvzDqnk
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 13:55:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=wltu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=KJBZMZ45; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFsVX3KJxzDqmb
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 13:54:30 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id g3so266758plp.2
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 18:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=UzHFGhCrzr4UBQoil77o76II7vDLhqCkqI246/DAvbo=;
 b=KJBZMZ45o5bLPnIzV+D2+4E2aw7c4YG7xh4PgNnytwu8yjh7zWKMGcLfaefQ89P3Rj
 eEeFQa3BVglljynmWF0sL665Q5bif1DpNxSiCu3XoWi7UTq0KN9/kYgwR1Iy452L9zub
 xEU6QMb3b9palkHgTQMYVtDaDQHCtJNEGOEvPtZWCS3+vqZ6GKfTAvUcIyzhcodaRbgA
 aiW9spMAzEZtSjGjxcGZCRMIyrTXgdoWyYPLBnPAXHPQ1rWut7L4r1GyrnBlJAgM1hFc
 zvv26O+fE51w/v0TZERiAYXYd2+097ecLtBXf9bLYz9BytXRxNaohQ3wozk7LCDrAMbT
 IHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=UzHFGhCrzr4UBQoil77o76II7vDLhqCkqI246/DAvbo=;
 b=P0WzdpHN/iRAWq3wELr9F08Sd6K5+2iCdDnYcGZrEc6fokcxNgpBpUw4CRs1UPU+3o
 8103UsBAacsIwetou38qxij0es3WJdcJGYDe/AXQaMK+7HaCKYNWIJ73SokjYBvdG8Ik
 5VyK1CCWQ4BwxzOOnmC6Ol8Uy/Btzf1SYjwzLeaUcUylHTcVuq4ekicw+mgqteWuLXjL
 Gq/tSVTfzrxd69nBl2v3PEU4GzkCJG8hDroTngYZRfPOIgJArGg85OgfBHu8u5oXLpAO
 y741pBtSnHCwgjzDY5+fyw1U84uEgwy6vpQEt+PhClXE7n8eDtX56jTjVUIK64zmauus
 euAA==
X-Gm-Message-State: AOAM531KMqnwryFwu5VC2BY9ZQVhwir8Q/HGht04CKiiuJNDYSfQS8Ie
 fJ6WVs37MBz5br7VoqDptfa1sTO/4AyQNdN7Zu+Hxw==
X-Google-Smtp-Source: ABdhPJx2JPGUE4qlr3C7rUP8h8XqNsfl3l5rn/vVToH6AZ5Vtz0UdXi8kWkLY/ke/x24AUPWVVLjhAapSYlWiAWzF8E=
X-Received: by 2002:a17:902:758c:b029:da:a6e1:e06 with SMTP id
 j12-20020a170902758cb02900daa6e10e06mr2024014pll.67.1610506464635; Tue, 12
 Jan 2021 18:54:24 -0800 (PST)
MIME-Version: 1.0
From: Willy Tu <wltu@google.com>
Date: Tue, 12 Jan 2021 18:54:14 -0800
Message-ID: <CAHwn2XkNiz7rZzn9RbpZCaUM8HD0HO+mJTD9D2ENc_p+SsmXHg@mail.gmail.com>
Subject: Re: Intel-ipmi-oem repo
To: vijaykhemka@fb.com
Content-Type: multipart/alternative; boundary="000000000000bc0c0105b8bf41ea"
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
Cc: vernon.mauery@linux.intel.com, openbmc@lists.ozlabs.org,
 apparao.puli@linux.intel.com, chunhui.jia@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000bc0c0105b8bf41ea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Team,
> Intel-ipmi-oem should be broken and 2 parts, genric and oem specific. I
see several functionality in this repo like sensors and storage commands
are generic enough to be used by other platform who is using entity
manager. So I feel that we should have these functionalities to be moved to
a separate common repo which can be used by everyone and this repo can only
contain Intel OEM specific IPMI command support.
>
> My 2 cents =F0=9F=98=8A

Hi All,

I guess I'll start working on this if no one has any objection to it.

As mentioned in the beginning of the thread. The plan is to break down the
intel-ipmi-oem repo into two parts.
- True OEM at Intel
- Dynamic Sensor stacks (new repo)

The new repo could be named dbus-sdr or dbus-ipmi-sdr?
and will include the sensor and storage commands as mentioned.

Please let me know if there are any suggestions or concerns.

Best,

Willy Tu

--000000000000bc0c0105b8bf41ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; Team,<br>&gt; Intel-ipmi-oem should be broken and 2 p=
arts, genric and oem specific. I see several functionality in this repo lik=
e sensors and storage commands are generic enough to be used by other platf=
orm who is using entity manager. So I feel that we should have these functi=
onalities to be moved to a separate common repo which can be used by everyo=
ne and this repo can only contain Intel OEM specific IPMI command support.<=
br>&gt;<br>&gt; My 2 cents =F0=9F=98=8A<br><br>Hi All,<br><br>I guess I&#39=
;ll start working on this if no one has any objection to it.<br><br>As ment=
ioned in the beginning of the thread. The plan is to break down the intel-i=
pmi-oem repo into two parts.<br>- True OEM at Intel<br>- Dynamic Sensor sta=
cks (new repo)<br><br>The new repo could be named dbus-sdr or dbus-ipmi-sdr=
?<br>and will include the sensor and storage commands as mentioned.<br><br>=
Please let me know if there are any suggestions or concerns.<br><br>Best,<b=
r><br>Willy Tu<br></div>

--000000000000bc0c0105b8bf41ea--
