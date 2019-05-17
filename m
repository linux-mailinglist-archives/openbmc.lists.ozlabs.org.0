Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFA0214C7
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2019 09:49:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4550m91vy9zDqRt
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2019 17:48:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.soldatov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="UZIokn9s"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4550lc3HdlzDqRJ
 for <openbmc@lists.ozlabs.org>; Fri, 17 May 2019 17:48:25 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 3A1F6412D2;
 Fri, 17 May 2019 07:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 mime-version:content-type:content-type:content-language
 :accept-language:message-id:date:date:subject:subject:from:from
 :received:received:received:received; s=mta-01; t=1558079298; x=
 1559893699; bh=wAeDFGexbQFUAuIScN18nF2KHQg7fRUCOe1k2e+q6Yw=; b=U
 ZIokn9sMQDAypBJSMR2u6vGW+RWbbi7BHLF3KwF577XYthZRHlMN8M9uUMbhcIeT
 N2Xkc2TwqjD7Ur3gjPjtLSXbtE3+PxjsRfoqigN5n7p8B7GST9wBTfTXZDd6VM/E
 7h5TSGrG9NOcheG7Gbmuf+mE+T3YvbHvhakXvihHFA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dbCwLizvU-ta; Fri, 17 May 2019 10:48:18 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 396EF41185;
 Fri, 17 May 2019 10:48:18 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (172.17.10.102) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Fri, 17 May 2019 10:48:17 +0300
Received: from T-EXCH-02.corp.yadro.com ([fe80::c50f:8da9:c1e8:e0ce]) by
 T-EXCH-02.corp.yadro.com ([fe80::c50f:8da9:c1e8:e0ce%14]) with mapi id
 15.01.0669.032; Fri, 17 May 2019 10:48:17 +0300
From: Alexander Soldatov <a.soldatov@yadro.com>
To: Lei YU <mine260309@gmail.com>
Subject: Romulus avsbus-control and vrm-control
Thread-Topic: Romulus avsbus-control and vrm-control
Thread-Index: AQHVDIK8jQNgufvLwUOZA0QLgUIjxQ==
Date: Fri, 17 May 2019 07:48:17 +0000
Message-ID: <24ded2792fbf485689db57aad5f98626@yadro.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.17.15.69]
Content-Type: multipart/alternative;
 boundary="_000_24ded2792fbf485689db57aad5f98626yadrocom_"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_24ded2792fbf485689db57aad5f98626yadrocom_
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

  Hi Lei YU,


  There is some question about avsbus-control and vrm-control on the Romulu=
s. There are no public documentation for the IR35221 chips, which are used =
in the Romulus. Could anyone explain what  avsbus-control and vrm-control i=
2c command sequences do or give register description for the IR35221, pleas=
e?


  Regards,

  Alexander Soldatov.

--_000_24ded2792fbf485689db57aad5f98626yadrocom_
Content-Type: text/html; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dkoi8-r">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Arial,Helvetica,sans-serif;">
<p>&nbsp; Hi Lei YU, <br>
</p>
<p><br>
</p>
<p>&nbsp; There is some question about <span>avsbus-control and vrm-control=
</span> on the Romulus. There are no public documentation for the
<span>IR35221 chips, which are used in the Romulus. </span>Could anyone exp=
lain what&nbsp;
<span>avsbus-control and vrm-control</span> i2c command sequences do or giv=
e register description for the
<span>IR35221</span>, please?</p>
<p><br>
</p>
<p>&nbsp; Regards,</p>
<p>&nbsp; Alexander Soldatov.<br>
</p>
</div>
</body>
</html>

--_000_24ded2792fbf485689db57aad5f98626yadrocom_--
