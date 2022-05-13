Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD13525A8F
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 06:17:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzwNg4ng5z3cCJ
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 14:17:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=facebook header.b=hhYP088i;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=613212e35b=pdel@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=hhYP088i; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzwNM44Y6z3bWx
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2022 14:17:38 +1000 (AEST)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24D0ZNJP009739
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 21:05:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=NZJrEIBE8B7jzc/WPV/Nzy31asqaWQJvgsI15JDNbfo=;
 b=hhYP088i5yOS1VOO0YF8KE5rrpwQX+80pxIJfC2ICct41OHQw4A6l6SCnfbYxX/g+DfQ
 6UtAMKjfGxnBI45G/a2Lh9W48uD7/NS/t8Y57aKWBvNT3q0j0ABTsH9y1AEmrbDW+HmQ
 kPit3xmpKMqeCd7/krSCY5iMJrvz5k7BfKo= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3g1cwx8rfs-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 21:05:02 -0700
Received: from twshared31479.05.prn5.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 12 May 2022 21:05:01 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id B722162D785F; Thu, 12 May 2022 21:02:20 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
Subject: [PATCH 0/2] hw: aspeed: Init all UART's with serial devices
Date: Thu, 12 May 2022 21:02:18 -0700
Message-ID: <20220513040220.3657135-1-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: -F3ApwBKT_o_lfJ_VoHUBwkUP777Fmsd
X-Proofpoint-ORIG-GUID: -F3ApwBKT_o_lfJ_VoHUBwkUP777Fmsd
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-12_19,2022-05-12_01,2022-02-23_01
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
Cc: peter.maydell@linaro.org, zev@bewilderbeest.net, andrew@aj.id.au,
 irischenlj@fb.com, openbmc@lists.ozlabs.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, clg@kaod.org, pdel@fb.com, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

CC'ing Zev and OpenBMC since this was motivated by a problem Zev had there:

https://lore.kernel.org/openbmc/YnzGnWjkYdMUUNyM@hatter.bewilderbeest.net/

This series adds all the missing UART's in the Aspeed chips, and initializes
them all with serial devices (even if there is no peer character device pro=
vided
by the QEMU user).

This allows users to quickly test UART output without any code changes. In =
fact,
you could even connect all the UART's to separate sockets and check which o=
ne is
emitting data.

The first commit is just focusing on adding the missing hardware #define's.

The second commit has more info on the state of the whole Aspeed BMC UART c=
li
interface, and adds the additional initialization code.

By the way, could I put this code into aspeed_soc.h or something? If not,
maybe after this I'll add a file for common code, so that we can move
towards unifying everything.

Peter Delevoryas (2):
  hw: aspeed: Add missing UART's
  hw: aspeed: Init all UART's with serial devices

 hw/arm/aspeed_ast10x0.c     | 38 ++++++++++++++++++++++++++++++++++---
 hw/arm/aspeed_ast2600.c     | 29 +++++++++++++++++++++++++++-
 hw/arm/aspeed_soc.c         | 16 +++++++++++++++-
 include/hw/arm/aspeed_soc.h |  8 ++++++++
 4 files changed, 86 insertions(+), 5 deletions(-)

--=20
2.30.2

