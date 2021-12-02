Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 712D7466484
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 14:29:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4cJN2G0Xz306h
	for <lists+openbmc@lfdr.de>; Fri,  3 Dec 2021 00:29:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=F9PmhLGt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=F9PmhLGt; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4cHv5XRgz2ymg
 for <openbmc@lists.ozlabs.org>; Fri,  3 Dec 2021 00:29:31 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id C3085437FF
 for <openbmc@lists.ozlabs.org>; Thu,  2 Dec 2021 13:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 mime-version:content-transfer-encoding:content-type:content-type
 :content-language:accept-language:message-id:date:date:subject
 :subject:from:from:received:received:received:received; s=
 mta-01; t=1638451764; x=1640266165; bh=p6xcNVppUslvBdt0YFMstiurI
 kdQtkTfvOv2UKmvano=; b=F9PmhLGtOWv7/m+9jyXLYItr32Rnh8AoAi+cnJ9v9
 55JGzQ1pOYay6z4hsylHAGnoYRumAk6zb0HQ/C66p6QO89VHArM8VAM+A88CjMAK
 xw51jPWOd/7jXWANNbTL+JzcaeFSTGUi990XKhkXlrzlYk3W72fV7hfRQFYtnZQo
 vs=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yfhtDJW6F34I for <openbmc@lists.ozlabs.org>;
 Thu,  2 Dec 2021 16:29:24 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 8233E41641
 for <openbmc@lists.ozlabs.org>; Thu,  2 Dec 2021 16:29:24 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (172.17.100.104) by
 T-EXCH-04.corp.yadro.com (172.17.100.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Thu, 2 Dec 2021 16:29:24 +0300
Received: from T-EXCH-04.corp.yadro.com ([fe80::d8c5:6f0a:3d48:18df]) by
 T-EXCH-04.corp.yadro.com ([fe80::d8c5:6f0a:3d48:18df%15]) with mapi id
 15.01.0669.032; Thu, 2 Dec 2021 16:29:23 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Is BBLAYERS_NON_REMOVABLE obsolette?
Thread-Topic: Is BBLAYERS_NON_REMOVABLE obsolette?
Thread-Index: AQHX539Ue7hBt86cFU6j54PFVQMwbg==
Date: Thu, 2 Dec 2021 13:29:23 +0000
Message-ID: <bf3a0a05af8f4307ad487f29e0c19da3@yadro.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [172.17.1.114]
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

It seems to me BBLAYERS_NON_REMOVABLE is obsolete.
At least I haven't found where is it used.

Yocto documentation said that was used by the Hob
  https://www.yoctoproject.org/docs/1.5.2/ref-manual/ref-manual.html#var-BB=
LAYERS_NON_REMOVABLE
that removed since yocto-2.1.
  https://www.yoctoproject.org/tools-resources/projects/hob

Likely it's time to remove this variable.
As I can see it's copied to all layers and assume it's just copy-past.

What do you think?=
