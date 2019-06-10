Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0526C3B83B
	for <lists+openbmc@lfdr.de>; Mon, 10 Jun 2019 17:22:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Mxhk379bzDqPG
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2019 01:22:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::92d; helo=mail-ua1-x92d.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rJDdtP9N"; 
 dkim-atps=neutral
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com
 [IPv6:2607:f8b0:4864:20::92d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Mxh92xQMzDqNV
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 01:22:16 +1000 (AEST)
Received: by mail-ua1-x92d.google.com with SMTP id r7so3165563ual.2
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jun 2019 08:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=NZk+6TBO2c8qEK4K21WBVcoRYYyV/Kuk37SGUoOXSek=;
 b=rJDdtP9NZh6ty8uE1f7jxsqAxNvdzJv5Gob4bysAZFSciWPLEo4KMS2TG3b8l/Y6Do
 4JkBQcJOafXYES7CK63DvIH29IpFWscP32TdpMnpksASk+gTAyB+EFT2b9/jprp6yQ6j
 t90LpF42Bbosc7tFb1fTutIKh3ub3DaY97d1HlW4q6T27N9OUtH7KZkEB4Jo6rIJXmXT
 SXNOyVkZwBpoqHC75giYIpVIdNa9p+WJiBvuTMGgRczkiwsneQGSQtmzO6jj9Whog6u/
 RY70uLcbaHaditqdOCAH+qYVsow3kY+zRo5ygZ1bxpjgLW0+Shh52xHdkB7rzoQaGWNS
 j/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=NZk+6TBO2c8qEK4K21WBVcoRYYyV/Kuk37SGUoOXSek=;
 b=NBkT/IU0t9x9R5UpE/7omGMJLhANeYrQ1751h4zlsG3vewxX0MTHbTJir9tU5d7rsB
 rpb3B2uwxkUOl9mrt4fefexiWOltSSqYBo9svUDdv5IAShjn5W/CjhCK+DMVP7tlRDLk
 LcmOPjSYXFAGnYcUUrBADgnRNXku4Z6aekGbb3tQxneyQPLa+Pmud8Aznp6L2ZteEXma
 /XhLSXeYTg0AuVSVB1q/0p5DEtWTq0iYcoVC4FMtYiir7xuK2nxg8NZ4hqBtzTmIcaIY
 RCHtF+bJ+PXVJnP9I6C8w++UTol/JoIgSllx1sC9Gpa8JIAAd+TZpu8JT1mkB7Fqtt1w
 BtLQ==
X-Gm-Message-State: APjAAAXRC4MUBfBrQ8uAvh4MErMwMB7fdXSbuf0wioUQ++PVwQxu+MTL
 fSE3DNfrI1x4mTXzBGWAMG63fI5OzfEmRsNr1bPo8THg
X-Google-Smtp-Source: APXvYqzcmGB7zDNP5i5XP22+QhvNDfA0DBtYVNj+ZFDGl7tAfSp1RnY2SpU9G5I/F0U+nwpx9Vby5kuurRHrbH4qFsg=
X-Received: by 2002:ab0:6198:: with SMTP id h24mr25472372uan.41.1560180133187; 
 Mon, 10 Jun 2019 08:22:13 -0700 (PDT)
MIME-Version: 1.0
From: Kurt Taylor <kurt.r.taylor@gmail.com>
Date: Mon, 10 Jun 2019 10:22:01 -0500
Message-ID: <CAG5Oiwj9Ps0Lc9S4hPS=Jxizgn4=meqP_UGRhUdeZWsphGC8YA@mail.gmail.com>
Subject: Release: branch then test, or test then branch?
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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

All,

Before the last release (2.6) the release planning working group
decided to branch on the freeze date and then continue development on
master, while testing, documentation, and release notes happened in
parallel. It worked reasonably well, but there were some glitches. For
this upcoming release (2.7) we are reconsidering this decision.

There have been concerns raised on this model (please elaborate if you
have an issue). I believe that the test and security working groups
have identified requirements to change this, but I would like to have
specific reasons. And, I was not totally happy with the platform
verification testing/reporting or feature documentation.

The alternative, and my slight favorite, is to branch at release, not
at freeze. This enables ALL (developers, testers, document-ers) to
focus on the release specifically, instead of continuing to develop
code. The downside is that it does stop new functionality patchsets
merging in master for a 3-4 week period. We could shorten the freeze
window if all were focused on polishing the release, however. This is
not the popular option since folks just want to write code, not test
or write documentation, but I believe it can make higher quality
releases.

Here is a drawing that may help explain what we are considering for 2.7.

https://github.com/openbmc/openbmc/issues/3555

Please comment here, comment on the above issue in github, or come to
a release planning meeting if you want to learn more or join in on the
decision process.

Kurt Taylor (krtaylor)
