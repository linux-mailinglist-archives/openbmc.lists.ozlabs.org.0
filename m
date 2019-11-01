Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E21DDEC02F
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 10:00:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474GPS0kyQzF6gF
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 20:00:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2c;
 helo=mail-io1-xd2c.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Miawg8ft"; 
 dkim-atps=neutral
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474GNQ2ncjzF6g8
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 19:59:49 +1100 (AEDT)
Received: by mail-io1-xd2c.google.com with SMTP id h9so10199093ioh.2
 for <openbmc@lists.ozlabs.org>; Fri, 01 Nov 2019 01:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=lTQorLI3XYmCEqUX36G94GB+HuU2Wqf4f3NCGGhx5m4=;
 b=Miawg8fto0WL+8X1ncKQ9VwH9i+VF6RGI3EPB2nL1rfDwFcAI/yRga3hepxUpZUeTP
 v46CKlgNK4OQuHeNIws6ns/zxKDJucnbwG2l039dGZp+kgPWsimzpP5oGGa3JlkX1SGW
 uj6u4+Xuvzwesy1fTBZQUbHHx6mHmWBSTcfpg3h+d8wz0AoyqUqrWbuY/PCcbjVFB4+3
 IviBBoM6T/mRCmWviDEtZC7DOkeqalAG+oZNWu/zmBIh6ZeeSkcN6gBxURMHAUq/0Yyq
 LEScGOrxzNSm2WlvUFPt26seSi4vVmCyjvf5faEdiwWBfBU9eBFgaI25MXrQJM6p+ILV
 NwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=lTQorLI3XYmCEqUX36G94GB+HuU2Wqf4f3NCGGhx5m4=;
 b=d+IC3EoyienJG5y7h03Q5LEhU5VwcLOrRWZMZDsbohyyVQBUv8v2QSVN09os2VwON5
 PExakzAc9wxMoi4Dq+pRgjTAOvZt3bD1Yz2euyTN60f4aaHGDvrm/XJkynPElw9aPSmc
 Uctug8yqzbV0Jhi257e9rPRHk1vjBFxL0lTxr2tAhJdotjK+/WGXlNtST+nW1PsopLVp
 acS/SUfS0saV8fL/vUA2laZELO1HyoUt5UsRlsgwC8SA78444DBBEM0BhFhypUnp6Eyf
 jnPXa/FutzIxA0XJlHVjyYkiuv3QLD8eGexuU4Sl7eh5+JlINlRPLg2RnF+xu+jmUsgw
 x1Kg==
X-Gm-Message-State: APjAAAWZEtXXC2Tqro4Bwqi3C/ZV6b9CdOkKQqeMJ+sIy85JVdwTdW/l
 OTWAhu7xj5eDtx/SbECqAAqcscnE/7pLb+vVhtdvSva9Uao=
X-Google-Smtp-Source: APXvYqxgcnJhGouYWJIcaq7w4yecp1tU7ym4HdLtT2MI59UInoHPLf6zIpLOlwfAFmhe/OSO7i2vtvkljfoVaBVDODg=
X-Received: by 2002:a02:c4cd:: with SMTP id h13mr46031jaj.33.1572598785226;
 Fri, 01 Nov 2019 01:59:45 -0700 (PDT)
MIME-Version: 1.0
From: Lei YU <mine260309@gmail.com>
Date: Fri, 1 Nov 2019 16:59:34 +0800
Message-ID: <CAARXrtkwC6CoVFDYwwtD38U5whRTbuodxWUF3A0DM+XvQoPJfA@mail.gmail.com>
Subject: How to run tests in bmcweb
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

I am trying to add a unit test case in bmcweb and run it.
With local CI, the tests are not run:

 WORKSPACE=$(pwd) UNIT_TEST_PKG=bmcweb
./openbmc-build-scripts/run-unit-test-docker.sh
 ...
 [100%] Built target bmcweb
 /home/leiyu/work/bmcweb > ctest .
 Test project /home/leiyu/work/bmcweb
 No tests were found!!!
 ...

So the question is, how do I run tests in bmcweb? Should
openbmc-build-scripts be updated to support that?

Thanks!
