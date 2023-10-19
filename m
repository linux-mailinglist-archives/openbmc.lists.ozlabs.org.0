Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C95647D0566
	for <lists+openbmc@lfdr.de>; Fri, 20 Oct 2023 01:31:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=iQeqMHpA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBPBL585tz30gH
	for <lists+openbmc@lfdr.de>; Fri, 20 Oct 2023 10:31:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=iQeqMHpA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBP9n0BvLz2yDD
	for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2023 10:31:24 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-136-142.adl-adc-lon-bras33.tpg.internode.on.net [118.210.136.142])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 68A8B2014B;
	Fri, 20 Oct 2023 07:31:20 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1697758282;
	bh=Q0/lQkkKRVRll0zqErSO8syq7TpcTle1bJJnWjovKF0=;
	h=Subject:From:To:Cc:Date;
	b=iQeqMHpApuNPnv3olgVM8MWqoVeMpkWAAQNG3LFgN5SXPj5GRjVWLPqokGfz+7HEt
	 v+LqFFpSvTz9f2csdYtJBZ8AXMtbVVQ/NefOnjMT33sLeONAU95fxvc0EIVOSU54BW
	 oQnJ1zd3asI8y7gS/XefU2IgcQn7umexVUdgQRfJTia0vtY8YzW/9tMDrPJFNftWtU
	 XtC63U5Yq226pZX6oAT1OHmULqWRQlqPYSfsUXpNAQbNcGSKuvuhjD+9yAhxNDuCrS
	 VyPk0+uQVwpd2armp5wxez4EiaobydKa5uFc0lpvaGtRpcAWyYWfxfOdA0S/AFN21u
	 Ikg6dJm9jhMOA==
Message-ID: <cca1453bf1b9889bc117a2e0088f1c3f0140dd5c.camel@codeconstruct.com.au>
Subject: Transfer of responsibility with Gerrit's Code-Review -1
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: openbmc@lists.ozlabs.org
Date: Fri, 20 Oct 2023 10:01:04 +1030
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: Zev Weiss <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

Recent discussions identified a couple of community concerns:

1. Patches stall in Gerrit with comments that make it unclear who
should take action
2. Scoring patches `Code-Review -1: I would prefer this is not merged
as is` feels overbearing for some types of review

"I would prefer this is not merged as is" does seem like an opportunity
to stall reviews. It opens the door to leaving feedback that doesn't
explain how to improve the change. It's also possible that the
hesitance in the second point leads to the confusion in the first.

After some discussion with Patrick and Zev, I've made the following
tweak to the Gerrit config:

```
diff --git a/project.config b/project.config
index 23cb59ecfca8..e2ee9c7691b0 100644
--- a/project.config
+++ b/project.config
@@ -64,7 +64,7 @@
     function =3D MaxWithBlock
     defaultValue =3D 0
     value =3D -2 This shall not be merged
-    value =3D -1 I would prefer this is not merged as is
+    value =3D -1 Changes should be made to address my concerns
     value =3D 0 No score
     value =3D +1 Looks good to me, but someone else must approve
     value =3D +2 Looks good to me, approved
```

It's a small change. However, I think it softens the feeling of a Code-
Review -1. Increasing the use of Code-Review -1 may clarify where
responsibility lies for driving the patch forward.

Andrew

