Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B68B144F
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 20:10:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TmyF4SwPzF3bG
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 04:09:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::343; helo=mail-ot1-x343.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IUC0tILL"; 
 dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TmxY2DYRzF4rd
 for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2019 04:09:18 +1000 (AEST)
Received: by mail-ot1-x343.google.com with SMTP id g19so26930435otg.13
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 11:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=4BXjjNT0FNwyTUJ2zYTJmvfaNspsfmqtZU4GNuYLei4=;
 b=IUC0tILLD8sywCCNK9SgeUy/KqTQeZL0s6ycDPcs5SI3TdRq3kbyPnUNMJscOzNbiq
 hBegB2AEk3r5ukgWiyj1Zv1mHHcabpWbHGy9+70IlT1i1gLYBBCqrJU8SBsPFy1F2QBv
 7Xb0GmOVyJaBQn5Xb7ZQtHZd9gwDV/nrotP0xpgMY7r0RzPs/HxoUDyN1R3JmIWEzb68
 PGN3tXgpbu8ZhGfZfQZIF5RnjYI4RaZ4tP9jKGspymmeua9ENfm1e/ASEKng6CcNw9KP
 r/NN//1er+iw28rkOfw5nkmXtJpXkjvuTJnKVhVXGhr9zMgcRkT2Cx/qEyiuL1WCiPEI
 HRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=4BXjjNT0FNwyTUJ2zYTJmvfaNspsfmqtZU4GNuYLei4=;
 b=EQ+MdYs2lbSVUDhdsBt/pqAfG2OBybwD095w3+gQDGqJ2Nh3HN7OKVtZT01cAxNCcS
 FTW6Zg6P8Kgthw4Fka3Q2QdRSstRrCL4KGYKr9yC038KZm+YLGRj2BK0i/c3fcYqXqv8
 Y+jSkNXFSC9I2oKBR8dnjaBq/QykhistjQRBw6X0TNxw0z2DAjGnPb/8ArnrXWVJfXE3
 8VvDRPTWP1h2mLEfkVPfRzrXi5OF/KFZMxLfzcvOrlD/A3tGc68dBbT2BteeeAOSXtvt
 4ZlNrIwFddjqRInJ7efFcBMZSu5js1CUcB6UAV6RTsJ63YRKN2cNJ397YM0c6I36oI2O
 r+VA==
X-Gm-Message-State: APjAAAVs+zn3Eo/5FoNpFPDNJk2Am3wppZg0MRA/eZQRwXx30NEAyA0N
 2gKFF7Y3tCNkPiRaysTqmVpC8O606y5o5MXiOxV3WkqNErM=
X-Google-Smtp-Source: APXvYqxBYm34eosPsXeKX56e1EBbM3prKSdb+BAjCKV+FrYgEMroZPVYM/1xEhEUVeLFe0bjI9r4wJRzLO++Qfx84wA=
X-Received: by 2002:a9d:7c97:: with SMTP id q23mr15584373otn.296.1568311755568; 
 Thu, 12 Sep 2019 11:09:15 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 12 Sep 2019 13:08:59 -0500
Message-ID: <CALLMt=riLoJPP3c9xo974wLVYceTmOpNzzEYwbhwRvP0yQXqkg@mail.gmail.com>
Subject: running unit test CI framework on a mac
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

A patch series was merged today that allows our CI unit test infrastructure
to be run on a mac computer.
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+/24923

I didn't take the best of notes but I believe this is all I had to do to
get it working:

# install docker
(just internet search install directions)

# Install flock
https://github.com/discoteq/flock
brew tap discoteq/discoteq
brew install flock

# install newer bash and set as default
https://itnext.io/upgrading-bash-on-macos-7138bd1066ba

$ sw_vers
ProductName:    Mac OS X
ProductVersion:    10.14.6
BuildVersion:    18G95
$ ./openbmc-build-scripts/build-unit-test-docker.sh
...
Successfully built 10229cd01923
Successfully tagged openbmc/ubuntu-unit-test:latest
+ cleanup
+ local status=0
+ [[ -n /var/folders/d5/xkfh741n1vbg4khjdtwzw1gw0000gn/T/tmp.CptHYwFh ]]
+ rm -f /var/folders/d5/xkfh741n1vbg4khjdtwzw1gw0000gn/T/tmp.CptHYwFh
+ trap - EXIT ERR
+ exit 0

Let me know if you run into any issues.

Andrew
