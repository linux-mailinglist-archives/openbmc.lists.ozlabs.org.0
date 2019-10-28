Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED9CE7222
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 13:52:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 471vl56F87zDr1Z
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 23:52:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::234;
 helo=mail-lj1-x234.google.com; envelope-from=karo33bug@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ploc+vwX"; 
 dkim-atps=neutral
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 471vjf6SxdzDqyv
 for <openbmc@lists.ozlabs.org>; Mon, 28 Oct 2019 23:51:34 +1100 (AEDT)
Received: by mail-lj1-x234.google.com with SMTP id c4so11175027lja.11
 for <openbmc@lists.ozlabs.org>; Mon, 28 Oct 2019 05:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=M2gkn/yg/Ox2L2f/mrKzoB21QNjwJg8y1U400aCsXz8=;
 b=Ploc+vwXRjLgZ0AIUY472fUdEcUVGRMQn0D0cl5AyDYxH7MdmHpQO97pFGvYywf0tT
 LWjgdySCBRcqVD2VsdKnadeXr3LXyeRlvHch1XCLKxw3Nuu2FqV3iNLI4ySMfQC9yw1v
 ijNBpQ3XMMzyrsFri5VKIWztgEkh78tBWZtQ9svgqYV7FcMTJq7+XpAxbppnrF0ASxNd
 OsZ02T0oh12z3IU2IaL8UbHInzVdt6EkmwSoLsvlYpOpPRRdwW5TsAox/9He+j8v0AEV
 pqPd9hwpRJOGV6WA0eudjhx+HvH13/IrSJPsZ3AyVZE4PGldxPyTjFDZshp6CJrd8gmc
 ajOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=M2gkn/yg/Ox2L2f/mrKzoB21QNjwJg8y1U400aCsXz8=;
 b=SwNzKrtxDtUUe88ijyTezWwRF0kLtP4I479ICti+pVkSMra+5Qh05IreR/EPKuDjRo
 5Mri+9946C3o7csi/DXEjdwbscA/DPUAPLJ+V9SVt8RF/BrFVlokGTIgQZaoYXnFdHOl
 FF85jDY8/pvxNvWHvYx1m4VVoZkz4QDMoQWPi4iCjDGMLNMYA9hxgZLYpNpThwON387w
 lPDJcPdb19t7GvjXoF1c8VkH+VvLt6Gz5bd/WRiljnzKgAXjvhSkTS+Sv0YSKI62L98B
 BKINoNz6Quz38v762htMqqHyY/HfoDNdl7xVcg1DzHRajKtWfqrtsStAKU6/O8m0T148
 wB7g==
X-Gm-Message-State: APjAAAV+MiASb+vgd382B+1MOtIjz+B+YmEQp31Vo2hBODVzutOrqDfK
 aJmEbLRb2j2sOPoMno/U/k9cbfgzIv44t7yPrMmNWA==
X-Google-Smtp-Source: APXvYqzUYckJt7KcqBcvnJa/VCGPyS5c2uTqAO7fBgAGimKWonTMHaOysO6r9wL5esam2mzZJRY0Ith5ULqFYo9Q84E=
X-Received: by 2002:a2e:3919:: with SMTP id g25mr11802939lja.232.1572267088859; 
 Mon, 28 Oct 2019 05:51:28 -0700 (PDT)
MIME-Version: 1.0
From: Carol Wang <karo33bug@gmail.com>
Date: Mon, 28 Oct 2019 20:51:18 +0800
Message-ID: <CALzeG+989c4bQ-JQRjCV2g_zTKgDHpByJ_G-PsasZMqsg+__Lg@mail.gmail.com>
Subject: Could someone help to review bmcweb code?
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000052d5680595f7f5bf"
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

--00000000000052d5680595f7f5bf
Content-Type: text/plain; charset="UTF-8"

Hi,

I wanna know who can help to review bmcweb code? I'm not sure if the list
of maintainers I added
is changed or not. This is the link of my coding about setting PowerCap.
---->
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/26223

Thanks in advance!

--00000000000052d5680595f7f5bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I wanna know who can hel=
p to review bmcweb code? I&#39;m not sure if the list of maintainers I adde=
d <br></div><div>is changed or not. This is the link of my coding about set=
ting PowerCap. ----&gt; <br></div><div><a href=3D"https://gerrit.openbmc-pr=
oject.xyz/c/openbmc/bmcweb/+/26223">https://gerrit.openbmc-project.xyz/c/op=
enbmc/bmcweb/+/26223</a></div><div><br></div><div>Thanks in advance!<br></d=
iv></div>

--00000000000052d5680595f7f5bf--
