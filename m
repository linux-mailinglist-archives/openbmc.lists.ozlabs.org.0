Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 209C1282A35
	for <lists+openbmc@lfdr.de>; Sun,  4 Oct 2020 12:33:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C40ST0YHSzDqHX
	for <lists+openbmc@lfdr.de>; Sun,  4 Oct 2020 21:33:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=manojkiran.eda@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BRGDGRiw; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C40Rb16C7zDqGt
 for <openbmc@lists.ozlabs.org>; Sun,  4 Oct 2020 21:32:42 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id kk9so3544790pjb.2
 for <openbmc@lists.ozlabs.org>; Sun, 04 Oct 2020 03:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:subject:mime-version;
 bh=6BTuDmqxWAb9dN+kK08duJJDXmy9noKAZHkXIh0z7Yk=;
 b=BRGDGRiwd4ixE3diz7bULJrSwr20BLWY/jw7TVhu3ShAfJo0Sjn0LVsn1xOnRfFp9n
 TQV2kEU9WUlMDOrU16gfnb31jcTVzQvu1dASrIklGct6JZYq08vY7ExvA/gyQ5B7J5sB
 DxnIFVlf1PJzzt+tXJ0djqHSRDmXVQ/R1QCQLonLxJcEWMnPSbfADDO3N7RFHeVenTuR
 yeFvld531RO6I8TFBYm6ksNIhXf4deYH1PLaiHJ6m3HhLMjgeIsB4Y8c8Zd5rpcZfC39
 TmYmuII1Y6p6LNtQ8XcXn7vkUQw0HY1ZE3y1EDxGFIsLOc3J17EgjffXOAhtpO7K+10x
 ZPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:subject:mime-version;
 bh=6BTuDmqxWAb9dN+kK08duJJDXmy9noKAZHkXIh0z7Yk=;
 b=gCCpewoGLOS9sUZiErpkbEST8D216d+JQAZ8Vlv2G7s8v9Y5JEPzPDV9NYFXiQ9xJV
 zyJrjECaK94hAty6XczMDll7BZB7b2vHtxe/I690MJkYCssCJjkApO9BrNH1CBPXB4o/
 jhE3PVZ87IEl+pD9idB+J6Jnw1yI1TR96vVNQXpk1ZmHCalnYj1Jjaq4MVPUmJayu0tQ
 s+D3eaMEeiLbm2jTlogRxx0jT9QgMeKl6VYEhm0OjvO5lsIp9jNt4MxzG5RWH5W/rLH3
 87Ebpl4mGmu+ktel1pVQs6ZUdS14LQbHtiwtupKFV2WsyMH6zerKWKth5ZKvcPhNpCl5
 lndQ==
X-Gm-Message-State: AOAM531IWAyMX3ydiYxxw3eXu3/B0O051RAY5bxXvy17u+ylznSu12/l
 +F4cMGunq+oJawK73mWiIIIybW6HEJSDLg==
X-Google-Smtp-Source: ABdhPJxFwETyy3tSO2bkflfhzM0y1ZB/wnDRTJnYl2Hur0Rh6IO9Z3N+pZjTkgX9d3999qnaTJ9Iiw==
X-Received: by 2002:a17:90a:1f43:: with SMTP id
 y3mr11114070pjy.28.1601807557579; 
 Sun, 04 Oct 2020 03:32:37 -0700 (PDT)
Received: from juliet ([106.210.190.250])
 by smtp.gmail.com with ESMTPSA id j4sm8270239pfd.101.2020.10.04.03.32.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 04 Oct 2020 03:32:36 -0700 (PDT)
Date: Sun, 4 Oct 2020 16:02:26 +0530
From: manoj kiran <manojkiran.eda@gmail.com>
To: "=?utf-8?Q?openbmc=40lists.ozlabs.org?=" <openbmc@lists.ozlabs.org>
Message-ID: <98A333AA-0762-41F3-8CEB-BF9A84FB63E5@getmailspring.com>
Subject: BMCWeb migrating to meson build system
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="5f79a4ba_7d0aa77f_928d"
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
Cc: "=?utf-8?Q?liuxiwei=40inspur.com?=" <liuxiwei@inspur.com>,
 "=?utf-8?Q?yulei.sh=40bytedance.com?=" <yulei.sh@bytedance.com>,
 "=?utf-8?Q?xuxiaohan=40bytedance.com?=" <xuxiaohan@bytedance.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--5f79a4ba_7d0aa77f_928d
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi All,

Over this weekend, bmcweb has been migrated to meson and cmake support has been completely removed from the repository. Most likely the recipe transition will also happen in the next couple of days.
The new process of compiling bmcweb is documented at :
https://github.com/openbmc/bmcweb/blob/master/README.md

I tried to make sure that we don't lose any of the existing settings/configuration/features during this porting process. All the bmcweb options have been mapped with a respective meson option. Developers of bmcweb might notice that CI now takes almost 20min to verify a commit unlike cmake which used to take about 8min. The core reason for this difference is that CI infrastructure for meson triggers multiple builds that facilitate static analysis, address sanitization, code coverage apart from a normal build & test.
I would also like to thank Ed(edtanous!) for his support & guidance during this process.
For the next couple of days , I would watch out for bmcweb failures on repo-ci's as well as meta-ci's to ensure there are no glitches during the porting process. Please reach out to me(manojkiraneda!) if you have any questions or issues.
Thanks,
Manoj


--5f79a4ba_7d0aa77f_928d
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Hi All,</div><br><div>Over this weekend, bmcweb has been migrated to=
 meson and cmake support has been completely removed from the repository.=
 Most likely the recipe transition will also happen in the next couple of=
 days. </div><br><div>The new process of compiling bmcweb is documented a=
t :</div><div><a href=3D=22https://github.com/openbmc/bmcweb/blob/master/=
README.md=22 title=3D=22https://github.com/openbmc/bmcweb/blob/master/REA=
DME.md=22>https://github.com/openbmc/bmcweb/blob/master/README.md</a></di=
v><br><div>I tried to make sure that we don't lose any of the existing se=
ttings/configuration/features during this porting process. All the bmcweb=
 options have been mapped with a respective meson option. Developers of b=
mcweb might notice that CI now takes almost 20min to verify a commit unli=
ke cmake&nbsp; which used to take about 8min. The core reason for this di=
fference is that CI infrastructure for meson triggers multiple builds tha=
t facilitate static analysis, address sanitization, code coverage apart f=
rom a normal build &amp; test.</div><br><div>I would also like to thank E=
d(edtanous=21) for his support &amp; guidance during this process.</div><=
br><div>=46or the next couple of days , I would watch out for bmcweb fail=
ures on repo-ci's as well as meta-ci's to ensure there are no glitches du=
ring the porting process. Please reach out to me(manojkiraneda=21) if you=
 have any questions or issues.&nbsp; </div><br><div>Thanks,</div><div>Man=
oj</div><br>
--5f79a4ba_7d0aa77f_928d--

