Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3985E123906
	for <lists+openbmc@lfdr.de>; Tue, 17 Dec 2019 23:03:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47csb220RczDqX3
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 09:03:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::336;
 helo=mail-ot1-x336.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="J7BoYYcq"; 
 dkim-atps=neutral
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47csZH1VtJzDqTT
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 09:02:30 +1100 (AEDT)
Received: by mail-ot1-x336.google.com with SMTP id w1so859638otg.3
 for <openbmc@lists.ozlabs.org>; Tue, 17 Dec 2019 14:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=wghtbbb8qkA7T4ezC9RvrwlsWp5I26V7/8iW61yg+ws=;
 b=J7BoYYcq3OockntTb/vSw6Y5OZ0iArdBDrf3dOJYOM29vnqKI/rcW+tnUAEUNahl2H
 3vJ/bnoQYzzKtv/+1zvsRqtOk+q9nsLgDKXdQQ7y20uIls6hKJuy0QtAX0YlbiSPDHoK
 5a7GYnvAC0Mo25vM7xfbGiDygQ8P6gxMnIvOu6Rz0EqydF6LS+TTIv0K25Zevta2q+FJ
 uqpOeLb4X+ps3PqMJo0G1JkTWszBLHAckeYTWuofS0BcebrBNfk6eANch10o147umvwI
 4x9KfTm5F9I8aC3Sa38Z7pM/mXZ8pz1z8/rTcqtRXr3hK6RgKMQXo9M7op49I6BSFdKr
 6qtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=wghtbbb8qkA7T4ezC9RvrwlsWp5I26V7/8iW61yg+ws=;
 b=FI4Au584OyebWjyO77GfPJBPjsM1FoBwGU4MpDlP7rhRTSOHakEEhYNQH3aeJZwXY8
 vcsupZdjTto9SLuaepseqvAjsgKdPgbd6hxdeT+x21kTsg84PxtxQ8kc6+FtY6HCzNvS
 ebKPc7VQX9UDFhtdVkK4DhtQhGOptZHubGTq1q3/IdCoRTtRMmDxKOKRlY2N6k/wmXsO
 Miv9/M+NuP1Uigl/V+a4uhTKHZheAlCbsHaoIOxjNHliPTGG266POT1KidD4XwBeplAH
 StLTWyZ1SvgG8E1HypFUAHm5t3ZL3t7m0zV3COvpGSzYqGSgwRDW3o6xWwZQ4RRIHD6E
 PA4w==
X-Gm-Message-State: APjAAAWkiW8wmXc3+AmWaSaejIIKqwuGldL53KYMMKzRIE3zIA81yjiV
 JqikuTWexQ7DmJe+k6XURqTeVQzN6Ldnbqet7uoPgEg3feE=
X-Google-Smtp-Source: APXvYqyeNe/77fY5iLmHDrVIOZGYPPQFB5x7T4svQatlZbk9ZhTqM7nj/xwjg6zrQyoz3Jq+0idw5d70sD0TUSDVE54=
X-Received: by 2002:a9d:f26:: with SMTP id 35mr296386ott.260.1576620148098;
 Tue, 17 Dec 2019 14:02:28 -0800 (PST)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 17 Dec 2019 16:02:12 -0600
Message-ID: <CALLMt=oyMtrZ4iU5BukqrNF4-7wXWPaSOxg20Hr3Y4Lo182Ejw@mail.gmail.com>
Subject: bitbake of individual repositories
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

Assuming we get some more compute resources for our community CI, the next
logical step would be to enable bitbake on some individual code repositories.
bmcweb would be my first repo for this because we find the most
regressions there
later in the CI cycle (meta-phosphor) with the Redfish validation tests.

I know we've done some brainstorming in the past on how we could do bitbake of
code repositories easily and was interested in others thoughts/ideas.

- Modify the recipe to use the nobranch=1 option and have it pull the commit
out of github (all gerrit commits are mirrored to github so you can update a
recipe to pull that from github)

This option is nice in that it's just a two line change to a recipe and then
the normal bitbake process. It's challenging in that we'll probably have to
hard code the association between a repository, its recipe, and its URI/SRCREV
info. I just don't think we've been consistent enough with our recipe names
to ensure this could always be dynamically figured out?

- Use devtool to create a local repo of the repo you want to test and then
copy in the code that triggered the jenkins job.

This option is nice because you already have the code you want to test from the
gerrit trigger in Jenkins. It's challenging in that you'd have to ensure the
devtool modify maps to the repo name (which may not always be the case?) and
you'd have to parse the command line feedback from devtool to know where to
copy the files. devtool is something you'd have to run within the bitbake
environement which adds a bit of complexity since our current design is to
set up the src directory and then just have the docker container build it.

Other ideas out there?

Andrew
