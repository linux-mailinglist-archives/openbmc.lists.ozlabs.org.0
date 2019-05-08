Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EB816F2B
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 04:45:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zLS103WCzDqN3
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 12:45:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=210.51.61.248; helo=ssh248.corpemail.net;
 envelope-from=wangzqbj@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
X-Greylist: delayed 128 seconds by postgrey-1.36 at bilbo;
 Wed, 08 May 2019 12:44:42 AEST
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zLRG0HwkzDqL0
 for <openbmc@lists.ozlabs.org>; Wed,  8 May 2019 12:44:41 +1000 (AEST)
Received: from ([218.57.135.44])
 by ssh248.corpemail.net (Antispam) with ASMTP (SSL) id ZHY67521
 for <openbmc@lists.ozlabs.org>; Wed, 08 May 2019 10:42:21 +0800
Received: from Jtjnmail201617.home.langchao.com (10.100.2.17) by
 jtjncas04.home.langchao.com (172.30.26.23) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 8 May 2019 10:42:23 +0800
Received: from mail-lj1-f172.google.com (10.100.1.52) by
 Jtjnmail201617.home.langchao.com (10.100.2.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 8 May 2019 10:42:34 +0800
Received: by mail-lj1-f172.google.com with SMTP id h21so16058071ljk.13
 for <openbmc@lists.ozlabs.org>; Tue, 07 May 2019 19:42:18 -0700 (PDT)
X-Gm-Message-State: APjAAAUlP96CzRsG5CvCUIg/bXkRy0NZNDe9KbWi7xMv2JeD2B6g5zOp
 XJ7qMBCKC6vjz9NODqDShXyQKvJI3P0yybOLb6g=
X-Google-Smtp-Source: APXvYqwFPGXEb/aUlPrIJxrcjZ5KtE9/cN7sHvA9bNxsD22En6BIPBxDQsAKecFKNIY3PhlWRe9dWtAsy4UOAPuVgTU=
X-Received: by 2002:a2e:81d0:: with SMTP id s16mr19171363ljg.145.1557283336105; 
 Tue, 07 May 2019 19:42:16 -0700 (PDT)
MIME-Version: 1.0
From: John Wang <wangzqbj@inspur.com>
Date: Wed, 8 May 2019 10:42:04 +0800
X-Gmail-Original-Message-ID: <CAHkHK0-4r3ZD4YtOJKZW10FqySmCQ_Kzea=f7kmuyf5rCykitw@mail.gmail.com>
Message-ID: <CAHkHK0-4r3ZD4YtOJKZW10FqySmCQ_Kzea=f7kmuyf5rCykitw@mail.gmail.com>
Subject: How to configure dram memory size
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000001037b20588574819"
X-Originating-IP: [10.100.1.52]
X-ClientProxiedBy: jtjnmail201609.home.langchao.com (10.100.2.9) To
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

--0000000000001037b20588574819
Content-Type: text/plain; charset="UTF-8"

Hi All

My machine memory is 256M, but why is uboot recognized as 512M, where
should I set it?

Thanks

John

--0000000000001037b20588574819
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi All<div><br></div><div>My machine memo=
ry is 256M, but why is uboot recognized as 512M, where should I set it?<br>=
</div><div><br></div><div>Thanks</div><div><br></div><div>John=C2=A0</div><=
/div></div>

--0000000000001037b20588574819--
