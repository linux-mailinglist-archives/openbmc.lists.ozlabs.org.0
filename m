Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1287F1F9EF6
	for <lists+openbmc@lfdr.de>; Mon, 15 Jun 2020 20:01:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lzfQ47kmzDqPc
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 04:01:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e32;
 helo=mail-vs1-xe32.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IQIfe31Y; dkim-atps=neutral
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lzbv565nzDqDb
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jun 2020 03:59:07 +1000 (AEST)
Received: by mail-vs1-xe32.google.com with SMTP id m25so9885939vsp.8
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jun 2020 10:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=h7Q5mdu0sqJ6P34G8qDhdK0ju4lJPtOqYq1nD2J45II=;
 b=IQIfe31Yu0egWPlNhHY7GCHUnfSXs2Q5wdCr2Ruz7IHFdPlzY4T0M9KZCteTxcSMhC
 mZGuNlV4hMOm/n2gVO1hMFzaZcG8KC33wODyC3SVZ6n0r/15ip4CAuj58IF5z/J8fdqQ
 JdRtMBcnQ+KxGWVMZibVyEMe2r1zwZ5E8YU3C0BXPJz/7+hyzAKSiS+X7O+sDve3irrd
 DgTpXnOvlEX1sr0abH7Zi/rp5nmVTko4HVwbF7Yi2cqcY3IfEPnM6G+vAXwPDw2IhpI6
 0haGZhxXCOI7NoRs5FGD7n8qKokre89s2+wgIQk/iRFHonXuBufcdiOr6xA4xVvB8ua3
 YD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=h7Q5mdu0sqJ6P34G8qDhdK0ju4lJPtOqYq1nD2J45II=;
 b=MYMu0R+sd33kwCWlQSIKAXb6mQik/WPGfAiqlpzJrlSxf+9SS3H9bU+GUy+LPWyaap
 z0LgxWBfDnCefflK+3alDar5BI8AlVSs4dHaORVXJ6jGWVZhZL9/SwpDZp41Sn5TTh4l
 jb7j+sfKxKI35nJvlUN0wU/HNY2bQtHmVE8gU8NyyDokWqXTEGgntVa2L0e5veVW9f5P
 v5Bm+P7x/gKOaahydYEKsfRIvCHHkgnpVKPAWea0M1MRvyJzb0xSUM7Eg7g1cKb+GN/+
 dayGyN5J4Uy4oIcrcILAWCwAZljCEvLdswkJr2fluKAGfZTyxw0ybBOBv0DvCMUYCvkW
 05Kg==
X-Gm-Message-State: AOAM532O3dt0ca9ZQOTaM6Bwxfen1hx2eXg0zJf4uzx+WlGtclFen9ND
 JsTmsxJsJ7Qbd3HMVxFN74d/sc7OtccM/MxHg0g3Pc7g
X-Google-Smtp-Source: ABdhPJwq6c5K0njIaiPsgWq2vZXoAWatectMpsfZ3QIEpXFeDecu23hkpyL42WeJk4uLtuj7036AQVS7QjyhpU1bkz4=
X-Received: by 2002:a67:f60c:: with SMTP id k12mr20190446vso.139.1592243941495; 
 Mon, 15 Jun 2020 10:59:01 -0700 (PDT)
MIME-Version: 1.0
From: Kurt Taylor <kurt.r.taylor@gmail.com>
Date: Mon, 15 Jun 2020 12:58:50 -0500
Message-ID: <CAG5Oiwi4rXDd1M+YxdiXkx=mAxgt5pZOeEC3DZaRq1_cDB-qsQ@mail.gmail.com>
Subject: Release 2.8 Continued
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

Hello everyone,

SUMMARY
Release 2.8 is still pending. We need to either get these problems
fixed ASAP, or release and document the problems/limitations,
backporting as needed. I feel like too much time has passed and we
just need to release and move on. We'll do better next time. Opinions?

DETAILS
From what I've been able to glean, there are still just 4 know blockers.
1) DHCP - https://github.com/openbmc/bmcweb/issues/127
Fixed with this?  https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/30581

2) LDAP - https://lists.ozlabs.org/pipermail/openbmc/2020-May/021702.html
Is there a github issue created for this? If not can someone please
create one and update the status?
Related? https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/32883
Reverted? https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/33468

3) VLAN via REST - https://github.com/openbmc/openbmc/issues/3668
Status? https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-networkd/+/32879

4) VLAN via IPMI - https://github.com/openbmc/phosphor-net-ipmid/issues/12
Related? https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-networkd/+/32879

Any others? Anyone else testing the release?

Kurt Taylor (krtaylor)
