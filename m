Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 198F92A7C23
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 11:48:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRgH46jbQzDqmT
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 21:48:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=shaikkhaderbasha601@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=adxDtfPw; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRgG71JftzDqlV
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2020 21:47:42 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id x23so595960plr.6
 for <openbmc@lists.ozlabs.org>; Thu, 05 Nov 2020 02:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=HMUAP7V1DsqUgvmiZxqxyVaLrTOHjdvsU1qAa1wFoaw=;
 b=adxDtfPwwVU3wh1ZFTH4fuHUueK7EWycPjzycsd06VkfsDpn4Aau+Ov56b8UmbK/QB
 RBY6Ttpy5Bs/tQotFvEZOjFtHONQVW8D8ixNVbTwULiI2twNpls8cGwUOJR5H9P9LnYe
 144/Hqx/FRsUVIc/skw6/0yyE9AWr/gqecANzoP6LEfIsatQ6K8c2tZF6edEAL84IgRG
 ++6ZcJN9PDoTLs9+osE0C9gDdbVjlsAnxndwMxHrNwPLAGwY5RDpFIocOCj/xEji7iPG
 Sff4+k9759sPJCzdPDH33MpOLvBj/1m5HZ9W+QcNN4HkrmCgK2txQbH85OJauDKOwBrQ
 KNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=HMUAP7V1DsqUgvmiZxqxyVaLrTOHjdvsU1qAa1wFoaw=;
 b=A22pB0sNY2G/E0S+//W6XWTbmryYkEQtqH5s4WvOZYx+fvd604fOt1E7zfcXASBUPC
 WAjZlmi4xf4v42niCb2pJGeb7F7Vh1hoO9KL+zmyD37zK4CNO4Wkpx0C+k7OA81qfjhS
 vk9grQ2w0uLHum0oJ2z9a+C1kbfLKyVEjy5ZDg7IALr9BxYHg/a1AjEaSaZhpGm1oaTX
 0NVj23q26Zsda6b8iMXMHKxY/qH7ZUzMfGCuU0mQQb5/AYQZ1wLL0RRtqWYIVSd7Rept
 9tOj90kv1bHdVyvDivcWWdT7jkFpG7N7qUrpKlgK3b0DwOluhFM6KzyDPZNignf8j+0t
 3L0g==
X-Gm-Message-State: AOAM532a/c7lOPaPIGQvhMFzikgcoAqpdEqok+BiReKF3q7R55aR8vXe
 iWnn2Tfx5dXp+sQQlG8UvRa3q3t2BdoJVcYMd11p5RW6emGX6Q==
X-Google-Smtp-Source: ABdhPJwfjWKJJYhWqaj64Y4GU7OJowpfYWk2pF2/24B1IcDbmaPYbWrJVr8x7I4NqT9ZbzXa8a99WSDDp1+Q4bCs15c=
X-Received: by 2002:a17:902:d710:b029:d3:7e54:96d8 with SMTP id
 w16-20020a170902d710b02900d37e5496d8mr1914615ply.65.1604573260113; Thu, 05
 Nov 2020 02:47:40 -0800 (PST)
MIME-Version: 1.0
From: khader basha shaik <shaikkhaderbasha601@gmail.com>
Date: Thu, 5 Nov 2020 16:17:29 +0530
Message-ID: <CAD+gp9B3q6A4Hp4N7f_T8CJuw0n1sk=vkCHWebx0seyuxJjx_w@mail.gmail.com>
Subject: How to integrate new libraray in openbmc
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000002f6bb505b359d3cc"
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

--0000000000002f6bb505b359d3cc
Content-Type: text/plain; charset="UTF-8"

Hi Team,

I have a custom library and need to integrate it with openbmc.The library
provides various output related to system information.
I need this information to show up in phosphor-webUI.

In my understanding we need to register it with dbus interface.
So I need to integrate my custom library with dbus.

But I do not have much information about where to start?


Any help or information on this would be really helpful.


Thanks & Regards,

Khader B Shaik

--0000000000002f6bb505b359d3cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Team,<br><div><br></div><div>                     =
                                                                           =
                                                   <div class=3D"gmail-appl=
ication-main"><div class=3D"gmail-container-xl gmail-clearfix gmail-new-dis=
cussion-timeline gmail-px-3 gmail-px-md-4 gmail-px-lg-5"><div class=3D"gmai=
l-repository-content"><div class=3D"gmail-js-check-all-container"><div clas=
s=3D"gmail-js-issues-results gmail-js-socket-channel gmail-js-updatable-con=
tent" id=3D"gmail-show_issue"><div id=3D"gmail-discussion_bucket"><div clas=
s=3D"gmail-gutter-condensed gmail-gutter-lg gmail-flex-column gmail-flex-md=
-row gmail-d-flex"><div class=3D"gmail-flex-shrink-0 gmail-col-12 gmail-col=
-md-9 gmail-mb-4 gmail-mb-md-0"><div class=3D"gmail-js-quote-selection-cont=
ainer"><div class=3D"gmail-js-discussion gmail-ml-0 gmail-pl-0 gmail-ml-md-=
6 gmail-pl-md-3"><div class=3D"gmail-TimelineItem gmail-pt-0 gmail-js-comme=
nt-container gmail-js-socket-channel gmail-js-updatable-content"><div class=
=3D"gmail-timeline-comment-group gmail-js-minimizable-comment-group gmail-j=
s-targetable-element gmail-TimelineItem-body gmail-my-0" id=3D"gmail-issue-=
731144798"><div class=3D"gmail-ml-n3 gmail-timeline-comment gmail-unminimiz=
ed-comment gmail-comment gmail-previewable-edit gmail-js-task-list-containe=
r gmail-js-comment gmail-timeline-comment--caret"><div class=3D"edit-commen=
t-hide"><span disabled><table class=3D"gmail-d-block"><tbody class=3D"gmail=
-d-block"><tr class=3D"gmail-d-block"><td class=3D"gmail-d-block gmail-comm=
ent-body gmail-markdown-body gmail-js-comment-body"><p>I have a custom libr=
ary and need to integrate it with openbmc.The library provides various outp=
ut related to system information.<br> I need this information to show up in=
 phosphor-webUI.</p><p>In my understanding we need to register it with dbus=
 interface.<br> So I need to integrate my custom library with dbus.=C2=A0</=
p><p>But I do not have much information about where to start?</p><p><br></p=
><p>Any help or information on this would be really helpful.</p><p><br></p>=
<p>Thanks &amp;=C2=A0Regards,</p><p>Khader B Shaik</p></td></tr></tbody></t=
able><br></span></div></div></div></div></div></div></div></div></div></div=
></div></div></div></div></div></div>

--0000000000002f6bb505b359d3cc--
