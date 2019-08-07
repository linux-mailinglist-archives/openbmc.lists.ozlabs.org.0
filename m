Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 835028500A
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2019 17:37:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463bGz3G6YzDqw1
	for <lists+openbmc@lfdr.de>; Thu,  8 Aug 2019 01:37:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZhsscjUU"; 
 dkim-atps=neutral
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463bC85NcszDqWL
 for <openbmc@lists.ozlabs.org>; Thu,  8 Aug 2019 01:34:11 +1000 (AEST)
Received: by mail-ot1-x32c.google.com with SMTP id d17so106058093oth.5
 for <openbmc@lists.ozlabs.org>; Wed, 07 Aug 2019 08:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=KSOMSNG1e7hg/gtzIjbH1ItoYZy+dnr3vd6Y9oEOzmU=;
 b=ZhsscjUUcaRyTeVrRRx0lV5KgAG73RmdBLx/k4n9+jIj/zU4hZ1BhC0rKP1ElKyBWJ
 S8VmtoT0dDiv93tMDKMs+cscVZ09yCBUvtcGdYeZolLhJhhDIWWot7iLZlgFEUxiXL2Y
 jjl2ZeEaP45TRttXskxysk6DeMT649rH0byu4/qCdYgkaOKnMxIsY/Ocxf/W5SvpyL8Q
 V83YrdqCIyJ4Md+zwHhOUT2z16dJFk/kbiYRiSOokiocWQ3NgJZgt5lksKL1iEQjKQKP
 Y5RKm4MIsBMK8PYYdzS8PqwYQzzYI0h25aVlPJkNwplAhp38yHEnVuPntpu+V4X8/TdB
 IjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=KSOMSNG1e7hg/gtzIjbH1ItoYZy+dnr3vd6Y9oEOzmU=;
 b=P2zrH+86DBZsiCYmyD38O+G8fIVozyhOkC+JJXhOBtqu17K3Ywacqp1HyB1lZeDKFL
 HsaNbQiaLIDLKdDdCCSUthaUPGDMYV9Pi7KUf9Ng+NZNdsxxsifS5g4AdGa52YMdz7GQ
 oufWp7FKiFM6AyuWiAyS11jNF8umrNYTZYmCM1DbCiJM+YTaVdCH57LN5ENNGn/eA/Ys
 eCC9RCiH2NwJEim0WP1g5dlw1ybVqXNa4DH6ZfNJ6mYxGRMKtRj2UYo+xC3j4s6o3nOm
 4vrIwQsigozPpdmO+mZHdx4+L+RMyOvcc8YxPh5852X4pMUpohZel8bUnsPJ7YZjje3g
 H3rA==
X-Gm-Message-State: APjAAAU6h0vyOt6KSyq27Bn/1yM6WKagS9NtGi3VOTbrKbuPpwAlAQoE
 qe0pY9K3CVc+OTp8qPlZZgNek3PY0/DC/k+3SNSWkKEd
X-Google-Smtp-Source: APXvYqwyhTwhXmzNEEaoqrevDdQ9PhrJPu0HGUEa+Fvjk6TsYeEaGAkrnLDpXVc1CvBvytnWovBCB/x7Fnwoi0Iniik=
X-Received: by 2002:aca:f552:: with SMTP id t79mr312045oih.145.1565192047938; 
 Wed, 07 Aug 2019 08:34:07 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 7 Aug 2019 10:33:51 -0500
Message-ID: <CALLMt=pfdHs9nYixrtkds5OEh+vNJ=gUw9MObU6ezt+grZ48aw@mail.gmail.com>
Subject: Infrastructure Workgroup - Cancelled Permanently
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

I've been cancelling most of them all recently anyway. I think the group has
done as much as it's going to for now so I'm going to close down the
infrastructure workgroup meeting.

I'll continue to update this mailing list and IRC as I do upgrades and such and
am always looking for feedback on how to make things better (but if it's a lot
of work them I'm also looking for help :).

The community work behind our CI tools has been great, please keep it up!

Andrew
