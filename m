Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C6546C7C2
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 23:50:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7wVV6wgjz2yxL
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 09:50:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=Blz4Gt40;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.20; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=Blz4Gt40; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7wV429l8z2xDT
 for <openbmc@lists.ozlabs.org>; Wed,  8 Dec 2021 09:49:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1638917381;
 bh=A68nTVr2A5reCqtLvHISJZyYBFmL+bfScMzNfjGakIA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Blz4Gt40aQBbW+QDnx3rdFWKanbGrl9LjbD2Iu8b3L+AD1fcZBuRj5BZB1OdFPpgD
 0TiKln/YupRq1Uf0xdUVY1zxajveSopYp3gd2tOAc+Xm0cDG4HK+baPJcZ2jfWc7a0
 XYzpCJ+f85YlUwqGmtFvB6UEPmMOC3ELZfAlg5zc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLQxX-1nBR5C1LjH-00IQhT; Tue, 07
 Dec 2021 23:49:41 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2] MAINTAINERS: Nuvoton NPCM: Add myself as reviewer
Date: Tue,  7 Dec 2021 23:49:31 +0100
Message-Id: <20211207224931.2026620-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aDXhXhLoc4C8G0XnE9vQJcA4BZ+8I1YhbNy76enAZ7Q3cGElo8F
 sw+yO/ot2BJlhvjEdv5CiGvPI56txNUykOWvMzIhbKKiByq1JKOe+EEycC8E7QU6MsMddNB
 1ZR/b9UGl5f2v7FEUiPlZfhYrcSZTdmnoaXf8erPInjDPwNqLtTVhh42gtDHt6X3XlImAAX
 skJKWX4ip32U81Yt5yzHw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9ke01iRbufA=:CmKcors0kTsoqK3t+RGgKI
 aJs5qp/sgrK+OAqCFKf2n+zNGQmnBjE+zEZudfhcczVUgNTOMIwoIBrod81sswROT4NeNbO3C
 ouhUP0+xtAfAD1icmFyRdVXbvvuVXimJ8+i+V7UxGGSyf2Agn8oemjFW1fhVR7yyfNFhYpi0Q
 X4PHqp2IPpNvEtRctHxAcKGe9kLqk8D6A7XI7piDaeC+Tb8Z7sQBwnIHr68y3itKhOMJlQMZJ
 ueJomiYtLvSLNlg33aYUR08lOJGM2E9levpbN6clS/gb/A66gwjxhyOJIUCv4Uf49xF0LRxbA
 LMKRH3+efSNsHs7thO3/6Vr+5y8fWHKsf4Bxs0tTzV7c73QJefTg02c4HxTDtpuZb+iuwI2Po
 ptIv+51kVBB2DUsLQxW07mDdi487NJkNg5LWEam2H51D2nODkvJmgpgOmLV1ZIuwVkjCF4CCv
 KV1zXUgoWwyjx1iZ+MMuxVAVoB6GGnhqhyatpdAcWsdazqMHCVwKuMXLn+llA43w9bog5tDXt
 f6XcUfADwSeVvSrjwWF3H0OuYUYI+ke9YCIWhKYwdH0dLrSqmXYbiB8jproFhxZuTOdbsjzbo
 PTpkNQex09llvbfU7TamEppdYuGlUluZylunuZLRe8PaECld0GIv6c6RKoi/1GxBi3gyLlcII
 ZqhDw+ZmdsKAY7lAE4h2EqiUnNonQC3QFEdn2ZwaqwsQ8mUSQ+kTqUwlbqjMSooBjyYeotm41
 D4nCHJTe3Qbp7jjRuFzVryR2X/IIDHgl1MK89RkiytKZglDUxD3arIh6C5Y22iucXqBJiIe8g
 6PETjpMKoyBKdkx1OePZ+JrHztTbVYGTR82UkeL8ffD4p//N3JH62epzAmHyhWOMtnMgmLuXX
 1pjhuFdCHDQMdISWl7Qdj6i1aOouX/BfA1AgUQAUV/7SuaI5rbJW8PZCfwIITubJMQwlSDneF
 TCBddhCYmCoQ7MhOpnCESvIMmwTArR6sw1mpNS8AMBVryleZCKWymKe2DNHin1cl4xhPep8ny
 exHhSamxinSyUHtYlFk7dRMeh+JMTbGrRW6XwbkgVeiQ9KvhTOSU93gsAY/veRLDNHF2RIdWe
 46DTXIOsKN+Fag=
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
Cc: Avi Fishman <avifishman70@gmail.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Nuvoton NPCM7xx SoCs share a lot of the hardware design with Nuvoton
WPCM450. I'm adding myself as a reviewer, so I don't miss patches that
affect both NPCM7xx and WPCM450.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Reviewed-by: Avi Fishman <avifishman70@gmail.com>
=2D--

v2:
- Added R-b tag

v1:
- https://lore.kernel.org/lkml/20210508113342.94457-1-j.neuschaefer@gmx.ne=
t/
=2D--
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 360e9aa0205d6..788b1b6b7b6a6 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2334,6 +2334,7 @@ M:	Tali Perry <tali.perry1@gmail.com>
 R:	Patrick Venture <venture@google.com>
 R:	Nancy Yuen <yuenn@google.com>
 R:	Benjamin Fair <benjaminfair@google.com>
+R:	Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
 L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/*/*/*npcm*
=2D-
2.30.2

