Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC09435500
	for <lists+openbmc@lfdr.de>; Wed, 20 Oct 2021 23:09:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZNXw0qggz30Bm
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 08:09:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YiKy2Pd8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22c;
 helo=mail-oi1-x22c.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YiKy2Pd8; dkim-atps=neutral
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZNXV3vbQz2xth
 for <openbmc@lists.ozlabs.org>; Thu, 21 Oct 2021 08:09:29 +1100 (AEDT)
Received: by mail-oi1-x22c.google.com with SMTP id o204so11192524oih.13
 for <openbmc@lists.ozlabs.org>; Wed, 20 Oct 2021 14:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=KgletdrtAln60ftpv3yG6yHiQznI8ilDW31odn+vX58=;
 b=YiKy2Pd86Y6f0fZSyGknVBewrX0V/zmOWjgFem+XVVCprlZpkVIsChFI2pEUGneoE7
 c24TYhcDYGiJy3rJ4MaC6Dhex5DGfW4ABJRZb0EEstGkU0NoC6cBhgmRg4c5jHUjoOZ2
 xfzMfV5CmuCON3fInK0J95ffioUfMfUCyt0hZ+DUvP8XOkePIcVzM+wMexqTCeqP1iDf
 TCyGAJ4Myy32j0L1B4FnRvmKQG0lelCwVRN6073852Zx+6oPO16WsPIbNlz1kAETW3Kl
 kqLCTBXAmOA1ax5utZVjuE30TA7qzTwFdfmX/fRQJZNlqx70BvesmkB+uVLS0eZl74KN
 743w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=KgletdrtAln60ftpv3yG6yHiQznI8ilDW31odn+vX58=;
 b=mdaXAUC1CGBul7jsPuataBi638PysMNboSjUft7v2jED+XdBwUUk8369YyIfeveKfh
 Ns1bZ4f4WPwy7pQwrC+0wMXbnasDe8kbqrfw5PVap+a2r8K/ZCRZdmfYZttS4fYtWsOa
 VnAM9fzyK+CW7yAhzUHSvo/cvaYSgpXOTRy+A3elkm+eqRoyDCGQ3UGfS80LC88riqPW
 7niI+AvsSNkE4HVYcSHV569UbXE7cOBetrcMzSjFM1qFRSXJxTQHrSzJ8BCiAr4RLK/h
 L8p9qeqEo2sQwfGiwWXE8eF4cy+qZ1j6rWAK6t1eo+VlDEF66QNTBB5bbMpbmxgEk7tO
 ncPw==
X-Gm-Message-State: AOAM531J3p5JIRXE5/lvihjzwirqk7uIZ1gHuWHcDwq0vT8XGDj2D/7J
 EWyw4e1lH7VodwBzfrJRyTL9h4xqfJxbLg==
X-Google-Smtp-Source: ABdhPJz/JN1T3H2e1Ptx7hY8frAYn8ZlKjl8WcnAoyUf+E1nsn/Qm2TfXZzinD8GkdciFw3ei5jFVQ==
X-Received: by 2002:aca:bd02:: with SMTP id n2mr1483069oif.113.1634764164353; 
 Wed, 20 Oct 2021 14:09:24 -0700 (PDT)
Received: from smtpclient.apple ([2600:1700:19e0:3310:bcb9:e198:43f7:6f9c])
 by smtp.gmail.com with ESMTPSA id s206sm664394oia.33.2021.10.20.14.09.23
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 Oct 2021 14:09:23 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Automated Power-On Recovery
Message-Id: <1989B6F0-2E74-463D-B087-3E78C5E0045B@gmail.com>
Date: Wed, 20 Oct 2021 16:09:23 -0500
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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

Greetings,

I=E2=80=99ve got a series of doc commits starting at =
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/47774/ which =
document our existing power recovery design and then add some additional =
features that IBM is looking for (disabling automatic recovery in =
certain user initiated situations and handling brownouts). Hopefully =
features that others would find useful as well.

Reviews up in gerrit appreciated.

Andrew=
