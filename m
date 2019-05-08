Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 628DC16F20
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 04:40:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zLL64xRlzDqN9
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 12:40:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=210.51.26.145; helo=unicom145.biz-email.net;
 envelope-from=wangzqbj@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
Received: from unicom145.biz-email.net (unicom145.biz-email.net
 [210.51.26.145])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zLK90jFPzDqLT
 for <openbmc@lists.ozlabs.org>; Wed,  8 May 2019 12:39:19 +1000 (AEST)
Received: from ([218.57.135.44])
 by unicom145.biz-email.net (Antispam) with ASMTP (SSL) id ZHV85405
 for <openbmc@lists.ozlabs.org>; Wed, 08 May 2019 10:39:05 +0800
Received: from Jtjnmail201617.home.langchao.com (10.100.2.17) by
 jtjncas06.home.langchao.com (172.30.26.25) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 8 May 2019 10:39:08 +0800
Received: from mail-lj1-f180.google.com (10.100.1.52) by
 Jtjnmail201617.home.langchao.com (10.100.2.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 8 May 2019 10:39:19 +0800
Received: by mail-lj1-f180.google.com with SMTP id z5so10981941lji.10
 for <openbmc@lists.ozlabs.org>; Tue, 07 May 2019 19:39:04 -0700 (PDT)
X-Gm-Message-State: APjAAAU0kPuwRrneuS9IxIyg+gLSDE6YTnN0q2tfQTsshfkQ16dBgTpT
 X3krLZU54W9bweYgtxEudFKI3iNwO+A3oKGpAaA=
X-Google-Smtp-Source: APXvYqyhUHhfgUBdDRGuijo7hOaIs6fbIJ+TScUV2Q+24SFOhbR36p44c7+cwzLCGm+f5QBj/POBtcBAI+n3ni5E9Rg=
X-Received: by 2002:a2e:4457:: with SMTP id r84mr19449392lja.112.1557283141882; 
 Tue, 07 May 2019 19:39:01 -0700 (PDT)
MIME-Version: 1.0
From: John Wang <wangzqbj@inspur.com>
Date: Wed, 8 May 2019 10:38:50 +0800
X-Gmail-Original-Message-ID: <CAHkHK0_+4z7TJd_g9WszOFoPkFw5D0nh=EPhaqKSKinO7rzQRA@mail.gmail.com>
Message-ID: <CAHkHK0_+4z7TJd_g9WszOFoPkFw5D0nh=EPhaqKSKinO7rzQRA@mail.gmail.com>
Subject: Can't log in to bmc via ssh
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000007c9c850588573ce6"
X-Originating-IP: [10.100.1.52]
X-ClientProxiedBy: jtjnmail201606.home.langchao.com (10.100.2.6) To
 Jtjnmail201617.home.langchao.com (10.100.2.17)
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

--0000000000007c9c850588573ce6
Content-Type: text/plain; charset="UTF-8"

HI All,

I can't log in to bmc with ssh, bmc's network configuration is good.
I wrote an `echo server` for testing and found that it was able to
communicate properly.

netstat -an did not see the monitor 22 port,ssh -p 2200 also doesn't work.

I don't know how to debug and troubleshoot the problem, so ask here.

Thanks

John

--0000000000007c9c850588573ce6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">HI All,<div><br></div><div><div>I can&#39=
;t log in to bmc with ssh, bmc&#39;s network configuration is good.</div><d=
iv>I wrote an `echo server` for testing and found that it was able to commu=
nicate properly.</div><div><br></div><div>netstat -an did not see the monit=
or 22 port,ssh -p 2200 also doesn&#39;t work.</div><div><br></div><div>I do=
n&#39;t know how to debug and troubleshoot the problem, so ask here.</div><=
/div><div><br></div><div>Thanks</div><div><br></div><div>John</div></div></=
div>

--0000000000007c9c850588573ce6--
