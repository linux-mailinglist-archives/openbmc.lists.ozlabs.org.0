Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6855A116A20
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2019 10:50:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WdjK46hQzDqQD
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2019 20:50:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d33;
 helo=mail-io1-xd33.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="c+kZDppN"; 
 dkim-atps=neutral
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Wdhc5hcfzDqQ4
 for <openbmc@lists.ozlabs.org>; Mon,  9 Dec 2019 20:49:52 +1100 (AEDT)
Received: by mail-io1-xd33.google.com with SMTP id l17so14088784ioj.3
 for <openbmc@lists.ozlabs.org>; Mon, 09 Dec 2019 01:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=9LlrqtKSLoFImyyTWUD4Igz+evxGMcdxhhor8MM+R7U=;
 b=c+kZDppN9ExRT1bOLryvaJkgr2y1kgC8YAlN4CQbcjR2nEFaU4CXVoSL+opq51RcEn
 AWEqFcOcefAkRMcYvK9WnnDIxoiWRDAnw3a+EZmLL5RJ5TTF1+5vQ7RfvCA4KuGgI3oV
 N4qV25LE2stLDIA8Ml3oV5p+3gtQ8YU436hTbg6ST/zCmwTPrg+q5ZrHc6i1joXEPoio
 gc552qFTFeulrDaycsW4AQbEXWtmhvhjkLHrqqHmMt38QkpFjgazxFhuuscr1Xt9F4xu
 6bgunym5d9uaf397I5Ee9kjUQxou0JHpvd9mrMB7tT7cSY3hrpvSAD/IDl3OH/X6qA5A
 kJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=9LlrqtKSLoFImyyTWUD4Igz+evxGMcdxhhor8MM+R7U=;
 b=PRyHQzX5g4sefQMTGoFrI+5Xb4/CDm5qO1yc6+6/HWYx19Fzn0BYdrjMUXRuOGe6Y6
 M+Up+hqrRTaewLX7jgSapfAu7Rjn1Blebyju2+l3YFblQmf2jtSpJdHPZi0dnB2wC7X6
 3Q3KzlQTdCATG44ppVnbM6z/G3/ak591xI8O2xItI/EQj8GrIjarsXmanGcFSoknjdsp
 0DYzVOJL6V9tW5niuwq7w/CMpeNJcUPyygWwerwGBXWRexSHbB4bZup2Rs6onu1Kc0eI
 MbdPuNxbJte7o9i2X1vxTGsCef9KA6MQiS7/TOBzRY092Ltp/Rutp2sSDD6mIFrW31VE
 nXCg==
X-Gm-Message-State: APjAAAUgDw/cc0dZdzRO4aV9ZYOTL9ivOfEk3/5Hn35HMIDfvLZ3EANE
 TzYZSUQAMOQewI7O5rUNCWB1XBJo5F40NNTfK2zumJunYPs0xA==
X-Google-Smtp-Source: APXvYqxMUXOHnooNyfNBifEQsqfLH8eV9fLS4hK1n/6e+lavBWEPtGOoiKzVXClUBgTiNS8vG+9YyS39/qteM7nQIGQ=
X-Received: by 2002:a5d:8c89:: with SMTP id g9mr19824500ion.221.1575884986898; 
 Mon, 09 Dec 2019 01:49:46 -0800 (PST)
MIME-Version: 1.0
From: Lei YU <mine260309@gmail.com>
Date: Mon, 9 Dec 2019 17:49:35 +0800
Message-ID: <CAARXrtmNP3upYusBU6quTcfkU_Po3QvcM-SD=D7v0JKJGWzUXA@mail.gmail.com>
Subject: To add a new interface for timed power on feature
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

This email is to introduce a new interface to be added to
phosphor-dbus-interfaces, and ask for feedback where it should be
placed into.

There is a feature Timed-Power-On (TPO), that host could schedule a
timer to BMC to power on the host.
For BMC there will be a service to handle the above case, and the plan
is to add a new interface to represent the timer (actually a date) for
TPO.

It could look like:
 /org/open_power/TimedPowerOn/Epoch.interface.yaml
Where it defines the epoch time when the host is going to be powered on.

The question is, is this feature common for other systems?
If yes, I would like to put it in `/xyz/openbmc_project`, instead of
`/org/open_power`

Thanks!
