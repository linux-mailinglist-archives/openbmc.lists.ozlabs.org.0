Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC8F559F3
	for <lists+openbmc@lfdr.de>; Tue, 25 Jun 2019 23:31:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YK8l1LbKzDqLv
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 07:31:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="KRgucCFS"; 
 dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YK4T4rxTzDqXv
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2019 07:27:20 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id c14so153941plo.0
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jun 2019 14:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=em5oKfadxbx9qDJWNQ5NEWv/6ear8Q0MI+2R+xG+zTY=;
 b=KRgucCFSgrdEs3vSFLBPAwl1lmXeD5Tmg+tGkGyJqB1f4wZXN8FqiKtt0QhyrUFemq
 21lKOjtXdLULQzofEgKCmP6Kl159+3BUhtd6pDj2bTQbPqAPs0vv0gMzG06kAgXbE7wj
 EDXJGViokhhk/9IfRAiJjYG3c301UTh+3e4X9coPHXp++Bbv3QJN40LXNKA9V0ZYk1z5
 tgTdo6Av/yz1l/fy7oSKhL0YMm0fdC0+hH32DgIPJPpIWdvSeb/qug3ChnlD023lymKL
 VWBmr7lFT5Aid1m8ugzlIze3KmM0PVrkTCujqHB2z0AajdUN+gi9O0vYcWbSWnEBV5aD
 gcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=em5oKfadxbx9qDJWNQ5NEWv/6ear8Q0MI+2R+xG+zTY=;
 b=EqKalfctDmot0xUgWdeP8x9vs2iLAYGPf8A5QwnVEPytIbfbcUXvnFrw5urUmvucyl
 ZIGxJsvYMTOqorJmWFQQrwxkyJkarVFkgBCXDa5en3hEyBIiE51TKsFaspLl/AbwtanK
 cDvUnLnRhV/wHrpyWGgr1GGwf9rCrGB1h3HGwXi4aXTq/dTxdMAQllOmfprKDN2XJBUH
 R1Ajwua3RcOSHnfqm+0bhnz/DDkmcQazBMlMTIqoz6+JK8xTDbJZTZG9gR1ZRxsEPYi5
 0ZiSNj0W14ypiilmX88ocyzQHFJBBQdErijWmtRs+ehW1lWpjFadKhadjSCpSPvmZdnV
 nMTA==
X-Gm-Message-State: APjAAAULFdc94E7CeGQAec9dIrvJpRMAMv3ru8kcLR272nW2ds8F2RLd
 DMraEMyuD5rT37lGtmeFOWMMnP9Qi029uAalWF0JIe92JdkSkA==
X-Google-Smtp-Source: APXvYqxaYXFN2ZY+om/vmhNQhpV2bJ6xzf7nxEC2F5z8n7JdVGZIlEZuVFZ828hNMnGVUfs15M7HmSHSJ+Ty1RgyuhE=
X-Received: by 2002:a17:902:9307:: with SMTP id
 bc7mr827184plb.183.1561498036400; 
 Tue, 25 Jun 2019 14:27:16 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 25 Jun 2019 14:27:04 -0700
Message-ID: <CAO=notw45YdmNiNuptWfnLUZPfyq+G16oG_u5Yj4ETizg_0yCw@mail.gmail.com>
Subject: Transitioning away from negative-errno-on-fail
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brandon Kim <brandonkim@google.com>, 
 Matt Spinler <mspinler@linux.vnet.ibm.com>,
 Matthew Barth <msbarth@linux.ibm.com>
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

Hi,

Many platforms leverage --enable-negative-errno-on-fail in
phosphor-hwmon, such that the sensor values, when unavailable are set
to -errno.  And it's up to other logic to detect that a sensor has
gone below some expected range.  This was fine with sensors that
didn't go negative, and for the most part was fine in general.

However, phosphor-hwmon is introducing a new option:
--enable-update-functional-on-fail

Each sensor reported by phosphor-hwmon will implement the Functional
decorator defined:
xyz/openbmc_project/State/Decorator/OperationalStatus.interface.yaml

There is a boolean property: Functional  when true (the default) the
value reported is valid and teh sensor is happy.  If the sensor has a
fault file, then if this reports a fault, the value will go to false.
If you enable update-functional-on-fail, then this property will also
go to false if the daemon was unable to read the sensor from sysfs.

Brandon is working on integration with phosphor-host-ipmid, such that
it'll be available there.  In this case, we'd like to deprecate
negative-errno-on-fail as an option from phosphor-hwmon.

Timeline:
    I've seen a lot of platforms coming in with that setting enabled
(including quanta-q71l).  I'd like to transition these platforms onto
update-functional-on-fail as a configuration over the next few weeks
and in the next few months, deprecate negative-errno-on-fail.  I'll
add a deprecation warning to the configuration and then eventually
it'll be dropped from support.

I'm going to attempt to reach out to each platform using this feature
once all the pieces are in place upstream and work with them on
transitioning away from it.

Patrick
