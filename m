Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DFA26C3E3
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 16:52:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bs33d6zdkzDqMk
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 00:52:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=manojkiran.eda@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HPTEmWeb; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bs2xp5SpPzDqZ3
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 00:47:19 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id e4so3316135pln.10
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 07:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:subject:mime-version;
 bh=YFkZ1Vj1HGa41/4htyPUjtYUy9MQ8yX6GJ67fouIDR0=;
 b=HPTEmWebRUNNbbhN3O8jkMcxLPIcbrqLSLi/brf+eOHdJF2j4Qa+rLyHvkGqU1NOt6
 FDNnOAMNMknOLYbMRc8kfGESKV2bEcs1gih3BOJLMSs0ytba6AMIWY22inuXuqqAh3wq
 HwgwuFHc0KiEW3nuM3LshW90dojTCqSZbmDoSaAYkm++o8g8fPG8k34CyG49Vy2T4IRK
 7IITqgiECbmRG3deTeU6iJ/KUS7us4YxwoXdy8/ASTsg5FacA7lIyAXpM75tDi82czBU
 KCwgCA4JERDIiKLcRN6IuW9u2rZOLPM0bktdPtvLl9xMeCTHK5K+ee7eD/2dZv2aFWan
 tHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:subject:mime-version;
 bh=YFkZ1Vj1HGa41/4htyPUjtYUy9MQ8yX6GJ67fouIDR0=;
 b=Jgn6ihxQv02aUoxZ3cVGVpBzAhLwQSh+sdhkG0ShCu4FppkdrOwIce72CWhfIj1kJr
 kpflV/nW9fGFsNeXlI/zs7tllKwHMJsPyuCEaeg5S5IG5SZNg3o1JydFN/Vyze3fyfrj
 Db/dUUZ4p++PTlRma+Alg7MYU05B0jDGMRtDhtI24vp5flzrYN2zfbX25NrkhKLIUDgh
 rA5udJZTLgDc8/LdncnjzZGYubLa0h7ky/SLTDg/QcYABltNhlRFZGaBtVsCVKyMZS/r
 TtjiKAVAUGwZ/HZl7X4w/bqiTR9XJJxyCRPmXlHvUREw4s7Jkvc+mVIepMMkvHF4CmdN
 lS3w==
X-Gm-Message-State: AOAM5335KhVGG/M8ZImncoCVy6ld6m4ga1MYcEV2tbtes6ZOl0XFNKG7
 9oQfhMC+i9iI44nQE3B4BLXqItCZz/pPfA==
X-Google-Smtp-Source: ABdhPJxI3egqbW5NePITBn6nRQQ+Ek4mFD9m6z21OmiofrPzZXFeiZ9N395F2DbblF3RJbL0+x24+g==
X-Received: by 2002:a17:902:eb44:b029:d1:cbfc:6159 with SMTP id
 i4-20020a170902eb44b02900d1cbfc6159mr13254717pli.37.1600267633783; 
 Wed, 16 Sep 2020 07:47:13 -0700 (PDT)
Received: from juliet ([180.151.134.143])
 by smtp.gmail.com with ESMTPSA id j20sm17204506pfh.146.2020.09.16.07.47.12
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 Sep 2020 07:47:13 -0700 (PDT)
Date: Wed, 16 Sep 2020 20:17:01 +0530
From: manoj kiran <manojkiran.eda@gmail.com>
To: "=?utf-8?Q?ed=40tanous.net?=" <ed@tanous.net>, 
 "=?utf-8?Q?james.feist=40linux.intel.com?=" <james.feist@linux.intel.com>
Message-ID: <C9C88F03-4715-444E-9B1A-3834995458EA@getmailspring.com>
Subject: Using bios-settings-mgr for setting hypervisor network
 attributes
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="5f622565_5e98e729_c45"
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
Cc: "=?utf-8?Q?openbmc=40lists.ozlabs.org?=" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--5f622565_5e98e729_c45
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Ed & James,

Till now IBM was using phosphor-settings infrastructure as back-end and uses Ethernet Schema for Hypervisor computer system(hypervisor_ethernet.hpp) for setting the IP address of hypervisor. And now we are planning to leverage the capabilities of bios-settings-mgr(backend) as well to set the hypervisor attributes.
do you see any concerns here ?
Thanks,
Manoj

--5f622565_5e98e729_c45
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Hi Ed &amp; James,</div><br><div>Till now IBM was using phosphor-set=
tings infrastructure as back-end and uses Ethernet Schema for Hypervisor =
computer system(hypervisor=5Fethernet.hpp) for setting the IP address of =
hypervisor. And now we are planning to leverage the capabilities of bios-=
settings-mgr(backend) as well to set the hypervisor attributes.</div><br>=
<div>do you see any concerns here =3F</div><br><div>Thanks,</div><div>Man=
oj</div><img class=3D=22mailspring-open=22 alt=3D=22Sent from Mailspring=22=
 width=3D=220=22 height=3D=220=22 style=3D=22border:0; width:0; height:0;=
=22 src=3D=22https://link.getmailspring.com/open/C9C88=4603-4715-444E-9B1=
A-3834995458EA=40getmailspring.com=3Fme=3Dcfe0c16b&amp;recipient=3Db3Blbm=
JtY0BsaXN0cy5vemxhYnMub3Jn=22>
--5f622565_5e98e729_c45--

