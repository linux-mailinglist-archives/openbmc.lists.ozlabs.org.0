Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F29EE479B98
	for <lists+openbmc@lfdr.de>; Sat, 18 Dec 2021 16:39:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JGVQd6Tv3z306m
	for <lists+openbmc@lfdr.de>; Sun, 19 Dec 2021 02:39:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=hxqkAfdc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.19; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=hxqkAfdc; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JGVQ93SrSz2y7P
 for <openbmc@lists.ozlabs.org>; Sun, 19 Dec 2021 02:39:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1639841945;
 bh=MRyFDIwwAfIPkkcyDVDGrNn3Seh++39CRJKoEQM13Do=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=hxqkAfdcsryX7ITENmrwy5AFO5z8XeFJ34subuAAK2iJiczKdxqzblbk7TZF9MO7i
 U+BI2XvOWNaPCG3NMFoqmMreF0bZA1CStsCWK+caJe4VWvL3MRQ3OfXKB5z97+wsNG
 9UT4ZDgI79fmTYfqX7pqy2Rtm7OsA7962JBh+S7M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Ma24s-1n228K3Kwm-00VzCG; Sat, 18
 Dec 2021 16:39:04 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] MAINTAINERS: ARM/WPCM450: Add 'W:' line with wiki
Date: Sat, 18 Dec 2021 16:38:48 +0100
Message-Id: <20211218153848.750547-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vagE4hLBPDZwE8fYlJP2cALU9IV/bKr3GmSeIK85Z2G9Zeiz9R3
 Hocb2R8fI2og1N8TzR+0haTR0ffOJQCurktImQ2IrjEiIjHwHMAoU8m2I8xGOWDjcQEKBB0
 hu3Ewf8D3xptpeb5Ca0Q1Hn1GIUcHLkxZYoanRPnP8ruAK35N3S+AVlNehLVWFEBdcYs/OC
 51UEAuzvTDI/HWch1FODw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pSeuRBInons=:Ulr1FJeoFn+j4E4uEoiLkA
 TvVmMt1gqc3qy0cnAM+1cN9jRYrvNNHRTLp3QHVfzAs8JWAu7TuUAd+iMKss09fP56JXd4cbY
 lizO6Fi/caMpfqTG7TGpGorBzTPQF7o5xdbp3A+NjDtxLtcxSnYz1B2Hbj3XZvgLbvCd5xN+l
 tf6YkVGSDWFg6S0XfkfsmscRULekj4JO2KppvpFhjvlWTPLPjF18CpQc/4sX6trhw6K60d2ou
 iU62l7G/K+3sKYgm1QGbqxMl4XVqYZlLUaaUavYlUf62C7O5fwfLq/InJRYxgZiHZt58yD8vx
 udOVoSrynbKBiKD8v4wx4q3VeTN5U0DixQef24w3mXuppma1Hj+hd2admb0JRmhPNL2QvuxnZ
 ITD9VgwUXvk8Ui58LqJrapmfbDJs5+V/tPN+yLMz27TjKm9cpgaV2lSy3IvSS2GqkMkfbCbEL
 8m2KDeNqnbLkIDFPbDBNtZBM9PoTLjlXHyb7y82xsfnx0Gn4cwwp2uVImqRuhgkTQKeFsrYHx
 H/3h/ZQJedYeVSbZBiSgYC6IsZNqMZurHJnYv0jYhlTr7Sp2DQ5MdOYKDBG2eNXnM3jx4TSDs
 Hl1Gil107BGI2Hcj5cxgaFw2+h1tRLzcV0JUrcGOvXIPGzUFE5Nx+YOvxshLYU1y5S3FBvsCp
 mOv3p0TX/8sIgsH9tiGHLRroiamyL04h4ACoYmzl2wEbkFmMphytVhWWRyStQ3owRBUU8aZXD
 151QGtzJBMn8HPWOOtK97DKKDMWu6MVyigwj1TGBIS4R8jI79jc8M5ee7BWW8qW9bptbxW/tu
 ifISIApyiPcQF9u9gBVsYhHEesYMbI4iVeVhj/QHSrtIB4dl+4aJFlXQ7WW9KWGxugVb7BpS9
 l6Fh4XJz16tuQWoeA1vOmq1vVfmmKNDHrwZi41UbjMl97K5N0csS/y34tCi+gqrY+c4t1ekfD
 Evp6E98JgetmIkKhlmnzZqx0xBqyh6gDkl66jRZZBidzNu2tfIkZ55iA0rvxdIFzuzyb6RTqF
 TF0xesUK4Y55hWuyQ8rMZ8DgrAya9xlarvcpg0sJ8qmsXkzHkhwl7CHoMrBnE8p5yYtGlVE3O
 Upq8Wf5EHX8Kuw=
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
Cc: linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The wiki is a useful source of 3rd-party information about the SoC,
mostly hardware documentation.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1fbbd9fa88d86..39d9e2c6f94ac 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2350,6 +2350,7 @@ ARM/NUVOTON WPCM450 ARCHITECTURE
 M:	Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
 L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 S:	Maintained
+W:	https://github.com/neuschaefer/wpcm450/wiki
 F:	Documentation/devicetree/bindings/*/*wpcm*
 F:	arch/arm/boot/dts/nuvoton-wpcm450*
 F:	arch/arm/mach-npcm/wpcm450.c
=2D-
2.30.2

