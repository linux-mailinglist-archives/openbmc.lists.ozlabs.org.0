Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4748D21269
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2019 05:11:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454tcD4jJZzDqQd
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2019 13:11:40 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 454tYr1LnKzDqQZ
 for <openbmc@lists.ozlabs.org>; Fri, 17 May 2019 13:09:33 +1000 (AEST)
Received: from ([60.208.111.195])
 by unicom145.biz-email.net (Antispam) with ASMTP (SSL) id IIA85521
 for <openbmc@lists.ozlabs.org>; Fri, 17 May 2019 11:09:21 +0800
Received: from Jtjnmail201617.home.langchao.com (10.100.2.17) by
 jtjnmail201604.home.langchao.com (10.100.2.4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Fri, 17 May 2019 11:09:20 +0800
Received: from mail-lf1-f52.google.com (10.100.1.52) by
 Jtjnmail201617.home.langchao.com (10.100.2.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 17 May 2019 11:09:20 +0800
Received: by mail-lf1-f52.google.com with SMTP id v18so4228793lfi.1
 for <openbmc@lists.ozlabs.org>; Thu, 16 May 2019 20:09:19 -0700 (PDT)
X-Gm-Message-State: APjAAAUbC36TIANLOpSG9Bghy969IXI9o9Tc1XypJgWoG5449PzQYew5
 jGTYzN/hyIuCv2L13TAF5CtjeHDQDXhLpUejUzE=
X-Google-Smtp-Source: APXvYqxxP/7W9JpE9NR7xniyhmx0K51mdRhCi3XDFrJlFHWeWKVCZgiNcmaBBsxQR4LuNuNUf9ZtIE3dCstAwVr1y1g=
X-Received: by 2002:ac2:5935:: with SMTP id v21mr15854768lfi.117.1558062556800; 
 Thu, 16 May 2019 20:09:16 -0700 (PDT)
MIME-Version: 1.0
From: John Wang <wangzqbj@inspur.com>
Date: Fri, 17 May 2019 11:09:05 +0800
X-Gmail-Original-Message-ID: <CAHkHK0_zVn=0F2FhrVHpfKHUeZFgxgBY_4q3oQyhttvORT0Rfg@mail.gmail.com>
Message-ID: <CAHkHK0_zVn=0F2FhrVHpfKHUeZFgxgBY_4q3oQyhttvORT0Rfg@mail.gmail.com>
Subject: [gerrit] `git review -l` can not list the open reviews
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.100.1.52]
X-ClientProxiedBy: jtjnmail201610.home.langchao.com (10.100.2.10) To
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

Hi,
When I used `git review -l` to see the open reviews,`git review`
aborted.
Log:
```
 File "/usr/bin/git-review", line 10, in <module>
    sys.exit(main())
  File "/usr/lib/python2.7/dist-packages/git_review/cmd.py", line 1522, in main
    _main()
  File "/usr/lib/python2.7/dist-packages/git_review/cmd.py", line 1447, in _main
    list_reviews(remote)
  File "/usr/lib/python2.7/dist-packages/git_review/cmd.py", line 973,
in list_reviews
    review_field_width[i] = max(len(r[i]) for r in review_list)
  File "/usr/lib/python2.7/dist-packages/git_review/cmd.py", line 973,
in <genexpr>
    review_field_width[i] = max(len(r[i]) for r in review_list)
TypeError: object of type 'int' has no len()
```
$ git review --version
git-review version 1.25.0

`git review -l` works fine on an old gerrit version.

Has anyone encountered this problem and how should it be solved?

Thanks

John
